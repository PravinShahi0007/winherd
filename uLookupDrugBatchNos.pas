unit uLookupDrugBatchNos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, cxButtons, ExtCtrls,
  uHerdLookup, db, dbTables, GenTypesConst, KRoutines;

type
  TfmLookupDrugBatchNo = class(TForm)
    lMedicineName: TcxLabel;
    pBatchNos: TPanel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    DrugBatchNoGridDBTableView: TcxGridDBTableView;
    DrugBatchNoGridLevel: TcxGridLevel;
    DrugBatchNoGrid: TcxGrid;
    DrugBatchNoGridDBTableViewBatchNo: TcxGridDBColumn;
    DrugBatchNoGridDBTableViewPurchDate: TcxGridDBColumn;
    DrugBatchNoGridDBTableViewQtyRem: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FDrugBatchNoQuery : TQuery;
    FDrugBatchNoDataSource : TDataSource;
  public
    { Public declarations }
    class function GetMediPurchID ( ADrugID : Integer; ATreatDate : TDateTime; const ABatchNo : String = '' ) : Integer;
  end;

var
  fmLookupDrugBatchNo: TfmLookupDrugBatchNo;

implementation

{$R *.DFM}

{ TfmLookupDrugBatchNo }

procedure TfmLookupDrugBatchNo.FormCreate(Sender: TObject);
begin
   FDrugBatchNoQuery := TQuery.Create(nil);
   FDrugBatchNoQuery.DatabaseName := AliasName;
   FDrugBatchNoDataSource := TDataSource.Create(nil);
   FDrugBatchNoDataSource.DataSet := FDrugBatchNoQuery;
end;

class function TfmLookupDrugBatchNo.GetMediPurchID ( ADrugID : Integer; ATreatDate : TDateTime; const ABatchNo : String = '' ) : Integer;
begin
   with TfmLookupDrugBatchNo.Create(nil) do
      try
         if ( ADrugID > 0 ) then
            begin
               HerdLookup.qDrugList.Close;
               HerdLookup.qDrugList.Open;
               if ( HerdLookup.qDrugList.Locate('ID',ADrugID,[]) ) then
                  lMedicineName.Caption := HerdLookup.qDrugList.FieldByName('Name').AsString;
               FDrugBatchNoQuery.SQL.Clear;
               FDrugBatchNoQuery.SQL.Text := HerdLookup.qBatchNoByPurchData.SQL.Text;
               if ( Length(ABatchNo) > 0 ) then
                  FDrugBatchNoQuery.SQL.Add('AND Upper(BatchNo) = "'+UpperCase(ABatchNo)+'"');
               FDrugBatchNoQuery.SQL.Add('ORDER BY PurchDate ASC');
               FDrugBatchNoQuery.Params[0].AsInteger := ADrugID;
               if ( ATreatDate <= 0 ) then
                  ATreatDate := Date;
               FDrugBatchNoQuery.Params[1].AsDateTime := ATreatDate;
               FDrugBatchNoQuery.Open;
               DrugBatchNoGridDBTableView.DataController.DataSource := FDrugBatchNoDataSource;
               ShowModal;
            end;
         if ( ModalResult = mrOK ) then
            Result := FDrugBatchNoQuery.FieldByName('ID').AsInteger;
      finally
         Free;
      end;
end;

procedure TfmLookupDrugBatchNo.FormDestroy(Sender: TObject);
begin
   if ( FDrugBatchNoQuery <> nil ) then
      FreeAndNil(FDrugBatchNoQuery);
   if ( FDrugBatchNoDataSource <> nil ) then
      FreeAndNil(FDrugBatchNoDataSource);
end;

end.
