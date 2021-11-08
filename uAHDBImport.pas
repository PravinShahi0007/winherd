//   13/09/19 [V5.9 R0.3] /MK Change - Alec (Fletchers) asked that we allow in minus figures but ignore -999 figures.

unit uAHDBImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  uCallToExternalProgram, cxGroupBox, cxRadioGroup, KRoutines,
  uSPParser, GenTypesConst, db, dbTables, cxProgressBar, uHerdLookup, cxPC,
  cxTextEdit, cxMemo, cxHyperLinkEdit, cxImage;

type
  TfmAHDBImport = class(TForm)
    pcAHDBImport: TcxPageControl;
    tsImportFile: TcxTabSheet;
    gbStep1: TcxGroupBox;
    lStep1: TcxLabel;
    gbStep2: TcxGroupBox;
    lStep2: TcxLabel;
    rgFileType: TcxRadioGroup;
    gbStep4: TcxGroupBox;
    lStep4: TcxLabel;
    lSelectedFileName: TcxLabel;
    btnBrowse: TcxButton;
    lSelectedFile: TcxLabel;
    FileProgressIndicator: TcxProgressBar;
    tsSummary: TcxTabSheet;
    btnBack: TcxButton;
    mSummary: TcxMemo;
    gbStep5: TcxGroupBox;
    btnImportFile: TcxButton;
    lStep5: TcxLabel;
    hlAHDBWebsite: TcxHyperLinkEdit;
    imgAHDB: TcxImage;
    btnExit: TcxButton;
    gbStep3: TcxGroupBox;
    lStep3: TcxLabel;
    rgImportType: TcxRadioGroup;
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgFileTypePropertiesChange(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnImportFileClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure imgAHDBClick(Sender: TObject);
    procedure hlAHDBWebsiteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgImportTypePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FCallProgram : TCallPrograms;
    FSelectedFile : String;
    FAnimals : TTable;
    FImportType : String;
    procedure DisableControls;
    procedure ImportMilking_Youngstock;
    procedure ImportSireList;
    procedure PartialDisableControls;
    procedure OpenAHDBWebsite;
  public
    { Public declarations }
    class procedure ShowTheForm;
  end;

var
  fmAHDBImport: TfmAHDBImport;

implementation

{$R *.DFM}

procedure TfmAHDBImport.FormCreate(Sender: TObject);
begin
   FCallProgram := TCallPrograms.Create;
   DisableControls;
   pcAHDBImport.ActivePageIndex := tsImportFile.PageIndex;
   FAnimals := TTable.Create(nil);
   FAnimals.DatabaseName := AliasName;
   FAnimals.TableName := 'tmpAnimals';
   FAnimals.FieldDefs.Clear;
   FAnimals.FieldDefs.Add('ID',ftAutoInc);
   FAnimals.FieldDefs.Add('AnimalID',ftInteger);
   FAnimals.FieldDefs.Add('AnimalNo',ftString,10);
   FAnimals.FieldDefs.Add('SearchNatID',ftString,20);
   FAnimals.FieldDefs.Add('Name',ftString,40);
   FAnimals.IndexDefs.Clear;
   FAnimals.IndexDefs.Add('iID','ID',[ixPrimary,ixUnique]);
   FAnimals.IndexDefs.Add('iAnimalID','AnimalID',[ixUnique]);
   FAnimals.CreateTable;
   FAnimals.Open;
end;

class procedure TfmAHDBImport.ShowTheForm;
begin
   with TfmAHDBImport.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAHDBImport.imgAHDBClick(Sender: TObject);
begin
   OpenAHDBWebsite;
end;

procedure TfmAHDBImport.OpenAHDBWebsite;
begin
   FCallProgram.AHDBWebsite;
   rgFileType.Enabled := True;
   DisableControls;
   gbStep2.Enabled := True;
   rgFileType.Enabled := True;
   lStep2.Enabled := True;
end;

procedure TfmAHDBImport.hlAHDBWebsiteClick(Sender: TObject);
begin
   OpenAHDBWebsite;
end;

procedure TfmAHDBImport.rgFileTypePropertiesChange(Sender: TObject);
begin
   btnBrowse.Enabled := ( rgFileType.ItemIndex > -1 );
   lStep3.Enabled := btnBrowse.Enabled;
   rgImportType.Enabled := btnBrowse.Enabled;
   lStep4.Enabled := btnBrowse.Enabled;
   case rgFileType.ItemIndex of
      0 : lStep4.Caption := 'Browse to select downloaded Sire List '+FImportType+' file.';
      1 : lStep4.Caption := 'Browse to select downloaded Youngstock '+FImportType+' file.';
      2 : lStep4.Caption := 'Browse to select downloaded Milking Herd '+FImportType+' file.';
   end;
end;

procedure TfmAHDBImport.DisableControls;
begin
   rgFileType.Enabled := False;
   lStep2.Enabled := False;
   lStep3.Enabled := False;
   rgImportType.Enabled := False;
   lStep4.Enabled := False;
   lSelectedFileName.Visible := False;
   lSelectedFile.Visible := False;
   lStep5.Enabled := False;
   btnImportFile.Enabled := False;
   btnBrowse.Enabled := False;
   FileProgressIndicator.Visible := False;
   rgFileType.ItemIndex := -1;
end;

procedure TfmAHDBImport.PartialDisableControls;
begin
   rgFileType.Enabled := True;
   lStep2.Enabled := True;
   lStep3.Enabled := True;
   rgImportType.Enabled := True;
   lStep4.Enabled := True;
   btnImportFile.Enabled := True;
   lSelectedFileName.Visible := False;
   lSelectedFile.Visible := False;
   lStep5.Enabled := False;
   btnBrowse.Enabled := True;
   FileProgressIndicator.Visible := False;
end;

procedure TfmAHDBImport.btnBrowseClick(Sender: TObject);
begin
   FSelectedFile := '';
   with TOpenDialog.Create(nil) do
      try
         Filter := 'CSV file|*.csv';
         DefaultExt := 'csv';
         InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
         case rgFileType.ItemIndex of
            0 : begin
                   Title := 'Select Sire List file';
                   lStep4.Caption := 'Import the Sire List '+FImportType+' file.'
                end;
            1 : begin
                   Title := 'Select Youngstock file';
                   lStep4.Caption := 'Import the Youngstock '+FImportType+' file.'
                end;
            2 : begin
                   Title := 'Select Milking Herd file';
                   lStep4.Caption := 'Import the Milking Herd '+FImportType+' file.'
                end;
         end;
         Execute;
         FSelectedFile := FileName;
         lSelectedFileName.Visible := ( Length(FSelectedFile) > 0 );
         lSelectedFileName.Caption := FSelectedFile;
         lSelectedFile.Visible := lSelectedFileName.Visible;
         btnImportFile.Enabled := lSelectedFile.Visible;
         lStep5.Enabled := lSelectedFile.Visible;
      finally
         Free;
      end;
end;

procedure TfmAHDBImport.btnImportFileClick(Sender: TObject);
begin
   case rgFileType.ItemIndex of
      0 : ImportSireList;
      1, 2 : ImportMilking_Youngstock;
   end;
end;

procedure TfmAHDBImport.ImportMilking_Youngstock;
var
   Parser : TSPParser;
   i, iAnimalNoPos, iTagNoPos, iValuatPos, iUpdateCount, iNoValueCount, iNotFoundCount : Integer;
   sLine, sMsgAnimalType : String;
   qAnimals, qUpdateAnimal : TQuery;
   slFile, slNoValues, slNotFound : TStringList;

   function LocateAndUpdateAnimal (AAnimalNo, ATagNo : String; AValuation : Double) : Boolean;
   var
      iAnimalID : Integer;
      sFieldName, sTableName : String;
   begin
      Result := False;
      iAnimalID := 0;
      if ( Length(AAnimalNo) <= 0 ) or ( AValuation <= -999 ) then Exit;
      if ( FAnimals.Locate('AnimalNo',AAnimalNo,[loCaseInsensitive]) ) or
         ( FAnimals.Locate('SearchNatID',ATagNo,[loCaseInsensitive]) ) then
         iAnimalID := FAnimals.FieldByName('AnimalID').AsInteger;
      if ( iAnimalID = 0 ) then Exit;

      if ( rgImportType.ItemIndex = 0 ) then
         begin
            sFieldName := 'EBI';
            sTableName := 'CowExt';
         end
      else
         begin
            sFieldName := 'ACI';
            sTableName := 'AnimalsExt';
         end;

      qUpdateAnimal.SQL.Clear;
      qUpdateAnimal.SQL.Add('SELECT *');
      qUpdateAnimal.SQL.Add('FROM '+sTableName);
      qUpdateAnimal.SQL.Add('WHERE AnimalID = :AnimalID');
      qUpdateAnimal.Params[0].AsInteger := iAnimalID;
      qUpdateAnimal.Open;
      if ( qUpdateAnimal.RecordCount > 0 ) then
         begin
            qUpdateAnimal.Close;
            qUpdateAnimal.SQL.Clear;
            qUpdateAnimal.SQL.Add('UPDATE '+sTableName);
            qUpdateAnimal.SQL.Add('SET '+sFieldName+' = :NewValue');
            qUpdateAnimal.SQL.Add('WHERE AnimalID = :iAnimalID');
            qUpdateAnimal.Params[0].AsFloat := AValuation;
            qUpdateAnimal.Params[1].AsInteger := iAnimalID;
            qUpdateAnimal.ExecSQL;
         end
      else
         begin
            qUpdateAnimal.Close;
            qUpdateAnimal.SQL.Clear;
            qUpdateAnimal.SQL.Add('INSERT INTO '+sTableName+' (AnimalID, '+sFieldName+')');
            qUpdateAnimal.SQL.Add('VALUES (:AnimalID, :Valuation)');
            qUpdateAnimal.Params[0].AsInteger := iAnimalID;
            qUpdateAnimal.Params[1].AsFloat := AValuation;
            qUpdateAnimal.ExecSQL;
         end;

      Result := True;
   end;

begin
   Parser := TSPParser.Create(nil);
   slFile := TStringList.Create;
   with slFile do
      try
         LoadFromFile(FSelectedFile);
         if ( Count = 0 ) then
            begin
               MessageDlg('Selected file is empty. Please selected another file.',mtError,[mbOK],0);
               Exit;
            end;
         sLine := Strings[0];
         if ( Length(sLine) = 0 ) then
            begin
               MessageDlg('Unable to locate field positions in header line of selected file.'+cCRLF+
                          'Please select another file.',mtError,[mbOK],0);
               Exit;
            end;
         Parser.SepChar := ',';
         Parser.Parse(sLine);
         if ( Parser.Count = 0 ) then
            begin
               MessageDlg('Unable to locate header line. Please select another file.',mtError,[mbOK],0);
               Exit;
            end;
         for i := 1 to Parser.Count do
            begin
               if ( UpperCase(RemoveQuotationMarks(Parser.Fields[i])) = 'LINE' ) then
                  iAnimalNoPos := i;
               if ( UpperCase(RemoveQuotationMarks(Parser.Fields[i])) = 'IDENTITY' ) then
                  iTagNoPos := i;
               if ( Pos('£'+FImportType,UpperCase(RemoveQuotationMarks(Parser.Fields[i]))) > 0 ) then
                  iValuatPos := i;
               if ( iAnimalNoPos > 0 ) and ( iTagNoPos > 0 ) and ( iValuatPos > 0 ) then
                  Break;
            end;
         if ( iAnimalNoPos = 0 ) or ( iValuatPos = 0 ) then
            begin
               MessageDlg('Unable to locate LineNo and '+FImportType+' positions on file.',mtError,[mbOK],0);
               Exit;
            end;

         slNoValues := TStringList.Create;
         slNotFound := TStringList.Create;

         qAnimals := TQuery.Create(nil);
         try
            qAnimals.DatabaseName := AliasName;
            qAnimals.SQL.Clear;
            qAnimals.SQL.Add('DELETE FROM '+FAnimals.TableName);
            qAnimals.ExecSQL;

            qAnimals.SQL.Clear;
            qAnimals.SQL.Add('INSERT INTO '+FAnimals.TableName+' (AnimalID, AnimalNo, SearchNatID)');
            qAnimals.SQL.Add('SELECT A.ID, A.AnimalNo, A.SearchNatID');
            qAnimals.SQL.Add('FROM Animals A');
            qAnimals.SQL.Add('WHERE A.InHerd = True');
            qAnimals.SQL.Add('AND   A.AnimalDeleted = False');
            qAnimals.SQL.Add('AND   A.HerdID = :DefaultHerdID');
            qAnimals.SQL.Add('AND   Upper(A.Sex) = "FEMALE"');
            qAnimals.Params[0].AsInteger := HerdLookup.DefaultHerdID;
            qAnimals.ExecSQL;
            FAnimals.Close;
            FAnimals.Open;
            FAnimals.First;
            for i := 1 to FAnimals.RecordCount do
               begin
                  FAnimals.RecNo := i;
                  FAnimals.Edit;
                  if ( IsEngNatID(FAnimals.FieldByName('SearchNatID').AsString) ) then
                     FAnimals.FieldByName('SearchNatID').AsString := StripUKPrefixFromNatID(FAnimals.FieldByName('SearchNatID').AsString)
                  else if ( IsNINatID(FAnimals.FieldByName('SearchNatID').AsString) ) then
                     FAnimals.FieldByName('SearchNatID').AsString := StripNIPrefixFromNatID(FAnimals.FieldByName('SearchNatID').AsString)
                  else if ( IsNewIrishNatID(FAnimals.FieldByName('SearchNatID').AsString) ) then
                     FAnimals.FieldByName('SearchNatID').AsString := StripIrishCountryPrefixFromNatID(FAnimals.FieldByName('SearchNatID').AsString);
                  FAnimals.Post;
               end;
            FAnimals.Close;
            FAnimals.Open;
            if ( FAnimals.RecordCount = 0 ) then
               begin
                  MessageDlg('No female animal(s) currently in the herd.',mtError,[mbOK],0);
                  Exit;
               end;

            qUpdateAnimal := TQuery.Create(nil);
            qUpdateAnimal.DatabaseName := AliasName;

            iUpdateCount := 0;
            iNoValueCount := 0;
            iNotFoundCount := 0;

            FileProgressIndicator.Position := 1;
            FileProgressIndicator.Properties.Min := 1;
            FileProgressIndicator.Properties.Max := Count-1;
            FileProgressIndicator.Visible := True;
            Application.ProcessMessages;
            Update;

            case rgFileType.ItemIndex of
               1 : sMsgAnimalType := 'heifer(s)';
               2 : sMsgAnimalType := 'cow(s) and/or heifer(s)';
            end;

            for i := 1 to Count-1 do
               begin
                  sLine := Strings[i];
                  Parser.Parse(sLine);
                  if ( (Length(Parser.Fields[iAnimalNoPos]) > 0) or (Length(Parser.Fields[iTagNoPos]) > 0) ) and
                     ( Length(Parser.Fields[iValuatPos]) > 0 ) then
                     begin
                        if ( StrToFloat(RemoveQuotationMarks(Parser.Fields[iValuatPos])) <= -999 ) then
                           begin
                              Inc(iNoValueCount);
                              if ( slNoValues.Count = 0 ) then
                                 slNoValues.Add('%d %s with no '+FImportType+' values on the AHDB file.'+cCRLF+
                                                '-----------------------------------------------');
                              slNoValues.Add(RemoveQuotationMarks(Parser.Fields[iAnimalNoPos]));
                           end
                        else if ( LocateAndUpdateAnimal(RemoveQuotationMarks(Parser.Fields[iAnimalNoPos]),
                                                        RemoveQuotationMarks(StripAllSpaces(Parser.Fields[iTagNoPos])),
                                                        StrToFloat(RemoveQuotationMarks(Parser.Fields[iValuatPos]))) ) then
                           Inc(iUpdateCount)
                        else
                           begin
                              Inc(iNotFoundCount);
                              if ( slNotFound.Count = 0 ) then
                                 slNotFound.Add('%d %s with '+FImportType+' values on the AHDB file not in Kingswood.'+cCRLF+
                                                '-------------------------------------------------------');
                              slNotFound.Add(RemoveQuotationMarks(Parser.Fields[iAnimalNoPos]));
                           end;
                     end;
                  FileProgressIndicator.Position := FileProgressIndicator.Position + 1;
                  Application.ProcessMessages;
                  Update;
               end;

            FileProgressIndicator.Visible := False;

            mSummary.Lines.Clear;
            mSummary.Lines.Add(Format('%d %s updated.',[iUpdateCount, sMsgAnimalType]));
            if ( iNotFoundCount > 0 ) then
               begin
                  slNotFound.Strings[0] := Format(slNotFound.Strings[0],[iNotFoundCount, sMsgAnimalType]);
                  mSummary.Lines.Add(cCRLF + slNotFound.Text);
               end;
            if ( iNoValueCount > 0 ) then
               begin
                  slNoValues.Strings[0] := Format(slNoValues.Strings[0],[iNoValueCount, sMsgAnimalType]);
                  mSummary.Lines.Add(cCRLF + slNoValues.Text);
               end;
            pcAHDBImport.ActivePageIndex := tsSummary.PageIndex;

         finally
            if ( qAnimals <> nil ) then
               FreeAndNil(qAnimals);
            if ( qUpdateAnimal <> nil ) then
               FreeAndNil(qUpdateAnimal);
            if ( slNoValues <> nil ) then
               FreeAndNil(slNoValues);
            if ( slNotFound <> nil ) then
               FreeAndNil(slNotFound);
         end;
      finally
         Free;
         if ( Parser <> nil ) then
            FreeAndNil(Parser);
      end;
end;

procedure TfmAHDBImport.ImportSireList;
var
   sLine : String;
   Parser : TSPParser;
   i, iBullNamePos, iValuatPos, iUpdateCount, iNoValueCount, iNotFoundCount : Integer;
   qAnimals, qUpdateAnimal : TQuery;
   slNoValues, slNotFound : TStringList;

   function LocateAndUpdateBull ( ABullName : String; AValuation : Double ) : Boolean;
   var
      iAnimalID : Integer;
      sMSG : String;
   begin
      Result := False;
      ABullName := Trim(ABullName);
      if ( Length(ABullName) > 40 ) then
         ABullName := Copy(ABullName,0,40);
      iAnimalID := 0;
      if ( Length(ABullName) = 0 ) or ( AValuation <= 0 ) then Exit;
      if ( FAnimals.Locate('Name',ABullName,[loCaseInsensitive]) ) then
         iAnimalID := FAnimals.FieldByName('AnimalID').AsInteger;
      if ( iAnimalID = 0 ) then Exit;
      qUpdateAnimal.SQL.Clear;
      qUpdateAnimal.SQL.Add('SELECT *');
      qUpdateAnimal.SQL.Add('FROM BullExt');
      qUpdateAnimal.SQL.Add('WHERE AnimalID = :AID');
      qUpdateAnimal.Params[0].AsInteger := iAnimalID;
      qUpdateAnimal.Open;
      if ( rgImportType.ItemIndex = 0 ) then
         begin
            if ( qUpdateAnimal.RecordCount > 0 ) then
               begin
                  qUpdateAnimal.Close;
                  qUpdateAnimal.SQL.Clear;
                  qUpdateAnimal.SQL.Add('UPDATE BullExt');
                  qUpdateAnimal.SQL.Add('SET RBI = :AValuation');
                  qUpdateAnimal.SQL.Add('WHERE AnimalID = :AID');
                  qUpdateAnimal.Params[0].AsFloat := AValuation;
                  qUpdateAnimal.Params[1].AsInteger := iAnimalID;
                  qUpdateAnimal.ExecSQL;
               end
            else
               begin
                  qUpdateAnimal.Close;
                  qUpdateAnimal.SQL.Clear;
                  qUpdateAnimal.SQL.Add('INSERT INTO BullExt (AnimalID, RBI)');
                  qUpdateAnimal.SQL.Add('VALUES (:AnimalID, :Valuation)');
                  qUpdateAnimal.Params[0].AsInteger := iAnimalID;
                  qUpdateAnimal.Params[1].AsFloat := AValuation;
                  qUpdateAnimal.ExecSQL;
               end;
         end
      else
         begin

         end;
      Result := True;
   end;

begin
   with TStringList.Create do
      try
         LoadFromFile(FSelectedFile);
         if ( Count = 0 ) then
            begin
               MessageDlg('Selected file is empty. Please selected another file.',mtError,[mbOK],0);
               Exit;
            end;
         sLine := Strings[0];
         if ( Length(sLine) = 0 ) then
            begin
               MessageDlg('Unable to locate field positions in header line of selected file.'+cCRLF+
                          'Please select another file.',mtError,[mbOK],0);
               Exit;
            end;
         Parser := TSPParser.Create(nil);
         Parser.SepChar := ',';
         Parser.Parse(sLine);
         if ( Parser.Count = 0 ) then
            begin
               MessageDlg('Unable to locate header line. Please select another file.',mtError,[mbOK],0);
               Exit;
            end;
         iBullNamePos := 0;
         iValuatPos := 0;
         for i := 1 to Parser.Count do
            begin
               if ( UpperCase(RemoveQuotationMarks(Parser.Fields[i])) = 'BULL NAME' ) then
                  iBullNamePos := i;
               if ( Pos('£'+FImportType,RemoveQuotationMarks(UpperCase(Parser.Fields[i]))) > 0 ) then
                  iValuatPos := i;
               if ( iBullNamePos > 0 ) and ( iValuatPos > 0 ) then
                  Break;
            end;
         if ( iBullNamePos = 0 ) and ( iValuatPos = 0 ) then
            begin
               MessageDlg('Unable to locate Bull Name and '+FImportType+' positions on file.',mtError,[mbOK],0);
               Exit;
            end;

         qAnimals := TQuery.Create(nil);
         qAnimals.DatabaseName := AliasName;
         qAnimals.SQL.Clear;
         qAnimals.SQL.Add('DELETE FROM '+FAnimals.TableName);
         qAnimals.ExecSQL;
         qAnimals.SQL.Clear;
         qAnimals.SQL.Add('INSERT INTO '+FAnimals.TableName+ '(AnimalID, Name)');
         qAnimals.SQL.Add('SELECT ID, Name');
         qAnimals.SQL.Add('FROM Animals');
         qAnimals.SQL.Add('WHERE Sex = "BULL"');
         qAnimals.SQL.Add('AND   Name IS NOT NULL');
         qAnimals.ExecSQL;
         FAnimals.Close;
         FAnimals.Open;

         qUpdateAnimal := TQuery.Create(nil);
         qUpdateAnimal.DatabaseName := AliasName;

         iUpdateCount := 0;
         iNoValueCount := 0;
         iNotFoundCount := 0;

         FileProgressIndicator.Position := 1;
         FileProgressIndicator.Properties.Min := 1;
         FileProgressIndicator.Properties.Max := Count-1;
         FileProgressIndicator.Visible := True;
         Application.ProcessMessages;
         Update;

         slNoValues := TStringList.Create();
         slNotFound := TStringList.Create();

         for i := 1 to Count-1 do
            begin
               sLine := Strings[i];
               Parser.Parse(sLine);
               if ( StrToFloat(RemoveQuotationMarks(Parser.Fields[iValuatPos])) <= 0 ) then
                  begin
                     Inc(iNoValueCount);
                     if ( slNoValues.Count = 0 ) then
                        slNoValues.Add('%d bull(s) with no '+FImportType+' values on the AHDB file.'+cCRLF+
                                       '-----------------------------------------------');
                     slNoValues.Add(RemoveQuotationMarks(Parser.Fields[iBullNamePos]));
                  end
               else if ( LocateAndUpdateBull(RemoveQuotationMarks(Trim(Parser.Fields[iBullNamePos])),StrToFloat(RemoveQuotationMarks(Parser.Fields[iValuatPos]))) ) then
                  Inc(iUpdateCount)
               else
                  begin
                     Inc(iNotFoundCount);
                     if ( slNotFound.Count = 0 ) then
                        slNotFound.Add('%d bull(s) with '+FImportType+' values on the AHDB file not in Kingswood.'+cCRLF+
                                       '-------------------------------------------------------');
                     slNotFound.Add(RemoveQuotationMarks(Parser.Fields[iBullNamePos]));
                  end;
               FileProgressIndicator.Position := FileProgressIndicator.Position+1;
               Application.ProcessMessages;
               Update;
            end;

            FileProgressIndicator.Visible := False;

            mSummary.Lines.Clear;
            mSummary.Lines.Add(Format('%d bull(s) updated.',[iUpdateCount]));
            if ( iNotFoundCount > 0 ) then
               begin
                  slNotFound.Strings[0] := Format(slNotFound.Strings[0],[iNotFoundCount]);
                  mSummary.Lines.Add(cCRLF + slNotFound.Text);
               end;
            if ( iNoValueCount > 0 ) then
               begin
                  slNoValues.Strings[0] := Format(slNoValues.Strings[0],[iNoValueCount]);
                  mSummary.Lines.Add(cCRLF + slNoValues.Text);
               end;
            pcAHDBImport.ActivePageIndex := tsSummary.PageIndex;

      finally
         if ( Parser <> nil ) then
            FreeAndNil(Parser);
         if ( qAnimals <> nil ) then
            FreeAndNil(qAnimals);
         if ( qUpdateAnimal <> nil ) then
            FreeAndNil(qUpdateAnimal);
         if ( slNoValues <> nil ) then
            FreeAndNIl(slNoValues);
         if ( slNotFound <> nil ) then
            FreeAndNil(slNotFound);
         Free;
      end;
end;

procedure TfmAHDBImport.btnBackClick(Sender: TObject);
begin
   pcAHDBImport.ActivePageIndex := tsImportFile.PageIndex;
   PartialDisableControls;
end;

procedure TfmAHDBImport.btnExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmAHDBImport.FormDestroy(Sender: TObject);
begin
   if ( FCallProgram <> nil ) then
      FreeAndNil(FCallProgram);
   if ( FAnimals <> nil ) then
      begin
         FAnimals.Close;
         FAnimals.DeleteTable;
         FreeAndNil(FAnimals);
      end;
end;

procedure TfmAHDBImport.FormActivate(Sender: TObject);
begin
   rgImportType.ItemIndex := 0;
end;

procedure TfmAHDBImport.rgImportTypePropertiesChange(Sender: TObject);
begin
   if ( rgImportType.ItemIndex = 0 ) then
      FImportType := 'SCI'
   else
      FImportType := 'ACI';
   lStep5.Caption := 'Import the '+FImportType+' file.';
   rgFileTypePropertiesChange(Sender);   
end;

end.
