{
   05/09/14 [V5.3 R5.9] /MK Bug Fix - Only get average and sum of PurchWeight, PurchPrice, SalesWeight and SalePrice
                                      where these fields have a value > 0.

   13/07/18 [V5.8 R0.9] /MK Additional Feature - Added sub title to Report Title from Custom Title in uReportOptions - Jackie (Quinn's).

   10/08/20 [V5.9 R5.3] /MK Change - Added the Herd Identity to the top of the report.

   16/07/21 [V6.0 R1.7] /MK Change - GrossMarginPrint - As in the new Gross Margin column on the main grid, don't show minus values.
                                   - QRExpr9Print - Only average fields where the value is > 0.
                                   - QRExpr13Print - Only sum fields where the value is > 0.
                                   - GetFieldType - Added function to find what the field type is for GetSUMValueBySQL & GetAVGValueBySQL to check for FloatField Value > 0.
}

unit uPurchSalesReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport, db, dbTables;

type
  TfmPurchSalesReport = class(TForm)
    PurchaseSalesScr: TQuickRep;
    ColumnHeaderBand3: TQRBand;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    lSCustomer: TQRLabel;
    lSGrade: TQRLabel;
    lGrossMargin: TQRLabel;
    PurchSalesRptTitle: TQRLabel;
    lDisplayTag: TQRLabel;
    QRShape3: TQRShape;
    PurchSalesSortLabel: TQRLabel;
    PurchSalesOrderLabel: TQRLabel;
    QRLabel15: TQRLabel;
    qrPLine: TQRShape;
    lPurchases: TQRLabel;
    lSDate: TQRLabel;
    lSPrice: TQRLabel;
    lSWeight: TQRLabel;
    qrSLine: TQRShape;
    lPrice: TQRLabel;
    lWeight: TQRLabel;
    lDate: TQRLabel;
    qrlSupplier: TQRLabel;
    lSales: TQRLabel;
    qrUsingSalesFilter: TQRLabel;
    lSex: TQRLabel;
    lDob: TQRLabel;
    lBreed: TQRLabel;
    lBuyer: TQRLabel;
    PageFooterBand3: TQRBand;
    QRLabel44: TQRLabel;
    PurchSalesVerLabel: TQRLabel;
    SummaryBand3: TQRBand;
    QRExpr9: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr10: TQRExpr;
    PurchSalesDetail: TQRSubDetail;
    QRDBText8: TQRDBText;
    qrDBPDate: TQRDBText;
    qrDBWeight: TQRDBText;
    qrDBPPrice: TQRDBText;
    qrDBPSupplier: TQRDBText;
    qrDBSDate: TQRDBText;
    qrDBSWeight: TQRDBText;
    qrDBSPrice: TQRDBText;
    qrDBSGrade: TQRDBText;
    qrDBSCustomer: TQRDBText;
    Margin: TQRExpr;
    qrDBDOB: TQRDBText;
    QRExpr11: TQRExpr;
    qrDBPBuyer: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    LPurchFrom: TQRLabel;
    lFromPurch: TQRLabel;
    lPurchTo: TQRLabel;
    lToPurch: TQRLabel;
    LSaleOrDeathFrom: TQRLabel;
    lFromSale: TQRLabel;
    LSaleOrDeathTo: TQRLabel;
    lToSale: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr14: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr13: TQRExpr;
    qrdbBreedCode: TQRDBText;
    qrlCustomTitle: TQRLabel;
    qrlHerdIdentityCap: TQRLabel;
    qrlHerdIdentity: TQRLabel;
    procedure qrDBSDatePrint(sender: TObject; var Value: String);
    procedure QRExpr12Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRExpr14Print(sender: TObject; var Value: String);
    procedure qrDBWeightPrint(sender: TObject; var Value: String);
    procedure QRExpr9Print(sender: TObject; var Value: String);
    procedure QRExpr13Print(sender: TObject; var Value: String);
    procedure MarginPrint(sender: TObject; var Value: String);
  private
    function GetAVGValueBySQL(AFieldName: String): String;
    function GetSUMValueBySQL(AFieldName: String): String;
    function GetFieldType (AFieldName : String) : TFieldType;
    { Private declarations }
  public
    { Public declarations }
    PrintHerdField : Boolean;
  end;

var
  fmPurchSalesReport: TfmPurchSalesReport;

implementation
uses
   StockInHerdFilt, KRoutines, GenTypesConst, KDBRoutines;

{$R *.DFM}

procedure TfmPurchSalesReport.qrDBSDatePrint(sender: TObject;
  var Value: String);
begin
   Value := FormatDate(TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime, dsIrish, False);
end;

procedure TfmPurchSalesReport.QRExpr12Print(sender: TObject;
  var Value: String);
begin
   Value := '';
   with GetQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT AVG(PurchPrice), AVG(PurchWeight)');
         SQL.Add('FROM PurchSales');
         SQl.Add('WHERE ( PurchPrice > 0 AND PurchWeight > 0 )');
         try
            Open;
            if ( Fields[0].AsFloat > 0 ) and ( Fields[1].AsFloat > 0 ) then
               Value := FormatFloat('#.00',Fields[0].AsFloat/Fields[1].AsFloat);
            if ( Value <> '' ) then
               begin
                  Value := '(' + value + ' Price/Kg)';
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmPurchSalesReport.QRDBText2Print(sender: TObject;
  var Value: String);
begin
   if not PrintHerdField then
      Value := '';
end;

procedure TfmPurchSalesReport.FormCreate(Sender: TObject);
begin
   PrintHerdField := False;
end;

procedure TfmPurchSalesReport.QRLabel2Print(sender: TObject;
  var Value: String);
begin
   if not PrintHerdField then
      Value := '';
end;

function TfmPurchSalesReport.GetAVGValueBySQL(AFieldName : String ) : String;
begin
   Result := '';
   with GetQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT AVG('+AFieldName+')');
         SQL.Add('FROM PurchSales');
         SQL.Add('WHERE ('+AFieldName+' IS NOT NULL)');
         if ( GetFieldType(AFieldName) = ftFloat ) then
            SQL.Add('AND   ('+AFieldName+' > 0)');
         try
            Open;
            if ( Fields[0].AsFloat > 0 ) then
               Result := FormatFloat('#.00',Fields[0].AsFloat);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmPurchSalesReport.QRExpr4Print(sender: TObject;
  var Value: String);
var
   Expression, FieldName : String;
   i, iOpenBrac, iCloseBrac : Integer;
   bSUM : Boolean;
begin
   if ( Sender is TQRExpr ) then
      begin
         iOpenBrac := 0;
         iCloseBrac := 0;
         Expression := (Sender as TQRExpr).Expression;
         if ( Expression <> '' ) then
            begin
               bSum := ( UpperCase(Copy(Expression,0,3)) = 'SUM' );
               for i := 0 to Length(Expression) do
                  begin
                     if ( Expression[i] = '(' ) then
                        iOpenBrac := i;
                  end;
               if ( iOpenBrac > 0 ) then
                  Delete(Expression,1,iOpenBrac);
               for i := 0 to Length(Expression) do
                  begin
                     if ( Expression[i] = ')' ) then
                        iCloseBrac := i;
                  end;
               if ( iCloseBrac > 0 ) then
                  Delete(Expression,iCloseBrac,Length(Expression));
               if bSum then
                  Value := GetSUMValueBySQL(Expression)
               else
                  Value := GetAVGValueBySQL(Expression);
            end;
      end;
end;


procedure TfmPurchSalesReport.QRExpr14Print(sender: TObject;
  var Value: String);
begin
   Value := '';
   with GetQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT AVG(Salesprice), AVG(SalesWeight)');
         SQL.Add('FROM PurchSales');
         SQl.Add('WHERE ( Salesprice > 0 AND SalesWeight > 0 )');
         try
            Open;
            if ( Fields[0].AsFloat > 0 ) and ( Fields[1].AsFloat > 0 ) then
               Value := FormatFloat('#.00',Fields[0].AsFloat/Fields[1].AsFloat);
            if ( Value <> '' ) then
               begin
                  Value := '(' + value + ' Price/Kg)';
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TfmPurchSalesReport.GetSUMValueBySQL(AFieldName : String ) : String;
begin
   Result := '';
   with GetQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT SUM('+AFieldName+')');
         SQL.Add('FROM PurchSales');
         SQL.Add('WHERE ('+AFieldName+' IS NOT NULL)');
         if ( GetFieldType(AFieldName) = ftFloat ) then
            SQL.Add('AND   ('+AFieldName+' > 0)');
         try
            Open;
            if ( Fields[0].AsFloat > 0 ) then
               Result := FormatFloat('#.00',Fields[0].AsFloat);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmPurchSalesReport.qrDBWeightPrint(sender: TObject;
  var Value: String);
begin
   if ( Value = '.00' ) then
      Value := '';
end;

function TfmPurchSalesReport.GetFieldType(AFieldName: String): TFieldType;
var
   i : Integer;
   tPurchSales : TTable;
begin
   Result := ftUnknown;
   tPurchSales := TTable.Create(nil);
   try
      tPurchSales.DatabaseName := AliasName;
      tPurchSales.TableName := 'PurchSales';
      if ( not(tPurchSales.Exists) ) then Exit;
      tPurchSales.Open;
      for i := 0 to tPurchSales.FieldDefs.Count-1 do
         if ( UpperCase(tPurchSales.Fields[i].FieldName) = UpperCase(AFieldName) ) then
            begin
               Result := tPurchSales.Fields[i].DataType;
               Break;
            end;
   finally
      if ( tPurchSales <> nil ) then
         FreeAndNil(tPurchSales);
   end;
end;

//   16/07/21 [V6.0 R1.7] /MK Change - Only average fields where the value is > 0.
procedure TfmPurchSalesReport.QRExpr9Print(sender: TObject;
  var Value: String);
begin
   Value := '';
   with GetQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT AVG(PurchPrice), AVG(SalesPrice)');
         SQL.Add('FROM PurchSales');
         SQl.Add('WHERE ( PurchPrice > 0 AND SalesPrice > 0 )');
         try
            Open;
            if ( Fields[0].AsFloat > 0 ) and ( Fields[1].AsFloat > 0 ) then
               Value := FormatFloat('#.00',Fields[1].AsFloat-Fields[0].AsFloat);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

//   16/07/21 [V6.0 R1.7] /MK Change - Only sum fields where the value is > 0.
procedure TfmPurchSalesReport.QRExpr13Print(sender: TObject;
  var Value: String);
begin
   Value := '';
   with GetQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT SUM(PurchPrice), SUM(SalesPrice)');
         SQL.Add('FROM PurchSales');
         SQl.Add('WHERE ( PurchPrice > 0 AND SalesPrice > 0 )');
         try
            Open;
            if ( Fields[0].AsFloat > 0 ) and ( Fields[1].AsFloat > 0 ) then
               Value := FormatFloat('#.00',Fields[1].AsFloat-Fields[0].AsFloat);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmPurchSalesReport.MarginPrint(sender: TObject; var Value: String);
var
   fPurchPrice, fSalePrice : Double;
begin
   Value := '';
   //   16/07/21 [V6.0 R1.7] /MK Change - As in the new Gross Margin column on the main grid, don't show minus values.
   if ( PurchSalesDetail.DataSet.RecNo > 0 ) then
      begin
         fPurchPrice := PurchSalesDetail.DataSet.FieldByName('PurchPrice').AsFloat;
         fSalePrice := PurchSalesDetail.DataSet.FieldByName('SalesPrice').AsFloat;
         if ( fPurchPrice > 0 ) and ( fSalePrice > 0 ) then
            Value := FormatFloat('#.00',fSalePrice-fPurchPrice);
      end;
end;

end.
