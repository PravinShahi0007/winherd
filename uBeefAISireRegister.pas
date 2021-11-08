{
   Unit Created : 20/02/2009 V3.9 R6.3 /SP

   08/01/2009 [V3.9 R5.6] /SP Default Sire To Pedigree AISire.Pedigree := True;

   23/02/12 [V5.0 R4.0] /MK Additional Feature - Let Everybody Download The Sire List Regardless Of Maintanence.

   18/10/12 [V5.1 R0.4] /MK Additional Feature - LoadFile - Set WinData.BeefAISireFile to nil if file does not exist on hard drive.

   07/01/13 [V5.1 R3.6] /MK Change - Change of rules for downloading file.
                                   - If file doesn't exist then download file and read in file.
                                   - If file does exist then read file.
                                   - On click of HyperLink check SerNo and then read in new file.

   23/11/15 [V5.5 R0.9] /MK Bug Fix - Changes made to allow import of the BeefFile from ICBF without checking webupdate.ini as then
                                      webupdate.ini no longer exists on our server.

   02/12/15 [V5.5 R1.4] /MK Additional Feature - Code added to save the maternal index of the bull to the bullext table from the Excel file.

   24/01/17 [V5.6 R4.2] /MK Bug Fix - heDownloadClick - This procedure was checking again an old boolean, AllowDownload, which is no longer in use.
                                                        This means that the file would not be downloaded if the user clicks this option.

   08/01/18 [V5.7 R7.4] /MK Change - Open BeefAISireSettings paradox table to find field positions instead of creating uBeefAISireRegisterSettings form
                                     to just open a MemDataSet which never created a valid paradox table.

   21/02/18 [V5.7 R8.2] /MK Change - Removed egg timer from DownloadAIFile and added it to GetAllBullsProcessed as its here that the main work is done.
                                   - GetAllBullsProcessed - Added complete message after LoadAIFile so message doesn't appear before egg timer.
                                   - LoadSettings - If settings table does not exist then create it.
                                                  - If settings table exists but doesn't open i.e. corrupt, the delete it and create it again.

   28/09/18 [V5.8 R3.0] /MK Change - AnimalInUse - Changed this function to return a TAnimal object to check if breed exists for animal.
                                   - AddSire - If there is no breed for the bull then give error and exit, don't try save the bull.
                                             - If no breed saved in animals table and breed is on file, then update animals table with breed.

   01/11/18 [V5.8 R3.3] /MK Bug Fix - LoadSettings - If BeefAISireSettings table does not exist and it is created then assign variables after creating the table.
                                    - AddSire - ExistingBull can be nil.
                                              - When adding new bull or updating an existing bull, if the MaternalIndex is blank then only add the BullID to the BullExt table.

   14/02/20 [V5.9 R2.3] /MK Change - As the ICBF website no longer can upload the file to the same file name, Gerry (Kingswood) suggested that I download the file
                                     once every 3 months (based on what ICBF said) and upload it to our website. I changed the GetAIBulls URL to look at this new URL on our website.

   18/02/20 [V5.9 R2.3] /MK Change - FormActivate - Check new field in Defaults table to see when file was download last.
                                                    If date is more than 3 months then download a new file.
                                   - LoadAIFile - Show indicator in Status bar if file was downloaded and what date.
                                   - DownloadAIFile - Check if internet connection, check if file exists on our server and then download it.
                                                      If file doesn't exist or no internet then if file exists in Kingswood Herd Management folder, load it.
}

unit uBeefAISireRegister;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxSSheet, ExtCtrls, dxBar, dxBarExtItems, ActnList,
  cxControls, dxStatusBar, cxContainer, cxEdit, cxTextEdit, cxHyperLinkEdit,
  LMDWebBase, LMDWebConfig, LMDWebHTTPGet, Db, dxmdaset, Menus, StdCtrls,
  cxButtons, cxLabel, cxMaskEdit, cxDropDownEdit, cxSSPainters, cxGroupBox,
  dbTables, cxMemo, cxProgressBar, LMDDownload, cxSSHeaders,
  DairyData, uAnimal, DateUtil, WinInet;

type
  TfmBeefAISireRegister = class(TfmBaseForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpreadSheet: TcxSpreadSheet;
    dxBarLargeButton1: TdxBarLargeButton;
    actOptions: TAction;
    heDownload: TcxHyperLinkEdit;
    GetAllBulls: TLMDWebHTTPGet;
    actUpdateSettings: TAction;
    dxBarPopupMenu1: TdxBarPopupMenu;
    bbUpdateSettings: TdxBarButton;
    cxGroupBox1: TcxGroupBox;
    cmboSearchField: TcxComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    teSearchText: TcxTextEdit;
    btnSearch: TcxButton;
    dxBarLargeButton2: TdxBarLargeButton;
    actAddSire: TAction;
    GetSerNo: TLMDWebHTTPGet;
    GetWebUpdate: TLMDWebHTTPGet;
    ProgressBar: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure actUpdateSettingsExecute(Sender: TObject);
    procedure SpreadSheetTopLeftChanging(Sender: TcxSSBookSheet;
      var ATopLeft: TPoint);
    procedure btnSearchClick(Sender: TObject);
    procedure SpreadSheetActiveCellChanging(Sender: TcxSSBookSheet;
      const ActiveCell: TPoint; var CanSelect: Boolean);
    procedure cmboSearchFieldPropertiesChange(Sender: TObject);
    procedure teSearchTextPropertiesChange(Sender: TObject);
    procedure actAddSireExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetSerNoProcessed(Sender: TObject);
    procedure heDownloadClick(Sender: TObject);
    procedure GetAllBullsProcessed(Sender: TObject);
    procedure GetAllBullsProgress(Sender: TLMDWebHTTPGet;
      Item: TLMDDownloadItem);
    procedure SpreadSheetClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    function GetFAIWebServerFileName: String;
    function GetLastBeefAIUpdateDate: TDateTime;
    procedure SetLastBeefAIUpdateDate(const Value: TDateTime);
    function GetCanDownloadFile: Boolean;
  private
    { Private declarations }
    FSireCodeCol : Integer;
    FSireNameCol : Integer;
    FSireBreedCol : Integer;
    FSireMaterniyIndexCol : Integer;
    FDataTopRow : Integer;
    FDataLeftColIndex : Integer;
    FSireFileName : string;
    FNextStartIndex : Integer;
    FcxSSBookSheet : TcxSSBookSheet;
    FSelectedRowIndex : Integer;
    FUpdateAvailable : Boolean;
    FSettingsTable : TTable;
    procedure LoadSettings;
    procedure LoadFromDisk;
    procedure LoadAIFile;
    procedure DownloadAIFile;
    procedure SearchForAnimal(AStartIndex : Integer);
    procedure SelectRow(ARowIndex : Integer);
    procedure AddSire;
    function AnimalInUse(const ACode, AName : String): TAnimal;
    procedure CheckSireSelected;
    property FAIWebServerFileName : String read GetFAIWebServerFileName;
    property LastBeefAIUpdateDate : TDateTime read GetLastBeefAIUpdateDate write SetLastBeefAIUpdateDate;
    property CanDownloadFile : Boolean read GetCanDownloadFile;
  public
    { Public declarations }
  end;

var
  fmBeefAISireRegister: TfmBeefAISireRegister;

implementation

uses KRoutines, uPreferences, cxSSHelper,
     uBeefAISireRegisterSettings, cxSSTypes, EventRecording, SQLHelper,
     GenTypesConst, Def, uDownloadValidation, UserMsgConst;

{$R *.DFM}

{ TfmBeefAISireRegister }

procedure TfmBeefAISireRegister.LoadAIFile;
var
   dLastUpdateDate : TDateTime;
begin
   dLastUpdateDate := LastBeefAIUpdateDate;

   if FileExists(FSireFileName) then
      LoadFromDisk
   else
      begin
         //   18/10/12 [V5.1 R0.4] /MK Additional Feature - Set WinData.BeefAISireFileName if file does not exist on Hard Drive.
         //                                                 Problem occurred if user had moved data to another PC where the files
         //                                                 does not exist.
         if ( not(WinData.BeefAISireFileName='') ) then
            WinData.BeefAISireFileName := '';
         DownloadAIFile;
      end;

   //   18/02/20 [V5.9 R2.3] /MK Change - Show indicator in Status bar if file was downloaded and what date.
   if ( dLastUpdateDate > 0 ) then
      StatusBar.Panels[0].Text := 'File: '+ExtractFileName(FSireFileName)+' Last Downloaded '+DateToStr(dLastUpdateDate)
   else
      StatusBar.Panels[0].Text := 'File: '+ExtractFileName(FSireFileName);
end;

procedure TfmBeefAISireRegister.FormCreate(Sender: TObject);
begin
  inherited;
  ProgressBar.Position := 0;
  ProgressBar.Visible := False;
  FSelectedRowIndex := 0;
  LoadSettings;
end;

procedure TfmBeefAISireRegister.LoadFromDisk;
var
   RowHeader : TcxSSHeader;
begin
   if FileExists(FSireFileName) then
      begin
         SpreadSheet.BeginUpdate;
         try
            SpreadSheet.LoadFromFile(FSireFileName);
            TcxSSHelper.SetCellReadOnly(0,0,SpreadSheet.Sheet.ColumnCount-1,SpreadSheet.Sheet.RowCount-1,True,SpreadSheet.Sheet);
            SpreadSheet.Sheet.Cols.Size[FSireCodeCol] := 85;
            SpreadSheet.Sheet.Cols.Size[FSireNameCol] := 250;
            SpreadSheet.Sheet.Cols.Size[FSireBreedCol] := 85;
            RowHeader := SpreadSheet.Sheet.Rows;
         finally
            SpreadSheet.EndUpdate;
            SelectRow( FDataTopRow );
         end;
      end;
end;

procedure TfmBeefAISireRegister.LoadSettings;
begin
   FSettingsTable := TTable.Create(nil);
   FSettingsTable.DatabaseName := AliasName;
   FSettingsTable.TableName := 'BeefAISireSettings';

   //   21/02/18 [V5.7 R8.2] /MK Bug Fix - If table does not exist then create it.
   if ( not(FSettingsTable.Exists) ) then
      CreateBeefAISireSettingsDB;

   //   01/11/18 [V5.8 R3.3] /MK Bug Fix - If BeefAISireSettings table does not exist and it is created then assign variables after creating the table. 
   try
      FSettingsTable.Open;
   except
      //   21/02/18 [V5.7 R8.2] /MK Bug Fix - If table exists but doesn't open i.e. corrupt, the delete it and create it again.
      FSettingsTable.DeleteTable;
      CreateBeefAISireSettingsDB;
      FSettingsTable.Open;
   end;

   FSettingsTable.First;
   // AI Sire Code
   FSireCodeCol := FSettingsTable.Fields[2].AsInteger-1;
   FSettingsTable.Next;
   // AI Sire Breed
   FSireBreedCol := FSettingsTable.Fields[2].AsInteger-1;
   FSettingsTable.Next;
   // AI Sire Name
   FSireNameCol := FSettingsTable.Fields[2].AsInteger-1;
   FSettingsTable.Next;
   // AI Sire Maternity Index
   FSireMaterniyIndexCol := FSettingsTable.Fields[2].AsInteger-1;
   FSettingsTable.Next;
   // Data Top Row Index - begining of data rows
   FDataTopRow := FSettingsTable.Fields[2].AsInteger-1;
   FSettingsTable.Next;
   // Left Col Index - begining of data cols
   FDataLeftColIndex := FSettingsTable.Fields[2].AsInteger-1;
   FSettingsTable.Close;

   FreeAndNil(FSettingsTable);
end;

procedure TfmBeefAISireRegister.actUpdateSettingsExecute(Sender: TObject);
begin
   inherited;
   TfmBeefAISireRegisterSettings.Load;
   LoadSettings;
end;

procedure TfmBeefAISireRegister.SpreadSheetTopLeftChanging(
  Sender: TcxSSBookSheet; var ATopLeft: TPoint);
begin
  inherited;
  APrevPoint := APoint;
  APoint := ATopLeft;
end;

procedure TfmBeefAISireRegister.SearchForAnimal(AStartIndex: Integer);
var
   SearchText, SearchField, FieldValue : string;
   SearchColIndex : Integer;
   Success : Boolean;
   i : Integer;
   s : string;
begin
   if cmboSearchField.ItemIndex = 0 then
      SearchColIndex := FSireCodeCol
   else
      SearchColIndex := FSireNameCol;

   SpreadSheet.BeginUpdate;
   with SpreadSheet.Sheet do
      begin
         try
            SearchText := Trim(teSearchText.Text);
            if SearchText <> '' then
               begin
                  SearchText := UPPERCASE(teSearchText.Text);

                  Screen.Cursor := crHourGlass;
                  Success := False;

                  try
                     for i := AStartIndex to RowCount - 1 do
                        begin
                           FieldValue := TcxSSHelper.GetCellValue(SearchColIndex, i, SpreadSheet.Sheet);

                           if not VarIsNull(FieldValue) then
                              begin
                                 FieldValue := UPPERCASE(FieldValue);
                                 if (SearchColIndex = FSireCodeCol) then
                                    begin
                                       if (SearchText = System.Copy(FieldValue, 1, Length(SearchText))) then
                                          begin
                                             SpreadSheet.Sheet.ActiveCell := Point(FSireCodeCol,i);
                                             SelectRow(i);
                                             Success := True;
                                             Break;
                                          end;
                                    end
                                 else
                                    begin
                                       if Pos( SearchText, FieldValue) > 0 then
                                          begin
                                             SpreadSheet.Sheet.ActiveCell := Point(FSireCodeCol,i);
                                             SelectRow(i);
                                             FNextStartIndex := i+1;
                                             Success := True;
                                             Break;
                                          end;
                                    end;
                              end;
                        end;

                     if not Success then
                        begin
                           FNextStartIndex := 0;
                           s := '';
                           if AStartIndex > 0 then
                              s := 'further ';
                           MessageDlg(Format('The search for "%s" did not return any %sresults.',[teSearchText.Text,s]),mtInformation,[mbOK],0)
                        end;
                  finally
                     Screen.Cursor := crDefault;
                  end;
               end
            else
               begin
               end;
         finally
            SpreadSheet.EndUpdate;
         end;
      end;
end;

procedure TfmBeefAISireRegister.btnSearchClick(Sender: TObject);
var
  ActiveRow : Integer;
begin
  inherited;
  if cmboSearchField.ItemIndex = 1 then
     begin
        if btnSearch.Caption = 'Search' then
           begin
               btnSearch.Caption := 'Continue';
               FNextStartIndex := 5;
               ActiveRow := FNextStartIndex;
           end
        else
           ActiveRow := FNextStartIndex;
     end
  else
     begin
        ActiveRow := 5;
     end;

  SearchForAnimal( ActiveRow );
end;

procedure TfmBeefAISireRegister.SpreadSheetActiveCellChanging(
  Sender: TcxSSBookSheet; const ActiveCell: TPoint;
  var CanSelect: Boolean);
begin
  inherited;
  TcxSSHelper.SetCellPattern(ActiveCell.y,ActiveCell.x,ActiveCell.y,ActiveCell.x, 14, 1,fsSolid, SpreadSheet.Sheet);
end;

procedure TfmBeefAISireRegister.SelectRow(ARowIndex : Integer);
var
   MyRect : TRect;
begin
   FSelectedRowIndex := ARowIndex;
   MyRect.Left := 0;
   MyRect.Top := ARowIndex;
   MyRect.Bottom := ARowIndex;
   MyRect.Right := SpreadSheet.Sheet.ColumnCount-1;
   if not PtInRect(SpreadSheet.Sheet.Corners, SpreadSheet.Sheet.ActiveCell) then
     SpreadSheet.Sheet.Corners := MyRect;
   SpreadSheet.SelectionRect := MyRect;
end;

procedure TfmBeefAISireRegister.cmboSearchFieldPropertiesChange(
  Sender: TObject);
begin
  inherited;
  FNextStartIndex := 0;
  btnSearch.Caption := 'Search';
  teSearchText.Text := '';
end;

procedure TfmBeefAISireRegister.teSearchTextPropertiesChange(
  Sender: TObject);
begin
  inherited;
  FNextStartIndex := 0;
  if teSearchText.Text = '' then
     btnSearch.Caption := 'Search';
end;

procedure TfmBeefAISireRegister.AddSire;
var
   AISire : TAnimalRecord;
   bFound : Boolean;
   Name, Code, Breed,
   MaternityIndexStr : string;
   ExistingBull : TAnimal;
begin
   inherited;
   CheckSireSelected;

   // Add selected animal
   Code := '';
   Name := '';
   Breed := '';

   Code := TcxSSHelper.GetCellValue(FSireCodeCol, FSelectedRowIndex, SpreadSheet.Sheet);
   Name := TcxSSHelper.GetCellValue(FSireNameCol, FSelectedRowIndex, SpreadSheet.Sheet);

   Breed := TcxSSHelper.GetCellValue(FSireBreedCol, FSelectedRowIndex, SpreadSheet.Sheet);
   //   28/09/18 [V5.8 R3.0] /MK Change - If there is no breed for the bull then give error and exit, don't try save the bull.
   if ( Length(Breed) = 0 ) then
      begin
         MessageDlg('There is no breed for the selected bull.'+cCRLF+
                    'Check that Options/Settings has the correct column selected for breed.'+cCRLF+
                    'The bull cannot be created without a breed.',mtError,[mbOK],0);
         Exit;
      end;

   MaternityIndexStr := TcxSSHelper.GetCellValue(FSireMaterniyIndexCol, FSelectedRowIndex, SpreadSheet.Sheet);

   if MessageDlg( Format('Add Sire "%s" to your animal database?',[Code]),mtConfirmation,[mbYes,mbNo],0) = idNo then Exit;

   ExistingBull := AnimalInUse(Code,Name);

   //   01/11/18 [V5.8 R4.2] /MK Bug Fix - ExistingBull can be nil.
   if ( ExistingBull = nil ) or ( ExistingBull.Id <= 0) then
      begin
         // Add animal to database
         AISire := TAnimalRecord.Create;
         AISire.CreateBullSemenStkRecord := True;
         try
            AISire.RaiseExceptions := False;

            AISire.AddToNoneHerd;
            AISire.AnimalNo := Code;
            AISire.Name := Trim(Name);
            AISire.Sex := cSex_Bull;
            AISire.LactNo := 0;
            AISire.InHerd := True;
            AISire.Breeding := True;
            AISire.DamID  := 0;
            AISire.SireID := 0;
            AISire.AnimalDeleted := False;

            // 08/01/2009 V3.9 R5.6 /SP Default Sire To Pedigree
            AISire.Pedigree := True;

            AISire.PrimaryBreedCode := Breed;
            if not AISire.Save then
               AISire.Cancel
            else
               begin
                  // Add BullSemenStk Record
                  with TQuery.Create(nil) do
                     try
                        DatabaseName := AliasName;
                        SQL.Clear;
                        //   01/11/18 [V5.8 R4.2] /MK Bug Fix - If the MaternalIndex is blank then only add the BullID to the BullExt table.
                        if ( Length(MaternityIndexStr) > 0 ) then
                           begin
                              SQL.Add('INSERT INTO BullExt (AnimalID, RBI)');
                              SQL.Add('VALUES (:AnimalID, :MatIndex)');
                              Params[0].AsInteger := AISire.ID;
                              Params[1].AsFloat := StrToFloat(MaternityIndexStr);
                           end
                        else if ( Length(MaternityIndexStr) = 0 ) then
                           begin
                              SQL.Add('INSERT INTO BullExt (AnimalID)');
                              SQL.Add('VALUES (:AnimalID)');
                              Params[0].AsInteger := AISire.ID;
                           end;
                        ExecSQL;
                     finally
                        Free;
                     end;

                  FBooleanResult := True;
                  MessageDlg(cSireAddedToDB,mtInformation,[mbOK],0);
               end;
            FBooleanResult := True; // sire has been added, reload queries containing ai sires.
         finally
            FreeAndNil(AISire);
         end;
      end
   else
      begin
         // update animal fields in database
         if MessageDlg(cSireAlreadyExists,mtConfirmation,[mbYes,mbNo],0) = idYes then
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;

                  SQL.Add('SELECT AnimalID');
                  SQL.Add('FROM BullSemenStk');
                  SQL.Add('WHERE AnimalID = :AnimalID');
                  Params[0].AsInteger := ExistingBull.Id;
                  Open;
                  try
                     First;
                     bFound := ( Fields[0].AsInteger = ExistingBull.Id );
                  finally
                     Close;
                  end;

                  if not (bFound) then
                     begin
                        SQL.Clear;
                        SQL.Add('INSERT INTO BullSemenStk (AnimalID, InUse)');
                        SQL.Add('VALUES (:AnimalID, True)');
                        Params[0].AsInteger := ExistingBull.Id;
                        ExecSQL;
                     end
                  else
                     begin
                        SQL.Clear;
                        SQL.Add('UPDATE BullSemenStk');
                        SQL.Add('SET InUse = True');
                        SQL.Add('WHERE AnimalID = :AnimalID');
                        Params[0].AsInteger := ExistingBull.Id;
                        ExecSQL;
                     end;

                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT AnimalID');
                  SQL.Add('FROM BullExt');
                  SQL.Add('WHERE AnimalID = :AnimalID');
                  Params[0].AsInteger := ExistingBull.Id;
                  Open;
                  try
                     First;
                     bFound := ( Fields[0].AsInteger = ExistingBull.Id );
                  finally
                     Close;
                  end;

                  //   01/11/18 [V5.8 R3.3] /MK Bug Fix - If the maternal index is blank then just insert the animal to the BullExt table. 
                  if ( not(bFound) ) then
                     begin
                        SQL.Clear;
                        if ( Length(MaternityIndexStr) > 0 ) then
                           begin
                              SQL.Add('INSERT INTO BullExt (AnimalID, RBI)');
                              SQL.Add('VALUES (:AnimalID, :MatIndex)');
                              Params[0].AsInteger := ExistingBull.Id;
                              Params[1].AsFloat := StrToFloat(MaternityIndexStr);
                           end
                        else if ( Length(MaternityIndexStr) = 0 ) then
                           begin
                              SQL.Add('INSERT INTO BullExt (AnimalID)');
                              SQL.Add('VALUES (:AnimalID)');
                              Params[0].AsInteger := ExistingBull.Id;
                           end;
                        ExecSQL;
                     end
                  else
                     begin
                        //   01/11/18 [V5.8 R3.3] /MK Bug Fix - If the maternal index is blank then just update the animal in the BullExt table. 
                        if ( Length(MaternityIndexStr) > 0 ) then
                           begin
                              SQL.Clear;
                              SQL.Add('UPDATE BullExt');
                              SQL.Add('SET RBI = :MatIndex');
                              SQL.Add('WHERE AnimalID = :AnimalID');
                              Params[0].AsFloat := StrToFloat(MaternityIndexStr);
                              Params[1].AsInteger := ExistingBull.Id;
                              ExecSQL;
                           end;
                     end;

                  //   28/09/18 [V5.8 R3.0] /MK Change - If no breed saved in animals table and breed is on file, then update animals table with breed.
                  if ( ExistingBull.BreedID <= 0 ) and ( Length(Breed) > 0 ) then
                     begin
                        Close;
                        SQL.Clear;
                        SQL.Add('UPDATE Animals');
                        SQL.Add('SET PrimaryBreed = :Breed');
                        SQL.Add('WHERE ID = :AID');
                        Params[0].AsInteger := WinData.GetBreedID(Breed);
                        Params[1].AsInteger := ExistingBull.Id;
                        ExecSQL;
                     end;

               finally
                  Free;
               end;
      end;
end;

//   28/09/18 [V5.8 R3.0] /MK Change - Changed this function to return a TAnimal object to check if breed exists for animal.
function TfmBeefAISireRegister.AnimalInUse(const ACode, AName: String): TAnimal;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add( InsertSELECT(['ID']));
         SQL.Add( InsertFROM(['Animals']));
         SQL.Add( InsertWHERE(['AnimalNo'],[':AnimalNo']));
         SQL.Add( InsertOR(['UPPER(Name)'],[':Name']));
         Params[0].AsString := ACode;
         Params[1].AsString := UPPERCASE(AName);
         Open;
         try
            First;
            if ( Fields[0].AsInteger > 0 ) then
               Result := GetAnimal(Fields[0].AsInteger);
         finally
            Close;
         end;
      finally
         Free;
      end;

end;

procedure TfmBeefAISireRegister.actAddSireExecute(Sender: TObject);
begin
  inherited;
  AddSire;
end;

procedure TfmBeefAISireRegister.FormShow(Sender: TObject);
begin
  inherited;
  SelectRow(FDataTopRow);
end;

procedure TfmBeefAISireRegister.GetSerNoProcessed(Sender: TObject);
var
   FileName : string;
begin
   inherited;
   FileName := IncludeTrailingBackslash(GetSerNo.DownloadDir) + GetSerNo.DestinationName;
   AllowDownload := OkToDownload(FileName, Def.Definition.dSerialNo);
   if not AllowDownload then
      MessageDlg(cSupportExpired,mtError,[mbOK],0);
end;

procedure TfmBeefAISireRegister.heDownloadClick(Sender: TObject);
var
   FileName : String;
begin
   inherited;
    FileName := IncludeTrailingBackslash(GetAllBulls.DownloadDir) + GetAllBulls.DestinationName;
    DeleteFile(FileName);
    LoadAIFile;
end;

procedure TfmBeefAISireRegister.GetAllBullsProcessed(Sender: TObject);
var
  FileName : string;
begin
   inherited;
   FileName := IncludeTrailingBackslash(GetAllBulls.DownloadDir) + GetAllBulls.DestinationName;
   FSireFileName := FileName;
   if FileExists(FileName) then
      begin
         WinData.BeefAISireFileName := GetAllBulls.DestinationName;
         LoadFromDisk;
         Application.ProcessMessages;
         Update;
         MessageDlg('The new sire register has been successfully downloaded and installed.'+cCRLFx2+'Click OK to begin using the new sire register.',mtInformation,[mbOK],0);
      end;
   ProgressBar.Visible := False;
   ProgressBar.Position := 0;
end;

procedure TfmBeefAISireRegister.DownloadAIFile;
begin
   AllowDownload := True;
   if AllowDownload then
      begin
         GetAllBulls.DestinationName := 'Beef_AI_Bulls_SBV_Stars.xls';
         if ( Length(GetAllBulls.DestinationName) = 0 ) then
            GetAllBulls.DestinationName := 'Beef_AI_Bulls_SBV_Stars.xls';
         ProgressBar.Position := 0;
         ProgressBar.Visible := True;
         GetAllBulls.Process(False, True);
      end;
end;

procedure TfmBeefAISireRegister.GetAllBullsProgress(Sender: TLMDWebHTTPGet;
  Item: TLMDDownloadItem);
begin
  inherited;
  ProgressBar.Position := Item.Progress;
  if ProgressBar.Position >= 100 then
     begin
        ProgressBar.Visible := False;
        ProgressBar.Position := 0;
     end;
  Update;
end;

procedure TfmBeefAISireRegister.SpreadSheetClick(Sender: TObject);
begin
  inherited;
  SelectRow( SpreadSheet.Sheet.ActiveCell.y );
end;

procedure TfmBeefAISireRegister.CheckSireSelected;
const
  InvalidSireSelection = 'You have not selected a valid sire.';
var
   Name, Code, Breed : string;
begin
   if FSelectedRowIndex < FDataTopRow then
      begin
         MessageDlg(InvalidSireSelection,mtError,[mbOk],0);
         Abort;
      end;
   Code := TcxSSHelper.GetCellValue(FSireCodeCol, FSelectedRowIndex, SpreadSheet.Sheet);
   Name := TcxSSHelper.GetCellValue(FSireNameCol, FSelectedRowIndex, SpreadSheet.Sheet);
   Breed := TcxSSHelper.GetCellValue(FSireBreedCol, FSelectedRowIndex, SpreadSheet.Sheet);
   if ((Trim(Code) = '') or (Trim(Name)='') or (Trim(Breed)='')) then
      begin
         MessageDlg(InvalidSireSelection,mtError,[mbOk],0);
         Abort;
      end;
end;

procedure TfmBeefAISireRegister.dxBarLargeButton1Click(Sender: TObject);
begin
  inherited;
  dxBarPopupMenu1.PopupFromCursorPos;
end;

procedure TfmBeefAISireRegister.FormActivate(Sender: TObject);
var
   dLastUpdateDate : TDateTime;
begin
   inherited;
   OnActivate := nil;
   //   18/02/20 [V5.9 R2.3] /MK Change - Check new field in Defaults table to see when file was download last.
   //                                     If date is more than 3 months then download a new file.
   GetAllBulls.DestinationName := 'Beef_AI_Bulls_SBV_Stars.xls';
   GetAllBulls.URL := 'http://www.kingswood.ie/download/winherd/Beef_AI_Bulls_SBV_Stars.xls';
   GetAllBulls.DownloadDir := 'C:\Kingswood Herd Management\';
   GetAllBulls.DestinationName := 'Beef_AI_Bulls_SBV_Stars.xls';
   FSireFileName := IncludeTrailingBackslash(GetAllBulls.DownloadDir) + GetAllBulls.DestinationName;
   dLastUpdateDate := LastBeefAIUpdateDate;
   if ( CanDownloadFile ) then
       if ( dLastUpdateDate = 0 ) or ( Date - dLastUpdateDate >= 90 ) then
          begin
             if ( FileExists(FSireFileName) ) then
                DeleteFile(FSireFileName);
             LastBeefAIUpdateDate := Date;
          end;
   Update;
   LoadAIFile;
end;

function TfmBeefAISireRegister.GetFAIWebServerFileName: String;
var
   BullFileName,
   FileName : string;
   StrList : TStringList;
begin
   inherited;
   GetWebUpdate.Process(False, False);
   FileName := IncludeTrailingBackslash(GetWebUpdate.DownloadDir) + GetWebUpdate.DestinationName;
   if FileExists(FileName) then
      begin
         StrList := TStringList.Create;
         try
            StrList.LoadFromFile( FileName );
            BullFileName := StrList.Values['beefaisiresfname'];
            Result := BullFileName;
         finally
            StrList.Clear; // Clear File contents
            StrList.SaveToFile( FileName ); // Save Empty file
            StrList.Free;
            DeleteFile( FileName ); // Delete file from disk
         end;
      end;
end;

function TfmBeefAISireRegister.GetLastBeefAIUpdateDate: TDateTime;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT BeefAILastUpdateDate');
         SQL.Add('FROM Defaults');
         try
            Open;
            if ( Fields[0].AsDateTime > 0 ) then
               Result := Fields[0].AsDateTime;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmBeefAISireRegister.SetLastBeefAIUpdateDate(const Value: TDateTime);
begin
   if ( Value = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Defaults');
         SQL.Add('SET BeefAILastUpdateDate = :LastUpdateDate');
         Params[0].AsDateTime := Value;
         try
            ExecSQL;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TfmBeefAISireRegister.GetCanDownloadFile: Boolean;
var
   hHttpSession, hReqUrl: HInternet;
   htpReponse : LongBool;
   dWord1, bufLen : DWord;
   infoBuffer: array [0..512] of char;
   sReply : String;
begin
   Result := False;
   hHttpSession := InternetOpen(PChar('Kingswood Computing Ltd.'), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
   hReqUrl := InternetOpenURL(hHttpSession, PChar(GetAllBulls.URL), nil, 0,0,0);
   dWord1 := 0;
   bufLen := Length(infoBuffer);
   htpReponse := HttpQueryInfo(hReqUrl, HTTP_QUERY_STATUS_CODE, @infoBuffer[0], bufLen, dWord1);
   sReply := infoBuffer;
   Result := ( hReqUrl <> nil ) and ( htpReponse ) and ( sReply = '200' );
   if ( not(Result) ) then
      StatusBar.Panels[0].Text := 'Failed to download file from Kingswood Server. Please try again later.';
end;

end.
