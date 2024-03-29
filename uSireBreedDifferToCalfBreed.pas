{
   06/03/15 [V5.4 R1.8] /MK Bug Fix - Take check out for in use breeds.

   11/03/15 [V5.4 R1.9] /MK Additional Feature - Should be checking for English herd registered flag i.e. CTSReg not Notified.

   23/03/15 [V5.4 R2.0] /MK Bug Fix - CheckAnimals - Allowed for 3/4 length breed code for English herds using BRB/BRBX - Dale Farms.

   25/03/15 [V5.4 R2.1] /MK Bug Fix - CheckAnimals - Going through loop without next.

   06/10/15 [V5.4 R9.5] /MK Bug Fix - CheckAnimals - Allow for HO and FR breeds to match.
}

unit uSireBreedDifferToCalfBreed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxEdit, cxLabel, ExtCtrls, dxBar, dxBarExtItems, ActnList,
  dxStatusBar, db, dbTables, GenTypesConst, KDBRoutines, uHerdLookup,
  cxDBEdit, cxDBLookupComboBox, cxDropDownEdit, cxLookupDBGrid, EventRecording, DairyData,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, StdCtrls, cxButtons;

type
  TfmSireBreedDifferToCalfBreed = class(TfmBaseForm)
    pInfo: TPanel;
    lInfo: TcxLabel;
    AnimalGridDBTableView: TcxGridDBTableView;
    AnimalGridLevel: TcxGridLevel;
    AnimalGrid: TcxGrid;
    AnimalGridDBTableViewCalfNumber: TcxGridDBColumn;
    AnimalGridDBTableViewCalfNatID: TcxGridDBColumn;
    AnimalGridDBTableViewCalfSireCode: TcxGridDBColumn;
    AnimalGridDBTableViewDateOfBirth: TcxGridDBColumn;
    AnimalGridDBTableViewCalfBreed: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    AnimalGridDBTableViewSireBreed: TcxGridDBColumn;
    pFixCalves: TPanel;
    lChangeSireBreed: TcxLabel;
    lcmboBreeds: TcxLookupComboBox;
    btnUpdate: TcxButton;
    actUpdate: TAction;
    AnimalGridDBTableViewSireID: TcxGridDBColumn;
    Panel1: TPanel;
    lInfo2: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure AnimalGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure lcmboBreedsPropertiesChange(Sender: TObject);
  private
    FTempAnimals : TTable;
    FDSTempAnimals,
    FDSTempBreeds : TDataSource;
    FQTempBreeds : TQuery;
    FCountry : TCountry;
    procedure CheckAnimals;
    procedure FTempAnimalsAfterDelete(DataSet: TDataSet);
    { Private declarations }
  public
    class function GetCalves : Integer;
    { Public declarations }
  end;

var
  fmSireBreedDifferToCalfBreed: TfmSireBreedDifferToCalfBreed;

implementation

{$R *.DFM}

{ TfmCalvesNoSires }

class function TfmSireBreedDifferToCalfBreed.GetCalves : Integer;
var
   i : Integer;
   sCalfBreedCode : String;
begin
   with TfmSireBreedDifferToCalfBreed.Create(nil) do
      try
         Result := 0;
         with GetQuery do
            try
               for i := 1 to cMaxCalves do
                  begin
                     SQL.Clear;
                     SQL.Add('SELECT DefaultHerdID');
                     SQL.Add('FROM Defaults');
                     try
                        Open;
                        FCountry := HerdLookup.CountryByHerdID(Fields[0].AsInteger);
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;

                     Close;
                     SQL.Clear;
                     SQL.Add('INSERT INTO '+FTempAnimals.TableName+' (AnimalID, AnimalNo, SortAnimalNo, NatIDNum,');
                     SQL.Add('                                        SortNatID, DateOfBirth, BreedCode,');
                     SQL.Add('                                        SireID, SireNo, SireBreedID, SireBreedCode)');
                     SQL.Add('SELECT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum,');
                     SQL.Add('	     A.SortNatID, A.DateOfBirth, B.Code CalfBreedCode,');
                     SQL.Add('	     S.ID, S.AnimalNo SireCode, S.PrimaryBreed SireBreedID, SB.Code SireBreedCode');
                     SQL.Add('FROM Animals A');
                     SQL.Add('LEFT JOIN Animals S ON (S.ID = A.SireID)');
                     SQL.Add('LEFT JOIN Breeds B On (B.ID = A.PrimaryBreed)');
                     SQL.Add('LEFT JOIN Breeds SB ON (SB.ID = S.PrimaryBreed)');
                     SQL.Add('WHERE (A.DateOfBirth >= "'+FormatDateTime(cUSDateStyle,IncMonth(Date,-cCheckCalvesForThreeMonth))+'")');
                     SQL.Add('AND   (A.NatIDNum IS NOT NULL)');
                     SQL.Add('AND   (A.ID IN (SELECT C.ID'+IntToStr(i)+'');
                     SQL.Add('                FROM Calvings C');
                     //   11/03/15 [V5.4 R1.9] /MK Additional Feature - Should be checking for English herd registered flag i.e. CTSReg not Notified.
                     if ( FCountry = England ) then
                        SQL.Add('                WHERE C.ID'+IntToStr(i)+'CTSReg = False))')
                     else
                        SQL.Add('                WHERE C.ID'+IntToStr(i)+'Notified = False))');
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  end;
            finally
               Free;
            end;
         CheckAnimals;
         if ( FTempAnimals.RecordCount > 0 ) then
            begin
               with lcmboBreeds.Properties do
                  begin
                     ListSource := FDSTempBreeds;
                     ListFieldNames := 'Code;Name';
                     KeyFieldNames := 'ID';
                     DropDownAutoSize := True;
                     DropDownListStyle := lsFixedList;
                     for i := 0 to ListColumns.Count-1 do
                        case i of
                           0 : begin
                                  ListColumns[i].Caption := 'Code';
                                  ListColumns[i].Width := 50;
                               end;
                           1 : begin
                                  ListColumns[i].Caption := 'Name';
                                  ListColumns[i].Width := 100;
                               end;
                        end;
                  end;
               AnimalGridDBTableView.DataController.DataSource := FDSTempAnimals;
               ShowModal;
            end;
      finally
         Result := FTempAnimals.RecordCount;
         Free;
      end;
end;

procedure TfmSireBreedDifferToCalfBreed.FormCreate(Sender: TObject);
begin
   inherited;
   FTempAnimals := TTable.Create(nil);
   with FTempAnimals do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpSireBreedDiffersToCalfBreed';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('AnimalID',ftInteger);
         FieldDefs.Add('AnimalNo',ftString,10);
         FieldDefs.Add('SortAnimalNo',ftString,10);
         FieldDefs.Add('NatIDNum',ftString,20);
         FieldDefs.Add('SortNatID',ftString,20);
         FieldDefs.Add('DateOfBirth',ftDate);
         FieldDefs.Add('BreedCode',ftString,6);
         FieldDefs.Add('SireID',ftInteger);
         FieldDefs.Add('SireNo',ftString,10);
         FieldDefs.Add('SireBreedID',ftInteger);
         FieldDefs.Add('SireBreedCode',ftString,6);
         CreateTable;
         AfterDelete := FTempAnimalsAfterDelete;
      end;

   FDSTempAnimals := TDataSource.Create(nil);
   FDSTempAnimals.DataSet := FTempAnimals;

   FQTempBreeds := TQuery.Create(nil);
   with FQTempBreeds do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, Code, Name');
         SQL.Add('FROM Breeds');
         SQL.Add('ORDER BY Name');
         try
            Open;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         if ( FDSTempBreeds = nil ) then
            FDSTempBreeds := TDataSource.Create(nil);
         FDSTempBreeds.DataSet := FQTempBreeds;
      end;
end;

procedure TfmSireBreedDifferToCalfBreed.CheckAnimals;
var
   sSireBreedCode : String;
begin
   FTempAnimals.Close;
   FTempAnimals.Open;
   FTempAnimals.First;
   while ( not(FTempAnimals.Eof) ) do
      begin
         sSireBreedCode := '';
         if ( FQTempBreeds.Locate('ID',FTempAnimals.FieldByName('SireBreedID').AsInteger,[]) ) then
            sSireBreedCode := FQTempBreeds.FieldByName('Code').AsString;
         if ( sSireBreedCode = '' ) then
            FTempAnimals.Next;
         if ( Length(sSireBreedCode) = 3 ) then
            begin
               //   23/03/15 [V5.4 R2.0] /MK Bug Fix - Allowed for 3/4 length breed code for English herds using BRB/BRBX - Dale Farms.
               if ( Length(FTempAnimals.FieldByName('BreedCode').AsString) = 3 ) then
                  begin
                     if ( sSireBreedCode = FTempAnimals.FieldByName('BreedCode').AsString ) then
                        FTempAnimals.Delete
                     else
                        FTempAnimals.Next;
                  end
               else if ( Length(FTempAnimals.FieldByName('BreedCode').AsString) = 4 ) then
                  begin
                     if ( sSireBreedCode+'X' = FTempAnimals.FieldByName('BreedCode').AsString ) then
                        FTempAnimals.Delete
                     else
                        FTempAnimals.Next;
                  end
               //   25/03/15 [V5.4 R2.1] /MK Bug Fix - Going through loop without next.
               else
                  FTempAnimals.Next;
            end
         else if ( Length(sSireBreedCode) = 2 ) then
            begin
               //   06/10/15 [V5.4 R9.5] /MK Bug Fix - Allow for HO and FR breeds to match.
               if ( Length(FTempAnimals.FieldByName('BreedCode').AsString) = 2 ) then
                  begin
                     if ( sSireBreedCode = FTempAnimals.FieldByName('BreedCode').AsString ) or
                        ( (UpperCase(sSireBreedCode) = 'HO') and (UpperCase(FTempAnimals.FieldByName('BreedCode').AsString) = 'FR') ) or
                        ( (UpperCase(sSireBreedCode) = 'FR') and (UpperCase(FTempAnimals.FieldByName('BreedCode').AsString) = 'HO') ) then
                        FTempAnimals.Delete
                     else
                        FTempAnimals.Next;
                  end
               else if ( Length(FTempAnimals.FieldByName('BreedCode').AsString) = 3 ) then
                  begin
                     if ( sSireBreedCode+'X' = FTempAnimals.FieldByName('BreedCode').AsString ) or
                        ( (UpperCase(sSireBreedCode+'X') = 'HOX') and (UpperCase(FTempAnimals.FieldByName('BreedCode').AsString) = 'FRX') ) or
                        ( (UpperCase(sSireBreedCode+'X') = 'FRX') and (UpperCase(FTempAnimals.FieldByName('BreedCode').AsString) = 'HOX') ) then
                        FTempAnimals.Delete
                     else
                        FTempAnimals.Next;
                  end
               else
                  FTempAnimals.Next;
            end
         else
            FTempAnimals.Next;
      end;
   FTempAnimals.Close;
   FTempAnimals.Open;
end;

procedure TfmSireBreedDifferToCalfBreed.actUpdateExecute(Sender: TObject);
var
   Value : Variant;
begin
   inherited;
   with AnimalGridDBTableView.DataController do
      begin
         Value := Values[FocusedRecordIndex, GetItemByFieldName('SireID').Index];
         if ( not(VarIsNull(Value)) ) then
            begin
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add('UPDATE '+FTempAnimals.TableName+'');
                     SQL.Add('SET SireBreedID = '+IntToStr(lcmboBreeds.EditValue)+', SireBreedCode = "'+lcmboBreeds.Text+'"');
                     SQL.Add('WHERE SireID = '+VarToStr(Value)+'');
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;

                     SQL.Clear;
                     SQL.Add('UPDATE Animals');
                     SQL.Add('SET PrimaryBreed = '+IntToStr(lcmboBreeds.EditValue)+'');
                     SQL.Add('WHERE ID = '+VarToStr(Value)+'');
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  finally
                     Free;
                  end;
               CheckAnimals;
            end;
      end;
end;

procedure TfmSireBreedDifferToCalfBreed.lcmboBreedsPropertiesChange(
  Sender: TObject);
begin
   inherited;
   lcmboBreeds.PostEditValue;
   actUpdate.Enabled := ( lcmboBreeds.EditValue > 0 );
end;

procedure TfmSireBreedDifferToCalfBreed.AnimalGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   inherited;
   lcmboBreeds.EditValue := 0;
   actUpdate.Enabled := False;
end;

procedure TfmSireBreedDifferToCalfBreed.FTempAnimalsAfterDelete(DataSet: TDataSet);
begin
   lcmboBreeds.Enabled := ( FTempAnimals.RecordCount > 0 );
end;

procedure TfmSireBreedDifferToCalfBreed.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FTempAnimals <> nil ) then
      begin
         if FTempAnimals.Active then
            FTempAnimals.Active := False;
         FTempAnimals.DeleteTable;
         FreeAndNil(FTempAnimals);
      end;
   if ( FDSTempAnimals <> nil ) then
      FreeAndNil(FDSTempAnimals);
   if ( FQTempBreeds <> nil ) then
      begin
         if ( FQTempBreeds.Active ) then
            FQTempBreeds.Active := False;
         FreeAndNil(FQTempBreeds);
      end;
   if ( FDSTempBreeds <> nil ) then
      FreeAndNil(FDSTempBreeds);
end;

end.
