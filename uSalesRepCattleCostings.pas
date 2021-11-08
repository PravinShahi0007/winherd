unit uSalesRepCattleCostings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls, QRExport;

type
  TfmSalesRepCattleCostings = class(TForm)
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    qrCattleCostings: TQuickRep;
    QRBand12: TQRBand;
    CattleCostingsTitleLabel: TQRLabel;
    QRShape99: TQRShape;
    CattleCostsSortLabel: TQRLabel;
    CattleCostsOrderLabel: TQRLabel;
    CattleCostsSortOptionsLabel: TQRLabel;
    QRSysData8: TQRSysData;
    QRSysData9: TQRSysData;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRLabel30: TQRLabel;
    CattleCostingsSupplierLabel: TQRLabel;
    CattleCostingsBuyerLabel: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel91: TQRLabel;
    CattleCostingsCustomerLabel: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel162: TQRLabel;
    lCattleCostingsSaleFrom: TQRLabel;
    lCattleCostingsPurchFrom: TQRLabel;
    lCattleCostingsSaleTo: TQRLabel;
    lCattleCostingsPurchTo: TQRLabel;
    QRLabel173: TQRLabel;
    lCattleCostingsSexType: TQRLabel;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel185: TQRLabel;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    QRLabel188: TQRLabel;
    QRLabel189: TQRLabel;
    QRLabel190: TQRLabel;
    QRLabel191: TQRLabel;
    QRLabel192: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRLabel195: TQRLabel;
    QRLabel197: TQRLabel;
    QRLabel198: TQRLabel;
    QRLabel199: TQRLabel;
    QRLabel200: TQRLabel;
    QRLabel201: TQRLabel;
    QRLabel202: TQRLabel;
    QRLabel203: TQRLabel;
    QRLabel204: TQRLabel;
    QRLabel205: TQRLabel;
    QRLabel206: TQRLabel;
    qrlBuyerSupplierCattleCostings: TQRLabel;
    QRShape108: TQRShape;
    QRLabel208: TQRLabel;
    QRLabel209: TQRLabel;
    lCattleCostingsGradesTitle: TQRLabel;
    lCattleCostingsWeightsTitle: TQRLabel;
    lCattleCostingsGrades: TQRLabel;
    lCattleCostingsWeights: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    qrlCattleCostsHerdName: TQRLabel;
    QRBand13: TQRBand;
    QRLabel217: TQRLabel;
    QRLabel218: TQRLabel;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRExpr151: TQRExpr;
    QRExpr152: TQRExpr;
    QRExpr153: TQRExpr;
    QRExpr154: TQRExpr;
    QRExpr155: TQRExpr;
    QRExpr156: TQRExpr;
    QRExpr157: TQRExpr;
    QRExpr158: TQRExpr;
    QRExpr159: TQRExpr;
    QRExpr160: TQRExpr;
    QRExpr161: TQRExpr;
    QRExpr162: TQRExpr;
    QRExpr163: TQRExpr;
    QRExpr165: TQRExpr;
    QRExpr166: TQRExpr;
    QRExpr167: TQRExpr;
    QRExpr168: TQRExpr;
    QRExpr169: TQRExpr;
    QRExpr170: TQRExpr;
    QRExpr171: TQRExpr;
    QRExpr172: TQRExpr;
    QRExpr173: TQRExpr;
    QRExpr174: TQRExpr;
    QRExpr175: TQRExpr;
    QRExpr176: TQRExpr;
    QRExpr177: TQRExpr;
    QRExpr178: TQRExpr;
    QRExpr179: TQRExpr;
    QRExpr180: TQRExpr;
    QRExpr181: TQRExpr;
    QRExpr183: TQRExpr;
    QRExpr184: TQRExpr;
    QRExpr185: TQRExpr;
    QRExpr186: TQRExpr;
    QRExpr187: TQRExpr;
    QRExpr188: TQRExpr;
    QRExpr189: TQRExpr;
    QRShape115: TQRShape;
    QRBand14: TQRBand;
    QRLabel219: TQRLabel;
    QRLabel220: TQRLabel;
    QRShape116: TQRShape;
    QRBand15: TQRBand;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRDBText17: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    qrdbBuyer_SupplierCattleCostings: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    procedure QRExpr188Print(sender: TObject; var Value: String);
    procedure QRExpr176Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSalesRepCattleCostings: TfmSalesRepCattleCostings;

implementation

uses uSalesReport;

{$R *.DFM}

procedure TfmSalesRepCattleCostings.QRExpr188Print(sender: TObject; var Value: String);
begin
   if ( Sender is TQRExpr ) then
      if ( Length((Sender as TQRExpr).Expression) > 0 ) then
         Value := ReturnSumAvgWithValues((Sender as TQRExpr).Expression);
end;

procedure TfmSalesRepCattleCostings.QRExpr176Print(sender: TObject; var Value: String);
begin
   Value := PrintAverageKillOutPerc;
end;

end.
