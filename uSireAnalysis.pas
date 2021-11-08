{
   01/06/18 [V5.8 R0.4] /MK Change - Changed width columns on Sire Grid to allow neat printing.
                                   - Removed filter bar from report and added it to header of report.
                            Bug Fix - Footer was not on Calf Grid printout.

   03/07/18 [V5.8 R0.6] /MK Bug Fix - Initial query to find calves that have a weighing record was only
                                      reporting on calves that had 2 weighing events or more. This would not bring in
                                      calves that were only weighed once after their intial birth or purchase weight.
                                      Replaced initial query with general query for calves that have a sire.
                                      ProcessCalfTable then gets first and last weighing information.
                                      If there is no weight gain then delete the calf from the temp calf table.

   16/07/18 [V5.8 R1.0] /MK Additional Feature - Added Cold Dead Weight and Grade to calf grid - Derek Deane.
                                               - Seperate General Animal Info and Sales/Death details with seperator columns coloured by a new style.

   25/07/18 [V5.8 R1.3] /MK Change - Added average footer under ColdDeadWeight field - Derek Deane.

   21/08/18 [V5.8 R2.5] /MK Additional Feature - Added Live Weight and Kill Out % columns and fields to the Calf Grid - GL/Derek Deane.
                                               - Added averages to the footer for these new columns/fields.
                            Change - Changed the Sale/Death Date to Sales Date as only sold animals are included.
                                   - ProcessCalfTable - Exclude calves that have died - GL.

   22/08/18 [V5.8 R2.5] /MK Change - ProcessCalfTable - Added query to get calves in FCalfTable's birth weight.
                                                      - Added query to get weighing events of calves in FCalfTable after birth weight.
                                                      - If no records in either of these queries then there is no data for the report, give a message
                                                        stating that there are no records and close the report.
                                                      - Removed WinData.FEventDataHelper.GetAnimal_First_Last_WeighingRecord from this report as it was
                                                        taking too long. Instead find this information from birth and recent weighing queries. Animals final
                                                        weight can be found in the recent weighings if the animals is still alive or in the qMovementsInfo query.
                                   - In the average footers for the live weight, dead weight and kill out, only add get average based on animals
                                     that have a values in the fields that the footer is based on.

   17/06/21 [V6.0 R1.4] /MK Bug Fix - ProcessCalfTable - When filtering the qWeighInfo query clear the filter after using the data. 
}

unit uSireAnalysis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxPSCore, dxPScxCommon,
  dxPScxGridLnk, db, dbTables, GenTypesConst, cxContainer, cxEdit, cxLabel,
  ExtCtrls, KDBRoutines, uHerdLookup, uEventDataHelper, uProgressIndicator,
  cxStyles, cxGridBandedTableView, cxGridDBBandedTableView, cxCheckBox,
  DairyData, cxCustomData;

type
  TfmSireAnalysis = class(TfmBaseForm)
    blbPrint: TdxBarLargeButton;
    cpPrintGrid: TdxComponentPrinter;
    SireGrid: TcxGrid;
    SireGridLevel: TcxGridLevel;
    CalfGrid: TcxGrid;
    CalfGridLevel: TcxGridLevel;
    SireGridDBBandedTableView: TcxGridDBBandedTableView;
    CalfGridDBBandedTableView: TcxGridDBBandedTableView;
    StyleRepository: TcxStyleRepository;
    BandStyle: TcxStyle;
    SireGridDBBandedTableViewSireNo: TcxGridDBBandedColumn;
    SireGridDBBandedTableViewSortSireNo: TcxGridDBBandedColumn;
    SireGridDBBandedTableViewAvgCalfWeighGain: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewCalfNo: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewSortCalfNo: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewCalfNatID: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewSortCalfNatID: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewDateOfBirth: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewSex: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewBreed: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewAvgWeighGain: TcxGridDBBandedColumn;
    pglSireGrid: TdxGridReportLink;
    GridStyle: TcxStyle;
    CalfGridDBBandedTableViewSaleDate: TcxGridDBBandedColumn;
    actPrintSireGrid: TAction;
    actPrintCalfGrid: TAction;
    pglCalfGrid: TdxGridReportLink;
    pmPrintGrid: TdxBarPopupMenu;
    blbPrintSireGrid: TdxBarLargeButton;
    blbPrintCalfGrid: TdxBarLargeButton;
    actPrint: TAction;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    pFavourite: TPanel;
    cbFavourite: TcxCheckBox;
    SireGridDBBandedTableViewCalfCount: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewColdDeadWt: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewGrade: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewADetailSep: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewSaleInfoSep: TcxGridDBBandedColumn;
    SepStyle: TcxStyle;
    CalfGridDBBandedTableViewLiveWeight: TcxGridDBBandedColumn;
    CalfGridDBBandedTableViewKillOut: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SireGridDBBandedTableViewSortSireNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure CalfGridDBBandedTableViewSortCalfNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure CalfGridDBBandedTableViewSortCalfNatIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure SireGridDBBandedTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure actPrintSireGridExecute(Sender: TObject);
    procedure actPrintCalfGridExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetColdDeadWtFooterText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure GetSaleWeightFooterText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure GetKillOutFooterText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure FormActivate(Sender: TObject);
    procedure CalfGridDBBandedTableViewDataControllerFilterChanged(
      Sender: TObject);
  private
    { Private declarations }
    FSireTable,
    FCalfTable : TTable;
    FSireDataSource,
    FCalfDataSource : TDataSource;
    FQuery : TQuery;
    FEventDataHelper : TEventDataHelper;
    FCalfSexFilterActive : Boolean;
    FCalfBreedFilterActive : Boolean;
    FYearToCalcFrom : Integer;
    procedure ProcessCalfTable;
    procedure DisplayColumnText(AColumn : TcxGridDBBandedColumn; ARecord: TcxCustomGridRecord; var AText : String);
    procedure GetSiresCalfInfo;
    function CalfGridFloatFieldAvgValue(AFieldName: String): Double;
  public
    { Public declarations }
    class procedure ShowTheForm(AYearToCalcFrom : Integer);
  end;

var
  fmSireAnalysis: TfmSireAnalysis;

implementation

{$R *.DFM}

{ TfmSireAnalysis }

class procedure TfmSireAnalysis.ShowTheForm(AYearToCalcFrom : Integer);
begin
   with TfmSireAnalysis.Create(nil) do
      try
         FYearToCalcFrom := AYearToCalcFrom;
         FQuery.Close;
         FQuery.SQL.Clear;
         FQuery.SQL.Add('SELECT ID, DateOfBirth, InHerd');
         FQuery.SQL.Add('FROM Animals');
         FQuery.SQL.Add('WHERE SireID > 0');
         FQuery.SQL.Add('AND   DateOfBirth >= "01/01/'+IntToStr(FYearToCalcFrom)+'"');
         FQuery.Open;
         if ( FQuery.RecordCount = 0 ) then
            begin
               MessageDlg('There are no calves born since the year selected.',mtError,[mbOK],0);
               Exit;
            end
         else
            ShowModal;
      finally
         Free;
      end;
end;

procedure TfmSireAnalysis.FormCreate(Sender: TObject);
begin
   inherited;
   FQuery := TQuery.Create(nil);
   FQuery.DatabaseName := AliasName;

   FEventDataHelper := TEventDataHelper.Create();

   FCalfTable := TTable.Create(nil);
   with FCalfTable do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpCalfAnalysis';
         FieldDefs.Clear;
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('SireID',ftInteger);
         FieldDefs.Add('CalfID',ftInteger);
         FieldDefs.Add('CalfNo',ftString,10);
         FieldDefs.Add('SortCalfNo',ftString,10);
         FieldDefs.Add('CalfNatID',ftString,20);
         FieldDefs.Add('SortCalfNatID',ftString,20);
         FieldDefs.Add('DateOfBirth',ftDateTime);
         FieldDefs.Add('Sex',ftString,10);
         FieldDefs.Add('BreedCode',ftString,3);
         FieldDefs.Add('FirstWeighDate',ftDateTime);
         FieldDefs.Add('FirstWeight',ftFloat);
         FieldDefs.Add('LastWeighDate',ftDateTime);
         FieldDefs.Add('LastWeight',ftFloat);
         FieldDefs.Add('SaleDate',ftDateTime);
         FieldDefs.Add('SaleWeight',ftFloat);
         FieldDefs.Add('ColdDeadWt',ftFloat);
         FieldDefs.Add('KillOut',ftFloat);
         FieldDefs.Add('Grade',ftString,10);
         FieldDefs.Add('AvgWeighGain',ftFloat);
         FieldDefs.Add('InHerd',ftBoolean);
         IndexDefs.Clear;
         IndexDefs.Add('iId','Id',[ixPrimary, ixUnique]);
         IndexDefs.Add('iSireID','SireID',[ixCaseInsensitive]);
         IndexDefs.Add('iCalfID','CalfID',[ixUnique, ixCaseInsensitive]);
         CreateTable;
         Open;
      end;

   FSireTable := TTable.Create(nil);
   with FSireTable do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpSireAnalysis';
         FieldDefs.Clear;
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('SireID',ftInteger);
         FieldDefs.Add('SireNo',ftString,10);
         FieldDefs.Add('SortSireNo',ftString,10);
         FieldDefs.Add('CalfCount',ftInteger);
         FieldDefs.Add('AvgCalfWeighGain',ftFloat);
         IndexDefs.Clear;
         IndexDefs.Add('iId','Id',[ixPrimary, ixUnique]);
         IndexDefs.Add('iSireID','SireID',[ixUnique, ixCaseInsensitive]);
         IndexDefs.Add('iSireNo','SireNo',[ixCaseInsensitive]);
         CreateTable;
         Open;
      end;

   FSireDataSource := TDataSource.Create(nil);
   FSireDataSource.DataSet := FSireTable;

   SireGridDBBandedTableView.DataController.DataSource := nil;
   SireGridDBBandedTableView.DataController.DataSource := FSireDataSource;

   FCalfDataSource := TDataSource.Create(nil);
   FCalfDataSource.DataSet := FCalfTable;

   CalfGridDBBandedTableView.DataController.DataSource := nil;

   FCalfSexFilterActive := False;
   FCalfBreedFilterActive := False;
end;

procedure TfmSireAnalysis.ProcessCalfTable;
var
   i,
   iSiresCalfCount : Integer;
   fSumSireCalvesWeighGain,
   fAvgSireCalvesWeighGain : Double;
   vCalfAnimalNo,
   vCalfSortAnimalNo,
   vCalfNatID,
   vCalfSortNatID,
   vDateOfBirth,
   vSex,
   vBreedCode,
   vSireID : Variant;
   iDays : Integer;
   fGain : Double;

   qBirthWeighInfo,
   qWeighInfo,
   qMovementsInfo : TQuery;

begin
   try
      Screen.Cursor := crHourGlass;

      SireGridDBBandedTableView.OnFocusedRecordChanged := nil;

      try
         FQuery.Close;
         FQuery.SQL.Text := 'INSERT INTO '+FCalfTable.TableName+' (CalfID, DateOfBirth, InHerd) '+
                            FQuery.SQL.Text;
         FQuery.ExecSQL;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;

      FCalfTable.Close;
      FCalfTable.Open;

      qBirthWeighInfo := TQuery.Create(nil);
      qBirthWeighInfo.DatabaseName := AliasName;

      // Get all birth weights for calves in FCalfTable.
      qBirthWeighInfo.SQL.Clear;
      qBirthWeighInfo.SQL.Add('SELECT C.CalfID, C.DateOfBirth, A.BirthWeight, E.EventDate, W.Weight');
      qBirthWeighInfo.SQL.Add('FROM '+FCalfTable.TableName+' C');
      qBirthWeighInfo.SQL.Add('LEFT JOIN Animals A ON (A.ID = C.CalfID)');
      qBirthWeighInfo.SQL.Add('LEFT JOIN Events E ON (E.AnimalID = C.CalfID)');
      qBirthWeighInfo.SQL.Add('LEFT JOIN Weights W On (W.EventID = E.ID)');
      qBirthWeighInfo.SQL.Add('WHERE E.EventType = :Weighing');
      qBirthWeighInfo.SQL.Add('AND   E.EventDate = A.DateOfBirth');
      qBirthWeighInfo.Params[0].AsInteger := CWeightEvent;
      qBirthWeighInfo.Open;

      qWeighInfo := TQuery.Create(nil);
      qWeighInfo.DatabaseName := AliasName;

      // Get all weighing events after the birth weight for calves in FCalfTable.
      qWeighInfo.SQL.Add('SELECT C.CalfID, C.DateOfBirth, E.EventDate WeighDate, W.Weight');
      qWeighInfo.SQL.Add('FROM '+FCalfTable.TableName+' C');
      qWeighInfo.SQL.Add('LEFT JOIN Events E ON (E.AnimalID = C.CalfID)');
      qWeighInfo.SQL.Add('LEFT JOIN Weights W On (W.EventID = E.ID)');
      qWeighInfo.SQL.Add('WHERE E.EventType = :Weighing');
      qWeighInfo.SQL.Add('AND   E.EventDate > C.DateOfBirth');
      qWeighInfo.SQL.Add('AND   ( W.Weight IS NOT NULL ) AND ( W.Weight > 0 )');
      qWeighInfo.SQL.Add('ORDER BY C.CalfID, E.EventDate DESC');
      qWeighInfo.Params[0].AsInteger := CWeightEvent;
      qWeighInfo.Open;

      // If no weighing records found then the report does not have any data, exit and shut down the form.
      if ( qBirthWeighInfo.RecordCount = 0 ) or ( qWeighInfo.RecordCount = 0 ) then
         begin
            MessageDlg('No data available to display the report.',mtError,[mbOK],0);
            Exit;
         end;

      qMovementsInfo := TQuery.Create(nil);
      qMovementsInfo.DatabaseName := AliasName;

      // Get all sale information for calves in FCalfTable.
      qMovementsInfo.SQL.Clear;
      qMovementsInfo.SQL.Add('SELECT A.CalfID, E.EventDate, S.Weight, S.Weight, S.Weight, S.KillOut, S.ColdDeadWt, S.Grade, S.Sold, S.PreSale');
      qMovementsInfo.SQL.Add('FROM '+FCalfTable.TableName+' A');
      qMovementsInfo.SQL.Add('LEFT JOIN Events E On (A.CalfID = E.AnimalID)');
      qMovementsInfo.SQL.Add('LEFT JOIN SalesDeaths S On (S.EventID = E.ID)');
      qMovementsInfo.SQL.Add('WHERE E.EventType = :SaleEvent');
      qMovementsInfo.SQL.Add('AND   A.InHerd = False');
      qMovementsInfo.SQL.Add('AND   S.Sold = True');
      qMovementsInfo.SQL.Add('AND   S.PreSale = False');
      qMovementsInfo.Params[0].AsInteger := CSaleDeathEvent;
      qMovementsInfo.Open;

      ShowProgressIndicator('Gathering Calves',1,FCalfTable.RecordCount,1);
      ProgressIndicator.Max := FCalfTable.RecordCount;
      Application.ProcessMessages;
      Update;

      FCalfTable.First;
      for i := 1 to FCalfTable.RecordCount do
         begin
            FCalfTable.RecNo := i;

            // If the calf in FCalfTable does not have any birth or recent weighings then ignore this calf.
            if ( qBirthWeighInfo.Locate('CalfID',FCalfTable.FieldByName('CalfID').AsInteger,[]) ) or
               ( qWeighInfo.Locate('CalfID',FCalfTable.FieldByName('CalfID').AsInteger,[]) ) then
               try
                  FCalfTable.Edit;
                  vSireID := GetAnimalInfo(FCalfTable.FieldByName('CalfID').AsInteger,'SireID');
                  vCalfAnimalNo := GetAnimalInfo(FCalfTable.FieldByName('CalfID').AsInteger,'AnimalNo');
                  vCalfSortAnimalNo := GetAnimalInfo(FCalfTable.FieldByName('CalfID').AsInteger,'SortAnimalNo');
                  vCalfNatID := GetAnimalInfo(FCalfTable.FieldByName('CalfID').AsInteger,'NatIDNum');
                  vCalfSortNatID := GetAnimalInfo(FCalfTable.FieldByName('CalfID').AsInteger,'SortNatID');
                  vDateOfBirth := GetAnimalInfo(FCalfTable.FieldByName('CalfID').AsInteger,'DateOfBirth');
                  vSex := GetAnimalInfo(FCalfTable.FieldByName('CalfID').AsInteger,'Sex');
                  vBreedCode := GetAnimalInfo(FCalfTable.FieldByName('CalfID').AsInteger,'PrimaryBreed');

                  if ( vSireID <> Null ) then
                     FCalfTable.FieldByName('SireID').AsString := vSireID;
                  if ( vCalfAnimalNo <> Null ) then
                     FCalfTable.FieldByName('CalfNo').AsString := vCalfAnimalNo;
                  if ( vCalfSortAnimalNo <> Null ) then
                     FCalfTable.FieldByName('SortCalfNo').AsString := vCalfSortAnimalNo;
                  if ( vCalfNatID <> Null ) then
                     FCalfTable.FieldByName('CalfNatID').AsString := vCalfNatID;
                  if ( vCalfSortNatID <> Null ) then
                     FCalfTable.FieldByName('SortCalfNatID').AsString := vCalfSortNatID;
                  if ( vDateOfBirth <> Null ) then
                     FCalfTable.FieldByName('DateOfBirth').AsDateTime := vDateOfBirth;
                  if ( vSex <> Null ) then
                     FCalfTable.FieldByName('Sex').AsString := vSex;
                  if ( vBreedCode <> Null ) then
                     FCalfTable.FieldByName('BreedCode').AsString := HerdLookup.BreedDetailsByID(vBreedCode,'Code');

                  // Assign first weight date and weight as birth weight.
                  FCalfTable.FieldByName('FirstWeighDate').AsDateTime := qBirthWeighInfo.FieldByName('DateOfBirth').AsFloat;
                  if ( qBirthWeighInfo.FieldByName('BirthWeight').AsFloat > 0 ) then
                     FCalfTable.FieldByName('FirstWeight').AsFloat := qBirthWeighInfo.FieldByName('BirthWeight').AsFloat
                  else if ( qBirthWeighInfo.FieldByName('Weight').AsFloat > 0 ) then
                     FCalfTable.FieldByName('FirstWeight').AsFloat := qBirthWeighInfo.FieldByName('Weight').AsFloat;

                  // If first weight was not assigned from birth weight then assign first weight as first weighing event after birth weight.
                  if ( FCalfTable.FieldByName('FirstWeight').AsFloat = 0 ) then
                     begin
                        qWeighInfo.Filter := '';
                        qWeighInfo.Filtered := False;
                        qWeighInfo.Filter := 'CalfID = '+IntToStr(FCalfTable.FieldByName('CalfID').AsInteger);
                        qWeighInfo.Filtered := True;
                        qWeighInfo.FindLast;
                        FCalfTable.FieldByName('FirstWeighDate').AsDateTime := qWeighInfo.FieldByName('WeighDate').AsFloat;
                        FCalfTable.FieldByName('FirstWeight').AsFloat := qWeighInfo.FieldByName('Weight').AsFloat;
                        qWeighInfo.Filter := '';
                        qWeighInfo.Filtered := False;
                     end;

                  // If the calf is in herd then locate its last weighing event and assign this as the last weight.
                  if ( FCalfTable.FieldByName('InHerd').AsBoolean ) then
                     begin
                        qWeighInfo.Filter := '';
                        qWeighInfo.Filtered := False;
                        qWeighInfo.Filter := 'CalfID = '+IntToStr(FCalfTable.FieldByName('CalfID').AsInteger);
                        qWeighInfo.Filtered := True;
                        qWeighInfo.FindFirst;
                        FCalfTable.FieldByName('LastWeighDate').AsDateTime := qWeighInfo.FieldByName('WeighDate').AsFloat;
                        FCalfTable.FieldByName('LastWeight').AsFloat := qWeighInfo.FieldByName('Weight').AsFloat;
                        qWeighInfo.Filter := '';
                        qWeighInfo.Filtered := False;
                     end
                  // If the calf is NOT in herd then assign its last weight as the sale weight.
                  else
                     begin
                        if ( qMovementsInfo.Locate('CalfID',FCalfTable.FieldByName('CalfID').AsInteger,[]) ) then
                           begin
                              FCalfTable.FieldByName('SaleDate').AsDateTime := qMovementsInfo.FieldByName('EventDate').AsDateTime;
                              if ( qMovementsInfo.FieldByName('Weight').AsFloat > 0 ) then
                                 FCalfTable.FieldByName('SaleWeight').AsFloat := qMovementsInfo.FieldByName('Weight').AsFloat;
                              if ( qMovementsInfo.FieldByName('ColdDeadWt').AsFloat > 0 ) then
                                 FCalfTable.FieldByName('ColdDeadWt').AsFloat := qMovementsInfo.FieldByName('ColdDeadWt').AsFloat;
                              if ( qMovementsInfo.FieldByName('KillOut').AsFloat > 0 ) then
                                 FCalfTable.FieldByName('KillOut').AsFloat := qMovementsInfo.FieldByName('KillOut').AsFloat;
                              if ( Length(qMovementsInfo.FieldByName('Grade').AsString) > 0 ) then
                                 FCalfTable.FieldByName('Grade').AsString := qMovementsInfo.FieldByName('Grade').AsString;

                              FCalfTable.FieldByName('LastWeighDate').AsDateTime := FCalfTable.FieldByName('SaleDate').AsDateTime;
                              FCalfTable.FieldByName('LastWeight').AsFloat := FCalfTable.FieldByName('SaleWeight').AsFloat;
                           end;
                     end;

                  iDays := 0;
                  fGain := 0;
                  if ( FCalfTable.FieldByName('LastWeighDate').AsDateTime > FCalfTable.FieldByName('DateOfBirth').AsDateTime ) then
                     iDays := Trunc(FCalfTable.FieldByName('LastWeighDate').AsDateTime - FCalfTable.FieldByName('DateOfBirth').AsDateTime);
                  if ( FCalfTable.FieldByName('LastWeight').AsFloat > FCalfTable.FieldByName('FirstWeight').AsFloat ) then
                     fGain := FCalfTable.FieldByName('LastWeight').AsFloat - FCalfTable.FieldByName('FirstWeight').AsFloat;

                  if ( fGain > 0 ) and ( iDays > 0 ) then
                     FCalfTable.FieldByName('AvgWeighGain').AsFloat := ( fGain / iDays );

                  FCalfTable.Post;
                  ProgressIndicator.Position := ProgressIndicator.Position + 1;

               except
                  FCalfTable.Cancel;
               end;

         end;
      ProgressIndicator.Close;

      // Remove calves from FCalfTable that do not have a weight gain.
      FQuery.Close;
      FQuery.SQL.Clear;
      FQuery.SQL.Add('DELETE FROM '+FCalfTable.TableName);
      FQuery.SQL.Add('WHERE ( (AvgWeighGain = 0) OR (AvgWeighGain IS NULL) )');
      FQuery.ExecSQL;

      FQuery.Close;
      FQuery.SQL.Clear;
      FQuery.SQL.Add('INSERT INTO '+FSireTable.TableName+' (SireID, SireNo, SortSireNo)');
      FQuery.SQL.Add('SELECT A.ID, A.AnimalNo, A.SortAnimalNo');
      FQuery.SQL.Add('FROM Animals A');
      FQuery.SQL.Add('WHERE A.ID IN (SELECT DISTINCT(SireID)');
      FQuery.SQL.Add('               FROM '+FCalfTable.TableName+')');
      FQuery.ExecSQL;
      FSireTable.Close;
      FSireTable.Open;
      if ( FSireTable.RecordCount > 0 ) then
         SireGridDBBandedTableView.Bands[0].Caption := 'Sires ('+IntToStr(FSireTable.RecordCount)+')';

      FSireTable.First;
      for i := 1 to FSireTable.RecordCount do
         begin
            FSireTable.RecNo := i;
            fSumSireCalvesWeighGain := 0;
            fAvgSireCalvesWeighGain := 0;

            FQuery.Close;
            FQuery.SQL.Clear;
            FQuery.SQL.Add('SELECT SUM(AvgWeighGain)');
            FQuery.SQL.Add('FROM '+FCalfTable.TableName+'');
            FQuery.SQL.Add('WHERE SireID = :SireID');
            FQuery.SQL.Add('AND   AvgWeighGain > 0');
            FQuery.Params[0].AsInteger := FSireTable.FieldByName('SireID').AsInteger;
            FQuery.Open;
            if ( FQuery.Fields[0].AsFloat > 0 ) then
               begin
                  fSumSireCalvesWeighGain := FQuery.Fields[0].AsFloat;
                  iSiresCalfCount := 0;
                  FQuery.Close;
                  FQuery.SQL.Clear;
                  FQuery.SQL.Add('SELECT *');
                  FQuery.SQL.Add('FROM '+FCalfTable.TableName+'');
                  FQuery.SQL.Add('WHERE SireID = :SireID');
                  FQuery.Params[0].AsInteger := FSireTable.FieldByName('SireID').AsInteger;
                  FQuery.Open;
                  if ( FQuery.RecordCount > 0 ) then
                     begin
                        iSiresCalfCount := FQuery.RecordCount;
                        fAvgSireCalvesWeighGain := ( fSumSireCalvesWeighGain / iSiresCalfCount );
                     end;

                  if ( fAvgSireCalvesWeighGain > 0 ) then
                     begin
                        FSireTable.Edit;
                        FSireTable.FieldByName('CalfCount').AsInteger := iSiresCalfCount;
                        FSireTable.FieldByName('AvgCalfWeighGain').AsFloat := fAvgSireCalvesWeighGain;
                        FSireTable.Post;
                     end;
               end;
         end;

      SireGridDBBandedTableView.DataController.DataSource := nil;
      FSireTable.Close;
      FSireTable.Open;
      SireGridDBBandedTableView.DataController.DataSource := FSireDataSource;
      SireGridDBBandedTableView.OnFocusedRecordChanged := SireGridDBBandedTableViewFocusedRecordChanged;
      SireGridDBBandedTableView.Controller.FocusedRowIndex := 0;

      GetSiresCalfInfo;

      if ( qBirthWeighInfo <> nil ) then
         begin
            qBirthWeighInfo.Close;
            qBirthWeighInfo.Free;
         end;

      if ( qWeighInfo <> nil ) then
         begin
            qWeighInfo.Close;
            qWeighInfo.Free;
         end;

      if ( qMovementsInfo <> nil ) then
         begin
            qMovementsInfo.Close;
            qMovementsInfo.Free;
         end;

   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmSireAnalysis.SireGridDBBandedTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   inherited;
   GetSiresCalfInfo;
end;

procedure TfmSireAnalysis.GetSiresCalfInfo;
var
   qFooterDetails : TQuery;
begin
   CalfGridDBBandedTableView.DataController.Filter.Clear;
   CalfGridDBBandedTableView.DataController.DataSource := nil;
   FCalfTable.Close;
   FCalfTable.Filter := '';
   FCalfTable.Filtered := False;
   FCalfTable.Filter := 'SireID = '+IntToStr(FSireTable.FieldByName('SireID').AsInteger);
   FCalfTable.Filtered := True;
   FCalfTable.Open;

   CalfGridDBBandedTableView.DataController.DataSource := FCalfDataSource;
   CalfGridDBBandedTableView.Controller.FocusedRowIndex := 0;
end;

procedure TfmSireAnalysis.SireGridDBBandedTableViewSortSireNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   inherited;
   DisplayColumnText(SireGridDBBandedTableViewSireNo,ARecord,AText);
end;

procedure TfmSireAnalysis.CalfGridDBBandedTableViewSortCalfNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   inherited;
   DisplayColumnText(CalfGridDBBandedTableViewCalfNo,ARecord,AText);
end;

procedure TfmSireAnalysis.CalfGridDBBandedTableViewSortCalfNatIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   inherited;
   DisplayColumnText(CalfGridDBBandedTableViewCalfNatID,ARecord,AText);
end;

procedure TfmSireAnalysis.DisplayColumnText(AColumn : TcxGridDBBandedColumn;
  ARecord: TcxCustomGridRecord; var AText : String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[AColumn.Index]
   else
      AText := '';
end;

procedure TfmSireAnalysis.actPrintSireGridExecute(Sender: TObject);
begin
   inherited;
   pglSireGrid.Preview;
end;

procedure TfmSireAnalysis.actPrintCalfGridExecute(Sender: TObject);
begin
   inherited;
   pglCalfGrid.OptionsView.FilterBar := ( Length(CalfGridDBBandedTableView.DataController.Filter.FilterText) > 0 );
   CalfGridDBBandedTableView.Bands[0].Caption := '';
   CalfGridDBBandedTableView.Bands[0].Caption := 'Calves of '+FSireTable.FieldByName('SireNo').AsString;
   if ( pglCalfGrid.OptionsView.FilterBar ) then
      CalfGridDBBandedTableView.Bands[0].Caption := CalfGridDBBandedTableView.Bands[0].Caption +
                                                    ' Filtered By : ' + CalfGridDBBandedTableView.DataController.Filter.FilterText + '';
   pglCalfGrid.Preview;
   CalfGridDBBandedTableView.Bands[0].Caption := 'Calves';
end;

procedure TfmSireAnalysis.actPrintExecute(Sender: TObject);
var
   pt : tPoint;
begin
   inherited;
   GetCursorPos(pt);
   pmPrintGrid.Popup(pt.x,pt.y);
end;

procedure TfmSireAnalysis.cbFavouritePropertiesChange(Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cSireAnalysis,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cSireAnalysis,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfmSireAnalysis.FormShow(Sender: TObject);
begin
   inherited;
   cbFavourite.Checked := WinData.IsReportFavourite(cSireAnalysis);
   WinData.UpdateRecentReportUsage(cSireAnalysis);
end;

procedure TfmSireAnalysis.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FQuery <> nil ) then
      begin
         FQuery.Close;
         FreeAndNil(FQuery);
      end;

   if ( FEventDataHelper <> nil ) then
      FreeAndNil(FEventDataHelper);

   if ( FSireTable <> nil ) then
      begin
         FSireTable.Close;
         FSireTable.DeleteTable;
         FreeAndNil(FSireTable);
      end;

   if ( FCalfTable <> nil ) then
      begin
         FCalfTable.Close;
         FCalfTable.DeleteTable;
         FreeAndNil(FCalfTable);
      end;
end;

function TfmSireAnalysis.CalfGridFloatFieldAvgValue ( AFieldName : String ) : Double;
var
   bLoop : Boolean;
   fTotalFieldAmt : Double;
   iCount : Integer;
begin
   Result := 0;
   if ( Length(AFieldName) = 0 ) then Exit;
   if ( FCalfTable = nil ) then Exit;
   if ( not(FCalfTable.Active) ) then Exit;
   fTotalFieldAmt := 0;
   iCount := 0;

   if CalfGridDBBandedTableView.DataController.Filter.IsFiltering then
      begin
         FCalfTable.Filter := '(SireID = '+IntToStr(FSireTable.FieldByName('SireID').AsInteger)+')';
         FCalfTable.Filter := FCalfTable.Filter + ' AND ' + CalfGridDBBandedTableView.DataController.Filter.FilterText;
         FCalfTable.Filtered := ( Length(FCalfTable.Filter) > 0 );
      end;

   bLoop := True;
   FCalfTable.FindFirst;
   while bLoop do
      begin
         if ( FCalfTable.FieldByName(AFieldName).AsFloat > 0 ) then
            begin
               fTotalFieldAmt := fTotalFieldAmt + FCalfTable.FieldByName(AFieldName).AsFloat;
               Inc(iCount);
            end;
         bLoop := FCalfTable.FindNext;
      end;
   if ( fTotalFieldAmt <> Null ) and ( iCount > 0 ) then
      if ( fTotalFieldAmt > iCount ) then
         Result := ( fTotalFieldAmt / iCount );
end;

procedure TfmSireAnalysis.GetColdDeadWtFooterText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
   fAvg : Double;
begin
   fAvg := CalfGridFloatFieldAvgValue('ColdDeadWt');
   if ( fAvg > 0 ) then
      AText := FormatFloat('0',fAvg)
   else
      AText := '';
end;

procedure TfmSireAnalysis.GetSaleWeightFooterText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
   fAvg : Double;
begin
   fAvg := CalfGridFloatFieldAvgValue('SaleWeight');
   if ( fAvg > 0 ) then
      AText := FormatFloat('0',fAvg)
   else
      AText := '';
end;

procedure TfmSireAnalysis.GetKillOutFooterText(Sender: TcxDataSummaryItem;
  const AValue: Variant; AIsFooter: Boolean; var AText: String);
var
   fAvg : Double;
begin
   fAvg := CalfGridFloatFieldAvgValue('KillOut');
   if ( fAvg > 0 ) then
      AText := FormatFloat('0.#',fAvg)
   else
      AText := '';
end;

procedure TfmSireAnalysis.FormActivate(Sender: TObject);
begin
   inherited;
   ProcessCalfTable;
   if ( FSireTable.RecordCount = 0 ) then
      PostMessage(Self.Handle,wm_close,0,0);
   OnActivate := nil;
end;

procedure TfmSireAnalysis.CalfGridDBBandedTableViewDataControllerFilterChanged(
  Sender: TObject);
begin
   inherited;
   if ( not(CalfGridDBBandedTableView.DataController.Filter.IsFiltering) ) then
      FCalfTable.Filter := 'SireID = '+IntToStr(FSireTable.FieldByName('SireID').AsInteger);
end;

end.
