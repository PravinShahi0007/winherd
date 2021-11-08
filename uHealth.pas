unit uHealth;
{
  ----------------------------------------------------------------------------
  12/09/02 SP -

  1) WinData.SetEventsToEdit removed from
     DrugUsed, HealthCode, RateApplic, DrugCost,
     AdMinBy, ApplicMethod, PrescribedBy, dbComment
     - On Change Event.

     WinData.SetEventsToEdit is now called from ShowHealth
     if Health/DryOff exists.

  12/09/02 SP -

  ----------------------------------------------------------------------------

  12/09/02 SP: -


  1) Procedure ShowForm:
     Make sure DoHealth Procedure is only called when AddOrAmend = AddHealth

  V3.5 R9.1

  12/09/02 SP.

  ----------------------------------------------------------------------------

  SP 09/10/2002:-

  qBatch and dsHealth moved to DairyData.

  SP 09/10/2002.

  ----------------------------------------------------------------------------

  SP 23/10/2002:-

  Instead of passing DrugID as Param to WinData.qDrugBachNo then

  SP 23/10/2002.

  ----------------------------------------------------------------------------

  SP 30/10/2002:-

  New field add Expiry Date.

  Give warning message if expiry date is nearling eg. within the coming month.

  SP 30/10/2002.

  ----------------------------------------------------------------------------
  SP 23/03/2003:- V3.6 R5.5

  No. days administered
  No. Times per day administered
  General tidy up of screen.

  SP 23/03/2003:- V3.6 R5.5

  ----------------------------------------------------------------------------
  SP 08/07/2003:- V3.6 R6.7

  Divided Health Code List into two lists.

  "ICBF Codes" and "Farm Codes"

  SP 08/07/2003:- V3.6 R6.7

  ----------------------------------------------------------------------------

  09/02/09 [Dev 3.9 R6.0] /SP Bug Fix - Drug Application cost, not calculating based on DrugCost * Days * Times.

  16/11/10 [V4.0 R5.6] /MK Additional Feature - If EventType = DryOff Then If Medicine And Withdrawal Dates for Milk Exist Then Comment = Drug + Milk Withdrawal Date

  04/05/11 [V4.0 R9.9] /MK Additional Feature - Change To qDrugList To Show Drugs That Are In Use.

  19/05/11 [V4.1 R1.4] /MK Additional Feature - Change Colour of RateApplic To clTeal.

  23/05/11 [V4.1 R1.5] /MK Change - Added Medicine Setup Button If EventType Is DryOff Or Health.

  10/02/12 [V5.0 R3.7] /MK Additional Feature - New Component - dbHealthBatchNo - Allows Free Text Entry Of Batch No's For Drugs.

  10/04/12 [V5.0 R4.7] /MK Bug Fix - LookupBatchNo - Need To Check If DrugUsed Is Not Blank Or Zero.

  02/08/12 [V5.0 R8.3] /MK Bug Fix - ShowHealth - FindExpiryDate should be opened after dbHealthBatchNo.DataBinding is set.

  03/08/12 [V5.0 R8.4] /MK Bug Fix - LookupBatchNo - SQL was adding all BatchNo's from Health.db instead of only those that were entered manually.  

  17/09/12 [V5.0 R9.9] /MK Change - New TAddorAmendHealth type for AmendVaccination.
                                  - Made allowance for Vaccination Event Type.

  11/10/12 [V5.1 R0.3] /MK Bug Fix - Change datasource and datafield of dbHealthBatchNo dependent on TAddOrAmendHealth.

  17/10/12 [V5.1 R0.4] /MK Additional Feature - FormActivate - Added check for active medicines.

  31/10/12 [V5.1 R0.7] /MK Change - If Adding a Health or DryOff then if Country is England then DaysToRemind is 7 else DaysToRemind is 0.

  05/12/12 [V5.1 R3.4] /MK Bug Fix - LookupBatchNo - Program was wrongly repeating the batch number, if manually entered, on the drop-down-list.

  05/12/12 [V5.1 R3.4] /MK Change - Default new Health Events EventDesc to Health - +DrugCode.
                                  - Changed GroupListing LookupField to just Description instead of ID;Description.
                                  - Had to change LookupDisplayIndex to 0 to match new LookupField.

  18/12/12 [V5.1 R3.5] /MK Change - If amending a Vaccination event then on save ReportInDays should be set to weeks value.
                                  - Change Remind In Days labels to weeks if amending Vaccination event.

  17/04/13 [V5.1 R6.3] /MK Change - ShowHealth - If ameding then show all Medicine's. If adding show In Use medicines.

  12/07/13 [V5.1 R8.3] /MK Change - Added VetLink button to Toolbar to open uDrugsRegisterImport.

  18/07/13 [V5.1 R8.5] /MK Change - Added new component dblcbVaccDisease.
                                  - Removed all components bar lICBFCode and dblcbVaccDisease from gbAdminDetails if THerdVaccination.
                                  - If THerdVaccination then lICBFCode := Disease.
                                  - Added OnCloseUp and OnChange events to dblcbVaccDisease.

  26/08/13 [V5.2 R0.2] /MK Additional Feature - New cxdbCurrencyEdit added for ApplicRate for OnChange event.
                                              - On ApplicRateChange change comment to MedicineCode + ApplicRate + DoseRate.

  30/08/13 [V5.2 R1.0] /MK Change - dbHealthBatchNoPropertiesCloseUp - On "Purchase Medicine" always append new medicine purchase with MedicineID.
                                                                     - If DrugUsed.EditValue exists then pass this into the MediPurch screen also.

  03/09/13 [V5.2 R1.0] /MK Additional Feature - Change DrugUsed to cxDBLookupCombo and added Add/Edit button beside DrugUsed.

  05/09/13 [V5.2 R1.0] /MK Additional Feature - On dbHealthBatchNoChange, RateApplicChange and HealthNav.kwnbPost check drug batch quanity remaining.

  13/09/13 [V5.2 R1.2] /MK Bug Fix - WinData.CheckDrugBatchQtyRemaining - Check for null values before CheckDrugBatchQtyRemaining.

  17/09/13 [V5.2 R1.4] /MK Change - Moved Administer By so its above Prescribed By (Vet).
                                  - Changed colour of Administer By and Prescribed By (Vet) to clTeal to show fields are important.

  30/09/13 [V5.2 R3.0] /MK Bug Fix - Added WinData.CalcCostAndQtyUsed to DrugUsedOnChange and ApplicRate on change to show
                                     DrugCost on screen instead of waiting for value to be posted to table before calculation.

  16/10/13 [V5.2 R3.5] /MK Change - Changed columns in DrugUsed to show Name first and then Code.
                           Bug Fix - DrugUsedCloseUp was closing qDrugList.

  17/10/13 [V5.2 R3.7] /MK Change - Use WinData.WinData.CalcCostAndQtyUsed on xDays & xTimes.Change.

  31/10/13 [V5.2 R5.0] /MK Additional Feature - If WinData.EventType = TDryingOff and Country is Ireland and HerdType = Suckler then
                                                on Save of new drying off event create a Weaning event for calf of selected animal.

  07/11/13 [V5.2 R5.2] /MK Change - Need to use both CalcDrugCost and CalcCostAndQtyUsed procedures in
                                    RateApplicChange, xDaysChange and xTimesChange for the below reasons -
                                    (1).CalcDrugCost required to calculate correct cost.
                                    (2).CalcCostAndQtyUsed required to calc QtyUsed and save PurchUnit and DoseUnit to Health table.

  14/11/13 [V5.2 R5.4] /MK Additional Feature - DrugUsedPropertiesCloseUp - Show warning if drug selected is NA drug.

  04/12/13 [V5.2 R6.6] /MK Change - Changed VetLink button to cxButton to allow for Drop-Down-Menu ButtonKind.
                                  - If Preference/AutoDownloadMailAttachments then VetLink/ButtonKind = DropDownMenuButton else Standard.
                                  - Show Mailbox if Preference/AutoDownloadMailAttachments on ButtonClick.

  30/04/14 [V5.3 R0.0] /MK Bug Fix - Moved DrugUsed.OnChange code to DrugUsed.OnEditValueChanged so user can type in Medicine name.

  11/06/14 [V5.3 R1.7] /MK Bug Fix - Put same code for DrugUsed.OnEditValueChanged into DrugUsed.OnChange so that on FormShow
                                     the DrugUsed.OnChange is called and the LookupBatchNo is called.

  08/07/14 [V5.3 R3.1] /MK Additional Feature - HealthNavBeforeAction - If drug selected and no application rate then don't allow event to be saved - GL & Margaret Murphy request.

  28/08/14 [V5.3 R5.7] /MK Additional Feature - ShowHealth - Pass in const boolean variable for CrushTreatment.
                                                           - Change RateApplic caption to Quantity Used if Crush user - IAD/GL request.
                                                           - Remove PerDose label and DrugCost field if Crush user - IAD/GL request.

  25/09/14 [V5.3 R6.4] /MK Change - ShowHealth - Show AdminBy and PrescribedBy fields if WinData.EventType = THerdVaccination.

  02/12/14 [V5.4 R0.2] /MK Bug Fix - dbHealthBatchNoPropertiesEditValueChanged, dbHealthBatchNoExit - Added FindExpiryDate to these procedures
                                     so that on Edit the Expiry Date shows - reported by GL/Anne Cash.

  20/01/15 [V5.4 R0.8] /MK Bug Fix - FindExpiryDate - If user enters in a BatchNo manually, then enters in a Veterinary Purchase for this BatchNo
                                                      and edits the health event for this BatchNo the system should set the DrugPurchID of the purchase.

  23/03/15 [V5.4 R3.4] /MK Additional Feature - HealthNavBeforeAction - If drug selected and no administered or prescribed by then don't allow event to be saved - GL/TOK request.

  23/03/15 [V5.4 R3.4] /MK Change - Changed AdminBy to RXDBLookupCombo for better checking of no admin by selected.

  23/04/15 [V5.4 R4.0] /MK Change - dbHealthBatchNoPropertiesCloseUp - Added BatchNo to DrugBatchQtyRemaining for checking of total of all purchases for this BatchNo.

  14/08/15 [V5.4 R7.4] /MK Additional Feature - HealthNavBeforeAction - If the animal was sold check to see if the SALE DATE (NOT DEATH DATE) falls
                                                                        within the withdrawal period then show warning before saving event.

  09/11/15 [V5.5 R0.5] /MK Change - Changed the LookupSource of AdminBy and PrescribedBy to new HerdLookup datasources as
                                    a result of the new IsVet boolean field in the MedAdmin table.

  02/12/15 [V5.5 R1.4] /MK Change - HealthNavBeforeAction - Removed the requirement to enter the prescribed by - GL/SP/Peter Maguire.

  13/01/16 [V5.5 R2.2] /MK Bug Fix - ApplicMethodCloseUp - Refresh query to get newly added applic methods.
                                   - AdMinByCloseUp, PrescribedByCloseUp - Refresh both AdminBy and Prescribed query's just in case user adds both types.

  15/02/16 [V5.5 R3.8] /MK Additional Feature - If Crush User (IAD) then switch the Current Group to From Pen.

  08/03/16 [V5.5 R5.4] /MK Bug Fix - DrugUsedPropertiesEditValueChanged - If editing Health, DryOff or Vaccination and the user is changing the drug used
                                                                          then check that the batch no for the new drug isn't the same as the batch number for the
                                                                          the old drug. If its not then clear out the BatchNo.
                                   - Removed all instances of DoComment as its not required - SP supervised removal.
                                   - DrugUsedPropertiesCloseUp - If user is adding or ameding a Health event ( not dry off or vaccination - SP ) then change the comment
                                                                 to the code of the drug. If RateApplic entered then add RateApplic value to the comment as well.

  15/08/16 [V5.5 R8.0] /MK Bug Fix - FindExpiryDate - Check Expiry message should only appear if expiry date is a month less than the event date not today's date.

  08/05/17 [V5.6 R8.0] /MK Additional Feature - Added Medicine Purchase to the screen - requested by Anne Ryan.

  07/07/17 [V5.6 R9.1] /MK Change - If adding health or dryoff only then in use administered by records - Eddie Jordan (UCD).
                                  - If adding health or dryoff only then in use prescribed by records - Eddie Jordan (UCD).
                                  - If editing health, dryoff or vaccination then show in use administered by records - Eddie Jordan (UCD).
                                  - If editing health, dryoff or vaccination then show in use prescribed by records - Eddie Jordan (UCD).

  22/08/17 [V5.7 R2.0] /MK Bug Fix - Default the comment to name of the drug with application rate and unit code.
                           Change - Removed the drug code from the drug drop down list.

  14/09/17 [V5.7 R3.0] /MK Change - Changed WinData.AddToGroup to WinData.GroupManager.AddToGroup for more accurate calculation of FeedAllocation date based on purchase/birth date.

  22/09/17 [V5.7 R3.0] /MK Bug Fix - When an animal is added to a batch group after an animal remedy it was entering the group with todays date not treatment date.

  22/11/17 [V5.7 R4.6] /MK Bug Fix - ShowHideHealthControls - The below component's had lost their lookup source, list source or repository after Delphi crash - Huelwen (Ed Dale's).

  06/12/17 [V5.7 R6.0] /MK Bug Fix - HealthNavBeforeAction - If Meat or Milk were empty, invalid date message would appear here.

  14/08/18 [V5.8 R2.3] /MK Bug Fix - HealthNavBeforeAction - If treatment is being entered after the animal is sold, the withdrawal prompt was always appearing if the
                                                             withdrawal date was greater then treatment date but should only appear if the withdrawal date is greater than
                                                             the animals actual sale date - John Merrick.
                           Change - HealthNavBeforeAction - Before checking withdrawal date check if event date is after sale date instead of waiting for the
                                                            event to post to DairyData and then do the check.

  24/01/19 [V5.8 R6.3] /MK Change - Added AmendMastitis to TAddOrAmendHealth.
                                  - If AmendMastitis then change the caption of the screen to Mastitis.

  30/01/19 [V5.8 R6.5] /MK Change - Added AmendLameness to TAddOrAmendHealth.
                                  - If AmendLameness then change the caption of the screen to Lameness.
                                  - Added the Area Treated check boxes for editing of the Mastitis and Lameness events.
                                  - Added the Treatment Used drop-down-list for editing of Lameness events.
                                  - Added code to only show these controls if editing Mastitis or Lameness events.
                                  - Moved the ICBF/Reason drop-down-list if editing Mastitis or Lameness events.
                                  - On change of the new checkboxes for Mastitis or Lameness, change the event comment accordingly.

   07/06/19 [V5.8 R9.3] /MK Change - LookupBatchNo - If adding a health or dry off then only show batch's with quantity remaining - this helps where two batchs of same number, one has quantity and the other doesn't - Una Carter.

   27/06/19 [V5.8 R9.7] /MK Bug Fix - dbHealthBatchNoPropertiesEditValueChanged - No need to assign FDrugPurchID to object if HealthDrugPurchID.AsInteger > 0.
                                                                                  This would cause the wrong purchase id to be allocated to an edited drug.

   21/02/20 [V5.9 R2.4] /MK Bug Fix - dbHealthBatchNoPropertiesEditValueChanged - If the State is Insert then the DrugPurchID was not being assigned.

   07/04/20 [V5.9 R3.1] /MK Bug Fix - dbHealthBatchNoPropertiesEditValueChanged - When editing the event check to see if the user has changed the DrugBatchNo, then set DrugPurchID to this new value.
                                    - ShowHealth - When editing the event change the qDrugBatchNo query to look at all batch numbers regardless of whether they are in use or not.
                                                 - When adding the event change the qDrugBatchNo query to look at only batch numbers that are in use.
                                    - FormClose - When closing the form change the query back to the default where only in use batch numbers appear.

   08/11/21 [V6.0 R2.8] /MK Bug Fix - Fixed the tab order - Kathleen Porter.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, ToolEdit, RXDBCtrl,
  RXLookup, Db, CurrEdit, RXCtrls, uListAnimals, ToolWin, kwDBNavigator,
  DBTables, DBCtrlsEh, RXSpin, cxControls, cxContainer, cxEdit, cxGroupBox,
  ActnList, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GenTypesConst,
  DBLookupEh, cxDBEdit, uDrugsRegisterImport, cxCurrencyEdit, Menus, uImageStore,
  cxLabel, uHerdLookup, EventRecording, uFileAttachmentImport,
  uMailBoxHelper, HealthData, uMediPurch, cxCheckBox;

type
  TWithdrawalType = (wdMeat, wdMilk, wdOther);
  TAddOrAmendHealth = (AddHealth, AmendHealth, AddDryingOff, AmendDryingOff, AmendVaccination, AmendMastitis, AmendLameness);
  TfHealth = class(TkwEventForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    HealthNav: TkwDBNavigator;
    qDrugList: TQuery;
    dsDrugList: TDataSource;
    Panel2: TPanel;
    gbAnimalID: TcxGroupBox;
    lNo: TLabel;
    SearchForAnimal: TComboEdit;
    gbMedAdmin: TcxGroupBox;
    Label3: TLabel;
    DateHealth: TDBDateEdit;
    Label2: TLabel;
    xDays: TRxSpinEdit;
    Label15: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    DrugUsedOld: TRxDBLookupCombo;
    xTimes: TRxSpinEdit;
    Label10: TLabel;
    BatchNo: TRxDBLookupCombo;
    lRateApplic: TLabel;
    Label5: TLabel;
    RateApplicOld: TDBEdit;
    lDoseUnit: TLabel;
    DrugCost: TCurrencyEdit;
    gbAdminDetails: TcxGroupBox;
    lICBFCode: TLabel;
    ICBFCode: TRxDBLookupCombo;
    lFarmCode: TLabel;
    FarmCode: TRxDBLookupCombo;
    lAdminBy: TLabel;
    lApplicMethod: TLabel;
    ApplicMethod: TRxDBLookupCombo;
    lPrescribBy: TLabel;
    PrescribedBy: TRxDBLookupCombo;
    gbComments: TcxGroupBox;
    lDayReport: TLabel;
    dbComment: TDBEdit;
    cxButton1: TcxButton;
    ActionList1: TActionList;
    actDetailedComment: TAction;
    qDrugListID: TIntegerField;
    qDrugListDrugCode: TStringField;
    qDrugListName: TStringField;
    qDrugListWithdrawal: TFloatField;
    qDrugListDoseUnit: TIntegerField;
    qDrugListPurchUnit: TIntegerField;
    qDrugListQuantityInStock: TFloatField;
    qDrugListCostPurchUnit: TFloatField;
    qDrugListMilkWithDrawal: TIntegerField;
    qDrugListOtherWithDrawal: TIntegerField;
    HealthReportDesc: TRxDBLookupCombo;
    lGroup: TLabel;
    GroupListing: TRxDBLookupCombo;
    LookupHealthDescriptions: TcxDBLookupComboBox;
    lNumberOfDaysToReport: TLabel;
    seNumberOfDaysToReport: TRxSpinEdit;
    AdMinByOld: TDBLookupComboboxEh;
    gbWithdrawalDates: TcxGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Meat: TDBEditEh;
    Milk: TDBEditEh;
    Other: TDBEditEh;
    DWOrganicMeat: TDBEditEh;
    DWOrganicMilk: TDBEditEh;
    DWOrganicOther: TDBEditEh;
    lDWStandard: TLabel;
    lDWOrganic: TLabel;
    gbDrugExpiry: TcxGroupBox;
    lDrgExpiryDate: TDBEditEh;
    ToolButton4: TToolButton;
    sbMedicineSetup: TRxSpeedButton;
    dbHealthBatchNo: TcxDBComboBox;
    ToolButton5: TToolButton;
    dblcbVaccDisease: TcxDBLookupComboBox;
    RateApplic: TcxDBCurrencyEdit;
    btnAddorEditMedicine: TcxButton;
    DrugUsed: TcxDBLookupComboBox;
    pmAddOrEdit: TPopupMenu;
    pmiAddMedicine: TMenuItem;
    pmiEditMedicine: TMenuItem;
    actEditMedicine: TAction;
    actAddMedicine: TAction;
    lN_A_DrugInfo: TcxLabel;
    btnVetLink: TcxButton;
    pmVetLinkScreen: TPopupMenu;
    pmiVetLinkScreen: TMenuItem;
    AdminBy: TRxDBLookupCombo;
    btnPurchaseDrugs: TRxSpeedButton;
    ToolButton6: TToolButton;
    actMediPurch: TAction;
    pAreaTreated: TPanel;
    lAreaTreated: TcxLabel;
    dbcbAreaTreatedFL: TcxDBCheckBox;
    dbcbAreaTreatedFR: TcxDBCheckBox;
    dbcbAreaTreatedBL: TcxDBCheckBox;
    dbcbAreaTreatedBR: TcxDBCheckBox;
    lLameTreatment: TcxLabel;
    dblcLameTreatment: TRxDBLookupCombo;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure DrugUsedExit(Sender: TObject);
    procedure DrugUsedPropertiesCloseUp(Sender: TObject);
    procedure AdMinBy1CloseUp(Sender: TObject);
    procedure ApplicMethodCloseUp(Sender: TObject);
    procedure ICBFCodeCloseUp(Sender: TObject);
    procedure HealthNavClick(Sender: TObject; Button: TKNavigateBtn);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateHealthChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BatchNoCloseUp(Sender: TObject);
    procedure AdMinByCloseUp(Sender: TObject);
    procedure FillWithDrawalDates;
    procedure HealthNavBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure xDaysChange(Sender: TObject);
    procedure qICBFHealthBeforeOpen(DataSet: TDataSet);
    procedure FarmCodeCloseUp(Sender: TObject);
    procedure actDetailedCommentExecute(Sender: TObject);
    procedure HealthReportDescCloseUp(Sender: TObject);
    procedure BatchNoChange(Sender: TObject);
    procedure RateApplicOldChange(Sender: TObject);
    procedure DrugCostChange(Sender: TObject);
    procedure xTimesChange(Sender: TObject);
    procedure ICBFCodeChange(Sender: TObject);
    procedure FarmCodeChange(Sender: TObject);
    procedure AdMinBy1Change(Sender: TObject);
    procedure PrescribedByChange(Sender: TObject);
    procedure ApplicMethodChange(Sender: TObject);
    procedure GroupListingChange(Sender: TObject);
    procedure dbCommentChange(Sender: TObject);
    procedure HealthReportDescChange(Sender: TObject);
    procedure seNumberOfDaysToReportChange(Sender: TObject);
    procedure AdMinByChange(Sender: TObject);
    procedure sbMedicineSetupClick(Sender: TObject);
    procedure dbHealthBatchNoPropertiesChange(Sender: TObject);
    procedure dbHealthBatchNoPropertiesCloseUp(Sender: TObject);
    procedure dbHealthBatchNoKeyPress(Sender: TObject; var Key: Char);
    procedure btnVetLinkClick(Sender: TObject);
    procedure dblcbVaccDiseasePropertiesChange(Sender: TObject);
    procedure dblcbVaccDiseasePropertiesCloseUp(Sender: TObject);
    procedure RateApplicPropertiesChange(Sender: TObject);
    procedure LookupHealthDescriptionsEnter(Sender: TObject);
    procedure actAddMedicineExecute(Sender: TObject);
    procedure actEditMedicineExecute(Sender: TObject);
    procedure pmiVetLinkScreenClick(Sender: TObject);
    procedure dbHealthBatchNoPropertiesEditValueChanged(Sender: TObject);
    procedure dbHealthBatchNoExit(Sender: TObject);
    procedure DrugUsedPropertiesEditValueChanged(Sender: TObject);
    procedure DrugUsedPropertiesChange(Sender: TObject);
    procedure PrescribedByCloseUp(Sender: TObject);
    procedure actMediPurchExecute(Sender: TObject);
    procedure dbcbAreaTreatedPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    CountryOfReg : TCountry;
    FAddOrAmend : TAddOrAmendHealth;
    FDrugPurchID : Integer;
    FHerdType : THerdType;
    FCrushTreat : Boolean;
    procedure WithDrawalDaysLeft;
    procedure LookupBatchNo;
    procedure FindExpiryDate;
    procedure GetGroupInfo;
    procedure ShowHideHealthControls;
    procedure QueryHealthLookupDescriptions(const AActive : Boolean);
    procedure SetDayReportCaption;
    procedure SetBatchNoByDrugPurchId;
    procedure GetDrugCost_BatchInfo;

  public
    { Public declarations }
  end;

  procedure ShowHealth(AddorAmend : TAddOrAmendHealth; const ACrushTreat : Boolean = False );


implementation
uses
    uGenLookSetUp,
    uMedicineSetUp,
    uMediAdminSetUp,
    DairyData,
    uEventDesc,
    KRoutines;

const
   cN_A_Warning = ' withdrawal not available or not applicable.';

{$R *.DFM}

procedure ShowHealth(AddorAmend : TAddOrAmendHealth; const ACrushTreat : Boolean = False );
begin
   with TfHealth.Create(nil) do
      try
         WinData.LookUpMedicine.Active := True;
         CountryOfReg := WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger);
         FHerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger);
         lN_A_DrugInfo.Top := 82;
         lN_A_DrugInfo.Visible := False;

         FAddOrAmend := AddorAmend;

         HerdLookup.qICBFHealthCodes.Active := True;
         HerdLookup.qNonICBFHealthCodes.Active := True;
         HerdLookup.HerdOwnerData.HerdID := WinData.AnimalFileByIDHerdID.AsInteger;

         HerdLookup.qLookupTreatmentUsed.Active := True;

         if ( not(HerdLookup.QueryAdminBy.Active) ) then
            HerdLookup.QueryAdminBy.Active := True;
         AdminBy.LookupSource := HerdLookup.LookupAdminBy;
         if ( not(HerdLookup.QueryPrescribedBy.Active) ) then
            HerdLookup.QueryPrescribedBy.Active := True;
         PrescribedBy.LookupSource := HerdLookup.LookupPrescribedBy;

         if ( not(HerdLookup.HerdOwnerData.OrganicHerd) ) then
            begin
               lDWStandard.Visible := False;
               lDWOrganic.Visible := False;
               DWOrganicMeat.Visible := False;
               DWOrganicMilk.Visible := False;
               DWOrganicOther.Visible := False;
               //gbWithdrawalDates.Height := 68;
            end;

         dbHealthBatchNo.Enabled := False;

         //   07/04/20 [V5.9 R3.1] /MK Bug Fix - When editing the event change the qDrugBatchNo query to look at all batch numbers regardless of whether they are in use or not.
         WinData.qDrugBatchNo.Active := False;
         if ( FAddOrAmend in [AmendHealth, AmendDryingOff, AmendVaccination, AmendMastitis, AmendLameness] ) then
            begin
               WinData.qDrugBatchNo.SQL.Clear;
               WinData.qDrugBatchNo.SQL.Add('SELECT MP.ID, MP.DrugID, MP.BatchNo, MP.ExpiryDate, M.Name, MP.QtyRemaining');
               WinData.qDrugBatchNo.SQL.Add('FROM MediPur MP');
               WinData.qDrugBatchNo.SQL.Add('LEFT JOIN Medicine M ON (M.ID=MP.DrugID)');
               WinData.qDrugBatchNo.SQL.Add('WHERE TRIM(MP.BatchNo) <> ""');
               WinData.qDrugBatchNo.SQL.Add('ORDER BY MP.ID DESC');
            end
         //   07/04/20 [V5.9 R3.1] /MK Bug Fix - When adding the event change the qDrugBatchNo query to look at only batch numbers that are in use.
         else
            begin
               WinData.qDrugBatchNo.SQL.Clear;
               WinData.qDrugBatchNo.SQL.Add('SELECT MP.ID, MP.DrugID, MP.BatchNo, MP.ExpiryDate, M.Name, MP.QtyRemaining');
               WinData.qDrugBatchNo.SQL.Add('FROM MediPur MP');
               WinData.qDrugBatchNo.SQL.Add('LEFT JOIN Medicine M ON (M.ID=MP.DrugID)');
               WinData.qDrugBatchNo.SQL.Add('WHERE MP.InUse=TRUE');
               WinData.qDrugBatchNo.SQL.Add('AND TRIM(MP.BatchNo) <> ""');
               WinData.qDrugBatchNo.SQL.Add('ORDER BY MP.ID DESC');
            end;
         WinData.qDrugBatchNo.Active := True;

         WinData.qDrugBatchNo.Filter := '';
         WinData.qDrugBatchNo.Filtered := False;

         WinData.ModifyingEvent := False;
         if AddorAmend in [AmendDryingOff, AddDryingOff] then
            begin
               WinData.EventType := TDryOff;
               Caption := 'Drying Off';
               pSexToList := 'Female';
               lICBFCode.Caption := 'Health Code (ICBF)';
               ICBFCode.LookupSource := HerdLookup.dsICBFHealthCodes;
            end
         //   17/09/12 [V5.0 R9.9] /MK Change - Made allowance for Vaccination Event Type.
         else if ( AddOrAmend = AmendVaccination ) then
            begin
               WinData.EventType := THerdVaccination;
               Caption := 'Vaccination';
               pSexToList := '';
               lICBFCode.Caption := 'Disease';
               ICBFCode.Visible := False;
               lFarmCode.Visible := False;
               FarmCode.Visible := False;
               lApplicMethod.Visible := False;
               ApplicMethod.Visible := False;
               lGroup.Visible := False;
               GroupListing.Visible := False;
               dblcbVaccDisease.Top := ICBFCode.Top;
               dblcbVaccDisease.Left := ICBFCode.Left;
               lAdminBy.Visible := True;
               lAdminBy.Left := lICBFCode.Left;
               lAdminBy.Top := lICBFCode.Top + 29;
               AdMinBy.Visible := True;
               AdMinBy.Top := ICBFCode.Top + 28;
               AdminBy.Left := ICBFCode.Left;
               lPrescribBy.Visible := True;
               lPrescribBy.Top := lAdminBy.Top + 29;
               lPrescribBy.Left := lAdminBy.Left;
               PrescribedBy.Visible := True;
               PrescribedBy.Top := AdMinBy.Top + 29;
               PrescribedBy.Left := AdMinBy.Left;

               if ( CountryOfReg = Ireland ) then
                  dblcbVaccDisease.DataBinding.DataField := 'HealthCode'
               else
                  dblcbVaccDisease.DataBinding.DataField := 'FarmCode';
               dblcbVaccDisease.Properties.ListSource := HerdLookup.dsHerdVaccineType;
               if ( not(HerdLookup.qHerdVaccineType.Active) ) then
                  HerdLookup.qHerdVaccineType.Active := True;
            end
         else if ( AddOrAmend in [AddHealth, AmendHealth, AmendMastitis, AmendLameness] ) then
            begin
               if ( CountryOfReg = Ireland ) then
                  lFarmCode.Caption := 'Health Code (Farm)'
               else
                  lFarmCode.Caption := 'Reason';
               WinData.EventType := THealth;
               if ( AddOrAmend in [AddHealth, AmendHealth] ) then
                  Caption := 'Veterinary Treatments'
               else if ( AddOrAmend = AmendMastitis ) then
                  Caption := 'Mastitis'
               else if ( AddOrAmend = AmendLameness ) then
                  Caption := 'Lameness';
               pSexToList := '';
               lICBFCode.Caption := 'Health Code (ICBF)';
               ICBFCode.LookupSource := HerdLookup.dsICBFHealthCodes;
            end;

         ThisCombo := SearchForAnimal;
         ThisNav := HealthNav;
         ThisComment := dbComment;

         if (AddorAmend in [AddHealth,AddDryingOff]) then
            begin
               HealthNav.VisibleButtons := [kwnbPost,kwnbCancel];
               AddEvent;
               xDays.AsInteger  := 1;
               xTimes.AsInteger := xDays.AsInteger;

               if ( CountryOfReg = England ) then
                  seNumberOfDaysToReport.Value := 7
               else
                  seNumberOfDaysToReport.Value := 0;

               btnAddorEditMedicine.Caption := 'Add';
               btnAddorEditMedicine.Action := actAddMedicine;
               //ImageStore.ImageList16x16.GetBitmap(9,btnAddorEditMedicine.Glyph);
               btnAddorEditMedicine.Kind := cxbkStandard;
               btnAddorEditMedicine.DropDownMenu := nil;
            end
         else
            begin
               WinData.SetEventsToEdit; { 1) 12/09/02 SP }
               HealthNav.VisibleButtons := [kwnbDelete,kwnbPost,kwnbCancel];
               xDays.AsInteger  := WinData.HealthNoDays.AsInteger;
               xTimes.AsInteger := WinData.HealthNoTimes.AsInteger;
               seNumberOfDaysToReport.Value := WinData.HealthReportInDays.AsInteger;
               FillWithDrawalDates;
               WinData.ModifyingEvent := True;

               btnAddorEditMedicine.Caption := 'Add/Edit';
               btnAddorEditMedicine.Action := nil;
               btnAddorEditMedicine.Glyph := nil;
               btnAddorEditMedicine.Kind := cxbkDropDown;
               btnAddorEditMedicine.DropDownMenu := pmAddOrEdit;
               // 09/02/2009 [Dev 3.9 R6.0] /SP Bug Fix
               DrugCost.Value := WinData.CalcDrugCost( WinData.HealthDrugUsed.AsInteger, WinData.HealthRateApplic.AsFloat,xDays.AsInteger*xTimes.AsInteger );
               WinData.CalcCostAndQtyUsed(WinData.HealthDrugUsed.AsInteger,WinData.HealthRateApplic.AsFloat,
                                          WinData.Health,WinData.HealthNoDays.AsInteger*WinData.HealthNoTimes.AsInteger);
               DrugCost.Value := WinData.DrugCost;
            end;

         //   18/12/12 [V5.1 R3.5] /MK Change - If amending a Vaccination then show ReportInDays in weeks.
         if ( AddOrAmend = AmendVaccination ) then
            seNumberOfDaysToReport.Value := WinData.HealthReportInDays.AsInteger div 7;

         SetDayReportCaption;
         // Set the Animal Number to the one on the Grid
         SetSearchField(SearchForAnimal);

         //   17/04/13 [V5.1 R6.3] /MK Change - If ameding then show all Medicine's. If adding show in use medicines.
         qDrugList.Close;
         qDrugList.SQL.Clear;
         if ( AddorAmend in [AmendHealth, AmendDryingOff, AmendVaccination] ) then
            begin
               qDrugList.SQL.Add('SELECT * FROM Medicine');
               qDrugList.SQL.Add('ORDER BY Name');
            end
         else
            begin
               qDrugList.SQL.Add('SELECT * FROM Medicine');
               qDrugList.SQL.Add('WHERE InUse = True');
               qDrugList.SQL.Add('ORDER BY Name');
            end;
         try
            qDrugList.Open;
         except
         end;

         //   07/07/17 [V5.6 R9.1] /MK Change - If adding health or dryoff only then in use administered by records - Eddie Jordan (UCD).
         //                                   - If adding health or dryoff only then in use prescribed by records - Eddie Jordan (UCD).
         if ( AddorAmend in [AddHealth, AddDryingOff] ) then
            begin
               HerdLookup.QueryAdminBy.SQL.Clear;
               HerdLookup.QueryAdminBy.SQL.Add('SELECT *');
               HerdLookup.QueryAdminBy.SQL.Add('FROM MedAdmin');
               HerdLookup.QueryAdminBy.SQL.Add('WHERE (InUse = True)');
               HerdLookup.QueryAdminBy.SQL.Add('ORDER BY Name');

               HerdLookup.QueryPrescribedBy.SQL.Clear;
               HerdLookup.QueryPrescribedBy.SQL.Add('SELECT *');
               HerdLookup.QueryPrescribedBy.SQL.Add('FROM MedAdmin');
               HerdLookup.QueryPrescribedBy.SQL.Add('WHERE (IsVet = True)');
               HerdLookup.QueryPrescribedBy.SQL.Add('AND   (InUse = True)');
               HerdLookup.QueryPrescribedBy.SQL.Add('ORDER BY Name');
            end
         else
         //   07/07/17 [V5.6 R9.1] /MK Change - If editing health, dryoff or vaccination then show in use administered by records - Eddie Jordan (UCD).
         //                                   - If editing health, dryoff or vaccination then show in use prescribed by records - Eddie Jordan (UCD).
            begin
               HerdLookup.QueryAdminBy.SQL.Clear;
               HerdLookup.QueryAdminBy.SQL.Add('SELECT *');
               HerdLookup.QueryAdminBy.SQL.Add('FROM MedAdmin');
               HerdLookup.QueryAdminBy.SQL.Add('ORDER BY Name');

               HerdLookup.QueryPrescribedBy.SQL.Clear;
               HerdLookup.QueryPrescribedBy.SQL.Add('SELECT *');
               HerdLookup.QueryPrescribedBy.SQL.Add('FROM MedAdmin');
               HerdLookup.QueryPrescribedBy.SQL.Add('WHERE IsVet = True');
               HerdLookup.QueryPrescribedBy.SQL.Add('ORDER BY Name');
            end;
         try
            HerdLookup.QueryAdminBy.Open;
            HerdLookup.QueryPrescribedBy.Open;
         except
         end;

         DrugUsedExit(nil);
         GetGroupInfo;

         //   11/10/12 [V5.1 R0.3] /MK Bug Fix - Fix for if two variations of adding in a treatment.
         //                                    - If adding from block screen then program saves just DrugPurchID and not DrugBatchNo to Health.db.
         //                                    - If adding from single treatment program save both DrugPurchID and DrugBatchNo to Health.db.
{         if ( AddorAmend in [AmendHealth, AmendDryingOff, AmendVaccination] ) then
            begin
               if ( WinData.Health.FieldByName('DrugPurchID').AsInteger > 0 ) and
                  ( Length(WinData.Health.FieldByName('DrugBatchNo').AsString) = 0 ) then
                  begin
                     dbHealthBatchNo.DataBinding.DataSource := WinData.dsDrugBatchNo;
                     dbHealthBatchNo.DataBinding.DataField := 'BatchNo';
                  end
               else
                  begin
                     dbHealthBatchNo.DataBinding.DataSource := WinData.dsHealth;
                     dbHealthBatchNo.DataBinding.DataField := 'DrugBatchNo';
                  end;
            end
         else
            begin
               dbHealthBatchNo.DataBinding.DataSource := WinData.dsHealth;
               dbHealthBatchNo.DataBinding.DataField := 'DrugBatchNo';
            end; }

         // SP 08/04/2014

         dbHealthBatchNo.DataBinding.DataSource := WinData.dsHealth;
         dbHealthBatchNo.DataBinding.DataField := 'DrugBatchNo';

         //   02/08/12 [V5.0 R8.3] /MK Bug Fix - FindExpiryDate should be opened after dbHealthBatchNo.DataBinding is set.
         FindExpiryDate;

         //   28/08/14 [V5.3 R5.7] /MK Additional Feature - Change RateApplic caption to Quantity Used if Crush user - IAD/GL request.
         //                                                 Remove PerDose label and DrugCost field if Crush user - IAD/GL request.
         FCrushTreat := ACrushTreat;
         if ( FCrushTreat ) then
            lRateApplic.Caption := 'Quantity Used'
         else
            lRateApplic.Caption := 'Applic. Rate';
         Label5.Visible := ( not(FCrushTreat) );
         DrugCost.Visible := ( not(FCrushTreat) );



         ShowModal;
      finally
         WinData.LookUpMedicine.Active := False;
         HerdLookup.qICBFHealthCodes.Active := False;
         HerdLookup.qNonICBFHealthCodes.Active := False;
         HerdLookup.qLookupTreatmentUsed.Active := False;
         Free;
      end;
end;

procedure TfHealth.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfHealth.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified );
end;

procedure TfHealth.FormActivate(Sender: TObject);
begin
   lNo.Caption := NoLabel;
   WinData.qApplicMethod.Open;
   WinData.qHealthCodes.Open;

   //   17/10/12 [V5.1 R0.4] /MK Additional Feature - Added check for active medicines.
   if ( WinData.ActiveMedicineCount = 0 ) then
      begin
         MessageDlg('No active medicines have been found.'+CCRLF+
                    'Please set up your active medicine(s)',mtInformation,[mbOK],0);
         uMedicineSetUp.ShowTheForm(0);
         qDrugList.Close;
         qDrugList.Open;
      end;

   if ( FHerdType = htSuckler ) and ( FAddOrAmend in [AddDryingOff, AmendDryingOff] ) then
      Caption := 'Weaning';

   inherited FormActivate(Sender);

  // ShowMessage(WinData.HealthAdminBy.AsString);
//   ShowMessage(AdMinBy.Value);
end;

procedure TfHealth.DrugUsedExit(Sender: TObject);
begin
//   Calculate the Drug Cost
//   WinData.CalcCostAndQtyUsed(WinData.HealthDrugUsed.AsInteger,WinData.HealthRateApplic.AsFloat, WinData.Health );
//   DrugCost.Value := WinData.DrugCost;

    //dbCommentEnter(Sender);
    // Shane P. 09/02/01
end;

procedure TfHealth.DrugUsedPropertiesCloseUp(Sender: TObject);
begin
   //dbCommentEnter(Sender);
   if ( DrugUsed.EditValue = 0 ) or ( DrugUsed.EditValue = Null ) then
      begin
         Meat.Text  := '';
         Milk.Text  := '';
         Other.Text := '';
         DWOrganicMeat.Text := '';
         DWOrganicMilk.Text := '';
         DWOrganicOther.Text := '';
         //qDrugList.Close;
         //uMedicineSetUp.ShowTheForm(0);
         //qDrugList.Open;
      end
   else
      begin
         FillWithDrawalDates;

         if ( WinData.EventType = TDryOff ) then
            if ( DrugUsed.EditValue = 0 ) or ( DrugUsed.EditValue = Null )then
               if (Milk.Value <> '') then
                  dbComment.Field.Value := DrugUsed.Text + ' / ' + Milk.Text
               else if (Milk.Value = '') then
                  dbComment.Field.Value := DrugUsed.Text
               else
                  dbComment.Field.Value := 'Drying Off';

         if ( FAddOrAmend in [AddHealth, AmendHealth] ) and
            ( WinData.GlobalSettings.HealthCodeDefaultCommentIndex = cDefaultHealthCommentDrugUsed ) and
            ( not(WinData.HealthManualComment.AsBoolean) )then
            begin
               if ( (DrugUsed.EditValue > 0) or (DrugUsed.EditValue <> Null) ) and ( Length(RateApplic.Text) > 0 ) then
                  dbComment.Field.Value := GetHealthCommentByName_Unit_ApplicRate(DrugUsed.EditValue,
                                                                                        StrToFloat(RateApplic.Text),WinData.EventType)
                        {
                        begin
                           //   05/12/12 [V5.1 R3.4] /MK Change - Default new Health Events EventDesc to Health - +DrugCode.
                           HerdLookup.qDrugList.Open;
                           if ( HerdLookup.qDrugList.Locate('ID',DrugUsed.EditValue,[]) ) then
                              dbComment.Field.Value := HerdLookup.qDrugList.FieldByName('DrugCode').AsString;
                           HerdLookup.qDrugList.Close;
                           if ( not(RateApplic.Text = '') ) or ( not(RateApplic.Text = '0') ) then
                              dbComment.Field.Value := dbComment.Field.Value+' '+RateApplic.Text+' '+lDoseUnit.Caption;
                        end;
                        }
               else
                  dbComment.Field.Value := 'Health';
            end;

         btnAddorEditMedicine.Caption := 'Add/Edit';
         btnAddorEditMedicine.Action := nil;
         btnAddorEditMedicine.Glyph := nil;
         btnAddorEditMedicine.Kind := cxbkDropDown;
         btnAddorEditMedicine.DropDownMenu := pmAddOrEdit;

         //   14/11/13 [V5.2 R5.4] /MK Additional Feature - Show warning if drug selected is NA drug.
         if WinData.Medicine.Locate('ID',DrugUsed.EditValue,[]) then
            begin
               if ( WinData.MedicineMilkN_A_Drug.AsBoolean ) then
                  begin
                     if ( MessageDlg(Format('The withdrawal for the selected medicine, %s, is not available or not applicable.'+cCRLF+
                                            'Do you wish to continue?',[WinData.MedicineName.AsString]),mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
                       DrugUsed.EditValue := 0;
                  end
               else if ( WinData.MedicineMeatN_A_Drug.AsBoolean ) then
                  begin
                     if ( MessageDlg(Format('The withdrawal for the selected medicine, %s, is not available or not applicable.'+cCRLF+
                                            'Do you wish to continue?',[WinData.MedicineName.AsString]),mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
                       DrugUsed.EditValue := 0;
                  end;
            end;
     end;

   DrugUsedExit(Sender);
end;

procedure TfHealth.AdMinBy1CloseUp(Sender: TObject);
begin
   If ( AdMinBy.Value = '0' ) or ( AdMinBy.Value = '' ) Then
      uMediAdminSetUp.ShowTheForm(TRUE,adAdministrator);
end;

procedure TfHealth.ApplicMethodCloseUp(Sender: TObject);
begin
   if ( ApplicMethod.Value = '0' ) then
      begin
         GenLookUpType := TApplicMethod;
         uGenLookSetUp.ShowTheForm(TRUE);
         //   13/01/16 [V5.5 R2.2] /MK Bug Fix - Refresh query to get newly added applic methods.
         WinData.qApplicMethod.Close;
         WinData.qApplicMethod.Open;
      end;
end;

procedure TfHealth.ICBFCodeCloseUp(Sender: TObject);
begin
   If ICBFCode.Value = '0' Then
      begin
         GenLookUpType := THealthCode;
         uGenLookSetUp.ShowTheForm(TRUE);
         HerdLookup.qICBFHealthCodes.Close;
         HerdLookup.qICBFHealthCodes.Open;

{         if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland then
            begin
               WinData.qICBFHealthCodes.Close;
               WinData.qICBFHealthCodes.Open;
            end
         else
            begin
               WinData.qHealthCodes.Close;
               WinData.qHealthCodes.Open;
            end;
}
      end;
end;

procedure TfHealth.HealthNavClick(Sender: TObject; Button: TKNavigateBtn);
begin
   { Save the animal to the selected group }
   if ( Button = kwnbPost ) then
      begin
         if ( LookupComboValue( GroupListing ) > 0 ) then
            if ( not(WinData.GroupManager.AnimalInThisGroup(WinData.AnimalFileByIDID.AsInteger, GroupListing.KeyValue)) ) then
               WinData.GroupManager.AddToGroup(WinData.AnimalFileByIDID.AsInteger,
                                               GroupListing.KeyValue,
                                               TRUE, DateHealth.Date, SearchForAnimal.Text );

         // If Irish Suckler Herd then on save of drying off event create weaning event for calf of selected cow.
         if ( WinData.EventType = TDryOff ) and ( FHerdType = htSuckler ) and ( CountryOfReg = Ireland ) and ( FAddOrAmend = AddDryingOff ) then
            WinData.CreateCalfWeaningEvent(WinData.AnimalFileByIDID.AsInteger,
                                           WinData.AnimalFileByIDLactNo.AsInteger,
                                           DateHealth.Date);

         if ( WinData.EventType = THealth ) then
            begin
               if (FAddOrAmend in [AddHealth, AddDryingOff]) and
                  (MessageDLG('Record Saved - Record Another?',mtInformation,[mbYes,mbNo],0) = mrYes) then
                  begin
                     AddEvent;
                     GetGroupInfo;
                     DrugCost.Clear;
                     DateHealth.SetFocus;
                  end
               else
                  Close;
            end
         else
            Close;
      end
   else
      Close;
end;

procedure TfHealth.SearchForAnimalButtonClick(Sender: TObject);
begin
   SearchButtonClick(Sender, lNo);
   Update;
//   SetSearchField(SearchForAnimal); Removed by SP, the search field value is updated during the SearchButtonClick event instead.
end;

procedure TfHealth.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
   SearchAnimalChange(Sender);
   Update;
   GetGroupInfo;
end;

procedure TfHealth.sbHelpClick(Sender: TObject);
begin
   if WinData.EventType = TDryOff then
      WinData.HTMLHelp('drying.htm')
   else
      WinData.HTMLHelp('treatments.htm')
end;

procedure TfHealth.FormShow(Sender: TObject);
begin
   qDrugList.open;
   ShowHideHealthControls;
   QueryHealthLookupDescriptions(True);
   SetBatchNoByDrugPurchId();
end;

procedure TfHealth.WithDrawalDaysLeft;
var
   TempDate : TDateTime;

   WithDrawalDays : Variant;
   MeatWDDays, MilkWDDays, OtherWDDays : Variant;
   OrganicMeatWDDays, OrganicMilkWDDays, OrganicOtherWDDays : Variant;

begin
   // SP 08/02/2002.
   // Revised SP 29/04/2003
   if (DrugUsed.EditValue = 0 ) or ( DrugUsed.EditValue = Null ) or (DateHealth.Date <= 0) then
      begin
         Meat.Text  := '';
         Milk.Text  := '';
         Other.Text := '';
         DWOrganicMeat.Text := '';
         DWOrganicMilk.Text := '';
         DWOrganicOther.Text := '';
         Exit;
      end;

   if ( WinData.IsN_A_Drug(DrugUsed.EditValue) ) then
      begin
         lN_A_DrugInfo.Visible := True;
         lN_A_DrugInfo.Top := 66;
         lN_A_DrugInfo.Left := 8;
         if ( FHerdType = htDairy ) then
            lN_A_DrugInfo.Caption := 'Milk'+cN_A_Warning
         else
            lN_A_DrugInfo.Caption := 'Meat'+cN_A_Warning;
      end
   else
      begin
         lN_A_DrugInfo.Top := 82;
         lN_A_DrugInfo.Visible := False;
      end;

   try
      WithDrawalDays := WinData.Medicine.Lookup('ID', DrugUsed.EditValue, 'Withdrawal;MilkWithDrawal;OtherWithdrawal;OrganicMeatWithdrawal;OrganicMilkWithdrawal;OrganicOtherWithdrawal');
      if not VarIsNull(WithDrawalDays) then
         begin
            MeatWDDays := WithDrawalDays[0];
            MilkWDDays := WithDrawalDays[1];
            OtherWDDays := WithDrawalDays[2];
            OrganicMeatWDDays := WithDrawalDays[3];
            OrganicMilkWDDays := WithDrawalDays[4];
            OrganicOtherWDDays := WithDrawalDays[5];

            if ((not VarIsNull(MeatWDDays)) and ( MeatWDDays > 0 )) then
               begin
                  TempDate := DateHealth.Date + (xDays.Value-1) + MeatWDDays;
                  if TempDate > Date then
                     Meat.Font.Color := clRed
                  else
                     Meat.Font.Color := clGreen;
                  if TempDate <> DateHealth.Date then
                     Meat.Text := FormatDateTime('dd/mm/yy',(TempDate));
               end
            else
               Meat.Text := '';

            if HerdLookup.HerdOwnerData.OrganicHerd then
               begin
                  if ((not VarIsNull(OrganicMeatWDDays)) and ( OrganicMeatWDDays > 0 )) then
                     begin
                        TempDate := DateHealth.Date + (xDays.Value-1) + OrganicMeatWDDays;
                        if TempDate > Date then
                           DWOrganicMeat.Font.Color := clRed
                        else
                           DWOrganicMeat.Font.Color := clGreen;
                        if TempDate <> DateHealth.Date then
                           DWOrganicMeat.Text := FormatDateTime('dd/mm/yy',(TempDate));
                     end
                  else
                     DWOrganicMeat.Text := '';
               end;

            if ((not VarIsNull(MilkWDDays)) and ( MilkWDDays > 0 )) then
               begin
                  TempDate := DateHealth.Date + (xDays.Value-1) + MilkWDDays;
                  // Milk.
                  if TempDate > Date then
                     Milk.Font.Color := clRed
                  else
                     Milk.Font.Color := clGreen;
                  if TempDate <> DateHealth.Date then
                     Milk.Text := FormatDateTime('dd/mm/yy',(TempDate));
               end
            else
               Milk.Text := '';

            if HerdLookup.HerdOwnerData.OrganicHerd then
               begin
                  if ((not VarIsNull(OrganicMilkWDDays)) and ( OrganicMilkWDDays > 0 )) then
                     begin
                        TempDate := DateHealth.Date + (xDays.Value-1) + OrganicMilkWDDays;
                        if TempDate > Date then
                           DWOrganicMilk.Font.Color := clRed
                        else
                           DWOrganicMilk.Font.Color := clGreen;
                        if TempDate <> DateHealth.Date then
                           DWOrganicMilk.Text := FormatDateTime('dd/mm/yy',(TempDate));
                     end
                  else
                     DWOrganicMilk.Text := '';
               end;

            if ((not VarIsNull(OtherWDDays)) and ( OtherWDDays > 0 )) then
               begin
                  TempDate := DateHealth.Date + (xDays.Value-1) + OtherWDDays;
                  // Other.
                  if TempDate > Date then
                     Other.Font.Color := clRed
                  else
                     Other.Font.Color := clGreen;
                  if TempDate <> DateHealth.Date then
                     Other.Text := FormatDateTime('dd/mm/yy',(TempDate));
               end
            else
               Other.Text := '';

            if HerdLookup.HerdOwnerData.OrganicHerd then
               begin
                  if ((not VarIsNull(OrganicOtherWDDays)) and ( OrganicOtherWDDays > 0 )) then
                     begin
                        TempDate := DateHealth.Date + (xDays.Value-1) + OrganicOtherWDDays;
                        if TempDate > Date then
                           DWOrganicOther.Font.Color := clRed
                        else
                           DWOrganicOther.Font.Color := clGreen;
                        if TempDate <> DateHealth.Date then
                           DWOrganicOther.Text := FormatDateTime('dd/mm/yy',(TempDate));
                     end
                  else
                     DWOrganicOther.Text := '';
               end;
         end;
   except
      Meat.Text  := '';
      Milk.Text  := '';
      Other.Text := '';
      DWOrganicMeat.Text := '';
      DWOrganicMilk.Text := '';
      DWOrganicOther.Text := '';
      MessageDlg('There has been an error calculating the '+#13#10+
                 'Medicine Withdrawal Dates - contact Kingswood',mtError,[mbOK],0);
   end;
   // SP 08/02/2002.
   // SP 29/04/2003
end;

procedure TfHealth.DateHealthChange(Sender: TObject);
begin
   SetModifiedFlag;
   if WinData.Events.State in dsEditModes then
      FillWithDrawalDates;
end;

procedure TfHealth.LookupBatchNo;
var
   qBatchNoFromManualEntry : TQuery;
begin
   //   10/04/12 [V5.0 R4.7] /MK Bug Fix - Need To Check If DrugUsed Is Not Blank Or Zero.
   if ( DrugUsed.EditValue > 0 ) then
      begin
         //   07/06/19 [V5.8 R9.3] /MK Change - If adding a health or dry off then only show batch's with quantity remaining - this helps where two batchs of same number, one has quantity and the other doesn't - Una Carter.
         WinData.qDrugBatchNo.Filter := '';
         if ( FAddOrAmend in [AddHealth, AddDryingOff] ) then
            WinData.qDrugBatchNo.Filter := 'DrugID = '+IntToStr(DrugUsed.EditValue)+' AND QtyRemaining > 0'
         else
            WinData.qDrugBatchNo.Filter := 'DrugID = '+IntToStr(DrugUsed.EditValue);
         WinData.qDrugBatchNo.Filtered := True;

         if not WinData.LookUpMedicine.Active then
            WinData.LookUpMedicine.Active := True;

         lDoseUnit.Caption := HerdLookup.LookupDrugDosePurchUnitCode(DrugUsed.EditValue,utDose);

         if ( not(WinData.qDrugBatchNo.Active) ) then
            WinData.qDrugBatchNo.Open;
         WinData.qDrugBatchNo.First;

         dbHealthBatchNo.Enabled := True;
         dbHealthBatchNo.Properties.Items.Clear;

         // Add line to BatchNo Purchase Medicine.
         dbHealthBatchNo.Properties.Items.Add('<Purchase Medicine>');

         // Now go through BatchNo's in Medicine Purchases that are active and add them to the list.
         while not WinData.qDrugBatchNo.Eof do
            begin
               //dbHealthBatchNo.Properties.Items.Add(WinData.qDrugBatchNo.FieldByName('BatchNo').AsString);
               if (dbHealthBatchNo.Properties.Items.IndexOf(WinData.qDrugBatchNo.FieldByName('BatchNo').AsString) = -1) then
                   begin
                      dbHealthBatchNo.Properties.Items.AddObject(WinData.qDrugBatchNo.FieldByName('BatchNo').AsString,
                                                                 Pointer(WinData.qDrugBatchNo.FieldByName('ID').AsInteger));
                   end;

               WinData.qDrugBatchNo.Next;
            end;

         //   03/08/12 [V5.0 R8.4] /MK Bug Fix - SQL was adding all BatchNo's from Health.db instead of only those that were entered manually.
         //   05/12/12 [V5.1 R3.4] /MK Bug Fix - Program was wrongly repeating the batch number, if manually entered, on the drop-down-list.
         // Now query the Health database for BatchNo's that were entered manually and add them to the list.
         qBatchNoFromManualEntry := TQuery.Create(nil);
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT Distinct(H.DrugBatchNo)');
               SQL.Add('FROM Health H');
               SQL.Add('WHERE (H.DrugBatchNo NOT IN (SELECT MP.BatchNo FROM MediPur MP))');
               SQL.Add('AND   (H.DrugBatchNo IS NOT Null)');
               SQL.Add('AND   (H.DrugUsed = :ADrugUsed)');
               Params[0].AsInteger := DrugUsed.EditValue;
               Open;
               try
                  First;
                  while not Eof do
                     begin
                        if (dbHealthBatchNo.Properties.Items.IndexOf(Fields[0].AsString) = -1) then
                           dbHealthBatchNo.Properties.Items.Add(Fields[0].AsString);
                        Next;
                     end;
               finally
                  Close;
               end;
            finally
               Free;
            end;

         // Add blank line to the list for manual entry.
         dbHealthBatchNo.Properties.Items.Add('');
      end
   else
      lDoseUnit.Caption := '';
end;

procedure TfHealth.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   QueryHealthLookupDescriptions(False);
   //   07/04/20 [V5.9 R3.1] /MK Bug Fix - When closing the form change the query back to the default where only in use batch numbers appear.
   WinData.qDrugBatchNo.SQL.Clear;
   WinData.qDrugBatchNo.SQL.Add('SELECT MP.ID, MP.DrugID, MP.BatchNo, MP.ExpiryDate, M.Name, MP.QtyRemaining');
   WinData.qDrugBatchNo.SQL.Add('FROM MediPur MP');
   WinData.qDrugBatchNo.SQL.Add('LEFT JOIN Medicine M ON (M.ID=MP.DrugID)');
   Windata.qDrugBatchNo.SQL.Add('WHERE MP.InUse=TRUE');
   WinData.qDrugBatchNo.SQL.Add('AND TRIM(MP.BatchNo) <> ""');
   WinData.qDrugBatchNo.SQL.Add('ORDER BY MP.ID DESC');
   WinData.qDrugBatchNo.Filter := '';
   WinData.qDrugBatchNo.Filtered := False;
   WinData.qDrugBatchNo.Active := False;
end;

procedure TfHealth.FindExpiryDate;
var
   sBatchNo : String;
   vDate : Variant;
   iDrugPurchID,
   iHealthDrugPurchID : Integer;
begin
   lDrgExpiryDate.Text := '';
   //if (BatchNo.Value = '0') or (BatchNo.Value = '') then Exit;
   if (dbHealthBatchNo.EditValue = '0') or (dbHealthBatchNo.EditValue = '') or (dbHealthBatchNo.EditValue = Null) then Exit;

   //vDate := WinData.qDrugBatchNo.Lookup('ID', BatchNo.Value, 'ExpiryDate');
   if ( not(WinData.qDrugBatchNo.Active) ) then
      WinData.qDrugBatchNo.Active := True;
   vDate := WinData.qDrugBatchNo.Lookup('BatchNo', dbHealthBatchNo.EditValue, 'ExpiryDate');
   if ( vDate <> Null ) then
      begin
         iDrugPurchID := 0;
         if ( WinData.qDrugBatchNo.Locate('BatchNo',dbHealthBatchNo.EditValue,[]) ) then
            iDrugPurchID := WinData.qDrugBatchNo.FieldByName('ID').AsInteger;
         iHealthDrugPurchID := 0;
         iHealthDrugPurchID := dbHealthBatchNo.DataBinding.DataSource.DataSet.FieldByName('DrugPurchID').AsInteger;
         //   20/01/15 [V5.4 R0.8] /MK Bug Fix - If user enters in a BatchNo manually, then enters in a Veterinary Purchase for this BatchNo
         //                                      and edits the health event for this BatchNo the system should set the DrugPurchID of the purchase.
         if ( dbHealthBatchNo.DataBinding.DataSource.DataSet.State = dsEdit ) then
            if ( not(WinData.qDrugBatchNo.Locate('ID',iHealthDrugPurchID,[])) ) then
               if ( iDrugPurchID > 0 ) and ( iDrugPurchID <> iHealthDrugPurchID ) then
                  dbHealthBatchNo.DataBinding.DataSource.DataSet.FieldByName('DrugPurchID').AsInteger := iDrugPurchID;
      end;
   if not VarIsNull(vDate) then
      begin
         lDrgExpiryDate.Text := FormatDateTime('dd/mm/yy', vDate);
         lDrgExpiryDate.Font.Color := clGreen;
         //   15/08/16 [V5.5 R8.0] /MK Bug Fix - Check Expiry message should only appear if expiry date is a month less than the event date not today's date.
         if vDate < IncMonth(DateHealth.Date, 1) then
            begin
               lDrgExpiryDate.Font.Color := clMaroon;
               if WinData.ModifyingEvent = False then // Only show message if new event.
                  MessageDlg('WARNING: Check Expiry Date' ,mtWarning,[mbOk],0);
            end;
      end
   else
      lDrgExpiryDate.Text := '';
end;

procedure TfHealth.BatchNoCloseUp(Sender: TObject);
begin
   if BatchNo.Value <> '0' then
      FindExpiryDate
   else if ( BatchNo.Value = '0' ) or ( BatchNo.Value = '' ) then
      begin
         TfMediPurch.Execute;
         WinData.qDrugBatchNo.Refresh;
      end;
end;

procedure TfHealth.AdMinByCloseUp(Sender: TObject);
begin
   if ( AdMinBy.Value = '0' ) or ( AdminBy.Value = '' ) then
      begin
         uMediAdminSetUp.ShowTheForm(TRUE,adAdministrator);
         //   13/01/16 [V5.5 R2.2] /MK Bug Fix - Refresh both AdminBy and Prescribed query's just in case user adds both types.
         HerdLookup.QueryAdminBy.Close;
         HerdLookup.QueryAdminBy.Open;

         HerdLookup.QueryPrescribedBy.Close;
         HerdLookup.QueryPrescribedBy.Open;
      end;
end;

procedure TfHealth.FillWithDrawalDates;
begin
   WithDrawalDaysLeft;
end;

procedure TfHealth.HealthNavBeforeAction(Sender: TObject; Button: TKNavigateBtn);
var
   SaleDate : TDateTime;
   dMeatWithdrawalDate,
   dMilkWithdrawalDate : TDateTime;
begin
    if ( Button = kwnbPost ) then
       if ( (DrugUsed.EditValue > 0) or (DrugUsed.EditValue <> Null) ) then
          begin
             //   14/08/15 [V5.4 R7.4] /MK Additional Feature - If the animal was sold check to see if the SALE DATE (NOT DEATH DATE) falls
             //                                                 within the withdrawal period then show warning before saving event.
             if ( WinData.EventType in ([THealth, THerdVaccination, TDryOff]) ) then
                begin
                   SaleDate := WinData.EventDataHelper.GetAnimalSaleEventDate(WinData.AnimalFileByIDID.AsInteger);
                   if ( SaleDate > 0 ) then
                      begin
                         //   14/08/18 [V5.8 R2.3] /MK Change - Before checking withdrawal date check if event date is after sale date instead of waiting
                         //                                     for the event to post to DairyData and then do the check.
                         if ( DateHealth.Date > SaleDate ) then
                            begin
                               MessageDlg(Format('Event date %s cannot be after Sale date %s.',
                                         [FormatDate(DateHealth.Date, dsIrish),
                                          FormatDate(SaleDate, dsIrish)]),mtError,[mbOk],0);
                               SysUtils.Abort;
                            end;

                         if ( not(lN_A_DrugInfo.Visible) ) then
                            begin
                               //   06/12/17 [V5.7 R6.0] /MK Bug Fix - If Meat or Milk were empty, invalid date message would appear here.
                               dMeatWithdrawalDate := 0;
                               if ( Length(Meat.Text) > 0 ) then
                                  dMeatWithdrawalDate := StrToDate(Meat.Text);
                               dMilkWithdrawalDate := 0;
                               if ( Length(Milk.Text) > 0 ) then
                                  dMilkWithdrawalDate := StrToDate(Milk.Text);
                               //   14/08/18 [V5.8 R2.3] /MK Bug Fix - If treatment is being entered after the animal is sold, the withdrawal prompt was always appearing if the
                               //                                      withdrawal date was greater then treatment date but should only appear if the withdrawal date is greater than
                               //                                      the animals actual sale date - John Merrick.
                               if ( dMeatWithdrawalDate > SaleDate ) or ( dMilkWithdrawalDate > SaleDate ) then
                                  if MessageDlg('This animal has been sold within this treatment withdrawal period.'+cCRLF+
                                                'Do you wish to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                     SysUtils.Abort;
                               end;
                            end;
                end;

             //   08/07/14 [V5.3 R3.1] /MK Additional Feature - If drug selected and no application rate then don't allow event to be saved - GL & Margart Murphy request.
             if ( RateApplic.EditValue = Null ) then
                begin
                   MessageDlg(Format('An Applic. Rate must be entered for this drug - %s',[DrugUsed.Text]),mtError,[mbOK],0);
                   SysUtils.Abort;
                end;

             //   23/03/15 [V5.4 R3.4] /MK Additional Feature - If drug selected and no administered by then don't allow event to be saved - GL/TOK request.
             if ( (AdMinBy.Value = '') or (AdMinBy.Value = '0') ) then
                begin
                   MessageDlg(Format('An Administered By must be entered for this drug - %s',[DrugUsed.Text]),mtError,[mbOK],0);
                   SysUtils.Abort;
                end;

             //   23/03/15 [V5.4 R3.4] /MK Additional Feature - If drug selected and no prescribed by then don't allow event to be saved - GL/TOK request.
             //   02/12/15 [V5.5 R1.4] /MK Change - Removed the requirement to enter the prescribed by - GL/SP/Peter Maguire.
             {
             if ( (PrescribedBy.Value = '') or (PrescribedBy.Value = '0') ) then
                begin
                   MessageDlg(Format('A Prescribed By must be entered for this drug - %s',[DrugUsed.Text]),mtError,[mbOK],0);
                   SysUtils.Abort;
                end;
             }
          end;

   if ( WinData.Health.State in dsEditModes ) then
      begin
         if (xDays.Value > 0) and (xDays.Value <> Windata.Health.FieldByName('NoDays').AsInteger) then
            Windata.HealthNoDays.AsInteger := xDays.AsInteger;
         if (xTimes.Value > 0) and (xTimes.Value <> Windata.Health.FieldByName('NoTimes').AsInteger) then
            Windata.HealthNoTimes.AsInteger := xTimes.AsInteger;
         if ( seNumberOfDaysToReport.AsInteger > 0 ) and ( seNumberOfDaysToReport.AsInteger <> Windata.Health.FieldByName('ReportInDays').AsInteger ) then
            WinData.HealthReportInDays.AsInteger := seNumberOfDaysToReport.AsInteger;

         //   18/12/12 [V5.1 R3.5] /MK Change - If amending a Vaccination event then on save ReportInDays should be set to weeks value.
         if ( FAddOrAmend = AmendVaccination ) then
            begin
               if seNumberOfDaysToReport.Value > 0 then
                  WinData.HealthReportInDays.AsInteger := ( WinData.HealthReportInDays.AsInteger * 7 );
            end;
      end;
end;

procedure TfHealth.FormCreate(Sender: TObject);
begin
   lDoseUnit.Caption := '';
   WinData.LookupMediAdmin.Active := True;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);
   HerdLookup.LookupHealthReportDesc.Active := True;
   GroupListing.LookupSource := WinData.GroupManager.GroupListDatasource;
   dblcLameTreatment.LookupSource := HerdLookup.dsLookupTreatmentUsed;
   if ( WinData.GlobalSettings.DownloadMailAttachments ) then
      btnVetLink.Kind := cxbkDropDownButton
   else
      btnVetLink.Kind := cxbkStandard;
end;

procedure TfHealth.FormDestroy(Sender: TObject);
begin
   GroupListing.LookupSource := nil;
   WinData.LookupMediAdmin.Active := False;
   HerdLookup.LookupHealthReportDesc.Active := False;
   HerdLookup.qHerdVaccineType.Active := False;
   if ( HerdLookup.QueryAdminBy.Active ) then
      HerdLookup.QueryAdminBy.Active := False;
   if ( HerdLookup.QueryPrescribedBy.Active ) then
      HerdLookup.QueryPrescribedBy.Active := False;
end;

procedure TfHealth.xDaysChange(Sender: TObject);
begin
   SetModifiedFlag;
   FillWithDrawalDates;
   // 09/02/2009 [Dev 3.9 R6.0] /SP Bug Fix
   DrugCost.Value := WinData.CalcDrugCost( WinData.HealthDrugUsed.AsInteger, WinData.HealthRateApplic.AsFloat,xDays.AsInteger*xTimes.AsInteger );
   WinData.CalcCostAndQtyUsed(WinData.HealthDrugUsed.AsInteger,WinData.HealthRateApplic.AsFloat,
                              WinData.Health,xDays.AsInteger*xTimes.AsInteger);
   DrugCost.Value := WinData.DrugCost;
end;

procedure TfHealth.qICBFHealthBeforeOpen(DataSet: TDataSet);
begin
   TQuery(Dataset).Params[0].Value := LHealthCode;
end;

procedure TfHealth.FarmCodeCloseUp(Sender: TObject);
begin
   If FarmCode.Value = '0' Then
      begin
         GenLookUpType := THealthCode;
         uGenLookSetUp.ShowTheForm(TRUE);
         HerdLookup.qNonICBFHealthCodes.Close;
         HerdLookup.qNonICBFHealthCodes.Open;
      end
   else
      begin
         if ( FAddOrAmend in [AddHealth, AmendHealth] ) and ( WinData.GlobalSettings.HealthCodeDefaultCommentIndex = cDefaultHealthCommentFarmCode ) then
            begin
               if ((FarmCode.Value <> '0') and (FarmCode.Value <> '')) then
                  dbComment.Field.Value := FarmCode.Text
               else
                  dbComment.Field.Value := 'Health';
            end;
      end;
end;

procedure TfHealth.actDetailedCommentExecute(Sender: TObject);
begin
  ShowForm(WinData.dsHealth, 'DetailedComment');
end;

procedure TfHealth.HealthReportDescCloseUp(Sender: TObject);
begin
   If HealthReportDesc.Value = '0' Then
      begin
         HerdLookup.LookupHealthReportDesc.Active := False;
         GenLookUpType := THealthReportDesc;
         uGenLookSetUp.ShowTheForm(TRUE);
         HerdLookup.LookupHealthReportDesc.Active := True;
      end;
end;

procedure TfHealth.GetGroupInfo;
var
   iaAnimalExistGroupIDs : PIntegerArray;
   GroupType : TGroupType;
begin
   if ( WinData.EventType in [THealth, THerdVaccination] ) then
      GroupType := gtBatch // allow change of batch group
   else if ( WinData.EventType = TDryOff ) then
      GroupType := gtFeed;// allow change of feed group

   if ( FCrushTreat ) then
      begin
         lGroup.Caption := 'Pen From';
         GroupListing.DisplayEmpty := '< Add to Pen From >';
      end
   else
      begin
         lGroup.Caption := Format('Current %s Group', [ GroupTypesArray[GroupType] ] );
         GroupListing.DisplayEmpty := Format('< Add to %s group >', [ GroupTypesArray[GroupType] ] );
      end;

   WinData.GroupManager.QueryGroupList([GroupType]);
   SetLength(iaAnimalExistGroupIDs,0);
   iaAnimalExistGroupIDs := WinData.GroupManager.GetAnimalsExistGroupIDs(WinData.AnimalFileByIDID.AsInteger, GroupType);
   if ( Length(iaAnimalExistGroupIDs) > 0 ) then
      GroupListing.KeyValue := iaAnimalExistGroupIDs[0]
   else
      GroupListing.KeyValue := 0;
end;

procedure TfHealth.BatchNoChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.RateApplicOldChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.DrugCostChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.xTimesChange(Sender: TObject);
begin
   SetModifiedFlag;
   // 09/02/2009 [Dev 3.9 R6.0] /SP Bug Fix
   DrugCost.Value := WinData.CalcDrugCost( WinData.HealthDrugUsed.AsInteger, WinData.HealthRateApplic.AsFloat,xDays.AsInteger*xTimes.AsInteger );
   WinData.CalcCostAndQtyUsed(WinData.HealthDrugUsed.AsInteger,WinData.HealthRateApplic.AsFloat,
                              WinData.Health,xDays.AsInteger*xTimes.AsInteger);
   DrugCost.Value := WinData.DrugCost;
end;

procedure TfHealth.ICBFCodeChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.FarmCodeChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.AdMinBy1Change(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.PrescribedByChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.ApplicMethodChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.GroupListingChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.dbCommentChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.HealthReportDescChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.ShowHideHealthControls;
begin
   if ( WinData.EventType <> THerdVaccination ) then
      begin
         if CountryOfReg = Ireland then
            begin
               lICBFCode.Visible := True;
               ICBFCode.Visible := True;
               ICBFCode.Top := 22;
               lICBFCode.Top := 25;
               FarmCode.Top := 50;
               lFarmCode.Top := 54;
               lFarmCode.Caption := 'Health Code (Farm)';
               lAdminBy.Top := 23;
               AdminBy.Top := 20;
               lApplicMethod.Top := 80;
               ApplicMethod.Top := 76;
            end
         else
            begin
               lICBFCode.Visible := False;
               ICBFCode.Visible := False;
               FarmCode.Top := 22;
               lFarmCode.Top := 25;
               lAdminBy.Top := 23;
               AdminBy.Top := 20;
               lApplicMethod.Top := 52;
               ApplicMethod.Top := 48;
           end;
      end;

   pAreaTreated.Visible := False;
   pAreaTreated.Left := 1000;
   if ( FAddOrAmend in [AmendMastitis, AmendLameness] ) then
      begin
         pAreaTreated.Visible := True;
         pAreaTreated.Left := 1;
         pAreaTreated.Top := 14;
         if ( FAddOrAmend = AmendMastitis ) then
            pAreaTreated.Height := 26
         else if ( FAddOrAmend = AmendLameness ) then
            pAreaTreated.Height := 58;
         lICBFCode.Visible := ( CountryOfReg = Ireland );
         ICBFCode.Visible := lICBFCode.Visible;
         lFarmCode.Visible := ( not(lICBFCode.Visible) );
         FarmCode.Visible := lFarmCode.Visible;
         if ( not(lFarmCode.Visible) ) then
            begin
               if ( FAddOrAmend = AmendMastitis ) then
                  begin
                     lICBFCode.Top := 52;
                     ICBFCode.Top := 48;
                     lApplicMethod.Top := 80;
                     lApplicMethod.Left := 12;
                     ApplicMethod.Top := 76;
                     ApplicMethod.Left := 134;
                     lAdminBy.Top := 23;
                     AdminBy.Top := 18;
                     lPrescribBy.Top := 52;
                     PrescribedBy.Top := 48;
                     lGroup.Top := 80;
                     GroupListing.Top := 76;
                  end
               else if ( FAddOrAmend = AmendLameness ) then
                  begin
                     lICBFCode.Top := 80;
                     ICBFCode.Top := 76;
                     lApplicMethod.Top := 23;
                     lApplicMethod.Left := 425;
                     ApplicMethod.Top := 18;
                     ApplicMethod.Left := 553;
                     lAdminBy.Top := 52;
                     AdminBy.Top := 48;
                     lPrescribBy.Top := 80;
                     PrescribedBy.Top := 76;
                  end;
            end;
         lGroup.Visible := ( FAddOrAmend = AmendMastitis );
         GroupListing.Visible := lGroup.Visible;
      end;

   //   22/11/17 [V5.7 R4.6] /MK Bug Fix - The below component's had lost their lookup source, list source or repository after Delphi crash.
   ICBFCode.LookupSource := HerdLookup.dsICBFHealthCodes;
   FarmCode.LookupSource := HerdLookup.dsNonICBFHealthCodes;
   PrescribedBy.LookupSource := HerdLookup.LookupPrescribedBy;
   dblcbVaccDisease.Properties.ListSource := HerdLookup.dsHerdVaccineType;
   AdminBy.LookupSource := HerdLookup.LookupAdminBy;
   HealthReportDesc.LookupSource := HerdLookup.dsLookupHealthReportDesc;
   LookupHealthDescriptions.RepositoryItem := HerdLookup.erHealthDescriptionsLookup;
end;

procedure TfHealth.QueryHealthLookupDescriptions(const AActive : Boolean);
begin
   with HerdLookup do
      begin
         QueryHealthDescriptions.Active := False;
         if AActive then
            begin
               LookupHealthDescriptions.RepositoryItem := HerdLookup.erHealthDescriptionsLookup;
               QueryHealthDescriptions.Active := True;
            end;
      end;
end;

procedure TfHealth.SetDayReportCaption;
begin
   //   18/12/12 [V5.1 R3.5] /MK Change - Remind In Days labels to weeks if amending a Vaccination.
   if ( seNumberOfDaysToReport.Value > 0 ) then
      begin
         if CountryOfReg = Ireland then
            begin
               if ( WinData.EventType = THealth ) then
                  begin
                     lDayReport.Caption := FloatToStr(seNumberOfDaysToReport.Value)+ ' Day Reminder';
                     lNumberOfDaysToReport.Caption := 'Days to Remind'
                  end
               else if ( WinData.EventType = THerdVaccination ) then
                  begin
                     lDayReport.Caption := FloatToStr(seNumberOfDaysToReport.Value)+ ' Week Reminder';
                     lNumberOfDaysToReport.Caption := 'Weeks to Remind'
                  end;
            end
         else
            begin
               if ( WinData.EventType = THealth ) then
                  begin
                     lDayReport.Caption := FloatToStr(seNumberOfDaysToReport.Value)+ ' Day Report';
                     lNumberOfDaysToReport.Caption := 'Days to Report';
                  end
               else if ( WinData.EventType = THerdVaccination ) then
                  begin
                     lDayReport.Caption := FloatToStr(seNumberOfDaysToReport.Value)+ ' Week Report';
                     lNumberOfDaysToReport.Caption := 'Weeks to Report';
                  end;
            end;
      end
   else if ( seNumberOfDaysToReport.Value = 0 ) then
      begin
         if ( CountryofReg = Ireland ) then
            begin
               if ( WinData.EventType = THealth ) then
                  lDayReport.Caption := 'Day Reminder'
               else if ( WinData.EventType = THerdVaccination ) then
                  lDayReport.Caption := 'Week Reminder'
            end
         else
            begin
               if ( WinData.EventType = THealth ) then
                  lDayReport.Caption := 'Day Report'
               else if ( WinData.EventType = THerdVaccination ) then
                  lDayReport.Caption := 'Week Report';
            end
      end;
   HealthReportDesc.Enabled := ( seNumberOfDaysToReport.Value > 0 );
   lDayReport.Enabled := ( seNumberOfDaysToReport.Value > 0 );
end;

procedure TfHealth.seNumberOfDaysToReportChange(Sender: TObject);
begin
   SetDayReportCaption;
   SetModifiedFlag;
end;

procedure TfHealth.AdMinByChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.sbMedicineSetupClick(Sender: TObject);
var
   vDrugID : Variant;
begin
   if ( DrugUsed.EditValue > 0 ) and ( not(DrugUsed.EditValue = Null) ) then
      begin
        vDrugID := DrugUsed.EditValue;
        uMedicineSetUp.ShowTheForm(vDrugID)
      end
   else
      uMedicineSetUp.ShowTheForm;
   qDrugList.Close;
   qDrugList.Open;
   if ( not(VarIsEmpty(vDrugID)) ) then
      DrugUsed.EditValue := vDrugID;
end;

procedure TfHealth.dbHealthBatchNoPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.dbHealthBatchNoPropertiesCloseUp(Sender: TObject);
begin
   if ( dbHealthBatchNo.ItemIndex = 0 ) then
      actMediPurch.Execute
   else
      begin
         //   23/04/15 [V5.4 R4.0] /MK Change - Added BatchNo to DrugBatchQtyRemaining for checking of total of all purchases for this BatchNo.
         if ( WinData.DrugBatchQtyRemaining(Integer(dbHealthBatchNo.ItemObject),dbHealthBatchNo.Text) <= 0 ) then
            MessageDlg(Format('This batch, %s , has a zero quantity.',[dbHealthBatchNo.EditValue]),mtInformation,[mbOK],0);
         //FindExpiryDate;
      end;
end;

procedure TfHealth.dbHealthBatchNoKeyPress(Sender: TObject; var Key: Char);
begin
   if ( dbHealthBatchNo.ItemIndex = 0 ) then
      Key := #0;
end;

procedure TfHealth.btnVetLinkClick(Sender: TObject);
var
   HerdIdentity,
   FileName : String;
   FileCount : Integer;
begin
   if WinData.GlobalSettings.DownloadMailAttachments then
      begin
         FileCount := 0;
         if ( WinData.OwnerFile.Locate('ID',WinData.DefaultsDefaultHerdID.AsInteger,[]) ) then
            HerdIdentity := WinData.OwnerFileHerdIdentity.AsString;
         if MessageDlg(cEmail_DownloadAttachmentConfirm,mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               Update;
               WinData.ViewMailBox(HerdIdentity);
               Update;
            end;

         //  21/03/14 [V5.2 R9.0] /MK Additional Feature - Had to add FileCount variable as required for MenuUnit.LinksMenu.
         FileName := TfmFileAttachmentImport.execute(itVetLink, HerdIdentity, FileCount);
         if (FileExists(FileName)) then
            TfmDrugsRegisterImport.ShowForm(FileName);
      end
   else
      TfmDrugsRegisterImport.ShowForm;
end;

procedure TfHealth.dblcbVaccDiseasePropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHealth.dblcbVaccDiseasePropertiesCloseUp(Sender: TObject);
begin
   if dblcbVaccDisease.EditingValue <> null then
      if ( WinData.Events.State in [dsInsert, dsEdit] ) then
         if ( WinData.EventType = THerdVaccination ) then
            WinData.EventsEventDesc.AsString := dblcbVaccDisease.EditingValue + ' Vaccination';
end;

procedure TfHealth.RateApplicPropertiesChange(Sender: TObject);
begin
   if ( not(dbComment.DataSource.DataSet.State in [dsInsert, dsEdit]) ) then Exit;

   if ( Length(RateApplic.Text) = 0 ) then Exit;

   try
      RateApplic.PostEditValue;
   except

   end;

   if ( WinData.HealthDrugUsed.AsInteger > 0 ) and ( RateApplic.EditValue > 0 ) then
      begin
         // CalcDrugCost required to calculate correct cost.
         DrugCost.Value := WinData.CalcDrugCost( WinData.HealthDrugUsed.AsInteger, RateApplic.EditValue ,xDays.AsInteger*xTimes.AsInteger );
         DrugCost.Value := WinData.DrugCost;
         // CalcCostAndQtyUsed required to calc QtyUsed and save PurchUnit and DoseUnit to Health table.
         // WinData.CalcCostAndQtyUsed(WinData.HealthDrugUsed.AsInteger,RateApplic.EditValue,WinData.Health,xDays.AsInteger*xTimes.AsInteger );
      end;

   //   13/09/13 [V5.2 R1.2] /MK Bug Fix - Check for null values before CheckDrugBatchQtyRemaining.
   if (IsNumeric(RateApplic.Text)) and ( FDrugPurchID > 0 ) and ( DrugUsed.EditValue > 0 ) and ( dbHealthBatchNo.EditValue <> '' ) then
      WinData.CheckDrugBatchQtyRemaining(FDrugPurchID,DrugUsed.EditValue,WinData.FChangedHealthApplicRate,
                                         dbHealthBatchNo.EditValue,RateApplic.DataBinding.DataSource.DataSet);

   //   28/08/13 [V5.2 R0.2] /MK Change - If ManualHealth Comment then don't change comment.
   if ( WinData.HealthManualComment.AsBoolean ) then Exit;

   if ( DrugUsed.EditValue = 0 ) or ( DrugUsed.EditValue = Null ) then Exit;

   {
   //   28/08/13 [V5.2 R0.2] /MK Change - Change comment to just drug used code.
   if ( FAddOrAmend in [AddHealth, AmendHealth] ) then
      if ( qDrugList.Locate('ID',DrugUsed.EditValue,[]) ) then
         dbComment.Field.Value := qDrugList.FieldByName('DrugCode').AsString;

   if ( lDoseUnit.Caption = 'lDoseUnit' ) then Exit;
   //   28/08/13 [V5.2 R0.2] /MK Change - Add Applic Rate + Dose Unit to Drug Code.
   if ( FAddOrAmend in [AddHealth, AmendHealth] ) then
      if ( not(RateApplic.Text = '') ) or ( not(RateApplic.Text = '0') ) then
         dbComment.Field.Value := dbComment.Field.Value+' '+RateApplic.Text+' '+lDoseUnit.Caption;
   }

   if ( FAddOrAmend in [AddHealth, AmendHealth] ) then
     if ( WinData.EventType = THealth ) and ( Length(RateApplic.Text) > 0 ) and ( RateApplic.Text <> '0' ) and  (IsNumeric(RateApplic.Text)) then
        dbComment.Field.Value := GetHealthCommentByName_Unit_ApplicRate(DrugUsed.EditValue,StrToFloat(RateApplic.Text),WinData.EventType);

end;

procedure TfHealth.LookupHealthDescriptionsEnter(Sender: TObject);
begin
   //   28/08/13 [V5.2 R0.2] /MK Additional Feature - If user clicks into the LookHealthDescriptions the program thinks that the
   //                                                 the user is going to enter a manual comment for the health event so set the ManualComment
   //                                                 field in the Health database.
   if ( dbComment.Field.Value = '' ) or ( dbComment.Field.Value = Null ) then
      begin
         WinData.Health.Edit;
         WinData.HealthManualComment.AsBoolean := True;
         WinData.Health.Post;
      end;
end;

procedure TfHealth.actAddMedicineExecute(Sender: TObject);
begin
   qDrugList.Close;
   uMedicineSetUp.ShowTheForm(0);
   qDrugList.Open;
end;

procedure TfHealth.actEditMedicineExecute(Sender: TObject);
begin
   if ( DrugUsed.EditValue > 0 ) and ( not(DrugUsed.EditValue = Null) ) then
      begin
         qDrugList.Close;
         uMedicineSetUp.ShowTheForm(DrugUsed.EditValue);
         qDrugList.Open;
      end;
end;

procedure TfHealth.SetBatchNoByDrugPurchId;
var
   BatchNoValue : string;
begin
   if ( FAddOrAmend in [AmendHealth, AmendDryingOff, AmendVaccination] ) then
      begin
         // We need to set the drug batch number list to the correct value. So, if the DrugPurchId > 0
         // we should lookup the batch no by this id.
         BatchNoValue := WinData.GetDrugBatchNoByDrugPurchId(WinData.HealthDrugPurchId.AsInteger,WinData.HealthDrugUsed.AsInteger);
         if (BatchNoValue <> '') then
            begin
               dbHealthBatchNo.ItemIndex := dbHealthBatchNo.Properties.Items.IndexOf(BatchNoValue);
               FindExpiryDate;
            end;
      end;
end;

procedure TfHealth.dbHealthBatchNoPropertiesEditValueChanged(Sender: TObject);
var
   iSelectedBatchNo : Integer;
begin
   if ( not(WinData.Health.State in dsEditModes) ) then Exit;
   //   27/06/19 [V5.8 R9.7] /MK Bug Fix - No need to assign FDrugPurchID to object if HealthDrugPurchID.AsInteger > 0.
   //                                      This would cause the wrong purchase id to be allocated to an edited drug.
   iSelectedBatchNo := Integer(dbHealthBatchNo.ItemObject);
   if ( WinData.Health.State = dsEdit ) then
      begin
         //   07/04/20 [V5.9 R3.1] /MK Bug Fix - When editing the event check to see if the user has changed the DrugBatchNo, then set DrugPurchID to this new value.
         if ( WinData.Health.FieldByName('DrugPurchID').AsInteger > 0 ) and ( iSelectedBatchNo > 0 ) then
            begin
               if ( iSelectedBatchNo = WinData.Health.FieldByName('DrugPurchID').AsInteger ) then
                  FDrugPurchID := WinData.Health.FieldByName('DrugPurchID').AsInteger
               else if ( iSelectedBatchNo > 0 ) then
                  FDrugPurchID := iSelectedBatchNo;
               WinData.Health.FieldByName('DrugPurchID').AsInteger := FDrugPurchID;
            end;
      end
   //   21/02/20 [V5.9 R2.4] /MK Bug Fix - If the State is Insert then the DrugPurchID was not being assigned.
   else
      begin
         FDrugPurchID := Integer(dbHealthBatchNo.ItemObject);
         if ( FDrugPurchID > 0 ) then
            WinData.Health.FieldByName('DrugPurchID').AsInteger := FDrugPurchID;
      end;
   FindExpiryDate;
end;

procedure TfHealth.dbHealthBatchNoExit(Sender: TObject);
begin
   if not(WinData.Health.State in dsEditModes) then Exit;
   FDrugPurchID := Integer(dbHealthBatchNo.ItemObject);
   //FindExpiryDate;
   if ( FDrugPurchID <= 0 ) then
      WinData.Health.FieldByName('DrugPurchID').Clear;
end;

procedure TfHealth.pmiVetLinkScreenClick(Sender: TObject);
begin
   TfmDrugsRegisterImport.ShowForm;
end;

procedure TfHealth.DrugUsedPropertiesEditValueChanged(Sender: TObject);
var
   HealthData : THealthData;
   saDrugBatchArray : PStringArray;
   sBatchNo : String;

   procedure ClearBatchNo;
   begin
      dbHealthBatchNo.EditValue := Null;
      dbHealthBatchNo.DataBinding.DataSource.DataSet.FieldByName(dbHealthBatchNo.DataBinding.DataField).AsString := '';
      dbHealthBatchNo.DataBinding.DataSource.DataSet.FieldByName('DrugPurchID').AsInteger := 0;
   end;

begin
   GetDrugCost_BatchInfo;
   //   08/03/16 [V5.5 R5.4] /MK Bug Fix - If editing Health, DryOff or Vaccination and the user is changing the drug used
   //                                      then check that the batch no for the new drug isn't the same as the batch number for the
   //                                      the old drug. If its not then clear out the BatchNo.
   if ( FAddOrAmend in [AmendHealth, AmendDryingOff, AmendVaccination] ) then
      if ( not(VarIsNull(DrugUsed.EditValue)) ) and ( not(VarIsNull(dbHealthBatchNo.EditValue)) ) then
         if ( dbHealthBatchNo.DataBinding.DataSource.DataSet.State in dsEditModes ) then
            begin
               SetLength(saDrugBatchArray,0);
               saDrugBatchArray := HealthData.GetDrugBatchArray(DrugUsed.EditValue,True);
               sBatchNo := '';
               sBatchNo := UpperCase(VarToStr(dbHealthBatchNo.EditValue));
               if ( (Length(sBatchNo) > 0) and (Length(saDrugBatchArray) > 0) ) then
                  begin
                     if ( not(InArray(sBatchNo,saDrugBatchArray)) ) then
                        ClearBatchNo;
                  end
               else if ( Length(sBatchNo) > 0 ) then
                  ClearBatchNo;
            end;
end;

procedure TfHealth.DrugUsedPropertiesChange(Sender: TObject);
begin
   GetDrugCost_BatchInfo;
end;

procedure TfHealth.GetDrugCost_BatchInfo;
begin
   if ( WinData.Health.State in dsEditModes ) then
      begin
         if ( WinData.HealthDrugUsed.AsInteger > 0 ) and ( not(RateApplic.EditValue = Null) ) then
            WinData.CalcCostAndQtyUsed(WinData.HealthDrugUsed.AsInteger,RateApplic.EditValue,WinData.Health,xDays.AsInteger*xTimes.AsInteger )
         else if ( not(DrugUsed.EditValue = Null) ) and ( not(RateApplic.EditValue = Null) ) then
            WinData.CalcCostAndQtyUsed(DrugUsed.EditValue,RateApplic.EditValue,WinData.Health,xDays.AsInteger*xTimes.AsInteger );
         DrugCost.Value := WinData.DrugCost;
         SetModifiedFlag;
         dbHealthBatchNo.EditValue := Null;
         LookupBatchNo;
      end;
end;

procedure TfHealth.PrescribedByCloseUp(Sender: TObject);
begin
   if ( PrescribedBy.Value = '0' ) or ( PrescribedBy.Value = '' ) then
      begin
         uMediAdminSetUp.ShowTheForm(TRUE,adPrescribingVet);
         //   13/01/16 [V5.5 R2.2] /MK Bug Fix - Refresh both AdminBy and Prescribed query's just in case user adds both types.
         HerdLookup.QueryAdminBy.Close;
         HerdLookup.QueryAdminBy.Open;

         HerdLookup.QueryPrescribedBy.Close;
         HerdLookup.QueryPrescribedBy.Open;
      end;
end;

procedure TfHealth.actMediPurchExecute(Sender: TObject);
begin
   if ( DrugUsed.EditValue > 0 ) or ( not(DrugUsed.EditValue = Null) ) then
      TfMediPurch.Execute(True,DrugUsed.EditValue)
   else
      TfMediPurch.Execute();
   WinData.qDrugBatchNo.Active := False;
   WinData.qDrugBatchNo.Active := True;
   LookupBatchNo();
end;

procedure TfHealth.dbcbAreaTreatedPropertiesChange(Sender: TObject);
begin
   if ( not(Sender is TcxDBCheckBox) ) then Exit;
   if ( not((Sender as TcxDBCheckBox).DataBinding.DataSource.DataSet.State = dsEdit) ) then Exit;
   LookupHealthDescriptions.Text := '';
   if dbcbAreaTreatedFL.Checked then
      LookupHealthDescriptions.Text := LookupHealthDescriptions.Text + 'FL';
   if dbcbAreaTreatedFR.Checked then
      begin
         if ( Length(LookupHealthDescriptions.Text) > 0 ) then
            LookupHealthDescriptions.Text := LookupHealthDescriptions.Text + ' ';
         LookupHealthDescriptions.Text := LookupHealthDescriptions.Text + 'FR';
      end;
   if dbcbAreaTreatedBL.Checked then
      begin
         if ( Length(LookupHealthDescriptions.Text) > 0 ) then
            LookupHealthDescriptions.Text := LookupHealthDescriptions.Text + ' ';
         LookupHealthDescriptions.Text := LookupHealthDescriptions.Text + 'BL';
      end;
   if dbcbAreaTreatedBR.Checked then
      begin
         if ( Length(LookupHealthDescriptions.Text) > 0 ) then
            LookupHealthDescriptions.Text := LookupHealthDescriptions.Text + ' ';
         LookupHealthDescriptions.Text := LookupHealthDescriptions.Text + 'BR';
      end;
end;

end.
