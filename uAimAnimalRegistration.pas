{
   16/12/2015 [V5.5 R1.9] /SP Change - Now trimming string fields before they are exported to xml. A bug in calving screen
                                       caused leading spaces to be included in the AnimalNo value.

   22/02/17 [V5.6 R5.5] /MK Change - GoToAimAnimalRegistration - Create element at start of the document with pedigree prefix - SP request.

   23/11/21 [V6.0 R2.9] /MK Change - BuildRegistrationData - Remove animals that are in the AIMAnimalReg table as registered - Joy Hayden issue.
}

unit uAimAnimalRegistration;

interface
uses
   Classes, Forms, Windows, Controls, Dialogs, SysUtils, db, dbTables;

type
   TDamRegInfo = class
   private
     FBreedCode: string;
     FNatIdNo: string;
   public
     constructor create;
     property NatIdNo : string read FNatIdNo write FNatIdNo;
     property BreedCode : string read FBreedCode write FBreedCode;
   end;

   TAimAnimalRegistration = class
   private
      FHandle : HWND;
      FHerdId : Integer;
      FTempTable : TTable;
      FTempQuery : TQuery;
      procedure CreateDbTables;
      procedure BuildRegistrationData();
      procedure ValidateRegistrationData();
      function EnforceOfficalBreedCode(ABreedCode : string) : string;
      function GetDamRegInfo(const ADamId: Integer): TDamRegInfo;
   public
      constructor create(const AHandle : HWND; const AHerdId : Integer);
      destructor destroy;override;
      procedure GoToAimAnimalRegistration();
      procedure GoToAimAnimalRegistrationEnquiry();
      procedure UpdateAnimalRegistrationStatus(const AAnimalId : Integer;
       const AStatus : Integer; AAimLastActionDate : TDateTime);
      procedure ProcessDisassociatedAimAnimalRegistrationTransactions();
   end;

   function GetAnimalIdByNatIdNo(ANatIdNo: string): Integer;

implementation
uses
   GenTypesConst, DairyData, uHerdLookup, ChkDebug,
   MSXML2_TLB, ComObj, kRoutines,
   uAIMClient, FileCtrl, uApplicationLog;

{ TAimAnimalRegistration }

function GetAnimalIdByNatIdNo(
  ANatIdNo: string): Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Id FROM Animals');
         SQL.Add('WHERE NatIdNum =:ANatIdNo');
         SQL.Add('ORDER BY Id DESC'); // to get the most recent instance of animal sort by Id.
         Params[0].AsString := ANatIdNo;
         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;


procedure TAimAnimalRegistration.CreateDbTables;
begin
   FTempTable := TTable.Create(nil);
   with FTempTable do
      begin
         DatabaseName := AliasName;
         TableType := ttParadox;
         TableName := 'tmpAimAnimalReg';

         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID',ftAutoInc,0,FALSE);
               Add('EventID',ftInteger,0,FALSE);
               Add('HerdID',ftInteger,0,FALSE);
               Add('AnimalID',ftInteger,0,FALSE);

               Add('AnimalNo',ftString,10,FALSE);
               Add('NatIDNum',ftString,20,FALSE);

               Add('ColourCode',ftString,6,FALSE);
               Add('CBreed',ftString,30,FALSE);
               Add('CBreedCode',ftString,6,FALSE);
               Add('Sex',ftString,10,FALSE);
               Add('DateOfBirth',ftDate,0,FALSE);
               Add('CalfName',ftString,30,FALSE);
               Add('SortNatID',ftString,20,FALSE);


               Add('DamNatID',ftString,20,FALSE);
               Add('DBreedCode',ftString,6,FALSE);
               Add('SCode',ftString,10,FALSE);
               Add('SireNatIdNo',ftString,30,FALSE);
               Add('SBreedCode',ftString,6,FALSE);
               Add('SireInHerd',ftBoolean,0,FALSE); // added for calf form

               Add('ComplianceCert',ftBoolean,0,FALSE); // added for calf form
               Add('CalfDead',ftBoolean,0,FALSE);

               // CalfMortality possible lookup values
               // 1 = Abortion
               // 2 = Dead at birth
               Add('CalfMortality',ftString,60,FALSE);

               // ICBFCalvingSurvey possible values
               // 1 = Normal Calving
               // 2 = Some assistance
               // 3 = Considerable difficulty
               // 4 = Veterinary assistance
               Add('CalvingSurvey',ftString,60,FALSE);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('','ID',[ixPrimary,ixUnique]);
            end;

         CreateTable;
         Open;
      end;

   FTempQuery := TQuery.Create(nil);
   FTempQuery.DatabaseName := AliasName;
end;

procedure TAimAnimalRegistration.BuildRegistrationData;
var
   ErrorString : string;
   i : Integer;
begin
   Screen.Cursor := crHourGlass;
   CreateDbTables();
   try
      with FTempQuery do
         begin
            {
            SQL.Clear;
            SQL.Add('Select Count(E.ID) CountEID');
            SQL.Add('From Events E');
            SQL.Add('Where NOT(E.ID IN (Select C.EventID From Calvings C))');
            SQL.Add('AND (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.Add('AND (E.EventDate > ' + '''' + FormatDateTime('mm/dd/yyyy', IncMonth(Date, -3)) + '''' + ')');
            SQL.Add('AND (E.EventType = '+IntToStr(CCalvingEvent)+')');

            Open;
            }

            // SP 25/04/01 Relink Dams/Calves Missing Calving Records from Calvings.db
            // 09/02/13 [V5.1 R4.1] /MK Additional Feature - Check to see if RelinkCalvesToDams needs to run.
            WinData.CheckForRelinkCalvesToDams(cCheckCalvesForOneMonth);

            SQL.Clear;
            SQL.Add('DELETE FROM '+FTempTable.TableName);
            ExecSQL;

            Close;
            for i := 1 to 4 do
               begin
                  // SP 18/11/11  -  SQL Updated for AIM Services
                  SQL.Clear;
                  SQL.Add('INSERT INTO '+FTempTable.TableName+' ( EventID, AnimalID, ComplianceCert, CalfDead, CalvingSurvey, CalfMortality )');
                  case i of
                     1 : SQL.Add('SELECT EventID, ID1, ID1ComplianceCert, CalfDead1, G1.Description, G2.Description');
                     2 : SQL.Add('SELECT EventID, ID2, ID2ComplianceCert, CalfDead2, G1.Description, G2.Description');
                     3 : SQL.Add('SELECT EventID, ID3, ID3ComplianceCert, CalfDead3, G1.Description, G2.Description');
                     4 : SQL.Add('SELECT EventID, ID4, ID4ComplianceCert, CalfDead4, G1.Description, G2.Description');
                  end;
                  SQL.Add('FROM "Calvings.DB" C');
                  SQL.Add('LEFT JOIN GenLook G1 ON (G1.Id=C.BirthType)');
                  case i of
                     1 : begin
                            SQL.Add('LEFT JOIN GenLook G2 ON (G2.Id=C.CalfMortality1)');
                            SQL.Add('WHERE(ID1Notified=FALSE)');
                            SQL.Add('AND(ID1>0)');
                         end;
                     2 : begin
                            SQL.Add('LEFT JOIN GenLook G2 ON (G2.Id=C.CalfMortality2)');
                            SQL.Add('WHERE(ID2Notified=FALSE)');
                            SQL.Add('AND(ID2>0)');
                         end;
                     3 : begin
                            SQL.Add('LEFT JOIN GenLook G2 ON (G2.Id=C.CalfMortality3)');
                            SQL.Add('WHERE(ID3Notified=FALSE)');
                            SQL.Add('AND(ID3>0)');
                         end;
                     4 : begin
                            SQL.Add('LEFT JOIN GenLook G2 ON (G2.Id=C.CalfMortality4)');
                            SQL.Add('WHERE(ID4Notified=FALSE)');
                            SQL.Add('AND(ID4>0)');
                         end;
                  end;
                  ExecSQL;
               end;

            SQL.Clear;
            SQL.Add('DELETE FROM '+FTempTable.TableName);
            SQL.Add('WHERE AnimalID NOT IN (SELECT ID FROM Animals)');
            ExecSQL;

            SQL.Clear;
            SQL.Add('DELETE FROM '+FTempTable.TableName);
            SQL.Add('WHERE AnimalId IN (SELECT Id FROM Animals WHERE AimRegStatus IN (3,4))');
            ExecSQL;

            //   23/11/21 [V6.0 R2.9] /MK Change - Remove animals that are in the AIMAnimalReg table as registered - Joy Hayden issue.
            SQL.Clear;
            SQL.Add('DELETE FROM '+FTempTable.TableName);
            SQL.Add('WHERE AnimalId IN (SELECT AnimalId FROM AIMAnimalReg WHERE Status IN (3,4))');
            ExecSQL;

            SQL.Clear;
            SQL.Add('SELECT ID, AnimalNo, NatIDNum, Colour, PrimaryBreed, Sex, DateOfBirth, DamID, SireID, HerdID, Name');
            SQL.Add('FROM Animals A, '+FTempTable.TableName+' T');
            SQL.Add('WHERE (T.AnimalID=A.ID)');
            Open;
            First;
            while NOT EOF do
               begin
                  if not FTempTable.Locate('AnimalID',FieldByName('ID').Value,[] ) then
                     begin
                        Next;
                        Continue;
                     end;

                  FTempTable.Edit;
                  FTempTable.FieldByName('NatIdNum').AsString := FieldByName('NatIDNum').AsString;
                  FTempTable.FieldByName('HerdID').AsInteger := FieldByName('HerdID').AsInteger;

{                  // Now try locate the calf's colour and colour code
                  if WinData.GenLookUp.Locate('ID',FieldByName('Colour').Value,[] ) then
                     begin
                        FTempTable.FieldByName('Colour').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                        FTempTable.FieldByName('ColourCode').AsString := WinData.GenLookUp.FieldByName('LookUpCode').AsString;
                     end;
}
                  // Now try locate the calf's breed and breed code
                  if WinData.Breeds.Locate('ID',FieldByName('PrimaryBreed').Value,[] ) then
                     begin
                        FTempTable.FieldByName('CBreed').AsString := WinData.Breeds.FieldByName('Name').AsString;
                        FTempTable.FieldByName('CBreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString;
                     end;
                  FTempTable.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                  FTempTable.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                  FTempTable.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;

                  // Get the DAM Info.
                  if WinData.LookUpDamSire.Locate('ID',FieldByName('DamID').AsInteger, [] ) then
                     begin
                        FTempTable.FieldByName('DamNatId').AsString := WinData.LookUpDamSire.FieldByName('NatIdNum').AsString;
                        if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').Value,[] ) then
                           FTempTable.FieldByName('DBreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString;
                     end;

                  // Sire Info
                  if WinData.LookUpDamSire.Locate('ID',FieldByName('SireID').AsInteger, [] ) then
                     begin
                        FTempTable.FieldByName('SCode').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                        if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger,[] ) then
                           FTempTable.FieldByName('SBreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString;

                        // If there's no breed/code found for the sire, take the breed code from the calf.
                        if FTempTable.FieldByName('SBreedCode').IsNull then
                           FTempTable.FieldByName('SBreedCode').AsString := FTempTable.FieldByName('CBreedCode').AsString;

                        // SP 18/11/11  -  SQL Updated for AIM Services
                        FTempTable.FieldByName('SireNatIdNo').AsString := WinData.LookUpDamSire.FieldByName('NatIdNum').AsString;
                     end;


                  if ( FTempTable.FieldByName('CalfDead').AsBoolean ) then // SP REL V4.0 R0.7 13/1/10
                     begin
                        if ( WinData.EventDataHelper.GetAnimalDeathEventDate(FTempTable.FieldByName('AnimalID').AsInteger) <= 0 ) then
                           FTempTable.FieldByName('CalfDead').AsBoolean := False;
                     end
                  else if ( FTempTable.FieldByName('CalfDead').IsNull ) then
                     FTempTable.FieldByName('CalfDead').AsBoolean := False;

                  // SP 18/11/11  -  SQL Updated for AIM Services
                  FTempTable.FieldByName('CalfName').AsString := FieldByName('Name').AsString;
                  FTempTable.Post;

                  Next;        // go to next animal
               end;

            SQL.Clear;
            SQL.Add('DELETE FROM '+FTempTable.TableName);
            SQL.Add('WHERE HerdID <> :AHerdId');
            Params[0].AsInteger := FHerdId;
            ExecSQL;

            FTempTable.Refresh;
         end;
   except
      on e : exception do
         begin
            ErrorString := 'A problem occurred while generating registration data.';
            if (IsWinherdDebugging) then
               ErrorString := ErrorString + cCRLFx2 + e.message;

            raise Exception.Create(ErrorString);
         end;
   end;
end;

function TAimAnimalRegistration.EnforceOfficalBreedCode(
  ABreedCode: string): string;
begin
   // SP 26/02/2004
   // For purposes of Bandon Reg, "HO" Holstein becomes "FR" Holstein Friesian
   // If Tempstr = "HO", replace with "FR"
   // If Tempstr = "HOX", replace with "FRX"
   Result := ABreedCode;
   if (ABreedCode = 'HO') then
      Result := 'FR'
   else if (ABreedCode = 'HOX') then
      Result := 'FRX';
   // SP 26/02/2004
end;

constructor TAimAnimalRegistration.create(const AHandle : HWND;
   const AHerdId : Integer);
begin
   FHandle := AHandle;
   FHerdId := AHerdId;
end;

destructor TAimAnimalRegistration.destroy;
begin
   if (FTempTable <> nil) then
      begin
         FTempTable.Active := false;
         FTempTable.DeleteTable;
         FreeAndNil(FTempTable);
      end;

   if (FTempQuery <> nil) then
      begin
         FTempQuery.Active := False;
         FreeAndNil(FTempQuery);
      end;
   inherited;
end;

function TAimAnimalRegistration.GetDamRegInfo(
  const ADamId: Integer): TDamRegInfo;
begin
   Result := TDamRegInfo.Create;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('SELECT A.NatIdNum, B.Code');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Breeds B ON (A.PrimaryBreed=B.Id)');
         SQL.Add('WHERE (A.ID =:DamId)');
         SQL.Add('AND (UPPER(A.Sex) = "FEMALE")');
         Params[0].AsInteger := ADamId;
         Open;
         try
            First;
            Result.NatIdNo := UpperCase(Trim(Fields[0].AsString));
            Result.BreedCode := EnforceOfficalBreedCode(UpperCase(Trim(Fields[1].AsString)));
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TAimAnimalRegistration.GoToAimAnimalRegistration;
var
   HerdNumber : string;
   AnimalRegistrationFilename : string;
   PedigreePrefix : string;

   AimStorePath : string;

   DamRegInfo : TDamRegInfo;
   TempStr : string;

   Params : string;

   document : IXMLDOMDocument;
   rootNode, animalRegistration, animalRegistrations, childNode,
   damNode, sireNode, genDamNode, icbfNode : IXMLDOMNode;
   TempTable : TTable;
begin
   document := nil;
   rootNode := nil;
   animalRegistration := nil;
   animalRegistrations := nil;
   childNode := nil;
   damNode := nil;
   sireNode := nil;
   genDamNode := nil;
   icbfNode := nil;

   if (not IsWinherdDebugging) and (not AIMClient.ClientExists) then Exit;

   Screen.Cursor := crHourGlass;
   try
      HerdNumber := HerdLookup.HerdNumberByHerdId(FHerdId);
      if (HerdNumber = '') then
         begin
            MessageDlg('Herd Number was not found in database',mtError,[mbOk],0);
            Screen.Cursor := crDefault;
            Exit;
         end;
   except
      raise Exception.Create('Invalid value for args HerdId');
   end;

   try
      PedigreePrefix := HerdLookup.PedigreePrefixByHerdId(FHerdId);
   except
   end;

   try
      Document := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   except
      raise Exception.Create('Error creating MSXML2.DOMDocument. Please contact Kingswood.');
   end;

   BuildRegistrationData();

   try
      // Output each calving record to xml element for further processing by AimClient.exe
      with FTempQuery do
         try
            SQL.Clear;
            SQL.Add('SELECT T.AnimalID, T.AnimalNo, T.NatIDNum, T.SortNatId, T.Sex,');
            SQL.Add('       T.DateOfBirth, T.CBreedCode, T.DamNatID, DamID, T.SCode, T.SBreedCode, SireNatIdNo, ');
            SQL.Add('       A.DonorDamID, T.ComplianceCert, T.CalfDead, CalfName, CalfMortality, CalvingSurvey  ');
            SQL.Add('FROM '+FTempTable.TableName+' T, Animals A');
            SQL.Add('WHERE ( T.AnimalID = A.ID )');
            SQL.Add('ORDER BY T.SortNatId');

            Open;

            First;
            if (RecordCount <= 0) then
               begin
                  MessageDlg('There are no calves to register at this time.',mtInformation,[mbOk],0);
                  Exit;
               end;

           document.appendChild(Document.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'));

           rootNode := document.createElement('registrationDetails'); // Create Root Node
           document.appendChild(RootNode);

           childNode := document.createElement('pedigreePrefix');
           childNode.Text := Trim(PedigreePrefix);
           rootNode.appendChild(childNode);

           animalRegistrations := document.createElement('animalRegistrations');
           rootNode.appendChild(animalRegistrations);

           while not eof do
               begin
                  // begin registration animal
                  animalRegistration := document.createElement('animalRegistration');

                  if (FTempQuery.FieldByName('AnimalId').AsInteger<=0) then
                     raise Exception.Create('The selected calf cannot be found');

                  // Output animal's internal Id
                  childNode := document.createElement('animalId');
                  childNode.text := IntToStr(FTempQuery.FieldByName('AnimalId').AsInteger);
                  animalRegistration.appendChild(childNode);

                  //Calf Animal No - Only used for informational purpose's is not sent as part of registration
                  childNode := document.createElement('animalNo');
                  childNode.text := Trim(FTempQuery.FieldByName('AnimalNo').AsString);
                  animalRegistration.appendChild(childNode);

                  //Calf National ID Num - 14 Chars
                  childNode := document.createElement('natIdNo');
                  childNode.text := Trim(FTempQuery.FieldByName('NatIDNum').AsString);
                  animalRegistration.appendChild(childNode);

                  // Output animal's date of birth
                  childNode := document.createElement('dob');
                  childNode.text := FormatDate(FTempQuery.FieldByName('DateOfBirth').AsDateTime, dsIrish);
                  animalRegistration.appendChild(childNode);

                  //Calf Sex
                  childNode := document.createElement('sex');
                  childNode.Text := Trim(FTempQuery.FieldByName('Sex').AsString);
                  animalRegistration.appendChild(childNode);

                  //Calf Breed Code - Only used for informational purposes this is not sent as part of registration
                  childNode := document.createElement('breed');
                  childNode.text := StripPunctuation(UpperCase(FTempQuery.FieldByName('CBreedCode').AsString));
                  animalRegistration.appendChild(childNode);

                  // Dead calf indicator
                  childNode := document.createElement('deadCalf');
                  if FTempQuery.FieldByName('CalfDead').AsBoolean then
                     childNode.text := 'Y'
                  else
                     childNode.text := 'N';
                  animalRegistration.appendChild(childNode);

                  // Output the dam information
                  if (FTempQuery.FieldByName('DamID').AsInteger <= 0) then
                     raise Exception.CreateFmt('The Dam information is missing for calf "%s"',[FTempQuery.FieldByName('NatIDNum').AsString]);

                  damNode := document.createElement('dam');
                  DamRegInfo := GetDamRegInfo(FTempQuery.FieldByName('DamID').AsInteger);
                  try
                     childNode := document.createElement('natIdNo');
                     childNode.text := Trim(DamRegInfo.NatIdNo);
                     damNode.appendChild(childNode);

                     childNode := document.createElement('breed');
                     childNode.text := Trim(DamRegInfo.BreedCode);
                     damNode.appendChild(childNode);

                     animalRegistration.appendChild(damNode);
                  finally
                     FreeAndNil(DamRegInfo);
                  end;

                  sireNode := document.createElement('sire');

                  // Output the sire information
                  if (Length(FTempQuery.FieldByName('SCode').AsString) > 0) then
                     begin
                        childNode := document.createElement('code');
                        childNode.text := UpperCase(Trim(FTempQuery.FieldByName('SCode').AsString));
                        sireNode.appendChild(childNode);
                     end;

                  TempStr := EnforceOfficalBreedCode(FTempQuery.FieldByName('SBreedCode').AsString);
                  if (Length(TempStr)<=0) then
                     raise Exception.CreateFmt('The Sire breed is missing for calf "%s"',[FTempQuery.FieldByName('NatIDNum').AsString]);

                  childNode := document.createElement('breed');
                  childNode.text := Trim(TempStr);
                  sireNode.appendChild(childNode);

                  childNode := document.createElement('natIdNo');
                  childNode.text := UPPERCASE(Trim(FTempQuery.FieldByName('SireNatIdNo').AsString));
                  sireNode.appendChild(childNode);

                  animalRegistration.appendChild(sireNode);

                  // if exists output the genetic dam information
                  if (FTempQuery.FieldByName('DonorDamID').AsInteger > 0) then
                     begin
                        damNode := document.createElement('genDam');
                        DamRegInfo := GetDamRegInfo(FTempQuery.FieldByName('DonorDamID').AsInteger);
                        try
                           childNode := document.createElement('natIdNo');
                           childNode.text := Trim(DamRegInfo.NatIdNo);
                           damNode.appendChild(childNode);

                           childNode := document.createElement('breed');
                           childNode.text := Trim(DamRegInfo.BreedCode);
                           damNode.appendChild(childNode);

                           animalRegistration.appendChild(damNode);
                        finally
                           FreeAndNil(DamRegInfo);
                        end;
                     end;

                  // ICBF Specific Data
                  icbfNode := document.createElement('icbfSpecific');
                  animalRegistration.appendChild(icbfNode);

                  childNode := document.createElement('calfName');
                  childNode.text := Trim(FTempQuery.FieldByName('CalfName').AsString);
                  icbfNode.appendChild(childNode);


                  childNode := document.createElement('mortality');
                  if FTempQuery.FieldByName('CalfDead').AsBoolean then
                     begin
                        if (FTempQuery.FieldByName('CalfMortality').AsString = 'ICBF-Abortion') then
                           childNode.text := '1'
                        else if ((FTempQuery.FieldByName('CalfMortality').AsString = 'ICBF-Dead At Birth') or
                                 // SP 30/01/2013 - Added check for a mortality status of "Dead Within 48 Hours",
                                 // if found replace with status "Dead At Birth" because the AIM system does not have
                                 // an understanding of the mortality status "Dead Within 48 Hours"
                                 // This problem was identified by DOM while calving twin calves. For the first calf
                                 // he selected Dead At Birth and the second he chose Dead Within 48 Hours leading to
                                 // a problem during registration.
                                 (FTempQuery.FieldByName('CalfMortality').AsString = 'ICBF-Dead Within 48 Hours')) then
                           childNode.text := '2'
                        else
                           begin
                              // Because we do not have a valid mortalty code, we need to
                              // establish if the calf was tagged with a new Plastic IE tag. If
                              // it was tagged, insert the Dead at Birth code (2), otherwise
                              // (where there isn't a valid tag) insert Abortion code (1).
                              // The above rule was created by GL/SP 18/02/2013 - refer to logic
                              // matrix image within source folder C:\Kingswood\Delphi Development\Documents\Calf Mortality Logic.jpg
                              if ( WhatStyleNatID(FTempQuery.FieldByName('NatIDNum').AsString, False ) in [StyleEID, Style1999] ) then
                                 childNode.text := '2'
                              else
                                 childNode.text := '1'

                           end;
                     end;
                  icbfNode.appendChild(childNode);

                  childNode := document.createElement('calvingSurvey');
                  if (FTempQuery.FieldByName('CalvingSurvey').AsString = 'ICBF-1=Normal Calving') then
                     childNode.text := '1'
                  else if (FTempQuery.FieldByName('CalvingSurvey').AsString = 'ICBF-2=Some Assistance') then
                     childNode.text := '2'
                  else if (FTempQuery.FieldByName('CalvingSurvey').AsString = 'ICBF-3=Considerable Difficulty') then
                     childNode.text := '3'
                  else if (FTempQuery.FieldByName('CalvingSurvey').AsString = 'ICBF-4=Veterinary Assistance') then
                     childNode.text := '4';
                  icbfNode.appendChild(childNode);


                  animalRegistrations.appendChild(animalRegistration);
                  Next;
               end;
        finally
           FTempQuery.Close;
        end;

        if (Document = nil) or (animalRegistrations = nil) then Exit;

        AnimalRegistrationFilename := IncludeTrailingBackslash(WinData.AimStorePath) + 'animalregistration.xml';
        if ( FileExists(AnimalRegistrationFilename) ) then
           DeleteFile(AnimalRegistrationFilename);
        Document.save(AnimalRegistrationFilename);

        Params := Format('"%s" "%s" "%s" "%s"',[DataDir, HerdNumber, 'REG', AnimalRegistrationFilename]);

        AimClient.InvokeClient(FHandle, Params);
   finally
      document := nil;
      rootNode := nil;
      animalRegistration := nil;
      animalRegistrations := nil;
      childNode := nil;
      damNode := nil;
      sireNode := nil;
      genDamNode := nil;
      icbfNode := nil;
      Screen.Cursor := crDefault;
   end;
end;

procedure TAimAnimalRegistration.GoToAimAnimalRegistrationEnquiry;
var
   HerdNumber : string;
   Params : string;
begin
   HerdNumber := HerdLookup.HerdNumberByHerdId(FHerdId);
   if (HerdNumber = '') then
      begin
         MessageDlg('Herd Number was not found in database',mtError,[mbOk],0);
         Exit;
      end;
   Params := Format('"%s" "%s" "%s"',[DataDir, HerdNumber, 'RER']);
   AimClient.InvokeClient(FHandle, Params);
end;

procedure TAimAnimalRegistration.ValidateRegistrationData;
begin

end;

// Registrations can become disasscociated by E55 error or
// by user deleting animal registration.
procedure TAimAnimalRegistration.ProcessDisassociatedAimAnimalRegistrationTransactions;
var
   FileName : string;
   Document : IXMLDOMDocument;
   RootNode, RegistrationNode, ChildNode, IsProcessedNode : IXMLDOMNode;
   RegistrationListNode : IXMLDOMNodeList;

   i : Integer;
   AnimalId : Integer;
   NatIdNo : string;
   Status : Integer;
   RequiresProcessing : Boolean;
begin
   RootNode := nil;
   RegistrationListNode := nil;
   RegistrationNode := nil;
   ChildNode := nil;
   IsProcessedNode := nil;

   FileName := Format('C:\Kingswood Herd Management\%s\AIM\aimanimalreg.xml',[DataDir]);

   if (not FileExists(FileName)) then
      Exit;

   Screen.Cursor := crHourGlass;
   try
      try
         Document := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
      except
         raise Exception.Create('Error creating MSXML2.DOMDocument. Please contact Kingswood.');
      end;

      Document.load(FileName);

      RootNode := Document.selectSingleNode('registrations');

      if (RootNode = nil) then Exit;

      RegistrationListNode := RootNode.selectNodes('registration');

      if (RegistrationListNode = nil) then Exit;

      for i := 0 to RegistrationListNode.Length-1 do
         begin
            AnimalId := 0;
            NatIdNo := '';
            Status := 0;
            RegistrationNode := RegistrationListNode[i];

            if (RegistrationNode = nil) then
               continue;

            IsProcessedNode := RegistrationNode.selectSingleNode('isProcessed');
            if (IsProcessedNode <> nil) then
               begin
                  RequiresProcessing := Lowercase(IsProcessedNode.text) = 'false';
                  if (RequiresProcessing) then
                     begin
                        ChildNode := RegistrationNode.selectSingleNode('natIdNo');
                        if (ChildNode <> nil) then
                           begin
                              NatIdNo := ChildNode.Text;
                              if Trim(NatIdNo) <> '' then
                                 AnimalId := GetAnimalIdByNatIdNo(NatIdNo);
                           end;

                        ChildNode := RegistrationNode.selectSingleNode('status');
                        if (ChildNode <> nil) then
                           try
                              Status := StrToInt(ChildNode.Text);
                           except
                           end;

                        if ((AnimalId > 0) and (Status > -1)) then
                           begin
                              UpdateAnimalRegistrationStatus(AnimalId,Status,Now());
                              IsProcessedNode.text := 'true';
                           end;
                     end;
               end;
         end;
      Document.Save(FileName);
   finally
     RootNode := nil;
     RegistrationNode := nil;
     RegistrationListNode := nil;
     ChildNode := nil;
     Screen.Cursor := crDefault;
   end;
end;

procedure TAimAnimalRegistration.UpdateAnimalRegistrationStatus(
  const AAnimalId, AStatus: Integer; AAimLastActionDate: TDateTime);
var
   EventId : Integer;
   IdPrefix : string;
   CanUpdate : Boolean;

   procedure GetCalvingDetailByAnimalId();
   begin
      IdPrefix := '';
      EventId := 0;
      // get the calving record
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT * FROM Calvings');
            SQL.Add('WHERE ((Id1 =:AnimalId) OR ');
            SQL.Add('       (Id2 =:AnimalId) OR ');
            SQL.Add('       (Id3 =:AnimalId) OR ');
            SQL.Add('       (Id4 =:AnimalId)) ');
            Params[0].AsInteger := AAnimalId;
            Open;

            try
               if (RecordCount = 1) then
                  begin
                     EventId := FieldByName('EventID').AsInteger;
                     if ( FieldByName('ID1').AsInteger = AAnimalId ) then
                        IdPrefix := 'ID1'
                     else if ( FieldByName('ID2').AsInteger = AAnimalId ) then
                        IdPrefix := 'ID2'
                     else if ( FieldByName('ID3').AsInteger = AAnimalId ) then
                        IdPrefix := 'ID3'
                     else if ( FieldByName('ID4').AsInteger = AAnimalId ) then
                        IdPrefix := 'ID4';
                  end
               else
                  begin
                     // this shouldn't happen
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;

   end;

begin
   if (AAnimalId <= 0) then
      Exit;

   // Possible status values;
   // 2 = Error
   // 3 = Accepted
   // 4 = Queried
   // 5 = Deleted
   with TQuery.Create(nil) do
      try
         try
            DatabaseName := AliasName;

            // First check if this transaction is newer than previous transaction dates,
            // if not exit out.
            SQL.Clear;
            SQL.Add('SELECT AnimalId, Status, TransactionDate ');
            SQL.Add('FROM AimAnimalReg ');
            SQL.Add('WHERE AnimalId =:AAnimalId');
            SQL.Add('ORDER BY TransactionDate DESC');
            Params[0].AsInteger := AAnimalId;
            Open;
            try
               First;
               // Only allow update if AAimLastActionDate is greater than previously stored Transaction date.
               CanUpdate := (AAimLastActionDate > FieldByName('TransactionDate').AsDateTime);
            finally
              Close;
            end;

            if not CanUpdate then
               Exit;

            // First insert a new transaction into AimAnimalReg.
            SQL.Clear;
            SQL.Add('INSERT INTO AimAnimalReg (AnimalId, Status, TransactionDate) ');
            SQL.Add('VALUES (:AnimalId, :Status, :TransactionDate) ');
            Params[0].AsInteger := AAnimalId;
            Params[1].AsInteger := AStatus;
            Params[2].AsDateTime := AAimLastActionDate;
            ExecSQL;

            // update the current status in the animals table.
            SQL.Clear;
            SQL.Add('UPDATE Animals SET AimRegStatus =:AimRegStatus');
            SQL.Add('WHERE (Id =:AnimalId)');
            Params[0].AsInteger := AStatus;
            Params[1].AsInteger := AAnimalId;
            ExecSQL;

            GetCalvingDetailByAnimalId();
            if (IdPrefix = '') or (EventId = 0) then Exit;

            // Update the calvings table if registration was accepted or queried.
            if ( AStatus = CalfReg_Status_AIM_Accepted ) or (AStatus = CalfReg_Status_AIM_Queried) then
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE Calvings SET ');
                  SQL.Add(IdPrefix+'Notified = :ANotified, ');
                  SQL.Add(IdPrefix+'Status = :AStatus,');
                  SQL.Add(IdPrefix+'Date = :ADate');
                  SQL.Add('WHERE (EventId =:EventId)');
                  Params[0].AsBoolean := True;
                  Params[1].AsInteger := CalfReg_Status_AimRegistered;
                  Params[2].AsDateTime := Date;
                  Params[3].AsInteger := EventId;
                  ExecSQL;
               end
            else if ( AStatus = 5 ) then
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE Calvings SET ');
                  SQL.Add(IdPrefix+'Notified = :ANotified, ');
                  SQL.Add(IdPrefix+'Status = :AStatus,');
                  SQL.Add(IdPrefix+'Date = :ADate');
                  SQL.Add('WHERE (EventId =:EventId)');
                  Params[0].AsBoolean := False;
                  Params[1].AsInteger := CalfReg_Status_AimRegistration_Deleted;
                  Params[2].AsDateTime := Date;
                  Params[3].AsInteger := EventId;
                  ExecSQL;
               end;

         except
            on e : exception do
            begin
                if (IswinHerdDebugging) then
                   ApplicationLog.LogException(e)
                else
                   ApplicationLog.LogError(Format('WinData.CreateAimAnimalRegistrationTransaction() failed. [AnimalId:%d]',[AAnimalId]));
            end;
         end;
      finally
         Free;
      end;
end;

{ TDamRegInfo }

constructor TDamRegInfo.create;
begin
   NatIdNo := '';
   BreedCode := '';
end;

end.
