(*
 **************************************

  This report was created 21/11/2002
        by Shane Pilkington
           Niall Nolan.

 **************************************

   15/04/11 [V4.0 R9.6] /MK Additional Feature - If Herd Country = NIreland Then Change 7 Day Report Heading to Health & Welfare.

   16/07/13 [V5.1 R8.5] /MK Change - Changes to report requested by TGM.
                                   - Changes to report layout - removed "Organic Withdrawal" and "Health Code" text
                                   - Added new column for Health Code by resizing Medicine column.

   15/05/14 [V5.3 R0.3] /MK Additional Feature - Changed all Milk or Meat Withdrawal QRDBText Values to N/A if N/A drug.

   18/02/16 [V5.5 R5.0] /MK Bug Fix - Because we're check for string value, DataField, the checking string must be same cased on DataField name.
*)

unit uNIVetTreatments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QRExport, GenTypesConst, KRoutines;

type
  TNIVetTreatmentsScr = class(TForm)
    qrNIVetTreatmentsScr: TQuickRep;
    RptTitle: TQRBand;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    Detail: TQRSubDetail;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRBand4: TQRBand;
    QRLabel34: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    Verlabel: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText15: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure RptTitleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure PrintNALabelForMeat(sender: TObject; var Value: String);
    procedure PrintNALabelForMilk(sender: TObject; var Value: String);
  private
    DefCountry : TCountry;
    { Private declarations }
  public
    { Public declarations }
  end;

var
   NIVetTreatmentsScr: TNIVetTreatmentsScr;

implementation
uses
   DairyData, HealthFilterU, uHerdLookup;
{$R *.DFM}

procedure TNIVetTreatmentsScr.QRDBText2Print(sender: TObject;
  var Value: String);
begin
   if Value <> '' then
      Value := '* ' +Value;
end;

procedure TNIVetTreatmentsScr.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ( not(HerdLookup.HerdOwnerData.OrganicHerd) ) then
      begin
         QRDBText3.Enabled := False;
         QRDBText7.Enabled := False;
         QRDBText4.Enabled := False;
         QRDBText9.Enabled := False;
      end;
end;

procedure TNIVetTreatmentsScr.QRLabel1Print(sender: TObject;
  var Value: String);
begin
   if DefCountry =  NIreland then
      Value := 'Health & Welfare'
   else
      Value := '7 Day Report';
end;

procedure TNIVetTreatmentsScr.FormCreate(Sender: TObject);
begin
   DefCountry := WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger);
end;

procedure TNIVetTreatmentsScr.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if ( Value <> '' ) then
      begin
         Value := StripAllSpaces(Value);
      end;
end;

procedure TNIVetTreatmentsScr.QRDBText5Print(sender: TObject;
  var Value: String);
begin
   if ( (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsFloat <= 0 ) then
      Value := '';
end;

procedure TNIVetTreatmentsScr.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if ( (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0 ) then
      Value := '';
end;

procedure TNIVetTreatmentsScr.RptTitleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ( not(HerdLookup.HerdOwnerData.OrganicHerd) ) then
      begin
         QRLabel2.Enabled := False;
         QRLabel3.Enabled := False;
      end;
end;

procedure TNIVetTreatmentsScr.QRDBText7Print(sender: TObject;
  var Value: String);
begin
   if ( (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsFloat <= 0 ) then
      Value := ''
   else
      Value := Value+')';
end;

procedure TNIVetTreatmentsScr.PrintNALabelForMeat(sender: TObject;
  var Value: String);
begin
   if ( TQRDBText(Sender).DataField = 'WithdrawalDate' ) or ( TQRDBText(Sender).DataField = 'OrganicMeatWD' ) then
      if ( TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 ) then
         Value := '';

   if ( TQRDBText(Sender).DataSet.FieldByName('MeatN_A_Drug').AsBoolean ) then
       Value := 'N/A'
end;

procedure TNIVetTreatmentsScr.PrintNALabelForMilk(sender: TObject;
  var Value: String);
begin
   //   18/02/16 [V5.5 R4.1] /MK Bug Fix - Because we're check for string value, DataField, the checking string must be same cased on DataField name.
   if ( TQRDBText(Sender).DataField = 'MilkWD' ) or ( TQRDBText(Sender).DataField = 'OrganicMilkWD' ) then
      if ( TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 ) then
         Value := '';

   if ( TQRDBText(Sender).DataSet.FieldByName('MilkN_A_Drug').AsBoolean ) then
       Value := 'N/A'
end;

end.
