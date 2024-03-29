{
   02/12/11 [V5.0 R2.4] /MK Change - Changed Caption of QRLabel29 From "Culled Cows" to "Cull Cows".

   10/10/12 [V5.1 R0.3] /MK Change - QRLabel56 not enabled anymore.

   17/09/13 [V5.2 R1.4] /MK Change - Do not show Opening and Closing valuations if report ran from Bord Bia screen.

   14/11/13 [V5.2 R5.4] /MK Bug Fix - Totals of Opening and Closing were left out of check for Bord Bia.    

   25/11/13 [V5.2 R5.8] /MK Bug Fix - BCostTotal/CCostTotal - Convert to euro on Label Print not before as "Invalid Floating Point" appears for these values.

   01/04/14 [V5.2 R9.3] /MK Additional Feature - Change the tile of the repor to Annual Livestock Movements if Bord Bia.

   08/08/18 [V5.8 R2.2] /MK Change - Changed title from Annual Livestock Valuation to Annual Livestock Inventory - GL request.      
}

unit uLiveStockInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, DB, QRExport;

type
  TfmLiveStockInvent = class(TForm)
    qrStockCtrl: TQuickRep;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel54: TQRLabel;
    QRShape15: TQRShape;
    CowInMilk: TQRLabel;
    CIMBirth: TQRLabel;
    CIMTr: TQRLabel;
    CIMPurch: TQRLabel;
    CIMSale: TQRLabel;
    CIMCF: TQRLabel;
    CDryCF: TQRLabel;
    CowDry: TQRLabel;
    CDryBirth: TQRLabel;
    CDryPurch: TQRLabel;
    CDrySale: TQRLabel;
    CDryTr: TQRLabel;
    BBeefCF06Mth: TQRLabel;
    BBeefBF06Mth: TQRLabel;
    BBeefBirth06Mth: TQRLabel;
    BBeefPurch06Mth: TQRLabel;
    BBeefSale06Mth: TQRLabel;
    BBeefTr06Mth: TQRLabel;
    H12CF: TQRLabel;
    Heifs12: TQRLabel;
    H12Purch: TQRLabel;
    H12Sale: TQRLabel;
    H12Tr: TQRLabel;
    Heifs06: TQRLabel;
    H06Purch: TQRLabel;
    H06Sale: TQRLabel;
    H06Tr: TQRLabel;
    H06CF: TQRLabel;
    H24CF: TQRLabel;
    Heifs24: TQRLabel;
    H24Purch: TQRLabel;
    H24Sale: TQRLabel;
    H24Tr: TQRLabel;
    Heifs18: TQRLabel;
    H18Purch: TQRLabel;
    H18Sale: TQRLabel;
    H18Tr: TQRLabel;
    H18CF: TQRLabel;
    HeifsOver24: TQRLabel;
    HOver24Purch: TQRLabel;
    HOver24Sale: TQRLabel;
    HOver24Tr: TQRLabel;
    HOver24CF: TQRLabel;
    TotalCF: TQRLabel;
    TotalTr: TQRLabel;
    TotalSale: TQRLabel;
    TotalPurch: TQRLabel;
    TotalDeath: TQRLabel;
    TotalBirth: TQRLabel;
    TotalBF: TQRLabel;
    SteersOver24: TQRLabel;
    Steers24: TQRLabel;
    Steers18: TQRLabel;
    Steers12: TQRLabel;
    Steers06: TQRLabel;
    S06Purch: TQRLabel;
    S06Sale: TQRLabel;
    S06Tr: TQRLabel;
    S06CF: TQRLabel;
    S12CF: TQRLabel;
    S12Tr: TQRLabel;
    S12Sale: TQRLabel;
    S12Purch: TQRLabel;
    S18Purch: TQRLabel;
    S18Sale: TQRLabel;
    S18Tr: TQRLabel;
    S18CF: TQRLabel;
    S24CF: TQRLabel;
    S24Tr: TQRLabel;
    S24Sale: TQRLabel;
    S24Purch: TQRLabel;
    SOver24Purch: TQRLabel;
    SOver24Sale: TQRLabel;
    SOver24Tr: TQRLabel;
    SOver24CF: TQRLabel;
    BBreedBF: TQRLabel;
    BBreedBirth: TQRLabel;
    BBreedPurch: TQRLabel;
    BBreedSale: TQRLabel;
    BBreedTr: TQRLabel;
    BBreedCF: TQRLabel;
    QRShape16: TQRShape;
    H06Birth: TQRLabel;
    H12Birth: TQRLabel;
    H18Birth: TQRLabel;
    H24Birth: TQRLabel;
    HOver24Birth: TQRLabel;
    S06Birth: TQRLabel;
    S12Birth: TQRLabel;
    S18Birth: TQRLabel;
    S24Birth: TQRLabel;
    SOver24Birth: TQRLabel;
    CIMDeath: TQRLabel;
    CDryDeath: TQRLabel;
    BBreedDeath: TQRLabel;
    BBeefDeath06Mth: TQRLabel;
    H06Death: TQRLabel;
    H12Death: TQRLabel;
    H18Death: TQRLabel;
    H24Death: TQRLabel;
    HOver24Death: TQRLabel;
    S06Death: TQRLabel;
    S12Death: TQRLabel;
    S18Death: TQRLabel;
    S24Death: TQRLabel;
    SOver24Death: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    LFromDate: TQRLabel;
    lToDate: TQRLabel;
    lHerd: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QrOpenValue: TQRLabel;
    qrCloseValue: TQRLabel;
    BCostInMilk: TQRLabel;
    BCostDry: TQRLabel;
    BCostBreedBull: TQRLabel;
    BCostBeefBull06Mth: TQRLabel;
    BCostH6: TQRLabel;
    BCostH12: TQRLabel;
    BCostH18: TQRLabel;
    BCostH24: TQRLabel;
    BCostH24Plus: TQRLabel;
    BCostS6: TQRLabel;
    BCostS12: TQRLabel;
    BCostS18: TQRLabel;
    BCostS24: TQRLabel;
    BCostS24Plus: TQRLabel;
    CCostS24Plus: TQRLabel;
    CCostS24: TQRLabel;
    CCostS18: TQRLabel;
    CCostS12: TQRLabel;
    CCostS6: TQRLabel;
    CCostH24Plus: TQRLabel;
    CCostH24: TQRLabel;
    CCostH18: TQRLabel;
    CCostH12: TQRLabel;
    CCostH6: TQRLabel;
    CCostBeefBull06Mth: TQRLabel;
    CCostBreedBull: TQRLabel;
    CCostDry: TQRLabel;
    CCostInMilk: TQRLabel;
    CCostTotal: TQRLabel;
    BCostTotal: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    PageFooterBand2: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel28: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel1: TQRLabel;
    BCostBeefBull612Mth: TQRLabel;
    BBeefBF612Mth: TQRLabel;
    BBeefBirth612Mth: TQRLabel;
    BBeefDeath612Mth: TQRLabel;
    BBeefPurch612Mth: TQRLabel;
    BBeefSale612Mth: TQRLabel;
    BBeefTr612Mth: TQRLabel;
    BBeefCF612Mth: TQRLabel;
    CCostBeefBull612Mth: TQRLabel;
    QRLabel2: TQRLabel;
    BCostBeefBull12PMth: TQRLabel;
    BBeefBF12PMth: TQRLabel;
    BBeefBirth12PMth: TQRLabel;
    BBeefDeath12PMth: TQRLabel;
    BBeefPurch12PMth: TQRLabel;
    BBeefSale12PMth: TQRLabel;
    BBeefTr12PMth: TQRLabel;
    BBeefCF12PMth: TQRLabel;
    CCostBeefBull12PMth: TQRLabel;
    QRLabel4: TQRLabel;
    procedure qrStockCtrlBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BCostInMilkPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure qrStockCtrlAfterPrint(Sender: TObject);
    procedure qrStockCtrlEndPage(Sender: TCustomQuickRep);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    HerdID : Byte;
    procedure SaveLiveStockCurrencyValues;
  end;

var
  fmLiveStockInvent: TfmLiveStockInvent;
  CurrStr : String[1];

implementation
uses
   DairyData, uLivestockSum, GenTypesConst;

{$R *.DFM}

{ TfmLiveStockInvent }

procedure TfmLiveStockInvent.SaveLiveStockCurrencyValues;
begin
   try
      WinData.LiveStockValues.Active := True;
      if WinData.LiveStockValues.Locate('HerdID', HerdID, [loCaseInsensitive]) then
         begin
            if fLivestockSum.rgEnterpriseType.ItemIndex = 0 then
               begin
                  with fmLiveStockInvent do
                     begin
                        {------------------------- Brought Forward Calcs -------------------------}

                        if CowInMilk.Caption <> '0' then
                           BCostInMilk.Caption         := FloatToStrF(StrToInt(CowInMilk.Caption) * (WinData.LiveStockValues.FieldByName('CowsInMilk').AsFloat), ffFixed, 8, 2);
                        if CowDry.Caption <> '0' then
                           BCostDry.Caption            := FloatToStrF(StrToInt(CowDry.Caption) * (WinData.LiveStockValues.FieldByName('CowsDry').AsFloat), ffFixed, 8, 2);
                        if BBreedBF.Caption <> '0' then
                           BCostBreedBull.Caption      := FloatToStrF(StrToInt(BBreedBF.Caption) * (WinData.LiveStockValues.FieldByName('BullBreed').AsFloat), ffFixed, 8, 2);
                        if BBeefBF06Mth.Caption <> '0' then
                           BCostBeefBull06Mth.Caption       := FloatToStrF(StrToInt(BBeefBF06Mth.Caption) * (WinData.LiveStockValues.FieldByName('BullBeef06').AsFloat), ffFixed, 8, 2) ;
                        if BBeefBF612Mth.Caption <> '0' then
                           BCostBeefBull612Mth.Caption       := FloatToStrF(StrToInt(BBeefBF612Mth.Caption) * (WinData.LiveStockValues.FieldByName('BullBeef612').AsFloat), ffFixed, 8, 2) ;
                        if BBeefBF12PMth.Caption <> '0' then
                           BCostBeefBull12PMth.Caption       := FloatToStrF(StrToInt(BBeefBF12PMth.Caption) * (WinData.LiveStockValues.FieldByName('BullBeef12Plus').AsFloat), ffFixed, 8, 2) ;


                        if Heifs06.Caption <> '0' then
                           BCostH6.Caption             := FloatToStrF(StrToInt(Heifs06.Caption) * (WinData.LiveStockValues.FieldByName('Heifer06').AsFloat), ffFixed, 8, 2);
                        if Heifs12.Caption <> '0' then
                           BCostH12.Caption            := FloatToStrF(StrToInt(Heifs12.Caption) * (WinData.LiveStockValues.FieldByName('Heifer612').AsFloat), ffFixed, 8, 2);
                        if Heifs18.Caption <> '0' then
                           BCostH18.Caption            := FloatToStrF(StrToInt(Heifs18.Caption) * (WinData.LiveStockValues.FieldByName('Heifer1218').AsFloat), ffFixed, 8, 2);
                        if Heifs24.Caption <> '0' then
                           BCostH24.Caption            := FloatToStrF(StrToInt(Heifs24.Caption) * (WinData.LiveStockValues.FieldByName('Heifer1824').AsFloat), ffFixed, 8, 2);
                        if HeifsOver24.Caption <> '0' then
                           BCostH24Plus.Caption        := FloatToStrF(StrToInt(HeifsOver24.Caption) * (WinData.LiveStockValues.FieldByName('Heifer24Plus').AsFloat), ffFixed, 8, 2);

                        if Steers06.Caption <> '0' then
                           BCostS6.Caption             := FloatToStrF(StrToInt(Steers06.Caption) * (WinData.LiveStockValues.FieldByName('Steer06').AsFloat), ffFixed, 8, 2);
                        if Steers12.Caption <> '0' then
                           BCostS12.Caption            := FloatToStrF(StrToInt(Steers12.Caption) * (WinData.LiveStockValues.FieldByName('Steer612').AsFloat), ffFixed, 8, 2);
                        if Steers18.Caption <> '0' then
                           BCostS18.Caption            := FloatToStrF(StrToInt(Steers18.Caption) * (WinData.LiveStockValues.FieldByName('Steer1218').AsFloat), ffFixed, 8, 2);
                        if Steers24.Caption <> '0' then
                           BCostS24.Caption            := FloatToStrF(StrToInt(Steers24.Caption) * (WinData.LiveStockValues.FieldByName('Steer1824').AsFloat), ffFixed, 8, 2);
                        if SteersOver24.Caption <> '0' then
                           BCostS24Plus.Caption        := FloatToStrF(StrToInt(SteersOver24.Caption) * (WinData.LiveStockValues.FieldByName('Steer24Plus').AsFloat), ffFixed, 8, 2);

                        {------------------------- Carried Forward Calcs -------------------------}

                        if CIMCF.Caption <> '0' then
                           CCostInMilk.Caption         := FloatToStrF(StrToInt(CIMCF.Caption) * (WinData.LiveStockValues.FieldByName('CowsInMilk').AsFloat), ffFixed, 8, 2);
                        if CDryCF.Caption <> '0' then
                           CCostDry.Caption            := FloatToStrF(StrToInt(CDryCF.Caption) * (WinData.LiveStockValues.FieldByName('CowsDry').AsFloat), ffFixed, 8, 2);
                        if BBreedCF.Caption <> '0' then
                           CCostBreedBull.Caption      := FloatToStrF(StrToInt(BBreedCF.Caption) * (WinData.LiveStockValues.FieldByName('BullBreed').AsFloat), ffFixed, 8, 2);
                        if BBeefCF06Mth.Caption <> '0' then
                           CCostBeefBull06Mth.Caption  := FloatToStrF(StrToInt(BBeefCF06Mth.Caption) * (WinData.LiveStockValues.FieldByName('BullBeef06').AsFloat), ffFixed, 8, 2);
                        if BBeefCF612Mth.Caption <> '0' then
                           CCostBeefBull612Mth.Caption := FloatToStrF(StrToInt(BBeefCF612Mth.Caption) * (WinData.LiveStockValues.FieldByName('BullBeef612').AsFloat), ffFixed, 8, 2);
                        if BBeefCF12PMth.Caption <> '0' then
                           CCostBeefBull12PMth.Caption := FloatToStrF(StrToInt(BBeefCF12PMth.Caption) * (WinData.LiveStockValues.FieldByName('BullBeef12Plus').AsFloat), ffFixed, 8, 2);

                        if H06CF.Caption <> '0' then
                           CCostH6.Caption := FloatToStrF(StrToInt(H06CF.Caption) * (WinData.LiveStockValues.FieldByName('Heifer06').AsFloat), ffFixed, 8, 2);
                        if H12CF.Caption <> '0' then
                           CCostH12.Caption := FloatToStrF(StrToInt(H12CF.Caption) * (WinData.LiveStockValues.FieldByName('Heifer612').AsFloat), ffFixed, 8, 2);
                        if H18CF.Caption <> '0' then
                           CCostH18.Caption := FloatToStrF(StrToInt(H18CF.Caption) * (WinData.LiveStockValues.FieldByName('Heifer1218').AsFloat), ffFixed, 8, 2);
                        if H24CF.Caption <> '0' then
                           CCostH24.Caption := FloatToStrF(StrToInt(H24CF.Caption) * (WinData.LiveStockValues.FieldByName('Heifer1824').AsFloat), ffFixed, 8, 2);
                        if HOver24CF.Caption <> '0' then
                           CCostH24Plus.Caption := FloatToStrF(StrToInt(HOver24CF.Caption) * (WinData.LiveStockValues.FieldByName('Heifer24Plus').AsFloat), ffFixed, 8, 2);

                        if S06CF.Caption <> '0' then
                           CCostS6.Caption             := FloatToStrF(StrToInt(S06CF.Caption) * (WinData.LiveStockValues.FieldByName('Steer06').AsFloat), ffFixed, 8, 2);
                        if S12CF.Caption <> '0' then
                           CCostS12.Caption            := FloatToStrF(StrToInt(S12CF.Caption) * (WinData.LiveStockValues.FieldByName('Steer612').AsFloat), ffFixed, 8, 2);
                        if S18CF.Caption <> '0' then
                           CCostS18.Caption            := FloatToStrF(StrToInt(S18CF.Caption) * (WinData.LiveStockValues.FieldByName('Steer1218').AsFloat), ffFixed, 8, 2);
                        if S24CF.Caption <> '0' then
                           CCostS24.Caption            := FloatToStrF(StrToInt(S24CF.Caption) * (WinData.LiveStockValues.FieldByName('Steer1824').AsFloat), ffFixed, 8, 2);
                        if SOver24CF.Caption <> '0' then
                           CCostS24Plus.Caption        := FloatToStrF(StrToInt(SOver24CF.Caption) * (WinData.LiveStockValues.FieldByName('Steer24Plus').AsFloat), ffFixed, 8, 2);

                        { Save Opening/Closing Balance to LiveStkDefaults table}
                        WinData.LiveStockValues.Edit;
                        WinData.LiveStockValues.FieldByName('OpeningValue').AsFloat := StrToFloat(BCostInMilk.Caption) + StrToFloat(BCostDry.Caption) + StrToFloat(BCostBreedBull.Caption) + StrToFloat(BCostBeefBull06Mth.Caption) + StrToFloat(BCostBeefBull612Mth.Caption) + StrToFloat(BCostBeefBull12PMth.Caption) + StrToFloat(BCostH6.Caption) + StrToFloat(BCostH12.Caption) + StrToFloat(BCostH18.Caption) + StrToFloat(BCostH24.Caption) + StrToFloat(BCostH24Plus.Caption) + StrToFloat(BCostS6.Caption) + StrToFloat(BCostS12.Caption) + StrToFloat(BCostS18.Caption) + StrToFloat(BCostS24.Caption) + StrToFloat(BCostS24Plus.Caption);
                        WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat := StrToFloat(CCostInMilk.Caption) + StrToFloat(CCostDry.Caption) + StrToFloat(CCostBreedBull.Caption) + StrToFloat(CCostBeefBull06Mth.Caption) + StrToFloat(CCostBeefBull612Mth.Caption) + StrToFloat(CCostBeefBull12PMth.Caption) + StrToFloat(CCostH6.Caption) + StrToFloat(CCostH12.Caption) + StrToFloat(CCostH18.Caption) + StrToFloat(CCostH24.Caption) + StrToFloat(CCostH24Plus.Caption) + StrToFloat(CCostS6.Caption) + StrToFloat(CCostS12.Caption) + StrToFloat(CCostS18.Caption) + StrToFloat(CCostS24.Caption) + StrToFloat(CCostS24Plus.Caption);
                        WinData.LiveStockValues.Post;

                        //   25/11/13 [V5.2 R5.8] /MK Bug Fix - Convert to euro on Label Print not before as "Invalid Floating Point" appears for these values.
                        BCostTotal.Caption := FloatToStrF(WinData.LiveStockValues.FieldByName('OpeningValue').AsFloat,ffFixed,8,2);
                        CCostTotal.Caption := FloatToStrF(WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat,ffFixed,8,2);
                     end
               end
         else
            begin
               with fmLiveStockInvent do
                  begin
                     {------------------------- Brought Forward Calcs -------------------------}

                     if CowInMilk.Caption <> '0' then
                        BCostInMilk.Caption         := FloatToStrF(StrToInt(CowInMilk.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeCowsInMilk').AsFloat), ffFixed, 8, 2);
                     if CowDry.Caption <> '0' then
                        BCostDry.Caption            := FloatToStrF(StrToInt(CowDry.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeCowsDry').AsFloat), ffFixed, 8, 2);
                     if BBreedBF.Caption <> '0' then
                        BCostBreedBull.Caption      := FloatToStrF(StrToInt(BBreedBF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeBullBreed').AsFloat), ffFixed, 8, 2);
                     if BBeefBF06Mth.Caption <> '0' then
                        BCostBeefBull06Mth.Caption       := FloatToStrF(StrToInt(BBeefBF06Mth.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeBullBeef06').AsFloat), ffFixed, 8, 2) ;
                     if BBeefBF612Mth.Caption <> '0' then
                        BCostBeefBull612Mth.Caption       := FloatToStrF(StrToInt(BBeefBF612Mth.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeBullBeef612').AsFloat), ffFixed, 8, 2) ;
                     if BBeefBF12PMth.Caption <> '0' then
                        BCostBeefBull12PMth.Caption       := FloatToStrF(StrToInt(BBeefBF12PMth.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeBullBeef12Plus').AsFloat), ffFixed, 8, 2) ;


                     if Heifs06.Caption <> '0' then
                        BCostH6.Caption             := FloatToStrF(StrToInt(Heifs06.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer06').AsFloat), ffFixed, 8, 2);
                     if Heifs12.Caption <> '0' then
                        BCostH12.Caption            := FloatToStrF(StrToInt(Heifs12.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer612').AsFloat), ffFixed, 8, 2);
                     if Heifs18.Caption <> '0' then
                        BCostH18.Caption            := FloatToStrF(StrToInt(Heifs18.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer1218').AsFloat), ffFixed, 8, 2);
                     if Heifs24.Caption <> '0' then
                        BCostH24.Caption            := FloatToStrF(StrToInt(Heifs24.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer1824').AsFloat), ffFixed, 8, 2);
                     if HeifsOver24.Caption <> '0' then
                        BCostH24Plus.Caption        := FloatToStrF(StrToInt(HeifsOver24.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer24Plus').AsFloat), ffFixed, 8, 2);

                     if Steers06.Caption <> '0' then
                        BCostS6.Caption             := FloatToStrF(StrToInt(Steers06.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer06').AsFloat), ffFixed, 8, 2);
                     if Steers12.Caption <> '0' then
                        BCostS12.Caption            := FloatToStrF(StrToInt(Steers12.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer612').AsFloat), ffFixed, 8, 2);
                     if Steers18.Caption <> '0' then
                        BCostS18.Caption            := FloatToStrF(StrToInt(Steers18.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer1218').AsFloat), ffFixed, 8, 2);
                     if Steers24.Caption <> '0' then
                        BCostS24.Caption            := FloatToStrF(StrToInt(Steers24.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer1824').AsFloat), ffFixed, 8, 2);
                     if SteersOver24.Caption <> '0' then
                        BCostS24Plus.Caption        := FloatToStrF(StrToInt(SteersOver24.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer24Plus').AsFloat), ffFixed, 8, 2);

                     {------------------------- Carried Forward Calcs -------------------------}

                     if CIMCF.Caption <> '0' then
                        CCostInMilk.Caption         := FloatToStrF(StrToInt(CIMCF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeCowsInMilk').AsFloat), ffFixed, 8, 2);
                     if CDryCF.Caption <> '0' then
                        CCostDry.Caption            := FloatToStrF(StrToInt(CDryCF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeCowsDry').AsFloat), ffFixed, 8, 2);
                     if BBreedCF.Caption <> '0' then
                        CCostBreedBull.Caption      := FloatToStrF(StrToInt(BBreedCF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeBullBreed').AsFloat), ffFixed, 8, 2);
                     if BBeefCF06Mth.Caption <> '0' then
                        CCostBeefBull06Mth.Caption  := FloatToStrF(StrToInt(BBeefCF06Mth.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeBullBeef06').AsFloat), ffFixed, 8, 2);
                     if BBeefCF612Mth.Caption <> '0' then
                        CCostBeefBull612Mth.Caption := FloatToStrF(StrToInt(BBeefCF612Mth.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeBullBeef612').AsFloat), ffFixed, 8, 2);
                     if BBeefCF12PMth.Caption <> '0' then
                        CCostBeefBull12PMth.Caption := FloatToStrF(StrToInt(BBeefCF12PMth.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeBullBeef12Plus').AsFloat), ffFixed, 8, 2);

                     if H06CF.Caption <> '0' then
                        CCostH6.Caption := FloatToStrF(StrToInt(H06CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer06').AsFloat), ffFixed, 8, 2);
                     if H12CF.Caption <> '0' then
                        CCostH12.Caption := FloatToStrF(StrToInt(H12CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer612').AsFloat), ffFixed, 8, 2);
                     if H18CF.Caption <> '0' then
                        CCostH18.Caption := FloatToStrF(StrToInt(H18CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer1218').AsFloat), ffFixed, 8, 2);
                     if H24CF.Caption <> '0' then
                        CCostH24.Caption := FloatToStrF(StrToInt(H24CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer1824').AsFloat), ffFixed, 8, 2);
                     if HOver24CF.Caption <> '0' then
                        CCostH24Plus.Caption := FloatToStrF(StrToInt(HOver24CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeHeifer24Plus').AsFloat), ffFixed, 8, 2);

                     if S06CF.Caption <> '0' then
                        CCostS6.Caption             := FloatToStrF(StrToInt(S06CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer06').AsFloat), ffFixed, 8, 2);
                     if S12CF.Caption <> '0' then
                        CCostS12.Caption            := FloatToStrF(StrToInt(S12CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer612').AsFloat), ffFixed, 8, 2);
                     if S18CF.Caption <> '0' then
                        CCostS18.Caption            := FloatToStrF(StrToInt(S18CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer1218').AsFloat), ffFixed, 8, 2);
                     if S24CF.Caption <> '0' then
                        CCostS24.Caption            := FloatToStrF(StrToInt(S24CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer1824').AsFloat), ffFixed, 8, 2);
                     if SOver24CF.Caption <> '0' then
                        CCostS24Plus.Caption        := FloatToStrF(StrToInt(SOver24CF.Caption) * (WinData.LiveStockValues.FieldByName('PedigreeSteer24Plus').AsFloat), ffFixed, 8, 2);

                     { Save Opening/Closing Balance to LiveStkDefaults table}
                     WinData.LiveStockValues.Edit;
                     WinData.LiveStockValues.FieldByName('PedigreeOpeningValue').AsFloat := StrToFloat(BCostInMilk.Caption) + StrToFloat(BCostDry.Caption) + StrToFloat(BCostBreedBull.Caption) + StrToFloat(BCostBeefBull06Mth.Caption) + StrToFloat(BCostBeefBull612Mth.Caption) + StrToFloat(BCostBeefBull12PMth.Caption) + StrToFloat(BCostH6.Caption) + StrToFloat(BCostH12.Caption) + StrToFloat(BCostH18.Caption) + StrToFloat(BCostH24.Caption) + StrToFloat(BCostH24Plus.Caption) + StrToFloat(BCostS6.Caption) + StrToFloat(BCostS12.Caption) + StrToFloat(BCostS18.Caption) + StrToFloat(BCostS24.Caption) + StrToFloat(BCostS24Plus.Caption);
                     WinData.LiveStockValues.FieldByName('PedigreeClosingValue').AsFloat := StrToFloat(CCostInMilk.Caption) + StrToFloat(CCostDry.Caption) + StrToFloat(CCostBreedBull.Caption) + StrToFloat(CCostBeefBull06Mth.Caption) + StrToFloat(CCostBeefBull612Mth.Caption) + StrToFloat(CCostBeefBull12PMth.Caption) + StrToFloat(CCostH6.Caption) + StrToFloat(CCostH12.Caption) + StrToFloat(CCostH18.Caption) + StrToFloat(CCostH24.Caption) + StrToFloat(CCostH24Plus.Caption) + StrToFloat(CCostS6.Caption) + StrToFloat(CCostS12.Caption) + StrToFloat(CCostS18.Caption) + StrToFloat(CCostS24.Caption) + StrToFloat(CCostS24Plus.Caption);
                     WinData.LiveStockValues.Post;

                     //   25/11/13 [V5.2 R5.8] /MK Bug Fix - Convert to euro on Label Print not before as "Invalid Floating Point" appears for these values.
                     BCostTotal.Caption := FloatToStrF(WinData.LiveStockValues.FieldByName('PedigreeOpeningValue').AsFloat,ffFixed,8,2);
                     CCostTotal.Caption := FloatToStrF(WinData.LiveStockValues.FieldByName('PedigreeClosingValue').AsFloat,ffFixed,8,2);
                  end;
            end;
         end;
   finally
      WinData.LiveStockValues.Active := False;
   end;
end;

procedure TfmLiveStockInvent.qrStockCtrlBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   if ( fLivestockSum.FFromBordBia ) then
      qrStockCtrl.ReportTitle := 'Annual Livestock Movements'
   else
      qrStockCtrl.ReportTitle := 'Annual Livestock Valuations';

   SaveLiveStockCurrencyValues;
end;

procedure TfmLiveStockInvent.BCostInMilkPrint(sender: TObject;
  var Value: String);
begin
   //   17/09/13 [V5.2 R1.4] /MK Change - Do not show Opening and Closing valuations if report ran from Bord Bia screen.
   if ( fLivestockSum.FFromBordBia ) then
      Value := '0.00'
   else
      Value := CurrToStrF(Round(StrToFloat(Value)), ffCurrency, 2);
end;

procedure TfmLiveStockInvent.FormCreate(Sender: TObject);
begin
   if ( fLivestockSum.FFromBordBia ) then
      begin
         qrStockCtrl.ReportTitle := 'Annual Livestock Movements';
         Caption := qrStockCtrl.ReportTitle;
      end
   else
      begin
         qrStockCtrl.ReportTitle := 'Annual Livestock Valuations';
         Caption := qrStockCtrl.ReportTitle;
      end;

   if WinData.DefCountry(HerdID) = Ireland then
      begin
         QrOpenValue.Caption := 'Opening Value    �';
         qrCloseValue.Caption := 'Closing Value    �';
         CurrStr := '�';
      end
   else
      begin
         QrOpenValue.Caption := 'Opening Value    �';
         qrCloseValue.Caption := 'Closing Value    �';
         CurrStr := '�';
      end;
end;

procedure TfmLiveStockInvent.qrStockCtrlAfterPrint(Sender: TObject);
begin
   SaveLiveStockCurrencyValues;
end;

procedure TfmLiveStockInvent.qrStockCtrlEndPage(Sender: TCustomQuickRep);
begin
   SaveLiveStockCurrencyValues;
end;

procedure TfmLiveStockInvent.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if WinData.LiveStockValues.Active then
      WinData.LiveStockValues.Active := False;
end;

procedure TfmLiveStockInvent.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRLabel3.Caption := qrStockCtrl.ReportTitle;
end;

end.
