{
  14/04/2009 [Dev V3.9 R6.7] /MK Additional Feature - Change made to report to allow for both the Due Dry Off Date for the Service and the
                                                      PD to show on the report if the Include Service AND PD Projected Dates tick box is ticked.

  12/06/12 [V5.0 R7.1] /MK Bug Fix - Program Was Not Showing Total Animals If Blank Report.

  03/08/12 [V5.0 R9.7] /MK Additional Feature - Add animals in detail band to cart.

  18/07/13 [V5.1 R8.6] /MK Change - Removed FAnimalCartArray code as button in ActionReminderFlt Cart button adding animals to FAnimalCartArray

  18/11/15 [V5.5 R0.8] /MK Additional Feature - qrlIncludePostServiceHeatOrPostPDInd, qrlSD1VisibleIndicator & qr2SD1VisibleIndicator -
                                                - Added this labels as an indicator that the animal has had Heat after a PD or Service - GL/Trevor Kellett.
                                              - QRSubDetail1BeforePrint, MainHeader1BeforePrint - Check to see if animals have (PD = NO) and (PostServiceOrPDHeat = True).
  18/11/15 [V5.5 R0.8] /MK Change - qrlIncludePostServiceHeatOrPostPDInd - Changed caption of cows with post service and post pd heat to cows with Post-Service/PD Heat - GL.

  08/11/19 [V5.9 R1.2] /MK Additional Feature - Added High SCC and ICBF Mastitis Incidents.
                           Change - Modified the layout of the report to fit these new columns.

  12/11/19 [V5.9 R1.2] /MK Additional Feature - Instead of showing the word "Undefined" under Pregnant show it as blank as it is on the HerdApp.

  04/11/20 [V5.9 R7.2] /MK Change - Changed Pregnancy to Preg Status - GL request.
                                  - If the PD is Undefined then change it to ? similar to Due to Calve - GL request.

  07/07/21 [V6.0 R1.6] /MK Additional Feature - Added (>200 K) under the High SCC column, I had to move the column headings up to add this new text in.                                  
}

unit DueForDryingOff;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
     QRExport, GenTypesConst, Dialogs;

type
  TDueForDryingOffType = ( ddBlank, ddNormal, ddExtended );
  TDueForDryingOffScr = class(TQuickRep)
    MainHeader1: TQRBand;
    PageFooterBand1: TQRBand;
    qDueForDryingOff: TQuery;
    QRLabel1: TQRLabel;
    RptTitle1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    DataHeader: TQRBand;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    RptTitle3: TQRLabel;
    Period: TQRLabel;
    BlankFormDate: TQRLabel;
    VerLabel: TQRLabel;
    FormUnderline: TQRLabel;
    FormDate: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand1: TQRBand;
    QRLabel36: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel33: TQRLabel;
    qrlIncludePostServiceHeatOrPostPDInd: TQRLabel;
    qrlSD1VisibleIndicator: TQRLabel;
    qrlSD2VisibleIndicator: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    QRLabel2: TQRLabel;
    qrlHighSCC: TQRLabel;
    qrlMastIncid: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel10: TQRLabel;
    procedure DueForDryingOffScrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure MainHeader1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure DataHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText15Print(sender: TObject; var Value: String);
  private
    procedure DetailBandCartAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  public
     DueForDryingOffType : TDueForDryingOffType;
  end;

var
  DueForDryingOffScr: TDueForDryingOffScr;

implementation
uses
   ActionReminderFilt, uAnimalCart, DairyData;

{$R *.DFM}

procedure TDueForDryingOffScr.DueForDryingOffScrBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   if ( DueForDryingOffType = ddBlank ) Then
      Begin
         MainHeader1.Enabled := False;
         //QRSubDetail1.Enabled := False;
         QRSubDetail2.Enabled := False;

         FormDate.Enabled := True;
         FormDate.Show;
         FormUnderline.Enabled := True;
         FormUnderline.Show;
         DataHeader.Enabled := True;

         //   12/06/12 [V5.0 R7.1] /MK Bug Fix - Program Was Not Showing Total Animals If Blank Report.
         //QRBand1.Enabled := False;
         QRExpr2.Master := QRSubDetail1;

         PageFooterBand1.Enabled := True;

         QRSysData1.Parent := DataHeader;
         QRSysData2.Parent := DataHeader;

      end
   else if ( DueForDryingOffType in [ddExtended, ddNormal] ) then
      begin
         MainHeader1.Enabled := True;

         if ( DueForDryingOffType = ddNormal ) then
            begin
               QRSubDetail1.Enabled := True;
               QRSubDetail1.AfterPrint := DetailBandCartAfterPrint;
               QRSubDetail2.Enabled := False;
               QRExpr2.Master := QRSubDetail1;
            end
         else if ( DueForDryingOffType = ddExtended ) then
            begin
               QRSubDetail1.Enabled := False;
               QRSubDetail2.Enabled := True;
               QRSubDetail2.AfterPrint := DetailBandCartAfterPrint;
               QRExpr2.Master := QRSubDetail2;
            end;

         FormDate.Enabled := False;
         FormDate.Hide;
         FormUnderline.Enabled := False;
         FormUnderline.Hide;
         DataHeader.Enabled := False;

         QRBand1.Enabled := True;
         PageFooterBand1.Enabled := True;

         QRSysData1.Parent := MainHeader1;
         QRSysData2.Parent := MainHeader1;
      end;

end;

procedure TDueForDryingOffScr.MainHeader1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   i : Integer;
begin
   if DueForDryingOffType = ddExtended then
      begin
         for i := 0 to MainHeader1.ControlCount-1 do
            begin
               if ( MainHeader1.Controls[i] is TQRLabel ) then
                  if ( MainHeader1.Controls[i] as TQRLabel ).Tag = 2 then
                     begin
                        ( MainHeader1.Controls[i] as TQRLabel ).Enabled := False;
                        ( MainHeader1.Controls[i] as TQRLabel ).Visible := False;
                     end
                  else if ( MainHeader1.Controls[i] as TQRLabel ).Tag = 1 then
                     begin
                        ( MainHeader1.Controls[i] as TQRLabel ).Enabled := True;
                        ( MainHeader1.Controls[i] as TQRLabel ).Visible := True;
                     end;
            end;
      end
   else if DueForDryingOffType = ddNormal then
      begin
         for i := 0 to MainHeader1.ControlCount-1 do
            begin
               if ( MainHeader1.Controls[i] is TQRLabel ) then
                  if ( MainHeader1.Controls[i] as TQRLabel ).Tag = 1 then
                     begin
                        ( MainHeader1.Controls[i] as TQRLabel ).Enabled := False;
                        ( MainHeader1.Controls[i] as TQRLabel ).Visible := False;
                     end
                  else if ( MainHeader1.Controls[i] as TQRLabel ).Tag = 2 then
                     begin
                        ( MainHeader1.Controls[i] as TQRLabel ).Enabled := True;
                        ( MainHeader1.Controls[i] as TQRLabel ).Visible := True;
                     end;
            end;
      end;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(AnimalID)');
         SQL.Add('FROM DueToDryOff');
         SQL.Add('WHERE ( (Upper(PD) = "NO") AND (PostServiceOrPDHeat = TRUE) )');
         try
            Open;
            qrlIncludePostServiceHeatOrPostPDInd.Enabled := ( RecordCount > 0 ) and ( Fields[0].AsInteger > 0 );
            Close;
         except
         end;
      finally
         Free;
      end;
end;

procedure TDueForDryingOffScr.QRDBText14Print(sender: TObject;
  var Value: String);
begin
   if ( DueForDryingOffType = ddBlank ) or ( (Value = '30/12/1899') or (Value = '30/12/99') ) then
      Value := '';
end;

procedure TDueForDryingOffScr.DataHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ( DueForDryingOffType = ddBlank ) then
      begin
         RptTitle3.Caption := '';
         RptTitle3.Caption := 'Due For Drying Off - Recording Sheet';
      end;
end;

procedure TDueForDryingOffScr.DetailBandCartAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin

end;

procedure TDueForDryingOffScr.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   qrlSD1VisibleIndicator.Caption := '';
   qrlSD2VisibleIndicator.Caption := '';
   if ( UpperCase(qDueForDryingOff.FieldByName('PD').AsString) = 'NO' ) and ( qDueForDryingOff.FieldByName('PostServiceOrPDHeat').AsBoolean ) then
      begin
         qrlSD1VisibleIndicator.Caption := '**';
         qrlSD2VisibleIndicator.Caption := '**';
      end;
end;

procedure TDueForDryingOffScr.QRDBText15Print(sender: TObject;
  var Value: String);
begin
   if ( DueForDryingOffType = ddBlank ) then
      Value := ''
   else if ( UpperCase(Value) = 'UNDEFINED' ) then
      Value := '?';
end;

end.
