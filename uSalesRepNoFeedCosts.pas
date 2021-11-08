unit uSalesRepNoFeedCosts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls, QRExport;

type
  TfmSalesRepNoFeedCosts = class(TForm)
    qrNoFeedCosts: TQuickRep;
    QRBand3: TQRBand;
    NoFeedCostsTitleLabel: TQRLabel;
    QRShape58: TQRShape;
    NoFeedCostsSortLabel: TQRLabel;
    NoFeedCostsOrderLabel: TQRLabel;
    NoFeedCostsSortOptionsLabel: TQRLabel;
    QRSysData6: TQRSysData;
    QRSysData7: TQRSysData;
    QRShape64: TQRShape;
    QRShape73: TQRShape;
    QRLabel22: TQRLabel;
    NoFeedCostsSupplierLabel: TQRLabel;
    NoFeedCostsBuyerLabel: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel75: TQRLabel;
    NoFeedCostsCustomerLabel: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel85: TQRLabel;
    lNoFeedCostsSaleFrom: TQRLabel;
    lNoFeedCostsPurchFrom: TQRLabel;
    lNoFeedCostsSaleTo: TQRLabel;
    lNoFeedCostsPurchTo: TQRLabel;
    QRLabel119: TQRLabel;
    lNoFeedCostsSexType: TQRLabel;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    qrlBuyerSupplierNoFeed: TQRLabel;
    QRShape83: TQRShape;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    lNoFeedCostsGradesTitle: TQRLabel;
    lNoFeedCostsWeightsTitle: TQRLabel;
    lNoFeedCostsGrades: TQRLabel;
    lNoFeedCostsWeights: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    qrlNoFeedCostsHerdName: TQRLabel;
    QRLabel132: TQRLabel;
    QRBand9: TQRBand;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRExpr80: TQRExpr;
    QRExpr97: TQRExpr;
    QRExpr98: TQRExpr;
    QRExpr114: TQRExpr;
    QRExpr115: TQRExpr;
    QRExpr118: TQRExpr;
    QRExpr119: TQRExpr;
    QRExpr120: TQRExpr;
    QRExpr121: TQRExpr;
    QRExpr122: TQRExpr;
    QRExpr123: TQRExpr;
    QRExpr124: TQRExpr;
    QRExpr125: TQRExpr;
    QRExpr126: TQRExpr;
    QRExpr127: TQRExpr;
    QRExpr128: TQRExpr;
    QRExpr129: TQRExpr;
    QRExpr131: TQRExpr;
    QRExpr132: TQRExpr;
    QRExpr133: TQRExpr;
    QRExpr134: TQRExpr;
    QRExpr135: TQRExpr;
    QRExpr136: TQRExpr;
    QRExpr137: TQRExpr;
    QRExpr138: TQRExpr;
    QRExpr139: TQRExpr;
    QRExpr140: TQRExpr;
    QRExpr141: TQRExpr;
    QRExpr142: TQRExpr;
    QRExpr143: TQRExpr;
    QRExpr144: TQRExpr;
    QRExpr145: TQRExpr;
    QRExpr146: TQRExpr;
    QRExpr147: TQRExpr;
    QRExpr148: TQRExpr;
    QRExpr149: TQRExpr;
    QRExpr150: TQRExpr;
    QRShape90: TQRShape;
    QRExpr83: TQRExpr;
    QRExpr130: TQRExpr;
    QRBand10: TQRBand;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRShape91: TQRShape;
    QRBand11: TQRBand;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    Buyer_SupplierNoFeed: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText43: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure QRExpr149Print(sender: TObject; var Value: String);
    procedure QRExpr137Print(sender: TObject; var Value: String);
    procedure QRExpr145Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSalesRepNoFeedCosts: TfmSalesRepNoFeedCosts;

implementation

uses uSalesReport;

{$R *.DFM}

procedure TfmSalesRepNoFeedCosts.QRExpr149Print(sender: TObject; var Value: String);
begin
   if ( Sender is TQRExpr ) then
      if ( Length((Sender as TQRExpr).Expression) > 0 ) then
         Value := ReturnSumAvgWithValues((Sender as TQRExpr).Expression);
end;

procedure TfmSalesRepNoFeedCosts.QRExpr137Print(sender: TObject; var Value: String);
begin
   Value := PrintAverageKillOutPerc;
end;

procedure TfmSalesRepNoFeedCosts.QRExpr145Print(sender: TObject; var Value: String);
begin
   Value := PrintAvgNetMargPerDayOnFarm;
end;

end.
