{
  17/02/2009 [V3.8 R 6.2] /SP Program Change - Introduction of ICBFHealthCodeLookup

  03/02/2009 [V3.8 R 5.9] /SP Bug Fix - erCustomerLookup.Properties.ListSource lost the datasource link from WinData when set at design time.
                                      Set erCustomerLookup.Properties.ListSource to WinData.dsCustomers in HerdLookup DataModuleCreate event handler

  03/02/2009 [V3.8 R 5.9] /SP Program Change - Introduction of erHerdIDLookup

  1/03/2009 [V3.8 R 6.2] /SP Program Change - Introduction of erConditionScoreAssociatedEvents

  1/03/2009 [V3.8 R 6.2] /SP Program Change - Introduction of erDrugBatchNoLookup

  04/05/11 [V4.0 R9.9] /MK Additional Feature - Change to qDrugList To Only Show Medicine's That Are InUse.

  24/05/11 [V4.1 R1.5] /MK Change - Changed erMedicineLookup.Properties.ListSource To dsDrugList To Only Show InUse Medicines.
                                  - Changed qDrugList Field Contents To All That Is In qDrugList Query.

  19/10/11 [V5.0 R1.5] /MK Additional Feature - CreatePedigreeTable - Added DateOfBirth To Current Animal.

  21/10/11 [V5.0 R1.6] /MK Additional Feature - qPlannedBull and dsPlannedBull Added For PlannedBull/BullsInUse.

  24/11/11 [V5.0 R2.2] /SP Additional Feature - New Function To Return GetAnimalsWithConditionScoreBetween.

  17/01/12 [V5.0 R3.5] /MK Change - mdEventTypes - Set All Premium EventTypes To Not User Visible.

  19/01/12 [V5.0 R3.6] /MK Change - mdEventTypes - Changed soDesc To False To Order In Asceding Order.

  24/01/12 [V5.0 R4.0] /MK Additional Feature - qServiceBullUsed - New Query To Store Query For Service Bull.

  24/01/12 [V5.0 R4.0] /MK Additional Feature - dsServiceBullUsed - New DataSource To Store Query For Service Bull.

  28/01/12 [V5.0 R4.0] /MK Additional Feature - qServiceHistBullUsed - New Query To Store Query For Historical Service Bull.

  11/05/12 [V5.0 R5.5] /MK Bug Fix - New Querys For Bullings Bull Listing.

  30/07/12 [V5.0 R8.2] /MK Additional Feature - GetAnimalsWithEBIBetween - New function to return AnimalIDArray for EBI range.

  07/09/12 [V5.0 R9.8] /MK Additional Feature - Added new RepositoryItems - erSingleCalfType & erMultipleCalfType Combo's for PDCalfType Items.

  17/09/12 [V5.0 R9.9] /MK Additional Feature - Added new Query, DataSource and EditRepository for Herd Vaccine Type.

  02/10/12 [V5.1 R0.1] /MK Additional Feature - Added New Planned Bull event to mdEventTypes.

  19/12/12 [V5.1 R3.5] /MK Additional Feature - New Function to GetAnimalsWithMilkYieldBetween.

  03/01/13 [V5.1 R3.6] /MK Bug Fix - Show Yield of Current Lactation not last completed lactation.
                                   - Show Daily Yield instead of 305Yield.

  09/01/13 [V5.1 R3.7] /MK Change - qHerdVaccineTypeBeforeOpen - Changed SQL to look at new LVaccination_DiseaseCode ListType.

  21/01/13 [V5.1 R3.8] /MK Change - THealthWithDrawalInfo - Added separate dates for Meat, Milk, Other & Organic Meat, Milk, Other -
                                    as all dates might be after requested date and priority should be given to Milk.

  22/01/13 [V5.1 R3.9] /MK Additional Feature - New property - RationHistoryDataExists - to see if RationHistory data is available for 7 Day Milk Yield filter.

  26/03/13 [V5.1 R5.4] /MK Change - qHerdVaccineType - Removed check for codes KH1-KH6 in SQL.

  15/05/13 [V5.1 R7.1] /MK Additional Feature - Added ICBFDam and ICBFStockBull events to mdEventTypes.

  06/06/13 [V5.1 R7.3] /MK Bug Fix - GetEventDetails SubQuery crashing on SQL.Add. Added SQL.Clear and SQL.Text.

  17/09/13 [V5.2 R1.4] /MK Change - QueryMedicineGroups - Removed order by Name.
                                                        - Added check for name to ordered by Antibiotic, then Vaccine and lastly Other.

  20/09/13 [V5.2 R1.5] /MK Change - Added ICBF Calf Survey Event to mdEventTypes.

  02/10/13 [V5.2 R3.0] /MK Additional Feature - New record type for TDrugRegImportWithdrawalRec used in uDrugsRegisterImport.

  03/12/13 [V5.2 R6.6] /MK Additional Feature - Added Query and DataSource of Purchase and Batch Groups.
                                              - Added Lookup Edit Respository for Purchase and Batch Groups.

  11/12/13 [V5.2 R6.8] /MK Additional Feature - uHerdLookup - Added new a query and datasource for LookupJohnesResult.

  06/02/14 [V5.2 R8.1] /MK Bug Fix - Added variable NotApplicable to THealthWithdrawalInfo.
                                   - Only show uDrugWithdrawalInfo unit if Milk Wihdrawal is after today and drug is not NOT APPLICABLE.

  20/02/14 [V5.2 R8.4] /MK Additional Feature - New TDataSource, TQuery and TEditRepository created for ICBF Sexed Semen.

  25/04/14 [V5.3 R0.0] /MK Additional Feature - Added Dose and Tube to QueryMedicineGroups.

  08/05/14 [V5.3 R0.0] /MK Additional Feature - Added MediGroup to TDrugRegImportWithdrawalRec to store Medicine Group.

  15/05/14 [V5.3 R0.3] /MK Additional Feature - Change to QueryMedicineGroups sql to only show LMedicineGroup types
                                                without looking for distinctive descriptions of LMedicineGroup types.

  23/03/15 [V5.4 R3.4] /MK Additional Feature - New query, qHistDrugList to show all drugs regardless of whether they are active or not.

  17/08/15 [V5.4 R7.3] /MK Additional Feature - Two new functions created, SaleDateWithinWithdrawalPeriod & GetMaxDrugIDTreatWithdrawalDate.

  27/08/15 [V5.4 R7.4] /MK Additional Feature - Added new property NotSexedSemenTypeID.

  30/10/15 [V5.4 R9.8] /MK Change - mdEventTypes - Added a new EventType for 103 where a new PregDiag event has gone into the current lactation.

  09/11/15 [V5.5 R0.5] /MK Additional Feature - Added querys and datasources for AdminBy and PrescribedBy.
                                              - Difference between these two querys is that the PrescribedBy only shows where IsVet = True in MedAdmin.

  12/11/15 [V5.5 R0.5] /MK Additional Feature - New class, TParlourDetails, to store parlour details i.e. parlour path, parlour type and NetworkLink.

  02/12/15 [V5.5 R1.4] /MK Additional Feature - GetBreedType - New function and type to get the BreedType of breed id.

  25/01/16 [V5.5 R2.4] /MK Bug Fix - GetRationHistoryExists - Check to see if table exists first - EH reported.

  05/02/16 [V5.5 R3.7] /MK Change - CalculateDrugWithDrawalDates - This function didn't know anything about NA withdrawal dates.

  18/02/16 [V5.5 R4.0] /MK Change - MaxDrugWithDrawalDate - Pass in what event type to check the for the max withdrawal date of
                                                            e.g. if calving then only check for Milk Withdrawal, if Sale then only check for Meat Withdrawal.
                                                          - System doesn't all user to specify other dates any more so no need to check this.
                                  - QueryAnimalWithdrawal - Need to pass in the EventType here so that it will be passed into MaxDrugWithDrawalDate.

  24/03/16 [V5.5 R4.5] /MK Change - MaxDrugWithDrawalDate - If the event type is Sale/Death event, check to see if the animal has had a to be culled date
                                                            so that the milk withdrawal days will then be used.

  07/04/16 [V5.5 R5.7] /MK Additional Feature - New query, datasource, EditRepository for Stock Bulls.
                                              - New function StockBullEventExistsForAnimal to check to the Stock Bull event already exists.
                                              - New procedure CalcAnimalStockBullEvents which check to see if the animal has an active bull in or bull out event.
                                                If there is an active event then don't show the Bull In/Out event depending on which event is being opened.
                                              - New procedure ValidateStockBullEvent to check to see if the new Stock Bull In/Out event is before a recent
                                                Stock Bull In/Out event and don't allow the event to be saved. 

  25/04/16 [V5.5 R5.7] /MK Additional Feature - New Function, AnimalIsDead, checks to see if the animal has a SaleDeath record and whether the Sold boolean is True.

  16/06/16 [V5.5 R6.8] /MK Additional Feature - New EditRepository's required for new ICBF Calf Survey traits - vitality, size, scour and pneumonia.

  13/10/16 [V5.6 R2.0] /MK Bug Fix - QueryAnimalWithdrawal - Withdrawal warning was only showing if treatment date that belongs to withdrawal drug was after today - James O'Connor.

  26/10/16 [V5.6 R2.7] /MK Change - IsValidHerdNumber - Added a new function to check if the herd number is valid.

  22/02/17 [V5.6 R5.5] /MK Change - New function, PedigreePrefixByHerdId, created to get Pedigree Prefix of selected herd.

  21/04/17 [V5.6 R8.0] /MK Change - Moved creation of NextAutoGenTag to HerdLookup for Global use.

  17/07/17 [V5.6 R9.2] /MK Additional Feature - Two new public functions, DuplicateVPAFound and FirstMedicineID.

  21/07/17 [V5.6 R9.3] /MK Additional Feature - New type FShowMeEventInfoType used with new ShowMeEventInfo.

  22/09/17 [V5.7 R3.0] /MK Additional Feature - New query and datasource for FeedGroups.

  17/10/17 [V5.7 R3.9] /MK Additional Feature - Added a EditRepository for AnimalColourCode for use within uMartImportByFileReview.
                                              - Added query and datasource for AnimalColours.

  23/10/17 [V5.7 R4.0] /MK Change - Changed LookupDrugDoseUnit to LookupDrugDosePurchUnitCode so both Dose and Purchase Unit Codes can be retrieved.

  07/12/17 [V5.7 R6.0] /MK Bug Fix - Old function SaleDateWithinWithdrawalPeriod changed to ThisTreatmentWithdrawalAfterSaleDate which checks to see
                                     if this treatments withdrawal date is after sale date. Old function was checking the withdrawal dates of the animals
                                     existing treatments not this current treatment.

  12/01/18 [V5.7 R7.4] /MK Additional Feature - GetAnimalsWithOverallGainPerDayBetween - New function to get animals with an overal weight gain filter.

  01/03/18 [V5.7 R8.2] /MK Bug Fix - RemoveFromTagStore - GetNextNatID - Need to pass in the rollover herd boolean for further checking of tag.

  28/06/18 [V5.8 R0.6] /MK Additional Feature - AddAnimalsToTempTableOnStockDate - New public procedure that adds animal on a stock date to a temp table.

  07/08/18 [V5.8 R2.2] /MK Additional Feature - New public variable, SelectedDeptMartInfo, to store selected mart for creating new customer/supplier.

  10/09/18 [V5.8 R2.7] /MK Additional Feature - Two public functions created, AnimalNoAlreadyExists & TransponderNoAlreadyExists.

  28/09/18 [V5.8 R3.0] /MK Change - Added a check for a null/zero primarybreed in PlannedBull, ServiceBull and StockBull queries.

  22/11/18 [V5.8 R4.7] /MK Additional Feature - New public function, MultiHerdHasSameHerdNo, created to check to see if MultiHerd system has
                                                the same herd identity in each record of the Owners table - Eddie Jordan (UCD).

  24/01/19 [V5.8 R6.3] /MK Additional Feature - Added new Mastitis event to mdEventTypes to allow for deletion of the event in Diary Events
                                                as well as showing the Event Type description in the event grid of the main screen.

  31/01/19 [V5.8 R6.4] /MK Additional Feature - Added new Lameness event to mdEventTypes to allow for deletion of the event in Diary Events
                                                as well as showing the Event Type description in the event grid of the main screen.
                                              - Added a repository item for LookupComboBox for the Treatment Used in Lameness event.
                                              - Added Data Source and Query to get the Treatment Used list type combobox items in GenLook.

  07/02/19 [V5.8 R6.6] /MK Change - ErrorInTagStore - Show error if there are less than 10 records in TagStore.
                                  - RemoveFromTagStore - If error found in TagStore then attempt 10 times to generate tag and exit out giving error.

  27/03/19 [V5.8 R8.3] /MK Change - BreedDetailsByID - Use Locate instead of Lookup.

  18/04/19 [V5.8 R8.9] /MK Additional Feature - New MemDataSet and DataSource for PureBredBreeds i.e. not cross breeds.
                                              - Added new procedure, CreateMDPureBredBreedData, that creates the data in the new MemDataSet.
                                              - Added new function, IsValidAICode, that checks for valid Irish AI codes.

  07/05/19 [V5.8 R9.2] /MK Change - Added MooMonitorLink to TParlourDetails.

  30/05/19 [V5.8 R9.3] /MK Additional Feature - New queries added for qDrugBatchNos, qBatchNosWithQtyRem and qMediDisposalReason.
                                              - New datasources added for dsBatchNosWithQtyRem, dsDrugBatchNos and dsMediDiposalReason.

  07/06/19 [V5.8 R9.3] /MK Additional Feature - New query, qAnimalsInHerdTempOff, that list all animals that have a active temp movement and are in the herd.

  23/08/19 [V5.9 R0.1] /MK Additional Feature - Added qInHerdCurrLactMilkDiskInfo query.
                                              - Added GetAnimalsWithSCCBetween function to return filter data.  

  19/12/19 [V5.9 R1.5] /MK Change - Added ImportFromParlour to TParlourDetails.Create.

  28/04/20 [V5.9 R4.0] /MK Additional Feature - New queries, qMainGridMilkDiskTrans & qMainGridMilkDisk, created to allow the main grid to show the milk history
                                                for animals that were sold or have no milk history in the current lactation but have in the previous lactation.

  17/08/20 [V5.9 R5.4] /MK Change - Changed qBatchNoMedDetails to output the DrugID of this purchase record.
                                  - Changed qMedBatchNoTreats to allow DrugID to be passed in to get exact treatments of this purchase where DrugPurchId
                                    appears twice in Health table for two different drugs - David Hemminway.

  29/04/21 [V6.0 R0.3] /MK Change - CreateMDPureBredBreedData - Changed this table to include all pure bred breeds regardless if they are in use or not - GL/Alan McCormick.

  07/07/21 [V6.0 R1.6] /MK Additional Feature - Added binoculars icon to the ImageList16x16.

  20/12/21 [V6.0 R3.5] /MK Additional Feature - qBatchNoByPurchData - Added Supplier to the query - Una Carter.
}

unit uHerdLookup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DairyData, Db, DBTables, dxmdaset, cxEdit, cxDBEditRepository, ImgList,
  cxLookupEdit, cxLookupDBGrid, cxDBLookupComboBox, GenTypesConst, cxFilter,
  uHerdOwner, cxEditRepositoryItems, cxExtEditRepositoryItems, DateUtil,
  KDBRoutines, uAnimalCart, uApplicationLog;

const
  DataSetActiveOnStartup = 1;

type
  TShowMeEventInfoType = (setNone, setIndividualVetFeeds, setBlockHealth, setVetLink, setPhoneApp);

  TUnitType = (utDose, utPurchase);

  TBreedType = (btDairyBreed, btBeefBreed, btMixedBreed);

  THerdType = (htDairy, htSuckler, htBeef, htNone);

  TGenLookListView = (dmViewInUse, dmViewAll);

  TAgeMthCategory = (AgeNone, AgeUnder, AgeAndOver);

  TAgeCategoryRecord = record
     AgeMthCategory : TAgeMthCategory;
     NoOfMonths : Integer;
  end;

  TEventDetailsRecord = record
   Event, SubEvent : array of Variant;
  end;
  TEventDetailsArray = array of TEventDetailsRecord;

  TDrugWithdrawalDates = record
    MeatWithdrawalDate,
    MilkWithdrawalDate,
    OtherWithdrawalDate,
    OrganicMeatWithdrawalDate,
    OrganicMilkWithdrawalDate,
    OrganicOtherWithdrawalDate : TDateTime;
  end;

  TDrugRegImportWithdrawalRec = record
    MediGroup,
    MeatWithdrawal,
    MilkWithdrawal : Integer;
    N_A_Drug : Boolean;
  end;

  TCustomerOptions = (qcLicensed, qcCMMSForms, qcSlaughter, qcAuthorisedDisposalPlace);

  TQueryCustomerOptions = set of TCustomerOptions;

  TParlourDetails = class
  public
      ParlourDir,
      ParlourType : String;
      NetworkLink : Boolean;
      MooMonitorLink : Boolean;
      ImportFromParlour : Boolean;
      constructor Create;
      destructor Destory;
  end;

  THerdLookup = class(TDataModule)
    qGenLook: TQuery;
    dsqGenLook: TDataSource;
              tblLookupGenLook: TTable;
    LookupHealthReportDesc: TQuery;
    dsLookupHealthReportDesc: TDataSource;
    NIStillBornReasons: TdxMemData;
    NIStillBornReasonsID: TAutoIncField;
    NIStillBornReasonsDescription: TStringField;
    dsNIStillBornReasons: TDataSource;
    CustomerQuery: TQuery;
    dsCustomerQuery: TDataSource;
    mdEventTypes: TdxMemData;
    mdEventTypesEventType: TIntegerField;
    mdEventTypesDescription: TStringField;
    dsEventTypes: TDataSource;
    mdEventTypesUserDisplay: TBooleanField;
    QueryHealthWithDrawals: TQuery;
    QueryHealthWithDrawalsEventDate: TDateField;
    QueryHealthWithDrawalsExpiryDate: TDateField;
    QueryHealthWithDrawalsDrugPurchID: TIntegerField;
    QueryHealthWithDrawalsNoDays: TIntegerField;
    QueryHealthWithDrawalsMeatDays: TFloatField;
    QueryHealthWithDrawalsMilkDays: TIntegerField;
    QueryHealthWithDrawalsOtherDays: TIntegerField;
    QueryHealthWithDrawalsMeatWD: TDateTimeField;
    QueryHealthWithDrawalsMilkWD: TDateTimeField;
    QueryHealthWithDrawalsOtherWD: TDateTimeField;
    QueryHealthWithDrawalsID: TIntegerField;
    QueryHealthWithDrawalsEventType: TSmallintField;
    EditRepository: TcxEditRepository;
    erCustomerLookup: TcxEditRepositoryLookupComboBoxItem;
    erSupplierLookup: TcxEditRepositoryLookupComboBoxItem;
    erBreedLookup: TcxEditRepositoryLookupComboBoxItem;
    GenQuery: TQuery;
    qDrugList: TQuery;
    dsDrugList: TDataSource;
    ImageList16x16: TImageList;
    erMedicineLookup: TcxEditRepositoryLookupComboBoxItem;
    erMediAdminLookup: TcxEditRepositoryLookupComboBoxItem;
    erCalfDocilityLookup: TcxEditRepositoryLookupComboBoxItem;
    erCalfQualityLookup: TcxEditRepositoryLookupComboBoxItem;
    QueryHealthDescriptions: TQuery;
    dsQueryHealthDescriptions: TDataSource;
    QueryHealthDescriptionsEventDesc: TStringField;
    erHealthDescriptionsLookup: TcxEditRepositoryLookupComboBoxItem;
    erLookupHealthReminder: TcxEditRepositoryLookupComboBoxItem;
    QueryFertTreatments: TQuery;
    dsQueryFertTreatments: TDataSource;
    QueryFertPrograms: TQuery;
    dsQueryFertPrograms: TDataSource;
    erFertProgramsLookup: TcxEditRepositoryLookupComboBoxItem;
    QueryFertProgramHistory: TQuery;
    dsQueryFertProgramHistory: TDataSource;
    QueryFertProgramHistoryCode: TStringField;
    QueryFertProgramHistoryDescription: TStringField;
    QueryFertProgramHistoryStartDate: TDateField;
    QueryFertProgramHistoryID: TIntegerField;
    QueryHealthWithDrawalsOrganicMeatDays: TIntegerField;
    QueryHealthWithDrawalsOrganicMilkDays: TIntegerField;
    QueryHealthWithDrawalsOrganicOtherDays: TIntegerField;
    QueryHealthWithDrawalsOrganicMeatWD: TDateTimeField;
    QueryHealthWithDrawalsOrganicMilkWD: TDateTimeField;
    QueryHealthWithDrawalsOrganicOtherWD: TDateTimeField;
    QueryHealthWithDrawalsHerdID: TIntegerField;
    dsFGroups: TDataSource;
    FeedGroups: TQuery;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    BooleanField3: TBooleanField;
    BooleanField4: TBooleanField;
    erFeedGroupLookup: TcxEditRepositoryLookupComboBoxItem;
    erLookupBuyers: TcxEditRepositoryLookupComboBoxItem;
    QueryMedicineGroups: TQuery;
    dsQueryMedicineGroups: TDataSource;
    erMedicineGroupLookup: TcxEditRepositoryLookupComboBoxItem;
    erSexCombo: TcxEditRepositoryComboBoxItem;
    erColourCombo: TcxEditRepositoryColorComboBox;
    erDamLookup: TcxEditRepositoryLookupComboBoxItem;
    TagStore: TTable;
    dsTagStore: TDataSource;
    erTagLookup: TcxEditRepositoryLookupComboBoxItem;
    mdNatIDNoInputStyles: TdxMemData;
    mdNatIDNoInputStylesID: TIntegerField;
    mdNatIDNoInputStylesInputStyle: TStringField;
    erNatIdNoEntryStyleLookup: TcxEditRepositoryLookupComboBoxItem;
    dsmdNatIDNoInputStyles: TDataSource;
    dsDamLookup: TDataSource;
    erLookupDisposalManner: TcxEditRepositoryLookupComboBoxItem;
    PedigreeTable: TTable;
    dsPedigreeTable: TDataSource;
    erHerdIDLookup: TcxEditRepositoryLookupComboBoxItem;
    ICBFHealthCodeLookup: TcxEditRepositoryLookupComboBoxItem;
    dsICBFHealthCodes: TDataSource;
    qICBFHealthCodes: TQuery;
    dsNonICBFHealthCodes: TDataSource;
    qNonICBFHealthCodes: TQuery;
    mdConditionScoreAssociatedEvents: TdxMemData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dsmdConditionScoreAssociatedEvents: TDataSource;
    erConditionScoreAssociatedEvents: TcxEditRepositoryLookupComboBoxItem;
    erDrugBatchNoLookup: TcxEditRepositoryLookupComboBoxItem;
    erAdminByVet: TcxEditRepositoryLookupComboBoxItem;
    erLookupEventTypes: TcxEditRepositoryLookupComboBoxItem;
    QueryFertilityCheckStatus: TQuery;
    QueryFertilityCheckAction: TQuery;
    erFertilityCheckStatus: TcxEditRepositoryLookupComboBoxItem;
    dsQueryFertilityCheckStatus: TDataSource;
    dsQueryFertilityCheckAction: TDataSource;
    erFertilityCheckAction: TcxEditRepositoryLookupComboBoxItem;
    mdEventTypesAllowBlockDeletion: TBooleanField;
    erLookupSires: TcxEditRepositoryLookupComboBoxItem;
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
    qDrugListInUse: TBooleanField;
    qDrugListStockLevel: TFloatField;
    qDrugListOrganicMeatWithdrawal: TIntegerField;
    qDrugListOrganicMilkWithdrawal: TIntegerField;
    qDrugListOrganicOtherWithdrawal: TIntegerField;
    qDrugListMediGroup: TIntegerField;
    qPlannedBull: TQuery;
    dsPlannedBull: TDataSource;
    qServiceBullUsed: TQuery;
    dsServiceBullUsed: TDataSource;
    qServiceBullUsedID: TIntegerField;
    qServiceBullUsedAnimalNo: TStringField;
    qServiceBullUsedName: TStringField;
    qServiceHistBullUsed: TQuery;
    qHistPlannedBull: TQuery;
    erSingleCalfTypeCombo: TcxEditRepositoryComboBoxItem;
    erMultipleCalfTypeCombo: TcxEditRepositoryComboBoxItem;
    dsHerdVaccineType: TDataSource;
    qHerdVaccineType: TQuery;
    erVaccineTypeLookup: TcxEditRepositoryLookupComboBoxItem;
    erDamMilkAbilityLookup: TcxEditRepositoryLookupComboBoxItem;
    erDamDocilityLookup: TcxEditRepositoryLookupComboBoxItem;
    erBullFunctionalityLookup: TcxEditRepositoryLookupComboBoxItem;
    erBullDocilityLookup: TcxEditRepositoryLookupComboBoxItem;
    erBatchGroupLookup: TcxEditRepositoryLookupComboBoxItem;
    dsBatchGroups: TDataSource;
    qBatchGroups: TQuery;
    dsPurchaseGroups: TDataSource;
    qPurchaseGroups: TQuery;
    erPurchaseGroupLookup: TcxEditRepositoryLookupComboBoxItem;
    dsLookupJohnesResult: TDataSource;
    LookupJohnesResult: TQuery;
    QueryHealthWithDrawalsMilkN_A_Drug: TBooleanField;
    QueryHealthWithDrawalsMeatN_A_Drug: TBooleanField;
    dsICBFSexedSemenType: TDataSource;
    qICBFSexedSemenType: TQuery;
    erICBFSexedSemenLookup: TcxEditRepositoryLookupComboBoxItem;
    qHistDrugList: TQuery;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    BooleanField1: TBooleanField;
    FloatField4: TFloatField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    BreedQuery: TQuery;
    DSBreedQuery: TDataSource;
    LookupPrescribedBy: TDataSource;
    QueryPrescribedBy: TQuery;
    LookupAdminBy: TDataSource;
    QueryAdminBy: TQuery;
    dsStockBulls: TDataSource;
    qStockBulls: TQuery;
    erStockBulls: TcxEditRepositoryLookupComboBoxItem;
    erCalfVitalityLookup: TcxEditRepositoryLookupComboBoxItem;
    erCalfScourLookup: TcxEditRepositoryLookupComboBoxItem;
    erCalfPneumoniaLookup: TcxEditRepositoryLookupComboBoxItem;
    erCalfSizeLookup: TcxEditRepositoryLookupComboBoxItem;
    qExistingVPADrugs: TQuery;
    qDrugListVPANo: TStringField;
    qDrugListMilkN_A_Drug: TBooleanField;
    qDrugListMeatN_A_Drug: TBooleanField;
    qDrugListIsSynchronized: TBooleanField;
    dsFeedGroups: TDataSource;
    qFeedGroups: TQuery;
    qFeedGroupsID: TIntegerField;
    qFeedGroupsGroupType: TStringField;
    qFeedGroupsCode: TStringField;
    qFeedGroupsDescription: TStringField;
    qFeedGroupsSelected: TBooleanField;
    qFeedGroupsAdditionalData: TBooleanField;
    qFeedGroupsEventDate: TDateField;
    qFeedGroupsDestSource: TIntegerField;
    qFeedGroupsCrushLoadComplete: TBooleanField;
    qFeedGroupsIsSynchronized: TBooleanField;
    qMedBatchNoTreats: TQuery;
    dsMedBatchNoTreats: TDataSource;
    qBatchNoMedDetails: TQuery;
    erAnimalColourCodeLookup: TcxEditRepositoryLookupComboBoxItem;
    dsAnimalColours: TDataSource;
    qAnimalColours: TQuery;
    erLookupBatchGroups: TcxEditRepositoryLookupComboBoxItem;
    qGroupsNotUsed: TQuery;
    erLookupTreatmentUsed: TcxEditRepositoryLookupComboBoxItem;
    dsLookupTreatmentUsed: TDataSource;
    qLookupTreatmentUsed: TQuery;
    mdPureBredBreeds: TdxMemData;
    mdPureBredBreedsID: TIntegerField;
    mdPureBredBreedsCode: TStringField;
    mdPureBredBreedsName: TStringField;
    dsPureBredBreeds: TDataSource;
    erPureBredBreedLookup: TcxEditRepositoryLookupComboBoxItem;
    qDrugBatchNos: TQuery;
    dsDrugBatchNos: TDataSource;
    qMediDisposalReason: TQuery;
    dsMediDiposalReason: TDataSource;
    qBatchNosWithQtyRem: TQuery;
    dsBatchNosWithQtyRem: TDataSource;
    qAnimalsInHerdTempOff: TQuery;
    erLookupBatchByPurchDate: TcxEditRepositoryLookupComboBoxItem;
    dsBatchNoByPurchData: TDataSource;
    qBatchNoByPurchData: TQuery;
    qInHerdCurrLactMilkDiskInfo: TQuery;
    qInHerdDailyMilkDiskTransInfo: TQuery;
    qMainGridMilkDiskTrans: TQuery;
    qMainGridMilkDisk: TQuery;
    qHerdTestResultType: TQuery;
    dsHerdTestResultType: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure QueryHealthWithDrawalsCalcFields(DataSet: TDataSet);
    procedure erCalfQualityLookupPropertiesInitPopup(Sender: TObject);
    procedure erCalfDocilityLookupPropertiesInitPopup(Sender: TObject);
    procedure TagStoreAfterDelete(DataSet: TDataSet);
    procedure TagStoreAfterPost(DataSet: TDataSet);
    procedure PedigreeTableAfterPost(DataSet: TDataSet);
    procedure qICBFHealthCodesBeforeOpen(DataSet: TDataSet);
    procedure qNonICBFHealthCodesBeforeOpen(DataSet: TDataSet);
    procedure QueryFertilityCheckStatusBeforeOpen(DataSet: TDataSet);
    procedure QueryFertilityCheckActionBeforeOpen(DataSet: TDataSet);
    procedure qHerdVaccineTypeBeforeOpen(DataSet: TDataSet);
    procedure erBullDocilityLookupPropertiesInitPopup(Sender: TObject);
    procedure erBullFunctionalityLookupPropertiesInitPopup(
      Sender: TObject);
    procedure erDamMilkAbilityLookupPropertiesInitPopup(Sender: TObject);
    procedure erDamDocilityLookupPropertiesInitPopup(Sender: TObject);
    procedure qICBFSexedSemenTypeBeforeOpen(DataSet: TDataSet);
    procedure qStockBullsBeforeOpen(DataSet: TDataSet);
    procedure erCalfVitalityLookupPropertiesInitPopup(Sender: TObject);
    procedure erCalfPneumoniaPropertiesInitPopup(Sender: TObject);
    procedure erCalfScourPropertiesInitPopup(Sender: TObject);
    procedure qLookupTreatmentUsedBeforeOpen(DataSet: TDataSet);
    procedure qMediDisposalReasonBeforeOpen(DataSet: TDataSet);
    procedure qHerdTestResultTypeBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FHerdOwnerData : THerdOwnerData;
    procedure CreateMemDataField(AMemData: TDataSet; AFieldName: string; AFieldType: TFieldType);
    function GetHerdOwnerData: THerdOwnerData;
    function GetRationHistoryExists: Boolean;
    function GetNotSexedSemenTypeID: Integer;
    function GetDefaultsUpdateNo: Integer;
    procedure ICBFCalfSurveyInitPopup(AEditRepository : TcxEditRepositoryLookupComboBoxItem; AValue : Variant);
    function GetNatIDIndex: Integer;
    function GetDefaultHerdID: Integer;
    function GetStockBullEventsExist: Boolean;
  public
    { Public declarations }

    //Herds : THerds;

    DisposalMannerListingView : TGenLookListView;
    FWithdrawalRec : TDrugRegImportWithdrawalRec;
    FShowMeEventInfoType : TShowMeEventInfoType;

    SelectedDeptMartInfo : TSelectedDeptMartInfo;

    function GetHerdTypeAsString( const HerdID : Integer ) : String;overload;
    function GetHerdType( const AHerdID : Integer ) : THerdType;overload;
    procedure GenLookByListType(const ListType : Integer = 0);
    function IsAuthorisedDisposalPlace( const ACustID : Integer ) : Boolean;
    procedure QueryCustomers( const AQueryCustomerOptions : TQueryCustomerOptions = []);
    function MaxDrugWithDrawalDate(const AID : Integer;
       ACheckDate : TDateTime;
       AEventType : Integer) : THealthWithDrawalInfo;
    procedure QueryAnimalWithdrawal(AEventType : Integer; const AID :Integer; const ADate : TDateTime = 0);
    function CalculateDrugWithDrawalDates( ADrugId : Integer; AEventDate : TDateTime;
       const ADaysAdministered : Integer = 1 ) : TDrugWithdrawalDates;
    function GetHerdID(AAnimalID : Integer) : Byte;

    function GetMinCalvingDate(AAnimalID : Integer) : TDateTime;
    function GetCalvingCount(AAnimalID : Integer) : Byte;
    procedure FilterICBFScoreList(AFilter : Integer; Sender: TObject);
    function CheckUniqueFieldValue(ATable, AField, AValue : Variant) : Boolean;

    // Drugs/Health
    function LookupDrugDosePurchUnitCode(const ADrugID : Integer; AUnitType : TUnitType) : string;
    function DrugDetailByDrugID(const ADrugID : Integer; FieldName : string) : Variant;
    function CountOfDrugDoses(const AAnimalID : Integer; ADrugGroup : string; APeriodFrom, APeriodTo : TDateTime) : Integer;
    function DrugGroupByDrugID(const ADrugID : Integer) : string;

    // Breeds
    function BreedDetailsByID(const ABreedID : Integer; FieldNames : string) : Variant;
    function BreedIDByCode(const ABreedCode : string) : Integer;
    function GetBreedType(ABreedID : Integer): TBreedType;

    // Colours
    function ColourDetailsByID(const AColourID : Integer; FieldNames : string) : Variant;

    // Get Event Details
    function GetEventDetails(const AAnimalID, AEventType : Integer) : TEventDetailsArray;
    function AnimalHasEventsInCurrentLactNo(AAnimalID, ALactNo: Integer): Boolean;

    // Animal Costings
    function CalcFeedCosts(const AAnimalID : Integer) : Double;
    function CalcHealthCosts(const AAnimalID : Integer) : Double;
    function CalcFixedCost(const AAnimalID : Integer; const DaysOnFarm : Integer = 0) : Double;

    // Weighings
    function GetLastRecordedWeight(const AAnimalID : Integer) : Double;

    // Herd
    function AvgDailyLiveWeightGain(AHerdID : Integer; ASaleDateFrom, ASaleDateTo : TDateTime;
        AAgeCategoryRecord : TAgeCategoryRecord; const ASex : String = '') : double;
    function GetAvgSalesPricePerKg(AHerdID : Integer; ASaleDateFrom, ASaleDateTo : TDateTime;
        AAgeCategoryRecord : TAgeCategoryRecord; const ASex : String = '') : double;
    function DefaultBuyer : Integer;
    function CountryByHerdID(AHerdID : Integer) : TCountry;
    function HerdNumberByHerdId(AHerdID : Integer) : string;
    function PedigreePrefixByHerdId(AHerdID : Integer) : string;
    function IsValidHerdNumber (ACountry : TCountry; const AHerdNumber : String = '') : Boolean;
    function IsDuplicateHerdNumber(AHerdID : Integer; const AHerdNumber: String = '') : Boolean;
    function GetTCountryByText(ACountryTxt: String): TCountry;
    function GetNextAutoGenTagNumber : String;
    function MultiHerdHasSameHerdNo : Boolean;
    property DefaultHerdID : Integer read GetDefaultHerdID;

    // Animals
    function GetAnimalComments(AAnimalID : Integer) : WideString;
    function NatIDNumAlreadyExists(ANatIDNum : String) : Boolean;
    function AnimalNoAlreadyExists(AAnimalNo : String) : Boolean;
    function TransponderNoAlreadyExists(ATransponder : String) : Boolean;

    // Tag Store
    procedure CreateTagStore(const AHerdID : Integer);
    procedure RemoveFromTagStore(const AHerdID : Integer; ATagNo : string);
    procedure OpenTagStore(const AHerdID : Integer);
    function InputStyleAsString(AInputStyle : Integer)  : string;
    function ErrorInTagStore : Boolean;

    // Sales/Deaths
    procedure FilterDisposalMannerList(AInUse : Boolean);
    procedure FilterCustomerList(AAuthorisedDisposal : Boolean);
    function GetKillOutPerc(AID : Integer) : Double;
    function ThisTreatmentWithdrawalAfterSaleDate(AAnimalID, ADrugID,
      ATreatDays: Integer; ATreatmentDate, ASaleDate: TDateTime): Boolean;
    function AnimalIsDead ( AAnimalID : Integer ) : Boolean;

    // Pedigree
    procedure CreatePedigreeTable(const AIDS: PIntegerArray);
    procedure FlushPedigreeTable;

    // Fertility
    function GetFertilityCheckActionDescription(AActionId : Integer) : string;
    function StockBullEventExistsForAnimal(AAnimalID : Integer; AEventDate : TDateTime; AEventDesc : String): Boolean;
    procedure CalcAnimalStockBullEvents ( AAnimalID : Integer; AIsInEvent : Boolean; var AMessageShown : Boolean );
    procedure ValidateStockBullEvent(AAnimalID : Integer; AIsInEvent : Boolean; AEventDate : TDateTime; var AMessageShown : Boolean);

    // Filters
    function GetAnimalsWithConditionScoreBetween(const AHerdId : Integer;
        const AMin, AMax : Double) : TIntegerArray;
    function GetAnimalsWithEBIBetween(const AHerdId : Integer;
       const AFromValue, AToValue : Variant; const ASex : string = '') : TIntegerArray;
    function GetAnimalsWithMilkYieldBetween(const AHerdId: Integer;
       const AFromValue, AToValue: Variant): TIntegerArray;
    function GetAnimalsWithRatCalcMilkYieldBetween(const AHerdId: Integer;
       const AFromValue, AToValue: Variant): TIntegerArray;
    function GetAnimalsWithOverallGainPerDayBetween(const AHerdId: Integer;
       const AFromValue, AToValue: Variant): TIntegerArray;
    function GetAnimalsWithSCCBetween(const AHerdId: Integer;
       const AFromValue, AToValue: Variant): TIntegerArray;

    // Drugs
    function GetMaxDrugIDTreatWithdrawalDate(ADrugID, ATreatDays : Integer;  ATreatmentDate: TDateTime): TDateTime;
    function MedicineUnitUsed ( AMedicineID : Integer; AUnitType : TUnitType) : Double;
    function FirstMedicineID : Integer;
    function DuplicateVPAFound(AVPANo: String; ADrugID : Integer): Boolean;
    function GetDrugCodeByID(ADrugID : Integer) : String;

    // Animal Selection
    function GetAnimalSelectionToArrayWideString (ASelectionType : TSelectionType) : String;

    function IsValidAICode (AAICode : String) : Boolean;

    // Animals On Stock Date
    procedure AddAnimalsToTempTableOnStockDate(ADate: TDateTime; ATable: TTable);

    procedure CreateMDPureBredBreedData;

    // Temp Movements
    function GetTempMoveMovedToIDByHerdID (AHerdID : String) : Integer;

    // ICBF API Events
    function GetICBFAPIEventCountByAnimal (AICBFCode : String; AAnimalID : Integer; const ACalvingDate : TDateTime = 0) : Integer;

    // Mastitis Events
    function GetMastitisEventCountByAnimal(AAnimalID: Integer; const ACalvingDate: TDateTime): Integer;

    property HerdOwnerData : THerdOwnerData Read GetHerdOwnerData;

    //   22/01/13 [V5.1 R3.9] /MK Additional Feature - New property to see if RationHistory data is available for 7 Day Milk Yield filter.
    property RationHistoryDataExists : Boolean read GetRationHistoryExists;

    property NotSexedSemenTypeID : Integer read GetNotSexedSemenTypeID;

    property DefaultsUpdateNo : Integer read GetDefaultsUpdateNo;

    property NatIDIndex : Integer read GetNatIDIndex;

    property StockBullEventsExist : Boolean read GetStockBullEventsExist;
  end;

var
  HerdLookup: THerdLookup;

const
   Medicine_Name = 'Name';
   Breeds_Code = 'Code';
   Breeds_EligibleforPremium = 'EligibleforPremium';
   Colours_Code = 'LookUpCode';

   cInputNatIDStyle_ManualInput  = 1;
   cInputNatIDStyle_AutoGenInput = 2;
   cInputNatIDStyle_ListInput    = 3;

implementation
uses

   uDrugWithdrawalMsgDlg, kRoutines, BDE, SQLHelper;

{$R *.DFM}

{ THerdLookup }

procedure THerdLookup.GenLookByListType(const ListType: Integer = 0);
begin
   with qGenLook do
      begin
         if Active then
            Close;

         SQL.Clear;
         SQL.Add('Select Distinct(ID), LookupCode, Description, InUse');
         SQL.Add('From GenLook');
         SQL.Add('Where (ListType = :AListType)');
         if ( ListType > 0 ) then
            begin
               ParamByName('AListType').AsInteger := ListType;
               Prepare;
               Open;
            end
      end;
end;

procedure THerdLookup.DataModuleDestroy(Sender: TObject);
var
   iterator : Integer;
begin
   { Ensure all datasets are closed that maynot be linked to KingData. }
   FreeAndNil(FHerdOwnerData);
   for iterator := 0 to ComponentCount-1 do
      if (Components[iterator] is TDBDataSet) then
         begin
            if (Components[iterator] as TDBDataSet).Active then
               TDBDataSet(Components[iterator]).Active := False;
         end
      else if (Components[iterator] is TDataSet) then
         begin
            if (Components[iterator] as TDataSet).Active then
               TDataSet(Components[iterator]).Active := False;
         end
      else if (Components[iterator] is TdxMemData) then
         begin
            if (Components[iterator] as TdxMemData).Active then
               TdxMemData(Components[iterator]).Active := True;
         end;
   mdNatIDNoInputStyles.Active := False;
//   FreeAndNil(Herds);
end;

function THerdLookup.GetHerdTypeAsString(const HerdID: Integer): String;
begin
   HerdOwnerData.HerdID := HerdID;
   Result := HerdOwnerData.HerdType;
end;

procedure THerdLookup.DataModuleCreate(Sender: TObject);
var
   iterator : Integer;
begin
   { Ensure all datasets with Tag value of 1 ( DataSetActiveOnStartup ) are set to active }
   for iterator := 0 to ComponentCount-1 do
      if (Components[iterator] is TDBDataSet) then
         begin
            if ( (Components[iterator] as TDBDataSet).Tag = DataSetActiveOnStartup ) then
               TDBDataSet(Components[iterator]).Active := True;
         end
      else if (Components[iterator] is TDataSet) then
         begin
            if ( (Components[iterator] as TDataSet).Tag = DataSetActiveOnStartup ) then
               TDataSet(Components[iterator]).Active := True;
         end
      else if (Components[iterator] is TdxMemData) then
         begin
            if ( (Components[iterator] as TdxMemData).Tag = DataSetActiveOnStartup ) then
               TdxMemData(Components[iterator]).Active := True;
         end;

   mdNatIDNoInputStyles.Active := True;
   //   24/05/11 [V4.1 R1.5] /MK Change - Changed erMedicineLookup.Properties.ListSource To dsDrugList To Only Show InUse Medicines.
   //erMedicineLookup.Properties.ListSource := WinData.dsMedicine;
   erMedicineLookup.Properties.ListSource := dsDrugList;
   erLookupBuyers.Properties.ListSource := WinData.dsBuyers;

   erCalfDocilityLookup.Properties.ListSource := WinData.dsWeaningScores;
   erCalfQualityLookup.Properties.ListSource := WinData.dsWeaningScores;
   erCalfVitalityLookup.Properties.ListSource := WinData.dsWeaningScores;
   erCalfScourLookup.Properties.ListSource := WinData.dsWeaningScores;
   erCalfPneumoniaLookup.Properties.ListSource := WinData.dsWeaningScores;
   erCalfSizeLookup.Properties.ListSource := WinData.dsICBFCalfSizeScores;
   erMediAdminLookup.Properties.ListSource := WinData.dsMediAdmin;
   erSupplierLookup.Properties.ListSource := WinData.dsSuppliers;
   erBreedLookup.Properties.ListSource := WinData.BreedsSource;

   // 03/02/2009 [V3.8 R 5.9] /SP Bug Fix - erCustomerLookup.Properties.ListSource lost the datasource link from WinData when set at design time.
                                       // Set erCustomerLookup.Properties.ListSource to WinData.dsCustomers in HerdLookup DataModuleCreate event handler
   erCustomerLookup.Properties.ListSource := WinData.dsCustomers;

   // 03/02/2009 [V3.8 R 5.9] /SP Program Change - Introduction of erHerdIDLookup
   erHerdIDLookup.Properties.ListSource := WinData.dsHerdDefaults;

   // 17/02/2009 [V3.8 R 6.2] /SP Program Change - Introduction of ICBFHealthCodeLookup
   ICBFHealthCodeLookup.Properties.ListSource := dsICBFHealthCodes;
   //Herds := THerds.Create;

   // 1/03/2009 [V3.8 R 6.2] /SP Program Change - Introduction of erConditionScoreAssociatedEvents
   erConditionScoreAssociatedEvents.Properties.ListSource := dsmdConditionScoreAssociatedEvents;

   // 1/03/2009 [V3.8 R 6.2] /SP Program Change - Introduction of erDrugBatchNoLookup
   erDrugBatchNoLookup.Properties.ListSource := WinData.dsDrugBatchNo;

   // 22/04/2009 [V3.9 R7.0] /SP Program Change - Introduction of erAdminByVet
   erAdminByVet.Properties.ListSource := WinData.dsLookupMediAdmin;

   erBullDocilityLookup.Properties.ListSource := WinData.dsDamAndBullICBFScores;
   erBullFunctionalityLookup.Properties.ListSource := WinData.dsDamAndBullICBFScores;
   erDamMilkAbilityLookup.Properties.ListSource := WinData.dsDamAndBullICBFScores;
   erDamDocilityLookup.Properties.ListSource := WinData.dsDamAndBullICBFScores;

   erLookupTreatmentUsed.Properties.ListSource := dsLookupTreatmentUsed;
end;

function THerdLookup.IsAuthorisedDisposalPlace(
  const ACustID: Integer): Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select AuthorisedDisposalPlace From Customers Where ID =:CustID');
         Params[0].Value := ACustID;
         Active := True;
         try
            Result := Fields[0].AsBoolean;
         finally
            Active := False;
         end;
      finally
         Free;
      end;
end;

procedure THerdLookup.QueryCustomers(
  const AQueryCustomerOptions: TQueryCustomerOptions);
//  TCustomerOptions = (qcLicensed, qcCMMSForms, qcSlaughter, qcAuthorisedDisposalPlace)
begin
   CustomerQuery.Close;
   if ( AQueryCustomerOptions <> [] ) then
      begin
         CustomerQuery.SQL.Clear;
         CustomerQuery.SQL.Add('Select ID, Name From Customers Where (ID > 0) ');
         if qcLicensed in AQueryCustomerOptions then
            CustomerQuery.SQL.Add('And Licensed = True');
         if qcCMMSForms in AQueryCustomerOptions then
            CustomerQuery.SQL.Add('And CMMSForms = True');
         if qcSlaughter in AQueryCustomerOptions then
            CustomerQuery.SQL.Add('And Slaughter = True');
         if qcAuthorisedDisposalPlace in AQueryCustomerOptions then
            CustomerQuery.SQL.Add('And AuthorisedDisposalPlace = True');
         CustomerQuery.SQL.Add('Order By Name ASC ');
         CustomerQuery.Open;
      end
   else if ( AQueryCustomerOptions = [] ) then
      begin
         CustomerQuery.SQL.Clear;
         CustomerQuery.SQL.Add('Select ID, Name From Customers Where (ID > 0) ');
         CustomerQuery.SQL.Add('Order By Name ASC ');
         CustomerQuery.Open;
      end;
end;

procedure THerdLookup.QueryHealthWithDrawalsCalcFields(DataSet: TDataSet);
begin
   if ( QueryHealthWithDrawalsMeatDays.AsInteger > 0 ) then
      begin
         if ( QueryHealthWithDrawalsNoDays.AsInteger > 0 ) then
            QueryHealthWithDrawalsMeatWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsMeatDays.AsInteger, QueryHealthWithDrawalsNoDays.AsInteger )
         else
            QueryHealthWithDrawalsMeatWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsMeatDays.AsInteger);
      end;

   if ( QueryHealthWithDrawalsMilkDays.AsInteger > 0 ) then
      begin
         if ( QueryHealthWithDrawalsNoDays.AsInteger > 0 ) then
            QueryHealthWithDrawalsMilkWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsMilkDays.AsInteger, QueryHealthWithDrawalsNoDays.AsInteger )
         else
            QueryHealthWithDrawalsMilkWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsMilkDays.AsInteger);
      end;

   if ( QueryHealthWithDrawalsOtherDays.AsInteger > 0 ) then
      begin
         if ( QueryHealthWithDrawalsNoDays.AsInteger > 0 ) then
            QueryHealthWithDrawalsOtherWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsOtherDays.AsInteger, QueryHealthWithDrawalsNoDays.AsInteger)
         else
            QueryHealthWithDrawalsOtherWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsOtherDays.AsInteger);
      end;

   // Only calculate withdrawal dates if herd setting organic=true
   HerdLookup.HerdOwnerData.HerdID := QueryHealthWithDrawalsHerdID.AsInteger;
   if HerdLookup.HerdOwnerData.OrganicHerd then
      begin
         if ( QueryHealthWithDrawalsOrganicMeatDays.AsInteger > 0 ) then
            begin
               if ( QueryHealthWithDrawalsNoDays.AsInteger > 0 ) then
                  QueryHealthWithDrawalsOrganicMeatWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsOrganicMeatDays.AsInteger, QueryHealthWithDrawalsNoDays.AsInteger )
               else
                  QueryHealthWithDrawalsOrganicMeatWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsOrganicMeatDays.AsInteger);
            end;

         if ( QueryHealthWithDrawalsOrganicMilkDays.AsInteger > 0 ) then
            begin
               if ( QueryHealthWithDrawalsNoDays.AsInteger > 0 ) then
                  QueryHealthWithDrawalsOrganicMilkWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsOrganicMilkDays.AsInteger, QueryHealthWithDrawalsNoDays.AsInteger )
               else
                  QueryHealthWithDrawalsOrganicMilkWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsOrganicMilkDays.AsInteger);
            end;

         if ( QueryHealthWithDrawalsOrganicOtherDays.AsInteger > 0 ) then
            begin
               if ( QueryHealthWithDrawalsNoDays.AsInteger > 0 ) then
                  QueryHealthWithDrawalsOrganicOtherWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsOrganicOtherDays.AsInteger, QueryHealthWithDrawalsNoDays.AsInteger)
               else
                  QueryHealthWithDrawalsOrganicOtherWD.AsDateTime := WinData.CalcDrugWithdrawalDate(QueryHealthWithDrawalsEventDate.AsDateTime, QueryHealthWithDrawalsOrganicOtherDays.AsInteger);
            end;
      end;
end;

//   18/02/16 [V5.5 R4.0] /MK Change - Pass in what event type to check the for the max withdrawal date of
//                                     e.g. if calving then only check for Milk Withdrawal, if Sale then only check for Meat Withdrawal.
function THerdLookup.MaxDrugWithDrawalDate(const AID: Integer; ACheckDate : TDateTime;
   AEventType : Integer): THealthWithDrawalInfo;
var
   RecID,
   i,
   AnimalLactNo : Integer;
   //   21/01/13 [V5.1 R3.8] /MK Change - Added separate dates for Meat, Milk, Other & Organic Meat, Milk, Other -
   //                                     as all dates might be after requested date and priority should be given to Milk.
   MilkDateToUse,
   MeatDateToUse,
   OtherDateToUse,
   OrganicMilkDateToUse,
   OrganicMeatDateToUse,
   OrganicOtherDateToUse,
   ToBeCulledDate : TDateTime;
begin
   RecID := 0;
   AnimalLactNo := 0;
   MilkDateToUse := 0;
   MeatDateToUse := 0;
   OtherDateToUse := 0;
   OrganicMilkDateToUse := 0;
   OrganicMeatDateToUse := 0;
   OrganicOtherDateToUse := 0;
   ToBeCulledDate := 0;
   FillChar(Result, SizeOf(THealthWithDrawalInfo), 0);

   AnimalLactNo := GetAnimalInfo(AID,'LactNo');
   ToBeCulledDate := GetAnimalLactToBeCulledDate(AID,AnimalLactNo);

   with QueryHealthWithDrawals do
      try
         Close;
         Params[0].AsInteger := AID;
         Open;
         First;
         while ( not(Eof) ) do
            begin
               Result.NotApplicable := ( QueryHealthWithDrawalsMilkN_A_Drug.AsBoolean or QueryHealthWithDrawalsMeatN_A_Drug.AsBoolean);
               if ( not(Result.NotApplicable) ) then
                  begin
                     // if the event type is Sale/Death event the check to see if the animal has not had a to be culled date
                     // so that the milk withdrawal days will then be used. 
                     if ( AEventType = CSaleDeathEvent ) then
                        begin
                           for i := 1 to 4 do
                              begin
                                 case i of
                                    1 : if ( QueryHealthWithDrawalsMeatWD.AsDateTime > MeatDateToUse ) then
                                        begin
                                           RecID := QueryHealthWithDrawalsID.AsInteger;
                                           MeatDateToUse := QueryHealthWithDrawalsMeatWD.AsDateTime;
                                        end;
                                    2 : if ( QueryHealthWithDrawalsMilkWD.AsDateTime > MilkDateToUse ) then
                                           if ( ToBeCulledDate = 0 ) then
                                              begin
                                                 RecID := QueryHealthWithDrawalsID.AsInteger;
                                                 MilkDateToUse := QueryHealthWithDrawalsMilkWD.AsDateTime;
                                              end;
                                    // include organic withdrawal dates
                                    3 : if ( QueryHealthWithDrawalsOrganicMeatWD.AsDateTime > OrganicMeatDateToUse ) then
                                        begin
                                           RecID := QueryHealthWithDrawalsID.AsInteger;
                                           OrganicMeatDateToUse := QueryHealthWithDrawalsOrganicMeatWD.AsDateTime;
                                        end;
                                    4 : if ( QueryHealthWithDrawalsOrganicMilkWD.AsDateTime > OrganicMilkDateToUse ) then
                                           if ( ToBeCulledDate = 0 ) then
                                              begin
                                                 RecID := QueryHealthWithDrawalsID.AsInteger;
                                                 OrganicMilkDateToUse := QueryHealthWithDrawalsOrganicMilkWD.AsDateTime;
                                              end;
                                 end;
                              end;
                        end
                     else if ( AEventType = CCalvingEvent ) then
                        begin
                           for i := 1 to 2 do
                              case i of
                                 1 : if ( QueryHealthWithDrawalsMilkWD.AsDateTime > MilkDateToUse ) then
                                        begin
                                           RecID := QueryHealthWithDrawalsID.AsInteger;
                                           MilkDateToUse := QueryHealthWithDrawalsMilkWD.AsDateTime;
                                        end;
                                 2 : if ( QueryHealthWithDrawalsOrganicMilkWD.AsDateTime > OrganicMilkDateToUse ) then
                                        begin
                                           RecID := QueryHealthWithDrawalsID.AsInteger;
                                           OrganicMilkDateToUse := QueryHealthWithDrawalsOrganicMilkWD.AsDateTime;
                                        end;
                              end;
                        end;
                  end;
               Next;
            end;
      finally
         if Locate('ID', RecID, []) then
            begin
               Result.DryOff := ( QueryHealthWithDrawalsEventType.AsInteger = cDryOffEvent );
               Result.StartDate := QueryHealthWithDrawalsEventDate.AsDateTime;
               Result.NoDaysSinceStart := Trunc(Date - Result.StartDate);
               Result.MilkWithDrawalDate := MilkDateToUse;
               Result.MeatWithDrawalDate := MeatDateToUse;
               Result.OtherWithDrawalDate := OtherDateToUse;
               Result.OrganicMilkWithDrawalDate := OrganicMilkDateToUse;
               Result.OrganicMeatWithDrawalDate := OrganicMeatDateToUse;
               Result.OrganicOtherWithDrawalDate := OrganicOtherDateToUse;
            end;
         Close;
      end;
end;

//   18/02/16 [V5.5 R4.0] /MK Change - Need to pass in the EventType here so that it will be passed into MaxDrugWithDrawalDate.
procedure THerdLookup.QueryAnimalWithdrawal(AEventType : Integer; const AID: Integer;
  const ADate: TDateTime);
var
   HealthWithDrawalInfo : THealthWithDrawalInfo;
begin
   HealthWithDrawalInfo := HerdLookup.MaxDrugWithDrawalDate( AID, ADate, AEventType );

   //   21/01/13 [V5.1 R3.8] /MK Change - Check for new separate withdrawal dates for Meat, Milk, Other and Organic.
   //if HealthWithDrawalInfo.WithDrawalDate >= ADate then
   {
   if ( HealthWithDrawalInfo.MeatWithDrawalDate >= ADate ) or ( HealthWithDrawalInfo.MilkWithDrawalDate >= ADate ) or
      ( HealthWithDrawalInfo.OtherWithDrawalDate >= ADate ) or ( HealthWithDrawalInfo.OrganicMeatWithDrawalDate >= ADate ) or
      ( HealthWithDrawalInfo.OrganicMilkWithDrawalDate >= ADate ) or ( HealthWithDrawalInfo.OrganicOtherWithDrawalDate >= ADate )then
   }

   //   06/02/14 [V5.2 R8.1] /MK Bug Fix - Added variable NotApplicable to THealthWithdrawalInfo. Only show warning if
   //                                      Milk Wihdrawal is after today and drug is not NOT APPLICABLE.

   //   13/10/16 [V5.6 R2.0] /MK Bug Fix - Withdrawal warning was only showing if treatment date that belongs to withdrawal drug was after today - James O'Connor.
   //if ( HealthWithDrawalInfo.StartDate >= ADate ) then
   if ( HealthWithDrawalInfo.MilkWithDrawalDate >= ADate ) and ( not(HealthWithdrawalInfo.NotApplicable) ) then
      TDrugWithdrawalMsgDlg.ShowMessage(HealthWithDrawalInfo, ADate);

   Screen.ActiveForm.update;
end;

function THerdLookup.GetHerdID(AAnimalID: Integer): Byte;
begin
   Result := 0;
   try
      GenQuery.Close;
      GenQuery.SQL.Clear;
      GenQuery.SQL.Add('Select HerdID From Animals Where ID = :AID');
      GenQuery.Params[0].AsInteger := AAnimalId;
      GenQuery.Open;
      GenQuery.First;
      Result := GenQuery.FieldByName('HerdID').AsInteger;
   finally
      GenQuery.Close;
   end;
end;

function THerdLookup.GetMinCalvingDate(AAnimalID: Integer): TDateTime;
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select MIN(EventDate) EDate From Events Where AnimalID = :AAnimalID');
         SQL.Add('And EventType =:AEventType');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := CCalvingEvent;
         Open;
         try
            Result := FieldByName('EDate').AsDateTime;
         finally
            Close;
         end;
      end;
end;

function THerdLookup.GetCalvingCount(AAnimalID: Integer): Byte;
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select COUNT(EventDate) ECount From Events Where AnimalID = :AAnimalID');
         SQL.Add('And EventType =:AEventType');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := CCalvingEvent;
         Open;
         try
            Result := FieldByName('ECount').AsInteger;
         finally
            Close;
         end;
      end;
end;

procedure THerdLookup.FilterICBFScoreList(AFilter: Integer;
  Sender: TObject);
var
  LGrid: TcxCustomLookupDBGrid;
  colListType : TcxLookupDBGridColumn;
begin
   inherited;
   if (Sender is TcxDBLookupComboBox) or (Sender is TcxLookupComboBox) then
      begin
         LGrid := TcxLookupComboBox(Sender).Properties.Grid;
         colListType := LGrid.Columns.ColumnByFieldName('ListType');

         if ( colListType <> nil ) then
            with LGrid.DataController.Filter do
               begin
                  Root.AddItem(colListType, foEqual, AFilter, '');
                  Active := True;
               end;
      end;
end;

procedure THerdLookup.erCalfQualityLookupPropertiesInitPopup(Sender: TObject);
begin
   inherited;
   ICBFCalfSurveyInitPopup(erCalfQualityLookup, 2);
end;

procedure THerdLookup.erCalfDocilityLookupPropertiesInitPopup(Sender: TObject);
begin
   inherited;
   ICBFCalfSurveyInitPopup(erCalfDocilityLookup, 1);
end;

function THerdLookup.CheckUniqueFieldValue(ATable, AField, AValue : Variant) : Boolean;
var
   s : string;
   c : Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         s := 'SELECT Count('+AField+') CID FROM '+ATable+' WHERE '+AField+' = "'+AValue+'"';
         SQL.Add(s);
         Open;
         First;
         c := FieldByName('CID').AsInteger;
         Result := c<=0;
      finally
         Close;
         Free;
      end;
end;

function THerdLookup.LookupDrugDosePurchUnitCode(const ADrugID : Integer; AUnitType : TUnitType) : string;
begin
   Result := '';
   if ADrugID <= 0 then Exit;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select U.UnitCode');
         SQL.Add('From Units U');
         if ( AUnitType = utDose ) then
            SQL.Add('Left Join Medicine M ON (M.DoseUnit=U.ID)')
         else
            SQL.Add('Left Join Medicine M ON (M.PurchUnit=U.ID)');
         SQL.Add('Where M.ID=:ID');
         Params[0].AsInteger := ADrugID;
         Open;
         try
            First;
            Result := FieldByName('UnitCode').AsString;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.DrugDetailByDrugID(const ADrugID : Integer; FieldName : string) : Variant;
begin
   Result := Null;
   if ADrugID <= 0 then Exit;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add(Format('Select M.%s From Medicine M',[FieldName]));
         SQL.Add('Where M.ID=:ID');
         Params[0].AsInteger := ADrugID;
         Open;
         try
            First;
            Result := FieldByName(FieldName).Value;
         finally
            Close;
         end;
      finally
         Free;
      end;


end;

function THerdLookup.DefaultBuyer: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select ID From Buyers');
         SQL.Add('Where DefaultBuyer=True');
         Open;
         if (RecordCount>0) then
         try
            First;
            Result := Fields[0].Value;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.BreedDetailsByID(const ABreedID: Integer;
  FieldNames: string): Variant;
begin
   Result := 0;
   if ( ABreedID = 0 ) then Exit;
   if ( Length(FieldNames) = 0 ) then Exit;
   with Windata.Breeds do
      begin
         //   27/03/19 [V5.8 R8.3] /MK Change - Use Locate instead of Lookup.
         if ( Locate('ID',ABreedID,[]) ) then
            Result := FieldByName(FieldNames).AsVariant;
      end;
end;

function THerdLookup.ColourDetailsByID(const AColourID: Integer;
  FieldNames: string): Variant;
begin
   Result := 0;
   with Windata.qAnimalColours do
      begin
         if ( Locate('ID',AColourID,[]) ) then
            Result := FieldByName(FieldNames).AsVariant;
      end;
end;

function THerdLookup.GetEventDetails(const AAnimalID,
  AEventType: Integer): TEventDetailsArray;
var
   EventRecNo : Integer;
   i : Integer;
   SubTableName : string;
   SubQuery : TQuery;
begin
   if AEventType = cPurchaseEvent then
      SubTableName := 'Purchases'
   else if AEventType = cSaleDeathEvent then
      SubTableName := 'SalesDeaths'
   else if AEventType = CWeightEvent then
      SubTableName := 'Weights'
   else
      SysUtils.Abort;

   SubQuery := TQuery.Create(nil);
   SubQuery.DatabaseName := AliasName;
   SubQuery.SQL.Clear;
   //   06/06/13 [V5.1 R7.3] /MK Bug Fix - SubQuery crashing on SQL.Add. Added SQL.Clear and SQL.Text.
   SubQuery.SQL.Text := 'Select * From '+SubTableName+' Where EventID =:EventID';

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select * From Events Where AnimalID=:AnimalID and EventType=:EventType');
         SQL.Add('Order By EventDate ');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := AEventType;
         Open;
         EventRecNo := 0;
         try
            First;
            SetLength(Result, RecordCount);
            while not eof do
              begin
                 SetLength(Result[EventRecNo].Event,FieldCount);
                 for i := 0 to FieldCount-1 do
                    begin
                       Result[EventRecNo].Event[i] := Fields[i].Value;
                    end;

                 SubQuery.Close;
                 SubQuery.Params[0].AsInteger := FieldByName('ID').AsInteger;
                 SubQuery.Open;
                 SetLength(Result[EventRecNo].SubEvent,SubQuery.FieldCount);
                 try
                    for i := 0 to SubQuery.FieldCount-1 do
                       begin
                          Result[EventRecNo].SubEvent[i] := SubQuery.Fields[i].Value;
                       end;
                 finally
                    SubQuery.Close;
                 end;
                 Next;
                 Inc(EventRecNo);
              end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.CalcFeedCosts(const AAnimalID: Integer): Double;
begin
   Result := 0;
   if ( AAnimalID <= 0 ) then Exit;

   // Calc Feed Costs
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select AllocDate, EndDate, CostDay From FeedEvents Where AnimalID =:ID');
         Params[0].AsInteger := AAnimalID;
         Open;
         try
            First;
            while ( NOT EOF ) do
               begin
                  If FieldByName('EndDate').AsDateTime = 0 then
                     Result := Result + (FieldByName('CostDay').AsFloat *
                                  (Date()- FieldByName('AllocDate').AsDateTime))
                  else
                     begin
                        Result := Result + (FieldByName('CostDay').AsFloat *
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
end;

function THerdLookup.CalcFixedCost(const AAnimalID: Integer; const DaysOnFarm : Integer = 0): Double;
begin
   Result := 0;
   if ( AAnimalID <= 0 ) or (DaysOnFarm <= 0)then exit;
   Result := (DaysOnFarm*HerdLookup.HerdOwnerData.FixedCostsPerDay);
end;

function THerdLookup.CalcHealthCosts(const AAnimalID: Integer): Double;
begin
   Result := 0;
   if AAnimalID <= 0 then exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select H.DrugUsed, H.RateApplic From Health H, Events E');
         SQL.Add('Where (H.EventID = E.ID) And (E.AnimalID = :ID)');
         SQL.Add('And (E.EventType IN (4,6))');
         Params[0].AsInteger := AAnimalID;
         Open;
         try
            First;
            while not ( EOF ) do
            begin
               Result := Result + WinData.CalcDrugCost(FieldByName('DrugUsed').AsInteger,
                                                       FieldByName('RateApplic').AsFloat);
               Next;
            end;
         finally
            Close;
         end;
      finally
         Free;
      end;

end;

function THerdLookup.GetLastRecordedWeight(
  const AAnimalID: Integer): Double;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.EventDate, W.Weight FROM Events E');
         SQL.Add('LEFT JOIN Weights W ON (E.ID=W.EventID)');
         SQL.Add('WHERE E.AnimalID=:ID');
         SQL.Add('AND E.EventType=7');
         SQL.Add('ORDER By EventDate');
         Params[0].AsInteger := AAnimalID;
         Open;
         try
            Last;
            Result := FieldByName('Weight').AsFloat;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.AvgDailyLiveWeightGain(AHerdID : Integer; ASaleDateFrom, ASaleDateTo : TDateTime;
  AAgeCategoryRecord : TAgeCategoryRecord; const ASex : String = '') : double;
var
   DLWG : TTable;
   SalesQuery, PurchasesQuery : TQuery;
   mdWeighCalc : TdxMemData;
   i : Integer;
   KillOutPerc : Double;
   TotalWeightGained : Double;
   TotalDays : Integer;
   NoDays : Integer;
   SaleWeightToUse : Double;
   d : Double;
   DateOfBirthFilter : TDateTime;
begin

   DLWG := TTable.Create(nil);
   DLWG.DatabaseName := AliasName;
   DLWG.TableName := 'tDLWG';
   if DLWG.Exists then DLWG.DeleteTable;
   with DLWG.FieldDefs do
      begin
         Clear;
         Add('AnimalID',ftInteger);
         Add('Sex',ftString,6);
         Add('DateOfBirth',ftDate);
         Add('LactNo',ftInteger);
         Add('SaleDate',ftDate);
         Add('SaleWeight',ftFloat);
         Add('ColdDeadWeight',ftFloat);
         Add('PurchDate',ftDate);
         Add('PurchWeight',ftFloat);
         Add('KillOutPerc',ftFloat);
      end;

   DLWG.CreateTable;
   DLWG.Active := True;

   SalesQuery := TQuery.Create(nil);
   PurchasesQuery := TQuery.Create(nil);
   try
      with SalesQuery do
         begin
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT A.ID, A.Sex, A.DateOfBirth, A.LactNo, ES.EventDate SaleDate,');
            SQL.Add('       S.Weight SaleWeight, S.ColdDeadWt ColdDeadWeight, EP.EventDate PurchDate, P.Weight PurchWeight');
            SQL.Add('FROM Events ES');
            SQL.Add('	INNER JOIN Animals A ON (A.ID=ES.AnimalID)');
            SQL.Add('	INNER JOIN SalesDeaths S ON (ES.ID=S.EventID)');
            SQL.Add('	INNER JOIN Events EP ON (EP.AnimalID=ES.AnimalID)');
            SQL.Add('	INNER JOIN purchases P ON  (P.EventID = EP.ID)');
            SQL.Add('WHERE (A.InHerd=False)');
            if AHerdID>0 then
               SQL.Add('AND  (A.HerdID = :HerdID)')
            else
               SQL.Add('AND  (A.HerdID <> :HerdID)');
            SQL.Add('AND  (ES.EventType = 11)');
            SQL.Add('AND  (EP.EventType = 12)');
            SQL.Add('AND (S.Sold=TRUE)');
            SQL.Add('AND ((S.Weight > 0 ) or (S.ColdDeadWt>0))');
            SQL.Add('AND (P.Weight>0)');
            if ASex <> '' then
               begin
                  if ASex = 'Male' then
                     SQL.Add('AND (A.Sex<>"Female")')
                  else
                     SQL.Add('AND (A.Sex="'+ASex+'")');
               end;

            if AAgeCategoryRecord.AgeMthCategory <> AgeNone then
               begin
                 DateOfBirthFilter := IncMonth(Date, - AAgeCategoryRecord.NoOfMonths);
                 if (AAgeCategoryRecord.AgeMthCategory = AgeUnder) then
                    SQL.Add('AND A.DateOfBirth > '''+FormatDate(DateOfBirthFilter, dsUS)+'''')
                 else if (AAgeCategoryRecord.AgeMthCategory = AgeAndOver) then
                    SQL.Add('AND A.DateOfBirth <= '''+FormatDate(DateOfBirthFilter, dsUS)+'''');
               end;

            if AHerdID>0 then
               Params[0].AsInteger := AHerdID
            else
               Params[0].AsInteger := WinData.NONEHerdID;
            if ( ASaleDateFrom > 0) and (ASaleDateTo > 0) then
               begin
                  SQL.Add('AND ES.EventDate BETWEEN :ASaleDateFrom AND :ASaleDateTo');
                  Params[1].AsDateTime := ASaleDateFrom;
                  Params[2].AsDateTime := ASaleDateTo;
               end
            else if ( ASaleDateFrom > 0) and (ASaleDateTo <= 0) then
               begin
                  SQL.Add('AND ES.EventDate >= :ASaleDateFrom');
                  Params[1].AsDateTime := ASaleDateFrom;
               end
            else if ( ASaleDateFrom <= 0) and (ASaleDateTo > 0) then
               begin
                  SQL.Add('AND ES.EventDate <= :ASaleDateTo');
                  Params[1].AsDateTime := ASaleDateTo;
               end;
            Open;
            try
               First;
               while not SalesQuery.eof do
                  begin
                     if (SalesQuery.FieldByName('SaleDate').Value < ASaleDateFrom )or (SalesQuery.FieldByName('SaleDate').Value > ASaleDateTo ) then
                         begin
                            SalesQuery.Next;
                            Continue;
                         end;

                     DLWG.Append;
                     DLWG.FieldByName('AnimalID').Value := SalesQuery.FieldByName('ID').Value;
                     DLWG.FieldByName('Sex').Value := SalesQuery.FieldByName('Sex').Value;
                     DLWG.FieldByName('DateOfBirth').Value := SalesQuery.FieldByName('DateOfBirth').Value;
                     DLWG.FieldByName('LactNo').Value := SalesQuery.FieldByName('LactNo').Value;
                     DLWG.FieldByName('SaleDate').Value := SalesQuery.FieldByName('SaleDate').Value;
                     DLWG.FieldByName('SaleWeight').Value := SalesQuery.FieldByName('SaleWeight').Value;
                     DLWG.FieldByName('ColdDeadWeight').Value := SalesQuery.FieldByName('ColdDeadWeight').Value;
                     DLWG.FieldByName('PurchDate').Value := SalesQuery.FieldByName('PurchDate').Value;
                     DLWG.FieldByName('PurchWeight').Value := SalesQuery.FieldByName('PurchWeight').Value;

                     if (DLWG.FieldByName('SaleWeight').AsFloat <= 0) and (DLWG.FieldByName('ColdDeadWeight').AsFloat > 0) then
                        begin
                           if Fields[1].AsString = cSex_Female then
                              begin
                                 if Fields[3].AsInteger = 0 then
                                    DLWG.FieldByName('KillOutPerc').AsFloat := 54
                                 else
                                    DLWG.FieldByName('KillOutPerc').AsFloat := 52;
                              end
                           else if Fields[1].AsString = cSex_Bull then
                              DLWG.FieldByName('KillOutPerc').AsFloat := 58
                           else if Fields[1].AsString = cSex_Steer then
                              DLWG.FieldByName('KillOutPerc').AsFloat := 54;

                           DLWG.FieldByName('SaleWeight').AsFloat := (DLWG.FieldByName('ColdDeadWeight').AsFloat / ((DLWG.FieldByName('KillOutPerc').AsFloat)/100));
                        end;
                     DLWG.Post;
                     SalesQuery.Next;
                  end;
            finally
               Close;
            end;
         end;

      with DLWG do
         begin
            First;
            while not eof do
               begin
                  if ( DLWG.FieldByName('PurchWeight').AsFloat > 0 ) and ( DLWG.FieldByName('SaleWeight').AsFloat > 0 ) then
                     begin
                        NoDays := Trunc(DLWG.FieldByName('SaleDate').AsDateTime-DLWG.FieldByName('PurchDate').AsDateTime);
                        Inc( TotalDays, NoDays );
                        TotalWeightGained := TotalWeightGained + (DLWG.FieldByName('SaleWeight').AsFloat - DLWG.FieldByName('PurchWeight').AsFloat);
                     end
                  else if ( DLWG.FieldByName('SaleWeight').AsFloat > 0 ) then
                     begin
                        NoDays := Trunc(DLWG.FieldByName('SaleDate').AsDateTime-DLWG.FieldByName('DateOfBirth').AsDateTime);
                        Inc( TotalDays, NoDays );
                        TotalWeightGained := TotalWeightGained + DLWG.FieldByName('SaleWeight').AsFloat;
                     end;
               Next;
            end;
         end;
      if (TotalDays>0) then
         Result := (TotalWeightGained/TotalDays);
   finally
      FreeAndNil(SalesQuery);
      FreeAndNil(PurchasesQuery);
      DLWG.Active := False;
      FreeAndNil(DLWG);
   end;
end;

procedure THerdLookup.CreateMemDataField(AMemData: TDataSet; AFieldName: string;
  AFieldType: TFieldType);
begin
  if (AMemData = nil) or (AFieldName = '') then
    Exit;
  with AMemData.FieldDefs.AddFieldDef do
  begin
    Name := AFieldName;
    DataType := AFieldType;
    CreateField(AMemData);
  end;
end;

function THerdLookup.CountryByHerdID(AHerdID: Integer): TCountry;
begin
   HerdOwnerData.HerdID := AHerdID;
   Result := HerdOwnerData.RegisteredCountry;
end;

function THerdLookup.GetHerdOwnerData: THerdOwnerData;
begin
   if FHerdOwnerData = nil then
      FHerdOwnerData := THerdOwnerData.create(WinData.KingData, WinData.UserDefaultHerdID);
   Result := FHerdOwnerData;
end;

function THerdLookup.GetAnimalComments(AAnimalID: Integer): WideString;
begin
   Result := '';
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Comments From AnimalsExt');
         SQL.Add('Where AnimalID=:AID');
         Params[0].AsInteger := AAnimalID;
         Open;
         try
            First;
            Result := Fields[0].Value;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.NatIDNumAlreadyExists(ANatIDNum: String): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ( SearchNatID LIKE "%'+StripAllSpaces(ANatIDNum)+'%" )');
         Open;
         try
            First;
            Result := ( Fields[0].AsInteger > 0 );
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.CountOfDrugDoses(const AAnimalID : Integer; ADrugGroup : string;
   APeriodFrom, APeriodTo : TDateTime) : Integer;
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT E.AnimalID, E.EventDate, H.DrugUsed');
         SQL.Add('FROM events E');
         SQL.Add('   INNER JOIN Health H   ON  (E.ID = H.EventID)');
         SQL.Add('   INNER JOIN Medicine M ON  (H.DrugUsed = M.ID)');
         SQL.Add('WHERE E.AnimalID=:AnimalID');
         SQL.Add('AND   M.MediGroup= (Select Distinct(ID) From GenLook Where ((ListType=25) And (Description=:Description)))');
         if (APeriodFrom > 0) and (APeriodTo > 0) then
            SQL.Add('AND E.EventDate BETWEEN :FromDate AND :ToDate')
         else if (APeriodFrom > 0) then
            SQL.Add('AND E.EventDate >=:FromDate')
         else if (APeriodTo > 0) then
            SQL.Add('AND E.EventDate <=:ToDate');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsString := ADrugGroup;

         if (APeriodFrom > 0) and (APeriodTo > 0) then
            begin
               Params[2].AsDateTime := APeriodFrom;
               Params[3].AsDateTime := APeriodTo;
            end
         else if (APeriodFrom > 0) then
            Params[2].AsDateTime := APeriodFrom
         else if (APeriodFrom > 0) then
            Params[3].AsDateTime := APeriodTo;
         Open;
         try
            Result := RecordCount;
         finally
            Close;
         end;
      end;
end;

function THerdLookup.DrugGroupByDrugID(const ADrugID: Integer): string;
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT G.Description ');
         SQL.Add('FROM GenLook G ');
         SQL.Add('   INNER JOIN "Medicine.DB" M ON (M.MediGroup = G.ID)');
         SQL.Add('WHERE M.ID=:ADrugID');
         Params[0].AsInteger := ADrugID;
         Open;
         try
            Result := Fields[0].AsString;
         finally
            Close;
         end;
      end;
end;

function THerdLookup.GetAvgSalesPricePerKg(AHerdID: Integer; ASaleDateFrom,
  ASaleDateTo: TDateTime; AAgeCategoryRecord: TAgeCategoryRecord;
  const ASex: String): double;
var
   DateOfBirthFilter : TDateTime;
begin
   Result := 0;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT SUM(S.Price) / SUM(S.ColdDeadWt) result');
         SQL.Add('FROM "salesdeaths.DB" S ');
         SQL.Add('	INNER JOIN "events.DB" E ON  (E.ID = S.EventID)');
         if (ASex <> '') or (AAgeCategoryRecord.AgeMthCategory <> AgeNone) then
            SQL.Add('	INNER JOIN Animals A ON  (E.AnimalID = A.ID)');
         if AHerdID > 0 then
            SQL.Add('WHERE  (E.HerdID = :HerdID)')
         else
            SQL.Add('WHERE  (E.HerdID <> :HerdID');
         SQL.Add('AND  (E.EventType = 11)');
         SQL.Add('AND (S.Sold=TRUE)');
         SQL.Add('AND (S.ColdDeadWt>0)');
         if ASex <> '' then
            begin
               if ASex = 'Male' then
                  SQL.Add('AND (A.Sex<>"Female")')
               else
                  SQL.Add('AND (A.Sex="'+ASex+'")');
            end;

         if AHerdID>0 then
            Params[0].AsInteger := AHerdID
         else
            Params[0].AsInteger := WinData.NONEHerdID;

         if ( ASaleDateFrom > 0) and (ASaleDateTo > 0) then
            begin
               SQL.Add('AND E.EventDate BETWEEN :ASaleDateFrom AND :ASaleDateTo');
               Params[1].AsDateTime := ASaleDateFrom;
               Params[2].AsDateTime := ASaleDateTo;
            end
         else if ( ASaleDateFrom > 0) and (ASaleDateTo <= 0) then
            begin
               SQL.Add('AND E.EventDate >= :ASaleDateFrom');
               Params[1].AsDateTime := ASaleDateFrom;
            end
         else if ( ASaleDateFrom <= 0) and (ASaleDateTo > 0) then
            begin
               SQL.Add('AND E.EventDate <= :ASaleDateTo');
               Params[1].AsDateTime := ASaleDateTo;
            end;

        if AAgeCategoryRecord.AgeMthCategory <> AgeNone then
           begin
             DateOfBirthFilter := IncMonth(Date, -AAgeCategoryRecord.NoOfMonths);
             if (AAgeCategoryRecord.AgeMthCategory = AgeUnder) then
                SQL.Add('AND A.DateOfBirth > '''+FormatDate(DateOfBirthFilter, dsUS)+'''')
             else if (AAgeCategoryRecord.AgeMthCategory = AgeAndOver) then
                SQL.Add('AND A.DateOfBirth <= '''+FormatDate(DateOfBirthFilter, dsUS)+'''');
           end;
         Open;
         try
            First;
            result := Fields[0].AsFloat;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.BreedIDByCode(const ABreedCode: string): Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID FROM Breeds WHERE UPPER(Code)=:ACode');
         Params[0].AsString := Uppercase(ABreedCode);
         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure THerdLookup.CreateTagStore(const AHerdID : Integer);
var
   i : Integer;
   CheckDigit : Integer;
   nAnimalNo : Integer;
   bLeadZero : Boolean;
   HerdNo : string;
   NewID : string;
   sAnimalNo : string;
   Country : TCountry;

begin
   with TagStore do
      begin
         if Active then
            Active := False;

         // set the herdid this will allow us to get the registered country
         HerdOwnerData.HerdID := AHerdID;

         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('DELETE FROM TagStore WHERE HerdID=:HID');
               Params[0].AsInteger := AHerdID;
               ExecSQL;
            finally
               Free;
            end;

         // get the herd identifier
         HerdNo := HerdOwnerData.HerdIdentifier;
         // get the next natid no value
         nAnimalNo := HerdOwnerData.NextNatID;
         // Populate Animal No with Lead Zeros ??
         bLeadZero := HerdOwnerData.NatIDLeadZero;

         Active := True;
         try
            try
               for i := 1 to 10 do
                  begin
                     CheckDigit := 1;

                     if ( HerdOwnerData.RegisteredCountry = Ireland ) then
                        begin
                           while ((not CheckNatID( GetTagPreFix(AHerdID) + HerdNo +' '+ IntToStr(CheckDigit) +' '+ PadLeft(IntToStr(nAnimalNo),'0',4), NewID, True)) and (CheckDigit<=9)) do
                              Inc(CheckDigit);
                        end
                     else if ( HerdOwnerData.RegisteredCountry = NIreland ) then
                        begin
                           // very important for UK9 tag... include the spaces between HerdNo, AnimalNo and Check Digit

                           if bLeadZero then
                              sAnimalNo := PadLeft(IntToStr(nAnimalNo), '0', 4)
                           else
                              sAnimalNo := IntToStr(nAnimalNo);

                           while ( (not CheckNINatID( 'UK 9 ' + HerdNo + ' ' + sAnimalNo + ' ' + IntToStr(CheckDigit) , NewID, False)) and (CheckDigit<=7) ) do
                              Inc(CheckDigit);
                        end;

                     Append;
                     Fields[1].AsString := NewID;
                     Fields[2].AsString := CreateSortNatIDString(NewID, AHerdID, HerdOwnerData.RegisteredCountry);
                     Fields[3].AsInteger := AHerdID;
                     Post;

                     if (i = 10) then
                        begin
                           // update owners table, set the nextnatid to nanimalno.
                           HerdOwnerData.NextNatID := nAnimalNo+1;
                        end
                     else
                        Inc(nAnimalNo);
                  end;
            except
              on e : exception do
                begin
                   if State in dsEditModes then
                     Cancel;
                   raise Exception.Create(E.Message);
                end;
            end;
         finally
            DbiSaveChanges(TagStore.Handle);
            Active := False;
         end;
      end;
end;

procedure THerdLookup.OpenTagStore(const AHerdID: Integer);
begin
   if (AHerdID > 0) then // activate tag store
      begin
         TagStore.Active := True;
         TagStore.Filter := Format('HerdID = %d',[AHerdID]);
         TagStore.Filtered := True;
      end
   else
      begin              // deactivate tag store
         TagStore.Filter := '';
         TagStore.Filtered := False;
         TagStore.Active := False;
      end;
end;

procedure THerdLookup.RemoveFromTagStore(const AHerdID : Integer; ATagNo : string);
var
   iNextIDCreateCount,
   CheckDigit : Integer;
   HerdNo : string;
   NewID : string;
   Country : TCountry;
   AnimalCheck : TAnimalCheck;

   procedure GetNextNatID ( ACountry : TCountry);
   begin
      if ( ACountry = Ireland ) then
         begin
            NewID := '';
            while ((not CheckNatID( GetTagPreFix(AHerdID) + HerdNo +' '+ IntToStr(CheckDigit) +' '+ PadLeft(IntToStr(HerdOwnerData.NextNatID),'0',4), NewID, True)) and (CheckDigit<=9)) do
               Inc(CheckDigit);
         end
      else
         begin
            //   01/03/18 [V5.7 R8.2] /MK Bug Fix - Need to pass in the rollover herd boolean for further checking of tag. 
            while ((not CheckNINatID( 'UK 9 ' + HerdNo + ' ' + IntToStr(HerdOwnerData.NextNatID) + ' ' + IntToStr(CheckDigit) , NewID, HerdOwnerData.RolloverHerd)) and (CheckDigit<=7)) do
               Inc(CheckDigit);
         end;
   end;

begin
   with TagStore do
      begin
         // set the herdid this will allow us to get the registered country
         HerdOwnerData.HerdID := AHerdID;
         // get the herd identifier
         HerdNo := HerdOwnerData.HerdIdentifier;
         OpenTagStore(AHerdID); // open tag store and filter only tags belonging to AHerdID
         if Locate('TagNumber', ATagNo, [loCaseinsensitive]) then
            Delete;
         try
            try
               while RecordCount < 10 do
                  begin
                     CheckDigit := 1;

                     GetNextNatID(HerdOwnerData.RegisteredCountry);
                     AnimalCheck := CheckForAnimal(NewID,0,AHerdID,'I');
                     iNextIDCreateCount := 0;
                     while ( AnimalCheck <> AllOk ) and ( iNextIDCreateCount <= 10 ) do
                        begin
                           GetNextNatID(HerdOwnerData.RegisteredCountry);
                           Inc(iNextIDCreateCount);
                        end;
                     //   07/02/19 [V5.8 R6.6] /MK Change - If error found in TagStore then attempt 10 times to generate tag and exit out giving error.
                     if ( iNextIDCreateCount = 10 ) then
                        begin
                           MessageDlg('Unable to generate the list of tags. Contact Kingswood.',mtError,[mbOK],0);
                           Exit;
                        end;

                     Append;
                     Fields[1].AsString := NewID;
                     Fields[2].AsString := CreateSortNatIDString(NewID, AHerdID, HerdOwnerData.RegisteredCountry);
                     Fields[3].AsInteger := AHerdID;
                     Post;

                     // update owners table, set the nextnatid to nanimalno.
                     HerdOwnerData.NextNatID := HerdOwnerData.NextNatID+1;
                  end;
            except
              on e : exception do
                begin
                   if State in dsEditModes then
                     Cancel;
                   raise Exception.Create(E.Message);
                end;
            end;
         finally
            OpenTagStore(0);
         end;
      end;
end;

procedure THerdLookup.TagStoreAfterDelete(DataSet: TDataSet);
begin
   DbiSaveChanges(TagStore.Handle);
end;

procedure THerdLookup.TagStoreAfterPost(DataSet: TDataSet);
begin
   DbiSaveChanges(TagStore.Handle);
end;

function THerdLookup.InputStyleAsString(AInputStyle: Integer): string;
begin
   Result := 'Manual Input';
   if mdNatIDNoInputStyles.Locate('ID', AInputStyle, []) then
      Result := Trim(mdNatIDNoInputStylesInputStyle.AsString);
end;

function THerdLookup.ErrorInTagStore: Boolean;
begin
   Result := False;
   if ( not(TagStore.Active) ) then
      TagStore.Open;
   //   07/02/19 [V5.8 R6.6] /MK Change - Show error if there are less than 10 records in TagStore.
   Result := ( TagStore.RecordCount < 10 );
   if ( Result ) then Exit; 
   TagStore.First;
   while ( not(TagStore.Eof) ) do
      begin
         Result := ( NatIDNumAlreadyExists(TagStore.FieldByName('TagNumber').AsString) );
         if ( Result ) then Exit;
         TagStore.Next;
      end;
   TagStore.Close;
end;

procedure THerdLookup.FilterDisposalMannerList(AInUse : Boolean);
var
  LGrid: TcxCustomLookupDBGrid;
  colInUse : TcxLookupDBGridColumn;
begin
   inherited;
   LGrid := erLookupDisposalManner.Properties.Grid;
   colInUse := LGrid.Columns.ColumnByFieldName('InUse');
   if ( colInUse <> nil ) then
      begin
         with LGrid.DataController.Filter do
            begin
               if AInUse then
                  begin
                     Root.AddItem(colInUse, foEqual, AInUse, '');
                     Active := True;
                  end
               else
                  begin
                     Clear;
                     Active := False;
                  end;
            end;
      end;
end;

procedure THerdLookup.FilterCustomerList(AAuthorisedDisposal: Boolean);
var
  LGrid: TcxCustomLookupDBGrid;
  colAuthorisedDisposalPlace : TcxLookupDBGridColumn;
begin
   inherited;
   LGrid := erLookupDisposalManner.Properties.Grid;
   colAuthorisedDisposalPlace := LGrid.Columns.ColumnByFieldName('AuthorisedDisposalPlace');
   if ( colAuthorisedDisposalPlace <> nil ) then
      begin
         with LGrid.DataController.Filter do
            begin
               if AAuthorisedDisposal then
                  begin
                     Root.AddItem(colAuthorisedDisposalPlace, foEqual, AAuthorisedDisposal, '');
                     Active := True;
                  end
               else
                  begin
                     Clear;
                     Active := False;
                  end;
            end;
      end;
end;

//   19/10/11 [V5.0 R1.5] /MK Additional Feature - Added DateOfBirth To Current Animal.
procedure THerdLookup.CreatePedigreeTable(const AIDS: TIntegerArray);
const
   cAnimalID = 'AnimalID';
   cAnimalNo = 'AnimalNo';
   cAnimal = 'Animal';
   cAnimalDOB = 'DateOfBirth';
   cAnimalName = 'AnimalName';
   cAnimalClass = 'AnimalClass';
   cAnimalClassScore = 'AnimalClassScore';
   cAnimalCombo = 'AnimalCombo';
   cAnimalHerdBookNo = 'HerdBookNo';
   cName = 'Name';
        //Dam Line
   cDamID = 'DamID';
   cDamNo = 'DamNo';
   cDam = 'Dam';
   cDamName = 'DamName';
   cDamClass = 'DamClass';
   cDamClassScore = 'DamClassScore';
   cDamCombo = 'DamCombo';

   cDDamID = 'DDamID';
   cDDamNo = 'DDamNo';
   cDDam = 'DDam';
   cDDamName = 'DDamName';
   cDDamClass = 'DDamClass';
   cDDamClassScore = 'DDamClassScore';
   cDDamCombo = 'DDamCombo';

   cDSireID = 'DSireID';
   cDSireNo = 'DSireNo';
   cDSire = 'DSire';
   cDSireName = 'DSireName';
   cDSireClass = 'DSireClass';
   cDSireClassScore = 'DSireClassScore';
   cDSireCombo = 'DSireCombo';

   cDDDamID = 'DDDamID';
   cDDDamNo = 'DDDamNo';
   cDDDam = 'DDDam';
   cDDDamName = 'DDDamName';
   cDDDamClass = 'DDDamClass';
   cDDDamClassScore = 'DDDamClassScore';
   cDDDamCombo = 'DDDamCombo';

   cDDSireID = 'DDSireID';
   cDDSireNo = 'DDSireNo';
   cDDSire = 'DDSire';
   cDDSireName = 'DDSireName';
   cDDSireClass = 'DDSireClass';
   cDDSireClassScore = 'DDSireClassScore';
   cDDSireCombo = 'DDSireCombo';

   cDSDamID = 'DSDamID';
   cDSDamNo = 'DSDamNo';
   cDSDam = 'DSDam';
   cDSDamName = 'DSDamName';
   cDSDamClass = 'DSDamClass';
   cDSDamClassScore = 'DSDamClassScore';
   cDSDamCombo = 'DSDamCombo';

   cDSSireID = 'DSSireID';
   cDSSireNo = 'DSSireNo';
   cDSSire = 'DSSire';
   cDSSireName = 'DSSireName';
   cDSSireClass = 'DSSireClass';
   cDSSireClassScore = 'DSSireClassScore';
   cDSSireCombo = 'DSSireCombo';

   cDDDDamID = 'DDDDamID';
   cDDDDamNo = 'DDDDamNo';
   cDDDDam = 'DDDDam';
   cDDDDamName = 'DDDDamName';
   cDDDDamClass = 'DDDDamClass';
   cDDDDamClassScore = 'DDDDamClassScore';
   cDDDDamCombo = 'DDDDamCombo';

   cDDDSireID = 'DDDSireID';
   cDDDSireNo = 'DDDSireNo';
   cDDDSire = 'DDDSire';
   cDDDSireName = 'DDDSireName';
   cDDDSireClass = 'DDDSireClass';
   cDDDSireClassScore = 'DDDSireClassScore';
   cDDDSireCombo = 'DDDSireCombo';

   cDDSDamID = 'DDSDamID';
   cDDSDamNo = 'DDSDamNo';
   cDDSDam = 'DDSDam';
   cDDSDamName = 'DDSDamName';
   cDDSDamClass = 'DDSDamClass';
   cDDSDamClassScore = 'DDSDamClassScore';
   cDDSDamCombo = 'DDSDamCombo';

   cDDSSireID = 'DDSSireID';
   cDDSSireNo = 'DDSSireNo';
   cDDSSire = 'DDSSire';
   cDDSSireName = 'DDSSireName';
   cDDSSireClass = 'DDSSireClass';
   cDDSSireClassScore = 'DDSSireClassScore';
   cDDSSireCombo = 'DDSSireCombo';

   cDSDDamID = 'DSDDamID';
   cDSDDamNo = 'DSDDamNo';
   cDSDDam = 'DSDDam';
   cDSDDamName = 'DSDDamName';
   cDSDDamClass = 'DSDDamClass';
   cDSDDamClassScore = 'DSDDamClassScore';
   cDSDDamCombo = 'DSDDamCombo';

   cDSDSireID = 'DSDSireID';
   cDSDSireNo = 'DSDSireNo';
   cDSDSire = 'DSDSire';
   cDSDSireName = 'DSDSireName';
   cDSDSireClass = 'DSDSireClass';
   cDSDSireClassScore = 'DSDSireClassScore';
   cDSDSireCombo = 'DSDSireCombo';

   cDSSDamID = 'DSSDamID';
   cDSSDamNo = 'DSSDamNo';
   cDSSDam = 'DSSDam';
   cDSSDamName = 'DSSDamName';
   cDSSDamClass = 'DSSDamClass';
   cDSSDamClassScore = 'DSSDamClassScore';
   cDSSDamCombo = 'DSSDamCombo';

   cDSSSireID = 'DSSSireID';
   cDSSSireNo = 'DSSSireNo';
   cDSSSire = 'DSSSire';
   cDSSSireName = 'DSSSireName';
   cDSSSireClass = 'DSSSireClass';
   cDSSSireClassScore = 'DSSSireClassScore';
   cDSSSireCombo = 'DSSSireCombo';


   //SIRE Line
   cSireID = 'SireID';
   cSireNo = 'SireNo';
   cSire = 'Sire';
   cSireName = 'SireName';
   cSireClass = 'SireClass';
   cSireClassScore = 'SireClassScore';
   cSireCombo = 'SireCombo';

   cSDamID = 'SDamID';
   cSDamNo = 'SDamNo';
   cSDam = 'SDam';
   cSDamName = 'SDamName';
   cSDamClass = 'SDamClass';
   cSDamClassScore = 'SDamClassScore';
   cSDamCombo = 'SDamCombo';

   cSSireID = 'SSireID';
   cSSireNo = 'SSireNo';
   cSSire = 'SSire';
   cSSireName = 'SSireName';
   cSSireClass = 'SSireClass';
   cSSireClassScore = 'SSireClassScore';
   cSSireCombo = 'SSireCombo';

   cSDDamID = 'SDDamID';
   cSDDamNo = 'SDDamNo';
   cSDDam = 'SDDam';
   cSDDamName = 'SDDamName';
   cSDDamClass = 'SDDamClass';
   cSDDamClassScore = 'SDDamClassScore';
   cSDDamCombo = 'SDDamCombo';

   cSDSireID = 'SDSireID';
   cSDSireNo = 'SDSireNo';
   cSDSire = 'SDSire';
   cSDSireName = 'SDSireName';
   cSDSireClass = 'SDSireClass';
   cSDSireClassScore = 'SDSireClassScore';
   cSDSireCombo = 'SDSireCombo';

   cSSDamID = 'SSDamID';
   cSSDamNo = 'SSDamNo';
   cSSDam = 'SSDam';
   cSSDamName = 'SSDamName';
   cSSDamClass = 'SSDamClass';
   cSSDamClassScore = 'SSDamClassScore';
   cSSDamCombo = 'SSDamCombo';

   cSSSireID = 'SSSireID';
   cSSSireNo = 'SSSireNo';
   cSSSire = 'SSSire';
   cSSSireName = 'SSSireName';
   cSSSireClass = 'SSSireClass';
   cSSSireClassScore = 'SSSireClassScore';
   cSSSireCombo = 'SSSireCombo';

   cSDDDamID = 'SDDDamID';
   cSDDDamNo = 'SDDDamNo';
   cSDDDam = 'SDDDam';
   cSDDDamName = 'SDDDamName';
   cSDDDamClass = 'SDDDamClass';
   cSDDDamClassScore = 'SDDDamClassScore';
   cSDDDamCombo = 'SDDDamCombo';

   cSDDSireID = 'SDDSireID';
   cSDDSireNo = 'SDDSireNo';
   cSDDSire = 'SDDSire';
   cSDDSireName = 'SDDSireName';
   cSDDSireClass = 'SDDSireClass';
   cSDDSireClassScore = 'SDDSireClassScore';
   cSDDSireCombo = 'SDDSireCombo';

   cSDSDamID = 'SDSDamID';
   cSDSDamNo = 'SDSDamNo';
   cSDSDam = 'SDSDam';
   cSDSDamName = 'SDSDamName';
   cSDSDamClass = 'SDSDamClass';
   cSDSDamClassScore = 'SDSDamClassScore';
   cSDSDamCombo = 'SDSDamCombo';

   cSDSSireID = 'SDSSireID';
   cSDSSireNo = 'SDSSireNo';
   cSDSSire = 'SDSSire';
   cSDSSireName = 'SDSSireName';
   cSDSSireClass = 'SDSSireClass';
   cSDSSireClassScore = 'SDSSireClassScore';
   cSDSSireCombo = 'SDSSireCombo';

   cSSDDamID = 'SSDDamID';
   cSSDDamNo = 'SSDDamNo';
   cSSDDam = 'SSDDam';
   cSSDDamName = 'SSDDamName';
   cSSDDamClass = 'SSDDamClass';
   cSSDDamClassScore = 'SSDDamClassScore';
   cSSDDamCombo = 'SSDDamCombo';

   cSSDSireID = 'SSDSireID';
   cSSDSireNo = 'SSDSireNo';
   cSSDSire = 'SSDSire';
   cSSDSireName = 'SSDSireName';
   cSSDSireClass = 'SSDSireClass';
   cSSDSireClassScore = 'SSDSireClassScore';
   cSSDSireCombo = 'SSDSireCombo';

   cSSSDamID = 'SSSDamID';
   cSSSDamNo = 'SSSDamNo';
   cSSSDam = 'SSSDam';
   cSSSDamName = 'SSSDamName';
   cSSSDamClass = 'SSSDamClass';
   cSSSDamClassScore = 'SSSDamClassScore';
   cSSSDamCombo = 'SSSDamCombo';

   cSSSSireID = 'SSSSireID';
   cSSSSireNo = 'SSSSireNo';
   cSSSSire = 'SSSSire';
   cSSSSireName = 'SSSSireName';
   cSSSSireClass = 'SSSSireClass';
   cSSSSireClassScore = 'SSSSireClassScore';
   cSSSSireCombo = 'SSSSireCombo';


   cLatestClass = 'LatestClass';
   cLatestClassScore = 'LatestClassScore';
   cDonorDamID = 'DonorDamID';
   cID = 'ID';

var
   DAM,
   DDAM,
   DSIRE,
   DDDAM,
   DDSIRE,
   DSDAM,
   DSSIRE,

   DDDDAM,
   DDDSIRE,
   DDSDAM,
   DDSSIRE,
   DSDDAM,
   DSDSIRE,
   DSSDAM,
   DSSSIRE,

   SIRE,
   SDAM,
   SSIRE,
   SDDAM,
   SDSIRE,
   SSDAM,
   SSSIRE,

   SDDDAM,
   SDDSIRE,
   SDSDAM,
   SDSSIRE,
   SSDDAM,
   SSDSIRE,
   SSSDAM,
   SSSSIRE : Variant;
   Found : Boolean;

   i : Integer;
   tCowExt, tBullExt : TTable;
begin
   FlushPedigreeTable;

   WinData.CreateTTable(tCowExt, nil, '', 'CowExt');
   WinData.CreateTTable(tBullExt, nil, '', 'BullExt');

   try
      with PedigreeTable do
         begin
            FieldDefs.Clear;
            FieldDefs.Add(cAnimalID,ftInteger,0,FALSE);
            FieldDefs.Add(cAnimalNo,ftString,10,FALSE);
            FieldDefs.Add(cAnimal,ftString,20,FALSE);
            FieldDefs.Add(cAnimalDOB,ftDateTime,0,FALSE);
            FieldDefs.Add(cAnimalName,ftString,40,FALSE);
            FieldDefs.Add(cAnimalClass,ftString,2,FALSE);
            FieldDefs.Add(cAnimalClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cAnimalCombo,ftString,4,FALSE);

            FieldDefs.Add(cDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cDamNo,ftString,10,FALSE);
            FieldDefs.Add(cDam,ftString,20,FALSE);
            FieldDefs.Add(cDamName,ftString,40,FALSE);
            FieldDefs.Add(cDamClass,ftString,2,FALSE);
            FieldDefs.Add(cDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cDDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cDDamNo,ftString,10,FALSE);
            FieldDefs.Add(cDDam,ftString,20,FALSE);
            FieldDefs.Add(cDDamName,ftString,40,FALSE);
            FieldDefs.Add(cDDamClass,ftString,2,FALSE);
            FieldDefs.Add(cDDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cDSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cDSireNo,ftString,10,FALSE);
            FieldDefs.Add(cDSire,ftString,20,FALSE);
            FieldDefs.Add(cDSireName,ftString,40,FALSE);
            FieldDefs.Add(cDSireClass,ftString,2,FALSE);
            FieldDefs.Add(cDSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cDDDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cDDDamNo,ftString,10,FALSE);
            FieldDefs.Add(cDDDam,ftString,20,FALSE);
            FieldDefs.Add(cDDDamName,ftString,40,FALSE);
            FieldDefs.Add(cDDDamClass,ftString,2,FALSE);
            FieldDefs.Add(cDDDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDDDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cDDSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cDDSireNo,ftString,10,FALSE);
            FieldDefs.Add(cDDSire,ftString,20,FALSE);
            FieldDefs.Add(cDDSireName,ftString,40,FALSE);
            FieldDefs.Add(cDDSireClass,ftString,2,FALSE);
            FieldDefs.Add(cDDSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDDSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cDSDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cDSDamNo,ftString,10,FALSE);
            FieldDefs.Add(cDSDam,ftString,20,FALSE);
            FieldDefs.Add(cDSDamName,ftString,40,FALSE);
            FieldDefs.Add(cDSDamClass,ftString,2,FALSE);
            FieldDefs.Add(cDSDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDSDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cDSSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cDSSireNo,ftString,10,FALSE);
            FieldDefs.Add(cDSSire,ftString,20,FALSE);
            FieldDefs.Add(cDSSireName,ftString,40,FALSE);
            FieldDefs.Add(cDSSireClass,ftString,2,FALSE);
            FieldDefs.Add(cDSSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDSSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cDDDDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cDDDDamNo,ftString,10,FALSE);
            FieldDefs.Add(cDDDDam,ftString,20,FALSE);
            FieldDefs.Add(cDDDDamName,ftString,40,FALSE);
            FieldDefs.Add(cDDDDamClass,ftString,2,FALSE);
            FieldDefs.Add(cDDDDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDDDDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cDDDSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cDDDSireNo,ftString,10,FALSE);
            FieldDefs.Add(cDDDSire,ftString,20,FALSE);
            FieldDefs.Add(cDDDSireName,ftString,40,FALSE);
            FieldDefs.Add(cDDDSireClass,ftString,2,FALSE);
            FieldDefs.Add(cDDDSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDDDSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cDDSDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cDDSDamNo,ftString,10,FALSE);
            FieldDefs.Add(cDDSDam,ftString,20,FALSE);
            FieldDefs.Add(cDDSDamName,ftString,40,FALSE);
            FieldDefs.Add(cDDSDamClass,ftString,2,FALSE);
            FieldDefs.Add(cDDSDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDDSDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cDDSSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cDDSSireNo,ftString,10,FALSE);
            FieldDefs.Add(cDDSSire,ftString,20,FALSE);
            FieldDefs.Add(cDDSSireName,ftString,40,FALSE);
            FieldDefs.Add(cDDSSireClass,ftString,2,FALSE);
            FieldDefs.Add(cDDSSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDDSSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cDSDDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cDSDDamNo,ftString,10,FALSE);
            FieldDefs.Add(cDSDDam,ftString,20,FALSE);
            FieldDefs.Add(cDSDDamName,ftString,40,FALSE);
            FieldDefs.Add(cDSDDamClass,ftString,2,FALSE);
            FieldDefs.Add(cDSDDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDSDDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cDSDSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cDSDSireNo,ftString,10,FALSE);
            FieldDefs.Add(cDSDSire,ftString,20,FALSE);
            FieldDefs.Add(cDSDSireName,ftString,40,FALSE);
            FieldDefs.Add(cDSDSireClass,ftString,2,FALSE);
            FieldDefs.Add(cDSDSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDSDSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cDSSDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cDSSDamNo,ftString,10,FALSE);
            FieldDefs.Add(cDSSDam,ftString,20,FALSE);
            FieldDefs.Add(cDSSDamName,ftString,40,FALSE);
            FieldDefs.Add(cDSSDamClass,ftString,2,FALSE);
            FieldDefs.Add(cDSSDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDSSDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cDSSSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cDSSSireNo,ftString,10,FALSE);
            FieldDefs.Add(cDSSSire,ftString,20,FALSE);
            FieldDefs.Add(cDSSSireName,ftString,40,FALSE);
            FieldDefs.Add(cDSSSireClass,ftString,2,FALSE);
            FieldDefs.Add(cDSSSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cDSSSireCombo,ftString,4,FALSE);


            //SIRE Line
            FieldDefs.Add(cSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cSireNo,ftString,10,FALSE);
            FieldDefs.Add(cSire,ftString,20,FALSE);
            FieldDefs.Add(cSireName,ftString,40,FALSE);
            FieldDefs.Add(cSireClass,ftString,2,FALSE);
            FieldDefs.Add(cSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cSDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cSDamNo,ftString,10,FALSE);
            FieldDefs.Add(cSDam,ftString,20,FALSE);
            FieldDefs.Add(cSDamName,ftString,40,FALSE);
            FieldDefs.Add(cSDamClass,ftString,2,FALSE);
            FieldDefs.Add(cSDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cSSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cSSireNo,ftString,10,FALSE);
            FieldDefs.Add(cSSire,ftString,20,FALSE);
            FieldDefs.Add(cSSireName,ftString,40,FALSE);
            FieldDefs.Add(cSSireClass,ftString,2,FALSE);
            FieldDefs.Add(cSSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cSDDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cSDDamNo,ftString,10,FALSE);
            FieldDefs.Add(cSDDam,ftString,20,FALSE);
            FieldDefs.Add(cSDDamName,ftString,40,FALSE);
            FieldDefs.Add(cSDDamClass,ftString,2,FALSE);
            FieldDefs.Add(cSDDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSDDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cSDSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cSDSireNo,ftString,10,FALSE);
            FieldDefs.Add(cSDSire,ftString,20,FALSE);
            FieldDefs.Add(cSDSireName,ftString,40,FALSE);
            FieldDefs.Add(cSDSireClass,ftString,2,FALSE);
            FieldDefs.Add(cSDSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSDSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cSSDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cSSDamNo,ftString,10,FALSE);
            FieldDefs.Add(cSSDam,ftString,20,FALSE);
            FieldDefs.Add(cSSDamName,ftString,40,FALSE);
            FieldDefs.Add(cSSDamClass,ftString,2,FALSE);
            FieldDefs.Add(cSSDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSSDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cSSSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cSSSireNo,ftString,10,FALSE);
            FieldDefs.Add(cSSSire,ftString,20,FALSE);
            FieldDefs.Add(cSSSireName,ftString,40,FALSE);
            FieldDefs.Add(cSSSireClass,ftString,2,FALSE);
            FieldDefs.Add(cSSSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSSSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cSDDDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cSDDDamNo,ftString,10,FALSE);
            FieldDefs.Add(cSDDDam,ftString,20,FALSE);
            FieldDefs.Add(cSDDDamName,ftString,40,FALSE);
            FieldDefs.Add(cSDDDamClass,ftString,2,FALSE);
            FieldDefs.Add(cSDDDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSDDDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cSDDSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cSDDSireNo,ftString,10,FALSE);
            FieldDefs.Add(cSDDSire,ftString,20,FALSE);
            FieldDefs.Add(cSDDSireName,ftString,40,FALSE);
            FieldDefs.Add(cSDDSireClass,ftString,2,FALSE);
            FieldDefs.Add(cSDDSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSDDSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cSDSDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cSDSDamNo,ftString,10,FALSE);
            FieldDefs.Add(cSDSDam,ftString,20,FALSE);
            FieldDefs.Add(cSDSDamName,ftString,40,FALSE);
            FieldDefs.Add(cSDSDamClass,ftString,2,FALSE);
            FieldDefs.Add(cSDSDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSDSDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cSDSSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cSDSSireNo,ftString,10,FALSE);
            FieldDefs.Add(cSDSSire,ftString,20,FALSE);
            FieldDefs.Add(cSDSSireName,ftString,40,FALSE);
            FieldDefs.Add(cSDSSireClass,ftString,2,FALSE);
            FieldDefs.Add(cSDSSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSDSSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cSSDDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cSSDDamNo,ftString,10,FALSE);
            FieldDefs.Add(cSSDDam,ftString,20,FALSE);
            FieldDefs.Add(cSSDDamNAME,ftString,40,FALSE);
            FieldDefs.Add(cSSDDamClass,ftString,2,FALSE);
            FieldDefs.Add(cSSDDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSSDDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cSSDSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cSSDSireNo,ftString,10,FALSE);
            FieldDefs.Add(cSSDSire,ftString,20,FALSE);
            FieldDefs.Add(cSSDSireName,ftString,40,FALSE);
            FieldDefs.Add(cSSDSireClass,ftString,2,FALSE);
            FieldDefs.Add(cSSDSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSSDSireCombo,ftString,4,FALSE);

            FieldDefs.Add(cSSSDamID,ftInteger,0,FALSE);
            FieldDefs.Add(cSSSDamNo,ftString,10,FALSE);
            FieldDefs.Add(cSSSDam,ftString,20,FALSE);
            FieldDefs.Add(cSSSDamName,ftString,40,FALSE);
            FieldDefs.Add(cSSSDamClass,ftString,2,FALSE);
            FieldDefs.Add(cSSSDamClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSSSDamCombo,ftString,4,FALSE);

            FieldDefs.Add(cSSSSireID,ftInteger,0,FALSE);
            FieldDefs.Add(cSSSSireNo,ftString,10,FALSE);
            FieldDefs.Add(cSSSSire,ftString,20,FALSE);
            FieldDefs.Add(cSSSSireName,ftString,40,FALSE);
            FieldDefs.Add(cSSSSireClass,ftString,2,FALSE);
            FieldDefs.Add(cSSSSireClassScore,ftInteger,0,FALSE);
            FieldDefs.Add(cSSSSireCombo,ftString,4,FALSE);

            IndexDefs.Clear;
            IndexDefs.Add('',cAnimalID,[ixPrimary,ixUnique]);
            CreateTable;
            Open;
         end;
   except
      ShowMessage('Cannot create Table, contact Kingswood');
      exit;
   end;

   try
      tCowExt.Open; // open lookup table
      tBullExt.Open; // open lookup table

      WinData.LookUpDamSire.Close;
      WinData.LookUpDamSire.Open; // open lookup table

      for i := Low(AIDS) to High(AIDS) do
         begin
            PedigreeTable.Append;

            // Current Animal
            PedigreeTable.FieldByName(cAnimalID).AsInteger := AIDS[i];
            if WinData.LookUpDamSire.FindKey([PedigreeTable.FieldByName(cAnimalID).AsInteger]) then
               begin
                  PedigreeTable.FieldByName(cAnimalNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cAnimal).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cAnimalDOB).AsDateTime := WinData.LookUpDamSire.FieldByName(cAnimalDOB).AsDateTime;
                  PedigreeTable.FieldByName(cAnimalName).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
               end
            else
               raise Exception.Create('Unexpected error has occurred, cannot find animal');

            // Try Locate the animal
            if tCowExt.FindKey([PedigreeTable.FieldByName(cAnimalID).AsInteger]) then
               begin
                  PedigreeTable.FieldByName(cAnimalClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                  PedigreeTable.FieldByName(cAnimalClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                  PedigreeTable.FieldByName(cAnimalCombo).AsString := PedigreeTable.FieldByName(cAnimalClass).AsString + IntToStr( PedigreeTable.FieldByName(cAnimalClassScore).AsInteger);
               end
            else if tBullExt.FindKey([PedigreeTable.FieldByName(cAnimalID).AsInteger]) then
               begin
                  PedigreeTable.FieldByName(cAnimalClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                  PedigreeTable.FieldByName(cAnimalClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                  PedigreeTable.FieldByName(cAnimalCombo).AsString := PedigreeTable.FieldByName(cAnimalClass).AsString + IntToStr( PedigreeTable.FieldByName(cAnimalClassScore).AsInteger);
               end;

            // Get the Animals DAM & Sire
            if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
               DAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
            else
               DAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
            SIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;

            if WinData.LookUpDamSire.FindKey([SIRE]) then
               begin
                  PedigreeTable.FieldByName(cSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  If tBullExt.FindKey([SIRE]) then
                     Begin
                        PedigreeTable.FieldByName(cSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSIRECombo).AsString := PedigreeTable.FieldByName(cSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cSIREClassScore).AsInteger);
                     End;

                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     SDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     SDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  SSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

            if WinData.LookUpDamSire.FindKey([DAM] ) then
               begin
                  PedigreeTable.FieldByName(cDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  If tCowExt.FindKey([DAM]) then
                     Begin
                        PedigreeTable.FieldByName(cDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDAMCombo).AsString := PedigreeTable.FieldByName(cDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cDAMClassScore).AsInteger);
                     End;

                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     DDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     DDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  DSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                  // Sire's DAM
            if WinData.LookUpDamSire.FindKey([SDAM] ) then
               begin
                  PedigreeTable.FieldByName(cSDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([SDAM]) then
                     begin
                        PedigreeTable.FieldByName(cSDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSDAMCombo).AsString := PedigreeTable.FieldByName(cSDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cSDAMClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     SDDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     SDDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  SDSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                  // Sire's Sire
            if WinData.LookUpDamSire.FindKey([SSIRE]) then
               begin
                  PedigreeTable.FieldByName(cSSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([SSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cSSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSSIRECombo).AsString := PedigreeTable.FieldByName(cSSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cSSIREClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     SSDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     SSDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  SSSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                   // Dam's DAM
            if WinData.LookUpDamSire.FindKey([DDAM] ) then
               begin
                  PedigreeTable.FieldByName(cDDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([DDAM]) then
                     begin
                        PedigreeTable.FieldByName(cDDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDDAMCombo).AsString := PedigreeTable.FieldByName(cDDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cDDAMClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     DDDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     DDDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  DDSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                  // Dam's Sire
            if WinData.LookUpDamSire.FindKey([DSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cDSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([DSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cDSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDSIRECombo).AsString := PedigreeTable.FieldByName(cDSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cDSIREClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     DSDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     DSDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  DSSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                       // Sire's Sire Sire
            if WinData.LookUpDamSire.FindKey([SSSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cSSSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSSSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSSSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSSSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([SSSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cSSSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSSSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSSSIRECombo).AsString := PedigreeTable.FieldByName(cSSSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cSSSIREClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     SSSDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     SSSDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  SSSSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                 // Sire's Sire Dam
            if WinData.LookUpDamSire.FindKey([SSDAM] ) then
               begin
                  PedigreeTable.FieldByName(cSSDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSSDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSSDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSSDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([SSDAM]) then
                     begin
                        PedigreeTable.FieldByName(cSSDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSSDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSSDAMCombo).AsString := PedigreeTable.FieldByName(cSSDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cSSDAMClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     SSDDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     SSDDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  SSDSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                        // Sire's Dam Sire
            if WinData.LookUpDamSire.FindKey([SDSIRE]) then
               begin
                  PedigreeTable.FieldByName(cSDSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSDSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSDSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSDSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([SDSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cSDSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSDSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSDSIRECombo).AsString := PedigreeTable.FieldByName(cSDSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cSDSIREClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     SDSDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     SDSDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  SDSSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                // Sire's Dam Dam
            if WinData.LookUpDamSire.FindKey([SDDAM] ) then
               begin
                  PedigreeTable.FieldByName(cSDDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSDDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSDDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSDDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([SDDAM]) then
                     begin
                        PedigreeTable.FieldByName(cSDDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSDDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSDDAMCombo).AsString := PedigreeTable.FieldByName(cSDDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cSDDAMClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     SDDDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     SDDDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  SDDSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                 // Dam's Sire Sire
            if WinData.LookUpDamSire.FindKey([DSSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cDSSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDSSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDSSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDSSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([DSSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cDSSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDSSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDSSIRECombo).AsString := PedigreeTable.FieldByName(cDSSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cDSSIREClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     DSSDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     DSSDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  DSSSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                        // Dam's Sire Dam
            if WinData.LookUpDamSire.FindKey([DSDAM] ) then
               begin
                  PedigreeTable.FieldByName(cDSDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDSDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDSDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDSDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([DSDAM]) then
                     begin
                        PedigreeTable.FieldByName(cDSDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDSDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDSDAMCombo).AsString := PedigreeTable.FieldByName(cDSDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cDSDAMClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     DSDDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     DSDDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  DSDSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                        // Dam's Dam Sire
            if WinData.LookUpDamSire.FindKey([DDSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cDDSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDDSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDDSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDDSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([DDSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cDDSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDDSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDDSIRECombo).AsString := PedigreeTable.FieldByName(cDDSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cDDSIREClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     DDSDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     DDSDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  DDSSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                        // Dam's Dam Dam
            if WinData.LookUpDamSire.FindKey([DDDAM] ) then
               begin
                  PedigreeTable.FieldByName(cDDDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDDDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDDDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDDDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([DDDAM]) then
                     begin
                        PedigreeTable.FieldByName(cDDDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDDDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDDDAMCombo).AsString := PedigreeTable.FieldByName(cDDDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cDDDAMClassScore).AsInteger);
                     end;
                  if (WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger = 0) then
                     DDDDAM := WinData.LookUpDamSire.FieldByName(cDamID).AsInteger
                  else
                     DDDDAM := WinData.LookUpDamSire.FieldByName(cDonorDamID).AsInteger;
                  DDDSIRE := WinData.LookUpDamSire.FieldByName(cSireID).AsInteger;
               end;

                              // Sire's Sire Sire Sire
            if WinData.LookUpDamSire.FindKey([SSSSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cSSSSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSSSSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSSSSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSSSSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([SSSSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cSSSSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSSSSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSSSSIRECombo).AsString := PedigreeTable.FieldByName(cSSSSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cSSSSIREClassScore).AsInteger);
                     end;
               end;

                // Sire's Sire Sire Dam
            if WinData.LookUpDamSire.FindKey([SSSDAM] ) then
               begin
                  PedigreeTable.FieldByName(cSSSDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSSSDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSSSDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSSSDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([SSSDAM]) then
                     begin
                        PedigreeTable.FieldByName(cSSSDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSSSDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSSSDAMCombo).AsString := PedigreeTable.FieldByName(cSSSDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cSSSDAMClassScore).AsInteger);
                     end;
               end;

               // Sire's Sire Dam Sire
            if WinData.LookUpDamSire.FindKey([SSDSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cSSDSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSSDSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSSDSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSSDSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([SSDSIRE]) then
                     Begin
                        PedigreeTable.FieldByName(cSSDSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSSDSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSSDSIRECombo).AsString := PedigreeTable.FieldByName(cSSDSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cSSDSIREClassScore).AsInteger);
                     End;
                End;

               // Sire's Sire Dam Sire
            if WinData.LookUpDamSire.FindKey([SSDDAM] ) then
               begin
                  PedigreeTable.FieldByName(cSSDDamID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSSDDamNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSSDDam).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSSDDamNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([SSDSIRE]) then
                     Begin
                        PedigreeTable.FieldByName(cSSDDamClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSSDDamClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSSDDamCombo).AsString := PedigreeTable.FieldByName(cSSDDamClass).AsString + IntToStr( PedigreeTable.FieldByName(cSSDDamClassScore).AsInteger);
                     End;
                End;

                      // Sire's Dam Sire Sire
            if WinData.LookUpDamSire.FindKey([SDSSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cSDSSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSDSSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSDSSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSDSSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([SDSSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cSDSSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSDSSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSDSSIRECombo).AsString := PedigreeTable.FieldByName(cSDSSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cSDSSIREClassScore).AsInteger);
                     end;
               end;

                 // Sire's Dam Sire Dam
            if WinData.LookUpDamSire.FindKey([SDSDAM] ) then
               begin
                  PedigreeTable.FieldByName(cSDSDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSDSDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSDSDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSDSDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([SDSDAM]) then
                     begin
                        PedigreeTable.FieldByName(cSDSDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSDSDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSDSDAMCombo).AsString := PedigreeTable.FieldByName(cSDSDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cSDSDAMClassScore).AsInteger);
                     end;
               end;

                   // Sire's Dam Dam Sire
            if WinData.LookUpDamSire.FindKey([SDDSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cSDDSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSDDSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSDDSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSDDSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([SDDSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cSDDSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSDDSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSDDSIRECombo).AsString := PedigreeTable.FieldByName(cSDDSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cSDDSIREClassScore).AsInteger);
                     end;
               end;

                  // Sire's Dam Dam Dam
            if WinData.LookUpDamSire.FindKey([SDDDAM] ) then
               begin
                  PedigreeTable.FieldByName(cSDDDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cSDDDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cSDDDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cSDDDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([SDDDAM]) then
                     begin
                        PedigreeTable.FieldByName(cSDDDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cSDDDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cSDDDAMCombo).AsString := PedigreeTable.FieldByName(cSDDDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cSDDDAMClassScore).AsInteger);
                     end;
               end;

                  // Dam's Sire Sire Sire
            if WinData.LookUpDamSire.FindKey([DSSSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cDSSSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDSSSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDSSSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDSSSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([DSSSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cDSSSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDSSSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDSSSIRECombo).AsString := PedigreeTable.FieldByName(cDSSSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cDSSSIREClassScore).AsInteger);
                     end;
               end;

                 // Dam's Sire Sire Dam
            if WinData.LookUpDamSire.FindKey([DSSDAM] ) then
               begin
                  PedigreeTable.FieldByName(cDSSDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDSSDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDSSDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDSSDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([DSSDAM]) then
                     begin
                        PedigreeTable.FieldByName(cDSSDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDSSDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDSSDAMCombo).AsString := PedigreeTable.FieldByName(cDSSDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cDSSDAMClassScore).AsInteger);
                     end;
               end;

                              // Dam's Sire Dam Sire
            if WinData.LookUpDamSire.FindKey([DSDSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cDSDSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDSDSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDSDSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDSDSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([DSDSIRE]) then
                     begin
                        PedigreeTable.FieldByName(cDSDSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDSDSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDSDSIRECombo).AsString := PedigreeTable.FieldByName(cDSDSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cDSDSIREClassScore).AsInteger);
                     end;
               end;

                              // Dam's Sire Dam Dam
            if WinData.LookUpDamSire.FindKey([DSDDAM] ) then
               begin
                  PedigreeTable.FieldByName(cDSDDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDSDDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDSDDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDSDDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([DSDDAM]) then
                     begin
                        PedigreeTable.FieldByName(cDSDDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDSDDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDSDDAMCombo).AsString := PedigreeTable.FieldByName(cDSDDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cDSDDAMClassScore).AsInteger);
                     end;
               end;

                     // Dam's Dam Sire Sire
            if WinData.LookUpDamSire.FindKey([DDSSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cDDSSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDDSSIRENo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDDSSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDDSSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([DDSSIRE]) then
                     Begin
                        PedigreeTable.FieldByName(cDDSSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDDSSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDDSSIRECombo).AsString := PedigreeTable.FieldByName(cDDSSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cDDSSIREClassScore).AsInteger);
                     end;
               end;

                  // Dam's Dam Sire Dam
            if WinData.LookUpDamSire.FindKey([DDSDAM] ) then
               begin
                  PedigreeTable.FieldByName(cDDSDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDDSDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDDSDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDDSDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([DDSDAM]) then
                     begin
                        PedigreeTable.FieldByName(cDDSDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDDSDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDDSDAMCombo).AsString := PedigreeTable.FieldByName(cDDSDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cDDSDAMClassScore).AsInteger);
                     end;
               end;

                  // Dam's Dam Dam Sire
            if WinData.LookUpDamSire.FindKey([DDDSIRE] ) then
               begin
                  PedigreeTable.FieldByName(cDDDSIREID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDDDSIRENO).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDDDSIRE).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDDDSIRENAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tBullExt.FindKey([DDDSIRE]) then
                     Begin
                        PedigreeTable.FieldByName(cDDDSIREClass).AsString := tBullExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDDDSIREClassScore).AsInteger := tBullExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDDDSIRECombo).AsString := PedigreeTable.FieldByName(cDDDSIREClass).AsString + IntToStr( PedigreeTable.FieldByName(cDDDSIREClassScore).AsInteger);
                     end;
               end;

                   // Dam's Dam Dam Dam
            if WinData.LookUpDamSire.FindKey([DDDDAM] ) then
               begin
                  PedigreeTable.FieldByName(cDDDDAMID).AsInteger := WinData.LookUpDamSire.FieldByName(cID).AsInteger;
                  PedigreeTable.FieldByName(cDDDDAMNo).AsString := WinData.LookUpDamSire.FieldByName(cAnimalNo).AsString;
                  PedigreeTable.FieldByName(cDDDDAM).AsString := WinData.LookUpDamSire.FieldByName(cAnimalHerdBookNo).AsString;
                  PedigreeTable.FieldByName(cDDDDAMNAME).AsString := WinData.LookUpDamSire.FieldByName(cName).AsString;
                  if tCowExt.FindKey([DDDDAM]) then
                     begin
                        PedigreeTable.FieldByName(cDDDDAMClass).AsString := tCowExt.FieldByName(cLatestClass).AsString;
                        PedigreeTable.FieldByName(cDDDDAMClassScore).AsInteger := tCowExt.FieldByName(cLatestClassScore).AsInteger;
                        PedigreeTable.FieldByName(cDDDDAMCombo).AsString := PedigreeTable.FieldByName(cDDDDAMClass).AsString + IntToStr( PedigreeTable.FieldByName(cDDDDAMClassScore).AsInteger);
                     end;
               end;
            PedigreeTable.Post;

         end;
   finally
      tCowExt.Close;
      FreeAndNil(tCowExt);
      tBullExt.Close;
      FreeAndNil(tBullExt);
   end;
end;

procedure THerdLookup.PedigreeTableAfterPost(DataSet: TDataSet);
begin
   DbiSaveChanges(PedigreeTable.Handle);
end;

procedure THerdLookup.FlushPedigreeTable;
begin
   if PedigreeTable.Active then
      PedigreeTable.Active := False;
   if PedigreeTable.Exists then
      PedigreeTable.DeleteTable;
end;

function THerdLookup.GetHerdType(const AHerdID: Integer): THerdType;
var
   sHerdType : string;
begin
   Result := htNone;
   sHerdType := GetHerdTypeAsString(AHerdID);
   if sHerdType = cDairyHerd then
      Result := htDairy
   else if sHerdType = cSucklerHerd then
      Result := htSuckler
   else if sHerdType = cBeefHerd then
      Result := htBeef;
end;


function THerdLookup.GetKillOutPerc(AID: Integer): Double;
var
   bEligibleforPremium : Boolean;
   Sex : string;
   LactNo : Integer;
begin
   Result := 0;
   // Killout % values create by Gerry based on eProfit Monitor document for Drystock herds 13/02/2009 
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add(InsertSELECT(['Sex','PrimaryBreed PB','LactNo']));
         SQL.Add(InsertFROM(['Animals']));
         SQL.Add(InsertWHERE(['ID'],[':ID']));
         Params[0].AsInteger := AID;
         Open;
         try
            First;
            Sex := FieldByName('Sex').AsString;
            if Sex = cSex_Female then
               LactNo := FieldByName('LactNo').AsInteger;

            if FieldByName('PB').AsInteger>0 then
               begin
                  bEligibleforPremium := BreedDetailsByID(FieldByName('PB').AsInteger, Breeds_EligibleforPremium);

                  if VarIsNull(bEligibleforPremium) then Exit; //

                  if Sex = cSex_Female then
                     begin
                        if LactNo > 0 then
                           begin
                              if bEligibleforPremium then // Beef Breed.
                                 Result := 52
                              else
                                 Result := 51;
                           end
                        else
                           begin
                              if bEligibleforPremium then
                                 Result := 54
                              else
                                 Result := 50;
                           end;
                     end
                  else if Sex = cSex_Bull then
                     begin
                        if bEligibleforPremium then
                           Result := 57
                        else
                           Result := 54;
                     end
                  else if Sex = cSex_Steer then
                     begin
                        if bEligibleforPremium then
                           Result := 55
                        else
                           Result := 51;
                     end;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;

end;

procedure THerdLookup.qICBFHealthCodesBeforeOpen(DataSet: TDataSet);
begin
   TQuery(Dataset).Params[0].Value := LHealthCode;
end;

procedure THerdLookup.qNonICBFHealthCodesBeforeOpen(DataSet: TDataSet);
begin
   TQuery(Dataset).Params[0].Value := LHealthCode;
end;

procedure THerdLookup.QueryFertilityCheckStatusBeforeOpen(
  DataSet: TDataSet);
begin
   QueryFertilityCheckStatus.Params[0].AsInteger := LFertilityCheck_Status;
end;

procedure THerdLookup.QueryFertilityCheckActionBeforeOpen(
  DataSet: TDataSet);
begin
   QueryFertilityCheckAction.Params[0].AsInteger := LFertilityCheck_Action;
end;

function THerdLookup.GetFertilityCheckActionDescription(AActionId : Integer) : string;
begin
   Result := '';

   if ( AActionId <= 0 ) then Exit;

   if QueryFertilityCheckAction.Active then
      QueryFertilityCheckAction.Active := True;

   if ( QueryFertilityCheckAction.Active ) then
      begin
         if QueryFertilityCheckAction.Locate('ID', AActionId, []) then
            Result := QueryFertilityCheckAction.FieldByName('Description').AsString;
      end;
end;

function THerdLookup.CalculateDrugWithDrawalDates(ADrugId: Integer;
  AEventDate: TDateTime; const ADaysAdministered: Integer): TDrugWithdrawalDates;
var
   TempDate : TDateTime;
   MeatWDDays, MilkWDDays, OtherWDDays : Variant;
   OrganicMeatWDDays, OrganicMilkWDDays, OrganicOtherWDDays : Variant;
   MeatNADrug, MilkNADrug : Boolean;
begin
   FillChar(Result, SizeOf(TDrugWithdrawalDates), 0);
   TempDate := 0;
   MeatWDDays := Null;
   MilkWDDays := Null;
   OtherWDDays := Null;
   OrganicMeatWDDays := Null;
   OrganicMilkWDDays := Null;
   OrganicOtherWDDays := Null;
   MeatNADrug := False;
   MilkNADrug := False;
   if ( ADrugId <= 0 ) or ( AEventDate <= 0 ) then Exit;
   try
      if ( WinData.Medicine.Locate('ID',ADrugID,[]) ) then
         begin
            MeatWDDays := WinData.Medicine.FieldByName('Withdrawal').AsVariant;
            MilkWDDays := WinData.Medicine.FieldByName('MilkWithDrawal').AsVariant;
            OtherWDDays := WinData.Medicine.FieldByName('OtherWithdrawal').AsVariant;
            OrganicMeatWDDays := WinData.Medicine.FieldByName('OrganicMeatWithdrawal').AsVariant;
            OrganicMilkWDDays := WinData.Medicine.FieldByName('OrganicMilkWithdrawal').AsVariant;
            OrganicOtherWDDays := WinData.Medicine.FieldByName('OrganicOtherWithdrawal').AsVariant;
            MeatNADrug := WinData.Medicine.FieldByName('MilkN_A_Drug').AsBoolean;
            MilkNADrug := WinData.Medicine.FieldByName('MeatN_A_Drug').AsBoolean;

            if ( (not(MeatNADrug)) and (not(MilkNADrug)) ) then
               begin
                  if ((not VarIsNull(MeatWDDays)) and ( MeatWDDays > 0 )) then
                     Result.MeatWithdrawalDate := AEventDate + (ADaysAdministered-1) + MeatWDDays;

                  if ((not VarIsNull(MilkWDDays)) and ( MilkWDDays > 0 )) then
                     Result.MilkWithdrawalDate := AEventDate + (ADaysAdministered-1) + MilkWDDays;

                  if ((not VarIsNull(OtherWDDays)) and ( OtherWDDays > 0 )) then
                     Result.OtherWithdrawalDate := AEventDate + (ADaysAdministered-1) + OtherWDDays;

                  if ((not VarIsNull(OrganicMeatWDDays)) and ( OrganicMeatWDDays > 0 )) then
                     Result.OrganicMeatWithdrawalDate := AEventDate + (ADaysAdministered-1) + OrganicMeatWDDays;

                  if ((not VarIsNull(OrganicMilkWDDays)) and ( OrganicMilkWDDays > 0 )) then
                     Result.OrganicMilkWithdrawalDate := AEventDate + (ADaysAdministered-1) + OrganicMilkWDDays;

                  if ((not VarIsNull(OrganicOtherWDDays)) and ( OrganicOtherWDDays > 0 )) then
                     Result.OrganicOtherWithdrawalDate := AEventDate + (ADaysAdministered-1) + OrganicOtherWDDays;
               end;
         end;
   except
   end;
end;

function THerdLookup.GetAnimalsWithConditionScoreBetween(const AHerdId : Integer;
   const AMin, AMax : Double) : TIntegerArray;
var
   i : Integer;
   List : TList;

   procedure AddToList(const AAnimalId : Integer);
   begin
      if (List.IndexOf(pointer(AAnimalId)) = -1) then
         List.Add(pointer(AAnimalId));
   end;

begin
   List := TList.Create;
   try
     with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;
           SQL.Clear;
           SQL.Add('SELECT A.Id, E.EventDate, C.Score');
           SQL.Add('FROM animals A');
           SQL.Add('LEFT JOIN Events E ON (E.AnimalId = A.ID)');
           SQL.Add('LEFT JOIN ConditionScore C ON (E.ID = C.EventId)');
           SQL.Add('WHERE (E.AnimallactNO = A.LactNo)');
           SQL.Add('AND (E.EventType = 20)');
           if ((AMin > 0 ) and (AMax > 0)) then
              begin
                 SQL.Add('AND (C.Score BETWEEN :AMinScore AND :AMaxScore)');
                 Params[0].AsFloat := AMin;
                 Params[1].AsFloat := AMax;
              end
           else if ((AMin > 0 ) and (AMax <= 0)) then
              begin
                 SQL.Add('AND (C.Score >=:AMinScore)');
                 Params[0].AsFloat := AMin;
              end
           else if ((AMin <= 0 ) and (AMax > 0)) then
              begin
                 SQL.Add('AND (C.Score <=:AMaxScore)');
                 Params[0].AsFloat := AMax;
              end;

           SQL.Add('AND (A.HerdId =:AHerdId)');
           SQL.Add('ORDER BY E.EventDate Desc');
           Params[Params.Count-1].AsInteger := AHerdId;
           Open;
           try
              First;
              while not eof do
              begin
                 AddToList(FieldByName('ID').AsInteger);
                 Next;
              end;

              SetLength(Result, List.Count);
              for i := 0 to List.Count-1 do
                 begin
                    Result[i] := Integer(List[i]);
                 end;
           finally
              Close;
           end;
        finally
           Free;
        end;
   finally
      FreeAndNil(List);
   end;
end;

function THerdLookup.HerdNumberByHerdId(AHerdID: Integer): string;
var
  HerdQuery : TQuery;
begin
   WinData.CreateTQuery(HerdQuery);
   try
      HerdQuery.SQL.Clear;
      HerdQuery.SQL.Add('SELECT HerdIdentity FROM Owners WHERE ID =:AHerdId');
      HerdQuery.Params[0].AsInteger := AHerdId;
      HerdQuery.Open;
      HerdQuery.First;
      try
         Result := HerdQuery.Fields[0].AsString;
      finally
         HerdQuery.Close;
      end;
   finally
      FreeAndNil(HerdQuery);
   end;
end;

function THerdLookup.GetAnimalsWithEBIBetween(const AHerdId: Integer;
  const AFromValue, AToValue: Variant; const ASex : string): TIntegerArray;
var
   i : Integer;
   List : TList;

   procedure GetEBIValues(ASexValue : string);
   var
      tblName : string;
      fldName : string;
   begin
      if (ASexValue = 'Female') then
         begin
            tblName := 'CowExt C';
            fldName := 'EBI';
         end
      else if (ASexValue = 'Bull') then
         begin
            tblName := 'BullExt';
            fldName := 'RBI';
         end ;

      with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;
           SQL.Clear;
           SQL.Add('SELECT Distinct(A.ID)');
           SQL.Add('FROM Animals A');
           SQL.Add('LEFT JOIN '+ tblName +' On (AnimalID = A.ID)');
           SQL.Add('WHERE (A.HerdId =:AHerdId)');
           if (AFromValue <> null) and (AToValue <> null) then
              begin
                 SQL.Add('AND ('+fldName+' BETWEEN :AFromValue AND :ToValue)');
                 Params[1].AsFloat := AFromValue;
                 Params[2].AsFloat := AToValue;
              end
           else if (AFromValue <> null) and (AToValue = null) then
              begin
                 SQL.Add('AND ('+fldName+'  >= :AFromValue)');
                 Params[1].AsFloat := AFromValue;
              end
           else if (AFromValue = null) and (AToValue <> null) then
              begin
                 SQL.Add('AND ('+fldName+' <= :AToValue)');
                 Params[1].AsFloat := AToValue;
              end;

           Params[0].AsInteger := AHerdId;
           Open;
           try
              First;
              while not eof do
                 begin
                    if (List.IndexOf(pointer(FieldByName('ID').AsInteger)) = -1) then
                       List.Add(pointer(FieldByName('ID').AsInteger));
                    Next;
                 end;
           finally
              Close;
           end;

        finally
           Free;
        end;
   end;

begin
   List := TList.Create;
   try

     if (ASex = 'Female') then
        GetEBIValues('Female')
     else if (ASex = 'Bull') then
        GetEBIValues('Female')
     else
        begin
           GetEBIValues('Female');
           GetEBIValues('Bull');
        end;

     SetLength(Result, List.Count);
     for i := 0 to List.Count-1 do
        begin
           Result[i] := Integer(List[i]);
        end;

   finally
      FreeAndNil(List);
   end;

end;

function THerdLookup.GetAnimalsWithMilkYieldBetween(const AHerdId: Integer;
  const AFromValue, AToValue: Variant): TIntegerArray;
var
   i : Integer;
   List : TList;

   procedure GetMilkYieldValues;
   var
      TempQuery : TQuery;
   begin
      TempQuery := TQuery.Create(nil);
      with TempQuery do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            //   03/01/13 [V5.1 R3.6] /MK Bug Fix - Show Daily Yield.
            SQL.Add('SELECT M.AnimalId, M.DailyYield');
            SQL.Add('FROM MilkDiskTrans M');
            SQL.Add('INNER JOIN Animals A On (M.AnimalId = A.ID)');
            SQL.Add('WHERE A.Sex = "Female"');
            SQL.Add('AND A.AnimalDeleted = False');
            SQL.Add('AND A.InHerd = True');
            SQL.Add('AND A.HerdId = :AHerdID');

            //   03/01/13 [V5.1 R3.6] /MK Bug Fix - Show Yield of Current Lactation not last completed lactation.
            //SQL.Add('AND M.LactNo = A.LactNo-1');
            SQL.Add('AND M.LactNo = A.LactNo');

            Params[0].AsInteger := AHerdId;
            if (AFromValue <> null) and (AToValue <> null) then
               begin
                  SQL.Add('AND (M.DailyYield BETWEEN :AFromValue AND :ToValue)');
                  Params[1].AsFloat := AFromValue;
                  Params[2].AsFloat := AToValue;
               end
            else if (AFromValue <> null) and (AToValue = null) then
               begin
                  SQL.Add('AND (M.DailyYield >= :AFromValue)');
                  Params[1].AsFloat := AFromValue;
               end
            else if (AFromValue = null) and (AToValue <> null) then
               begin
                  SQL.Add('AND (M.DailyYield <= :AToValue)');
                  Params[1].AsFloat := AToValue;
               end;
            Open;
            try
               First;
               while not eof do
                  begin
                     if (List.IndexOf(pointer(FieldByName('AnimalId').AsInteger)) = -1) then
                        List.Add(pointer(FieldByName('AnimalId').AsInteger));
                     Next;
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

begin
   List := TList.Create;
   try
     GetMilkYieldValues;

     SetLength(Result, List.Count);
     for i := 0 to List.Count-1 do
        begin
           Result[i] := Integer(List[i]);
        end;

   finally
      FreeAndNil(List);
   end;
end;

function THerdLookup.GetAnimalsWithRatCalcMilkYieldBetween(const AHerdId: Integer;
  const AFromValue, AToValue: Variant): TIntegerArray;
var
   i : Integer;
   List : TList;

   procedure GetRatCalcMilkYieldValues;
   var
      TempQuery : TQuery;
   begin
      TempQuery := TQuery.Create(nil);
      with TempQuery do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            //   03/01/13 [V5.1 R3.6] /MK Bug Fix - Show Daily Yield.
            SQL.Add('SELECT RH.AnimalId, RH.Yield');
            SQL.Add('FROM RationHistory RH');
            SQL.Add('INNER JOIN Animals A On (RH.AnimalId = A.ID)');
            SQL.Add('WHERE A.Sex = "Female"');
            SQL.Add('AND A.AnimalDeleted = False');
            SQL.Add('AND A.InHerd = True');
            SQL.Add('AND A.HerdId = :AHerdID');

            Params[0].AsInteger := AHerdId;
            if (AFromValue <> null) and (AToValue <> null) then
               begin
                  SQL.Add('AND (RH.Yield BETWEEN :AFromValue AND :ToValue)');
                  Params[1].AsFloat := AFromValue;
                  Params[2].AsFloat := AToValue;
               end
            else if (AFromValue <> null) and (AToValue = null) then
               begin
                  SQL.Add('AND (RH.Yield >= :AFromValue)');
                  Params[1].AsFloat := AFromValue;
               end
            else if (AFromValue = null) and (AToValue <> null) then
               begin
                  SQL.Add('AND (RH.Yield <= :AToValue)');
                  Params[1].AsFloat := AToValue;
               end;
            Open;
            try
               First;
               while not eof do
                  begin
                     if (List.IndexOf(pointer(FieldByName('AnimalId').AsInteger)) = -1) then
                        List.Add(pointer(FieldByName('AnimalId').AsInteger));
                     Next;
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

begin
   List := TList.Create;
   try
     GetRatCalcMilkYieldValues;

     SetLength(Result, List.Count);
     for i := 0 to List.Count-1 do
        begin
           Result[i] := Integer(List[i]);
        end;

   finally
      FreeAndNil(List);
   end;
end;

procedure THerdLookup.qHerdVaccineTypeBeforeOpen(DataSet: TDataSet);
begin
   //   09/01/13 [V5.1 R3.7] /MK Change - Changed SQL to look at new LVaccination_DiseaseCode ListType.
   TQuery(Dataset).Params[0].Value := LVaccination_DiseaseCode;
end;

function THerdLookup.GetRationHistoryExists: Boolean;
var
   tbRationHistory : TTable;
begin
   Result := False;

   //   25/01/16 [V5.5 R2.4] /MK Bug Fix - Check to see if table exists first - EH reported. 
   tbRationHistory := TTable.Create(nil);
   with tbRationHistory do
      try
         DatabaseName := AliasName;
         TableName := 'RationHistory';
         Result := Exists;
      finally
         FreeAndNil(tbRationHistory);
      end;

   if ( Result ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT COUNT(AnimalID)');
            SQL.Add('FROM RationHistory');
            Open;
            try
               First;
               Result := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;
         finally
            Free;
         end;
end;

procedure THerdLookup.erBullDocilityLookupPropertiesInitPopup(
  Sender: TObject);
var
  LGrid: TcxCustomLookupDBGrid;
  colListType : TcxLookupDBGridColumn;
begin
   inherited;
   LGrid := erBullDocilityLookup.Properties.Grid;
   colListType := LGrid.Columns.ColumnByFieldName('ListType');

   if ( colListType <> nil ) then
      begin
         with LGrid.DataController.Filter do
            begin
               Root.AddItem(colListType, foEqual,2, '');
               Active := True;
            end;

     end;
end;

procedure THerdLookup.erBullFunctionalityLookupPropertiesInitPopup(
  Sender: TObject);
var
  LGrid: TcxCustomLookupDBGrid;
  colListType : TcxLookupDBGridColumn;
begin
   inherited;
   LGrid := erBullFunctionalityLookup.Properties.Grid;
   colListType := LGrid.Columns.ColumnByFieldName('ListType');

   if ( colListType <> nil ) then
      begin
         with LGrid.DataController.Filter do
            begin
               Root.AddItem(colListType, foEqual,1, '');
               Active := True;
            end;

     end;
end;

procedure THerdLookup.erDamMilkAbilityLookupPropertiesInitPopup(
  Sender: TObject);
var
  LGrid: TcxCustomLookupDBGrid;
  colListType : TcxLookupDBGridColumn;
begin
   inherited;
   LGrid := erDamMilkAbilityLookup.Properties.Grid;
   colListType := LGrid.Columns.ColumnByFieldName('ListType');

   if ( colListType <> nil ) then
      begin
         with LGrid.DataController.Filter do
            begin
               Root.AddItem(colListType, foEqual,1, '');
               Active := True;
            end;

     end;
end;

procedure THerdLookup.erDamDocilityLookupPropertiesInitPopup(
  Sender: TObject);
var
  LGrid: TcxCustomLookupDBGrid;
  colListType : TcxLookupDBGridColumn;
begin
   inherited;
   LGrid := erDamDocilityLookup.Properties.Grid;
   colListType := LGrid.Columns.ColumnByFieldName('ListType');
   if ( colListType <> nil ) then
      begin
         with LGrid.DataController.Filter do
            begin
               Root.AddItem(colListType, foEqual,2, '');
               Active := True;
            end;
     end;
end;

procedure THerdLookup.qICBFSexedSemenTypeBeforeOpen(DataSet: TDataSet);
begin
   qICBFSexedSemenType.Params[0].AsInteger := LSexedSemen;
end;

function THerdLookup.ThisTreatmentWithdrawalAfterSaleDate ( AAnimalID, ADrugID, ATreatDays : Integer;
   ATreatmentDate, ASaleDate : TDateTime ) : Boolean;
var
   DrugWithdrawalDates : TDrugWithdrawalDates;
begin
   // Returns whether the drug withdrawal date is after the sale date of the animal.
   Result := False;
   if ( AAnimalID = 0 ) or ( ADrugID = 0 ) or ( ATreatmentDate = 0 ) or ( ASaleDate = 0 ) then Exit;
   // No point going ahead with withdrawal check if program stupidly allows for treatment date after sale date.
   if ( ATreatmentDate > ASaleDate ) then Exit;

   DrugWithdrawalDates := CalculateDrugWithDrawalDates(ADrugID,ATreatmentDate,ATreatDays);
   if ( (DrugWithdrawalDates.MeatWithdrawalDate > 0) and
        (DrugWithdrawalDates.MeatWithdrawalDate > ASaleDate) ) then
      Result := ( DrugWithdrawalDates.MeatWithdrawalDate > ASaleDate )
   else if ( (DrugWithdrawalDates.MilkWithdrawalDate > 0) and
             (DrugWithdrawalDates.MilkWithdrawalDate > ASaleDate) ) then
      Result := ( DrugWithdrawalDates.MilkWithdrawalDate > ASaleDate )
   else if ( (DrugWithdrawalDates.OrganicMeatWithdrawalDate > 0) and
             (DrugWithdrawalDates.OrganicMeatWithdrawalDate > ASaleDate) ) then
      Result := ( DrugWithdrawalDates.OrganicMeatWithdrawalDate > ASaleDate )
   else if ( (DrugWithdrawalDates.OrganicMilkWithdrawalDate > 0) and
        (DrugWithdrawalDates.OrganicMilkWithdrawalDate > ASaleDate) ) then
      Result := ( DrugWithdrawalDates.OrganicMilkWithdrawalDate > ASaleDate );
end;

function THerdLookup.GetMaxDrugIDTreatWithdrawalDate ( ADrugID, ATreatDays : Integer; ATreatmentDate : TDateTime ) : TDateTime;
var
   DrugWithDrawalDates : TDrugWithdrawalDates;
begin
   // Returns the maximum withdrawal date of a drug based on a treatment date and no days of treatment.
   Result := 0;
   if ( ADrugID = 0 ) or ( ATreatmentDate = 0 ) then Exit;
   DrugWithDrawalDates := CalculateDrugWithDrawalDates(ADrugID, ATreatmentDate, ATreatDays);
   Result := DrugWithDrawalDates.MeatWithdrawalDate;
   if ( DrugWithDrawalDates.MilkWithdrawalDate > Result ) then
      Result := DrugWithDrawalDates.MilkWithdrawalDate;
   if ( DrugWithDrawalDates.OtherWithdrawalDate > Result ) then
      Result := DrugWithDrawalDates.OtherWithdrawalDate;
   if ( HerdLookup.HerdOwnerData.OrganicHerd ) then
      begin
         if ( DrugWithDrawalDates.OrganicMeatWithdrawalDate > Result ) then
            Result := DrugWithDrawalDates.OrganicMeatWithdrawalDate;
         if ( DrugWithDrawalDates.OrganicMilkWithdrawalDate > Result ) then
            Result := DrugWithDrawalDates.OrganicMilkWithdrawalDate;
         if ( DrugWithDrawalDates.OrganicOtherWithdrawalDate > Result ) then
            Result := DrugWithDrawalDates.OrganicOtherWithdrawalDate;
      end;
end;

function THerdLookup.GetNotSexedSemenTypeID: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM GenLook');
         SQL.Add('WHERE (Upper(Description) = "NOT SEXED")');
         SQL.Add('AND   (ListType = '+IntToStr(LSexedSemen)+')');
         try
            Open;
            if ( RecordCount > 0 ) then
               if ( Fields[0].AsInteger > 0 ) then
                  Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.AnimalHasEventsInCurrentLactNo (AAnimalID, ALactNo : Integer): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Events');
         SQL.Add('WHERE (AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (AnimalLactNo = '+IntToStr(ALactNo)+'');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetBreedType(ABreedID : Integer): TBreedType;
begin
   Result := btBeefBreed;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add(InsertSELECT(['EligibleforPremium']));
         SQL.Add(InsertFROM(['Breeds']));
         SQL.Add(InsertWHERE(['ID'],[':AID']));
         Params[0].AsInteger := ABreedID;
         Open;
         try
            First;
            if Fields[0].AsBoolean then
               Result := btBeefBreed
            else
               Result := btDairyBreed;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetDefaultsUpdateNo: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT UpdateNo');
         SQL.Add('FROM Defaults');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.StockBullEventExistsForAnimal(AAnimalID : Integer;
   AEventDate : TDateTime; AEventDesc : String): Boolean;
begin
   Result := True;
   if ( AAnimalID = 0 ) or ( Length(AEventDesc) = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Events');
         SQL.Add('WHERE (EventType = '+IntToStr(CStockBullEvent)+')');
         SQL.Add('AND   (AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (EventDate = "'+FormatDateTime(cUSDateStyle,AEventDate)+'")');
         SQL.Add('AND   (Upper(EventDesc) = "'+UpperCase(AEventDesc)+'")');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure THerdLookup.CalcAnimalStockBullEvents ( AAnimalID : Integer;
   AIsInEvent : Boolean; var AMessageShown : Boolean ) ;
var
   qEvents : TQuery;
   iInEventCount,
   iOutEventCount : Integer;
const
   cStockBullQueryTxt = 'SELECT COUNT(ID)'+cCRLF+
                        'FROM Events'+cCRLF+
                        'WHERE (EventType = :StockBullEvent)'+cCRLF+
                        'AND   (AnimalID = :AAnimalID)'+cCRLF+
                        'AND   (Upper(EventDesc) = :InOrOut)';

begin
   if ( AAnimalID = 0 ) then Exit;
   iInEventCount := 0;
   iOutEventCount := 0;
   AMessageShown := False;
   qEvents := TQuery.Create(nil);
   with qEvents do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Text := cStockBullQueryTxt;
         Params[0].AsInteger := CStockBullEvent;
         Params[1].AsInteger := AAnimalID;
         Params[2].AsString := 'STOCK BULL IN';
         Open;
         iInEventCount := Fields[0].AsInteger;

         SQL.Clear;
         SQL.Text := cStockBullQueryTxt;
         Params[0].AsInteger := CStockBullEvent;
         Params[1].AsInteger := AAnimalID;
         Params[2].AsString := 'STOCK BULL OUT';
         Open;
         iOutEventCount := Fields[0].AsInteger;

         if ( AIsInEvent ) then
            AMessageShown := ( iInEventCount > iOutEventCount )
         else
            AMessageShown := ( iOutEventCount >= iInEventCount );
      finally
         Free;
      end;
end;

procedure THerdLookup.ValidateStockBullEvent(AAnimalID: Integer;
  AIsInEvent: Boolean; AEventDate : TDateTime; var AMessageShown: Boolean);
var
   qEvents : TQuery;
begin
   if ( AAnimalID = 0 ) or ( AEventDate = 0 ) then Exit;
   qEvents := TQuery.Create(nil);
   with qEvents do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT MAX(EventDate)');
         SQL.Add('FROM Events');
         SQL.Add('WHERE (AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (EventType = '+IntToStr(CStockBullEvent)+')');
         if ( AIsInEvent ) then
            SQL.Add('AND   (UPPER(EventDesc) = "STOCK BULL IN")')
         else
            SQL.Add('AND   (UPPER(EventDesc) = "STOCK BULL OUT")');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            // Check to see if the new event date is before the last event date and show message if it is.
            AMessageShown := ( AEventDate < Fields[0].AsDateTime );
            if ( AMessageShown ) then
               begin
                  if ( AIsInEvent ) then
                     MessageDlg('This event date is prior to the last Stock Bull In event and cannot be saved.',mtError,[mbOK],0)
                  else
                     MessageDlg('This event date is prior to the last Stock Bull Out event and cannot be saved.',mtError,[mbOK],0);
                  Exit;
               end;
            if ( not(AMessageShown) ) then
               begin
                  SQL.Clear;
                  SQL.Add('SELECT EventDate');
                  SQL.Add('FROM Events');
                  SQL.Add('WHERE (AnimalID = '+IntToStr(AAnimalID)+')');
                  SQL.Add('AND   (EventType = '+IntToStr(CStockBullEvent)+')');
                  if ( AIsInEvent ) then
                     SQL.Add('AND   (UPPER(EventDesc) = "STOCK BULL OUT")')
                  else
                     SQL.Add('AND   (UPPER(EventDesc) = "STOCK BULL IN")');
                  SQL.Add('ORDER BY EventDate DESC');
                  Open;
                  if ( RecordCount > 0 ) then
                     begin
                        First;
                        while ( not(Eof) ) do
                           begin
                              // Check to see if the new event date is before the most recent opposite event type and show message if it is.
                              AMessageShown := ( AEventDate < Fields[0].AsDateTime );
                              if ( AMessageShown ) then Break;
                              Next;
                           end;
                        if ( AMessageShown ) then
                           begin
                              if ( AIsInEvent ) then
                                 MessageDlg('This events is prior to the last Stock Bull Out event and cannot be saved.',mtError,[mbOK],0)
                              else
                                 MessageDlg('This events is prior to the last Stock Bull In event and cannot be saved.',mtError,[mbOK],0)
                           end;
                     end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure THerdLookup.qStockBullsBeforeOpen(DataSet: TDataSet);
begin
   qStockBulls.Params[0].AsInteger := WinData.UserDefaultHerdID;
end;

function THerdLookup.AnimalIsDead(AAnimalID: Integer): Boolean;
var
   dSaleDate : TDateTime;
begin
   Result := False;
   if ( AAnimalID = 0 ) then Exit;
   dSaleDate := 0;
   dSaleDate := WinData.EventDataHelper.GetLastEventDate(AAnimalID,CSaleDeathEvent);
   if ( dSaleDate = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT S.Sold');
         SQL.Add('FROM SalesDeaths S');
         SQL.Add('LEFT JOIN Events E ON (E.ID = S.EventID)');
         SQL.Add('WHERE (E.AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')');
         SQL.Add('AND   (E.EventDate = "'+FormatDateTime(cUSDateStyle,dSaleDate)+'")');
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := ( not(Fields[0].AsBoolean) );
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.MedicineUnitUsed(AMedicineID: Integer; AUnitType: TUnitType): Double;
begin
   Result := 0;
   if ( AMedicineID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT U.Multiplier');
         SQL.Add('FROM Units U');
         if ( AUnitType = utDose ) then
            SQL.Add('WHERE U.ID IN (SELECT M.DoseUnit')
         else
            SQL.Add('WHERE U.ID IN (SELECT M.PurchUnit');
         SQL.Add('               FROM Medicine M');
         SQL.Add('               WHERE M.ID = '+IntToStr(AMedicineID)+')');
         try
            Open;
            if ( RecordCount > 0 ) then
               if ( not(Fields[0].AsVariant = null) ) then
                  Result := Fields[0].AsFloat;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.IsValidHerdNumber(ACountry: TCountry; const AHerdNumber : String = ''): Boolean;
var
   i : Integer;
   HerdNo : String;
begin
   Result := True;
   // Only doing check for Irish herd for now.
   // Other country validations can be added later if required.
   if ( ACountry <> Ireland ) then Exit;
   HerdNo := AHerdNumber;
   if ( Length(HerdNo) = 0 ) then
      HerdNo := HerdOwnerData.HerdIdentity;
   HerdNo := UpperCase(Trim(HerdNo));
   Result := ( Length(HerdNo) = 8 );
   if ( not(Result) ) then Exit;
   Result := ( (HerdNo[1] in ['0'..'9']) or (HerdNo[1] in ['A'..'Z']) ) or
             ( (HerdNo[8] in ['0'..'9']) or (HerdNo[8] in ['A'..'Z']) );
   if ( not(Result) ) then Exit;
   for i := 2 to 7 do
      begin
         Result := ( HerdNo[i] in ['0'..'9'] );
         if ( not(Result) ) then
            Break;
      end;
end;

function THerdLookup.IsDuplicateHerdNumber(AHerdID : Integer; const AHerdNumber : String = '') : Boolean;
var
   HerdNo : String;
begin
   Result := False;
   HerdNo := AHerdNumber;
   if ( Length(HerdNo) = 0 ) then
      HerdNo := HerdOwnerData.HerdIdentity;
   HerdNo := UpperCase(Trim(HerdNo));
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE Upper(HerdIdentity) = "'+AHerdNumber+'"');
         SQL.Add('AND ID <> '+IntToStr(AHerdID)+'');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetTCountryByText (ACountryTxt : String) : TCountry;
begin
   Result := Other;
   if ( Length(ACountryTxt) = 0 ) then Exit;

   if ( UpperCase(ACountryTxt) = 'IRELAND' ) then
      Result := Ireland
   else if ( UpperCase(ACountryTxt) = 'N.IRELAND' ) then
      Result := NIreland
   else if ( UpperCase(ACountryTxt) = 'SCOTLAND' ) then
      Result := Scotland
   else if ( UpperCase(ACountryTxt) = 'ENGLAND' ) then
      Result := England
   else if ( UpperCase(ACountryTxt) = 'POLAND' ) then
      Result := Poland;
end;

function THerdLookup.PedigreePrefixByHerdId(AHerdID: Integer): string;
var
  HerdQuery : TQuery;
begin
   WinData.CreateTQuery(HerdQuery);
   try
      HerdQuery.SQL.Clear;
      HerdQuery.SQL.Add('SELECT HerdPrefix FROM Owners WHERE ID =:AHerdId');
      HerdQuery.Params[0].AsInteger := AHerdId;
      HerdQuery.Open;
      HerdQuery.First;
      try
         Result := HerdQuery.Fields[0].AsString;
      finally
         HerdQuery.Close;
      end;
   finally
      FreeAndNil(HerdQuery);
   end;
end;

function THerdLookup.GetNextAutoGenTagNumber : String;

   function HasNatIDLeadZero : Boolean;
   begin
      Result := False;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT NatIDLeadZero');
            SQL.Add('FROM Owners');
            SQL.Add('WHERE ID = '+IntToStr(WinData.UserDefaultHerdID)+'');
            try
               Open;
               Result := Fields[0].AsBoolean;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

var
   sAnimalNo,
   NewID,
   sHerdIdentifier,
   CheckTagNo : String;
   CheckDigit : Integer;
begin
   sHerdIdentifier := '';
   sHerdIdentifier := WinData.HerdIdentifier;
   NewID := '';
   if ( WinData.SystemRegisteredCountry = Ireland ) then
      begin
         // Auto Generate Irish Tag.
         for CheckDigit := 1 to 9 do
            begin
               CheckTagNo := WinData.HerdTagPrefix + sHerdIdentifier + IntToStr(CheckDigit) + PadLeft(IntToStr(HerdLookup.HerdOwnerData.NextNatID),'0',4);
               if ( CheckNatID(CheckTagNo, NewID, True) ) then
                  begin
                     Result := NewID;
                     HerdLookup.HerdOwnerData.NextNatID := HerdLookup.HerdOwnerData.NextNatID+1;
                     Break;
                  end;
            end;
      end
   else
      begin
         // Auto Generate Northern Irish Tag.
         for CheckDigit := 1 to 7 do
            begin
               if ( HasNatIDLeadZero ) then
                  sAnimalNo := PadLeft(IntToStr(HerdLookup.HerdOwnerData.NextNatID), '0', 4)
               else
                  sAnimalNo := IntToStr(HerdLookup.HerdOwnerData.NextNatID);
               if ( (CheckNINatID( 'UK 9 ' + sHerdIdentifier + ' ' + sAnimalNo + ' ' + IntToStr(CheckDigit) , NewID)) and (CheckDigit<=7) ) then
                  begin
                     Result := NewID;
                     HerdLookup.HerdOwnerData.NextNatID := HerdLookup.HerdOwnerData.NextNatID+1;
                     Break;
                  end;
            end;
      end;
end;

function THerdLookup.FirstMedicineID : Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, Name');
         SQL.Add('FROM Medicine');
         SQL.Add('ORDER BY Name');
         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetNatIDIndex: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT NatIDIndex');
         SQL.Add('FROM Defaults');
         try
            Open;
            Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetAnimalsWithOverallGainPerDayBetween(
  const AHerdId: Integer; const AFromValue,
  AToValue: Variant): TIntegerArray;
var
   i : Integer;
   List : TList;

   procedure GetOverallGainPerDayValues;
   var
      TempQuery : TQuery;
   begin
      TempQuery := TQuery.Create(nil);
      with TempQuery do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID, OverallWeightGain');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE HerdId = :AHerdID');
            Params[0].AsInteger := AHerdId;
            if (AFromValue <> null) and (AToValue <> null) then
               begin
                  SQL.Add('AND (OverallWeightGain BETWEEN :AFromValue AND :ToValue)');
                  Params[1].AsFloat := AFromValue;
                  Params[2].AsFloat := AToValue;
               end
            else if (AFromValue <> null) and (AToValue = null) then
               begin
                  SQL.Add('AND (OverallWeightGain >= :AFromValue)');
                  Params[1].AsFloat := AFromValue;
               end
            else if (AFromValue = null) and (AToValue <> null) then
               begin
                  SQL.Add('AND (OverallWeightGain <= :AToValue)');
                  Params[1].AsFloat := AToValue;
               end;
            Open;
            try
               First;
               while not eof do
                  begin
                     if (List.IndexOf(pointer(FieldByName('Id').AsInteger)) = -1) then
                        List.Add(pointer(FieldByName('Id').AsInteger));
                     Next;
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

begin
   List := TList.Create;
   try
     GetOverallGainPerDayValues;

     SetLength(Result, List.Count);
     for i := 0 to List.Count-1 do
        begin
           Result[i] := Integer(List[i]);
        end;

   finally
      FreeAndNil(List);
   end;
end;

function THerdLookup.GetDefaultHerdID: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DefaultHerdID');
         SQL.Add('FROM Defaults');
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.AnimalNoAlreadyExists(AAnimalNo: String): Boolean;
begin
   Result := False;
   if ( Length(AAnimalNo) = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE Upper(AnimalNo) = "'+AAnimalNo+'"');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

function THerdLookup.TransponderNoAlreadyExists(ATransponder: String): Boolean;
begin
   Result := False;
   if ( Length(ATransponder) = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE Upper(TransponderNo) = "'+ATransponder+'"');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetStockBullEventsExist: Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, E.AnimalID, E.AnimalLactNo');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Animals A ON (A.ID = E.AnimalID)');
         SQL.Add('WHERE E.EventType = :StockBullEvent');
         SQL.Add('AND   E.AnimalLactNo = A.LactNo');
         SQL.Add('AND   A.InHerd = True');
         SQL.Add('AND   A.AnimalDeleted = False');
         SQL.Add('AND   A.HerdID = :DefaultHerdID');
         Params[0].AsInteger := CStockBullEvent;
         Params[1].AsInteger := WinData.UserDefaultHerdID;
         try
            Open;
            Result := ( RecordCount > 0 );
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.IsValidAICode(AAICode: String): Boolean;
begin
   Result := False;
   if ( Length(AAICode) = 0 ) then Exit;
   Result := ( Length(AAICode) >= 3 ) and ( Length(AAICode) <= 6 );
   if Result then
      Result := ( IsAlphaNumericString(AAICode) or IsAllAlphaString(AAICode) );
end;

procedure THerdLookup.CreateMDPureBredBreedData;
var
   qPureBredBreeds : TQuery;
begin
   qPureBredBreeds := TQuery.Create(nil);
   with qPureBredBreeds do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, Code, Name');
         SQL.Add('FROM Breeds');
         //SQL.Add('WHERE InUse = True');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            mdPureBredBreeds.Close;
            mdPureBredBreeds.Open;
            First;
            while ( not(Eof) ) do
               begin
                  if ( not(BreedCodeIsCrossBreed(FieldByName('Code').AsString)) ) then
                     try
                        mdPureBredBreeds.Append;
                        mdPureBredBreeds.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger;
                        mdPureBredBreeds.FieldByName('Code').AsString := FieldByName('Code').AsString;
                        mdPureBredBreeds.FieldByName('Name').AsString := FieldByName('Name').AsString;
                        mdPureBredBreeds.Post;
                     except
                        on e : Exception do
                           begin
                              ShowMessage(e.Message);
                              mdPureBredBreeds.Cancel;
                           end;
                     end;
                  Next;
               end;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;

end;

function THerdLookup.GetTempMoveMovedToIDByHerdID(AHerdID: String): Integer;
var
   tMovedTo : TTable;
begin
   tMovedTo := TTable.Create(nil);
   with tMovedTo do
      try
         DatabaseName := AliasName;
         TableName := 'MovedTo';
         Open;
         try
            begin
              if ( not(Locate('HerdIdentity',AHerdID,[])) ) then
                 try
                    tMovedTo.Append;
                    tMovedTo.Fields[1].Value := AHerdID;
                    tMovedTo.Fields[2].Value := AHerdID;
                    tMovedTo.Post;
                    Result := tMovedTo.FieldByName('ID').AsInteger;
                 except
                    on e : Exception do
                       ShowMessage(e.Message);
                 end
              else
                 Result := FieldByName('ID').AsInteger;
            end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetAnimalsWithSCCBetween(const AHerdId: Integer;
  const AFromValue, AToValue: Variant): TIntegerArray;
var
   i : Integer;
   List : TList;

   procedure GetSCCValues;
   var
      TempQuery : TQuery;
   begin
      TempQuery := TQuery.Create(nil);
      with TempQuery do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT M.AnimalId, M.SCC');
            SQL.Add('FROM MilkDisk M');
            SQL.Add('INNER JOIN Animals A On (M.AnimalId = A.ID)');
            SQL.Add('WHERE A.Sex = "Female"');
            SQL.Add('AND A.AnimalDeleted = False');
            SQL.Add('AND A.InHerd = True');
            SQL.Add('AND A.HerdId = :AHerdID');
            SQL.Add('AND M.LactNo = A.LactNo');

            Params[0].AsInteger := AHerdId;
            if (AFromValue <> null) and (AToValue <> null) then
               begin
                  SQL.Add('AND (M.SCC BETWEEN :AFromValue AND :ToValue)');
                  Params[1].AsFloat := AFromValue;
                  Params[2].AsFloat := AToValue;
               end
            else if (AFromValue <> null) and (AToValue = null) then
               begin
                  SQL.Add('AND (M.SCC >= :AFromValue)');
                  Params[1].AsFloat := AFromValue;
               end
            else if (AFromValue = null) and (AToValue <> null) then
               begin
                  SQL.Add('AND (M.SCC <= :AToValue)');
                  Params[1].AsFloat := AToValue;
               end;
            Open;
            try
               First;
               while not eof do
                  begin
                     if (List.IndexOf(pointer(FieldByName('AnimalId').AsInteger)) = -1) then
                        List.Add(pointer(FieldByName('AnimalId').AsInteger));
                     Next;
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

begin
   List := TList.Create;
   try
     GetSCCValues;

     SetLength(Result, List.Count);
     for i := 0 to List.Count-1 do
        begin
           Result[i] := Integer(List[i]);
        end;

   finally
      FreeAndNil(List);
   end;
end;

function THerdLookup.GetICBFAPIEventCountByAnimal(AICBFCode: String;
  AAnimalID: Integer; const ACalvingDate: TDateTime): Integer;
begin
   Result := 0;
   if ( Length(AICBFCode) = 0 ) then Exit;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(ResourceID)');
         SQL.Add('FROM ICBFAPIHerdHealth');
         SQL.Add('WHERE AnimalID = :AID');
         SQL.Add('AND   Event = :EventCode');
         if ( ACalvingDate > 0 ) then
            SQL.Add('AND   EventDate > "'+FormatDateTime(cUSDateStyle,ACalvingDate)+'"');
         try
            Params[0].AsInteger := AAnimalID;
            Params[1].AsString := AICBFCode;
            Open;
            Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetMastitisEventCountByAnimal(AAnimalID: Integer;
   const ACalvingDate: TDateTime): Integer;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(ID)');
         SQL.Add('FROM Events');
         SQL.Add('WHERE AnimalID = :AID');
         SQL.Add('AND   EventType = :EventType');
         if ( ACalvingDate > 0 ) then
            SQL.Add('AND   EventDate > "'+FormatDateTime(cUSDateStyle,ACalvingDate)+'"');
         try
            Params[0].AsInteger := AAnimalID;
            Params[1].AsInteger := CNewMastitisEvent;
            Open;
            Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

{ TParlourDetails }

constructor TParlourDetails.Create;
begin
   ParlourDir := '';
   ParlourType := '';
   NetworkLink := False;
   MooMonitorLink := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ParlourDir, ParlourType, ReadNetworkLink, ReadDairyMasterMooMonitor, ImportFromParlour');
         SQL.Add('FROM ParlourLink');
         Open;
         try
            First;
            if ( RecordCount > 0 ) then
               begin
                  ParlourDir := Fields[0].AsString;
                  ParlourType := Fields[1].AsString;
                  NetworkLink := Fields[2].AsBoolean;
                  //   07/05/19 [V5.8 R9.2] /MK Change - Added MooMonitorLink to TParlourDetails.
                  MooMonitorLink := Fields[3].AsBoolean;
                  //   19/12/19 [V5.9 R1.5] /MK Change - Added ImportFromParlour to TParlourDetails.
                  ImportFromParlour := Fields[4].AsBoolean;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

destructor TParlourDetails.Destory;
begin
   ParlourDir := '';
   ParlourType := '';
   NetworkLink := False;
end;

procedure THerdLookup.ICBFCalfSurveyInitPopup(AEditRepository : TcxEditRepositoryLookupComboBoxItem;
   AValue : Variant);
var
  LGrid: TcxCustomLookupDBGrid;
  colListType : TcxLookupDBGridColumn;
begin
   inherited;
   LGrid := AEditRepository.Properties.Grid;
   colListType := LGrid.Columns.ColumnByFieldName('ListType');

   if ( colListType <> nil ) then
      begin
         with LGrid.DataController.Filter do
            begin
               Root.AddItem(colListType, foEqual, AValue, '');
               Active := True;
            end;
     end;
end;

procedure THerdLookup.erCalfVitalityLookupPropertiesInitPopup(Sender: TObject);
begin
   ICBFCalfSurveyInitPopup(erCalfVitalityLookup, 3);
end;

procedure THerdLookup.erCalfPneumoniaPropertiesInitPopup(Sender: TObject);
begin
   ICBFCalfSurveyInitPopup(erCalfPneumoniaLookup, 5);
end;

procedure THerdLookup.erCalfScourPropertiesInitPopup(Sender: TObject);
begin
   ICBFCalfSurveyInitPopup(erCalfScourLookup, 4);
end;

function THerdLookup.DuplicateVPAFound (AVPANo : String; ADrugID : Integer) : Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE (Upper(VPANo) = "'+AVPANo+'")');
         SQL.Add('AND   (ID <> '+IntToStr(ADrugID)+')');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetDrugCodeByID(ADrugID: Integer): String;
begin
   Result := '';
   if ( ADrugID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Code');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE ID = :DrugID');
         Params[0].AsInteger := ADrugID;
         try
            Open;
            if ( RecordCount > 0 ) and ( Length(Fields[0].AsString) > 0 ) then
               Result := Fields[0].AsString;
         except
         end;
      finally
         Free;
      end;
end;

function THerdLookup.GetAnimalSelectionToArrayWideString (ASelectionType : TSelectionType) : String;
var
   iaAnimalsInSelection : array of Integer;
begin
   // If, after checking to see if NoSelection is passed into the form, and there is no cart or filter
   // then just use the animals that are on the main grid.
   Result := '';
   SetLength(iaAnimalsInSelection,0);
   if ( ASelectionType = stFilter ) then
      begin
         if ( WinData.FilteredAnimals.RecordCount > 0 ) then
            begin
               if ( Length(Result) = 0 ) then
                  Result := '(';
               WinData.FilteredAnimals.First;
               while ( not(WinData.FilteredAnimals.Eof) ) do
                  begin
                     Result := Result + IntToStr(WinData.FilteredAnimals.FieldByName('AID').AsInteger) + ', ';
                     WinData.FilteredAnimals.Next;
                  end;
               if ( Length(Result) > 1 ) then
                  Result := Result + ')';
            end;
      end
   else if ( ASelectionType = stCart ) then
      Result := AnimalCart.AnimalCartDataAsWideString
   else if ( ASelectionType = stNoSelection ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AID');
            SQL.Add('FROM AFilters');
            Open;
            if ( RecordCount > 0 ) then
               begin
                  if ( Length(Result) = 0 ) then
                     Result := '(';
                  First;
                  while ( not(Eof) ) do
                     begin
                        Result := Result + IntToStr(Fields[0].AsInteger) + ', ';
                        Next;
                     end;
               end;
            if ( Length(Result) > 1 ) then
               Result := Result + ')';
         finally
            Free;
         end;
end;

procedure THerdLookup.AddAnimalsToTempTableOnStockDate ( ADate : TDateTime; ATable : TTable);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         Close;
         SQL.Clear;
         SQL.Add('INSERT INTO '+ATable.TableName+' (AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatID, SearchNatID, DateOfBirth, Sex, BreedID, LactNo, HerdID, InHerd)');
         SQL.Add('SELECT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.SearchNatID, A.DateOfBirth, A.Sex, A.PrimaryBreed, A.LactNo, A.HerdID, A.InHerd');
         SQL.Add('FROM Animals A');
         SQL.Add('WHERE (A.AnimalDeleted = False)');
         SQL.Add('AND   (A.HerdID IN (SELECT DefaultHerdID FROM Defaults))');
         SQL.Add('AND   (DateOfBirth <= "'+FormatDateTime(cUSDateStyle, ADate)+'")');
         ExecSQL;

         Close;
         SQL.Clear;
         SQL.Add('DELETE FROM '+ATable.TableName);
         SQL.Add('WHERE (AnimalID IN (');
         SQL.Add('                    SELECT AnimalID');
         SQL.Add('                    FROM Events');
         SQL.Add('                    WHERE (EventDate > "'+FormatDateTime(cUSDateStyle,ADate)+'")');
         SQL.Add('                    AND   (EventType = '+IntToStr(CPurchaseEvent)+')))');
         ExecSQL;

         SQL.Clear;
         SQL.Add('DELETE FROM '+ATable.TableName);
         SQL.Add('WHERE (AnimalID IN (');
         SQL.Add('                    SELECT AnimalID');
         SQL.Add('                    FROM Events');
         SQL.Add('                    WHERE (EventDate <= "'+FormatDateTime(cUSDateStyle,ADate)+'")');
         SQL.Add('                    AND   (EventType = '+IntToStr(CSaleDeathEvent)+')))');
         ExecSQL;
      finally
         Close;
         Free;
      end;
end;

function THerdLookup.MultiHerdHasSameHerdNo : Boolean;
var
   sHerdIdentity,
   sHerdNoToUse : String;
begin
   Result := False;

   if ( not(WinData.MultiHerd) ) then Exit;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE ID = '+IntToStr(WinData.UserDefaultHerdID));
         try
            Open;
            First;
            sHerdIdentity := FieldByName('HerdIdentity').AsString;
            if IsValidIrishHerdID(sHerdIdentity) then
               sHerdNoToUse := sHerdIdentity;
            Close;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM Owners');
            SQL.Add('WHERE ID <> '+IntToStr(WinData.NONEHerdID));
            SQL.Add('AND   ID <> '+IntToStr(WinData.UserDefaultHerdID));
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  sHerdIdentity := FieldByName('HerdIdentity').AsString;

                  Result := ( Length(sHerdNoToUse) > 0 ) and ( Pos(sHerdNoToUse,sHerdIdentity) > 0 );

                  if ( Length(sHerdNoToUse) > 0 ) and ( not(Result) ) then Exit;

                  Next;
               end;
         except
         end;
      finally
         Free;
      end;
end;

procedure THerdLookup.qLookupTreatmentUsedBeforeOpen(DataSet: TDataSet);
begin
   qLookupTreatmentUsed.Params[0].AsInteger := LTreatmentUsed;
end;

procedure THerdLookup.qMediDisposalReasonBeforeOpen(DataSet: TDataSet);
begin
   qMediDisposalReason.Params[0].AsInteger := LMediDiposalReasons;
end;

procedure THerdLookup.qHerdTestResultTypeBeforeOpen(DataSet: TDataSet);
begin
   qHerdTestResultType.Params[0].AsInteger := LHerdTestResult;
end;

end.
