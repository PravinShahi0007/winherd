{
   ----------------------------------------------------------------------------
   31/01/2003:-

   Due to Calve Project Due to calve date based on the number of days pregnant.

   31/01/2003.
   ----------------------------------------------------------------------------
   SP 23/03/2003:- V3.6 R5.5

   Due to Calve, Option "Restrict calvings to period between"

   Either Bewteen a given period or up until a given date

   SP 23/03/2003:- V3.6 R5.5
   ----------------------------------------------------------------------------
   06/01/2009 [Rel V3.9 R4.8, Dev V3.9 R5.6] /SP Bug Fix - Inclusion of "OR PD = Twins" in Due To Dry Off Report, If the animal is expecting
                                                           twins, if was being ignored by the qDueForDryingOff SQL Text. SQL Text only including
                                                           PD="Yes" or PD="Undefined" qDueForDryingOff.SQL.Add('And ((PD = "Yes") Or (PD = "Twins") Or (PD = "UnDefined")');


   22/01/2009 [Dev V3.9 R5.8] /MK Additional Feature - Option to include Nat Id. No . in the DueToCalve Rpt.
                                                       Change made to TempTable to Change NatID to a ShortNatID to allow for the NatID to appear in the
                                                       Status Field of the DuetoCalve Report. This change will bring in the last 5 digits plus the space
                                                       of an Irish Tag Number and the last 6 digits without spaces of a Northern Irish Tag Number

   03/03/2009 [Dev V3.9 R6.5] /SP Program Change - Do not check if animal is served before checking if animal is pregnant SP/GL

   14/04/2009 [Dev V3.9 R6.7] /MK Additional Feature - Change made to report to allow for both the Due Dry Off Date for the Service and the
                                                       PD to show on the report if the Include Service AND PD Projected Dates tick box is ticked.

   28/09/10 [V4.0 R4.8] /MK Change - Allowed ShortNatIDNum to take account of UK Tags.
                                   - Allowed for Irish Old Brass Tags and Old Plastic Tags.

   30/09/10 [V4.0 R4.9] /MK Change - Changes layout of the DueToCalve screen as per Gerry's instructions.
                                   - Added three new RadioGroups - rgShowAnimalNoOrNatID, rgDueCalveSortBy, rgDueCalveSortOrder - in DueToCalve.
                                   - Pick up DueCalvingDefaults for new RadioGroups.
                                   - If SortNatID then Include NatID.
                                   - If SortAnimalNo then Include AnimalNo.

   24/11/10 [V4.0 R5.8] /MK Bug Fix - BuildDueToPD - Removed If Clause For If ProjCalving > 0.

   12/02/11 [V4.0 R8.2] /MK Modification - AllReportTypes - Added Check For WinData.FilteredAnimals.Count.

   25/03/11 [V4.0 R8.9] /MK Modification - Changed Caption of cbIncCowsNot To Indicate Cows No Service/With Service.

   03/06/11 [V4.1 R1.8] /MK Additional Feature - BuildDueCalving - If Service After PD Then PDStatus = Undefined And Animal Appears With Include PD Ticked.

   07/06/11 [V4.1 R1.8] /MK Additional Feature - BuildDueToPD - If CullingEvent Found And PDStatus = No Then PDStatus = No/Cull

   13/06/11 [V4.1 R1.8] /MK Bug Fix - Moved WHERE Clause Of LactNo Before cbIncludeNotServed To Make It Work

   14/07/11 [V4.1 R2.3] /MK Bug Fix - Added New Logic So Regardless Of Cows/Heifers DueToPD SQL Where Clause Exists.

   19/10/11 [V5.0 R1.5] /MK Additional Feature - Added the ShowCalfType Radio Group To pDueToCalve Panel.
                                               - Added New PredCalfType Field To DueToCalve Table.
                                               - Show Either Last Calf Or Predicted Calf On Due To Calve Report.

   20/10/11 [V5.0 R1.5] /MK Additional Feature - BuildDueToCalve - If Calf Sex Is Steer or Bull Change LastCalfType To M.

   09/01/12 [V5.0 R3.2] /MK&SP Bug Fix - If PD Not Pregnant And Service Event Found Then Include Animal If ServiceAfterPD or cbIncludeNOTPregnant.Checked
                                         Else If PD Not Pregnant And No Service Event Found Then Include Animal If cbIncludeNOTPregnant.Checked.

   18/01/12 [V5.0 R3.5] /MK Change - pDueToCalve - Changed Caption Of rgShowCalfSex To Show Sex.
                                   - BuildDueToCalve - New Variable To Be Able To Change ICBF Event Description.
                                   - sbViewClick - Pred. Calf Change To Pred. Sex.

   ----------------------------------------------------------------------------
       **** Start BuildDueToPD Notes ****

       1). If Include (Cows) On Its Own Then Include Animals With
           LactNo > 0 And (DuePDDate Calculated By Last Service Date In This Lactation).
       2). If Include (Heifers) On Its Own Then Include Animals With
           LactNo = 0 And (DuePDDate Calculated By Last Service Date In This Lactation).
       3). If Include Both (Cows & Heifers) Then Include Animals With
           LactNo >= 0 And (DuePDDate Calculated By Last Service Date In This Lactation).
       4). If Include (Cows/Heifers/Both) And (Include Diagnosed NOT Pregnant) Then Include Animals With
           LactNo >= 0 And Add (Include Animals Diagnosed NOT Pregnant = True)
       5). If Include (Cows/Heifers/Both) And (Include Not Served) Then Include Animals With
           LactNo >= 0 And Add (Animals That Have Not Been Served)
       6). If Include (Cows/Heifers/Both) And Both (Include Not Served) And (Include Diagnosed NOT Pregnant) Then Include Animals With
           LactNo >= 0 And (Who Have & Have Not Been Served Or IncludeDiagnosedNotPregnant Is True).

       **** End BuildDueToPD Notes ****
   ----------------------------------------------------------------------------

   16/02/12 [V5.0 R3.8] /MK Change - BuildDueToPD - New Logic Applied in qReportPD After TempTable Created.

   16/02/12 [V5.0 R3.8] /MK Change - pDueToPD - Changed Caption of cbIncludeAnimalsDiagnosedNotPregnant Back To Diagnosed Not Pregnant.

   19/02/12 [V5.0 R3.8] /MK Change - BuildDueToPD - Default IsPreg To "No" For Each Animal Before Check Starts.

   20/02/12 [V5.0 R3.8] /MK Change - BuildDueToPD - More Changes To SQL Logic To Fix Problems That GL Uncovered.

   21/02/12 [V5.0 R3.9] /MK Bug Fix - BuildDueToPD - Program Was Only Showing Animals With Services If Not(cbIncludenotServed.Checked).

   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Option Added.

   06/06/12 [V5.0 R7.0] /MK Additional Feature - Default ReportType To Full Report And Let The User Select RecordingSheet.
                                               - Hide Text In Report If ReportType Is RecordingSheet.

   11/06/12 [V5.0 R7.0] /MK Additional Feature - DueToPD - Added Option For Recording Sheet.
                                                         - Made Changes To Look Of Panel For Easier Understanding For Customers.
                                               - DueToDryOff - Made Changes To Look Of Panel For Easier Understanding For Customers.
                                                             - Added SortBy And SortOrder Group Boxes.

   11/06/12 [V5.0 R7.1] /MK Additional Feature - DueToCalve - Added Option For Recording Sheet.
                                                            - Made Changes To Look Of Panel For Easier Understanding For Customers.

   12/06/12 [V5.0 R7.1] /MK Additional Feature - DueToPD - Added Option For Recording Sheet.
                                                         - Made Changes To Look Of Panel For Easier Understanding For Customers.

   12/06/12 [V5.0 R7.1] /MK Change - DueToService - Changed Heading Of gbInclude To Just Include:.
                                                  - Added Heading To gbfilter For Cows/Heifers For Better Understanding For Customers.

   13/06/12 [V5.0 R7.1] /MK Change - DueToService - Changed Layout Of Report To Match New Layout Of The Other Due To Reports.
                                                  - Added cxGroupBoxes And cxRadioGroups.

   24/07/12 [V5.0 R8.0] /MK Bug Fix - BuildDueToCalve - Gestation days not calculated if PD found and DueToCalve date calculated from PD Date.

   03/08/12 [V5.0 R9.7] /MK Additional Feature - Added Cart button to the top of the screen to allow the user to cart animals that are on the report.
                                               - PdScr - Add animals in detail band to cart.
                                               - Cart disabled on FormCreate, enabled after view/print of report.

   24/09/12 [V5.0 R9.9] /MK Bug Fix - Access Violation on print after preview.
                                    - If print on preview program was trying to add to array even though array already set.

   06/11/12 [V5.1 R0.8] /MK Bug Fix - DueToPD - DueToPDDate was showing null date of 30/12/1899.
                                              - Animal should not show if LastCalvingDate is today.

   08/01/13 [V5.1 R3.7] /MK Additional Feature - BuildDueFirstService - Add count to report if no animal numbers or no breeding history.

   17/01/13 [V5.1 R3.8] /MK Change - ServiceDue - If 0 lact animal don't restrict by animals less than a year old.
                                   - BuildDueFirstService - First query to add animals to TempTable don't restrict by animals less than a year old.

   21/01/13 [V5.1 R3.8] /MK Change - Rules updated to allow for if Milk, Meat or Other withdrawal dates are all after StartDate - which date gets priority.

   28/03/13 [V5.1 R5.4] /MK Change - PdScr - LastBullColumn overwriting ServiceType - Change qrlLastBull not AutoSize adjusted width.

   06/06/13 [V5.1 R7.3] /MK Bug Fix - BuildDueToPD - If PregDiag already exists then don't include animal if not service event exists.

   18/07/13 [V5.1 R8.6] /MK Change - bCartAnimals - Runs code before report is view or printed, adds animals from report queries to FAnimalCartArray
                                                    and then shows a message to let the customer know to exit back to Main Grid to view the animals
                                                    that are in the cart.

   05/12/13 [V5.2 R6.7] /MK Additional Feature - Added cbIncludeCullCows to DueService report. Requested by John Buckley and Declan O'Meara at Mullingar meeting.
                                               - Check if cow/heifer has ToBeCulled event in current lactation.
                                                 If cbIncludeCullCows.Checked then include the cow/heifer if not already included.
                                                 If cbIncludeCullCows.NotChecked then exclude the cow/heifer if already included.
                                                 **GL said to leave the caption of the cbIncludeCullCows as Include Cull Cows even though it includes heifers.**

   28/01/14 [V5.2 R7.8] /MK Change - BuildDueToCalve - Changed Calving Index to Calving Interval - GL Request.

   27/06/14 [V5.3 R2.9] /MK Change - Changed all instances of WinData.CheckEvents to BreedingDataHelper.TempTables.

   30/06/14 [V5.3 R3.0] /MK Change - pDueToPD - Changed caption of lDaysAfterCalving as requested by GL.
                            Bug Fix - BuildDueToPD - Default PregDiagExists to False for each animal before looking for PD Events.

   01/07/14 [V5.3 R3.0] /MK Additional Feature - BuildDueToPD - Added check for if cow was marked for recheck in the PregDiag event.

   17/10/14 [V5.3 R7.6] /MK Bug Fix - Code left over when testing the fix to uBreedingDataHelper. WinData.CheckEvents still remained in BuildDueToCalve.

   25/11/14 [V5.4 R0.0] /MK Change - FormShow - Free WinData.FBreedingDataHelper on FormShow as on some systems
                                                BreedingDataHelper.TempCalving was still in use - Requested by Roger Barclay.

   21/01/15 [V5.4 R0.9] /MK Bug Fix - bCartAnimalsClick - Free and Nil here as well after report is viewed.

   11/08/15 [V5.4 R7.2] /MK Additional Feature - BuildDueToCalve - Add check for Post Service Heat - Gl/Gilbert Clancy request.

   27/10/15 [V5.4 R9.7] /MK Change - BuildDueToCalve - Withdrawal Information - New rule change from GL, only show milk withdrawal date if any.

   17/11/15 [V5.5 R0.8] /MK Change - pDueToCalve - Changed name of cbIncludeHeatAfterService to cbIncludeHeatOrPDAfterService.
                                                 - Changed caption to Include Cows With Post Service / Post PD Heat as tick box checks for both.

   18/11/15 [V5.5 R0.8] /MK Additional Feature - pDueForDryingOff - Added cbIncludeHeatsAfterServiceOrPD check box, stored in ReportDefaults, default to True - GL/Trevor Kellett.
                                               - BuildDueToDry- If cbIncludeHeatsAfterServiceOrPD.Checked then check to see if animal has had a post pd or service heat.

   19/11/15 [V5.5 R0.8] /MK Change - pDueForDryingOff - change caption of Cows Diagnosed Not Pregnant to Cows Not Pregnant as this tick box on this report
                                                        includes animals that have a status of Not Pregnant and not strictly animals that were diagnosed not pregnant by a PD - GL/SP.
                                                      - gbDryOffReporTypes - Changed caption to Display Options - GL request.
                                                      - gbDryOffReportOptions - Changed caption to Include and removed the Include from the components with this GroupBox.
                                                      - Moved cbIncludeServAndPD into the Display Options as it a display option not an include option - GL.
                                                      - If Cows Not Pregnant is ticked then tick Cows With Post-Service/PD Heat and disable this option - GL.
                                   - pDueToCalve - gbCalveReportTypes - Changed caption to Display Options - GL request.
                                                 - gbCalveFilterOptions - Changed caption to Include and removed the Include from the components with this GroupBox.
                                                 - Moved rgShowAnimalNoOrNatID and rgShowCalfSex into the Display Options box as its a display not an include option.
                                   - pDueToCalve & pDueForDryingOff - Changed caption of cows with post service and post pd heat to cows with Post-Service/PD Heat - GL.

   17/05/17 [V5.6 R8.1] /MK Bug Fix - BuildDueFirstService - If the animal has had a heat and bull was specified then this should not be the last bull on the report
                                                             as farmers don't record bulls in a heat event - GL request.

   18/05/17 [V5.6 R8.1] /MK Change - BuildDueFirstService - Added new field for Days Since Last Heat based on today minue last heat date - GL/Declan O'Meara request.

   03/10/17 [V5.7 R3.5] /MK Change - Don't change caption of favourites button just tick it and change the colour to blue like Apply Filter check box - SP request.

   21/03/18 [V5.7 R8.4] /MK Change - LoadScreenDefaults/SaveScreenDefaults - DuePregDiagDefaults - Load/Store Not Served.
                                                                                                 - Load/Store more than days calved value.

   26/08/19 [V5.9 R0.1] /MK Bug Fix - Headings and dbText boxes were not hidden correctly when printing DuePD recording sheet - Ivan Whiteside.

   16/10/19 [V5.9 R0.9] /MK Change - BuildDueToDryOff - DaysInMilk should not be Date - LastCalvDate+1 - SP/GL - same as main grid.

   08/11/19 [V5.9 R1.2] /MK Additional Feature - Added High SCC and ICBF Mastitis Incidents to the Due To Dry Report.

   03/12/19 [V5.9 R1.4] /MK Additional Feature - Added "Days Calved" to DueToPD report - Mark Allen request.
                                               - Added DaysCalved field to DueToPD table.
                                               - Had to move some columns to get the new field to appear.
                                               - When printing "PD" field, if "Undefined" then show blank like DueToDry report.

   30/06/20 [V5.9 R4.9] /MK Bug Fix - BuildDueToDryOff - qInHerdDailyMilkDiskTransInfo - Clear the filter of the query before checking record count
                                                                                         as if the filter is applied the record count takes the filtered record count.

   30/10/20 [V5.9 R7.0] /MK Change - BuildDueToCalve - Changed SQL after speaking with Shane to include Milk information and to use joins instead of From Animals A, Events E.
                                                     - Take YieldToDate from new fields in the query.
                                                     - Abreviate the Service Type as requested by GL.
                                                     - Make change to LastBirth so that we don't show 1=, 2=, 3=, 4= as request by GL.
                                                     - No need for this Locate on MilkDisk as the initial query is getting this info.
                                                     - Default Status to Milk Status - GL request.

   13/11/20 [V5.9 R7.3] /MK Bug Fix - BuildDueToCalve - Use Left Join instead of Inner Join as Inner Join only brings due to calve animals in milk disk table.

   23/11/20 [V5.9 R7.5] /MK Additional Feature - Added the cmboServiceType combo box.
                                               - FormCreate - Add all service types to the new cmboServiceType combo box as well as an option to select All.
                                               - BuildDueToCalve - Filter out animals due to calve by service type.

   30/08/21 [V6.0 R2.1] /MK Additional Feature - BuildDueToCalve - If IncludeAnimal then add DueToCalveDate and ExpectedBullCode(if any) data to CowExt table for main grid.
                                                                 - Update WinData.DueCalvingUpdated variable once DueToCalve data has been added to CowExt table.
                                               - FormActivate - If WinData.ShowMainGridGridDueToCalvCalcMsg then show message to explain to the user to run this report for the grid data.

   06/09/21 [V6.0 R2.1] /MK Change - FormActivate - Changed Expected to Projected - GL request.

   09/09/21 [V6.0 R2.3] /MK Bug Fix - BuildDueToCalve - If the LastBirth is something else then set field column in report to this - TGM reported.

   17/09/21 [V6.0 R2.4] /MK Change - Added Application.ProcessMessages and Update after pbCount.Position change - Scott (Fletchers).   
}

unit ActionReminderFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, ToolEdit, RXSpin, RXLookup,
  quickrpt, Db, DBTables, Qrctrls, RXCtrls, ToolWin, Menus, QRExport,
  GenTypesConst, ReportDefaults, KDBRoutines, cxControls, cxContainer,
  cxEdit, cxGroupBox, cxRadioGroup, cxCheckBox, uAnimalCart,
  uBreedingDataHelper, KRoutines, uApplicationLog, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLabel;

type
  //   06/06/12 [V5.0 R7.0] /MK Additional Feature - New Type For ReportType.
  TReportType = (rtFullReport, rtRecordingReport);
  TReportMode = (rmProAction, rmPDAExport, rmNormal);
  TActionReminderFilter = class(TForm)
    pDueToCalve: TPanel;
    pDueForDryingOff: TPanel;
    pDueFirstService: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DryingDate: TDateEdit;
    CalveDateFrom: TDateEdit;
    DaysforDryingOff: TRxSpinEdit;
    pbCount: TProgressBar;
    PdScr: TQuickRep;
    qReportPD: TQuery;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    DateLabel: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    PremRepFirstPrem: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel34: TQRLabel;
    VerLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    pDueToPD: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    CheckBox4: TCheckBox;
    PDDate: TDateEdit;
    PDSince: TRxSpinEdit;
    RadioGroup1: TRadioGroup;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    rgOrder: TRadioGroup;
    rgSort: TRadioGroup;
    ToolBar1: TToolBar;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    cbDefaultHerd: TRxDBLookupCombo;
    ToolButton2: TToolButton;
    Bevel1: TBevel;
    Bevel4: TBevel;
    sbPrint: TRxSpeedButton;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    lCalveDateTo: TLabel;
    CalveDateTo: TDateEdit;
    cbPeriodBetween: TCheckBox;
    lCalveDateFrom: TLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    rgDueCalveSortBy: TcxRadioGroup;
    rgDueCalveSortOrder: TcxRadioGroup;
    cbFilter: TcxCheckBox;
    cbFavourite: TcxCheckBox;
    gbPDFilterOptions: TcxGroupBox;
    lDaysAfterCalving: TLabel;
    cbIncCows: TCheckBox;
    cbIncludeAnimalsDiagnosedNotPregnant: TCheckBox;
    cbIncHeifers: TCheckBox;
    cbIncludenotServed: TCheckBox;
    seDaysAfterCalving: TRxSpinEdit;
    gbPDReportType: TcxGroupBox;
    rgPDReportType: TcxRadioGroup;
    cbPDDoubleSpacing: TcxCheckBox;
    rgDryOffSortOrder: TcxRadioGroup;
    rgDryOffSortBy: TcxRadioGroup;
    gbDryOffReportOptions: TcxGroupBox;
    cbIncludeNotPreg: TCheckBox;
    FirstLactCows: TCheckBox;
    OlderCows: TCheckBox;
    Bevel2: TBevel;
    gbCalveReportTypes: TcxGroupBox;
    rgCalveReportType: TcxRadioGroup;
    cbCalveDoubleSpacing: TcxCheckBox;
    gbCalveFilterOptions: TcxGroupBox;
    IncCows: TCheckBox;
    IncHeifers: TCheckBox;
    QRWMFFilter1: TQRWMFFilter;
    cbIncludeNOTPregnant: TCheckBox;
    gbDryOffReporTypes: TcxGroupBox;
    rgDryOffReportTypes: TcxRadioGroup;
    cbDryOffDoubleSpacing: TcxCheckBox;
    rgServiceSortOrder: TRadioGroup;
    rgServiceSortBy: TcxRadioGroup;
    gbServicePeriod: TcxGroupBox;
    ExcludeOver: TCheckBox;
    ldaysFirstService: TLabel;
    lperiod: TLabel;
    From: TLabel;
    FromServiceDate: TDateEdit;
    lTo: TLabel;
    ToServiceDate: TDateEdit;
    DaysFirstService: TRxSpinEdit;
    gbServiceReportOptions: TcxGroupBox;
    FirstServeIncCows: TCheckBox;
    FirstServeIncHeifers: TCheckBox;
    cbExtended: TCheckBox;
    bCartAnimals: TRxSpeedButton;
    ToolButton4: TToolButton;
    cbIncludeCullCows: TCheckBox;
    cbIncludeReCheckEvents: TCheckBox;
    cbIncludeHeatOrPDAfterService: TCheckBox;
    cbIncludeHeatsAfterServiceOrPD: TCheckBox;
    cbIncludeServAndPD: TCheckBox;
    rgShowAnimalNoOrNatID: TcxRadioGroup;
    rgShowCalfSex: TcxRadioGroup;
    gbReportType: TcxGroupBox;
    cbNoheatsServices: TCheckBox;
    cbReHeatsNotServed: TCheckBox;
    cbRepeatService: TCheckBox;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    lServiceTypeFilter: TcxLabel;
    cmboServiceType: TcxComboBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToServiceDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure ServiceBlankClick(Sender: TObject);
    procedure CalveDateFromAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure DryingDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ToServiceDateExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FromServiceDateAcceptDate(Sender: TObject;
      var ADate: TDateTime; var Action: Boolean);
    procedure FromServiceDateExit(Sender: TObject);
    procedure FirstServeIncHeifersClick(Sender: TObject);
    procedure FirstServeIncCowsClick(Sender: TObject);
    procedure ServiceSortClick(Sender: TObject);
    procedure CalvingSortClick(Sender: TObject);
    procedure PDDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure AnimalNoClick(Sender: TObject);
    procedure cbPeriodBetweenClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbIncludenotServedClick(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure rgShowAnimalNoOrNatIDClick(Sender: TObject);
    procedure rgDueCalveSortByClick(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure rgPDReportTypeClick(Sender: TObject);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure rgCalveReportTypeClick(Sender: TObject);
    procedure rgDryOffReportTypesClick(Sender: TObject);
    procedure bCartAnimalsClick(Sender: TObject);
    procedure cbIncludeNotPregClick(Sender: TObject);
  private
    { Private declarations }
    DueServiceDefaults : TDueServiceDefaults;
    DuePregDiagDefaults : TDuePregDiagDefaults;
    DueDryOffDefaults : TDueDryOffDefaults;
    DueCalvingDefaults : TDueCalvingDefaults;
    ARReportType : TActionReminderReport;
    //   06/06/12 [V5.0 R7.0] /MK Additional Feature - New Type For ReportType.
    FReportType : TReportType;

    DueServiceNoAnimalNoCount,
    DueServiceNoBreedingHistoryCount : Integer;

    FAddReportToCart : Boolean;

    FBreedingDataHelper : TBreedingDataHelper;

    FCountry : TCountry;

    procedure BuildDueToCalve;
    procedure BuildDueToDryOff;
    procedure BuildDueFirstService;
    procedure CalcServiceDate;
    procedure ServiceDue;
    procedure BuildDueToPD;

    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
  public
    { Public declarations }
//    procedure DataFormCheck;

    RunWithProgressOnly : Boolean;
    ShowDate,
    IsPregYesNo,
    IsPreg : String;
    NumCalves : Integer;
    TempTable : TTable;
    HasHeat,
    HasCalvingEvent,
    IsServed,
    IsPregnant,
    IsDry     : Boolean;
    CutOffDate,
    TestDate,
    PriorServeDate,
    PriorBullingDate  : TDateTime;
    FAnimalCartArray : array of Integer;
    FAnimalCartArrayIndex : Integer;
  end;

  procedure RunReport( ReportMode : TReportMode; ActionReminderReports : TActionReminderReports);

const

   DuePD_DaysSinceCalvingToday = 50;


var
  ActionReminderFilter: TActionReminderFilter;

implementation
uses
    DueToCalve,
    DueForDryingOff,
    DairyData,
    DueFirstService,
    uProgressIndicator,
    MenuUnit, uHerdLookup;
const
   Cycle21  = 21;
   Cycle24  = 24;
   Cycle42  = 42;

   Cycle    = Cycle21;
   XTARGET  = 730;
   BULLGEST = 283;

{$R *.DFM}

  procedure RunReport( ReportMode : TReportMode; ActionReminderReports : TActionReminderReports);

    procedure PreviewReport(VisiblePanel : TPanel);
    begin
       ActionReminderFilter.pDueForDryingOff.Hide;
       ActionReminderFilter.pDueToCalve.Hide;
       ActionReminderFilter.pDueToPD.Hide;
       ActionReminderFilter.pDueFirstService.Hide;

       VisiblePanel.Show;
       Screen.Cursor := crDefault;
       try
          ActionReminderFilter.sbView.click;
       finally
          Screen.Cursor := crHourGlass;
       end;
    end;

  begin
     Screen.Cursor := crHourGlass;

     if ReportMode = rmProAction then
        if (ActionReminderList = nil) then
           raise Exception.Create('Object().ActionList. An unexpected error has occurred - aborting');

     ActionReminderFilter := TActionReminderFilter.Create(nil);
     try
        ActionReminderFilter.RunWithProgressOnly := ReportMode = rmProAction;

        ActionReminderFilter.FormShow(nil);

        if ( arDueService in ActionReminderReports ) then
           begin
              if ReportMode = rmProAction then
                 ActionReminderFilter.ToServiceDate.Date := ActionReminderList.ServiceEndDate;
              PreviewReport(ActionReminderFilter.pDueFirstService);
           end;

        if ReportMode = rmProAction then
           Sleep(1500);

        if ( arDuePD in ActionReminderReports ) then
           begin
              if ReportMode = rmProAction then
                 ActionReminderFilter.PDDate.Date := ActionReminderList.PregDiagEndDate;
              PreviewReport(ActionReminderFilter.pDueToPD);
           end;

        if ReportMode = rmProAction then
           Sleep(1500);

        if ( arDueDryOff in ActionReminderReports ) then
           begin
              if ReportMode = rmProAction then
                 ActionReminderFilter.DryingDate.Date := ActionReminderList.DryOffEndDate;
              PreviewReport(ActionReminderFilter.pDueForDryingOff);
           end;

        if ReportMode = rmProAction then
           Sleep(1500);

        if ( arDueCalve in ActionReminderReports ) then
           begin
              if ReportMode = rmProAction then
                 ActionReminderFilter.CalveDateFrom.Date := ActionReminderList.CalveEndDate;
              PreviewReport(ActionReminderFilter.pDueToCalve);
           end;
     finally
       ActionReminderFilter.Free;
       Screen.Cursor := crDefault;
     end;
  end;

procedure TActionReminderFilter.ExitBtnClick(Sender: TObject);
var Key: Word;
begin
     Close;
end;

procedure TActionReminderFilter.BuildDueToPD;
Var
   NoDaysPreg: Integer;
   PregDiagExists,
   IncludeAnimal,
   RecheckAnimal : Boolean;
begin
    {
    Build the Due To Calve Temporary Table Select all Events with CPregDiag type and
    a Record on the Animal file with the same ID and Lactation Number.
    }

    if RunWithProgressOnly then
       begin
          ShowProgressIndicator('Compiling Due PD Report, please wait...', 0,0,1);
       end;

       VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
       With WinData.TempTable Do
          begin
              Close;
              TableType := ttParadox;
              TableName := 'DueToPD';

              FieldDefs.Clear;
              // Alter these field to report heading FK
              FieldDefs.Add('AnimalID',ftInteger,0,True);
              FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
              FieldDefs.Add('AnimalNo',ftString,10,False);
              FieldDefs.Add('SortAnimalNo',ftString,10,False);
              FieldDefs.Add('LastCalvingDate',ftDate,0,False);
              FieldDefs.Add('Served',ftInteger,0,False); // Served No.
              FieldDefs.Add('PD',ftString,10,False);
              FieldDefs.Add('LastServiceDate',ftDate,0,False);
              //   20/02/12 [V5.0 R3.9] /MK Change - New Field For Last PD - Fix For Check For What Last EventType Was.
              FieldDefs.Add('LastPDDate',ftDate,0,False);
              FieldDefs.Add('DaysSince',ftFloat,0,False); // Days Since on Rpt
              FieldDefs.Add('LastBull',ftString,10,False);
              FieldDefs.Add('PlanBull',ftString,10,False);
              FieldDefs.Add('DuePDDate',ftDateTime,0,False);
              FieldDefs.Add('ServiceType',ftString,60,False); { SP 27/11/2002 }
              FieldDefs.Add('DaysAfterLastCalving',ftInteger);
              FieldDefs.Add('DiagnosedNotPregnant',ftBoolean);
              FieldDefs.Add('LastEventType',ftInteger);
              FieldDefs.Add('Recheck',ftBoolean);
              FieldDefs.Add('DaysCalved',ftInteger);

              IndexDefs.Clear;
              CreateTable;
              Open;

              // You'll need to add another TReport
              with qReportPD do
                 begin
                    SQL.Clear;
                    // Get all possible animals
                    SQL.Add('SELECT DISTINCT ID, LactNo, AnimalNo, SortAnimalNo From');
                    SQL.Add('"Animals.db" A, "Events" E');
                    SQL.Add('Where (A.Sex="Female")');
                    SQL.Add('AND (A.Inherd = TRUE)');
                    SQL.Add('AND (A.ID = E.AnimalId)');
                    SQL.Add('AND (A.Breeding=TRUE)');
                    SQL.Add('AND (A.AnimalDeleted = FALSE)');
                    {
                    //   21/02/12 [V5.0 R3.9] /MK Bug Fix - Program Was Only Showing Animals With Services If Not(cbIncludenotServed.Checked).
                    if not cbIncludenotServed.Checked then
                       begin
                          { animal must have service recorded
                          SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                          SQL.Add('AND (E.EventType = ' + IntToStr(CServiceEvent) + ')'); // Service
                       end;
                    }
                    SQL.Add('AND ( NOT (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                    if Length(cbDefaultHerd.Value) > 0 then
                       if cbDefaultHerd.Value <> '0' then
                          SQL.Add('And (A.HerdID = ' + cbDefaultHerd.Value + ')');

                    if ( cbFilter.Checked ) and ( WinData.FilteredAnimals.RecordCount > 0 ) then
                       begin
                           SQL.Add('AND A.ID IN (SELECT AF.AID FROM AFILTERS AF)');
                       end;

                    // Store Animals with PD record for the Current Lactation in the TEMP Table
                    Open;
                    First;

                    if RunWithProgressOnly then
                       begin
                          ProgressIndicator.Max := RecordCount
                       end
                    else
                       begin
                          pbCount.Min := 0;
                          pbCount.Max := RecordCount;
                       end;

                    while NOT EOF do
                       begin
                          IncludeAnimal := TRUE;
                          WinData.TempTable.Insert;
                          WinData.TempTable.FieldByName('AnimalId').AsInteger := FieldByName('ID').AsInteger;
                          WinData.TempTable.FieldByName('AnimalLactNo').AsInteger := FieldByName('LactNo').AsInteger;
                          WinData.TempTable.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;

                          WinData.TempTable.FieldByName('SortAnimalNo').AsString := FieldByName('SortAnimalNo').AsString;
                          WinData.TempTable.FieldByName('Served').AsInteger := 0;

                          // If Value Is True Then Animal Is Has Had PD And Diagnosed Not Pregnant Within PD.
                          WinData.TempTable.FieldByName('DiagnosedNotPregnant').AsBoolean := False;

                          //   19/02/12 [V5.0 R3.9] /MK Change - Start Pregnancy Status Should Be "No" Not "Undefined".
                          IsPreg := 'No';

                          NoDaysPreg := 0;

                          //   30/06/14 [V5.3 R3.0] /MK Bug Fix - Default PregDiagExists to False for each animal before looking for PD Events.
                          PregDiagExists := False;
                          // Check the PD Scan Against the Date today if it's more than 10 days display Message

                          RecheckAnimal := False;

                          if ( FBreedingDataHelper.TempPregDiag.Locate('AnimalID;AnimalLactNo',
                                                                       VarArrayOf([FieldByName('ID').AsInteger,FieldByName('LactNo').AsInteger]),[]) ) then
                             begin
                                WinData.TempTable.FieldByName('LastPDDate').AsDateTime := FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime;
                                // Check the Pregnancy Diagnosis Record for the No of Days Pregnant
                                if WinData.LookUpPDs.Locate('EventID',FBreedingDataHelper.TempPregDiag.FieldByName('EventID').AsInteger,[]) then
                                   begin
                                      if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                                         begin
                                            //WinData.TempTable.FieldByName('PD').AsString := 'Yes';
                                            PregDiagExists := True;
                                            IncludeAnimal := False;
                                            // If Value Is False Then Animal Is Has Had PD And Diagnosed Pregnant Within PD.
                                            WinData.TempTable.FieldByName('DiagnosedNotPregnant').AsBoolean := False;
                                         end
                                      else if ( WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean = FALSE ) then
                                         begin
                                            //WinData.TempTable.FieldByName('PD').AsString := 'No';
                                            PregDiagExists := False;
                                            IncludeAnimal := True;
                                            // If Value Is True Then Animal Is Has Had PD And Diagnosed Not Pregnant Within PD.
                                            WinData.TempTable.FieldByName('DiagnosedNotPregnant').AsBoolean := True;
                                         end;
                                      WinData.TempTable.FieldByName('Recheck').AsBoolean := WinData.LookUpPDs.FieldByName('Recheck').AsBoolean;
                                   end;
                             end;

                          // Clear the Filter
                          FBreedingDataHelper.TempPregDiag.Filter := '';
                          FBreedingDataHelper.TempPregDiag.Filtered := False;

                          WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime :=
                                  WinData.EventDataHelper.GetLastEventDate(FieldByName('Id').AsInteger, FieldByName('LactNo').AsInteger, cCalvingEvent);

                          if ( WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime > 0 ) then
                             WinData.TempTable.FieldByName('DaysCalved').AsInteger :=
                                Trunc(PDDate.Date - WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime);

                          // Get the Last Service Record
                          FBreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(FieldByName('LactNo').AsInteger) + ')';
                          FBreedingDataHelper.TempServices.Filtered := True;
                          if FBreedingDataHelper.TempServices.FindLast then
                             begin
                                WinData.TempTable.FieldByName('LastServiceDate').AsDateTime := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
                                WinData.TempTable.FieldByName('Served').AsInteger := FBreedingDataHelper.TempServices.RecordCount;
                                WinData.TempTable.FieldByName('DaysSince').AsFloat := ( PDDate.date - WinData.TempTable.FieldByName('LastServiceDate').AsDateTime );
                                WinData.TempTable.FieldByName('DuePDDate').AsDateTime := (WinData.TempTable.FieldByName('LastServiceDate').AsDateTime + PDSince.Value);
                                // Check the Calving Record for the Bull used in last service

                                if WinData.LookUpServices.Locate('EventID',FBreedingDataHelper.TempServices.FieldByName('EventID').AsInteger,[]) then
                                   begin
                                      if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                                         WinData.TempTable.FieldByName('LastBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                      if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[] ) then
                                         WinData.TempTable.FieldByName('ServiceType').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                   end;
                             end
                          else if ( cbIncludenotServed.Checked ) then // if not Serviced then check no. of days since last calving.
                             begin
                                { Animal has no service record, get number of days since last calving }
                                if ( WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime > 0 ) and
                                      ( WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime < Date ) then
                                   begin
                                      WinData.TempTable.FieldByName('DaysAfterLastCalving').AsInteger :=
                                          Trunc( Date - WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime );
                                      if ( WinData.TempTable.FieldByName('DaysAfterLastCalving').AsInteger > 0 ) then
                                         begin
                                            // Include animals not served more than X days.
                                            // X = FieldByName('DaysAfterLastCalving').AsInteger - seDaysAfterCalving.AsInteger
                                            // 06/06/13 [V5.1 R7.3] /MK Bug Fix - If PregDiag already exists then don't include animal if not service event exists.
                                            if ( not(PregDiagExists) ) then
                                               begin
                                                  IncludeAnimal := ( WinData.TempTable.FieldByName('DaysAfterLastCalving').AsInteger > seDaysAfterCalving.AsInteger );
                                                  if ( IncludeAnimal ) then // set the pd value to "Undefinded"
                                                     WinData.TempTable.FieldByName('pd').AsString := 'Undefined';
                                               end;
                                         end;
                                   end
                                // 06/11/12 [V5.1 R0.8] /MK Bug Fix - Animal should not show if LastCalvingDate is today.
                                else if ( WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime = Date ) then
                                   IncludeAnimal := False;
                             end;

                          // Clear the Filter
                          FBreedingDataHelper.TempServices.Filter := '';
                          FBreedingDataHelper.TempServices.Filtered := False;

                          //   20/02/12 [V5.0 R3.9] /MK Change - Look At LastPDDate In TempTable Not Variable.
                          if ( WinData.TempTable.FieldByName('LastPDDate').AsDateTime > 0 ) and
                             ( WinData.TempTable.FieldByName('LastPDDate').AsDateTime > WinData.TempTable.FieldByName('LastServiceDate').AsDateTime) then
                              WinData.TempTable.FieldByName('LastEventType').AsInteger := CPregDiagEvent
                          else if WinData.TempTable.FieldByName('LastServiceDate').AsDateTime > 0 then
                              WinData.TempTable.FieldByName('LastEventType').AsInteger := CServiceEvent;

                          //   24/11/10 [V4.0 R5.8] /MK Bug Fix - Removed If Clause For If ProjCalving > 0
                          WinData.GetProjCalving(WinData.TempTable.FieldByName('AnimalId').AsInteger,
                                                 WinData.TempTable.FieldByName('AnimalLactNo').AsInteger, NumCalves, IsPreg );
                          if ( Length(IsPreg) > 0 ) then
                             if ( NumCalves >= 0 ) then
                                WinData.TempTable.FieldByName('PD').AsString := IsPreg
                             else if ( NumCalves > 1 ) and ( UpperCase(IsPreg) = 'YES' ) then
                                // set caption to Twins, irrespectful of NumCalves count. ignoring fact might be triplets or other
                                WinData.TempTable.FieldByName('PD').AsString := 'Twins';

                          // Clear the Filter
                          FBreedingDataHelper.TempToBeCulled.Filter := '';
                          FBreedingDataHelper.TempToBeCulled.Filtered := False;

                          //   07/06/11 [V4.1 R1.8] /MK Additional Feature - If CullingEvent Found And PDStatus = No Then PDStatus = No/Cull
                          if ( WinData.TempTable.FieldByName('PD').AsString = 'No' ) then
                             if FBreedingDataHelper.TempToBeCulled.Locate('AnimalID;AnimalLactNo',
                                VarArrayOf([FieldByName('ID').AsInteger,FieldByName('LactNo').AsInteger]),[] ) then
                                   WinData.TempTable.FieldByName('PD').AsString := 'No/Cull';

                          // Clear the Filter
                          FBreedingDataHelper.TempBullings.Filter := '';
                          FBreedingDataHelper.TempBullings.Filtered := False;

                          FBreedingDataHelper.TempBullings.Filter := '(AnimalID = ' + IntToStr(FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(FieldByName('LactNo').AsInteger) + ')';
                          FBreedingDataHelper.TempBullings.Filtered := True;
                          if FBreedingDataHelper.TempBullings.FindLast then
                             begin
                                if WinData.LookUpBullings.Locate('EventID',FBreedingDataHelper.TempBullings.FieldByName('EventID').AsInteger,[]) then
                                   begin
                                      try
                                         if WinData.LookUpDamSire.Locate('ID',WinData.LookUpBullings.FieldByName('PlannedBull').AsInteger,[] ) then
                                            WinData.TempTable.FieldByName('PlanBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                      except
                                      end;
                                   end;
                             end;

                          // Clear the Filter
                          FBreedingDataHelper.TempBullings.Filter := '';
                          FBreedingDataHelper.TempBullings.Filtered := False;

                          if WinData.TempTable.FieldByName('Recheck').AsBoolean then
                             WinData.TempTable.FieldByName('PD').AsString := WinData.TempTable.FieldByName('PD').AsString + '/Recheck';

                          if ( not(IncludeAnimal) ) then
                             if ( cbIncludeReCheckEvents.Checked ) then
                                IncludeAnimal := WinData.TempTable.FieldByName('Recheck').AsBoolean;

                          if IncludeAnimal then
                             WinData.TempTable.Post
                          else
                             WinData.TempTable.Cancel;

                          if RunWithProgressOnly then
                             ProgressIndicator.Position := qReportPD.RecNo
                          else
                             pbCount.Position := qReportPD.RecNo;

                          Application.ProcessMessages;
                          Update;

                          qReportPD.Next;

                       end;

                    // Reset the Query for the Report
                    qReportPD.Sql.Clear;
                    qReportPD.Sql.Add('SELECT * FROM DueToPD');

                    // This line is the default behaviour of the report - animal must have had a service which a DueToPDDate can be calculated from.

                    if (not cbIncludeAnimalsDiagnosedNotPregnant.Checked) and (not cbIncludenotServed.Checked) then
                       begin
                          // Include animal by default if last recorded event type was service, DuePDDate can be calculated
                          // from last service date and not rechecked.
                          if ( cbIncludeReCheckEvents.Checked ) then
                             begin
                                qReportPD.SQL.Add('WHERE (((DuePDDate <=  ' + '''' + FormatDateTime(cUSDateStyle, PDDate.Date) + '''' +')');
                                qReportPD.SQL.Add('AND (LastEventType = '+IntToStr(CServiceEvent)+')');
                                qReportPD.SQL.Add('OR  ((LastEventType = '+IntToStr(CPregDiagEvent)+') AND (Recheck = TRUE)) ))');
                             end
                          else
                             begin
                                qReportPD.SQL.Add('WHERE (((DuePDDate <=  ' + '''' + FormatDateTime(cUSDateStyle, PDDate.Date) + '''' +')');
                                qReportPD.SQL.Add('AND (LastEventType = '+IntToStr(CServiceEvent)+')))');
                             end;
                       end
                    else if ( cbIncludeAnimalsDiagnosedNotPregnant.Checked ) and ( not(cbIncludenotServed.Checked) ) then
                       begin
                          // Include Animals Diagnosed Not Pregnant.
                          qReportPD.SQL.Add('WHERE ( ( (DuePDDate <= ' + '''' + FormatDateTime(cUSDateStyle, PDDate.Date) + '''' +') )');
                          qReportPD.SQL.Add('OR  ( (LastEventType = '+IntToStr(CPregDiagEvent)+') AND (DiagnosedNotPregnant = True) ) )');
                       end
                    else if ( cbIncludenotServed.Checked ) and ( not(cbIncludeAnimalsDiagnosedNotPregnant.Checked) ) then
                       begin
                          //qReportPD.SQL.Add('OR ((DuePDDate Is Null) AND (DaysAfterLastCalving > '+IntToStr(seDaysAfterCalving.AsInteger)+' )) ');
                          //qReportPD.SQL.Add('AND (PD <> "No")');

                          // Include Animals Not Served And Exclude Animals Diagnosed Not Pregnant.
                          if ( cbIncludeReCheckEvents.Checked ) then
                             begin
                                qReportPD.SQL.Add('WHERE ( ((DuePDDate <=  ' + '''' + FormatDateTime(cUSDateStyle, PDDate.Date) + '''' +') OR (Served = 0) )');
                                qReportPD.SQL.Add('AND (NOT( (LastEventType = '+IntToStr(CPregDiagEvent)+') AND (DiagnosedNotPregnant = True) ) ) ');
                                qReportPD.SQL.Add('OR ( (DiagnosedNotPregnant = True) AND (Served = 0) ) ');
                                qReportPD.SQL.Add('OR ( Recheck = True) )')
                             end
                          else
                             begin
                                qReportPD.SQL.Add('WHERE ( ((DuePDDate <=  ' + '''' + FormatDateTime(cUSDateStyle, PDDate.Date) + '''' +') OR (Served = 0) )');
                                qReportPD.SQL.Add('AND (NOT( (LastEventType = '+IntToStr(CPregDiagEvent)+') AND (DiagnosedNotPregnant = True) ) ) ');
                                qReportPD.SQL.Add('OR ( (DiagnosedNotPregnant = True) AND (Served = 0) ) )');
                             end;
                          //qReportPD.SQL.Add('AND (DiagnosedNotPregnant = False)');
                       end
                    else
                       begin
                          // Include Both Animals Not Served And Animals Diagnosed Not Pregnant.
                          qReportPD.SQL.Add('WHERE (((DuePDDate <=  ' + '''' + FormatDateTime(cUSDateStyle, PDDate.Date) + '''' +')');
                          qReportPD.SQL.Add('OR (Served = 0)');
                          qReportPD.SQL.Add('OR (DiagnosedNotPregnant = True)))');
                       end;

                    //   14/07/11 [V4.1 R2.3] /MK Bug Fix - Added New Logic So Regardless Of Cows/Heifers Where Clause Exists.
                    if ((cbIncCows.Checked) and (not cbIncHeifers.Checked)) then
                       qReportPD.Sql.Add('AND ( AnimalLactNo > 0 )')
                    else if ((not cbIncCows.Checked) and (cbIncHeifers.Checked)) then
                       qReportPD.Sql.Add('AND ( AnimalLactNo = 0 )');
                    //else
                       //qReportPD.Sql.Add(')');

                    {
                    if ( cbIncludeAnimalsDiagnosedNotPregnant.Checked ) then
                       qReportPD.SQL.Add('AND (PD = "No")');
                    }

                    if rgOrder.ItemIndex = 0 Then
                       qReportPD.Sql.Add('ORDER BY DuePDDate')
                    else
                       qReportPD.Sql.Add('ORDER BY SortAnimalNo');

                    if rgSort.ItemIndex = 0 Then
                       qReportPD.Sql.Add('Asc')
                    else
                       qReportPD.Sql.Add('Desc');

                    DateLabel.Caption := PDDate.Text;
                    qReportPD.Open;
                    if ( FAddReportToCart ) then
                       begin
                          SetLength(FAnimalCartArray,qReportPD.RecordCount);
                          First;
                          while ( not(qReportPD.Eof) ) do
                             try
                                if ( not(FAnimalCartArrayIndex = qReportPD.RecordCount) ) then
                                   begin
                                      FAnimalCartArray[FAnimalCartArrayIndex] := qReportPD.FieldByName('AnimalID').AsInteger;
                                      Inc(FAnimalCartArrayIndex);
                                   end;
                                qReportPD.Next;
                             except

                             end;
                       end;
                 end;
              {
               if DoubleSpace.Checked then
                  begin
                     DueToCalveScr.Details.Height := 24;
                     DueToCalveScr.Details.Height := 30;
                  end
              }

          end;
    if RunWithProgressOnly then
       uProgressIndicator.ProgressIndicator.Close;
end;

procedure TActionReminderFilter.BuildDueToCalve;
Var
   NoDaysPreg,
   Gestation : Integer;
   IncludeAnimal : Boolean;
   PDProjDate,
   PdDate,
   LastServiceDate,
   LastHeatDate,
   TestDate,
   dDueToCalveDate : TDateTime;
   LookupCalvings : TTable;
   ServedAfterPD : Boolean;

   //   18/01/12 [V5.0 R3.5] /MK Change - New Variable To Be Able To Change ICBF Event Description.
   LastBirth,
   TempStr,
   sBullUsed : string;

   HealthWithDrawalInfo : THealthWithDrawalInfo;

   ServiceType : String;

   StartTime, EndTime : Integer;

   function DueToCalveInPeriod : Boolean;
   begin
      Result := IncludeAnimal;
      if ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime > 0 ) then
         if cbPeriodBetween.Checked then
            begin
               if (CalveDateFrom.Date > 0) and (CalveDateTo.Date > 0) then
                  Result := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime >= CalveDateFrom.Date ) and
                            ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime <= CalveDateTo.Date )
               else if (CalveDateFrom.Date <= 0) and (CalveDateTo.Date > 0) then
                  Result := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime <= CalveDateTo.Date )
               else if (CalveDateFrom.Date > 0 ) and (CalveDateTo.Date <= 0) then
                  Result := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime >= CalveDateFrom.Date );
            end
         else
            Result := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime <= CalveDateFrom.Date );
   end;

   //   11/08/15 [V5.4 R7.2] /MK Additional Feature - Add check for Post Service Heat - Gl/Gilbert Clancy request.
   procedure CreatePostServiceHeatRecord(AAnimalID, AAnimalLactNo : Integer);
   var
      DueCalveDate,
      CheckEventDate,
      LastCalvingDate : TDateTime;
   begin
      LastCalvingDate := 0;
      FBreedingDataHelper.TempCalvings.Filter := '';
      FBreedingDataHelper.TempCalvings.Filtered := False;
      FBreedingDataHelper.TempCalvings.Filter := '(AnimalID = ' + IntToStr(AAnimalID) + ') And (AnimalLactNo = ' + IntToStr(AAnimalLactNo) + ')';
      FBreedingDataHelper.TempCalvings.Filtered := True;
      if ( FBreedingDataHelper.TempCalvings.FindLast ) then
         LastCalvingDate := FBreedingDataHelper.TempCalvings.FieldByName('EventDate').AsDateTime;

      DueCalveDate := 0;
      DueCalveDate := WinData.TempTable.FieldByName('DueToCalve').AsDateTime;
      WinData.TempTable.FieldByName('PostServiceOrPDHeat').AsBoolean := False;
      FBreedingDataHelper.TempBullings.Filter := '';
      FBreedingDataHelper.TempBullings.Filtered := False;
      FBreedingDataHelper.TempBullings.Filter := '(AnimalID = ' + IntToStr(AAnimalID) + ') And (AnimalLactNo = ' + IntToStr(AAnimalLactNo) + ')';
      FBreedingDataHelper.TempBullings.Filtered := True;
      if ( FBreedingDataHelper.TempBullings.FindLast ) then
         begin
            LastHeatDate := FBreedingDataHelper.TempBullings.FieldByName('EventDate').AsDateTime;
            CheckEventDate := 0;
            CheckEventDate := LastServiceDate;
            if ( PDDate > LastServiceDate ) then
               CheckEventDate := PDDate;
            if ( (LastHeatDate > LastCalvingDate) and (CheckEventDate > LastCalvingDate) and (LastHeatDate > CheckEventDate) ) then
                begin
                   IncludeAnimal := cbIncludeHeatOrPDAfterService.Checked;
                   // Clear out due to calve date if cbIncludeHeatAfterService is not checked and animal qualifies for Heat after service./
                   // This way the animal is then not included on the report as there is no due to calve date.
                   if ( not(IncludeAnimal) ) then
                      WinData.TempTable.FieldByName('DueToCalve').AsDateTime := 0
                   else
                      WinData.TempTable.FieldByName('DueToCalve').AsDateTime := DueCalveDate;
                   WinData.TempTable.FieldByName('PostServiceOrPDHeat').AsBoolean := ( LastHeatDate > CheckEventDate );
                end;
         end;
   end;

begin
   {
   Build the Due To Calve Temporary Table Select all Events with CPregDiag type and
   a Record on the Animal file with the same ID and Lactation Number.
   }

   StartTime := GetTickCount;

   if RunWithProgressOnly then
      begin
         ShowProgressIndicator('Compiling Due To Calve Report, please wait...', 0,0,1);
      end;

   WinData.CreateTTable(LookupCalvings,nil,'',WinData.Calvings.TableName);
   LookupCalvings.Active := True;
   try
       WinData.LookUpMilkDisk.Open; //joanne tighe 6/02/2004
       With WinData.TempTable Do
          begin
              Close;
              TableType := ttParadox;
              TableName := 'DueToCalve';

              FieldDefs.Clear;
              FieldDefs.Add('AnimalID',ftInteger,0,True);
              FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
              FieldDefs.Add('AnimalNo',ftString,10,False);
              FieldDefs.Add('SortAnimalNo',ftString,10,False);
              FieldDefs.Add('EventId',ftInteger,0,False);
              FieldDefs.Add('EventDate',ftDate,0,False);
              FieldDefs.Add('LastBirth',ftString,15,False);
              FieldDefs.Add('LastCalfType',ftString,10,False);

              //   19/10/11 [V5.0 R1.5] /MK Additional Feature - Added New PredCalfType Field For PD Calf Type.
              FieldDefs.Add('PredCalfType',ftString,3,False);

              FieldDefs.Add('BullUsed',ftString,10,False);
              FieldDefs.Add('ServiceType',ftString,60,False);
              FieldDefs.Add('YieldToDate',ftFloat,0,False);
              FieldDefs.Add('CalvingInterval',ftInteger,0,False);
              FieldDefs.Add('DaysToCalving',ftInteger,0,False);
              FieldDefs.Add('DueToCalve',ftDate,0,False);
              FieldDefs.Add('PD',ftString,9,False);
              FieldDefs.Add('Status',ftString,10,False);
              FieldDefs.Add('ConditionScore',ftFloat,0,False);

              //  22/01/2009 [Dev V3.9 R5.8] /MK Added the ShortNatID, NatID and SortNatID to DueToCalve Table
              FieldDefs.Add('ShortNatIDNum',ftString,20,False);
              FieldDefs.Add('NatIDNum',ftString,20,False);
              FieldDefs.Add('SortNatID',ftString,20,False);

              FieldDefs.Add('HealthDate',ftDate,0,False);
              FieldDefs.Add('WithdrawalDate',ftDate,0,False);
              FieldDefs.Add('WithdrawalFromDryOff',ftBoolean,0,False);

              FieldDefs.Add('PostServiceOrPDHeat',ftBoolean);
              FieldDefs.Add('DiagnosedNotPregnant',ftBoolean);

              IndexDefs.Clear;
              IndexDefs.Add('','AnimalID',[ixPrimary, ixUnique]);
              IndexDefs.Add('iDueDate','DueToCalve',[ixCaseInsensitive]);
              CreateTable;
              Open;

              with DueToCalveScr do
                 begin
                    qDueToCalve.Close;
                    qDueToCalve.SQL.Clear;
                    // Get all possible animals

                    //   30/10/20 [V5.9 R7.0] /MK Change - Changed SQL after speaking with Shane to include Milk information and to use joins instead of From Animals A, Events E.
                    qDueToCalve.SQL.Add('SELECT DISTINCT A.ID, A.LactNo, A.AnimalNo, A.SortAnimalNo, A.SortNatID, A.NatIDNum,');
                    qDueToCalve.SQL.Add('                M.CumYield, M.DaysInMilk');
                    qDueToCalve.SQL.Add('FROM Events E');
                    qDueToCalve.SQL.Add('INNER JOIN Animals A ON (A.ID = E.AnimalId)');
                    //   13/11/20 [V5.9 R7.3] /MK Bug Fix - Use Left Join instead of Inner Join as Inner Join only brings due to calve animals in milk disk table.
                    qDueToCalve.SQL.Add('LEFT JOIN MilkDisk M ON ((M.AnimalId = A.ID) AND (M.LactNo = A.LactNo))');
                    qDueToCalve.SQL.Add('WHERE (A.Sex="Female")');
                    qDueToCalve.SQL.Add('AND   (A.ID = E.AnimalId)');
                    qDueToCalve.SQL.Add('AND   (A.Inherd = TRUE)');
                    qDueToCalve.SQL.Add('AND   (A.Breeding = TRUE)');
                    qDueToCalve.SQL.Add('AND   (A.LactNo = E.AnimalLactNo)');
                    qDueToCalve.SQL.Add('AND   (A.AnimalDeleted=FALSE)');
                    qDueToCalve.SQL.Add('AND   (E.EventType IN ('+IntToStr(CServiceEvent)+', '+IntToStr(CPregDiagEvent)+'))');
                    qDueToCalve.SQL.Add('AND   (A.HerdID IN (SELECT DefaultHerdID FROM Defaults))');

                    if NOT ( IncCows.Checked And IncHeifers.Checked ) then
                       begin
                          if IncCows.Checked then
                             qDueToCalve.Sql.Add('AND ( A.LactNo > 0 )')
                          else
                             qDueToCalve.Sql.Add('AND ( A.LactNo = 0 )');
                       end;

                    if ( cbFilter.Checked ) and ( WinData.FilteredAnimals.RecordCount > 0 ) then
                       qDueToCalve.SQL.Add('AND A.ID IN (SELECT AF.AID FROM AFILTERS AF)');

                    // Store Animals with PD record for the Current Lactation in the TEMP Table
                    qDueToCalve.Open;

                    qDueToCalve.First;

                    if RunWithProgressOnly then
                       begin
                          ProgressIndicator.Max := qDueToCalve.RecordCount;
                       end
                    else
                       begin
                          pbCount.Min := 0;
                          pbCount.Max := qDueToCalve.RecordCount;
                       end;
                    while NOT qDueToCalve.EOF do
                       begin
                          IncludeAnimal := TRUE;
                          ServedAfterPD := False;
                          WinData.TempTable.Insert;

                          WinData.TempTable.FieldByName('AnimalId').AsInteger := qDueToCalve.FieldByName('ID').AsInteger;
                          WinData.TempTable.FieldByName('AnimalLactNo').AsInteger := qDueToCalve.FieldByName('LactNo').AsInteger;
                          WinData.TempTable.FieldByName('AnimalNo').AsString := qDueToCalve.FieldByName('AnimalNo').AsString;
                          WinData.TempTable.FieldByName('NatIDNum').AsString := qDueToCalve.FieldByName('NatIDNum').AsString;

                          //  22/01/2009 [Dev V3.9 R5.8] /MK
                          WinData.TempTable.FieldByName('NatIDNum').AsString := qDueToCalve.FieldByName('NatIDNum').AsString;

                          //   30/10/20 [V5.9 R7.0] /MK Change - Take YieldToDate from new fields in the query.
                          if ( qDueToCalve.FieldByName('DaysInMilk').AsFloat > 0 ) then
                             WinData.TempTable.FieldByName('YieldToDate').AsFloat := qDueToCalve.FieldByName('CumYield').AsFloat / qDueToCalve.FieldByName('DaysInMilk').AsFloat
                          else if ( qDueToCalve.FieldByName('CumYield').AsFloat > 0 ) then
                             WinData.TempTable.FieldByName('YieldToDate').AsFloat := qDueToCalve.FieldByName('CumYield').AsFloat;

                          if ( IsNINatID(WinData.TempTable.FieldByName('NatIDNum').AsString) ) then
                             begin
                                TempStr := StripAllSpaces(WinData.TempTable.FieldByName('NatIDNum').AsString);
                                WinData.TempTable.FieldByName('ShortNatIDNum').AsString := Copy(TempStr,Length(TempStr)-6,MaxInt);
                             end
                          else
                             begin
                                TempStr := StripAllSpaces(WinData.TempTable.FieldByName('NatIDNum').AsString);
                                WinData.TempTable.FieldByName('ShortNatIDNum').AsString := Copy(TempStr,Length(TempStr)-4,MaxInt)
                             end;

                          WinData.TempTable.FieldByName('SortAnimalNo').AsString := qDueToCalve.FieldByName('SortAnimalNo').AsString;
                          //  30/09/10 [V4.0 R4.9] /MK Change - Add SortNatID For new RadioGroup rgDueCalveSortBy.
                          WinData.TempTable.FieldByName('SortNatID').AsString := qDueToCalve.FieldByName('SortNatID').AsString;
                          WinData.TempTable.FieldByName('ConditionScore').AsFloat := GetConditionScore(qDueToCalve.FieldByName('ID').AsInteger,qDueToCalve.FieldByName('LactNo').AsInteger);

                          NoDaysPreg := 0;

                          // Check the PD Scan Against the Date today if it's more than 10 days display Message
                          FBreedingDataHelper.TempPregDiag.Filter := '(AnimalID = ' + IntToStr(qDueToCalve.FieldByName('ID').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueToCalve.FieldByName('LactNo').AsInteger) + ')';
                          FBreedingDataHelper.TempPregDiag.Filtered := True;
                          WinData.TempTable.FieldByName('DiagnosedNotPregnant').AsBoolean := False;
                          PDDate := 0;
                          if FBreedingDataHelper.TempPregDiag.FindLast then
                             begin
                                PDDate := FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime;
                                // Check the Pregnancy Diagnosis Record for the No of Days Pregnant
                                if WinData.LookUpPDs.Locate('EventID',FBreedingDataHelper.TempPregDiag.FieldByName('EventID').AsInteger,[]) then
                                   begin
                                      if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                                         begin
                                            Gestation := 283;
                                            //   24/07/12 [V5.0 R8.0] /MK Bug Fix - Gestation days not calculated if PD found and DueToCalve date calculated from PD Date.

                                            // Check the last service event and get the gestation period from the bull of that service.
                                            FBreedingDataHelper.TempServices.Filter := '';
                                            FBreedingDataHelper.TempServices.Filtered := False;
                                            FBreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(WinData.TempTable.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(WinData.TempTable.FieldByName('AnimalLactNo').AsInteger) + ')';
                                            FBreedingDataHelper.TempServices.Filtered := True;
                                            try
                                               LastServiceDate := 0;
                                               if FBreedingDataHelper.TempServices.FindLast then
                                                  begin
                                                     LastServiceDate := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
                                                     if WinData.LookUpServices.Locate('EventID', FBreedingDataHelper.TempServices.FieldByName('EventID').AsInteger,[]) then
                                                        Gestation := FBreedingDataHelper.GetGestation ( WinData.LookUpServices.FieldByName('ServiceBull').AsInteger );
                                                  end;
                                            finally
                                               FBreedingDataHelper.TempServices.Filter := '';
                                               FBreedingDataHelper.TempServices.Filtered := False;
                                            end;

                                            NoDaysPreg := WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger;
                                            if NoDaysPreg > 0 then
                                               begin
                                                  if ( NoDaysPreg >= 0 ) And
                                                     ( NoDaysPreg <= 283 ) then
                                                       PDProjDate := PDDate + (Gestation-NoDaysPreg) // Projected Date
                                                  else
                                                     PDProjDate := PDDate + Gestation; // Projected Date
                                                  // Projected Date
                                                  WinData.TempTable.FieldByName('DueToCalve').AsDateTime := PDProjDate;
                                                  // No of Days to Calving negitive indicates past projected Calving Date
                                                  WinData.TempTable.FieldByName('DaysToCalving').Value := ( PDProjDate - Now() );
                                               end
                                            else
                                               WinData.TempTable.FieldByName('DueToCalve').AsDateTime := 0;
                                         end
                                      else if ( WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean = FALSE ) then
                                         begin
                                            //if cbIncludeNOTPD.State in [cbUnChecked] then
                                            if cbIncludeNOTPregnant.Checked = False then
                                               IncludeAnimal := FALSE;

                                            // Clear the Filter
                                            FBreedingDataHelper.TempServices.Filter := '';
                                            FBreedingDataHelper.TempServices.Filtered := False;

                                            // Get the Last Service Record
                                            FBreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(qDueToCalve.FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueToCalve.FieldByName('LactNo').AsInteger) + ')';
                                            FBreedingDataHelper.TempServices.Filtered := True;
                                            LastServiceDate := 0;
                                            if FBreedingDataHelper.TempServices.FindLast then
                                               begin
                                                  LastServiceDate := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
                                                  ServedAfterPD := LastServiceDate > PDDate;
                                                  // Mark animal to be included in report if service has taken place after preg diag
                                                  //   09/01/12 [V5.0 R3.2] /MK&SP Bug Fix - If PD Not Pregnant And Service Event Found Then
                                                  //                                         Include Animal If ServiceAfterPD or cbIncludeNOTPregnant.Checked
                                                  IncludeAnimal := ServedAfterPD or cbIncludeNOTPregnant.Checked;
                                               end
                                            else
                                               begin
                                                  //   09/01/12 [V5.0 R3.2] /MK&SP Bug Fix - If PD Not Pregnant And No Service Event Found Then
                                                  //                                         Include Animal If cbIncludeNOTPregnant.Checked.
                                                  IncludeAnimal := cbIncludeNOTPregnant.Checked;
                                               end;
                                            WinData.TempTable.FieldByName('DiagnosedNotPregnant').AsBoolean := cbIncludeNOTPregnant.Checked;
                                         end;
                                      if Length(Trim(WinData.LookUpPDs.FieldByName('CalfType').AsString)) > 0 then
                                         WinData.TempTable.FieldByName('PredCalfType').AsString := WinData.LookUpPDs.FieldByName('CalfType').AsString;
                                   end;
                                CreatePostServiceHeatRecord(qDueToCalve.FieldByName('Id').AsInteger,qDueToCalve.FieldByName('LactNo').AsInteger);
                             end;

                          if IncludeAnimal then
                             begin
                                // Clear the Filter
                                FBreedingDataHelper.TempServices.Filter := '';
                                FBreedingDataHelper.TempServices.Filtered := False;

                                // Get the Last Service Record
                                FBreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(qDueToCalve.FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueToCalve.FieldByName('LactNo').AsInteger) + ')';
                                FBreedingDataHelper.TempServices.Filtered := True;
                                if FBreedingDataHelper.TempServices.FindLast then
                                   begin
                                      Gestation := 283;
                                      TestDate := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
                                      LastServiceDate := 0;
                                      LastServiceDate := TestDate;
                                      // Check the Calving Record for the Bull used in last service
                                      if WinData.LookUpServices.Locate('EventID',FBreedingDataHelper.TempServices.FieldByName('EventID').AsInteger,[]) then
                                         begin
                                            Gestation := FBreedingDataHelper.GetGestation(WinData.LookUpServices.FieldByName('ServiceBull').AsInteger);
                                            // Bull Used
                                            if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                                               WinData.TempTable.FieldByName('BullUsed').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                            // Service Type
                                            //   30/10/20 [V5.9 R7.0] /MK Change - Abreviate the Service Type as requested by GL.
                                            if ( WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[]) ) then
                                               begin
                                                  ServiceType := WinData.GenLookUp.FieldByName('Description').AsString;
                                                  if ( Pos('ART',UpperCase(ServiceType)) > 0 ) then
                                                     ServiceType := 'AI'
                                                  else if ( Pos('NAT',UpperCase(ServiceType)) > 0 ) then
                                                     ServiceType := 'NAT'
                                                  else if ( Pos('EMB',UpperCase(ServiceType)) > 0 ) then
                                                     ServiceType := 'ET';
                                                  WinData.TempTable.FieldByName('ServiceType').AsString := ServiceType;
                                               end;
                                         end;
                                      TestDate := TestDate+Gestation;
                                      if not( WinData.TempTable.FieldByName('DueToCalve').AsDateTime > 0 ) then // Only Predict from Service if PD Proj Calve is <= 0.
                                         begin
                                            // Projected Date
                                            WinData.TempTable.FieldByName('DueToCalve').AsDateTime := TestDate;
                                            // No of Days to Calving negitive indicates past projected Calving Date
                                            WinData.TempTable.FieldByName('DaysToCalving').Value := ( TestDate - Now() );
                                         end;

                                      if ( PdDate = 0 ) then
                                         CreatePostServiceHeatRecord(qDueToCalve.FieldByName('Id').AsInteger,qDueToCalve.FieldByName('LactNo').AsInteger);
                                   end;

                                IncludeAnimal := ( DueToCalveInPeriod );

                                if ( IncludeAnimal ) then
                                   begin
                                      // Clear the Filter
                                      WinData.GetProjCalving(WinData.TempTable.FieldByName('AnimalId').AsInteger,
                                                             WinData.TempTable.FieldByName('AnimalLactNo').AsInteger, NumCalves, IsPreg );
                                      if ( Length(IsPreg) > 0 ) then
                                         begin
                                            WinData.TempTable.FieldByName('PD').AsString := IsPreg;
                                            if ( NumCalves > 1 ) then
                                               // set caption to Twins, irrespectful of NumCalves count. ignoring fact might be triplets or other
                                               WinData.TempTable.FieldByName('PD').AsString := 'Twins';
                                         end;

                                      // Check for a Drying off Record
                                      if FBreedingDataHelper.TempDryingOffs.Locate('AnimalId;AnimalLactNo',VarArrayOf([qDueToCalve.FieldByName('ID').AsInteger,qDueToCalve.FieldByName('LactNo').AsInteger]),[]) then
                                         WinData.TempTable.FieldByName('Status').AsString := 'Dry'
                                      else if WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 then
                                         WinData.TempTable.FieldByName('Status').AsString := 'Dry'
                                      else
                                         WinData.TempTable.FieldByName('Status').AsString := 'In Milk';

                                      // Calcalate the Calving Index - Last Calving Date - Last Service Date
                                      // Get the Birth Type of the previous Calving
                                      if FBreedingDataHelper.TempCalvings.Locate('AnimalId;AnimalLactNo',VarArrayOf([qDueToCalve.FieldByName('ID').AsInteger,qDueToCalve.FieldByName('LactNo').AsInteger]),[]) then
                                         begin
                                            WinData.TempTable.FieldByName('CalvingInterval').Value := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime - FBreedingDataHelper.TempCalvings.FieldByName('EventDate').AsDateTime );
                                            if LookUpCalvings.Locate('EventId',FBreedingDataHelper.TempCalvings.FieldByName('EventID').AsInteger,[]) then
                                               begin
                                                  if WinData.GenLookUp.Locate('ID',LookUpCalvings.FieldByName('BirthType').AsInteger,[]) then
                                                     //   18/01/12 [V5.0 R3.5] /MK Change - New Variable To Be Able To Change ICBF Event Description.
                                                     //   30/10/20 [V5.9 R7.0] /MK Change - Make change to LastBirth so that we don't show 1=, 2=, 3=, 4= as request by GL.
                                                     LastBirth := WinData.GenLookUp.FieldByName('Description').AsString;
                                                     if LastBirth <> '' then
                                                        begin
                                                           if ( Copy(LastBirth,1,5) = 'ICBF-' ) then
                                                              LastBirth := Copy(LastBirth,6,Length(LastBirth)-5);
                                                           if ( Copy(LastBirth,1,2) = '1=' ) then
                                                              WinData.TempTable.FieldByName('LastBirth').AsString := 'Normal'
                                                           else if ( Copy(LastBirth,1,2) = '2=' ) then
                                                              WinData.TempTable.FieldByName('LastBirth').AsString := 'Some Dif'
                                                           else if ( Copy(LastBirth,1,2) = '3=' ) then
                                                              WinData.TempTable.FieldByName('LastBirth').AsString := 'Cons Dif'
                                                           else if ( Copy(LastBirth,1,2) = '4=' ) then
                                                              WinData.TempTable.FieldByName('LastBirth').AsString := 'Vet'
                                                           //   09/09/21 [V6.0 R2.3] /MK Bug Fix - If the LastBirth is something else then set field column in report to this - TGM reported.
                                                           else
                                                              WinData.TempTable.FieldByName('LastBirth').AsString := LastBirth;
                                                        end;
                                                     // Get the Calves Sex and Concat into LAstCalf String.

                                                  //   20/10/11 [V5.0 R1.5] /MK Additional Feature - If Calf Sex Is Steer or Bull Change LastCalfType To M.

                                                  if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID1').AsInteger,[]) then
                                                     if ( Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1) = 'B' ) or ( Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1) ='S' ) then
                                                        //WinData.TempTable.FieldByName('LastCalfType').AsString := Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                                        WinData.TempTable.FieldByName('LastCalfType').AsString := 'M'
                                                     else
                                                        WinData.TempTable.FieldByName('LastCalfType').AsString := Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);

                                                  if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID2').AsInteger,[]) then
                                                     //WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +    //KVB
                                                     //                                                    Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                                     if ( Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1) = 'B' ) or ( Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1) ='S' ) then
                                                        WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' + 'M'
                                                     else
                                                        WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +
                                                                                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);

                                                  if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID3').AsInteger,[]) then
                                                     //WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +    //KVB
                                                     //                                                    Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                                     if ( Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1) = 'B' ) or ( Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1) ='S' ) then
                                                        WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' + 'M'
                                                     else
                                                        WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +
                                                                                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);

                                                  if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID4').AsInteger,[]) then
                                                     //WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +    //KVB
                                                     //                                                    Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                                     if ( Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1) = 'B' ) or ( Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1) ='S' ) then
                                                        WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' + 'M'
                                                     else
                                                        WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +
                                                                                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                               end;
                                         end;

                                      //   30/08/21 [V6.0 R2.1] /MK Additional Feature - If IncludeAnimal then add DueToCalveDate and ExpectedBullCode(if any) data to CowExt table for main grid.
                                      dDueToCalveDate := WinData.TempTable.FieldByName('DueToCalve').AsDateTime;
                                      sBullUsed := WinData.TempTable.FieldByName('BullUsed').AsString;
                                      with TQuery.Create(nil) do
                                         try
                                            DatabaseName := AliasName;
                                            SQL.Clear;
                                            SQL.Add('SELECT *');
                                            SQL.Add('FROM CowExt');
                                            SQL.Add('WHERE AnimalId = :AID');
                                            Params[0].AsInteger := WinData.TempTable.FieldByName('AnimalId').AsInteger;
                                            try
                                               Open;
                                               if ( RecordCount > 0 ) then
                                                  begin
                                                     Close;
                                                     SQL.Clear;
                                                     SQL.Add('UPDATE CowExt');
                                                     SQL.Add('SET DueToCalveDate = :dDueToCalveDate,');
                                                     SQL.Add('    ExpectedBullCode = :sBullUsed');
                                                     SQL.Add('WHERE AnimalId = :AID');
                                                     Params[0].AsDateTime := dDueToCalveDate;
                                                     Params[1].AsString := sBullUsed;
                                                     Params[2].AsInteger := WinData.TempTable.FieldByName('AnimalId').AsInteger;
                                                     ExecSQL;
                                                  end
                                               else
                                                  begin
                                                     Close;
                                                     SQL.Clear;
                                                     SQL.Add('INSERT INTO CowExt (AnimalId, DueToCalveDate, ExpectedBullCode)');
                                                     SQL.Add('VALUES (:AId, :dDueToCalveDate, :sBullUsed)');
                                                     Params[0].AsInteger := WinData.TempTable.FieldByName('AnimalId').AsInteger;
                                                     Params[1].AsDateTime := dDueToCalveDate;
                                                     Params[2].AsString := sBullUsed;
                                                     ExecSQL;
                                                  end;
                                               //   30/08/21 [V6.0 R2.1] /MK Additional Feature - Update WinData.DueCalvingUpdated variable once DueToCalve data has been added to CowExt table.
                                               if ( not(WinData.DueCalvingUpdated) ) then
                                                  WinData.DueCalvingUpdated := True;
                                            except
                                               on e : Exception do
                                                  ShowDebugMessage(e.Message);
                                            end;
                                         finally
                                            Free;
                                         end;

                                      // Get the Milk Production Info for the Last Lactation. joanne tighe 6/02/2004
                                      //   30/10/20 [V5.9 R7.0] /MK Change - No need for this Locate on MilkDisk as the initial query is getting this info.
                                      {
                                      if WinData.LookUpMilkDisk.Locate('AnimalId;LactNo',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('AnimalLactNo').AsInteger-1]),[]) then
                                         begin
                                            if WinData.LookUpMilkDisk.FieldByName('DaysInMilk').AsFloat > 0 then
                                               WinData.TempTable.FieldByName('YieldToDate').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat / WinData.LookUpMilkDisk.FieldByName('DaysInMilk').AsFloat
                                            else
                                               WinData.TempTable.FieldByName('YieldToDate').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat;
                                         end;
                                      }

                                      HealthWithDrawalInfo := HerdLookup.MaxDrugWithDrawalDate(WinData.TempTable.FieldByName('AnimalID').AsInteger,
                                                                                               WinData.TempTable.FieldByName('DueToCalve').AsDateTime,
                                                                                               cCalvingEvent);
                                      with HealthWithDrawalInfo do
                                         begin
                                            WinData.TempTable.FieldByName('HealthDate').AsDateTime := StartDate;

                                            //   27/10/15 [V5.4 R9.7] /MK Change - New rule change from GL, only show milk withdrawal date if any.
                                            WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := 0;
                                            WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := MilkWithDrawalDate;
                                            if ( HerdLookup.HerdOwnerData.OrganicHerd ) then
                                               WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := OrganicMilkWithDrawalDate;

                                            //   21/01/13 [V5.1 R3.8] /MK Change - Rules updated to allow for if Milk, Meat or Other withdrawal dates are all
                                            //                                     after StartDate - which date gets priority.
                                            {
                                            if ( not(HerdLookup.HerdOwnerData.OrganicHerd) ) then
                                               begin
                                                  // MilkWithDrawalDate is always first priority warning
                                                  if ( MilkWithDrawalDate > Date ) and
                                                     ( (MilkWithDrawalDate < MeatWithDrawalDate) or (MeatWithDrawalDate < Date) or (MeatWithDrawalDate = 0) ) and
                                                     ( (MilkWithDrawalDate < OtherWithDrawalDate) or (OtherWithDrawalDate < Date) or (OtherWithDrawalDate = 0) ) then
                                                     WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := HealthWithDrawalInfo.MilkWithDrawalDate
                                                  // MeatWithDrawalDate is second priority warning
                                                  else if ( MeatWithDrawalDate > Date ) and
                                                          ( (MeatWithDrawalDate < MilkWithDrawalDate) or (MilkWithDrawalDate < Date) or (MilkWithDrawalDate = 0) ) and
                                                          ( (MeatWithDrawalDate < OtherWithDrawalDate) or (OtherWithDrawalDate < Date) or (OtherWithDrawalDate = 0) ) then
                                                     WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := HealthWithDrawalInfo.MeatWithDrawalDate
                                                  // OtherWithDrawalDate is last priority warning
                                                  else if ( OtherWithDrawalDate > Date ) and
                                                          ( (OtherWithDrawalDate < MilkWithDrawalDate) or (MilkWithDrawalDate < Date) or (MilkWithDrawalDate = 0) ) and
                                                          ( (OtherWithDrawalDate < MeatWithDrawalDate) or (MeatWithDrawalDate < Date) or (MeatWithDrawalDate = 0) ) then
                                                     WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := HealthWithDrawalInfo.OtherWithDrawalDate;
                                               end
                                            else
                                               begin
                                                  // MilkWithDrawalDate is always first priority warning
                                                  if ( OrganicMilkWithDrawalDate > Date ) and
                                                     ( (OrganicMilkWithDrawalDate < OrganicMeatWithDrawalDate) or (OrganicMeatWithDrawalDate < Date) or (OrganicMeatWithDrawalDate = 0) ) and
                                                     ( (OrganicMilkWithDrawalDate < OrganicOtherWithDrawalDate) or (OrganicOtherWithDrawalDate < Date) or (OrganicOtherWithDrawalDate = 0) ) then
                                                     WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := HealthWithDrawalInfo.OrganicMilkWithDrawalDate
                                                  // MeatWithDrawalDate is second priority warning
                                                  else if ( MeatWithDrawalDate > Date ) and
                                                          ( (OrganicMeatWithDrawalDate < OrganicMilkWithDrawalDate) or (OrganicMilkWithDrawalDate < Date) or (OrganicMilkWithDrawalDate = 0) ) and
                                                          ( (OrganicMeatWithDrawalDate < OrganicOtherWithDrawalDate) or (OrganicOtherWithDrawalDate < Date) or (OrganicOtherWithDrawalDate = 0) ) then
                                                     WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := HealthWithDrawalInfo.OrganicMeatWithDrawalDate
                                                  // OtherWithDrawalDate is last priority warning
                                                  else if ( OrganicOtherWithDrawalDate > StartDate ) and
                                                          ( (OrganicOtherWithDrawalDate < OrganicMilkWithDrawalDate) or (OrganicMilkWithDrawalDate < StartDate) or (OrganicMilkWithDrawalDate = 0) ) and
                                                          ( (OrganicOtherWithDrawalDate < OrganicMeatWithDrawalDate) or (OrganicMeatWithDrawalDate < StartDate) or (OrganicMeatWithDrawalDate = 0) ) then
                                                     WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := HealthWithDrawalInfo.OrganicOtherWithDrawalDate;
                                               end;
                                            }
                                            WinData.TempTable.FieldByName('WithdrawalFromDryOff').AsBoolean := DryOff;
                                         end;
                                      WinData.TempTable.Post;
                                   end
                                else
                                   WinData.TempTable.Cancel;
                             end
                          else
                             WinData.TempTable.Cancel;

                          if RunWithProgressOnly then
                             ProgressIndicator.Position := qDueToCalve.RecNo
                          else
                             pbCount.Position := qDueToCalve.RecNo;

                          Application.ProcessMessages;
                          Update;

                          qDueToCalve.Next;
                       end;

                    // ReSet the Query for the Report
                    qDueToCalve.Sql.Clear;
                    qDueToCalve.Sql.Add('SELECT * FROM DueToCalve');
                    if cbPeriodBetween.Checked then
                       begin
                          if (CalveDateFrom.Date > 0) and (CalveDateTo.Date > 0) then
                             qDueToCalve.SQL.Add('WHERE ( DueToCalve BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,CalveDateFrom.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,CalveDateTo.Date) + '''' + ')')
                          else if (CalveDateFrom.Date <= 0) and (CalveDateTo.Date > 0) then
                             qDueToCalve.SQL.Add('WHERE ( DueToCalve <= ' + '''' + FormatDateTime(cUSDateStyle,CalveDateTo.Date) + '''' + ')')
                          else if (CalveDateFrom.Date > 0 ) and (CalveDateTo.Date <= 0) then
                             qDueToCalve.SQL.Add('WHERE ( DueToCalve >= ' + '''' + FormatDateTime(cUSDateStyle,CalveDateFrom.Date) + '''' + ')');
                       end
                    else
                       qDueToCalve.SQL.Add('WHERE ( DueToCalve <= ' + '''' + FormatDateTime(cUSDateStyle,CalveDateFrom.Date) + '''' + ')');

                    //   23/11/20 [V5.9 R7.5] /MK Additional Feature - Filter out animals due to calve by service type.
                    if ( cmboServiceType.ItemIndex > 0 ) and ( Length(cmboServiceType.Text) > 0 ) then
                       begin
                          ServiceType := UpperCase(cmboServiceType.Text);
                          if ( Pos('ART',UpperCase(ServiceType)) > 0 ) then
                             ServiceType := 'AI'
                          else if ( Pos('NAT',UpperCase(ServiceType)) > 0 ) then
                             ServiceType := 'NAT'
                          else if ( Pos('EMB',UpperCase(ServiceType)) > 0 ) then
                             ServiceType := 'ET';
                          qDueToCalve.SQL.Add('AND   (Upper(ServiceType) = "'+ServiceType+'")');
                       end;

                    // Set the Sort Order of the Query

                    if rgDueCalveSortBy.ItemIndex = 0 then
                       qDueToCalve.Sql.Add('ORDER BY SortAnimalNo')
                    else if rgDueCalveSortBy.ItemIndex = 1 then
                       qDueToCalve.Sql.Add('ORDER BY SortNatID')
                    else if rgDueCalveSortBy.ItemIndex = 2 then
                       qDueToCalve.Sql.Add('ORDER BY DueToCalve');

                    if rgDueCalveSortOrder.ItemIndex = 0 then
                       qDueToCalve.Sql.Add('Asc')
                    else if rgDueCalveSortOrder.ItemIndex = 1 then
                       qDueToCalve.Sql.Add('Desc');

                    qDueToCalve.Open;
                    if ( FAddReportToCart ) then
                       begin
                          SetLength(FAnimalCartArray,qDueToCalve.RecordCount);
                          First;
                          while ( not(qDueToCalve.Eof) ) do
                             try
                                if ( not(FAnimalCartArrayIndex = qDueToCalve.RecordCount) ) then
                                   begin
                                      FAnimalCartArray[FAnimalCartArrayIndex] := qDueToCalve.FieldByName('AnimalID').AsInteger;
                                      Inc(FAnimalCartArrayIndex);
                                   end;
                                qDueToCalve.Next;
                             except

                             end;
                       end;
                 end;

              if cbPeriodBetween.Checked then    //joanne tighe bug fix 6/02/2004 changed mm/dd to dd/mm
                 begin
                    DueToCalveScr.Period.Caption := 'Period From '+FormatDateTime(cIrishDateStyle,CalveDateFrom.Date)+' To '+FormatDateTime(cIrishDateStyle,CalveDateTo.Date);
                    DueToCalveScr.BlankFormDate.Caption := 'Period From '+FormatDateTime(cIrishDateStyle,CalveDateFrom.Date)+' To '+FormatDateTime(cIrishDateStyle,CalveDateTo.Date);
                 end
              else
                 begin
                    DueToCalveScr.Period.Caption := 'For Period Ending '+FormatDateTime(cIrishDateStyle,CalveDateFrom.Date)+'';
                    DueToCalveScr.BlankFormDate.Caption := DueToCalveScr.Period.Caption;
                 end;

              {
              if DoubleSpace.Checked then
                 begin
                    DueToCalveScr.Details.Height := 24;
                    DueToCalveScr.Details.Height := 30;
                 end
              }
          end;
      EndTime := GetTickCount;
      ApplicationLog.LogDebugTickCountTimer('BuildDueToCalve TickCountTimer',StartTime,EndTime);
   finally
      LookupCalvings.Active := False;
      FreeAndNil(LookupCalvings);
      if RunWithProgressOnly then
         uProgressIndicator.ProgressIndicator.Close;
   end;
end;

procedure TActionReminderFilter.BuildDueToDryOff;
const
   NoServiceGestation = 283;
var
   Gestation : Integer;
   TestDate  : TDateTime;
   NoDaysPreg : Integer;
   PDProjDate : TDateTime;
   CheckEventDate : TDateTime;
   iMastCount : Integer;
   iAnimalHighSCCCount : Integer;

   procedure AddPostServiceOrPDHeat(AAnimalID, AAnimalLactNo : Integer);
   var
      LastCalvingDate,
      LastBullingDate,
      CheckDate : TDateTime;
   begin
      WinData.TempTable.FieldByName('PostServiceOrPDHeat').AsBoolean := False;
      LastCalvingDate := 0;
      LastBullingDate := 0;
      CheckDate := 0;

      FBreedingDataHelper.TempCalvings.Filter := '';
      FBreedingDataHelper.TempCalvings.Filtered := False;
      FBreedingDataHelper.TempCalvings.Filter := '(AnimalID = ' + IntToStr(AAnimalID) + ')  And (AnimalLactNo = ' + IntToStr(AAnimalLactNo) + ')';
      FBreedingDataHelper.TempCalvings.Filtered := True;
      if ( FBreedingDataHelper.TempCalvings.FindLast ) then
         LastCalvingDate := FBreedingDataHelper.TempCalvings.FieldByName('EventDate').AsDateTime;

      FBreedingDataHelper.TempServices.Filter := '';
      FBreedingDataHelper.TempServices.Filtered := False;
      FBreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(AAnimalID) + ')  And (AnimalLactNo = ' + IntToStr(AAnimalLactNo) + ')';
      FBreedingDataHelper.TempServices.Filtered := True;
      if ( FBreedingDataHelper.TempServices.FindLast ) then
         CheckDate := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;

      FBreedingDataHelper.TempPregDiag.Filter := '';
      FBreedingDataHelper.TempPregDiag.Filtered := False;
      FBreedingDataHelper.TempPregDiag.Filter := '(AnimalID = ' + IntToStr(AAnimalID) + ')  And (AnimalLactNo = ' + IntToStr(AAnimalLactNo) + ')';
      FBreedingDataHelper.TempPregDiag.Filtered := True;
      if ( FBreedingDataHelper.TempPregDiag.FindLast ) then
         if ( FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime > CheckDate ) then
            CheckDate := FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime;

      FBreedingDataHelper.TempBullings.Filter := '';
      FBreedingDataHelper.TempBullings.Filtered := False;
      FBreedingDataHelper.TempBullings.Filter := '(AnimalID = ' + IntToStr(AAnimalID) + ')  And (AnimalLactNo = ' + IntToStr(AAnimalLactNo) + ')';
      FBreedingDataHelper.TempBullings.Filtered := True;
      if ( FBreedingDataHelper.TempBullings.FindLast ) then
          LastBullingDate := FBreedingDataHelper.TempBullings.FieldByName('EventDate').AsDateTime;
      if ( LastBullingDate > 0 ) then
         if ( (LastBullingDate > LastCalvingDate) and (CheckDate > LastCalvingDate) and (LastBullingDate > CheckDate) ) then
            WinData.TempTable.FieldByName('PostServiceOrPDHeat').AsBoolean := ( LastBullingDate > CheckDate );
   end;

begin
    {
    Build the Due To DryOff Temporary Table Select all Events with CPregDiag type and
    a Record on the Animal file with the same ID and Lactation Number.
    }
    try
    // Open the LookUp to Milk disk Cumulatives
    if RunWithProgressOnly then
       ShowProgressIndicator('Compiling Due For Dry Off Report, please wait...', 0,0,1);

       WinData.LookUpMilkDisk.Open;

       With WinData.TempTable Do
          begin
              Close;
              TableType := ttParadox;
              TableName := 'DueToDryOff';

              FieldDefs.Clear;
              // FieldDefs.Add('DueID',ftAutoInc,0,TRUE);
              FieldDefs.Add('AnimalID',ftInteger,0,False);
              FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
              FieldDefs.Add('AnimalNo',ftString,10,False);
              FieldDefs.Add('SortAnimalNo',ftString,10,False); //joanne tighe 9/02/2004
              FieldDefs.Add('EventId',ftInteger,0,False);
              FieldDefs.Add('EventDate',ftDate,0,False);
              FieldDefs.Add('LastCalvDate',ftDate,0,False);
              FieldDefs.Add('BullUsed',ftString,10,False);
              FieldDefs.Add('ServiceType',ftString,10,False);
              FieldDefs.Add('DaysInMilk',ftFloat,0,False);
              FieldDefs.Add('DaysToCalving',ftInteger,0,False);
              FieldDefs.Add('DueToCalve',ftDate,0,False);
              FieldDefs.Add('PD',ftString,9,False);
              FieldDefs.Add('DriedOffOn',ftDate,0,False);
              FieldDefs.Add('IsDry',ftBoolean,0,False);
              FieldDefs.Add('CurrRec',ftFloat,0,False);
              FieldDefs.Add('LatestSCC',ftFloat,0,False);
              FieldDefs.Add('SDriedOffOn',ftDate,0,False);
              FieldDefs.Add('PDriedOffOn',ftDate,0,False);
              FieldDefs.Add('PostServiceOrPDHeat',ftBoolean,0,False);
              FieldDefs.Add('HighScc',ftInteger,0,False);
              FieldDefs.Add('MastIncid',ftInteger,0,False);

              IndexDefs.Clear;
              //IndexDefs.Add('','DueID',[ixPrimary, ixUnique]);
              //IndexDefs.Add('iDueDate','DueToCalve',[ixCaseInsensitive]);
              IndexDefs.Add('','AnimalID',[ixPrimary, ixUnique]);
              CreateTable;
              Open;

              with DueForDryingOffScr do
                 begin
                    qDueForDryingOff.SQL.Clear;
                    qDueForDryingOff.Close;
                    // Select Events of Service type and their associated Animal file info.    //joanne tighe 9/02/2004
                    qDueForDryingOff.SQL.Add('SELECT DISTINCT ID, AnimalID, AnimalLactNo, AnimalNo, AnimalLactNo, SortAnimalNo, EventDate From');
                    qDueForDryingOff.SQL.Add('"Animals.db" A, "Events.db" E');  //joanne tighe 9/02/2004
                    qDueForDryingOff.SQL.Add('WHERE ((E.EventType = ' + IntToStr(CServiceEvent) + ') ');
                    qDueForDryingOff.SQL.Add('OR     (E.EventType = ' + IntToStr(CPregDiagEvent) + ')) ');
                    qDueForDryingOff.SQL.Add('AND (E.AnimalID=A.ID)');
                    qDueForDryingOff.SQL.Add('AND (E.AnimalLactNo = A.LactNo)');
                    qDueForDryingOff.SQL.Add('AND (A.InHerd = TRUE)');
                    qDueForDryingOff.SQL.Add('AND (A.Breeding = TRUE)');
                    qDueForDryingOff.SQL.Add('AND (A.LactNo > 0)');
                    qDueForDryingOff.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                    qDueForDryingOff.SQL.Add('AND ( NOT (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                    if Length(cbDefaultHerd.Value) > 0 then
                       if cbDefaultHerd.Value <> '0' then
                          qDueForDryingOff.SQL.Add('And (A.HerdID = ' + cbDefaultHerd.Value + ')');

                    if ( cbFilter.Checked ) and ( WinData.FilteredAnimals.RecordCount > 0 ) then
                       begin
                           qDueForDryingOff.SQL.Add('AND A.ID IN (SELECT AF.AID FROM AFILTERS AF)');
                       end;

                    if ( not(HerdLookup.qInHerdDailyMilkDiskTransInfo.Active) ) then
                       begin
                          HerdLookup.qInHerdDailyMilkDiskTransInfo.Params[0].AsInteger := WinData.UserDefaultHerdID;
                          HerdLookup.qInHerdDailyMilkDiskTransInfo.Open;
                       end;
                    HerdLookup.qInHerdDailyMilkDiskTransInfo.Filter := '';
                    HerdLookup.qInHerdDailyMilkDiskTransInfo.Filtered := False;

                    // Store Animals with PD record for the Current Lactation in the TEMP Table
                    qDueForDryingOff.Open;
                    qDueForDryingOff.First;

                    if RunWithProgressOnly then
                       begin
                          ProgressIndicator.Max := qDueforDryingOff.RecordCount;
                       end
                    else
                       begin
                          pbCount.Min := 0;
                          pbCount.Max := qDueforDryingOff.RecordCount;
                       end;

                    while NOT qDueForDryingOff.EOF do
                       begin
                          Try
                             if NOT WinData.TempTable.Locate('AnimalID',
                                    qDueForDryingOff.FieldByName('AnimalID').AsInteger,[]) then
                                begin
                                   WinData.TempTable.Insert;
                                   WinData.TempTable.FieldByName('AnimalId').AsInteger := qDueForDryingOff.FieldByName('AnimalID').AsInteger;
                                   WinData.TempTable.FieldByName('AnimalLactNo').AsInteger := qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger;
                                   WinData.TempTable.FieldByName('EventID').AsInteger := qDueForDryingOff.FieldByName('ID').AsInteger;
                                   WinData.TempTable.FieldByName('EventDate').AsDateTime := qDueForDryingOff.FieldByName('EventDate').AsDateTime;
                                   WinData.TempTable.FieldByName('AnimalNo').AsString := qDueForDryingOff.FieldByName('AnimalNo').AsString;
                                   WinData.TempTable.FieldByName('SortAnimalNo').AsString := qDueForDryingOff.FieldByName('SortAnimalNo').AsString; //joanne tighe 9/02/2004

                                   // Get the Last Service Record
                                   FBreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger) + ')';
                                   FBreedingDataHelper.TempServices.Filtered := True;
                                   try
                                      if FBreedingDataHelper.TempServices.FindLast then
                                         begin
                                            Gestation := 283;
                                            TestDate := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
                                            Showdate := DateToStr(TestDate);
                                            // Check the Calving Record for the Bull used in last service
                                            if WinData.LookUpServices.Locate('EventID', FBreedingDataHelper.TempServices.FieldByName('EventID').AsInteger,[]) then
                                               begin
                                                  Gestation := FBreedingDataHelper.GetGestation(WinData.LookUpServices.FieldByName('ServiceBull').AsInteger);
                                                  // Bull Used
                                                  if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                                                     WinData.TempTable.FieldByName('BullUsed').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                                  // Service Type
                                                  if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[] ) then
                                                     WinData.TempTable.FieldByName('ServiceType').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                               end;
                                            TestDate := TestDate + Gestation;

                                            // Projected Date
                                            WinData.TempTable.FieldByName('DueToCalve').AsDateTime := TestDate;
                                            // No of Days to Calving negitive indicates past projected Calving Date
                                            WinData.TempTable.FieldByName('DaysToCalving').Value := ( TestDate - Now() );
                                            // Calculate the Drying Off Date from the Projected Date less the user inputted days
                                            WinData.TempTable.FieldByName('DriedOffOn').AsDateTime := (TestDate - DaysForDryingOff.AsInteger);
                                            WinData.TempTable.FieldByName('SDriedOffOn').AsDateTime := WinData.TempTable.FieldByName('DriedOffOn').AsDateTime;
                                         end;
                                      finally
                                         FBreedingDataHelper.TempServices.Filter := '';
                                         FBreedingDataHelper.TempServices.Filtered := False;
                                      end;

                                      FBreedingDataHelper.TempPregDiag.Filter := '(AnimalID = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger) + ')';
                                      FBreedingDataHelper.TempPregDiag.Filtered := True;
                                      try
                                         if FBreedingDataHelper.TempPregDiag.FindLast then
                                            if WinData.LookUpPDs.Locate('EventID', FBreedingDataHelper.TempPregDiag.FieldByName('EventID').AsInteger, []) then
                                               begin
                                                  if ((WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean) AND
                                                      (WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger > 0)) then
                                                      begin
                                                         if Gestation = 0 then
                                                            Gestation := NoServiceGestation;
                                                         TestDate := FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime;
                                                         NoDaysPreg := WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger;
                                                         if NoDaysPreg > 0 then
                                                            begin
                                                               if ( NoDaysPreg >= 0 ) and ( NoDaysPreg <= 283 ) then
                                                                  PDProjDate := TestDate + ( Gestation - NoDaysPreg) // Projected Date
                                                               else
                                                                  PDProjDate := TestDate + Gestation; // Projected Date

                                                               // Projected Date
                                                               WinData.TempTable.FieldByName('DueToCalve').AsDateTime := PDProjDate;
                                                               // No of Days to Calving negitive indicates past projected Calving Date
                                                               WinData.TempTable.FieldByName('DaysToCalving').Value := ( PDProjDate - Now() );

                                                               if ( PDProjDate > 0 ) and ( DaysForDryingOff.AsInteger > 0 ) then
                                                               WinData.TempTable.FieldByName('DriedOffOn').AsDateTime := PDProjDate - DaysForDryingOff.AsInteger;
                                                               WinData.TempTable.FieldByName('PDriedOffOn').AsDateTime := WinData.TempTable.FieldByName('DriedOffOn').AsDateTime;
                                                            end
                                                      end;
                                               end;
                                      finally
                                         //Clear the Filter
                                         FBreedingDataHelper.TempPregDiag.Filter := '';
                                         FBreedingDataHelper.TempPregDiag.Filtered := False;
                                      end;

                                   WinData.TempTable.FieldByName('IsDry').AsBoolean := FBreedingDataHelper.TempDryingOffs.Locate('AnimalId;AnimalLactNo',
                                                                                                                                 VarArrayOf
                                                                                                                                 ([qDueForDryingOff.FieldByName('AnimalID').AsInteger,
                                                                                                                                   qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger]),[]);

                                   WinData.GetProjCalving(WinData.TempTable.FieldByName('AnimalId').AsInteger,
                                                          WinData.TempTable.FieldByName('AnimalLactNo').AsInteger, NumCalves, IsPreg );
                                   if ( Length(IsPreg) > 0 ) then
                                      begin
                                         if ( NumCalves = 1 ) then
                                            WinData.TempTable.FieldByName('PD').AsString := IsPreg
                                         else if ( NumCalves > 1 ) and ( UpperCase(IsPreg) = 'YES' ) then
                                            // set caption to Twins, irrespectful of NumCalves count. ignoring fact might be triplets or other
                                            WinData.TempTable.FieldByName('PD').AsString := 'Twins';
                                      end;

                                   // Calcalate the Calving Index - Last Calving Date - Last Service Date
                                   // Get the Birth Type of the previous Calving
                                   FBreedingDataHelper.TempCalvings.Filter := '';
                                   FBreedingDataHelper.TempCalvings.Filtered := False;
                                   FBreedingDataHelper.TempCalvings.Filter :=  '(AnimalID = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger) + ')';
                                   FBreedingDataHelper.TempCalvings.Filtered := True;
                                   if ( FBreedingDataHelper.TempCalvings.FindLast ) then
                                      WinData.TempTable.FieldByName('LastCalvDate').AsDateTime := FBreedingDataHelper.TempCalvings.FieldByName('EventDate').AsDateTime;

                                   //   18/11/15 [V5.5 R0.8] /MK Additional Feature - If cbIncludeHeatsAfterServiceOrPD.Checked then check to see if animal has had a post pd or service heat.
                                   if ( cbIncludeHeatsAfterServiceOrPD.Checked ) then
                                      AddPostServiceOrPDHeat(qDueForDryingOff.FieldByName('AnimalID').AsInteger,
                                                             qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger);

                                   // Get the Latest Daily Recording .. SP 1/9/00
                                   if WinData.LookUpMilkDisk.Locate('AnimalId;LactNo',VarArrayOf([qDueForDryingOff.FieldByName('AnimalID').AsInteger,qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger]),[] ) then
                                      begin
                                         //   16/10/19 [V5.9 R0.9] /MK Change - DaysInMilk should not be Date - LastCalvDate+1 - SP/GL - same as main grid.
                                         WinData.TempTable.FieldByName('DaysInMilk').AsFloat := Date - WinData.TempTable.FieldByName('LastCalvDate').AsDateTime;           //SP
                                         WinData.TempTable.FieldByName('LatestSCC').AsFloat := WinData.LookUpMilkDisk.FieldByName('SCC').AsFloat;
                                      end;

                                   iAnimalHighSCCCount := 0;
                                   //   30/06/20 [V5.9 R4.9] /MK Bug Fix - Clear the filter of the query before checking record count as if the filter is applied the record count takes the filtered record count.
                                   HerdLookup.qInHerdDailyMilkDiskTransInfo.Filter := '';
                                   HerdLookup.qInHerdDailyMilkDiskTransInfo.Filtered := False;
                                   if ( HerdLookup.qInHerdDailyMilkDiskTransInfo.RecordCount > 0 ) then
                                      begin
                                         HerdLookup.qInHerdDailyMilkDiskTransInfo.Filter := 'AnimalID = '+IntToStr(qDueForDryingOff.FieldByName('AnimalID').AsInteger);
                                         HerdLookup.qInHerdDailyMilkDiskTransInfo.Filtered := True;
                                         if ( HerdLookup.qInHerdDailyMilkDiskTransInfo.FindFirst ) then
                                            begin
                                               WinData.TempTable.FieldByName('CurrRec').AsFloat := HerdLookup.qInHerdDailyMilkDiskTransInfo.FieldByName('DailyYield').AsFloat;
                                               if ( HerdLookup.qInHerdDailyMilkDiskTransInfo.FieldByName('SCC').AsFloat > cHighestSCC ) then
                                                  Inc(iAnimalHighSCCCount);
                                               while ( HerdLookup.qInHerdDailyMilkDiskTransInfo.FindNext ) do
                                                  if ( HerdLookup.qInHerdDailyMilkDiskTransInfo.FieldByName('SCC').AsFloat > cHighestSCC ) then
                                                     Inc(iAnimalHighSCCCount);
                                            end;
                                      end;
                                   if ( iAnimalHighSCCCount > 0 ) then
                                      WinData.TempTable.FieldByName('HighSCC').AsInteger := iAnimalHighSCCCount;

                                   if ( FCountry = Ireland ) then
                                      iMastCount := HerdLookup.GetICBFAPIEventCountByAnimal(cICBFAPI_Mastitis,qDueForDryingOff.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('LastCalvDate').AsDateTime)
                                   else
                                      iMastCount := HerdLookup.GetMastitisEventCountByAnimal(qDueForDryingOff.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('LastCalvDate').AsDateTime);
                                   if ( iMastCount > 0 ) then
                                      WinData.TempTable.FieldByName('MastIncid').AsInteger := iMastCount;

                                   // post last record to table
                                   if qDueForDryingOff.RecNo = qDueForDryingOff.RecordCount then
                                      WinData.TempTable.Post;       // ?????
                                end;

                             if RunWithProgressOnly then
                                ProgressIndicator.Position := qDueforDryingOff.RecNo
                             else
                                begin
                                   pbCount.Min := 0;
                                   pbCount.Position := qDueforDryingOff.RecNo;
                                end;

                             Application.ProcessMessages;
                             Update;

                             qDueForDryingOff.Next;
                          except
                             WinData.TempTable.Cancel;
                             qDueForDryingOff.Next;
                          end;
                       end;

                    if ( HerdLookup.qInHerdDailyMilkDiskTransInfo.Active ) then
                       HerdLookup.qInHerdDailyMilkDiskTransInfo.Close;

                    // ReSet the Query for the Report
                    qDueForDryingOff.Sql.Clear;
                    qDueForDryingOff.Sql.Add('Select DISTINCT  * from DueToDryOff');
                    qDueForDryingOff.SQL.Add('Where (DriedOffOn <= ' + '''' + FormatDateTime(cUSDateStyle,DryingDate.Date) + '''' +')');
                    qDueForDryingOff.SQL.Add('And   ( (PD = "Yes") Or (PD = "Twins") Or (PD = "UnDefined")'); // << 06/01/2009 [Rel V3.9 R4.8, Dev V3.9 R5.6] Bug Fix /SP - "OR PD = Twins"
                    if ( cbIncludeNotPreg.Checked ) then
                       qDueForDryingOff.SQL.Add('                 Or (PD = "No") )   ')
                    else if ( cbIncludeHeatsAfterServiceOrPD.Checked ) then
                       qDueForDryingOff.SQL.Add('                 Or ((PD = "No") AND (PostServiceOrPDHeat = TRUE)) )   ')
                    else
                       qDueForDryingOff.SQL.Add('                 )                  ');
                    qDueForDryingOff.SQL.Add('And (IsDry = False)');
                    if NOT ( OlderCows.Checked And FirstLactCows.Checked ) then
                       begin
                          if OlderCows.Checked then
                             qDueForDryingOff.Sql.Add('And ( AnimalLactNo > 1 )')
                          else
                             qDueForDryingOff.Sql.Add('And ( AnimalLactNo = 1 )');
                       end;

                    if ( rgDryOffSortBy.ItemIndex = 0 ) then
                       qDueForDryingOff.Sql.Add('Order By SortAnimalNo')
                    else
                       qDueForDryingOff.Sql.Add('Order By DueToCalve');

                    if ( rgDryOffSortOrder.ItemIndex = 0 ) then
                       qDueForDryingOff.Sql.Add('Asc')
                    else
                       qDueForDryingOff.Sql.Add('Desc');

                    qDueForDryingOff.Open;

                    if ( FAddReportToCart ) then
                       begin
                          SetLength(FAnimalCartArray,qDueForDryingOff.RecordCount);
                          First;
                          while ( not(qDueForDryingOff.Eof) ) do
                             try
                                if ( not(FAnimalCartArrayIndex = qDueForDryingOff.RecordCount) ) then
                                   begin
                                      FAnimalCartArray[FAnimalCartArrayIndex] := qDueForDryingOff.FieldByName('AnimalID').AsInteger;
                                      Inc(FAnimalCartArrayIndex);
                                   end;
                                qDueForDryingOff.Next;
                             except

                             end;
                       end;
                 end;

              DueForDryingOffScr.Period.Caption := 'Up To ' +  DryingDate.Text;
              DueForDryingOffScr.BlankFormDate.Caption := 'Up To ' +  DryingDate.Text;
              //if DryingDoubleSpace.Checked then
                 //DueForDryingOffScr.QRSubDetail1.Height := 30;

              if ( cbDryOffDoubleSpacing.Checked ) then
                 DueForDryingOffScr.QRSubDetail1.Height := 50;
          end;
    finally
       // Close the LookUp to Milk disk Cumulatives
       WinData.LookUpMilkDisk.Close;
    end;
    if RunWithProgressOnly then
       uProgressIndicator.ProgressIndicator.Close;
end;

procedure TActionReminderFilter.BuildDueFirstService;
Var
   iPlannedBullId,
   Gestation,
   cHeatCycle : Integer;
   LookupCalvings : TTable;
begin

    if RunWithProgressOnly then
       ShowProgressIndicator('Compiling Due Service Report, please wait...', 0,0,1);

    WinData.LookUpMilkDisk.Open;
    {
    Build the Due To DryOff Temporary Table Select all Events with CPregDiag type and
    a Record on the Animal file with the same ID and Lactation Number.
    }
    TestDate := Date();
    CutOffDate := Date()-365;
    DueFirstServiceScr.Period.Caption := 'Period ' + FormatDateTime(cIrishDateStyle,FromServiceDate.Date) + ' to ' + FormatDateTime(cIrishDateStyle,ToServiceDate.Date);
    DueFirstServiceScr.PeriodExtended.Caption := 'Period ' + FormatDateTime(cIrishDateStyle,FromServiceDate.Date) + ' to ' + FormatDateTime(cIrishDateStyle,ToServiceDate.Date);
    DueFirstServiceScr.BlankFormDate.Caption := 'Period ' + FormatDateTime(cIrishDateStyle,FromServiceDate.Date) + ' to ' + FormatDateTime(cIrishDateStyle,ToServiceDate.Date);
    DueFirstServiceScr.OverDueCutOffDate := FromServiceDate.Date;

    WinData.CreateTTable(LookupCalvings, nil, '', WinData.Calvings.TableName);
    LookupCalvings.Active := True;
    try
       with WinData.TempTable do
          begin
              Close;
              TableType := ttParadox;
              TableName := 'DueFirstService';

              FieldDefs.Clear;
              FieldDefs.Add('AnimalID',ftInteger,0,False);
              FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
              FieldDefs.Add('AnimalNo',ftString,10,False);
              FieldDefs.Add('SortAnimalNo',ftString,10,False);
              FieldDefs.Add('DOB',ftDate,0,False);
              FieldDefs.Add('LastCalvDate',ftDate,0,False);
              FieldDefs.Add('LastCalvType',ftString,10,False);
              FieldDefs.Add('PlannedBull',ftString,10,False);
              FieldDefs.Add('DaysInMilk',ftFloat,0,False);
              FieldDefs.Add('DueService',ftDate,0,False);
              FieldDefs.Add('NextObsDate',ftDate,0,False);
              FieldDefs.Add('DriedOffOn',ftDate,0,False);
              FieldDefs.Add('NextHeat',ftDate,0,False);
              FieldDefs.Add('PrevYield',ftFloat,0,False);
              FieldDefs.Add('RepType',ftString,1,False);
              FieldDefs.Add('DueAfter',ftDate,0,False);
              FieldDefs.Add('NoServes',ftInteger,0,False);
              FieldDefs.Add('LastBull',ftString,10,False);
              FieldDefs.Add('DaysToService',ftFloat,0,False);
              FieldDefs.Add('AvgDailyYield',ftFloat,0,False);
              FieldDefs.Add('LastService',ftDate,0,False);
              FieldDefs.Add('Include',ftBoolean,0,False);
              FieldDefs.Add('LastServiceDate',ftDate,0,False);
              FieldDefs.Add('HeatDate',ftDate,0,False);
              FieldDefs.Add('Category',ftInteger,0,False);
              FieldDefs.Add('ServiceType', ftString, 10, False); { SP 27/11/2002 }
              FieldDefs.Add('OverDue', ftBoolean);
              FieldDefs.Add('DaysSinceLastHeat',ftInteger,0,False);

              IndexDefs.Clear;
              CreateTable;
              Open;

              with DueFirstServiceScr do
                 begin
                    with qDueFirstService do
                      begin
                        SQL.Clear;
                        Close;

                        // Select Events of Service type and their associated Animal file info.
                        SQL.Add('INSERT INTO DueFirstService (AnimalID, AnimalLactNo, AnimalNo, SortAnimalno, DOB)');
                        SQL.Add('SELECT DISTINCT ID, LactNo, AnimalNo, SortAnimalNo, DateOfBirth');
                        SQL.Add('FROM "Animals.db" A');
                        SQL.Add('WHERE (A.InHerd = TRUE)');

                        //   17/01/13 [V5.1 R3.8] /MK Change - Removed 1 Year Old restriction - GL.
                        // They are OVER 1 year old
                        //SQL.Add('AND ((A.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle,CutOffDate) + '''' + ')');
                        //SQL.Add('OR   ((A.DateOfBirth Is Null) And (A.LactNo > 0 )) )');

                        SQL.Add('AND (A.Sex = "Female")');
                        SQL.Add('AND (A.Breeding = TRUE)');
                        SQL.Add('AND (A.AnimalDeleted=FALSE)');
                        SQL.Add('And ( NOT (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                        if Length(cbDefaultHerd.Value) > 0 then
                           if cbDefaultHerd.Value <> '0' then
                              SQL.Add('And (A.HerdID = ' + cbDefaultHerd.Value + ')');
                        if ( cbFilter.Checked ) and ( WinData.FilteredAnimals.RecordCount > 0 ) then
                           begin
                               SQL.Add('AND A.ID IN (SELECT AF.AID FROM AFILTERS AF)');
                           end;

                        ExecSQL;
                      end;

                    if RunWithProgressOnly then
                       ProgressIndicator.Max := WinData.TempTable.RecordCount
                    else
                       begin
                          pbCount.Min := 0;
                          pbCount.Max := WinData.TempTable.RecordCount;
                       end;

                    DueServiceNoAnimalNoCount := 0;
                    DueServiceNoBreedingHistoryCount := 0;

                    WinData.TempTable.First;
                    while NOT WinData.TempTable.EOF do
                       begin
                          WinData.TempTable.FieldByName('AnimalNo').AsString;
                          WinData.TempTable.Edit;
                          WinData.TempTable.FieldByName('Include').AsBoolean := FALSE;
                          // See if the Animal has been served
                          IsServed := FALSE;
                          FBreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(WinData.TempTable.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(WinData.TempTable.FieldByName('AnimalLactNo').AsInteger) + ')';
                          FBreedingDataHelper.TempServices.Filtered := True;
                          if FBreedingDataHelper.TempServices.FindLast then
                             begin
                                IsServed := TRUE;
                                WinData.TempTable.FieldByName('DueAfter').AsDateTime := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime + Cycle; // ???????
                                WinData.TempTable.FieldByName('NoServes').AsInteger := FBreedingDataHelper.TempServices.RecordCount;
                                WinData.TempTable.FieldByName('LastService').AsDateTime := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
                                WinData.TempTable.FieldByName('DaysToService').AsFloat := (TestDate-WinData.TempTable.FieldByName('LastService').AsDateTime);
                                if WinData.LookUpServices.Locate('EventID',FBreedingDataHelper.TempServices.FieldByName('EventID').AsInteger,[] ) then
                                   if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[]) then
                                      WinData.TempTable.FieldByName('LastBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[]) then
                                   WinData.TempTable.FieldByName('ServiceType').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                             end;
                          FBreedingDataHelper.TempServices.Filter := '';
                          FBreedingDataHelper.TempServices.Filtered := False;

                          IsPregnant := FALSE;

                          { 03/03/2009 [Dev V3.9 R6.5] /SP Program Change }
                          { Do not check if animal is served before checking if animal is pregnant SP/GL 03/03/2009 }
                          //if IsServed then
                             //begin
                                // See if the Animal is Pregnant
                          FBreedingDataHelper.TempPregDiag.Filter := '(AnimalID = ' + IntToStr(WinData.TempTable.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(WinData.TempTable.FieldByName('AnimalLactNo').AsInteger) + ')';
                          FBreedingDataHelper.TempPregDiag.Filtered := True;
                          try
                             if FBreedingDataHelper.TempPregDiag.FindLast then
                                if WinData.LookUpPDs.Locate('EventID',FBreedingDataHelper.TempPregDiag.FieldByName('EventID').AsInteger,[] ) then
                                   IsPregnant := WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean;
                          finally
                             FBreedingDataHelper.TempPregDiag.Filter := '';
                             FBreedingDataHelper.TempPregDiag.Filtered := False;
                          end;
                             //end;

                          // Check for Dried Off
                          IsDry := FALSE;
                          if FBreedingDataHelper.TempDryingOffs.Locate('AnimalId;AnimalLactNo',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('AnimalLactNo').AsInteger]),[]) then
                             begin
                                IsDry := TRUE;
                                WinData.TempTable.FieldByName('DriedOffOn').AsDateTime := FBreedingDataHelper.TempDryingOffs.FieldByName('EventDate').AsDateTime;
                             end;

                          // Check for heat/bulling date and the Planned Bull
                          HasHeat := FALSE;
                          FBreedingDataHelper.TempBullings.Filter := '(AnimalID = ' + IntToStr(WinData.TempTable.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(WinData.TempTable.FieldByName('AnimalLactNo').AsInteger) + ')';
                          FBreedingDataHelper.TempBullings.Filtered := True;
                          if FBreedingDataHelper.TempBullings.FindLast then
                             begin
                                HasHeat := TRUE;
                                WinData.TempTable.FieldByName('HeatDate').AsDateTime := FBreedingDataHelper.TempBullings.FieldByName('EventDate').AsDateTime;
                                if WinData.LookUpBullings.Locate('EventID',FBreedingDataHelper.TempBullings.FieldByName('EventID').AsInteger,[]) then
                                   if ( WinData.TempTable.FieldByName('HeatDate').AsDateTime < Date ) then
                                      WinData.TempTable.FieldByName('DaysSinceLastHeat').AsInteger := ( Trunc(Date - WinData.TempTable.FieldByName('HeatDate').AsDateTime) );
                                {
                                // 17/05/17 [V5.6 R8.1] /MK Bug Fix - If the animal has had a heat and bull was specified then this should not be the last bull on the report
                                //                                    as farmers don't record bulls in a heat event - GL request.
                                // get the Previous Bull used
                                if WinData.LookUpBullings.FindPrior then
                                   if WinData.LookUpBullings.Locate('EventID',FBreedingDataHelper.TempBullings.FieldByName('EventID').AsInteger,[]) then
                                      if WinData.LookUpDamSire.Locate('ID',WinData.LookUpBullings.FieldByName('PlannedBull').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                }
                             end;
                          FBreedingDataHelper.TempBullings.Filter := '';

                          WinData.TempTable.FieldByName('DaysInMilk').AsFloat := 0;
                          // Check the last Calving type
                          HasCalvingEvent := FALSE;
                          if FBreedingDataHelper.TempCalvings.Locate('AnimalId;AnimalLactNo',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('AnimalLactNo').AsInteger]),[]) then
                             begin
                                HasCalvingEvent := TRUE;
                                WinData.TempTable.FieldByName('DaysInMilk').AsFloat := (TestDate-FBreedingDataHelper.TempCalvings.FieldByName('EventDate').AsDateTime);
                                WinData.TempTable.FieldByName('LastCalvDate').AsDateTime := FBreedingDataHelper.TempCalvings.FieldByName('EventDate').AsDateTime;
                                if LookUpCalvings.Locate('EventId',FBreedingDataHelper.TempCalvings.FieldByName('EventID').AsInteger,[]) then
                                   begin
                                      if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID1').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastCalvType').AsString := Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                      if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID2').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastCalvType').AsString := WinData.TempTable.FieldByName('LastCalvType').AsString + '/' +
                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                      if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID3').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastCalvType').AsString := WinData.TempTable.FieldByName('LastCalvType').AsString + '/' +
                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                      if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID4').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastCalvType').AsString := WinData.TempTable.FieldByName('LastCalvType').AsString + '/' +
                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                   end;
                             end;

                          ServiceDue;

                          // Get the Milk Production Info for the Last Lactation.
                          if WinData.TempTable.FieldByName('Include').AsBoolean then
                             begin
                                if WinData.LookUpMilkDisk.Locate('AnimalId;LactNo',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('AnimalLactNo').AsInteger-1]),[]) then
                                   begin
                                      WinData.TempTable.FieldByName('PrevYield').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat;
                                      if WinData.LookUpMilkDisk.FieldByName('DaysInMilk').AsFloat > 0 then
                                         WinData.TempTable.FieldByName('AvgDailyYield').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat / WinData.LookUpMilkDisk.FieldByName('DaysInMilk').AsFloat
                                      else
                                         WinData.TempTable.FieldByName('AvgDailyYield').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat;
                                   end;
                             end;

                          //   05/12/13 [V5.2 R6.7] /MK Additional Feature - Check if cow/heifer has ToBeCulled event in current lactation.
                          if FBreedingDataHelper.TempToBeCulled.Locate('AnimalId;AnimalLactNo',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,
                                                                                                           WinData.TempTable.FieldByName('AnimalLactNo').AsInteger]),[]) then
                             begin
                                // If cbIncludeCullCows.Checked then include the cow/heifer if not already included.
                                if ( cbIncludeCullCows.Checked ) then
                                   begin
                                      if ( not(WinData.TempTable.FieldByName('Include').AsBoolean) ) then
                                         WinData.TempTable.FieldByName('Include').AsBoolean := True;
                                   end
                                // If cbIncludeCullCows.NotChecked then exclude the cow/heifer if already included.
                                else if ( not(cbIncludeCullCows.Checked) ) then
                                   begin
                                      if ( WinData.TempTable.FieldByName('Include').AsBoolean ) then
                                         WinData.TempTable.FieldByName('Include').AsBoolean := False;
                                   end
                             end;

                          iPlannedBullId := WinData.EventDataHelper.GetPlannedBull(WinData.TempTable.FieldByName('AnimalID').AsInteger,
                                                                                   WinData.TempTable.FieldByName('AnimalLactNo').AsInteger);
                          if ( iPlannedBullId > 0 ) then
                             if ( WinData.LookUpDamSire.Locate('ID',iPlannedBullID,[]) ) then
                                WinData.TempTable.FieldByName('PlannedBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;

                          if RunWithProgressOnly then
                             ProgressIndicator.Position := WinData.TempTable.RecNo
                          else
                             begin
                                pbCount.Min := 0;
                                pbCount.Position := WinData.TempTable.RecNo;
                             end;

                          Application.ProcessMessages;
                          Update;

                          WinData.TempTable.Next;
                       end;

                    // ReSet the Query for the Report
                   with qDueFirstService do
                      begin
                         Sql.Clear;
                         Sql.Add('DELETE FROM DueFirstService');
                         SQL.Add('WHERE (Include=False) ');
                         ExecSql;
                      end;
                    // Report Types
                    if NOT ( cbNoheatsServices.Checked ) then
                       with qDueFirstService do
                          begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE (RepType="F")');
                            ExecSql;
                          end;
                    if NOT ( cbReHeatsNotServed.Checked ) then
                       with qDueFirstService do
                          begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE (RepType="H")');
                            ExecSql;
                       end;
                    if NOT ( cbRepeatService.Checked ) then
                       with qDueFirstService do
                          begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE (RepType="R")');
                            ExecSql;
                       end;

                   if not ( ExcludeOver.Checked ) then // Exclude animals with Due service after ToServiceDate
                      begin
                         with qDueFirstService do
                            begin
                               Sql.Clear;
                               Sql.Add('DELETE FROM DueFirstService');
                               SqL.Add('WHERE ( DueService > ' + '''' + FormatDateTime(cUSDateStyle,ToServiceDate.Date) + '''' + ')');
                               ExecSql;
                            end;
                      end
                   else
                      with qDueFirstService do // Exclude animals with Due service outside of date range.
                         begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE ( DueService < ' + '''' + FormatDateTime(cUSDateStyle,FromServiceDate.Date) + '''' + ') ');//OR (OverDue = TRUE) ');
                            ExecSql;
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE ( DueService > ' + '''' + FormatDateTime(cUSDateStyle,ToServiceDate.Date)   + '''' + ') ');//OR (OverDue = TRUE) ');
                            ExecSql;
                         end;

                   if NOT ( FirstServeIncCows.Checked ) then
                      with qDueFirstService do
                         begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            SQL.Add('WHERE AnimalLactNo > 0 ');
                            ExecSql;
                         end;

                   // Cows or Heifers
                   if NOT ( FirstServeIncHeifers.Checked ) then
                      with qDueFirstService do
                         begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            SQL.Add('WHERE AnimalLactNo = 0 ');
                            ExecSql;
                         end;

                    qDueFirstService.SQL.Clear;
                    qDueFirstService.SQL.Add('SELECT COUNT(AnimalID)');
                    qDueFirstService.SQL.Add('FROM DueFirstService');
                    qDueFirstService.SQL.Add('WHERE AnimalNo = ""');
                    qDueFirstService.SQL.Add('AND Include = True');
                    qDueFirstService.Open;
                    DueServiceNoAnimalNoCount := qDueFirstService.Fields[0].AsInteger;

                    qDueFirstService.Sql.Clear;
                    qDueFirstService.Sql.Add('SELECT DISTINCT * FROM DueFirstService');

                    // Set the Sort Order of the Query
                    if (rgServiceSortBy.ItemIndex = 0 ) then
                       qDueFirstService.Sql.Add('Order By SortAnimalNo')
                    else if (rgServiceSortBy.ItemIndex = 1 ) then
                       qDueFirstService.Sql.Add('Order By DueService')
                    else if (rgServiceSortBy.ItemIndex = 2 ) then
                       qDueFirstService.Sql.Add('Order By LastCalvDate');

                    if ( rgServiceSortOrder.ItemIndex = 0 ) then
                       qDueFirstService.Sql.Add('Asc')
                    else
                       qDueFirstService.Sql.Add('Desc');

                    QRLabel1.Enabled := cbNoheatsServices.Checked;
                    QRExpr2.Enabled := QRLabel9.Enabled;
                    QRLabel9.Enabled := cbNoheatsServices.Checked;
                    QRExpr1.Enabled := QRLabel9.Enabled;

                    qDueFirstService.Open;
                    if ( FAddReportToCart ) then
                       begin
                          SetLength(FAnimalCartArray,qDueFirstService.RecordCount);
                          First;
                          while ( not(qDueFirstService.Eof) ) do
                             try
                                if ( not(FAnimalCartArrayIndex = qDueFirstService.RecordCount) ) then
                                   begin
                                      FAnimalCartArray[FAnimalCartArrayIndex] := qDueFirstService.FieldByName('AnimalID').AsInteger;
                                      Inc(FAnimalCartArrayIndex);
                                   end;
                                qDueFirstService.Next;
                             except

                             end;
                       end;
                 end;
          end;
    finally

       pbCount.Position := 0;
       pbCount.Hide;

       WinData.LookUpMilkDisk.Close;
       LookupCalvings.Active := False;
       FreeAndNil(LookupCalvings);
       if RunWithProgressOnly then
          uProgressIndicator.ProgressIndicator.Close;
    end;
end;

procedure TActionReminderFilter.ServiceDue;
begin
   // Set default value "False", this will be overridden in CalcServiceDate if animal is over 21day cycle.
   WinData.TempTable.FieldByName('OverDue').AsBoolean := False;

   if NOT ISDry AND NOT IsPregnant then
   // See if Animal is Due First Service - Check if they have been served This Lactation
   if ( NOT IsServed ) AND (WinData.TempTable.FieldByName('HeatDate').AsDateTime = 0) then
      begin
         // Due First Service
         WinData.TempTable.FieldByName('RepType').AsString := 'F';
         if WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 then
            // If 0 lact animal, service due is Date of Birth + 730 (Xtarget) - 283 (Bullgest)
            WinData.TempTable.FieldByName('DueService').AsDateTime := WinData.TempTable.FieldByName('DOB').AsDateTime + XTARGET - BULLGEST
         else if HasCalvingEvent then
            // Calculate the service date 42 days after the last calving date.
            WinData.TempTable.FieldByName('DueService').AsDateTime := WinData.TempTable.FieldByName('LastCalvDate').AsDateTime + DaysFirstService.AsInteger
         else
            // Safety net, just in case!!
            WinData.TempTable.FieldByName('DueService').Value := Null;

         // 17/01/13 [V5.1 R3.8] /MK Change - No need to restrict report to year old animals - GL.
         // if 0 lact animal > yearold
         // if ((( WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 ) and
             //( TestDate-WinData.TempTable.FieldByName('DOB').AsDateTime > 365 ))

         // 17/01/13 [V5.1 R3.8] /MK Change - New code added to include 0 lact heifers that are due prior to to date.
         // if 0 lact animal that has a due service date before the ToServiceDate
         if ( ((WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 ) and
               (WinData.TempTable.FieldByName('DueService').AsDateTime <= ToServiceDate.Date))
         or  //  if > 0 lact animal, DueService <= User input ServiceDate, and not dried off
            ( WinData.TempTable.FieldByName('AnimalLactNo').AsInteger > 0 )) and
            ( WinData.TempTable.FieldByName('DueService').AsDateTime <= ToServiceDate.Date ) and
            (( NOT IsDry )
         or  // Cover 0 lact animal that is dry
            (( WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 ) and ( IsDry ))) then
            WinData.TempTable.FieldByName('Include').AsBoolean := TRUE;

         // If animal in safety net then show in NoBreedingHistory count on report.
         if ( WinData.TempTable.FieldByName('DueService').Value = Null ) and
            ( WinData.TempTable.FieldByName('Include').AsBoolean ) then
            Inc(DueServiceNoBreedingHistoryCount);
      end
   // Check for last bulling Date, if found calculate the due service date
   else if (NOT IsServed) AND (WinData.TempTable.FieldByName('HeatDate').AsDateTime > 0) then
      begin
         WinData.TempTable.FieldByName('RepType').AsString := 'H';
         if WinData.TempTable.FieldByName('HeatDate').AsDateTime > WinData.TempTable.FieldByName('LastCalvDate').AsDateTime then
            CalcServiceDate;
      end
   else
      begin // If they have a Service include/exclude animal and calculate DueService date
         WinData.TempTable.FieldByName('RepType').AsString := 'R';  // Due Repeat Service
{         if ( NOT IsPregnant ) And
            (( NOT IsDry ) Or ( WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 )) And
             ((( WinData.TempTable.FieldByName('DueService').AsDateTime >= TestDate) And
               ( WinData.TempTable.FieldByName('DueService').AsDateTime <= ToServiceDate.Date ))

               Or
}
{         if  (( WinData.TempTable.FieldByName('DueAfter').AsDateTime >= TestDate) And
               ( WinData.TempTable.FieldByName('DueAfter').AsDateTime <= ToServiceDate.Date )) Or
              (( IncOver.Checked ) And
               ( WinData.TempTable.FieldByName('DueService').AsDateTime <= TestDate))) then
 }
         CalcServiceDate;
      end;
end;

procedure TActionReminderFilter.CalcServiceDate;
var
   LastServiceDate,
   LastEventDate,
   DateDiff,
   LastHeatDate : TDateTime;
   CycleDateDiff : Double;
   Result : Boolean;
begin
   LastServiceDate := WinData.TempTable.FieldByName('LastService').AsDateTime;
   LastHeatDate := WinData.TempTable.FieldByName('HeatDate').AsDateTime;
   DateDiff := 0;
   CycleDateDiff := 0;
   Result := FALSE;

   // Use the latest event Service or Bulling
   if LastServiceDate > LastHeatDate then
      LastEventDate := LastServiceDate
   else
      LastEventDate := LastHeatDate;

    // Define if the cow is due for overdue/due service.
    // Check the difference between the last eventdate and today.
    // predict a new Due Service Date from last Service/Bulling Date.

    // WinData.TempTable.FieldByName('OverDue').AsBoolean tells us if animal is
    // over 21 day cycle + 3 day saftey margin.

    // This field (along with check for DueService date before today) is used
    // to determine what animals should appear red in report.

    // Added SP 26/05/04.

   DateDiff := ( TestDate - LastEventDate );
   if ( DateDiff < Cycle21 ) then
      begin
         CycleDateDiff := ( Cycle21 - DateDiff );
         WinData.TempTable.FieldByName('DueService').AsDateTime := TestDate + CycleDateDiff;
         WinData.TempTable.FieldByName('OverDue').AsBoolean := False;
         Result := TRUE;
      end
   else if ( DateDiff >= Cycle21 ) And ( DateDiff <= Cycle24 ) then
      begin
         CycleDateDiff := ( Cycle21 - DateDiff );
         WinData.TempTable.FieldByName('DueService').AsDateTime := TestDate + CycleDateDiff;
         WinData.TempTable.FieldByName('OverDue').AsBoolean := False;
         Result := TRUE;
      end
   else if ( DateDiff > Cycle24 ) And ( DateDiff <= Cycle42 ) then
      begin
         CycleDateDiff := ( Cycle42 - DateDiff );
         WinData.TempTable.FieldByName('DueService').AsDateTime := TestDate + CycleDateDiff;
         WinData.TempTable.FieldByName('OverDue').AsBoolean := True; // Missed Cycle // not(IncOver.Checked);
         Result := TRUE;
      end
   else if ( DateDiff > Cycle42 ) then
      begin
         CycleDateDiff := ( Cycle42 - DateDiff ); // Way overdue
         WinData.TempTable.FieldByName('DueService').AsDateTime := TestDate + CycleDateDiff;
         WinData.TempTable.FieldByName('OverDue').AsBoolean := True; // Missed Cycle
         Result := TRUE;
      end;

   WinData.TempTable.FieldByName('Include').AsBoolean := Result
end;


procedure TActionReminderFilter.ViewBtnClick(Sender: TObject);
begin
   pbcount.visible := True;
   WinData.CanShowStandardReportHint := False;
   WinData.cxHint.HideHint;
   sbView.Enabled := False;
   sbPrint.Enabled := False;

   //   24/09/12 [V5.0 R9.9] /MK Bug Fix - Always set FAnimalCartArrayIndex to zero on Activate so if user changes
   //                                      report filter options then new animals will be added to cart.
   FAnimalCartArrayIndex := 0;
   SetLength(FAnimalCartArray,0);
   // Clear Animal Cart variables.

     // Due to Calve Report
   try
      FBreedingDataHelper.CreateTempBreedingDataTables;
      if pDueToCalve.Visible then
         begin
            if ( NOT ( IncCows.Checked )) and ( NOT ( IncHeifers.Checked )) then
               ShowMessage('You must select either Cows or/and Heifers')
            else
               try
                 DueToCalveScr := TDueToCalveScr.Create(nil);
                 with DueToCalveScr do
                    begin
                       BuildDueToCalve;

                       if DueToCalveScr.qDueToCalve.RecordCount <= 0 then
                          begin
                             MessageDlg('No Due To Calve records have been found',mtInformation,[mbOK],0);
                             Exit;
                          end;

                       DueToCalveScr.PrintOutBlank := False;
                       DueToCalveScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK

                       if WinData.ExportToPDA then
                          begin
                             WinData.PDALinkExport.ExportReport( DueToCalveScr );
                          end
                       else if ( not(FAddReportToCart) ) then
                          begin
                             //  22/01/2009 [Dev V3.9 R5.8] /MK
                             if rgShowAnimalNoOrNatID.ItemIndex = 0 then
                                begin
                                  //   30/10/20 [V5.9 R7.0] /MK Change - Default Status to Milk Status - GL request.
                                  DueToCalveScr.L2.Caption := 'Milk Status';
                                  DueToCalveScr.QRDBText2.DataField := 'Status';
                                  DueToCalveScr.lNatIDNum.Enabled := False;
                                  DueToCalveScr.dbNatIDNum.Enabled := False;
                                end
                             else if rgShowAnimalNoOrNatID.ItemIndex = 1 then
                                begin
                                  DueToCalveScr.L2.Caption := 'NatID';
                                  DueToCalveScr.QRDBText2.DataField := 'ShortNatIDNum';
                                  DueToCalveScr.lNatIDNum.Enabled := False;
                                  DueToCalveScr.dbNatIDNum.Enabled := False;
                                end
                             else if rgShowAnimalNoOrNatID.ItemIndex = 2 then
                                begin
                                  DueToCalveScr.lNatIDNum.Enabled := True;
                                  DueToCalveScr.dbNatIDNum.Enabled := True;
                                  DueToCalveScr.L1.Enabled := False;
                                  DueToCalveScr.L2.Enabled := False;
                                  DueToCalveScr.QRDBText1.Enabled := False;
                                  DueToCalveScr.QRDBText2.Enabled := False;
                                end;

                             if rgShowCalfSex.ItemIndex = 0 then
                                begin
                                  //  18/01/12 [V5.0 R3.5] /MK Change - Pred. Calf Change To Pred. Sex.
                                  DueToCalveScr.lCalfSex.Caption := 'Pred. Sex';
                                  DueToCalveScr.qrdbCalfSex.DataField := 'PredCalfType';
                                end
                             else if rgShowCalfSex.ItemIndex = 1 then
                                begin
                                  DueToCalveScr.lCalfSex.Caption := 'Last Calf';
                                  DueToCalveScr.qrdbCalfSex.DataField := 'LastCalfType';
                                end;

                             if ( cbCalveDoubleSpacing.Checked ) then
                                DueToCalveScr.Details.Height := 52;

                             if ( FReportType = rtRecordingReport ) then
                                DueToCalveScr.PrintOutBlank := True;

                             if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                                begin
                                   DueToCalveScr.Details.Font.Color := clNavy;
                                   DueToCalveScr.FBTitle1.Font.Color := clRed;
                                   DueToCalveScr.FBTitle2.Font.Color := clRed;
                                   DueToCalveScr.Preview;
                                   pbCount.Position := 0;
                                end
                             else
                                begin
                                   DueToCalveScr.Details.Font.Color := clBlack;
                                   DueToCalveScr.FBTitle1.Font.Color := clBlack;
                                   DueToCalveScr.FBTitle2.Font.Color := clBlack;
                                   Windata.CallPrintDialog(DueToCalveScr);
                                   pbCount.Position := 0;
                                   {
                                   if CalveBlank.Checked then
                                      begin
                                         DueToCalveScr.PrintOutBlank := True;
                                         DueToCalveScr.Print;
                                         pbCount.Position := 0;
                                      end;
                                   }
                                end;
                          end;
                    end;
            finally
               DueToCalveScr.qDueToCalve.Close;
               DueToCalveScr.Free;
            end
         end
      // Due for Drying Off
      else if pDueForDryingOff.Visible then
         begin
         if ( NOT ( OlderCows.Checked )) and ( NOT ( FirstLactCows.Checked )) then
            ShowMessage('You must select either Cows or/and Heifers')

         else
            try
               DueForDryingOffScr := TDueForDryingOffScr.Create(nil);
               BuildDueToDryOff;

               if DueForDryingOffScr.qDueForDryingOff.RecordCount <= 0 then
                  begin
                     MessageDlg('No Due Dry Off records have been found',mtInformation,[mbOK],0);
                     Exit;
                  end;

               DueForDryingOffScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo;// Added 11/12/98 - FK
               if WinData.ExportToPDA then
                  begin
                     WinData.PDALinkExport.ExportReport(  DueForDryingOffScr );
                  end
               else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                 begin
                   DueForDryingOffScr.QRSubDetail1.Font.Color := clNavy;
                   DueForDryingOffScr.QRSubDetail2.Font.Color := clNavy;
                   DueForDryingOffScr.RptTitle1.Font.Color := clRed;
                   DueForDryingOffScr.RptTitle3.Font.Color := clRed;
                   with DueForDryingOffScr.qDueForDryingOff do
                      begin
                         if ( FReportType = rtRecordingReport ) then
                            DueForDryingOffScr.DueForDryingOffType := ddBlank
                         else
                            begin
                               if cbIncludeServAndPD.Checked then
                                  DueForDryingOffScr.DueForDryingOffType := ddExtended
                               else
                                  DueForDryingOffScr.DueForDryingOffType := ddNormal;
                            end;

                         DueForDryingOffScr.Preview;
                         pbCount.Position := 0;
                      end;
                 end
               else if ( Sender as TRxSpeedButton ).Name = 'sbPrint' then
                 begin
                   DueForDryingOffScr.QRSubDetail1.Font.Color := clBlack;
                   DueForDryingOffScr.QRSubDetail2.Font.Color := clBlack;
                   DueForDryingOffScr.RptTitle1.Font.Color := clBlack;
                   DueForDryingOffScr.RptTitle3.Font.Color := clBlack;
                   with DueForDryingOffScr.qDueForDryingOff do
                      begin
                         if ( FReportType = rtRecordingReport ) then
                            DueForDryingOffScr.DueForDryingOffType := ddBlank
                         else
                            begin
                               if cbIncludeServAndPD.Checked then
                                  DueForDryingOffScr.DueForDryingOffType := ddExtended
                               else
                                  DueForDryingOffScr.DueForDryingOffType := ddNormal;
                            end;
                            WinData.CallPrintDialog(DueForDryingOffScr);
                            pbCount.Position := 0;
                      end;
                 end;
            finally
               DueForDryingOffScr.qDueForDryingOff.Close;
               DueForDryingOffScr.Free;
            end
         end
      else if pDueFirstService.Visible then
         begin
         if ( NOT ( FirstServeIncCows.Checked )) and ( NOT ( FirstServeIncHeifers.Checked )) then
            ShowMessage('You must select either Cows or/and Heifers')
         else
           try
             if ( not(cbNoheatsServices.Checked) ) and ( not(cbReHeatsNotServed.Checked) ) and ( not(cbRepeatService.Checked) ) then
                begin
                   MessageDlg('No report type selected. Please select a report type.',mtInformation,[mbOK],0);
                   Exit;
                end;

             DueFirstServiceScr := TDueFirstServiceScr.Create(nil);
             BuildDueFirstService;
             if DueFirstServiceScr.qDueFirstService.RecordCount <= 0 then
                begin
                   MessageDlg('No Due Service records have been found',mtInformation,[mbOK],0);
                   Exit;
                end;

             DueFirstServiceScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
             DueFirstServiceScr.verno2.Caption := 'Herd Management ' + HerdVerNo;
             DueFirstServiceScr.MainheadingShort.Caption := 'Due Service';
             DueFirstServiceScr.MainheadingLong.Caption := 'Due Service';
             DueFirstServiceScr.DataEntryHeading.Caption := 'Due Service';

             //   08/01/13 [V5.1 R3.7] /MK Additional Feature - Add count to report if no animal numbers or no breeding history.
             DueFirstServiceScr.NoAnimalNumberCount := 0;
             DueFirstServiceScr.NoAnimalNumberCount := DueServiceNoAnimalNoCount;
             DueFirstServiceScr.NoBreedHistoryCount := 0;
             DueFirstServiceScr.NoBreedHistoryCount := DueServiceNoBreedingHistoryCount;

             if WinData.ExportToPDA then
                begin
                   WinData.PDALinkExport.ExportReport( DueFirstServiceScr );
                end
             else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                begin
                   DueFirstServiceScr.MainDetail.Font.Color := clNavy;
                   DueFirstServiceScr.OtherDetail.Font.Color := clNavy;
                   DueFirstServiceScr.MainHeadingShort.Font.Color := clRed;
                   DueFirstServiceScr.DataEntryHeading.Font.Color := clRed;
                   DueFirstServiceScr.MainHeadingLong.Font.Color := clRed;
                   With DueFirstServiceScr.qDueFirstService  do
                      if cbExtended.Checked then
                         begin
                            DueFirstServiceScr.qrDetailedService.Preview;
                            pbCount.Position := 0;
                         end
                      else
                         begin
                            DueFirstServiceScr.Preview;
                            pbCount.Position := 0;
                         end;
                end
             else if ( Sender as TRxSpeedButton ).Name = 'sbPrint' then
                begin
                   DueFirstServiceScr.MainDetail.Font.Color := clNavy;
                   DueFirstServiceScr.OtherDetail.Font.Color := clNavy;
                   DueFirstServiceScr.MainHeadingShort.Font.Color := clRed;
                   DueFirstServiceScr.DataEntryHeading.Font.Color := clRed;
                   DueFirstServiceScr.MainHeadingLong.Font.Color := clRed;
                   with DueFirstServiceScr.qDueFirstService do
                        begin
                           if cbExtended.Checked then
                              Windata.CallPrintDialog(DueFirstServiceScr.qrDetailedService)
                           else
                              begin
                                 //DueFirstServiceScr.PrintOutBlank := FALSE;
                                 Windata.CallPrintDialog(DueFirstServiceScr);
                                 {if ServiceBlank.Checked then
                                    begin
                                       DueFirstServiceScr.PrintOutBlank := TRUE;
                                       DueFirstServiceScr.Print;
                                       pbCount.Position := 0;
                                    end;}
                             end;
                        end;
               end;
           finally
               if ( DueFirstServiceScr <> nil ) then
                  begin
                     DueFirstServiceScr.qDueFirstService.Close;
                     FreeAndNil(DueFirstServiceScr);
                  end;
           end
         end
      else if pDueToPD.Visible then
         begin
            if ( NOT ( cbIncCows.Checked )) and ( NOT ( cbIncHeifers.Checked )) then
               ShowMessage('You must select either Cows or/and Heifers')
            else
               try
                  BuildDueToPD;
                  if qReportPD.RecordCount <= 0 then
                     begin
                        MessageDlg('No Due PD records have been found',mtInformation,[mbOK],0);
                        Exit;
                     end;
                  VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
                  if WinData.ExportToPDA then
                     begin
                        WinData.PDALinkExport.ExportReport( PDScr );
                     end
                  else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                     begin
                        if cbPDDoubleSpacing.Checked then
                           DetailBand1.Height := 46;

                        PDScr.Preview;
                        pbCount.Position := 0;
                     end
                  else if ( Sender as TRxSpeedButton ).Name = 'sbPrint' then
                      begin
                         If Windata.PrintDialog1.Execute then
                            begin
                               PDScr.PrinterSettings.FirstPage := Windata.PrintDialog1.FromPage;
                               PDScr.PrinterSettings.LastPage := Windata.PrintDialog1.ToPage;
                               PDScr.PrinterSettings.Copies := Windata.PrintDialog1.Copies;
                               PDScr.Print;
                               pbCount.Position := 0;
                            end;
                      end;
               finally
                  qReportPD.Close;
               end;
         end;
      // Destroy the TempTable
      if WinData.TempTable.Active then
         begin
            WinData.TempTable.Close;
            WinData.TempTable.DeleteTable;
         end;

   finally
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
    pbCount.Hide;
    pbCount.Position := 0;
end;

procedure TActionReminderFilter.FormShow(Sender: TObject);
begin
   if FBreedingDataHelper = nil then
      FBreedingDataHelper := TBreedingDataHelper.Create;

   PdScr.Hide;
   pbcount.visible := False;
   cbDefaultHerd.LookupSource := WinData.dsHerdDefaults;
   cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   if pDueFirstService.Visible then
      begin
         ActionReminderFilter.Height := 458;
         FromServiceDate.Date := Date();
         ToServiceDate.Date := Date + 21; // Increased to 21 from 7 SP 15/05/01
         pbCount.Top := 393;
      end
   else if pDueToPD.Visible then
      begin
         ActionReminderFilter.Height := 536;
         PDDate.Date := Date; { SP 22/03/2003 }
         pbCount.Top := 471;
      end
   else if pDueForDryingOff.Visible then
      begin
         DryingDate.Date := Date;
         ActionReminderFilter.Height := 510;
         pbCount.Top := 450;
         rgDryOffSortBy.ItemIndex := 0;
         rgDryOffSortOrder.ItemIndex := 0;
      end
   else If pDueToCalve.Visible Then
      begin
         lCalveDateTo.Hide;{ SP 22/03/2003 }
         CalveDateTo.Hide; { SP 22/03/2003 }
         CalveDateFrom.Left := 200;
         CalveDateFrom.Date := Date; { SP 22/03/2003 }
         lCalveDateFrom.Caption := 'For Period Ending'; { SP 22/03/2003 }
         ActionReminderFilter.Height := 587;
         pbCount.Top := 526;
         cmboServiceType.ItemIndex := 0;
      end;

   if pDueFirstService.Visible then
      ARReportType := arDueService
   else if pDueToPD.Visible then
      ARReportType := arDuePD
   else if pDueForDryingOff.Visible then
      ARReportType := arDueDryOff
   else if pDueToCalve.Visible then
      ARReportType := arDueCalve;

   //   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Option Added.
   if ( ARReportType = arDueService ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cDueToServeRep);
         WinData.UpdateRecentReportUsage(cDueToServeRep);
      end
   else if ( ARReportType = arDuePD ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cDueToPDRep);
         WinData.UpdateRecentReportUsage(cDueToPDRep);
      end
   else if ( ARReportType = arDueDryOff ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cDueToDryRep);
         WinData.UpdateRecentReportUsage(cDueToDryRep);
      end
   else if ( ARReportType = arDueCalve ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cDueToCalveRep);
         WinData.UpdateRecentReportUsage(cDueToCalveRep);
      end;



   LoadScreenDefaults;
end;

procedure TActionReminderFilter.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   // CalveDate.Date := Now(); { SP 22/03/2003 }
   // Call the routine to check which radiobutton is selected

   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;

    FCountry := HerdLookup.CountryByHerdID(HerdLookup.DefaultHerdID);

    //   30/08/21 [V6.0 R2.1] /MK Additional Feature - If WinData.ShowMainGridGridDueToCalvCalcMsg then show message to explain to the user to run this report for the grid data.
    if ( WinData.ShowMainGridGridDueToCalvCalcMsg ) and ( pDueToCalve.Visible ) then
       begin
          //   06/09/21 [V6.0 R2.1] /MK Change - Changed Expected to Projected - GL request. 
          MessageDlg('To produce the Projected Calving Date on the main grid, run the Due Calving Report.',mtInformation,[mbOK],0);
          WinData.ShowMainGridGridDueToCalvCalcMsg := False;
       end;
end;

procedure TActionReminderFilter.ToServiceDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
    if ( ADate >= Date() ) AND ( ADate <= Date()+999 ) then
        Action := TRUE
    else
       begin
          Action := FALSE;
          MessageDLG('Date must be on or after the System Date - Resetting to Previous Date',mtInformation,[mbOK],0);
       end;
end;

procedure TActionReminderFilter.ServiceBlankClick(Sender: TObject);
begin
   {if ServiceBlank.Checked then
      begin
         cbExtended.Checked := FALSE;
         cbExtended.Hide;
      end
   else
      cbExtended.Show;}
end;

procedure TActionReminderFilter.CalveDateFromAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
   if not cbPeriodBetween.Checked then
      begin
         if ( ADate >= Date() ) AND ( ADate <= Date()+999 ) then
           Action := TRUE
         else
            begin
               Action := FALSE;
               MessageDLG('Date must be on or after the System Date - Resetting to Previous Date',mtInformation,[mbOK],0);
            end;
      end;
end;

procedure TActionReminderFilter.DryingDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
    if ( ADate >= Date() ) AND ( ADate <= Date()+999 ) then
        Action := TRUE
    else
       begin
          Action := FALSE;
          MessageDLG('Date must be on or after the System Date - Resetting to Previous Date',mtInformation,[mbOK],0);
       end;
end;

procedure TActionReminderFilter.FormCreate(Sender: TObject);
var
   i : Integer;
begin
   if WinData.ActiveFilter then
      begin
         cbFilter.Visible := True;
         cbFilter.Checked := True;
         cbFilter.Style.Font.Color := clBlue;
      end
   else
      begin
         cbFilter.Visible := False;
         cbFilter.Checked := False;
         cbFilter.Style.Font.Color := clBlack;
      end;

   WinData.CanShowStandardReportHint := True;
   seDaysAfterCalving.AsInteger := DuePD_DaysSinceCalvingToday;
   PDScr.hide;
   cbIncludenotServedClick(nil);

   {
   for i := 0 to rgSortBy.ControlCount -1 do
      TRadioButton( rgSortBy.Controls[i]).Font.Style := [];
   }

   rgPDReportType.ItemIndex := 0;
   rgCalveReportType.ItemIndex := 0;

   FAddReportToCart := False;
   bCartAnimals.Enabled := True;

   //   23/11/20 [V5.9 R7.5] /MK Additional Feature - Add all service types to the new cmboServiceType combo box as well as an option to select All.
   cmboServiceType.Properties.Items.Clear;
   cmboServiceType.Properties.Items.Add('All');
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, Description');
         SQL.Add('FROM GenLook');
         SQL.Add('WHERE ListType = '+IntToStr(LServiceType));
         SQL.Add('ORDER BY Description ASC');
         Open;
         if ( RecordCount > 0 ) then
            begin
               First;
               while ( not(Eof) ) do
                  begin
                     cmboServiceType.Properties.Items.AddObject(FieldByName('Description').AsString,Pointer(FieldByName('ID').AsInteger));
                     Next;
                  end;
            end;
      finally
         Free;
      end;
end;

procedure TActionReminderFilter.ToServiceDateExit(Sender: TObject);
begin
   if not cbPeriodBetween.Checked then
      begin
         if (Sender is TDateEdit) then
            begin
               if not((Sender as TDateEdit).Date >= Date) then
                  begin
                     MessageDLG('Date must be on or after the System Date - Resetting to Todays Date',mtInformation,[mbOK],0);
                     (Sender as TDateEdit).Date := Date();
                     (Sender as TDateEdit).SetFocus;
                  end
               else if (Sender as TDateEdit).Date = 0 then
                  begin
                     MessageDLG('Date cannot be blank - Resetting to Todays Date',mtInformation,[mbOK],0);
                     (Sender as TDateEdit).Date := Date();
                     (Sender as TDateEdit).SetFocus;
                  end;
            end;
      end;
end;

procedure TActionReminderFilter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //   If Key = VK_ESCAPE then sbExit.Click;
end;

procedure TActionReminderFilter.FromServiceDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
   if (FromServiceDate.Text = '  /  /    ' ) then
      MessageDLG('You must enter a from date',mtInformation,[mbOK],0)
   else if (FromServiceDate.Date <= Date - 366) then
      begin
         MessageDLG('Date must not be more than 1 year from the System Date - Resetting to System Date',mtInformation,[mbOK],0);
         FromServiceDate.Date := Date();
      end;
end;

procedure TActionReminderFilter.FromServiceDateExit(Sender: TObject);
begin
   if ( FromServiceDate.Date > ToServiceDate.Date ) then
      begin
         MessageDLG('Date must be on or before To Date - Resetting to System Date',mtInformation,[mbOK],0);
         FromServiceDate.Date := Date();
      end;
end;

procedure TActionReminderFilter.FirstServeIncHeifersClick(Sender: TObject);
begin
   if NOT FirstServeIncHeifers.Checked then
      if NOT FirstServeIncCows.Checked then
         MessageDLG('Either Cows or Heifers must be selected',mtError,[mbok],0);
end;

procedure TActionReminderFilter.FirstServeIncCowsClick(Sender: TObject);
begin
   FirstServeIncHeifersClick(Sender);
end;

procedure TActionReminderFilter.ServiceSortClick(Sender: TObject);
begin
{
   if ServiceSort.Checked then
      begin
         CalvingSort.Checked := FALSE;
         AnimalNo.Checked := FALSE;
      end;
   }
end;

procedure TActionReminderFilter.CalvingSortClick(Sender: TObject);
begin
{
   if CalvingSort.Checked then
      begin
         ServiceSort.Checked := FALSE;
         AnimalNo.Checked := FALSE;
      end;
}
end;

procedure TActionReminderFilter.AnimalNoClick(Sender: TObject);
begin
{
   if AnimalNo.Checked then
      begin
         ServiceSort.Checked := FALSE;
         CalvingSort.Checked := FALSE;
      end;
}
end;

procedure TActionReminderFilter.PDDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  if ( ADate >= Date() ) AND ( ADate <= Date()+999 ) then
      Action := TRUE
  else
     begin
        Action := FALSE;
        MessageDLG('Date must be on or after the System Date - Resetting to Previous Date',mtInformation,[mbOK],0);
     end;
end;

procedure TActionReminderFilter.QRDBText1Print(sender: TObject; var Value: String);
begin
   //   06/06/12 [V5.0 R7.0] /MK Additional Feature - Hide DuePDDate Text If ReportType Is Recording Sheet.
   if ( FReportType = rtRecordingReport ) then
      if (Sender as TQRDBText).DataField = 'DuePDDate' then
         begin
            Value := '';
            QRLabel1.Caption := '';
         end;
   if (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0  then
      Value := '';
end;

procedure TActionReminderFilter.cbPeriodBetweenClick(Sender: TObject);
begin
   { SP 22/03/2003 }
   if TCheckBox(Sender).Checked then
      begin
         CalveDateFrom.Left := 160;
         lCalveDateFrom.Caption := 'Period From';
         CalveDateFrom.Date := IncMonth(Date, -1);
         CalveDateTo.Date := IncMonth(Date, 1);
         lCalveDateTo.Show;
         CalveDateTo.Show;
      end
   else
      begin
         lCalveDateTo.Hide;
         CalveDateTo.Hide;
         CalveDateFrom.Left := 200;
         CalveDateFrom.Date := Date;
         lCalveDateFrom.Caption := 'For Period Ending';
      end;
end;

procedure TActionReminderFilter.LoadScreenDefaults;
begin
   case ARReportType of
     arDueService :
        begin
           DueServiceDefaults := TDueServiceDefaults.Create(cRD_DueService);
           try

              if DueServiceDefaults.NoDays = 0 then
                 DaysFirstService.AsInteger := 42 // default to 42 days
              else
                 DaysFirstService.AsInteger := DueServiceDefaults.NoDays;

              cbNoheatsServices.Checked := DueServiceDefaults.DueServeNoHeat;
              cbReHeatsNotServed.Checked := DueServiceDefaults.DueServiceWithHeat;
              cbRepeatService.Checked := DueServiceDefaults.DueRepeatService;
              FirstServeIncCows.Checked := DueServiceDefaults.IncludeCows;
              FirstServeIncHeifers.Checked := DueServiceDefaults.IncludeHeifers;
              cbExtended.Checked := DueServiceDefaults.ExtendedDetails;
              //rgSortBy.ItemIndex := DueServiceDefaults.SortField;
              rgServiceSortBy.ItemIndex := DueServiceDefaults.SortField;
              ExcludeOver.Checked := DueServiceDefaults.ExcludeOverDue;
           finally
              FreeAndNil(DueServiceDefaults);
           end;
        end;
     arDuePD :
        begin
           DuePregDiagDefaults := TDuePregDiagDefaults.Create(cRD_DuePregDiag);
           try
              if ( DuePregDiagDefaults.NoDays = 0 ) then
                 PDSince.AsInteger := 70
              else
                 PDSince.AsInteger := DuePregDiagDefaults.NoDays;
              cbIncCows.Checked := DuePregDiagDefaults.IncludeCows;
              cbIncHeifers.Checked := DuePregDiagDefaults.IncludeHeifers;
              cbIncludeAnimalsDiagnosedNotPregnant.Checked := DuePregDiagDefaults.IncludeNotPregnant;
              cbIncludeReCheckEvents.Checked := DuePregDiagDefaults.IncludeRecheckEvents;
              cbIncludenotServed.Checked := DuePregDiagDefaults.IncludeNotServed;
              if ( cbIncludenotServed.Checked ) then
                 seDaysAfterCalving.AsInteger := DuePregDiagDefaults.NotServedDaysToCalving;
              RadioGroup1.ItemIndex := DuePregDiagDefaults.ReportOn;
              rgOrder.ItemIndex := DuePregDiagDefaults.SortField;
              rgSort.ItemIndex := DuePregDiagDefaults.SortOrder;
           finally
              FreeAndNil(DuePregDiagDefaults);
           end;
        end;
     arDueDryOff :
        begin
           DueDryOffDefaults := TDueDryOffDefaults.Create(cRD_DueDryOff);
           try
              if DueDryOffDefaults.NoDays = 0 then
                 DaysforDryingOff.AsInteger := 70
              else
                 DaysforDryingOff.AsInteger := DueDryOffDefaults.NoDays;
              //DryingDoubleSpace.Checked := DueDryOffDefaults.DoubleSpacing;
              //DryingBlank.Checked := DueDryOffDefaults.BlankEntryForm;
              OlderCows.Checked := DueDryOffDefaults.IncludeCows;
              FirstLactCows.Checked := DueDryOffDefaults.IncludeHeifers;
              cbIncludeNotPreg.Checked := DueDryOffDefaults.IncludeNotPregnant;
              cbIncludeHeatsAfterServiceOrPD.Checked := DueDryOffDefaults.IncludeDueDryServedOrPDAfterHeat;
              //SortDryOffDate.Checked := DueDryOffDefaults.SortByDate;
              if DueDryOffDefaults.SortByDate then
                 rgDryOffSortBy.ItemIndex := 0;
              rgOrder.ItemIndex := DueDryOffDefaults.SortField;
              rgSort.ItemIndex := DueDryOffDefaults.SortOrder;
           finally
              FreeAndNil(DueDryOffDefaults);
           end;
        end;
     arDueCalve :
        begin
           DueCalvingDefaults := TDueCalvingDefaults.Create(cRD_DueCalving);
           try
              if DueCalvingDefaults.RestrictToPeriod then
                 begin
                    CalveDateFrom.Date := IncMonth(Date, -1);
                    if DueCalvingDefaults.DateInterval > 0 then
                       CalveDateTo.Date   := Trunc( CalveDateFrom.Date + DueCalvingDefaults.DateInterval)
                 end
              else
                 { Set the CalveDateFrom to today }
                 CalveDateFrom.Date := Date;

              //DoubleSpace.Checked := DueCalvingDefaults.DoubleSpacing;
              //CalveBlank.Checked := DueCalvingDefaults.BlankEntryForm;
              IncCows.Checked := DueCalvingDefaults.IncludeCows;
              IncHeifers.Checked := DueCalvingDefaults.IncludeHeifers;
              cbIncludeNOTPregnant.Checked := DueCalvingDefaults.IncludeNotPregnant;
              cbIncludeHeatOrPDAfterService.Checked := DueCalvingDefaults.IncludeHeatAfterService;
              rgShowAnimalNoOrNatID.ItemIndex := DueCalvingDefaults.ShowAnimalNoOrNatID;
              rgShowCalfSex.ItemIndex := DueCalvingDefaults.ShowCalfSex;

              rgDueCalveSortBy.ItemIndex := DueCalvingDefaults.DueCalveSortOrder;
              rgDueCalveSortOrder.ItemIndex := DueCalvingDefaults.SortField;
           finally
              FreeAndNil(DueCalvingDefaults);
           end;
        end;
   end;
end;

procedure TActionReminderFilter.SaveScreenDefaults;
var
  DueServiceDefaults : TDueServiceDefaults;
begin
   case ARReportType of
     arDueService :
        begin
           DueServiceDefaults := TDueServiceDefaults.Create(cRD_DueService);
           try
              DueServiceDefaults.NoDays := DaysFirstService.AsInteger;
              DueServiceDefaults.DueServeNoHeat := cbNoheatsServices.Checked;
              DueServiceDefaults.DueServiceWithHeat := cbReHeatsNotServed.Checked;
              DueServiceDefaults.DueRepeatService := cbRepeatService.Checked;
              DueServiceDefaults.IncludeCows := FirstServeIncCows.Checked;
              DueServiceDefaults.IncludeHeifers := FirstServeIncHeifers.Checked;
              DueServiceDefaults.ExtendedDetails := cbExtended.Checked;
              //DueServiceDefaults.SortField := rgSortBy.ItemIndex;
              DueServiceDefaults.SortField := rgServiceSortBy.ItemIndex;
              DueServiceDefaults.ExcludeOverDue := ExcludeOver.Checked;
           finally
              FreeAndNil(DueServiceDefaults);
           end;
        end;
     arDuePD :
        begin
           DuePregDiagDefaults := TDuePregDiagDefaults.Create(cRD_DuePregDiag);
           try
              DuePregDiagDefaults.NoDays := PDSince.AsInteger;
              DuePregDiagDefaults.IncludeCows := cbIncCows.Checked;
              DuePregDiagDefaults.IncludeHeifers := cbIncHeifers.Checked;
              DuePregDiagDefaults.IncludeNotPregnant := cbIncludeAnimalsDiagnosedNotPregnant.Checked;
              DuePregDiagDefaults.IncludeRecheckEvents := cbIncludeReCheckEvents.Checked;
              DuePregDiagDefaults.ReportOn := RadioGroup1.ItemIndex;
              DuePregDiagDefaults.DaysAfterCalving := seDaysAfterCalving.AsInteger;
              DuePregDiagDefaults.IncludeNotServed := cbIncludenotServed.Checked;
              if ( cbIncludenotServed.Checked ) then
                 DuePregDiagDefaults.NotServedDaysToCalving := seDaysAfterCalving.AsInteger;
              DuePregDiagDefaults.SortField := rgOrder.ItemIndex;
              DuePregDiagDefaults.SortOrder := rgSort.ItemIndex;
           finally
              FreeAndNil(DuePregDiagDefaults);
           end;
        end;
     arDueDryOff :
        begin
           DueDryOffDefaults := TDueDryOffDefaults.Create(cRD_DueDryOff);
           try
              DueDryOffDefaults.NoDays := DaysforDryingOff.AsInteger;
              //DueDryOffDefaults.DoubleSpacing := DryingDoubleSpace.Checked;
              //DueDryOffDefaults.BlankEntryForm := DryingBlank.Checked;
              DueDryOffDefaults.IncludeCows := OlderCows.Checked;
              DueDryOffDefaults.IncludeHeifers := FirstLactCows.Checked;
              DueDryOffDefaults.IncludeNotPregnant := cbIncludeNotPreg.Checked;
              DueDryOffDefaults.IncludeDueDryServedOrPDAfterHeat := cbIncludeHeatsAfterServiceOrPD.Checked; 
              //DueDryOffDefaults.SortByDate := SortDryOffDate.Checked;
              if rgDryOffSortBy.ItemIndex = 0 then
                 DueDryOffDefaults.SortByDate := True;
              DueDryOffDefaults.SortField := rgOrder.ItemIndex;
              DueDryOffDefaults.SortOrder := rgSort.ItemIndex ;
           finally
              FreeAndNil(DueDryOffDefaults);
           end;
        end;
     arDueCalve :
        begin
           DueCalvingDefaults := TDueCalvingDefaults.Create(cRD_DueCalving);
           try
              if DueCalvingDefaults.RestrictToPeriod then
                 begin
                    if ( CalveDateTo.Date > 0 ) and ( CalveDateFrom.Date > 0 ) then
                       DueCalvingDefaults.DateInterval := Trunc(CalveDateTo.Date - CalveDateFrom.Date);
                 end;
              //DueCalvingDefaults.DoubleSpacing := DoubleSpace.Checked;
              //DueCalvingDefaults.BlankEntryForm := CalveBlank.Checked;
              DueCalvingDefaults.IncludeCows := IncCows.Checked;
              DueCalvingDefaults.IncludeHeifers := IncHeifers.Checked;
              DueCalvingDefaults.IncludeNotPregnant := cbIncludeNOTPregnant.Checked;
              DueCalvingDefaults.IncludeHeatAfterService := cbIncludeHeatOrPDAfterService.Checked;
              DueCalvingDefaults.ShowAnimalNoOrNatID := rgShowAnimalNoOrNatID.ItemIndex;
              DueCalvingDefaults.ShowCalfSex := rgShowCalfSex.ItemIndex;
              DueCalvingDefaults.DueCalveSortOrder := rgDueCalveSortBy.ItemIndex;
              DueCalvingDefaults.SortField := rgDueCalveSortOrder.ItemIndex;
           finally
              FreeAndNil(DueCalvingDefaults);
           end;
        end;
   end;
end;

procedure TActionReminderFilter.FormDestroy(Sender: TObject);
begin
   if ( FBreedingDataHelper <> nil ) then
      FreeAndNil(FBreedingDataHelper);
   SaveScreenDefaults;
   WinData.cxHint.HideHint;
end;

procedure TActionReminderFilter.cbIncludenotServedClick(Sender: TObject);
begin
   if not cbIncludenotServed.Checked then
      begin
         //cbIncCows.Top := 82;
         seDaysAfterCalving.Visible := FALSE;
         lDaysAfterCalving.Visible  := FALSE;
      end
   else
      begin
         //cbIncCows.Top := 135;
         seDaysAfterCalving.Visible := True;
         lDaysAfterCalving.Visible  := True;
      end;
   //cbIncHeifers.Top := cbIncCows.Top + 20;
   //cbIncCowsNot.Top := cbIncHeifers.Top + 20;
end;

procedure TActionReminderFilter.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;


procedure TActionReminderFilter.rgShowAnimalNoOrNatIDClick(
  Sender: TObject);
begin
   if rgShowAnimalNoOrNatID.ItemIndex = 2 then
      rgDueCalveSortBy.ItemIndex := 1
   else if rgShowAnimalNoOrNatID.ItemIndex <> 2 then
      rgDueCalveSortBy.ItemIndex := 0;
end;

procedure TActionReminderFilter.rgDueCalveSortByClick(Sender: TObject);
begin
   if rgDueCalveSortBy.ItemIndex = 0 then
      rgShowAnimalNoOrNatID.ItemIndex := 0
   else if rgDueCalveSortBy.ItemIndex = 1 then
      rgShowAnimalNoOrNatID.ItemIndex := 2;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Option Added.
procedure TActionReminderFilter.cbFavouritePropertiesChange(
  Sender: TObject);

   procedure AddRemoveFavourite ( AAddRemove : Boolean; AReportConst : String );
   begin
      if AAddRemove then
         begin
            WinData.SetReportAsFavourite(AReportConst,True);
            cbFavourite.Style.TextColor := clBlue;
            cbFavourite.StyleHot.TextColor := clBlue;
         end
      else
         begin
            WinData.SetReportAsFavourite(AReportConst,False);
            cbFavourite.Style.TextColor := clBlack;
            cbFavourite.StyleHot.TextColor := clBlack;
         end;
      Application.ProcessMessages;
      Update;
   end;

begin
   if ( ARReportType = arDueService ) then
      AddRemoveFavourite(cbFavourite.Checked,cDueToServeRep)
   else if ( ARReportType = arDuePD ) then
      AddRemoveFavourite(cbFavourite.Checked,cDueToPDRep)
   else if ( ARReportType = arDueDryOff ) then
      AddRemoveFavourite(cbFavourite.Checked,cDueToDryRep)
   else if ( ARReportType = arDueCalve ) then
      AddRemoveFavourite(cbFavourite.Checked,cDueToCalveRep);
end;

//   06/06/12 [V5.0 R7.0] /MK Additional Feature - New ReporType RadioGroup.
procedure TActionReminderFilter.rgPDReportTypeClick(Sender: TObject);
begin
   if ( rgPDReportType.ItemIndex = 0 ) then
      begin
         FReportType := rtFullReport;
         cbPDDoubleSpacing.Enabled := False;
         cbPDDoubleSpacing.Checked := False;
      end
   else
      begin
         FReportType := rtRecordingReport;
         cbPDDoubleSpacing.Enabled := True;
      end;
end;

//   06/06/12 [V5.0 R7.0] /MK Additional Feature - Hide PDStatus Text If ReportType Is Recording Sheet.
procedure TActionReminderFilter.QRDBText2Print(sender: TObject;
  var Value: String);
begin
   if ( FReportType = rtRecordingReport ) then
      Value := '';

   if ( Value = '30/12/1899' ) or ( Value = '30/12/99' ) then
      Value := '';

   if ( UpperCase(Value) = 'UNDEFINED' ) then
      Value := '';
end;

procedure TActionReminderFilter.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel29.Left := 237;
   QRLabel18.Left := 290;
   QRLabel31.Left := 378;
   QRLabel30.Caption := 'Preg. Status';
   QRLabel30.BringToFront;
   QRLabel22.Caption := '';
   QRLabel22.Caption := 'Due Pregnancy Diagnosis';

   QRDBText2.BringToFront;
   QRDBText16.Left := 237;
   QRDBText19.Left := 290;
   QRDBText17.Left := 378;

   QRLabel19.Enabled := ( FReportType = rtFullReport );
   QRDBText10.Enabled := QRLabel19.Enabled;
   QRLabel6.Enabled := QRLabel19.Enabled;
   QRDBText4.Enabled := QRDBText10.Enabled;
   QRLabel1.Enabled := QRDBText10.Enabled;
   PremRepFirstPrem.Enabled := QRDBText10.Enabled;
   QRLabel2.Enabled := QRDBText10.Enabled;
   QRDBText3.Enabled := QRDBText10.Enabled;

   if ( FReportType = rtRecordingReport ) then
     begin
        QRLabel29.Left := 143;
        QRLabel18.Left := 197;
        QRLabel31.Left := 287;
        QRLabel30.Caption := '';
        QRLabel30.SendToBack;
        QRLabel22.Caption := '';
        QRLabel22.Caption := 'Due Pregnancy Diagnosis - Recording Sheet';

        QRDBText2.SendToBack;
        QRDBText16.Left := 143;
        QRDBText19.Left := 197;
        QRDBText17.Left := 287;
     end;
end;

procedure TActionReminderFilter.rgCalveReportTypeClick(Sender: TObject);
begin
   if ( rgCalveReportType.ItemIndex = 0 ) then
      begin
         FReportType := rtFullReport;
         cbCalveDoubleSpacing.Enabled := False;
         cbCalveDoubleSpacing.Checked := False;
      end
   else
      begin
         FReportType := rtRecordingReport;
         cbCalveDoubleSpacing.Enabled := True;
      end;
end;

procedure TActionReminderFilter.rgDryOffReportTypesClick(Sender: TObject);
begin
   if ( rgDryOffReportTypes.ItemIndex = 0 ) then
      begin
         FReportType := rtFullReport;
         cbDryOffDoubleSpacing.Enabled := False;
         cbDryOffDoubleSpacing.Checked := False;
         cbIncludeServAndPD.Enabled := True;
      end
   else
      begin
         FReportType := rtRecordingReport;
         cbDryOffDoubleSpacing.Enabled := True;
         cbIncludeServAndPD.Enabled := False;
      end;
end;

procedure TActionReminderFilter.bCartAnimalsClick(Sender: TObject);
begin
   // Clear general Animal Cart and add all animals in array to cart.
   // Set DairyData boolean to true so main screen knows report cart has been applied.
   FAddReportToCart := True;
   bCartAnimals.Enabled := False;
   Screen.Cursor := crHourGlass;
   ViewBtnClick(Sender);
   //   21/01/15 [V5.4 R0.9] /MK Bug Fix - Free and Nil here as well after report is viewed.
   if ( WinData.FBreedingDataHelper <> nil ) then
      FreeAndNil(WinData.FBreedingDataHelper);
   Screen.Cursor := crDefault;
   if ( Length(FAnimalCartArray) > 0 ) then
     begin
         AnimalCart.ClearCart;
         AnimalCart.AddToCart(FAnimalCartArray);
         WinData.FReportAnimalsInCart := True;
         MessageDlg(Format('%d animal(s) have been added to Cart and are selected on Main Grid.'+cCRLF+
                           'Exit back to the Main Grid to view these animals.',[Length(FAnimalCartArray)]),mtInformation,[mbOK],0);
     end;
   FAddReportToCart := False;
   bCartAnimals.Enabled := True;
end;

procedure TActionReminderFilter.cbIncludeNotPregClick(Sender: TObject);
begin
   cbIncludeHeatsAfterServiceOrPD.Checked := True;
   cbIncludeHeatsAfterServiceOrPD.Enabled := ( not(cbIncludeNotPreg.Checked) );
end;

end.
