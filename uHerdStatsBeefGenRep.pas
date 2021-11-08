unit uHerdStatsBeefGenRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QRCtrls, QuickRpt, ExtCtrls;

type
  TfmHerdStatsBeefGenRep = class(TForm)
    qrBeefStats: TQuickRep;
    QRBand4: TQRBand;
    QRLabel14: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel23: TQRLabel;
    lHerd3: TQRLabel;
    QRBand5: TQRBand;
    Label42: TLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    lAllBeefCattle: TQRLabel;
    lBeefHeiferNo: TQRLabel;
    lBeefBullNo: TQRLabel;
    LSteerNo: TQRLabel;
    lAllBeefCalttleNos: TQRLabel;
    lBeefHeiferNoPerc: TQRLabel;
    lBeefBullNoPerc: TQRLabel;
    LSteerNoPerc: TQRLabel;
    lAllBeefCalttleNoPerc: TQRLabel;
    QRLabel28: TQRLabel;
    lFromDateValue: TQRLabel;
    lToDate: TQRLabel;
    lToDateValue: TQRLabel;
    QRLabel34: TQRLabel;
    lSexValue: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    lTotalAnimalDaysValue: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    lTotalAnimalsValue: TQRLabel;
    QRLabel37: TQRLabel;
    lAverageDaysValue: TQRLabel;
    QRLabel40: TQRLabel;
    lAverageDLWGValue: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHerdStatsBeefGenRep: TfmHerdStatsBeefGenRep;

implementation

{$R *.DFM}

end.
