{
  NB:!! ONLY call this screen by ShowForm.

  -----------------------------------------------------------------------------
  *****************************************************************************
  -----------------------------------------------------------------------------
  SP 26/09/2002:-
  procedure sbPedDetailsClick;

  If Not Images Dir Exists then create it!

  V3.5 R9.1
  SP 26/09/2002.
  -----------------------------------------------------------------------------
  *****************************************************************************
  -----------------------------------------------------------------------------
  SP 21/10/2002:-

  After posting data, reset set focus to animal no.

  SP 21/10/2002.
  -----------------------------------------------------------------------------
  *****************************************************************************
  -----------------------------------------------------------------------------
  SP 22/11/2002:-

  procedure CurrFertCalcs()
  sgBullings and sgServices are cleared before data is wrote to grids.
                                        Update;

  procedure PastCalfCalcs();
  sgPastCalf cleared before data is wrote to it.

  SP 22/11/2002.
  -----------------------------------------------------------------------------
  *****************************************************************************
  -----------------------------------------------------------------------------

  08/01/2009 V3.9 R5.8 /SP Additional Feature - SendHUKNotification;

  28/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user reconcile ancestry data with HUK

  01/07/10 [V4.0 R3.9] /MK Additional Feature - New Field In SetupAnimals called UKAISireCode.
                                                Only Show for UKHerd.
                                                Changed Caption of Label1 to AI Sire Code where its Test Bull.

  08/03/11 [V4.0 R8.6] /MK Change - Changed AnimalBreed ListFieldIndex To 0 So Type Search Is Based On Breed Code.

  26/04/11 [V4.0 R9.8] /MK Additional Feature - Changed Dairy Tab To Dairy Indeces.

  04/05/11 [V4.0 R9.9] /MK Change - OnFormShow And SexComboChange If Steer Then Breeding and Pedgiree Is Not Visible.
                                  - If Sex Changed To Bull Then Breeding Is Checked Automatically.
                                  - If TAnimalType = Purchasing Animal Then NatIDMask Is Set To Blank Country Mask.

  21/06/11 [V4.1 R2.0] /MK Bug Fix - Set HoldLactInfo As Not Active After AnimalPrint.ShowModal.
  21/06/11 [V4.1 R2.0] /MK Change  - qHealth - Only Show Health/DryOff Events If Medicine Exists In Health Table.

  06/10/11 [V5.0 R1.2] /MK Additional Feature - Add Zero Lact Services To HoldLactInfo Table First.

  07/10/11 [V5.0 R1.3] /MK Additional Feature - Added SireNo and SireBreed To Calf Performance.
                                              - Changed Size of Birth Type In Calf Performance.
                                              - Changed Size of Birth Type & Service Type In Fertility History.

  10/10/11 [V5.0 R1.3] /MK Additional Feature - Add Service Bull And Service Type For Zero Lact Services.

  11/10/11 [V5.0 R1.3] /MK Additional Feature - AnimalPrint - lPedigree, lPedigree1 and lPedigree2 Were Not Looking At WinData.AnimalFileByID.

  17/10/11 [V5.0 R1.5] /MK Additional Feature - Changed Look Of AnimalPages PageControl.

  24/11/11 [V5.0 R2.2] /MK Additional Feature - SetupAnimals - Fixed New DBLookupDrowDownBox For SiresDB.

  09/02/12 [V5.0 R3.7] /MK Change - DisplayInHerdField - Normal Logic + Only If Herd <> NoneHerd.

  13/03/12 [V5.0 R4.4] /MK Additional Feature - New Label And DBDateEdit Components Added For BVDDate.

  30/08/12 [V5.0 R8.7] /MK Bug Fix - AnimalPages.OnPageChanging - On tsCurrFert HoldLactInfo table was not being refreshed.

  17/01/13 [V5.1 R3.8] /MK Additional Feature - Added cxDBLookupCombo's for Dam and ETDam.

  04/06/13 [V5.1 R7.3] /MK Additional Feature - Added Quality Assured dbCheckBox for Beef Herd with BeefMan Module.
                                              - New Quality Assured labels added to AnimalPrint.

  20/06/13 [V5.1 R7.5] /MK Change - SexComboChange - If user changes animal sex from female to bull and animal has lactno
                                                     greater than 0 then do not allow the sex to be changed.

  12/08/13 [V5.1 R9.1] /MK Change - Always show ETDam regardless of pedigree module - GL request.

  11/09/13 [V5.2 R1.2] /MK Additional Feature - Added Feed Events tab. Only visible for Beef Herd with Beef Management module.

  12/09/13 [V5.2 R1.2] /MK Change - Print Steer report for all sex types if Beef Herd and Beef Management module
                                    as Feed Events section only added to Steer Report. if Beef Herd and Beef Management module
                                    only Health and Feed Events matter.

  09/12/13 [V5.2 R6.8] /MK Bug Fix - ShowForm - Only show HUKI if Pedigree and NIreland/English herd.
  20/01/14 [V5.2 R7.5] /MK Change - DOBExit - Check to see whether the changed date of birth is different than the
                                              the calves dam's date of calving and show warning.

  29/01/14 [V5.2 R7.8] /MK Change - Changed label of Calving Index to Calving Interval - GL Request.                                              

  04/02/14 [V5.2 R7.9] /MK Additional Feature - Before Dam drop-down-list appears check to see whether the dam was calved with this
                                                calf and give an error to explain to the user to delete the calving for the dam.

  12/02/14 [V5.2 R8.2] /MK Bug Fix - Only show DonorDamID fields if calf is from a calving event that used an Embryo Transfer event.
                                   - Show error if user tries to save the Donor Dam ID as the Dam ID.

  18/02/14 [V5.2 R8.3] /MK Change - Set DOB to read only if calf is from a calving event of dam - WinData.IsCalvesCalvedDam.
                                  - If DOB is read only then DOB.OnEnter gives an error to tell the user to change the calving
                                    date in the Calving Event of the dam.

  20/03/14 [V5.2 R9.0] /MK Change - SexComboChange - If Beef Herd then only show Brucellosis Date if Animal Sex is Female - GL/Joan Foley.

  28/03/14 [V5.2 R9.2] /MK Bug Fix - CowFamily was hiding the Electronic ID fields for AI Bulls.

  17/06/14 [V5.3 R2.8] /MK Change - Only show dbcbQualityAssured if Irish Beef Herd with Beef Management.
                                  - NIreland herd uses PurchFQAS boolean from Purchase event on the main grid instead of Quality Assured field in Animals table.

  26/09/14 [V5.3 R6.4] /MK Change - qHealth - Added Vaccination EventType to SQL as Vaccination events were missing from Health tab.

  26/11/14 [V5.4 R0.1] /MK Bug Fix - Default DOB.ReadOnly to False. DOB.ReadOnly = True where the user is editing the animal and
                                     the animal was not added to the herd from a cow calving event.

  01/12/14 [V5.4 R0.2] /MK Additional Feature - SetGridFooters - Added Footers for Solids and SCC - Brendan Meade request.

  04/12/14 [V5.4 R0.3] /MK Additional Feature - Added AAAScores1,2&3 fields to the Pedigree tab - Philip Cusack/GL Request.

  08/05/15 [V5.4 R5.5] /MK Additional Feature - Added EndDate and NoDays to tsFeedBreakdown - GL/L.Clerkin request.

  11/08/15 [V5.4 R7.2] /MK Change - CurrFertCalcs - WinData.GetProjCalving was being used twice,
                                    once to see if value is greater than zero and a second time to assign text of string field.

  26/11/15 [V5.5 R1.3] /MK Change - tsMilkSheet - dbgMilk - Added AVG and SUM footer records to the all kg values and removed SCC footer - GL/Brendan Meade (6980) request.
                                  - SetGridFooters - Added footers for all kg values and removed SCC footer - GL/Brendan Meade (6980) request.

  22/03/16 [V5.5 R5.4] /MK Change - SetGridFooters - Added Average and Total footers for SCC fields in Lactation Summary grid - GL request.
                                  - CreateFooter - Check to see if field is ButterFat or Protein from Lactation Summary or Monthly Recording grid
                                                   and only show 2 decimal places for these fields. All other field should not be showing decimals - GL request.
                                  - FormActivate - SetGridFooters for Monthly Recording grid.

  13/02/17 [V5.6 R4.5] /MK Bug Fix - BFat, Prot for 305 and Cummulative Yield Display Format should show 2 decimal places - SP request.

  02/03/17 [V5.6 R6.5] /MK Change - Do not show sbDelete and ToolButton3 buttons anymore unless Ancestry screen is showing and the image tab is selected - GL/SP request.
                                  - Can't make speedbuttons visible/not visible in code so have to change width and caption of button and toolbutton.

  14/09/17 [V5.7 R3.0] /MK Change - Changed WinData.AddToGroup to WinData.GroupManager.AddToGroup for more accurate calculation of FeedAllocation date based on purchase/birth date.

  06/10/17 [V5.7 R3.6] /MK Additional Feature - Added column to Feed Events for Total Cost and added a footer to the grid to sum Total Cost.

  08/11/17 [V5.7 R4.4] /MK Additional Feature - Added Meat and Milk Withdrawal dates to the health tab - TGM/Red Tractor.     

  15/11/17 [V5.7 R4.6] /MK Additional Feature - Added calculated field and column for individual cost of treatment - Laurence Clerkin * No need for print out yet - GL *

  23/11/17 [V5.7 R5.7] /MK Additional Feature - Changed Health grid to cxGrid to allow a footer to be added below the cost column - Laurence Clerkin.

  21/01/19 [V5.8 R6.3] /MK Bug Fix - FormActivate - If BullSemenStk in Insert mode then default BullSemenStk.InUse to True.
                                                    InUse is set to false sometimes when you open the SetupAnimals, close and re-open it - SP.

  18/04/19 [V5.8 R8.9] /MK Change - FormActivate - Added check for atNonHerdDam to then default sex to Female.

  25/11/20 [V5.9 R7.6] /MK Change - SetMilkDiskGridDisplayColumns - Default to Cummulative Yield.

  08/07/21 [V6.0 R1.6] /MK Change - CreateFooter - Created a ftNone FooterType that allows the Footer.Text to be set to nothing.
                                                 - Remove averaging SCC columns in individual recording section of Animal Record screen - GL request.
}

unit SetUpAnimals;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, StdCtrls, Mask, ComCtrls, Buttons, Grids, DBGrids,
  RXLookup, ToolEdit, RXDBCtrl, RXCtrls, DBTables,DB, GenTypesConst,
  ToolWin, kwDBNavigator, ExtDlgs, FileCtrl, TB97Ctls, TB97,
  TB97Tlbr, RxDBComb, DBGridEh, DBCtrlsEh, Menus,
  DBLookupEh, CurrEdit, cxSplitter, cxPC, cxControls, dxmdaset, cxButtons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, jpeg, cxContainer, cxEdit, cxImage,
  cxGridChartView, cxGridDBChartView, TeEngine, Series, TeeProcs, Chart,
  DBChart, dxPSCore, dxPScxCommon, dxPScxGridLnk, dxPSGraphicLnk,
  dxPSTCLnk, dxPSDBTCLnk, cxRadioGroup, ActnList, cxTextEdit, cxMemo,
  cxDBEdit, LMDWebBase, LMDMapi, KRxSpeedButton, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGraphics, cxCustomData, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ChkDebug,
  uHerdLookup;

type
  TAncestryFieldArray = Array [0..3] of TDBEdit;
  tAnimalSet = ( UnKnown, FemaleDairy, FemaleBeef, Beef, BeefAI, FemaleSuckler, FemalePedigree );
  TFooterType = (ftNone, ftAll, ftAvg, ftSum);
  TAddOrEdit = (aeAdd, aeEdit);
  TfSetUpAnimals = class(TForm)
    pMainDetails: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    sbDelete: TRxSpeedButton;
    nbScroll: TkwDBNavigator;
    ToolButton3: TToolButton;
    sbPedDetails: TSpeedButton;
    ToolButton5: TToolButton;
    sbAnimalPurch: TRxSpeedButton;
    ToolButton6: TToolButton;
    sbHelp: TRxSpeedButton;
    StatusBar: TStatusBar;
    ToolButton7: TToolButton;
    nbScrollRecords: TkwDBNavigator;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    GenQuery: TQuery;
    HoldLactInfo: TTable;
    dsHoldLactInfo: TDataSource;
    HoldLactInfoAID: TIntegerField;
    HoldLactInfoALactNo: TIntegerField;
    HoldLactInfoCalfNo1: TStringField;
    HoldLactInfoCalfNo2: TStringField;
    HoldLactInfoCalfNo3: TStringField;
    HoldLactInfoCalfNo4: TStringField;
    HoldLactInfoA1Sex: TStringField;
    HoldLactInfoA2Sex: TStringField;
    HoldLactInfoA3Sex: TStringField;
    HoldLactInfoA4Sex: TStringField;
    HoldLactInfoNoServices: TIntegerField;
    HoldLactInfoLastService: TDateField;
    HoldLactInfoBirthType: TStringField;
    HoldLactInfoCalvingDate: TDateField;
    HoldLactInfoSaleDate1: TDateField;
    HoldLactInfoSaleWeight1: TFloatField;
    HoldLactInfoSalePrice1: TFloatField;
    HoldLactInfoSaleDate2: TDateField;
    HoldLactInfoSaleWeight2: TFloatField;
    HoldLactInfoSalePrice2: TFloatField;
    HoldLactInfoSaleDate3: TDateField;
    HoldLactInfoSaleWeight3: TFloatField;
    HoldLactInfoSalePrice3: TFloatField;
    HoldLactInfoSaleDate4: TDateField;
    HoldLactInfoSaleWeight4: TFloatField;
    HoldLactInfoSalePrice4: TFloatField;
    HoldLactInfoCalvToConc: TIntegerField;
    HoldLactInfoBullNo: TStringField;
    HoldLactInfoCalvingIndex: TIntegerField;
    HoldLactInfoBirthID: TStringField;
    HoldLactInfoAllCalfSex: TStringField;
    qCurrLact: TQuery;
    qPastLact: TQuery;
    dsCurrLact: TDataSource;
    dsPastLact: TDataSource;
    HoldLactInfoAllCalfNo: TStringField;
    qCurrLactCalvingDate: TDateField;
    qCurrLactCalfType: TStringField;
    qCurrLactBirthType: TStringField;
    qCurrLactNoServices: TIntegerField;
    qCurrLactCalvingIndex: TIntegerField;
    qCurrLactDateDry: TDateField;
    qCurrLactDaysInMilk: TSmallintField;
    qCurrLactLastTest: TFloatField;
    qCurrLactDailyBFatPerc: TFloatField;
    qCurrLactDailyProtPerc: TFloatField;
    qCurrLactYield305: TFloatField;
    qCurrLactCumYield: TFloatField;
    qPastLactCalvingDate: TDateField;
    qPastLactCalfType: TStringField;
    qPastLactBirthType: TStringField;
    qPastLactNoServices: TIntegerField;
    qPastLactCalvingIndex: TIntegerField;
    qPastLactDateDry: TDateField;
    qPastLactDaysInMilk: TSmallintField;
    qPastLactLastTest: TFloatField;
    qPastLactDailyBFatPerc: TFloatField;
    qPastLactDailyProtPerc: TFloatField;
    qPastLactYield305: TFloatField;
    qPastLactCumYield: TFloatField;
    HoldLactInfoBirthweight1: TFloatField;
    HoldLactInfoBirthWeight2: TFloatField;
    HoldLactInfoBirthWeight3: TFloatField;
    HoldLactInfoBirthWeight4: TFloatField;
    HoldLactInfoDOB1: TDateField;
    HoldLactInfoDOB2: TDateField;
    HoldLactInfoDOB3: TDateField;
    HoldLactInfoDOB4: TDateField;
    qGetServices: TQuery;
    HoldLactInfoServiceType: TStringField;
    HoldLactInfoServiceBull: TStringField;
    pGetInfo: TPanel;
    pbGetInfo: TProgressBar;
    qHealth: TQuery;
    dsHealth: TDataSource;
    pPedigree: TPanel;
    PageControl1: TPageControl;
    tsPedigreeDetails: TTabSheet;
    tsPedigreeImages: TTabSheet;
    Shape4: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Label35: TLabel;
    Panel11: TPanel;
    Panel2: TPanel;
    Label36: TLabel;
    dbeSireNo: TDBEdit;
    SireName: TDBEdit;
    dbeDamNo: TDBEdit;
    DamName: TDBEdit;
    Panel3: TPanel;
    Label37: TLabel;
    SSireName: TDBEdit;
    dbeSSireNo: TDBEdit;
    SDamName: TDBEdit;
    dbeSDamNo: TDBEdit;
    Panel6: TPanel;
    Label38: TLabel;
    dbeDDamNo: TDBEdit;
    DDamName: TDBEdit;
    dbeDSireNo: TDBEdit;
    DSireName: TDBEdit;
    Panel12: TPanel;
    Label42: TLabel;
    Label41: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    dbeSSDAMNo: TDBEdit;
    SSDamName: TDBEdit;
    dbeSSSireNo: TDBEdit;
    SSSireName: TDBEdit;
    dbeSDDamNo: TDBEdit;
    SDDamName: TDBEdit;
    dbeSDSireNo: TDBEdit;
    SDSireName: TDBEdit;
    dbeDSDamNo: TDBEdit;
    DSDamName: TDBEdit;
    dbeDSSireNo: TDBEdit;
    DSSireName: TDBEdit;
    dbeDDDamNo: TDBEdit;
    DDDamName: TDBEdit;
    dbeDDSireNo: TDBEdit;
    DDSireName: TDBEdit;
    dbeAnimalNo: TDBEdit;
    dbeAnimalName: TDBEdit;
    GenImage: TImage;
    lNoImage: TLabel;
    ImagePedigree: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    sbCurrAnimal: TRxSpeedButton;
    sbSire: TRxSpeedButton;
    sbDam: TRxSpeedButton;
    sbSSire: TRxSpeedButton;
    sbSDam: TRxSpeedButton;
    sbDDam: TRxSpeedButton;
    sbDSire: TRxSpeedButton;
    sbSSDam: TRxSpeedButton;
    sbSSSire: TRxSpeedButton;
    sbSDSire: TRxSpeedButton;
    sbSDDam: TRxSpeedButton;
    sbDDDam: TRxSpeedButton;
    sbDDSire: TRxSpeedButton;
    sbDSDam: TRxSpeedButton;
    sbDSSire: TRxSpeedButton;
    sbAddAmend: TRxSpeedButton;
    dsPedDetails: TDataSource;
    tPedDetails: TTable;
    MyQuery: TQuery;
    sbPrint: TRxSpeedButton;
    qCowExt: TQuery;
    qHoldLactInfo: TQuery;
    qBullExt: TQuery;
    dbeSireCombo: TDBEdit;
    dbeDamCombo: TDBEdit;
    dbeSSireCombo: TDBEdit;
    dbeSDamCombo: TDBEdit;
    dbeDSireCombo: TDBEdit;
    dbeDDamCombo: TDBEdit;
    dbeSSSireCombo: TDBEdit;
    dbeSSDamCombo: TDBEdit;
    dbeSDSireCombo: TDBEdit;
    dbeSDDamCombo: TDBEdit;
    dbeDSSireCombo: TDBEdit;
    dbeDSDamCombo: TDBEdit;
    dbeDDSireCombo: TDBEdit;
    dbeDDDamCombo: TDBEdit;
    pSelAnimal: TPanel;
    lSelName: TLabel;
    lSelAnimalNum: TLabel;
    lName: TLabel;
    dbeSire: TDBEdit;
    dbeDam: TDBEdit;
    dbeSSire: TDBEdit;
    dbeSDam: TDBEdit;
    dbeDSire: TDBEdit;
    dbeDDam: TDBEdit;
    dbeSSSire: TDBEdit;
    dbeSSDam: TDBEdit;
    dbeSDSire: TDBEdit;
    dbeSDDam: TDBEdit;
    dbeDSSire: TDBEdit;
    dbeDSDam: TDBEdit;
    dbeDDSire: TDBEdit;
    dbeDDDam: TDBEdit;
    Label58: TLabel;
    OpenBlup: TOpenDialog;
    qFeedGrp: TQuery;
    qBatchGrp: TQuery;
    dsLookUpFeedGrp: TDataSource;
    dsLookUpBatchGrp: TDataSource;
    ToolButton2: TToolButton;
    MilkDiskTrans: TTable;
    dsMilkDiskTrans: TDataSource;
    pmMilkDisk: TPopupMenu;
    ShowAverages1: TMenuItem;
    ShowTotal1: TMenuItem;
    ShowAll1: TMenuItem;
    N1: TMenuItem;
    HideAll1: TMenuItem;
    N2: TMenuItem;
    pmMilkTrans: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Panel1: TPanel;
    LbScan: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    Label15: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label25: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    sbPedName: TRxSpeedButton;
    ScanInCode: TEdit;
    TBTestDate: TDBDateEdit;
    SetNatID: TBitBtn;
    LactationNo: TDBEdit;
    Breeding: TDBCheckBox;
    AnimalColour: TRxDBLookupCombo;
    cmboHerdLookUp: TRxDBLookupCombo;
    DOB: TDBDateEdit;
    AnimalNo: TDBEdit;
    InHerd: TDBCheckBox;
    HerdBookNo: TDBEdit;
    NatIDNo: TDBEdit;
    dbeWeight: TDBEdit;
    Name: TDBEdit;
    SexCombo: TDBComboBox;
    ReScan: TBitBtn;
    BruceDate: TDBDateEdit;
    cbBrowser: TCheckBox;
    DamIDEh: TDBLookupComboboxEh;
    GDamIDEh: TDBLookupComboboxEh;
    SireIDEh: TDBLookupComboboxEh;
    Label78: TLabel;
    QueryWeighings: TQuery;
    dsQueryWeighings: TDataSource;
    QueryWeighingsID: TIntegerField;
    QueryWeighingsEventDate: TDateField;
    QueryWeighingsEventDesc: TStringField;
    QueryWeighingsWeight: TFloatField;
    QueryPurchaseCosts: TQuery;
    dsQueryAcquisitionCosts: TDataSource;
    QueryFeedCosts: TQuery;
    QueryHealthCosts: TQuery;
    QuerySalesCosts: TQuery;
    dsQuerySalesCosts: TDataSource;
    QueryPurchaseCostsEventDate: TDateField;
    QueryPurchaseCostsPrice: TFloatField;
    QueryPurchaseCostsCosts: TFloatField;
    QueryPurchaseCostsTotalAcquisition: TFloatField;
    QuerySalesCostsEventDate: TDateField;
    QuerySalesCostsPrice: TFloatField;
    QuerySalesCostsCustomerCosts: TFloatField;
    QuerySalesCostsNetSales: TFloatField;
    AnimalPages: TcxPageControl;
    tsBullSemen: TcxTabSheet;
    Label21: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit9: TDBEdit;
    cbInUse: TDBCheckBox;
    nbSaveSemenStk: TKwDBNavigator;
    tsBullInfo: TcxTabSheet;
    lEBIOrMatIndex: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    RBI: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    ProtPerc: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    tsLactSumm: TcxTabSheet;
    lCCalvDate: TLabel;
    lCDaysMilk: TLabel;
    lCCalfType: TLabel;
    lCProjCInd: TLabel;
    lCurrLact: TLabel;
    lCNumServ: TLabel;
    lPrevLact: TLabel;
    lLastTest: TLabel;
    lBFat: TLabel;
    lProt: TLabel;
    l305Y: TLabel;
    lTotalY: TLabel;
    lDateDry: TLabel;
    lBirthType: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    dbeCCalvDate: TDBEdit;
    dbeCCalfType: TDBEdit;
    dbeCBirthType: TDBEdit;
    dbeCNumServ: TDBEdit;
    dbeProjCInd: TDBEdit;
    dbeDateDry: TDBEdit;
    dbePCalvDate: TDBEdit;
    dbePCalfType: TDBEdit;
    dbePBirthType: TDBEdit;
    dbePNumServ: TDBEdit;
    dbeLastCInd: TDBEdit;
    dbeLastDry: TDBEdit;
    dbeCTotalY: TDBEdit;
    dbeC305Y: TDBEdit;
    dbeCProt: TDBEdit;
    dbeCBFat: TDBEdit;
    dbeCLastTest: TDBEdit;
    dbeCDaysMilk: TDBEdit;
    dbePDaysMilk: TDBEdit;
    dbePLastTest: TDBEdit;
    dbePBFat: TDBEdit;
    dbePProt: TDBEdit;
    dbeP305Y: TDBEdit;
    dbePTotalY: TDBEdit;
    eCDaysSuck: TEdit;
    ePDaysSuck: TEdit;
    tsCurrFert: TcxTabSheet;
    lBullTitle: TLabel;
    lServTitle: TLabel;
    sgBullings: TStringGrid;
    sgServices: TStringGrid;
    lTotBull: TLabel;
    eTotBull: TEdit;
    ePlanBull: TEdit;
    lPlanBull: TLabel;
    lTotServ: TLabel;
    lDaysLast: TLabel;
    eDaysLast: TEdit;
    eTotServ: TEdit;
    Label44: TLabel;
    ePreg: TEdit;
    eProjCalv: TEdit;
    lProjCalv: TLabel;
    dbeLastCalv: TDBEdit;
    lLastCalv: TLabel;
    tsPastFert: TcxTabSheet;
    sgPastFert: TDBGridEh;
    tsMilkSheet: TcxTabSheet;
    tsPastCalf: TcxTabSheet;
    sgPastCalf: TStringGrid;
    tsHealth: TcxTabSheet;
    tsPedigree: TcxTabSheet;
    gbClassification: TGroupBox;
    lgrade: TLabel;
    lscore: TLabel;
    DBGrade: TDBEdit;
    DBScore: TDBEdit;
    gbBreedingIndices: TGroupBox;
    lEBI: TLabel;
    lPin: TLabel;
    lPLI: TLabel;
    DBEBI: TDBEdit;
    DBpin: TDBEdit;
    DBPLI: TDBEdit;
    Panel8: TPanel;
    mPedDetails: TDBMemo;
    Label57: TLabel;
    DBFamilyName: TDBEdit;
    Label60: TLabel;
    kwNavPedDetails: TKwDBNavigator;
    tsBlupPedigree: TcxTabSheet;
    nBlup: TKwDBNavigator;
    GroupBox1: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    MUS: TDBEdit;
    SKE: TDBEdit;
    BRE: TDBEdit;
    REL: TDBEdit;
    FUN: TDBEdit;
    YWT: TDBEdit;
    DOC: TDBEdit;
    WWT: TDBEdit;
    RELPerc: TDBEdit;
    GroupName: TDBEdit;
    Label59: TLabel;
    Label79: TLabel;
    Panel9: TPanel;
    DBMemo1: TDBMemo;
    ImportBlupDetails: TRxSpeedButton;
    tsGroups: TcxTabSheet;
    tsWeighings: TcxTabSheet;
    DBGrid1: TDBGrid;
    tsCattleMargins: TcxTabSheet;
    GroupBox2: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    CMPurchPrice: TCurrencyEdit;
    CMPurchCosts: TCurrencyEdit;
    CMPurchTotal: TCurrencyEdit;
    CMPurchDate: TEdit;
    GroupBox3: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    CMSalesPrice: TCurrencyEdit;
    CMSalesCosts: TCurrencyEdit;
    CMSalesTotal: TCurrencyEdit;
    CMSalesDate: TEdit;
    GroupBox4: TGroupBox;
    Label89: TLabel;
    Label90: TLabel;
    CMFeedCosts: TCurrencyEdit;
    CMHealthCosts: TCurrencyEdit;
    AnimalPagesSplitter: TcxSplitter;
    Bevel4: TBevel;
    KwDBNavigator1: TKwDBNavigator;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxButton1: TcxButton;
    mdGroups: TdxMemData;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    mdGroupsGType: TStringField;
    mdGroupsGroupCode: TStringField;
    mdGroupsGroupDesc: TStringField;
    mdGroupsDateJoined: TStringField;
    mdGroupsTotalInGroup: TIntegerField;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    dsmdGroups: TDataSource;
    imgBarcode: TcxImage;
    imgBarcode2: TcxImage;
    DBEdit19: TDBEdit;
    Label70: TLabel;
    AnimalBreed: TDBLookupComboboxEh;
    tsWeighingChart: TcxTabSheet;
    mdWeighingChartData: TdxMemData;
    DataSource1: TDataSource;
    mdWeighingChartDataWeight: TFloatField;
    mdWeighingChartDataNoOfDays: TIntegerField;
    Panel10: TPanel;
    GridWeighingBarChart: TcxGrid;
    GridWeighingBarChartDBChartView: TcxGridDBChartView;
    GridWeighingBarChartDBChartViewSeries1: TcxGridDBChartSeries;
    GridWeighingBarChartLevel: TcxGridLevel;
    rbGraphView: TRadioButton;
    rbBarChartView: TRadioButton;
    dxComponentPrinter1: TdxComponentPrinter;
    PrinterLinkGridWeighingBarChart: TdxGridReportLink;
    mdWeighingChartDataID: TAutoIncField;
    dbWeighingGraph: TDBChart;
    Series1: TFastLineSeries;
    pGraphPeriod: TPanel;
    rb1YearGraphPeriod: TRadioButton;
    rb2YearGraphPeriod: TRadioButton;
    QueryWeighingsNoOfDays: TIntegerField;
    Image1: TImage;
    pmGraphOptions: TPopupMenu;
    ToScreen1: TMenuItem;
    ToFile1: TMenuItem;
    JpegSaveDialog: TSaveDialog;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton4: TToolButton;
    sbGoToGenDam: TRxSpeedButton;
    sbGoToDam: TRxSpeedButton;
    sbGoToSire: TRxSpeedButton;
    Shape6: TShape;
    TransponderNo: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    CMFixedCosts: TCurrencyEdit;
    CMFarmTotal: TCurrencyEdit;
    Label24: TLabel;
    GroupBox5: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    CMPurchCost: TCurrencyEdit;
    CMFarmCost: TCurrencyEdit;
    CMMargin: TCurrencyEdit;
    CMSalesCost: TCurrencyEdit;
    QueryWeighingsAnimalID: TIntegerField;
    QueryWeighingsDLWG: TFloatField;
    tsAnimalComments: TcxTabSheet;
    mAnimalComments: TcxDBMemo;
    KwDBNavigator2: TKwDBNavigator;
    mdWeighingChartDataViewLabel: TStringField;
    mdWeighingChartDataDLWG: TFloatField;
    mdWeighingChartDataWeighingDate: TDateTimeField;
    mdWeighingChartDataAnimalID: TIntegerField;
    mdWeighingChartDataDaysOnFarm: TIntegerField;
    pBeefWeighingGraphInput: TPanel;
    rbWeighGraphViewByDays: TRadioButton;
    WeighingGraphTrackBar: TTrackBar;
    rbWeighingGraphVarDays: TRadioButton;
    lWeighingGraphVarDays: TLabel;
    cbPedigree: TDBCheckBox;
    sbHUK: TKRxSpeedButton;
    ActionList1: TActionList;
    actHUK: TAction;
    Panel4: TPanel;
    Panel5: TPanel;
    dbgMilk: TDBGridEh;
    Panel7: TPanel;
    dbgMilkTrans: TDBGridEh;
    Panel13: TPanel;
    rbShowCumYield: TcxRadioButton;
    rbShow305Yield: TcxRadioButton;
    Panel14: TPanel;
    lUKAISireCode: TLabel;
    UKAISireCode: TDBEdit;
    HoldLactInfoAllCalfSireNo: TStringField;
    HoldLactInfoAllCalfSireBreed: TStringField;
    HoldLactInfoSireID: TIntegerField;
    dbSireLookup: TcxDBLookupComboBox;
    lBVDTestDate: TLabel;
    BVDDate: TDBDateEdit;
    dbDamLookup: TcxDBLookupComboBox;
    dbETDamLookup: TcxDBLookupComboBox;
    dbcbQualityAssured: TDBCheckBox;
    tsFeedBreakdown: TcxTabSheet;
    FeedEventGridDBTableView: TcxGridDBTableView;
    FeedEventGridLevel: TcxGridLevel;
    FeedEventGrid: TcxGrid;
    FeedEventGridDBTableViewAllocDate: TcxGridDBColumn;
    FeedEventGridDBTableViewCostPerDay: TcxGridDBColumn;
    FeedEventGridDBTableViewQtyPerDay: TcxGridDBColumn;
    FeedEventGridDBTableViewFeedName: TcxGridDBColumn;
    lCowFamily: TLabel;
    dbeCowFamily: TDBEdit;
    gbAAAScores: TGroupBox;
    lAAAScore1: TLabel;
    lAAAScore2: TLabel;
    lAAAScore3: TLabel;
    DBAAAScore1: TDBEdit;
    DBAAAScore2: TDBEdit;
    DBAAAScore3: TDBEdit;
    FeedEventGridDBTableViewEndDate: TcxGridDBColumn;
    FeedEventGridDBTableViewNoDays: TcxGridDBColumn;
    FeedEventGridDBTableViewTotalCalcCost: TcxGridDBColumn;
    qHealthEventDate: TDateField;
    qHealthEventDesc: TStringField;
    qHealthRateApplic: TFloatField;
    qHealthDrugName: TStringField;
    qHealthApplicMethod: TStringField;
    qHealthHealthCode: TStringField;
    qHealthAdminBy: TStringField;
    qHealthWithdrawal: TFloatField;
    qHealthMilkWithdrawal: TIntegerField;
    qHealthMilkN_A_Drug: TBooleanField;
    qHealthMeatN_A_Drug: TBooleanField;
    qHealthMeatWithdrawalDate: TDateField;
    qHealthMilkWithdrawalDate: TDateField;
    qHealthDrugUsed: TIntegerField;
    qHealthCost: TCurrencyField;
    HealthEventsGridDBTableView: TcxGridDBTableView;
    HealthEventsGridLevel: TcxGridLevel;
    HealthEventsGrid: TcxGrid;
    HealthEventsGridDBTableViewEventDate: TcxGridDBColumn;
    HealthEventsGridDBTableViewEventDesc: TcxGridDBColumn;
    HealthEventsGridDBTableViewDrugName: TcxGridDBColumn;
    HealthEventsGridDBTableViewApplicMethod: TcxGridDBColumn;
    HealthEventsGridDBTableViewHealthCode: TcxGridDBColumn;
    HealthEventsGridDBTableViewAdminBy: TcxGridDBColumn;
    HealthEventsGridDBTableViewMeatWithdrawalDate: TcxGridDBColumn;
    HealthEventsGridDBTableViewMilkWithdrawalDate: TcxGridDBColumn;
    HealthEventsGridDBTableViewCost: TcxGridDBColumn;
    HealthEventsGridDBTableViewRateApplic: TcxGridDBColumn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrimBreedDblClick(Sender: TObject);
    procedure DamIDDblClick(Sender: TObject);
    procedure SireIDDblClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure cmboHerdLookUpCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnimalColourCloseUp(Sender: TObject);
    procedure cmboHerdLookUpExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SetNatIDClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPedDetailsClick(Sender: TObject);
    procedure DOBExit(Sender: TObject);
    procedure sbAnimalPurchClick(Sender: TObject);
    procedure nbScrollClick(Sender: TObject; Button: TKNavigateBtn);
    procedure HelpBtnClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure nbScrollBeforeAction(Sender: TObject; Button: TKNavigateBtn);
    procedure nbScrollRecordsBeforeAction(Sender: TObject; Button: TKNavigateBtn);
    procedure HoldLactInfoCalcFields(DataSet: TDataSet);
    procedure cbBrowserClick(Sender: TObject);
    procedure sbPedNameClick(Sender: TObject);
    procedure cmboHerdLookUpDropDown(Sender: TObject);
    procedure ScanInCodeExit(Sender: TObject);
    procedure ReScanClick(Sender: TObject);
    procedure sbCurrAnimalClick(Sender: TObject);
    procedure sbSireClick(Sender: TObject);
    procedure sbDamClick(Sender: TObject);
    procedure sbSSireClick(Sender: TObject);
    procedure sbSDamClick(Sender: TObject);
    procedure sbDSireClick(Sender: TObject);
    procedure sbDDamClick(Sender: TObject);
    procedure sbSSSireClick(Sender: TObject);
    procedure sbSSDamClick(Sender: TObject);
    procedure sbSDSireClick(Sender: TObject);
    procedure sbSDDamClick(Sender: TObject);
    procedure sbDSSireClick(Sender: TObject);
    procedure sbDSDamClick(Sender: TObject);
    procedure sbDDSireClick(Sender: TObject);
    procedure sbDDDamClick(Sender: TObject);
    procedure sbAddAmendClick(Sender: TObject);
    procedure NatIDNoChange(Sender: TObject);
    procedure kwNavPedDetailsClick(Sender: TObject; Button: TKNavigateBtn);
    procedure sbPrintClick(Sender: TObject);
    procedure NatIDNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SexComboChange(Sender: TObject);
    procedure tsPedigreeImagesShow(Sender: TObject);
    procedure ShowAll1Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure sbMilkTransClick(Sender: TObject);
    procedure sbMilkDiskClick(Sender: TObject);
    procedure NatIDNoEnter(Sender: TObject);
    procedure ScanInCodeEnter(Sender: TObject);
    procedure Splitter2CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure Splitter3CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure Label80Click(Sender: TObject);
    procedure dbgWeighingsDblClick(Sender: TObject);
    procedure tsHealthShow(Sender: TObject);
    procedure AnimalPagesPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure mPedDetailsChange(Sender: TObject);
    procedure tsMilkSheetShow(Sender: TObject);
    procedure cmboHerdLookUpChange(Sender: TObject);
    procedure AnimalNoChange(Sender: TObject);
    procedure DOBChange(Sender: TObject);
    procedure ScanInCodeChange(Sender: TObject);
    procedure AnimalBreedChange(Sender: TObject);
    procedure AnimalColourChange(Sender: TObject);
    procedure TBTestDateChange(Sender: TObject);
    procedure BruceDateChange(Sender: TObject);
    procedure dbeWeightChange(Sender: TObject);
    procedure LactationNoChange(Sender: TObject);
    procedure BreedingClick(Sender: TObject);
    procedure InHerdClick(Sender: TObject);
    procedure NameChange(Sender: TObject);
    procedure HerdBookNoChange(Sender: TObject);
    procedure SireIDEhChange(Sender: TObject);
    procedure DamIDEhChange(Sender: TObject);
    procedure GDamIDEhChange(Sender: TObject);
    procedure AnimalBreedCloseUp(Sender: TObject; Accept: Boolean);
    procedure rbGraphViewClick(Sender: TObject);
    procedure rbBarChartViewClick(Sender: TObject);
    procedure tsWeighingChartShow(Sender: TObject);
    procedure rb1YearGraphPeriodClick(Sender: TObject);
    procedure rb2YearGraphPeriodClick(Sender: TObject);
    procedure QueryWeighingsCalcFields(DataSet: TDataSet);
    procedure rbShow305YieldClick(Sender: TObject);
    procedure rbShowCumYieldClick(Sender: TObject);
    procedure NatIDNoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToScreen1Click(Sender: TObject);
    procedure ToFile1Click(Sender: TObject);
    procedure sbGoToGenDamClick(Sender: TObject);
    procedure mdWeighingChartDataWeightGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbWeighingGraphAfterDraw(Sender: TObject);
    procedure rbWeighGraphViewByDaysClick(Sender: TObject);
    procedure WeighingGraphTrackBarChange(Sender: TObject);
    procedure rbWeighingGraphVarDaysClick(Sender: TObject);
    procedure actHUKUpdate(Sender: TObject);
    procedure actHUKExecute(Sender: TObject);
    procedure AnimalPagesDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure dbSireLookupPropertiesChange(Sender: TObject);
    procedure BVDDateChange(Sender: TObject);
    procedure dbDamLookupPropertiesInitPopup(Sender: TObject);
    procedure dbETDamLookupPropertiesChange(Sender: TObject);
    procedure dbETDamLookupPropertiesCloseUp(Sender: TObject);
    procedure DOBEnter(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure qHealthCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    CurrentAnimal : PInteger;
    LastAnimalID   : Integer;
    SavingRecord   : Boolean;   // used to check if the record is being SAVED premium dates
    AnimalBookMark : TBookMark;
    AnimalPurBookMark : TBookMark;
    LastAnimalType : tAnimalSet;
    HerdQuery: TQuery;
    HerdSource: TDataSource;
    GroupsToCheck : String;
    iFeedGrp,
    iBatchGrp : Integer;
    AncestryFieldArray : TAncestryFieldArray;
    ImageID : Integer;

    TabUpdating : Boolean;
    LastTabSheet : TcxTabSheet;

    FModified : Boolean;
    FFormShowing : Boolean;

    ZoomPerc : Integer;

    CheckPurchaseEvent : Boolean;

    // 28/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user reconcile ancestry data with HUK
    ShowHUKControls : Boolean;

    // 29/06/10 [V4.0 R3.9] /MK Additional Feature - Using TCountry to check Country on FormActivate
    WhichReg : TCountry;

    AnimalDateOfBirthChanged : Boolean;

    FAddOrEdit : TAddOrEdit;

    FHerdType : THerdType;

    procedure SetModifiedFlag;

    function GetAnimalType : tAnimalSet;
    procedure SetUpPedigree;
    procedure CheckEligDates ( Sender : TObject );
    procedure LactSummCalcs;
    procedure CurrFertCalcs( AID, LactNo, EventType : Integer);
    procedure PastCalfCalcs;
    procedure GetLactDetails ( AID : Integer);
    function OkToCheck : Boolean;
    procedure GetImage;
    Procedure GetPedDetails;
    Procedure AnimalCaptions;
    procedure PedCaptions;
    procedure CurrFertCaptions;
    procedure CurrLactSummCaptions;
    procedure SetAncestryFields;
    function CheckDescendents(ChosenAnimal : Integer) : Boolean;
    function CheckAncesters(ChosenAnimal : Integer) : Boolean;
    procedure GetGroupNames;
    procedure GroupTypes;
    procedure LoadImage;
    procedure ActivateScan(Activate : Boolean);
    procedure AncestorClick(Sender : TObject; PRec : PPedigreeRec; dbFields : Array of TDBEdit; sAncestor : String);
    function FillArray(Dbe1, Dbe2, Dbe3, Dbe4 : TDBEdit) : TAncestryFieldArray;
    procedure SetGridFooters(DBGrid : TDBGridEh; FooterSelection : Integer);
    procedure CreateFooter(DBGrid : TDBGridEh; FieldName : string; FootIndex : Integer; FooterType : TFooterType);
    procedure SetAncestryDisplayFields;
    procedure DisplayInherdField;

    procedure CheckDBBrowserState;
    procedure RefreshHealthQuery;

    procedure GetWeightInfo;

    procedure SetMilkDiskGridDisplayColumns;

    procedure SetMandatoryControlColours;

    procedure SetActiveControl;

    procedure DoCattleMarginCalcs;

    procedure SendHUKNotification;
    function ShowETDamDonor: Boolean;
    procedure ShowHideDeleteButton;

  public
    { Public declarations }
    ImmediateCloseAfterSave : Boolean;
    DefaultAnimalType : TAnimalType;
    SetUpCalvingDate : Boolean;
    PedigreeRec : PPedigreeRec;
    DefaultHerd : Integer;  //SP 14/11/00
    ThisHerdType : String[10];
    RefreshAnimalGrid : Boolean;
    FOpenFromAnimalBrowser : Boolean;

    property AnimalType : tAnimalSet Read GetAnimalType Write LastAnimalType;
    function ShowForm(Viewing : Boolean) : Boolean;
    procedure AddRemoveFromGroup(AID, GroupID : Integer; GType : String);
    procedure SetColorMandatory;
  end;

function GetChartJPEG(AChart:TCustomChart; Params:TJPEGDefaults):TJPEGImage;
var
  fSetUpAnimals: TfSetUpAnimals;
  EventCount,
  CalvToEvent : Integer;
  ThisEventDate : TDateTime;
  tAnimalSex : Array [1..3] of String = ('Female', 'Bull', 'Steer');
  Params:TJPEGDefaults;

implementation
uses
   DEF,
   uPurchases,
   uGenLookSetUp,
   uHerdSetUp,
   SetUpBreeds,
   SrchDlg,
   uDefaults,
   uCalvings,
   DairyData,
   uRemarks,
   uPedName,
   MenuUnit,
   uPedAddAmend,
   AncestryTree,
   ActionReminderFilt,
   AnimalPrint, CowMilkHistory, Weighing, uGroupUpdate, KRoutines, TeePrevi,
   uHUKIRegistrationLogin, uHUKISireDamListing, TeeEdiGene,
   uAnimalBrowser;
  {KCcxGridDBTableView;}

{$R *.DFM}

function TfSetUpAnimals.ShowForm(Viewing : Boolean) : Boolean;
begin
   RefreshAnimalGrid := False;
   if NOT(Viewing) then
      WinData.BreedRequired := True;
   try
      // Hide the Panel with the Progressbar
      CheckPurchaseEvent := not Viewing;
      pGetInfo.Hide;
      LastAnimalID := 0;
      with HoldLactInfo do
         begin
            Close;
            TableName := 'HoldLactInfo';
            with FieldDefs do
               begin
                  Clear;
                  Add('AID',ftInteger,0,FALSE);
                  Add('ALactNo',ftInteger,0,FALSE);
                  Add('AllCalfNo',ftString,65,FALSE);
                  Add('CalfNo1',ftstring,15,FALSE);
                  Add('CalfNo2',ftstring,15,FALSE);
                  Add('CalfNo3',ftstring,15,FALSE);
                  Add('CalfNo4',ftstring,15,FALSE);
                  Add('AllCalfSex',ftString,20,FALSE);
                  Add('A1Sex',ftString,10,FALSE);
                  Add('A2Sex',ftString,10,FALSE);
                  Add('A3Sex',ftString,10,FALSE);
                  Add('A4Sex',ftString,10,FALSE);
                  Add('NoServices',ftInteger,0,FALSE);
                  Add('ServiceType',ftString,30,FALSE);
                  Add('ServiceBull',ftString,30,FALSE);
                  Add('LastServiceEID',ftInteger,0,FALSE);
                  Add('LastService',ftDate,0,FALSE);
                  Add('BirthID',ftString,30,FALSE);
                  Add('BirthType',ftString,30,FALSE);
                  Add('CalvingDate',ftDate,0,FALSE);
                  Add('CalvingIndex',ftInteger,0,FALSE);
                  Add('DOB1',ftDate,0,FALSE);
                  Add('SaleDate1',ftDate,0,FALSE);
                  Add('BirthWeight1',ftfloat,0,FALSE);
                  Add('SaleWeight1',ftfloat,0,FALSE);
                  Add('SalePrice1',ftfloat,0,FALSE);
                  Add('DOB2',ftDate,0,FALSE);
                  Add('SaleDate2',ftDate,0,FALSE);
                  Add('BirthWeight2',ftfloat,0,FALSE);
                  Add('SaleWeight2',ftfloat,0,FALSE);
                  Add('SalePrice2',ftfloat,0,FALSE);
                  Add('DOB3',ftDate,0,FALSE);
                  Add('SaleDate3',ftDate,0,FALSE);
                  Add('BirthWeight3',ftfloat,0,FALSE);
                  Add('SaleWeight3',ftfloat,0,FALSE);
                  Add('SalePrice3',ftfloat,0,FALSE);
                  Add('DOB4',ftDate,0,FALSE);
                  Add('SaleDate4',ftDate,0,FALSE);
                  Add('BirthWeight4',ftfloat,0,FALSE);
                  Add('SaleWeight4',ftfloat,0,FALSE);
                  Add('SalePrice4',ftfloat,0,FALSE);
                  Add('AllCalfSireNo',ftString,10,FALSE);
                  Add('AllCalfSireBreed',ftString,5,FALSE);
                  Add('SireID',ftInteger,0,FALSE);
               end;
            CreateTable;
            Open;
         end;


      if ((Def.Definition.dUseManCal) OR (Def.Definition.dUseBeefMan)) then
         GroupTypes;

      pPedigree.Visible := False;     //KVB
      if DEF.Definition.dUsePedigree AND ( UPPERCASE(WinData.GenLookUp.FieldByName('Description').AsString) <> 'BEEF' ) then
         Begin
            sbPedDetails.Visible := True;
            ToolButton6.Visible := True;
            sbPedName.Visible    := True;
         end
      else
         begin
            sbPedDetails.Enabled := False;
            sbPedName.Visible    := False;
         end;

   Label45.Visible := ShowETDamDonor;
   Label48.Visible := Label45.Visible;
   dbETDamLookup.Visible := Label45.Visible;

   if ( not(dbETDamLookup.Visible) ) then
      begin
         sbGoToGenDam.Visible := False;
         Shape6.Height := 60;
      end
   else
      begin
         sbGoToGenDam.Visible := True;
         Shape6.Height := 88;
      end;

      if not DEF.Definition.dUsePedigree then
         sbPedName.Hide;
      // Query for herd drop down to fix delphi 5 conversion bug - 24/10/00 - kr
      HerdQuery := TQuery.Create(nil);
      HerdQuery.DatabaseName  := WinData.KingData.DatabaseName;
      HerdQuery.Close;
      HerdQuery.UnPrepare;
      HerdQuery.SQL.Text := 'SELECT ID, HerdIdentity FROM Owners.db';
      HerdSource := TDataSource.Create(nil);
      HerdSource.DataSet := HerdQuery;
      cmboHerdLookUp.LookupSource := HerdSource;
      HerdQuery.Prepare;
      HerdQuery.Open;
      // show browser if adding animal
      if NOT viewing then
         cbBrowser.Checked := False;

      if Viewing then
         FAddOrEdit := aeEdit
      else
         FAddOrEdit := aeAdd;

      ShowModal;
   finally
      uHerdLookup.HerdLookup.FlushPedigreeTable;

      qCowExt.Close;  //KVB  05/04/2001
      qBullExt.Close;  //KVB  05/04/2001
      qCurrLact.Close;
      qPastLact.Close;
      HoldLactInfo.Close;
      if qGetServices.Active then
         qGetServices.Close;
      if GenQuery.Active then
         GenQuery.Close;
      if HerdQuery.Active then
         HerdQuery.Close;
      HerdQuery.Free;
      HerdSource.Free;

      if qHealth.Active then
         qHealth.Close;
      if qFeedGrp.Active then
         qFeedGrp.Close;
      if qBatchGrp.Active then
         qBatchGrp.Close;
      WinData.LookUpGroups.Close;
      WinData.LookUpGroups.Open;
      Result := RefreshAnimalGrid;
   end;
end;

function TfSetUpAnimals.GetAnimalType : tAnimalSet;

   procedure ResetTabs;
   var
      TabIndex : Integer;
   begin
      TabUpdating := True;
      for TabIndex := 0 to AnimalPages.PageCount-1 do
          AnimalPages.Pages[TabIndex].TabVisible := False;
      TabUpdating := False;
   end;

   function FirstVisibleTabIndex : Integer;
   var
      TabIndex : Integer;
   begin
      Result := -1;
      for TabIndex := 0 to AnimalPages.PageCount-1 do
         if AnimalPages.Pages[TabIndex].TabVisible then
            begin
               Result := TabIndex;
               Break;
            end;
   end;

begin
   Screen.Cursor := crHourGlass;
   // AnimalPagesSplitter.Visible := False;
   AnimalPages.Tabs.BeginUpdate;
   AnimalPages.HideTabs := True;
   AnimalPages.Hide;

   if not(FOpenFromAnimalBrowser) then
      begin
         if ( LastAnimalType = Unknown ) then // Set the tab page to first visible
            begin
               // Default to first visible tab.
               AnimalPages.ActivePageIndex := FirstVisibleTabIndex;
            end;
      end
   else
      AnimalPages.ActivePageIndex := tsPastFert.PageIndex;

   LastTabSheet := AnimalPages.ActivePage;

   try
      ResetTabs;

      // Always hide the Navigator Buttons for Bull Semen/Stocks
      //nbSave.Hide;

      // Check the Inter Herd Option
      if WinData.AnimalFileByID.state <> dsInsert then
         begin
            if WinData.HasInterHerd then
               // Disable the Herd Drop Down List
               cmboHerdLookUp.Enabled := FALSE
            else
               cmboHerdLookUp.Enabled := TRUE;
         end;

      // Get the Herd Type
      if WinData.OwnerFile.Locate('ID',WinData.AnimalFileByIdHerdId.Value,[]) then
         if WinData.GenLookUp.Locate('ID',WinData.OwnerFile.FieldByName('TypeOfHerd').AsInteger,[]) then
            ThisHerdType := UPPERCASE( WinData.GenLookUp.FieldByName('Description').Value );

      FHerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIdHerdId.Value);

      LactationNo.Enabled := ( WinData.AnimalFileByIDLactNo.AsInteger = 0 ) or not ( WinData.EventsRecorded( WinData.AnimalFileByIDID.AsInteger ));

      if ( FHerdType = htBeef ) then
         begin
            Label33.Visible      := False; // Hide if BEEF Herd.
            Label15.Visible      := False;
            Label55.Visible      := False;
            Label45.Visible      := False;
            Label48.Visible      := False;
            Label43.Visible      := False;
            Label6.Visible       := False;
            Label32.Visible      := False;
            Label8.Visible       := False;
            Label7.Visible       := False;
            lCowFamily.Visible  := False;
            dbeCowFamily.Visible := False;
            dbSireLookup.Visible := False;

            dbDamLookup.Visible  := False;
            sbGoToSire.Visible   := False;
            sbGoToDam.Visible    := False;
            sbGoToGenDam.Visible := False;
            Shape6.Visible       := False;

            Name.Visible         := False;
            dbETDamLookup.Visible := False;
            sbPedName.Visible    := False;
            dbeWeight.Visible    := False;
            LactationNo.Visible  := False;
            HerdBookNo.Visible   := False;
            Breeding.Visible     := False;
            cbPedigree.Visible   := False;

            lUKAISireCode.Visible := False;
            UKAISireCode.Visible := False;

            Label5.Top :=  5;
            TransponderNo.Top :=  3;
          end
      else
         begin
            Label33.Visible     := True;
            Label15.Visible     := True;
            Label43.Visible     := True;
            Label32.Visible     := True;
            Label8.Visible      := True;
            Label7.Visible      := True;
            Label6.Visible      := True;
            lCowFamily.Visible  := True;
            dbeCowFamily.Visible := True;
            dbSireLookup.Visible := True;
            dbDamLookup.Visible := True;
            sbGoToSire.Visible  := true;
            sbGoToDam.Visible   := true;
            Shape6.Visible      := True;
            Name.Visible        := True;
            dbeWeight.Visible   := True;
            LactationNo.Visible := True;
            HerdBookNo.Visible  := True;
            Breeding.Visible    := ( UpperCase(WinData.AnimalFileByIDSex.AsString) <> UpperCase('Steer') );
            cbPedigree.Visible  := Breeding.Visible;
            if DEF.Definition.dUsePedigree then
               sbPedName.Visible   := True;
            if ( not(dbETDamLookup.Visible) ) then
               begin
                  sbGoToGenDam.Visible := False;
                  Shape6.Height := 60;
               end
            else
               begin
                  sbGoToGenDam.Visible := True;
                  Shape6.Height := 88;
               end;

            WhichReg := WinData.SystemRegisteredCountry;
            if ( WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID ) and ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'BULL' ) then
               begin
                  if ( WhichReg = Ireland ) then
                     begin
                        lCowFamily.Visible := True;
                        dbeCowFamily.Visible := lCowFamily.Visible;
                        Label1.Caption := 'AI Code';
                        lUKAISireCode.Left := 399;
                        UKAISireCode.Left := 532;
                        lUKAISireCode.Visible := False;
                        UKAISireCode.Visible := False;
                        Label5.Top := 77;
                        TransponderNo.Top := 74;
                     end
                  else
                     begin
                        lCowFamily.Visible := False;
                        dbeCowFamily.Visible := lCowFamily.Visible;
                        Label1.Caption := 'Bull Name (Short)';
                        lUKAISireCode.Left := 399;
                        UKAISireCode.Left := 532;
                        lUKAISireCode.Visible := True;
                        UKAISireCode.Visible := True;
                        Label5.Top := 77;
                        TransponderNo.Top := 74;
                     end;
               end
            else
               begin
                  lCowFamily.Visible := True;
                  dbeCowFamily.Visible := lCowFamily.Visible;
                  lUKAISireCode.Visible := False;
                  UKAISireCode.Visible := False;
                  lUKAISireCode.Left := 739;
                  UKAISireCode.Left := 872;
                  Label5.Top := 77;
                  TransponderNo.Top := 74;
               end
         end;

      // only calculate if browser switched on
      if (cbBrowser.Checked) or (sbPedDetails.Down) then Exit;

      if WinData.AnimalFileByID.State <> dsInsert then
         begin
            if (Def.Definition.dUseManCal) OR (Def.Definition.dUseBeefMan) then
               begin
   //               GetGroupNames;
                  tsGroups.TabVisible := True;
               end;

            if ((Def.Definition.dUsePedigree) and ( FHerdType = htSuckler ) and (WinData.AnimalFileByIDBreeding.AsBoolean)) then
               tsBlupPedigree.TabVisible := True;
         end;

      // Set animalset and tabs to show
      if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) and
         ( FHerdType = htDairy ) then
         begin
            tsLactSumm.TabVisible := True;
            tsMilkSheet.TabVisible := True;
            tsCurrFert.TabVisible := True;
            tsPastFert.TabVisible := True;
            if DEF.Definition.dUsePedigree then
               begin
                  tsPedigree.TabVisible := True;
                  Result := FemaleDairy;
               end
            else
               Result := FemalePedigree;
         end
      else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) and ( FHerdType = htSuckler ) then
         begin
            tsLactSumm.TabVisible := True;
            tsCurrFert.TabVisible := True;
            tsPastFert.TabVisible := True;
            tsPastCalf.TabVisible := True;
            Application.ProcessMessages;
            if DEF.Definition.dUsePedigree then
               Result := FemalePedigree      //AS this will never be pedigree JT
            else
               Result := FemaleSuckler;
         end
      else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) and ( FHerdType = htBeef ) then
         begin
            tsCattleMargins.TabVisible := True;
            Result := FemaleBeef;
         end
      else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'STEER' ) then
         begin
            tsCattleMargins.TabVisible := True;
            Result := Beef;
         end
      else if (( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'BULL' ) And ( FHerdType = htBeef )) Then
         begin
            tsCattleMargins.TabVisible := True;
            Result := Beef;
         end
      else if ( UPPERCASE( WinData.AnimalFileByIDSex.AsString ) = 'BULL' ) and
              ( (FHerdType = htDairy ) or (FHerdType = htSuckler) ) then
         begin
            tsBullSemen.TabVisible := True;
            tsBullInfo.TabVisible := ( FHerdType = htDairy );
            if ( (DEF.Definition.dUsePedigree) AND (FHerdType = htDairy) ) then
               begin
                  tsPedigree.TabVisible := True;
                  tsPedigree.PageIndex := 9;
                  tsHealth.PageIndex := 10;
               end;
            ReSult := BeefAI;
         end
      else
         ReSult := UnKnown;

      { Weighing Tabs }
      if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) and ( FHerdType <> htDairy ) and ((WinData.AnimalFileByIDLactNo.AsInteger) = 0 ) then
         begin
            tsWeighings.TabVisible := True;
            tsWeighingChart.TabVisible := True;
         end
      else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'STEER' ) then
         begin
            tsWeighings.TabVisible := True;
            tsWeighingChart.TabVisible := True;
         end
      else if (( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'BULL' ) And ( FHerdType <> htDairy )) Then
         begin
            tsWeighings.TabVisible := True;
            tsWeighingChart.TabVisible := True;
         end;

      // Feed Events Tab
      if ( FHerdType = htBeef ) and ( Def.Definition.dUseBeefMan ) then
         tsFeedBreakdown.TabVisible := True;

      LastAnimalType := Result;

      if LastAnimalType <> Unknown then
         begin
            { Set Health Tab to visible, this will fire the HealthTabOnShow event - refreshing qhealth dataset }
            tsHealth.TabVisible := True;
            tsAnimalComments.TabVisible := True;
         end;

      if ( LastAnimalType <> Result ) then
         begin
            // Default to first visible tab.
            AnimalPages.ActivePageIndex := FirstVisibleTabIndex;
            LastTabSheet := AnimalPages.ActivePage;
         end
      else if ( LastTabSheet <> nil ) and ( LastTabSheet.TabVisible ) then
         begin
            AnimalPages.ActivePage := LastTabSheet
         end
      else
         begin
            // Default to first visible tab.
            AnimalPages.ActivePageIndex := FirstVisibleTabIndex;
            LastTabSheet := AnimalPages.ActivePage;
         end;

      if ( not(dbETDamLookup.Visible) ) then
         begin
            sbGoToGenDam.Visible := False;
            Shape6.Height := 60;
         end
      else
         begin
            sbGoToGenDam.Visible := True;
            Shape6.Height := 88;
         end;

   finally
      AnimalPages.Tabs.BeginUpdate;
      AnimalPages.HideTabs := False;
      AnimalPages.Show;
      Screen.Cursor := crDefault;
   end;
   Update;
end;

procedure TfSetUpAnimals.LactSummCalcs;
var
   i : Double;
begin
   // only calculate if tab showing if NOT tsLactSumm.Showing then Exit;

   AnimalPages.OnPageChanging := nil;
   if ( FHerdType = htSuckler ) then
      begin
         lCDaysMilk.Caption := 'Days Suckling';
         lDateDry.Caption := 'Date Weaned';
         dbeCDaysMilk.Hide;
         dbePDaysMilk.Hide;
         dbeCLastTest.Hide;
         dbeCBFat.Hide;
         dbeCProt.Hide;
         dbeC305Y.Hide;
         dbeCTotalY.Hide;
         lLastTest.Hide;
         lBFat.Hide;
         lProt.Hide;
         l305Y.Hide;
         lTotalY.Hide;
         dbePLastTest.Hide;
         dbePBFat.Hide;
         dbePProt.Hide;
         dbeP305Y.Hide;
         dbePTotalY.Hide;
         eCDaysSuck.Show;
         ePDaysSuck.Show;
         lBirthType.Show;
         dbeCBirthType.Show;
         dbePBirthType.Show;
         With qCurrLact do
            begin
               If (qCurrLactDateDry.AsDateTime > 0) And (qCurrLactCalvingDate.AsDateTime > 0) then
                  eCDaysSuck.Text := IntToStr(Round(qCurrLactDateDry.AsDateTime - qCurrLactCalvingDate.AsDateTime))
               else if (qCurrLactCalvingDate.AsDateTime > 0) then
                  begin
                     i := Now - qCurrLactCalvingDate.AsDateTime;
                     eCDaysSuck.Text := FloatToStr(Round(i));
                  end
               else
                  eCDaysSuck.Text := ''
            end;
         With qPastLact do
            begin
               If (qPastLactDateDry.AsDateTime > 0) And (qPastLactCalvingDate.AsDateTime > 0) then
                  ePDaysSuck.Text := IntToStr(Round(qPastLactDateDry.AsDateTime - qPastLactCalvingDate.AsDateTime))
               else if qPastLactCalvingDate.AsDateTime > 0 then
                  begin
                     if (qCurrLactCalvingDate.AsDateTime > 0) then
                        begin
                           i := ((qCurrLactCalvingDate.AsDateTime) - (qPastLactCalvingDate.AsDateTime));
                           ePDaysSuck.Text := FloatToStr(Round(i));
                        end;
                  end
               else
                  ePDaysSuck.Text := '';
            end;
      end
   else
      begin
         lCDaysMilk.Caption := 'Days in Milk';
         lDateDry.Caption := 'Date Dry';
         dbeCDaysMilk.Show;
         dbePDaysMilk.Show;
         dbeCLastTest.Show;
         dbeCBFat.Show;
         dbeCProt.Show;
         dbeC305Y.Show;
         dbeCTotalY.Show;
         lLastTest.Show;
         lBFat.Show;
         lProt.Show;
         l305Y.Show;
         lTotalY.Show;
         dbePLastTest.Show;
         dbePBFat.Show;
         dbePProt.Show;
         dbeP305Y.Show;
         dbePTotalY.Show;
         eCDaysSuck.Hide;
         ePDaysSuck.Hide;
         lBirthType.Hide;
         dbeCBirthType.Hide;
         dbePBirthType.Hide;
         With qCurrLact do
            begin
               If (qCurrLactDateDry.AsDateTime > 0) And (qCurrLactCalvingDate.AsDateTime > 0) then
                  dbeCDaysMilk.Text := IntToStr(Round(qCurrLactDateDry.AsDateTime - qCurrLactCalvingDate.AsDateTime))
               else if (qCurrLactCalvingDate.AsDateTime > 0) then
                  begin
                     i := Now - qCurrLactCalvingDate.AsDateTime;
                     dbeCDaysMilk.Text := FloatToStr(Round(i));
                  end
               else
                  dbeCDaysMilk.Text := ''
            end;
         With qPastLact do
            begin
               If (qPastLactDateDry.AsDateTime > 0) And (qPastLactCalvingDate.AsDateTime > 0) then
                  dbePDaysMilk.Text := IntToStr(Round(qPastLactDateDry.AsDateTime - qPastLactCalvingDate.AsDateTime))
               else if qPastLactCalvingDate.AsDateTime > 0 then
                  begin
                     if (qCurrLactCalvingDate.AsDateTime > 0) then
                        begin
                           i := ((qCurrLactCalvingDate.AsDateTime) - (qPastLactCalvingDate.AsDateTime));
                           dbePDaysMilk.Text := FloatToStr(Round(i));
                        end;
                  end
               else
                  dbePDaysMilk.Text := '';
            end;
      end;
   AnimalPages.OnPageChanging := AnimalPagesPageChanging;
end;

procedure TfSetUpAnimals.CurrFertCalcs( AID, LactNo, EventType : Integer );
var
   IsPreg       : String;
   ProjCalvDate,
   CCalvDate,
   LastEventDate : TDateTime;
   PlanBull,
   BullUsedNo,
   ServType : String;
   EventInterval,
   NumCalves : Integer;
   i,
   J : Byte;
begin
   // clear grid
   EventCount := 1;
   if EventType = cBullingEvent then
      begin
         sgBullings.RowCount := 2;
         sgBullings.Rows[1].Clear;
         eTotBull.Text  := '';
         ePlanBull.Text := '';
      end
   else
      begin
         sgServices.RowCount := 2;
         sgServices.Rows[1].Clear;
         eTotServ.Text  := '';
         eDaysLast.Text := '';
         eProjCalv.Text := '';
      end;
   // set grid title row
   sgBullings.Cells[ 0,0 ] := 'No.';
   sgBullings.Cells[ 1,0 ] := 'Date';
   sgBullings.Cells[ 2,0 ] := 'Interval';

   sgServices.Cells[ 0,0 ] := 'No.';
   sgServices.Cells[ 1,0 ] := 'Date';
   sgServices.Cells[ 2,0 ] := 'Interval';
   sgServices.Cells[ 3,0 ] := 'Bull Used';
   sgServices.Cells[ 4,0 ] := 'Service Type';

   case EventType of
      CBullingEvent : for i := 0 to sgBullings.ColCount-1 do
                         for j := 1 to sgBullings.RowCount do
                             sgBullings.Cells[i, j] := '';
      CServiceEvent : for i := 0 to sgServices.ColCount-1 do
                         for j := 1 to sgServices.RowCount do
                            sgServices.Cells[i, j] := '';
   end;

   // initialise variables
   LastEventDate  := 0;
   ThisEventDate  := 0;
   CalvToEvent    := 0;
   BullUsedNo     := '';
   ServType       := '';
   PlanBull       := '';
   // Get current calving date
   CCalvDate := qCurrLact.FieldByName('CalvingDate').AsDateTime;
      begin
         // Get projected calving date
         //   11/08/15 [V5.4 R7.2] /MK Change - WinData.GetProjCalving was being used twice,
         //                                     once to see if value is greater than zero and a second time to assign text of string field.
         ProjCalvDate := WinData.GetProjCalving(WinData.AnimalFileByIdID.AsInteger,
                                                WinData.AnimalFileByIdLactNo.AsInteger, NumCalves, IsPreg);
         if ( ProjCalvDate > 0 ) then
            eProjCalv.Text := FormatDateTime(cIrishDateStyle, ProjCalvDate);
         ePreg.Text := IsPreg; // SP 09/03/01 Shows whether 0 lact heifer is Yes/No/Undefined.

         // set filters
         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(EventType) + ')';
         WinData.CheckEvents.Filtered := True;

         // find and evaluate first record
         if WinData.CheckEvents.FindFirst then
            begin
               if Round(WinData.CheckEvents.FieldByName('EventDate').AsDateTime - CCalvDate) >= 0 then
                  CalvToEvent := Round(WinData.CheckEvents.FieldByName('EventDate').AsDateTime - CCalvDate);

               if WinData.CheckEvents.FieldByName('EventDate').AsDateTime > 0 then
                  LastEventDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;

               // move calcs to grid
               if EventType = cBullingEvent then
                  begin
                     sgBullings.Cells[ 0, EventCount] := IntToStr(EventCount);
                     sgBullings.Cells[ 1, EventCount] := FormatDateTime(cIrishDateStyle,LastEventDate);
                     sgBullings.Cells[ 2, EventCount] := IntToStr(CalvToEvent);
                  end
               else
                  begin
                     sgServices.Cells[ 0, EventCount] := IntToStr(EventCount);
                     sgServices.Cells[ 1, EventCount] := FormatDateTime(cIrishDateStyle,LastEventDate);
                     sgServices.Cells[ 2, EventCount] := IntToStr(CalvToEvent);
                     // search for service bull & type
                     if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                        if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[]) then
                           BullUsedNo := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                        if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[]) then
                           ServType := WinData.GenLookUp.FieldByName('Description').AsString;
                     if BullUsedNo = '' then
                        sgServices.Cells[ 3, EventCount] := ''
                     else
                        sgServices.Cells[ 3, EventCount] := BullUsedNo;
                     if ServType = '' then
                        sgServices.Cells[ 4, EventCount] := ''
                     else
                        sgServices.Cells[ 4, EventCount] := ServType;
                  end;

               Inc(EventCount);
               // find and evaluate subsequent records
               while WinData.CheckEvents.FindNext do
                  begin
                     // re-initialise variables in loop
                     BullUsedNo := '';
                     EventInterval := 0;
                     ThisEventDate := 0;
                     // find event date and calculate interval from last
                     if WinData.CheckEvents.FieldByName('EventDate').AsDateTime > 0 then
                        ThisEventDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     if Round(ThisEventDate - LastEventDate) > 0 then
                        EventInterval := Round(ThisEventDate - LastEventDate);
                     // move calcs to grid
                     if EventType = cBullingEvent then
                        begin
                           // set row
                           sgBullings.Cells[ 0, EventCount] := IntToStr(EventCount);
                           sgBullings.Cells[ 1, EventCount] := FormatDateTime(cIrishDateStyle,ThisEventDate);
                           sgBullings.Cells[ 2, EventCount] := IntToStr(EventInterval);
                        end
                     else
                        begin
                           // set row
                           sgServices.Cells[ 0, EventCount] := IntToStr(EventCount);
                           sgServices.Cells[ 1, EventCount] := FormatDateTime(cIrishDateStyle,ThisEventDate);
                           sgServices.Cells[ 2, EventCount] := IntToStr(EventInterval);
                           // search for service bull
                           if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                              begin
                                 if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[]) then
                                    BullUsedNo := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                 if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[]) then
                                    ServType := WinData.GenLookUp.FieldByName('Description').AsString;
                              end;
                           if BullUsedNo = '' then
                              sgServices.Cells[ 3, EventCount] := ''
                           else
                              sgServices.Cells[ 3, EventCount] := BullUsedNo;
                           if ServType = '' then
                              sgServices.Cells[ 4, EventCount] := ''
                           else
                              sgServices.Cells[ 4, EventCount] := ServType;
                        end;
                     LastEventDate := ThisEventDate;
                     // increment event counter
                     Inc(EventCount);
                 end;
               // move calcs to text
               if EventType = cBullingEvent then
                  begin
                     // search for planned bull
                     PlanBull := '';
                     if WinData.LookUpBullings.Locate('EventID',
                                    WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                        if WinData.LookUpDamSire.Locate('ID',WinData.LookUpBullings.FieldByName('PlannedBull').AsInteger,[] ) then
                           PlanBull := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                     if PlanBull = '' then
                        ePlanBull.Text := 'None'
                     else
                        ePlanBull.Text := PlanBull;
                     eTotBull.Text := IntToStr(EventCount-1);
                     sgBullings.RowCount := EventCount;
                  end
               else
                  begin
                     // Calculate Days from last service
                     eDaysLast.Text := IntToStr(Round(Now() - LastEventDate));
                     // total num services
                     eTotServ.Text := IntToStr(EventCount-1);
                     sgServices.RowCount := EventCount;
                  end;
         end;
      end;
   Update;
end;

procedure TfSetUpAnimals.PastCalfCalcs;
var
   i,
   j,
   LineCount : Integer;
begin
   // initialise
   LineCount := 2;
   sgPastCalf.RowCount := 3;
   // insert headings into grid

   sgPastCalf.Cells[ 0,0 ] := 'Lact';
   sgPastCalf.Cells[ 1,0 ] := 'Calving';
   sgPastCalf.Cells[ 2,0 ] := 'Birth Type';
   sgPastCalf.Cells[ 3,0 ] := 'Sex';
   sgPastCalf.Cells[ 4,0 ] := 'Calf No';
   sgPastCalf.Cells[ 5,0 ] := 'Sire No';
   sgPastCalf.Cells[ 6,0 ] := 'Sire';
   sgPastCalf.Cells[ 7,0 ] := 'Sale';
   sgPastCalf.Cells[ 8,0 ] := 'Age';
   sgPastCalf.Cells[ 9,0 ] := 'Sale Weight';
   sgPastCalf.Cells[ 10,0 ] := 'Sale';
   sgPastCalf.Cells[ 11,0 ] := 'Daily';

   sgPastCalf.Cells[ 1,1 ] := 'Date';
   sgPastCalf.Cells[ 6,1 ] := 'Breed';
   sgPastCalf.Cells[ 7,1 ] := 'Date';
   sgPastCalf.Cells[ 8,1 ] := '(Days)';
   sgPastCalf.Cells[ 9,1 ] := '(Kgs)';
   sgPastCalf.Cells[ 10,1 ] := 'Price';
   sgPastCalf.Cells[ 11,1 ] := 'Weight Gain';

   for i := 0 to sgPastCalf.ColCount-1 do
      for j := 2 to sgPastCalf.RowCount do
          sgPastCalf.Cells[i, j] := ''; { SP 22/11/2002 }

   // loop for each lactation
   with HoldLactInfo do
      begin
         First;
         while NOT EOF do
            begin
               // Display Calving Event Details
               if ( FieldByName('ALactNo').AsString > '0' ) then
                  begin
                     sgPastCalf.Cells[ 0, LineCount] := FieldByName('ALactNo').AsString;
                     if FieldByName('CalvingDate').AsDateTime > 0 then
                        sgPastCalf.Cells[ 1, LineCount] := FormatDateTime(cIrishDateStyle,FieldByName('CalvingDate').AsDateTime)
                     else
                        sgPastCalf.Cells[ 1, LineCount] := '';
                     sgPastCalf.Cells[ 2, LineCount] := FieldByName('BirthType').AsString;
                     sgPastCalf.Cells[ 3, LineCount] := FieldByName('A1Sex').AsString;
                     sgPastCalf.Cells[ 4, LineCount] := FieldByName('CalfNo1').AsString;
                     sgPastCalf.Cells[ 5, LineCount] := FieldByName('AllCalfSireNo').AsString;
                     sgPastCalf.Cells[ 6, LineCount] := FieldByName('AllCalfSireBreed').AsString;
                     if FieldByName('SaleDate1').AsString <> '' then
                        sgPastCalf.Cells[ 7, LineCount] := FormatDateTime(cIrishDateStyle,FieldByName('SaleDate1').AsDateTime);
                     if HoldLactInfoSaleDate1.AsDateTime > 0 then
                        begin
                           sgPastCalf.Cells[ 8, LineCount]  := IntToStr(Round(HoldLactInfoSaleDate1.AsDateTime - HoldLactInfoDOB1.AsDateTime));
                           if fmAnimalPrint <> nil then
                              fmAnimalPrint.lAgeDaysC1.Caption := sgPastCalf.Cells[ 8, LineCount];
                        end;
                     sgPastCalf.Cells[ 9, LineCount] := FieldByName('SaleWeight1').AsString;
                     sgPastCalf.Cells[ 10, LineCount] := FieldByName('SalePrice1').AsString;
                     if ( FieldByName('DOB1').AsDateTime <> 0 ) and
                        ( FieldByName('SaleDate1').AsDateTime <> 0 ) and
                        ( FieldByName('SaleWeight1').AsFloat > 0 ) and
                        ( FieldByName('BirthWeight1').AsFloat > 0 ) then
                        begin
                           sgPastCalf.Cells[ 11, LineCount] := FloatToStrF((FieldByName('SaleWeight1').AsFloat -
                                                                           FieldByName('BirthWeight1').AsFloat) /
                                                                          (FieldByName('SaleDate1').AsDateTime -
                                                                           FieldByName('DOB1').AsDateTime),
                                                                           ffFixed,8,3);
                           if fmAnimalPrint <> nil then
                              fmAnimalPrint.lDailyWtGainC1.Caption := sgPastCalf.Cells[ 11, LineCount];
                        end;
                     if HoldLactInfoCalfNo2.AsString <> '' then
                        begin
                           Inc(LineCount);
                           sgPastCalf.RowCount := LineCount;
                           sgPastCalf.Cells[ 0, LineCount] := '';
                           sgPastCalf.Cells[ 1, LineCount] := '';
                           sgPastCalf.Cells[ 2, LineCount] := '';
                           sgPastCalf.Cells[ 3, LineCount] := FieldByName('A2Sex').AsString;
                           sgPastCalf.Cells[ 4, LineCount] := FieldByName('CalfNo2').AsString;
                           sgPastCalf.Cells[ 5, LineCount] := FieldByName('AllCalfSireNo').AsString;
                           sgPastCalf.Cells[ 6, LineCount] := FieldByName('AllCalfSireBreed').AsString;
                           if FieldByName('SaleDate2').AsString <> '' then
                              sgPastCalf.Cells[ 7, LineCount] := FormatDateTime(cIrishDateStyle,FieldByName('SaleDate2').AsDateTime);
                           if HoldLactInfoSaleDate2.AsDateTime > 0 then
                              begin
                                 sgPastCalf.Cells[ 8, LineCount] := IntToStr(Round(HoldLactInfoSaleDate2.AsDateTime - HoldLactInfoDOB2.AsDateTime));
                                 if fmAnimalPrint <> nil then
                                    fmAnimalPrint.lAgeDaysC2.Caption := sgPastCalf.Cells[ 7, LineCount];
                              end;
                           sgPastCalf.Cells[ 9, LineCount] := FieldByName('SaleWeight2').AsString;
                           sgPastCalf.Cells[ 10, LineCount] := FieldByName('SalePrice2').AsString;
                           if ( FieldByName('DOB2').AsDateTime <> 0 ) and
                              ( FieldByName('SaleDate2').AsDateTime <> 0 ) and
                              ( FieldByName('SaleWeight2').AsFloat > 0 ) and
                              ( FieldByName('BirthWeight2').AsFloat > 0 ) then
                              begin
                                 sgPastCalf.Cells[ 11, LineCount] := FloatToStrF((FieldByName('SaleWeight2').AsFloat -
                                                                           FieldByName('BirthWeight2').AsFloat) /
                                                                          (FieldByName('SaleDate2').AsDateTime -
                                                                           FieldByName('DOB2').AsDateTime),
                                                                           ffFixed,8,3);
                                 if fmAnimalPrint <> nil then
                                    fmAnimalPrint.lDailyWtGainC2.Caption := sgPastCalf.Cells[ 11, LineCount];
                              end;
                        end;
                     if HoldLactInfoCalfNo3.AsString <> '' then
                        begin
                           Inc(LineCount);
                           sgPastCalf.RowCount := LineCount;
                           sgPastCalf.Cells[ 0, LineCount] := '';
                           sgPastCalf.Cells[ 1, LineCount] := '';
                           sgPastCalf.Cells[ 2, LineCount] := '';
                           sgPastCalf.Cells[ 3, LineCount] := FieldByName('A3Sex').AsString;
                           sgPastCalf.Cells[ 4, LineCount] := FieldByName('CalfNo3').AsString;
                           sgPastCalf.Cells[ 5, LineCount] := FieldByName('AllCalfSireNo').AsString;
                           sgPastCalf.Cells[ 6, LineCount] := FieldByName('AllCalfSireBreed').AsString;
                           if FieldByName('SaleDate3').AsString <> '' then
                              sgPastCalf.Cells[ 7, LineCount] := FormatDateTime(cIrishDateStyle,FieldByName('SaleDate3').AsDateTime);
                           if HoldLactInfoSaleDate3.AsDateTime > 0 then
                              sgPastCalf.Cells[ 8, LineCount] := IntToStr(Round(HoldLactInfoSaleDate3.AsDateTime - HoldLactInfoDOB3.AsDateTime));
                           sgPastCalf.Cells[ 9, LineCount] := FieldByName('SaleWeight3').AsString;
                           sgPastCalf.Cells[ 10, LineCount] := FieldByName('SalePrice3').AsString;
                           if ( FieldByName('DOB3').AsDateTime <> 0 ) and
                              ( FieldByName('SaleDate3').AsDateTime <> 0 ) and
                              ( FieldByName('SaleWeight3').AsFloat > 0 ) and
                              ( FieldByName('BirthWeight3').AsFloat > 0 ) then
                              sgPastCalf.Cells[ 11, LineCount] := FloatToStrF((FieldByName('SaleWeight3').AsFloat -
                                                                        FieldByName('BirthWeight3').AsFloat) /
                                                                       (FieldByName('SaleDate3').AsDateTime -
                                                                        FieldByName('DOB3').AsDateTime),
                                                                        ffFixed,8,3);
                        end;
                     if HoldLactInfoCalfNo4.AsString <> '' then
                        begin
                           Inc(LineCount);
                           sgPastCalf.RowCount := LineCount;
                           sgPastCalf.Cells[ 0, LineCount] := '';
                           sgPastCalf.Cells[ 1, LineCount] := '';
                           sgPastCalf.Cells[ 2, LineCount] := '';
                           sgPastCalf.Cells[ 3, LineCount] := FieldByName('A4Sex').AsString;
                           sgPastCalf.Cells[ 4, LineCount] := FieldByName('CalfNo4').AsString;
                           sgPastCalf.Cells[ 5, LineCount] := FieldByName('AllCalfSireNo').AsString;
                           sgPastCalf.Cells[ 6, LineCount] := FieldByName('AllCalfSireBreed').AsString;
                           if FieldByName('SaleDate4').AsString <> '' then
                              sgPastCalf.Cells[ 7, LineCount] := FormatDateTime(cIrishDateStyle,FieldByName('SaleDate4').AsDateTime);
                           if HoldLactInfoSaleDate4.AsDateTime > 0 then
                              sgPastCalf.Cells[ 8, LineCount] := IntToStr(Round(HoldLactInfoSaleDate4.AsDateTime - HoldLactInfoDOB4.AsDateTime));
                           sgPastCalf.Cells[ 9, LineCount] := FieldByName('SaleWeight4').AsString;
                           sgPastCalf.Cells[ 10, LineCount] := FieldByName('SalePrice4').AsString;
                           if ( FieldByName('DOB4').AsDateTime <> 0 ) and
                              ( FieldByName('SaleDate4').AsDateTime <> 0 ) and
                              ( FieldByName('SaleWeight4').AsFloat > 0 ) and
                              ( FieldByName('BirthWeight4').AsFloat > 0 ) then
                              sgPastCalf.Cells[ 11, LineCount] := FloatToStrF((FieldByName('SaleWeight4').AsFloat -
                                                                        FieldByName('BirthWeight4').AsFloat) /
                                                                       (FieldByName('SaleDate4').AsDateTime -
                                                                        FieldByName('DOB4').AsDateTime),
                                                                        ffFixed,8,3);
                        end;
                     // loop return info
                     Inc(LineCount);
                     sgPastCalf.RowCount := LineCount;
                  end;
                  Next;
            end;
      end;
   Update;
end;

function TfSetUpAnimals.OkToCheck : Boolean;
begin
   // SP 11/03/2003
   if ( LastAnimalID <> WinData.AnimalFileByIdID.AsInteger ) then
      Result := True
   else
      Result := False;
end;

procedure  TfSetUpAnimals.GetLactDetails ( AID : Integer);
  procedure ClearTableContents;
  begin
     with GenQuery do
        begin
           SQL.Clear;
           SQL.Add('DELETE FROM ' + HoldLactInfo.TableName);
           Prepare;
           ExecSQl;
        end;
     if HoldLactInfo.Active then
        HoldLactInfo.Refresh;
  end;
var
   IsPreg,
   NextIsPreg : String;
   NoCalves : integer;
   NextCalvDate  :TDateTime;
begin
   if ( WinData.AnimalFileByIDLactNo.AsInteger = 0 ) then
      ClearTableContents;

   if (OkToCheck) and (not(WinData.AnimalFileByIDLactNo.AsInteger = 0)) and (not(WinData.AnimalFileByID.State = dsInsert)) then
      begin
        // Show the Panel
        sbPrint.Enabled := False;
        pGetInfo.Show;
        pbGetInfo.Position := 0;
        pbGetInfo.Step := 1;
        // initialise
        Refresh;
        NoCalves     := 0;
        NextCalvDate := 0;
        HoldLactInfo.Close;
        qGetServices.Close;
        ClearTableContents;
        with GenQuery do
           begin
              Close;
              UnPrepare;

              //   06/10/11 [V5.0 R1.2] /MK Additional Feature - Add Zero Lact Services To Table First.
              SQL.Clear;
              SQL.Add('INSERT INTO ' + HoldLactInfo.TableName );
              SQL.Add('(AID, ALactNo, NoServices, LastService)');
              SQL.Add('SELECT E.AnimalID, E.AnimalLactNo, COUNT(E.ID) AS NoServices, MAX(E.EventDate) As LastService');
              SQL.Add('FROM Events E');
              SQL.Add('WHERE ( E.AnimalID=' + IntToStr(AID) + ' )');
              SQL.Add('AND ( E.AnimalLactno = 0 )');
              SQL.Add('AND ( E.EventType =' + IntToStr(cServiceEvent) + ' ) ');
              SQL.Add('GROUP BY E.AnimalID, E.AnimalLactNo');
              Prepare;
              ExecSQL;

              SQL.Clear;
              SQL.Add('INSERT INTO ' + HoldLactInfo.TableName );
              SQL.Add('(AID, ALactNo, CalvingDate, BirthID, CalfNo1, CalfNo2,CalfNo3, CalfNo4,');
              SQL.Add(' A1Sex,A2Sex,A3Sex, A4Sex, NoServices,LastService, ');
              SQL.Add(' DOB1,SireID,SaleDate1,BirthWeight1,SaleWeight1,SalePrice1, ');
              SQL.Add(' DOB2,SaleDate2,BirthWeight2,SaleWeight2,SalePrice2,');
              SQL.Add(' DOB3,SaleDate3,BirthWeight3,SaleWeight3,SalePrice3,');
              SQL.Add(' DOB4,SaleDate4,BirthWeight4,SaleWeight4,SalePrice4)');
              SQL.Add('SELECT E.AnimalID, E.AnimalLactNo, E.EventDate CalvDate, C.BirthType BirthID,');
              SQL.Add('A1.AnimalNo CalfNo1,A2.AnimalNo CalfNo2,A3.AnimalNo CalfNo3,A4.AnimalNo CalfNo4,');
              SQL.Add('A1.Sex A1Sex,A2.Sex A2Sex,A3.Sex A3Sex,A4.Sex A4Sex, COUNT(ES.ID) AS NoServices,');
              SQL.Add('MAX(ES.EventDate) AS LastService,');
              SQL.Add('A1.DateOfBirth, A1.SireID, ESale1.EventDate, A1.Birthweight, S1.Weight, S1.Price,');
              SQL.Add('A2.DateOfBirth, ESale2.EventDate, A2.Birthweight, S2.Weight, S2.Price,');
              SQL.Add('A3.DateOfBirth, ESale3.EventDate, A3.Birthweight, S3.Weight, S3.Price,');
              SQL.Add('A4.DateOfBirth, ESale4.EventDate, A4.Birthweight, S4.Weight, S4.Price');
              SQL.Add('FROM Events E');
              SQL.Add('LEFT JOIN Calvings C ON (E.ID=C.EventID)');
              SQL.Add('LEFT JOIN Animals A1 ON (C.ID1=A1.ID)');
              SQL.Add('LEFT JOIN Animals A2 ON (C.ID2=A2.ID)');
              SQL.Add('LEFT JOIN Animals A3 ON (C.ID3=A3.ID)');
              SQL.Add('LEFT JOIN Animals A4 ON (C.ID4=A4.ID)');
              SQL.Add('LEFT JOIN Events ES ON  (ES.AnimalID=E.AnimalID) and (ES.animalLactNo=E.AnimalLactno) and (ES.EventType=' + IntToStr(cServiceEvent) + ')');
              SQL.Add('LEFT JOIN Events ESale1 ON (ESale1.AnimalID=C.ID1) and (ESale1.EventType=' + IntToStr(cSaleDeathEvent) + ')');
              SQL.Add('LEFT JOIN SalesDeaths S1 ON (S1.EventID=ESale1.ID)');
              SQL.Add('LEFT JOIN Events ESale2 ON (ESale2.AnimalID=C.ID2) and (ESale2.EventType=' + IntToStr(cSaleDeathEvent) + ')');
              SQL.Add('LEFT JOIN SalesDeaths S2 ON (S2.EventID=ESale2.ID)');
              SQL.Add('LEFT JOIN Events ESale3 ON (ESale3.AnimalID=C.ID3) and (ESale3.EventType=' + IntToStr(cSaleDeathEvent) + ')');
              SQL.Add('LEFT JOIN SalesDeaths S3 ON (S3.EventID=ESale3.ID)');
              SQL.Add('LEFT JOIN Events ESale4 ON (ESale4.AnimalID=C.ID4) and (ESale4.EventType=' + IntToStr(cSaleDeathEvent) + ')');
              SQL.Add('LEFT JOIN SalesDeaths S4 ON (S4.EventID=ESale4.ID)');
              SQL.Add('WHERE (E.AnimalID=' + IntToStr(AID) + ')');
              SQL.Add('AND   (E.EventType = ' + IntToStr(cCalvingEvent) + ')');
              SQL.Add('GROUP BY E.AnimalID, E.AnimalLactNo, E.EventDate, C.BirthType,');
              SQL.Add('A1.AnimalNo,A2.AnimalNo,A3.AnimalNo,A4.AnimalNo,');
              SQL.Add('A1.Sex,A2.Sex,A3.Sex,A4.Sex,');
              SQL.Add('ESale1.EventDate,S1.Weight,S1.Price,');
              SQL.Add('ESale2.EventDate,S2.Weight,S2.Price,');
              SQL.Add('ESale3.EventDate,S3.Weight,S3.Price,');
              SQL.Add('ESale4.EventDate,S4.Weight,S4.Price,');
              SQL.Add('A1.DateOfBirth,A2.DateOfBirth,A3.DateOfBirth,A4.DateOfBirth,');
              SQL.Add('A1.BirthWeight,A2.BirthWeight,A3.BirthWeight,A4.BirthWeight,');
              SQL.Add('A1.SireID');
              Prepare;
              ExecSQL;
           end;

        // get calculated fields
        with HoldLactInfo do
          begin
             Open;
             dsHoldLactInfo.DataSet.Refresh;
             // Open the Services query
             qGetServices.Close;
             qGetServices.Prepare;
             qGetServices.Open;
             pbGetInfo.Min := 0;
             pbGetInfo.Max := RecordCount;
             Last;
             // get projected calving
             if WinData.GetProjCalving(FieldByName('AID').ASInteger,
                                    FieldByName('ALactNo').ASInteger, NoCalves, IsPreg) > 0 then
                NextCalvDate := WinData.GetProjCalving(FieldByName('AID').ASInteger,
                                                    FieldByName('ALactNo').ASInteger, NoCalves, NextIsPreg);
             // set the Pregnancy Status
             ePreg.Text := IsPreg;
             // find last calving

             while NOT BOF do
                begin
                   Edit;
                   //   calculate calving index
                   //   06/10/11 [V5.0 R1.2] /MK Additional Feature - Only Calc If Not Zero Lact.
                   if (FieldByName('ALactNo').AsInteger > 0) then
                      begin
                         if Round(NextCalvDate-FieldByName('CalvingDate').AsDateTime) > 0 then
                            FieldByName('CalvingIndex').AsInteger := Round(NextCalvDate-FieldByName('CalvingDate').AsDateTime);
                         // get birthtype
                         if HoldLactInfoBirthID.AsString <> '' then
                            if WinData.GenLookUp.Locate('ID',HoldLactInfoBirthID.AsInteger,[]) then
                               HoldLactInfoBirthType.AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                         // cut calf types to single field
                         if (HoldLactInfoA1Sex.AsString = '') then
                            HoldLactInfoAllCalfSex.AsString := ''
                         else
                            begin
                               if (HoldLactInfoA1Sex.AsString <> '') And (HoldLactInfoA2Sex.AsString = '') then
                                  HoldLactInfoAllCalfSex.AsString := HoldLactInfoA1Sex.AsString
                               else
                                  if (HoldLactInfoA4Sex.AsString <> '') then
                                     HoldLactInfoAllCalfSex.AsString := (Copy(HoldLactInfoA1Sex.AsString,1,2) + '/' +
                                                                      Copy(HoldLactInfoA2Sex.AsString,1,2) + '/' +
                                                                      Copy(HoldLactInfoA3Sex.AsString,1,2) + '/' +
                                                                      Copy(HoldLactInfoA4Sex.AsString,1,2))
                                  else
                                     if (HoldLactInfoA3Sex.AsString <> '') then
                                        HoldLactInfoAllCalfSex.AsString := (Copy(HoldLactInfoA1Sex.AsString,1,3) + '/' +
                                                                         Copy(HoldLactInfoA2Sex.AsString,1,3) + '/' +
                                                                         Copy(HoldLactInfoA3Sex.AsString,1,3))
                                     else
                                        HoldLactInfoAllCalfSex.AsString := (Copy(HoldLactInfoA1Sex.AsString,1,5) + '/' +
                                                                         Copy(HoldLactInfoA2Sex.AsString,1,6));
                            end;
                         // cut calf numbers to single field
                         if (HoldLactInfoCalfNo1.AsString = '') then
                            HoldLactInfoAllCalfNo.AsString := ''
                         else
                            begin
                               if (HoldLactInfoCalfNo1.AsString <> '') And (HoldLactInfoCalfNo2.AsString = '') then
                                  HoldLactInfoAllCalfNo.AsString := HoldLactInfoCalfNo1.AsString
                               else
                                  if (HoldLactInfoCalfNo2.AsString <> '') And (HoldLactInfoCalfNo3.AsString = '') then
                                     HoldLactInfoAllCalfNo.AsString := (Copy(HoldLactInfoCalfNo1.AsString,1,5) + '/' +
                                                                      Copy(HoldLactInfoCalfNo2.AsString,1,5))
                                  else
                                     if (HoldLactInfoCalfNo3.AsString <> '') then
                                        HoldLactInfoAllCalfNo.AsString := (Copy(HoldLactInfoCalfNo1.AsString,1,4) + '/' +
                                                                         Copy(HoldLactInfoCalfNo2.AsString,1,4) + '/...');
                            end;

                         if (HoldLactInfoSireID.AsInteger = 0 ) then
                            begin
                               HoldLactInfoAllCalfSireNo.AsString := '';
                               HoldLactInfoAllCalfSireBreed.AsString := '';
                            end
                         else if WinData.LookUpDamSire.Locate('ID',HoldLactInfoSireID.AsInteger,[]) then
                            begin
                               HoldLactInfoAllCalfSireNo.AsString := WinData.LookupDamSire.FieldByName('AnimalNo').AsString;
                               if WinData.Breeds.Locate('ID',WinData.LookupDamSire.FieldByName('PrimaryBreed').AsInteger,[]) then
                                  HoldLactInfoAllCalfSireBreed.AsString := WinData.Breeds.FieldByName('Code').AsString;
                            end;

                         if qGetServices.Locate('AnimalID;AnimalLactNo',VarArrayOf([HoldLactInfoAID.AsInteger,
                                           HoldLactInfoALactNo.AsInteger]),[] ) then
                            begin
                               HoldLactInfoServiceBull.AsString := qGetServices.FieldByName('ServiceBull').AsString;
                               HoldLactInfoServiceType.AsString := qGetServices.FieldByName('ServiceType').AsString;
                            end;
                         // loop return info
                         NextCalvDate := FieldByName('CalvingDate').AsDateTime;
                   end
                else
                   //   10/10/11 [V5.0 R1.3] /MK Additional Feature - Add Service Bull And Service Type For Zero Lact Services.
                   begin
                      if qGetServices.Locate('AnimalID;AnimalLactNo',VarArrayOf([HoldLactInfoAID.AsInteger,
                                        HoldLactInfoALactNo.AsInteger]),[] ) then
                         begin
                            HoldLactInfoServiceBull.AsString := qGetServices.FieldByName('ServiceBull').AsString;
                            HoldLactInfoServiceType.AsString := qGetServices.FieldByName('ServiceType').AsString;
                         end;
                   end;
                   Prior;
                   pbGetInfo.StepIt;
                end;

             First;
             if FieldByName('AID').AsInteger = 0 then
                Delete;

          end;
   end;

   // reset secondary queries
   qCurrLact.Close; // SP 11/03/2003
   qCurrLact.UnPrepare;
   qPastLact.Close; // SP 11/03/2003
   qPastLact.UnPrepare;
   qCurrLact.ParamByName('AnimalID').asInteger := WinData.AnimalFileByIDID.AsInteger;
   qCurrLact.ParamByName('AnimalLactNo').asInteger := WinData.AnimalFileByIDLactNo.AsInteger;
   qPastLact.ParamByName('AnimalID').asInteger := WinData.AnimalFileByIDID.AsInteger;
   qPastLact.ParamByName('AnimalLactNo').asInteger := WinData.AnimalFileByIDLactNo.AsInteger-1;
   qCurrLact.Prepare;
   qCurrLact.Open;
   qPastLact.Prepare;
   qPastLact.Open; // SP 11/03/2003
   // Hide the Panel
   pGetInfo.Hide;
   sbPrint.Enabled := True;
   // Set the Last Animal ID
   LastAnimalID := WinData.AnimalFileByIdID.AsInteger;
end;

procedure TfSetUpAnimals.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   // Check to see if the user changed data
   CanClose := fmAnimalPrint = nil;
   if CanClose then
      CanClose := ( WinData.DataSetApplyUpdates(Windata.AnimalFileByID, ModalResult = mrOK, FModified ) And
                    WinData.DataSetApplyUpdates(Windata.MilkCumulative, ModalResult = mrOK FModified));
end;

procedure TfSetUpAnimals.PrimBreedDblClick(Sender: TObject);
begin
   If SearchDlg.ShowModalBreeds = mrOK Then
      Begin
           WinData.AnimalFileByID.Edit;
       	   (Sender as TDBEdit).Text := SearchDlg.BreedCode;
      End;
end;

procedure TfSetUpAnimals.DamIDDblClick(Sender: TObject);
begin
   If SearchDlg.ShowModalDams = mrOK Then
      Begin
         WinData.AnimalFileByID.Edit;
       	 WinData.AnimalFileByIDDamID.Value := SearchDlg.DamCode;
      End;
end;

procedure TfSetUpAnimals.SireIDDblClick(Sender: TObject);
begin
   If SearchDlg.ShowModalSires = mrOK Then
      Begin
         WinData.AnimalFileByID.Edit;
       	 WinData.AnimalFileByIDSireID.Value := SearchDlg.SireCode;
      End;
end;

procedure TfSetUpAnimals.ExitButtonClick(Sender: TObject);
begin
   // ensure pedigree is closed
   if sbPedDetails.Down then
      begin
         sbPedDetails.Down := False;
         ShowHideDeleteButton;
         //First enable the First/Last etc buttons in the Navigator bar
         fSetUpAnimals.nbScrollRecords.Enabled := True;
         //Now clear the Selected AnimalID
         //Now to ensure that we have the Current Animal
         WinData.AnimalFileByID.GotoBookmark(AnimalBookMark);
         pPedigree.Hide;  //KVB
         // turn on browser
         if cbBrowser.checked = false then
            begin
               animalpages.Visible := true;
               GetAnimalType;
            end;
         // show nav bar and browser button
         cbBrowser.Visible := true;
         nbScroll.Show;     //Show nbScroll buttons
         sbAddAmend.Hide;    //KVB
         sbAddAmend.Width := 46;  //KVB
         sbAddAmend.Left := sbHelp.Left + sbHelp.Width;  //KVB
         nbScroll.Left := 90;   //KVB
         nbScroll.Show;  //KVB
         pSelAnimal.Hide;
         pPedigree.Hide;  //KVB
         pMainDetails.Show;
      end
   else
      Close;
end;

procedure TfSetUpAnimals.cmboHerdLookUpCloseUp(Sender: TObject);
begin
   if cmboHerdLookUp.Value = '0' then
      Exit;
   if (cmboHerdLookUp.Text = '<Add>') then
      begin
         WinData.OwnerFile.Append;
         WinData.CreateAndShowForm(TfHerdSetUp);
      end
   else
      WinData.HerdType;
   SetColorMandatory;
end;


procedure TfSetUpAnimals.FormShow(Sender: TObject);
begin
   // 28/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user reconcile ancestry data with HUK
   ShowHUKControls := (WinData.SystemRegisteredCountry<>Ireland) and (Def.Definition.dUsePedigree=True);


   if ( WinData.UseScanner ) and ( WinData.AnimalFileByID.State = dsInsert ) then
      begin
         imgBarcode.Visible := True;
         imgBarcode2.Visible := True;
         StatusBar.Panels.Items[0].Text := cBarCodeScannerOnCaption
      end
   else
      begin
         imgBarcode.Visible := False;
         imgBarcode2.Visible := False;
         StatusBar.Panels.Items[0].Text := cBarCodeScannerOffCaption;
      end;

   AnimalPages.HideTabs := True;

   WinData.tBullSemen.Refresh;
   WinData.tBullExt.Refresh;

   ScanInCode.Text := ''; // Reset scanner input

   if DEF.Definition.dUseMilkRec then
      MilkDiskTrans.Open;
   WinData.MilkCumulative.MasterFields := 'ID';

   if (DEF.Definition.dUsePedigree) then
      begin
         if NOT ( FHerdType = htBeef ) then
            if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) then
               begin
                  tsPedigree.PageIndex := 9;
                  tsHealth.PageIndex := 10;
               end
      end;

  ScanInCode.Hide;
  if WinData.UseScanner then
     ReScan.Show;

  if WinData.AnimalFileByID.State = dsInsert then
     if WinData.UseScanner then
        ActivateScan(True)
     else
        ActivateScan(False);

   if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = UPPERCASE('STEER') ) then
      begin
         BruceDate.Visible   := False;
         Label56.Visible     := False;
         Breeding.Visible    := False;
         cbPedigree.Visible  := False;
      end
   else
      begin
         BruceDate.Visible   := True;
         Label56.Visible     := True;
         Breeding.Visible    := True;
         cbPedigree.Visible  := True;
      end;

   lBVDTestDate.Top := 271;
   BVDDate.Top := 268;
   if ( not(BruceDate.Visible) ) then
      begin
         lBVDTestDate.Top := Label56.Top;
         BVDDate.Top := BruceDate.Top;
      end;

   SetColorMandatory;
   RefreshHealthQuery; // refresh the health query for browse health tab.
   FModified := False;
   MenuForm.sbExit.Enabled := False;
   FFormShowing := True;

end;

procedure TfSetUpAnimals.AnimalColourCloseUp(Sender: TObject);
begin
   if AnimalColour.Value = '0' Then
      begin
         GenLookUpType := TAnimalColour;
         uGenLookSetUp.ShowTheForm(TRUE);                      // blank record on open
      end;
end;

procedure TfSetUpAnimals.cmboHerdLookUpExit(Sender: TObject);
begin
   SetColorMandatory;
   DisplayInherdField;
end;

procedure TfSetUpAnimals.FormActivate(Sender: TObject);
begin
   dbWeighingGraph.Visible := True;
   GridWeighingBarChart.Visible := False;
   // Set Focus to the HerdID  SP 10/11/00 New SetupAnimals Screen format.
   if ( WinData.AnimalFileByID.State = dsInsert ) then
      begin
         if WinData.UserDefaultHerdID <> WinData.NONEHerdID then
            cmboHerdLookUp.KeyValue := Windata.UserDefaultHerdID;
         cmboHerdLookUp.SetFocus;
         // If animal had inter herd, setfocus to herd combo wasn't working.
      end;

   if WinData.ShowAllAnimals then
      fSetUpAnimals.InHerd.Visible := True
   else
      fSetUpAnimals.InHerd.Visible := False;

   sbAddAmend.Hide;    //KVB
   sbAddAmend.Width := 46;  //KVB
   sbAddAmend.Left := sbHelp.Left + sbHelp.Width;  //KVB
   nbScroll.Left := 90;
   nbScroll.Width := 144;  //KVB
   nbScroll.Show;  //KVB
   pSelAnimal.Hide;
   if ( Windata.AnimalFileByID.State = dsInsert ) then
      begin
         sbAnimalPurch.Enabled := False;  //Prevents a Purchase record being saved for a non-existant animal
         LactationNo.Enabled := True;
      end
   else
      begin
         sbAnimalPurch.Enabled := True;  //Prevents a Purchase record being saved for a non-existant animal
         LactationNo.Enabled := False;
      end;
   DisplayInherdField;
   AnimalType;

   SetAncestryDisplayFields;

   if ( WinData.AnimalFileByID.State = dsInsert ) then
      SetNatId.Show
   else
      SetNatId.Hide;
   SetColorMandatory;

   if ( WinData.HerdSpecies(WinData.UserDefaultHerdID) <> cSpecies_Bovine ) then
      SetNatID.Caption := 'Clear'
   else
      begin
         SetNatId.Font.Color := WinData.SetButtonColour;
         SetNatID.Caption := 'Tag Type';
      end;

   Update;
   SetMilkDiskGridDisplayColumns;
   SetGridFooters(dbgMilkTrans, 0);

   if ( WinData.AnimalFileByID.State = dsInsert ) then
      begin
         if ( DefaultAnimalType = atAIBullTestBeef ) then
            begin
               WinData.AnimalFileByIDHerdID.AsInteger := WinData.NONEHerdID;
               WinData.AnimalFileByIDSex.AsString := cSex_Bull;
               WinData.AnimalFileByIDNatIDNum.EditMask := '';
               WinData.AnimalFileByIDBreeding.AsBoolean := True;
               //   21/01/19 [V5.8 R6.3] /MK Bug Fix - If BullSemenStk in Insert mode then default BullSemenStk.InUse to True.
               //                                      InUse is set to false sometimes when you open the SetupAnimals, close and re-open it - SP.
               if ( WinData.tBullSemen.State = dsInsert ) then
                  WinData.tBullSemen.FieldByName('InUse').AsBoolean := True;
               AnimalType;
            end
         //   18/04/19 [V5.8 R8.9] /MK Change - Added check for atNonHerdDam to then default sex to Female.
         else if ( DefaultAnimalType in [atNonHerdAncestor, atNonHerdDam] ) then
            begin
               WinData.AnimalFileByIDHerdID.AsInteger := WinData.NONEHerdID;
               WinData.AnimalFileByIDBreeding.AsBoolean := True;
               WinData.AnimalFileByIDNatIDNum.EditMask := '';
               WinData.AnimalFileByIDAncestor.AsBoolean := True;
               if ( WinData.AnimalFileByIDSex.AsString <> '' ) then
                  AnimalType;
               if ( DefaultAnimalType = atNonHerdDam ) then
                  WinData.AnimalFileByIDSex.AsString := cSex_Female;
            end
         else if DefaultAnimalType = atPurchasing then
            begin
               if ( WhichReg = Ireland ) then
                  WinData.AnimalFileByIDNatIDNum.EditMask := WinData.DefaultNatIDMask
               else if ( WhichReg = NIreland ) then
                  WinData.AnimalFileByIDNatIDNum.EditMask := WinData.DefaultNatIdUK9Mask
               else if ( WhichReg = England ) then
                  WinData.AnimalFileByIDNatIDNum.EditMask := WinData.DefaultNatIdUKMask;
            end;
         SetActiveControl;
      end;

   SetMandatoryControlColours;

   dbcbQualityAssured.Visible := ( Def.Definition.dUseBeefMan ) and ( FHerdType = htBeef ) and ( WhichReg = Ireland ) ;
   if ( dbcbQualityAssured.Visible ) then
      dbcbQualityAssured.Left := Breeding.Left-1;

   //   26/11/14 [V5.4 R0.1] /MK Bug Fix - Default DOB.ReadOnly to False. DOB.ReadOnly = True where the user is editing the animal and
   //                                     the animal was not added to the herd from a cow calving event.
   DOB.ReadOnly := False;
   if ( FAddOrEdit = aeEdit ) then
      DOB.ReadOnly := ( WinData.IsCalvesCalvedDam(WinData.AnimalFileByID.FieldByName('DamID').AsInteger,
                                                  WinData.AnimalFileByID.FieldByName('ID').AsInteger,
                                                  WinData.AnimalFileByID.FieldByName('DateOfBirth').AsDateTime) );
   PageControl1.ActivePageIndex := 0;

   OnActivate := nil;
end;

procedure TfSetUpAnimals.SetNatIDClick(Sender: TObject);
begin
   if SetNatID.Caption = 'Clear' then // GOATS / HORSES Herd Species
      begin
         if ( WinData.AnimalFileByID.State in [dsInsert, dsEdit] ) then
            begin
               WinData.AnimalFileByIDNatIDNum.AsString := '';
               WinData.AnimalFileByIDNatIDNum.EditMask := '';
            end;
      end
   else // BOVINE Herd Species
      begin
         WinData.CreateAndShowForm(TfDefaults);
         NatIDNo.Clear;
         if ( WinData.AnimalFileByID.State in [dsInsert, dsEdit] ) then
            begin
               WinData.AnimalFileByIDNatIDNum.Text := '';
               WinData.AnimalFileByIDNatIDNum.EditMask := WinData.DefaultNatIDMask;
               SetNatId.Font.Color := WinData.SetButtonColour;
            end;
      end;
end;

procedure TfSetUpAnimals.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Update;

   // Clear the Edit Mask
   if WinData.AnimalFileByIDNatIDNum.EditMask <> '' then
      WinData.AnimalFileByIDNatIDNum.EditMask := '';

   if MilkDiskTrans.Active then
      MilkDiskTrans.Active := False;
   if tPedDetails.Active then
      tPedDetails.Active := False;
   CheckDBBrowserState;

   QueryWeighings.Active := False;

   if mdGroups.Active then
      mdGroups.Active := False;

   LastAnimalType := Unknown;
   OnActivate := FormActivate;
   AnimalPages.HideTabs := True;
   MenuForm.sbExit.Enabled := True;
   fSetUpAnimals.DefaultAnimalType := atNone;
   Update;

   if WinData.GlobalSettings.AnimalWeighingGraphXAxisValue <> WeighingGraphTrackBar.Position then
      begin
         WinData.GlobalSettings.AnimalWeighingGraphXAxisValue := WeighingGraphTrackBar.Position;
         WinData.SavePreferences;
      end;

   FOpenFromAnimalBrowser := False;

   SendMessage(MenuForm.Handle, WM_RefreshGridViewExternalData, 0, 0);
end;

procedure TfSetUpAnimals.SetUpPedigree;
var
   PIntArray : PIntegerArray;
begin
   SetLength(PIntArray,1);
   PIntArray[0] := CurrentAnimal^;
   HerdLookup.CreatePedigreeTable(PIntArray);
end;

procedure TfSetUpAnimals.sbPedDetailsClick(Sender: TObject);
begin
   PageControl1.ActivePageIndex := 0;
   ShowHideDeleteButton;
   If sbPedDetails.Down Then
      Begin     //Button pressed down
         if not DirectoryExists('C:\Kingswood Herd Management\Images') then
            CreateDir('C:\Kingswood Herd Management\Images');
         //First disable the First/Last etc buttons in the Navigator bar
         try
            fPedAddAmend := TfPedAddAmend.Create(nil);
         except
            on E: Exception do
               begin
                  sbPedDetails.Down := False;
                  raise Exception.Create(cFormCreateError);
               end;
         end;

         PageControl1.ActivePageIndex := 0;
         fSetUpAnimals.nbScrollRecords.Enabled := False;
         //Now to BookMark Animal in table
         New(CurrentAnimal);
         CurrentAnimal^ := WinData.AnimalFileByIDID.AsInteger;
         AnimalBookMark := WinData.AnimalFileByID.GetBookmark;  //Bookmarks current location
         SetUpPedigree;  // CALL TO MAKE SURE THE ANIMAL HAS CORRECT INFO
         sbCurrAnimalClick(nil);
         nbScroll.Hide;     //KVB
         sbAddAmend.Left := nbScroll.Left;   //KVB
         sbAddAmend.Show;     //KVB
         sbAddAmend.Width := 46;  //KVB  nbScroll.Width;
         pSelAnimal.Show;
         pMainDetails.Hide;
         pPedigree.Show;  //KVB
      End
   Else
      begin  //Button has been released
         if CurrentAnimal <> nil then
            Dispose(CurrentAnimal);

         if fPedAddAmend <> nil then
            fPedAddAmend.Free;
         sbExit.Enabled := True;
         //First enable the First/Last etc buttons in the Navigator bar
         fSetUpAnimals.nbScrollRecords.Enabled := True;
         //Now clear the Selected AnimalID
         //Now to ensure that we have the Current Animal
         WinData.AnimalFileByID.GotoBookmark(AnimalBookMark);
         nbScroll.Show;     //Show nbScroll buttons
         sbAddAmend.Hide;    //KVB
         sbAddAmend.Width := 46;  //KVB
         sbAddAmend.Left := sbHelp.Left + sbHelp.Width;  //KVB
         nbScroll.Left := 90;   //KVB
         nbScroll.Show;  //KVB
         pSelAnimal.Hide;
         pPedigree.Hide;  //KVB
         pMainDetails.Show;
      end;
end;

procedure TfSetUpAnimals.GetImage;
const
    jpeg = '.jpeg';
    jpg  = '.jpg';
var
   AID : String;
   FileName : String;
   FileToPrint : String;
   FileHeight : Integer;
   FileWidth : Integer;
begin
   //Need to reposition fields depending on whether an Image exists
   AID := IntToStr(ImageID);
   FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\'+'1';  //Animal Image

   if FileExists(FileToPrint+jpeg) then
      FileName := FileToPrint+jpeg
   else if FileExists(FileToPrint+jpg) then
      FileName := FileToPrint+jpg
   else
      begin
         lNoImage.Visible := True;
         ImagePedigree.Width := 0;
         Exit;
      end;
   //Image Exists Settings
   lNoImage.Visible := False;  //Turn off "No Image Available" message
   //Need some code below to get the File Extension to allow different File types to be used
   //Load Image into GenImage to get image size
   GenImage.Picture.LoadFromFile(FileName);   //Animal Image
   FileHeight := GenImage.Height;
   FileWidth := GenImage.Width;
   GenImage.Width := 0;     //Prevents Image from being visible
   //Set Default size for Report Image
   ImagePedigree.Stretch := False;   //Turns off Stretching
   ImagePedigree.Height := 446;
   ImagePedigree.Width := 780;
   //Need to check that the File Type is compatible with the Image Object
   ImagePedigree.Picture.LoadFromFile(FileName);   //Animal Image
   //Now to adjust the Width of the Image to the ratio of GenImage keeping the Height limited to 446 and Width limited to 780.
   if ((( FileWidth * 1000 ) / FileHeight ) <= ( 780000 / 446 )) then
      begin
         ImagePedigree.Height := 446;
         ImagePedigree.Width := Round(( FileWidth * ImagePedigree.Height ) / FileHeight );  //Adjust Image Width
      end
   else
      begin
         ImagePedigree.Width := 780;
         ImagePedigree.Height := Round(( FileHeight * ImagePedigree.Width ) / FileWidth );  //Adjust Image Height
      end;
   ImagePedigree.Stretch := True;   //Now to Stretch Image to fit
end;

procedure TfSetUpAnimals.CheckEligDates ( Sender : TObject );
Var
   NoMonths : Integer;
   NewDate  : TDate;
begin
     // On exiting the Date of Birth check the Animal Sex and see if the Eligibility
     // Date needs to be recalculated
     if WinData.AnimalFileByIDSex.AsString = 'Steer' then
        begin
           // Find the First Premium
           if WinData.BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([WinData.AnimalFileByIDID.Value,'F']),[] ) then
              if WinData.BeefSubsidy.FieldByName('ApplicationDate').IsNull then
                 begin
                    if ( WinData.AnimalFileByIDDateOfBirth.AsDateTime > 0 ) and
                       ( WinData.AnimalFileByIDDateOfBirth.AsDateTime <= Now() ) then
                       begin
                          NoMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,M,F);
                          NewDate := IncMonth(WinData.AnimalFileByIDDateOfBirth.Value, NoMonths);
                          if ( Sender is TRxSpeedButton ) or
                             ( SavingRecord ) then
                             begin
                                WinData.BeefSubsidy.Edit;
                                WinData.BeefSubsidy.FieldByName('EligibilityDate').AsDateTime := NewDate;
                                WinData.BeefSubsidy.Post;
                                // fix to apply cached updates - kr/sp - 21/9/00
                                WinData.BeefSubsidyAfterDelete(WinData.BeefSubsidy);
                                try
                                    WinData.GenQuery.Close;
                                    WinData.GenQuery.UnPrepare;
                                    WinData.GenQuery.SQL.Clear;
                                    WinData.GenQuery.SQL.Add('UPDATE ' + WinData.Events.TableName);
                                    WinData.GenQuery.SQL.Add('SET EventDate=' + '''' + FormatDateTime('mm/dd/yyyy',NewDate) + '''');
                                    WinData.GenQuery.SQL.Add('WHERE ID=' + WinData.BeefSubsidy.FieldByName('EventID').AsString);
                                    WinData.GenQuery.Prepare;
                                    WinData.GenQuery.ExecSQL;
                                    WinData.EventSource.DataSet.Refresh;
                                except

                                end;
                             end;
                       end
                    // Date of Birth After today
                    else if ( WinData.AnimalFileByIDDateOfBirth.AsDateTime > Now() ) then
                        MessageDLG(Format('Date of Birth %s cannot be after Today %s',
                                   [FormatDateTime(cIrishDateStyle,
                                    WinData.AnimalFileByIDDateOfBirth.AsDateTime),
                                    FormatDateTime(cIrishDateStyle,Now())
                                   ]),mtWarning,[mbOK],0)
                    else
                       MessageDLG(cCannotCalcEligNoDOB,mtWarning,[mbOK],0);
                 end;
           // Find the Second Premium
           if WinData.BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([WinData.AnimalFileByIDID.Value,'S']),[] ) then
              if WinData.BeefSubsidy.FieldByName('ApplicationDate').IsNull then
                 begin
                    if ( WinData.AnimalFileByIDDateOfBirth.AsDateTime > 0 ) and
                       ( WinData.AnimalFileByIDDateOfBirth.AsDateTime <= Now() ) then
                       begin
                          NoMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,M,S);
                          NewDate := IncMonth(WinData.AnimalFileByIDDateOfBirth.Value, NoMonths);
                          if ( Sender is TRxSpeedButton ) or
                             ( SavingRecord ) then
                             begin
                                WinData.BeefSubsidy.Edit;
                                WinData.BeefSubsidy.FieldByName('EligibilityDate').Value := NewDate;
                                WinData.BeefSubsidy.Post;
                                // fix to apply cached updates - kr/sp - 21/9/00
                                WinData.BeefSubsidyAfterDelete(WinData.BeefSubsidy);
                                try
                                    WinData.GenQuery.Close;
                                    WinData.GenQuery.UnPrepare;
                                    WinData.GenQuery.SQL.Clear;
                                    WinData.GenQuery.SQL.Add('UPDATE ' + WinData.Events.TableName);
                                    WinData.GenQuery.SQL.Add('SET EventDate=' + '''' + FormatDateTime('mm/dd/yyyy',NewDate) + '''');
                                    WinData.GenQuery.SQL.Add('WHERE ID=' + WinData.BeefSubsidy.FieldByName('EventID').AsString);
                                    WinData.GenQuery.Prepare;
                                    WinData.GenQuery.ExecSQL;
                                    WinData.EventSource.DataSet.Refresh;
                                except

                                end;
                              end;
                       end
                    // Date of Birth After today
                    else if ( WinData.AnimalFileByIDDateOfBirth.AsDateTime > Now() ) then
                        MessageDLG(Format('Date of Birth %s cannot be after Today %s',
                                   [FormatDateTime(cIrishDateStyle,
                                    WinData.AnimalFileByIDDateOfBirth.AsDateTime),
                                    FormatDateTime(cIrishDateStyle,Now())
                                   ]),mtWarning,[mbOK],0)
                    else
                       MessageDLG(cCannotCalcEligNoDOB,mtWarning,[mbOK],0);
                 end;
        end
     else if WinData.AnimalFileByIDSex.AsString = 'Bull' then
        begin
           // Find the First Premium
           if WinData.BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([WinData.AnimalFileByIDID.Value,'B']),[] ) then
              if WinData.BeefSubsidy.FieldByName('ApplicationDate').IsNull then
                 begin
                    if ( WinData.AnimalFileByIDDateOfBirth.AsDateTime > 0 ) and
                       ( WinData.AnimalFileByIDDateOfBirth.AsDateTime <= Now() ) then
                       begin
                          NoMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,M,F);
                          NewDate := IncMonth(WinData.AnimalFileByIDDateOfBirth.Value, NoMonths);
                          if ( Sender is TRxSpeedButton ) or
                             ( SavingRecord ) then
                             begin
                                WinData.BeefSubsidy.Edit;
                                WinData.BeefSubsidy.FieldByName('EligibilityDate').Value := NewDate;
                                WinData.BeefSubsidy.Post;
                                // fix to apply cached updates - kr/sp - 21/9/00
                                WinData.BeefSubsidyAfterDelete(WinData.BeefSubsidy);
                                try
                                   WinData.GenQuery.Close;
                                   WinData.GenQuery.UnPrepare;
                                   WinData.GenQuery.SQL.Clear;
                                   WinData.GenQuery.SQL.Add('UPDATE ' + WinData.Events.TableName);
                                   WinData.GenQuery.SQL.Add('SET EventDate=' + '''' + FormatDateTime('mm/dd/yyyy',NewDate) + '''');
                                   WinData.GenQuery.SQL.Add('WHERE ID=' + WinData.BeefSubsidy.FieldByName('EventID').AsString);
                                   WinData.GenQuery.Prepare;
                                   WinData.GenQuery.ExecSQL;
                                   WinData.EventSource.DataSet.Refresh;
                                except

                                end;
                             end;
//                          EligBullDate.Text := FormatDateTime(cIrishDateStyle,NewDate);
                       end
                    // Date of Birth After today
                    else if ( WinData.AnimalFileByIDDateOfBirth.AsDateTime > Now() ) then
                        MessageDLG(Format('Date of Birth %s cannot be after Today %s',
                                   [FormatDateTime(cIrishDateStyle,
                                    WinData.AnimalFileByIDDateOfBirth.AsDateTime),
                                    FormatDateTime(cIrishDateStyle,Now())
                                   ]),mtWarning,[mbOK],0)
                    else
                       MessageDLG(cCannotCalcEligNoDOB,mtWarning,[mbOK],0);
                 end;
        end;
end;

procedure TfSetUpAnimals.DOBExit(Sender: TObject);
begin
   CheckEligDates(Sender);

   //   20/01/14 [V5.2 R7.6] /MK Change - Check to see whether the changed date of birth is different than the
   //                                     the calves dam's date of calving and show warning.
   AnimalDateOfBirthChanged := False;
   if ( WinData.AnimalFileByIDDamID.AsInteger > 0 ) then
      if ( WinData.AnimalFileByIDDateOfBirth.NewValue <> WinData.AnimalFileByIDDateOfBirth.OldValue ) then
         begin
            AnimalDateOfBirthChanged := True;
            if ( WinData.LookUpDamSire.Locate('ID',WinData.AnimalFileByIDDamID.AsInteger,[]) ) then
               if ( WinData.EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDDamID.AsInteger,
                                                             WinData.LookupDamSire.FieldByName('LactNo').AsInteger,
                                                             CCalvingEvent) <> WinData.AnimalFileByIDDateOfBirth.AsDateTime ) then
                  MessageDlg('Date of Birth differs from dam calving date.'+cCRLF+
                             'You must also change the calving date for the dam.',mtInformation,[mbOK],0);
         end;
end;

procedure TfSetUpAnimals.sbAnimalPurchClick(Sender: TObject);
begin
   WinData.EventType := TPurchase;
   uPurchases.ShowForm;
   DoCattleMarginCalcs;
   if ImmediateCloseAfterSave then
      begin
         ImmediateCloseAfterSave := False;
         Close;
      end;
end;

procedure TfSetUpAnimals.nbScrollClick(Sender: TObject; Button: TKNavigateBtn);
var
    DamID : Integer;
begin
   if ( Not sbPedDetails.Down ) then    //Not Ancestry Details  //KVB
      begin                                                      //KVB
         //The following lines are the old procedure                  //KVB
         if ( Button = kwnbPost ) then
            begin
               WinData.BreedRequired := TRUE;
               sbAnimalPurch.Enabled := TRUE;
               if WinData.InsertCalving then
                  begin
                     DamID := WinData.AnimalFileByIDID.AsInteger;
                     try
                        if MessageDLG('Do you want to record a Calving',mtInformation,[mbYes,mbNo],0) = mrYes then
                           begin
                              if MessageDLG('Do you want to record just the calving date',mtInformation,[mbYes,mbNo],0) = mrYes then
                                 begin
                                    uCalvings.ShowCalvings(AddAtSetUp);
                                 end
                              else
                                 begin
                                    uCalvings.ShowCalvings(Add);
                                 end;
                           end;
                     finally
                        WinData.InsertCalving := False;
                     end;
                  end;
               ActivateScan(False); // Show scanner labels etc.
               if ReScan.Showing then
                  ReScan.Hide;

               if ( CheckPurchaseEvent ) and ( StrToInt(cmboHerdLookUp.Value) <> WinData.NONEHerdID ) and
                                             ( MessageDlg('Do you want to enter purchase information for this animal?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                  sbAnimalPurch.Click;

            end
         else if ( Button = kwnbInsert ) then
            begin
               WinData.BreedRequired := True;
               LactationNo.Enabled := True;
               CheckPurchaseEvent := True;
               // Clear the Edit Mask
               SetNatId.Show;
               sbAnimalPurch.Enabled := FALSE;
               if WinData.AnimalFileByID.State = dsInsert then
                  if WinData.UseScanner then
                     ActivateScan(True)
                  else
                     ActivateScan(False);
               if WinData.UseScanner then
                  ReScan.Show;

               if DefaultAnimalType = atAIBullTestBeef then
                  begin
                     WinData.AnimalFileByIDHerdID.AsInteger := WinData.NONEHerdID;
                     WinData.AnimalFileByIDSex.AsString := cSex_Bull;
                     WinData.AnimalFileByIDBreeding.AsBoolean := True;
                     AnimalType;
                  end
               else if DefaultAnimalType = atNonHerdAncestor then
                  begin
                     WinData.AnimalFileByIDHerdID.AsInteger := WinData.NONEHerdID;
                     WinData.AnimalFileByIDBreeding.AsBoolean := True;
                     WinData.AnimalFileByIDAncestor.AsBoolean := True;
                  end;
               SetActiveControl;

            end
         else
            begin
               SetAncestryDisplayFields;
               ActivateScan(False); // Show scanner labels etc.
               if ReScan.Showing then
                  ReScan.Hide;
               sbAnimalPurch.Enabled := TRUE;
               // Clear the Edit Mask
               SetNatId.Hide;
            end;

         ScanInCode.Text := '';
         DisplayInherdField;
         AnimalType;
         RefreshHealthQuery; // refresh the health query for browse health tab.

         WinData.MilkCumulative.MasterFields := 'ID';
         WinData.MilkCumulative.Last;

         //End of the old procedure added this loop to isolate the function of the button presses to the Ancestry Details screens only.
         SetMandatoryControlColours;
      end                                            //KVB
   else
      ShowMessage('Cannot perform this function while the Ancester Details Screen is being displayed');  //KVB
end;

procedure TfSetUpAnimals.HelpBtnClick(Sender: TObject);
begin
   if DefaultAnimalType = atAIBullTestBeef then
      WinData.HTMLHelp('testbeefbulls.htm')
   else if DefaultAnimalType = atNonHerdAncestor then
      WinData.HTMLHelp('noneherdancestor.htm')
   else
      WinData.HTMLHelp('setupanimals.htm');
end;

procedure TfSetUpAnimals.sbDeleteClick(Sender: TObject);
Var
   AID : String;
   FileName : String;
   FileExt : String;
   FileToPrint : String;
begin
   {
   If ( Not sbPedDetails.Down ) then    //Not Ancestry Details  //KVB
     Begin                                                      //KVB
        //The following lines are the old procedure             //KVB
        try
           try
              with WinData do
                 if MessageDLG('Deleting Animal ' + AnimalFileByIDAnimalNo.AsString + #13#13 + cDeleteAnimalMessage,mtWarning,[mbYes,mbNo],0) = mrYes then
                    begin
                       RefreshAnimalGrid := True;
                       WinData.DeletingAnimal := TRUE;
                       AnimalFileByID.Edit;
                       fRemarks.DisplayRemark := Deletion;
                       AnimalFileByIDAnimalDeleted.AsBoolean := TRUE;
                       AnimalFileByID.Post;
                       ExitButtonClick(Sender);
                    end;
           except
             On E : Exception do
                E.CreateFmt('Cannot Delete Animal',[0] );
           end;
        finally
           WinData.DeletingAnimal := FALSE;
        end;

     End     //EndIf ( Not sbPedDetails.Down )
   Else
      Begin   //Ancestry Details Screen
   }
          If tsPedigreeImages.Visible then
             Begin   //PedigreeImages Visible
                If MessageDlg('Do you wish to delete the current Image from the files?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                   Begin  //Delete Current Image
                      Try
                         AID := IntToStr(ImageID);
                         //First need to delete Animal Image File
                         FileName := '1';
                         FileExt := '.jpg';
                         FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + FileName + FileExt;  //Animal Image
                         //Need to check that the appropriate Animal Image exists in the Images Directory
                         If ( FileExists(FileToPrint) ) then
                            if ( not DeleteFile(FileToPrint) ) then
                               raise Exception.Create('Cannot delete Animal Image');
                         //Now need to delete the Animal Image Directory
                         FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\';  //Animal Image Directory
                         //Need to check that the appropriate animal directory exists in the Images Directory
                         If ( DirectoryExists(FileToPrint) ) then
                            if ( not RemoveDir(FileToPrint) ) then
                               raise Exception.Create('Cannot Delete Animal Image');
                         //Now to display Image
                         GetImage;
                      Except
                         MessageDlg('Image deletion failed', mterror, [mbOK],0);
                      End;

                   End;  //EndIf Delete Current Image
             End   //EndIf Pedigree Images Visible
          Else
             Begin  //Pedigree Details Visible
                //Now to delete Selected Animal from the Animal Table
                If CheckAncesters(PedigreeRec^.prAnimalID) then
                   MessageDlg('Please Delete or Remove All Ancesters before attempting to Delete this Record', mtInformation, [mbOK], 0)
                Else
                   Begin   //No Ancesters
                      If (Not WinData.AnimalFileByID.Locate('ID', PedigreeRec^.prAnimalID, []) ) then
                         MessageDlg('Cannot locate this record in the Animal File', mtInformation, [mbOK], 0)
                      Else
                         Begin  //Record Located
                            If (( WinData.AnimalFileByIDAncestor.AsBoolean = False ) OR
                                ( WinData.AnimalFileByIDHerdID.AsInteger <> WinData.NONEHerdID )) then
                               MessageDlg('Can not Delete this record using this facility', mtInformation, [mbOK], 0)
                            Else  //Now confirm that the user wishes to delete this record
                               If ( MessageDlg('Do you wish to delete this Record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes ) then
                                  If WinData.AnimalFileByID.State = dsBrowse then
                                     Begin
                                        WinData.AnimalFileByID.Edit;
                                        WinData.AnimalFileByID.Delete;
                                        WinData.AnimalFileByID.ApplyUpdates;
                                        WinData.AnimalFileByID.Locate('ID', HerdLookup.PedigreeTable.FieldByName('AnimalID').AsInteger, []);
                                        sbCurrAnimalClick(nil);
                                        SetUpPedigree;
                                     End
                                  Else
                                     Begin
                                        WinData.AnimalFileByID.Delete;
                                        WinData.AnimalFileByID.Edit;
                                        WinData.AnimalFileByID.ApplyUpdates;
                                        WinData.AnimalFileByID.Locate('ID',HerdLookup.PedigreeTable.FieldByName('AnimalID').AsInteger, []);
                                        //nbSave.VisibleButtons := [kwnbDelete, kwnbPost, kwnbCancel];
                                        sbCurrAnimalClick(nil);
                                        SetUpPedigree;
                                     End;
                         End;   //EndElse Record Located
                   End;  //EndElse No Ancesters
             End;   //EndElse Pedigree Details Visible
      //End;   //EndElse Ancestry Details Screen

end;

procedure TfSetUpAnimals.nbScrollBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
begin
   RefreshAnimalGrid := True;
   If ( Not sbPedDetails.Down ) then    //Not Ancestry Details    //KVB
     Begin                                                        //KVB
        //The following lines where the old procedure
        //I have added the above check to ensure that the button clicks works for the Ancestry
        //details screen only.        //KVB
        if ( Button in [kwnbInsert,kwnbPost] ) then
           try
              SavingRecord := TRUE;
              if not ( WinData.CheckIfPurchasedAnimal(WhichReg, StripAllSpaces(WinData.AnimalFileByIDNatIDNum.AsString)) ) then
                 begin
                    SavingRecord := False;
                    Abort;
                 end;

              if ( Screen.ActiveControl.Name = DOB.Name ) then
                AnimalBreed.SetFocus
              else
                 CheckEligDates(Sender);
           finally
              SavingRecord := FALSE;
           end
        else if Button = kwnbCancel then
           begin
              if WinData.AnimalFileByIDSex.AsString = cSex_Bull then
                 begin

                 end;
           end;
     end;    //EndIf ( Not sbPedDetails.Down )                     //KVB
end;

procedure TfSetUpAnimals.nbScrollRecordsBeforeAction(Sender: TObject; Button: TKNavigateBtn);
begin     //These buttons are disabled in the Ancestry Details screen  //KVB
   try
      SavingRecord := TRUE;
      if ( Screen.ActiveControl.Name = DOB.Name ) then
         AnimalBreed.SetFocus
      else
         CheckEligDates(Sender);

      CheckDBBrowserState;

   finally
      SavingRecord := FALSE;
   end;
end;

procedure TfSetUpAnimals.HoldLactInfoCalcFields(DataSet: TDataSet);
begin
   // get calving to conception
   if ( HoldLactInfoCalvingDate.AsDateTime > 0 ) And
      ( HoldLactInfoLastService.AsDateTime > 0 ) then
      HoldLactInfoCalvToConc.AsInteger := Round ( HoldLactInfoLastService.AsDateTime-
                                                  HoldLactInfoCalvingDate.AsDateTime );
end;

procedure TfSetUpAnimals.cbBrowserClick(Sender: TObject);
begin
   if cbBrowser.Checked then
      begin
         cbBrowser.Caption := 'Turn Browser On';
         cbBrowser.Font.Color := clRed;
         AnimalPages.Visible := False;
         AnimalPagesSplitter.Visible := False;
      end
   else
      begin
         cbBrowser.Caption := 'Turn Browser Off';
         cbBrowser.Font.Color := clWindowText;
         AnimalPages.Visible := True;
         AnimalPagesSplitter.Visible := True;
         GetAnimalType;
      end;
end;

procedure TfSetUpAnimals.sbPedNameClick(Sender: TObject);
begin
   // open pedigree naming screen
   uPedName.ShowForm;
end;

procedure TfSetUpAnimals.cmboHerdLookUpDropDown(Sender: TObject);
begin
   // Query for herd drop down to fix delphi 5 conversion bug - 24/10/00 - kr
   HerdQuery.Close;
   HerdQuery.Prepare;
   HerdQuery.Open;
   SetColorMandatory;
end;

procedure TfSetUpAnimals.ScanInCodeExit(Sender: TObject);
var
   ScanStr : String;
   MyString : String;
   SetFocus : Boolean;
   DateOfBirth : String;
   BreedCode : String;
   Sex : Char;
   I : Integer;
begin
   SetFocus := False;

   if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = England then// GREAT BRITAIN  SP
      begin

         if ( Length(Trim(ScanInCode.Text)) > 0 ) then
            begin
               ActivateScan(False);
               ScanStr := StripAllSpaces( ScanInCode.Text ) ;
               Delete(ScanStr, Length(ScanStr)-1,2);
               for i := Length(ScanStr) downto 1 do
                  begin
                     if ( ScanStr[i] in ['A'..'Z','a'..'z'] ) then
                        MyString := ScanStr[i] + MyString
                     else
                        Break;
                  end;

               Delete( ScanStr, Length(ScanStr)-Length(MyString)+1,Length( MyString ));
               Sex := MyString[1];
               Delete(MyString,1,1);
               BreedCode := MyString;
               MyString := '';

               for i := Length(ScanStr) downto 1 do
                  begin
                     if ( ScanStr[i] in ['0'..'9'] ) then
                        begin
                           MyString := ScanStr[i] + MyString;
                           if Length(MyString) = 8 then
                              Break;
                        end;
                  end;
               DateOfBirth := MyString;
               if WinData.AnimalFileByID.State in dsEditModes then
                  begin
                     WinData.AnimalFileByID.FieldByName('DateOfBirth').AsString := Copy(DateOfBirth, 1, 2) + '/' + Copy(DateOfBirth, 3, 2)+ '/' + Copy(DateOfBirth, 5, 4);
                     If (UPPERCASE(Sex) = 'F') then
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := 'Female'
                     else if WinData.GlobalSettings.DefaultMaleSex <> '' then
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := WinData.GlobalSettings.DefaultMaleSex
                     else
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := 'Bull';// Advice from George TGM

                     SexCombo.SetFocus;
                     SetFocus := True;
                  end;

               if WinData.Breeds.Locate('Code', BreedCode,[]) then
                  begin
                     WinData.AnimalFileByID.FieldByName('PrimaryBreed').AsInteger := WinData.Breeds.FieldByName('ID').AsInteger;
                  end
               else
                  begin
                     ShowMessage('Animal Breed "' + BreedCode + '"  not in table, please add'  + #13 + 'breed code');
                     AnimalBreed.Value := 0;
                     AnimalBreed.SetFocus;
                     SetFocus := True;
                  end;
            end;
      end
   else
      begin
         If ( Length(ScanInCode.Text) >=11 ) Then //KB
            Begin
               ActivateScan(False);
               WinData.AnimalFileByID.FieldByName('DateOfBirth').AsString := Copy(ScanInCode.Text, 1, 2) + '/' + Copy(ScanInCode.Text, 3, 2)+ '/' + Copy(ScanInCode.Text, 5, 4);
               WinData.AnimalFileByID.Edit;
               If (UPPERCASE(Copy(ScanInCode.Text, 9, 1)) = 'F') then
                  WinData.AnimalFileByID.FieldByName('Sex').AsString := 'Female'
               else
                  begin
                     if WinData.GlobalSettings.DefaultMaleSex <> '' then
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := WinData.GlobalSettings.DefaultMaleSex
                     else
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := 'Steer';
                     SexCombo.SetFocus;
                     SetFocus := True;
                  end;
               MyString := (UPPERCASE(Copy(ScanInCode.Text, 10, (Strlen(PChar(ScanInCode.Text)) - 9))));
               WinData.Breeds.First;
               if WinData.Breeds.Locate('Code', MyString,[]) then
                  begin
                     WinData.AnimalFileByID.FieldByName('PrimaryBreed').AsInteger := WinData.Breeds.FieldByName('ID').AsInteger;
                  end
               else
                  begin
                     ShowMessage('Animal Breed ''' + (UpperCase(Copy(ScanInCode.Text, 10, Strlen(PChar(ScanInCode.Text))))) + '''  not in table, please add'  + #13 + 'breed code');
                     AnimalBreed.Value := 0;
                     AnimalBreed.SetFocus;
                     SetFocus := True;
                  end;
                //  WinData.AnimalFileByID.Post;
               ScanInCode.Text := '';
               SexComboChange(Sender);

               if SetFocus = False then
                  begin
                     FocusControl( AnimalColour ); //;.SetFocus;
                  end;
            end;
      end;
end;

procedure TfSetUpAnimals.ReScanClick(Sender: TObject);
begin
   if ReScan.Caption = 'Enable' then
      ActivateScan(True)
   else
      ActivateScan(False);
end;

procedure TfSetUpAnimals.SetAncestryFields;
begin
   //CurrAnimal
   dbeAnimalNo.Font.Color := clWindowText; dbeAnimalNo.Font.Style := []; dbeAnimalName.Font.Color := clWindowText; dbeAnimalName.Font.Style := [];
   //Sire
   dbeSireNo.Font.Color := clWindowText; dbeSireNo.Font.Style := [];  dbeSire.Font.Color := clWindowText;  dbeSire.Font.Style := [];
   dbeSireCombo.Font.Color := clWindowText;  dbeSireCombo.Font.Style := [];  SireName.Font.Color := clWindowText; SireName.Font.Style := [];
   //Dam
   dbeDamNo.Font.Color := clWindowText; dbeDamNo.Font.Style := [];  dbeDam.Font.Style := []; dbeDam.Font.Color := clWindowText;
   dbeDamCombo.Font.Color := clWindowText; dbeDamCombo.Font.Style := []; DamName.Font.Color := clWindowText; DamName.Font.Style := [];
   //SSire
   dbeSSireNo.Font.Color := clWindowText; dbeSSireNo.Font.Style := []; dbeSSire.Font.Color := clWindowText; dbeSSire.Font.Style := [];
   dbeSSireCombo.Font.Color := clWindowText; dbeSSireCombo.Font.Style := [];  SSireName.Font.Color := clWindowText; SSireName.Font.Style := [];
   //SDam
   dbeSDamNo.Font.Color := clWindowText; dbeSDamNo.Font.Style := []; dbeSDam.Font.Color := clWindowText; dbeSDam.Font.Style := [];
   dbeSDamCombo.Font.Color := clWindowText; dbeSDamCombo.Font.Style := []; SDamName.Font.Color := clWindowText; SDamName.Font.Style := [];
   //DSire
   dbeDSireNo.Font.Color := clWindowText; dbeDSireNo.Font.Style := []; dbeDSire.Font.Color := clWindowText;  dbeDSire.Font.Style := [];
   dbeDSireCombo.Font.Color := clWindowText; dbeDSireCombo.Font.Style := []; DSireName.Font.Color := clWindowText; DSireName.Font.Style := [];
   //DDam
   dbeDDamNo.Font.Color := clWindowText; dbeDDamNo.Font.Style := []; dbeDDam.Font.Color := clWindowText; dbeDDam.Font.Style := [];
   dbeDDamCombo.Font.Color := clWindowText; dbeDDamCombo.Font.Style := []; DDamName.Font.Color := clWindowText; DDamName.Font.Style := [];
   //SSSire
   dbeSSSireNo.Font.Color := clWindowText; dbeSSSireNo.Font.Style := []; dbeSSSire.Font.Color := clWindowText; dbeSSSire.Font.Style := [];
   dbeSSSireCombo.Font.Color := clWindowText; dbeSSSireCombo.Font.Style := []; SSSireName.Font.Color := clWindowText; SSSireName.Font.Style := [];
   //SSDam
   dbeSSDAMNo.Font.Color := clWindowText; dbeSSDAMNo.Font.Style := []; dbeSSDAM.Font.Color := clWindowText; dbeSSDAM.Font.Style := []; dbeSSDAMCombo.Font.Color := clWindowText;
   dbeSSDAMCombo.Font.Style := []; SSDamName.Font.Color := clWindowText; SSDamName.Font.Style := [];
    //SDSire
   dbeSDSireNo.Font.Color := clWindowText; dbeSDSireNo.Font.Style := []; dbeSDSire.Font.Color := clWindowText; dbeSDSire.Font.Style := [];
   dbeSDSireCombo.Font.Color := clWindowText; dbeSDSireCombo.Font.Style := []; SDSireName.Font.Color := clWindowText; SDSireName.Font.Style := [];
   //SDDam
   dbeSDDamNo.Font.Color := clWindowText; dbeSDDamNo.Font.Style := []; dbeSDDam.Font.Color := clWindowText; dbeSDDam.Font.Style := [];
   dbeSDDamCombo.Font.Color := clWindowText; dbeSDDamCombo.Font.Style := []; SDDamName.Font.Color := clWindowText; SDDamName.Font.Style := [];
   //DSSire
   dbeDSSireNo.Font.Color := clWindowText; dbeDSSireNo.Font.Style := []; dbeDSSire.Font.Color := clWindowText; dbeDSSire.Font.Style := [];
   dbeDSSireCombo.Font.Color := clWindowText; dbeDSSireCombo.Font.Style := []; DSSireName.Font.Color := clWindowText; DSSireName.Font.Style := [];
   //DSDam
   dbeDSDamNo.Font.Color := clWindowText; dbeDSDamNo.Font.Style := []; dbeDSDam.Font.Color := clWindowText; dbeDSDam.Font.Style := [];
   dbeDSDamCombo.Font.Color := clWindowText; dbeDSDamCombo.Font.Style := []; DSDamName.Font.Color := clWindowText; DSDamName.Font.Style := [];
   //DDSire
   dbeDDSireNo.Font.Color := clWindowText; dbeDDSireNo.Font.Style := []; dbeDDSire.Font.Color := clWindowText; dbeDDSire.Font.Style := [];
   dbeDDSireCombo.Font.Color := clWindowText; dbeDDSireCombo.Font.Style := []; DDSireName.Font.Color := clWindowText;  DDSireName.Font.Style := [];
   //DDDam
   dbeDDDamNo.Font.Color := clWindowText; dbeDDDamNo.Font.Style := []; dbeDDDam.Font.Color := clWindowText; dbeDDDam.Font.Style := [];
   dbeDDDamCombo.Font.Color := clWindowText; dbeDDDamCombo.Font.Style := []; DDDamName.Font.Color := clWindowText; DDDamName.Font.Style := [];
end;

procedure TfSetUpAnimals.sbCurrAnimalClick(Sender: TObject);
begin
   SetAncestryFields;
   New(PedigreeRec);
   ImageID := HerdLookup.PedigreeTable.FieldByName('AnimalID').AsInteger;
   PedigreeRec^.prAnimalIndex := 1;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('AnimalID').AsInteger;
   PedigreeRec^.prAnimalNum :=  WinData.AnimalFileByIDAnimalNo.AsString;;
   PedigreeRec^.prAnimalHerdBookNum := WinData.AnimalFileByIDHerdBookNo.AsString;
   PedigreeRec^.prAnimalPedName := WinData.AnimalFileByIDName.AsString;
   PedigreeRec^.prAnimalCombo := '';
   PedigreeRec^.prDescAnimalID := 0;

   dbeAnimalNo.Font.Color := clRed;
   dbeAnimalNo.Font.Style := [fsBold,fsItalic];
   dbeAnimalName.Font.Color := clRed;
   dbeAnimalName.Font.Style := [fsBold,fsItalic];
   lSelName.Caption := 'Current Animal';
   lSelAnimalNum.Caption := WinData.AnimalFileByIDAnimalNo.AsString;
   lName.Caption := WinData.AnimalFileByIDName.AsString;
   GetImage;
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.AncestorClick(Sender : TObject; PRec : PPedigreeRec; dbFields : Array of TDBEdit; sAncestor : String);
var
   x : Byte;
   CorrectAncestor : Boolean;
begin
   if (PRec^.prAnimalIndex <= 3) or ( CheckDescendents(PRec^.prAnimalIndex)) then
       begin
          SetAncestryFields; { First reset all Ancestry Fields }
          for x := Low(AncestryFieldArray) to High(AncestryFieldArray) do
             begin
                AncestryFieldArray[x].Font.Color := clBlue;
                AncestryFieldArray[x].Font.Style := [fsBold,fsItalic];
             end;

          lSelName.Caption := sAncestor;
          lSelAnimalNum.Caption := PRec^.prAnimalNum;
          lName.Caption := PRec^.prAnimalPedName;

          if PedigreeRec^.prAnimalID = 0 then
             begin
                uPedAddAmend.ShowTheForm(PRec);
                if uPedAddAmend.RecordsUpdated then
                   begin  { Need to locate Current Animal and update screen details }
                      RefreshAnimalGrid := True;
                      WinData.AnimalFileByID.GotoBookmark(AnimalBookMark); { Now to ensure that we have the Current Animal }
                      { Create Pedigree Records }
                      SetUpPedigree; { Now to update the Animal Selected details }
                      SetAncestryFields; { First reset all Ancestry Fields }
                      for x := Low(AncestryFieldArray) to High(AncestryFieldArray) do
                         begin
                            AncestryFieldArray[x].Font.Color := clBlue;
                            AncestryFieldArray[x].Font.Style := [fsBold,fsItalic];
                         end;

                      { Now to update the Selected Animal variables }
                      PedigreeRec^.prAnimalIndex := 2;
                      PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('SireID').AsInteger;
                      PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('SireNo').AsString;
                      PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('Sire').AsString;
                      PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('SireName').AsString;
                      PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('SireCombo').AsString;
                      PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('AnimalID').AsInteger; // Descendent is Current Animal

                      lSelName.Caption := sAncestor;
                      lSelAnimalNum.Caption := PRec^.prAnimalNum;
                      lName.Caption := PRec^.prAnimalPedName;
                   end;
                end
             else
                sbAddAmendClick(Sender);
          GetImage; { Now to update the Animal Image }
       end
   else
      MessageDlg('Offspring not set up - please enter', mtWarning, [mbOK], 0);
end;

procedure TfSetUpAnimals.sbSireClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 2;
   ImageID := HerdLookup.PedigreeTable.FieldByName('SireID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('SireID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('SireNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('Sire').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('SireName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('SireCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('AnimalID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeSireNo, dbeSire, dbeSireCombo, SireName);
   AncestorClick(sbSire, PedigreeRec, AncestryFieldArray, 'Sire');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbDamClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 3;
   ImageID := HerdLookup.PedigreeTable.FieldByName('DamID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('DamID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('DamNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('Dam').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('DamName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('DamCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('AnimalID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeDamNo, dbeDam, dbeDamCombo, DamName);
   AncestorClick(sbDam, PedigreeRec, AncestryFieldArray, 'Dam');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbSSireClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 4;
   ImageID := HerdLookup.PedigreeTable.FieldByName('SSireID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('SSireID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('SSireNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('SSire').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('SSireName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('SSireCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('SireID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeSSireNo, dbeSSire, dbeSSireCombo, SSireName);
   AncestorClick(sbSSire, PedigreeRec, AncestryFieldArray, 'SSire');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbSDamClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 5;
   ImageID := HerdLookup.PedigreeTable.FieldByName('SDamID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('SDamID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('SDamNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('SDam').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('SDamName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('SDamCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('SireID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeSDamNo, dbeSDam, dbeSDamCombo, SDamName);
   AncestorClick(sbSDam, PedigreeRec, AncestryFieldArray, 'SDam');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbDSireClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 6;
   ImageID := HerdLookup.PedigreeTable.FieldByName('DSireID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('DSireID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('DSireNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('DSire').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('DSireName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('DSireCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('DamID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeDSireNo, dbeDSire, dbeDSireCombo, DSireName);
   AncestorClick(sbDSire, PedigreeRec, AncestryFieldArray, 'DSire');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbDDamClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 7;
   ImageID := HerdLookup.PedigreeTable.FieldByName('DDamID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('DDamID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('DDamNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('DDam').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('DDamName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('DDamCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('DamID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeDDamNo, dbeDDam, dbeDDamCombo, DDamName);
   AncestorClick(sbDDam, PedigreeRec, AncestryFieldArray, 'DDam');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbSSSireClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 8;
   ImageID := HerdLookup.PedigreeTable.FieldByName('SSSireID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('SSSireID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('SSSireNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('SSSire').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('SSSireName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('SSSireCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('SSireID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeSSSireNo, dbeSSSire, dbeSSSireCombo, SSSireName);
   AncestorClick(sbSSSire, PedigreeRec, AncestryFieldArray, 'DDam');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbSSDamClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 9;
   ImageID := HerdLookup.PedigreeTable.FieldByName('SSDamID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('SSDamID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('SSDamNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('SSDam').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('SSDamName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('SSDamCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('SSireID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeSSDAMNo, dbeSSDAM, dbeSSDAMCombo, SSDamName);
   AncestorClick(sbSSDam, PedigreeRec, AncestryFieldArray, 'SSDam');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbSDSireClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 10;
   ImageID := HerdLookup.PedigreeTable.FieldByName('SDSireID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('SDSireID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('SDSireNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('SDSire').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('SDSireName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('SDSireCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('SDamID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeSDSireNo, dbeSDSire, dbeSDSireCombo, SDSireName);
   AncestorClick(sbSDSire, PedigreeRec, AncestryFieldArray, 'SDSire');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbSDDamClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 11;
   ImageID := HerdLookup.PedigreeTable.FieldByName('SDDamID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('SDDamID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('SDDamNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('SDDam').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('SDDamName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('SDDamCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('SDamID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeSDDamNo, dbeSDDam, dbeSDDamCombo, SDDamName);
   AncestorClick(sbSDDam, PedigreeRec, AncestryFieldArray, 'SDDam');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbDSSireClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 12;
   ImageID := HerdLookup.PedigreeTable.FieldByName('DSSireID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('DSSireID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('DSSireNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('DSSire').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('DSSireName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('DSSireCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('DSireID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeDSSireNo, dbeDSSire, dbeDSSireCombo, DSSireName);
   AncestorClick(sbDSSire, PedigreeRec, AncestryFieldArray, 'DSSire');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbDSDamClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 13;
   ImageID := HerdLookup.PedigreeTable.FieldByName('DSDamID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('DSDamID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('DSDamNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('DSDam').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('DSDamName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('DSDamCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('DSireID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeDSDamNo, dbeDSDam, dbeDSDamCombo, DSDamName);
   AncestorClick(sbDSDam, PedigreeRec, AncestryFieldArray, 'DSDam');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbDDSireClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 14;
   ImageID := HerdLookup.PedigreeTable.FieldByName('DDSireID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('DDSireID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('DDSireNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('DDSire').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('DDSireName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('DDSireCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('DDamID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeDDSireNo, dbeDDSire, dbeDDSireCombo, DDSireName);
   AncestorClick(sbDDSire, PedigreeRec, AncestryFieldArray, 'DDSire');
   Dispose(PedigreeRec);
end;

procedure TfSetUpAnimals.sbDDDamClick(Sender: TObject);
begin
   New(PedigreeRec);
   PedigreeRec^.prAnimalIndex := 15;
   ImageID := HerdLookup.PedigreeTable.FieldByName('DDDamID').AsInteger;
   PedigreeRec^.prAnimalID := HerdLookup.PedigreeTable.FieldByName('DDDamID').AsInteger;
   PedigreeRec^.prAnimalNum := HerdLookup.PedigreeTable.FieldByName('DDDamNo').AsString;
   PedigreeRec^.prAnimalHerdBookNum := HerdLookup.PedigreeTable.FieldByName('DDDam').AsString;
   PedigreeRec^.prAnimalPedName := HerdLookup.PedigreeTable.FieldByName('DDDamName').AsString;
   PedigreeRec^.prAnimalCombo := HerdLookup.PedigreeTable.FieldByName('DDDamCombo').AsString;
   PedigreeRec^.prDescAnimalID := HerdLookup.PedigreeTable.FieldByName('DDamID').AsInteger; // Descendent is Current Animal
   AncestryFieldArray := FillArray(dbeDDDamNo, dbeDDDam, dbeDDDamCombo, DDDamName);
   AncestorClick(sbDDDam, PedigreeRec, AncestryFieldArray, 'DDDam');
   Dispose(PedigreeRec);
end;

function TfSetUpAnimals.CheckDescendents(ChosenAnimal : Integer) : Boolean;
begin
   case ChosenAnimal Of
      4,5  :  if HerdLookup.PedigreeTable.FieldByName('SireID').AsInteger = 0 then
                 Result := False
              else
                 Result := True;
      6,7  :  if HerdLookup.PedigreeTable.FieldByName('DamID').AsInteger = 0 then
                 Result := False
              else
                 Result := True;
      8,9  :  if HerdLookup.PedigreeTable.FieldByName('SSireID').AsInteger = 0 then
                 Result := False
              else
                 Result := True;
      10,11:  if HerdLookup.PedigreeTable.FieldByName('SDamID').AsInteger = 0 then
                 Result := False
              else
                 Result := True;
      12,13:  if HerdLookup.PedigreeTable.FieldByName('DSireID').AsInteger = 0 then
                 Result := False
              else
                 Result := True;
      14,15:  if HerdLookup.PedigreeTable.FieldByName('DDamID').AsInteger = 0 then
                 Result := False
              else
                 Result := True;
   else
      Result := False;
   end;
end;

procedure TfSetUpAnimals.sbAddAmendClick(Sender: TObject);
var
   NewImage : String;   //Contains the location of the New Image in it's original location
   AID : String;
   FileExt : String;
   FileToPrint : String;
   A : Array[0..257] of Char;
   B : Array[0..257] of Char;

begin

   // First check that sbPedDetails is down
   if not ( sbPedDetails.Down ) then
      begin
         ShowMessage('Cannot perform this function until the Ancester Details Screen is being displayed');  //KVB
         Exit
      end;

   if tsPedigreeImages.Visible then
      begin
         if OpenPictureDialog1.Execute then
            begin

               NewImage := OpenPictureDialog1.FileName;
               if NewImage = '' then
                  Exit;

               //Check File Type
               FileExt := ExtractFileExt(OpenPictureDialog1.FileName);
               try               //***
                  if ImageID <= 0 then
                     MessageDlg('Please input Ancester Details before loading image.', mtWarning, [mbOK], 0)
                  else
                     begin
                        AID := IntToStr(ImageID);
                        FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + '1' + FileExt;  //Animal Image
                        //Need to check that we have an animal
                        if not DirectoryExists('C:\Kingswood Herd Management\Images\' + AID + '\') then
                           if not CreateDir('C:\Kingswood Herd Management\Images\' + AID + '\') then
                              raise Exception.Create('Cannot create Animal Images directory');
                        //Now to copy file
                        CopyFile(StrPCopy(A, NewImage), StrPCopy(B, FileToPrint), False);
                        //Now to display Image
                        GetImage;
                     end
               except
                  MessageDlg('Image copying failed', mterror, [mbOK],0);
               end;
            end;
         end
      else
         begin  //Pedigree Details Visible
            if PedigreeRec^.prAnimalIndex = 1 then  //Current Animal
               begin
                  MessageDlg('Please use the main panel to input Current Animal Details', mtInformation, [mbOK], 0);
                  Exit; // <<< To avoid access violations
               end
            else   //Ancester
               uPedAddAmend.ShowTheForm(PedigreeRec);

            if uPedAddAmend.RecordsUpdated then
               begin  //Need to locate Current Animal and update screen details
                  //Now to ensure that we have the Current Animal
                  WinData.AnimalFileByID.GotoBookmark(AnimalBookMark);
                  //Create Pedigree Records
                  SetUpPedigree;
               end;  //End  If PedAddAmend.RecordsUpdated
         end;   //EndElse Pedigree Details Visible
end;

function TfSetUpAnimals.CheckAncesters(ChosenAnimal : Integer) : Boolean;
Begin    //Function to check for Ancestors
   If ( WinData.AnimalFileByID.Locate('ID', ChosenAnimal, []) ) then
      Begin
         If (( WinData.AnimalFileByIDSireID.AsInteger = 0 ) AND ( WinData.AnimalFileByIDDamID.AsInteger = 0 )) then
            Result := False    //No Ancesters
         Else
            Result := True;     //Ancesters
      End
   Else
      Result := True;
End;

procedure TfSetUpAnimals.NatIDNoChange(Sender: TObject);
begin
   SetModifiedFlag;
   if fSetUpAnimals.Active then
      If (NatIDNo.Text = '') then
         SetNatID.Visible := True;
end;

Procedure TfSetUpAnimals.GetPedDetails;
begin
   tPedDetails.Open;
   tsPedigree.Refresh;
   if WinData.AnimalFileByIDSex.AsString = 'Bull' then
      begin
         kwNavPedDetails.DataSource := WinData.dsBullExt;
         DBGrade.DataSource := WinData.dsBullExt;
         DBScore.DataSource := WinData.dsBullExt;
         DBEBI.DataSource := nil;
         DBEBI.DataField := 'RBI';
         DBEBI.DataSource := WinData.dsBullExt;
         DBpin.DataSource := WinData.dsBullExt;
         DBPLI.DataSource := WinData.dsBullExt;
         DBFamilyName.DataSource := WinData.dsBullExt;
      end
   else if WinData.AnimalFileByIDSex.AsString = 'Female' then
      begin
         kwNavPedDetails.DataSource := WinData.dsCowExt;
         DBGrade.DataSource := WinData.dsCowExt;
         DBScore.DataSource := WinData.dsCowExt;
         DBEBI.DataSource := nil;
         DBEBI.DataField := 'EBI';
         DBEBI.DataSource := WinData.dsCowExt;
         DBpin.DataSource := WinData.dsCowExt;
         DBPLI.DataSource := WinData.dsCowExt;
         DBFamilyName.DataSource := WinData.dsCowExt;
      end;
   if kwNavPedDetails.DataSource.Dataset.RecordCount = 0 then
      kwNavPedDetails.VisibleButtons := [kwnbInsert, kwnbPost, kwnbDelete, kwnbCancel]
   else
      kwNavPedDetails.VisibleButtons := [kwnbPost, kwnbDelete, kwnbCancel]
end;

procedure TfSetUpAnimals.kwNavPedDetailsClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if (Button = kwnbDelete) then
      tPedDetails.Delete
   else if (Button = kwnbPost) and ( tPedDetails.State in dsEditModes ) then
      tPedDetails.Post;
end;

procedure TfSetUpAnimals.sbPrintClick(Sender: TObject);
begin
      // All of this Printin needs serious Look at.
   if ( fmAnimalPrint <> nil ) then
      FreeAndNil(fmAnimalPrint);
   fmAnimalPrint := TfmAnimalPrint.Create(nil);
   with fmAnimalPrint do
      try

         VerNoLabel.Caption  := 'Kingswood Herd Management ' + HerdVerNo;
         VerNoLabel2.Caption := 'Kingswood Herd Management ' + HerdVerNo;
         VerNoLabel3.Caption := 'Kingswood Herd Management ' + HerdVerNo;
         VerNoLabel4.Caption := 'Kingswood Herd Management ' + HerdVerNo;

         if (pPedigree.Visible = True) then
            begin
               Application.CreateForm(TfAncestryTree,fAncestryTree);
               try
                  with fAncestryTree do
                     begin
                        OpenAncestryData;
                        try
                           if (MessageDlg('Do you wish to print the 5th Generation Ancestors?',mtConfirmation,[mbYes,mbNo],0) = MrYes) then
                              begin
                                 fAncestryTree.qrPedDetails.Print;
                                 fAncestryTree.qrExtPedDetails.Print;
                              end
                           else
                              fAncestryTree.qrPedDetails.Print;
                        finally
                           CloseAncestryData;
                        end;
                     end;
               finally
                  FreeAndNil(fAncestryTree);
               end;
            end
         else if (pMainDetails.Visible = True) then
            try
               if (( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) and( FHerdType = htDairy )) then
                  begin
                     qrCalPerForm.Height := 0;
                     qrCalPerFormDetail.Height := 0;
                     AnimalCaptions;
                     CurrFertCalcs( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                                    cBullingEvent );
                     CurrFertCalcs( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                                    cServiceEvent );
                     CurrFertCaptions;
                     CurrLactSummCaptions;
                     PedCaptions;
                     if not DEF.Definition.dUsePedigree then
                        qrPedigreeFemale.Height := 0;
                     //qrFemale.Print;
                     //qrFemale2.Print;
                  end
               else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) and
                       ( FHerdType = htSuckler ) then
                       begin
                          qHoldLactInfo.Active := True;
                          qrMilkHist.Height := 0;
                          qrMilkHistDetails.Height := 0;
                          AnimalCaptions;
                          CurrFertCalcs( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                                         cBullingEvent );
                          CurrFertCalcs( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                                         cServiceEvent );
                          CurrLactSummCaptions;
                          CurrFertCaptions;
                          if not DEF.Definition.dUsePedigree then
                             qrPedigreeFemale.Height := 0;
                          //qrFemale.Print;
                          //qrFemale2.Print;
                       end
               else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) and
                  ( FHerdType = htBeef ) then
                  begin
                     qrCalPerForm.Height := 0;
                     qrCalPerFormDetail.Height := 0;
                     AnimalCaptions;

                     qrCurrFertLactSumFemale.Enabled := False;
                     qrCurrFertLactSumFemale.Visible := False;

                     qrFertHist.Enabled := False;
                     qrFertHist.Visible := False;
                     qrFertHistDetail.Enabled := False;
                     qrFertHistDetail.Visible := False;
                     GroupFooterBand3.Enabled := False;
                     GroupFooterBand3.Visible := False;

                     qrCalPerForm.Enabled := False;
                     qrCalPerForm.Visible := False;
                     qrCalPerFormDetail.Enabled := False;
                     qrCalPerFormDetail.Visible := False;
                     GroupFooterBand4.Enabled := False;
                     GroupFooterBand4.Visible := False;

                     qrMilkHist.Enabled := False;
                     qrMilkHist.Visible := False;
                     qrMilkHistDetails.Enabled := False;
                     qrMilkHistDetails.Visible := False;
                     GroupFooterBand6.Enabled := False;
                     GroupFooterBand6.Visible := False;

                     qrHealthFemale.ParentReport := qrFemale;
                     qrHealthDetailsFemale.ParentReport := qrFemale;
                     qrPedigreeFemale.Height := 0;
                     //qrFemale.Print;
                     //qrFemale2.Print;
                  end
               else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'BULL' ) then
                  begin
                     AnimalCaptions;

                     lSemenStock.Caption := DBEdit9.Text;
                     lStrawsAdded.Caption := DBEdit10.Text;
                     lPricePerStraw.Caption := DBEdit12.Text;
                     lStrawsWasted.Caption := DBEdit11.Text;
                     If cbInUse.Checked then
                        lInUse.Caption := 'YES'
                     else
                        lInUse.Caption := 'NO';

                     // Traits
                     lSEBI.Caption := RBI.Text;
                     lSProtPerc.Caption := ProtPerc.Text;
                     lSProtkgs.Caption := DBEdit5.Text;
                     lFatPerc.Caption := DBEdit4.Text;
                     lFatkgs.Caption := DBEdit3.Text;
                     lCavDiff.Caption := DBEdit8.Text;
                     lReliability.Caption := DBEdit7.Text;
                     lMilkPeddDiff.Caption := DBEdit2.Text;

                     if def.Definition.dUsePedigree then
                        PedCaptions
                     else
                        qrPedigreeFemale.Height := 0;

                     GetAnimalType;
                     if lFamilyName2.Caption = 'lFamilyName2' then
                        lFamilyName2.Caption := '' ;
                     if lPGrade2.Caption = 'lPGrade2' then
                        lPGrade2.Caption := '' ;
                     if lPScore2.Caption = 'lPScore2' then
                        lPScore2.Caption := '' ;
                     if lPEBI2.Caption = 'lPEBI2' then
                        lPEBI2.Caption := '' ;
                     if lPPIN2.Caption = 'lPPIN2' then
                        lPPIN2.Caption := '' ;
                     if lPPLI2.Caption = 'lPPLI2' then
                        lPPLI2.Caption := '' ;
                     //BullCard.Print;
                  end
               else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'STEER' ) then
                  begin
                     AnimalCaptions;
                     //qrSteer.Print;
                  end;

               ShowModal;
               qHoldLactInfo.Active := False;

            finally
            end;

      finally
         if ( fmAnimalPrint <> nil ) then
            FreeAndNil(fmAnimalPrint);
      end;
end;

procedure TfSetUpAnimals.AnimalCaptions;
var
   TBTest,
   BTest,
   DateOfBirth : String;

   procedure PrintSteerReport;
   begin
      with fmAnimalPrint do
         try
            lHerdID3.Caption        := cmboHerdLookUp.Text;
            lAnimalNo3.Caption      := AnimalNo.Text;
            lNatIDNum3.Caption      := NatIDNo.Text;
            DateOfBirth             := DOB.EditText;
            lDOB3.Caption           := DateOfBirth;
            TBTest                  := TBTestDate.EditText;
            if TBTest = '  /  /    ' then
               lTBTestDate3.Caption := ''
            else
               lTBTestDate3.Caption := TBTest;
            BTest                   := BruceDate.EditText;
            if BTest = '  /  /    ' then
               lBTestDate3.Caption  := ''
            else
               lBTestDate3.Caption  := BTest;
            lBirthWeight3.Caption   := dbeWeight.Text;
            lAName3.Caption         := WinData.AnimalFileByIDName.AsString;
            lHBNumber3.Caption      := HerdBookNo.Text;
            lSex3.Caption           := SexCombo.Text;
            if (AnimalBreed.Text = '<Add>') then
               lBreed3.Caption      := ''
            else
               lBreed3.Caption := AnimalBreed.Text;
            if (AnimalColour.Text = '<Add>') then
               lColour3.Caption     := ''
            else
               lColour3.Caption     := AnimalColour.Text;
            if InHerd.Checked then
               lInHerd3.Caption     := 'Yes'
            else
               lInHerd3.Caption     := 'No';
            if SireIDEh.Text = '<None>' then
               lSire3.Caption  := ''
            else
               lSire3.Caption       := SireIDEh.Text;
            if dbSireLookup.Text = '<None>' then
               lSire3.Caption  := ''
            else
               lSire3.Caption      := dbSireLookup.Text;
            if DamIDEh.Text = '<None>' then
               lDamRecip3.Caption   := ''
            else
               lDamRecip3.Caption   := DamIDEh.Text;
            if dbDamLookup.Text = '<None>' then
               lDamRecip3.Caption   := ''
            else
               lDamRecip3.Caption   := dbDamLookup.Text;
            if GDamIDEh.Text = '<None>' then
               lGenDonor3.Caption   := ''
            else
               lGenDonor3.Caption   := GDamIDEh.Text;
            if dbETDamLookup.Text = '<None>' then
               lGenDonor3.Caption   := ''
            else
               lGenDonor3.Caption   := dbETDamLookup.Text;
            lElectronicID3.Caption := Trim(TransponderNo.Text);
            if WinData.AnimalFileByIDPedigree.AsBoolean then
               lPedigree3.Caption := 'Yes'
            else
               lPedigree3.Caption := 'No';
            if WinData.AnimalFileByIDQualityAssured.AsBoolean then
               lQualityAssuredTxt2.Caption := 'Yes'
            else
               lQualityAssuredTxt2.Caption := 'No';
         except
         end;
   end;

begin
   with fmAnimalPrint do
      try
         if ( (UpperCase(fSetUpAnimals.ThisHerdType) = cBeefHerd ) and (DEF.Definition.dUseBeefMan) ) then
            PrintSteerReport
         else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'FEMALE' ) then
            begin
               lHerdID.Caption := cmboHerdLookUp.Text;
               lAnimalNo.Caption := AnimalNo.Text;
               lNatIDNum.Caption := NatIDNo.Text;
               DateOfBirth := DOB.EditText;
               lDOB.Caption := DateOfBirth;
               TBTest := TBTestDate.EditText;
               if TBTest = '  /  /    ' then
                  lTBTestDate.Caption := ''
               else
                  lTBTestDate.Caption   := TBTest;
               BTest                  := BruceDate.EditText;
               if BTest = '  /  /    ' then
                  lBTestDate.Caption := ''
               else
                  lBTestDate.Caption    := BTest;
               lBirthWeight.Caption := dbeWeight.Text;
               LCurrentLact.Caption := LactationNo.Text;
               lAName.Caption       := WinData.AnimalFileByIDName.AsString;
               lHBNumber.Caption    := HerdBookNo.Text;
               lSex.Caption         := SexCombo.Text;
               if (AnimalBreed.Text = '<Add>') then
                  lBreed.Caption := ''
               else
                  lBreed.Caption := AnimalBreed.Text;
               if (AnimalColour.Text = '<Add>') then
                  lColour.Caption := ''
               else
                  lColour.Caption      := AnimalColour.Text;
               if Breeding.Checked then
                  lBreeding.Caption := 'Yes'
               else
                  lBreeding.Caption := 'No';
               if InHerd.Checked then
                  lInHerd.Caption := 'Yes'
               else
                  lInHerd.Caption := 'No';
               if SireIDEh.Text = '<None>' then
                  lSire.Caption  := ''
               else
                  lSire.Caption      := SireIDEh.Text;
               if dbSireLookup.Text = '<None>' then
                  lSire.Caption  := ''
               else
                  lSire.Caption      := dbSireLookup.Text;
               if DamIDEh.Text = '<None>' then
                  lDamRecip.Caption  := ''
               else
                  lDamRecip.Caption    := DamIDEh.Text;
               if dbDamLookup.Text = '<None>' then
                  lDamRecip.Caption  := ''
               else
                  lDamRecip.Caption    := dbDamLookup.Text;
               if GDamIDEh.Text = '<None>' then
                  lGenDonor.Caption  := ''
               else
                  lGenDonor.Caption    := GDamIDEh.Text;
               if dbETDamLookup.Text = '<None>' then
                  lGenDonor.Caption  := ''
               else
                  lGenDonor.Caption    := dbETDamLookup.Text;
               lElectronicID.Caption := Trim(TransponderNo.Text);
               if WinData.AnimalFileByIDPedigree.AsBoolean then
                  lPedigree.Caption := 'Yes'
               else
                  lPedigree.Caption := 'No';
               if WinData.AnimalFileByIDQualityAssured.AsBoolean then
                  lQualityAssuredTxt.Caption := 'Yes'
               else
                  lQualityAssuredTxt.Caption := 'No';
            end
         else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'BULL' ) then
            begin
               lHerdID2.Caption       := cmboHerdLookUp.Text;
               lAnimalNo2.Caption     := AnimalNo.Text;
               lNatIDNum2.Caption     := NatIDNo.Text;
               DateOfBirth           := DOB.EditText;
               lDOB2.Caption          := DateOfBirth;
               TBTest                 := TBTestDate.EditText;
               if TBTest = '  /  /    ' then
                  lTBTestDate2.Caption := ''
               else
                  lTBTestDate2.Caption   := TBTest;
               BTest                  := BruceDate.EditText;
               if BTest = '  /  /    ' then
                  lBTestDate2.Caption := ''
               else
                  lBTestDate2.Caption    := BTest;
               lBirthWeight2.Caption  := dbeWeight.Text;
               LCurrentLact2.Caption  := LactationNo.Text;
               lAName2.Caption        := WinData.AnimalFileByIDName.AsString;
               lHBNumber2.Caption     := HerdBookNo.Text;
               lSex2.Caption          := SexCombo.Text;
               if (AnimalBreed.Text = '<Add>') then
                  lBreed2.Caption := ''
               else
                  lBreed2.Caption := AnimalBreed.Text;
               if (AnimalColour.Text = '<Add>') then
                  lColour2.Caption := ''
               else
                  lColour2.Caption      := AnimalColour.Text;
               if Breeding.Checked then
                  lBreeding2.Caption := 'Yes'
               else
                  lBreeding2.Caption := 'No';
               if InHerd.Checked then
                  lInHerd2.Caption := 'Yes'
               else
                  lInHerd2.Caption := 'No';
               if SireIDEh.Text = '<None>' then
                  lSire2.Caption  := ''
               else
                  lSire2.Caption      := SireIDEh.Text;
               if dbSireLookup.Text = '<None>' then
                  lSire2.Caption  := ''
               else
                  lSire2.Caption      := dbSireLookup.Text;
               if DamIDEh.Text = '<None>' then
                  lDamRecip2.Caption  := ''
               else
                  lDamRecip2.Caption    := DamIDEh.Text;
               if dbDamLookup.Text = '<None>' then
                  lDamRecip2.Caption  := ''
               else
                  lDamRecip2.Caption    := dbDamLookup.Text;
               if GDamIDEh.Text = '<None>' then
                  lGenDonor2.Caption  := ''
               else
                  lGenDonor2.Caption    := GDamIDEh.Text;
               if dbETDamLookup.Text = '<None>' then
                  lGenDonor2.Caption  := ''
               else
                  lGenDonor2.Caption    := dbETDamLookup.Text;
               lElectronicID2.Caption := Trim(TransponderNo.Text);
               if WinData.AnimalFileByIDPedigree.AsBoolean then
                  lPedigree2.Caption := 'Yes'
               else
                  lPedigree2.Caption := 'No';
               if WinData.AnimalFileByIDQualityAssured.AsBoolean then
                  lQualityAssuredTxt1.Caption := 'Yes'
               else
                  lQualityAssuredTxt1.Caption := 'No';
            end
          else if ( UPPERCASE(WinData.AnimalFileByIDSex.AsString) = 'STEER' ) then
             PrintSteerReport;
      except
      end;
end;

procedure TfSetUpAnimals.CurrLactSummCaptions;
begin
   with fmAnimalPrint do
      try
         // Dairy Current Lactation Summary Tab
         // Current Lactation
         lCCDate.Caption        := dbeCCalvDate.Text;
         lCCType.Caption        := dbeCCalfType.Text;
         lCBType.Caption        := dbeCBirthType.Text;
         lCNoServes.Caption     := dbeCNumServ.Text;
         lCCalvIndex.Caption    := dbeProjCInd.Text;
         lCDateDry.Caption      := dbeDateDry.Text;
         // Previous Lactation
         lPCalvDate.Caption     := dbePCalvDate.Text;
         lPCType.Caption        := dbePCalfType.Text;
         lCBType.Caption        := dbePBirthType.Text;
         lPNoServes.Caption     := dbePNumServ.Text;
         lPCalvIndex.Caption    := dbeLastCInd.Text;
         lPDateDry.Caption      := dbeLastDry.Text;
         // Current Lactation
         lCDaysInMilk.Caption   := dbeCDaysMilk.Text;
         lCLastTestRec.Caption  := dbeCLastTest.Text;
         lCBFat.Caption         := dbeCBFat.Text;
         lCProt.Caption         := dbeCProt.Text;
         lC305DayY.Caption      := dbeC305Y.Text;
         lCTotalY.Caption       := dbeCTotalY.Text;
         // Previous Lactation
         lPDaysInMilk.Caption   := dbePDaysMilk.Text;
         lPLastTestRec.Caption  := dbePLastTest.Text;
         lPBFat.Caption         := dbePBFat.Text;
         lPProt.Caption         := dbePProt.Text;
         lP305DayY.Caption      := dbeP305Y.Text;
         lPTotalY.Caption       := dbePTotalY.Text;
         // Suckler Animals
         lCDaysSuck.Caption     := eCDaysSuck.Text;
         lPDaysSuck.Caption     := ePDaysSuck.Text;
         lCDateWeaned.Caption   := dbeDateDry.Text;
         lPDateWeaned.Caption   := dbeLastDry.Text;
      except
      end;
end;

procedure TfSetUpAnimals.CurrFertCaptions;
begin
   with fmAnimalPrint do
      try
         // Bullings
         lNo1.Caption := sgBullings.Cells[0,1];
         lBullDate1.Caption := sgBullings.Cells[1,1];
         lInt1.Caption := sgBullings.Cells[ 2,1];

         lNo2.Caption := sgBullings.Cells[0,2];
         lBullDate2.Caption := sgBullings.Cells[1,2];
         lInt2.Caption := sgBullings.Cells[2,2];

         lNo3.Caption := sgBullings.Cells[0,3];
         lBullDate3.Caption := sgBullings.Cells[1,3];
         lInt3.Caption := sgBullings.Cells[2,3];

         lNo4.Caption := sgBullings.Cells[0,4];
         lBullDate4.Caption := sgBullings.Cells[1,4];
         lInt4.Caption := sgBullings.Cells[2,4];

         lNo5.Caption := sgBullings.Cells[0,5];
         lBullDate5.Caption := sgBullings.Cells[1,5];
         lInt5.Caption := sgBullings.Cells[2,5];

         // Services
         lSNo1.Caption := sgServices.Cells[0,1];
         lSerDate1.Caption := sgServices.Cells[1,1];
         lSint1.Caption := sgServices.Cells[2,1];
         lSBullUsed1.Caption := sgServices.Cells[3,1];
         lSServeType1.Caption := sgServices.Cells[4,1];

         lSNo2.Caption := sgServices.Cells[0,2];
         lSerDate2.Caption := sgServices.Cells[1,2];
         lSint2.Caption := sgServices.Cells[2,2];
         lSBullUsed2.Caption := sgServices.Cells[3,2];
         lSServeType2.Caption := sgServices.Cells[4,2];

         lSNo3.Caption := sgServices.Cells[0,3];
         lSerDate3.Caption := sgServices.Cells[1,3];
         lSint3.Caption := sgServices.Cells[2,3];
         lSBullUsed3.Caption := sgServices.Cells[3,3];
         lSServeType3.Caption := sgServices.Cells[4,3];

         lSNo4.Caption := sgServices.Cells[0,4];
         lSerDate4.Caption := sgServices.Cells[1,4];
         lSint4.Caption := sgServices.Cells[2,4];
         lSBullUsed4.Caption := sgServices.Cells[3,4];
         lSServeType4.Caption := sgServices.Cells[4,4];

         lSNo5.Caption := sgServices.Cells[0,5];
         lSerDate5.Caption := sgServices.Cells[1,5];
         lSint5.Caption := sgServices.Cells[2,5];
         lSBullUsed5.Caption := sgServices.Cells[3,5];
         lSServeType5.Caption := sgServices.Cells[4,5];

         lTotBullings.Caption := eTotBull.Text;
         lPlannedBull.Caption := ePlanBull.Text;
         lTotServices.Caption := eTotServ.Text;
         lDaysFromLastService.Caption := eDaysLast.Text;
         lPregnant.Caption := ePreg.Text;
         LCavDate.Caption := dbeLastCalv.Text;
         lProjCavDate.Caption := eProjCalv.Text;
      except
      end;
end;

procedure TfSetUpAnimals.PedCaptions;
begin

   with fmAnimalPrint do
      try
         // Pedigree Tab
         lPGrade.Caption := DBGrade.Text;
         lPScore.Caption := DBScore.Text;
         lPEBI.Caption := DBEBI.Text;
         lPPIN.Caption := DBpin.Text;
         lPPLI.Caption := DBPLI.Text;
         lFamilyName.Caption := DBFamilyName.Text;
         qrRichText.Lines := mPedDetails.Lines;//   Text;
      except
      end;

end;

procedure TfSetUpAnimals.NatIDNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Length(NatIDNo.Text) <= 0 then
      SetNatID.Visible := ((Key = VK_BACK) OR (Key = VK_INSERT));
end;

procedure TfSetUpAnimals.GetGroupNames;
var
   qLookupGrps : TQuery;
begin
   GroupsToCheck := '';
//   mdGroups.ReadOnly := False;
   try
      // get all group records for current animal
      qLookupGrps := TQuery.Create(nil);
      qLookupGrps.DatabaseName  := WinData.KingData.DatabaseName;
      with qLookupGrps do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT G.ID, G.GroupType, G.Code, G.Description, GL.AnimalID, GL.DateJoined');
            SQL.Add('FROM grps G, grplinks GL');
            SQL.Add('WHERE (AnimalID='+IntToStr(WinData.AnimalFileByIDID.AsInteger)+')');
            SQL.Add('AND (ID=GroupID)');
            Prepare;
            Open;
            First;
            if NOT IsEmpty then
               while NOT EOF do
                  begin
                     mdGroups.Append;
                     mdGroupsGType.AsString := FieldByName('GroupType').AsString;
                     mdGroupsGroupCode.AsString := FieldByName('Code').AsString;
                     mdGroupsGroupDesc.AsString := FieldByName('Description').AsString;
                     mdGroupsDateJoined.AsString := FormatDateTime(cIrishDateStyle,FieldByName('DateJoined').AsDateTime);
                     mdGroupsTotalInGroup.AsInteger := WinData.GroupManager.GetNumberOfAnimalsInGroup(FieldByName('ID').AsInteger);
                     mdGroups.Post;
                     Next;
                  end;
         end;
   finally
      qLookupGrps.Close;
      qLookupGrps.Free;
//      mdGroups.ReadOnly := True;
   end;

end;

{
procedure TfSetUpAnimals.GetCurrGrps;
var
   FirstRound : Boolean;
begin
   try
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT Distinct G.ID, G.GroupType, GL.AnimalID FROM Grps G, GrpLinks GL ');
            SQL.Add('WHERE (G.ID=GL.GroupID)');
            SQL.Add('AND (GL.AnimalID='+IntToStr(WinData.AnimalFileByIDID.AsInteger)+')');
            SQL.Add('AND ((G.GroupType = "Batch") OR (G.GroupType = "Feed")) ');
            Open;
            if NOT IsEmpty then
               begin
                  First;
                  while NOT GenQuery.EOF do
                     begin
                        if FieldByName('GroupType').AsString = 'Feed' then
                           iFeedGrp := FieldByName('ID').AsInteger
                        else
                           iBatchGrp := FieldByName('ID').AsInteger;
                        Next;
                     end;
               end;
         end;
   except
      //
   end;
end;  }

procedure TfSetUpAnimals.GroupTypes;
begin

end;

procedure TfSetUpAnimals.AddRemoveFromGroup(AID, GroupID : Integer; GType : String);
begin
   WinData.GroupManager.AddToGroup(WinData.AnimalFileByIDID.AsInteger, GroupID, TRUE, now(), WinData.AnimalFileByIDNatIDNum.AsString );
end;

procedure TfSetUpAnimals.SexComboChange(Sender: TObject);
begin
   SetModifiedFlag;

   //   20/06/13 [V5.1 R7.5] /MK Change - If user changes animal sex from female to bull and animal has lactno
   //                                     greater than 0 then do not allow the sex to be changed.
   if ( WinData.AnimalFileByID.State = dsEdit ) then
      if ( WinData.AnimalFileByIDLactNo.AsInteger > 0 ) then
         if ( SexCombo.Text = 'Bull' ) then
            begin
               MessageDlg('This animal has been classifed as a breeding cow.',mtError,[mbOK],0);
               WinData.AnimalFileByID.Cancel;
            end;

   AnimalType;
   //SP 10/11/00 Added to default breeding check box to active if female or Bull,
   // except in case of Beef herd where all are not used for breeding.
   if ( (UPPERCASE(SexCombo.Text) = 'STEER') or (FHerdType = htBeef) ) then
      begin
         BruceDate.Visible   := False;
         Label56.Visible     := False;
         Breeding.Visible    := False;
         Breeding.Checked    := False;
         cbPedigree.Visible  := False;
      end
   else
      begin
         BruceDate.Visible   := True;
         Label56.Visible     := True;
         Breeding.Visible    := True;
         Breeding.Checked    := True;
         cbPedigree.Visible  := True;
      end;

   if ( FHerdType = htBeef ) then
      begin
         Label56.Visible := ( UPPERCASE(SexCombo.Text) = 'FEMALE' );
         BruceDate.Visible := Label56.Visible;
      end;

   lBVDTestDate.Top := 271;
   BVDDate.Top := 268;
   if ( not(BruceDate.Visible) ) then
      begin
         lBVDTestDate.Top := Label56.Top;
         BVDDate.Top := BruceDate.Top;
      end;

   WhichReg := WinData.SystemRegisteredCountry;
   if ( WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID ) and ( UPPERCASE(SexCombo.Text) = 'BULL' ) then
      begin
         if ( WhichReg = Ireland ) then
            Label1.Caption := 'AI Code'
         else Label1.Caption := 'Bull Name (Short)'
      end
   else Label1.Caption := 'Animal No / Name'
end;

procedure TfSetUpAnimals.LoadImage;
var
   FiletoCheck : String;
   MySender : TRxSpeedButton;
begin
   FileToCheck := 'C:\Kingswood Herd Management\Images\';
   FileToCheck := FileToCheck+IntToStr(ImageID);
   if (DirectoryExists(FileToCheck)) then
      GetImage
   else
      begin
         lNoImage.Visible := True;
         ImagePedigree.Width := 0;
         sbAddAmendClick(MySender);
      end;
end;

procedure TfSetUpAnimals.tsPedigreeImagesShow(Sender: TObject);
begin
   LoadImage;
end;

procedure TfSetUpAnimals.ActivateScan(Activate: Boolean);
begin
   if Activate then
     begin
        imgBarcode.Visible := True;
        imgBarcode2.Visible := True;
        DOB.Visible           := False;
        AnimalBreed.Visible   := False;
        SexCombo.Visible      := False;
        Label12.Visible       := False;
        Label25.Visible       := False;
        Label13.Visible       := False;
        LBScan.Visible        := True;
        ScanInCode.Visible    := True;
        ScanInCode.Width      := DOB.Width;
        ScanInCode.SetFocus;
        ReScan.Caption := 'Disable'
     end
   else
      begin
         imgBarcode.Visible := False;
         imgBarcode2.Visible := False;
         DOB.Visible          := True;
         AnimalBreed.Visible  := True;
         Label12.Visible      := True;
         Label25.Visible      := True;
         Label13.Visible      := True;
         SexCombo.Visible     := True;
         LBScan.Visible       := False;
         ScanInCode.Visible   := False;
     //    DOB.SetFocus;
         ReScan.Caption := 'Enable';
      end;
//   SetActiveControl;
end;

procedure TfSetUpAnimals.SetColorMandatory;
begin
   if cmboHerdLookUp.Value <> '0' then
      if Windata.DefCountry(cmboHerdLookUp.KeyValue) = NIreland then
         begin
            AnimalColour.Color := clTeal;
            AnimalColour.Font.Color := clWhite;
         end
      else
         begin
            AnimalColour.Color := clWindow;
            AnimalColour.Font.Color := clBlack;
         end;
   AnimalColour.Repaint;
end;

function TfSetUpAnimals.FillArray(Dbe1, Dbe2, Dbe3,
  Dbe4: TDBEdit): TAncestryFieldArray;
begin
   Result[0] := Dbe1;
   Result[1] := Dbe2;
   Result[2] := Dbe3;
   Result[3] := Dbe4;
end;

procedure TfSetUpAnimals.ShowAll1Click(Sender: TObject); // SP
begin
   WinData.MenuItemClick(Sender, pmMilkDisk);
   SetGridFooters(dbgMilk, (Sender as TMenuItem).Tag);
end;

procedure TfSetUpAnimals.MenuItem6Click(Sender: TObject);    // SP
begin
   WinData.MenuItemClick(Sender, pmMilkTrans);
   SetGridFooters(dbgMilkTrans, (Sender as TMenuItem).Tag);
end;

procedure TfSetUpAnimals.SetGridFooters(DBGrid : TDBGridEh; FooterSelection : Integer);
var
   ColumnIndex : Byte;
begin
   DBGrid.FooterRowCount := 0;
   for ColumnIndex := 0 to Pred(DBGrid.Columns.Count) do
       DBGrid.Columns[ColumnIndex].Footers.Clear;

  if not FooterSelection in [0..2] then Exit;
   try
      if ( DBGrid = dbgMilk ) then
         begin
            if ( rbShow305Yield.Checked ) then
               begin
                  if ( FooterSelection = 0 ) then
                     begin
                        DBGrid.FooterRowCount := 2;
                        CreateFooter(DBGrid, 'LactNo', 0, ftAll);
                        CreateFooter(DBGrid, 'LactNo', 1, ftAll);
                        CreateFooter(DBGrid, 'Yield305', 0, ftAll);
                        CreateFooter(DBGrid, 'Yield305', 1, ftAll);
                        CreateFooter(DBGrid, 'BfatPerc305', 0, ftAll);
                        CreateFooter(DBGrid, 'ProtPerc305', 0, ftAll);
                        //   26/11/15 [V5.5 R1.3] /MK Change - Added footers for all kg values and removed SCC footer - GL/Brendan Meade (6980) request.
                        CreateFooter(DBGrid, '305BFatKgs',0,ftAll);
                        CreateFooter(DBGrid, '305BFatKgs',1,ftAll);
                        CreateFooter(DBGrid, '305ProtKgs',0,ftAll);
                        CreateFooter(DBGrid, '305ProtKgs',1,ftAll);
                        CreateFooter(DBGrid, '305TotalSolids',0,ftAll);
                        CreateFooter(DBGrid, '305TotalSolids',1,ftAll);
                        CreateFooter(DBGrid, 'SCC',0,ftAll);
                        CreateFooter(DBGrid, 'SCC',1,ftAll);
                     end
                  else if ( FooterSelection = 1 ) then
                     begin
                        DBGrid.FooterRowCount := 1;
                        CreateFooter(DBGrid, 'LactNo', 0, ftAvg);
                        CreateFooter(DBGrid, 'Yield305', 0, ftAvg);
                        CreateFooter(DBGrid, 'BfatPerc305', 0, ftAvg);
                        CreateFooter(DBGrid, 'ProtPerc305', 0, ftAvg);
                        //   26/11/15 [V5.5 R1.3] /MK Change - Added footers for all kg values and removed SCC footer - GL/Brendan Meade (6980) request.
                        CreateFooter(DBGrid, '305BFatKgs',0,ftAvg);
                        CreateFooter(DBGrid, '305ProtKgs',0,ftAvg);
                        CreateFooter(DBGrid, '305TotalSolids',0,ftAvg);
                        //CreateFooter(DBGrid, 'SCC',0,ftAvg);
                     end
                  else if ( FooterSelection = 2 ) then
                     begin
                        DBGrid.FooterRowCount := 1;
                        CreateFooter(DBGrid, 'LactNo', 0, ftSum);
                        CreateFooter(DBGrid, 'Yield305', 0, ftSum);
                        //   26/11/15 [V5.5 R1.3] /MK Change - Added footers for all kg values and removed SCC footer - GL/Brendan Meade (6980) request.
                        CreateFooter(DBGrid, '305BFatKgs',0,ftSum);
                        CreateFooter(DBGrid, '305ProtKgs',0,ftSum);
                        CreateFooter(DBGrid, '305TotalSolids',0,ftSum);
                        CreateFooter(DBGrid, 'SCC',0,ftSum);
                     end;
               end
            else
               begin
                  if ( FooterSelection = 0 ) then
                     begin
                        DBGrid.FooterRowCount := 2;
                        CreateFooter(DBGrid, 'LactNo', 0, ftAll);
                        CreateFooter(DBGrid, 'LactNo', 1, ftAll);
                        CreateFooter(DBGrid, 'CumYield', 0, ftAll);
                        CreateFooter(DBGrid, 'CumYield', 1, ftAll);
                        CreateFooter(DBGrid, 'CumBfatPerc', 0, ftAll);
                        CreateFooter(DBGrid, 'CumProtPerc', 0, ftAll);
                        //   26/11/15 [V5.5 R1.3] /MK Change - Added footers for all kg values and removed SCC footer - GL/Brendan Meade (6980) request.
                        CreateFooter(DBGrid, 'CumBFatKgs', 0, ftAll);
                        CreateFooter(DBGrid, 'CumBFatKgs', 1, ftAll);
                        CreateFooter(DBGrid, 'CumProtKgs', 0, ftAll);
                        CreateFooter(DBGrid, 'CumProtKgs', 1, ftAll);
                        CreateFooter(DBGrid, 'CumTotalSolids',0,ftAll);
                        CreateFooter(DBGrid, 'CumTotalSolids',1,ftAll);
                        CreateFooter(DBGrid, 'SCC',0,ftAll);
                        CreateFooter(DBGrid, 'SCC',1,ftAll);
                     end
                  else if ( FooterSelection = 1 ) then
                     begin
                        DBGrid.FooterRowCount := 1;
                        CreateFooter(DBGrid, 'LactNo', 0, ftAvg);
                        CreateFooter(DBGrid, 'CumYield', 0, ftAvg);
                        CreateFooter(DBGrid, 'CumBfatPerc', 0, ftAvg);
                        CreateFooter(DBGrid, 'CumProtPerc', 0, ftAvg);
                        //   01/12/14 [V5.4 R0.2] /MK Additional Feature - Added Footers for Solids and SCC - Brendan Meade request.
                        //   26/11/15 [V5.5 R1.3] /MK Change - Added footers for all kg values and removed SCC footer - GL/Brendan Meade (6980) request.
                        CreateFooter(DBGrid, 'CumBFatKgs', 0, ftAvg);
                        CreateFooter(DBGrid, 'CumProtKgs', 0, ftAvg);
                        CreateFooter(DBGrid, 'CumTotalSolids',0,ftAvg);
                        CreateFooter(DBGrid, 'SCC',0,ftAvg);
                     end
                  else if ( FooterSelection = 2 ) then
                     begin
                        DBGrid.FooterRowCount := 1;
                        CreateFooter(DBGrid, 'LactNo', 0, ftSum);
                        //   26/11/15 [V5.5 R1.3] /MK Change - Added footers for all kg values and removed SCC footer - GL/Brendan Meade (6980) request.
                        CreateFooter(DBGrid, 'CumBFatKgs', 0, ftSum);
                        CreateFooter(DBGrid, 'CumProtKgs', 0, ftSum);
                        CreateFooter(DBGrid, 'CumTotalSolids',0,ftSum);
                        CreateFooter(DBGrid, 'SCC',0,ftSum);
                     end;
               end;
         end
      else
         begin
            if ( FooterSelection = 0 ) then
               begin
                  DBGrid.FooterRowCount := 2;
                  CreateFooter(DBGrid, 'DateofRecording', 0, ftAll);
                  CreateFooter(DBGrid, 'DateofRecording', 1, ftAll);
                  CreateFooter(DBGrid, 'DailyYield', 0, ftAll);
                  CreateFooter(DBGrid, 'DailyYield', 1, ftAll);
                  CreateFooter(DBGrid, 'DailyBfatPerc', 0, ftAll);
                  CreateFooter(DBGrid, 'DailyProtPerc', 0, ftAll);
                  CreateFooter(DBGrid, 'DailyLactPerc', 0, ftAll);
                  CreateFooter(DBGrid, 'SCC', 0, ftNone);
                  CreateFooter(DBGrid, 'SCC', 1,ftAll);
               end
            else if ( FooterSelection = 1 ) then
               begin
                  DBGrid.FooterRowCount := 1;
                  CreateFooter(DBGrid, 'DateofRecording', 0, ftAvg);
                  CreateFooter(DBGrid, 'DailyYield', 0, ftAvg);
                  CreateFooter(DBGrid, 'DailyBfatPerc', 0, ftAvg);
                  CreateFooter(DBGrid, 'DailyProtPerc', 0, ftAvg);
                  CreateFooter(DBGrid, 'DailyLactPerc', 0, ftAvg);
                  CreateFooter(DBGrid, 'SCC', 0, ftNone);
               end
            else if ( FooterSelection = 2 ) then
               begin
                  DBGrid.FooterRowCount := 1;
                  CreateFooter(DBGrid, 'DateofRecording', 0, ftSum);
                  CreateFooter(DBGrid, 'DailyYield', 0, ftSum);
               end;
         end;
   finally
      DBGrid.InvalidateFooter;
      //DBGrid.Refresh;
   end;
end;

procedure TfSetUpAnimals.CreateFooter(DBGrid : TDBGridEh; FieldName : string; FootIndex : Integer; FooterType : TFooterType);
var
   Footers : TColumnFootersEh;
begin
   if ( FieldName <> 'LactNo' ) and ( FieldName <> 'DateofRecording' ) then
      begin
         Footers := DBGrid.FieldColumns[FieldName].Footers;
         Footers.Add;
         Footers[FootIndex].FieldName := FieldName;
         case FooterType of
            ftAll : begin
                       if FootIndex = 0 then
                          Footers[FootIndex].ValueType := fvtAvg
                       else
                          Footers[FootIndex].ValueType := fvtSum;
                    end;
            ftAvg : Footers[FootIndex].ValueType := fvtAvg;
            ftSum : Footers[FootIndex].ValueType := fvtSum;
            ftNone : Footers[FootIndex].Value := '';
         end;
      end
   else
      begin
         Footers := DBGrid.FieldColumns[FieldName].Footers;
         Footers.Add;
         Footers[FootIndex].ValueType := fvtStaticText;
         case FooterType of
            ftAll : begin
                       if FootIndex = 0 then
                          Footers[FootIndex].Value := 'Avg.'
                       else
                          Footers[FootIndex].Value := 'Total';
                    end;
            ftAvg : Footers[FootIndex].Value := 'Avg.';
            ftSum : Footers[FootIndex].Value := 'Total';
         end;
      end;
   if ( Footers <> nil ) then
      if ( Footers.Count > 0 ) then
         begin
            if ( (FieldName = 'BfatPerc305') or (FieldName = 'ProtPerc305') or
                 (FieldName = 'DailyBfatPerc') or (FieldName = 'DailyProtPerc') ) then
               Footers[FootIndex].DisplayFormat := '0.00'
            else
               Footers[FootIndex].DisplayFormat := '0';
         end;
end;

procedure TfSetUpAnimals.sbMilkTransClick(Sender: TObject);
begin
   pmMilkTrans.Popup(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TfSetUpAnimals.sbMilkDiskClick(Sender: TObject);
begin
  pmMilkDisk.Popup(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TfSetUpAnimals.NatIDNoEnter(Sender: TObject);
begin
   if ( WinData.AnimalFileByID.State = dsInsert ) then
      case WinData.DefaultNatIdMaskIndex of
         MT_NEWEIDTAG,
         MT_NEWPLASTIC : case Length(StripAllSpaces(NatIDNo.Text)) of
                            2  : NatIDNo.SelStart := 3;
                            3  : NatIDNo.SelStart := 4;
                            9  : NatIDNo.SelStart := 12;
                            10 : NatIDNo.SelStart := 13;
                         end;
         MT_OLDPLASTIC : case Length(StripAllSpaces(NatIDNo.Text)) of
                            2 : NatIDNo.SelStart := 3;
                            6 : NatIDNo.SelStart := 8;
                         end;
         MT_BRASSTAG   : NatIDNo.SelStart := 1;
         MT_UKTAG      : NatIDNo.SelStart := 10;
      end;
end;

procedure TfSetUpAnimals.ScanInCodeEnter(Sender: TObject);
begin
   if WhatStyleNatID(WinData.AnimalFileByIDNatIDNum.AsString, False) = StylePre1996 then
      begin
         ActivateScan(False);
         ReScan.Visible := False;
         DOB.SetFocus;
      end;
end;

procedure TfSetUpAnimals.SetAncestryDisplayFields;
begin
   if DamIDEh.KeyValue > 0 then
      begin
         if Length(Trim(WinData.DamQuery.FieldByName('AnimalNo').AsString)) <= 0 then
            DamIDEh.ListField := 'NatIDNum'
         else
            DamIDEh.ListField := 'AnimalNo';
      end;

   if GDamIDEh.KeyValue > 0 then
      if Length(Trim(WinData.DamQuery.FieldByName('AnimalNo').AsString)) <= 0 then
         GDamIDEh.ListField := 'NatIDNum'
      else
         GDamIDEh.ListField := 'AnimalNo';

   if SireIDEh.KeyValue > 0 then
      if Length(Trim(WinData.SireQuery.FieldByName('AnimalNo').AsString)) <= 0 then
         SireIDEh.ListField := 'NatIDNum'
      else
         SireIDEh.ListField := 'AnimalNo';
end;

procedure TfSetUpAnimals.Splitter2CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
   if NewSize < 268 then
      Accept := False
   else
      Accept := True;
end;

procedure TfSetUpAnimals.Splitter3CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
   if NewSize > 271 then
      Accept := False
   else
      accept := True;
end;

procedure TfSetUpAnimals.DisplayInherdField;
var
   SaleDeathExists : Boolean;
begin
   // Only show Inherd checkbox if there is conflict between sale event and inherd status.
   //   09/02/12 [V5.0 R3.7] /MK Change - Normal Logic + Only If Herd <> NoneHerd.
   SaleDeathExists := WinData.HasSaleDeath(WinData.AnimalFileByIDID.AsInteger, WinData.AnimalFileByIDHerdID.AsInteger);
   InHerd.Visible := ( ( SaleDeathExists ) and ( WinData.AnimalFileByIDInHerd.AsBoolean ) ) or
                       ( (not(SaleDeathExists)) and ( not (WinData.AnimalFileByIDInHerd.AsBoolean) )
                       and ( not(cmboHerdLookUp.Value = IntToStr(WinData.NONEHerdID))) );
end;

procedure TfSetUpAnimals.CheckDBBrowserState;
begin
   if ( WinData.tBlup.State in dsEditModes ) then
      try
         WinData.tBlup.Post;
      except
         WinData.tBlup.Cancel;
      end;

   if ( WinData.tBullExt.State in dsEditModes ) then
      try
         WinData.tBullExt.Post;
      except
         WinData.tBullExt.Cancel;
      end;

   if ( WinData.tBullSemen.State in dsEditModes ) then
      try
         WinData.tBullSemen.Post;
      except
         WinData.tBullSemen.Cancel;
      end;

   if ( WinData.CowExt.State in dsEditModes ) then
      try
         WinData.CowExt.Post;
      except
         WinData.CowExt.Cancel;
      end;
end;

procedure TfSetUpAnimals.Label80Click(Sender: TObject);
begin
   with TfmCowMilkHistory.Create(nil) do
      try
         qrCowMilkHistory.Preview;
      finally
        free;
      end;
end;

procedure TfSetUpAnimals.dbgWeighingsDblClick(Sender: TObject);
begin
   if ( QueryWeighingsID.AsInteger > 0 ) then
      begin
         if WinData.Events.Locate('ID', QueryWeighingsID.AsInteger,[]) then
            Weighing.ShowWeight(AmendWeight);
      end;
end;

procedure TfSetUpAnimals.tsHealthShow(Sender: TObject);
begin
   // refresh the health query for browse health tab.
   RefreshHealthQuery;
end;

procedure TfSetUpAnimals.AnimalPagesPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   if ( not(TabUpdating) ) then
      begin
         if mdGroups.Active then
            mdGroups.Active := False;

         if QueryWeighings.Active then
            QueryWeighings.Active := False;

         if ( NewPage = tsGroups ) then
            begin
               mdGroups.Active := True;
               GetGroupNames;
            end
         else if ( NewPage = tsPastCalf ) then
            begin
               GetLactDetails ( WinData.AnimalFileByIdID.AsInteger );
               CurrFertCalcs( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                              cBullingEvent );
               CurrFertCalcs( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                              cServiceEvent );
               PastCalfCalcs;
            end
         else if ( NewPage = tsLactSumm ) then
            begin
               GetLactDetails ( WinData.AnimalFileByIdID.AsInteger );
               LactSummCalcs;
            end
         else if ( NewPage = tsCurrFert ) then
            begin
               //   30/08/12 [V5.0 R8.7] /MK Bug Fix - On tsCurrFert HoldLactInfo table was not being refreshed.
               GetLactDetails ( WinData.AnimalFileByIdID.AsInteger );
               CurrFertCalcs( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                              cBullingEvent );
               CurrFertCalcs( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                              cServiceEvent );
            end
         else if ( NewPage = tsPastFert ) then
            begin
               GetLactDetails ( WinData.AnimalFileByIdID.AsInteger );
               PastCalfCalcs;
            end
         else if ( NewPage = tsBullSemen ) then
            begin
               if ( WinData.AnimalFileByIDSex.AsString = cSex_Bull ) then
                  if ( not(WinData.tBullSemen.Locate('AnimalId', WinData.AnimalFileByIDID.AsInteger,[])) ) then
                     begin
                        WinData.tBullSemen.Insert;
                        //   20/04/17 [V5.6 R5.7] /MK Bug Fix - If BullSemenStk record doesn't exist then create it with InUse set to whatever UsedForBreeding boolean is. 
                        WinData.tBullSemen.FieldByName('InUse').AsBoolean := WinData.AnimalFileByIDBreeding.AsBoolean;
                        if WinData.AnimalFileByID.State in [dsBrowse,dsEdit] then
                           try
                              WinData.tBullSemen.Post;
                           except
                              on E : EDatabaseError do
                                 begin
                                    WinData.tBullSemen.Cancel;
                                    raise EDatabaseError.Create( E.Message );
                                 end;
                           end;
                     end;
            end
         else if ( NewPage = tsBullInfo ) then
            begin
               if WinData.AnimalFileByIDID.AsString = cSex_Bull then
                  begin
                     if not WinData.tBullExt.Locate('AnimalId', WinData.AnimalFileByIDID.AsInteger,[] ) then
                        begin
                           WinData.tBullExt.Insert;
                           try
                           except
                              on E : EDatabaseError do
                                 begin
                                    WinData.tBullExt.Cancel;
                                    raise EDatabaseError.Create(E.Message);
                                 end;
                           end;
                        end;
                 end;
            end
         else if ( NewPage = tsPedigree ) then
            GetPedDetails
         else if ( NewPage = tsBlupPedigree ) then
            begin
               if ( not(WinData.dsBlup.DataSet.Locate('AnimalID', WinData.AnimalFileByIDID.AsInteger,[])) ) then
                  WinData.tBlup.Append;
            end
         else if ( NewPage = tsWeighings ) then
            QueryWeighings.Active := True
         else if ( NewPage = tsCattleMargins ) then
            DoCattleMarginCalcs
         else if ( NewPage = tsHealth ) then
            begin
               // Open the Health Query
               qHealth.Close;
               qHealth.UnPrepare;
               qHealth.Prepare;
               qHealth.Open;
            end
         else if ( NewPage = tsWeighingChart ) then
            GetWeightInfo;
      end;
end;

procedure TfSetUpAnimals.RefreshHealthQuery;
begin
   qHealth.Close;
   qHealth.Open;
end;

procedure TfSetUpAnimals.cxButton1Click(Sender: TObject);
begin
   Update;
   TfmGroupUpdate.ShowForm(WinData.AnimalFileByIDID.AsInteger);
   mdGroups.Active := False;
   mdGroups.Active := True;
   GetGroupNames;
end;

procedure TfSetUpAnimals.mPedDetailsChange(Sender: TObject);
begin
   DBGrade.Datasource.Dataset.Edit;
end;

procedure TfSetUpAnimals.tsMilkSheetShow(Sender: TObject);
begin
   dbgMilk.DataSource.Dataset.Last;

end;

procedure TfSetUpAnimals.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TfSetUpAnimals.cmboHerdLookUpChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSetUpAnimals.AnimalNoChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.DOBChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.ScanInCodeChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.AnimalBreedChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.AnimalColourChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.TBTestDateChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.BruceDateChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.dbeWeightChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.LactationNoChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.BreedingClick(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.InHerdClick(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.NameChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.HerdBookNoChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.SireIDEhChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSetUpAnimals.DamIDEhChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.GDamIDEhChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpAnimals.AnimalBreedCloseUp(Sender: TObject;
  Accept: Boolean);
begin
//   if AnimalBreed.Value <= 0 then
//      SetUpBreeds.ShowTheForm(TRUE);
end;

procedure TfSetUpAnimals.GetWeightInfo;
var
   WeightDate : TDateTime;
   Weight : Variant;
   EventDetailsArray : TEventDetailsArray;
   NoDays : Integer;

   ThisWeighingDate : TDateTime;
   i : Integer;
   LastWeight : Double;
   WeightDiff : Double;
   DaysOnFarm : Integer;
   PurchDate : TDateTime;
   vSold, vEventDate, vWeight : Variant;
   SaleDate : TDateTime;
begin
   dbWeighingGraph.UndoZoom;
   WinData.LookUpPurchases.Active := True;
   mdWeighingChartData.Close;
   mdWeighingChartData.Open;
   if WinData.AnimalFileByIDBirthWeight.AsFloat > 0 then
      begin
         WeightDate := WinData.AnimalFileByIDDateOfBirth.AsDateTime ;
         Weight := WinData.AnimalFileByIDBirthWeight.AsFloat;
      end
   else // Check Purchase Weight, if any
      begin
         if WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsInteger,cPurchaseEvent]),[]) then
            begin
               Weight := WinData.LookUpPurchases.Lookup('EventID', WinData.CheckEvents.FieldByName('ID').AsInteger, 'Weight');
               WeightDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               PurchDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               if not VarIsNull(Weight) then
               if Weight <= 0 then
                  begin
                     WeightDate := 0;
                  end;
            end;
      end;

    if VarIsNull(Weight) then
       begin
          Weight := 0;
          WeightDate := 0;
       end;

    if ( WeightDate > 0 ) and ( Weight > 0 )then
       begin
          mdWeighingChartData.Append;
          mdWeighingChartDataAnimalID.AsInteger := WinData.AnimalFileByIDID.AsInteger;

          if PurchDate > 0 then
             begin
                if WeightDate = PurchDate then
                   mdWeighingChartDataNoOfDays.AsInteger := 1
                else
                   mdWeighingChartDataNoOfDays.AsInteger := Trunc(WeightDate - PurchDate);
             end
          else
             begin
                if WeightDate = WinData.AnimalFileByIDDateOfBirth.AsDateTime then
                   mdWeighingChartDataNoOfDays.AsInteger := 1
                else
                   mdWeighingChartDataNoOfDays.AsInteger := Trunc(WeightDate - WinData.AnimalFileByIDDateOfBirth.AsDateTime);
             end;
          mdWeighingChartDataWeighingDate.AsDateTime := WeightDate;
          mdWeighingChartDataWeight.AsFloat := Weight;

          if (mdWeighingChartDataNoOfDays.AsInteger>0) then
              mdWeighingChartDataDLWG.AsFloat := (mdWeighingChartDataWeight.AsFloat / mdWeighingChartDataNoOfDays.AsInteger );

          mdWeighingChartData.Post;
       end;

   QueryWeighings.Active := True;
   with QueryWeighings do
      begin
         DisableControls;
         First;
         try
            while not eof do
               begin
                  LastWeight := mdWeighingChartDataWeight.AsFloat;
                  WeightDate := mdWeighingChartDataWeighingDate.AsDateTime;

                  mdWeighingChartData.Append;
                  mdWeighingChartDataAnimalID.AsInteger := WinData.AnimalFileByIDID.AsInteger;
                  mdWeighingChartDataWeighingDate.AsDateTime := QueryWeighingsEventDate.AsDateTime;
                  mdWeighingChartDataWeight.AsFloat := QueryWeighingsWeight.AsFloat;

                  if PurchDate > 0 then
                     mdWeighingChartDataNoOfDays.AsInteger := Trunc(QueryWeighingsEventDate.AsDateTime - PurchDate)
                  else
                     mdWeighingChartDataNoOfDays.AsInteger := Trunc(QueryWeighingsEventDate.AsDateTime - WinData.AnimalFileByIDDateOfBirth.AsDateTime);
                  NoDays := trunc(QueryWeighingsEventDate.AsDateTime-WeightDate);
                  if (NoDays>0) then
                     begin
                        WeightDiff := mdWeighingChartDataWeight.AsFloat-LastWeight;
                        mdWeighingChartDataDLWG.AsFloat := (WeightDiff / NoDays);
                     end;
                  mdWeighingChartData.Post;
                  Next;
               end;
         finally
            EnableControls;
         end;
      end;

   // insert sales weight if found.
   if not(WinData.AnimalFileByIDInHerd.AsBoolean) then
      begin

         EventDetailsArray := uHerdLookup.HerdLookup.GetEventDetails(WinData.AnimalFileByIDID.AsInteger,cSaleDeathEvent);
         for i := Low(EventDetailsArray) to High(EventDetailsArray) do
            begin
               vSold := EventDetailsArray[i].SubEvent[1];
               if not VarIsNull(vSold) then
                  begin
                     vEventDate := EventDetailsArray[i].Event[3];
                     if not VarIsNull(vEventDate) then
                        SaleDate := vEventDate;

                     vWeight := EventDetailsArray[i].SubEvent[4];
                  end

            end;
                  
         if ((vSold=True) and (SaleDate>0) and not(VarIsNull(vWeight))) then
            begin
               LastWeight := mdWeighingChartDataWeight.AsFloat;
               WeightDate := mdWeighingChartDataWeighingDate.AsDateTime;
               mdWeighingChartData.Append;
               mdWeighingChartDataAnimalID.AsInteger := WinData.AnimalFileByIDID.AsInteger;
               mdWeighingChartDataWeighingDate.AsDateTime :=SaleDate;
               mdWeighingChartDataWeight.AsFloat := vWeight;

               if (PurchDate > 0) then
                  mdWeighingChartDataNoOfDays.AsInteger := Trunc(SaleDate - PurchDate)
               else
                  mdWeighingChartDataNoOfDays.AsInteger := Trunc(SaleDate - WinData.AnimalFileByIDDateOfBirth.AsDateTime);
               NoDays := Trunc(SaleDate-WeightDate);
               if (NoDays>0) then
                  begin
                     WeightDiff := mdWeighingChartDataWeight.AsFloat-LastWeight;
                     mdWeighingChartDataDLWG.AsFloat := (WeightDiff / NoDays);
                  end;
               mdWeighingChartData.Post;
            end
      end;

   QueryWeighings.Active := false;
   WinData.LookUpPurchases.Active := False;
end;

procedure TfSetUpAnimals.rbGraphViewClick(Sender: TObject);
var
   HerdType : string;
begin
   rbGraphView.Checked := True;
   HerdType := uHerdLookup.HerdLookup.GetHerdTypeAsString(WinData.AnimalFileByIDHerdID.AsInteger);
   if HerdType = cBeefHerd then
      begin
         rbWeighGraphViewByDays.Visible := True;
         rb1YearGraphPeriod.Visible := False;
         rb2YearGraphPeriod.Visible := False;

         if WinData.GlobalSettings.AnimalWeighingGraphXAxisVariable then
            rbWeighingGraphVarDays.Checked := True
         else
            rbWeighGraphViewByDays.Checked := True;
         //rbWeighGraphViewByDays.Checked := True;
      end
   else
      begin
         rb1YearGraphPeriod.Visible := True;
         rb2YearGraphPeriod.Visible := True;
         rbWeighGraphViewByDays.Visible := False;
         rb1YearGraphPeriod.Checked := True;
      end;
   rbBarChartView.Checked := False;
   GridWeighingBarChart.Visible := False;
   dbWeighingGraph.Visible := True;
   pGraphPeriod.Visible := True;
//   rb1YearGraphPeriod.Checked := True;
//   rb2YearGraphPeriod.Checked := False;
//   GetWeightInfo;
end;

procedure TfSetUpAnimals.rbBarChartViewClick(Sender: TObject);
begin
   rbBarChartView.Checked := True;
   rbGraphView.Checked := False;
   GridWeighingBarChart.Visible := True;
   dbWeighingGraph.Visible := False;
   pGraphPeriod.Visible := False;
//   GetWeightInfo;
end;

procedure TfSetUpAnimals.tsWeighingChartShow(Sender: TObject);
var
   HerdType : string;
begin

   rbGraphView.Checked := True;
   HerdType := uHerdLookup.HerdLookup.GetHerdTypeAsString(WinData.AnimalFileByIDHerdID.AsInteger);
   if HerdType = cBeefHerd then
      begin
         dbWeighingGraph.BottomAxis.AutomaticMinimum := True;
         pGraphPeriod.Visible := False;
         pBeefWeighingGraphInput.Visible := True;
         //rb1YearGraphPeriod.Visible := False;
         //rb2YearGraphPeriod.Visible := False;

         WeighingGraphTrackBar.Position := WinData.GlobalSettings.AnimalWeighingGraphXAxisValue;

         if WinData.GlobalSettings.AnimalWeighingGraphXAxisVariable then
            rbWeighingGraphVarDays.Checked := True
         else
            rbWeighGraphViewByDays.Checked := True;

         dbWeighingGraph.BottomAxis.Increment := 7;
         dbWeighingGraph.BottomAxis.Title.Caption := 'Days On Farm';
         dbWeighingGraph.Title.Text.Text := 'Graph of Weighings vs. Days On Farm';
      end
   else
      begin
         dbWeighingGraph.BottomAxis.AutomaticMinimum := False;
         pBeefWeighingGraphInput.Visible := False;
         pGraphPeriod.Visible := True;
         rb1YearGraphPeriod.Visible := True;
         rb2YearGraphPeriod.Visible := True;
         rb1YearGraphPeriod.Checked := True;

         dbWeighingGraph.BottomAxis.Minimum := 1;
         dbWeighingGraph.BottomAxis.Maximum := 365;
         dbWeighingGraph.BottomAxis.Increment := 91;
      end;
end;

procedure TfSetUpAnimals.rb1YearGraphPeriodClick(Sender: TObject);
begin
   dbWeighingGraph.UndoZoom;
   rb2YearGraphPeriod.Checked := False;

   dbWeighingGraph.BottomAxis.Maximum := 365;
   dbWeighingGraph.BottomAxis.Minimum := 1;
   dbWeighingGraph.BottomAxis.Increment := 91;
   dbWeighingGraph.BottomAxis.Title.Caption := 'Age (Days)';
end;

procedure TfSetUpAnimals.rb2YearGraphPeriodClick(Sender: TObject);
begin
   dbWeighingGraph.UndoZoom;
   rb1YearGraphPeriod.Checked := False;

   dbWeighingGraph.BottomAxis.Maximum := 730;
   dbWeighingGraph.BottomAxis.Minimum := 1;
   dbWeighingGraph.BottomAxis.Increment := 182;
   dbWeighingGraph.BottomAxis.Title.Caption := 'Age (Days)';
end;

procedure TfSetUpAnimals.QueryWeighingsCalcFields(DataSet: TDataSet);
var
   EventDetailsArray : TEventDetailsArray;
   NoDays : Integer;
   Weight : Double;
   vDouble , vEventDate : Variant;
   ThisWeighingDate : TDateTime;
   i : Integer;
begin
   QueryWeighingsNoOfDays.Value := Trunc( QueryWeighingsEventDate.AsDateTime - WinData.AnimalFileByIDDateOfBirth.AsDateTime );
   if DataSet.RecNo = 1 then
      begin
         // Get the purchase weight.
         EventDetailsArray := uHerdLookup.HerdLookup.GetEventDetails(QueryWeighingsAnimalID.AsInteger,cPurchaseEvent);
         if Length(EventDetailsArray) > 0 then
            begin
               vEventDate := EventDetailsArray[0].Event[3];
               if not VarIsNull(vEventDate) then
                  begin
                     vDouble := EventDetailsArray[0].SubEvent[3];
                     if not VarIsNull(vDouble) then
                        begin
                           NoDays := Trunc(QueryWeighingsEventDate.AsDateTime - vEventDate);
                           Weight := (QueryWeighingsWeight.AsFloat - vDouble);
                           if (NoDays > 0) then
                              begin
                                 QueryWeighingsDLWG.AsFloat := (Weight / NoDays);
                              end;
                        end;
                  end;
            end;
      end
   else
      begin // compare againt last weight

         EventDetailsArray := uHerdLookup.HerdLookup.GetEventDetails(QueryWeighingsAnimalID.AsInteger,CWeightEvent);
         // Returns all weighing events in ASC date order

         for i := Low(EventDetailsArray)+1 to High(EventDetailsArray) do
            begin
               if EventDetailsArray[i].Event[0] = QueryWeighingsID.AsInteger then
                  begin
                     vEventDate := EventDetailsArray[i-1].Event[3];
                     if not VarIsNull(vEventDate) then
                        begin
                           vDouble := EventDetailsArray[i-1].SubEvent[1];
                           if not VarIsNull(vDouble) then
                              begin
                                 NoDays := Trunc(QueryWeighingsEventDate.AsDateTime - vEventDate);
                                 Weight := (QueryWeighingsWeight.AsFloat - vDouble);
                                 if (NoDays > 0) then
                                    begin
                                       QueryWeighingsDLWG.AsFloat := (Weight / NoDays);
                                    end;
                              end;
                        end
                  end;

            end;
      end;
end;

procedure TfSetUpAnimals.SetMilkDiskGridDisplayColumns;
var
   i : Integer;
begin
   //   25/11/20 [V5.9 R7.6] /MK Change - Default to Cummulative Yield.
   if ( (not(rbShow305Yield.Checked)) and (not(rbShowCumYield.Checked)) ) then
      rbShowCumYield.Checked := True;

   if rbShowCumYield.Checked then
      begin
         for i := 7 to 12 do
            dbgMilk.Columns[i].Visible := True;
         for i := 1 to 6 do
            dbgMilk.Columns[i].Visible := False;
      end
   else
      begin
         for i := 1 to 6 do
            dbgMilk.Columns[i].Visible := True;
         for i := 7 to 12 do
            dbgMilk.Columns[i].Visible := False;
      end;
end;

procedure TfSetUpAnimals.rbShow305YieldClick(Sender: TObject);
begin
   rbShow305Yield.Checked := True;
   rbShowCumYield.Checked := False;
   SetMilkDiskGridDisplayColumns;
   SetGridFooters(dbgMilk, 0);
end;

procedure TfSetUpAnimals.rbShowCumYieldClick(Sender: TObject);
begin
   rbShowCumYield.Checked := True;
   rbShow305Yield.Checked := False;
   SetMilkDiskGridDisplayColumns;
   SetGridFooters(dbgMilk, 0);
end;

procedure TfSetUpAnimals.SetMandatoryControlColours;
begin
   if WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID then
      begin
         AnimalNo.Color := clTeal;
         AnimalNo.Font.Color := clWhite;

         NatIDNo.Color := clWindow;
         NatIDNo.Font.Color := clBlack;

         DOB.Color := clWindow;
         DOB.Font.Color := clBlack;

         ScanInCode.Color := clWindow;
         ScanInCode.Font.Color := clBlack;

         SetColorMandatory;
      end
   else
      begin

         AnimalNo.Color := clWindow;
         AnimalNo.Font.Color := clBlack;


         NatIDNo.Color := clTeal;
         NatIDNo.Font.Color := clWhite;

         DOB.Color := clTeal;
         DOB.Font.Color := clWhite;

         ScanInCode.Color := clTeal;
         ScanInCode.Font.Color := clWhite;
      end;
end;

procedure TfSetUpAnimals.SetActiveControl;
begin
   if WinData.UseScanner then
      begin
         if NatIDNo.CanFocus then
            NatIDNo.SetFocus
         else
            AnimalNo.SetFocus; // SP 21/10/2002
      end
   else
      AnimalNo.SetFocus; // SP 23/02/2007
end;

procedure TfSetUpAnimals.NatIDNoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if ( WinData.AnimalFileByID.State = dsInsert ) then
      case WinData.DefaultNatIdMaskIndex of
         MT_NEWEIDTAG,
         MT_NEWPLASTIC : case Length(StripAllSpaces(NatIDNo.Text)) of
                            2  : NatIDNo.SelStart := 3;
                            3  : NatIDNo.SelStart := 4;
                            9  : NatIDNo.SelStart := 12;
                            10 : NatIDNo.SelStart := 13;
                         end;
         MT_OLDPLASTIC : case Length(StripAllSpaces(NatIDNo.Text)) of
                            2 : NatIDNo.SelStart := 3;
                            6 : NatIDNo.SelStart := 8;
                         end;
         MT_BRASSTAG   : NatIDNo.SelStart := 1;
         MT_UKTAG      : NatIDNo.SelStart := 10;
      end;
end;

procedure TfSetUpAnimals.FormDeactivate(Sender: TObject);
begin
   MenuForm.sbExit.Enabled := True;
   Label1.Caption := 'Animal No / Name';
   lUKAISireCode.Visible := True;
   UKAISireCode.Visible := True;
end;

procedure TfSetUpAnimals.FormCreate(Sender: TObject);
//var
  //AView: TKCGridDBBandedTableView;
begin
   ImmediateCloseAfterSave := False;
   WinData.NewImages16x16.GetBitmap(6,sbGoToSire.Glyph);
   WinData.NewImages16x16.GetBitmap(6,sbGoToDam.Glyph);
   WinData.NewImages16x16.GetBitmap(6,sbGoToGenDam.Glyph);

   dbSireLookup.Properties.ListSource := WinData.QSire;
   dbSireLookup.Properties.KeyFieldNames := 'ID';
   dbSireLookup.Properties.ListFieldNames := 'AnimalNo;NatIDNum;Name;HerdBookNo';

   SireIDEh.Visible := False;

   FeedEventGridDBTableView.DataController.DataSource := WinData.dsFeedEvents;

   sbDelete.Enabled := False;
   sbDelete.Width := 0;
   sbDelete.Caption := '';
   sbDelete.Glyph := nil;

   ToolButton3.Visible := False;
   ToolButton3.Style := tbsSeparator;
   ToolButton3.Width := 0;
end;

Function GetChartJPEG(AChart:TCustomChart; Params:TJPEGDefaults):TJPEGImage;
var tmpBitmap:TBitmap;
begin
  result:=TJPEGImage.Create;   { <-- create a TJPEGImage }
  tmpBitmap:=TBitmap.Create;   { <-- create a temporary TBitmap }
  try
    tmpBitmap.Width :=AChart.Width;   { <-- set the bitmap dimensions }
    tmpBitmap.Height:=AChart.Height;
    { draw the Chart on the temporary Bitmap... }

    AChart.Draw(tmpBitmap.Canvas,Rect(0,0,tmpBitmap.Width,tmpBitmap.Height));
    { set the desired JPEG options... }
    With result do
    begin
      GrayScale            :=Params.GrayScale;
      ProgressiveEncoding  :=Params.ProgressiveEncoding;
      CompressionQuality   :=Params.CompressionQuality;
      PixelFormat          :=Params.PixelFormat;
      ProgressiveDisplay   :=Params.ProgressiveDisplay;
      Performance          :=Params.Performance;
      Scale                :=Params.Scale;
      Smoothing            :=Params.Smoothing;
      { Copy the temporary Bitmap onto the JPEG image... }
      Assign(tmpBitmap);
    end;
  finally
    tmpBitmap.Free;  { <-- free the temporary Bitmap }
  end;
end;

procedure TfSetUpAnimals.ToScreen1Click(Sender: TObject);
begin
   if rbGraphView.Checked then
      begin
         ChartPreview(nil, dbWeighingGraph);
      end
   else
      begin
         if Length(dxComponentPrinter1.PrintTitle) = 0 then
            dxComponentPrinter1.PrintTitle := 'Kingswood Grid Print';
         PrinterLinkGridWeighingBarChart.Preview;
      end;
end;

procedure TfSetUpAnimals.ToFile1Click(Sender: TObject);
var
   ABitmap: TBitmap;
   JPEGImage : TJPEGImage;
begin
   if rbGraphView.Checked then
      begin
         With Params do
            begin
              GrayScale:= False;
              ProgressiveEncoding:= True;
              CompressionQuality:= 100;
              PixelFormat:=jf24bit ;
              ProgressiveDisplay:=True;

              Performance:=jpBestQuality;
              Scale:=jsFullSize;
              Smoothing:=False;
            end;

         { Create the JPEG with the Chart image }
         JPEGImage := GetChartJPEG(dbWeighingGraph,Params);
         try
            JpegSaveDialog.FileName := '';
            if JpegSaveDialog.Execute then
               JPEGImage.SaveToFile(JpegSaveDialog.FileName);
         finally
            FreeAndNil(JPEGImage);
         end;

      end
   else
      begin
         JPEGImage := TJPEGImage.Create;
         try
            ABitmap := GridWeighingBarChartDBChartView.CreateImage(TBitmap) as TBitmap;
            JPEGImage.Grayscale:= False;
            JPEGImage.ProgressiveEncoding:= True;
            JPEGImage.CompressionQuality:= 100;
            JPEGImage.PixelFormat:=jf24bit ;
            JPEGImage.ProgressiveDisplay:=True;

            JPEGImage.Performance:=jpBestQuality;
            JPEGImage.Scale:=jsFullSize;
            JPEGImage.Smoothing:=False;
            JPEGImage.Assign(ABitmap);
            JpegSaveDialog.FileName := '';
            if JpegSaveDialog.Execute then
               JPEGImage.SaveToFile(JpegSaveDialog.FileName);
         finally
            FreeAndNil(ABitmap);
            FreeAndNil(JPEGImage);
         end;
      end;
end;

procedure TfSetUpAnimals.sbGoToGenDamClick(Sender: TObject);
var
   AnimalID : Variant;
begin
   if Sender is TRxSpeedButton then
   case (Sender as TRxSpeedButton).Tag of
      //1 : AnimalID := SireIDEh.Value;
      1 : AnimalID := dbSireLookup.EditValue;
      //2 : AnimalID := DamIDEh.Value;
      2 : AnimalID := dbDamLookup.EditValue;
      //3 : AnimalID := GDamIDEh.Value;
      3 : AnimalID := dbETDamLookup.EditValue;
   end;

   if not VarIsNull(AnimalID) then
      begin
         if not WinData.FilteredAnimals.Locate('AID', AnimalID, []) then
            MessageDlg('Animal not found in current grid filter.',mtError,[mbOK],0)
         else if WinData.AnimalFileByID.Locate('ID', AnimalID, []) then
            AnimalType
         else
            MessageDlg('Animal not found',mtError,[mbOK],0);
      end
   else
      case (Sender as TRxSpeedButton).Tag of
         1 : MessageDlg('This animal has no Sire selected.',mtInformation,[mbOK],0);
         2 : MessageDlg('This animal has no Dam (Recipient) selected.',mtInformation,[mbOK],0);
         3 : MessageDlg('This animal has no ET Dam (Donor) selected.',mtInformation,[mbOK],0);
      end;

end;

procedure TfSetUpAnimals.DoCattleMarginCalcs;
var
   FeedCosts, HealthCosts, FarmCosts : Double;
   StartDate, EndDate : TDateTime;
   NoOfDays : Integer;
begin
   HealthCosts := 0;
   FeedCosts := 0;

   //QueryFeedCosts.Active := True;
   // Calc Feed Costs
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select AllocDate, EndDate, CostDay From FeedEvents Where AnimalID =:ID');
         DataSource := WinData.AnimalSourceByID;
         Open;
         try
            First;
            while ( NOT EOF ) do
               begin             
                  If FieldByName('EndDate').AsDateTime = 0 then
                     FeedCosts := FeedCosts + (FieldByName('CostDay').AsFloat *
                                  (Date()- FieldByName('AllocDate').AsDateTime))
                  else
                     begin
                        FeedCosts := FeedCosts + (FieldByName('CostDay').AsFloat *
                                                 (FieldByName('EndDate').AsDateTime -
                                                  FieldByName('AllocDate').AsDateTime));
                     end;
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
   CMFeedCosts.Value := FeedCosts;

   //QueryHealthCosts.Active := True;
   //Calc Health Costs
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select H.DrugUsed, H.RateApplic From Health H, Events E');
         SQL.Add('Where (H.EventID = E.ID) And (E.AnimalID = :ID)');
         SQL.Add('And (E.EventType IN (4,6))');
         DataSource := WinData.AnimalSourceByID;
         Open;
         try
            First;
            while not ( EOF ) do
            begin
               HealthCosts := HealthCosts + WinData.CalcDrugCost( FieldByName('DrugUsed').AsInteger,
                                            FieldByName('RateApplic').AsFloat );
               Next;
            end;
         finally
            Close;
         end;
      finally
         Free;
      end;
   CMHealthCosts.Value := HealthCosts;


   //QueryPurchaseCosts.Active := True;
   //Purchase Costs
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select E.EventDate, P.Price, P.BuyerCosts, P.SupplierCosts');
//         SQL.Add('Select E.EventDate, P.Price, P.BuyerCosts, P.SupplierCosts, Haulage, Commission');
         SQL.Add('From Events E');
         SQL.Add('Left Join Purchases P ON (P.EventID = E.ID)');
         SQL.Add('Where E.AnimalID = :ID');
         SQL.Add('And E.EventType = 12');
         DataSource := WinData.AnimalSourceByID;
         Open;
         try
            First;
            if (Fields[0].AsDateTime > 0) then
               begin
                  CMPurchDate.Text := FormatDate(Fields[0].AsDateTime, dsIrish);
                  CMPurchPrice.Value := Fields[1].AsFloat;
//                  CMPurchCosts.Value := Fields[2].AsFloat+Fields[3].AsFloat+Fields[4].AsFloat+Fields[5].AsFloat;
                  CMPurchCosts.Value := Fields[2].AsFloat+Fields[3].AsFloat;
                  CMPurchTotal.Value := CMPurchPrice.Value + CMPurchCosts.Value;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;

   //   QuerySalesCosts.Active := True;
   // Sales Costs

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select E.EventDate, S.Price, S.CustomerCosts, S.TotalDeductions');
         SQL.Add('From Events E');
         SQL.Add('Left Join SalesDeaths S ON (S.EventID=E.ID)');
         SQL.Add('Where E.AnimalID=:ID');
         SQL.Add('And E.EventType = 11');
         DataSource := WinData.AnimalSourceByID;
         Open;
         try
            First;
            if (Fields[0].AsDateTime > 0) then
               begin
                  CMSalesDate.Text := FormatDate(Fields[0].AsDateTime, dsIrish);
                  CMSalesPrice.Value := Fields[1].AsFloat;
                  CMSalesCosts.Value := Fields[2].AsFloat + Fields[3].AsFloat;
                  CMSalesTotal.Value := CMSalesPrice.Value-CMSalesCosts.Value;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;

   // Fixed Costs
   if CMPurchDate.Text <> '' then
      StartDate := StrToDate(CMPurchDate.Text)
   else
      StartDate := WinData.AnimalFileByIDDateOfBirth.AsDateTime;

   if CMSalesDate.Text <> '' then
      EndDate := StrToDate(CMSalesDate.Text)
   else
      EndDate := Date;

   if uHerdLookup.HerdLookup.HerdOwnerData.HerdID <> WinData.AnimalFileByIDHerdID.AsInteger then
      uHerdLookup.HerdLookup.HerdOwnerData.HerdID := WinData.AnimalFileByIDHerdID.AsInteger;

   // Fixed Costs
   NoOfDays := Trunc(EndDate-StartDate);
   CMFixedCosts.Value := (NoOfDays*uHerdLookup.HerdLookup.HerdOwnerData.FixedCostsPerDay);

   // Total Farm Costs
   CMFarmTotal.Value := CMFixedCosts.Value+CMHealthCosts.Value+CMFeedCosts.Value;

   // Cattle Margins
   CMSalesCost.Value := CMSalesTotal.Value;
   CMPurchCost.Value := CMPurchTotal.Value;
   CMFarmCost.Value := CMFarmTotal.Value;
   CMMargin.Value := (CMSalesCost.Value - (CMPurchCost.Value+CMFarmCost.Value));
   if CMMargin.Value < 0 then
      CMMargin.Color := $003E3EFF
   else if CMMargin.Value > 0 then
      CMMargin.Color := $0000D500
   else
      CMMargin.Color := clWindow;
end;

procedure TfSetUpAnimals.mdWeighingChartDataWeightGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   text := text +'.kgs';
end;

procedure TfSetUpAnimals.dbWeighingGraphAfterDraw(Sender: TObject);
var
   DLWGText : string;
begin
   if mdWeighingChartData.Active then
   with mdWeighingChartData do
     begin
        First;
        Next;
        while not eof do
           begin
              with dbWeighingGraph do
                 begin
                    Canvas.Font.Name := 'Tahoma';
                    Canvas.Font.Size := 7;
                    Canvas.Font.Color := clBlue;
                    DLWGText := 'DLWG:'+ FloatToStrF(mdWeighingChartDataDLWG.AsFloat, ffFixed, 8,2);
                    Canvas.TextOut(BottomAxis.CalcXPosValue(mdWeighingChartDataNoOfDays.AsInteger),LeftAxis.CalcYPosValue(mdWeighingChartDataWeight.AsFloat),DLWGText);
                 end;
              Next;
           end;
     end;
end;

procedure TfSetUpAnimals.rbWeighGraphViewByDaysClick(Sender: TObject);
begin
   dbWeighingGraph.UndoZoom;
   rbWeighingGraphVarDays.Checked := False;
   WeighingGraphTrackBar.Enabled := False;
   lWeighingGraphVarDays.Enabled := False;
   dbWeighingGraph.UndoZoom;

   if mdWeighingChartData.Active then
      begin
         mdWeighingChartData.Last;
         dbWeighingGraph.BottomAxis.Maximum := mdWeighingChartDataNoOfDays.AsInteger;

         mdWeighingChartData.First;
         dbWeighingGraph.BottomAxis.Minimum := mdWeighingChartDataNoOfDays.AsInteger;
      end;

   dbWeighingGraph.BottomAxis.Increment := 7;
   dbWeighingGraph.BottomAxis.Title.Caption := 'Days On Farm';
   dbWeighingGraph.Title.Text.Text := 'Graph of Weighings vs. Days On Farm';
   WinData.GlobalSettings.AnimalWeighingGraphXAxisVariable := False;
   WinData.SavePreferences;
end;

procedure TfSetUpAnimals.WeighingGraphTrackBarChange(Sender: TObject);
begin
   lWeighingGraphVarDays.Caption := IntToStr(WeighingGraphTrackBar.Position) + ' days';
   if rbWeighingGraphVarDays.Checked then
      dbWeighingGraph.BottomAxis.Maximum := WeighingGraphTrackBar.Position;
end;

procedure TfSetUpAnimals.rbWeighingGraphVarDaysClick(Sender: TObject);
begin
   dbWeighingGraph.UndoZoom;
   rbWeighGraphViewByDays.Checked := False;
   WeighingGraphTrackBar.Enabled := True;
   lWeighingGraphVarDays.Enabled := True;

   if mdWeighingChartData.Active then
      begin
         mdWeighingChartData.First;
         WeighingGraphTrackBar.Max := mdWeighingChartDataNoOfDays.AsInteger + 199;
         WeighingGraphTrackBar.Min := mdWeighingChartDataNoOfDays.AsInteger + 49;
      end;
   WeighingGraphTrackBar.Position := WinData.GlobalSettings.AnimalWeighingGraphXAxisValue;
   dbWeighingGraph.BottomAxis.Maximum :=WeighingGraphTrackBar.Position;
   dbWeighingGraph.BottomAxis.Minimum := WeighingGraphTrackBar.Min;
   WinData.GlobalSettings.AnimalWeighingGraphXAxisVariable := True;
   WinData.SavePreferences;
end;

procedure TfSetUpAnimals.SendHUKNotification; // 28/01/2009 V3.9 R5.8 /SP
begin
 {
   if MessageDlg('Do you want to notifiy HUK (Holstein UK) of this new animal?',mtConfirmation,[mbYes,mbNo],0) = idNo then exit;

   if (WinData.AnimalFileByIDHerdID.AsInteger<>WinData.NONEHerdID) and
      (Def.Definition.dUsePedigree ) and
      (WinData.SystemRegisteredCountry=NIreland) then
      begin
         with WinData.MAPIMail do
            begin
               Reset;
               ToRecipient.Text := '';
               Subject := 'HUK Member - Animal Moved-On Notification';
               HerdLookup.HerdOwnerData.HerdID := WinData.AnimalFileByIDHerdID.AsInteger;
               MessageBody.Text := 'Name: ' + HerdLookup.HerdOwnerData.HerdOwnerName + cCRLFx2 +
                                   'Herd Number: ' + HerdLookup.HerdOwnerData.HerdIdentity + cCRLFx2 +
                                   'Herd Prefix: ' + HerdLookup.HerdOwnerData.HerdPrefix + cCRLFx2 + cCRLFx2 +
                                   'Animal Tag: ' + WinData.AnimalFileByIDNatIDNum.AsString + cCRLFx2 +
                                   'Animal Name: ' + WinData.AnimalFileByIDName.AsString + cCRLFx2 +
                                   'Animal Herdbook No: ' + WinData.AnimalFileByIDHerdBookNo.AsString;
               SendMail;
            end;
      end
   else
      MessageDlg('Notification has not been sent. Please check the herd value.',mtError,[mbOK],0);
   }
end;

procedure TfSetUpAnimals.actHUKUpdate(Sender: TObject); // 28/01/2009 [V3.9 R5.8] /SP
begin
//   actHUK.Visible := ( (ShowHUKControls) and (WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) and (WinData.AnimalFileByIDSex.AsString <> cSex_Steer));
   actHUK.Visible := ((ShowHUKControls) and (WinData.AnimalFileByIDSex.AsString <> cSex_Steer));
end;

procedure TfSetUpAnimals.actHUKExecute(Sender: TObject); // 28/01/2009 [V3.9 R5.8] /SP
begin
   ConnectToNet(bConnected);

   if bConnected then
      begin

         if not HUKILoginVerified then
            begin
               if not THUKIRegistrationLogin.CalfRegistrationLogin then
                  begin
                     MessageDlg('HUKI Calf Registration login failed.',mtError,[mbOK],0);
                     Exit;
                  end;
            end;

         if (WinData.AnimalFileByIDSex.AsString = cSex_Female) then
            TfmHUKISireDamListing.ShowAsDamListing(WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByID)
         else if (WinData.AnimalFileByIDSex.AsString = cSex_Bull) then
            TfmHUKISireDamListing.ShowAsSireListing(WinData.AnimalFileByIDID.AsInteger, WinData.AnimalFileByID);
      end
   else
      MessageDlg(cINTERNET_CONNECTION_NOT_ESTABLISHED,mtError,[mbOK],0);
end;
{
procedure TfSetUpAnimals.MilkDiskGridTableViewLactNoCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  procedure DrawCell(ACanvas: TcxCanvas; ARect: TRect; AText: string);
  begin
    ACanvas.FrameRect(ARect, clBtnShadow);
    ACanvas.Brush.Style := bsClear;
    ACanvas.DrawTexT(AText, ARect, DT_RIGHT);
  end;
const
  CELL_COUNT = 2;
var
  ARect: TRect;
  ACellHeight, ATop: Integer;
  I: Integer;

  AItem : TcxGridColumn;
  AItemIndex : Integer;
  ADSItem: TcxDataSummaryItem;
  Value : Variant;
  Records : Integer;
begin

  with TcxGridDBTableView(Sender) do
  begin
    AItem := GetColumnByFieldName('Yield305');
  end;

  ACanvas.Brush.Color := AViewInfo.Params.Color;
  ACanvas.FillRect(AViewInfo.Bounds);

  ARect := AViewInfo.Bounds;
  ACellHeight := (ARect.Bottom - ARect.Top) div CELL_COUNT;

  Records := 0;
  for i := 0 to Sender.DataController.RecordCount-1 do
     begin
        if not VarIsNull(Value) then
           begin
              Value := Value + Sender.DataController.Values[i, MilkDiskGridTableViewYield305.Index];
              Inc(Records);
           end;
     end;

  ARect.Top    := ATop;
  ARect.Bottom := ARect.Top + ACellHeight-1;
  DrawCell(ACanvas, ARect, FloatToStr(Value/Records)+' ');
  ATop := ARect.Bottom;

  ARect.Top := ATop+1;
  ARect.Bottom := ARect.Top + ACellHeight-1;
  DrawCell(ACanvas, ARect, FloatToStr(Value)+' ');
  ATop := ARect.Bottom;

  ADone := True;
end;
}

procedure TfSetUpAnimals.AnimalPagesDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   Font.Style := [fsBold];
   if ( ATab.Index = AnimalPages.ActivePageIndex) then
      begin
         ATab.Color := clWhite;
         Font.Color := clBlack;
      end
   else
      begin
         ATab.Color := 536870912;
         Font.Color := clBlack;
      end;
end;

procedure TfSetUpAnimals.dbSireLookupPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSetUpAnimals.BVDDateChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

//   04/02/14 [V5.2 R7.8] /MK Additional Feature - Before Dam drop-down-list appears check to see whether
//                                                 the dam was calved with this calf and give an error to
//                                                 explain to the user to delete the calving for the dam.
procedure TfSetUpAnimals.dbDamLookupPropertiesInitPopup(Sender: TObject);
begin
   if ( WinData.AnimalFileByID.FieldByName('DamID').AsInteger > 0 ) and ( not(AnimalDateOfBirthChanged) ) then
      if ( WinData.IsCalvesCalvedDam(WinData.AnimalFileByID.FieldByName('DamID').AsInteger,
                                     WinData.AnimalFileByID.FieldByName('ID').AsInteger,
                                     WinData.AnimalFileByID.FieldByName('DateOfBirth').AsDateTime) ) then
         begin
            MessageDlg('This dam was used to calve down this calf.'+cCRLF+
                       'If you wish to change the dam you must delete the calving event'+cCRLF+
                       'for the dam and re-enter the calving event for the correct dam.',mtError,[mbOK],0);
            SysUtils.Abort;
         end;
end;

procedure TfSetUpAnimals.dbETDamLookupPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

function TfSetupAnimals.ShowETDamDonor : Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT LactNo');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID = :DamID');
         Params[0].AsInteger := WinData.AnimalFileByIDDamID.AsInteger;
         try
            Open;
         except
         end;
         Result := WinData.ETCalving(WinData.AnimalFileByIDDamID.AsInteger,Fields[0].AsInteger-1);
      finally
         Free;
      end;
end;

procedure TfSetUpAnimals.dbETDamLookupPropertiesCloseUp(Sender: TObject);
var
   OrigDonorDamID : Integer;
begin
   OrigDonorDamID := WinData.AnimalFileByIDDonorDamID.AsInteger;
   if ( dbETDamLookup.EditValue = WinData.AnimalFileByIDDamID.AsInteger ) then
      begin
         MessageDlg('Donor Dam cannot be the same as the Recipient Dam.',mtError,[mbOK],0);
         dbETDamLookup.EditValue := OrigDonorDamID;
      end;
end;

procedure TfSetUpAnimals.DOBEnter(Sender: TObject);
begin
   //   26/11/14 [V5.4 R0.1] /MK Bug Fix - Default DOB.ReadOnly to False. DOB.ReadOnly = True where the user is editing the animal and
   //                                     the animal was not added to the herd from a cow calving event.
   DOB.ReadOnly := False;
   if ( FAddOrEdit = aeEdit ) then
      if ( DOB.ReadOnly ) then
         MessageDlg('This animal has come from a calving event.'+cCRLF+
                    'If you wish to change the date of birth you must'+cCRLF+
                    'change the date of calving for the cow.',mtError,[mbOK],0);
end;

procedure TfSetupAnimals.ShowHideDeleteButton;
begin
   sbDelete.Enabled := ( (sbPedDetails.Down) and (PageControl1.ActivePageIndex = 1) );
   if ( sbDelete.Enabled ) then
      begin
         sbDelete.Width := 47;
         sbDelete.Caption := 'D&elete';
         WinData.LoadBtnImage(WinData.ImageList16x16,sbDelete.Glyph,1);
      end
   else
      begin
         sbDelete.Width := 0;
         sbDelete.Caption := '';
         sbDelete.Glyph := nil;
      end;

   ToolButton3.Visible := sbDelete.Enabled;
   if ( ToolButton3.Visible ) then
      begin
         ToolButton3.Width := 8;
         ToolButton3.Style := tbsDivider;
      end
   else
      begin
         ToolButton3.Width := 0;
         ToolButton3.Style := tbsSeparator;
      end;
   Update;
end;

procedure TfSetUpAnimals.PageControl1Change(Sender: TObject);
begin
   ShowHideDeleteButton;
end;

procedure TfSetUpAnimals.qHealthCalcFields(DataSet: TDataSet);
begin
   if ( FHerdType = htBeef ) then
      begin
         if ( not(qHealth.FieldByName('MeatN_A_Drug').AsBoolean) ) then
            if ( qHealth.FieldByName('Withdrawal').AsInteger > 0 ) then
               qHealth.FieldByName('MeatWithdrawalDate').AsDateTime := ( qHealth.FieldByName('EventDate').AsDateTime +
                                                                         qHealth.FieldByName('Withdrawal').AsInteger );
         if ( qHealth.FieldByName('MilkWithdrawal').AsInteger > 0 ) then
            qHealth.FieldByName('MilkWithdrawalDate').AsDateTime := ( qHealth.FieldByName('EventDate').AsDateTime +
                                                                      qHealth.FieldByName('MilkWithdrawal').AsInteger );
      end
   else
      begin
         if ( qHealth.FieldByName('Withdrawal').AsInteger > 0 ) then
            qHealth.FieldByName('MeatWithdrawalDate').AsDateTime := ( qHealth.FieldByName('EventDate').AsDateTime +
                                                                      qHealth.FieldByName('Withdrawal').AsInteger );
         if ( not(qHealth.FieldByName('MilkN_A_Drug').AsBoolean) ) then
            if ( qHealth.FieldByName('MilkWithdrawal').AsInteger > 0 ) then
               qHealth.FieldByName('MilkWithdrawalDate').AsDateTime := ( qHealth.FieldByName('EventDate').AsDateTime +
                                                                         qHealth.FieldByName('MilkWithdrawal').AsInteger );
      end;

   //   15/11/17 [V5.7 R4.6] /MK Additional Feature - Added calculated field for individual cost of treatment - Laurence Clerkin.
   qHealth.FieldByName('Cost').AsFloat := WinData.CalcDrugCost(qHealth.FieldByName('DrugUsed').AsInteger,qHealth.FieldByName('RateApplic').AsFloat);
end;

end.


