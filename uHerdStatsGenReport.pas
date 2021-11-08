unit uHerdStatsGenReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QRCtrls, QuickRpt, ExtCtrls;

type
  TfmHerdStatsGenReport = class(TForm)
    qrStats: TQuickRep;
    QRBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    lHerd: TQRLabel;
    QRBand2: TQRBand;
    Label12: TLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRTotCows: TQRLabel;
    QRTotNotServed: TQRLabel;
    QRTotServedNotPD: TQRLabel;
    QRTotPdCon: TQRLabel;
    QRTotMilk: TQRLabel;
    QRTotDry: TQRLabel;
    QRPerCows: TQRLabel;
    QRPerNotServed: TQRLabel;
    QRPerServedNotPD: TQRLabel;
    QRPerPdCon: TQRLabel;
    QRPerMilk: TQRLabel;
    QRPerDry: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRTotDHeifers: TQRLabel;
    QRTotBHeifers: TQRLabel;
    QRTotDBulls: TQRLabel;
    QRTotSteers: TQRLabel;
    QRTotBBulls: TQRLabel;
    QRPerDHeifers: TQRLabel;
    QRPerBHeifers: TQRLabel;
    QRPerDBulls: TQRLabel;
    QRPerBBulls: TQRLabel;
    QRPerSteers: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHerdStatsGenReport: TfmHerdStatsGenReport;

implementation

{$R *.DFM}

end.
