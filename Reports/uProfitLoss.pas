{ NN 26/09/02
  Livestock Inventory date coming through on to the Profit and Loss Report
  Included was change of report title


 }
unit uProfitLoss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, QRExport;

type
  TfmProfitLoss = class(TForm)
    qrProfitLoss: TQuickRep;
    QRBand2: TQRBand;
    QRLabel30: TQRLabel;
    lSales: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    GroupFooterBand3: TQRBand;
    QRLabel35: TQRLabel;
    lPurchases: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    GroupHeaderBand3: TQRBand;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    GroupFooterBand6: TQRBand;
    QRLabel39: TQRLabel;
    lSumEE: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    lCClosing: TQRLabel;
    lCOpening: TQRLabel;
    lCAdjust: TQRLabel;
    lNCClosing: TQRLabel;
    lNCOpening: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    lNCAdjust: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText2: TQRDBText;
    GroupFooterBand7: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    GroupFooterBand5: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr4: TQRExpr;
    lGrossMar: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    GroupFooterBand4: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    PageFooterBand1: TQRBand;
    qEI: TQuery;
    qEIBalance: TFloatField;
    qSum: TQuery;
    qSumResult: TFloatField;
    qEE: TQuery;
    qEEBalance: TFloatField;
    qOH: TQuery;
    qOHBalance: TFloatField;
    qEEOther: TQuery;
    lSumEI: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    qEEOtherBalance: TFloatField;
    QRExpr2: TQRExpr;
    lDepreciation: TQRLabel;
    QRLabel7: TQRLabel;
    lGross: TQRLabel;
    QRLabel24: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qEIGroupDesc: TStringField;
    qEEGroupDesc: TStringField;
    qOHGroupDesc: TStringField;
    qEEOtherGroupDesc: TStringField;
    lTotalStock: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText4: TQRDBText;
    qEIP: TQuery;
    qEIPGroupDesc: TStringField;
    qEIPBalance: TFloatField;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QrShape: TQRShape;
    QRLabel5: TQRLabel;
    lFromDate: TQRLabel;
    QRLabel8: TQRLabel;
    lToDate: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure eEIPrint(sender: TObject; var Value: String);
    procedure eEEPrint(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure qEIAfterOpen(DataSet: TDataSet);
    procedure qEEAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lTotalStockPrint(sender: TObject; var Value: String);
    procedure QRLabel57Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure lGrossPrint(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure lGrossMarPrint(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure lDepreciationPrint(sender: TObject; var Value: String);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
     EIBalance,
     CAdjust,
     NCAdjust,
     TotalAdjust,
     EEBalance,
     Depreciation,
     OHBalance,
     PRBalance,
     FOBalance,
     TVCBalance,
     GOBalance,
     EIPBalance,
     GrossMar : Double;
     Nlaccs : TTable;
     DBPath : String;
     procedure RunSQLs;
     function GetDepreciation: Double;
  public
    { Public declarations }
  end;


var
  fmProfitLoss: TfmProfitLoss;

implementation

uses DairyData, uAccsReps, GenTypesConst;

{$R *.DFM}

// Value := CurrToStrF(((EIBalance+NEIBalance+CAdjust+NCAdjust) - EEBalance) - (OverHeads + Depreciation), ffCurrency, 2);
// Value := CurrToStrF((EIBalance+NEIBalance+CAdjust+NCAdjust) - EEBalance, ffCurrency, 2);
// Value := CurrToStrF((EIBalance+NEIBalance+CAdjust+NCAdjust), ffCurrency, 2);

procedure TfmProfitLoss.eEIPrint(sender: TObject; var Value: String);
begin
   EIBalance := StrToFloat(Value);
   Value := CurrToStrF(StrToFloat(Value), ffCurrency, 2);
end;

procedure TfmProfitLoss.eEEPrint(sender: TObject; var Value: String);
begin
   EEBalance := StrToFloat(Value);
   Value := CurrToStrF(StrToFloat(Value), ffCurrency, 2);
end;

procedure TfmProfitLoss.QRLabel13Print(sender: TObject; var Value: String);
begin
 {  with QSum do
      begin
        SQL.Clear;
        SQL.Add('SELECT Sum(Depreciation) Result');
        SQL.Add('FROM NLAccs');
        SQL.Add('WHERE Category = "FA"');
        SQL.Add('AND Name <> "" ');
        SQL.Add('AND Balance <> 0');
        Open;

        Depreciation := FieldByName('Result').AsFloat;
        Value := CurrToStrF(FieldByName('Result').AsFloat, ffCurrency, 2);
        Close;
      end;  }
end;

procedure TfmProfitLoss.qEIAfterOpen(DataSet: TDataSet);
begin
  Dataset.First;
  while not DataSet.Eof do
     begin
     EIBalance := EIBalance+DataSet.FieldByName('Balance').AsFloat;
     DataSet.Next
     end;

  lSumEI.Caption := CurrToStrF(EIBalance, ffCurrency, 2);

end;

procedure TfmProfitLoss.qEEAfterOpen(DataSet: TDataSet);
begin
  Dataset.First;
  while not DataSet.Eof do
     begin
     EEBalance := EEBalance+DataSet.FieldByName('Balance').AsFloat;
     DataSet.Next
     end;

  lSumEE.Caption := CurrToStrF(EEBalance, ffCurrency, 2);
end;

procedure TfmProfitLoss.FormCreate(Sender: TObject);
begin
   DbPath := 'C:\Kingsacc\' + WinData.GetAccsCompany(WinData.UserDefaultHerdID);
   RunSQLs;
end;

procedure TfmProfitLoss.RunSQLs;
var
  nonCOpening, nonCClosing : Double;
begin

   try
      qSum.DataBaseName := DBPath;
      qEI.DataBaseName := DBPath;
      qEE.DataBaseName := DBPath;
      qOH.DataBaseName := DBPath;
      qEIP.DataBaseName := DBPath;
      qEEOther.DataBaseName := DBPath;
      qEI.Open;
      qEE.Open;
      qOH.Open;
      qEIP.Open;
      qEEOther.Open;

      WinData.LiveStockValues.Open;

      if ((WinData.UserDefaultHerdID <> WinData.NONEHerdID) and (WinData.LiveStockValues.Locate('HerdID', WinData.UserDefaultHerdID, []))) then
         begin
            lCOpening.Caption := CurrToStrF(WinData.LiveStockValues.FieldByName('OpeningValue').AsFloat, ffCurrency, 2);
            lCClosing.Caption := CurrToStrF(WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat, ffCurrency, 2);
            CAdjust           := (WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat - WinData.LiveStockValues.FieldByName('OpeningValue').AsFloat);
            lCAdjust.Caption  := CurrToStrF(CAdjust, ffCurrency, 2);
            if WinData.LiveStockValues.FieldByName('FromDate').AsDateTime > 0 then
               lFromDate.Caption := FormatDateTime(cIrishDateStyle, WinData.LiveStockValues.FieldByName('FromDate').AsDateTime)
            else
               lFromDate.Caption := '';
            if WinData.LiveStockValues.FieldByName('ToDate').AsDateTime > 0 then
               lToDate.Caption   := FormatDateTime(cIrishDateStyle, WinData.LiveStockValues.FieldByName('ToDate').AsDateTime)
            else
               lToDate.Caption   := '';
         end
     else
        begin
            CAdjust           := 0;
            lCAdjust.Caption  := '0.00';
            lCOpening.Caption := '0.00';
            lCClosing.Caption := '0.00';
            lFromDate.Caption := '';
            lToDate.Caption   := '';
         end;
         
      WinData.LiveStockValues.Close;

       with QSum do
          begin
             SQL.Clear;
             SQL.Add('SELECT Sum(balance) Result');
             SQL.Add('FROM NLAccs');
             SQL.Add('WHERE Category = "CA"');
             SQL.Add('AND Name <> "" ');
             SQL.Add('AND Balance <> 0');
             Open;

             nonCClosing := FieldByName('Result').AsFloat;
             if FieldByName('Result').AsFloat > 0 then //this could be a negative figure need to check
                lNCClosing.Caption := CurrToStrF(FieldByName('Result').AsFloat, ffCurrency, 2)
             else
                lNCClosing.Caption := '';

             SQL.Clear;
             SQL.Add('SELECT Sum(StYear) Result');
             SQL.Add('FROM NLAccs');
             SQL.Add('WHERE Category = "CA" ');
             SQL.Add('AND Name <> "" ');
             SQL.Add('AND Balance <> 0');
             Open;

             nonCOpening := FieldByName('Result').AsFloat;
             if FieldByName('Result').AsFloat > 0 then //this could be a negative figure need to check
                lNCOpening.Caption := CurrToStrF(FieldByName('Result').AsFloat, ffCurrency, 2)
             else
                lNCOpening.Caption := '0.00';

             NCAdjust := nonCClosing-nonCOpening;
             if NCAdjust > 0 then
                lNCAdjust.Caption := CurrToStrF(NCAdjust, ffCurrency, 2)
             else
                lNCAdjust.Caption := '0.00';
             lTotalStock.Caption := FloatToStr(CAdjust + NCAdjust);
             Close;
          end;
   finally
      qrProfitLoss.preview;
      qEI.Close;
      qEE.Close;
      qOH.Close;
      qEIP.Close;
      qEEOther.Close;
   end;
end;

procedure TfmProfitLoss.QRSubDetail5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qEI.RecNo = 1 then
      lSales.CAption := 'Sales'
  else
      lSales.CAption := '';
end;

procedure TfmProfitLoss.QRSubDetail6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 if qEE.RecNo = 1 then
      lPurchases.CAption := '- Purchases'
  else
      lPurchases.CAption := '';
end;

procedure TfmProfitLoss.lTotalStockPrint(sender: TObject;
  var Value: String);
begin
   TotalAdjust := StrToFloat(Value);
   Value := CurrToStrF(StrToFloat(Value), ffCurrency, 2);
end;

procedure TfmProfitLoss.QRLabel57Print(sender: TObject; var Value: String);
begin
   FOBalance := ((EIBalance + CAdjust + NCAdjust)- EEBalance);
   Value := CurrToStrF(FOBalance, ffCurrency, 2);
end;

procedure TfmProfitLoss.QRExpr1Print(sender: TObject; var Value: String);
begin
   PRBalance := StrToFloat(Value);
   Value := CurrToStrF(PRBalance, ffCurrency, 2);
end;

procedure TfmProfitLoss.lGrossPrint(sender: TObject; var Value: String);
begin
   GOBalance := (PRBalance + FOBalance);
   Value := CurrToStrF(GOBalance, ffCurrency, 2);
end;

procedure TfmProfitLoss.QRExpr4Print(sender: TObject; var Value: String);
begin
   TVCBalance := StrToFloat(Value);
   Value := CurrToStrF(TVCBalance, ffCurrency, 2);
end;

procedure TfmProfitLoss.lGrossMarPrint(sender: TObject; var Value: String);
begin

   Value := CurrToStrF(GOBalance - TVCBalance, ffCurrency, 2);
end;

procedure TfmProfitLoss.QRExpr2Print(sender: TObject; var Value: String);
begin
   OHBalance := StrToFloat(Value);
   Value := CurrToStrF(OHBalance, ffCurrency, 2);

end;

procedure TfmProfitLoss.QRLabel24Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrf( ((GOBalance - TVCBalance) - (OHBalance + depreciation)), ffCurrency, 2);
end;

procedure TfmProfitLoss.lDepreciationPrint(sender: TObject; var Value: String);
begin
   Depreciation := GetDepreciation;
   Value := CurrToStrF(Depreciation, ffCurrency, 2);
end;

procedure TfmProfitLoss.QRLabel7Print(sender: TObject; var Value: String);
begin
    Value := CurrToStrF(OHBalance + Depreciation, ffCurrency, 2);
end;

function TfmProfitLoss.GetDepreciation: Double;
begin
   with NLAccs do
      try
         NLAccs := TTable.Create(nil);
         NLAccs.DatabaseName := DBPath;
         NLAccs.TableName := 'nlaccs';

         NLAccs.Open;
         NLAccs.First;
         Depreciation := 0;

         while not NLAccs.eof do
            begin
               if NLAccs.FieldByName('Category').AsString = 'FA' then
                  if NLAccs.FieldByName('DepRate').AsFloat > 0 then
                     Depreciation := Depreciation+((NLAccs.FieldByName('DepRate').AsFloat / 100)
                                                      * NLAccs.FieldByName('Balance').AsFloat)
                  else if NLAccs.FieldByName('DepAmount').AsFloat > 0 then
                     Depreciation := Depreciation + NLAccs.FieldByName('DepAmount').AsFloat;

               NLAccs.Next;
            end;

         Result := Depreciation;
      finally
         NLAccs.Close;
      end;
end;



procedure TfmProfitLoss.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if qOH.RecNo = qOH.RecordCount then
      begin
         QrShape.Visible := True;
         QrShape.Enabled := True;
      end
   else
      begin
         QrShape.Visible := False;
         QrShape.Enabled := False;
      end
end;

end.
