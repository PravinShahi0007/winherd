{
   13/10/14 [V5.3 R7.5] /MK Change - Always open form regardless of whether data exists or not.

   14/10/14 [V5.3 R7.5] /MK Bug Fix - Wrong field for reason being used, was HealthCode but should have been FarmCode.

   31/10/14 [V5.3 R8.8] /MK Change - Changed lInfo.Caption - GL Request.
                                   - Removed Treatment Date Range label - GL Request.
                                   - Changed main caption to Health Code Summary for all countries - GL Request.

   25/11/14 [V5.4 R0.0] /MK Change - Changed No. Treatments to No. Cases for Irish herds - GL Request.   

   08/09/15 [V5.4 R8.5] /MK Change - GetHealthCodesData - Only include health and dryoff events, exclude vaccinations - TGM request.
}

unit uRedTractorTreatSum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, dxBar, dxBarExtItems, ActnList, dxStatusBar, db, dbTables,
  GenTypesConst, cxContainer, cxEdit, cxLabel, dxPSCore, dxPScxCommon,
  dxPScxGridLnk, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, cxButtons, DairyData, uHerdLookup;

type
  TfmRedTractorHealthCodeSummary = class(TfmBaseForm)
    HealthCodeGridDBTableView: TcxGridDBTableView;
    HealthCodeGridLevel: TcxGridLevel;
    HealthCodeGrid: TcxGrid;
    HealthCodeGridDBTableViewReason: TcxGridDBColumn;
    HealthCodeGridDBTableViewNoTreats: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    actPrint: TAction;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink: TdxGridReportLink;
    InfoPanel: TPanel;
    lInfo: TcxLabel;
    btnApply: TcxButton;
    DateFrom: TcxDateEdit;
    DateTo: TcxDateEdit;
    lDateFrom: TcxLabel;
    lDateTo: TcxLabel;
    actApply: TAction;
    procedure actPrintExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FHealthCodes : TTable;
    FDSHealthCodes : TDataSource;
    FHerdID : Integer;
    FCountry : TCountry;
    procedure GetHealthCodesData (AFieldName : String);
    { Private declarations }
  public
    class procedure ShowTheForm(AHerdID : Integer);
    { Public declarations }
  end;

var
  fmRedTractorHealthCodeSummary: TfmRedTractorHealthCodeSummary;

implementation

{$R *.DFM}

{ TfmRedTractorHealthCodeSummary }

class procedure TfmRedTractorHealthCodeSummary.ShowTheForm(AHerdID : Integer);
begin
   with TfmRedTractorHealthCodeSummary.Create(nil) do
      try
         FHealthCodes := TTable.Create(nil);
         FHealthCodes.DatabaseName := AliasName;
         FHealthCodes.FieldDefs.Add('ID',ftAutoInc);
         FHealthCodes.FieldDefs.Add('Reason',ftString,60);
         FHealthCodes.FieldDefs.Add('Count',ftInteger);
         FHealthCodes.TableName := 'tmpHealthCodes';
         FHealthCodes.CreateTable;
         FHealthCodes.Open;

         FDSHealthCodes := TDataSource.Create(nil);
         FDSHealthCodes.DataSet := FHealthCodes;

         DateFrom.Date := IncMonth(Date,-12);
         DateTo.Date := Date;

         FHerdID := AHerdID;

         FCountry := HerdLookup.CountryByHerdID(FHerdID);

         actApply.Execute;

         if ( WinData.FBordBiaBlockPrint ) then
            dxComponentPrinterLink.PrintPages([1])
         else
            ShowModal;
      finally
         Free;
      end;
end;

procedure TfmRedTractorHealthCodeSummary.actApplyExecute(Sender: TObject);
begin
   inherited;
   if ( FHealthCodes.Active ) then
      if ( FHealthCodes.RecordCount > 0 ) then
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('DELETE FROM '+FHealthCodes.TableName+'');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Free;
            end;

   if ( FCountry = Ireland ) then
      begin
         GetHealthCodesData('HealthCode');
         HealthCodeGridDBTableViewReason.Caption := 'Health Code';
         HealthCodeGridDBTableViewNoTreats.Caption := 'No. Cases';
      end
   else
      begin
         GetHealthCodesData('FarmCode');
         HealthCodeGridDBTableViewReason.Caption := 'Reason';
         HealthCodeGridDBTableViewNoTreats.Caption := 'No. Treatments';
      end;

   HealthCodeGridDBTableView.DataController.DataSource := FDSHealthCodes;
   HealthCodeGridDBTableViewReason.DataBinding.FieldName := 'Reason';
   HealthCodeGridDBTableViewNoTreats.DataBinding.FieldName := 'Count';
   HealthCodeGridDBTableView.Controller.FocusedRecordIndex := 0;

end;

procedure TfmRedTractorHealthCodeSummary.GetHealthCodesData (AFieldName : String);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT G.Description, H.'+AFieldName+', Count(H.'+AFieldName+')');
         SQL.Add('FROM GenLook G');
         SQL.Add('LEFT JOIN Health H ON (H.'+AFieldName+' = G.ID)');
         SQL.Add('LEFT JOIN Events E ON (E.ID = H.EventID)');
         SQL.Add('WHERE E.EventDate BETWEEN "'+FormatDateTime(cUSDateStyle,DateFrom.Date)+'" AND "'+FormatDateTime(cUSDateStyle,DateTo.Date)+'" ');
         SQL.Add('AND E.HerdId = '+IntToStr(FHerdID)+'');
         //   08/09/15 [V5.4 R8.5] /MK Change - Only include health and dryoff events, exclude vaccinations - TGM request.
         SQL.Add('AND E.EventType IN ('+IntToStr(CHealthEvent)+', '+IntToStr(CDryOffEvent)+')');
         SQL.Add('GROUP BY H.'+AFieldName+', G.Description');
         SQL.Add('HAVING COUNT(H.'+AFieldName+') >= 1');
         try
            Open;
            while ( not(Eof) ) do
               begin
                  FHealthCodes.Append;
                  try
                     FHealthCodes.FieldByName('Reason').AsString := Fields[0].AsString;
                     FHealthCodes.FieldByName('Count').AsInteger := Fields[2].AsInteger;
                     FHealthCodes.Post;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
                  Next;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmRedTractorHealthCodeSummary.actPrintExecute(Sender: TObject);
begin
   inherited;
   if Length(dxComponentPrinter.PrintTitle) = 0 then
      dxComponentPrinter.PrintTitle := 'Kingswood Grid Print';
   dxComponentPrinterLink.Preview;
end;

procedure TfmRedTractorHealthCodeSummary.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   inherited;
   if ( FHealthCodes <> nil ) then
      begin
         if ( FHealthCodes.Active ) then
            FHealthCodes.Active := False;
         FHealthCodes.DeleteTable;
         FreeAndNil(FHealthCodes);
      end;
   if ( FDSHealthCodes <> nil ) then
      FreeAndNil(FDSHealthCodes);
end;

end.
