{
   07/04/11 [V4.0 R9.4] /MK Change - Drop 100% For All Services, All Calvings and All Calves
                                   - Change Caption Of Label38 To "Avg. No. of Services/Cow"
                                   - Made Changes to Services Panel Dependant On Change to Label38.

   07/04/11 [V4.0 R9.4] /MK Additional Feature - If Spring Calving Herd Then Default StartDate To 01/01/CurrentYear.

   08/04/11 [V4.0 R9.4] /MK Additional Feature - Add * To Breeding Heifers And Add Comment At Bottom of gbCattle For "Includes All Breeds".

   02/02/12 [V5.0 R3.6] /MK Change - DisplayConditionScores - New Rules Added Including New Index.

   02/07/12 [V5.0 R7.4] /MK Change - uHerdStatistics - Added Non Return Rates.

   03/07/12 [V5.0 R7.4] /MK Bug Fix - Services Section Should Be Calculated By No. Of Services / No. Cows Served.

   18/06/13 [V5.1 R7.4] /MK Additional Feature - Created new Inseminator Rates based on None Return Rates.

   25/06/13 [V5.1 R7.5] /MK Change - Don't run Calving Indices automatically - added button to run Calving Indices and show panel.
                                   - Don't run Herd Statistics when form opens - added button to run Herd Statistics.

   28/06/13 [V5.1 R7.7] /MK Bug Fix - Checking for TempTechnician.RecordCount when the TempTechnican temp wasn't created.

   02/07/13 [V5.1 R8.1] /MK Bug Fix - If animal found more than once with different lactations then only
                                      check for the animal once as this will cause inconsitency between total cows served
                                      and sum of ServiceRecords.Service1+2+3+$orMore.

   27/01/14 [V5.2 R7.8] /MK Change - Change Calving Index/Indices to Calving Interval.

   29/10/14 [V5.3 R8.7] /MK Change - If no data found for Conception Rates Perc then default label to n/a - GL request.

   30/10/14 [V5.3 R8.8] /MK Change - GetNumNonReturnRates - qAnimals - Only look for service events, bulling events shouldn't matter here - GL request.
                                                          - Of the qAnimals found look for the technician(s) used in the service events within this period.
                                                          - If percentage not available for heifers and cow percentage is n/a then heifers should also be n/a.
                                                          - If percentage not available for heifers and cow percentage > 0 then heifers should be 0.

   19/08/15 [V5.4 R7.4] /MK Change - Changed heading of Breeding Statistics report from Herd Statistics to Breeding Statistics.
                                   - Calving Indices section was missing from Breeding Statistics report - GL request.

   27/08/15 [V5.4 R7.4] /MK Additional Feature - DoBreedingSQLs - Added new Average Services Per Cow (Sexed Semen) - John Buckley (Sn. 7149).

   14/06/19 [V5.8 R9.4] /MK Change - Removed Calving Intervals button as Breeding Statistics now includes Calving Intervals since the new
                                     TProjectedCalvingData class generates this data quicker.

   23/08/19 [V5.9 R0.1] /MK Change - Changed top of Total Calves section to seperate it visually from Total Calvings - GL request.
                                   - Hide "By Inseminator" label if no inseminators found - GL request.
                            Bug Fix - DoBreedingSQLs - Replaced single NoLiveCalves query with four seperate queries that count calvings where all calves are dead.
                                                       Bug was calvings that had one live and one dead calf were being taken as dead calving but GL agreed that
                                                       count is for "No Live Calves" in any of the calves of the calving event.

   20/03/20 [V5.9 R2.9] /MK Bug Fix - StepProgress - Added try, except, end around StepProgress as sometimes "Invalid Floating Point" error appears.
}

unit uHerdStatistics;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, ActnList, dxBar, dxBarExtItems, cxControls, dxStatusBar,
  cxContainer, cxEdit, cxProgressBar, ExtCtrls, StdCtrls, cxPC, QRCtrls,
  QuickRpt, db, dbTables, RxLookup, cxGroupBox, ComCtrls, cxButtons,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, uSQLFilters,
  Mask, ToolEdit, KDBRoutines, uHerdLookup, dxPSCore, dxPSContainerLnk,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxStyles, cxCheckBox, DateUtil,
  cxSpinEdit, RXCtrls, uApplicationLog, uProjectedCalvingData,
  dxPScxCommon, dxPScxGridLnk;

type
  TIntArray = array of Integer;

  TDefaultView = (dvDairyHerdStats, dvBreedingStats, dvBeefHerdStats, dvCSHerdSummary, dvA1A2Results);

  TBeefHerdStatsRecord = record
    DaysOnFarm : Integer;
    AnimalsOnFarm : Integer;
    AvgDaysOnFarm : Double;
  end;

  TServiceRecords = record
    AllServices : Integer;
    Service1    : Integer;
    Service2    : Integer;
    Service3    : Integer;
    Service4AndMore : Integer;
    Service4AndMoreNoOfServices : Integer;
  end;

   TfmHerdStatistics = class(TfmBaseForm)
    Timer1: TTimer;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarLargeButton1: TdxBarLargeButton;
    actPrint: TAction;
    GenQuery: TQuery;
    Query1: TQuery;
    PageControl: TcxPageControl;
    tsHerdStats: TcxTabSheet;
    gbDairy: TcxGroupBox;
    Label20: TLabel;
    Label37: TLabel;
    lTotCowsInHerd: TLabel;
    LTotPdCon: TLabel;
    LTotServNotPd: TLabel;
    LTotNotServ: TLabel;
    LTotInMilk: TLabel;
    LTotDry: TLabel;
    LPercCowsInHerd: TLabel;
    LPercPdCon: TLabel;
    LPercServNotPd: TLabel;
    LPercNotServ: TLabel;
    LPercInMilk: TLabel;
    LPercDry: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Lable2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Label16: TLabel;
    lTotNotPreg: TLabel;
    lPerclNotPreg: TLabel;
    gbCattle: TcxGroupBox;
    Label2: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LTotDairyHeif: TLabel;
    LTotBeefHeif: TLabel;
    LTotDairyBull: TLabel;
    LTotBeefBull: TLabel;
    LTotSteers: TLabel;
    LPercDairyHeif: TLabel;
    LPercBeefHeif: TLabel;
    LPercDairyBull: TLabel;
    LPercSteers: TLabel;
    LPercBeefBull: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    cxProgressBar: TcxProgressBar;
    tsBreedingStats: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    LPercFourthServ: TLabel;
    LPercAllServ: TLabel;
    LTotFirstServ: TLabel;
    LPercFirstServ: TLabel;
    LTotSecondServ: TLabel;
    LPercSecondServ: TLabel;
    LTotThirdServ: TLabel;
    LPercThirdServ: TLabel;
    LTotFourthServ: TLabel;
    LTotAllServ: TLabel;
    lAvgServe: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    lNoAnimalsServiced: TLabel;
    cxGroupBox4: TcxGroupBox;
    Label80: TLabel;
    Label81: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    lTotAllCalvings: TLabel;
    LTotStillBirth: TLabel;
    lTotSingleBirths: TLabel;
    lTotTwinBirths: TLabel;
    lPercAllCalvings: TLabel;
    LPercStillBirth: TLabel;
    lPercSingleBirths: TLabel;
    lPercTwinBirths: TLabel;
    Label33: TLabel;
    LTotLiveCalves: TLabel;
    LPercLiveCalves: TLabel;
    LTotDeadCalves: TLabel;
    Label34: TLabel;
    LPercDeadCalves: TLabel;
    Label35: TLabel;
    LTotHeiferCalves: TLabel;
    LPercHeiferCalves: TLabel;
    LTotBullCalves: TLabel;
    LPercBullCalves: TLabel;
    Label36: TLabel;
    LTotAllCalves: TLabel;
    LPercAllCalves: TLabel;
    Bevel8: TBevel;
    gbCalvingIntervals: TcxGroupBox;
    Label27: TLabel;
    Label32: TLabel;
    lActCalfInterval: TLabel;
    lProjCalfInterval: TLabel;
    cxGroupBox6: TcxGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    FromBreedingDate: TDateEdit;
    ToBreedingDate: TDateEdit;
    tsBeefHerdStats: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    deFromDate: TcxDateEdit;
    deToDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel3: TcxLabel;
    cmboSex: TcxComboBox;
    btnViewResults: TcxButton;
    gbResults: TcxGroupBox;
    cxLabel4: TcxLabel;
    teTotalAnimalDays: TcxTextEdit;
    cxLabel5: TcxLabel;
    teTotalAnimals: TcxTextEdit;
    cxLabel6: TcxLabel;
    teAvgDays: TcxTextEdit;
    cxLabel8: TcxLabel;
    teAvgDLWG: TcxTextEdit;
    cxGroupBox7: TcxGroupBox;
    Label14: TLabel;
    Label19: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    lBeefFemales: TLabel;
    lBeefBulls: TLabel;
    lBeefSteers: TLabel;
    lBeefFemalesPerc: TLabel;
    lBeefSteersPerc: TLabel;
    lBeefBullsPerc: TLabel;
    Label40: TLabel;
    lAllCattle: TLabel;
    lAllCattlePerc: TLabel;
    Bevel2: TBevel;
    tsCSHerdSummary: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    CSGridLevel: TcxGridLevel;
    CSGrid: TcxGrid;
    CSGridDBTableView: TcxGridTableView;
    CSGridDBTableViewScoreRange: TcxGridColumn;
    CSGridDBTableViewNoOfAnimals: TcxGridColumn;
    cxStyleRepository1: TcxStyleRepository;
    ScoreStyle: TcxStyle;
    CSGridDBTableViewPercOfTotal: TcxGridColumn;
    Label45: TLabel;
    teCSTotalAnimals: TcxTextEdit;
    cmboCSPeriod: TcxComboBox;
    cxLabel9: TcxLabel;
    cbUseActiveFilter: TcxCheckBox;
    Label46: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    cxGroupBox8: TcxGroupBox;
    lNonReturnRateCaption: TLabel;
    LPercNonReturnRateCows: TLabel;
    Label54: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    LPercNonReturnRateHeifs: TLabel;
    LPercNonReturnRateAll: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    lInseminator1: TLabel;
    lInseminatorRate1: TLabel;
    lInseminator2: TLabel;
    lInseminatorRate2: TLabel;
    lInseminator3: TLabel;
    lInseminatorRate3: TLabel;
    seNonReturnDays: TcxSpinEdit;
    lByInseminator: TcxLabel;
    gbHerdID: TcxGroupBox;
    Label15: TLabel;
    HerdCombo: TRxDBLookupCombo;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    pRunStats: TPanel;
    btnRunStats: TRxSpeedButton;
    lHAvgServPerCowSexedSemen: TLabel;
    lAveServeCowSexSemen: TLabel;
    tsA1A2Results: TcxTabSheet;
    gbA1A2HerdSummary: TcxGroupBox;
    A1A2ResultGrid: TcxGrid;
    A1A2ResultGridTableView: TcxGridTableView;
    A1A2ResultGridTableViewCategory: TcxGridColumn;
    A1A2ResultGridTableViewCategoryTotal: TcxGridColumn;
    A1A2ResultGridTableViewA1A1Perc: TcxGridColumn;
    A1A2ResultGridLevel: TcxGridLevel;
    A1A2ResultGridTableViewA1A2Perc: TcxGridColumn;
    A1A2ResultGridTableViewA2A2Perc: TcxGridColumn;
    A1A2ResultGridTableViewBlanksPerc: TcxGridColumn;
    A1A2ResultGridTableViewA2A2Total: TcxGridColumn;
    A1A2ResultGridTableViewA1A2Total: TcxGridColumn;
    A1A2ResultGridTableViewA1A1Total: TcxGridColumn;
    A1A2ResultGridTableViewBlanksTotal: TcxGridColumn;
    HeaderStyle: TcxStyle;
    GridPrinter: TdxComponentPrinter;
    A1A2ResultGridPrinterLink: TdxGridReportLink;
    procedure FormShow(Sender: TObject);
    procedure HerdComboCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure deFromDatePropertiesChange(Sender: TObject);
    procedure btnViewResultsClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure PageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure FromBreedingDateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmboSexPropertiesChange(Sender: TObject);
    procedure tsBeefHerdStatsShow(Sender: TObject);
    procedure tsCSHerdSummaryShow(Sender: TObject);
    procedure cmboCSPeriodPropertiesChange(Sender: TObject);
    procedure cbUseActiveFilterPropertiesChange(Sender: TObject);
    procedure seNonReturnDaysPropertiesChange(Sender: TObject);
    procedure btnBreedingSQLClick(Sender: TObject);
    procedure btnRunHerdStatisticsClick(Sender: TObject);
    procedure btnRunStatsClick(Sender: TObject);
  private
    { Private declarations }
    FCowsInHerd : Integer;
    FCowsInMilk : Integer;
    FCowsDry : Integer;
    FCowsNotServed : Integer;
    FCowsServedNotPD : Integer;
    FCowsPDConfirmed : Integer;
    FCowsNotPregnant : Integer;
    FDairyHeifers : Integer;
    FBeefHeifers : Integer;
    FDairyBulls : Integer;
    FBeefBulls : Integer;
    FSteers : Integer;
    FHerdTotal : Integer;
    FBeefFemales : Integer;

    SQLFilter : TSQLFilter;

    FormShowing : Boolean;

    HerdType : THerdType;

    FBreedPrdDays : Integer;
    FBreedingSQLsComplete : Boolean;

    function GetCowsDry: Integer;
    function GetCowsInHerd: Integer;
    function GetCowsInMilk: Integer;
    function GetCowsNotServed: Integer;
    function GetCowsServedNotPD: Integer;
    function GetCowsPDConfirmed: Integer;
    function GetCowsNotPregnant: Integer;
    function GetDairyHeifers: Integer;
    function GetBeefHeifers: Integer;
    function GetBeefBulls: Integer;
    function GetDairyBulls: Integer;
    function GetSteers: Integer;
    function GetHerdTotal: Integer;

    procedure ResetHerdStats;
    procedure DoHerdStatSQLs;
    procedure AssignHerdStatCaptions;

    procedure DoBreedingSQLs;
    procedure ResetBreedingStats;
    procedure AssignBreedingCaptions;
    procedure AssignBeefStatCaptions;
    procedure GetCalvingInterval;


    procedure ProduceBeefPeriodAnalysis(AFromDate, AToDate : TDateTime);

    procedure DisplayHerdStatResults;
    procedure DisplayBreedingHerdStatResults;
    procedure DisplayBeefHerdStats;
    procedure StepProgress;
    function GetBeefFemales: Integer;
    procedure DisplayOnHoldingStatResults;
    procedure SetupScreen;

    procedure DisplayConditionScores;
    procedure CalcNonReturnRates;

    procedure DisplayA1A2ResultStats;
  public
    { Public declarations }
//     NoOfCows : Integer;
     AnimalCount : Integer;
     FDefaultView : TDefaultView;
     procedure ShowTheForm;

     property CowsInHerd : Integer read GetCowsInHerd;
     property CowsInMilk : Integer read GetCowsInMilk;
     property CowsDry : Integer read GetCowsDry;
     property CowsNotServed : Integer read GetCowsNotServed;
     property CowsServedNotPD : Integer read GetCowsServedNotPD;
     property CowsPDConfirmed : Integer read GetCowsPDConfirmed;
     property CowsNotPregnant : Integer read GetCowsNotPregnant;
     property DairyHeifers : Integer read GetDairyHeifers;
     property BeefHeifers : Integer read GetBeefHeifers;
     property DairyBulls : Integer read GetDairyBulls;
     property BeefBulls : Integer read GetBeefBulls;
     property Steers : Integer read GetSteers;
     property HerdTotal : Integer read GetHerdTotal;
     property BeefFemales : Integer read GetBeefFemales;

     class procedure ShowForm(ADefaultView : TDefaultView);
  end;

var
  fmHerdStatistics: TfmHerdStatistics;

const
   CowsInHerd  = 0;
   InMilk      = 1;
   Dry         = 2;
   NotServed   = 3;
   ServedNotPD = 4;
   PDConfirmed = 5;
   NotPreg     = 6;
   DHeifers    = 7;
   BHeifers    = 8;
   DBulls      = 9;
   BBulls      = 10;
   Steers      = 11;
   Mainsql =  'WHERE (A.LactNo > 0) AND (A.Sex = "Female") AND (A.Breeding = True) AND (A.InHerd=True) AND (A.AnimalDeleted=False)';
   AllCalvings       = 0;
   StillBirths       = 1;
   NoSingleBirth     = 2;
   NoTwinBirths      = 3;
   AllCalves         = 4;
   LiveCalves        = 5;
   DeadCalves        = 6;
   HeiferCalves      = 7;
   BulCalves         = 8;
   AllServices       = 9;
   CalvingInterval   = 10;

implementation
uses
   DairyData,
   GenTypesConst,
   uHerdStatsExtended,
   MenuUnit, KRoutines, uHerdStatsBreedingRep, uHerdStatsGenReport,
  uHerdStatsBeefGenRep;

{$R *.DFM}

{ TfmHerdStatistics }

procedure TfmHerdStatistics.AssignHerdStatCaptions;
begin
   with fmHerdStatsGenReport.Create(nil) do
      try
         lHerd.Caption := HerdCombo.Text;
         QRTotCows.Caption          := lTotCowsInHerd.Caption;
         QRTotNotServed.Caption     := LTotNotServ.Caption;
         QRTotServedNotPD.Caption   := LTotServNotPd.Caption;
         QRTotPdCon.Caption         := LTotPdCon.Caption;
         QRTotMilk.Caption          := LTotInMilk.Caption;
         QRTotDry.Caption           := LTotDry.Caption;
         QRPerCows.Caption          := LPercCowsInHerd.Caption;
         QRPerNotServed.Caption     := LPercNotServ.Caption;
         QRPerServedNotPD.Caption   := LPercServNotPd.Caption;
         QRPerPdCon.Caption         := LPercPdCon.Caption;
         QRPerMilk.Caption          := LPercInMilk.Caption;
         QRPerDry.Caption           := LPercDry.Caption;
         QRTotDHeifers.Caption      := LTotDairyHeif.Caption;
         QRTotBHeifers.Caption      := LTotBeefHeif.Caption;
         QRTotDBulls.Caption        := LTotDairyBull.Caption;
         QRTotBBulls.Caption        := LTotBeefBull.Caption;
         QRTotSteers.Caption        := LTotSteers.Caption;
         QRPerDHeifers.Caption      := LPercDairyHeif.Caption;
         QRPerBHeifers.Caption      := LPercBeefHeif.Caption;
         QRPerDBulls.Caption        := LPercDairyBull.Caption;
         QRPerBBulls.Caption        := LPercBeefBull.Caption;
         QRPerSteers.Caption        := LPercSteers.Caption;
         qrStats.Print;
      finally
         Free;
      end;
end;

procedure TfmHerdStatistics.ResetHerdStats;
begin
   cxProgressBar.Visible := False;

   FCowsInHerd := 0;
   FCowsInMilk := 0;
   FCowsDry := 0;
   FCowsNotServed := 0;
   FCowsServedNotPD := 0;
   FCowsPDConfirmed := 0;
   FCowsNotPregnant := 0;
   FDairyHeifers := 0;
   FBeefHeifers := 0;
   FDairyBulls := 0;
   FBeefBulls := 0;
   FSteers := 0;
   FHerdTotal := 0;
   FBeefFemales := 0;

   lTotCowsInHerd.Caption  := '0';
   LTotPdCon.Caption       := '0';
   LTotServNotPd.Caption   := '0';
   LTotNotServ.Caption     := '0';
   LTotInMilk.Caption      := '0';
   LTotDry.Caption         := '0';
   LTotDairyHeif.Caption   := '0';
   LTotBeefHeif.Caption    := '0';
   LTotDairyBull.Caption   := '0';
   LTotBeefBull.Caption    := '0';
   LTotSteers.Caption      := '0';
   LPercCowsInHerd.Caption := '0';
   LPercPdCon.Caption      := '0';
   LPercServNotPd.Caption  := '0';
   LPercNotServ.Caption    := '0';
   LPercInMilk.Caption     := '0';
   LPercDry.Caption        := '0';
   LPercDairyHeif.Caption  := '0';
   LPercBeefHeif.Caption   := '0';
   LPercDairyBull.Caption  := '0';
   LPercSteers.Caption     := '0';
   LPercBeefBull.Caption   := '0';
   lTotNotPreg.Caption     := '0';
   lPerclNotPreg.Caption   := '0';
end;

procedure TfmHerdStatistics.DoHerdStatSQLs;
begin

   if HerdCombo.KeyValue <= 0 then Exit;

   AnimalCount := 0;

   cxProgressBar.Parent := tsHerdStats;
   cxProgressBar.Top := 299;
   cxProgressBar.Properties.Min := 0;
   cxProgressBar.Properties.Max := 12;
   cxProgressBar.Position := 0;
   cxProgressBar.Visible := True;

   Update;

   try
      LTotCowsInHerd.Caption := IntToStr(CowsInHerd);
      LPercCowsInHerd.Caption := '100';
      StepProgress;

      LTotDry.Caption := IntToStr( CowsDry);
      LPercDry.Caption := FloatToStrF(((CowsDry / CowsInHerd) * 100),ffFixed, 8, 1);
      StepProgress;

      AnimalCount := (CowsInHerd - CowsDry);
      LTotInMilk.Caption := IntToStr(AnimalCount);
      LPercInMilk.Caption := FloatToStrF(((AnimalCount / CowsInHerd) * 100),ffFixed, 8, 1);
      StepProgress;

      LTotNotServ.Caption := IntToStr(CowsNotServed);
      LPercNotServ.Caption := FloatToStrF(((CowsNotServed / CowsInHerd) * 100),ffFixed, 8, 1);
      StepProgress;

      LTotServNotPd.Caption := IntToStr(CowsServedNotPD);
      LPercServNotPd.Caption := FloatToStrF(((CowsServedNotPD / CowsInHerd) * 100),ffFixed, 8, 1);
      StepProgress;

      LTotPdCon.Caption := IntToStr(CowsPDConfirmed);
      LPercPdCon.Caption := FloatToStrF(((CowsPDConfirmed / CowsInHerd) * 100),ffFixed, 8, 1);
      StepProgress;

      lTotNotPreg.Caption := IntToStr(CowsNotPregnant);
      lPerclNotPreg.Caption := FloatToStrF(((CowsNotPregnant / CowsInHerd) * 100),ffFixed, 8, 1);
      StepProgress;

      LTotBeefHeif.Caption := IntToStr(BeefHeifers);
      LPercBeefHeif.Caption := FloatToStrF(((BeefHeifers / HerdTotal) * 100),ffFixed, 8, 1);
      StepProgress;

      LTotDairyHeif.Caption := IntToStr(DairyHeifers);
      LPercDairyHeif.Caption := FloatToStrF(((DairyHeifers / HerdTotal) * 100),ffFixed, 8, 1);
      StepProgress;

      LTotBeefBull.Caption := IntToStr(BeefBulls);
      LPercBeefBull.Caption := FloatToStrF(((BeefBulls / HerdTotal) * 100),ffFixed, 8, 1);
      StepProgress;

      LTotDairyBull.Caption := IntToStr(DairyBulls);
      LPercDairyBull.Caption := FloatToStrF(((DairyBulls / HerdTotal) * 100),ffFixed, 8, 1);
      StepProgress;

      LTotSteers.Caption := IntToStr(Steers);
      LPercSteers.Caption := FloatToStrF(((Steers / HerdTotal) * 100),ffFixed, 8, 1);
      StepProgress;
   finally
      cxProgressBar.Position := 0;
      cxProgressBar.Visible := False;
      Update;
   end;
end;

procedure TfmHerdStatistics.ShowTheForm;
begin

end;

procedure TfmHerdStatistics.FormShow(Sender: TObject);
begin
   inherited;
   SetupScreen;
end;

procedure TfmHerdStatistics.HerdComboCloseUp(Sender: TObject);
begin
   SetupScreen;
end;

procedure TfmHerdStatistics.FormCreate(Sender: TObject);
begin
   inherited;
   FormShowing := False;

   HerdCombo.KeyValue := WinData.UserDefaultHerdID;

   if ( WinData.OwnerFile.Locate('ID', HerdCombo.KeyValue,[]) ) then
      if ( WinData.OwnerFileAutumnCalving.AsBoolean ) then
          FromBreedingDate.Date := IncMonth(Date, -12)
      else
          FromBreedingDate.Date := EnCodeDate(CurrentYear, 1, 1)
   else
      FromBreedingDate.Date := IncMonth(Date, -12);

   ToBreedingDate.Date := Date;
   dxBarControlContainerItem1.Control := gbHerdID;
   cbUseActiveFilter.Checked := WinData.ActiveFilter;
   if not cbUseActiveFilter.Checked then
      cbUseActiveFilter.Visible := False;

   lByInseminator.Visible := False;
   lInseminator1.Visible := False;
   lInseminatorRate1.Visible := False;
   lInseminator2.Visible := False;
   lInseminatorRate2.Visible := False;
   lInseminator3.Visible := False;
   lInseminatorRate3.Visible := False;
end;

procedure TfmHerdStatistics.Timer1Timer(Sender: TObject);
begin
   inherited;
   Timer1.Enabled := False;
   if ( PageControl.ActivePageIndex = tsHerdStats.PageIndex ) then
      DisplayHerdStatResults
   else if ( PageControl.ActivePageIndex = tsBreedingStats.PageIndex ) then
      DisplayBreedingHerdStatResults
   else if ( PageControl.ActivePageIndex = tsBeefHerdStats.PageIndex ) then
      DisplayBeefHerdStats
   else if ( PageControl.ActivePageIndex = tsCSHerdSummary.PageIndex ) then
      DisplayConditionScores
   else if ( PageControl.ActivePageIndex = tsA1A2Results.PageIndex ) then
      DisplayA1A2ResultStats;
end;

function TfmHerdStatistics.GetCowsDry: Integer;
begin
   if FCowsDry <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID  ');
               SQL.Add('FROM Animals A        ');
               SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)');
               SQl.Add(Mainsql                 );
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' ) ');
               SQL.Add('AND   (A.LactNo = E.AnimalLactNo)  ');
               SQL.Add('AND   (E.EventType = '+IntToStr(cDryOffEvent)+')  ');
               Open;

               FCowsDry := GenQuery.RecordCount;
               Result := FCowsDry;
           end;
      end
   else
      Result := FCowsDry;
end;

function TfmHerdStatistics.GetCowsInHerd: Integer;
begin
   if FCowsInHerd <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                 ');
               SQL.Add('FROM Animals A                       ');
               SQL.Add('WHERE (A.LactNo > 0)                 ');
               SQL.Add('AND (A.Sex = "Female")               ');
               SQL.Add('AND (A.AnimalDeleted =False)         ');
               SQL.Add('AND (A.Breeding = True)              ');
               SQL.Add('AND (A.InHerd=True)                  ');
               SQL.Add('AND (A.HerdId = '+HerdCombo.Value+' )');
               Open;

               FCowsInHerd := GenQuery.RecordCount;
               Result := FCowsInHerd;
           end;
      end
   else
      Result := FCowsInHerd;

end;

function TfmHerdStatistics.GetCowsInMilk: Integer;
begin

end;

function TfmHerdStatistics.GetCowsNotServed: Integer;
begin
   if FCowsNotServed <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;

               SQL.Add('SELECT DISTINCT A.ID ');
               SQL.Add('FROM Animals A       ');
               SQL.Add(Mainsql                );
               SQL.Add('AND (A.HerdID = '+HerdCombo.Value+' )  ');
               SQL.Add('AND (NOT A.ID IN (SELECT DISTINCT E.AnimalID ');
               SQL.Add('                  FROM Events E              ');
               SQL.Add('                  WHERE (A.ID=E.AnimalID)     ');
               SQL.Add('                  AND   (A.LactNo = E.AnimalLactNo)');
               SQL.Add('                  AND   (E.EventType = '+IntToStr(cServiceEvent)+')))');
               Open;

               FCowsNotServed := GenQuery.RecordCount;
               Result := FCowsNotServed;
            end;
      end
   else
      Result := FCowsNotServed;
end;

function TfmHerdStatistics.GetCowsServedNotPD: Integer;
begin
   if FCowsServedNotPD <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                     ');
               SQL.Add('FROM Animals A                           ');
               SQL.Add('WHERE (A.Sex = "Female")                 ');
               SQL.Add('AND   (A.Breeding = True)                ');
               SQL.Add('AND   (A.LactNo > 0)                     ');
               SQL.Add('AND   (A.InHerd=True)                    ');
               SQL.Add('AND   (A.AnimalDeleted=False)            ');
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )  ');
               SQL.Add('AND (A.ID IN (SELECT DISTINCT(E.AnimalID) FROM Events E   ');
               SQL.Add('              WHERE (A.ID=E.AnimalID)     ');
               SQL.Add('              AND   (A.LactNo=E.AnimalLactNo)   ');
               SQL.Add('              AND   (E.EventType = '+IntToStr(cServiceEvent)+'))    ');
               SQL.Add('              AND   NOT(A.ID IN (SELECT DISTINCT(E.AnimalID) FROM Events E  ');
               SQL.Add('                                 WHERE (A.ID=E.AnimalID)    ');
               SQL.Add('                                 AND   (A.LactNo=E.AnimalLactNo)  ');
               SQL.Add('                                 AND   (E.EventType = '+IntToStr(cPregDiagEvent)+'))))');
               ExecSQL;
               Open;

               FCowsServedNotPD := GenQuery.RecordCount;
               Result := FCowsServedNotPD;
            end;
      end
   else
      Result := FCowsServedNotPD;
end;


function TfmHerdStatistics.GetCowsPDConfirmed: Integer;
begin
   if FCowsPDConfirmed <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                         ');
               SQL.Add('FROM Animals A                               ');
               SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)      ');
               SQL.Add('LEFT JOIN PregnancyDiag P ON (E.ID=P.EventID)');
               SQL.Add('WHERE (A.LactNo > 0)');
               SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
               SQL.Add('AND (A.Sex = "Female")');
               SQL.Add('AND (A.Breeding = True)');
               SQL.Add('AND (A.InHerd=True)');
               SQL.Add('AND (A.AnimalDeleted=False)');
               SQL.Add('AND (A.HerdId = '+HerdCombo.Value+' )      ');
               SQL.Add('AND (P.PregnancyStatus=True)               ');
               Open;

               FCowsPDConfirmed := GenQuery.RecordCount;
               Result := FCowsPDConfirmed;
            end;
      end
   else
      Result := FCowsPDConfirmed;
end;

function TfmHerdStatistics.GetCowsNotPregnant: Integer;
begin
   if FCowsNotPregnant <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                         ');
               SQL.Add('FROM Animals A                               ');
               SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)      ');
               SQL.Add('LEFT JOIN PregnancyDiag P ON (E.ID=P.EventID)');
               SQL.Add('WHERE (A.LactNo > 0)');
               SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
               SQL.Add('AND (A.Sex = "Female")');
               SQL.Add('AND (A.Breeding = True)');
               SQL.Add('AND (A.InHerd=True)');
               SQL.Add('AND (A.AnimalDeleted=False)');
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )      ');
               SQL.Add('AND   (P.PregnancyStatus=False)               ');
               Open;

               FCowsNotPregnant := GenQuery.RecordCount;
               Result := FCowsNotPregnant;
            end;
      end
   else
      Result := FCowsNotPregnant;

end;

function TfmHerdStatistics.GetDairyHeifers: Integer;
begin
   if FDairyHeifers <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                       ');
               SQL.Add('FROM Animals A                             ');
               SQL.Add('WHERE (A.LactNo = 0)                       ');
               SQL.Add('AND   (A.Sex = "Female")                   ');
               SQL.Add('AND   (A.AnimalDeleted=False)              ');
               SQL.Add('AND   (A.Breeding = True)                  ');
               SQL.Add('AND   (A.InHerd=True)                      ');
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
               Open;

               FDairyHeifers := GenQuery.RecordCount;
               Result := FDairyHeifers;
            end;
      end
   else
      Result := FDairyHeifers;

end;

function TfmHerdStatistics.GetBeefHeifers: Integer;
begin
   if FBeefHeifers <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                       ');
               SQL.Add('FROM Animals A                             ');
               SQL.Add('WHERE (A.LactNo = 0)                       ');
               SQL.Add('AND   (A.Sex = "Female")                   ');
               SQL.Add('AND   (A.Breeding = False)                 '); //check with gerry
               SQL.Add('AND   (A.InHerd=True)                      ');
               SQL.Add('AND   (A.AnimalDeleted=False)              ');
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
               Open;

               FBeefHeifers := GenQuery.RecordCount;
               Result := FBeefHeifers;
            end;
      end
   else
      Result := FBeefHeifers;
end;

function TfmHerdStatistics.GetBeefBulls: Integer;
begin
   if FBeefBulls <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                       ');
               SQL.Add('FROM Animals A                             ');
               SQL.Add('WHERE (A.Sex = "Bull")                     ');
               SQL.Add('AND   (A.AnimalDeleted=False)              ');
               if HerdType <> htBeef then
                  { All bulls considered beef when herd type is beef }
                  SQL.Add('AND   (A.Breeding = False)                 ');

               SQL.Add('AND   (A.InHerd=True)                      ');
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
               Open;
               FBeefBulls := GenQuery.RecordCount;
               Result := FBeefBulls;
            end;
      end
   else
      Result := FBeefBulls;
end;

function TfmHerdStatistics.GetDairyBulls: Integer;
begin
   if FDairyBulls <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                       ');
               SQL.Add('FROM Animals A                             ');
               SQL.Add('WHERE (A.Sex = "Bull")                     ');
               SQL.Add('AND   (A.AnimalDeleted=False)              ');
               SQL.Add('AND   (A.Breeding = True)                  ');
               SQL.Add('AND   (A.InHerd=True)                      ');
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
               Open;

               FDairyBulls := GenQuery.RecordCount;
               Result := FDairyBulls;
            end;
      end
   else
      Result := FDairyBulls;
end;

function TfmHerdStatistics.GetSteers: Integer;
begin
   if FSteers <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                       ');
               SQL.Add('FROM Animals A                             ');
               SQL.Add('WHERE (A.Sex = "Steer")                    ');
               SQL.Add('AND   (A.AnimalDeleted=False)              ');
               SQL.Add('AND   (A.Breeding = False)                 ');
               SQL.Add('AND   (A.InHerd=True)                      ');
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
               Open;

               FSteers := GenQuery.RecordCount;
               Result := FSteers;
            end;
      end
   else
      Result := FSteers;
end;

function TfmHerdStatistics.GetHerdTotal: Integer;
begin
   if FHerdTotal <= 0 then
      begin
         with GenQuery do
            try
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                      ');
               SQL.Add('FROM Animals A                            ');
               SQL.Add('WHERE (A.InHerd=True)                     ');
               SQL.Add('AND (A.AnimalDeleted =False)              ');
               SQL.Add('AND (A.HerdID = ' + HerdCombo.Value + ' ) ');
               Open;

               FHerdTotal := GenQuery.RecordCount;
               Result := FHerdTotal;
            finally
               Close;
            end;
      end
   else
      Result := FHerdTotal;
end;

procedure TfmHerdStatistics.ProduceBeefPeriodAnalysis(AFromDate,
  AToDate: TDateTime);
var
   DateOfBirth, PurchDate, SalesDate : TDateTime;
   BeefHerdStatsRecord : TBeefHerdStatsRecord;
   n : Integer;
   a : double;
   AStart, AEnd : TDateTime;
   AgeCategoryRecord : TAgeCategoryRecord;
   Sex : String;
begin
  inherited;
  gbResults.Visible := False;
  FillChar( BeefHerdStatsRecord, SizeOf(TBeefHerdStatsRecord), 0);
  SQLFilter := TSQLFilter.Create;
  Screen.Cursor := crHourGlass;
  try
     SQLFilter.HerdID := WinData.UserDefaultHerdID;
     if cmboSex.Text <> 'All' then
        SQLFilter.GetAnimalsOnHerd(cmboSex.Text,deFromDate.Date, deToDate.Date)
     else
        SQLFilter.GetAnimalsOnHerd('',deFromDate.Date, deToDate.Date) ;

     with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;

           SQL.Add('Select * From '+SQLFilter.TableName );
           Open;

           First;
           cxProgressBar.Position := 0;
           cxProgressBar.Properties.Max := RecordCount;
           cxProgressBar.Visible := True;
           Update;

           while not eof do
              begin
                 PurchDate := WinData.EventDataHelper.GetFirstEventDate(FieldByName('AnimalID').AsInteger, CPurchaseEvent);
                 SalesDate := WinData.EventDataHelper.GetFirstEventDate(FieldByName('AnimalID').AsInteger, CSaleDeathEvent);

                 Inc( BeefHerdStatsRecord.AnimalsOnFarm );


                 if (PurchDate >0) and (PurchDate > deFromDate.Date) then
                    begin
                       AStart := PurchDate;
                    end
                 else
                    AStart := deFromDate.Date;

                 if (SalesDate >0) and (SalesDate < deToDate.Date) then
                    begin
                       AEnd := SalesDate
                    end
                 else
                    AEnd := deToDate.Date;


                 n := Trunc(AEnd+1 - AStart);

                 //DateOfBirth := FieldByName('BirthDate').AsDateTime;

                 // calculate the remaining values
                 {if ((PurchDate > 0) and (SalesDate = 0)) then
                    n := Trunc(Date - PurchDate)
                 else if ((PurchDate > 0) and (SalesDate > 0)) then
                    n := Trunc(SalesDate - PurchDate)
                 else if ((DateOfBirth > 0) and (SalesDate > 0)) then
                    n := Trunc(SalesDate - DateOfBirth)
                 else if (DateOfBirth > 0) then
                    n := Trunc(Date - DateOfBirth);}

                 Inc( BeefHerdStatsRecord.DaysOnFarm, n );
                 cxProgressBar.Position := cxProgressBar.Position+1;
                 Update;
                 Next;
              end;
             if (BeefHerdStatsRecord.AnimalsOnFarm > 0) and (BeefHerdStatsRecord.DaysOnFarm > 0) then
                BeefHerdStatsRecord.AvgDaysOnFarm := BeefHerdStatsRecord.DaysOnFarm / BeefHerdStatsRecord.AnimalsOnFarm;
        finally
           Free;
        end;
        teTotalAnimalDays.Text := IntToStr(BeefHerdStatsRecord.DaysOnFarm);
        teTotalAnimals.Text := IntToStr(BeefHerdStatsRecord.AnimalsOnFarm);
        teAvgDays.Text := FloatToStrF(BeefHerdStatsRecord.AvgDaysOnFarm, ffFixed, 8, 2);
        AgeCategoryRecord.AgeMthCategory := AgeNone;
        Sex := '';
        teAvgDLWG.Text := FloatToStrF(HerdLookup.AvgDailyLiveWeightGain( StrToInt(HerdCombo.Value), deFromDate.Date, deToDate.Date,AgeCategoryRecord,Sex ), ffFixed, 8, 2);
        gbResults.Visible := True;
        Update;
  finally
     SafeFreeAndNil(SQLFilter);
     cxProgressBar.Position := 0;
     cxProgressBar.Visible := False;
     Update;
     Screen.Cursor := crDefault;
  end;
end;

procedure TfmHerdStatistics.deFromDatePropertiesChange(Sender: TObject);
begin
  inherited;
  gbResults.Visible := False;
end;

procedure TfmHerdStatistics.btnViewResultsClick(Sender: TObject);
begin
  inherited;
  ProduceBeefPeriodAnalysis(deFromDate.Date, deToDate.Date);
end;

procedure TfmHerdStatistics.AssignBreedingCaptions;
begin
   with fmHerdStatsBreedingRep.Create(nil) do
      try
         lHerd2.Caption := HerdCombo.Text;
         qrlInseminator1.Enabled := lByInseminator.Enabled;
         qrlInseminatorRate1.Enabled := qrlInseminator1.Enabled;
         qrlInseminator2.Enabled := qrlInseminator1.Enabled;
         qrlInseminatorRate2.Enabled := qrlInseminator1.Enabled;
         qrlInseminator3.Enabled := qrlInseminator1.Enabled;
         qrlInseminatorRate3.Enabled := qrlInseminator1.Enabled;

         QRTotAllServ.Caption         := LTotAllServ.Caption;
         QRNoCowsServed.Caption       := lNoAnimalsServiced.Caption;
         QRTotFirstServ.Caption       := LTotFirstServ.Caption;
         QRTotSecondServ.Caption      := LTotSecondServ.Caption;
         QRTotThirdServ.Caption       := LTotThirdServ.Caption;
         QRTotFourthServ.Caption      := LTotFourthServ.Caption;
         QRAvgServed.Caption          := lAvgServe.Caption;
         QRTotAllCalvings.Caption     := LTotAllCalvings.Caption;
         QRTotStillBirth.Caption      := LTotStillBirth.Caption;
         QRTotAllCalves.Caption       := LTotAllCalves.Caption;
         QRTotSingleBirths.Caption    := LTotSingleBirths.Caption;
         QRTotTwinBirths.Caption      := LTotTwinBirths.Caption;
         QRTotLiveCalves.Caption      := LTotLiveCalves.Caption;
         QRTotDeadCalves.Caption      := LTotDeadCalves.Caption;
         QRTotHeiferCalves.Caption    := LTotHeiferCalves.Caption;
         QRTotBullCalves.Caption      := LTotBullCalves.Caption;
         QRPercAllServ.Caption        := LPercAllServ.Caption;
         QRPercFirstServ.Caption      := LPercFirstServ.Caption;
         QRPerSecondServ.Caption      := LPercSecondServ.Caption;
         QRPerThirdServ.Caption       := LPercThirdServ.Caption;
         QRPercFourthServ.Caption     := LPercFourthServ.Caption;
         QRPercAllCalvings.Caption    := lPercAllCalvings.Caption;
         QRPercStillBirth.Caption     := LPercStillBirth.Caption;
         QRPercSingleBirths.Caption   := lPercSingleBirths.Caption;
         QRPercTwinBirths.Caption     := lPercTwinBirths.Caption;
         QRPercAllCalves.Caption      := LPercAllCalves.Caption;
         QRPercLiveCalves.Caption     := LPercLiveCalves.Caption;
         QRPercDeadCalves.Caption     := LPercDeadCalves.Caption;
         QRPercHeiferCalves.Caption   := LPercHeiferCalves.Caption;
         QRPercBullCalves.Caption     := LPercBullCalves.Caption;
         QRPercNonReturnCows.Caption  := LPercNonReturnRateCows.Caption;
         QRPercNonReturnHeifs.Caption := LPercNonReturnRateHeifs.Caption;
         QRPercNonReturnAll.Caption   := LPercNonReturnRateAll.Caption;
         QRNonReturnBased.Caption := 'Based on '+seNonReturnDays.EditText+' day non return';
         qrlhHerdCalvingIndices.Enabled := gbCalvingIntervals.Visible;
         qrlCurrentCalvingIndex.Enabled := qrlhHerdCalvingIndices.Enabled;
         QRCurrentCalvingIndex.Enabled := qrlCurrentCalvingIndex.Enabled;
         qrlProjectedCalvingIndex.Enabled := qrlCurrentCalvingIndex.Enabled;
         QRProjectedCalvingIndex.Enabled := QRCurrentCalvingIndex.Enabled;
         if ( QRCurrentCalvingIndex.Enabled ) then
            QRCurrentCalvingIndex.Caption := lActCalfInterval.Caption;
         if ( QRProjectedCalvingIndex.Enabled ) then
            QRProjectedCalvingIndex.Caption := lProjCalfInterval.Caption;
         qrExtended.Preview;
      finally
         Free;
      end;
end;

procedure TfmHerdStatistics.ResetBreedingStats;
begin
   lTotAllCalvings.Caption    := '0';
   lTotStillBirth.Caption     := '0';
   lTotSingleBirths.Caption   := '0';
   lTotTwinBirths.Caption     := '0';
   LPercStillBirth.Caption    := '0';
   lPercSingleBirths.Caption  := '0';
   lPercTwinBirths.Caption    := '0';
   LTotAllCalves.Caption      := '0';
   LPercAllCalves.Caption     := '0';
   lTotLiveCalves.Caption     := '0';
   lTotDeadCalves.Caption     := '0';
   lTotHeiferCalves.Caption   := '0';
   lTotBullCalves.Caption     := '0';
   lPercLiveCalves.Caption    := '0';
   lPercDeadCalves.Caption    := '0';
   lPercHeiferCalves.Caption  := '0';
   lPercBullCalves.Caption    := '0';
   LTotAllServ.Caption        := '0';
   LTotFirstServ.Caption      := '0';
   LTotSecondServ.Caption     := '0';
   LTotThirdServ.Caption      := '0';
   LTotFourthServ.Caption     := '0';
   lPercAllCalvings.Caption   := '0';
   LPercAllServ.Caption       := '0';
   LPercFirstServ.Caption     := '0';
   LPercSecondServ.Caption    := '0';
   LPercThirdServ.Caption     := '0';
   LPercFourthServ.Caption    := '0';
   lAvgServe.Caption := '0';
   lProjCalfInterval.Caption    := '0';
   lActCalfInterval.Caption := '0';
   LPercNonReturnRateCows.Caption := '0';
   LPercNonReturnRateHeifs.Caption := '0';
   LPercNonReturnRateAll.Caption := '0';
   lByInseminator.Visible := False;
   lInseminator1.Visible := False;
   lInseminatorRate1.Visible := False;
   lInseminator2.Visible := False;
   lInseminatorRate2.Visible := False;
   lInseminator3.Visible := False;
   lInseminatorRate3.Visible := False;
end;

procedure TfmHerdStatistics.DoBreedingSQLs;
var
   i : Integer;
   HerdTotal,
   AnimalCount : Double;
   NoTwins : Integer;
   MyQuery,
   qSecond : TQuery;
   Bull  : Integer;
   Heifer  : Integer;
   Calvings : Double;
   TwinBirths : Integer;
   Calves   : Integer;
   DeadCalv : Integer;
   SingleBirths : Integer;
   StillBirth : Integer;
   CalvingNoLiveBirths : Integer;
   LastCalvDate : Integer;
   LactNo : Integer;
   LastLactNo : Integer;
   ServiceRecords : TServiceRecords;
   AnimalList : TList;
   TotSexedSemenServices : Integer;
   TotCowsServedWithSexSemen : Integer;
   NoLiveCalvesRunCount : Integer;
begin
   FBreedingSQLsComplete := False;

   if HerdCombo.Value = '0' then Exit;

   cxProgressBar.Parent := tsBreedingStats;
   cxProgressBar.Left := 10;
   cxProgressBar.Top := 392;
   cxProgressBar.Properties.Max := 33;
   cxProgressBar.Position := 0;
   cxProgressBar.Show;

   MyQuery := TQuery.Create(nil);
   MyQuery.DatabaseName := WinData.KingData.DatabaseName;

   qSecond := TQuery.Create(nil);
   qSecond.DatabaseName := WinData.KingData.DatabaseName;
   try
      FillChar(ServiceRecords, SizeOf(ServiceRecords), 0);
      with MyQuery do
         begin
            // Get Total Number Of Animals.
            Close;
            SQL.Clear;
            SQL.Add('SELECT DISTINCT Count(A.ID) CountAID      ');
            SQL.Add('FROM Animals A                            ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
               end
            else
               begin
                  SQL.Add('WHERE (A.InHerd=True)                     ');
                  SQL.Add('AND (A.AnimalDeleted =False)              ');
                  SQL.Add('AND (A.HerdID = ' + HerdCombo.Value + ' ) ');
               end;
            Prepare;
            Open;

            StepProgress;

            if MyQuery.FieldByName('CountAID').AsInteger > 0 then
               HerdTotal := StrToFloat(MyQuery.FieldByName('CountAID').AsString);

            // Get Total Number Of Calvings In Date Period.
            SQL.Clear;
            SQL.Add('SELECT Distinct E.ID                    ');
            SQL.Add('FROM   Events E                         ');
            SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE  (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');

            Prepare;
            Open;

            StepProgress;

            if RecordCount > 0 then
               begin
                  lTotAllCalvings.Caption := IntToStr(MyQuery.RecordCount);
                  lPercAllCalvings.Caption := '100';
                  Calvings := StrToFloat(lTotAllCalvings.Caption);
               end;

            SQL.Clear;
            SQL.Add('SELECT Count (E.ID)  EID                ');
            SQL.Add('FROM Calvings   C                       ');
            SQL.Add('LEFT JOIN Events E ON (C.EventID=E.ID)   ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1  is null))  ');
            SQL.Add('OR    ((C.ID2 > 0) And  (C.CalfDead2  is null))   ');
            SQL.Add('OR    ((C.ID3 > 0) And  (C.CalfDead3  is null))   ');
            SQL.Add('OR    ((C.ID4 > 0) And  (C.CalfDead4  is null)))  ');
            SQL.Add('AND NOT (((C.ID1 > 0)  AND     (C.CalfDead1 is Null ))  ');
            SQL.Add('AND   ((C.ID2 > 0)   AND     (C.CalfDead2 is Null ))  ');
            SQL.Add('OR    ((C.ID3 > 0)   AND     (C.CalfDead3 is Null ))  ');
            SQL.Add('OR    ((C.ID4 > 0)   AND     (C.CalfDead4 is Null ))) ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.Add('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;

            // Get Total Number Of Single Births.
            SingleBirths := MyQuery.FieldByName('EID').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count (E.ID)  EID               ');
            SQL.Add('FROM Calvings C                         ');
            SQL.Add('LEFT JOIN Events E ON (C.EventID=E.ID)  ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = False   ))  ');
            SQL.Add('OR    ((C.ID2 > 0) And  (C.CalfDead2 = False  ))   ');
            SQL.Add('OR    ((C.ID3 > 0) And  (C.CalfDead3 = False  ))   ');
            SQL.Add('OR    ((C.ID4 > 0) And  (C.CalfDead4 = False  )))  ');
            SQL.Add('AND NOT (((C.ID1 > 0)  AND     (C.CalfDead1 = False ))  ');
            SQL.Add('AND   ((C.ID2 > 0)   AND     (C.CalfDead2 = False ))  ');
            SQL.Add('OR    ((C.ID3 > 0)   AND     (C.CalfDead3 = False ))  ');
            SQL.Add('OR    ((C.ID4 > 0)   AND     (C.CalfDead4 = False ))) ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;

            SingleBirths := SingleBirths + MyQuery.FieldByName('EID').AsInteger;

            if SingleBirths > 0 then
               lTotSingleBirths.Caption := IntToStr(SingleBirths);

            try
              lPercSingleBirths.Caption := FloatToStrF((((SingleBirths) / Calvings)*100),ffFixed, 8, 1);
            except
            end;

            //   23/08/19 [V5.9 R0.1] /MK Bug Fix - Replaced single NoLiveCalves query with four seperate queries that count calvings where all calves are dead.
            //                                      Bug was calvings that had one live and one dead calf were being taken as dead calving but GL agreed that
            //                                      count is for "No Live Calves" in any of the calves of the calving event.
            // Get Total Number Of Calf Deaths.
            NoLiveCalvesRunCount := 1;
            while NoLiveCalvesRunCount <=4 do
               begin
                  SQL.Clear;
                  SQL.Add('SELECT  Count (E.ID) NoLiveCalves    ');
                  SQL.Add('FROM    Events E                        ');
                  SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
                  if cbUseActiveFilter.Checked then
                     SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
                  case NoLiveCalvesRunCount of
                     1 : begin
                            SQL.Add('WHERE ((C.ID1 > 0) And  (C.CalfDead1 = True))');
                            SQL.Add('AND   (C.ID2 = 0)');
                            SQL.Add('AND   (C.ID3 = 0)');
                            SQL.Add('AND   (C.ID4 = 0)');
                         end;
                     2 : begin
                            SQL.Add('WHERE ((C.ID1 > 0) And  (C.CalfDead1 = True))');
                            SQL.Add('AND   ((C.ID2 > 0) And  (C.CalfDead2 = True))');
                            SQL.Add('AND   (C.ID3 = 0)');
                            SQL.Add('AND   (C.ID4 = 0)');
                         end;
                     3 : begin
                            SQL.Add('WHERE ((C.ID1 > 0) And  (C.CalfDead1 = True))');
                            SQL.Add('AND   ((C.ID2 > 0) And  (C.CalfDead2 = True))');
                            SQL.Add('AND   ((C.ID3 > 0) And  (C.CalfDead3 = True))');
                            SQL.Add('AND   (C.ID4 = 0)');
                         end;
                     4 : begin
                            SQL.Add('WHERE ((C.ID1 > 0) And  (C.CalfDead1 = True))');
                            SQL.Add('AND   ((C.ID2 > 0) And  (C.CalfDead2 = True))');
                            SQL.Add('AND   ((C.ID3 > 0) And  (C.CalfDead3 = True))');
                            SQL.Add('AND   ((C.ID4 > 0) And  (C.CalfDead4 = True))');
                         end;
                  end;
                  SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
                  SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
                  SQL.Add('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
                  Prepare;
                  Open;

                  StepProgress;

                  CalvingNoLiveBirths := CalvingNoLiveBirths + MyQuery.FieldByName('NoLiveCalves').AsInteger;

                  Inc(NoLiveCalvesRunCount);
               end;

            LTotStillBirth.Caption := IntToStr( CalvingNoLiveBirths );
            try
               LPercStillBirth.Caption := FloatToStrF(((CalvingNoLiveBirths / Calvings)*100),ffFixed, 8, 1);
            except
            end;

            // Get Total Number Of Calf Deaths.
            SQL.Clear;
            SQL.Add('SELECT  Count (E.ID) DC              ');
            SQL.Add('FROM    Events E                        ');
            SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE   DeadCalves > 0                  ');
            SQL.Add('AND    ((C.ID1 <= 0)   ');
            SQL.Add('AND     (C.ID2 <= 0)   ');
            SQL.Add('AND     (C.ID3 <= 0)   ');
            SQL.Add('AND     (C.ID4 <= 0))   ');
            SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;

            StillBirth := MyQuery.FieldByName('DC').AsInteger;

            // Get Total Number Of Single Calf Deaths.
            SQL.Clear;
            SQL.Add('SELECT Count (C.EventId)  CD1          ');
            SQL.Add('FROM    Calvings C                      ');
            SQL.Add('LEFT JOIN  Events E  ON (C.EventID=E.ID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  ))  ');
            SQL.Add('AND    ((C.ID2 = 0) And  (C.CalfDead2 = False ))  ');
            SQL.Add('AND    ((C.ID3 = 0) And  (C.CalfDead3 = False ))  ');
            SQL.Add('AND    ((C.ID4 = 0) And  (C.CalfDead4 = False ))) ');
            SQL.Add('AND    (E.HerdId = '+HerdCombo.Value+' )');
            SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;

            StillBirth := StillBirth + MyQuery.FieldByName('CD1').AsInteger;

            // Get Total Number Of Twin Calf Deaths.
            SQL.Clear;
            SQL.Add('SELECT Count (C.EventId)  CD2           ');
            SQL.Add('FROM    Calvings C                      ');
            SQL.Add('LEFT JOIN  Events E  ON (C.EventID=E.ID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  ))  ');
            SQL.Add('AND    ((C.ID2 > 0) And  (C.CalfDead2 = True  ))  ');
            SQL.Add('AND    ((C.ID3 = 0) And  (C.CalfDead3 = False ))  ');
            SQL.Add('AND    ((C.ID4 = 0) And  (C.CalfDead4 = False ))) ');
            SQL.Add('AND    (E.HerdId = '+HerdCombo.Value+' )');
            SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            StillBirth := StillBirth + MyQuery.FieldByName('CD2').AsInteger;

            // Get Total Number Of Triplet Calf Deaths.
            SQL.Clear;
            SQL.Add('SELECT Count (C.EventId)  CD3           ');
            SQL.Add('FROM    Calvings C                      ');
            SQL.Add('LEFT JOIN  Events E  ON (C.EventID=E.ID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  ))  ');
            SQL.Add('AND    ((C.ID2 > 0) And  (C.CalfDead2 = True  ))   ');
            SQL.Add('AND    ((C.ID3 > 0) And  (C.CalfDead3 = True  ))   ');
            SQL.Add('AND    ((C.ID4 = 0) And  (C.CalfDead4 = False )))  ');
            SQL.Add('AND    (E.HerdId = '+HerdCombo.Value+' )');
            SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            StillBirth := StillBirth + MyQuery.FieldByName('CD3').AsInteger ;

            // Get Total Number Of Quad Calf Deaths.
            SQL.Clear;
            SQL.Add('SELECT Count (C.EventId)  CD4           ');
            SQL.Add('FROM    Calvings C                      ');
            SQL.Add('LEFT JOIN  Events E  ON (C.EventID=E.ID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  )) ');
            SQL.Add('AND    ((C.ID2 > 0) And  (C.CalfDead2 = True  )) ');
            SQL.Add('AND    ((C.ID3 > 0) And  (C.CalfDead3 = True  )) ');
            SQL.Add('AND    ((C.ID4 > 0) And  (C.CalfDead4 = True  )))');
            SQL.Add('AND    (E.HerdId = '+HerdCombo.Value+' )');
            SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;

            StillBirth := StillBirth + MyQuery.FieldByName('CD4').AsInteger ;
            if ( StillBirth > 0 ) then
               LTotDeadCalves.Caption := IntToStr(StillBirth);
            try
               LPercDeadCalves.Caption := FloatToStrF(((StrToFloat(LTotDeadCalves.Caption) / Calvings)*100),ffFixed, 8, 1);
            except

            end;

            // Get Total Number Of Twin Calves Born.
            SQL.Clear;
            SQL.Add('SELECT Count (E.ID) CID                 ');
            SQL.Add('FROM  Events E                          ');
            SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
            if ( cbUseActiveFilter.Checked ) then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1  is null)) ');
            SQL.Add('AND    ((C.ID2 > 0) And  (C.CalfDead2  is null)) ');
            SQL.Add('OR     ((C.ID3 > 0) And  (C.CalfDead3  is null)) ');
            SQL.Add('OR     ((C.ID4 > 0) And  (C.CalfDead4  is null)))');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            TwinBirths := MyQuery.FieldByName('CID').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count (E.ID) CID                 ');
            SQL.Add('FROM  Events E                          ');
            SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0)  AND     (C.CalfDead1 = False ))  ');
            SQL.Add('AND   ((C.ID2 > 0)   AND     (C.CalfDead2 = False ))  ');
            SQL.Add('OR    ((C.ID3 > 0)   AND     (C.CalfDead3 = False ))  ');
            SQL.Add('OR    ((C.ID4 > 0)   AND     (C.CalfDead4 = False ))) ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            TwinBirths := TwinBirths + MyQuery.FieldByName('CID').AsInteger;

            if TwinBirths > 0 then
               lTotTwinBirths.Caption := IntToStr(TwinBirths);
            try
               lPercTwinBirths.Caption := FloatToStrF(((StrToFloat(lTotTwinBirths.Caption) / Calvings)*100),ffFixed, 8, 1);
            except
            end;

            LPercAllCalves.Caption := '100';

            // Get Total Number Of Calves Born.
            SQL.Clear;
            SQL.Add('SELECT Count(C.ID1) CID1               ');
            SQL.Add('FROM Calvings C                        ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID1 > 0) AND   (C.CalfDead1 = False))  ');
            SQL.Add('OR ((C.ID1 > 0) AND   (C.CalfDead1 is Null)))  ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;


            StepProgress;
            Calves := MyQuery.FieldByName('CID1').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(C.ID2) CID2              ');
            SQL.Add('FROM Calvings C                       ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID2 > 0)   AND   (C.CalfDead2 = False)) ');
            SQL.Add('OR ((C.ID2 > 0) AND   (C.CalfDead2 is Null)))  ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Calves := Calves+MyQuery.FieldByName('CID2').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(C.ID3) CID3               ');
            SQL.Add('FROM Calvings C                        ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID3 > 0)  AND   (C.CalfDead3 = False)) ');
            SQL.Add('OR ((C.ID3 > 0) AND   (C.CalfDead3 is Null)))  ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Calves := Calves+MyQuery.FieldByName('CID3').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(C.ID4) CID4               ');
            SQL.Add('FROM Calvings C                        ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (((C.ID4 > 0)  AND   (C.CalfDead4 = False)) ');
            SQL.Add('OR ((C.ID4 > 0) AND   (C.CalfDead4 is Null)))  ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Calves := Calves+MyQuery.FieldByName('CID4').AsInteger;

            if Calves > 0 then
               LPercAllCalves.Caption := '100'
            else
               LPercAllCalves.Caption := '0';
            LTotLiveCalves.Caption := IntToStr(Calves);

            // Get Total Number Of Dead Calves.
            SQL.Clear;
            SQL.Add('SELECT Distinct Sum(C.DeadCalves) CID  ');
            SQL.Add('FROM Calvings C                        ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (C.DeadCalves > 0 )              ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;

            DeadCalv := MyQuery.FieldByName('CID').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(C.CalfDead1) CID1         ');
            SQL.Add('FROM Calvings C                        ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (C.CalfDead1 = True)             ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            DeadCalv := DeadCalv + MyQuery.FieldByName('CID1').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(C.CalfDead2) CID2         ');
            SQL.Add('FROM Calvings C                        ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (C.CalfDead2 = True)             ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            DeadCalv := DeadCalv +MyQuery.FieldByName('CID2').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(C.CalfDead3) CID3         ');
            SQL.Add('FROM Calvings C                        ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (C.CalfDead3 = True)            ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            DeadCalv := DeadCalv + MyQuery.FieldByName('CID3').AsInteger;


            SQL.Clear;
            SQL.Add('SELECT Count(C.CalfDead4) CID4        ');
            SQL.Add('FROM Calvings C                       ');
            SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE    (C.CalfDead4 = True)        ');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            DeadCalv := DeadCalv + MyQuery.FieldByName('CID4').AsInteger;


            LTotDeadCalves.Caption := IntToStr(DeadCalv);

            LTotAllCalves.Caption := IntToStr(Calves);


            LTotAllCalves.Caption := IntToStr(StrToInt(LTotLiveCalves.Caption) + StrToInt(LTotDeadCalves.Caption));

            try
            LPercLiveCalves.Caption := FloatToStrF((((StrToFloat(LTotLiveCalves.Caption)) / StrToInt(LTotAllCalves.Caption))*100),ffFixed, 8, 1);
            except
            end;

            try
            LPercDeadCalves.Caption := FloatToStrF((((StrToFloat(LTotDeadCalves.Caption)) / StrToInt(LTotAllCalves.Caption))*100),ffFixed, 8, 1);
            except
            end;

            // Get Total Number Of Female Calves Born.
            SQL.Clear;
            SQL.Add('SELECT Count(A.ID)  AID1                                    ');
            SQL.Add('FROM Animals A                                   ');
            SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID1            ');
            SQL.Add('                FROM Calvings C                  ');
            SQL.ADD('                WHERE ((C.CalfDead1 = False)     ');
            SQL.Add('                OR     (C.CalfDead1 IS    Null)) ');
            SQL.Add('      )         )                                ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('AND (A.ID IN (SELECT DISTINCT FA.AID            ');
                  SQL.Add('                FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('      )         )                                ');
               end;
            SQL.Add('AND   (A.Sex = "Female")                         ');
            SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
            SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Heifer := MyQuery.FieldByName('AID1').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(A.ID)  AID2                                       ');
            SQL.Add('FROM Animals A                                   ');
            SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID2            ');
            SQL.Add('                FROM Calvings C                  ');
            SQL.ADD('                WHERE ((C.CalfDead2 = False)     ');
            SQL.Add('                OR     (C.CalfDead2 IS    Null)) ');
            SQL.Add('      )         )                                ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('AND (A.ID IN (SELECT DISTINCT FA.AID            ');
                  SQL.Add('                FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('      )         )                                ');
               end;
            SQL.Add('AND   (A.Sex = "Female")                         ');
            SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
            SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Heifer :=Heifer + MyQuery.FieldByName('AID2').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(A.ID)  AID3                                     ');
            SQL.Add('FROM Animals A                                   ');
            SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID3            ');
            SQL.Add('                FROM Calvings C                  ');
            SQL.ADD('                WHERE ((C.CalfDead3 = False)     ');
            SQL.Add('                OR     (C.CalfDead3 IS    Null)) ');
            SQL.Add('      )         )                                ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('AND (A.ID IN (SELECT DISTINCT FA.AID            ');
                  SQL.Add('                FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('      )         )                                ');
               end;
            SQL.Add('AND   (A.Sex = "Female")                         ');
            SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
            SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Heifer :=Heifer + MyQuery.FieldByName('AID3').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(A.ID)  AID4                                      ');
            SQL.Add('FROM Animals A                                   ');
            SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID4            ');
            SQL.Add('                FROM Calvings C                  ');
            SQL.ADD('                WHERE ((C.CalfDead4 = False)     ');
            SQL.Add('                OR     (C.CalfDead4 IS    Null)) ');
            SQL.Add('      )         )                                ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('AND (A.ID IN (SELECT DISTINCT FA.AID            ');
                  SQL.Add('                FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('      )         )                                ');
               end;
            SQL.Add('AND   (A.Sex = "Female")                         ');
            SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
            SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Heifer :=Heifer + MyQuery.FieldByName('AID4').AsInteger;

            if Heifer > 0 then
               LTotHeiferCalves.Caption := IntToStr(Heifer);
            try
               LPercHeiferCalves.Caption := FloatToStrF((((StrToFloat(LTotHeiferCalves.Caption)) / StrToInt(LTotLiveCalves.Caption))*100),ffFixed, 8, 1);
            except
            end;

            // Get Total Number Of Male Calves Born.
            SQL.Clear;
            SQL.Add('SELECT Count(A.ID)  AID1                                    ');
            SQL.Add('FROM Animals A                                   ');
            SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID1            ');
            SQL.Add('                FROM Calvings C                  ');
            SQL.ADD('                WHERE ((C.CalfDead1 = False)     ');
            SQL.Add('                OR     (C.CalfDead1 IS    Null)) ');
            SQL.Add('      )         )                                ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('AND (A.ID IN (SELECT DISTINCT FA.AID            ');
                  SQL.Add('                FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('      )         )                                ');
               end;
            SQL.Add('AND   ((A.Sex = "Bull") OR    (A.Sex = "Steer")) ');
            SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
            SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Bull := MyQuery.FieldByName('AID1').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(A.ID) AID2                                     ');
            SQL.Add('FROM Animals A                                   ');
            SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID2            ');
            SQL.Add('                FROM Calvings C                  ');
            SQL.ADD('                WHERE ((C.CalfDead2 = False)     ');
            SQL.Add('                OR     (C.CalfDead2 IS    Null)) ');
            SQL.Add('      )         )                                ');
            SQL.Add('AND   ((A.Sex = "Bull") OR    (A.Sex = "Steer"))                         ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('AND (A.ID IN (SELECT DISTINCT FA.AID            ');
                  SQL.Add('                FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('      )         )                                ');
               end;
            SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
            SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Bull :=Bull + MyQuery.FieldByName('AID2').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(A.ID) AID3                                     ');
            SQL.Add('FROM Animals A                                   ');
            SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID3            ');
            SQL.Add('                FROM Calvings C                  ');
            SQL.ADD('                WHERE ((C.CalfDead3 = False)     ');
            SQL.Add('                OR     (C.CalfDead3 IS    Null)) ');
            SQL.Add('      )         )                                ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('AND (A.ID IN (SELECT DISTINCT FA.AID            ');
                  SQL.Add('                FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('      )         )                                ');
               end;
            SQL.Add('AND   ((A.Sex = "Bull") OR    (A.Sex = "Steer"))                         ');
            SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
            SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Bull :=Bull + MyQuery.FieldByName('AID3').AsInteger;

            SQL.Clear;
            SQL.Add('SELECT Count(A.ID) AID4                                     ');
            SQL.Add('FROM Animals A                                   ');
            SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID4            ');
            SQL.Add('                FROM Calvings C                  ');
            SQL.ADD('                WHERE ((C.CalfDead4 = False)     ');
            SQL.Add('                OR     (C.CalfDead4 IS    Null)) ');
            SQL.Add('      )         )                                ');
            if cbUseActiveFilter.Checked then
               begin
                  SQL.Add('AND (A.ID IN (SELECT DISTINCT FA.AID            ');
                  SQL.Add('                FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('      )         )                                ');
               end;
            SQL.Add('AND   ((A.Sex = "Bull") OR    (A.Sex = "Steer"))                         ');
            SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
            SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            Bull :=Bull + MyQuery.FieldByName('AID4').AsInteger;

            if Bull > 0 then
               LTotBullCalves.Caption := IntToStr(Bull);
            try
               LPercBullCalves.Caption := FloatToStrF((((StrToFloat(LTotBullCalves.Caption)) / StrToInt(LTotLiveCalves.Caption))*100),ffFixed, 8, 1);
            except
            end;

            // Get Total Number Of Animals Served.
            SQL.Clear;
            SQL.Add('SELECT DISTINCT(E.AnimalID) ');
            SQL.Add('FROM  Events E                                   ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (E.HerdId = '+HerdCombo.Value+' )        ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            SQL.ADD('ORDER BY E.AnimalID');
            Prepare;
            Open;

            StepProgress;
            lNoAnimalsServiced.Caption := IntToStr(MyQuery.RecordCount); // Number of animals serviced between that period

            // Get Average Number Of Cows Served.
            SQL.Clear;
            SQL.Add('SELECT Count(E.ID) CEID ');
            SQL.Add('FROM  Events E                                   ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE   (E.HerdId = '+HerdCombo.Value+' )        ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Prepare;
            Open;

            StepProgress;
            if MyQuery.FieldByName('CEID').AsInteger > 0 then
               begin
                  LTotAllServ.Caption := IntToStr(MyQuery.FieldByName('CEID').AsInteger);
                  ServiceRecords.AllServices := MyQuery.FieldByName('CEID').AsInteger;
                  try
                     lAvgServe.Caption := FloatToStrF(ServiceRecords.AllServices / (StrToInt(lNoAnimalsServiced.Caption)),ffFixed, 8, 1);
                  except
                  end;
               end;

            // Get Total Number Of Cows Once, Twice, Three or Four Times Served.
            SQL.Clear;
            SQL.Add('SELECT DISTINCT(E.AnimalID), E.AnimalLactNo');
            SQL.Add('FROM Events E                                    ');
            SQL.Add('LEFT JOIN Animals A ON (A.ID=E.AnimalID)         ');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (A.HerdId = '+HerdCombo.Value+' )          ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            SQL.ADD('GROUP BY E.AnimalID, E.AnimalLactNo    ');
            Prepare;
            Open;

            AnimalList := TList.Create;
            AnimalList.Clear;
            StepProgress;
            if MyQuery.RecordCount > 0 then
               begin
                  First;
                  While not MyQuery.EOF do
                     begin
                        qSecond.Close;
                        qSecond.SQL.Clear;
                        qSecond.SQL.Add('SELECT Count(E.ID) CEID        ');
                        qSecond.SQL.Add('FROM Events E                  ');
                        qSecond.SQL.Add('WHERE (E.AnimalID = :EAnimalID)');
                        qSecond.SQL.Add('AND   (E.AnimalLactNo = :LactNo)');
                        qSecond.SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
                        qSecond.SQL.Add('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
                        qSecond.ParamByName('EAnimalID').AsInteger := MyQuery.FieldByName('AnimalID').AsInteger;
                        qSecond.ParamByName('LactNo').AsInteger := MyQuery.FieldByName('AnimalLactNo').AsInteger;
                        qSecond.Prepare;
                        qSecond.Open;

                        //   02/07/13 [V5.1 R8.1] /MK Bug Fix - If animal found more than once with different lactations then only
                        //                                      check for the animal once as this will cause inconsitency between total cows served
                        //                                      and sum of ServiceRecords.Service1+2+3+$orMore.
                        if ( AnimalList.IndexOf(pointer(MyQuery.FieldByName('AnimalID').AsInteger)) = -1 ) then
                           begin
                              if qSecond.FieldByName('CEID').AsInteger = 1 then
                                 Inc(ServiceRecords.Service1)
                              else if qSecond.FieldByName('CEID').AsInteger = 2 then
                                 Inc(ServiceRecords.Service2)
                              else if qSecond.FieldByName('CEID').AsInteger = 3 then
                                 Inc(ServiceRecords.Service3)
                              else if qSecond.FieldByName('CEID').AsInteger >= 4 then
                                 begin
                                    Inc(ServiceRecords.Service4AndMore);
                                    Inc(ServiceRecords.Service4AndMoreNoOfServices, qSecond.FieldByName('CEID').AsInteger);
                                 end;
                              AnimalList.Add(pointer(MyQuery.FieldByName('AnimalID').AsInteger));
                           end;

                        MyQuery.Next;
                     end;
               end;

               if ServiceRecords.Service1 > 0 then
                  LPercAllServ.Caption       := '100';
               LTotFirstServ.Caption  := IntToStr(ServiceRecords.Service1);
               LTotSecondServ.Caption := IntToStr(ServiceRecords.Service2);
               LTotThirdServ.Caption  := IntToStr(ServiceRecords.Service3);
               LTotFourthServ.Caption := IntToStr(ServiceRecords.Service4AndMore);

            try
               LPercFirstServ.Caption  := FloatToStrF(((ServiceRecords.Service1 / StrToInt(lNoAnimalsServiced.Caption)) * 100),ffFixed, 8, 1);
            except
            end;
            try
               //LPercSecondServ.Caption := FloatToStrF(((ServiceRecords.Service2*2 / StrToInt(lNoAnimalsServiced.Caption)) * 100),ffFixed, 8, 1);
               LPercSecondServ.Caption := FloatToStrF(((ServiceRecords.Service2 / StrToInt(lNoAnimalsServiced.Caption)) * 100),ffFixed, 8, 1);
            except
            end;
            try
               //LPercThirdServ.Caption  := FloatToStrF(((ServiceRecords.Service3*3 / StrToInt(lNoAnimalsServiced.Caption)) * 100),ffFixed, 8, 1);
               LPercThirdServ.Caption  := FloatToStrF(((ServiceRecords.Service3 / StrToInt(lNoAnimalsServiced.Caption)) * 100),ffFixed, 8, 1);
            except
            end;
            try
               //LPercFourthServ.Caption := FloatToStrF(((ServiceRecords.Service4AndMore*ServiceRecords.Service4AndMoreNoOfServices / StrToInt(lNoAnimalsServiced.Caption)) * 100),ffFixed, 8, 1);
               LPercFourthServ.Caption := FloatToStrF(((ServiceRecords.Service4AndMore / StrToInt(lNoAnimalsServiced.Caption)) * 100),ffFixed, 8, 1);
            except
            end;

            //   27/08/15 [V5.4 R7.4] /MK Additional Feature - Added new Average Services Per Cow (Sexed Semen) - John Buckley.
            StepProgress;
            // Calculate total number of services with sexed semen within the period.
            TotSexedSemenServices := 0;
            SQL.Clear;
            SQL.Add('SELECT COUNT(DISTINCT(E.ID))');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN Services S ON (E.ID = S.EventID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (S.SexedSemen IS NOT NULL)');
            SQL.Add('AND   (S.SexedSemen > 0)');
            SQL.Add('AND   (S.SexedSemen <> '+IntToStr(HerdLookup.NotSexedSemenTypeID)+')');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' )          ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Open;
            if ( RecordCount > 0 ) then
               if ( Fields[0].AsInteger > 0 ) then
                   TotSexedSemenServices := Fields[0].AsInteger;

            // Calculate number of cows served with sexed semen within the period.
            TotCowsServedWithSexSemen := 0;
            SQL.Clear;
            SQL.Add('SELECT COUNT(DISTINCT(E.AnimalID))');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN Services S ON (E.ID = S.EventID)');
            if cbUseActiveFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
            SQL.Add('WHERE (S.SexedSemen IS NOT NULL)');
            SQL.Add('AND   (S.SexedSemen > 0)');
            SQL.Add('AND   (S.SexedSemen <> '+IntToStr(HerdLookup.NotSexedSemenTypeID)+')');
            SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' )          ');
            SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            Open;
            if ( RecordCount > 0 ) then
               if ( Fields[0].AsInteger > 0 ) then
                   TotCowsServedWithSexSemen := Fields[0].AsInteger;

            // Average sexed semen services per cow.
            lAveServeCowSexSemen.Caption := '0';
            if ( TotSexedSemenServices > 0 ) and ( TotCowsServedWithSexSemen > 0 ) then
               lAveServeCowSexSemen.Caption := FloatToStrF(TotSexedSemenServices/TotCowsServedWithSexSemen, ffFixed, 8, 1 );

            StepProgress;

            CalcNonReturnRates;
            //GetCalvingIndex;
            StepProgress;
         end;

         GetCalvingInterval;
   finally
     cxProgressBar.Position := 0;
     cxProgressBar.Hide;
     MyQuery.Close;
     MyQuery.Free;
     qSecond.Close;
     qSecond.Free;
     Screen.Cursor := crDefault;
     FBreedingSQLsComplete := True;
   end;
end;

procedure TfmHerdStatistics.GetCalvingInterval;
var
   ProjData : TProjectedCalvingData;
   Item : TProjectedItem;
begin
   try
      ProjData := TProjectedCalvingData.Create;
      ProjData.Load;
      lActCalfInterval.Caption := IntToStr(ProjData.MeanCalvingInterval);
      lProjCalfInterval.Caption := IntToStr(ProjData.MeanProjCalvingInterval);
   finally
      FreeAndNil(ProjData);
   end;
end;

procedure TfmHerdStatistics.actPrintExecute(Sender: TObject);
begin
   inherited;
   if ( PageControl.ActivePage = tsHerdStats ) then
      AssignHerdStatCaptions
   else if ( PageControl.ActivePage = tsBreedingStats ) then
      AssignBreedingCaptions
   else if ( PageControl.ActivePage = tsBeefHerdStats ) then
      AssignBeefStatCaptions
   else if ( PageControl.ActivePage = tsA1A2Results ) then
      begin
         if ( A1A2ResultGridTableView.DataController.RecordCount = 0 ) then
            begin
               MessageDlg('There is no data on the grid to print. Click Run to gather the data for the grid.',mtError,[mbOK],0);
               Exit;
            end;
         A1A2ResultGridPrinterLink.ReportTitle.Text := HerdCombo.Text+' A1A2 Results';
         A1A2ResultGridPrinterLink.Preview;
      end;
end;

procedure TfmHerdStatistics.PageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   inherited;
   if ( NewPage = tsHerdStats ) or ( NewPage = tsBeefHerdStats ) then
      cxProgressBar.Parent := NewPage;
   if ( NewPage = tsBreedingStats ) then
      Height := 562
   else
      Height := 474;
   if ( NewPage <> tsA1A2Results ) then
      Width := 562
   else
      Width := 676;
end;

procedure TfmHerdStatistics.DisplayBreedingHerdStatResults;
begin
   Screen.Cursor := crHourGlass;
   try
      ResetBreedingStats;
      DoBreedingSQLs;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmHerdStatistics.DisplayHerdStatResults;
begin
   Screen.Cursor := crHourGlass;
   try
      update;
      ResetHerdStats;
      DoHerdStatSQLs;
   finally
      Screen.Cursor := crDefault;
      update;
   end;
end;

procedure TfmHerdStatistics.DisplayOnHoldingStatResults;
begin

end;

procedure TfmHerdStatistics.StepProgress;
begin
   //   20/03/20 [V5.9 R2.9] /MK Bug Fix - Added try, except, end around StepProgress as sometimes "Invalid Floating Point" error appears.
   try
      cxProgressBar.Position := cxProgressBar.Position+1;
      Update;
   except
   end;
end;

procedure TfmHerdStatistics.FromBreedingDateChange(Sender: TObject);
begin
  inherited;
  if FormShowing then
     begin
        if (Sender As TDateEdit).Date > 0 then
           //Timer1.Enabled := True;
     end;
end;

procedure TfmHerdStatistics.FormActivate(Sender: TObject);
begin
  inherited;
  FormShowing := True;
end;

procedure TfmHerdStatistics.cmboSexPropertiesChange(Sender: TObject);
begin
  inherited;
  gbResults.Visible := False;
end;

procedure TfmHerdStatistics.tsBeefHerdStatsShow(Sender: TObject);
begin
  inherited;
  deFromDate.Date := IncMonth(Date, -1);
  deToDate.Date := Date;
  //Timer1.Enabled := True;
end;

function TfmHerdStatistics.GetBeefFemales: Integer;
begin
   if FBeefFemales <= 0 then
      begin
         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                       ');
               SQL.Add('FROM Animals A                             ');
               SQL.Add('WHERE (A.Sex = "Female")                   ');

               if HerdType <> htBeef then
                  { All bulls considered beef when herd type is beef }
                  SQL.Add('AND   (A.Breeding = False)                 '); //check with gerry
               SQL.Add('AND   (A.InHerd=True)                      ');
               SQL.Add('AND   (A.AnimalDeleted=False)              ');
               SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
               Open;

               FBeefFemales := GenQuery.RecordCount;
               Result := FBeefFemales;
            end;
      end
   else
      Result := FBeefFemales;
end;

procedure TfmHerdStatistics.DisplayBeefHerdStats;
var
   nAnimalCount : Integer;
   nHerdTotal : Integer;
   nTotalAnimals : Integer;
begin

   if HerdCombo.KeyValue <= 0 then Exit;
  FBeefFemales := -1;
  Screen.Cursor := crHourGlass;
  try

     cxProgressBar.Parent := tsHerdStats;
     cxProgressBar.Properties.Min := 0;
     cxProgressBar.Properties.Max := 3;
     cxProgressBar.Position := 0;
     cxProgressBar.Visible := True;
     Update;

     nHerdTotal := GetHerdTotal;

     if nHerdTotal > 0 then
        begin

           nAnimalCount := BeefFemales;
           Inc(nTotalAnimals, nAnimalCount);
           lBeefFemales.Caption := IntToStr(nAnimalCount);
           try
              lBeefFemalesPerc.Caption := FloatToStrF( ((nAnimalCount/ nHerdTotal) * 100), ffFixed, 8,2);
           except
           end;
           StepProgress;

           nAnimalCount := BeefBulls;
           Inc(nTotalAnimals, nAnimalCount);
           lBeefBulls.Caption := IntToStr(nAnimalCount);
           try
              lBeefBullsPerc.Caption := FloatToStrF( ((nAnimalCount/ nHerdTotal) * 100), ffFixed, 8,2);
           except
           end;
           StepProgress;

           nAnimalCount := Steers;
           Inc(nTotalAnimals, nAnimalCount);
           lBeefSteers.Caption := IntToStr(nAnimalCount);
           try
              lBeefSteersPerc.Caption := FloatToStrF( ((nAnimalCount/ nHerdTotal) * 100), ffFixed, 8,2);
           except
           end;
           StepProgress;

           lAllCattle.Caption := IntToStr(nTotalAnimals);
           try
              lAllCattlePerc.Caption := FloatToStrF( ((nTotalAnimals/ nHerdTotal) * 100), ffFixed, 8,2);
           except
           end;

        end;
  finally
     Screen.Cursor := crDefault;
     cxProgressBar.Position := 0;
     cxProgressBar.Visible := False;
     Update;
  end;

end;

procedure TfmHerdStatistics.SetupScreen;
begin
   inherited;
   gbCattle.Visible   := True;
   HerdType := HerdLookup.GetHerdType(HerdCombo.KeyValue);
   if HerdType = htDairy then
      begin
         tsHerdStats.TabVisible := True;
         tsBreedingStats.TabVisible := True;
         tsBeefHerdStats.TabVisible := False;
         tsCSHerdSummary.TabVisible := True;
         gbDairy.Visible := True;
         gbDairy.Left := 10;
         actPrint.Visible := True;
         gbCattle.Visible := True;
         gbCattle.Left := 274;
      end
   else if HerdType = htSuckler then
      begin
         tsHerdStats.TabVisible := True;
         tsBreedingStats.TabVisible := True;
         tsBeefHerdStats.TabVisible := False;
         tsCSHerdSummary.TabVisible := True;
         gbDairy.Visible := False;
         actPrint.Visible := True;

         gbCattle.Visible := True;
         gbCattle.Left := 10;
      end
   else if HerdType = htBeef then
      begin
         tsHerdStats.TabVisible := False;
         tsBreedingStats.TabVisible := False;
         tsBeefHerdStats.TabVisible := True;
         tsCSHerdSummary.TabVisible := False;
         actPrint.Visible := True;
      end;

   if not gbDairy.Visible then
      gbCattle.Left := gbDairy.Left;
   ResetHerdStats;
   //Timer1.Enabled := True;
end;

procedure TfmHerdStatistics.AssignBeefStatCaptions;
begin
   with fmHerdStatsBeefGenRep.Create(nil) do
      try
         lHerd3.Caption := HerdCombo.Text;
         lBeefHeiferNo.Caption := lBeefFemales.Caption;
         lBeefHeiferNoPerc.Caption := lBeefFemalesPerc.Caption;

         lBeefBullNo.Caption := lBeefBulls.Caption;
         lBeefBullNoPerc.Caption := lBeefBullsPerc.Caption;

         LSteerNo.Caption := lBeefSteers.Caption;
         LSteerNoPerc.Caption := lBeefSteersPerc.Caption;

         lAllBeefCalttleNos.Caption := lAllCattle.Caption;
         lAllBeefCalttleNoPerc.Caption := lAllCattlePerc.Caption;

         lFromDateValue.Caption := deFromDate.Text;
         lToDateValue.Caption := deToDate.Text;
         lSexValue.Caption :=  cmboSex.Text;

         lTotalAnimalDaysValue.Caption := teTotalAnimalDays.Text;
         lTotalAnimalsValue.Caption := teTotalAnimals.Text;
         lAverageDaysValue.Caption := teAvgDays.Text;
         lAverageDLWGValue.Caption := teAvgDLWG.Text;
         qrBeefStats.Preview;
      finally
         Free;
      end;
end;

procedure TfmHerdStatistics.DisplayConditionScores;
var
   AnimalId : Integer;
   Count1,
   Count2,
   Count3,
   Count4,
   Count5,
   Count6,
   Count7 ,
   TotalCount : Integer;

   FromDate : TDateTime;

   qCondScores : TQuery;
begin

   Screen.Cursor := crHourGlass;
   try
      AnimalId := 0;
      {
      //   02/02/12 [V5.0 R3.6] /MK Change - New Rules Added Including New Index.
      Count1 := 0;
      Count2 := 0;
      Count3 := 0;
      Count4 := 0;
      Count5 := 0;
      Count6 := 0; // not in valid range 0..5

      CSGridDBTableView.DataController.RecordCount := 0;
      CSGridDBTableView.DataController.RecordCount := 6;

      CSGridDBTableView.DataController.Values[0, 0] := '0 to 1';
      CSGridDBTableView.DataController.Values[1, 0] := '> 1 to 2';
      CSGridDBTableView.DataController.Values[2, 0] := '> 2 to 3';
      CSGridDBTableView.DataController.Values[3, 0] := '> 3 to 4';
      CSGridDBTableView.DataController.Values[4, 0] := '> 4 to 5';
      CSGridDBTableView.DataController.Values[5, 0] := 'Invalid';
      }

      Count1 := 0;
      Count2 := 0;
      Count3 := 0;
      Count4 := 0;
      Count5 := 0;
      Count6 := 0;
      Count7 := 0; // not in valid range 0..3.5

      CSGridDBTableView.DataController.RecordCount := 0;
      CSGridDBTableView.DataController.RecordCount := 7;

      CSGridDBTableView.DataController.Values[0, 0] := '0 to 2.5';
      CSGridDBTableView.DataController.Values[1, 0] := '> 2.5 to 2.75';
      CSGridDBTableView.DataController.Values[2, 0] := '> 2.75 to 3';
      CSGridDBTableView.DataController.Values[3, 0] := '> 3 to 3.25';
      CSGridDBTableView.DataController.Values[4, 0] := '> 3.25 to 3.5';
      CSGridDBTableView.DataController.Values[5, 0] := '> 3.5';
      CSGridDBTableView.DataController.Values[6, 0] := 'Invalid';

      FromDate := 0;
      if ( cmboCSPeriod.ItemIndex = 0 ) then
         begin
            FromDate := IncMonth(Date, -1);
         end
      else if ( cmboCSPeriod.ItemIndex = 1 ) then
         begin
            FromDate := IncMonth(Date, -3);
         end
      else if ( cmboCSPeriod.ItemIndex = 2 ) then
         begin
            FromDate := IncMonth(Date, -6);
         end
      else if ( cmboCSPeriod.ItemIndex = 3 ) then
         begin
            FromDate := IncMonth(Date, -12);
         end;

      qCondScores := TQuery.Create(nil);
      with qCondScores do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT E.AnimalId, E.EventDate, CS.Score');
            SQL.Add('FROM Events E');
            SQL.Add('INNER JOIN ConditionScore CS ON (E.Id = CS.EventId) ');
            SQL.Add('WHERE (E.EventType=:EType)');
            SQL.Add('AND (E.EventDate >=:EventDate)');
            SQL.Add('ORDER BY AnimalId, EventDate DESC ');
            Params[0].AsInteger := CCondScoreEvent;
            Params[1].AsDateTime := FromDate;

            Open;
            try
               First;

               while not eof do
                  begin
                     //   02/02/12 [V5.0 R3.6] /MK  ** NOTE ** - Only Count Most Recent Score For An Animal.
                     if ( Fields[0].AsInteger <> AnimalId ) then
                        begin
                           {
                           //   02/02/12 [V5.0 R3.6] /MK Change - Changed Indexes For New Rules.
                           if ( (Fields[2].AsFloat >= 0) and (Fields[2].AsFloat <= 1) ) then
                              Inc(Count1)
                           else if ( (Fields[2].AsFloat > 1) and (Fields[2].AsFloat <= 2) ) then
                              Inc(Count2)
                           else if ( (Fields[2].AsFloat > 2) and (Fields[2].AsFloat <= 3) ) then
                              Inc(Count3)
                           else if ( (Fields[2].AsFloat > 3) and (Fields[2].AsFloat <= 4) ) then
                              Inc(Count4)
                           else if ( (Fields[2].AsFloat > 4) and (Fields[2].AsFloat <= 5) ) then
                              Inc(Count5)
                           else
                              Inc(Count6);
                           }

                           if ( (Fields[2].AsFloat >= 0) and (Fields[2].AsFloat <= 2.5) ) then
                              Inc(Count1)
                           else if ( (Fields[2].AsFloat > 2.5) and (Fields[2].AsFloat <= 2.75) ) then
                              Inc(Count2)
                           else if ( (Fields[2].AsFloat > 2.75) and (Fields[2].AsFloat <= 3) ) then
                              Inc(Count3)
                           else if ( (Fields[2].AsFloat > 3) and (Fields[2].AsFloat <= 3.25) ) then
                              Inc(Count4)
                           else if ( (Fields[2].AsFloat > 3.25) and (Fields[2].AsFloat <= 3.75) ) then
                              Inc(Count5)
                           else if (Fields[2].AsFloat > 3.75) then
                              Inc(Count6)
                           else
                              Inc(Count7);

                           AnimalId := Fields[0].AsInteger;
                        end;
                     Next;
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;

      {
      CSGridDBTableView.DataController.Values[0, 1] := Count1;
      CSGridDBTableView.DataController.Values[1, 1] := Count2;
      CSGridDBTableView.DataController.Values[2, 1] := Count3;
      CSGridDBTableView.DataController.Values[3, 1] := Count4;
      CSGridDBTableView.DataController.Values[4, 1] := Count5;
      CSGridDBTableView.DataController.Values[5, 1] := Count6;

      TotalCount := Count1 + Count2 + Count3 + Count4 + Count5 + Count6;

      CSGridDBTableView.DataController.Values[0, 2] := MakePercentage(Count1, TotalCount);
      CSGridDBTableView.DataController.Values[1, 2] := MakePercentage(Count2, TotalCount);
      CSGridDBTableView.DataController.Values[2, 2] := MakePercentage(Count3, TotalCount);
      CSGridDBTableView.DataController.Values[3, 2] := MakePercentage(Count4, TotalCount);
      CSGridDBTableView.DataController.Values[4, 2] := MakePercentage(Count5, TotalCount);
      CSGridDBTableView.DataController.Values[5, 2] := MakePercentage(Count6, TotalCount);
      }

      CSGridDBTableView.DataController.Values[0, 1] := Count1;
      CSGridDBTableView.DataController.Values[1, 1] := Count2;
      CSGridDBTableView.DataController.Values[2, 1] := Count3;
      CSGridDBTableView.DataController.Values[3, 1] := Count4;
      CSGridDBTableView.DataController.Values[4, 1] := Count5;
      CSGridDBTableView.DataController.Values[5, 1] := Count6;
      CSGridDBTableView.DataController.Values[6, 1] := Count7;

      TotalCount := Count1 + Count2 + Count3 + Count4 + Count5 + Count6 + Count7;

      CSGridDBTableView.DataController.Values[0, 2] := MakePercentage(Count1, TotalCount);
      CSGridDBTableView.DataController.Values[1, 2] := MakePercentage(Count2, TotalCount);
      CSGridDBTableView.DataController.Values[2, 2] := MakePercentage(Count3, TotalCount);
      CSGridDBTableView.DataController.Values[3, 2] := MakePercentage(Count4, TotalCount);
      CSGridDBTableView.DataController.Values[4, 2] := MakePercentage(Count5, TotalCount);
      CSGridDBTableView.DataController.Values[5, 2] := MakePercentage(Count6, TotalCount);
      CSGridDBTableView.DataController.Values[6, 2] := MakePercentage(Count7, TotalCount);

      teCSTotalAnimals.Text := IntToStr(TotalCount);
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmHerdStatistics.tsCSHerdSummaryShow(Sender: TObject);
begin
  inherited;
   //Timer1.Enabled := True;
end;

procedure TfmHerdStatistics.cmboCSPeriodPropertiesChange(Sender: TObject);
begin
  inherited;
  DisplayConditionScores;
end;

class procedure TfmHerdStatistics.ShowForm(ADefaultView: TDefaultView);
begin
   with TfmHerdStatistics.Create(nil) do
      try
         FDefaultView := ADefaultView;
         FBreedPrdDays := 24;
         seNonReturnDays.Value := FBreedPrdDays;
         if ( FDefaultView = dvCSHerdSummary ) then
            PageControl.ActivePage := tsCSHerdSummary
         else if ( FDefaultView = dvBreedingStats ) then
            PageControl.ActivePage := tsBreedingStats
         else
            PageControl.ActivePage := tsHerdStats;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmHerdStatistics.cbUseActiveFilterPropertiesChange(
  Sender: TObject);
begin
  inherited;

  if cbUseActiveFilter.Checked then
     cbUseActiveFilter.Style.TextColor  := clBlue
  else
     cbUseActiveFilter.Style.TextColor := clBlack;

  if FormShowing then
     //Timer1.Enabled := True;
end;

procedure TfmHerdStatistics.seNonReturnDaysPropertiesChange(
  Sender: TObject);
begin
   inherited;
   seNonReturnDays.PostEditValue;
   FBreedPrdDays := seNonReturnDays.Value;
   if FormShowing then
      begin
         if FBreedPrdDays > 0 then
            begin
               cxProgressBar.Properties.Max := 33;
               cxProgressBar.Position := 0;
               CalcNonReturnRates;
               cxProgressBar.Position := 0;
            end;
      end;
end;

procedure TfmHerdStatistics.CalcNonReturnRates;
const
   cCows = 'COWS';
   cHeifers = 'HEIFERS';
   cAll = 'ALL';
var
   NoServedInLastBreedPrdDays,
   AllServedAftBreedPrd,
   CowsServedAftBreedPrd,
   HeifsServedAftBreedPrd,
   j,k,
   BreedPrdDays : Integer;
   LastPeriodDate : TDateTime;
   AnimalArray : TIntArray;
   qServiceTechniciansUsed,
   qNonReturns : TQuery;
   TempTechnicians : TTable;
   AnimalsString : WideString;

   procedure GetNumNonReturnRates (AUpdateType : String);
   var
      qAnimals : TQuery;
      i : Integer;
   begin
      qAnimals := TQuery.Create(nil);
      with qAnimals do
         try
            DatabaseName := 'Kingswd';
            SQL.Clear;
            //  Of Animals Found Get No Animals That Have Services Between ( ToDate-Non Return Days ) And ToDate.
            SQL.Add('SELECT Distinct(E.AnimalID) ServID');
            SQL.Add('FROM Events E');
            SQL.Add('WHERE (E.HerdId = '+HerdCombo.Value+' )        ');
            //   30/10/14 [V5.3 R8.8] /MK Change - Only look for service events, bulling events shouldn't matter here - GL request.
            //SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+' OR E.EventType = '+IntToStr(CBullingEvent)+')');
            SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
            //SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,LastPeriodDate+1) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,LastPeriodDate) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
            SQL.ADD('AND   (E.AnimalID IN '+AnimalsString+')');
            Prepare;
            Open;
            try
               First;
               Inc(NoServedInLastBreedPrdDays,RecordCount);

               // Only create Inseminator rates for all animals.
               if ( AUpdateType = cAll ) then
                  begin
                     SetLength(AnimalArray,0);

                     // Create array of AnimalID's found by qAnimals.
                     for i := 0 to qAnimals.RecordCount-1 do
                        begin
                           SetLength(AnimalArray, Length(AnimalArray)+1);
                           AnimalArray[Length(AnimalArray)-1] := qAnimals.FieldByName('ServID').AsInteger;
                           qAnimals.Next;
                        end;

                     AnimalsString := IntArrayToSQLInString(AnimalArray);

                     lByInseminator.Visible := False;
                     lInseminator1.Visible := False;
                     lInseminatorRate1.Visible := False;
                     lInseminator2.Visible := False;
                     lInseminatorRate2.Visible := False;
                     lInseminator3.Visible := False;
                     lInseminatorRate3.Visible := False;

                     if ( AnimalsString <> '()' ) and
                        ( (LPercNonReturnRateCows.Caption <> 'n/a') or (LPercNonReturnRateHeifs.Caption <> 'n/a') ) then
                        begin
                           qServiceTechniciansUsed := TQuery.Create(nil);
                           with qServiceTechniciansUsed do
                              try
                                 DatabaseName := AliasName;
                                 // Find technicians used in service events for qAnimals found.
                                 SQL.Add('SELECT Distinct(G.ID), G.Description');
                                 SQL.Add('FROM Genlook G');
                                 SQL.Add('WHERE (G.ListType = '+IntToStr(LObservedBy)+')');
                                 SQL.Add('AND   (G.ID IN (SELECT S.Technician');
                                 SQL.Add('		  FROM Services S');
                                 SQL.Add('		  WHERE S.EventID IN (SELECT E.ID');
                                 SQL.Add('				      FROM Events E');
                                 //   30/10/14 [V5.3 R8.8] /MK Change - Of the qAnimals found look for the technician(s) used in the service events within this period.
                                 SQL.Add('				      WHERE (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,LastPeriodDate) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToBreedingDate.Date) + '''' + ')');
                                 SQL.Add('				      AND   (E.AnimalID IN '+AnimalsString+'))))');
                                 Open;

                                 TempTechnicians := TTable.Create(nil);
                                 TempTechnicians.DatabaseName := AliasName;
                                 TempTechnicians.TableName := 'tmpTechnicans';
                                 TempTechnicians.FieldDefs.Clear;
                                 TempTechnicians.FieldDefs.Add('ID',ftAutoInc);
                                 TempTechnicians.FieldDefs.Add('Name',ftString,60);
                                 TempTechnicians.FieldDefs.Add('ServiceCount',ftInteger);
                                 TempTechnicians.CreateTable;
                                 TempTechnicians.Open;

                                 if ( qServiceTechniciansUsed.RecordCount > 0 ) then
                                    begin
                                       // Find qAnimals served by qServiceTechniciansUsedID.AsInteger.
                                       qAnimals.SQL.Add('AND (E.ID In (SELECT S.EventID FROM Services S');
                                       qAnimals.SQL.Add('              WHERE S.Technician = :TechnicanID))');

                                       while ( not(qServiceTechniciansUsed.Eof) ) do
                                          try
                                             qAnimals.Close;
                                             qAnimals.Params[0].AsInteger := qServiceTechniciansUsed.FieldByName('ID').AsInteger;
                                             qAnimals.Open;
                                             if ( qAnimals.RecordCount > 0 )then
                                                with TempTechnicians do
                                                   try
                                                      Append;
                                                      FieldByName('Name').AsString := qServiceTechniciansUsed.FieldByName('Description').AsString;
                                                      FieldByName('ServiceCount').AsInteger := qAnimals.RecordCount;
                                                      Post;
                                                   except
                                                      Cancel;
                                                   end;
                                             qServiceTechniciansUsed.Next;
                                          finally

                                          end;
                                    end;

                                 // Make percentage of animals found by technican Id by the total amount of
                                 // animals found to be served with non return days.
                                 if ( TempTechnicians.RecordCount > 0 ) then
                                    begin
                                       TempTechnicians.First;
                                       while ( not(TempTechnicians.Eof) ) do
                                          begin
                                           if ( TempTechnicians.FieldByName('ID').AsInteger = 1 ) then
                                                begin
                                                   lByInseminator.Visible := True;
                                                   lInseminator1.Visible := True;
                                                   lInseminator1.Caption := TempTechnicians.FieldByName('Name').AsString;
                                                   lInseminatorRate1.Visible := True;
                                                   lInseminatorRate1.Caption := FloatToStrF( MakePercentage(TempTechnicians.FieldByName('ServiceCount').AsInteger,NoServedInLastBreedPrdDays),
                                                                                                            ffFixed, 8, 1);
                                                end
                                             else if ( TempTechnicians.FieldByName('ID').AsInteger = 2 ) then
                                                begin
                                                   lInseminator2.Visible := True;
                                                   lInseminator2.Caption := TempTechnicians.FieldByName('Name').AsString;
                                                   lInseminatorRate2.Visible := True;
                                                   lInseminatorRate2.Caption := FloatToStrF( MakePercentage(TempTechnicians.FieldByName('ServiceCount').AsInteger,NoServedInLastBreedPrdDays),
                                                                                                            ffFixed, 8, 1);
                                                end
                                             else if ( TempTechnicians.FieldByName('ID').AsInteger = 3 ) then
                                                begin
                                                   lInseminator3.Visible := True;
                                                   lInseminator3.Caption := TempTechnicians.FieldByName('Name').AsString;
                                                   lInseminatorRate3.Visible := True;
                                                   lInseminatorRate3.Caption := FloatToStrF( MakePercentage(TempTechnicians.FieldByName('ServiceCount').AsInteger,NoServedInLastBreedPrdDays),
                                                                                                            ffFixed, 8, 1);
                                                end;
                                             TempTechnicians.Next;
                                          end;

                                    end;

                                 TempTechnicians.Close;
                                 TempTechnicians.DeleteTable;
                                 FreeAndNil(TempTechnicians);
                              finally
                                 qServiceTechniciansUsed.Close;
                                 FreeAndNil(qServiceTechniciansUsed);
                              end;
                        end;
                  end;

            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

   procedure UpdateRecords ( AUpdateType : String );
   var
      i : Integer;
   begin
      NoServedInLastBreedPrdDays := 0;
      SetLength(AnimalArray,0);
      qNonReturns.Close;
      qNonReturns.Filtered := False;
      qNonReturns.Filter := '';

      // Get Number Of Cows Served Between FromDate And ToDate Minus Non Return Days.
      if ( AUpdateType = cCows ) then
         begin
            qNonReturns.Filter := 'AnimalLactNo > 0';
            qNonReturns.Filtered := True;
         end
      // Get Number Of Heifers Served Between FromDate And ToDate Minus Non Return Days.
      else if ( AUpdateType = cHeifers ) then
         begin
            qNonReturns.Filter := 'AnimalLactNo = 0';
            qNonReturns.Filtered := True;
         end;
      // Else Get Number Of All Served Between FromDate And ToDate Minus Non Return Days.

      qNonReturns.Open;
      if ( qNonReturns.RecordCount > 0 ) then
         begin
            if ( AUpdateType = cCows ) then
               CowsServedAftBreedPrd := ( qNonReturns.RecordCount )
            else if ( AUpdateType = cHeifers ) then
               HeifsServedAftBreedPrd := ( qNonReturns.RecordCount )
            else if ( AUpdateType = cAll ) then
               AllServedAftBreedPrd := ( qNonReturns.RecordCount );

            qNonReturns.First;
            for i := 0 to qNonReturns.RecordCount-1 do
               begin
                  SetLength(AnimalArray, Length(AnimalArray)+1);
                  AnimalArray[Length(AnimalArray)-1] := qNonReturns.FieldByName('CEAID').AsInteger;
                  qNonReturns.Next;
               end;

            if ( Length(AnimalArray) > 0 ) then
               begin
                  AnimalsString := IntArrayToSQLInString(AnimalArray);
                  GetNumNonReturnRates(AUpdateType);
               end;
         end;

      try
         if ( AUpdateType = cCows ) then
            begin
               if ( (CowsServedAftBreedPrd > 0 ) and (NoServedInLastBreedPrdDays > 0) ) then
                  begin
                     if ( (CowsServedAftBreedPrd - NoServedInLastBreedPrdDays) > 0 ) then
                        LPercNonReturnRateCows.Caption := FloatToStrF( MakePercentage( (CowsServedAftBreedPrd - NoServedInLastBreedPrdDays),CowsServedAftBreedPrd),ffFixed, 8, 1)
                     else
                        LPercNonReturnRateCows.Caption := 'n/a';
                  end
               else
                  LPercNonReturnRateCows.Caption := 'n/a';
            end
         else if ( AUpdateType = cHeifers ) then
            begin
               if ( (HeifsServedAftBreedPrd > 0 ) and (NoServedInLastBreedPrdDays > 0) ) then
                  begin
                     if ( (HeifsServedAftBreedPrd - NoServedInLastBreedPrdDays) > 0 ) then
                        LPercNonReturnRateHeifs.Caption := FloatToStrF( MakePercentage( (HeifsServedAftBreedPrd - NoServedInLastBreedPrdDays),HeifsServedAftBreedPrd),ffFixed, 8, 1)
                     else
                        LPercNonReturnRateHeifs.Caption := 'n/a';
                  end
               //   30/10/14 [V5.3 R8.8] /MK Change - If percentage not available for heifers and cow percentage is n/a then heifers should also be n/a.
               else if ( LPercNonReturnRateCows.Caption = 'n/a' ) then
                  LPercNonReturnRateHeifs.Caption := 'n/a'
               //   30/10/14 [V5.3 R8.8] /MK Change - If percentage not available for heifers and cow percentage > 0 then heifers should be 0.
               else
                  LPercNonReturnRateHeifs.Caption := '0'
            end
         else if ( AUpdateType = cAll ) then
            begin
               if ( LPercNonReturnRateCows.Caption <> 'n/a' ) or ( LPercNonReturnRateHeifs.Caption <> 'n/a' ) then
                  begin
                    if ( (AllServedAftBreedPrd > 0) and (NoServedInLastBreedPrdDays > 0) ) then
                       if ( (AllServedAftBreedPrd - NoServedInLastBreedPrdDays) > 0 ) then
                          LPercNonReturnRateAll.Caption := FloatToStrF( MakePercentage( (AllServedAftBreedPrd - NoServedInLastBreedPrdDays),AllServedAftBreedPrd),ffFixed, 8, 1)
                       else
                          LPercNonReturnRateAll.Caption := 'n/a';
                  end
               else
                  LPercNonReturnRateAll.Caption := 'n/a';
            end;
      except
      end;
   end;

begin
   qNonReturns := TQuery.Create(nil);
   qNonReturns.DatabaseName := 'Kingswd';

   // Get Total Number Of Animals Served Between FromDate And (ToDate Minus Non Return Days).
   CowsServedAftBreedPrd := 0;
   HeifsServedAftBreedPrd := 0;
   AllServedAftBreedPrd := 0;
   LastPeriodDate := ( ToBreedingDate.Date - FBreedPrdDays );

   SetLength(AnimalArray,0);

   qNonReturns.SQL.Clear;
   qNonReturns.SQL.Add('SELECT Distinct(E.AnimalID) CEAID, E.AnimalLactNo ');
   qNonReturns.SQL.Add('FROM  Events E');
   if cbUseActiveFilter.Checked then
      qNonReturns.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (E.AnimalID=FA.AID)');
   qNonReturns.SQL.Add('WHERE (E.HerdId = '+HerdCombo.Value+' )        ');
   qNonReturns.SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
   qNonReturns.SQL.Add('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBreedingDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,LastPeriodDate) + '''' + ')');
   qNonReturns.Prepare;
   qNonReturns.Open;

   StepProgress;

   UpdateRecords(cCows);
   UpdateRecords(cHeifers);
   UpdateRecords(cAll);

   FreeAndNil(qNonReturns);
end;

procedure TfmHerdStatistics.btnBreedingSQLClick(Sender: TObject);
begin
   inherited;
   DisplayBreedingHerdStatResults;
end;

procedure TfmHerdStatistics.btnRunHerdStatisticsClick(Sender: TObject);
begin
   inherited;
   DisplayHerdStatResults;
end;

procedure TfmHerdStatistics.btnRunStatsClick(Sender: TObject);
begin
   inherited;
   Timer1.Enabled := True;
end;

procedure TfmHerdStatistics.DisplayA1A2ResultStats;
var
   tAnimals : TTable;
   qAnimals : TQuery;
   i, iAnimalCount, iRecordIndex : Integer;
   dA1Perc, dA1A2Perc, dA2Perc, dNoResultPerc : Double;
   sCategoryName : String;
   iSumAnimalCount, iSumA1A1Total, iSumA1A2Total, iSumA2A2Total, iSumBlanksTotal : Integer;
   fAvgA1A1Perc, fAvgA1A2Perc, fAvgA2A2Perc, fAvgBlanksPerc : Double;
type
   AnimalCategoryType = (atCows, atOneYearOld, atTwoYearOld, atBulls);
const
   A1A2FilterCategories : array [0..3] of string = ('Cows', 'Two Year Old', 'One Year Old', 'Bulls');
   ResultType : array [0..3] of String = ('A1/A1', 'A1/A2', 'A2/A2', 'Blanks');

   procedure ClearTempAnimalsTable;
   begin
      i := 0;
      iAnimalCount := 0;
      dA1Perc := 0;
      dA1A2Perc := 0;
      dA2Perc := 0;
      dNoResultPerc := 0;
      with TQuery.Create(nil) do
         try
            tAnimals.Close;
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('DELETE FROM '+tAnimals.TableName);
            ExecSQL;
         finally
            Free;
         end;
   end;

   procedure AddDataToGrid( ACategoryName : String;
                            const ACategoryTotal : Integer = 0;
                            const AA2A2Total : Integer = 0; const AA2A2Perc : Double = 0;
                            const AA1A2Total : Integer = 0; const AA1A2Perc : Double = 0;
                            const AA1A1Total : Integer = 0; const AA1A1Perc : Double = 0;
                            const ABlanksTotal : Integer = 0; const ABlanksPerc : Double = 0);
   begin
      if ( ACategoryName = 'One Year Old' ) then
         ACategoryName := IntToStr(ExtractYear(Now))+' Born (R1)'
      else if ( ACategoryName = 'Two Year Old' ) then
         ACategoryName := IntToStr(ExtractYear(IncYear(Now,-1)))+' Born (R2)';
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewCategory.Index] := ACategoryName;
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewCategoryTotal.Index] := ACategoryTotal;
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewA2A2Total.Index] := AA2A2Total;
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewA2A2Perc.Index] := FormatFloat('#.00',AA2A2Perc);
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewA1A2Total.Index] := AA1A2Total;
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewA1A2Perc.Index] := FormatFloat('#.00',AA1A2Perc);
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewA1A1Total.Index] := AA1A1Total;
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewA1A1Perc.Index] := FormatFloat('#.00',AA1A1Perc);
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewBlanksTotal.Index] := ABlanksTotal;
      A1A2ResultGridTableView.DataController.Values[iRecordIndex,A1A2ResultGridTableViewBlanksPerc.Index] := FormatFloat('#.00',ABlanksPerc);
   end;

   procedure GetAnimals (ACategory : AnimalCategoryType);
   begin
      if ( Length(sCategoryName) = 0 ) then Exit;
      ClearTempAnimalsTable;
      AddDataToGrid(sCategoryName,iRecordIndex);
      qAnimals.SQL.Clear;
      qAnimals.SQL.Add('INSERT INTO '+tAnimals.TableName+' (AnimalId)');
      qAnimals.SQL.Add('SELECT Id');
      qAnimals.SQL.Add('FROM Animals');
      qAnimals.SQL.Add('WHERE (InHerd = True)');
      qAnimals.SQL.Add('AND   (AnimalDeleted = False)');
      qAnimals.SQL.Add('AND   (HerdId IN (SELECT DefaultHerdId FROM Defaults))');
      if ( ACategory in [atCows, atOneYearOld, atTwoYearOld] ) then
         qAnimals.SQL.Add('AND   (UPPER(Sex) = "FEMALE")');
      if ( ACategory = atCows ) then
         qAnimals.SQL.Add('AND   (LactNo > 0)')
      else if ( ACategory = atOneYearOld ) then
         qAnimals.SQL.Add('AND   (DateOfBirth BETWEEN "01/01/'+IntToStr(ExtractYear(Now))+'" AND "12/31/'+IntToStr(ExtractYear(Now))+'")')
      else if ( ACategory = atTwoYearOld ) then
         qAnimals.SQL.Add('AND   (DateOfBirth BETWEEN "01/01/'+IntToStr(ExtractYear(IncYear(Now,-1)))+'" AND "12/31/'+IntToStr(ExtractYear(IncYear(Now,-1)))+'")')
      else if ( ACategory = atBulls ) then
         qAnimals.SQL.Add('AND   (UPPER(Sex) = "BULL")');
      qAnimals.ExecSQL;
      tAnimals.Close;
      tAnimals.Open;
      iAnimalCount := tAnimals.RecordCount;
      iSumAnimalCount := iSumAnimalCount + iAnimalCount;
      if ( iAnimalCount = 0 ) then Exit;
   end;

   procedure GetA1A2ResultsForAnimals;
   var
      i : Integer;
      sResultType : String;
      iA1A1Count, iA1A2Count, iA2A2Count, iBlanksCount : Integer;
      fA1A1Perc, fA1A2Perc, fA2A2Perc, fBlanksPerc : Double;
   begin
      try
         if ( iAnimalCount = 0 ) then Exit;
         iA1A1Count := 0;
         iA1A2Count := 0;
         iA2A2Count := 0;
         iBlanksCount := 0;
         fA1A1Perc := 0;
         fA1A2Perc := 0;
         fA2A2Perc := 0;
         fBlanksPerc := 0;
         for i := 0 to Length(ResultType)-1 do
            begin
               sResultType := ResultType[i];
               qAnimals.Close;
               qAnimals.SQL.Clear;
               if ( sResultType <> 'Blanks' ) then
                  begin
                     qAnimals.SQL.Add('SELECT Count(AnimalId)');
                     qAnimals.SQL.Add('FROM DNAResults');
                     qAnimals.SQL.Add('WHERE AnimalId IN (SELECT AnimalId FROM '+tAnimals.TableName+')');
                     qAnimals.SQL.Add('AND A1A2 = "'+sResultType+'"');
                  end
               else
                  begin
                     qAnimals.SQL.Add('SELECT Count(AnimalId)');
                     qAnimals.SQL.Add('FROM '+tAnimals.TableName);
                     qAnimals.SQL.Add('WHERE AnimalId NOT IN (SELECT AnimalId FROM DNAResults)');
                  end;
               qAnimals.Open;
               if ( sResultType = 'A2/A2' ) then
                  begin
                     iA2A2Count := qAnimals.Fields[0].AsInteger;
                     fA2A2Perc := MakePercentage(iA2A2Count,iAnimalCount);
                  end
               else if ( sResultType = 'A1/A2' ) then
                  begin
                     iA1A2Count := qAnimals.Fields[0].AsInteger;
                     fA1A2Perc := MakePercentage(iA1A2Count,iAnimalCount);
                  end
               else if ( sResultType = 'A1/A1' ) then
                  begin
                     iA1A1Count := qAnimals.Fields[0].AsInteger;
                     fA1A1Perc := MakePercentage(iA1A1Count,iAnimalCount);
                  end
               else if ( sResultType = 'Blanks' ) then
                  begin
                     iBlanksCount := qAnimals.Fields[0].AsInteger;
                     fBlanksPerc := MakePercentage(iBlanksCount,iAnimalCount);
                  end;
            end;
      finally
         AddDataToGrid(sCategoryName,iAnimalCount,iA2A2Count,fA2A2Perc,iA1A2Count,fA1A2Perc,iA1A1Count,fA1A1Perc,iBlanksCount,fBlanksPerc);
         iSumA1A1Total := iSumA1A1Total + iA1A1Count;
         iSumA1A2Total := iSumA1A2Total + iA1A2Count;
         iSumA2A2Total := iSumA2A2Total + iA2A2Count;
         iSumBlanksTotal := iSumBlanksTotal + iBlanksCount;
         fAvgA1A1Perc := fAvgA1A1Perc + fA1A1Perc;
         fAvgA1A2Perc := fAvgA1A2Perc + fA1A2Perc;
         fAvgA2A2Perc := fAvgA2A2Perc + fA2A2Perc;
         fAvgBlanksPerc := fAvgBlanksPerc + fBlanksPerc;
      end;
   end;

begin
   qAnimals := TQuery.Create(nil);
   tAnimals := TTable.Create(nil);

   try
      qAnimals.DatabaseName := AliasName;
      qAnimals.SQL.Clear;
      qAnimals.SQL.Add('SELECT *');
      qAnimals.SQL.Add('FROM DNAResults');
      try
         qAnimals.Open;
         if ( qAnimals.RecordCount = 0 ) then
            begin
               MessageDlg('No A1A2 Result data found in the database.'+cCRLF+
                          'You may need to import an A1A2 Results file.',mtInformation,[mbOK],0);
               Exit;
            end;

         tAnimals.DatabaseName := AliasName;
         tAnimals.TableName := 'tmpA1A2Animals';
         tAnimals.FieldDefs.Clear;
         tAnimals.FieldDefs.Add('Id',ftAutoInc);
         tAnimals.FieldDefs.Add('AnimalId',ftInteger);
         tAnimals.IndexDefs.Clear;
         tAnimals.IndexDefs.Add('iId','Id',[ixPrimary, ixUnique]);
         tAnimals.IndexDefs.Add('iAnimalID','AnimalID',[ixUnique, ixCaseInsensitive]);
         tAnimals.CreateTable;

         iSumA1A1Total := 0;
         iSumA1A2Total := 0;
         iSumA2A2Total := 0;
         iSumBlanksTotal := 0;
         iSumAnimalCount := 0;

         fAvgA1A1Perc := 0;
         fAvgA1A2Perc := 0;
         fAvgA2A2Perc := 0;
         fAvgBlanksPerc := 0;

         A1A2ResultGridTableView.DataController.RecordCount := Length(A1A2FilterCategories);
         for i := 0 to A1A2ResultGridTableView.DataController.RecordCount-1 do
            begin
               sCategoryName := A1A2FilterCategories[i];
               if ( sCategoryName = 'Cows' ) then
                  begin
                     iRecordIndex := 0;
                     GetAnimals(atCows);
                  end
               else if ( sCategoryName = 'Two Year Old' ) then
                  begin
                     iRecordIndex := 1;
                     GetAnimals(atTwoYearOld);
                  end
               else if (sCategoryName = 'One Year Old' ) then
                  begin
                     iRecordIndex := 2;
                     GetAnimals(atOneYearOld);
                  end
               else if ( sCategoryName = 'Bulls' ) then
                  begin
                     iRecordIndex := 3;
                     GetAnimals(atBulls);
                  end;
               GetA1A2ResultsForAnimals;
            end;

         fAvgA2A2Perc := MakePercentage(iSumA2A2Total,iSumAnimalCount);
         fAvgA1A2Perc := MakePercentage(iSumA1A2Total,iSumAnimalCount);
         fAvgA1A1Perc := MakePercentage(iSumA1A1Total,iSumAnimalCount);
         fAvgBlanksPerc := MakePercentage(iSumBlanksTotal,iSumAnimalCount);

         A1A2ResultGridTableView.DataController.RecordCount := A1A2ResultGridTableView.DataController.RecordCount+1;
         iRecordIndex := A1A2ResultGridTableView.DataController.RecordCount-1;
         AddDataToGrid('Overall',iSumAnimalCount,iSumA2A2Total,fAvgA2A2Perc,iSumA1A2Total,fAvgA1A2Perc,iSumA1A1Total,fAvgA1A1Perc,iSumBlanksTotal,fAvgBlanksPerc);
      except
         on e : Exception do
            begin
               ApplicationLog.LogError('Herd Stats - A1A2Result - '+e.Message);
               ApplicationLog.LogException(e);
            end;
      end;
   finally
      if ( qAnimals <> nil ) then
         FreeAndNil(qAnimals);
      if ( tAnimals <> nil ) then
         begin
            if ( tAnimals.Active ) then
               tAnimals.Close;
            if ( tAnimals.Exists ) then
               tAnimals.DeleteTable;
            FreeAndNil(tAnimals);
         end;
   end;
end;

end.
