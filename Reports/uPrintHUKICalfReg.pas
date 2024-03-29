unit uPrintHUKICalfReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QRExport;

type
  TfPrintHUKICalfReg = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    lHerdPrefix: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRExprMemo2: TQRExprMemo;
    QRLabel4: TQRLabel;
    lHFSPinNo: TQRLabel;
    QrLabel: TQRLabel;
    QRBand3: TQRBand;
    QRLabel44: TQRLabel;
    VerLabel: TQRLabel;
    QRMemo1: TQRMemo;
    lCount: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    i : Integer;
  public
    { Public declarations }
  end;

var
  fPrintHUKICalfReg: TfPrintHUKICalfReg;

implementation
uses
   uHFSCalfReg;
{$R *.DFM}

procedure TfPrintHUKICalfReg.FormCreate(Sender: TObject);
begin
   QRExprMemo2.RemoveBlankLines := False;
   i := 1;
//   lHerdPrefix.Caption := '';
//   lHFSPinNo.Caption := '';
end;

procedure TfPrintHUKICalfReg.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if i = 1 then
      begin
         QRMemo1.Visible := True;
         QRMemo1.Width := 117;

         QRExprMemo2.Left := 124;
      end
   else
      begin
         if i = 2 then
            QRExprMemo2.Left := 70
         else
            QRExprMemo2.Left := 40;

         QRMemo1.Visible := False;
         QRMemo1.Width := 0;

  //       QRExprMemo2.Left := 40;
      end;
   inc(i);
         if i = 5 then
            i := 1;

end;

end.
