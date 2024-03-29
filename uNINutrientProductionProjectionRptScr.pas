{
   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
}

unit uNINutrientProductionProjectionRptScr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ToolEdit, CurrEdit, RxLookup, ExtCtrls,
  RXCtrls, ToolWin, DateUtil, db, dbTables, {pGenTypesConst,} GenTypesConst,
  RXSpin, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxDropDownEdit, cxLabel, cxCurrencyEdit, cxMemo, cxCalendar,
  cxCheckBox;

type
  TCalfRecord = class
    DamNo : String[10];
    DamID : Integer;
    DOB  : TDateTime;
    constructor Create(ADamID : Integer; ADOB : TDateTime);
  end;

  TNIAnimalWasteCategory = (
    wcDairyCows,
    wcCattleOver24Mths,
    wcCattle12To24Mths,
    wcBullBeef0To13Mths,
    wcBullBeef6To13Mths,
    wcCattle0To12Mths,
    wcCalves6To12Mths,
    wcCalves0To6Mths);

//  TAnimalWasteType = (wtNitrogen, wtPhosphorus);

  TProjectedTotals = record
    DairyCows,
    Cattle2YrPlus,
    Cattle1To2Yrs,
    BullBeef0To13Mths,
    BullBeef6To13Mths,
    Cattle0To1Yr,
    Calves6To12Mths,
    Calves0To6Mths : Integer
  end;

  TWasteProductionRecord = record
    TotalAnimals : Integer;
    TotalProduction,
    TotalProductionIncForecast,
    TotalProductionIncNonBovine,
    ProductionPerHa : Double;
  end;

  TfmNINutrientProductionProjectionRptScr = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton4: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    ComboHerd: TRxDBLookupCombo;
    p: TPanel;
    lProgBar: TLabel;
    lPleaseWait: TLabel;
    Label13: TLabel;
    pb: TProgressBar;
    GenQuery: TQuery;
    seForageArea: TcxSpinEdit;
    sbWasteProdRates: TRxSpeedButton;
    ToolButton3: TToolButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxLabel4: TcxLabel;
    cmboPartYear: TcxComboBox;
    cxLabel13: TcxLabel;
    cmboYear: TcxComboBox;
    pForecast: TPanel;
    ceFebDCows: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    ceFebOlderCattleOver24Mths: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    ceFebCattle1224Mths: TcxCurrencyEdit;
    ceAprDCows: TcxCurrencyEdit;
    ceAprOlderCattleOver24Mths: TcxCurrencyEdit;
    ceAprCattle1224Mths: TcxCurrencyEdit;
    ceJunDCows: TcxCurrencyEdit;
    ceJunOlderCattleOver24Mths: TcxCurrencyEdit;
    ceJunCattle1224Mths: TcxCurrencyEdit;
    ceAugDCows: TcxCurrencyEdit;
    ceAugOlderCattleOver24Mths: TcxCurrencyEdit;
    ceAugCattle1224Mths: TcxCurrencyEdit;
    ceOctDCows: TcxCurrencyEdit;
    ceOctOlderCattleOver24Mths: TcxCurrencyEdit;
    ceOctCattle1224Mths: TcxCurrencyEdit;
    ceDecDCows: TcxCurrencyEdit;
    ceDecOlderCattleOver24Mths: TcxCurrencyEdit;
    ceDecCattle1224Mths: TcxCurrencyEdit;
    ceFebTotalForecast: TcxCurrencyEdit;
    lForecastType: TcxLabel;
    ceAprTotalForecast: TcxCurrencyEdit;
    ceJunTotalForecast: TcxCurrencyEdit;
    ceAugTotalForecast: TcxCurrencyEdit;
    ceOctTotalForecast: TcxCurrencyEdit;
    ceDecTotalForecast: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    cxLabel6: TcxLabel;
    ceFebBullBeef013Mths: TcxCurrencyEdit;
    ceAprBullBeef013Mths: TcxCurrencyEdit;
    ceJunBullBeef013Mths: TcxCurrencyEdit;
    ceAugBullBeef013Mths: TcxCurrencyEdit;
    ceOctBullBeef013Mths: TcxCurrencyEdit;
    ceDecBullBeef013Mths: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    ceFebCattle012Mths: TcxCurrencyEdit;
    ceAprCattle012Mths: TcxCurrencyEdit;
    ceJunCattle012Mths: TcxCurrencyEdit;
    ceAugCattle012Mths: TcxCurrencyEdit;
    ceOctCattle012Mths: TcxCurrencyEdit;
    ceDecCattle012Mths: TcxCurrencyEdit;
    cxLabel9: TcxLabel;
    ceFebBullBeef613Mths: TcxCurrencyEdit;
    ceAprBullBeef613Mths: TcxCurrencyEdit;
    ceJunBullBeef613Mths: TcxCurrencyEdit;
    ceAugBullBeef613Mths: TcxCurrencyEdit;
    ceOctBullBeef613Mths: TcxCurrencyEdit;
    ceDecBullBeef613Mths: TcxCurrencyEdit;
    cxLabel10: TcxLabel;
    ceFebCalves06Mths: TcxCurrencyEdit;
    ceAprCalves06Mths: TcxCurrencyEdit;
    ceJunCalves06Mths: TcxCurrencyEdit;
    ceAugCalves06Mths: TcxCurrencyEdit;
    ceOctCalves06Mths: TcxCurrencyEdit;
    ceDecCalves06Mths: TcxCurrencyEdit;
    ceFebCalves612Mths: TcxCurrencyEdit;
    ceAprCalves612Mths: TcxCurrencyEdit;
    ceJunCalves612Mths: TcxCurrencyEdit;
    ceAugCalves612Mths: TcxCurrencyEdit;
    ceOctCalves612Mths: TcxCurrencyEdit;
    ceDecCalves612Mths: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    cxLabel11: TcxLabel;
    deDate1: TcxDateEdit;
    deDate2: TcxDateEdit;
    deDate3: TcxDateEdit;
    deDate4: TcxDateEdit;
    deDate5: TcxDateEdit;
    deDate6: TcxDateEdit;
    cxLabel12: TcxLabel;
    lAmountNonBovine: TLabel;
    seAvgNonBovineProduction: TcxSpinEdit;
    cbFavourite: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbWasteProdRatesClick(Sender: TObject);
    procedure ComboHerdChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ceFebDCowsExit(Sender: TObject);
    procedure ceAprDCowsExit(Sender: TObject);
    procedure ceJunDCowsExit(Sender: TObject);
    procedure ceOctDCowsExit(Sender: TObject);
    procedure ceDecDCowsExit(Sender: TObject);
    procedure ceAugDCowsExit(Sender: TObject);
    procedure cmboPartYearPropertiesEditValueChanged(Sender: TObject);
    procedure cmboYearPropertiesEditValueChanged(Sender: TObject);
    procedure deDate2Editing(Sender: TObject; var CanEdit: Boolean);
    procedure deDate1PropertiesEditValueChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    ConfigFile : TStringList;
    ProductionType : string;
    wcDairyCowsProduction,
    wcCattleOver24MthsProduction,
    wcCattle12To24MthsProduction,
    wcBullBeef0To13MthsProduction,
    wcBullBeef6To13MthsProduction,
    wcCattle0To12MthsProduction,
    wcCalves6To12MthsProduction,
    wcCalves0To6MthsProduction : Double;

    NutrientProjection : TTable;
    ThisYear : Integer;
    StartDateIndex : Integer;
    fNPDefs : String;
    WasteValuesLoaded : Boolean;
    AnimalList : TStringList;
    AnimalList2 : TStringList;
    DebugMode : Boolean;
    CalfList : TStringList;
    CalvingInfo : TCalvingInfo;
    PartYear : Boolean;
    procedure SetupControls;
    procedure SetupCustomControls;
    function DateCount : Integer;
    procedure GetAnimals;
    procedure BuildProjection;
    procedure ResetReportCaptions;
    procedure CalcProjection(ADate : TDateTime; var AProjectedTotals : TProjectedTotals);
    function GetWasteRateValue(AAnimalWasteCategory : TNIAnimalWasteCategory) : Double;
    function CalcProjectedWaste(ADairyCows,ACattle2YrPlus,ACattle1To2Yrs,ABullBeef0To13Mths,
        ABullBeef6To13Mths,ACattle0To1Yr,ACalves6To12Mths,ACalves0To6Mths: Double) : Double;
    procedure LoadWasteValues;
    procedure SaveWasteValues;
    procedure SetWasteValues;
    function CurrentYearSelected : Boolean;
  public
    { Public declarations }
    class procedure ShowForm;
  end;

var
  fmNINutrientProductionProjectionRptScr: TfmNINutrientProductionProjectionRptScr;

implementation
uses
   uNutrientProductionProjectionRpt, DairyData, {dmHerdProps, } KRoutines,
   uSetupWasteProdRates, uNINutrientProductionProjectionRpt, KDBRoutines;

{$R *.DFM}

{ TfmNutrientProductionProjectionRptScr }

procedure TfmNINutrientProductionProjectionRptScr.SetupControls;
begin
   cmboPartYear.ItemIndex := 0;
   LoadWasteValues;
   ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);
end;

procedure TfmNINutrientProductionProjectionRptScr.SetupCustomControls;
const
   cAmountNonBovineCap = 'Amount of %s produced by non-bovine animals per year';
begin
   ProductionType := 'Nitrogen';
   lAmountNonBovine.Caption := Format(cAmountNonBovineCap, ['Nitrogen']);

   lAmountNonBovine.Caption := Format(cAmountNonBovineCap, [ProductionType]);
   lForecastType.Caption := Format('(+/-) %s',[ProductionType]);

   Update;
end;

class procedure TfmNINutrientProductionProjectionRptScr.ShowForm;
begin
   with TfmNINutrientProductionProjectionRptScr.Create(nil) do
      try
         ThisYear := CurrentYear;
         SetWasteValues;
         SetupControls;
         SetupCustomControls;
         ShowModal;
      finally
         Free;
      end;

end;

procedure TfmNINutrientProductionProjectionRptScr.BuildProjection;
const
   cDisplayProgressLabel = 'Date %d Compiling';
var
   ProjectedTotals : TProjectedTotals;
   nForecastWaste1,nForecastWaste2,
   nForecastWaste3,nForecastWaste4,
   nForecastWaste5,nForecastWaste6,
   MonthTotal, HectareAverage,
   AvgNonBovine, ForageAreaHa : Double;

   WasteProductionRecord : TWasteProductionRecord;

      function DoCalcs( AProjectedTotals : TProjectedTotals;
          nForecastWaste, AvgNonBovine, ForageArea : Double ) : TWasteProductionRecord;
      begin
         with AProjectedTotals do
            begin
               Result.TotalAnimals := (DairyCows+Cattle2YrPlus+Cattle1To2Yrs+BullBeef0To13Mths+BullBeef6To13Mths+Cattle0To1Yr+Calves6To12Mths+Calves0To6Mths);
               Result.TotalProduction := (( DairyCows * wcDairyCowsProduction ) + ( Cattle2YrPlus * wcCattleOver24MthsProduction ) + ( Cattle1To2Yrs * wcCattle12To24MthsProduction) +
                                          ( BullBeef0To13Mths * wcBullBeef0To13MthsProduction) + ( BullBeef6To13Mths * wcBullBeef6To13MthsProduction ) + (Cattle0To1Yr*wcCattle0To12MthsProduction)+
                                          (Calves6To12Mths*wcCalves6To12MthsProduction) + (Calves0To6Mths*wcCalves0To6MthsProduction) );
            end;
         Result.TotalProductionIncForecast := Result.TotalProduction + nForecastWaste;
         Result.TotalProductionIncNonBovine := Result.TotalProductionIncForecast + AvgNonBovine;
         if ( ForageArea > 0 ) then
            Result.ProductionPerHa := Result.TotalProductionIncNonBovine / ForageArea;
      end;

      function GetForecastValue(
        AMonthIndex: Integer): Double;
      begin
         case AMonthIndex of
            1: Result := nForecastWaste1;
            2: Result := nForecastWaste2;
            3: Result := nForecastWaste3;
            4: Result := nForecastWaste4;
            5: Result := nForecastWaste5;
            6: Result := nForecastWaste6;
         end;
      end;

   procedure CalcDate1;
   begin
      // set progress bar caption
      lProgBar.Caption := Format(cDisplayProgressLabel, [1]);
      Update;


      CalcProjection(deDate1.Date, ProjectedTotals);

      with fmNINutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lFebDate.Caption := FormatDateTime('dd/mm', deDate1.Date);
            lFebForecastWaste.Caption := FloatToStrF(nForecastWaste1, ffFixed, 8, 2);
            lFebWasteProdNonBovine.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(1), AvgNonBovine, ForageAreaHa );


            lFebDairyCows.Caption := IntToStr(DairyCows);
            lFebOlderCattleOver24mths.Caption := IntToStr(Cattle2YrPlus);
            lFebCattle1224mths.Caption := IntToStr(Cattle1To2Yrs);
            lFebCattle012mths.Caption := IntToStr(Cattle0To1Yr);
            lFebCalves612Mths.Caption := IntToStr(Calves6To12Mths);
            lFebCalves06mths.Caption := IntToStr(Calves0To6Mths);
            lFebBullBeef613Mths.Caption := IntToStr(BullBeef6To13Mths);
            lFebBullBeef013Mths.Caption := IntToStr(BullBeef0To13Mths);

            // Total Animals
            lFebTotNum.Caption := IntToStr(WasteProductionRecord.TotalAnimals);

            // Total Waste Produced By Animals
            lFebWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Including Forecast
           // lFebForecastWaste.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Including Forecast ** Including Non-Bovine
            lFebTotalWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lFebWastePerHa.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;

        end;
   end;

   procedure CalcDate2;
   begin
      lProgBar.Caption := Format(cDisplayProgressLabel, [2]);
      lProgBar.Refresh;
      CalcProjection(deDate2.Date , ProjectedTotals);

      with fmNINutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lAprDate.Caption := FormatDateTime('dd/mm', deDate2.Date);
            lAprForecastWaste.Caption := FloatToStrF(nForecastWaste2, ffFixed, 8, 2);
            lAprWasteProdNonBovine.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(2), AvgNonBovine, ForageAreaHa );

            lAprDairyCows.Caption := IntToStr(DairyCows);
            lAprOlderCattleOver24mths.Caption := IntToStr(Cattle2YrPlus);
            lAprCattle1224mths.Caption := IntToStr(Cattle1To2Yrs);
            lAprCattle012mths.Caption := IntToStr(Cattle0To1Yr);
            lAprCalves612Mths.Caption := IntToStr(Calves6To12Mths);
            lAprCalves06mths.Caption := IntToStr(Calves0To6Mths);
            lAprBullBeef613Mths.Caption := IntToStr(BullBeef6To13Mths);
            lAprBullBeef013Mths.Caption := IntToStr(BullBeef0To13Mths);

            // Total Animals
            lAprTotNum.Caption := IntToStr(WasteProductionRecord.TotalAnimals);

            // Total Waste Produced By Animals
            lAprWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Including Forecast
          //  lAprForecastWaste.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Including Forecast ** Including Non-Bovine
            lAprTotalWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lAprWastePerHa.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate3;
   begin

      lProgBar.Caption := Format(cDisplayProgressLabel, [3]);
      lProgBar.Refresh;
      CalcProjection(deDate3.Date, ProjectedTotals);
      with fmNINutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lJunDate.Caption := FormatDateTime('dd/mm', deDate3.Date);
            lJunForecastWaste.Caption := FloatToStrF(nForecastWaste3, ffFixed, 8, 2);
            lJunWasteProdNonBovine.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(3), AvgNonBovine, ForageAreaHa );

            lJunDairyCows.Caption := IntToStr(DairyCows);
            lJunOlderCattleOver24mths.Caption := IntToStr(Cattle2YrPlus);
            lJunCattle1224mths.Caption := IntToStr(Cattle1To2Yrs);
            lJunCattle012mths.Caption := IntToStr(Cattle0To1Yr);
            lJunCalves612Mths.Caption := IntToStr(Calves6To12Mths);
            lJunCalves06mths.Caption := IntToStr(Calves0To6Mths);
            lJunBullBeef613Mths.Caption := IntToStr(BullBeef6To13Mths);
            lJunBullBeef013Mths.Caption := IntToStr(BullBeef0To13Mths);

            // Total Animals
            lJunTotNum.Caption := IntToStr(WasteProductionRecord.TotalAnimals);

            // Total Waste Produced By Animals
            lJunWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Including Forecast
           // lJunForecastWaste.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Including Forecast ** Including Non-Bovine
            lJunTotalWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lJunWastePerHa.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;


   procedure CalcDate4;
   begin
      lProgBar.Caption := Format(cDisplayProgressLabel, [4]);
      lProgBar.Refresh;
      CalcProjection(deDate4.Date, ProjectedTotals);
      with fmNINutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lAugDate.Caption := FormatDateTime('dd/mm', deDate4.Date);
            lAugForecastWaste.Caption := FloatToStrF(nForecastWaste4, ffFixed, 8, 2);
            lAugWasteProdNonBovine.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(4), AvgNonBovine, ForageAreaHa );

            lAugDairyCows.Caption := IntToStr(DairyCows);
            lAugOlderCattleOver24mths.Caption := IntToStr(Cattle2YrPlus);
            lAugCattle1224mths.Caption := IntToStr(Cattle1To2Yrs);
            lAugCattle012mths.Caption := IntToStr(Cattle0To1Yr);
            lAugCalves612Mths.Caption := IntToStr(Calves6To12Mths);
            lAugCalves06mths.Caption := IntToStr(Calves0To6Mths);
            lAugBullBeef613Mths.Caption := IntToStr(BullBeef6To13Mths);
            lAugBullBeef013Mths.Caption := IntToStr(BullBeef0To13Mths);

            // Total Animals
            lAugTotNum.Caption := IntToStr(WasteProductionRecord.TotalAnimals);

            // Total Waste Produced By Animals
            lAugWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
           // lAugForecastWaste.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lAugTotalWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lAugWastePerHa.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate5;
   begin
      lProgBar.Caption := Format(cDisplayProgressLabel, [5]);
      lProgBar.Refresh;
      CalcProjection(deDate5.Date, ProjectedTotals);
      with fmNINutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lOctDate.Caption := FormatDateTime('dd/mm', deDate5.Date);
            lOctForecastWaste.Caption := FloatToStrF(nForecastWaste5, ffFixed, 8, 2);
            lOctWasteProdNonBovine.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(5), AvgNonBovine, ForageAreaHa );

            lOctDairyCows.Caption := IntToStr(DairyCows);
            lOctOlderCattleOver24mths.Caption := IntToStr(Cattle2YrPlus);
            lOctCattle1224mths.Caption := IntToStr(Cattle1To2Yrs);
            lOctCattle012mths.Caption := IntToStr(Cattle0To1Yr);
            lOctCalves612Mths.Caption := IntToStr(Calves6To12Mths);
            lOctCalves06mths.Caption := IntToStr(Calves0To6Mths);
            lOctBullBeef613Mths.Caption := IntToStr(BullBeef6To13Mths);
            lOctBullBeef013Mths.Caption := IntToStr(BullBeef0To13Mths);

            // Total Animals
            lOctTotNum.Caption := IntToStr(WasteProductionRecord.TotalAnimals);

            // Total Waste Produced By Animals
            lOctWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
          //  lOctForecastWaste.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lOctTotalWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lOctWastePerHa.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;


   procedure CalcDate6;
   begin
      lProgBar.Caption := Format(cDisplayProgressLabel, [6]);
      lProgBar.Refresh;
      CalcProjection(deDate6.Date, ProjectedTotals);
      with fmNINutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDecDate.Caption := FormatDateTime('dd/mm', deDate6.Date);
            lDecForecastWaste.Caption := FloatToStrF(nForecastWaste6, ffFixed, 8, 2);
            lDecWasteProdNonBovine.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(6), AvgNonBovine, ForageAreaHa );

            lDecDairyCows.Caption := IntToStr(DairyCows);
            lDecOlderCattleOver24mths.Caption := IntToStr(Cattle2YrPlus);
            lDecCattle1224mths.Caption := IntToStr(Cattle1To2Yrs);
            lDecCattle012mths.Caption := IntToStr(Cattle0To1Yr);
            lDecCalves612Mths.Caption := IntToStr(Calves6To12Mths);
            lDecCalves06mths.Caption := IntToStr(Calves0To6Mths);
            lDecBullBeef613Mths.Caption := IntToStr(BullBeef6To13Mths);
            lDecBullBeef013Mths.Caption := IntToStr(BullBeef0To13Mths);

            // Total Animals
            lDecTotNum.Caption := IntToStr(WasteProductionRecord.TotalAnimals);

            // Total Waste Produced By Animals
            lDecWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
         //   lDecForecastWaste.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lDecTotalWasteProd.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lDecWastePerHa.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;
var
   NumDates : Integer;
begin
   lPleaseWait.Visible := True;
   // find no of dates & get max and min dates
   lProgBar.Visible := True;
   lProgBar.Caption := 'Gathering Data...';

   pb.Visible := True;
   pb.Position := 0;

   Update;

   GetAnimals;
   // fill in HerdID and Version labels
   fmNINutrientProductionProjectionRpt.lProgramVer.Caption := 'Kingswood Herd Management ' + HerdVerNo;
   fmNINutrientProductionProjectionRpt.lHerdID.Caption := ComboHerd.Text;
   if seForageArea.Text <> '' then
      fmNINutrientProductionProjectionRpt.qrlHectares.Caption := seForageArea.Text
   else
      fmNINutrientProductionProjectionRpt.qrlHectares.Caption := '';
   fmNINutrientProductionProjectionRpt.CurrentYear := ThisYear;

   fmNINutrientProductionProjectionRpt.HideCaptions(StartDateIndex);
   ResetReportCaptions;


   if CurrentYearSelected then
      begin
         try
            nForecastWaste1  := ceFebTotalForecast.Value;
            nForecastWaste2  := ceAprTotalForecast.Value;
            nForecastWaste3  := ceJunTotalForecast.Value;
            nForecastWaste4  := ceAugTotalForecast.Value;
            nForecastWaste5  := ceOctTotalForecast.Value;
            nForecastWaste6  := ceDecTotalForecast.Value;
            if ( seAvgNonBovineProduction.Value > 0 ) then
               AvgNonBovine     := seAvgNonBovineProduction.Value / 6;
         except
         end;
      end
   else
      begin
         nForecastWaste1  := 0;
         nForecastWaste2  := 0;
         nForecastWaste3  := 0;
         nForecastWaste4  := 0;
         nForecastWaste5  := 0;
         nForecastWaste6  := 0;
         AvgNonBovine := 0;
      end;
   ForageAreaHa     := seForageArea.Value;

   NumDates := DateCount;
   case NumDates of
      1:  begin MonthTotal :=0; CalcDate1; end;
      2:  begin MonthTotal :=0; CalcDate1; CalcDate2; end;
      3:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; end;
      4:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; end;
      5:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; end;
      6:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; CalcDate6; end;
   end;

   lPleaseWait.Visible := False;
   // find no of dates & get max and min dates
   lProgBar.Visible := False;
   lProgBar.Caption := '';

   pb.Visible := False;
   pb.Position := 0;

   Update;

   fmNINutrientProductionProjectionRpt.lTotalWasteProdCalYr.Caption := FloatToStrF( MonthTotal, ffFixed, 8, 2);
   if ( ForageAreaHa > 0 ) then
      begin
         HectareAverage := ( MonthTotal / ForageAreaHa );
         fmNINutrientProductionProjectionRpt.lAvgWastePerHaCalYr.Caption := FloatToStrF( HectareAverage, ffFixed, 8, 2);
      end
   else
      fmNINutrientProductionProjectionRpt.HideHectareProduction;

   fmNINutrientProductionProjectionRpt.PartYear := PartYear;
   fmNINutrientProductionProjectionRpt.NutProdProjRpt.Preview;
end;

procedure TfmNINutrientProductionProjectionRptScr.CalcProjection(
  ADate: TDateTime; var AProjectedTotals: TProjectedTotals);
var
   CalcDay,
   CalcMonth,
   CalcYear : String;
   TwoYear,
   OneYear,
   SixMonth,
   Month13  : TDateTime;
begin
   FillChar(AProjectedTotals, SizeOf( TProjectedTotals ), 0);
   Application.ProcessMessages;

   //lProgBar.Caption := 'Counting Units....';
   //lProgBar.Refresh;

   // get record count for progress bar
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT COUNT(AnimalID) CowCount FROM '+NutrientProjection.TableName);
   GenQuery.Open;

   // set progress bar parameters
   pb.Min := 0;
   pb.Max := GenQuery.FieldByName('CowCount').AsInteger;
   pb.Step := 1;
   pb.Position := 0;


   // convert calcdate - 17/04/00 - kr
   CalcDay   := Copy((FormatDateTime(cIrishDateStyle,(ADate))),0,2);
   CalcMonth := Copy((FormatDateTime(cIrishDateStyle,(ADate))),4,2);
   CalcYear  := Copy((FormatDateTime(cIrishDateStyle,(ADate))),7,4);

   Month13 := IncMonth(ADate, -13);
   // check for leap year (not year 2100 compliant!!!)
   //   Nothing := IntToStr((StrToInt(CalcYear) mod 4));
   if (((StrToInt(CalcYear) mod 4) = 0) and
       (CalcMonth = '02') and
       (CalcDay = '29')) then
       begin
          TwoYear := StrToDate('28/' + CalcMonth + '/' + IntToStr(StrToInt(CalcYear) - 2));
          OneYear := StrToDate('28/' + CalcMonth + '/' + IntToStr(StrToInt(CalcYear) - 1));
       end
   else
      begin
         TwoYear := StrToDate(CalcDay + '/' + CalcMonth + '/' + IntToStr(StrToInt(CalcYear) - 2));
         OneYear := StrToDate(CalcDay + '/' + CalcMonth + '/' + IntToStr(StrToInt(CalcYear) - 1));
      end;


   // loop to count animals to include
   With NutrientProjection do
      begin
         First;
         While Not (NutrientProjection.EOF) do
            Begin
               if DebugMode then
                 if NutrientProjection.FieldByName('AnimalID').asInteger=19 then ShowMessage('19');
               If ((NutrientProjection.FieldByName('Include').AsBoolean = TRUE) AND    // Must be included in report
                   (NutrientProjection.FieldByName('DOB').AsDateTime <= ADate) AND   // Must be born <= Calc Date
                   (NutrientProjection.FieldByName('PurchDate').AsDateTime < ADate)) then      // PurchDate must be <= CalcDate (if PurchDate does not exist, then PurchDate = 0)
                  Begin
                     if ( NutrientProjection.FieldByName('SaleDeathDate').AsDateTime > 0 ) and (NutrientProjection.FieldByName('SaleDeathDate').AsDateTime <= ADate) then
                        Next
                     else if ( NutrientProjection.FieldByName('DateMovedOn').AsDateTime > 0 ) and ( NutrientProjection.FieldByName('DateMovedOn').AsDateTime > ADate ) then
                        Next
                     else if ( NutrientProjection.FieldByName('DateMovedOff').AsDateTime > 0 ) and ( NutrientProjection.FieldByName('DateMovedOff').AsDateTime <= ADate ) then
                        Next            //Animal Sold/Died on or before CalcDate
                     else
                        Begin
                           if DebugMode then
                              begin
                                 AnimalList2.Add( IntTostr(NutrientProjection.FieldByName('AnimalID').asInteger) + ',');
                              end;

                           // check whether animal is a Cow (regardless of age)
                           if ((( NutrientProjection.FieldByName('LactNum').asInteger > 0 ) and ( NutrientProjection.FieldByName('FirstCalvingDate').AsDateTime <= ADate )) ) or // Actual calvings
                              ((( NutrientProjection.FieldByName('LactNum').asInteger = 0 ) and ((NutrientProjection.FieldByName('HeiferCalvingDate').AsDateTime>0) and ( NutrientProjection.FieldByName('HeiferCalvingDate').AsDateTime <= ADate ) and (NutrientProjection.FieldByName('HeiferCalvingDate').AsDateTime > Date) ) ) )  then // Projected calvings
                              begin    //Animal Calved - now a Cow. Must determine whether a Dairy Or Suckler Cow
                                 //Need to include checks for Suckler Cows and Dairy Cows here
                                 if ( NutrientProjection.FieldByName('EligibleForPremium').AsBoolean = True ) then
                                    begin
                                       //Inc(AProjectedTotals.SucklerCows);
                                       Inc(AProjectedTotals.Cattle2YrPlus);
                                       if DebugMode then
                                          begin
                                             AnimalList.Add('2Yr+ '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                          end
                                    end
                                 else
                                    begin
                                       Inc(AProjectedTotals.DairyCows);
                                       if DebugMode then
                                          begin
                                             AnimalList.Add('DCow '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                          end
                                    end
                              end   //EndIf
                           else if ( NutrientProjection.FieldByName('DOB').AsDateTime <= (TwoYear)) then // Or ((NutrientProjection.FieldByName('Sex').AsString = 'Bull') and (NutrientProjection.FieldByName('Breeding').AsBoolean)) then
                              begin
                                 Inc(AProjectedTotals.Cattle2YrPlus); // more than two years old
                                 if DebugMode then
                                    begin
                                       AnimalList.Add('2Yr+ '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                    end
                              end
                           else
                              begin
                                 if not PartYear then
                                    begin
                                       if (((NutrientProjection.FieldByName('Sex').AsString = 'Bull') and (not NutrientProjection.FieldByName('Breeding').AsBoolean))
                                          and ((NutrientProjection.FieldByName('DOB').AsDateTime >= (Month13)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (ADate))))  then
                                          begin
                                             Inc(AProjectedTotals.BullBeef0To13Mths);
                                             if DebugMode then
                                               begin
                                                  AnimalList.Add('BeefBull013 '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                               end
                                          end
                                       else if ((NutrientProjection.FieldByName('DOB').AsDateTime > (TwoYear)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (OneYear))) then
                                          begin
                                             Inc(AProjectedTotals.Cattle1To2Yrs);
                                             if DebugMode then
                                               begin
                                                  AnimalList.Add('C1to2Yr '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                               end
                                         end
                                       else if ((NutrientProjection.FieldByName('DOB').AsDateTime > (OneYear)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (ADate))) then
                                          begin
                                             Inc(AProjectedTotals.Cattle0To1Yr);
                                             if DebugMode then
                                               begin
                                                  AnimalList.Add('Cattle 0 12 '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                               end
                                          end
                                    end
                                 else
                                    begin
                                       if (((NutrientProjection.FieldByName('Sex').AsString = 'Bull') and (not NutrientProjection.FieldByName('Breeding').AsBoolean))
                                          and ((NutrientProjection.FieldByName('DOB').AsDateTime >= (Month13)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (SixMonth))))  then
                                          begin
                                             Inc(AProjectedTotals.BullBeef6To13Mths);
                                             if DebugMode then
                                                AnimalList.Add('BullBeef6To13Mths '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                          end
                                       else if ((NutrientProjection.FieldByName('DOB').AsDateTime > (TwoYear)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (OneYear))) then
                                          begin
                                             Inc(AProjectedTotals.Cattle1To2Yrs);
                                             if DebugMode then
                                                AnimalList.Add('Cattle1To2Yrs '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                          end
                                       else if ((NutrientProjection.FieldByName('DOB').AsDateTime > (OneYear)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (SixMonth))) then
                                          begin
                                             Inc(AProjectedTotals.Calves6To12Mths);
                                             if DebugMode then
                                                AnimalList.Add('Calves6To12Mths '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                          end
                                       else if ((NutrientProjection.FieldByName('DOB').AsDateTime > (SixMonth)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (ADate))) then
                                          begin
                                             Inc(AProjectedTotals.Calves0To6Mths);
                                             if DebugMode then
                                                AnimalList.Add('Calves0To6Mths '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                          end
                                    end;

                              end;
                           Next;
                        End;
                  End
               Else
                  Next;
               // step progress bar
               pb.StepIt;
            End;
      End;
   if DebugMode then
      begin
         AnimalList.Sort;
         AnimalList.SaveToFile('C:\Kingswood Herd Management\NutProd'+ ComboHerd.Text + ' ' + StringReplaceNonAlphaChars(DateToStr(ADate), ' ') + '.dat');
         AnimalList.Clear;

         AnimalList2.SaveToFile('C:\Kingswood Herd Management\NutProd'+ ComboHerd.Text + ' ' + StringReplaceNonAlphaChars(DateToStr(ADate), ' ') + '#1.dat');
         AnimalList2.Clear;
      end;
   pb.Position := pb.Max;
   Application.ProcessMessages;
end;


procedure TfmNINutrientProductionProjectionRptScr.ResetReportCaptions;
begin
   with fmNINutrientProductionProjectionRpt do
      begin
         ResetCaptions(ProductionType);
         lHerdID.Caption := ComboHerd.Text;
         qrlHectares.Caption := seForageArea.Text;
      end;
end;

function TfmNINutrientProductionProjectionRptScr.GetWasteRateValue(
  AAnimalWasteCategory : TNIAnimalWasteCategory) : Double;
begin
   Result := 0;
   WinData.pDefs.Refresh;
   WinData.pDefs.First;
   if AAnimalWasteCategory = wcDairyCows then
      Result := WinData.pDefs.FieldByName('NINPDairyCows').AsFloat
   else if AAnimalWasteCategory = wcCattleOver24Mths then
      Result := WinData.pDefs.FieldByName('NINPCattleOver24Mths').AsFloat
   else if AAnimalWasteCategory = wcCattle12To24Mths then
      Result := WinData.pDefs.FieldByName('NINPCattle12To24Mths').AsFloat
   else if AAnimalWasteCategory = wcBullBeef0To13Mths then
      Result := WinData.pDefs.FieldByName('NINPBullBeef0To13Mths').AsFloat
   else if AAnimalWasteCategory = wcBullBeef6To13Mths then
      Result := WinData.pDefs.FieldByName('NINPBullBeef6To13Mths').AsFloat
   else if AAnimalWasteCategory = wcCattle0To12Mths then
      Result := WinData.pDefs.FieldByName('NINPCattle0To12Mths').AsFloat
   else if AAnimalWasteCategory = wcCalves6To12Mths then
      Result := WinData.pDefs.FieldByName('NINPCalves6To12Mths').AsFloat
   else if AAnimalWasteCategory = wcCalves0To6Mths then
      Result := WinData.pDefs.FieldByName('NINPCalves0To6Mths').AsFloat;
end;

function TfmNINutrientProductionProjectionRptScr.DateCount: Integer;
begin
   Result := 6
end;

procedure TfmNINutrientProductionProjectionRptScr.GetAnimals;
var
   i,
   Num : Integer;
   nYear{, nMonth, nDay }: Word;
   tDate : TDateTime;
begin
   //DecodeDate(Date, nYear, nMonth, nDay);
   try
      nYear := StrToInt(cmboYear.Text);
   except
      MessageDlg('Unable establish report year.',mtError,[mbOK],0);
   end;

   if NutrientProjection = nil then
      begin
         NutrientProjection := TTable.Create(nil);
         with NutrientProjection do
            begin
               DatabaseName := WinData.KingData.DatabaseName;
               TableName := 'NutrientProjection';
               FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
               FieldDefs.Add('DOB',ftDate,0,FALSE);
               FieldDefs.Add('Sex',ftString,10,FALSE);
               FieldDefs.Add('LactNum',ftSmallint,0,FALSE);
               FieldDefs.Add('PrimaryBreed',ftInteger,0,FALSE);
               FieldDefs.Add('EligibleForPremium',ftBoolean,0,FALSE);
               FieldDefs.Add('PurchDate',ftDate,0,FALSE);
               FieldDefs.Add('SaleDeathDate',ftDate,0,FALSE);
               FieldDefs.Add('FirstCalvingDate',ftDate,0,FALSE);
               FieldDefs.Add('Include',ftBoolean,0,FALSE);
               FieldDefs.Add('DateMovedOn',ftDate,0,FALSE);
               FieldDefs.Add('DateMovedOff',ftDate,0,FALSE);
               FieldDefs.Add('NatIDNum',ftString,20,FALSE);
               FieldDefs.Add('HeiferCalvingDate',ftDateTime);
               FieldDefs.Add('Breeding',ftBoolean);
               CreateTable;
               //Open;
            end;
      end
   else
      NutrientProjection.Close;


   // clear table
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM '+NutrientProjection.TableName);
         ExecSQL;
      end;

   // create a table of all possible animals
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO ' + NutrientProjection.TableName + ' (AnimalID, LactNum, Sex, DOB, PrimaryBreed, NatIDNum, Breeding)');
         SQL.Add('SELECT DISTINCT D.ID, D.LactNo, D.Sex, D.DateOfBirth, D.PrimaryBreed, D.NatIDNum, D.Breeding');
         SQL.Add('FROM "Animals.db" D');
         SQL.Add('WHERE ( D.AnimalDeleted = False )');
         SQL.Add(' AND ( D.HerdID = "' + ComboHerd.Value + '" ) ');
         ExecSQL;
      end;

   with GenQuery do
      begin
         // Delete based on Sales
         SQL.Clear;
         SQL.Add('DELETE FROM ' + NutrientProjection.TableName + '');
         SQL.Add('WHERE ( AnimalID IN (');
         SQL.Add(' SELECT AnimalID FROM events');
         SQL.Add(' WHERE ( EventDate < "' + FormatDateTime('mm/dd/yyyy',EncodeDate(nYear, 1, 1)) + '")');
         SQL.Add(' AND   ( EventType = ' + IntToStr(CSaleDeathEvent) + ')))');
         ExecSQL;
      end;

   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('UPDATE ' + NutrientProjection.TableName + ' SET Include=True');
   GenQuery.ExecSQL;
   // get record count for progress bar
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT COUNT(AnimalID) CowCount FROM ' + NutrientProjection.TableName );
   GenQuery.Open;

   // set progress bar parameters
   pb.Min := 0;
   pb.Max := (GenQuery.FieldByName('CowCount').AsInteger * 2);
   pb.Step := 1;

   //add Date of Purchase and Date of Sale/Death and compare these dates
   //with the earliest (MinDate) and latest dates (MaxDate).
   //Set Include = False for all animals outside date ranges

   { Ensure CheckEvents is not filtered }
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;

   WinData.tIntHerd.Open;
   try
      NutrientProjection.Open;
      With NutrientProjection do
         begin
            First;
            while Not (NutrientProjection.EOF) do
               begin
                  Edit;
                  Edit;
                  //First get the Purchase event (if any) and exclude those animals
                  //if WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([NutrientProjection.FieldByName('AnimalID').AsVariant,CPurchaseEvent]),[] ) then
                  //   NutrientProjection.FieldByName('PurchDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;

                  tDate := WinData.EventDataHelper.GetLastEventDate(NutrientProjection.FieldByName('AnimalID').AsVariant,CPurchaseEvent);
                  if tDate > 0 then
                     NutrientProjection.FieldByName('PurchDate').AsDateTime := tDate;
                  tDate := WinData.EventDataHelper.GetLastEventDate(NutrientProjection.FieldByName('AnimalID').AsVariant,CSaleDeathEvent);
                  if tDate > 0 then
                     NutrientProjection.FieldByName('SaleDeathDate').AsDateTime := tDate;


                  //Second - if still included, get the Sale/Death event (if any)
//                  if (WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([NutrientProjection.FieldByName('AnimalID').AsVariant,CSaleDeathEvent]),[] )) then
//                     NutrientProjection.FieldByName('SaleDeathDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;

                  //Now need to get first calving date (if it exists)
{                  If ((NutrientProjection.FieldByName('Include').AsBoolean = TRUE) AND (NutrientProjection.FieldByName('LactNum').AsInteger > 0)) then
                     begin  //If still included and has a nonzero Lactation Number, then get Date Of First Calving - Note: The CheckEvents table is indexed on EventDate
                        If ( WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([NutrientProjection.FieldByName('AnimalID').AsVariant,CCalvingEvent]),[] )) then
                           NutrientProjection.FieldByName('FirstCalvingDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     end;
}

                  If (NutrientProjection.FieldByName('LactNum').AsInteger > 0) then
                     begin  //If still included and has a nonzero Lactation Number, then get Date Of First Calving - Note: The CheckEvents table is indexed on EventDate
                        tDate := WinData.EventDataHelper.GetFirstEventDate(NutrientProjection.FieldByName('AnimalID').AsVariant,CCalvingEvent);
                        if tDate > 0 then
                           NutrientProjection.FieldByName('FirstCalvingDate').AsDateTime := tDate;
                     end;

                  if WinData.tIntHerd.Locate('AnimalID',NutrientProjection.FieldByName('AnimalID').AsVariant,[] )  then
                     begin
                        if WinData.tIntHerd.FieldByName('LastHerdID').AsInteger = StrToInt(ComboHerd.Value) then
                           NutrientProjection.FieldByName('DateMovedOff').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime
                        else if WinData.tIntHerd.FieldByName('NewHerdID').AsInteger = StrToInt(ComboHerd.Value) then
                           NutrientProjection.FieldByName('DateMovedOn').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime;
                     end;
                  // Now to check the breeds table and determine whether eligible for Premium
                  if NutrientProjection.FieldByName('PrimaryBreed').AsInteger > 0 then
                     if WinData.Breeds.Locate('ID', NutrientProjection.FieldByName('PrimaryBreed').AsInteger,[] ) then
                        NutrientProjection.FieldByName('EligibleForPremium').AsBoolean := WinData.Breeds.FieldByName('EligibleForPremium').AsBoolean;

                  Post;
                  Next;
                  pb.Stepit;
               End;
         end;
   finally
      WinData.tIntHerd.Close;
   end;


   // get female and create new records for any expected calves.
   with NutrientProjection do
      try
         CalfList := TStringList.Create;
         WinData.CheckEvents.Filter := '';
         WinData.CheckEvents.Filtered := False;
         WinData.CheckEvents.Close;
         WinData.CheckEvents.Open;

         First;
         while NOT (NutrientProjection.EOF) do
            begin
               Application.ProcessMessages;
               if ( NutrientProjection.FieldByName('Sex').AsString = 'Female') then
                  begin
                     CalvingInfo := WinData.GetProjCalvingInfo(NutrientProjection.FieldByName('AnimalID').AsInteger, NutrientProjection.FieldByName('LactNum').AsInteger);

                     case CalvingInfo.PregStatus of
                        { Use Projected calvings where Service/PD or both havew taken place }
                        psPregnant, psUndefined :
                        begin
                           if (( CalvingInfo.ProjCalvingDate > 0 ) and ( CalvingInfo.NoCalves > 0 )) then
                              begin
                                 // Only use predicted calves if the predicted date is > Today & ExtDate
                                 if ( CalvingInfo.ProjCalvingDate > Now ) then
//                                     ( StartDate > Now ) and (CalvingInfo.ProjCalvingDate <= StartDate)) then
                                    begin   //Add a maximum of four animals only, any more and can not input
                                       if ( CalvingInfo.NoCalves > 4 ) then
                                          Num := 4
                                       else
                                          Num := CalvingInfo.NoCalves;
                                       for i := 1 to Num do
                                          CalfList.AddObject('', TCalfRecord.Create(NutrientProjection.FieldByName('AnimalID').AsInteger,
                                                                 CalvingInfo.ProjCalvingDate));
                                       // After projecting calves, update Dam Status.
                                       if ( NutrientProjection.FieldByName('LactNum').AsInteger = 0 ) then
                                          begin
                                             NutrientProjection.Edit;
                                             NutrientProjection.FieldByName('HeiferCalvingDate').AsDateTime := CalvingInfo.ProjCalvingDate;
                                             NutrientProjection.Post;
                                          end;
                                    end;
                              end;
                        end;
                     end;
                  end;
               Next;
               pb.Stepit;
            end;
      finally
         for i := 0 to CalfList.Count-1 do
            begin
               if CalfList.Objects[i] <> nil then
                  begin
                     NutrientProjection.Insert;   // Inserts a new blank record for a calf
                     NutrientProjection.FieldByName('NatIDNum').AsString := 'New Calf ('+ IntToStr(TCalfRecord(CalfList.Objects[i]).DamID)+')';
                     NutrientProjection.FieldByName('AnimalID').AsInteger := 0;
                     NutrientProjection.FieldByName('DOB').AsDateTime := TCalfRecord(CalfList.Objects[i]).DOB;
                     if i < 999999 then
                        NutrientProjection.FieldByName('Sex').AsString := 'Calf' + IntToStr(i+1)
                     else
                        NutrientProjection.FieldByName('Sex').AsString := 'Calf';
                     NutrientProjection.FieldByName('Include').AsBoolean := True;
                     NutrientProjection.Post;    //Posts new calf record
                     // Debug CalfList.Strings[i] := 'Dam: '+ TCalfRecord(CalfList.Objects[i]).DamNo +', Proj: '+ DateToStr(TCalfRecord(CalfList.Objects[i]).DOB);
                     TCalfRecord(CalfList.Objects[i]).Free;
                  end;
            end;
         // Debug CalfList.SaveToFile('C:\Date ' +FormatDateTime('dd-mm-yyyy', ExtDate) +' ProjCalvings.txt');
         FreeAndNil(CalfList);
      end;

   Application.ProcessMessages;
end;

procedure TfmNINutrientProductionProjectionRptScr.FormCreate(
  Sender: TObject);
var
   x, y,m,d : Word;
begin
   WinData.CanShowStandardReportHint := True;
   DebugMode := False;
   WasteValuesLoaded := False;
   ConfigFile := TStringList.Create;
   fNPDefs := IncludeTrailingBackSlash(DataPath) + 'NINPDefs';

   DecodeDate(Date,y,m,d);
   x := y;
   while (x >= y-5) do
      begin
         cmboYear.Properties.Items.Add(IntToStr(x));
         Dec(x);
      end;
   cmboYear.ItemIndex := 0;


end;

function TfmNINutrientProductionProjectionRptScr.CalcProjectedWaste(ADairyCows,ACattle2YrPlus,ACattle1To2Yrs,ABullBeef0To13Mths,
   ABullBeef6To13Mths,ACattle0To1Yr,ACalves6To12Mths,ACalves0To6Mths: Double) : Double;
begin
   if PartYear then
      begin
         Result := ( ADairyCows * wcDairyCowsProduction) +
                   ( ACattle2YrPlus * wcCattleOver24MthsProduction) +
                   ( ACattle1To2Yrs * wcCattle12To24MthsProduction) +
                   ( ABullBeef6To13Mths * wcBullBeef6To13MthsProduction) +
                   ( ACalves6To12Mths * wcCalves6To12MthsProduction) +
                   ( ACalves0To6Mths * wcCalves0To6MthsProduction);
      end
   else
      begin
         Result := ( ADairyCows * wcDairyCowsProduction) +
                   ( ACattle2YrPlus * wcCattleOver24MthsProduction) +
                   ( ACattle1To2Yrs * wcCattle12To24MthsProduction) +
                   ( ABullBeef0To13Mths * wcBullBeef0To13MthsProduction) +
                   ( ACattle0To1Yr * wcCattle0To12MthsProduction);
      end;
end;

procedure TfmNINutrientProductionProjectionRptScr.LoadWasteValues;
begin
   try
   if FileExists(fNPDefs) then
      begin
         ConfigFile.LoadFromFile(fNPDefs);

         if ConfigFile.Values['FebDCows'] <> '' then
            ceFebDCows.Value := StrToFloat(ConfigFile.Values['FebDCows']);
         if ConfigFile.Values['AprDCows'] <> '' then
            ceAprDCows.Value := StrToFloat(ConfigFile.Values['AprDCows']);
         if ConfigFile.Values['JunDCows'] <> '' then
            ceJunDCows.Value := StrToFloat(ConfigFile.Values['JunDCows']);
         if ConfigFile.Values['AugDCows'] <> '' then
            ceAugDCows.Value := StrToFloat(ConfigFile.Values['AugDCows']);
         if ConfigFile.Values['OctDCows'] <> '' then
            ceOctDCows.Value := StrToFloat(ConfigFile.Values['OctDCows']);
         if ConfigFile.Values['DecDCows'] <> '' then
            ceDecDCows.Value := StrToFloat(ConfigFile.Values['DecDCows']);

         if ConfigFile.Values['FebOlderCattleOver24Mths'] <> '' then
            ceFebOlderCattleOver24Mths.Value := StrToFloat(ConfigFile.Values['FebOlderCattleOver24Mths']);
         if ConfigFile.Values['AprOlderCattleOver24Mths'] <> '' then
            ceAprOlderCattleOver24Mths.Value := StrToFloat(ConfigFile.Values['AprOlderCattleOver24Mths']);
         if ConfigFile.Values['JunOlderCattleOver24Mths'] <> '' then
            ceJunOlderCattleOver24Mths.Value := StrToFloat(ConfigFile.Values['JunOlderCattleOver24Mths']);
         if ConfigFile.Values['AugOlderCattleOver24Mths'] <> '' then
            ceAugOlderCattleOver24Mths.Value := StrToFloat(ConfigFile.Values['AugOlderCattleOver24Mths']);
         if ConfigFile.Values['OctOlderCattleOver24Mths'] <> '' then
            ceOctOlderCattleOver24Mths.Value := StrToFloat(ConfigFile.Values['OctOlderCattleOver24Mths']);
         if ConfigFile.Values['DecOlderCattleOver24Mths'] <> '' then
            ceDecOlderCattleOver24Mths.Value := StrToFloat(ConfigFile.Values['DecOlderCattleOver24Mths']);

         if ConfigFile.Values['FebCattle1224Mths'] <> '' then
            ceFebCattle1224Mths.Value := StrToFloat(ConfigFile.Values['FebCattle1224Mths']);
         if ConfigFile.Values['AprCattle1224Mths'] <> '' then
            ceAprCattle1224Mths.Value := StrToFloat(ConfigFile.Values['AprCattle1224Mths']);
         if ConfigFile.Values['JunCattle1224Mths'] <> '' then
            ceJunCattle1224Mths.Value := StrToFloat(ConfigFile.Values['JunCattle1224Mths']);
         if ConfigFile.Values['AugCattle1224Mths'] <> '' then
            ceAugCattle1224Mths.Value := StrToFloat(ConfigFile.Values['AugCattle1224Mths']);
         if ConfigFile.Values['OctCattle1224Mths'] <> '' then
            ceOctCattle1224Mths.Value := StrToFloat(ConfigFile.Values['OctCattle1224Mths']);
         if ConfigFile.Values['DecCattle1224Mths'] <> '' then
            ceDecCattle1224Mths.Value := StrToFloat(ConfigFile.Values['DecCattle1224Mths']);


         if ConfigFile.Values['FebBullBeef013Mths'] <> '' then
            ceFebBullBeef013Mths.Value := StrToFloat(ConfigFile.Values['FebBullBeef013Mths']);
         if ConfigFile.Values['AprBullBeef013Mths'] <> '' then
            ceAprBullBeef013Mths.Value := StrToFloat(ConfigFile.Values['AprBullBeef013Mths']);
         if ConfigFile.Values['JunBullBeef013Mths'] <> '' then
            ceJunBullBeef013Mths.Value := StrToFloat(ConfigFile.Values['JunBullBeef013Mths']);
         if ConfigFile.Values['AugBullBeef013Mths'] <> '' then
            ceAugBullBeef013Mths.Value := StrToFloat(ConfigFile.Values['AugBullBeef013Mths']);
         if ConfigFile.Values['OctBullBeef013Mths'] <> '' then
            ceOctBullBeef013Mths.Value := StrToFloat(ConfigFile.Values['OctBullBeef013Mths']);
         if ConfigFile.Values['DecBullBeef013Mths'] <> '' then
            ceDecBullBeef013Mths.Value := StrToFloat(ConfigFile.Values['DecBullBeef013Mths']);


         if ConfigFile.Values['FebBullBeef613Mths'] <> '' then
            ceFebBullBeef613Mths.Value := StrToFloat(ConfigFile.Values['FebBullBeef613Mths']);
         if ConfigFile.Values['AprBullBeef613Mths'] <> '' then
            ceAprBullBeef613Mths.Value := StrToFloat(ConfigFile.Values['AprBullBeef613Mths']);
         if ConfigFile.Values['JunBullBeef613Mths'] <> '' then
            ceJunBullBeef613Mths.Value := StrToFloat(ConfigFile.Values['JunBullBeef613Mths']);
         if ConfigFile.Values['AugBullBeef613Mths'] <> '' then
            ceAugBullBeef613Mths.Value := StrToFloat(ConfigFile.Values['AugBullBeef613Mths']);
         if ConfigFile.Values['OctBullBeef613Mths'] <> '' then
            ceOctBullBeef613Mths.Value := StrToFloat(ConfigFile.Values['OctBullBeef613Mths']);
         if ConfigFile.Values['DecBullBeef613Mths'] <> '' then
            ceDecBullBeef613Mths.Value := StrToFloat(ConfigFile.Values['DecBullBeef613Mths']);


         if ConfigFile.Values['FebCattle012Mths'] <> '' then
            ceFebCattle012Mths.Value := StrToFloat(ConfigFile.Values['FebCattle012Mths']);
         if ConfigFile.Values['AprCattle012Mths'] <> '' then
            ceAprCattle012Mths.Value := StrToFloat(ConfigFile.Values['AprCattle012Mths']);
         if ConfigFile.Values['JunCattle012Mths'] <> '' then
            ceJunCattle012Mths.Value := StrToFloat(ConfigFile.Values['JunCattle012Mths']);
         if ConfigFile.Values['AugCattle012Mths'] <> '' then
            ceAugCattle012Mths.Value := StrToFloat(ConfigFile.Values['AugCattle012Mths']);
         if ConfigFile.Values['OctCattle012Mths'] <> '' then
            ceOctCattle012Mths.Value := StrToFloat(ConfigFile.Values['OctCattle012Mths']);
         if ConfigFile.Values['DecCattle012Mths'] <> '' then
            ceDecCattle012Mths.Value := StrToFloat(ConfigFile.Values['DecCattle012Mths']);


         if ConfigFile.Values['FebCalves612Mths'] <> '' then
            ceFebCalves612Mths.Value := StrToFloat(ConfigFile.Values['FebCalves612Mths']);
         if ConfigFile.Values['AprCalves612Mths'] <> '' then
            ceAprCalves612Mths.Value := StrToFloat(ConfigFile.Values['AprCalves612Mths']);
         if ConfigFile.Values['JunCalves612Mths'] <> '' then
            ceJunCalves612Mths.Value := StrToFloat(ConfigFile.Values['JunCalves612Mths']);
         if ConfigFile.Values['AugCalves612Mths'] <> '' then
            ceAugCalves612Mths.Value := StrToFloat(ConfigFile.Values['AugCalves612Mths']);
         if ConfigFile.Values['OctCalves612Mths'] <> '' then
            ceOctCalves612Mths.Value := StrToFloat(ConfigFile.Values['OctCalves612Mths']);
         if ConfigFile.Values['DecCalves612Mths'] <> '' then
            ceDecCalves612Mths.Value := StrToFloat(ConfigFile.Values['DecCalves612Mths']);


         if ConfigFile.Values['FebCalves06Mths'] <> '' then
            ceFebCalves06Mths.Value := StrToFloat(ConfigFile.Values['FebCalves06Mths']);
         if ConfigFile.Values['AprCalves06Mths'] <> '' then
            ceAprCalves06Mths.Value := StrToFloat(ConfigFile.Values['AprCalves06Mths']);
         if ConfigFile.Values['JunCalves06Mths'] <> '' then
            ceJunCalves06Mths.Value := StrToFloat(ConfigFile.Values['JunCalves06Mths']);
         if ConfigFile.Values['AugCalves06Mths'] <> '' then
            ceAugCalves06Mths.Value := StrToFloat(ConfigFile.Values['AugCalves06Mths']);
         if ConfigFile.Values['OctCalves06Mths'] <> '' then
            ceOctCalves06Mths.Value := StrToFloat(ConfigFile.Values['OctCalves06Mths']);
         if ConfigFile.Values['DecCalves06Mths'] <> '' then
            ceDecCalves06Mths.Value := StrToFloat(ConfigFile.Values['DecCalves06Mths']);


         if ConfigFile.Values['NForecast1'] <> '' then
            ceFebTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast1']);
         if ConfigFile.Values['NForecast2'] <> '' then
            ceAprTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast2']);
         if ConfigFile.Values['NForecast3'] <> '' then
            ceJunTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast3']);
         if ConfigFile.Values['NForecast4'] <> '' then
            ceAugTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast4']);
         if ConfigFile.Values['NForecast5'] <> '' then
            ceOctTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast5']);
         if ConfigFile.Values['NForecast6'] <> '' then
            ceDecTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast6']);

         if ConfigFile.Values['NonBovineProduction'] <> '' then
            seAvgNonBovineProduction.Value := StrToFloat(ConfigFile.Values['NonBovineProduction']);
         if ConfigFile.Values['ForageArea'] <> '' then
            begin
               seForageArea.Value := StrToFloat(ConfigFile.Values['ForageArea']);
               if WinData.OwnerFile.Locate('ID', WinData.UserDefaultHerdID, [loCaseInsensitive]) then
                  begin
                     if WinData.OwnerFile.FieldByName('ForageAreaHa').AsFloat > 0 then
                        seForageArea.Value := WinData.OwnerFile.FieldByName('ForageAreaHa').AsFloat;
                  end;
            end;
         WasteValuesLoaded := True;
      end;
   finally
      ceFebDCowsExit(ceFebDCows);
   end;
end;

procedure TfmNINutrientProductionProjectionRptScr.SaveWasteValues;
begin

   ConfigFile.Values['FebDCows'] := FloatToStr(ceFebDCows.Value);
   ConfigFile.Values['AprDCows'] := FloatToStr(ceAprDCows.Value);
   ConfigFile.Values['JunDCows'] := FloatToStr(ceJunDCows.Value);
   ConfigFile.Values['AugDCows'] := FloatToStr(ceAugDCows.Value);
   ConfigFile.Values['OctDCows'] := FloatToStr(ceOctDCows.Value);
   ConfigFile.Values['DecDCows'] := FloatToStr(ceDecDCows.Value);

   ConfigFile.Values['FebOlderCattleOver24Mths'] := FloatToStr(ceFebOlderCattleOver24Mths.Value);
   ConfigFile.Values['AprOlderCattleOver24Mths'] := FloatToStr(ceAprOlderCattleOver24Mths.Value);
   ConfigFile.Values['JunOlderCattleOver24Mths'] := FloatToStr(ceJunOlderCattleOver24Mths.Value);
   ConfigFile.Values['AugOlderCattleOver24Mths'] := FloatToStr(ceAugOlderCattleOver24Mths.Value);
   ConfigFile.Values['OctOlderCattleOver24Mths'] := FloatToStr(ceOctOlderCattleOver24Mths.Value);
   ConfigFile.Values['DecOlderCattleOver24Mths'] := FloatToStr(ceDecOlderCattleOver24Mths.Value);

   ConfigFile.Values['FebCattle1224Mths'] := FloatToStr(ceFebCattle1224Mths.Value);
   ConfigFile.Values['AprCattle1224Mths'] := FloatToStr(ceAprCattle1224Mths.Value);
   ConfigFile.Values['JunCattle1224Mths'] := FloatToStr(ceJunCattle1224Mths.Value);
   ConfigFile.Values['AugCattle1224Mths'] := FloatToStr(ceAugCattle1224Mths.Value);
   ConfigFile.Values['OctCattle1224Mths'] := FloatToStr(ceOctCattle1224Mths.Value);
   ConfigFile.Values['DecCattle1224Mths'] := FloatToStr(ceDecCattle1224Mths.Value);

   ConfigFile.Values['FebBullBeef013Mths'] := FloatToStr(ceFebBullBeef013Mths.Value);
   ConfigFile.Values['AprBullBeef013Mths'] := FloatToStr(ceAprBullBeef013Mths.Value);
   ConfigFile.Values['JunBullBeef013Mths'] := FloatToStr(ceJunBullBeef013Mths.Value);
   ConfigFile.Values['AugBullBeef013Mths'] := FloatToStr(ceAugBullBeef013Mths.Value);
   ConfigFile.Values['OctBullBeef013Mths'] := FloatToStr(ceOctBullBeef013Mths.Value);
   ConfigFile.Values['DecBullBeef013Mths'] := FloatToStr(ceDecBullBeef013Mths.Value);

   ConfigFile.Values['FebBullBeef613Mths'] := FloatToStr(ceFebBullBeef613Mths.Value);
   ConfigFile.Values['AprBullBeef613Mths'] := FloatToStr(ceAprBullBeef613Mths.Value);
   ConfigFile.Values['JunBullBeef613Mths'] := FloatToStr(ceJunBullBeef613Mths.Value);
   ConfigFile.Values['AugBullBeef613Mths'] := FloatToStr(ceAugBullBeef613Mths.Value);
   ConfigFile.Values['OctBullBeef613Mths'] := FloatToStr(ceOctBullBeef613Mths.Value);
   ConfigFile.Values['DecBullBeef613Mths'] := FloatToStr(ceDecBullBeef613Mths.Value);

   ConfigFile.Values['FebCattle012Mths'] := FloatToStr(ceFebCattle012Mths.Value);
   ConfigFile.Values['AprCattle012Mths'] := FloatToStr(ceAprCattle012Mths.Value);
   ConfigFile.Values['JunCattle012Mths'] := FloatToStr(ceJunCattle012Mths.Value);
   ConfigFile.Values['AugCattle012Mths'] := FloatToStr(ceAugCattle012Mths.Value);
   ConfigFile.Values['OctCattle012Mths'] := FloatToStr(ceOctCattle012Mths.Value);
   ConfigFile.Values['DecCattle012Mths'] := FloatToStr(ceDecCattle012Mths.Value);

   ConfigFile.Values['FebCalves612Mths'] := FloatToStr(ceFebCalves612Mths.Value);
   ConfigFile.Values['AprCalves612Mths'] := FloatToStr(ceAprCalves612Mths.Value);
   ConfigFile.Values['JunCalves612Mths'] := FloatToStr(ceJunCalves612Mths.Value);
   ConfigFile.Values['AugCalves612Mths'] := FloatToStr(ceAugCalves612Mths.Value);
   ConfigFile.Values['OctCalves612Mths'] := FloatToStr(ceOctCalves612Mths.Value);
   ConfigFile.Values['DecCalves612Mths'] := FloatToStr(ceDecCalves612Mths.Value);

   ConfigFile.Values['FebCalves06Mths'] := FloatToStr(ceFebCalves06Mths.Value);
   ConfigFile.Values['AprCalves06Mths'] := FloatToStr(ceAprCalves06Mths.Value);
   ConfigFile.Values['JunCalves06Mths'] := FloatToStr(ceJunCalves06Mths.Value);
   ConfigFile.Values['AugCalves06Mths'] := FloatToStr(ceAugCalves06Mths.Value);
   ConfigFile.Values['OctCalves06Mths'] := FloatToStr(ceOctCalves06Mths.Value);
   ConfigFile.Values['DecCalves06Mths'] := FloatToStr(ceDecCalves06Mths.Value);

   ConfigFile.Values['ReportType'] := 'N';

   ConfigFile.Values['NForecast1'] := FloatToStr(ceFebTotalForecast.Value);
   ConfigFile.Values['NForecast2'] := FloatToStr(ceAprTotalForecast.Value);
   ConfigFile.Values['NForecast3'] := FloatToStr(ceJunTotalForecast.Value);
   ConfigFile.Values['NForecast4'] := FloatToStr(ceAugTotalForecast.Value);
   ConfigFile.Values['NForecast5'] := FloatToStr(ceOctTotalForecast.Value);
   ConfigFile.Values['NForecast6'] := FloatToStr(ceDecTotalForecast.Value);

   ConfigFile.Values['NonBovineProduction'] := FloatToStr(seAvgNonBovineProduction.Value);
   ConfigFile.Values['ForageArea'] := FloatToStr(seForageArea.Value);

   ConfigFile.SaveToFile(fNPDefs);
end;

{ TCalfRecord }

constructor TCalfRecord.Create(ADamID: Integer; ADOB: TDateTime);
begin
   DOB := ADOB;
  DamID := ADamID;
end;

procedure TfmNINutrientProductionProjectionRptScr.FormDestroy(
  Sender: TObject);
begin
   if AnimalList <> nil then
      begin
         FreeAndNil(AnimalList);
         FreeAndNil(AnimalList2);
      end;
   if NutrientProjection <> nil then
      begin
         NutrientProjection.Close;
         NutrientProjection.DeleteTable;
         NutrientProjection.Free;
      end;
   if fmNINutrientProductionProjectionRpt <> nil then
      FreeAndNil(fmNINutrientProductionProjectionRpt);
   SaveWasteValues;
   WinData.cxHint.HideHint;
end;

procedure TfmNINutrientProductionProjectionRptScr.sbViewClick(
  Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;

   if VarIsNull(cmboYear.EditValue) then
      begin
         MessageDlg('No valid report year specified',mtError,[mbOK],0);
         Exit;
      end;

   if DebugMode then
      begin
         if AnimalList = nil then
            AnimalList := TStringList.Create;
         if AnimalList2 = nil then
            AnimalList2 := TStringList.Create;

         AnimalList.Clear;
         AnimalList2.Clear;
      end;

   seAvgNonBovineProduction.PostEditValue;
   seForageArea.PostEditValue;
   ceFebTotalForecast.PostEditValue;
   ceAprTotalForecast.PostEditValue;
   ceJunTotalForecast.PostEditValue;
   ceAugTotalForecast.PostEditValue;
   ceOctTotalForecast.PostEditValue;
   ceDecTotalForecast.PostEditValue;

   if fmNINutrientProductionProjectionRpt = nil then
      fmNINutrientProductionProjectionRpt := TfmNINutrientProductionProjectionRpt.Create(nil);

   sbView.Enabled := False;
   sbPrint.Enabled := False;
   try
      BuildProjection;
   finally
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end

{   if DebugMode then
      begin
         if AnimalList <> nil then
            begin
               AnimalList.Sort;
               AnimalList.SaveToFile('C:\NutProd'+ ComboHerd.Text +'.dat');
            end;
      end;}
end;

procedure TfmNINutrientProductionProjectionRptScr.sbExitClick(
  Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;   
end;

procedure TfmNINutrientProductionProjectionRptScr.sbWasteProdRatesClick(
  Sender: TObject);
begin
   TfmSetupWasteProdRates.ShowForm( WinData.GetHerdCountry(WinData.OwnerFile, ComboHerd.Value));
   SetWasteValues;
   ceFebDCowsExit(ceFebDCows);
end;

procedure TfmNINutrientProductionProjectionRptScr.ComboHerdChange(
  Sender: TObject);
begin
   if ComboHerd.Value <> '0' then
      WinData.UserDefaultHerdID := StrToInt(ComboHerd.Value);
end;

procedure TfmNINutrientProductionProjectionRptScr.FormKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = 'd' then  DebugMode := True;
end;

procedure TfmNINutrientProductionProjectionRptScr.SetWasteValues;
begin
   wcDairyCowsProduction          := GetWasteRateValue(wcDairyCows) / 6;
   wcCattleOver24MthsProduction   := GetWasteRateValue(wcCattleOver24Mths) / 6;
   wcCattle12To24MthsProduction   := GetWasteRateValue(wcCattle12To24Mths) / 6;
   wcBullBeef0To13MthsProduction  := GetWasteRateValue(wcBullBeef0To13Mths) / 6;
   wcBullBeef6To13MthsProduction  := GetWasteRateValue(wcBullBeef6To13Mths) / 6;
   wcCattle0To12MthsProduction    := GetWasteRateValue(wcCattle0To12Mths) / 6;
   wcCalves6To12MthsProduction    := GetWasteRateValue(wcCalves6To12Mths) / 6;
   wcCalves0To6MthsProduction     := GetWasteRateValue(wcCalves0To6Mths) / 6;
end;

procedure TfmNINutrientProductionProjectionRptScr.ceFebDCowsExit(
  Sender: TObject);
begin
   ceFebTotalForecast.Value := CalcProjectedWaste(ceFebDCows.Value, ceFebOlderCattleOver24Mths.Value, ceFebCattle1224Mths.Value,
                                                  ceFebBullBeef013Mths.Value, ceFebBullBeef613Mths.Value, ceFebCattle012Mths.Value, ceFebCalves612Mths.Value,
                                                  ceFebCalves06Mths.Value);
   ceAprDCowsExit(ceAprDCows);
end;

procedure TfmNINutrientProductionProjectionRptScr.ceAprDCowsExit(
  Sender: TObject);
begin
   ceAprTotalForecast.Value := ceFebTotalForecast.Value + CalcProjectedWaste(ceAprDCows.Value, ceAprOlderCattleOver24Mths.Value, ceAprCattle1224Mths.Value,
                                                  ceAprBullBeef013Mths.Value, ceAprBullBeef613Mths.Value, ceAprCattle012Mths.Value, ceAprCalves612Mths.Value,
                                                  ceAprCalves06Mths.Value);
   ceJunDCowsExit(ceJunDCows);
end;

procedure TfmNINutrientProductionProjectionRptScr.ceJunDCowsExit(
  Sender: TObject);
begin
   ceJunTotalForecast.Value := ceAprTotalForecast.Value + CalcProjectedWaste(ceJunDCows.Value, ceJunOlderCattleOver24Mths.Value, ceJunCattle1224Mths.Value,
                                                  ceJunBullBeef013Mths.Value, ceJunBullBeef613Mths.Value, ceJunCattle012Mths.Value, ceJunCalves612Mths.Value,
                                                  ceJunCalves06Mths.Value);
   ceAugDCowsExit(ceAugDCows);
end;

procedure TfmNINutrientProductionProjectionRptScr.ceOctDCowsExit(
  Sender: TObject);
begin
   ceOctTotalForecast.Value := ceAugTotalForecast.Value + CalcProjectedWaste(ceOctDCows.Value, ceOctOlderCattleOver24Mths.Value, ceOctCattle1224Mths.Value,
                                                  ceOctBullBeef013Mths.Value, ceOctBullBeef613Mths.Value, ceOctCattle012Mths.Value, ceOctCalves612Mths.Value,
                                                  ceOctCalves06Mths.Value);
   ceDecDCowsExit(ceDecDCows);
end;

procedure TfmNINutrientProductionProjectionRptScr.ceDecDCowsExit(
  Sender: TObject);
begin
   ceDecTotalForecast.Value := ceOctTotalForecast.Value + CalcProjectedWaste(ceDecDCows.Value, ceDecOlderCattleOver24Mths.Value, ceDecCattle1224Mths.Value,
                                                  ceDecBullBeef013Mths.Value, ceDecBullBeef613Mths.Value, ceDecCattle012Mths.Value, ceDecCalves612Mths.Value,
                                                  ceDecCalves06Mths.Value);
end;

procedure TfmNINutrientProductionProjectionRptScr.ceAugDCowsExit(
  Sender: TObject);
begin
   ceAugTotalForecast.Value := ceJunTotalForecast.Value + CalcProjectedWaste(ceAugDCows.Value, ceAugOlderCattleOver24Mths.Value, ceAugCattle1224Mths.Value,
                                                  ceAugBullBeef013Mths.Value, ceAugBullBeef613Mths.Value, ceAugCattle012Mths.Value, ceAugCalves612Mths.Value,
                                                  ceAugCalves06Mths.Value);
   ceOctDCowsExit(ceOctDCows);
end;

procedure TfmNINutrientProductionProjectionRptScr.cmboPartYearPropertiesEditValueChanged(
  Sender: TObject);
begin

   PartYear := cmboPartYear.ItemIndex = 1;

   ceFebBullBeef013Mths.Enabled := not PartYear;
   ceAprBullBeef013Mths.Enabled := not PartYear;
   ceJunBullBeef013Mths.Enabled := not PartYear;
   ceAugBullBeef013Mths.Enabled := not PartYear;
   ceOctBullBeef013Mths.Enabled := not PartYear;
   ceDecBullBeef013Mths.Enabled := not PartYear;

   ceFebCattle012Mths.Enabled := not PartYear;
   ceAprCattle012Mths.Enabled := not PartYear;
   ceJunCattle012Mths.Enabled := not PartYear;
   ceAugCattle012Mths.Enabled := not PartYear;
   ceOctCattle012Mths.Enabled := not PartYear;
   ceDecCattle012Mths.Enabled := not PartYear;

   ceFebBullBeef613Mths.Enabled := PartYear;
   ceAprBullBeef613Mths.Enabled := PartYear;
   ceJunBullBeef613Mths.Enabled := PartYear;
   ceAugBullBeef613Mths.Enabled := PartYear;
   ceOctBullBeef613Mths.Enabled := PartYear;
   ceDecBullBeef613Mths.Enabled := PartYear;

   ceFebCalves06Mths.Enabled := PartYear;
   ceAprCalves06Mths.Enabled := PartYear;
   ceJunCalves06Mths.Enabled := PartYear;
   ceAugCalves06Mths.Enabled := PartYear;
   ceOctCalves06Mths.Enabled := PartYear;
   ceDecCalves06Mths.Enabled := PartYear;

   ceFebCalves612Mths.Enabled := PartYear;
   ceAprCalves612Mths.Enabled := PartYear;
   ceJunCalves612Mths.Enabled := PartYear;
   ceAugCalves612Mths.Enabled := PartYear;
   ceOctCalves612Mths.Enabled := PartYear;
   ceDecCalves612Mths.Enabled := PartYear;
   ceFebDCowsExit(ceFebDCows);
end;

procedure TfmNINutrientProductionProjectionRptScr.cmboYearPropertiesEditValueChanged(
  Sender: TObject);
begin
   if not VarIsNull(cmboYear.EditValue) then
      begin
         ThisYear := StrToInt(cmboYear.Text);
         deDate1.Date := EncodeDate(ThisYear, 2, 1);
         deDate2.Date := EncodeDate(ThisYear, 4, 1);
         deDate3.Date := EncodeDate(ThisYear, 6, 1);
         deDate4.Date := EncodeDate(ThisYear, 8, 1);
         deDate5.Date := EncodeDate(ThisYear, 10, 1);
         deDate6.Date := EncodeDate(ThisYear, 12, 1);
      end;

   pForecast.Visible := CurrentYearSelected;
end;

function TfmNINutrientProductionProjectionRptScr.CurrentYearSelected: Boolean;
begin
   Result := StrToInt(cmboYear.Text) = CurrentYear;
end;

procedure TfmNINutrientProductionProjectionRptScr.deDate2Editing(
  Sender: TObject; var CanEdit: Boolean);
begin
   Canedit := False;

end;

procedure TfmNINutrientProductionProjectionRptScr.deDate1PropertiesEditValueChanged(
  Sender: TObject);
var
   nYear, nMonth, nDay : Word;

  procedure ResetDate;
  begin
     DecodeDate(Date, nYear, nMonth, nDay);
     deDate1.Date := EncodeDate(nYear, 2, 1);
  end;

begin

   if (deDate1.Date > 0) then
      begin
         DecodeDate(deDate1.Date, nYear, nMonth, nDay);
         if not VarIsNull(cmboYear.EditValue) then
            begin
               if nYear <> cmboYear.EditValue then
                  begin
                     MessageDlg('The selected date does not correspond to the selected report year.',mtError,[mbOK],0);
                     ResetDate;
                  end
               else
                  begin

                     if IsLeapYear(nYear) then
                        nDay := 29
                     else
                        nDay := 28;

                     if ((deDate1.Date < EncodeDate(nYear,1,1)) or (deDate1.Date > EncodeDate(nYear,2,nDay))) then
                        begin
                           MessageDlg('The selected date must be in January or February.',mtError,[mbOK],0);
                           ResetDate;
                        end
                     else
                        begin
                            deDate2.Date := IncMonth(deDate1.Date, 2);
                            deDate3.Date := IncMonth(deDate2.Date, 2);
                            deDate4.Date := IncMonth(deDate3.Date, 2);
                            deDate5.Date := IncMonth(deDate4.Date, 2);
                            deDate6.Date := IncMonth(deDate5.Date, 2);
                        end;
                  end;
            end
         else
            begin
               MessageDlg('No valid report year specified',mtError,[mbOK],0);
               ResetDate;
            end;
      end
   else
      begin
         ResetDate;
      end;
end;

procedure TfmNINutrientProductionProjectionRptScr.FormActivate(
  Sender: TObject);
var
  pt : TPoint;
begin
   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;   
end;

procedure TfmNINutrientProductionProjectionRptScr.sbViewMouseLeave(
  Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfmNINutrientProductionProjectionRptScr.FormShow(
  Sender: TObject);
begin
   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cNutrientProdRep);
   WinData.UpdateRecentReportUsage(cNutrientProdRep);
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TfmNINutrientProductionProjectionRptScr.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cNutrientProdRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cNutrientProdRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.
