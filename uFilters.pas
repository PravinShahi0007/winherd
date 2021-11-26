unit uFilters;

{ SP 24th - 27th September 2002

 1) Screen rearranged.
 2) New Filters Added:-

 Femlae Status: InMilk,
                Dry,
                Not Served,
                Served Not PD'd
                Served And PD'd.

 New Unit for Status SQL's "uSQLFilters.pas";

 SP 24th - 27th September 2002.  For Dev. 3.6 1.5


 SP 30/09/2002:-

 Modification to
 Female Status:

 Removed:- Served And PD'd

 Added:-   Pregant
           Not Pregant

           Events/Status caption change font to bold when clicked.
           If Radio button is clicked change font colour red, otherwise black.


 SP 30/09/2002. Dev V3.6 R1.5.
 ______________________________________________________________________________

 SP 06/11/2002:-

 New option to filter by breeds.
 Radio buttons to select between groups grid, or breeds grid.

 SP 06/11/2002.

 01/03/11 [V4.0 R8.5] /MK Change - Changed Caption of cbAI To Show AI Bulls In Use.

 07/10/11 [V5.0 R1.3] /MK Change - Changed Caption of rbPregnant From Pregnant To PD'd Pregnant

 07/10/11 [V5.0 R1.3] /MK Change - Changed Caption of rbNotPregnant From Not Pregnant To PD'd Not Pregnant

 24/11/11 [V5.0 R2.2] /MK Additional Feature - Added New ConditionScore Filters.

 02/12/11 [V5.0 R2.4] /MK Change - cbSales.Enabled := WinData.ShowAllAnimals.

 08/12/11 [V5.0 R2.6] /MK Bug Fix - Fixed Bug Where Event Date Range Not Showing After Filter Screen Closed And Reopend
                                    And Event Date Range Filter Exists.

 26/03/12 [V5.0 R4.5] /MK Change - New Option For Not In Group Within Group Grid.

 23/04/12 [V5.0 R5.2] /MK Change - cbSales.Enabled.

 10/07/12 [V5.0 R7.7] /MK Change - Removed MemDataSet for Groups to fix problem for some people with not being able to filter groups.
                                 - Added GridFilter type for NotInGroup and added checkbox for NotInGroup in gbFilterBy.
                                 - On rbBreedsClick, if rbNotInGroup.Checked then WinData.FFilterByNotInGroup.

 11/07/12 [V5.0 R7.8] /MK Change - Removed AI Bulls Only, Non Herd Animals, In Milk and Dry Cow options as MenuUnit.AnimalSelect covers these options already.

 13/07/12 [V5.0 R7.8] /MK Change - Greyed Out Buttons Depending On If MenuForm.FQuickFilter <> qfNone.

 26/07/12 [V5.0 R8.1] /MK Bug Fix - ApplyFilter - Events - No need For AnimalID = ID as Left Join in MenuUnit covers this.

 30/07/12 [V5.0 R8.2] /MK Additional Feature - New EBI Range filter added.

 14/08/12 [V5.0 R8.5] /MK Additional Feature - New Procedure EnableDiableBeefOptions to disable features if Beef herd type.
                                             - CheckForEventDates - Changes made of Herd Type is Beef.

 16/08/12 [V5.0 R8.5] /MK Change - FormCreate/cmboNoOfMonths - GL asked for items to be changed to 100 instead of 48.

 05/10/12 [V5.1 R0.2] /MK Bug Fix - Fix for if FromLactNo = 0 and ToLactNo = 0 No filter is being applied.

 16/10/12 [V5.1 R0.4] /MK Bug Fix - Set whether StockDate is enabled or not on Form Activate.

 20/12/12 [V5.1 R3.6] /MK Additional Feature - Added gbMilkYield & added MilkYield fields to FilterTable..

 21/12/12 [V5.1 R3.6] /MK Additional Feature - Only show new Milk Yield filter if Milk Rec module.

 04/01/13 [V5.1 R3.6] /MK Change - Change gbMilkYield Caption to Last Test Yield to match change to HerdLookup SQL.

 22/01/13 [V5.1 R3.9] /MK Additional Feature - Added Filter by RationCalc 7 Day Milk Average - TGM.

 06/06/13 [V5.1 R7.3] /MK Additional Feature - Allow Date of Birth filter if Home-Bred Animals is ticked.

 01/07/13 [V5.1 R7.5] /MK Additional Feature - Added new status for service count.
                                             - If service count status checked then allow filter by event date.
                                             - Only show service count spinedit if service count filter is checked.

 10/09/13 [V5.2 R1.1] /MK Additional Feature - Allowed Calving and/or Calving Date filter to be added to Status filter.

 02/01/14 [V5.2 R7.3] /MK Change - Show Filter By GroupBox for Herd Admin customers.
                                 - Increase height of gbSex and gbOtherEvents to make it look better for beef herds.

 19/05/14 [V5.3 R1.4] /MK Additional Feature - Added age between filter.

 21/05/14 [V5.3 R1.4] /MK Additional Feature - Do not show MonthFrom if no age filter selected - GL Request.
                                             - Only show MonthTo if rgMonthFilter is Between - GL Request.

 15/09/14 [V5.3 R6.2] /MK Change - ClearEventsStatus - Do no clear groups as filter can be added on top of selected group.

 25/11/14 [V5.4 R0.0] /MK Additional Feature - Added Vaccination Filter.

 02/12/14 [V5.4 R0.2] /MK Additional Feature - Added filter by Days On Farm for Beef herds only - GL/Rodney Wilton request.
                                             - Do not allow Days On Farm filter if All Animals or Sales filter selected.

 28/06/17 [V5.6 R8.9] /MK Change - Moved the Current/All Lactation filter out of the normal event list so that it can
                                   be used in conjunction with the "Show Female Animals With Events" list - GL/Kieran Savavge request.
                          Bug Fix - If the user has an event filter on, applies the filter and comes back into the Filter screen,
                                    the event date range does not show unless the user unticks/ticks the required event filter again - GL reported.

 12/01/18 [V5.7 R7.4] /MK Additional Feature - If HerdType is Suckler then show Milk Yield radio group but change it to Overall Weight Gain.

 15/01/18 [V5.7 R7.4] /MK Change - FormActivate - Only show radio buttons if both radio buttons are visible - GL/SP.
                                                - If neither radio button is showing then change gbMilk Yield caption to Last Milk Yield - GL/SP.

 16/01/18 [V5.7 R7.4] /MK Additional Feature - Created new radio group for Overall Gain Per Day filter.
                                             - Only show for Suckler herds for now - GL request.

 05/11/18 [V5.8 R4.4] /MK Bug Fix - bApplyFilterClick - Use StockDate.Date instead Date for Age and Days on Farm filters - Kepak.

 26/02/19 [V5.8 R8.0] /MK Bug Fix - FormActivate - Default Bull and Steer enabled to whether a breeding event filter is on - GL/Charles Crosse.

 23/08/19 [V5.9 R0.1] /MK Change - Tighten up the Filter By Group/Breed area so that it doesn't go across whole bottom of the screen - GL request.
                          Additional Feature - Added filter by Total SCC.
                          Bug Fix - Tab Order was all over the place.

 17/10/19 [V5.9 R1.0] /MK Change - Changed gbSCCFilter caption to Average SCC as that is what the ICBF are passing down not the total - GL/SP request.

 27/11/19 [V5.9 R1.3] /MK Change - Only show breeds that are in use - TOK/GL request.
                                 - Clear the filter on the WinData.Breeds table when the Filter screen closes.

 02/03/21 [V5.9 R9.1] /MK Additional Feature - I added a filter for A1A2 results because the cxGrid filter wasn't working - Padraic Harnan.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, checklst, Buttons, ExtCtrls, ComCtrls, ToolWin, RXCtrls, Db,
  DBTables, Mask, ToolEdit, RXSpin, RXDBCtrl, DBCtrls, Menus, Grids,
  DBGrids, DBCtrlsEh, DBGridEh, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxDBEdit, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxGroupBox, cxRadioGroup, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxStyles, cxCustomData, KDBRoutines, dxmdaset, cxUtils, GenTypesConst,
  cxCurrencyEdit, uHerdLookup, uWinOS, cxSpinEdit, uApplicationLog,
  KRoutines;

type
  TGridFilter = (gfBreeds, gfGroups, gfNotInGroup, gfNone);
  TFemaleStatus = (fsInMilk, fsDry, fsNotServed, fsServedNotPDd, fsPregnant, fsNotPregnant, fsServedCount, fsNone); // SP 25/09/2002
  TGridSource = (gsGroups, gsBreeds);
  TfFilters = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbClose: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    dsFilters: TDataSource;
    FilterTable: TTable;
    ErrorMsg: TStatusBar;
    DispErrTimer: TTimer;
    Panel1: TPanel;
    FilterTableID: TAutoIncField;
    FilterTableHerdID: TIntegerField;
    FilterTableSex1: TBooleanField;
    FilterTableSex2: TBooleanField;
    FilterTableSex3: TBooleanField;
    FilterTableDOBFrom: TDateField;
    FilterTableDOBTo: TDateField;
    FilterTableLactFrom: TIntegerField;
    FilterTableLactTo: TIntegerField;
    FilterTableHeats: TBooleanField;
    FilterTableServices: TBooleanField;
    FilterTablePD: TBooleanField;
    FilterTableDryingOff: TBooleanField;
    FilterTableCalving: TBooleanField;
    FilterTableHealth: TBooleanField;
    FilterTableSales: TBooleanField;
    FilterTablePurchases: TBooleanField;
    FilterTableWeighing: TBooleanField;
    FilterTableEventDateFrom: TDateField;
    FilterTableEventDateTo: TDateField;
    gbOther: TGroupBox;
    sbExit: TRxSpeedButton;
    pStock: TPanel;
    FilterTableAIBull: TBooleanField;
    FilterTableRetag: TBooleanField;
    FilterTableLeftHerd: TBooleanField;
    FilterTableBreeding: TBooleanField;
    FilterTableNonBreeding: TBooleanField;
    FilterTableAncestors: TBooleanField;
    cbBreeding: TcxDBCheckBox;
    cbNonBreeding: TcxDBCheckBox;
    cbDairy: TcxDBCheckBox;
    cbBeef: TcxDBCheckBox;
    FilterTableDairy: TBooleanField;
    FilterTableBeef: TBooleanField;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    gbSex: TGroupBox;
    cbFemale: TcxDBCheckBox;
    cbBull: TcxDBCheckBox;
    cbSteer: TcxDBCheckBox;
    rgStatus: TGroupBox;
    cbRT: TcxDBCheckBox;
    cbNoneHerd: TcxDBCheckBox;
    FilterTableNoneHerd: TBooleanField;
    qFilterByBreed: TQuery;
    ShowStock: TcxDBCheckBox;
    StockDate: TDBDateEdit;
    FilterTableStayOnTop: TBooleanField;
    FilterTableStockDate: TDateField;
    FilterTableShowStock: TBooleanField;
    Splitter1: TSplitter;
    cbAnimalsBorn: TcxDBCheckBox;
    FilterTableBornIntoHerd: TBooleanField;
    FilterTableIncAllLactations: TBooleanField;
    FilterTableToBeCulled: TBooleanField;
    FilterTableNoOfMonths: TStringField;
    FilterTableAgeMonthsSelected: TIntegerField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleSelected: TcxStyle;
    cxStyleNormal: TcxStyle;
    FilterTableCondScoreFrom: TFloatField;
    FilterTableCondScoreTo: TFloatField;
    FilterTableCondScoreFilter: TBooleanField;
    FilterTableEBIFrom: TFloatField;
    FilterTableEBITo: TFloatField;
    FilterTableEBIFilter: TBooleanField;
    FilterTableMilkYieldFrom: TFloatField;
    FilterTableMilkYieldTo: TFloatField;
    FilterTableMilkYieldFilter: TBooleanField;
    Panel2: TPanel;
    gbBreedingEvents: TGroupBox;
    Bevel1: TBevel;
    pFemStatus: TPanel;
    rbNotServed: TRadioButton;
    rbPregnant: TRadioButton;
    rbNotPregnant: TRadioButton;
    rbServedNotPD: TRadioButton;
    pEventType: TPanel;
    cbHeat: TcxDBCheckBox;
    cbServices: TcxDBCheckBox;
    cbPD: TcxDBCheckBox;
    cbDryOff: TcxDBCheckBox;
    cbCalving: TcxDBCheckBox;
    rbEvents: TRadioButton;
    rbStatus: TRadioButton;
    gbLact: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    sbLactFrom: TRxSpinButton;
    sbLactTo: TRxSpinButton;
    LactFrom: TDBEdit;
    LactTo: TDBEdit;
    gbConditionScore: TGroupBox;
    lCondScoreFrom: TLabel;
    LCondScoreTo: TLabel;
    sbCondScoreFrom: TRxSpinButton;
    sbCondScoreTo: TRxSpinButton;
    CondScoreFrom: TDBEdit;
    CondScoreTo: TDBEdit;
    gbEBI: TGroupBox;
    lEBIFrom: TLabel;
    lEBITo: TLabel;
    sbEBIFrom: TRxSpinButton;
    sbEBITo: TRxSpinButton;
    EBIFrom: TcxDBCurrencyEdit;
    EBITo: TcxDBCurrencyEdit;
    gbOtherEvents: TGroupBox;
    cbHealth: TcxDBCheckBox;
    cbSales: TcxDBCheckBox;
    cbPurchases: TcxDBCheckBox;
    cbWeighing: TcxDBCheckBox;
    cbToBeCulled: TcxDBCheckBox;
    rbLastTestYield: TRadioButton;
    rbRatCalcAvgDailyYield: TRadioButton;
    FilterTableRatCalcMilkYieldFilter: TBooleanField;
    rbServedCount: TRadioButton;
    FilterTableServedCount: TIntegerField;
    dbseServedCount: TcxDBSpinEdit;
    FilterTableNoOfMonthsTo: TStringField;
    gbMilkYield: TGroupBox;
    lMilkYieldFrom: TLabel;
    lMilkYieldTo: TLabel;
    sbMilkYieldFrom: TRxSpinButton;
    sbMilkYieldTo: TRxSpinButton;
    MilkYieldFrom: TcxDBCurrencyEdit;
    MilkYieldTo: TcxDBCurrencyEdit;
    cbVaccination: TcxDBCheckBox;
    FilterTableVaccination: TBooleanField;
    gbDaysOnFarm: TcxGroupBox;
    rgDaysOnFarm: TcxRadioGroup;
    lDaysOnFarmFrom: TcxLabel;
    dbceDaysOnFarmFrom: TcxDBCurrencyEdit;
    lDaysOnFarmTo: TcxLabel;
    dbceDaysOnFarmTo: TcxDBCurrencyEdit;
    FilterTableDaysOnFarmFrom: TIntegerField;
    FilterTableDaysOnFarmTo: TIntegerField;
    FilterTableDaysOnFarmFilterSelected: TIntegerField;
    sbDaysOnFarmTo: TRxSpinButton;
    sbDaysOnFarmFrom: TRxSpinButton;
    gbEventLactations: TGroupBox;
    rbCurrLacts: TcxRadioButton;
    rbAllLacts: TcxRadioButton;
    FilterTableOverallGainPerDayFrom: TFloatField;
    FilterTableOverallGainPerDayTo: TFloatField;
    FilterTableOverallGainPerDayFilter: TBooleanField;
    gbOverallGainPerDay: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    sbOverallGainFrom: TRxSpinButton;
    sbOverallGainTo: TRxSpinButton;
    OverallGainPerDayFrom: TcxDBCurrencyEdit;
    OverallGainPerDayTo: TcxDBCurrencyEdit;
    Panel3: TPanel;
    gbFilterBy: TGroupBox;
    rbGroups: TRadioButton;
    rbBreeds: TRadioButton;
    rbNotInGroup: TRadioButton;
    gFilter: TcxGrid;
    gFilterGroupsDBTableView: TcxGridDBTableView;
    gFilterGroupsDBTableViewID: TcxGridDBColumn;
    gFilterGroupsDBTableViewSelected: TcxGridDBColumn;
    gFilterGroupsDBTableViewCode: TcxGridDBColumn;
    gFilterGroupsDBTableViewDescription: TcxGridDBColumn;
    gFilterGroupsDBTableViewGroupType: TcxGridDBColumn;
    gFilterBreedsDBTableView: TcxGridDBTableView;
    gFilterBreedsDBTableViewID: TcxGridDBColumn;
    gFilterBreedsDBTableViewSelected: TcxGridDBColumn;
    gFilterBreedsDBTableViewCode: TcxGridDBColumn;
    gFilterBreedsDBTableViewName: TcxGridDBColumn;
    gFilterBreedsDBTableViewGestationPeriod: TcxGridDBColumn;
    gFilterBreedsDBTableViewEligibleforPremium: TcxGridDBColumn;
    gFilterBreedsDBTableViewEditStatus: TcxGridDBColumn;
    gFilterBreedsDBTableViewInUse: TcxGridDBColumn;
    gFilterBreedsDBTableViewPedigreeBreed: TcxGridDBColumn;
    gFilterLevel: TcxGridLevel;
    lNotInGroupInfo: TcxLabel;
    gbSCCFilter: TGroupBox;
    lSCCFrom: TLabel;
    lSCCTo: TLabel;
    sbSCCFrom: TRxSpinButton;
    sbSCCTo: TRxSpinButton;
    SCCFrom: TcxDBCurrencyEdit;
    SCCTo: TcxDBCurrencyEdit;
    gbDOB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    rgMonthFilter: TcxRadioGroup;
    DOBFrom: TDBDateEdit;
    DOBTo: TDBDateEdit;
    cmboNoOfMonthsFrom: TcxDBComboBox;
    lAgeMonthsFrom: TcxLabel;
    cxLabel2: TcxLabel;
    lAgeMonthsTo: TcxLabel;
    cmboNoOfMonthsTo: TcxDBComboBox;
    gbEventDates: TGroupBox;
    lFromDate: TLabel;
    lToDate: TLabel;
    EventDateFrom: TDBDateEdit;
    EventDateTo: TDBDateEdit;
    FilterTableSCCFrom: TFloatField;
    FilterTableSCCFilter: TBooleanField;
    FilterTableSCCTo: TFloatField;
    gbA1A2Results: TGroupBox;
    cmboA1A2Result: TcxDBComboBox;
    lA1A2Result: TLabel;
    FilterTableA1A2Result: TStringField;
    procedure bApplyFilterClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbLactFromBottomClick(Sender: TObject);
    procedure sbLactFromTopClick(Sender: TObject);
    procedure sbLactToBottomClick(Sender: TObject);
    procedure sbLactToTopClick(Sender: TObject);
    procedure cbFemaleClick(Sender: TObject);
    procedure cbHeatClick(Sender: TObject);
    procedure DispErrTimerTimer(Sender: TObject);
    procedure FilterTableAfterOpen(DataSet: TDataSet);
    procedure cbShowAllAnimalsClick(Sender: TObject);
    procedure cbShowEventsHistoryClick(Sender: TObject);
    procedure cbHealthClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbHelpClick(Sender: TObject);
    procedure cbRTClick(Sender: TObject);
    procedure cbNoneHerdClick(Sender: TObject);
    procedure dbGenGridGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure rbEventsClick(Sender: TObject);
    procedure rbStatusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbInMilkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbBreedsClick(Sender: TObject);
    procedure ShowStockClick(Sender: TObject);
    procedure StockDateExit(Sender: TObject);
    procedure cbAnimalsBornClick(Sender: TObject);
    procedure rgMonthFilterPropertiesChange(Sender: TObject);
    procedure DOBFromChange(Sender: TObject);
    procedure gFilterBreedsDBTableViewDblClick(Sender: TObject);
    procedure gFilterGroupsDBTableViewDblClick(Sender: TObject);
    procedure gFilterBreedsDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure gFilterGroupsDBTableViewGroupTypeGetFilterValues(
      Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
    procedure gFilterGroupsDBTableViewColumnHeaderClick(
      Sender: TcxGridTableView; AColumn: TcxGridColumn);
    procedure gFilterBreedsDBTableViewColumnHeaderClick(
      Sender: TcxGridTableView; AColumn: TcxGridColumn);
    procedure sbCondScoreFromBottomClick(Sender: TObject);
    procedure sbCondScoreFromTopClick(Sender: TObject);
    procedure sbCondScoreToBottomClick(Sender: TObject);
    procedure sbCondScoreToTopClick(Sender: TObject);
    procedure CondScoreFilterPropertiesChange(Sender: TObject);
    procedure sbEBIFromBottomClick(Sender: TObject);
    procedure sbEBIFromTopClick(Sender: TObject);
    procedure sbEBIToBottomClick(Sender: TObject);
    procedure sbEBIToTopClick(Sender: TObject);
    procedure EBIFromPropertiesEditValueChanged(Sender: TObject);
    procedure EBIToPropertiesEditValueChanged(Sender: TObject);
    procedure sbMilkYieldFromBottomClick(Sender: TObject);
    procedure sbMilkYieldFromTopClick(Sender: TObject);
    procedure sbMilkYieldToBottomClick(Sender: TObject);
    procedure sbMilkYieldToTopClick(Sender: TObject);
    procedure MilkYieldFromPropertiesEditValueChanged(Sender: TObject);
    procedure MilkYieldToPropertiesEditValueChanged(Sender: TObject);
    procedure rbLastTestYieldClick(Sender: TObject);
    procedure rbRatCalcAvgDailyYieldClick(Sender: TObject);
    procedure rgDaysOnFarmPropertiesChange(Sender: TObject);
    procedure sbDaysOnFarmFromBottomClick(Sender: TObject);
    procedure sbDaysOnFarmFromTopClick(Sender: TObject);
    procedure sbDaysOnFarmToBottomClick(Sender: TObject);
    procedure dbceDaysOnFarmFromPropertiesEditValueChanged(
      Sender: TObject);
    procedure dbceDaysOnFarmToPropertiesEditValueChanged(Sender: TObject);
    procedure sbDaysOnFarmToTopClick(Sender: TObject);
    procedure rbCurrLactsClick(Sender: TObject);
    procedure rbAllLactsClick(Sender: TObject);
    procedure sbOverallGainFromBottomClick(Sender: TObject);
    procedure sbOverallGainFromTopClick(Sender: TObject);
    procedure sbOverallGainToBottomClick(Sender: TObject);
    procedure sbOverallGainToTopClick(Sender: TObject);
    procedure OverallGainPerDayFromPropertiesEditValueChanged(
      Sender: TObject);
    procedure OverallGainPerDayToPropertiesEditValueChanged(
      Sender: TObject);
    procedure sbSCCFromBottomClick(Sender: TObject);
    procedure sbSCCFromTopClick(Sender: TObject);
    procedure sbSCCToBottomClick(Sender: TObject);
    procedure sbSCCToTopClick(Sender: TObject);
    procedure SCCFromPropertiesEditValueChanged(Sender: TObject);
    procedure SCCToPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    GridFilter : TGridFilter;
    GetShowSales : Boolean;

    //   26/03/12 [V5.0 R4.5] /MK Change - New MemDataSet To Create Groups With Not In Group Option
    mdFilterGroups : TdxMemData;
    dsFilterGroups : TDataSource;

    HerdType : THerdType;
    HerdCountry : TCountry;

    FStatusWithCalvingFilter : Boolean;

    procedure CheckEditMode;
    procedure SetDefaultValues;
    procedure SaveDefaults;
    procedure SetEventTags;
    procedure ClearSQLStrings;
    procedure DispErr(ErrMsg: String);
    procedure SetShowSales ( Value : Boolean );
    procedure CheckFilterTable;   // SP 25/09/2002
    procedure CheckForEventDates; // SP 25/09/2002
    procedure ClearEventsStatus;  // SP 25/09/2002
    procedure ResetFont;
    procedure SetCtrlState(Enabled : Boolean);
    procedure SetGridSource(gsSource : TGridSource);
    procedure ClearBreeds;
    function GetFilterByConditionScore: Boolean;
    //   26/03/12 [V5.0 R4.5] /MK Change - New Procedures For Not In Group Option.
    procedure CreateFilterByGroup;
    procedure mdFilterGroupsAfterPost ( DataSet : TDataSet );
    function GetFilterByEBI: Boolean;
    procedure EnableHerdOptions(AHerdType : THerdType);
    function GetFilterByMilkYield: Boolean;
    function GetFilterByRatCalcMilkYield: Boolean;
    procedure ResetAllSpinButtonFilters;
    procedure SetFilterByMilkYieldType;
    procedure ShowHideEventDatePanel(AShow: Boolean);
    function GetFilterByOverallGainPerDay: Boolean;
    procedure SetFilterByOverallGainPerDay;
    function GetBreedingSelected: Boolean;
    function GetFilterBySCC: Boolean;
    procedure SetFilterBySCC;
    function GetFilterByA1A2Result: Boolean;

  public
    { Public declarations }
    InnerJoinSQLEvents,
    EventDateRangeSQL,
    LactSQL,
    DOBSQL,
    SexSQL,
    RetagSQL,
    AIBullSQL,
    AncestorsSQL,
    BreedingSQL,
    NonBreedingSQL,
    DairySQL,
    BeefSQL,
    LeftHerdSQL,
    NoneHerdSQL,
    EBISQL,
    A1A2ResultSQL : String;

    CheckForEvents : Boolean;
    FemaleStatus : TFemaleStatus; // SP 25/09/2002
    GridSource : TGridSource;
    BreedsSQL : String;
    dStockDate : TDateTime;
    ShowAnimalsOnStockDate,
    ShowAnimalsBornIntoHerd : Boolean;

    AgeInMonthsFilterSQL,
    DaysOnFarmSQL : String;

    procedure ResetFilters;
    procedure ShowForm;
    procedure ClearGroups;
    procedure AllLactActive;
    procedure CondScoreFilterActive( FActive : Boolean );
    property ShowSales : Boolean read GetShowSales write SetShowSales;
    property FilterByConditionScore : Boolean read GetFilterByConditionScore;
    property FilterByEBI : Boolean read GetFilterByEBI;
    property FilterByMilkYield : Boolean read GetFilterByMilkYield;
    property FilterByRatCalcMilkYield : Boolean read GetFilterByRatCalcMilkYield;
    property FilterByOverallGainPerDay : Boolean read GetFilterByOverallGainPerDay;
    property BreedingSelected : Boolean read GetBreedingSelected;
    property FilterBySCC : Boolean read GetFilterBySCC;
    property FilterByA1A2Result : Boolean read GetFilterByA1A2Result;
  end;

var
  fFilters: TfFilters;

implementation
uses
    Def,
    MenuUnit,
    DairyData;

{$R *.DFM}

procedure TfFilters.ShowForm;
begin
    WinData.LookupGroups.Close;
    WinData.LookupGroups.Open;
//    CreateFilterByGroup;
    ShowModal;
end;

procedure TfFilters.SetShowSales ( Value : Boolean );
begin
    if Value <> GetShowSales then
       GetShowSales := Value;
end;

procedure TfFilters.ResetFilters;
begin
    try
       FemaleStatus := fsNone; // SP 24/09/2002:-
       dbseServedCount.Enabled := False;
       CheckForEvents := FALSE;
       dsFilters.Enabled := FALSE;
       FilterTable.Open;
       FilterTable.First;
       if FilterTable.RecordCount > 0 then
          FilterTable.Edit
       else
          FilterTable.Append;

       with FilterTable do
          begin
             FieldByName('HerdID').AsInteger    := WinData.DefaultHerd;
             FieldByName('Sex1').AsBoolean      := TRUE;
             FieldByName('Sex2').AsBoolean      := TRUE;
             FieldByName('Sex3').AsBoolean      := TRUE;
             FieldByName('LactFrom').AsInteger  := 0;
             FieldByName('LactTo').AsInteger    := 30;
             FieldByName('Heats').AsBoolean     := FALSE;
             FieldByName('Services').AsBoolean  := FALSE;
             FieldByName('PD').AsBoolean        := FALSE;
             FieldByName('DryingOff').AsBoolean := FALSE;
             FieldByName('Calving').AsBoolean   := FALSE;
             FieldByName('Health').AsBoolean    := FALSE;
             FieldByname('Vaccination').AsBoolean := FALSE;
             FieldByName('Sales').AsBoolean     := FALSE;
             FieldByName('Purchases').AsBoolean := FALSE;
             FieldByName('Weighing').AsBoolean  := FALSE;
             FieldByName('DOBFrom').AsDateTime       := 0;
             FieldByName('DOBTo').AsDateTime          := 0;
             FieldByName('EventDateFrom').AsDateTime := 0;
             FieldByName('EventDateTo').AsDateTime   := 0;
             FieldByName('AIBull').AsBoolean      := FALSE;
             FieldByName('Retag').AsBoolean        := FALSE;
             FieldByName('LeftHerd').AsBoolean     := FALSE;
             FieldByName('NoneHerd').AsBoolean  := FALSE;
             FieldByName('Breeding').AsBoolean     := TRUE;
             FieldByName('NonBreeding').AsBoolean  := TRUE;
             FieldByName('Dairy').AsBoolean  := TRUE;
             FieldByName('Beef').AsBoolean  := TRUE;
             FieldByName('StockDate').AsDateTime := 0;
             FieldByName('ShowStock').AsBoolean := False;
             FieldByName('BornIntoHerd').AsBoolean   := False;
             FieldByName('IncAllLactations').AsBoolean  := False;
             FieldByName('ToBeCulled').AsBoolean  := False;
             FieldByName('NoOfMonths').AsString := '';
             FieldByName('NoOfMonthsTo').AsString := '';
             FieldByName('AgeMonthsSelected').AsInteger  := 0;
             FieldByName('ServedCount').AsInteger  := 1;
             FieldByName('DaysOnFarmFrom').AsInteger := 0;
             FieldByName('DaysOnFarmTo').AsInteger := 0;
             FieldByName('DaysOnFarmFilterSelected').AsInteger  := 0;
             FieldByName('A1A2Result').AsString := '';
             Post;
          end;

       ResetAllSpinButtonFilters;

       rgMonthFilter.ItemIndex := 0;
       rgDaysOnFarm.ItemIndex := 0;
       ClearSQLStrings;
       ClearGroups;
       ClearBreeds; //SP 12/11/2002
       ShowSales := FALSE;
       AllLactActive;
       //CondScoreFilterActive( FilterTableCondScoreFilter.AsBoolean );
       SetCtrlState(True);
       //    11/07/12 [V5.0 R7.6] /MK Change - Set rbEvents back as default.
       rbEvents.Checked := True;

       FStatusWithCalvingFilter := False;

       dsFilters.DataSet.Refresh;
    finally
       GridFilter := gfNone;

       FilterTable.Close;
       dsFilters.Enabled := TRUE;
    end;
end;

procedure TfFilters.ClearBreeds;
var
   bActive : Boolean;
begin
    try
       with WinData.GenQuery do
          begin
             SQL.Clear;
             SQL.Add('UPDATE ' + WinData.Breeds.TableName );
             SQL.Add('SET Selected=FALSE');
             ExecSQL;
          end;

       //   27/11/19 [V5.9 R1.3] /MK Change - Clear the filter on the WinData.Breeds table when the Filter screen closes.
       WinData.Breeds.Filter := '';
       WinData.Breeds.Filtered := False;

       // ReFresh the Groups Datasource
       bActive := WinData.BreedsSource.DataSet.Active;
       if not bActive then
          WinData.BreedsSource.DataSet.Active := not bActive;
       WinData.BreedsSource.DataSet.Refresh;
       WinData.BreedsSource.DataSet.Active := bActive;
       gFilterBreedsDBTableView.Controller.FocusedRowIndex := 0;
       if gFilterBreedsDBTableView.DataController.Filter.Active then
          begin
             gFilterBreedsDBTableView.DataController.Filter.Clear;
             gFilterBreedsDBTableView.DataController.Filter.Active := False;
          end;
    except
        ShowMessage('Cannot Clear the Selection');
    end;
end;

procedure TfFilters.ClearGroups;
var
   bActive : Boolean;
begin
    try
       with WinData.GenQuery do
          begin
             SQL.Clear;
             SQL.Add('UPDATE ' + WinData.LookUpGroups.TableName );
             SQL.Add('SET Selected=FALSE');
             ExecSQL;
          end;

       // ReFresh the Groups Datasource
       bActive := WinData.dsLookUpGroups.DataSet.Active;
       if not bActive then
          WinData.dsLookUpGroups.DataSet.Active := not bActive;
       WinData.dsLookUpGroups.DataSet.Refresh;
       WinData.dsLookUpGroups.DataSet.Active := bActive;
       gFilterGroupsDBTableView.Controller.FocusedRowIndex := 0;
       if gFilterGroupsDBTableView.DataController.Filter.Active then
          begin
             gFilterGroupsDBTableView.DataController.Filter.Clear;
             gFilterGroupsDBTableView.DataController.Filter.Active := False;
          end;
    except
        ShowMessage('Cannot Clear the Selection');
    end;
end;

procedure TfFilters.ClearSQLStrings;
begin
    DairySQL := '';
    BeefSQL := '';
    BreedingSQL := '';
    NonBreedingSQL := '';
    //AIBullSQL := '';
    NoneHerdSQL := '';
    RetagSQL := '';
    SexSql := '';
    DOBSql := '';
    LactSQL := '';
    //LeftHerdSQL := '';
    EventDateRangeSQL := '';
    InnerJoinSQLEvents := '';
    BreedsSQL := '';
    AgeInMonthsFilterSQL := '';
    EBISQL := '';
    DaysOnFarmSQL := '';
    A1A2ResultSQL := '';
end;

procedure TfFilters.bApplyFilterClick(Sender: TObject);
var
    NoSexes,
    i,
    NoOfMonthsFrom,
    NoOfMonthsTo,
    DaysOnFarmFrom,
    DaysOnFarmTo : Integer;
    SexOK,
    AddedItems : Boolean;
begin
   if ShowStock.Checked then
      StockDateExit(nil);

   DispErr('Gathering Animals Please Wait...'); // SP 25/09/2002
   SaveDefaults;

   // Build the Sex SQL statement
   WinData.ActiveFilter := FALSE;
   AddedItems := FALSE;

   SexOK      := FALSE;
   NoSexes    := 0;
   ClearSQLStrings;

   with qFilterByBreed do // SP
      begin
         WinData.ActiveFilter := TRUE;
         Active := True;
         if RecordCount > 0 then
            begin
               First;
               while not eof do
                  begin
                     if bof then
                        BreedsSQL := '('+FieldByName('ID').AsString
                     else
                        BreedsSQL := BreedsSQL +', '+ FieldByName('ID').AsString;
                     Next;
                  end;
               BreedsSQL := BreedsSQL + ')';
            end;
         Active := False;
      end;

   // Check the Number of Selected Groups
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(ID) RecCount FROM ' + WinData.Groups.Tablename);
         SQL.Add('WHERE (Selected=TRUE)');
         Open;
         try
            First;
            WinData.ActiveFilter := ( FieldByName('RecCount').AsInteger > 0 );
         finally
            Close;
         end;
      finally
         Free;
      end;

   for i := 0 to gbSex.ControlCount-1 do
      begin
         if ( gbSex.Controls[i] is TcxDBCheckBox ) then
            begin
               if ( gbSex.Controls[i] as TcxDBCheckBox ).Checked then
                  begin
                     if NOT AddedItems then
                        begin
                           SexSQL := 'AND (( Sex = ' + '''' + (gbSex.Controls[i] as TcxDBCheckBox).Caption + '''' + ')';
                           AddedItems := TRUE;
                           Inc(NoSexes);
                           SexOK := TRUE;
                        end
                     else
                        begin
                           SexSQL := SexSQL + ' OR ( Sex = ' + '''' + (gbSex.Controls[i] as TcxDBCheckBox).Caption + '''' + ')';
                           Inc(NoSexes);
                        end;
                  end;
            end;
      end;

   // Put a bracket on the end of the string to enclose the AND and OR to SEX
   if Length(SexSQL) > 0 then
      SexSql := SexSql + ')';
   if ( NoSexes < 3 ) then
      WinData.ActiveFilter := TRUE;

   if ( FilterTable.FieldByName('Beef').AsBoolean ) then
      begin
         BeefSQL := '';
         BeefSQL := 'AND B.EligibleforPremium = "TRUE"';
         WinData.ActiveFilter := TRUE;
      end;
   if ( FilterTable.FieldByName('Dairy').AsBoolean ) then
      begin
         DairySQL := '';
         DairySQL := 'AND B.EligibleforPremium = "FALSE"';
         WinData.ActiveFilter := TRUE;
      end;
   if ( FilterTable.FieldByName('Breeding').AsBoolean ) then
      begin
         BreedingSQL := '';
         BreedingSQL := 'AND ( A.Breeding = "TRUE")';
         WinData.ActiveFilter := TRUE;
      end;
   if ( FilterTable.FieldByName('NonBreeding').AsBoolean ) then
      begin
         NonBreedingSQL := '';
         NonBreedingSQL := 'AND ( A.Breeding = "FALSE")';
         WinData.ActiveFilter := TRUE;
      end;

   {
   if ( FilterTable.FieldByName('AIBull').AsBoolean ) and ( AIBullSQL = '' ) then
      begin
         AIBullSQL := '';
         AIBullSQL := 'WHERE ((A.Sex = "Bull") AND (A.Breeding="TRUE"))';
         WinData.ActiveFilter := TRUE;
      end
   }
   if ( FilterTable.FieldByName('Retag').AsBoolean ) then
      begin
         RetagSQL := '';
         RetagSQL := 'Where AF.ItemChanged=11';
         WinData.ActiveFilter := TRUE;
      end
   else if ( FilterTable.FieldByName('LeftHerd').AsBoolean ) then
      begin
         LeftHerdSQL := '';
         LeftHerdSQL := 'Where InHerd="False"';
         WinData.ActiveFilter := TRUE;
      end
   else if ( FilterTable.FieldByName('NoneHerd').AsBoolean ) then
      begin
         NoneHerdSQL := '';
         NoneHerdSQL := 'WHERE (A.HerdID = ' + IntToStr(WinData.NoneHerdID) + ')';
         WinData.ActiveFilter := TRUE;
      end;

   // Set the Date of Birth SQL
   if ( DOBFrom.Date > 0 ) And ( DOBTo.Date > 0 ) then
      begin
          DOBSQL := '';
          DOBSQL := 'AND (( DateOfBirth between ' + '''' + FormatDateTime(cUSDateStyle,DOBFrom.Date ) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,DOBTo.Date ) + '''' + '))';
          WinData.ActiveFilter := TRUE;
      end
   else if ( DOBFrom.Date > 0 ) And ( DOBTo.Date <= 0 ) then
      begin
          DOBSQL := '';
          DOBSQL := 'AND (DateOfBirth >= "'+FormatDateTime(cUSDateStyle,DOBFrom.Date)+'")';
          WinData.ActiveFilter := TRUE;
      end
   else if ( DOBTo.Date > 0 ) And ( DOBFrom.Date <= 0 ) then
      begin
          DOBSQL := '';
          DOBSQL := 'AND (DateOfBirth <= "'+FormatDateTime(cUSDateStyle,DOBTo.Date)+'")';
          WinData.ActiveFilter := TRUE;
      end
   else if ( rgMonthFilter.ItemIndex <> 0 ) then
      begin
         AgeInMonthsFilterSQL := '';
         if ( rgMonthFilter.ItemIndex > 0 ) and ( rgMonthFilter.ItemIndex < 3 ) then
            begin
               NoOfMonthsFrom := StrToInt(cmboNoOfMonthsFrom.Text);
               if ( NoOfMonthsFrom > 0 ) then
                  begin
                     if rgMonthFilter.ItemIndex = 1 then
                        begin
                           AgeInMonthsFilterSQL := 'AND (DateOfBirth <= "'+FormatDateTime(cUSDateStyle,IncMonth(StockDate.Date, -NoOfMonthsFrom))+'")';
                        end
                     else
                        begin
                           AgeInMonthsFilterSQL := 'AND (DateOfBirth >= "'+FormatDateTime(cUSDateStyle,IncMonth(StockDate.Date, -NoOfMonthsFrom))+'")';
                        end;
                     WinData.ActiveFilter := TRUE;
                  end;
            end
         else if ( rgMonthFilter.ItemIndex > 0 ) and ( rgMonthFilter.ItemIndex = 3 ) then
            begin
               NoOfMonthsFrom := StrToInt(cmboNoOfMonthsFrom.Text);
               NoOfMonthsTo := StrToInt(cmboNoOfMonthsTo.Text);
               if ( NoOfMonthsFrom = NoOfMonthsTo ) then
                  begin
                     AgeInMonthsFilterSQL := 'AND (DateOfBirth BETWEEN "'+FormatDateTime(cUSDateStyle,IncMonth(StockDate.Date, -NoOfMonthsFrom-1))+'"';
                     AgeInMonthsFilterSQL := AgeInMonthsFilterSQL + ' AND "'+FormatDateTime(cUSDateStyle,IncMonth(StockDate.Date, -NoOfMonthsTo))+'")';
                  end
               else if ( NoOfMonthsFrom > NoOfMonthsTo ) then
                  begin
                     AgeInMonthsFilterSQL := 'AND (DateOfBirth BETWEEN "'+FormatDateTime(cUSDateStyle,IncMonth(StockDate.Date, -NoOfMonthsFrom))+'"';
                     AgeInMonthsFilterSQL := AgeInMonthsFilterSQL + ' AND "'+FormatDateTime(cUSDateStyle,IncMonth(StockDate.Date, -NoOfMonthsTo))+'")';
                  end
               else if ( NoOfMonthsTo > NoOfMonthsFrom ) then
                  begin
                     AgeInMonthsFilterSQL := 'AND (DateOfBirth BETWEEN "'+FormatDateTime(cUSDateStyle,IncMonth(StockDate.Date, -NoOfMonthsTo))+'"';
                     AgeInMonthsFilterSQL := AgeInMonthsFilterSQL + ' AND "'+FormatDateTime(cUSDateStyle,IncMonth(StockDate.Date, -NoOfMonthsFrom))+'")';
                  end;
            end;
      end
   else if ( rgDaysOnFarm.ItemIndex <> 0 ) then
      begin
         DaysOnFarmSQL := '';
         if ( rgDaysOnFarm.ItemIndex > 0 ) and ( rgDaysOnFarm.ItemIndex < 3 ) then
            begin
               DaysOnFarmFrom := FilterTable.FieldByName('DaysOnFarmFrom').AsInteger;
               if ( rgDaysOnFarm.ItemIndex = 1 ) then
                  DaysOnFarmSQL := 'AND ID IN (SELECT E.AnimalID FROM Events E '+
                                   '           WHERE E.EventType = '+IntToStr(CPurchaseEvent)+' '+
                                   '           AND E.EventDate < "'+FormatDateTime(cUSDateStyle,StockDate.Date-DaysOnFarmFrom)+'")'
               else if ( rgDaysOnFarm.ItemIndex = 2 ) then
                  DaysOnFarmSQL := 'AND ID IN (SELECT E.AnimalID FROM Events E '+
                                   '           WHERE E.EventType = '+IntToStr(CPurchaseEvent)+' '+
                                   '           AND E.EventDate > "'+FormatDateTime(cUSDateStyle,StockDate.Date-DaysOnFarmFrom)+'")'
            end
         else if ( rgDaysOnFarm.ItemIndex > 0 ) and ( rgDaysOnFarm.ItemIndex = 3 ) then
            begin
               DaysOnFarmFrom := FilterTable.FieldByName('DaysOnFarmFrom').AsInteger;
               DaysOnFarmTo := FilterTable.FieldByName('DaysOnFarmTo').AsInteger;
                  DaysOnFarmSQL := 'AND ID IN (SELECT E.AnimalID FROM Events E '+
                                   '           WHERE E.EventType = '+IntToStr(CPurchaseEvent)+' '+
                                   '           AND E.EventDate BETWEEN "'+FormatDateTime(cUSDateStyle,StockDate.Date-DaysOnFarmTo)+'"'+
                                   '                           AND "'+FormatDateTime(cUSDateStyle,StockDate.Date-DaysOnFarmFrom)+'")';
            end;
      end;

   LactSQL := '';
   //   05/10/12 [V5.1 R0.2] /MK Bug Fix - Fix for if FromLactNo = 0 and ToLactNo = 0 No filter is being applied.
   if not(( FilterTable.FieldByName('LactFrom').AsInteger = 0 ) And ( FilterTable.FieldByName('LactTo').AsInteger = 30 )) then
      begin
         // Set the Lactation Number
         if ( FilterTable.FieldByName('LactFrom').AsInteger >= 0 ) And ( FilterTable.FieldByName('LactTo').AsInteger >= 0 ) then
            begin
                LactSQL := 'AND (( LactNo between ' + FilterTable.FieldByName('LactFrom').AsString + ' And ' + FilterTable.FieldByName('LactTo').AsString + '))';
                WinData.ActiveFilter := TRUE;
            end;
      end;

   A1A2ResultSQL := '';
   if ( Length(FilterTable.FieldByName('A1A2Result').AsString) > 0 ) then
      begin
         A1A2ResultSQL := 'AND ID IN (SELECT AnimalID FROM DNAResults WHERE A1A2 = "'+cmboA1A2Result.Text+'")';
         WinData.ActiveFilter := True;
      end;

   AddedItems := FALSE;
   for i := 0 to pEventType.ControlCount-1 do
      begin
         if ( pEventType.Controls[i] is TcxDBCheckBox ) then
            begin
               if ( pEventType.Controls[i] as TcxDBCheckBox ).Checked then
                  begin
                     if NOT AddedItems then
                        InnerJoinSQLEvents := IntToStr(( pEventType.Controls[i] as TcxDBCheckBox ).Tag)
                     else
                        InnerJoinSQLEvents := InnerJoinSQLEvents + ',' + IntToStr(( pEventType.Controls[i] as TcxDBCheckBox ).Tag);
                     AddedItems := TRUE;
                     WinData.ActiveFilter := TRUE;
                  end;
            end;
      end;

   // if the Event Date Range is Set
   if ( EventDateFrom.Date > 0 ) And ( EventDateTo.Date > 0 ) then
      begin
          EventDateRangeSQL := '';
          EventDateRangeSQL := 'AND (( EventDate between ' + '''' + FormatDateTime(cUSDateStyle,EventDateFrom.Date ) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,EventDateTo.Date ) + '''' + '))';
          WinData.ActiveFilter := TRUE;
      end
   else if ( EventDateFrom.Date > 0 ) And ( EventDateTo.Date <= 0 ) then
      begin
          EventDateRangeSQL := '';
          EventDateRangeSQL := 'AND ( EventDate > ' + '''' + FormatDateTime(cUSDateStyle,EventDateFrom.Date ) + '''' + ')';
          WinData.ActiveFilter := TRUE;
      end
   else  if ( EventDateFrom.Date <= 0 ) And ( EventDateTo.Date > 0 ) then
      begin
          EventDateRangeSQL := '';
          EventDateRangeSQL := 'AND ( EventDate <= ' + '''' + FormatDateTime(cUSDateStyle,EventDateTo.Date ) + '''' + ')';
          WinData.ActiveFilter := TRUE;
      end;

   // check for the Other Events i.e. Health, Sales e.t.c.
   for i := 0 to gbOtherEvents.ControlCount-1 do
      begin
         if ( gbOtherEvents.Controls[i] is TcxDBCheckBox ) then
            begin
               if ( gbOtherEvents.Controls[i] as TcxDBCheckBox ).Checked then
                  begin
                     if NOT AddedItems then
                        InnerJoinSQLEvents := IntToStr(( gbOtherEvents.Controls[i] as TcxDBCheckBox ).Tag)
                     else
                        InnerJoinSQLEvents := InnerJoinSQLEvents + ',' + IntToStr(( gbOtherEvents.Controls[i] as TcxDBCheckBox ).Tag);
                     AddedItems := TRUE;
                     WinData.ActiveFilter := TRUE;
                  end;
            end;
      end;

   if AddedItems then
      {
      if FilterTableIncAllLactations.AsBoolean then
         InnerJoinSQLEvents := 'INNER JOIN events On (AnimalID=ID) WHERE EventType IN (' + InnerJoinSQLEvents + ')'
      else
         InnerJoinSQLEvents := 'INNER JOIN events On ((AnimalID=ID) And (AnimalLactNo=LactNo)) WHERE EventType IN (' + InnerJoinSQLEvents + ')';
      }

      //   26/07/12 [V5.0 R8.1] /MK Bug Fix - No need For AnimalID = ID as Left Join in MenuUnit covers this.
      if FilterTableIncAllLactations.AsBoolean then  // SP
         //InnerJoinSQLEvents := 'WHERE (AnimalID=ID) AND EventType IN (' + InnerJoinSQLEvents + ')'
         InnerJoinSQLEvents := 'WHERE EventType IN (' + InnerJoinSQLEvents + ')'
      else
         //InnerJoinSQLEvents := 'WHERE ((AnimalID=ID) AND (AnimalLactNo=LactNo)) AND EventType IN (' + InnerJoinSQLEvents + ')';
         InnerJoinSQLEvents := 'WHERE (A.LactNo = E.AnimalLactNo) AND EventType IN (' + InnerJoinSQLEvents + ')';

   // Check the Sales Events
   if FilterTable.FieldByName('Sales').AsBoolean then
      begin
         ShowSales := TRUE;
         WinData.ActiveFilter := TRUE;
      end;

   // Check the Show All Animals
   if WinData.ShowAllAnimals then
      WinData.ActiveFilter := TRUE;

   // Check the Show Events History
//    if cbShowEventsHistory.Checked then
//       WinData.ActiveFilter := TRUE;

   if NOT(cbBreeding.Checked) AND NOT(cbNonBreeding.Checked) then
      begin
         MessageDLG('You must select either Breeding or Non-Breeding stock',mtWarning,[mbOK],0);
         Exit;
      end;
   if NOT(cbDairy.Checked) AND NOT(cbBeef.Checked) then
      begin
         MessageDLG('You must select either Dairy or Beef animals',mtWarning,[mbOK],0);
         Exit;
      end;

   dStockDate := fFilters.FilterTable.FieldByName('StockDate').AsDateTime;
   ShowAnimalsOnStockDate := fFilters.FilterTable.FieldByName('ShowStock').AsBoolean;
   ShowAnimalsBornIntoHerd := fFilters.FilterTable.FieldByName('BornIntoHerd').AsBoolean;

   SetFilterByMilkYieldType;

   SetFilterByOverallGainPerDay;

   SetFilterBySCC;

   if SexOK then
      begin
         Menuform.SetUpQuery(True);
         if fFilters.Showing then
            Close; // Close the Form
      end
   else if fFilters.Showing then
      begin
         MessageDLG('You must select at least one Sex',mtWarning,[mbOK],0);
         gbSex.SetFocus;
      end;

   WinData.ActiveFilter := True;
end;

procedure TfFilters.SaveDefaults;
begin
    if FilterTable.State in dsEditModes then
       FilterTable.Post;
    CheckEditMode;
end;

procedure TfFilters.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfFilters.SetDefaultValues;
var
   qActiveBreeds : TQuery;
   sActiveBreeds : String;
begin
   CheckEditMode;
   // Show the Lactation if Female are checked
   if ( cbFemale.Checked ) then
      begin
         gbLact.Show;
         gbBreedingEvents.Show;
      end
   else
      begin
         gbBreedingEvents.Hide;
         gbLact.Hide;
         FemaleStatus := fsNone;
         FilterTable.FieldByName('LactFrom').AsInteger  := 0;
         FilterTable.FieldByName('LactTo').AsInteger    := 30;
         FilterTable.FieldByName('Heats').AsBoolean     := FALSE;
         FilterTable.FieldByName('Services').AsBoolean  := FALSE;
         FilterTable.FieldByName('PD').AsBoolean        := FALSE;
         FilterTable.FieldByName('DryingOff').AsBoolean := FALSE;
         FilterTable.FieldByName('Calving').AsBoolean   := FALSE;
         FilterTable.FieldByName('A1A2Result').AsString := '';
      end;

   ResetAllSpinButtonFilters;
   gbBreedingEvents.Visible := HerdType <> htBeef;
   gbLact.Visible := HerdType <> htBeef;
   gbDaysOnFarm.Visible := HerdType = htBeef;

   CheckForEventDates;

   //   27/11/19 [V5.9 R1.3] /MK Change - Only show breeds that are in use - TOK/GL request.
   WinData.Breeds.Filter := '';
   WinData.Breeds.Filtered := False;
   sActiveBreeds := '';
   qActiveBreeds := TQuery.Create(nil);
   with qActiveBreeds do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(PrimaryBreed)');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID IN (SELECT AID FROM AFilters)');
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  First;
                  while ( Not(Eof) ) do
                     begin
                        if ( Length(sActiveBreeds) = 0 ) then
                           sActiveBreeds := 'ID = ('+IntToStr(Fields[0].AsInteger)+')'
                        else
                           sActiveBreeds := sActiveBreeds + ' OR ID = ('+IntToStr(Fields[0].AsInteger)+')';
                        Next;
                     end;
               end;
            if ( Length(sActiveBreeds) > 0 ) then
               begin
                  WinData.Breeds.Filter := sActiveBreeds;
                  WinData.Breeds.Filtered := True;
               end;
         except
            on e : Exception do
               begin
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError(e.Message);
               end;
         end;
      finally
         Free;
      end;
end;

procedure TfFilters.CheckFilterTable;
begin
    try
      if ( FilterTable.FieldDefs.IndexOf('EventDateFrom') < 0 ) then
         begin
            FilterTable.Close;
            with WinData.GenQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE ' + FilterTable.Tablename);
                  SQL.Add('ADD EventDateFrom DATE, ADD EventDateTo DATE');
                  ExecSQL;
               end;
            FilterTable.Open;
         end;
    except
       ShowMessage('Cannot add Items to Filters');
    end;
end;

procedure TfFilters.FormActivate(Sender: TObject);
begin
   try
      FilterTable.Open;
      SetEventTags;
      CheckEditMode;
      SetDefaultValues;

      if ( not(WinData.ActiveFilter) ) then
         AllLactActive;

      // Refresh the Filters Datasource

      //rbBreeds.Checked := True;
      if ( Def.Definition.dUseBeefMan ) or ( Def.Definition.dUseManCal ) then
         begin
            if ( FilterTable.FieldByName('EventDateFrom').AsDateTime = 0 ) or
               ( FilterTable.FieldByName('EventDateTo').AsDateTime = 0 ) then
                  begin
                     gbFilterBy.Show;
                     if HerdType = htBeef then
                        gbFilterBy.Left := 5;
                  end;
         end;

      if GridFilter = gfGroups then
         begin
            rbGroups.Checked := True;
            rbBreeds.Checked := False;
            rbNotInGroup.Checked := False;
         end
      else if GridFilter = gfNotInGroup then
         begin
            rbGroups.Checked := False;
            rbBreeds.Checked := False;
            rbNotInGroup.Checked := True;
         end
      else
         begin
            rbGroups.Checked := False;
            rbBreeds.Checked := True;
            rbNotInGroup.Checked := False;
         end;

      //   16/10/12 [V5.1 R0.4] /MK Bug Fix - Set whether StockDate is enabled or not on Form Activate.
      StockDate.Enabled := FilterTable.FieldByName('ShowStock').AsBoolean;

      //   21/12/12 [V5.1 R3.5] /MK Additional Feature - Only show new Milk Yield filter if Milk Rec module.
      gbMilkYield.Visible := ( HerdType = htDairy );
      rbLastTestYield.Visible := ( gbMilkYield.Visible ) and ( HerdType = htDairy );
      //   22/01/13 [V5.1 R3.9] /MK Additional Feature - Only show 7 Day Average Filter if Milk Rec Module, Ration Calc Module and RationData exists.
      rbRatCalcAvgDailyYield.Visible := ( rbLastTestYield.Visible ) and ( Def.Definition.dUseRationCalc ) and ( HerdLookup.RationHistoryDataExists );

      if ( rbRatCalcAvgDailyYield.Visible ) then
         gbMilkYield.Caption := '    Last Test Yield      7 Day Average:'
      else if ( HerdType = htDairy ) then
         gbMilkYield.Caption := '    Latest Recorded Yield'
      else
         begin
            gbOverallGainPerDay.Visible := ( not(gbMilkYield.Visible) ) and ( HerdType = htSuckler );
            gbOverallGainPerDay.Left := gbMilkYield.Left;
            gbOverallGainPerDay.Top := gbMilkYield.Top;
         end;

      if ( not(WinData.ActiveFilter) ) then
         begin
            rbLastTestYield.Checked := True;
            rbRatCalcAvgDailyYield.Checked := False;
         end
      else
         begin
            rbLastTestYield.Checked := FilterTable.FieldByName('MilkYieldFilter').AsBoolean;
            rbRatCalcAvgDailyYield.Checked := FilterTable.FieldByName('RatCalcMilkYieldFilter').AsBoolean;
         end;

      //   15/01/18 [V5.7 R7.4] /MK Change - Only show radio buttons if both radio buttons are visible - GL/SP.
      rbLastTestYield.Visible := rbRatCalcAvgDailyYield.Visible;
      if ( not(rbLastTestYield.Visible) ) and ( not(rbRatCalcAvgDailyYield.Visible) ) and ( HerdType = htDairy ) then
      //   15/01/18 [V5.7 R7.4] /MK Change - If neither radio button is showing then change gbMilk Yield caption to Last Milk Yield - GL/SP.
         gbMilkYield.Caption := 'Latest Recorded Yield';

      gbDaysOnFarm.Visible := ( HerdType = htBeef );
      gbDaysOnFarm.Enabled := ( not(WinData.ShowAllAnimals) );
      if ( cbSales.Checked ) then
         gbDaysOnFarm.Enabled := ( not(cbSales.Checked) );
      rgDaysOnFarm.Enabled := gbDaysOnFarm.Enabled;

      //   23/04/12 [V5.0 R5.2] /MK Change - cbSales.Enabled.
      //cbSales.Enabled := WinData.ShowAllAnimals;

      //    26/02/19 [V5.8 R8.0] /MK Bug Fix - Default Bull and Steer enabled to whether a breeding event filter is on - GL/Charles Crosse.
      cbBull.Enabled := ( not(BreedingSelected) );
      cbSteer.Enabled := ( not(BreedingSelected) );

      gbSCCFilter.Visible := ( HerdType = htDairy );

      gbA1A2Results.Visible := ( HerdType = htDairy );

   except
      ShowMessage('Cannot get the Defaults');
      FilterTable.Close;
   end;
end;

procedure TfFilters.SetEventTags;
var
   i : Integer;
begin
   for i := 0 to pEventType.ControlCount-1 do
      if ( pEventType.Controls[i] is TcxDBCheckBox ) then
         begin
            if ( pEventType.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'Heats' then
               ( pEventType.Controls[i] as TcxDBCheckBox).Tag := CBullingEvent
            else if ( pEventType.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'Services' then
               ( pEventType.Controls[i] as TcxDBCheckBox).Tag := CServiceEvent
            else if ( pEventType.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'PD' then
               ( pEventType.Controls[i] as TcxDBCheckBox).Tag := CPregDiagEvent
            else if ( pEventType.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'DryingOff' then
               ( pEventType.Controls[i] as TcxDBCheckBox).Tag := CDryOffEvent
            else if ( pEventType.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'Calving' then
               ( pEventType.Controls[i] as TcxDBCheckBox).Tag := CCalvingEvent;
      end;
   for i := 0 to gbOtherEvents.ControlCount-1 do
      if ( gbOtherEvents.Controls[i] is TcxDBCheckBox ) then
         begin
            if ( gbOtherEvents.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'Health' then
               ( gbOtherEvents.Controls[i] as TcxDBCheckBox).Tag := CHealthEvent
            else if ( gbOtherEvents.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'Sales' then
               ( gbOtherEvents.Controls[i] as TcxDBCheckBox).Tag := CSaleDeathEvent
            else if ( gbOtherEvents.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'Purchases' then
               ( gbOtherEvents.Controls[i] as TcxDBCheckBox).Tag := CPurchaseEvent
            else if ( gbOtherEvents.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'Weighing' then
               ( gbOtherEvents.Controls[i] as TcxDBCheckBox).Tag := CWeightEvent
            else if ( gbOtherEvents.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'ToBeCulled' then
               ( gbOtherEvents.Controls[i] as TcxDBCheckBox).Tag := CToBeCulledEvent
            else if ( gbOtherEvents.Controls[i] as TcxDBCheckBox).DataBinding.DataField = 'Vaccination' then
               ( gbOtherEvents.Controls[i] as TcxDBCheckBox).Tag := CHerdVaccination;
      end;
end;

procedure TfFilters.CheckEditMode;
begin
    if FilterTable.Active then
       with FilterTable do
          if NOT ( State in dsEditModes ) then
             begin
                First;
                if EOF then
                   begin
                      Append;
                      // Set Some defaults
                      FieldByName('Sex1').AsBoolean      := FALSE;
                      FieldByName('Sex2').AsBoolean      := FALSE;
                      FieldByName('Sex3').AsBoolean      := FALSE;
                      FieldByName('LactFrom').AsInteger  := 0;
                      FieldByName('LactTo').AsInteger    := 30;
                      FieldByName('Heats').AsBoolean     := FALSE;
                      FieldByName('Services').AsBoolean  := FALSE;
                      FieldByName('PD').AsBoolean        := FALSE;
                      FieldByName('DryingOff').AsBoolean := FALSE;
                      FieldByName('Calving').AsBoolean   := FALSE;
                      FieldByName('Health').AsBoolean    := FALSE;
                      FieldByName('Vaccination').AsBoolean := FALSE;
                      FieldByName('Sales').AsBoolean        := FALSE;
                      FieldByName('Purchases').AsBoolean    := FALSE;
                      FieldByName('Weighing').AsBoolean     := FALSE;
                      FieldByName('AIBull').AsBoolean       := FALSE;
                      FieldByName('Retag').AsBoolean        := FALSE;
                      FieldByName('LeftHerd').AsBoolean     := FALSE;
                      FieldByName('Breeding').AsBoolean     := FALSE;
                      FieldByName('NonBreeding').AsBoolean  := FALSE;
                      FieldByName('Dairy').AsBoolean        := FALSE;
                      FieldByName('Beef').AsBoolean         := FALSE;
                      FieldByName('NoneHerd').AsBoolean     := FALSE;
                      FieldByName('StockDate').AsDateTime   := 0;
                      FieldByName('ShowStock').AsBoolean    := False;
                      FieldByName('BornIntoHerd').AsBoolean := False;
                      FieldByName('IncAllLactations').AsBoolean := False;
                      FieldByName('NoOfMonths').AsString  := '';
                      FieldByName('NoOfMonthsTo').AsString  := '';
                      FieldByName('AgeMonthsSelected').AsInteger  := 0;
                      FieldByName('CondScoreFrom').AsFloat  := 1;
                      FieldByName('CondScoreTo').AsFloat  := 5;
                      FieldByName('CondScoreFilter').AsBoolean  := FALSE;
                      FieldByName('EBIFrom').AsFloat := 0;
                      FieldByName('EBITo').AsFloat := 999;
                      FieldByName('EBIFilter').AsBoolean  := FALSE;
                      FieldByName('MilkYieldFrom').AsFloat := 0;
                      FieldByName('MilkYieldTo').AsFloat := 9999;
                      FieldByName('MilkYieldFilter').AsBoolean := FALSE;
                      FieldByName('RatCalcMilkYieldFilter').AsBoolean := FALSE;
                      FieldByName('DaysOnFarmFrom').AsInteger := 0;
                      FieldByName('DaysOnFarmTo').AsInteger := 0;
                      FieldByName('DaysOnFarmFilterSelected').AsInteger  := 0;
                      FieldByName('OverallGainPerDayFilter').AsBoolean := False;
                      FieldByName('OverallGainPerDayFrom').AsFloat := 0;
                      FieldByName('OverallGainPerDayTo').AsFloat := 0;
                      FieldByName('SCCFilter').AsBoolean := False;
                      FieldByName('SCCFrom').AsFloat := 0;
                      FieldByName('SCCTo').AsFloat := 0;
                      FieldByName('A1A2Result').AsString;
                      rgMonthFilter.ItemIndex := 0;
                   end
                else
                   Edit;
          end;
end;

procedure TfFilters.sbLactFromBottomClick(Sender: TObject);
begin
    CheckEditMode;
    if FilterTable.FieldByName('LactFrom').AsInteger > 0 then
       FilterTable.FieldByName('LactFrom').AsInteger := FilterTable.FieldByName('LactFrom').AsInteger-1;
end;

procedure TfFilters.sbLactFromTopClick(Sender: TObject);
begin
    CheckEditMode;
    if ( FilterTable.FieldByName('LactFrom').AsInteger < 30 ) And
       ( FilterTable.FieldByName('LactFrom').AsInteger < FilterTable.FieldByName('LactTo').AsInteger ) then
       FilterTable.FieldByName('LactFrom').AsInteger := FilterTable.FieldByName('LactFrom').AsInteger+1;
end;

procedure TfFilters.sbLactToBottomClick(Sender: TObject);
begin
    CheckEditMode;
    if ( FilterTable.FieldByName('LactTo').AsInteger > 0 ) And
       ( FilterTable.FieldByName('LactTo').AsInteger > FilterTable.FieldByName('LactFrom').AsInteger ) then
       FilterTable.FieldByName('LactTo').AsInteger := FilterTable.FieldByName('LactTo').AsInteger-1;
end;

procedure TfFilters.sbLactToTopClick(Sender: TObject);
begin
    CheckEditMode;
    if ( FilterTable.FieldByName('LactTo').AsInteger < 30 ) then
       FilterTable.FieldByName('LactTo').AsInteger := FilterTable.FieldByName('LactTo').AsInteger+1;
end;

procedure TfFilters.cbFemaleClick(Sender: TObject);
begin
    if FilterTable.Active then
       SetDefaultValues;
end;

procedure TfFilters.cbHeatClick(Sender: TObject);
var
   i  : Integer;
begin
   if BreedingSelected then
      begin
         CheckEditMode;
         FilterTable.FieldByName('Sex1').AsBoolean := TRUE;
         FilterTable.FieldByName('Sex2').AsBoolean := FALSE;
         FilterTable.FieldByName('Sex3').AsBoolean := FALSE;
         DispErr('Breeding Events selected - You will not be able to see Male Animals');
         cbBull.Enabled := FALSE;
         cbSteer.Enabled := FALSE;
      end
   else
      begin
         cbBull.Enabled  := TRUE;
         cbSteer.Enabled := TRUE;
      end;
   CheckForEventDates;

   if (Sender As TcxDBCheckBox).Checked then
      CheckForEvents := TRUE;
end;

procedure TfFilters.CheckForEventDates;
var
   bHideShowEventDatePanel : Boolean;
begin
   // check one of the Event Types is checked and show the Event Date Range
   bHideShowEventDatePanel := ( cbHealth.Checked ) or
                              ( cbSales.Checked ) or
                              ( cbPurchases.Checked ) or
                              ( cbWeighing.Checked ) or
                              ( cbHeat.Checked ) or
                              ( cbServices.Checked ) or
                              ( cbPD.Checked ) or
                              ( cbDryOff.Checked ) or
                              ( cbCalving.Checked ) or
                              ( cbToBeCulled.Checked ) or
                              ( rbServedCount.Checked )or
                              ( cbVaccination.Checked );
   ShowHideEventDatePanel(bHideShowEventDatePanel);
end;

procedure TfFilters.DispErr(ErrMsg: String);
begin
   with ErrorMsg.Canvas do
      if ErrMsg = '' then // Clear the Area
         begin
            Brush.Color := fFilters.Color;
            Floodfill(0,0,fFilters.Color,fsBorder);
            DispErrTimer.Enabled := FALSE;
         end
      else
         begin
            Brush.Color := clRed;
            Font.Color := clwhite;
            Font.Name := 'Verdana';
            Font.Size:= 10;
            TextOut(5,2, ErrMsg);
            Floodfill(0,0,$000000FF,fsBorder);
            DispErrTimer.Enabled := TRUE;
         end;
end;

procedure TfFilters.DispErrTimerTimer(Sender: TObject);
begin
    DispErr('');  // Clear the Error Message
end;

procedure TfFilters.FilterTableAfterOpen(DataSet: TDataSet);
begin
    // Check all the Fields exist
    CheckFilterTable;
end;

procedure TfFilters.cbShowAllAnimalsClick(Sender: TObject);
begin
//     WinData.ShowAllAnimals := cbShowAllAnimals.Checked;
//     MenuForm.ShowAllAnimals1.Checked := cbShowAllAnimals.Checked;
end;

procedure TfFilters.cbShowEventsHistoryClick(Sender: TObject);
begin
{     if ( NOT cbShowEventsHistory.Checked ) then
        WinData.Events.MasterFields := 'ID;LactNo'
     else
        WinData.Events.MasterFields := 'ID';
     MenuForm.ShowEventsHistory1.Checked := cbShowEventsHistory.Checked;
}
end;

procedure TfFilters.cbHealthClick(Sender: TObject);
begin
   CheckForEventDates;
   if (Sender As TcxDBCheckBox).Checked then
      CheckForEvents := TRUE;
   gbDaysOnFarm.Enabled := ( not(cbSales.Checked) );
   if ( WinData.ShowAllAnimals ) then
      gbDaysOnFarm.Enabled := ( not(WinData.ShowAllAnimals) );
   rgDaysOnFarm.Enabled := gbDaysOnFarm.Enabled;
   if ( not(gbDaysOnFarm.Enabled) ) then
      begin
         rgDaysOnFarm.ItemIndex := 0;
         FilterTable.FieldByName('DaysOnFarmFrom').AsInteger := 0;
         FilterTable.FieldByName('DaysOnFarmTo').AsInteger := 0;
      end;
end;

procedure TfFilters.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    try
       WinData.LookupGroups.Active := False;
       FilterTable.Cancel;
       FilterTable.Close;
       //   27/11/19 [V5.9 R1.3] /MK Change - Clear the filter on the WinData.Breeds table when the Filter screen closes.
       WinData.Breeds.Filter := '';
       WinData.Breeds.Filtered := False;
       if not WinData.ActiveFilter then
          GridFilter := gfNone;

       {
       if mdFilterGroups.Active then
          begin
             mdFilterGroups.Active := False;
             FreeAndNil(mdFilterGroups)
          end;
       }

    except
       ShowMessage('Cannot close Filters');
    end;
end;

procedure TfFilters.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('Filter.htm');
end;

//   13/07/12 [V5.0 R7.8] /MK Change - Greyed Out Buttons Depending On If MenuForm.FQuickFilter <> qfNone.
procedure TfFilters.SetCtrlState(Enabled: Boolean);
const
   SexArray = [qfBullsInUse,
               qfCows,
               qfMilkingCows,
               qfDryCows,
               qfReplacementCows,
               qfDairyHeifersThisYear,
               qfDairyHeifersLastYear,
               qfBeefHeifersThisYear,
               qfBeefHeifersLastYear,
               qfAllHeifersThisYear,
               qfAllHeifersLastYear,
               qfMaleCalvesThisYear,
               qfMaleCalvesLastYear];

   LactArray = [qfAllAnimal,
                qfLeftHerd,
                qfBullsInUse,
                qfReplacementCows,
                qfBeefCattleFilter,
                qfDairyHeifersThisYear,
                qfDairyHeifersLastYear,
                qfBeefHeifersThisYear,
                qfBeefHeifersLastYear,
                qfAllHeifersThisYear,
                qfAllHeifersLastYear,
                qfMaleCalvesThisYear,
                qfMaleCalvesLastYear,
                qfAllCalvesThisYear,
                qfAllCalvesLastYear];

   StatusArray = [qfCows,
                  qfMilkingCows,
                  qfDryCows,
                  qfReplacementCows,
                  qfDairyHeifersThisYear,
                  qfDairyHeifersLastYear,
                  qfAllHeifersThisYear,
                  qfAllHeifersLastYear];

begin
   cbBreeding.Enabled := Enabled;
   cbNonBreeding.Enabled := Enabled;
   cbDairy.Enabled := Enabled;
   cbBeef.Enabled := Enabled;

   gbEventLactations.Enabled := Enabled;
   rbCurrLacts.Enabled := Enabled;
   rbAllLacts.Enabled := Enabled;

   cbHealth.Enabled := Enabled;
   cbVaccination.Enabled := Enabled;
   cbSales.Enabled := Enabled;
   cbPurchases.Enabled := Enabled;
   cbWeighing.Enabled := Enabled;
   cbToBeCulled.Enabled := Enabled;

   rbEvents.Enabled := Enabled;
   cbHeat.Enabled := Enabled;
   cbServices.Enabled := Enabled;
   cbPD.Enabled := Enabled;
   cbDryOff.Enabled := Enabled;
   cbCalving.Enabled := Enabled;

   cbRT.Enabled := ( Enabled ) or ( cbRT.Checked );
   cbNoneHerd.Enabled := ( Enabled ) or ( cbNoneHerd.Checked );
   cbAnimalsBorn.Enabled := ( Enabled ) or ( cbAnimalsBorn.Checked );

   rbStatus.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter in StatusArray );
   rbStatus.Checked := ( MenuForm.FQuickFilter in StatusArray );

   rbNotServed.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter in StatusArray );
   rbServedCount.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter in StatusArray );
   rbServedNotPD.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter in StatusArray );
   rbPregnant.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter in StatusArray );
   rbNotPregnant.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter in StatusArray );

   ShowStock.Enabled := Enabled;

   if ( FilterTable.FieldByName('ShowStock').AsBoolean ) then
      StockDate.Enabled := Enabled;

   EventDateFrom.Enabled := Enabled;
   EventDateTo.Enabled := Enabled;
   lFromDate.Enabled := Enabled;
   lToDate.Enabled := Enabled;

   cbFemale.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in SexArray) );
   cbBull.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in SexArray) );
   cbSteer.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in SexArray) );

   rbGroups.Enabled := Enabled;
   rbNotInGroup.Enabled := Enabled;

   rbBreeds.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter <> qfNone );

   gFilter.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter <> qfNone );

   gbLact.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in LactArray) );
   Label3.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in LactArray) );
   LactFrom.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in LactArray) );
   Label4.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in LactArray) );
   LactTo.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in LactArray) );

   //   06/06/13 [V5.1 R7.3] /MK Additional Feature - Allow Date of Birth filter if Home-Bred Animals is ticked.
   gbDOB.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or ( FilterTable.FieldByName('BornIntoHerd').AsBoolean );
   Label1.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or ( FilterTable.FieldByName('BornIntoHerd').AsBoolean );
   DOBFrom.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or ( FilterTable.FieldByName('BornIntoHerd').AsBoolean );
   Label2.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or ( FilterTable.FieldByName('BornIntoHerd').AsBoolean );
   DOBTo.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or ( FilterTable.FieldByName('BornIntoHerd').AsBoolean );

   rgMonthFilter.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) );
   lAgeMonthsFrom.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) );
   cmboNoOfMonthsFrom.Enabled := ( (Enabled) and (rgMonthFilter.ItemIndex > 0) ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) );
   cmboNoOfMonthsTo.Enabled := ( (Enabled) and (rgMonthFilter.ItemIndex > 0) ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) );

   rgDaysOnFarm.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or
                           ( not(WinData.ShowAllAnimals) ) or ( not(cbSales.Checked) ) or ( gbDaysOnFarm.Enabled );
   lDaysOnFarmFrom.Enabled := ( Enabled ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or
                              ( not(WinData.ShowAllAnimals) ) or ( not(cbSales.Checked) );
   dbceDaysOnFarmFrom.Enabled := ( (Enabled) and (rgDaysOnFarm.ItemIndex > 0) ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or
                                 ( not(WinData.ShowAllAnimals) ) or ( not(cbSales.Checked) );
   dbceDaysOnFarmTo.Enabled := ( (Enabled) and (rgDaysOnFarm.ItemIndex > 0) ) or ( not(MenuForm.FQuickFilter in [qfNone,qfAllAnimal,qfLeftHerd,qfBullsInUse]) ) or
                               ( not(WinData.ShowAllAnimals) ) or ( not(cbSales.Checked) );

   gbConditionScore.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   lCondScoreFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   CondScoreFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   sbCondScoreFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   LCondScoreTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   CondScoreTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   sbCondScoreTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );

   gbEBI.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   lEBIFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   EBIFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   sbEBIFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   LEBITo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   EBITo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   sbEBITo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );

   gbMilkYield.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   lMilkYieldFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   MilkYieldFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   sbMilkYieldFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   lMilkYieldTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   MilkYieldTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   sbMilkYieldTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );

   gbSCCFilter.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   lSCCFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   SCCFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   sbSCCFrom.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   lSCCTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   SCCTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   sbSCCTo.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );

   gbA1A2Results.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   lA1A2Result.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );
   cmboA1A2Result.Enabled := ( Enabled ) or ( MenuForm.FQuickFilter = qfNone );

end;

procedure TfFilters.cbRTClick(Sender: TObject);
begin
    if cbRT.Checked then
       begin
          CheckEditMode;
          FilterTable.FieldByName('AIBull').AsBoolean      := FALSE;
          FilterTable.FieldByName('BornIntoHerd').AsBoolean := FALSE;
          FilterTable.FieldByName('Retag').AsBoolean        := TRUE;
          FilterTable.FieldByName('LeftHerd').AsBoolean     := FALSE;
          FilterTable.FieldByName('NoneHerd').AsBoolean     := FALSE;
          SetCtrlState(False);
       end
    else
       SetCtrlState(True);
end;


procedure TfFilters.cbNoneHerdClick(Sender: TObject);
begin
    if cbNoneHerd.Checked then
       begin
          CheckEditMode;
          FilterTable.FieldByName('AIBull').AsBoolean      := FALSE;
          FilterTable.FieldByName('Retag').AsBoolean        := FALSE;
          FilterTable.FieldByName('LeftHerd').AsBoolean     := FALSE;
          FilterTable.FieldByName('BornIntoHerd').AsBoolean := FALSE;
          FilterTable.FieldByName('NoneHerd').AsBoolean     := TRUE;
          SetCtrlState(False);
       end
    else
       SetCtrlState(True);
end;


procedure TfFilters.dbGenGridGetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
   // SP 24/09/2002:-
{   if (dbGenGrid.DataSource.DataSet.FieldByName('Selected').AsBoolean) then
      Background := cl3DLight
   else
      Background := clWhite;   }
end;

procedure TfFilters.rbEventsClick(Sender: TObject);
begin
   // SP 24/09/2002:-
   rbEvents.Checked := True;
   rbEvents.Font.Style := [fsBold];
   rbStatus.Font.Style := [];
   ClearEventsStatus;
   pEventType.Enabled := True;
   rbStatus.Checked   := False;
   pFemStatus.Enabled := False;
   FemaleStatus := fsNone;
   FStatusWithCalvingFilter := False;
end;

procedure TfFilters.rbStatusClick(Sender: TObject);
begin
   // SP 24/09/2002:-
   rbEvents.Font.Style := [];
   rbStatus.Font.Style := [fsBold];
   ClearEventsStatus;
   pFemStatus.Enabled := True;
   rbEvents.Checked   := False;
   pEventType.Enabled := False;
   cbFemale.Checked := True;
   cbBull.Checked := False;
   cbSteer.Checked := False;
end;

procedure TfFilters.ClearEventsStatus;
begin
   // SP 24/09/2002:-
   ResetFont;
   rbNotServed.Checked := False;
   rbServedNotPD.Checked := False;
   rbNotPregnant.Checked := False;
   rbPregnant.Checked := False;
   rbServedCount.Checked := False;
   dbseServedCount.Enabled := False;
   if not FilterTable.Active then
      FilterTable.Active := True;

   with FilterTable do
      begin
         if RecordCount > 0 then
            Edit
         else
            Append;
         FieldByName('Heats').AsBoolean     := FALSE;
         FieldByName('Services').AsBoolean  := FALSE;
         FieldByName('PD').AsBoolean        := FALSE;
         FieldByName('DryingOff').AsBoolean := FALSE;
         FieldByName('Calving').AsBoolean   := FALSE;
         FieldByName('Health').AsBoolean    := FALSE;
         FieldByName('Vaccination').AsBoolean := FALSE;
         FieldByName('Sales').AsBoolean     := FALSE;
         FieldByName('Purchases').AsBoolean := FALSE;
         FieldByName('Weighing').AsBoolean  := FALSE;
         FieldByName('ToBeCulled').AsBoolean  := FALSE;
         Post;
      end;
   ClearSQLStrings;

   //   15/09/14 [V5.3 R6.2] /MK Change - Do no clear groups as filter can be added on top of selected group.
   //ClearGroups;

   CheckForEventDates;
end;

procedure TfFilters.FormShow(Sender: TObject);
begin
   WinData.LookupGroups.Active := True;
   // SP 24/09/2002:-
   if not WinData.ActiveFilter then
      begin
         rbEvents.Checked := True;
         rbEventsClick(Self);
      end;

   if ( MenuForm.FQuickFilter <> qfNone ) then
      SetCtrlState(False);

   HerdType := HerdLookup.GetHerdType(WinData.UserDefaultHerdID);
   HerdCountry := HerdLookup.CountryByHerdID(WinData.UserDefaultHerdID);

   EnableHerdOptions(HerdType);
end;

procedure TfFilters.rbInMilkClick(Sender: TObject);
begin
   // SP 24/09/2002:-
   dbseServedCount.Enabled := False;
   ResetFont;
   CheckForEventDates;
   (Sender as TRadioButton).Font.Color := clRed;
   (Sender as TRadioButton).Checked := True;
   case (Sender as TRadioButton).Tag of
      0 : FemaleStatus := fsInMilk;
      1 : FemaleStatus := fsDry;
      2 : FemaleStatus := fsNotServed;
      3 : FemaleStatus := fsServedNotPDd;
      4 : FemaleStatus := fsPregnant;
      5 : FemaleStatus := fsNotPregnant;
      6 : begin
             dbseServedCount.Enabled := True;
             FemaleStatus := fsServedCount;
          end;
   end;

   gbEventDates.Caption := 'Event Date Range:';
   FStatusWithCalvingFilter :=  ( MessageDlg('Do you want to include a calving filter?',mtConfirmation,[mbYes,mbNo],0) = mrYes );
   if ( FStatusWithCalvingFilter ) then
      begin
         FilterTable.Edit;
         FilterTable.FieldByName('Calving').AsBoolean := True;
         FilterTable.FieldByName('Services').AsBoolean := False;
         FilterTable.Post;
         ShowHideEventDatePanel(True);
         gbEventDates.Caption := 'Calving Date Range:';
      end
   else if ( not(FStatusWithCalvingFilter) and (FemaleStatus = fsServedCount) ) then
      begin
         FilterTable.Edit;
         FilterTable.FieldByName('Calving').AsBoolean := False;
         FilterTable.FieldByName('Services').AsBoolean := True;
         FilterTable.Post;
         ShowHideEventDatePanel(True);
         gbEventDates.Caption := 'Service Date Range:';
      end
   else
      begin
         FilterTable.Edit;
         FilterTable.FieldByName('Calving').AsBoolean := False;
         FilterTable.FieldByName('Services').AsBoolean := False;
         FilterTable.Post;
         ShowHideEventDatePanel(False);
         gbEventDates.Caption := 'Event Date Range:';
      end;

end;

{
procedure TfFilters.CheckStatus;
begin
   // SP 24/09/2002:-
   if not rbStatus.Checked then
      FemaleStatus := fsNone;
end;
}

procedure TfFilters.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   ResetFilters;
   FemaleStatus := fsNone; // SP 24/09/2002:- NB: Never remove. This is needed
   StockDate.Enabled := False;

   //   16/08/12 [V5.0 R8.5] /MK Change - GL asked for items to be changed to 100 instead of 48.
   for i := 1 to 100 do  cmboNoOfMonthsFrom.Properties.Items.Add(IntToStr(i));
   for i := 1 to 100 do  cmboNoOfMonthsTo.Properties.Items.Add(IntToStr(i));

end;

procedure TfFilters.ResetFont;
begin
   // SP 30/09/2002:-
   rbNotServed.Font.Color := clBlack;
   rbServedNotPD.Font.Color := clBlack;
   rbNotPregnant.Font.Color := clBlack;
   rbPregnant.Font.Color := clBlack;
   rbServedCount.Font.Color := clBlack;
end;

procedure TfFilters.SetGridSource(gsSource: TGridSource);
begin
   GridSource := gsSource; // SP 06/11/2002:-

   case gsSource of
      gsGroups : begin
                    if GridFilter <> gfGroups then
                       GridFilter := gfGroups;
                    gFilterGroupsDBTableView.DataController.DataSource := WinData.dsLookupGroups;
                    {
                    with gFilterGroupsDBTableView do
                       begin
                          DataController.DataSource := nil;
                          DataController.DataSource := dsFilterGroups;
                          DataController.Controller.FocusedRecordIndex := 0;
                       end;
                    }
                    //CreateFilterByGroup;
                    gFilterLevel.GridView := gFilterGroupsDBTableView;
                    gFilterGroupsDBTableView.Controller.FocusedRowIndex := 0;
                 end;

      gsBreeds : begin
                    if GridFilter <> gfBreeds then
                       GridFilter := gfBreeds;
                    gFilterBreedsDBTableView.DataController.DataSource := WinData.BreedsSource;
                    gFilterLevel.GridView := gFilterBreedsDBTableView;
                 end;
   end;

end;

procedure TfFilters.rbBreedsClick(Sender: TObject);
begin
   // SP 06/11/2002:-
   if ( Sender is TRadioButton ) then
      case TRadioButton(Sender).Tag of
         0 : begin
                gFilter.Visible := True;
                lNotInGroupInfo.Visible := False;
                SetGridSource(gsGroups);
             end;
         1 : begin
                gFilter.Visible := True;
                lNotInGroupInfo.Visible := False;
                SetGridSource(gsBreeds);
             end;
         2 : begin
                GridFilter := gfNotInGroup;
                gFilter.Visible := False;
                lNotInGroupInfo.Visible := True;
                WinData.FFilterByNotInGroup := rbNotInGroup.Checked;
             end;
      end;
end;

procedure TfFilters.ShowStockClick(Sender: TObject);
begin
   if ShowStock.Checked then
      StockDate.Enabled := True
   else
      StockDate.Enabled := False;
end;

procedure TfFilters.StockDateExit(Sender: TObject);
begin
   if StockDate.Date <= 0 then
      begin
         MessageDlg('Date cannot be empty, re-setting to todays date',mtWarning,[mbOK],0);
         StockDate.Date := Date;
      end
   else if StockDate.Date > Date then
      begin
         MessageDlg('Date cannot be after today, re-setting to todays date',mtWarning,[mbOK],0);
         StockDate.Date := Date;
      end
end;

procedure TfFilters.cbAnimalsBornClick(Sender: TObject);
begin
   if cbAnimalsBorn.Checked then
      begin
         CheckEditMode;
         FilterTable.FieldByName('AIBull').AsBoolean       := FALSE;
         FilterTable.FieldByName('Retag').AsBoolean        := FALSE;
         FilterTable.FieldByName('LeftHerd').AsBoolean     := FALSE;
         FilterTable.FieldByName('NoneHerd').AsBoolean     := FALSE;
         FilterTable.FieldByName('BornIntoHerd').AsBoolean := TRUE;
         SetCtrlState(False);
      end
   else
      SetCtrlState(True);
end;

procedure TfFilters.AllLactActive;
begin
   rbCurrLacts.Checked := True;
   rbAllLacts.Checked := False;
   if ( FilterTable.FieldByName('IncAllLactations').AsBoolean ) then
      try
         FilterTable.Edit;
         FilterTable.FieldByName('IncAllLactations').AsBoolean := False;
         FilterTable.Post;
      except
      end;
   {
   if ( cbHealth.Checked ) or ( cbSales.Checked ) or ( cbPurchases.Checked ) or
      ( cbWeighing.Checked ) or ( cbToBeCulled.Checked ) or ( cbVaccination.Checked ) then
      begin
         if ( not(FilterTable.FieldByName('IncAllLactations').AsBoolean) ) then
            try
               FilterTable.Edit;
               FilterTable.FieldByName('IncAllLactations').AsBoolean := True;
               FilterTable.Post;
            except
            end;
         rbAllLacts.Checked := True;
         rbCurrLacts.Checked := False;
      end
   else if ( cbHeat.Checked ) or ( cbServices.Checked ) or ( cbPD.Checked ) or
           ( cbDryOff.Checked ) or ( cbCalving.Checked ) then
      begin
         if ( FilterTable.FieldByName('IncAllLactations').AsBoolean ) then
            try
               FilterTable.Edit;
               FilterTable.FieldByName('IncAllLactations').AsBoolean := False;
               FilterTable.Post;
            except
            end;
         rbAllLacts.Checked := False;
         rbCurrLacts.Checked := True;
      end
   else
      begin
         rbAllLacts.Checked := False;
         rbCurrLacts.Checked := False;
      end;
   }
   {
   rbAllLacts.Enabled := ( cbHealth.Checked ) or ( cbSales.Checked ) or ( cbPurchases.Checked ) or
                         ( cbWeighing.Checked ) or ( cbHeat.Checked ) or ( cbServices.Checked ) or
                         ( cbPD.Checked ) or ( cbDryOff.Checked ) or ( cbCalving.Checked ) or (cbToBeCulled.Checked);
   }
end;


procedure TfFilters.CondScoreFilterActive( FActive : Boolean );
begin
   lCondScoreFrom.Enabled := FActive;
   lCondScoreTo.Enabled := FActive;
   CondScoreFrom.Enabled := FActive;
   CondScoreTo.Enabled := FActive;
   sbCondScoreFrom.Enabled := FActive;
   sbCondScoreTo.Enabled := FActive;
end;

procedure TfFilters.rgMonthFilterPropertiesChange(Sender: TObject);
begin
   if FilterTable.State in dsEditModes then
      FilterTableAgeMonthsSelected.AsInteger := rgMonthFilter.ItemIndex;
   lAgeMonthsFrom.Visible := rgMonthFilter.ItemIndex<>0;
   cmboNoOfMonthsFrom.Visible := lAgeMonthsFrom.Visible;
   lAgeMonthsFrom.Enabled := rgMonthFilter.ItemIndex<>0;
   cmboNoOfMonthsFrom.Enabled := lAgeMonthsFrom.Enabled;
   if rgMonthFilter.ItemIndex<>0 then
      begin
         if DOBFrom.Date>0 then
            DOBFrom.Clear;
         if DOBTo.Date>0 then
            DOBTo.Clear;
     end;
   lAgeMonthsTo.Visible := rgMonthFilter.ItemIndex = 3;
   cmboNoOfMonthsTo.Visible := lAgeMonthsTo.Visible;
   lAgeMonthsTo.Enabled := rgMonthFilter.ItemIndex<>0;
   cmboNoOfMonthsTo.Enabled := lAgeMonthsTo.Enabled;
   if rgMonthFilter.ItemIndex = 3 then
      lAgeMonthsFrom.Caption := 'Months From'
   else
      lAgeMonthsFrom.Caption := 'Months'
end;

procedure TfFilters.DOBFromChange(Sender: TObject);
begin
   if FilterTable.State in dsEditModes then
      begin
         if (Sender as TDBDateEdit).Date>0 then
            begin
               FilterTableAgeMonthsSelected.AsInteger := 0;
               rgMonthFilter.ItemIndex := 0;
               rgDaysOnFarm.ItemIndex := 0;
            end;
      end;
end;

procedure TfFilters.gFilterBreedsDBTableViewDblClick(Sender: TObject);
begin
    with gFilterBreedsDBTableView.DataController do
       if DataSet.RecordCount > 0 then
          begin
             DataSet.Edit;
             DataSet.FieldByName('Selected').AsBoolean := NOT ( DataSet.FieldByName('Selected').AsBoolean );
             DataSet.Post;
          end;
end;

procedure TfFilters.gFilterGroupsDBTableViewDblClick(Sender: TObject);
begin
    with gFilterGroupsDBTableView.DataController do
       if DataSet.RecordCount > 0 then
          begin
             DataSet.Edit;
             DataSet.FieldByName('Selected').AsBoolean := NOT ( DataSet.FieldByName('Selected').AsBoolean );
             DataSet.Post;
          end;

end;

procedure TfFilters.gFilterBreedsDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
   vSelected : Variant;
begin
   if Sender.Name = 'gFilterBreedsDBTableView' then
      begin
         vSelected := ARecord.Values[gFilterBreedsDBTableViewSelected.Index];
         if not VarIsNull(vSelected) then
            begin

               if (vSelected) then
                  AStyle := cxStyleSelected
               else
                  AStyle := cxStyleNormal;
            end;
      end
   else
      begin
         vSelected := ARecord.Values[gFilterGroupsDBTableViewSelected.Index];
         if not VarIsNull(vSelected) then
            begin

               if (vSelected) then
                  AStyle := cxStyleSelected
               else
                  AStyle := cxStyleNormal;
            end;
      end

end;

procedure TfFilters.gFilterGroupsDBTableViewGroupTypeGetFilterValues(
  Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
var
  Index : Integer;
begin
   AValueList.Delete(1);
//   AValueList.Find(Null, '(Custom...)', Index);
//   if Index > -1 then
//      AValueList.Delete(Index);
end;

procedure TfFilters.gFilterGroupsDBTableViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   if AColumn.Options.IncSearch then
      gFilterGroupsDBTableView.OptionsBehavior.IncSearchItem := AColumn
   else
      gFilterGroupsDBTableView.OptionsBehavior.IncSearchItem := nil;
end;

procedure TfFilters.gFilterBreedsDBTableViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   if AColumn.Options.IncSearch then
      gFilterBreedsDBTableView.OptionsBehavior.IncSearchItem := AColumn
   else
      gFilterBreedsDBTableView.OptionsBehavior.IncSearchItem := nil;
end;

procedure TfFilters.CondScoreFilterPropertiesChange(Sender: TObject);
begin
{   if Sender is TcxDBCheckBox then
      CondScoreFilterActive( (Sender as TcxDBCheckBox).Checked );}
end;

function TfFilters.GetFilterByConditionScore: Boolean;
begin
   Result := not(FilterTable.FieldByName('CondScoreFrom').IsNull and FilterTable.FieldByName('CondScoreTo').IsNull) and WinData.ActiveFilter;
end;

procedure TfFilters.CreateFilterByGroup;
var
   vFieldDef : TFieldDef;
   i,
   SelectedGroup : Integer;
begin
   mdFilterGroups := TdxMemData.Create(nil);

   SelectedGroup := 0;

   with mdFilterGroups do
      begin
         ClearMemDataFieldDefs(mdFilterGroups);

         CreateMemDataFieldDef(mdFilterGroups,'ID',ftInteger);
         CreateMemDataFieldDef(mdFilterGroups,'GroupType',ftString,20);
         CreateMemDataFieldDef(mdFilterGroups,'Code',ftString,6);
         CreateMemDataFieldDef(mdFilterGroups,'Description',ftString,30);
         CreateMemDataFieldDef(mdFilterGroups,'Selected',ftBoolean);

         mdFilterGroups.Open;
         mdFilterGroups.First;
         try
            mdFilterGroups.Insert;
            mdFilterGroups.FieldByName('ID').AsInteger := 0;
            mdFilterGroups.FieldByName('GroupType').AsString := 'n/a';
            mdFilterGroups.FieldByName('Code').AsString := 'n/a';
            mdFilterGroups.FieldByName('Description').AsString := 'Not In Any Group';

            if ( WinData.FFilterByNotInGroup ) then
               mdFilterGroups.FieldByName('Selected').AsBoolean := True
            else
               mdFilterGroups.FieldByName('Selected').AsBoolean := False;

            mdFilterGroups.Post;
         except
            on e:Exception do
              ShowMessage(e.Message);
         end;

         WinData.Groups.First;
         while not WinData.Groups.Eof do
            try
               mdFilterGroups.Append;
               mdFilterGroups.FieldByName('ID').AsInteger := WinData.Groups.FieldByName('ID').AsInteger;
               mdFilterGroups.FieldByName('GroupType').AsString := WinData.Groups.FieldByName('GroupType').AsString;
               mdFilterGroups.FieldByName('Code').AsString := WinData.Groups.FieldByName('Code').AsString;
               mdFilterGroups.FieldByName('Description').AsString := WinData.Groups.FieldByName('Description').AsString;
               mdFilterGroups.FieldByName('Selected').AsBoolean := WinData.Groups.FieldByName('Selected').AsBoolean;
               if ( mdFilterGroups.FieldByName('Selected').AsBoolean ) then
                  SelectedGroup := FieldByName('ID').AsInteger;
               mdFilterGroups.Post;
               WinData.Groups.Next;
            except
               on e:Exception do
                 ShowMessage(e.Message);
            end;
      end;

   dsFilterGroups := TDataSource.Create(nil);
   dsFilterGroups.DataSet := mdFilterGroups;

   mdFilterGroups.AfterPost := mdFilterGroupsAfterPost;

   mdFilterGroups.Locate('ID',SelectedGroup,[]);
end;

procedure TfFilters.mdFilterGroupsAfterPost(DataSet: TDataSet);
var
   GridRecordIndex : Integer;
   BookMark : TBookmark;
begin
   GridRecordIndex := -1;

   mdFilterGroups.DisableControls;
   BookMark := mdFilterGroups.GetBookmark;
   mdFilterGroups.AfterPost := nil;

   WinData.ActiveFilter := False;
   WinData.FFilterByNotInGroup := False;

   if ( mdFilterGroups.FieldByName('ID').AsInteger = 0 ) and ( mdFilterGroups.FieldByName('Selected').AsBoolean ) then
      begin
         WinData.ActiveFilter := True;
         WinData.FFilterByNotInGroup := WinData.ActiveFilter;
         mdFilterGroups.Next;
         while not mdFilterGroups.Eof do
            begin
               mdFilterGroups.Edit;
               mdFilterGroups.FieldByName('Selected').AsBoolean := False;
               mdFilterGroups.Post;
               mdFilterGroups.Next;

               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add('UPDATE '+WinData.Groups.TableName+' ');
                     SQL.Add('SET Selected = False');
                     ExecSQL;
                  finally
                     Free;
                  end;

            end;
         mdFilterGroups.First;
      end
   else if ( mdFilterGroups.FieldByName('ID').AsInteger <> 0 ) and ( mdFilterGroups.FieldByName('Selected').AsBoolean ) then
      begin
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('UPDATE '+WinData.Groups.TableName+' ');
               SQL.Add('SET Selected = True');
               SQL.Add('WHERE ID = :GroupID');
               Params[0].AsInteger := mdFilterGroups.FieldByName('ID').AsInteger;
               ExecSQL;
            finally
               Free;
            end;

         mdFilterGroups.First;
         mdFilterGroups.Edit;
         mdFilterGroups.FieldByName('Selected').AsBoolean := False;
         mdFilterGroups.Post;

         WinData.ActiveFilter := True;
      end
   else if ( mdFilterGroups.FieldByName('ID').AsInteger <> 0 ) and ( not(mdFilterGroups.FieldByName('Selected').AsBoolean) ) then
      begin
          with TQuery.Create(nil) do
             try
                DatabaseName := AliasName;
                SQL.Clear;
                SQL.Add('UPDATE '+WinData.Groups.TableName+' ');
                SQL.Add('SET Selected = False');
                SQL.Add('WHERE ID = :GroupID');
                Params[0].AsInteger := mdFilterGroups.FieldByName('ID').AsInteger;
                ExecSQL;
             finally
                Free;
             end;

          mdFilterGroups.First;
          mdFilterGroups.Edit;
          mdFilterGroups.FieldByName('Selected').AsBoolean := False;
          mdFilterGroups.Post;

          WinData.ActiveFilter := True;
      end;

   mdFilterGroups.AfterPost := mdFilterGroupsAfterPost;
   mdFilterGroups.GotoBookmark(BookMark);
   mdFilterGroups.EnableControls;
end;

procedure TfFilters.sbEBIFromBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if FilterTable.FieldByName('EBIFrom').AsInteger > 1 then
      FilterTable.FieldByName('EBIFrom').AsInteger := FilterTable.FieldByName('EBIFrom').AsInteger-1;
end;

procedure TfFilters.sbEBIFromTopClick(Sender: TObject);
begin
   CheckEditMode;
   FilterTable.FieldByName('EBIFrom').AsInteger := FilterTable.FieldByName('EBIFrom').AsInteger+1;
   if FilterTable.FieldByName('EBITo').AsInteger < FilterTable.FieldByName('EBIFrom').AsInteger then
      FilterTable.FieldByName('EBITo').AsInteger := FilterTable.FieldByName('EBIFrom').AsInteger;
end;

procedure TfFilters.sbEBIToBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('EBITo').AsInteger > 0 ) And
      ( FilterTable.FieldByName('EBITo').AsInteger > FilterTable.FieldByName('EBIFrom').AsInteger ) then
      FilterTable.FieldByName('EBITo').AsInteger := FilterTable.FieldByName('EBITo').AsInteger-1;
end;

procedure TfFilters.sbEBIToTopClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('EBITo').AsInteger >= FilterTable.FieldByName('EBIFrom').AsInteger ) then
      FilterTable.FieldByName('EBITo').AsInteger := FilterTable.FieldByName('EBITo').AsInteger+1;
end;

function TfFilters.GetFilterByEBI: Boolean;
begin
   Result := not(FilterTable.FieldByName('EBIFrom').IsNull and FilterTable.FieldByName('EBITo').IsNull) and WinData.ActiveFilter;
end;

procedure TfFilters.EBIFromPropertiesEditValueChanged(Sender: TObject);
begin
   EBIFrom.PostEditValue;
end;

procedure TfFilters.EBIToPropertiesEditValueChanged(Sender: TObject);
begin
   EBITo.PostEditValue;
end;

procedure TfFilters.EnableHerdOptions(AHerdType : THerdType);
var
   IsBeefHerd : Boolean;
   RadioGroupItem : TcxRadioGroupItem;
begin
   IsBeefHerd := AHerdType = htBeef;

   gbOther.Visible := not(IsBeefHerd);
   rgStatus.Visible := not(IsBeefHerd);
   gbBreedingEvents.Visible := not(IsBeefHerd);
   gbLact.Visible := not(IsBeefHerd);
   gbConditionScore.Visible := not(IsBeefHerd);
   gbEBI.Visible := not(IsBeefHerd);
   gbDaysOnFarm.Visible := IsBeefHerd;
   gbEventLactations.Visible := not(IsBeefHerd);
   rbCurrLacts.Visible := not(IsBeefHerd);
   rbAllLacts.Visible := not(IsBeefHerd);
   gbSCCFilter.Visible := not(IsBeefHerd);
   gbA1A2Results.Visible := not(IsBeefHerd);

   //gFilter.Top := gbEventDates.Top + gbEventDates.Height + 6;

   cbToBeCulled.Visible := ( not(IsBeefHerd) );
   if ( IsBeefHerd ) then
      begin
         rbLastTestYield.Visible := False;
         rbRatCalcAvgDailyYield.Visible := False;

         gbDOB.Height := 125;
         gbSex.Height := gbDOB.Height;

         gbDOB.Left := 139;
         Panel1.Height := 130;

         gbOtherEvents.Height := 124;
         gbOtherEvents.Top := 0;

         Panel2.Align := alLeft;
         Panel2.Width := 135;

         Panel3.Align := alClient;
         gbEventDates.Parent := Panel3;
         gbEventDates.Left := 5;
         gbEventDates.Top := 0;

         gbFilterBy.Top := 50;
         gbFilterBy.Left := 5;

         gFilter.Align := alNone;
         gFilter.Height := 130;
         gFilter.Left := 5;
         gFilter.Top := 106;
         gFilter.Width := 496;

         lNotInGroupInfo.Top := gbFilterBy.Top+55;
         lNotInGroupInfo.Left := 55;

         gbDOB.Width := 347;
         Bevel2.Width := 347;
         DOBFrom.Left := 51;
         DOBFrom.Width := 122;
         Label2.Left := 187;
         DOBTo.Left := 212;
         DOBTo.Width := 122;

         gbDaysOnFarm.Left := gbDOB.Left + gbDOB.Width + 7;
         gbDaysOnFarm.Top := gbDOB.Top;

         cmboNoOfMonthsFrom.Left := 200;
         lAgeMonthsFrom.Left := cmboNoOfMonthsFrom.Left-2;
         cmboNoOfMonthsFrom.Top := 61;
         lAgeMonthsTo.Left := lAgeMonthsFrom.Left;
         lAgeMonthsTo.Top := 81;
         cmboNoOfMonthsTo.Left := cmboNoOfMonthsFrom.Left;
         cmboNoOfMonthsTo.Top := 98;

         rgMonthFilter.Left := 42;

         ErrorMsg.Align := alBottom;

         if uWinOS.WindowsOS in [WinVista,Windows7] then
            Width := 666
         else
            Width := 660;

         Height := 482;
      end
   else
      begin
         gbSex.Height := 98;

         gbDOB.Height := 125;
         gbDOB.Left := 445;
         Panel1.Height := 106;

         gbOtherEvents.Height := 148;
         gbOtherEvents.Top := 48;

         Panel2.Align := alClient;

         Panel3.Align := alNone;
         Panel3.Top := 358;
         Panel3.Left := 6;
         Panel3.Height := 202;
         gbEventDates.Parent := Panel3;
         gbEventDates.SendToBack;
         gFilter.Height := 146;
         gFilter.Left := 5;
         gFilter.Top := 54;
         gFilter.Width := 424;
         lNotInGroupInfo.Top := gbFilterBy.Top+55;
         lNotInGroupInfo.Left := 76;

         gbDOB.Width := 265;
         Bevel2.Width := 262;
         Label1.Left := 11;
         DOBFrom.Left := 43;
         DOBFrom.Width := 96;
         Label2.Left := 142;
         DOBTo.Left := 158;
         DOBTo.Width := 96;

         lAgeMonthsFrom.Left := 154;
         lAgeMonthsFrom.Top := 45;
         cmboNoOfMonthsFrom.Left := 156;
         cmboNoOfMonthsFrom.Top := 61;
         lAgeMonthsTo.Left := lAgeMonthsFrom.Left;
         lAgeMonthsTo.Top := 81;
         cmboNoOfMonthsTo.Left := cmboNoOfMonthsFrom.Left;
         cmboNoOfMonthsTo.Top := 98;

         rgMonthFilter.Left := 32;

         if ( HerdType = htSuckler ) then
            gbEBI.Caption := 'Mat. Index'
         else if ( not(HerdCountry in [Ireland, NIreland]) ) then
            gbEBI.Caption := 'SCI'
         else
            gbEBI.Caption := 'EBI';

         ErrorMsg.Align := alBottom;

         Height := 614;

         if uWinOS.WindowsOS in [WinVista,Windows7] then
            Width := 735
         else
            Width := 729;
      end;
end;

procedure TfFilters.sbMilkYieldFromBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if FilterTable.FieldByName('MilkYieldFrom').AsFloat > 1 then
      FilterTable.FieldByName('MilkYieldFrom').AsFloat := FilterTable.FieldByName('MilkYieldFrom').AsFloat-1;
end;

procedure TfFilters.sbMilkYieldFromTopClick(Sender: TObject);
begin
   CheckEditMode;
   FilterTable.FieldByName('MilkYieldFrom').AsFloat := FilterTable.FieldByName('MilkYieldFrom').AsFloat+1;
   if FilterTable.FieldByName('MilkYieldTo').AsFloat < FilterTable.FieldByName('MilkYieldFrom').AsFloat then
      FilterTable.FieldByName('MilkYieldTo').AsFloat := FilterTable.FieldByName('MilkYieldFrom').AsFloat;
end;

procedure TfFilters.sbMilkYieldToBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('MilkYieldTo').AsFloat > 0 ) And
      ( FilterTable.FieldByName('MilkYieldTo').AsFloat > FilterTable.FieldByName('MilkYieldFrom').AsFloat ) then
      FilterTable.FieldByName('MilkYieldTo').AsFloat := FilterTable.FieldByName('MilkYieldFrom').AsFloat-1;
end;

procedure TfFilters.sbMilkYieldToTopClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('MilkYieldTo').AsFloat >= FilterTable.FieldByName('MilkYieldFrom').AsFloat ) then
      FilterTable.FieldByName('MilkYieldTo').AsFloat := FilterTable.FieldByName('MilkYieldTo').AsFloat+1;
end;

procedure TfFilters.MilkYieldFromPropertiesEditValueChanged(
  Sender: TObject);
begin
   MilkYieldFrom.PostEditValue;
end;

procedure TfFilters.MilkYieldToPropertiesEditValueChanged(Sender: TObject);
begin
   MilkYieldTo.PostEditValue;
end;

function TfFilters.GetFilterByMilkYield: Boolean;
begin
   Result := not(FilterTable.FieldByName('MilkYieldFrom').IsNull and FilterTable.FieldByName('MilkYieldTo').IsNull) and
             ( FilterTable.FieldByName('MilkYieldFilter').AsBoolean ) and WinData.ActiveFilter;
end;

procedure TfFilters.rbLastTestYieldClick(Sender: TObject);
begin
   if ( rbRatCalcAvgDailyYield.Checked ) then
      rbRatCalcAvgDailyYield.Checked := False;
   rbLastTestYield.Checked := True;
   rbEventsClick(Sender);
end;

procedure TfFilters.rbRatCalcAvgDailyYieldClick(Sender: TObject);
begin
   if ( rbLastTestYield.Checked ) then
      rbLastTestYield.Checked := False;
   rbRatCalcAvgDailyYield.Checked := True;
   rbEventsClick(Sender);
end;

function TfFilters.GetFilterByRatCalcMilkYield: Boolean;
begin
   Result := not(FilterTable.FieldByName('MilkYieldFrom').IsNull and FilterTable.FieldByName('MilkYieldTo').IsNull) and
             ( FilterTable.FieldByName('RatCalcMilkYieldFilter').AsBoolean ) and WinData.ActiveFilter;
end;

procedure TfFilters.ResetAllSpinButtonFilters;
begin
   if ( not(WinData.ActiveFilter) ) then
      begin
         FilterTable.Edit;
         FilterTable.FieldByName('CondScoreFrom').Clear;
         FilterTable.FieldByName('CondScoreTo').Clear;
         FilterTable.FieldByName('CondScoreFilter').AsBoolean  := FALSE;
         FilterTable.FieldByName('EBIFrom').Clear;
         FilterTable.FieldByName('EBITo').Clear;
         FilterTable.FieldByName('EBIFilter').AsBoolean  := FALSE;
         FilterTable.FieldByName('MilkYieldFrom').Clear;
         FilterTable.FieldByName('MilkYieldTo').Clear;
         FilterTable.FieldByName('MilkYieldFilter').AsBoolean := FALSE;
         FilterTable.FieldByName('RatCalcMilkYieldFilter').AsBoolean := FALSE;
         FilterTable.FieldByName('OverallGainPerDayFrom').Clear;
         FilterTable.FieldByName('OverallGainPerDayTo').Clear;
         FilterTable.FieldByName('OverallGainPerDayFilter').AsBoolean := False;
         FilterTable.FieldByName('SCCFrom').Clear;
         FilterTable.FieldByName('SCCTo').Clear;
         FilterTable.FieldByName('SCCFilter').AsBoolean := FALSE;
         FilterTable.Post;
      end;
end;

procedure TfFilters.SetFilterByMilkYieldType;
begin
   if ( MilkYieldFrom.Value > 0 ) or ( MilkYieldTo.Value > 0 ) then
      begin
         FilterTable.Edit;
         FilterTable.FieldByName('MilkYieldFilter').AsBoolean := rbLastTestYield.Checked;
         FilterTable.FieldByName('RatCalcMilkYieldFilter').AsBoolean := rbRatCalcAvgDailyYield.Checked;
         FilterTable.Post;
      end;
end;

procedure TfFilters.ShowHideEventDatePanel(AShow : Boolean);
begin
   gbEventDates.Visible := AShow;
   if ( HerdType <> htBeef ) then
      begin
         if ( AShow ) then
            begin
               gbEventDates.BringToFront;
               gbFilterBy.Top := 50;
               gFilter.Top := 107;
               gFilter.Height := 97;
               lNotInGroupInfo.Top := gbFilterBy.Top+55;
            end
         else
            begin
               gbEventDates.SendToBack;
               gbFilterBy.Top := 0;
               gFilter.Top := 58;
               gFilter.Height := 146;
               lNotInGroupInfo.Top := gbFilterBy.Top+55;
            end
      end
   else
      begin
         if ( AShow ) then
            gbEventDates.Font.Color := clBlack
         else
            gbEventDates.Font.Color := clScrollBar;
         gbEventDates.Enabled := AShow;
         lFromDate.Enabled := AShow;
         EventDateFrom.Enabled := AShow;
         lToDate.Enabled := AShow;
         EventDateTo.Enabled := AShow;
      end;
end;

procedure TfFilters.rgDaysOnFarmPropertiesChange(Sender: TObject);
begin
   rgDaysOnFarm.Enabled := ( not(WinData.ShowAllAnimals) );
   if ( cbSales.Checked ) then
      rgDaysOnFarm.Enabled := ( not(cbSales.Checked) );
   if ( FilterTable.State in dsEditModes ) then
      FilterTableDaysOnFarmFilterSelected.AsInteger := rgDaysOnFarm.ItemIndex;
   lDaysOnFarmFrom.Visible := rgDaysOnFarm.ItemIndex <> 0;
   dbceDaysOnFarmFrom.Visible := lDaysOnFarmFrom.Visible;
   sbDaysOnFarmFrom.Visible := dbceDaysOnFarmFrom.Visible;
   lDaysOnFarmFrom.Enabled := rgDaysOnFarm.ItemIndex <> 0;
   dbceDaysOnFarmFrom.Enabled := rgDaysOnFarm.Enabled;
   if ( rgDaysOnFarm.ItemIndex <> 0 ) then
      begin
         if DOBFrom.Date > 0 then
            DOBFrom.Clear;
         if DOBTo.Date > 0 then
            DOBTo.Clear;
     end;
   lDaysOnFarmTo.Visible := rgDaysOnFarm.ItemIndex = 3;
   dbceDaysOnFarmTo.Visible := lDaysOnFarmTo.Visible;
   sbDaysOnFarmTo.Visible := dbceDaysOnFarmTo.Visible;
   lDaysOnFarmTo.Enabled := rgDaysOnFarm.ItemIndex <> 0;
   dbceDaysOnFarmTo.Enabled := lDaysOnFarmTo.Enabled;
   if ( rgDaysOnFarm.ItemIndex = 0 ) and
      ( (FilterTable.FieldByName('DaysOnFarmFrom').AsInteger > 0) or (FilterTable.FieldByName('DaysOnFarmTo').AsInteger > 0) ) then
      begin
         if ( FilterTable.FieldByName('DaysOnFarmFrom').AsInteger > 0 ) then
            FilterTable.FieldByName('DaysOnFarmFrom').AsInteger := 0;
         if ( FilterTable.FieldByName('DaysOnFarmTo').AsInteger > 0 ) then
            FilterTable.FieldByName('DaysOnFarmTo').AsInteger := 0
      end
   else if ( rgDaysOnFarm.ItemIndex in [1,2] ) and ( FilterTable.FieldByName('DaysOnFarmTo').AsInteger > 0 ) then
      FilterTable.FieldByName('DaysOnFarmTo').AsInteger := 0
   else if ( rgDaysOnFarm.ItemIndex = 3 ) and ( FilterTable.FieldByName('DaysOnFarmFrom').AsInteger > 0 ) then
      FilterTable.FieldByName('DaysOnFarmTo').AsInteger := FilterTable.FieldByName('DaysOnFarmFrom').AsInteger;
end;

procedure TfFilters.sbDaysOnFarmFromBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if FilterTable.FieldByName('DaysOnFarmFrom').AsFloat > 1 then
      FilterTable.FieldByName('DaysOnFarmFrom').AsFloat := FilterTable.FieldByName('DaysOnFarmFrom').AsFloat-1;
end;

procedure TfFilters.sbDaysOnFarmFromTopClick(Sender: TObject);
begin
   CheckEditMode;
   FilterTable.FieldByName('DaysOnFarmFrom').AsFloat := FilterTable.FieldByName('DaysOnFarmFrom').AsFloat+1;
   if FilterTable.FieldByName('DaysOnFarmTo').AsFloat < FilterTable.FieldByName('DaysOnFarmFrom').AsFloat then
      FilterTable.FieldByName('DaysOnFarmTo').AsFloat := FilterTable.FieldByName('DaysOnFarmFrom').AsFloat;
end;

procedure TfFilters.sbDaysOnFarmToBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('DaysOnFarmTo').AsFloat > 0 ) And
      ( FilterTable.FieldByName('DaysOnFarmTo').AsFloat > FilterTable.FieldByName('DaysOnFarmFrom').AsFloat ) then
      FilterTable.FieldByName('DaysOnFarmTo').AsFloat := FilterTable.FieldByName('DaysOnFarmFrom').AsFloat-1;
end;

procedure TfFilters.sbDaysOnFarmToTopClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('DaysOnFarmTo').AsFloat >= FilterTable.FieldByName('DaysOnFarmFrom').AsFloat ) then
      FilterTable.FieldByName('DaysOnFarmTo').AsFloat := FilterTable.FieldByName('DaysOnFarmTo').AsFloat+1;
end;

procedure TfFilters.dbceDaysOnFarmFromPropertiesEditValueChanged(
  Sender: TObject);
begin
   dbceDaysOnFarmFrom.PostEditValue;
end;

procedure TfFilters.dbceDaysOnFarmToPropertiesEditValueChanged(
  Sender: TObject);
begin
   dbceDaysOnFarmTo.PostEditValue;
end;

procedure TfFilters.rbCurrLactsClick(Sender: TObject);
begin
   rbCurrLacts.Checked := True;
   rbAllLacts.Checked := False;
   if ( FilterTable.FieldByName('IncAllLactations').AsBoolean ) then
      try
         FilterTable.Edit;
         FilterTable.FieldByName('IncAllLactations').AsBoolean := False;
         FilterTable.Post;
      except
      end;
end;

procedure TfFilters.rbAllLactsClick(Sender: TObject);
begin
   rbCurrLacts.Checked := False;
   rbAllLacts.Checked := True;
   if ( not(FilterTable.FieldByName('IncAllLactations').AsBoolean) ) then
      try
         FilterTable.Edit;
         FilterTable.FieldByName('IncAllLactations').AsBoolean := True;
         FilterTable.Post;
      except
      end;
end;

procedure TfFilters.sbOverallGainFromBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat > 1 then
      FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat := FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat-1;
end;

procedure TfFilters.sbOverallGainFromTopClick(Sender: TObject);
begin
   CheckEditMode;
   FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat := FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat+1;
   if FilterTable.FieldByName('OverallGainPerDayTo').AsFloat < FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat then
      FilterTable.FieldByName('OverallGainPerDayTo').AsFloat := FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat;
end;

procedure TfFilters.sbOverallGainToBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('OverallGainPerDayTo').AsFloat > 0 ) And
      ( FilterTable.FieldByName('OverallGainPerDayTo').AsFloat > FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat ) then
      FilterTable.FieldByName('OverallGainPerDayTo').AsFloat := FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat-1;
end;

procedure TfFilters.sbOverallGainToTopClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('OverallGainPerDayTo').AsFloat >= FilterTable.FieldByName('OverallGainPerDayFrom').AsFloat ) then
      FilterTable.FieldByName('OverallGainPerDayTo').AsFloat := FilterTable.FieldByName('OverallGainPerDayTo').AsFloat+1;
end;

function TfFilters.GetFilterByOverallGainPerDay: Boolean;
begin
   Result := not(FilterTable.FieldByName('OverallGainPerDayFrom').IsNull and FilterTable.FieldByName('OverallGainPerDayTo').IsNull) and
             ( FilterTable.FieldByName('OverallGainPerDayFilter').AsBoolean ) and WinData.ActiveFilter;
end;

procedure TfFilters.SetFilterByOverallGainPerDay;
begin
   if ( OverallGainPerDayFrom.Value > 0 ) or ( OverallGainPerDayTo.Value > 0 ) then
      begin
         FilterTable.Edit;
         FilterTable.FieldByName('OverallGainPerDayFilter').AsBoolean := True;
         FilterTable.Post;
      end;
end;

procedure TfFilters.OverallGainPerDayFromPropertiesEditValueChanged(
  Sender: TObject);
begin
   OverallGainPerDayFrom.PostEditValue;
end;

procedure TfFilters.OverallGainPerDayToPropertiesEditValueChanged(
  Sender: TObject);
begin
   OverallGainPerDayTo.PostEditValue;
end;

function TfFilters.GetBreedingSelected: Boolean;
var
   i : Integer;
begin
   Result := FALSE;
   for i := 0 to pEventType.ControlCount-1 do
      if ( pEventType.Controls[i] is TcxDBCheckBox ) then
         if ( pEventType.Controls[i] as TcxDBCheckBox ).Checked then
            Result := TRUE;
end;

procedure TfFilters.sbCondScoreFromBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if FilterTable.FieldByName('CondScoreFrom').AsInteger > 1 then
      FilterTable.FieldByName('CondScoreFrom').AsInteger := FilterTable.FieldByName('CondScoreFrom').AsInteger-1;
end;

procedure TfFilters.sbSCCFromBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if FilterTable.FieldByName('SCCFrom').AsInteger > 1 then
      FilterTable.FieldByName('SCCFrom').AsInteger := FilterTable.FieldByName('SCCFrom').AsInteger-1;
end;

procedure TfFilters.sbCondScoreFromTopClick(Sender: TObject);
begin
   CheckEditMode;
   FilterTable.FieldByName('CondScoreFrom').AsInteger := FilterTable.FieldByName('CondScoreFrom').AsInteger+1;
   if FilterTable.FieldByName('CondScoreTo').AsInteger < FilterTable.FieldByName('CondScoreFrom').AsInteger then
      FilterTable.FieldByName('CondScoreTo').AsInteger := FilterTable.FieldByName('CondScoreFrom').AsInteger;
end;

procedure TfFilters.sbSCCFromTopClick(Sender: TObject);
begin
   CheckEditMode;
   FilterTable.FieldByName('SCCFrom').AsInteger := FilterTable.FieldByName('SCCFrom').AsInteger+1;
   if FilterTable.FieldByName('SCCTo').AsInteger < FilterTable.FieldByName('SCCFrom').AsInteger then
      FilterTable.FieldByName('SCCTo').AsInteger := FilterTable.FieldByName('SCCFrom').AsInteger;
end;

procedure TfFilters.sbCondScoreToBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('CondScoreTo').AsInteger > 0 ) And
      ( FilterTable.FieldByName('CondScoreTo').AsInteger > FilterTable.FieldByName('CondScoreFrom').AsInteger ) then
      FilterTable.FieldByName('CondScoreTo').AsInteger := FilterTable.FieldByName('CondScoreTo').AsInteger-1;
end;

procedure TfFilters.sbSCCToBottomClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('SCCTo').AsInteger > 0 ) And
      ( FilterTable.FieldByName('SCCTo').AsInteger > FilterTable.FieldByName('SCCFrom').AsInteger ) then
      FilterTable.FieldByName('SCCTo').AsInteger := FilterTable.FieldByName('SCCTo').AsInteger-1;
end;

procedure TfFilters.sbCondScoreToTopClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('CondScoreTo').AsInteger >= FilterTable.FieldByName('CondScoreFrom').AsInteger ) then
      FilterTable.FieldByName('CondScoreTo').AsInteger := FilterTable.FieldByName('CondScoreTo').AsInteger+1;
end;

procedure TfFilters.sbSCCToTopClick(Sender: TObject);
begin
   CheckEditMode;
   if ( FilterTable.FieldByName('SCCTo').AsInteger >= FilterTable.FieldByName('SCCFrom').AsInteger ) then
      FilterTable.FieldByName('SCCTo').AsInteger := FilterTable.FieldByName('SCCTo').AsInteger+1;
end;

procedure TfFilters.SCCFromPropertiesEditValueChanged(Sender: TObject);
begin
   SCCFrom.PostEditValue;
end;

procedure TfFilters.SCCToPropertiesEditValueChanged(Sender: TObject);
begin
   SCCTo.PostEditValue;
end;

function TfFilters.GetFilterBySCC: Boolean;
begin
   Result := not(FilterTable.FieldByName('SCCFrom').IsNull and FilterTable.FieldByName('SCCTo').IsNull) and
             ( FilterTable.FieldByName('SCCFilter').AsBoolean ) and WinData.ActiveFilter;
end;

procedure TfFilters.SetFilterBySCC;
begin
   if ( SCCFrom.Value > 0 ) or ( SCCTo.Value > 0 ) then
      begin
         FilterTable.Edit;
         FilterTable.FieldByName('SCCFilter').AsBoolean := True;
         FilterTable.Post;
      end;
end;

function TfFilters.GetFilterByA1A2Result: Boolean;
begin
   Result := ( Length(FilterTable.FieldByName('A1A2Result').AsString) > 0 );
end;

end.
