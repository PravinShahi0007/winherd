unit uSalesRepNoFarmCosts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TfmSalesRepNoFarmCosts = class(TForm)
    qrNoFarmCost: TQuickRep;
    QRBand6: TQRBand;
    NoFarmCostsTitleLabel: TQRLabel;
    QRShape44: TQRShape;
    NoFarmCostsSortLabel: TQRLabel;
    NoFarmCostsOrderLabel: TQRLabel;
    NoFarmCostsSortOptionsLabel: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData5: TQRSysData;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel25: TQRLabel;
    NoFarmCostsSupplierLabel: TQRLabel;
    NoFarmCostsBuyerLabel: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    NoFarmCostsCustomerLabel: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    lNoFarmCostsSaleFrom: TQRLabel;
    lNoFarmCostsPurchFrom: TQRLabel;
    lNoFarmCostsSaleTo: TQRLabel;
    lNoFarmCostsPurchTo: TQRLabel;
    QRLabel84: TQRLabel;
    lNoFarmCostsSexType: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel117: TQRLabel;
    qrlNoFarmCostsBuyerSupplier: TQRLabel;
    QRShape61: TQRShape;
    QRLabel120: TQRLabel;
    lNoFarmCostsGradesTitle: TQRLabel;
    lNoFarmCostsWeightsTitle: TQRLabel;
    lNoFarmCostsGrades: TQRLabel;
    lNoFarmCostsWeights: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    qrlNoFarmCostsHerdName: TQRLabel;
    QRBand7: TQRBand;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRExpr79: TQRExpr;
    QRExpr81: TQRExpr;
    QRExpr82: TQRExpr;
    QRExpr84: TQRExpr;
    QRExpr85: TQRExpr;
    QRExpr86: TQRExpr;
    QRExpr87: TQRExpr;
    QRExpr88: TQRExpr;
    QRExpr89: TQRExpr;
    QRExpr90: TQRExpr;
    QRExpr91: TQRExpr;
    QRExpr92: TQRExpr;
    QRExpr93: TQRExpr;
    QRExpr94: TQRExpr;
    QRExpr95: TQRExpr;
    QRExpr96: TQRExpr;
    QRExpr99: TQRExpr;
    QRExpr100: TQRExpr;
    QRExpr101: TQRExpr;
    QRExpr102: TQRExpr;
    QRExpr103: TQRExpr;
    QRExpr104: TQRExpr;
    QRExpr105: TQRExpr;
    QRExpr106: TQRExpr;
    QRExpr107: TQRExpr;
    QRExpr108: TQRExpr;
    QRExpr109: TQRExpr;
    QRExpr110: TQRExpr;
    QRExpr111: TQRExpr;
    QRExpr112: TQRExpr;
    QRExpr113: TQRExpr;
    QRExpr116: TQRExpr;
    QRExpr117: TQRExpr;
    QRShape68: TQRShape;
    QRBand8: TQRBand;
    QRLabel130: TQRLabel;
    NoFarmCostsPremVerLabel: TQRLabel;
    QRShape69: TQRShape;
    NoFarmCostsDetailBand: TQRBand;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    NoFarmCostsBuyer_Supplier: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText6: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure QRExpr116Print(sender: TObject; var Value: String);
    procedure QRExpr104Print(sender: TObject; var Value: String);
    procedure QRExpr112Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSalesRepNoFarmCosts: TfmSalesRepNoFarmCosts;

implementation

uses uSalesReport;

{$R *.DFM}

procedure TfmSalesRepNoFarmCosts.QRExpr116Print(sender: TObject; var Value: String);
begin
   if ( Sender is TQRExpr ) then
      if ( Length((Sender as TQRExpr).Expression) > 0 ) then
         Value := ReturnSumAvgWithValues((Sender as TQRExpr).Expression);
end;

procedure TfmSalesRepNoFarmCosts.QRExpr104Print(sender: TObject; var Value: String);
begin
   Value := PrintAverageKillOutPerc;
end;

procedure TfmSalesRepNoFarmCosts.QRExpr112Print(sender: TObject; var Value: String);
begin
   Value := PrintAvgNetMargPerDayOnFarm;
end;

end.
