unit uHerdStatsBreedingRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls;

type
  TfmHerdStatsBreedingRep = class(TForm)
    qrExtended: TQuickRep;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    Services: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel44: TQRLabel;
    QRTotBullCalves: TQRLabel;
    QRTotHeiferCalves: TQRLabel;
    QRTotDeadCalves: TQRLabel;
    QRTotLiveCalves: TQRLabel;
    QRTotAllCalves: TQRLabel;
    QRTotTwinBirths: TQRLabel;
    QRTotSingleBirths: TQRLabel;
    QRTotStillBirth: TQRLabel;
    QRTotAllCalvings: TQRLabel;
    QRTotFourthServ: TQRLabel;
    QRTotThirdServ: TQRLabel;
    QRTotSecondServ: TQRLabel;
    QRTotFirstServ: TQRLabel;
    QRTotAllServ: TQRLabel;
    QRPercAllServ: TQRLabel;
    QRPercFirstServ: TQRLabel;
    QRPerSecondServ: TQRLabel;
    QRPerThirdServ: TQRLabel;
    QRPercFourthServ: TQRLabel;
    QRPercAllCalvings: TQRLabel;
    QRPercStillBirth: TQRLabel;
    QRPercSingleBirths: TQRLabel;
    QRPercTwinBirths: TQRLabel;
    QRPercAllCalves: TQRLabel;
    QRPercLiveCalves: TQRLabel;
    QRPercDeadCalves: TQRLabel;
    QRPercHeiferCalves: TQRLabel;
    QRPercBullCalves: TQRLabel;
    QRLabel7: TQRLabel;
    lHerd2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel24: TQRLabel;
    QRPercNonReturnCows: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRPercNonReturnAll: TQRLabel;
    QRPercNonReturnHeifs: TQRLabel;
    QRNonReturnBased: TQRLabel;
    QRLabel41: TQRLabel;
    QRNoCowsServed: TQRLabel;
    QRLabel56: TQRLabel;
    QRAvgServed: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    qrlInseminator1: TQRLabel;
    qrlInseminator2: TQRLabel;
    qrlInseminator3: TQRLabel;
    qrlInseminatorRate1: TQRLabel;
    qrlInseminatorRate2: TQRLabel;
    qrlInseminatorRate3: TQRLabel;
    qrlhHerdCalvingIndices: TQRLabel;
    qrlCurrentCalvingIndex: TQRLabel;
    qrlProjectedCalvingIndex: TQRLabel;
    QRCurrentCalvingIndex: TQRLabel;
    QRProjectedCalvingIndex: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHerdStatsBreedingRep: TfmHerdStatsBreedingRep;

implementation

{$R *.DFM}

end.
