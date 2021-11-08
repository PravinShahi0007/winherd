{
  29/01/2009 [V3.9 R5.8] /SP Additional Feature - Add Vaccine to the GenLook MediType list

  04/02/2009 [Rel V3.9 R4.9, Dev V3.9 R5.9] /SP Additional Feature - Animals.Sex fix, change STEER to Steer

  16/02/2009 [Dev V3.9 R6.1] /SP Bug Fix - a fix to delete the mis-spelling of genlook record (ICBF - Retained Plascenta)
                               Program Change - Updated Breed listing to include VO/VOX (GenTypesConst.pas), update breed table accordingly


  -------------------------------------------------------------------------------------------
  18/11/09 [V4.0 R0.4] /MK Additional Feature - Added the fields PedigreeCowsInMilk, PedigreeCowsDry, PedigreeBullBreed,
                                                PedigreeHeifer06, PedigreeHeifer612, PedigreeHeifer1218, PedigreeHeifer1824,
                                                PedigreeHeifer24Plus, PedigreeSteer06, PedigreeSteer612, PedigreeSteer1218,
                                                PedigreeSteer1824, PedigreeSteer24Plus, PedigreeBullBeef06, PedigreeBullBeef612,
                                                PedigreeBullBeef12Plus, EnterpriseType, PedigreeOpeningValue and PedigreeClosingValue.

  01/07/10 [V4.0 R3.6] /MK Additional Feature - New Field in Animals table called UKAISireCode.

  10/02/11 [V4.0 R8.1] /MK Additional Feature - If VerNo Is Less Than V4.0R6.3 Then Set Calf Reg Preference On Automatically.

  12/02/11 [V4.0 R8.2] /MK Additional Feature - Added New Health Farm Codes For Kay Carson System If SystemCountry = England.

  21/02/11 [V4.0 R8.4] /MK Additional Feature - Added New Field To Owners For UK Milk Recorder.
                            
  22/02/11 [V4.0 R8.4] /MK Additional Feature - Added Genlook Entries (CIS, NMR, QMMS) For UKMilkRecorder.

  28/02/11 [V4.0 R8.5] /MK Bug Fix - Added UKMilkRecorder Field To Owners Regardless Of Country.

  05/03/11 [V4.0 R9.3] /MK Additional Feature - Added WA, WAX Breed Codes To Breed Table.

  07/04/11 [V4.0 R9.4] /MK Additional Feature - Added 'BG, BGX, BZ, BZX, SP, SPX, UN' Missing Bandon Breeds For Irish Herd Only.

  15/04/11 [V4.0 R9.7] /MK Additional Feature - New Function to check if WinData.KillOutPercs exists.
                                              - Added New Table KillOutPercs
                                              - Added Content of KillOutPercs.

  07/06/11 [V4.1 R1.8] /MK Additional Feature - UpdateGenlook - If Not Locate LookupCode AI Then Add LookupCode AI

  05/09/11 [V5.0 R0.5] /MK Additional Feature - Update The Defaults Table And Add The CrushMaleAnimalNo/CrushFemaleAnimalNo Fields.

  06/09/11 [V5.0 R0.5] /MK Additional Feature - Added New CreateMilkTemperment Table.

  29/09/11 [V5.0 R0.7] /MK Additional Feature - Added New Parameter To AddListType For InUse.
                                              - Added New APHIS Disposal Manners From Skype From TGM.
                                              - Set Old APHIS Disposal Manners To Out Of Use.

  18/10/11 [V5.0 R1.5] /MK Additional Feature - Added UpdatePregDiag Back Into CheckDatabaseTables.

  17/11/11 [V5.0 R2.2] /MK Additional Feature - UpdateGroups - New Field CrushLoadComplete. Set To True If Not Exists.

  23/11/11 [V5.0 R2.3] /MK Change - New Fields In The Flt Table For ConditionScoreFilter.

  05/12/11 [V5.0 R2.4] /MK Change - New VPANo Field Added To Medicine Table.

  08/12/11 [V5.0 R2.8] /MK Change - Changed Order Of UpdateHealth So That When New Fields Are Added They Match BlankData Table Field Defs Order.

  20/12/11 [V5.0 R2.9] /MK Additional Feature - New Genlook List Types For Tesco Johnes Event.

  09/01/12 [V5.0 R3.3] /MK Additional Feature - New Fields For Tesco Scoring Event Added To UpdateConditionScore.

  01/02/12 [V5.0 R3.7] /MK Change - UpdateHealth - Added New DrugBatchNoField For Free Text Drug BatchNo In Health Event.

  12/03/12 [V5.0 R4.3] /MK Additional Feature - UpdateDefaults - Added New Field For ShowAllEvents.

  13/03/12 [V5.0 R4.4] /MK Additional Feature - UpdateAnimals - New BVDDate Field Added To The Animals Table.

  16/05/12 [V5.0 R5.7] /MK Additional Feature - UpdateReportsTable - Added The New SortID And ReportGen Fields.

  16/05/12 [V5.0 R5.7] /MK Additional Feature - UpdateDefaults - New DefaultReportFilter Field Added.

  06/06/12 [V5.0 R6.0] /MK Bug Fix - Add All BatchNo's From DrugPurchTable To HealthTable If HealthBatchNo Is Null.

  30/07/12 [V5.0 R8.2] /MK Additional Feature - Filter Table - Added EBIFrom, EBITo and EBIFilter fields.

  17/09/12 [V5.0 R9.9] /MK Additional Feature - Added new health, non-user-can-delete, codes for Herd Vaccine's.

  20/09/12 [V5.0 R9.9] /MK Additional Feature - Added Default Vaccination Report Description Types.

  28/11/12 [V5.1 R3.3] /MK Additional Feature - Create new Target Weights table.

  19/12/12 [V5.1 R3.6] /MK Additional Feature - UpdateFilterdb - Added 305 day Milk Yield fields to flt table.

  09/01/13 [V5.1 R3.7] /MK Change - Add Vaccination Diseases as LVaccination_DiseaseCode ListType.

  22/01/13 [V5.1 R3.9] /MK Additional Feature - UpdateFilterdb - Added RatCalcMilkYield boolean.

  12/02/13 [V5.1 R4.1] /MK Bug Fix - AddVaccinationDiseaseCode - Exit procedure if Vaccine List Type found.

  26/03/13 [V5.1 R5.3] /MK Additional Feature - AddVaccinationDiseaseCode - Added RSV and Ringworm to list of diseases

  02/04/13 [V5.1 R6.1] /MK Additional Feature - New field - QualityAssured - added to Animals table added for IAD use.

  26/04/13 [V5.1 R7.0] /MK Additional Feature - Added new string field to MediPur for PurchTagNoDesc.

  09/05/13 [V5.1 R7.1] /MK Additional Feature - UpdateGenLook - New procedure to change LBirthType Descriptions for ICBF Beef Data Program.

  10/05/13 [V5.1 R7.1] /MK Additional Feature - New functions added CreateICBFDamEventTable & CreateICBFStockBullEventTable.

  25/06/13 [V5.1 R7.5] /MK Additional Feature - AddVaccinationDiseaseCode - Added Schmallenberg to list of diseases

  28/06/13 [V5.1 R8.0] /MK Additional Feature - UpdateFilterdb - Added FilterTableServedCount Integer field.

  09/07/13 [V5.1 R8.2] /MK Additional Feature - Add UpdateParlourLink for use with Moo Monitor Events.
           
  09/08/13 [V5.1 R9.1] /MK Additional Feature - Create the ParlourLink table if it does not exist.

  23/08/13 [V5.2 R0.2] /MK Additional Feature - Added PurchDoseRate to MediPur table.

  26/08/13 [V5.2 R0.2] /MK Change - UpdateHealth - Added ManualComment field to store if user entered comment manually.

  03/09/13 [V5.2 R1.0] /MK Additional Feature - Added QtyRemaining to MediPur table.

  17/09/13 [V5.2 R1.4] /MK Change - UpdateGenLook - Change None Medicine Group type to Neither - GL.

  20/09/13 [V5.2 R1.5] /MK Additional Feature - Create new ICBF Calf Survey table.

  14/10/13 [V5.2 R3.4] /MK Additional Feature - Added new MilkN_A_Drug & MeatN_A_Drug boolean to Medicine table.

  11/12/13 [V5.2 R6.8] /MK Additional Feature - UpdateGenLook - Remove old Johnes list types and create new High, Medium & Low types.

  12/12/13 [V5.2 R6.9] /MK Additional Feature - UpdateAnimals - New QADate added to Animals table.

  03/02/14 [V5.2 R7.9] /MK Additional Feature - Added the CowFamily string field to the Animals table.

  20/02/14 [V5.2 R8.4] /MK Additional Feature - Added new Health and Culling codes as requested by ICBF.
                                              - Added new list type listing for ICBF Sexed Semen request.
                                              - Added SexedSemen Integer field to the Services table for ICBF.

  05/03/14 [V5.2 R8.8] /MK Additional Feature - Added Expiry Date to FdStkEvents table as requested by Breda Forrest.

  13/03/14 [V5.2 R9.0] /MK Change - Updated Report defaults table to show new Dam & Calf Report Generator which
                                    replaces the old Calf Performance Generator.

  18/03/14 [V5.2 R9.0] /MK Additional Feature - SetupDirectoryStructure - Added Cows365 folder for Dan Ryan/Cows365 Gmail files.

  21/03/14 [V5.2 R9.0] /MK Additional Feature - Incorrect spelling for ZZ code added when ZZ code was originally added.

  26/03/14 [V5.2 R9.1] /MK Additional Feature - On V5.2 R9.1 version show Recent Changes screen.

  25/04/14 [V5.3 R0.0] /MK Additional Feature - Added new Medicine Groups for Dose and Tube for Bord Bia.

  19/05/14 [V5.3 R1.4] /MK Additional Feature - Added NoOfMonthsTo field to FilterTable.

  30/06/14 [V5.3 R3.0] /MK Additional Feature - UpdatePregDiag - Added ReCheck field and set to False to start with.

  28/08/14 [V5.3 R5.7] /MK Additional Feature - UpdateDefaultHealthEvents - Added new boolean field, CrushTreatment, to DefaultHealthEvents.

  15/09/14 [V5.3 R6.2] /MK Additional Feature - UpdateDefaults - New boolean field, AttachmentsDownloaded, added to Defautls Table.

  30/09/14 [V5.3 R7.4] /MK Change - UpdatePurchGrpData - Added new fields LotNo and SearchNatID to PurchGrpData.db.

  11/11/14 [V5.3 R8.9] /MK Additional Feature - Added new FullyImported field to the DrugsRegImportHeader table.

  13/11/14 [V5.3 R8.9] /MK Additional Feature - Added new TreatmentSaved field to the DrugsRegImportDetail table.

  25/11/14 [V5.4 R0.0] /MK Additional Feature - UpdateFilterdb - Added Vaccination field to Flt table.

  01/12/14 [V5.4 R0.2] /MK Additional Feature - UpdateFilterdb - Add new fields (DaysOnFarmFilterSelected, DaysOnFarmFrom, DaysOnFarmTo) for filter of DaysOnFarm.

  04/12/14 [V5.4 R0.3] /MK Additional Feature - UpdateCowExt - Added AAAScores1,2&3 fields to the CowExt table - Philip Cusack/GL Request.
                                              - UpdateCustomers - New NI disposal place for Enviro-Care Ltd - TGM request.

  12/12/14 [V5.4 R0.4] /MK Additional Feature - UpdateDrugRegisterDetail - Added AnimalGroupCategoryType field to DrugsRegImportDetail for Category/Group facility.

  02/02/15 [V5.4 R2.6] /MK Additional Feature - UpdateCustomers - New NI disposal place for ROUTE HUNT FALLEN STOCK LTD - TGM request.

  16/03/15 [V5.4 R3.4] /MK Change - Reorganised list in alphabetical order for alignment with ICBF emailed list.
                                  - New code added from ICBF health code list from Kevin Downing.
                                  - ICBF have done away with respiratory disease so delete it.

  01/04/15 [V5.4 R2.3] /MK Additional Feature - UpdateGenLook - Added DIY as a UK Milk Recorder option - Brian Lamb.

  21/04/15 [V5.4 R4.9] /MK Additional Feature - Create new MartEmailSuppliers TTable.

  11/05/15 [V5.4 R5.6] /MK Additional Feature - UpdateCustomers/UpdateSuppliersBreeders
                                                 - Added new field to store change of name from new uChangeCustomerSupplierNames unit.

  15/07/15 [V5.4 R7.0] /MK Change - UpdateDeletedCalvings - New field to store whether a full calving was deleted or some calves were deleted
                                    for the cow so the calves can be added to another cow.

  06/08/15 [V5.4 R7.1] /MK Additional Feature - Added new fields for SlurryCustomer and SlurrySupplier to be used in fields program.

  11/09/15 [V5.4 R8.5] /MK Additional Feature - UpdateEvents - Added Modified field to the events table to be used with HerdSync - SP request.

  30/10/15 [V5.4 R9.8] /MK Additional Feature - UpdateEvents - Added ParlourNotified field to the events table to be used with ParlourLink.

  09/11/15 [V5.5 R0.5] /MK Additional Feature - Added InUse boolean fields to UpdateCustomers, UpdateBuyers, UpdateSuppliersBreeders and UpdateMedAdmin.
                                              - Added IsVet boolean field to UpdateMedAdmin to distinguish between a farmer/technician and a vet for prescribed by list.
                                                Go through MedAdmin table and see if the Position field has the word vet in it, if it does then set IsVet to True
                                                else set IsVet to False.

  12/11/15 [V5.5 R0.5] /MK Additional Feature - UpdateMediPurch - Added Comment Blob field.

  02/12/15 [V5.5 R1.4] /MK Addiontal Feature - UpdateGenLookup - Added Coccidiosis to list of diseases - Milo Murphy request.

  10/12/15 [V5.5 R1.7] /MK Additional Feature - UpdateCustomers/UpdateSuppliersBreeders
                                               - Added BusinessID that is only used in Kingswood Fields currently.

  10/02/16 [V5.5 R2.7] /MK Bug Fix - CreateAnimalCart - AnimalCart table defintion was the same as the SyncWarnings table definitions.

  09/03/16 [V5.5 R5.4] /MK Additional Feature - Added IgnoreEBIUpdate fields to CowExt and BullExt to be used with ICBF Import and WinData.CreateYoungStockEBIValues
                                                to stop the program from updating the EBI values of young stock that were already updated by the ICBF Import.

  10/02/16 [V5.5 R2.7] /MK Bug Fix - CreateAnimalCart - AnimalCart table defintion was the same as the SyncWarnings table definitions.

  16/06/16 [V5.5 R6.8] /MK Additional Feature - New fields added to ICBFCalfSurvey table.
                           Change - CullingCodes - The below names should be changed to new names from ICBF current list.
                                                 - Added extra new ICBF Culling Codes PP & IB.

  18/10/16 [V5.6 R2.1] /MK Bug Fix - UpdatePurchGrpData - Result was not set if UpdateFieldType was False.

  31/01/17 [V5.6 R4.2] /MK Bug Fix - HerdPrefix - SP is using this field regardless of Country so I am to only default to IE if country is Ireland.

  27/03/17 [V5.6 R5.6] /MK Change - UpdateBreeds - Update Irish Maol/Droimeann breed name and change it to Irish Maol only - Dept. request.
                                                 - Add the Droimeann breed - Dept. request.

  27/04/17 [V5.6 R7.1] /MK Additional Feature - UpdateBullings - Added new field for recommended bull indicator from ICBF for Planned Bull event.

  17/07/17 [V5.6 R9.2] /MK Additional Feature - UpdateDefaults - Added new field for BordBiaRegistered to the Defaults table for use within the Incomplete Medicines screen.

  21/08/17 [V5.7 R2.0] /MK Additional Feature - UpdateDefaults - New field, DrugXMLUpdateRequired, added to the defaults table.

  06/10/17 [V5.7 R3.7] /MK Additional Feature - UpdateOwners - Added new field, NIRolloverHerd, for the new NI Rollover Tag requirement.

  10/10/17 [V5.7 R3.8] /MK Additional Feature - CreateDeletedGrps - New table to store the groups that are deleted for use with HerdSync.

  01/12/17 [V5.7 R5.9] /MK Additional Feature - UpdateDefaults - New field, AppSyncTagCountryCheck, added to the defaults table.

  08/01/18 [V5.7 R7.4] /MK Additional Feature - UpdateAnimals - New float field, OverallWeightGain, created for the animals table.

  16/01/18 [V5.7 R7.4] /MK Additional Feature - UpdateFilterDB - New float and boolean fields add for OverallGainPerDay filter.

  15/08/18 [V5.8 R2.4] /MK Additional Feature - UpdateMedicines - Added a boolean field, DrugFindWithdAccepted, to the Medicine table that store whether the user
                                                                  has accepted the message that appears after a drug has been imported from uDrugFinder with its withdrawal.
                                                                - Added a timestamp/date field, DrugFindWithdAcceptDate, to the Medince table that stores what date and time
                                                                  a user has accepted the message that appears after a drug has been imported from uDrugFinder with its withdrawal.

  20/08/18 [V5.8 R2.4] /MK Additional Feature - UpdateMedicines - Added four new integer fields to Medicines table MeatWithdBroughtDown, MilkWithdBroughtDown, OldMeatWithdrawal
                                                                  and OldMeatWithdrawal - the brought down field store what is brought down from DrugFinder, the Old fields
                                                                  store the withdrawal values before they were brought down from DrugFinder.

  16/10/18 [V5.8 R3.1] /MK Additional Feature - UpdateOwners - Added the field HerdRecLastSyncDate to the Owners table to store last sync date with AIM for startup prompt.

  05/11/18 [V5.8 R4.5] /MK Additional Feature - UpdateDeletedGrps - Added AutoInc ID, DateDeleted and IsSynchronized fields to DeletedGrps table.

  26/11/18 [V5.8 R5.5] /MK Bug Fix - UpdateReportsTable - During the while not eof loop OldCalfPerformanceID was being assigned to zero so
                                                          OldCalfPerformanceID would never be greater than zero, therefore the Calf Performance report
                                                          was always showing when it should been removed.

  04/12/18 [V5.8 R5.7] /MK Addiontal Feature - UpdateGenLookup - Added Pneumonia and Johnes to list of diseases - James Lowe/Rob Uglow request.

  21/01/19 [V5.8 R6.3] /MK Additional Feature - UpdateHealth - Added AreaTreated boolean fields 1 to 4 for Mastitis and Lameness block events - GL/SP.

  31/01/19 [V5.8 R6.5] /MK Additional Feature - UpdateHealth - Added new field TreatmentUsed for the Lameness event to record hoof pairing.
                                              - UpdateGenLook - Added in new genlook items for the Treatment Used.

  07/05/19 [V5.8 R9.2] /MK Change - UpdateParlourLink - Added MooMonitor field to ParlourLink.db.

  30/05/19 [V5.8 R9.3] /MK Additional Feature - Added new MedicineDisposal table and new DisposalID field to MediPur table.
                                              - Added new ListTypes to GenLook for LMediDiposalReasons.

  24/06/19 [V5.8 R9.6] /MK Additional Feature - Add IsSynchronized fields to MediPur and FdStkEvents tables.

  25/06/19 [V5.8 R9.6] /MK Additional Feature - Add EventSource field to MediPur table.

  16/08/19 [V5.9 R0.0] /MK Change - UpdateSires - As the sires table can be deleted by the backup, don't update it if it doesn't exist.

  23/08/19 [V5.9 R0.1] /MK Additional Feature - UpdateFilterdb - Add fields for filtering by Total SCC - GL request.

  08/11/19 [V5.9 R1.2] /MK Additional Feature - Added Source to MilkDisk.
                                              - Added SvrMilkTimeStamp and SvrICBAPITimeStamp to SyncDefaults.
                                              - Created the new ICBFAPIHerdHealth table.

  29/11/19 [V5.9 R1.4] /MK Additional Feature - UpdateAnimals - Added QANoMovements for QADays field that comes in the Mart XML file - GL/SP request.

  17/12/19 [V5.9 R1.5] /MK Additional Feature - New table, DNAResults, created to store the animals A1A2 dna result - Pat Ryan.

  19/12/19 [V5.9 R1.5] /MK Change - UpdateParlourLink - Added ImportFromParlour field to ParlourLink.db.

  17/01/20 [V5.9 R1.8] /MK Change - UpdateGroups - When adding the ModifiedOn and CreatedOn fields default date to today regardless of IsSynchronized.

  23/03/20 [V5.9 R3.5] /MK Additional Feature - New table, EventsExt, created to store events that were created on the server so we can store them if deleted - SP/GL request.

  01/07/20 [V5.9 R5.0] /MK Bug Fix - UpdateSyncDefaults - Problem checking for ClientGrpTimeStamp field which would stop other tables from updating after SyncDefaults.

  19/08/20 [V5.9 R5.5] /MK Additional Feature - UpdateSyncDefaults - Added the herdEvaluationModifiedOn for sync of EBI records from server.

  12/10/20 [V5.9 R6.3] /MK Bug Fix - Found that some of the update functions didn't have a starting result which caused reindex not to return result.

  27/10/20 [V5.9 R6.4] /MK Bug Fix - Found that the change I made above didn't suit some update routines so I had to make other changes.

  29/10/20 [V5.9 R6.6] /MK Additional Feature - AddVaccinationDiseaseCode - Added Mastitis to list of diseases - Kevin Maguire request.

  30/10/20 [V5.9 R6.7] /MK Bug - Any update/create functions to tables from UpdateDrugRegisterHeader on are not required so default Result to True.

  23/11/20 [V5.9 R7.5] /MK Additional Feature - UpdateGenLook - Add Sexed Semen service type if it can't be found already.

  02/12/20 [V5.9 R7.7] /MK Bug Fix - UpdateGenLook - Changed Foot to Hoof and fixed spelling misate of Paring - GL request.

  01/07/21 [V6.0 R1.5] /MK Additional Feature - UpdateAnimals - Added PenName field to store the Feed Group name even after the animal is sold - Kepak.
                                                              - Added sub procedure that will add the Feed Group name to the PenName for animals in the herd
                                                                after the field PenName is added to the table.

  03/08/21 [V6.0 R1.7] /MK Additional Feature - UpdateGenlook - Added Botulism to list of diseases - TGM request.
                           Change - UpdateSyncDefaults - Add MaxInUseBullCount if the field doesn't exist and default count to 60.
                                                       - If MaxInUseBullCount field exists and count is currently 20 then change to 60 - GL/SP/Adrian Thackleberry request.

  30/08/21 [V6.0 R2.1] /MK Additional Feature - Added DueToCalveDate and ExpectedBullCode to CowExt table.

  06/09/21 [V6.0 R2.2] /MK Additional Feature - UpdateAnimalsExt - Added the ACI field to the AnimalsExt table.
}

unit uUpdateTables;

interface

uses
   Classes, db, dbTables, GenTypesConst, SysUtils, Def,
   Dialogs, Password, Forms, kRoutines, FileCtrl, uApplicationLog;

   procedure Initialize; {}
   procedure Finalize;   {}

   function UpdateIndexes : Boolean;
   function UpdatePurchases : Boolean;
   function UpdateOwners : Boolean;
   function UpdateMPDelete : Boolean;
   function UpdateFeedsStk : Boolean;
   function UpdateFilterdb : Boolean;
   function UpdateMilkDiskLayout : Boolean;
   function UpdateHealth : Boolean;
   function UpdateFilterTable : Boolean;
   function UpdateAfdoa : Boolean;
   function UpdatepHrd : Boolean;
   function UpdatesHrd : Boolean;
   function BladeUpdate : Boolean;
   function UpdateCalvings : Boolean;
   { Set Milk Quota to Null where UpdateNo is less than 3.6 9.5 }
   function SetMilkQuotaFieldNull : Boolean;
   function UpdateFieldProps : Boolean;
   procedure CheckDatabaseTables(var UpdateSuccess : Boolean; VerNo : Integer);
   function FieldExists(FieldName : String) : Boolean;
   function CreateCrushTables : Boolean;
   function CreateMilkTankTables : Boolean;
   procedure CheckDefFile;
   procedure CheckGlobalSettings;
   function UpdateCrushTables : Boolean;
   function CreateDelCalvings : Boolean;
   procedure FixLactNoBug;
   function CreateNIBatchRegTables : Boolean;
   function UpdateSalesDeaths : Boolean;
   function UpdateGenLookup : Boolean;
   function UpdateCustomers : Boolean;
   function UpdateBlupPedigree : Boolean;
   function UpdatePurchGrpData : Boolean;
   function UpdateConditionScore : Boolean;
   function UpdateFeedRegime : Boolean;
   function UpdateFeedEvents : Boolean;
   function UpdateCowExt : Boolean;
   function UpdateBullExt : Boolean;
   function CreateNBASPermit : Boolean;
   function UpdateBreeds : Boolean;
   function UpdateMedicines : Boolean;
   function UpdateMediPurch : Boolean;
   function UpdateBullSemenStk : Boolean;
   function UpdateKingswd : Boolean;
   procedure ForceNotInherdAfterSaleDeath;
   function UpdateLUValuations : Boolean;
   function UpdateDefaults : Boolean;
   function UpdateHUKICalfReg : Boolean;
   function UpdateServices : Boolean;
   function UpdatePDefs : Boolean;
   function UpdateAnimals : Boolean;
   function UpdateSuppliersBreeders : Boolean;
   function UpdateGroups : Boolean;
   function UpdateDisbudding : Boolean;
   function UpdateMealFeeding : Boolean;
   function UpdateWeaning : Boolean;
   function UpdateFertilityPrograms : Boolean;
   function UpdateFertilityTreatments : Boolean;
   function UpdateFertilityProgramAdmin : Boolean;
   function UpdatePregDiag : Boolean;
   function UpdateCowFert : Boolean;
   function UpdateCTSTables : Boolean;
   function UpdateDefaultHealthEvents : Boolean;
   function UpdateBuyers : Boolean;
   function UpdateKingswoodMailBox : Boolean;
   function UpdateAnimalsExt : Boolean;
   function UpdateTagStore : Boolean;
//   function UpdateNewIDs : Boolean;
//   function UpdateBeefAISires : Boolean;
   function UpdateFertilityCheck : Boolean;
   function UpdateDeletedCalvings : Boolean;

   function FixHealthCostField : Boolean;
   function UpdateSires : Boolean;

   procedure Fix_NI_UK9_NatID;

   procedure SetupDirectoryStructure;
   procedure Fix_AnimalsSex;

   function CreateKilloutPerc : Boolean;
   function CreateMilkTemperament : Boolean;
   function CreateSyncDefaults : Boolean;
   function UpdateSyncDefaults : Boolean;

   function CreateJohnesResultTable : Boolean;

   //   28/03/12 [V5.0 R4.8] /MK Additional Feature - New Table To Store Reports.
   function CreateReportsTable : Boolean;
   //   14/05/12 [V5.0 R5.7] /MK Additional Feature - Add Report Generator Report Type.
   function UpdateReportsTable : Boolean;
   //   27/03/12 [V5.0 R4.5] /MK Change - Coded Out - Not In Use.
   //function CreateProfitMonitorTable : Boolean;

//   MK - coded out to fix Declan Morrissey problem - 27/05/08
//   function UpdateTmpPaddGrid : Boolean;

   function CreateAimRegistrationTable : Boolean;

   //   28/11/12 [V5.1 R3.3] /MK Additional Feature - Create new Target Weights table.
   function CreateTargetWeightsTable : Boolean;

   function UpdateEvents : Boolean;

   function UpdateMilkDisk : Boolean;

   function UpdateMilkDiskTrans : Boolean;
   
   function UpdateMedAdmin : Boolean;

   function CreateICBFDamEventTable : Boolean;
   function CreateICBFStockBullEventTable : Boolean;

   function CreateParlourLinkTable : Boolean;
   function UpdateParlourLink : Boolean;

   function CreateICBFCalfSurveyTable : Boolean;

   function CreateSyncWarnings : Boolean;
   function CreateAnimalCart : Boolean;

   function UpdateDrugRegisterHeader : Boolean;

   function UpdateDrugRegisterDetail : Boolean;

   function CreateMartEmailSuppliers : Boolean;
   function UpdateICBFDelete : Boolean;

   // SP 16/03/2016 - To facilitate syncing of Feed Types
   function UpdateFeedTypes : boolean;

   function UpdateICBFCalfSurvey : Boolean;

   function UpdateBullings : Boolean;

   function CreateDeletedGrps : Boolean;

   function UpdateDeletedGrps : Boolean;

   function CreateTransferredAnimals : Boolean;

   function CreateMedicineDiposal : Boolean;

   function CreateICBFAPIHerdHealth : Boolean;

   function CreateDNAResults : Boolean;

   function CreateEventsExt : Boolean;

const

   DefBeefAdminVerNo = 3655;
   UpdateBeefAdmin = 1;

   { Integrated Account System, Parlour Link, Ration Calc, Report Generator into definition file }
   DefAdditionalModules = 3674;
   UpdateAdditionalModules = 2;

   UpdatePDAFields = 3;
   DefPDAFieldsVerNo = 3687;

   PasswordEncryptTablesVerNo = 3704;


   { Set Milk Quota to Null where UpdateNo is less than 3.6 9.5 }
   { This needs to be done because the '04 the Suckler Premium Milk Quota }
   { is now in Litres instead of Gallons }
   SuckPremQuotaUpdateNo = 3695;

   PurchaseTableSupplierCostUpdate = 3952;

   AProtectedTables : array [1..13] of String =
                      ('animals.db', 'afdoa.db', 'purchases.db', 'salesdeaths.db', 'SuppliersBreeders.db',
                       'customers.db', 'breeds.db', 'genlook.db', 'movedto.db', 'movements.db', 'shrd.db',
                       'phrd.db', 'events.db');
var
   VersionNo : Integer;
   UpdateQuery : TQuery;
   UpdateTable : TTable;
   Buffer : TBuffer;

   ForceEBIColumnVisible : Boolean;


implementation
uses
   DairyData, kDbRoutines, BDE, uHerdLookup, SQLHelper, uIndexes;



procedure SetupDirectoryStructure;
begin
   // SP - As of 5.1.8.9 each herd number will have a dedicated directory for storing attachments
   // old structure ../Mail Attachment\ICBF
   //               ../Mail Attachment\Mart
   // new structure ../Mail Attachment\X1234567\ICBF
   //               ../Mail Attachment\X1234567\Mart

   ForceDirectories(AttachmentStore('')+'ICBF');
   ForceDirectories(AttachmentStore('')+'Mart');
   ForceDirectories(AttachmentStore('')+'Factory');
   ForceDirectories(AttachmentStore('')+'VetLink');
   ForceDirectories(AttachmentStore('')+'Cows365');
end;

procedure Initialize;
begin
   WinData.CreateTTable(UpdateTable, nil);
   WinData.CreateTQuery(UpdateQuery, nil, WinData.KingData.DatabaseName);
end;

procedure Finalize;
begin
   if UpdateTable <> nil then
      begin
         if UpdateTable.Active then
            UpdateTable.Active := False;
         UpdateTable.Free;
      end;
   if UpdateTable <> nil then
      begin
         if UpdateQuery.Active then
            UpdateQuery.Active := False;
         UpdateQuery.Free;
      end;
end;

procedure CheckDatabaseTables(var UpdateSuccess : Boolean; VerNo : Integer);
begin
   VersionNo := VerNo;
   Initialize;
   try
      FixHealthCostField;
      Fix_NI_UK9_NatID;
      SetupDirectoryStructure;
      if UpdateSuccess then UpdateSuccess := UpdateDefaults;
      if UpdateSuccess then UpdateSuccess := UpdateFieldProps;
      if UpdateSuccess then UpdateSuccess := UpdatePurchases;
      if UpdateSuccess then UpdateSuccess := UpdateOwners;
      if UpdateSuccess then UpdateSuccess := UpdateMPDelete;
      if UpdateSuccess then UpdateSuccess := UpdateHealth;
      if UpdateSuccess then UpdateSuccess := UpdateFilterdb;
      if UpdateSuccess then UpdateSuccess := UpdateIndexes;
      if UpdateSuccess then UpdateSuccess := UpdateFeedsStk;
      if UpdateSuccess then UpdateSuccess := UpdateMilkDiskLayout;
      if UpdateSuccess then UpdateSuccess := UpdateFilterTable;
      if UpdateSuccess then UpdateSuccess := UpdateAfdoa;
      if UpdateSuccess then UpdateSuccess := UpdatepHrd;
      if UpdateSuccess then UpdateSuccess := UpdatesHrd;
      if UpdateSuccess then UpdateSuccess := SetMilkQuotaFieldNull;
      if UpdateSuccess then UpdateSuccess := BladeUpdate;
      if UpdateSuccess then UpdateSuccess := UpdateCalvings;
      if UpdateSuccess then UpdateSuccess := CreateDelCalvings;
      if UpdateSuccess then UpdateSuccess := CreateNIBatchRegTables;
      if UpdateSuccess then UpdateSuccess := UpdateSalesDeaths;
      if UpdateSuccess then UpdateSuccess := UpdateGenLookup;
      if UpdateSuccess then UpdateSuccess := UpdateCustomers;
      if UpdateSuccess then UpdateSuccess := UpdateBlupPedigree;
      if UpdateSuccess then UpdateSuccess := UpdatePurchGrpData;
      if UpdateSuccess then UpdateSuccess := UpdateConditionScore;
      if UpdateSuccess then UpdateSuccess := UpdateFeedRegime;
      if UpdateSuccess then UpdateSuccess := UpdateFeedEvents;
      if UpdateSuccess then UpdateSuccess := UpdateCowExt;
      if UpdateSuccess then UpdateSuccess := UpdateBullExt;
      if UpdateSuccess then UpdateSuccess := CreateNBASPermit;
      if UpdateSuccess then UpdateSuccess := UpdateBreeds;
      if UpdateSuccess then UpdateSuccess := UpdateMedicines;
      if UpdateSuccess then UpdateSuccess := UpdateMediPurch;
      if UpdateSuccess then UpdateSuccess := UpdateBullSemenStk;
      if UpdateSuccess then UpdateSuccess := UpdateLUValuations;
      if UpdateSuccess then UpdateSuccess := UpdateHUKICalfReg;
      if UpdateSuccess then UpdateSuccess := UpdateServices;
      if UpdateSuccess then UpdateSuccess := UpdatePDefs;
      if UpdateSuccess then UpdateSuccess := UpdateAnimals;
      if UpdateSuccess then UpdateSuccess := UpdateSuppliersBreeders;
      if UpdateSuccess then UpdateSuccess := UpdateGroups;
      if UpdateSuccess then UpdateSuccess := UpdateDisbudding;
      if UpdateSuccess then UpdateSuccess := UpdateMealFeeding;
      if UpdateSuccess then UpdateSuccess := UpdateWeaning;
      if UpdateSuccess then UpdateSuccess := UpdateFertilityPrograms;
      if UpdateSuccess then UpdateSuccess := UpdateFertilityTreatments;
      if UpdateSuccess then UpdateSuccess := UpdateFertilityProgramAdmin;
      if UpdateSuccess then UpdateSuccess := UpdateCowFert;
      if UpdateSuccess then UpdateSuccess := UpdateCTSTables;
      if UpdateSuccess then UpdateSuccess := UpdateDefaultHealthEvents;
      if UpdateSuccess then UpdateSuccess := UpdateBuyers;
      if UpdateSuccess then UpdateSuccess := UpdateKingswoodMailBox;
      if UpdateSuccess then UpdateSuccess := UpdateAnimalsExt;
      if UpdateSuccess then UpdateSuccess := UpdateSires;
      if UpdateSuccess then UpdateSuccess := UpdateTagStore;
      if UpdateSuccess then UpdateSuccess := UpdateFertilityCheck;
      if UpdateSuccess then UpdateSuccess := CreateKilloutPerc;
      if UpdateSuccess then UpdateSuccess := CreateMilkTemperament;
      //   18/10/11 [V5.0 R1.5] /MK Additional Feature - Added UpdatePregDiag Back Into CheckDatabaseTables.
      if UpdateSuccess then UpdateSuccess := UpdatePregDiag;
      //   21/12/11 [V5.0 R2.9] /MK Additional Feature - New Table To Store Johnes Results.
      if UpdateSuccess then UpdateSuccess := CreateJohnesResultTable;
      //   28/03/12 [V5.0 R4.8] /MK Additional Feature - New Table To Store Reports.
      if UpdateSuccess then UpdateSuccess := CreateReportsTable;
      //   15/05/12 [V5.0 R5.7] /MK Additional Feature - Update Of The Reports Table For ReportGen Types.
      if UpdateSuccess then UpdateSuccess := UpdateReportsTable;

      if UpdateSuccess then UpdateSuccess := CreateSyncDefaults;
      if UpdateSuccess then UpdateSuccess := UpdateSyncDefaults;

      if UpdateSuccess then UpdateSuccess := CreateAimRegistrationTable;

      if UpdateSuccess then UpdateSuccess := CreateParlourLinkTable;
      if UpdateSuccess then UpdateSuccess := UpdateParlourLink;

      if UpdateSuccess then UpdateSuccess := UpdateEvents;

      if UpdateSuccess then UpdateSuccess := CreateTargetWeightsTable;
      if UpdateSuccess then UpdateSuccess := UpdateMilkDisk;
      if UpdateSuccess then UpdateSuccess := UpdateMilkDiskTrans;
      if UpdateSuccess then UpdateSuccess := UpdateMedAdmin;

      if UpdateSuccess then UpdateSuccess := CreateICBFDamEventTable;
      if UpdateSuccess then UpdateSuccess := CreateICBFStockBullEventTable;

      if UpdateSuccess then UpdateSuccess := CreateICBFCalfSurveyTable;
      if UpdateSuccess then UpdateSuccess := CreateSyncWarnings;
      if UpdateSuccess then UpdateSuccess := CreateAnimalCart;

      if UpdateSuccess then UpdateSuccess := UpdateDrugRegisterHeader;

      if UpdateSuccess then UpdateSuccess := UpdateDrugRegisterDetail;

      //   21/04/15 [V5.4 R4.9] /MK Additional Feature - Create new MartEmailSuppliers TTable.
      if UpdateSuccess then UpdateSuccess := CreateMartEmailSuppliers;

      if UpdateSuccess then UpdateSuccess := UpdateDeletedCalvings;

      //   15/03/12 [V5.0 R4.5] /MK Additional Feature - New Table, ProfitMonitor, Created.
      //   27/03/12 [V5.0 R4.5] /MK Change - Coded Out - Not In Use.
      //   if UpdateSuccess then UpdateSuccess := CreateProfitMonitorTable;

//      if UpdateSuccess then UpdateSuccess := UpdateNewIDs;

//      MK - coded out to fix Declan Morrissey problem - 27/05/08
//      if UpdateSuccess then UpdateSuccess := UpdateTmpPaddGrid;;

      if UpdateSuccess then UpdateSuccess := UpdateFeedTypes;

      if UpdateSuccess then UpdateSuccess := UpdateICBFCalfSurvey;

      if UpdateSuccess then UpdateSuccess := UpdateBullings;

      if UpdateSuccess then UpdateSuccess := CreateDeletedGrps;

      if UpdateSuccess then UpdateSuccess := UpdateDeletedGrps;

      if UpdateSuccess then UpdateSuccess := CreateTransferredAnimals;

      if UpdateSuccess then UpdateSuccess := CreateMedicineDiposal;

      if UpdateSuccess then UpdateSuccess := CreateICBFAPIHerdHealth;

      if UpdateSuccess then UpdateSuccess := CreateDNAResults;

      if UpdateSuccess then UpdateSuccess := CreateEventsExt;

      UpdateICBFDelete();

      if ( VerNo = 3720 ) or ( VerNo = 3721 ) then
         FixLactNoBug;

      if (VerNo < 3591) then
         WinData.DisplayNews := True;

      if (VerNo < 3952) then
         begin
            DeleteFile(IncludeTrailingBackslash( WinData.KingData.Directory ) + 'martpurchgrid.ini');
            DeleteFile(IncludeTrailingBackslash( WinData.KingData.Directory ) + 'martsalegrid.ini');
         end;

      CheckDefFile;
      CheckGlobalSettings;

      ForceEBIColumnVisible := ( VerNo < 3783 );
      if ( VerNo < 3783 ) then
         DeleteFile(IncludeTrailingBackslash( WinData.KingData.Directory ) + cGridColLayoutFile);

      if ( VerNo < 3910 ) then
         DeleteFile(IncludeTrailingBackslash( WinData.KingData.Directory ) + cGridColLayoutFile);

      if ( VerNo < iHerdVerNo ) then
         ReIndexAll(false);

      ForceNotInherdAfterSaleDeath;
      
      Fix_AnimalsSex;
   finally
      Finalize;
   end;
end;

function FixHealthCostField : Boolean;
var
   QuantityUsed,
   PurchUnit,
   UnitUsed   : Double;

   Units : TTable;
   Medicine: TTable;
begin
   {
   Units := TTable.Create(nil);
   Units.DatabaseName := AliasName;
   Units.TableName := 'units';
   Units.Open;

   Medicine := TTable.Create(nil);
   Medicine.DatabaseName := AliasName;
   Medicine.TableName := 'medicines';
   Medicine.Open;


   with TQuery.Create(nil) do
      try
         DatabaseName :=
         SQL.Clear;
         SQL.Add('');
         Open;
         try
            First;

            while not eof do
               begin
                  if Medicine.Locate('ID',FieldByName('DrugUsed').AsInteger,[]) then
                     if Units.Locate('ID', Medicine.FieldByName('DoseUnit').Value,[]) then
                        begin
                           UnitUsed := Units.FieldByName('Multiplier').AsFloat;
                           if Units.Locate('ID', WinData.Medicine.FieldByName('PurchUnit').Value,[]) then
                              begin
                                 PurchUnit := WinData.Units.FieldByName('Multiplier').AsFloat;
                                 QuantityUsed := ( UnitUsed * ThisRateOfApplic );
                                 if ( PurchUnit <> 0 ) then
                                    Result := QunatityUsed * ( WinData.Medicine.FieldByName('CostPurchUnit').AsFloat / PurchUnit );
                              end;
                        end;

                  Next;
               end;


         finally
            Close;
         end;
      finally
         Free;
      end;
    }

end;

procedure Fix_NI_UK9_NatID;
var
   NatIDNum : string;
   TableUpdated : Boolean;
begin
   TableUpdated := False;
   { if UK9 tag detected, insert space in position 3}
   UpdateTable.TableName := 'Animals.db';
   UpdateTable.Active := True;
   with UpdateTable do
   try
      First;
      while ( not(Eof) ) do
         begin
            NatIDNum := Trim(FieldByName('NatIDNum').AsString);
            if ( Copy(NatIDNum, 1, 3) = 'UK9' ) then
               begin
                  if ( Length(NatIDNum) < 20 ) then
                     begin
                        System.Insert(' ', NatIDNum, 3);
                        Edit;
                        FieldByName('NatIDNum').AsString := NatIDNum;
                        Post;
                        if ( not(TableUpdated) ) then
                           TableUpdated := True;
                     end;
               end;
            Next;
         end;
   finally
      if ( TableUpdated ) then
         DbiSaveChanges(UpdateTable.Handle);
      Active := False;
   end;
end;

procedure Fix_AnimalsSex;
begin
   with UpdateQuery do
      begin
         // 04/02/2009 [Rel V3.9 R4.9, Dev V3.9 R5.9] /SP Additional Feature - Animals.Sex fix, change STEER to Steer
         SQL.Clear;
         SQL.Add('UPDATE Animals SET Sex="Steer" WHERE Sex="STEER"');
         ExecSQL;
      end;
end;

function FieldExists(FieldName : String) : Boolean;
begin
   Result := False;
   try
      try
         UpdateTable.Active := True;
         Result := UpdateTable.FieldDefs.IndexOf(FieldName) > -1; // Make sure the field doesn't exist
      except
      end;
   finally
      UpdateTable.Active := False;
   end;
end;

function UpdateCTSTables : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'CTSRequest';
   with UpdateTable do
      try
         if not Exists then
            begin
               with FieldDefs do
                  begin
                     Clear;
                     FieldDefs.Add('ID',ftAutoInc,0, False);
                     FieldDefs.Add('RequestType',ftInteger);
                     FieldDefs.Add('RequestDate',ftDateTime);
                     FieldDefs.Add('CTSBatchID',ftInteger,0, False);
                     FieldDefs.Add('AnimalID',ftInteger,0, False);
                     FieldDefs.Add('RequestTimeStamp',ftString,30, False);
                     FieldDefs.Add('TxnId',ftString,40, False);
                     FieldDefs.Add('RowNum',ftInteger);
                     FieldDefs.Add('Warnings',ftBoolean);
                     FieldDefs.Add('ReceiptNum',ftInteger);
                     FieldDefs.Add('Registered',ftBoolean);
                  end;

               with IndexDefs do
                  begin
                     Clear;
                     Add('iID','ID',[ixUnique, ixPrimary]);
                     Add('iRequestType','RequestType',[ixCaseInsensitive]);
                     Add('iRequestDate','RequestDate',[ixCaseInsensitive]);
                     Add('iCTSBatchID','CTSBatchID',[ixCaseInsensitive]);
                     Add('iAnimalID','AnimalID',[ixCaseInsensitive]);
                     Add('iRegistered','Registered',[ixCaseInsensitive]);
                     Add('iTxnId','TxnId',[ixCaseInsensitive]);
                     Add('iReceiptNum','ReceiptNum',[ixCaseInsensitive]);

                  end;
               CreateTable;
         end;
      except
         Result := False;
      end;

   if Result then
      begin
         UpdateTable.TableName := 'CTSRejected';
         with UpdateTable do
            try
               if not Exists then
                  begin
                     with FieldDefs do
                        begin
                           Clear;
                           FieldDefs.Add('ID',ftAutoInc,0, False);
                           FieldDefs.Add('CTSBatchID',ftInteger,0, False);
                           FieldDefs.Add('RejectDate',ftDateTime,0, False);
                           FieldDefs.Add('AnimalID',ftInteger,0, False);
                           FieldDefs.Add('TxnId',ftString,40, False);
                           FieldDefs.Add('RCode',ftString,8, False);
                           FieldDefs.Add('RDesc',ftString,200, False);
                           FieldDefs.Add('RSev',ftString,200, False);
                           FieldDefs.Add('RField',ftString,20, False);
                           FieldDefs.Add('RejectType',ftInteger);
                        end;

                     with IndexDefs do
                        begin
                           Clear;
                           Add('iID','ID',[ixUnique, ixPrimary]);
                           Add('iCTSBatchID','CTSBatchID',[ixCaseInsensitive]);
                           Add('iAnimalID','AnimalID',[ixCaseInsensitive]);
                           Add('iTxnId','TxnId',[ixCaseInsensitive]);
                           Add('iRejectType','RejectType',[ixCaseInsensitive]);
                           Add('iRejectDate','RejectDate',[ixCaseInsensitive]);
                        end;
                     CreateTable;
               end;
            except
               Result := False;
            end;
      end;

   if Result then
      begin
         UpdateTable.TableName := 'CTSExceptions';
         with UpdateTable do
            try
               if not Exists then
                  begin
                     with FieldDefs do
                        begin
                           Clear;
                           FieldDefs.Add('ID',ftAutoInc);
                           FieldDefs.Add('XMLType',ftString,40);
                           FieldDefs.Add('TxnId',ftString,40);
                           FieldDefs.Add('ExDate',ftDateTime,);
                           FieldDefs.Add('ExNum',ftString,10, False);
                           FieldDefs.Add('ExMsg',ftMemo,2000, False);
                        end;

                     with IndexDefs do
                        begin
                           Clear;
                           Add('iID','ID',[ixUnique, ixPrimary]);
                           Add('iTxnId','TxnId',[ixCaseInsensitive]);
                        end;
                     CreateTable;
               end;
            except
               Result := False;
            end;
      end;

end;

function UpdateOwners : Boolean;
var
   UpdateFieldType : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'Owners';
   if not FieldExists('FQAS') then // Make sure the field doesn't exist
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add FQAS BOOLEAN');
            Prepare;
            ExecSQL;
         except
            Result := False;
            Exit;
         end;

   if not FieldExists('ForageAreaHa') then // Make sure the field doesn't exist
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ForageAreaHa FLOAT');
            Prepare;
            ExecSQL;

            UpdateTable.Active := True;
            try
               with TTable.Create(nil) do
                try
                   DatabaseName := AliasName;
                   TableName := 'Ext001';
                   Active := True;

                   First;
                   while not eof do
                      begin
                         if UpdateTable.Locate('ID', FieldByName('HerdID').AsInteger, []) then
                            begin
                               UpdateTable.Edit;
                               UpdateTable.FieldByName('ForageAreaHa').AsFloat := FieldByName('ForageAreaHa').AsFloat;
                               UpdateTable.Post;
                            end;
                         Next;
                      end;
               finally
                  Close;
                  Free;
               end;
             finally
                UpdateTable.Active := False;
             end;
         except
            Result := False;
            Exit;
         end;

   if not FieldExists('Species') then
      with UpdateQuery do
      try
         SQL.Clear;
         SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Species Integer');
         Prepare;
         ExecSQL;
      except
         on e : exception do
            begin
               Showmessage(e.Message);
               Result := False;
               Exit;
            end;
      end;

   if not FieldExists('BLoc') then
      with UpdateQuery do
      try
         SQL.Clear;
         SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BLoc Char(11),');
         SQL.Add('                                        Add BSLoc Char(2), Add PLoc Char(11), Add PSLoc Char(2), Add Loc Char(11), Add SLoc Char(2), Add MHSId Char(11), ');
         SQL.Add('                                        Add CTSBatchID Integer  ');
         Prepare;
         ExecSQL;
      except
         on e : exception do
            begin
               Showmessage(e.Message);
               Result := False;
               Exit;
            end;
      end;

   if not FieldExists('Organic') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add Organic BOOLEAN ');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set Organic = FALSE ');
               ExecSQL;
            end;
      end;

   if not FieldExists('NatIDNumInputStyle') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add NatIDNumInputStyle Integer ');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add NextNatID INTEGER ');
               ExecSQL;
            end;
      end;

   if not FieldExists('ICBFExportDate') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add ICBFExportDate DATE ');
               ExecSQL;
            end;
      end;

   if not FieldExists('NatIDLeadZero') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add NatIDLeadZero BOOLEAN ');
               ExecSQL;
            end;
      end;

   //   21/02/11 [V4.0 R8.4] /MK Additional Feature - Added New Filed For UK Milk Recorder.
   if not FieldExists('UKMilkRecorder') then // Make sure the field doesn't exist
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add UKMilkRecorder Char(5)');
            Prepare;
            ExecSQL;
         except
            Result := False;
            Exit;
         end;

   // 17/07/2014 SP
   if not FieldExists('LastSyncDate') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add LastSyncDate CHAR(14)');
            Prepare;
            ExecSQL;
         except
            Result := False;
            Exit;
         end;

   if ( not(FieldExists('TagPrefix')) ) then
      begin
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add TagPrefix CHAR(3)');
               Prepare;
               ExecSQL;

               //   30/01/17 [V5.6 R4.2] /MK Bug Fix - SP is using this field regardless of Country so I am to only default to IE if country is Ireland.
               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET TagPrefix = "'+cTagPreFix_IE+'" WHERE Country=1');
               Prepare;
               ExecSQL;
            except
               Result := False;
               Exit;
            end;
      end
   else
      begin
         with UpdateTable do
            try
               Active := True;

               First;
               while not eof do
                  begin
                     if ( FieldByName('Country').AsInteger <> 1 ) and ( FieldByName('TagPrefix').AsString = cTagPreFix_IE ) then
                        begin
                           Edit;
                           try
                              FieldByName('TagPrefix').AsString := '';
                              Post;
                              DbiSaveChanges(UpdateTable.Handle);
                           except
                           end;
                        end;
                     Next;
                  end;
            finally
               Active := False;
            end;
      end;

   if ( not(FieldExists('IsSynchronized')) ) then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add IsSynchronized BOOLEAN');
            Prepare;
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET IsSynchronized = False');
            Prepare;
            ExecSQL;
         except
            Result := False;
            Exit;
         end;

   if ( not(FieldExists('SwitchedTagDesignator')) ) then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add SwitchedTagDesignator INTEGER');
            Prepare;
            ExecSQL;
         except
            on e : Exception do
               begin
                  ShowMessage(e.Message);
                  Result := False;
                  Exit;
               end;
         end;

   //   06/10/17 [V5.7 R3.7] /MK Additional Feature - Added new field for the new NI Rollover Tag requirement.
   if not FieldExists('NIRolloverHerd') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add NIRolloverHerd BOOLEAN ');
            ExecSQL;
         except
            on e : Exception do
               begin
                  Result := False;
                  Exit;
               end;
         end;

   if ( not(FieldExists('HerdRecLastSyncDate')) ) then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add HerdRecLastSyncDate Date ');
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET HerdRecLastSyncDate = "'+FormatDate(Date-30,dsUS)+'" ');
            ExecSQL;
         except
            on e : Exception do
               begin
                  Result := False;
                  Exit;
               end;
         end;
end;

function UpdatePurchases: Boolean;
begin

   Result := True;
   try
      UpdateTable.TableName := 'Purchases';


      if not FieldExists('LotNumber') then // Make sure the field doesn't exist
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add LotNumber Char(10) ');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('FQAS') then // Make sure the field doesn't exist
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add FQAS BOOLEAN');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('CTSReg') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add CTSReg Boolean ');
               Prepare;
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET CTSReg = TRUE');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('FQASDays') then // Make sure the field doesn't exist
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add FQASDays Integer');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('Haulage') then // Make sure the field doesn't exist
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Haulage Float');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" Set Haulage=0');
               ExecSQL;
            end;

      if not FieldExists('Commission') then // Make sure the field doesn't exist
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Commission Float');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" Set Commission=0');
               ExecSQL;
            end;

       if VersionNo < PurchaseTableSupplierCostUpdate then
          begin

             // Do special update of purchase table. Set SupplierCosts = Haulage+Commission
             //
             with UpdateQuery do
                begin
                   SQL.Clear;
                   SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET SUPPLIERCOSTS = (COMMISSION+HAULAGE)');
                   SQL.Add('WHERE ((COMMISSION>0) OR (HAULAGE>0))');
                   SQL.Add('AND ((SUPPLIERCOSTS<=0) OR (SUPPLIERCOSTS IS NULL))');
                   ExecSQL;

                   SQL.Clear;
                   SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET SUPPLIERCOSTS = (SUPPLIERCOSTS+BUYERCOSTS), BUYERCOSTS = 0');
                   SQL.Add('WHERE ((SUPPLIERCOSTS>0) OR (SUPPLIERCOSTS>0))');
                   SQL.Add('AND (((COMMISSION<=0) OR (COMMISSION IS NULL))');
                   SQL.Add('AND ((HAULAGE<=0) OR (HAULAGE IS NULL)))');
                   ExecSQL;
                end;
          end;
   except
      on e : Exception do
        begin
           Result := False;
           MessageDlg(E.Message,mtError,[mbOK],0);
        end;
   end;

end;

function UpdateMPDelete : Boolean;
begin
   UpdateTable.TableName := 'MPDelete';
   Result := ( FieldExists('ECategory') );
   if ( not(Result) ) then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ECategory Char(6)');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end;
end;

function UpdateFieldProps : Boolean;
begin
   Result := False;
   try

      if VersionNo < 3655 then
         begin
            { SP 17/03/2003 - Change Animal.HerdBookNo Size from Char 15 to char 20 }
            ResizeField('Animals', 'HerdBookNo', 20);
         end;
      ResizeField('Animals', 'TransponderNo', 20);
      Result := True;
   except
   end
end;

function UpdateFilterdb : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'flt';
   if not FieldExists('StockDate') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add StockDate Date,  ');
            SQL.Add('                                        Add ShowStock Boolean');
            ExecSQL;
         except
            Result := False;
         end;

   if not FieldExists('ToBeCulled') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ToBeCulled Boolean');
            ExecSQL;
         except
            Result := False;
         end;

   if not FieldExists('NoOfMonths') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NoOfMonths Char(5)');
            ExecSQL;
         except
            Result := False;
         end;

   if not FieldExists('AgeMonthsSelected') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add AgeMonthsSelected Integer');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('CondScoreFrom') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add CondScoreFrom Float');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('CondScoreTo') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add CondScoreTo Float');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('CondScoreFilter') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add CondScoreFilter Boolean');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('EBIFrom') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add EBIFrom Float');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('EBITo') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add EBITo Float');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('EBIFilter') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add EBIFilter Boolean');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('MilkYieldFrom') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add MilkYieldFrom Float');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('MilkYieldTo') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add MilkYieldTo Float');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   if not FieldExists('MilkYieldFilter') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add MilkYieldFilter Boolean');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   //   22/01/13 [V5.1 R3.9] /MK Additional Feature - UpdateFilterdb - Added RatCalcMilkYieldFilter boolean.
   if not FieldExists('RatCalcMilkYieldFilter') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add RatCalcMilkYieldFilter Boolean');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   //   28/06/13 [V5.1 R8.0] /MK Additional Feature - UpdateFilterdb - Added FilterTableServedCount Integer field.
   if not FieldExists('ServedCount') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ServedCount Integer');
            ExecSQL;
         except
            on e : exception do
              showmessage(e.Message); //Result := False;
         end;

   //   19/05/14 [V5.3 R1.4] /MK Additional Feature - Added NoOfMonthsTo field
   if not FieldExists('NoOfMonthsTo') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NoOfMonthsTo Char(5)');
            ExecSQL;
         except
            Result := False;
         end;

   //   25/11/14 [V5.4 R0.0] /MK Additional Feature - Added Vaccination field to Flt table.
   if not FieldExists('Vaccination') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Vaccination BOOLEAN');
            ExecSQL;
         except
            Result := False;
         end;

   //   01/12/14 [V5.4 R0.2] /MK Additional Feature - Add new fields (DaysOnFarmFilterSelected, DaysOnFarmFrom, DaysOnFarmTo) for filter of DaysOnFarm.
   if not FieldExists('DaysOnFarmFilterSelected') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add DaysOnFarmFilterSelected INTEGER');
            ExecSQL;
         except
            Result := False;
         end;
   if not FieldExists('DaysOnFarmFrom') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add DaysOnFarmFrom INTEGER');
            ExecSQL;
         except
            Result := False;
         end;
   if not FieldExists('DaysOnFarmTo') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add DaysOnFarmTo INTEGER');
            ExecSQL;
         except
            Result := False;
         end;

   if not FieldExists('OverallGainPerDayFrom') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add OverallGainPerDayFilter Boolean');
            ExecSQL;

            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add OverallGainPerDayFrom FLOAT');
            ExecSQL;

            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add OverallGainPerDayTo FLOAT');
            ExecSQL;
         except
            Result := False;
         end;

   if not FieldExists('SCCFrom') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add SCCFrom Float');
            ExecSQL;

            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add SCCTo Float');
            ExecSQL;

            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add SCCFilter Boolean');
            ExecSQL;
         except
            Result := False;
         end;

   if ( not(FieldExists('A1A2Result')) ) then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" ADD A1A2Result CHAR(5)');
            ExecSQL;
         except
            Result := False;
         end;
end;

function UpdateMilkDiskLayout : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'MilkDiskLayout';
   if not FieldExists('CumLactPos') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add CumLactPos Integer,  ');
            SQL.Add('                                        Add CumLactLen Integer');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end
   else
      Result := True;
end;

function UpdateMilkDisk : Boolean;
begin
   Result := False;

   UpdateTable.TableName := 'MilkDisk';

   if ( not(UpdateTable.Exists) ) then
      begin
         Result := True;
         Exit;
      end;

   with UpdateQuery do
      try
         if not FieldExists('IsSynchronized') then
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add IsSynchronized BOOLEAN');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET IsSynchronized = FALSE');
               ExecSQL;
            end;

         if not FieldExists('Source') then
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Source Integer  ');
               Prepare;
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET Source = 1 ');
               Prepare;
               ExecSQL;
            end;
         Result := True;
      except
      end;
end;

function UpdateMilkDiskTrans : Boolean;
begin
   Result := False;

   UpdateTable.TableName := 'MilkDiskTrans';

   if ( not(UpdateTable.Exists) ) then
      begin
         Result := True;
         Exit;
      end;

   with UpdateQuery do
      try
         if not FieldExists('Source') then
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Source Integer  ');
               Prepare;
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET Source = 1 ');
               Prepare;
               ExecSQL;
            end;
         Result := True;
      except
      end;
end;

function UpdateMedAdmin : Boolean;
var
   iVetAdminArray : array of Integer;
begin
   Result := True;

   UpdateTable.TableName := 'MedAdmin';
   if not FieldExists('IsSynchronized') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add IsSynchronized BOOLEAN');
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET IsSynchronized = FALSE');
            ExecSQL;
         except
            Result := False;
         end;

      if not FieldExists('InUse') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD InUse Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set InUse = TRUE ');
               ExecSQL;
            except
               Result := False;
            end;

      if not FieldExists('IsVet') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD IsVet Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE '+UpdateTable.TableName+' Set IsVet = FALSE');
               ExecSQL;

               SQL.Clear;
               SQL.Add('SELECT ID, M."Position", M.AdminCode, M.Name');
               SQL.Add('FROM MedAdmin M');
               Open;
               if ( RecordCount > 0 ) then
                  begin
                     SetLength(iVetAdminArray,0);
                     First;
                     while ( not(Eof) ) do
                        begin
                           if ( Pos('VET',UpperCase(Fields[1].AsString)) > 0 ) or
                              ( Pos('VET',UpperCase(Fields[2].AsString)) > 0 ) or
                              ( Pos('VET',UpperCase(Fields[3].AsString)) > 0 ) then
                              begin
                                 SetLength(iVetAdminArray,Length(iVetAdminArray)+1);
                                 iVetAdminArray[Length(iVetAdminArray)-1] := Fields[0].AsInteger;
                              end;
                           Next;
                        end;
                        if ( Length(iVetAdminArray) > 0 ) then
                            begin
                               SQL.Clear;
                               SQL.Add('UPDATE '+UpdateTable.TableName+' Set IsVet = TRUE');
                               SQL.Add('WHERE ID IN '+IntArrayToSQLInString(iVetAdminArray)+'');
                               ExecSQL;
                            end;
                  end;
            except
               Result := False;
            end;
end;

function UpdateEvents : Boolean;
var
   iLastParlourEventID : Integer;
begin
   Result := True;

   UpdateTable.TableName := 'Events';
   if not FieldExists('IsSynchronized') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add IsSynchronized Boolean  ');
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET IsSynchronized = False ');
            ExecSQL;
         except
            Result := False;
         end;

   //   11/09/15 [V5.4 R8.5] /MK Additional Feature - Added modified field to the events table to be used with HerdSync - SP request.
   if not FieldExists('Modified') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Modified Boolean  ');
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET Modified = False ');
            ExecSQL;
         except
            Result := False;
         end;

   //   30/10/15 [V5.4 R9.8] /MK Additional Feature - Added ParlourNotified field to the events table to be used with ParlourLink.
   if not FieldExists('ParlourNotified') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ParlourNotified Boolean  ');
            ExecSQL;

            iLastParlourEventID := 0;
            SQL.Clear;
            SQL.Add('SELECT LastParlourEvent');
            SQL.Add('FROM Parlourlink');
            try
               Open;
               if ( RecordCount > 0 ) then
                  if ( Fields[0].AsInteger > 0 ) then
                     iLastParlourEventID := Fields[0].AsInteger;
            except

            end;

            if ( iLastParlourEventID > 0 ) then
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET ParlourNotified = TRUE ');
                  SQL.Add('WHERE ID <= '+IntToStr(iLastParlourEventID)+'');
                  ExecSQL;
               end;
         except
            Result := False;
         end;
end;

function UpdateHealth : Boolean;
var
   SList : TStringList;

   procedure UpdateHealthDrugBatchNoField;
   var
      qDrugs : TQuery;
      bBatchNoUpdated : Boolean;
   begin
       qDrugs := TQuery.Create(nil);
       with qDrugs do
          try
             DatabaseName := AliasName;
             SQL.Clear;
             SQL.Add('SELECT UpdatedHeatlhDrugBatchNo FROM Defaults');
             Open;
             bBatchNoUpdated := Fields[0].AsBoolean;

             if ( not(bBatchNoUpdated) ) then
                try
                   SQL.Clear;
                   SQL.Add('SELECT Count(EventID) FROM Health');
                   SQL.Add('WHERE DrugBatchNo Is Null');
                   Open;
                   begin
                      First;
                      if ( Fields[0].AsInteger > 0 ) then
                         begin
                            SQL.Clear;
                            SQL.Add('UPDATE Health H');
                            SQL.Add('SET H.DrugBatchNo = (SELECT MP.BatchNo FROM MediPur MP');
                            SQL.Add('                     WHERE MP.ID = H.DrugPurchID)');
                            SQL.Add('WHERE H.DrugBatchNo Is Null');
                            ExecSQL;

                            SQL.Clear;
                            SQL.Add('UPDATE Defaults SET UpdatedHeatlhDrugBatchNo = True');
                            ExecSQL;
                         end;
                   end;
             finally
                Close;
             end;
          finally
             Free;
          end;
   end;

begin
   Result := True;
   UpdateTable.TableName := 'Health';

   try

   if not FieldExists('NoDays') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NoDays INTEGER,');
               SQL.Add('                                        Add NoTimes INTEGER');
               Prepare;
               ExecSQL;
             end
      end;

   if not FieldExists('FarmCode') then
      with UpdateQuery do
         begin
            { Add Farmcode to Health Table }
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add FarmCode Integer  ');
            Prepare;
            ExecSQL;

            UpdateTable.TableName := 'GenLook';
            UpdateTable.Open;
            UpdateTable.First;

            SList := TStringList.Create;
            with UpdateTable do
               begin
                  { Combined ICBF and Farm need to split in separate categories }
                  First;
                  while not eof do
                     begin
                        if ( UpdateTable.FieldByName('ListType').AsInteger = 13 ) then
                           begin
                              if (UPPERCASE(Copy(UpdateTable.FieldByName('Description').AsString, 1, 4 )) = 'ICBF') then
                                 begin
                                    {UpdateTable.Edit;
                                    UpdateTable.FieldByName('ListType').AsInteger := 21; // New ICBF ListType.
                                    UpdateTable.Post; }
                                    SList.Add(UpdateTable.FieldByName('ID').AsString);
                                 end;
                           end;
                        Next;
                     end;

                  { List of ICBF health codes have been stored to list }
                  Close;
                  TableName := 'Health';
                  Open;

                  { Loop through table, any record without icbf health code needs to be shifted to farmcode field. }
                  First;
                  while not eof do
                     begin
                        if UpdateTable.FieldByName('HealthCode').AsInteger > 0 then
                           if SList.IndexOf(IntToStr(UpdateTable.FieldByName('HealthCode').AsInteger)) <= -1 then
                              begin
                                 UpdateTable.Edit;
                                 UpdateTable.FieldByName('FarmCode').AsInteger := UpdateTable.FieldByName('HealthCode').AsInteger;
                                 UpdateTable.FieldByName('HealthCode').Clear;
                                 UpdateTable.Post;
                              end;
                        Next;
                     end;
                  Close;
               end;
            SList.Free;
         end;

    { Add "BladeDiagCode", "Temperature" to Events table. }
    if not FieldExists('BladeDiagCode') then
       with UpdateQuery do
          begin
             SQL.Clear;
             SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BladeDiagCode INTEGER, ');
             SQL.Add('                                        Add Temperature FLOAT     ');
 //          SQL.Add('                                        Add TreatmentID INTEGER,   ');
 //          SQL.Add('                                        Add Units ???,   ');
 //          SQL.Add('                                        Add Batch ???,   ');
             ExecSQL;
          end;

   if not FieldExists('ReportID') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ReportID INTEGER');
               Prepare;
               ExecSQL;
            end
      end;

   if not FieldExists('PDASync') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add PDASync BOOLEAN ');
               Prepare;
               ExecSQL;
            end;
      end;

   if not FieldExists('DetailedComment') then
   with UpdateQuery do
      begin
         SQL.Clear;
         SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add DetailedComment Blob(180)');
         Prepare;
         ExecSQL;

         if FieldExists('Comment') then
            begin
               with TTable.Create(nil) do
                 try
                    DatabaseName := AliasName;
                    TableName := 'Health';
                    Active := True;
                    try
                       First;
                       while not eof do
                          begin
                             if ( FieldByName('Comment').AsString <> '' ) then
                                begin
                                   Edit;
                                   try
                                      FieldByName('DetailedComment').AsString := FieldByName('Comment').AsString;
                                      Post;
                                   except
                                      Cancel;
                                   end;
                                end;
                             Next;
                          end;
                    finally
                       Active := False;
                    end;
                 finally
                    Free;
                 end;
            end;
      end;

   if FieldExists('Comment') then
      begin
         UpdateQuery.SQL.Clear;
         UpdateQuery.SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Drop Comment ');
         UpdateQuery.Prepare;
         UpdateQuery.ExecSQL;
      end;

   if not FieldExists('ReportInDays') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ReportInDays INTEGER');
               Prepare;
               ExecSQL;
             end
      end;

   //   01/02/12 [V5.0 R3.7] /MK Change - Added New DrugBatchNoField For Free Text Drug BatchNo In Health Event.
   if not FieldExists('DrugBatchNo') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add DrugBatchNo Char(30)');
               Prepare;
               ExecSQL;
               //   06/06/12 [V5.0 R6.0] /MK Bug Fix - Add All BatchNo's From DrugPurchTable To HealthTable If HealthBatchNo Is Null.
               UpdateHealthDrugBatchNoField;
             end
      end;

   //   06/06/12 [V5.0 R6.0] /MK Bug Fix - Add All BatchNo's From DrugPurchTable To HealthTable If HealthBatchNo Is Null.
   if FieldExists('DrugBatchNo') then
      UpdateHealthDrugBatchNoField;

   //   26/08/13 [V5.2 R0.2] /MK Change - Added ManualComment field to store if user entered comment manually.
   //                                     If comment changed manually then don't update the comment by medicine name or applic rate + applic type.
   if not FieldExists('ManualComment') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ManualComment BOOLEAN');
               Prepare;
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE Health SET ManualComment = True');
               Prepare;
               ExecSQL;
             end
      end;

   //   21/01/19 [V5.8 R6.3] /MK Additional Feature - Added AreaTreated boolean fields 1 to 4 for Mastitis and Lameness block events - GL/SP.
   if ( not(FieldExists('AreaTreated1')) ) then
      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('ALTER TABLE '+UpdateTable.TableName);
            SQL.Add('ADD AreaTreated1 BOOLEAN,');
            SQL.Add('ADD AreaTreated2 BOOLEAN,');
            SQL.Add('ADD AreaTreated3 BOOLEAN,');
            SQL.Add('ADD AreaTreated4 BOOLEAN');
            try
               ExecSQL;
            except
            end;
         end;

   //   31/01/19 [V5.8 R6.5] /MK Additional Feature - Added new field TreatmentUsed for the Lameness event to record hoof pairing.
   if ( not(FieldExists('TreatmentUsed')) ) then
      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('ALTER TABLE '+UpdateTable.TableName);
            SQL.Add('ADD TreatmentUsed INTEGER');
            try
               ExecSQL;
            except
            end;
         end;

   except
      Result := False;
   end;
end;

{ Def File ------------------------------------------------------------------- }

procedure WriteDef ( NewDef : TDef );
var
   NoWrites : Integer;
begin
   Seek( DefFile, 0 );
   Move(NewDef, Buffer, SizeOf ( NewDef ));
   BlockWrite(DefFile, Buffer, 1, NoWrites );
end;

procedure UpdateDef(UpdateWhat : Byte);
begin
   case UpdateWhat of
      UpdateBeefAdmin : Definition.dBeefAdmin := True;
      UpdateAdditionalModules : begin
                                   Definition.dUseRationCalc := FileExists('C:\Kingswood Herd Management\Ration.exe');
                                   Definition.dUseParlour    := FileExists('C:\Kingswood Herd Management\Parlink.exe');
                                end;
      UpdatePDAFields : begin
                           Def.Definition.dPDAFields := Def.Definition.dUsePhoneLink;
                        end;
   end;
   WriteDef(Definition);
end;

procedure CheckDefFile;
begin
   if VersionNo < DefBeefAdminVerNo then
      UpdateDef(UpdateBeefAdmin);
   if VersionNo < DefAdditionalModules then
      UpdateDef(UpdateAdditionalModules);
   if VersionNo < DefPDAFieldsVerNo then
      UpdateDef(UpdatePDAFields);
end;

function UpdateIndexes : Boolean;
begin
   UpdateTable.TableName := 'MilkDiskTrans';
   Result := ( VersionNo < 3657 );
   if ( not(Result) ) then
      begin
         UpdateTable.AddIndex('iAIDLactNo', 'AnimalID;LactNo', [ixCaseInsensitive] );
         Result := True
      end
end;

function UpdateFeedsStk : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'FdStkEvents.db';
      if not FieldExists('Comment') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Comment Char(150) ');
               Prepare;
               ExecSQL;
               Result := True;
            end;

      if not FieldExists('ExpiryDate') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ExpiryDate Date ');
               Prepare;
               ExecSQL;
               Result := True;
            end;

      if not FieldExists('EventSource') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add EventSource INTEGER ');
               Prepare;
               ExecSQL;
               Result := True;
            end;

      if not FieldExists('IsSynchronized') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add IsSynchronized BOOLEAN ');
               Prepare;
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATe "'+UpdateTable.TableName+'" SET IsSynchronized = FALSE ');
               Prepare;
               ExecSQL;

               Result := True;
            end;
   except
      Result := False;
   end;
end;

function UpdateFilterTable : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'flt.db';
   if not FieldExists('BornIntoHerd') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BornIntoHerd Boolean ');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end
   else
      Result := True;

   if not FieldExists('IncAllLactations') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add IncAllLactations Boolean ');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end
   else
      Result := True;
end;

{ End Def File --------------------------------------------------------------- }

{ Crush file Tables - IAD }
function CreateCrushTables : Boolean;
begin
   Initialize;
   try
      UpdateTable.TableName := 'CrushDisk.db';
      if not UpdateTable.Exists then
         try
            with UpdateTable do
               begin
                  with FieldDefs do
                     begin
                        Clear;
                        Add('ID', ftInteger, 0, False);
                        Add('GroupID', ftInteger, 0, False);
                        Add('ReadDate', ftDate, 0, False);
                        Add('PurchWgtFile', ftBoolean, 0, False);
                        Add('CrushDataType', ftInteger);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iID', 'ID', [ixUnique, ixPrimary]);
                        Add('iGroupID', 'GroupID', [ixCaseInsensitive]);
                        Add('iReadDate', 'ReadDate', [ixCaseInsensitive]);
                     end;
                  CreateTable;
               end;
         except
            on E : Exception do
               MessageDlg('Unable to create crush tables, contact Kingswood',mtError,[mbOK],0);
         end;

      UpdateTable.TableName := 'CrushDiskTrans.db';
      if not UpdateTable.Exists then
         try
            with UpdateTable do
               begin
                  with FieldDefs do
                     begin
                        Clear;
                        Add('ID', ftAutoInc, 0, False);
                        Add('DiskID', ftInteger, 0, False);
                        Add('AnimalTag', ftString, 20, False);
                        Add('AnimalNum', ftString, 10, False);
                        Add('AnimalWgt', ftFloat, 0, False);
                        Add('WeighingDate', ftDate, 0, False);
                        Add('HasCard', ftBoolean, 0, False);
                        Add('CrushDataType', ftInteger);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iID', 'ID', [ixUnique, ixPrimary]);
                        Add('iDiskID', 'DiskID',  [ixCaseInsensitive]);
                     end;
                  CreateTable;
               end;
         except
            on E : Exception do
               MessageDlg('Unable to create crush tables, contact Kingswood',mtError,[mbOK],0);
         end
      else if not FieldExists('CrushDataType') then
         begin
            with UpdateQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE CrushDisk Add CrushDataType INTEGER');
                  Prepare;
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE CrushDisk SET CrushDataType = 0'); // Purchase DataType
                  Prepare;
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('ALTER TABLE CrushDiskTrans Add CrushDataType INTEGER');
                  Prepare;
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE CrushDiskTrans SET CrushDataType = 0'); // Purchase DataType
                  Prepare;
                  ExecSQL;
               except
                  MessageDlg('Unable to update crush tables, contact Kingswood',mtError,[mbOK],0);
               end;
         end;


      { Add new Idno for crush intake file }
      UpdateTable.TableName := 'OtherIds';
      if not FieldExists('CrushDiskID') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add CrushDiskID INTEGER');
               Prepare;
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET CrushDiskID = 0');
               Prepare;
               ExecSQL;

               Result := True;
            except
               MessageDlg('Unable to create crush tables, contact Kingswood',mtError,[mbOK],0);
            end;

      Result := UpdateCrushTables
   finally
      Finalize;
   end;
end;

{ END - Crush file Tables " IAD " }

procedure CheckGlobalSettings;
var
   tblLookupOwner, tblLookupGenLook, tblDefaults : TTable;
begin
   if ( VersionNo < 3684 ) then
      WinData.GlobalSettings.NatIDToAnimalNo := True;

   if ( VersionNo < 3704 ) then
      begin
         WinData.GlobalSettings.RenumAnimalNo := False; //Renumbering after a sale
         WinData.GlobalSettings.ReNumFormat := '/yy';
      end;

{
   if ( VersionNo < 3709 ) then
      begin
         if ((Def.Definition.dUsePedigree) and (Def.Definition.dUseMilkRec)) then
            WinData.GlobalSettings.EnforceMandatoryEvents := True
         else
            WinData.GlobalSettings.EnforceMandatoryEvents := False;
      end; }

   if ( VersionNo < 3750 ) then // enforce all dryoff events before calving animal.
      begin
         WinData.GlobalSettings.MandatoryBreedingEvents := False; // Dont enforce breeding events,
         if (Def.Definition.dUseMilkRec) then
            WinData.GlobalSettings.MandatoryDryOffEvent := True; // Enforce DryOff event
      end;

   { Set the Default Male Breeding Status if old version less than V3.7 R8.9 }
   if VersionNo < 3789 then
      begin
         WinData.CreateTTable(tblLookupOwner, nil,AliasName,'Owners');
         WinData.CreateTTable(tblLookupGenLook, nil,AliasName,'GenLook');
         WinData.CreateTTable(tblDefaults, nil,AliasName,'Defaults');

         tblLookupOwner.Active := True;
         tblLookupGenLook.Active := True;
         tblDefaults.Active := True;
         try
           if tblLookupOwner.Locate('ID', tblDefaults.FieldByName('DefaultHerdID').AsInteger, []) then
              WinData.GlobalSettings.DefaultMaleBreedingStatus := UPPERCASE( tblLookupGenLook.Lookup('ID;ListType', VarArrayOf( [tblLookupOwner.FieldByName('TypeOfHerd').AsInteger, LHerdType]), 'Description') ) <> cBeefHerd;
         finally
            tblLookupOwner.Active := False;
            tblLookupGenLook.Active := False;
            tblDefaults.Active := False;
            FreeAndNil(tblLookupOwner);
            FreeAndNil(tblLookupGenLook);
            FreeAndNil(tblDefaults);
         end;
      end;

//   10/02/11 [V4.0 R8.1] /MK Additional Feature - If VerNo Is Less Than V4.0R6.3 Then Set Calf Reg Preference On Automatically.
   if VersionNo < 4063 then
      begin
         WinData.GlobalSettings.ShowCalfReg := True;
         WinData.SavePreferences;
      end;

end;

function UpdateAfdoa : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'afdoa.db';
   if not FieldExists('UserDate') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add UserDate Date ');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end
   else
      Result := True;
end;

function UpdatepHrd : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'pHrd.db';
   if not FieldExists('UserDate') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add UserDate Date ');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end
   else
      Result := True;
end;

function UpdatesHrd : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'sHrd.db';
   if not FieldExists('UserDate') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add UserDate Date ');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end
   else
      Result := True;
end;

function CreateMilkTankTables : Boolean;
begin
   Result := False;
   Initialize;
   try
      UpdateTable.TableName := 'MilkCheque.db';
      with UpdateTable do
         try
            if not Exists then
               begin
                  with FieldDefs do
                     begin
                        Clear;
                        FieldDefs.Add('ID',ftAutoInc,0, True);
                        FieldDefs.Add('CalMthEnd',ftDate,0, False);
                        FieldDefs.Add('DateStart',ftDate,0, False);
                        FieldDefs.Add('DateEnd',ftDate,0, False);
                        FieldDefs.Add('LiqMilkProd',ftFloat,0, False);
                        FieldDefs.Add('PrcPerLtrLiq',ftFloat,0, False);
                        FieldDefs.Add('ProcMilkProd',ftFloat,0, False);
                        FieldDefs.Add('PrcPerLtrProc',ftFloat,0, False);
                        FieldDefs.Add('GrossValMilk',ftFloat,0, False);
                        FieldDefs.Add('NetValMilk',ftFloat,0, False);
                        FieldDefs.Add('AvgPerFat',ftFloat,0, False);
                        FieldDefs.Add('AvgPerProtein',ftFloat,0, False);
                        FieldDefs.Add('AvgPerLac',ftFloat,0, False);
                        FieldDefs.Add('AvgPerSolid',ftFloat,0, False);
                        FieldDefs.Add('AvgSCC',ftFloat,0, False);
                        FieldDefs.Add('1TCB',ftFloat,0, False);
                        FieldDefs.Add('2TCB',ftFloat,0, False);
                        FieldDefs.Add('3TCB',ftFloat,0, False);
                        FieldDefs.Add('AvgTherm',ftFloat,0, False);
                        FieldDefs.Add('UnitMeasure',ftFloat,0, False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iID','ID',[ixUnique, ixPrimary]);
                        //Add('iCalMthEnd','CalMthEnd',[ixCaseInsensitive]);

                     end;
                  CreateTable;
            end;


         UpdateTable.TableName := 'MilkTank.db';
         if not UpdateTable.Exists then
            begin
               with FieldDefs do
                  begin
                     Clear;
                     FieldDefs.Add('ID',ftAutoInc,0, True);
                     FieldDefs.Add('DateCollected',ftDate,0, False);
                     FieldDefs.Add('AmtCollect',ftFloat,0, False);
                     FieldDefs.Add('PerFat',ftFloat,0, False);
                     FieldDefs.Add('PerProtein',ftFloat,0, False);
                     FieldDefs.Add('PerLac',ftFloat,0, False);
                     FieldDefs.Add('PerSolid',ftFloat,0, False);
                     FieldDefs.Add('SCC',ftFloat,0, False);
                     FieldDefs.Add('TCB',ftFloat,0, False);
                     FieldDefs.Add('Thermoduric',ftFloat,0, False);
                     FieldDefs.Add('UnitMeasure',ftFloat,0, False);
                  end;

               with IndexDefs do
                  begin
                     Clear;
                     Add('iID','ID',[ixUnique, ixPrimary ]);
                     //Add('iDateCollected','DateCollected',[ixCaseInsensitive]);
                  end;
               CreateTable;
            end;
            Result := True;
         except
            on E : Exception do
               begin
                  MessageDlg('Unable to create Milk Tank tables.'+#13#10+cErrorContact,mtError,[mbOK],0);
               end;
         end;
   finally
      Finalize;
   end;
end;

function SetMilkQuotaFieldNull : Boolean;
begin
   Result := True;
   if VersionNo < SuckPremQuotaUpdateNo then
      try
         UpdateTable.TableName := 'Owners.db';
         if FieldExists('MilkQuota') then
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET MilkQuota = NULL');
                  Prepare;
                  ExecSQL;
               end
      except
         Result := False;
         MessageDlg('Unable to update the Milk Quota database field.'+#13#10+cErrorContact,mtError,[mbOk],0);
      end;
end;

function UpdateCrushTables : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'CrushDiskTrans.db';
   if not FieldExists('PenID') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add PenID INTEGER ');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end
   else
      Result := True;
end;

function BladeUpdate : Boolean;
begin
   Result := False;
   try
      { Add "BladeFeedID" to Feed Purchase/Stock table. }
      UpdateTable.TableName := 'FdStkEvents';
      if not FieldExists('BladeFeedID') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BladeFeedID INTEGER, ');
               SQL.Add('                                        Add BladeNotified BOOLEAN ');
               ExecSQL;
            end;

      { Add "BladeFarmerID" to Owner table. }
      UpdateTable.TableName := 'Owners';
      if not FieldExists('BladeFarmerID') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BladeFarmerID INTEGER ');
               ExecSQL;
            end;

      { Add "BladeSupplierID" to SuppliersBreeders table. }
      UpdateTable.TableName := 'SuppliersBreeders';
      if not FieldExists('BladeSupplierID') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BladeSupplierID INTEGER, ');
               SQL.Add('                                        Add BladeNotified BOOLEAN ');
               ExecSQL;
            end;

      { Add "BladeRegistered" to Animals table. }
      UpdateTable.TableName := 'Animals';
      if not FieldExists('BladeNotified') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BladeNotified BOOLEAN ');
               ExecSQL;
            end;

      { Add "BladeNotified" to Events table. }
      UpdateTable.TableName := 'Events';
      if not FieldExists('BladeNotified') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BladeNotified BOOLEAN ');
               ExecSQL;
            end;

      UpdateTable.TableName := 'BladeLookup';
      if not UpdateTable.Exists then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('CREATE TABLE "BladeLookup" ');
               SQL.Add('  ( ID AutoInc,           ');
               SQL.Add('    ListType Integer,   ');
               SQL.Add('    LookupCode CHAR(10),  ');
               SQL.Add('    Description CHAR(30), ');
               SQL.Add('PRIMARY KEY (ID, ListType) )');
               ExecSQL;
            finally
               //
            end;
      Result := True;
   except
      MessageDlg('Blade update failed ' + cErrorContact, mtError, [mbOK], 0);
   end;
end;

function UpdateICBFDelete : Boolean;
// Create by SP 07/09/2015 to enable deletion of events on server that originated from PC database
begin
   Result := True;

   UpdateTable.TableName := 'ICBFDelete';
   if not FieldExists('IsSynchronized') then
   with UpdateQuery do
      try
         SQL.Clear;
         SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add IsSynchronized BOOLEAN');
         ExecSQL;

         SQL.Clear;
         SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET IsSynchronized = TRUE');// Set to True so we can start sending events from this date onwards
         ExecSQL;
      except
         Result := False;
      end;
end;


function UpdateCalvings : Boolean;
begin
   { Add "CardRecieved" to Calvings table. }
   Result := True;
   UpdateTable.TableName := 'Calvings';
   try
      if not FieldExists('ID1CardReceived') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ID1CardReceived BOOLEAN, ');
                  SQL.Add('                                        Add ID2CardReceived BOOLEAN, ');
                  SQL.Add('                                        Add ID3CardReceived BOOLEAN, ');
                  SQL.Add('                                        Add ID4CardReceived BOOLEAN  ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('Update Calvings Set ID1CardReceived = False, ');
                  SQL.Add('                    ID2CardReceived = False, ');
                  SQL.Add('                    ID3CardReceived = False, ');
                  SQL.Add('                    ID4CardReceived = False  ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('ID1ComplianceCert') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ID1ComplianceCert BOOLEAN, ');
                  SQL.Add('                                        Add ID2ComplianceCert BOOLEAN, ');
                  SQL.Add('                                        Add ID3ComplianceCert BOOLEAN, ');
                  SQL.Add('                                        Add ID4ComplianceCert BOOLEAN  ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('Update Calvings Set ID1ComplianceCert = False, ');
                  SQL.Add('                    ID2ComplianceCert = False, ');
                  SQL.Add('                    ID3ComplianceCert = False, ');
                  SQL.Add('                    ID4ComplianceCert = False  ');
                  ExecSQL;
               end;
         end;


      if not FieldExists('ID1STATUS') then
         begin
            with UpdateQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ID1STATUS INTEGER, ');
                  SQL.Add('                                        Add ID2STATUS INTEGER, ');
                  SQL.Add('                                        Add ID3STATUS INTEGER, ');
                  SQL.Add('                                        Add ID4STATUS INTEGER,  ');
                  SQL.Add('                                        Add ID1DATE DATE, ');
                  SQL.Add('                                        Add ID2DATE DATE, ');
                  SQL.Add('                                        Add ID3DATE DATE, ');
                  SQL.Add('                                        Add ID4DATE DATE,  ');
                  SQL.Add('                                        Add ID1EMAILCOUNT CHAR(3), ');
                  SQL.Add('                                        Add ID2EMAILCOUNT CHAR(3), ');
                  SQL.Add('                                        Add ID3EMAILCOUNT CHAR(3), ');
                  SQL.Add('                                        Add ID4EMAILCOUNT CHAR(3) ');

                  ExecSQL;

                 { SQL.Clear;
                  SQL.Add('Update Calvings Set ID1STATUS = 1, ID2STATUS = 1, ID3STATUS = 1, ID4STATUS = 1 ');
                  ExecSQL;}
               except
                  on E : Exception do
                     ShowMessage(E.Message);
               end;
         end;

      if not FieldExists('ID1CTSReg') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ID1CTSReg BOOLEAN, ');
                  SQL.Add('                                        Add ID2CTSReg BOOLEAN, ');
                  SQL.Add('                                        Add ID3CTSReg BOOLEAN, ');
                  SQL.Add('                                        Add ID4CTSReg BOOLEAN  ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('Update Calvings Set ID1CTSReg = True, ');
                  SQL.Add('                    ID2CTSReg = True, ');
                  SQL.Add('                    ID3CTSReg = True, ');
                  SQL.Add('                    ID4CTSReg = True  ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('ID1NINotifyDateTime') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ID1NINotifyDateTime TimeStamp ');
               SQL.Add(' ,Add ID2NINotifyDateTime TimeStamp');
               SQL.Add(' ,Add ID3NINotifyDateTime TimeStamp');
               SQL.Add(' ,Add ID4NINotifyDateTime TimeStamp');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('ID1NIWSNotified') then
         with UpdateQuery do
            begin
               // This field will store bool value to indicate if calf was registered
               // via APHIS web service. Value will be true if calf registered via web service, false otherwise.
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ID1NIWSNotified BOOLEAN');
               SQL.Add(' ,Add ID2NIWSNotified BOOLEAN');
               SQL.Add(' ,Add ID3NIWSNotified BOOLEAN');
               SQL.Add(' ,Add ID4NIWSNotified BOOLEAN');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('ID1NIWSConfirmId') then
         with UpdateQuery do
            begin
               // This field will store successful confirmationId value to indicate if calf was registered
               // via APHIS web service.
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ID1NIWSConfirmId CHAR(20)');
               SQL.Add(' ,Add ID2NIWSConfirmId CHAR(60)');
               SQL.Add(' ,Add ID3NIWSConfirmId CHAR(60)');
               SQL.Add(' ,Add ID4NIWSConfirmId CHAR(60)');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('AbortedCalving') then
         with UpdateQuery do
            begin
               // SP 07/01/11 - These fields are used to store calving survey information.
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add AbortedCalving BOOLEAN');
               SQL.Add(' ,Add AssistedCalvingModerate BOOLEAN');
               SQL.Add(' ,Add AssistedCalvingSerious BOOLEAN');
               SQL.Add(' ,Add MilkFever BOOLEAN');
               SQL.Add(' ,Add RetainedCleansing BOOLEAN');
               SQL.Add(' ,Add DisplacedAbomasums BOOLEAN');
               Prepare;
               ExecSQL;
            end;
   except
      Result := false;
   end;
end;

function CreateDelCalvings : Boolean;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'DeletedCalvings';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('EventID', ftInteger);
               Add('DamID', ftInteger);
               Add('DamLactNo', ftInteger);
               Add('CalfID1', ftInteger);
               Add('CalfID2', ftInteger);
               Add('CalfID3', ftInteger);
               Add('CalfID4', ftInteger);
               Add('DeleteDate', ftDate);
            end;


         with IndexDefs do
            begin
               Clear;
               Add('iEventDamID', 'EventID;DamID', [ixPrimary,ixUnique]);
               Add('iDamLactNo', 'DamLactNo', [ixCaseInsensitive]);
               Add('iCalfID1', 'CalfID1', [ixCaseInsensitive]);
               Add('iCalfID2', 'CalfID2', [ixCaseInsensitive]);
               Add('iCalfID3', 'CalfID3', [ixCaseInsensitive]);
               Add('iCalfID4', 'CalfID4', [ixCaseInsensitive]);
               Add('iDeleteDate', 'DeleteDate', [ixCaseInsensitive]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end
end;

function UpdateHUKICalfReg : Boolean;
begin

   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'HUKICalfReg';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('CalfID', ftInteger);
               Add('AcceptCode', ftString,30);
               Add('BreedCode' ftString,30);
               Add('HBN' ftString,30);
               Add('RegDate' ftDateTime);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               Add('iCalfID', 'CalfID', [ixCaseInsensitive]);
               Add('iAcceptCode', 'AcceptCode', [ixCaseInsensitive]);
               Add('iBreedCode', 'BreedCode', [ixCaseInsensitive]);
               Add('iHBN', 'HBN', [ixCaseInsensitive]);
               Add('iRegDate', 'RegDate', [ixCaseInsensitive]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

function UpdateServices : Boolean;
begin
   Result := True;
   try
   UpdateTable.TableName := 'Services.db';
   if not FieldExists('Technician') then
      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Technician INTEGER ');
            Prepare;
            ExecSQL;
         end;

   if not FieldExists('ET1No') then
   with UpdateQuery do
      begin
         SQL.Clear;
         SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ET1No Char(15) ');
         Prepare;
         ExecSQL;
      end;

   //   20/02/14 [V5.2 R8.4] /MK Additional Feature - Added SexedSemen Integer field to the Services table for ICBF.
   if not FieldExists('SexedSemen') then
   with UpdateQuery do
      begin
         SQL.Clear;
         SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add SexedSemen Integer ');
         Prepare;
         ExecSQL;
      end;

   except
      Result := False;
   end;
end;

{function UpdateServices : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'Services.db';
   if not FieldExists('Technician') then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Technician INTEGER ');
            Prepare;
            ExecSQL;
            Result := True;
         except
         end
   else
      Result := True;
end;}

procedure FixLactNoBug;
// This problem occurred when Edited of Animal record reset lactNo to 0;
// Check events AnimallactNo field value, save this value to animal LactNo Field
// What happens if event has taken place after lactNo set to 0 ???
var
   Animals : TTable;
   Events : TTable;
   GetMaxLactNo : TQuery;
   LactNo, MaxLactNo : Integer;
   MessageDisplayed : Boolean;
begin
   MessageDisplayed := False;
   Animals := TTable.Create(nil);
   Events  := TTable.Create(nil);
   GetMaxLactNo := TQuery.Create(nil);
   try
      Animals.DatabaseName := AliasName;
      Events.DatabaseName := AliasName;
      GetMaxLactNo.DatabaseName := AliasName;

      Animals.TableName := 'Animals';
      Events.TableName := 'Events';

      Animals.Open;
      Events.Open;

      // Order Events by EventDate, ensure most recent event is last record when filtered.
      Events.IndexName := 'iEventDate';

      GetMaxLactNo.SQL.Clear;
      GetMaxLactNo.SQL.Add('Select MAX(AnimalLactNo) LactNo From Events Where ( AnimalID =:AID )');

      try
         Animals.Filter := 'Sex=''Female'''; // Only include females
         Animals.Filtered := True;
         Animals.First;

         while not Animals.Eof do // iterate through table.
            begin
               if ( Animals.FieldByName('LactNo').AsInteger = 0 ) then
                  begin
                     LactNo := 0;
                     MaxLactNo := 0;

                     GetMaxLactNo.ParamByName('AID').Value := Animals.FieldByName('ID').AsInteger; // Get MaxLactNo from current Female
                     GetMaxLactNo.Open;

                     try
                        GetMaxLactNo.First;
                        if ( not GetMaxLactNo.FieldByName('LactNo').IsNull ) then
                           MaxLactNo := GetMaxLactNo.FieldByName('LactNo').AsInteger; // Store the Last recorded LactNo
                     finally
                        GetMaxLactNo.Close;
                     end;

                     if ( MaxLactNo > 0 ) then
                        begin
                           Events.Filter := 'AnimalID = '+IntToStr( Animals.FieldByName('ID').AsInteger );
                           Events.Filtered := True;
                           try
                              if ( Events.FindLast ) then
                                 LactNo := Events.FieldByName('AnimalLactNo').AsInteger; // get last recorded AnimalLactNo

                              if ( LactNo < MaxLactNo ) then
                                 // if Difference between Last Recorded and Max LactNo then Alert for integrity error
                                 begin
                                    // Event has taken place AFTER bug was introduced.
                                    // There is a LactNo conflict, notify customer to send up their data.
                                    if not MessageDisplayed then  // only show message once!
                                       begin
                                          MessageDisplayed := True;
                                          MessageDlg('Kingswood Herd has uncovered a data integrity error.'+#13#10+
                                                     'Error : 1. Please take note of error code and'+#13#10+
                                                     'contact Kingswood Computing technical support line'+#13#10+#13#10+
                                                     'Email: info@kingswood.ie'+#13#10+
                                                     'Tel. No.: +353 1 4599491',mtError,[mbOK],0);
                                       end;
                                 end
                              else
                                 begin
                                    Animals.Edit;
                                    try
                                       Animals.FieldByName('LactNo').AsInteger := MaxLactNo;
                                       Animals.Post;
                                    except
                                       Animals.Cancel; // cancel if any problem occurrs.
                                    end;
                                 end;
                           finally
                              Events.Filter := '';
                              Events.Filtered := False;
                           end;
                        end;
                  end;
               Animals.Next;
            end;
            Animals.Filter := '';
            Animals.Filtered := False; 
      finally
         Animals.Close;
         Events.Close;
      end;
   finally
      Animals.Free;
      Events.Free;
      GetMaxLactNo.Free;
   end;
end;


function CreateNIBatchRegTables : Boolean;
begin
   Result := False;

   UpdateTable.TableName := 'BatchRegistrations';

   if UpdateTable.Exists then
      begin
         Result := True;
         Exit
      end
   else
      begin

         with UpdateTable do
            try
               TableName := 'BatchRegistrations';

               with FieldDefs do
                  begin
                     Clear;
                     Add('ID', ftAutoInc);
                     Add('HerdID', ftInteger);
                     Add('BirthRegCount', ftInteger);
                     Add('LastBirthRegDate', ftDate);
                     Add('DeathRegCount', ftInteger);
                     Add('LastDeathRegDate', ftDate);
                     Add('StillBirthRegCount', ftInteger);
                     Add('LastStillBirthRegDate', ftDate);
                  end;

               with IndexDefs do
                  begin
                     Clear;
                     Add('iID', 'ID', [ixPrimary, ixUnique]);
                  end;

               CreateTable;
               Open;
               try
                  Insert;
                  FieldByName('BirthRegCount').AsInteger := 0;
                  FieldByName('DeathRegCount').AsInteger := 0;
                  FieldByName('StillBirthRegCount').AsInteger := 0;
                  Post;
               finally
                  Close;
               end;

               Result := True;
            except
               on e : Exception do
                  MessageDlg('Error creating Batch Registration table - contact Kingswood',mtError,[mbOK],0);
            end;
      end;
end;

function UpdateSalesDeaths : Boolean;
begin
(*   Result := False;
   UpdateTable.TableName := 'SalesDeaths';
   if not FieldExists('Disposal') then // Make sure the field doesn't exist
      with UpdateQuery do
         try
            {
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NIDeptNotified BOOLEAN');
            Prepare;
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET NIDeptNotified = FALSE');
            Prepare;
            ExecSQL;
            }
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Disposal INTEGER');
            Prepare;
            ExecSQL;

            Result := True;
         except
            on e : Exception do
               MessageDlg('Error updating SalesDeaths.db - Disposal field update failed',mtError,[mbOK],0);
         end
   else
      Result := True;*)

  Result := True;
   try
      UpdateTable.TableName := 'SalesDeaths';
      if not FieldExists('Disposal') then // Make sure the field doesn't exist
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add Disposal INTEGER');
               Prepare;
               ExecSQL;
               //MessageDlg('Error updating SalesDeaths.db - Disposal field update failed',mtError,[mbOK],0);
            end;

      if not FieldExists('FallenStkNo') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add FallenStkNo Char(15) ');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('NIWSNotified') then
         with UpdateQuery do
            begin
               // This field will store bool value to indicate if death was registered
               // via APHIS web service. Value will be true if death registered via web service.
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NIWSNotified BOOLEAN');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('NIWSDismissedByUser') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NIWSDismissedByUser BOOLEAN');
               Prepare;
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET NIWSDismissedByUser = False');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('NIWSNotifiedDateTime') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NIWSNotifiedDateTime TimeStamp ');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('NIWSConfirmationId') then
         with UpdateQuery do
            begin
               // Stores the returned ConfirmationId from APHIS web services
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NIWSConfirmationId CHAR(60) ');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('NIWSNotified2') then
         with UpdateQuery do
            begin
               // This field will store bool value to indicate if death has been registered
               // via APHIS web service. Value will be true if death registered via web service otherwise false
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NIWSNotified2 BOOLEAN');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET NIWSNotified2 = TRUE');
               ExecSQL;
            end;

      if not FieldExists('NIWSNotifiedDateTime2') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NIWSNotifiedDateTime2 TimeStamp ');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('NIWSConfirmationId2') then
         with UpdateQuery do
            begin
               // Stores the returned ConfirmationId from APHIS web services
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NIWSConfirmationId2 CHAR(60) ');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('CTSReg') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add CTSReg Boolean ');
               Prepare;
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET CTSReg = TRUE');
               Prepare;
               ExecSQL;
            end;

      if not FieldExists('TotalDeductions') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add TotalDeductions FLOAT ');
               Prepare;
               ExecSQL;
            end;

      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET CTSReg = False WHERE CTSReg IS NULL');
            ExecSQL;
         end;

   except
      Result := False;
   end;

end;

function UpdateGenLookup : Boolean;

    function AddListType(Code, Desc : String; ListTypeID : Integer; UserDelete, InUse : Boolean) : Boolean;
    begin
        Result := false;
        if ( not(UpdateTable.Locate('ListType;Description', VarArrayOf([ListTypeID,Desc]), [loCaseInsensitive])) ) then
           begin
              UpdateTable.Append;
              UpdateTable.FieldByName('ListType').AsInteger      := ListTypeID;
              UpdateTable.FieldByName('Description').AsString    := Desc;
              UpdateTable.FieldByName('UserCanDelete').AsBoolean := UserDelete;
              UpdateTable.FieldByName('LookUpCode').AsString     := Code;
              //   29/09/11 [V5.0 R0.7] /MK Additional Feature - Added New Parameter For InUse
              UpdateTable.FieldByName('InUse').AsBoolean         := InUse;
              UpdateTable.Post;
              Result := True;
           end
        else
           begin
               if UpdateTable.FieldByName('Description').AsString <> Desc then
                  begin
                     UpdateTable.Edit;
                     UpdateTable.FieldByName('LookUpCode').AsString := Code;
                     UpdateTable.Post;
                  end;
            end;

    end;

    function SetListTypeOutOfUse(ADescription : String; ListTypeID : Integer) : Boolean;
    begin
       Result := False;
       if UpdateTable.Locate('ListType;Description', VarArrayOf([ListTypeID,ADescription]), [loCaseInsensitive]) then
          begin
             if ( UpdateTable.FieldByName('InUse').AsBoolean ) then
                begin
                   UpdateTable.Edit;
                   UpdateTable.FieldByName('InUse').AsBoolean := False;
                   UpdateTable.Post;
                   Result := True;
                end;
          end;
    end;

    procedure RemoveOldCullingCodes;
    var
       i : Integer;
       ChangeListType : Boolean;
    begin
        UpdateTable.First;
        while not UpdateTable.eof do
           begin
              if UpdateTable.FieldByName('ListType').AsInteger = LCulledCode then
                 begin
                     for i := Low(CullingCodeArray) to High(CullingCodeArray) do
                        begin
                           if ((UpdateTable.FieldByName('LookupCode').AsString) = CullingCodeArray[i]) then
                              begin
                                 ChangeListType := False;
                                 Break;
                              end
                           else
                              begin
                                 ChangeListType := True;
                              end;
                        end;
                    if ChangeListType then
                       begin
                          UpdateTable.Edit;
                          UpdateTable.FieldByName('ListType').AsInteger := UpdateTable.FieldByName('ListType').AsInteger+100;
                          UpdateTable.Post;
                       end;
                 end;
              UpdateTable.Next;
           end;
    end;

    procedure Fix_RetainPlacenta;
    var
       CorrectId, IncorrectId : Integer;
    begin
       // 16/02/2009 [Dev V3.9 R6.1] /SP Bug Fix - a fix to delete the mis-spelling of genlook record (ICBF - Retained Plascenta) 16/02/2009 / SP
       if UpdateTable.Locate('ListType;Description', VarArrayOf([13,'ICBF-Retained Plascenta']), [loCaseInsensitive]) then
          begin
             IncorrectId := UpdateTable.FieldByName('ID').AsInteger;
             if ( IncorrectId > 0 ) then
                begin
                   if UpdateTable.Locate('ListType;Description', VarArrayOf([13,'ICBF-Retained Placenta']), [loCaseInsensitive]) then
                      CorrectId := UpdateTable.FieldByName('ID').AsInteger;

                   if (CorrectId > 0 ) then
                      begin
                         with UpdateQuery do
                            try
                               SQL.Clear;
                               SQL.Add(InsertUPDATE('Health', ['HealthCode'], [IntToStr(CorrectId)]));
                               SQL.Add(InsertWHERE(['HealthCode'], [IntToStr(IncorrectId)]));
                               ExecSQL;

                               SQL.Clear;
                               SQL.Add(InsertUPDATE('Health', ['FarmCode'], [IntToStr(CorrectId)]));
                               SQL.Add(InsertWHERE(['FarmCode'], [IntToStr(IncorrectId)]));
                               ExecSQL;

                               SQL.Clear;
                               SQL.Add(InsertDELETE(UpdateTable.TableName));
                               SQL.Add(InsertWHERE(['ID'], [IntToStr(IncorrectId)]));
                               ExecSQL;
                            finally

                            end;
                      end;
                end;
          end
    end;

    procedure AddVaccinationDiseaseCode ( ALookupCode, ADescription : String; AListTypeID : Integer);
    begin
       // If Vaccination Codes found then exit procedure.
       if ( UpdateTable.Locate('LookupCode;Description;ListType',
                                VarArrayOf([ALookupCode,ADescription,AListTypeID]),[]) ) then
          Exit;

       // Else If old health code vaccine found with vaccine LookupCode then change list type id to LVaccination_DiseaseCode
       if UpdateTable.Locate('LookupCode;Description;ListType',
                                   VarArrayOf([ALookupCode,ADescription,LHealthCode]),[]) then
          begin
              UpdateTable.Edit;
              UpdateTable.FieldByName('ListType').AsInteger := AListTypeID;
              UpdateTable.Post;
          end
       // If not LookupCode, Description, LVaccination_DiseaseCode not found then add to table.
       else if ( not(UpdateTable.Locate('LookupCode;Description;ListType',
                                    VarArrayOf([ALookupCode,ADescription,AListTypeID]),[])) ) then
          begin
              UpdateTable.Append;
              UpdateTable.FieldByName('ListType').AsInteger := AListTypeID;
              UpdateTable.FieldByName('Description').AsString := ADescription;
              UpdateTable.FieldByName('UserCanDelete').AsBoolean := False;
              UpdateTable.FieldByName('LookUpCode').AsString := ALookupCode;
              UpdateTable.FieldByName('InUse').AsBoolean := True;
              UpdateTable.Post;
          end;
    end;

    procedure UpdateICBFCalvingEaseDesc ( ALookupCode, ADesc : String );
    var
       NewDesc : String;
    begin
       if ( ALookupCode = '' ) or ( ADesc = '' ) then Exit;

       if UpdateTable.Locate('ListType;Description;LookupCode',VarArrayOf([LBirthType,ADesc,ALookupCode]),[]) then
          try
             if ( ALookupCode = '1' ) then
                NewDesc := (Copy(ADesc,0,5)) + ALookupCode + '=' + (Copy(ADesc,6,Length(ADesc))) + ' Calving'
             else
                NewDesc := (Copy(ADesc,0,5)) + ALookupCode + '=' + (Copy(ADesc,6,Length(ADesc)));

             UpdateTable.Edit;
             UpdateTable.FieldByName('Description').AsString := NewDesc;
             UpdateTable.Post;
          except
             UpdateTable.Cancel;
          end;
    end;

    procedure DeleteNoneMedicineGroup;
    var
       iOtherGroupID : Integer;
    begin
       if UpdateTable.Locate('Description;ListType',
                                   VarArrayOf(['Other',LMedicineGroup]),[]) then
          iOtherGroupID := UpdateTable.FieldByName('ID').AsInteger;

       if UpdateTable.Locate('Description;ListType',
                                   VarArrayOf(['None',LMedicineGroup]),[]) then
          begin
             if ( iOtherGroupID > 0 ) then
                with UpdateQuery do
                   begin
                      SQl.Clear;
                      SQL.Add('UPDATE Medicine');
                      SQL.Add('SET MediGroup = '+IntToStr(iOtherGroupID)+'');
                      SQL.Add('WHERE MediGroup = '+IntToStr(UpdateTable.FieldByName('ID').AsInteger)+'');
                      try
                         ExecSQL;
                      except
                         on e : Exception do
                            ShowMessage(e.Message);
                      end;
                   end;
             UpdateTable.Delete;
          end;
    end;

    procedure RemoveOldJohnesLookupCodes;
    begin
       with UpdateQuery do
          begin
             SQL.Clear;
             SQL.Add('DELETE FROM GenLook');
             SQL.Add('WHERE LookupCode IN ("P", "N", "U")');
             SQL.Add('AND ListType = '+IntToStr(LJohnes_Result)+'');
             try
                ExecSQL;
             except
                on e : Exception do
                   ShowMessage(e.Message);
             end;
          end;
    end;

    procedure Remove_OldRespiratoryDisease_HealthCode;
    begin
       with UpdateQuery do
          begin
             SQL.Clear;
             SQL.Add('DELETE FROM GenLook');
             SQL.Add('WHERE Upper(Description) Like "%RESPIRATORY DISEASE%"');
             SQL.Add('AND ListType = '+IntToStr(LHealthCode)+'');
             try
                ExecSQL;
             except
                on e : Exception do
                   ShowMessage(e.Message);
             end;
          end;
    end;

    procedure UpdateGenLookupItemDesc (ACode, AOldDescription, ANewDescription : String;
       AListType : Integer);
    begin
       with UpdateQuery do
          begin
             SQL.Clear;
             SQL.Add('SELECT *');
             SQL.Add('FROM GenLook');
             SQL.Add('WHERE Upper(LookupCode) = "'+UpperCase(ACode)+'"');
             SQL.Add('AND Upper(Description) = "'+UpperCase(ANewDescription)+'"');
             SQL.Add('AND ListType = '+IntToStr(AListType)+'');
             try
                Open;
                if ( RecordCount > 0 ) then Exit;

                Close;
                SQL.Clear;
                SQL.Add('UPDATE GenLook');
                SQL.Add('SET Description = "'+ANewDescription+'"');
                SQL.Add('WHERE Upper(LookupCode) = "'+UpperCase(ACode)+'"');
                SQL.Add('AND Upper(Description) = "'+UpperCase(AOldDescription)+'"');
                SQL.Add('AND ListType = '+IntToStr(AListType)+'');
                ExecSQL;
             except
                on e : Exception do
                   ShowMessage(e.Message);
             end;
          end;
    end;

    procedure Update_BE_EB_CullingDescs;
    begin
       UpdateGenLookupItemDesc('BE', 'ICBF-Behaviour/Temperament', 'ICBF-Behaviour/Docility', LCulledCode);
       UpdateGenLookupItemDesc('EB', 'ICBF-EBI', 'ICBF-Euro-Stars', LCulledCode);
    end;

begin

   Result := True;

   UpdateTable.TableName := 'GenLook.db';
   ResizeField(UpdateTable.TableName, 'Description', 60);
   try
      if not FieldExists('InUse') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE GenLook ADD InUse Boolean ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE GenLook SET InUse = TRUE ');
                  ExecSQL;
               end;
         end;

      UpdateTable.Active := True;
      try
         { NI Disposal Places}
         //   29/09/11 [V5.0 R0.9] /MK Additional Feature - ** Set As Out Of Use As New Disposal Manners Added From TGM List.

         //AddListType('ODA', 'Official Disposal Agency', LNIDisposalManner, False); removed from the offical list 29/10/2008
         SetListTypeOutOfUse('Official Disposal Agency', LNIDisposalManner);

         //** - Removed - AddListType('VL', 'Veterinary Laboratory', LNIDisposalManner, False);
         SetListTypeOutOfUse('Veterinary Laboratory', LNIDisposalManner);

         //** - Removed -  AddListType('BOF', 'Burial On Farm', LNIDisposalManner, False);
         SetListTypeOutOfUse('Burial On Farm', LNIDisposalManner);

         //** - Removed -  AddListType('HK/K', 'Hunt Kennels/Knackery', LNIDisposalManner, False);
         SetListTypeOutOfUse('Hunt Kennels/Knackery', LNIDisposalManner);

         //** - Removed - AddListType('DWND', 'Drowned', LNIDisposalManner, False);
         SetListTypeOutOfUse('Drowned', LNIDisposalManner);

         //AddListType('OC', 'Own Consumption', LNIDisposalManner, False);
         SetListTypeOutOfUse('Drowned', LNIDisposalManner);

         //** - Removed - AddListType('IOF', 'Incinerated On Farm', LNIDisposalManner, False);
         SetListTypeOutOfUse('Incinerated On Farm', LNIDisposalManner);

         //AddListType('ODS-2', 'Official Disposal Scheme + Two', LNIDisposalManner, False); removed from the offical list 29/10/2008
         SetListTypeOutOfUse('Official Disposal Scheme + Two', LNIDisposalManner);

         //** - Removed - AddListType('NTSS', 'Nat Fallen Stock Scheme', LNIDisposalManner, False);
         SetListTypeOutOfUse('Nat Fallen Stock Scheme', LNIDisposalManner);

         //** - Removed - AddListType('RP', 'Rendering Plant', LNIDisposalManner, False);
         SetListTypeOutOfUse('Rendering Plant', LNIDisposalManner);

         //AddListType('OTMS', 'OTMS Casualty Slaughter', LNIDisposalManner, False); removed from the offical list 29/10/2008
         SetListTypeOutOfUse('OTMS Casualty Slaughter', LNIDisposalManner);

         //** - Removed - AddListType('FDS4', 'Free Disposal Scheme 4YO+', LNIDisposalManner, False);
         SetListTypeOutOfUse('Free Disposal Scheme 4YO+', LNIDisposalManner);

         SetListTypeOutOfUse('Free Disposal Scheme 2YO+', LNIDisposalManner);
         SetListTypeOutOfUse('OCDS Casualty Slaughter', LNIDisposalManner);

         //   29/09/11 [V5.0 R0.9] /MK Additional Feature - Latest APHIS Disposal Types Skyped By TGM
         AddListType('VLPM', 'VETERINARY LABORATORY FOR POST MORTEM', LNIDisposalManner, False, True);
         AddListType('BSETR', 'BSE SAMPLING THEN RENDERING', LNIDisposalManner, False, True);
         AddListType('DTR', 'DIRECT TO RENDERING', LNIDisposalManner, False, True);
         AddListType('DVCH', 'DISPOSAL VIA CARCASE HAULIER', LNIDisposalManner, False, True);
         AddListType('FTH', 'FEEDING TO HOUNDS', LNIDisposalManner, False, True);
         { END NI Disposal Places}

         //   16/03/15 [V5.4 R3.4] /MK Change - Reorganised list in alphabetical order for alignment with ICBF emailed list.
         AddListType('AB', 'ICBF-Abortion', LHealthCode, False, True);
         AddListType('AC', 'ICBF-Rumen Accidosis', LHealthCode, False, True);
         AddListType('AN', 'ICBF-Anoestrus', LHealthCode, False, True);
         AddListType('BL', 'ICBF-Grass Bloat', LHealthCode, False, True);
         //   20/02/14 [V5.2 R8.4] /MK Additional Feature - Added CD & NE Codes as per ICBF requirements.
         AddListType('CD', 'ICBF-Cow Down', LHealthCode, False, True);
         AddListType('CL', 'ICBF-Colic', LHealthCode, False, True);
         AddListType('CO', 'ICBF-Coccidiosis (Blood Scour)', LHealthCode, False, True);
         AddListType('CT', 'ICBF-Contagious (Staph.)', LHealthCode, False, True);
         AddListType('DC', 'ICBF-Dystocia (Difficult Calving)', LHealthCode, False, True);
         AddListType('DN', 'ICBF-Downer Cow', LHealthCode, False, True);
         AddListType('DR', 'ICBF-Drop (Foot abcess)', LHealthCode, False, True);
         AddListType('EC', 'ICBF-Environmental (E. Coli)', LHealthCode, False, True);
         AddListType('EN', 'ICBF-Endometritis', LHealthCode, False, True);
         AddListType('FC', 'ICBF-Follicular Cyst', LHealthCode, False, True);
         AddListType('FF', 'ICBF-Foul-inFoot (Foot rot/scald)', LHealthCode, False, True);
         AddListType('FL', 'ICBF-Fatty Liver Syndrome', LHealthCode, False, True);
         AddListType('GT', 'ICBF-Grass Tetany', LHealthCode, False, True);
         AddListType('JL', 'ICBF-Joint III', LHealthCode, False, True);
         AddListType('KE', 'ICBF-Ketosis', LHealthCode, False, True);
         AddListType('LA', 'ICBF-Lameness (cause is known)', LHealthCode, False, True);
         AddListType('LC', 'ICBF-Luteal Cyst', LHealthCode, False, True);
         AddListType('LD', 'ICBF-Left Displaced Abomasum', LHealthCode, False, True);
         AddListType('LW', 'ICBF-Lungworm (Hoose)', LHealthCode, False, True);
         AddListType('MA', 'ICBF-Mastitis (cause if known)', LHealthCode, False, True);
         AddListType('ME', 'ICBF-Metritis', LHealthCode, False, True);
         AddListType('MF', 'ICBF-Milk Fever', LHealthCode, False, True);
         AddListType('MR', 'ICBF-Digital Dermatitis (Mortellaro)', LHealthCode, False, True);
         AddListType('NE', 'ICBF-Neurological', LHealthCode, False, True);
         //   16/03/15 [V5.4 R3.4] /MK Change - New code added from ICBF health code list from Kevin Downing.
         AddListType('PI', 'ICBF-Parasitic Infection', LHealthCode, False, True); //New
         AddListType('PN', 'ICBF-Pneumonia', LHealthCode, False, True);
         AddListType('PY', 'ICBF-Pyometra', LHealthCode, False, True);
         //   16/03/15 [V5.4 R3.4] /MK Change - New code added from ICBF health code list from Kevin Downing.
         AddListType('PT', 'ICBF-Parity Incorrect', LHealthCode, False, True); //New
         AddListType('RD', 'ICBF-Right Displaced Abomasum', LHealthCode, False, True);
         AddListType('RP', 'ICBF-Retained Placenta', LHealthCode, False, True);
         AddListType('RW', 'ICBF-Ringworm', LHealthCode, False, True);
         AddListType('SB', 'ICBF-Stillborn', LHealthCode, False, True);
         AddListType('SC', 'ICBF-Diarrhoea (Scour)', LHealthCode, False, True);
         AddListType('SH', 'ICBF-Slurry Heel', LHealthCode, False, True);
         AddListType('SM', 'ICBF-Summer Mastitis', LHealthCode, False, True);
         AddListType('UL', 'ICBF-Ulcer', LHealthCode, False, True);
         AddListType('WL', 'ICBF-White line disease', LHealthCode, False, True);
         AddListType('ZZ', 'ICBF-Unknown/None of the above', LHealthCode, False, True);
         Fix_RetainPlacenta;
         //   16/03/15 [V5.4 R3.4] /MK Change - ICBF have done away with respiratory disease so delete it.
         Remove_OldRespiratoryDisease_HealthCode;

         AddListType('AB', 'ICBF-Abortion', LCulledCode, False, True);
         AddListType('AG', 'ICBF-Age', LCulledCode, False, True);
         AddListType('VD', 'ICBF-Bovine Viral Diarrhoea', LCulledCode, False, True);
         AddListType('CO', 'ICBF-Conformation', LCulledCode, False, True);
         AddListType('HP', 'ICBF-General Health Problems', LCulledCode, False, True);
         AddListType('SC', 'ICBF-High Somatic Cell Count', LCulledCode, False, True);
         AddListType('IF', 'ICBF-Infertility', LCulledCode, False, True);
         AddListType('IJ', 'ICBF-Injury', LCulledCode, False, True);
         AddListType('IP', 'ICBF-Intestine Problem', LCulledCode, False, True);
         AddListType('JD', 'ICBF-Johne''s Disease', LCulledCode, False, True);
         AddListType('LA', 'ICBF-Lameness', LCulledCode, False, True);
         AddListType('LM', 'ICBF-Low Milk Production', LCulledCode, False, True);
         AddListType('MA', 'ICBF-Mastitis', LCulledCode, False, True);
         AddListType('SR', 'ICBF-Surplus to Requirements', LCulledCode, False, True);

         //   16/06/16 [V5.5 R6.8] /MK Change - The below names should be changed to new names from ICBF current list.
         //   AddListType('BE', 'ICBF-Behaviour/Temperament', LCulledCode, False, True);
         //   AddListType('EB', 'ICBF-EBI', LCulledCode, False, True);
         Update_BE_EB_CullingDescs;

         //   20/02/14 [V5.2 R8.4] /MK Additional Feature - Added FL, TY & PC Codes as per ICBF requirements.
         AddListType('FL', 'ICBF-Feet and Legs', LCulledCode, False, True);
         AddListType('TY', 'ICBF-Poor Type', LCulledCode, False, True);
         AddListType('PC', 'ICBF-Poor Condition', LCulledCode, False, True);

         //   15/06/16 [V5.5 R6.8] /MK Additional Feature - Added extra new ICBF Culling Codes PP & IB.
         AddListType('PP', 'ICBF-Poor Progeny', LCulledCode, False, True);
         AddListType('IB', 'ICBF-Inbreeding', LCulledCode, False, True);

         //   21/03/14 [V5.2 R9.0] /MK Additional Feature - Incorrect spelling for ZZ code added when ZZ code was originally added.
         SetListTypeOutOfUse('ICBF-Unknown/None to the above', LCulledCode);

         AddListType('ZZ', 'ICBF-Unknown/None of the above', LCulledCode, False, True);

         AddListType('1', 'No Problem', LBirthType, False, True);
         AddListType('2', 'Slight Problem', LBirthType, False, True);
         AddListType('3', 'Needed Assistance', LBirthType, False, True);
         AddListType('4', 'Considerable Force', LBirthType, False, True);
         AddListType('5', 'Extreme Difficulty', LBirthType, False, True);
         AddListType('6', 'Caesarean', LBirthType, False, True);

         RemoveOldCullingCodes;

         AddListType('', 'Bovine', LSpecies, False, True);
         AddListType('', 'Horses', LSpecies, False, True);
         AddListType('', 'Goats',  LSpecies, False, True);

         AddListType('', cOther,  LMedicineGroup, False, True);
         AddListType('', cAntibiotic,  LMedicineGroup, False, True);
         //   29/01/2009 [V3.9 R5.8] /SP Additional Feature - Add Vaccine to the GenLook MediType list
         AddListType('', cVaccine,  LMedicineGroup, False, True);

         //   25/04/14 [V5.3 R0.0] /MK Additional Feature - Added new Medicine Groups for Doses and Tubes for Bord Bia.
         AddListType('', cDose,  LMedicineGroup, False, True);
         AddListType('', cTube,  LMedicineGroup, False, True);

         //   17/09/13 [V5.2 R1.4] /MK Change - Change None Medicine Group type to Neither - GL.
         DeleteNoneMedicineGroup;

         AddListType('', 'Clean',  LFertilityCheck_Status, False, True);
         AddListType('', 'Infected',  LFertilityCheck_Status, False, True);

         AddListType('', 'Wash Out', LFertilityCheck_Action, False, True);
         AddListType('', 'Start Program', LFertilityCheck_Action, False, True);
         AddListType('', 'Cull',  LFertilityCheck_Action, False, True);
         AddListType('', 'Take No Action', LFertilityCheck_Action, False, True);

         //   20/12/11 [V5.0 R2.9] /MK Additional Feature - New Genlook List Types For Tesco Johnes Event.
         //   11/12/13 [V5.2 R6.8] /MK Additional Feature - Remove old list types and create new High, Medium & Low types.
         RemoveOldJohnesLookupCodes;
         AddListType('H', 'High', LJohnes_Result, False, True);
         AddListType('M', 'Medium', LJohnes_Result, False, True);
         AddListType('L', 'Low', LJohnes_Result, False, True);

         //   07/06/11 [V4.1 R1.8] /MK Additional Feature - If Not Locate LookupCode AI Then Add LookupCode AI
         if not UpdateTable.Locate('LookupCode', 'AI', []) then
            AddListType('AI', 'AI', LServiceType, False, True);
         //   23/11/20 [V5.9 R7.5] /MK Additional Feature - Add Sexed Semen service type if it can't be found already.
         if ( not(UpdateTable.Locate('LookupCode','SS',[])) ) or ( not(UpdateTable.Locate('Description','Sexed Semen',[loCaseInsensitive])) ) then
            AddListType('SS', 'Sexed Semen', LServiceType, False, True);

         //   10/07/12 [V5.0 R7.7] /MK Change - Always add these Genlook items regardless of the Country.
         AddListType('CIS', 'CIS', LUKMilkRecorder, False, True);
         AddListType('NMR', 'NMR', LUKMilkRecorder, False, True);
         AddListType('QMMS', 'QMMS', LUKMilkRecorder, False, True);
         //   01/04/15 [V5.4 R2.3] /MK Additional Feature - Added DIY as a UK Milk Recorder option - Brian Lamb. 
         AddListType('DIY', 'DIY', LUKMilkRecorder, False, True);

         if WinData.SystemRegisteredCountry = England then
            begin
               AddListType('MAMI', 'Mastitis - Mild', LHealthCode, False, True);
               AddListType('MAMO', 'Mastitis - Moderate', LHealthCode, False, True);
               AddListType('MASE', 'Mastitis - Severe', LHealthCode, False, True);
               AddListType('LAME', 'Lameness', LHealthCode, False, True);
               AddListType('CLAM', 'Clinical Lameness', LHealthCode, False, True);
            end;

         //   17/09/12 [V5.0 R9.9] /MK Additional Feature - Added new health, non-user-can-delete, codes for Herd Vaccine's.
         //   09/01/13 [V5.1 R3.7] /MK Change - Add Vaccination Diseases as LVaccination_DiseaseCode ListType.
         AddVaccinationDiseaseCode('KH1','BVD',LVaccination_DiseaseCode);
         AddVaccinationDiseaseCode('KH2','IBR',LVaccination_DiseaseCode);
         AddVaccinationDiseaseCode('KH3','Lepto',LVaccination_DiseaseCode);
         AddVaccinationDiseaseCode('KH4','Salmonella',LVaccination_DiseaseCode);
         AddVaccinationDiseaseCode('KH5','Blackleg',LVaccination_DiseaseCode);
         AddVaccinationDiseaseCode('KH6','Rotovirus Scour',LVaccination_DiseaseCode);
         //   26/03/13 [V5.1 R5.4] /MK Additional Feature - Added RSV and Ringworm to list of diseases
         AddVaccinationDiseaseCode('KH7','RSV',LVaccination_DiseaseCode);
         AddVaccinationDiseaseCode('KH8','Ringworm',LVaccination_DiseaseCode);
         //   25/06/13 [V5.1 R7.5] /MK Additional Feature - Added Schmallenberg to list of diseases
         AddVaccinationDiseaseCode('KH9','Schmallenberg',LVaccination_DiseaseCode);
         //   02/12/15 [V5.5 R1.4] /MK Addiontal Feature - Added Coccidiosis to list of diseases - Milo Murphy request.
         AddVaccinationDiseaseCode('KH10','Coccidiosis',LVaccination_DiseaseCode);
         //   04/12/18 [V5.8 R5.7] /MK Addiontal Feature - Added Pneumonia and Johnes to list of diseases - James Lowe/Rob Uglow request.
         AddVaccinationDiseaseCode('KH11','Pneumonia',LVaccination_DiseaseCode);
         AddVaccinationDiseaseCode('KH12','Johnes',LVaccination_DiseaseCode);
         //   29/10/20 [V5.9 R6.6] /MK Additional Feature - Added Mastitis to list of diseases - Kevin Maguire request.
         AddVaccinationDiseaseCode('KH13','Mastitis',LVaccination_DiseaseCode);
         //   03/08/21 [V6.0 R1.7] /MK Additional Feature - Added Botulism to list of diseases - TGM request.
         AddVaccinationDiseaseCode('KH14','Botulism',LVaccination_DiseaseCode);

         //   20/09/12 [V5.0 R9.9] /MK Additional Feature - Added Default Vaccination Report Description Types.
         AddListType('KHRD1','Repeat Vaccination',LHealthReportDesc,False,True);
         AddListType('KHRD2','Booster',LHealthReportDesc,False,True);

         with UpdateQuery do
            begin
               // Ensure all Herds with Null Species get set to Cattle
               SQL.Clear;
               SQL.Add('UPDATE Owners Set Species = ( Select Distinct ID From GenLook Where ListType = '+IntToStr(LSpecies)+' and Description = "Bovine" )');
               SQL.Add('Where Species IS NULL');
               Prepare;
               ExecSQL;
            end;

         //   09/05/13 [V5.1 R7.1] /MK Additional Feature - New procedure to change LBirthType Descriptions for ICBF Beef Data Program.
         UpdateICBFCalvingEaseDesc('1','ICBF-Normal');
         UpdateICBFCalvingEaseDesc('2','ICBF-Some Assistance');
         UpdateICBFCalvingEaseDesc('3','ICBF-Considerable Difficulty');
         UpdateICBFCalvingEaseDesc('4','ICBF-Veterinary Assistance');

         // Update of colour listing V5.1 R9.6 - SP
         AddListType('B', 'Black', LAnimalColour, false, True);
         AddListType('W', 'White', LAnimalColour, false, True);
         AddListType('BW', 'Black And White', LAnimalColour, false, True);
         AddListType('BN', 'Brown', LAnimalColour, false, True);
         AddListType('Y', 'Yellow', LAnimalColour, false, True);
         AddListType('R', 'Red', LAnimalColour, false, True);
         AddListType('GY', 'Grey', LAnimalColour, false, True);
         AddListType('BL', 'Blue', LAnimalColour, false, True);
         AddListType('WY', 'White And Yellow', LAnimalColour, false, True);
         AddListType('C', 'Cream', LAnimalColour, false, True);
         AddListType('RW', 'Red And White', LAnimalColour, false, True);
         AddListType('BR', 'Brindle', LAnimalColour, false, True);
         AddListType('D', 'Dun', LAnimalColour, false, True);
         AddListType('RN', 'Roan', LAnimalColour, false, True);
         AddListType('DW', 'Dun And White', LAnimalColour, false, True);
         AddListType('BLW', 'Blue And White', LAnimalColour, false, True);

         //   20/02/14 [V5.2 R8.4] /MK Additional Feature - Added new list type for ICBF Sexed Semen request.
         AddListType('', 'Not Sexed', LSexedSemen, False, True);
         AddListType('-90F', 'Sexed 90% Female', LSexedSemen, False, True);
         AddListType('-75F', 'Sexed 75% Female', LSexedSemen, False, True);
         AddListType('-90M', 'Sexed 90% Male', LSexedSemen, False, True);
         AddListType('-75M', 'Sexed 75% Male', LSexedSemen, False, True);

         //   02/12/20 [V5.9 R7.7] /MK Bug Fix - Changed Foot to Hoof and fixed spelling misate of Paring - GL request.
         UpdateGenLookupItemDesc('TU1', 'Foot Pairing', 'Hoof Paring', LTreatmentUsed);

         //   31/01/19 [V5.8 R6.5] /MK Additional Feature - Added in new genlook items for the Treatment Used.
         AddListType('TU1', 'Hoof Paring', LTreatmentUsed, False, True);
         AddListType('TU2', 'Pare and Antibiotics', LTreatmentUsed, False, True);
         AddListType('TU3', 'Routine Trim', LTreatmentUsed, False, True);
         AddListType('TU4', 'Shoe/Block', LTreatmentUsed, False, True);

         AddListType('MD1', 'Lost', LMediDiposalReasons, False, True);
         AddListType('MD2', 'Spilled', LMediDiposalReasons, False, True);
         AddListType('MD3', 'Stolen', LMediDiposalReasons, False, True);
         AddListType('MD4', 'Unknown', LMediDiposalReasons, False, True);

         AddListType('KHD1', 'Positive', LHerdTestResult, False, True);
         AddListType('KHD2', 'Negative', LHerdTestResult, False, True);

      except
         on e : Exception do
            begin
               Result := False;
               ShowMessage(E.Message);
            end;
      end;

   finally
      UpdateTable.Active := False;
   end;

   if not FieldExists('IsSynchronized') then
      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('ALTER TABLE GenLook ADD IsSynchronized Boolean ');
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE GenLook SET IsSynchronized = FALSE ');
            ExecSQL;
         end;
end;

function UpdateCustomers : Boolean;

   procedure AddAuthorisedDisposalCustomer(AName : String);
   begin
      with UpdateTable do
         begin
            if not Locate('Name', AName, [loCaseInsensitive]) then
               begin
                  Append;
                  try
                     FieldByName('Name').AsString := AName;
                     FieldByName('Address 1').AsString := '';
                     FieldByName('Address 2').AsString := '';
                     FieldByName('Address 3').AsString := '';
                     FieldByName('Address 4').AsString := '';
                     FieldByName('CMMSForms').AsBoolean := False;
                     FieldByName('Slaughter').AsBoolean := False;
                     FieldByName('Licensed').AsBoolean := False;
                     FieldByName('AuthorisedDisposalPlace').AsBoolean := True;
                     Post;
                  except
                     Cancel;
                  end;
               end
            else
               begin
                  Edit; // make sure name is uppercase
                  try
                     FieldByName('Name').AsString := UpperCase(FieldByName('Name').AsString);
                     if FieldByName('AuthorisedDisposalPlace').AsBoolean = False then
                        FieldByName('AuthorisedDisposalPlace').AsBoolean := True;
                     Post;
                  except
                     Cancel;
                  end;
               end;
         end;
   end;

var
   UpdateFieldType : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'Customers';

   try
      ResizeField(UpdateTable.TableName, 'Name', 50);

      if not FieldExists('BTEHerdNo') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add BTEHerdNo CHAR(12) ');
                  ExecSQL;
                  Result := True;
               end;
         end;

      if not FieldExists('AuthorisedDisposalPlace') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add AuthorisedDisposalPlace BOOLEAN ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set AuthorisedDisposalPlace = False ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('IsSynchronized') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add IsSynchronized BOOLEAN');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET IsSynchronized = FALSE');
               ExecSQL;
            end;

      if not FieldExists('SlurryCustomer') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add SlurryCustomer BOOLEAN ');
                  ExecSQL;
                  Result := True;
               end;
         end;

      if not FieldExists('InUse') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD InUse Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set InUse = TRUE ');
               ExecSQL;
            except
               Result := False;
            end;

      if WinData.NISystem then
         with Updatetable do
            begin
               Active := True;
               try
                  // Add Disposal places from latest list
                  // latest list as of 27/07/09 - emailed by George in TGM Computers
                  AddAuthorisedDisposalCustomer('UFBP GLENAVY');
                  AddAuthorisedDisposalCustomer('UFBP GLENAVY VIA ABATTOIR');
                  AddAuthorisedDisposalCustomer('FOYLE PROTEINS');
                  AddAuthorisedDisposalCustomer('LINERGY');
                  AddAuthorisedDisposalCustomer('FOYLE PROTEINS');
                  AddAuthorisedDisposalCustomer('ON FARM');
                  AddAuthorisedDisposalCustomer('BRENDAN MATTHEWS');
                  AddAuthorisedDisposalCustomer('EAST ANTRIM HOUNDS');
                  AddAuthorisedDisposalCustomer('EAST DOWN FOXHOUNDS-SEAFORDE');
                  AddAuthorisedDisposalCustomer('H RUDDY');
                  AddAuthorisedDisposalCustomer('IVEAGH HUNT');
                  AddAuthorisedDisposalCustomer('KILLULTAGH HUNT KENNEL');
                  AddAuthorisedDisposalCustomer('MID ANTRIM HUNT');
                  AddAuthorisedDisposalCustomer('NEWRY HARRIERS');
                  AddAuthorisedDisposalCustomer('NORTH DOWN HUNT');
                  AddAuthorisedDisposalCustomer('NONE');
                  AddAuthorisedDisposalCustomer('VIC OMAGH');
                  AddAuthorisedDisposalCustomer('VSD STORMONT');

                  //   29/09/11 [V5.0 R0.9] /MK Additional Feature - Latest APHIS Disposal Places Skyped By TGM
                  AddAuthorisedDisposalCustomer('ADRIAN BOYD');
                  AddAuthorisedDisposalCustomer('CASTLE HILL VETERINARY CLINIC');
                  AddAuthorisedDisposalCustomer('D MCGIRR HAULAGE');
                  AddAuthorisedDisposalCustomer('DAVID MOORE');
                  AddAuthorisedDisposalCustomer('F MCGIRR HAULAGE');
                  AddAuthorisedDisposalCustomer('FRANCIS GALLAGHER');
                  AddAuthorisedDisposalCustomer('KEN BLACK');
                  AddAuthorisedDisposalCustomer('M MCGIRR HAULAGE');
                  AddAuthorisedDisposalCustomer('NOEL GRAHAM-DEEKPARK COLLECTIONS');
                  AddAuthorisedDisposalCustomer('S MCQUAID-NEWPORT COLLECTIONS');
                  AddAuthorisedDisposalCustomer('STEPHAN HANNA');
                  AddAuthorisedDisposalCustomer('HUNT KENNEL - EAST ANTRIM');
                  AddAuthorisedDisposalCustomer('HUNT KENNEL - EAST DOWN HUNT');
                  AddAuthorisedDisposalCustomer('HUNT KENNEL - IVEAGH');
                  AddAuthorisedDisposalCustomer('HUNT KENNEL - KILLULTAGH');
                  AddAuthorisedDisposalCustomer('HUNT KENNEL - MATTHEWS GREYHOUNDS');
                  AddAuthorisedDisposalCustomer('HUNT KENNEL - MID ANTRIM');
                  AddAuthorisedDisposalCustomer('HUNT KENNEL - NORTH DOWN');

                  //   04/12/14 [V5.4 R0.3] /MK Additional Feature - New NI disposal place for Enviro-Care Ltd - TGM request.
                  AddAuthorisedDisposalCustomer('ENVIRO-CARE LIMITED');

                  //   02/02/15 [V5.4 R2.6] /MK Additional Feature - New NI disposal place for ROUTE HUNT FALLEN STOCK LTD - TGM request.
                  AddAuthorisedDisposalCustomer('ROUTE HUNT FALLEN STOCK LTD');

                  AddAuthorisedDisposalCustomer(UpperCase('Hugh Cochrane'));
                  // New Disposal places will be added via link to APHIS web services.

               finally
                  DBIForceWrite(UpdateTable);
                  UpdateTable.Active := False;
               end;

         end;

      if not FieldExists('MeatFactory') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add MeatFactory BOOLEAN ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set MeatFactory = False ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('LocationId') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD LocationId Char(11), Add SubLocationId Char(2), Add MHSId Char(11)  ');
               ExecSQL;
            end;

      //   11/05/15 [V5.4 R5.6] /MK Additional Feature - Added new field to store change of name from new uChangeCustomerSupplierNames unit.
      if not FieldExists('NameChangedDate') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD NameChangedDate TIMESTAMP');
               ExecSQL;
            end;

      //   10/12/15 [V5.5 R1.6] /MK Additional Feature - Added BusinessID that is only used in Kingswood Fields currently.
      if not FieldExists('BusinessID') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD BusinessID CHAR(20)');
               ExecSQL;
            end;

   except
      on e : exception do
         begin
            Result := False;
            MessageDlg(E.Message + ' - contact Kingswood',mtError,[mbOK],0);
         end;

   end;
end;

function UpdateBlupPedigree : Boolean;
begin
   UpdateTable.TableName := 'BlupEval.db';
   Result := ( FieldExists('Comment') );
   if ( not(Result) ) then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add Comment BLOB(180) ');
               ExecSQL;
               Result := True;
            end;
      end
end;

function UpdatePurchGrpData : Boolean;
var
   tmpAnimals,
   tmpEvents : TTable;
   UpdateFieldType : Boolean;
begin
   UpdateTable.TableName := 'PurchGrpData.DB';

   Result := FieldExists('AID');
   if ( not(Result) ) then
      begin
         { New Field AID will be assigned value as animal is posted from group purch screen to }
         { database. If second post of purch grp occurs all animals with AID with not be reposted. }
         { This update below will retrospectively check all animals posted and assign the Animals.ID }
         { to GroupPurchData.AID, thus allowing second post of purchgrp with possbily more animals }
         { Add to the group. }
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add AID Integer, Add EID Integer ');
               ExecSQL;

               tmpAnimals := TTable.Create(nil);
               tmpEvents := TTable.Create(nil);
               try
                  tmpAnimals.DatabaseName := AliasName;
                  tmpAnimals.TableName := 'animals';
                  tmpAnimals.ReadOnly := True;
                  tmpAnimals.Active := True;

                  tmpEvents.DatabaseName := AliasName;
                  tmpEvents.TableName := 'events';
                  tmpEvents.ReadOnly := True;
                  tmpEvents.Active := True;

                  try
                     UpdateTable.Active := True;
                     try
                        UpdateTable.First;
                        while not UpdateTable.eof do
                           begin
                              if tmpAnimals.Locate('NatIDNum', UpdateTable.FieldByName('NatIDNum').AsString, []) then
                                 begin
                                    UpdateTable.Edit;
                                    try
                                       UpdateTable.FieldByName('AID').AsInteger := tmpAnimals.FieldByName('ID').AsInteger;
                                       UpdateTable.Post;
                                    except
                                       UpdateTable.Cancel;
                                    end;
                                 end;

                              if tmpEvents.Locate('AnimalID;EventType', VarArrayOf([tmpAnimals.FieldByName('ID').AsInteger, cPurchaseEvent]), []) then
                                 begin
                                    UpdateTable.Edit;
                                    try
                                       UpdateTable.FieldByName('EID').AsInteger := tmpEvents.FieldByName('ID').AsInteger;
                                       UpdateTable.Post;
                                    except
                                       UpdateTable.Cancel;
                                    end;
                                 end;

                              UpdateTable.Next;
                           end;
                     finally
                        UpdateTable.Active := False;
                     end;
                  finally
                     tmpAnimals.Active := False;
                     tmpEvents.Active := False;
                  end;
               finally
                  tmpAnimals.Free;
                  tmpEvents.Free;
               end;
               Result := True;
            end;
      end;

   //   30/09/14 [V5.3 R7.4] /MK Change - Added new fields LotNo and SearchNatID to PurchGrpData.db.
   if ( not(FieldExists('LotNo')) ) then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add LotNo CHAR(10) ');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add SearchNatID CHAR(20) ');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;

               Result := True;
            end;
      end
   else
      Result := True;

    //   11/10/16 [V5.6 R0.9] /MK Change - Changed LotNo to a String field - IAD.
    if ( not(UpdateTable.Active) ) then
       UpdateTable.Open;
    UpdateFieldType := ( UpdateTable.FieldByName('LotNo').DataType = ftString );
    UpdateTable.Close;
    //   18/10/16 [V5.6 R2.1] /MK Bug Fix - Result was not set if UpdateFieldType was False.
    Result := UpdateFieldType;
    if ( not(Result) ) then
       begin
          ChangeFieldType(UpdateTable.TableName,'LotNo',fldZSTRING,10);
          Result := True;
       end;
end;

function UpdateConditionScore : Boolean;
var
   UpdateFieldType : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'ConditionScore.db';
   UpdateTable.Active := True;
   try
      UpdateFieldType := ( UpdateTable.FieldByName('Score').DataType = ftInteger );
   finally
      UpdateTable.Active := False;
   end;

   if UpdateFieldType then
      begin
         ChangeFieldType(UpdateTable.TableName, 'Score', fldFloat);
         Result := True;
      end
   else
      Result := True;

   if not FieldExists('AssociatedEventID') then
      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD AssociatedEventID Integer, Add AssociatedEventType Integer  ');
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET AssociatedEventType =1  ');
            ExecSQL;
         end;

   //   09/01/12 [V5.0 R3.3] /MK Additional Feature - New Fields For Tesco Scoring Event Added.
   if not FieldExists('Scored') then
      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD Scored Boolean, ADD Mobility Float, ADD Cleanliness Float, ADD Abrasions Boolean');
            ExecSQL;
         end;

   {
            RenameField(UpdateTable.TableName, 'Score', 'OldScore');
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add Score FLOAT');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET Score=OldScore');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" DROP OldScore');
                  ExecSQL;

               end;
         finally
         end
      else
         Result := True;

   finally
      if UpdateTable.Active then
   end;
   }
end;

function UpdateFeedRegime : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'FeedRegime.db';
   if not FieldExists('Status') then
      begin
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add Status INTEGER ');
               ExecSQL;
            except
               Result := False;
               Exit;
            end;
      end;
end;

function UpdateFeedEvents : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'FeedEvents.db';
   if not FieldExists('FeedRegimeID') then
      begin
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add FeedRegimeID INTEGER ');
               ExecSQL;
            except
               Result := False;
               Exit;
            end;
      end;
end;

function UpdateCowExt : Boolean;
var
   UpdateFieldType : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'CowExt.db';
      if not FieldExists('FamilyName') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD FamilyName Char(30)');
                  ExecSQL;
               end;
         end;

      UpdateTable.Active := True;
      try
         UpdateFieldType := ( UpdateTable.FieldByName('EBI').DataType <> ftFloat );
      finally
         UpdateTable.Active := False;
      end;

      if UpdateFieldType then
         ChangeFieldType(UpdateTable.TableName, 'EBI', fldFloat);

      if not FieldExists('AAAScore1') then
         begin
            //   04/12/14 [V5.4 R0.3] /MK Additional Feature - Added AAAScores1,2&3 fields to the CowExt table - Philip Cusack/GL Request.
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD AAAScore1 INTEGER');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;

                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD AAAScore2 INTEGER');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;

                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD AAAScore3 INTEGER');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               end;
         end;

      if ( not(FieldExists('IgnoreEBIUpdate')) ) then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD IgnoreEBIUpdate BOOLEAN');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;

               SQL.Clear;
               SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET IgnoreEBIUpdate = FALSE');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;

      //   30/08/21 [V6.0 R2.1] /MK Additional Feature - Added DueToCalveDate and ExpectedBullCode to CowExt table.
      if ( not(FieldExists('DueToCalveDate')) ) then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD DueToCalveDate DATE');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD ExpectedBullCode CHAR(10)');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;

   except
      Result := False;
   end;
end;

function UpdateBullExt : Boolean;
var
   UpdateFieldType : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'BullExt.db';
   UpdateTable.Active := True;
   try
      UpdateFieldType := ( UpdateTable.FieldByName('RBI').DataType <> ftFloat );
   finally
      UpdateTable.Active := False;
   end;

   if UpdateFieldType then
      begin
         ChangeFieldType(UpdateTable.TableName, 'RBI', fldFloat);
         Result := True;
      end
   else
      Result := True;

   if ( not(FieldExists('IgnoreEBIUpdate')) ) then
      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" ADD IgnoreEBIUpdate BOOLEAN');
            try
               ExecSQL;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;

            SQL.Clear;
            SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET IgnoreEBIUpdate = FALSE');
            try
               ExecSQL;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         end;
end;

function CreateNBASPermit : Boolean;
begin
   Result := False;

   UpdateTable.TableName := 'CMMSPermits';

   if UpdateTable.Exists then
      begin
         Result := True;
         Exit
      end
   else
      begin
         with UpdateTable do
            try
               with FieldDefs do
                  begin
                     Clear;
                     Add('ID', ftAutoInc);
                     Add('PermitType', ftString, 1);
                     Add('UpdateDate', ftDateTime);
                     Add('StartVenNo', ftInteger);
                     Add('Allocation', ftInteger);
                     Add('CurrentVenNo', ftInteger);
                     Add('Remaining', ftInteger);
                     Add('AllocationsUsed', ftBoolean);
                  end;

               with IndexDefs do
                  begin
                     Clear;
                     Add('iID', 'ID', [ixPrimary, ixUnique]);
                  end;

               CreateTable;
               Result := True;
            except
               on e : Exception do
                  MessageDlg('Error creating NBAS Permit table - contact Kingswood',mtError,[mbOK],0);
            end;
      end;
end;

function UpdateBreeds : Boolean;

   procedure AddBreedToTable(ACode, AName : String);
   begin
      with UpdateTable do
         begin
            if not Locate('Name', AName, [loCaseInsensitive]) then
               begin
                  Append;
                  try
                     FieldByName('Code').AsString := ACode;
                     FieldByName('Name').AsString := AName;
                     FieldByName('GestationPeriod').AsInteger := cGestationPeriod;
                     FieldByName('EligibleforPremium').AsBoolean := False;
                     FieldByName('Selected').AsBoolean := False;
                     FieldByName('InUse').AsBoolean := True;
                     Post;
                  except
                     Cancel;
                     MessageDlg(Format('Breeds.Post Failed - %s %s',[ACode, AName]),mtError,[mbOK],0);
                  end;
               end;
         end;
   end;

   procedure UpdatePedigreeBreed(const ABreedCode, AName : String);
   begin
      with UpdateTable do
         begin
            First;
            while not eof do
               begin
                  if UPPERCASE(FieldByName('Name').AsString) = UPPERCASE(AName) then
                     begin
                        Edit;
                        try
                           FieldByName('PedigreeBreed').AsString := ABreedCode;
                           Post;
                        except
                           Cancel;
                           MessageDlg(Format('Breeds.Post Failed - %s %s',[ABreedCode, AName]),mtError,[mbOK],0);
                        end;
                     end;
                  Next;
               end;
         end;
   end;

   procedure UpdateBreedName(AOldBreedName, ANewBreedName : String);
   begin
      if ( UpdateTable.Active ) then
         UpdateTable.Close;
      if ( UpperCase(UpdateTable.TableName) <> 'BREEDS' ) then
         UpdateTable.TableName := 'Breeds';
      UpdateTable.Open;
      if ( UpdateTable.Locate('Name', AOldBreedName, [loCaseInsensitive]) ) then
         try
            UpdateTable.Edit;
            UpdateTable.FieldByName('Name').AsString := ANewBreedName;
            UpdateTable.Post;
         except
            UpdateTable.Cancel;
         end;
   end;

var
   BreedIDStr : string;
   Country : TCountry;
   BreedCode : string;
begin
   Result := False;
   
   UpdateTable.TableName := 'Breeds';
   if not FieldExists('InUse') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add InUse BOOLEAN ');
               ExecSQL;
            end;
      end;

   if not FieldExists('PedigreeBreed') then
      begin
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add PedigreeBreed Char(2) ');
               ExecSQL;
            end;
      end;

   if VersionNo < 3767 then
      begin
         // Check all used breeds in animals table, set them to InUse in the breed table.
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('Select Distinct PrimaryBreed From Animals Where PrimaryBreed IS NOT NULL');
               Open;

               First;
               while not eof do
                  begin
                     if BreedIDStr <> '' then
                        BreedIDStr := BreedIDStr + FieldByName('PrimaryBreed').AsString + ','
                     else
                        BreedIDStr := '(' + FieldByName('PrimaryBreed').AsString + ',';
                     Next;
                  end;
               if BreedIDStr = '' then BreedIDStr := '(';
               if BreedIDStr[Length(BreedIDStr)] = ',' then
                  System.Delete(BreedIDStr, Length(BreedIDStr),1);
               BreedIDStr := BreedIDStr + ')';

               if  BreedIDStr <> '()' then
                  begin
               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set InUse = TRUE WHERE ID IN '+BreedIDStr+' ');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set InUse = FALSE WHERE NOT ID IN '+BreedIDStr+' ');
               ExecSQL;
               end;
            end;
      end;

   UpdateTable.Active := True;
   try
      Country := System_Registered_Country;

      if Country = NIreland then
         begin
            BreedCode := 'BF';
            AddBreedToTable(BreedCode, 'British Friesian');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'FR';
         AddBreedToTable(BreedCode, 'British Friesian Cross');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'BAZ';
         AddBreedToTable(BreedCode, 'Bazadaise');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'BAZ';
         AddBreedToTable(BreedCode, 'Bazadaise Cross');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'BGA';
         AddBreedToTable(BreedCode, 'Belted Galloway');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'BGA';
         AddBreedToTable(BreedCode, 'Belted Galloway Cross');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'SHB';
         AddBreedToTable(BreedCode, 'Beef Shorthorn');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'SHB';
         AddBreedToTable(BreedCode, 'Beef Shorthorn Cross');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'XX';
         AddBreedToTable(BreedCode, 'Cross Breed Beef');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'XX';
            AddBreedToTable(BreedCode, 'Cross Breed Dairy');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'SHD';
            AddBreedToTable(BreedCode, 'Dairy Shorthorn');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'SHD';
            AddBreedToTable(BreedCode, 'Dairy Shorthorn Cross');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'HOL';
            AddBreedToTable(BreedCode, 'Holstein');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'HOL';
            AddBreedToTable(BreedCode, 'Holstein Cross');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'IM';
            AddBreedToTable(BreedCode, 'Irish Moiled');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'IM';
            AddBreedToTable(BreedCode, 'Irish Moiled Cross');
         end;

      if Country = NIreland then
         begin
         BreedCode := 'MAR';
         AddBreedToTable(BreedCode, 'Marchigiana');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'MAR';
            AddBreedToTable(BreedCode, 'Marchigiana Cross');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'WG';
            AddBreedToTable(BreedCode, 'White Galloway');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'WG';
            AddBreedToTable(BreedCode, 'White Galloway Cross');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'SH';
            AddBreedToTable(BreedCode, 'Whitbred Shorthorn');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'SH';
            AddBreedToTable(BreedCode, 'Whitbred Shorthorn Cross');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'VOS';
            AddBreedToTable(BreedCode, 'Vosgienne - Vosges');
         end;

      if Country = NIreland then
         begin
            BreedCode := 'RPL';
            AddBreedToTable(BreedCode, 'Red Poll');
         end;

      // Update the breed table, add Pedigree Breed Number to each matching breed
      UpdatePedigreeBreed('21', 'Aberdeen Angus');
      UpdatePedigreeBreed('21', 'Aberdeen Angus Cross');
      UpdatePedigreeBreed('03', 'Ayrshire');
      UpdatePedigreeBreed('03', 'Ayrshire Cross');
      UpdatePedigreeBreed('25', 'Blonde D''Aquitaine');
      UpdatePedigreeBreed('25', 'Blonde D''Aquitaine Cross');
      UpdatePedigreeBreed('51', 'Blue Albion');
      UpdatePedigreeBreed('51', 'Blue Albion Cross');
      UpdatePedigreeBreed('37', 'Belgian Blue');
      UpdatePedigreeBreed('37', 'Belgian Blue Cross');
      UpdatePedigreeBreed('20', 'British Friesian');
      UpdatePedigreeBreed('20', 'British Friesian Cross');
      UpdatePedigreeBreed('31', 'Brown Swiss');
      UpdatePedigreeBreed('31', 'Brown Swiss Cross');
      UpdatePedigreeBreed('38', 'Beef Shorthorn');
      UpdatePedigreeBreed('38', 'Beef Shorthorn Cross');
      UpdatePedigreeBreed('42', 'Water Buffalo');
      UpdatePedigreeBreed('18', 'Charolais');
      UpdatePedigreeBreed('18', 'Charolais Cross');
      UpdatePedigreeBreed('39', 'Chianina');
      UpdatePedigreeBreed('39', 'Chianina Cross');
      UpdatePedigreeBreed('16', 'Devon');
      UpdatePedigreeBreed('16', 'Devon Cross');
      UpdatePedigreeBreed('10', 'Dexter');
      UpdatePedigreeBreed('10', 'Dexter Cross');
      UpdatePedigreeBreed('02', 'Dairy Shorthorn');
      UpdatePedigreeBreed('02', 'Dairy Shorthorn Cross');
      UpdatePedigreeBreed('45', 'Galloway');
      UpdatePedigreeBreed('45', 'Galloway Cross');
      UpdatePedigreeBreed('35', 'Gelbvieh');
      UpdatePedigreeBreed('35', 'Gelbvieh Cross');
      UpdatePedigreeBreed('30', 'Gloucester');
      UpdatePedigreeBreed('30', 'Gloucester Cross');
      UpdatePedigreeBreed('05', 'Guernsey');
      UpdatePedigreeBreed('05', 'Guernsey Cross');
      UpdatePedigreeBreed('19', 'Hereford');
      UpdatePedigreeBreed('19', 'Hereford Cross');
      UpdatePedigreeBreed('01', 'Holstein Friesian');
      UpdatePedigreeBreed('01', 'Holstein Friesian Cross');
      UpdatePedigreeBreed('57', 'Highland');
      UpdatePedigreeBreed('57', 'Highland Cross');
      UpdatePedigreeBreed('01', 'Holstein');
      UpdatePedigreeBreed('01', 'Holstein Cross');
      UpdatePedigreeBreed('58', 'Irish Moiled');
      UpdatePedigreeBreed('58', 'Irish Moiled Cross');
      UpdatePedigreeBreed('04', 'Jersey');
      UpdatePedigreeBreed('04', 'Jersey Cross');
      UpdatePedigreeBreed('10', 'Kerry');
      UpdatePedigreeBreed('10', 'Kerry Cross');
      UpdatePedigreeBreed('41', 'Longhorn');
      UpdatePedigreeBreed('41', 'Longhorn Cross');
      UpdatePedigreeBreed('33', 'Limousin');
      UpdatePedigreeBreed('33', 'Limousin Cross');
      UpdatePedigreeBreed('09', 'Lincoln Red');
      UpdatePedigreeBreed('09', 'Lincoln Red Cross');
      UpdatePedigreeBreed('57', 'Luing');
      UpdatePedigreeBreed('57', 'Luing Cross');
      UpdatePedigreeBreed('26', 'Maine Anjou');
      UpdatePedigreeBreed('26', 'Maine Anjou Cross');
      UpdatePedigreeBreed('34', 'Murray Grey');
      UpdatePedigreeBreed('34', 'Murray Grey Cross');
      UpdatePedigreeBreed('28', 'Montbeliarde');
      UpdatePedigreeBreed('28', 'Montbeliarde Cross');
      UpdatePedigreeBreed('24', 'Meuse Rhine Issel');
      UpdatePedigreeBreed('24', 'Meuse Rhine Issel Cross');
      UpdatePedigreeBreed('36', 'Normande');
      UpdatePedigreeBreed('36', 'Normande Cross');
      UpdatePedigreeBreed('55', 'Piemontese');
      UpdatePedigreeBreed('55', 'Piemontese Cross');
      UpdatePedigreeBreed('44', 'Romagnola');
      UpdatePedigreeBreed('44', 'Romagnola Cross');
      UpdatePedigreeBreed('07', 'Red Poll');
      UpdatePedigreeBreed('07', 'Red Poll Cross');
      UpdatePedigreeBreed('56', 'Salers');
      UpdatePedigreeBreed('56', 'Salers Cross');
      UpdatePedigreeBreed('06', 'South Devon');
      UpdatePedigreeBreed('06', 'South Devon Cross');
      UpdatePedigreeBreed('50', 'Shetland');
      UpdatePedigreeBreed('50', 'Shetland Cross');
      UpdatePedigreeBreed('02', 'Shorthorn');
      UpdatePedigreeBreed('02', 'Shorthorn Cross');
      UpdatePedigreeBreed('23', 'Simmental');
      UpdatePedigreeBreed('23', 'Simmental Cross');
      UpdatePedigreeBreed('59', 'Swedish Red And White');
      UpdatePedigreeBreed('59', 'Swedish Red And White Cross');
      UpdatePedigreeBreed('32', 'Sussex');
      UpdatePedigreeBreed('32', 'Sussex Cross');
      UpdatePedigreeBreed('08', 'Welsh Black');
      UpdatePedigreeBreed('08', 'Welsh Black Cross');
      UpdatePedigreeBreed('14', 'Red & White');
      UpdatePedigreeBreed('14', 'Red & White Cross');

      if ( Country = Ireland ) then
         begin
            //   27/03/17 [V5.6 R5.6] /MK Change - Update Irish Maol/Droimeann breed name and change it to Irish Maol only - Dept. request. 
            UpdateBreedName('Irish Maol/Droimeann', 'Irish Maol');

            // Add Vosgienne Breed
            BreedCode := iBreedCodes[114];
            AddBreedToTable(BreedCode, iBreedNames[114]);
            BreedCode := iBreedCodes[115];
            AddBreedToTable(BreedCode, iBreedNames[115]);

            // Add Wagyu Breed
            BreedCode := iBreedCodes[116];
            AddBreedToTable(BreedCode, iBreedNames[116]);
            BreedCode := iBreedCodes[117];
            AddBreedToTable(BreedCode, iBreedNames[117]);

            // Add Belted Galloway Breed
            BreedCode := iBreedCodes[118];
            AddBreedToTable(BreedCode, iBreedNames[118]);
            BreedCode := iBreedCodes[119];
            AddBreedToTable(BreedCode, iBreedNames[119]);

            // Add Bazadais Breed
            BreedCode := iBreedCodes[120];
            AddBreedToTable(BreedCode, iBreedNames[120]);
            BreedCode := iBreedCodes[121];
            AddBreedToTable(BreedCode, iBreedNames[121]);

            // Add Speckle Park Breed
            BreedCode := iBreedCodes[122];
            AddBreedToTable(BreedCode, iBreedNames[122]);
            BreedCode := iBreedCodes[123];
            AddBreedToTable(BreedCode, iBreedNames[123]);

            // Add White Galloway Breed
            BreedCode := iBreedCodes[124];
            AddBreedToTable(BreedCode, iBreedNames[124]);
            BreedCode := iBreedCodes[125];
            AddBreedToTable(BreedCode, iBreedNames[125]);

            // Add White Galloway Breed
            BreedCode := iBreedCodes[126];
            AddBreedToTable(BreedCode, iBreedNames[126]);
            BreedCode := iBreedCodes[126];
            AddBreedToTable(BreedCode, iBreedNames[126]);

            // Add Unknown Breed
            BreedCode := iBreedCodes[128];
            AddBreedToTable(BreedCode, iBreedNames[128]);

            //   27/03/17 [V5.6 R5.6] /MK Change - Add the Droimeann breed - Dept. request.
            // Add Droimeann Breed
            BreedCode := iBreedCodes[129];
            AddBreedToTable(BreedCode, iBreedNames[129]);
            BreedCode := iBreedCodes[130];
            AddBreedToTable(BreedCode, iBreedNames[130]);
         end;

      DBIForceWrite(UpdateTable);
   finally
      UpdateTable.Active := False;
   end;
   Result := True;
end;

function UpdateMedicines : Boolean;
var
   sHerdType : String;
begin
   UpdateTable.TableName := 'Medicine';
   Result := true;
   try
      if not FieldExists('InUse') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add InUse BOOLEAN ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set InUse = TRUE ');
                  ExecSQL;

               end;
         end;

      if not FieldExists('StockLevel') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add StockLevel FLOAT ');
                  ExecSQL;
                  with UpdateTable do
                     begin
                        Active := True;
                        try
                           First;
                           while not eof do
                              begin
                                 if (FieldByName('QuantityInStock').asFloat>0) and ( FieldByName('PurchUnit').asFloat > 0) then
                                    begin
                                       Edit;
                                       try
                                          FieldByName('StockLevel').asFloat := FieldByName('QuantityInStock').asFloat * FieldByName('PurchUnit').asFloat;
                                          Post;
                                       except
                                          Cancel;
                                       end;
                                    end;
                                 Next;
                              end;
                        finally
                           Active := False;
                        end;
                     end;
               end;
         end;

      if not FieldExists('OrganicMeatWithdrawal') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add OrganicMeatWithdrawal Integer, Add OrganicMilkWithdrawal Integer, Add OrganicOtherWithdrawal Integer ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('MediGroup') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add MediGroup INTEGER ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET MediGroup = (Select Distinct(ID) From GenLook Where ((ListType=25) And (Description="None"))) ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('VPANo') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add VPANo CHAR(20) ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('MilkN_A_Drug') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add MilkN_A_Drug BOOLEAN ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add MeatN_A_Drug BOOLEAN ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('SELECT G.Description');
                  SQL.Add('FROM GenLook G');
                  SQL.Add('WHERE G.ListType = 8');
                  SQL.Add('AND ID IN (SELECT O.TypeOfHerd');
                  SQL.Add(' 	   FROM Owners O');
                  SQL.Add('	   WHERE O.ID IN (SELECT D.DefaultHerdID');
                  SQL.Add('			  FROM Defaults D))');
                  try
                     Open;
                     First;
                     sHerdType := Fields[0].AsString;
                  except
                  end;
                  Close;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '"');
                  if ( UpperCase(sHerdType) = 'DAIRY' ) then
                     SQL.Add('SET MilkN_A_Drug = TRUE WHERE MilkWithDrawal = 9999')
                  else
                     SQL.Add('SET MeatN_A_Drug = TRUE WHERE WithDrawal = 9999');
                  ExecSQL;

               end;
         end;

      // SP 19/06/2015 Field required to send vet treatments to Kingswood Farm Server
      if not FieldExists('IsSynchronized') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add IsSynchronized BOOLEAN ');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set IsSynchronized = FALSE ');
               ExecSQL;
            end;

      //   15/08/18 [V5.8 R2.4] /MK Additional Feature - Added a boolean field, DrugFindWithdAccepted, to the Medicine table that store whether the user
      //                                                 has accepted the message that appears after a drug has been imported from uDrugFinder with its withdrawal.
      //                                               - Added a timestamp/date field, DrugFindWithdAcceptDate, to the Medince table that stores what date and time
      //                                                 a user has accepted the message that appears after a drug has been imported from uDrugFinder with its withdrawal.
      if ( not(FieldExists('DrugFindWithdAccepted')) ) then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add DrugFindWithdAccepted BOOLEAN');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add DrugFindWithdAcceptDate TIMESTAMP');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add MeatWithdBroughtDown INTEGER');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add MilkWithdBroughtDown INTEGER');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add OldMeatWithdrawal INTEGER');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add OldMilkWithdrawal INTEGER');
               ExecSQL;
            end;

   except
      Result := False;
   end;
end;

function UpdateMediPurch : Boolean;
begin
   UpdateTable.TableName := 'MediPur';
   Result := True;
   try
      if ( not(FieldExists('InUse')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add InUse BOOLEAN ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set InUse = TRUE ');
                  ExecSQL;

                  Result := True;
               end;
         end;

      //   26/04/13 [V5.1 R7.0] /MK Additional Feature - Added new string field to MediPur for PurchTagNoDesc.
      if ( not(FieldExists('PurchTagNoDesc')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add PurchTagNoDesc CHAR(30) ');
                  ExecSQL;
               end;
         end;

      //   23/08/13 [V5.2 R0.2] /MK Additional Feature - Added PurchDoseRate to MediPur table.
      if ( not(FieldExists('PurchDoseRate')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add PurchDoseRate CHAR(20) ');
                  ExecSQL;
               end;
         end;

      //   03/09/13 [V5.2 R1.0] /MK Additional Feature - Added QtyRemaining to MediPur table.
      if ( not(FieldExists('QtyRemaining')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add QtyRemaining FLOAT ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET QtyRemaining = Quantity');
                  ExecSQL;
                  // MK - Might need to add logic here to update QtyRemaining based on current batch numbers in use.
               end;
         end;

      //   12/11/15 [V5.5 R0.5] /MK Additional Feature - Added Comment Blob field.
      if ( not(FieldExists('Comment')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add Comment BLOB(180) ');
                  ExecSQL;
               end;
         end;

      if ( not(FieldExists('DisposalID')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add DisposalID INTEGER');
                  ExecSQL;
               end;
         end;

      if ( not(FieldExists('EventSource')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add EventSource INTEGER');
                  ExecSQL;
               end;
         end;

      if ( not(FieldExists('IsSynchronized')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add IsSynchronized BOOLEAN ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET IsSynchronized = FALSE');
                  ExecSQL;
               end;
         end;

   except
      Result := False;
   end;
end;

function UpdateBullSemenStk : Boolean;
var
   UpdateFieldType : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'BullSemenStk.db';
   try
      if not FieldExists('CupNo') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add CupNo INTEGER ');
                  ExecSQL;
               end;
         end;
   except
      Result := False;
   end;
end;


procedure ForceNotInherdAfterSaleDeath;
begin
   with UpdateQuery do
      begin
         SQL.Clear;
         SQL.Add('Update Animals A Set A.Inherd = False ');
         SQL.Add('Where A.ID IN (Select E.AnimalID From Events E ');
         SQL.Add('             Left Join SalesDeaths S On (S.EventID=E.ID)');
         SQL.Add('             Where E.EventType = 11 ');
         SQL.Add('             And S.PreSale = False )');
         SQL.Add('And A.InHerd = True');
         SQL.Add('And A.AnimalDeleted = False');
         ExecSQL;
      end;
end;

function UpdateLUValuations : Boolean;
var
   DoUpdate : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'LiveStockValues.DB';
   try
      if FieldExists('BullBeef') then
         begin
            RenameField( UpdateTable.TableName, 'BullBeef', 'BullBeef06');
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add BullBeef612 FLOAT, Add BullBeef12Plus FLOAT ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('PedigreeCowsInMilk') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE LiveStockValues ADD PedigreeCowsInMilk FLOAT,');
                  SQL.Add('                            ADD PedigreeCowsDry FLOAT,');
                  SQL.Add('                            ADD PedigreeBullBreed FLOAT,');
                  SQL.Add('                            ADD PedigreeHeifer06 FLOAT,');
                  SQL.Add('                            ADD PedigreeHeifer612 FLOAT,');
                  SQL.Add('                            ADD PedigreeHeifer1218 FLOAT,');
                  SQL.Add('                            ADD PedigreeHeifer1824 FLOAT,');
                  SQL.Add('                            ADD PedigreeHeifer24Plus FLOAT,');
                  SQL.Add('                            ADD PedigreeSteer06 FLOAT,');
                  SQL.Add('                            ADD PedigreeSteer612 FLOAT,');
                  SQL.Add('                            ADD PedigreeSteer1218 FLOAT,');
                  SQL.Add('                            ADD PedigreeSteer1824 FLOAT,');
                  SQL.Add('                            ADD PedigreeSteer24Plus FLOAT,');
                  SQL.Add('                            ADD PedigreeBullBeef06 FLOAT,');
                  SQL.Add('                            ADD PedigreeBullBeef612 FLOAT,');
                  SQL.Add('                            ADD PedigreeBullBeef12Plus FLOAT,');
                  SQL.Add('                            ADD EnterpriseType CHAR (20),');
                  SQL.Add('                            ADD PedigreeOpeningValue FLOAT,');
                  SQL.Add('                            ADD PedigreeClosingValue FLOAT');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE LiveStockValues SET EnterpriseType = ''Commercial''');
                  ExecSQL;
               end;
         end;

      if (VersionNo < 4078) then
         begin
            // SP - 24/01/2011
            // The columns "CowsDry" and "PedigreeCowsDry" will now be used to hold the values of culled cows.
            // Set the value for these columns to 0.
            // This update should only be run once - check version no.
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET CowsDry =0, PedigreeCowsInMilk = 0');
                  ExecSQL;
               end;
         end;
   except
      Result := False;
   end;
end;

function UpdateDefaults : Boolean;
var
   DoUpdate : Boolean;
   sExistingMask : String;
begin
   sExistingMask := '';
   Result := True;
   UpdateTable.TableName := 'Defaults.DB';
   try
      if not FieldExists('GoatTagFormat') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add GoatTagFormat Char(30) ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE ' + UpdateTable.TableName + ' Set GoatTagFormat = "IE 0000000 0 00000"');
                  ExecSQL;
               end;
         end;

      if not FieldExists('CMMSDataStartUpDate') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add CMMSDataStartUpDate DATE ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('DefaultEmailClient') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add DefaultEmailClient CHAR(20) ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('RestoreDate') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add RestoreDate DATE ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('BeefAISireFileName') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add BeefAISireFileName CHAR(40) ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('CrushMaleAnimalNo') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add CrushMaleAnimalNo CHAR(10) ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('CrushFemaleAnimalNo') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add CrushFemaleAnimalNo CHAR(10) ');
                  ExecSQL;
               end;
         end;

      //   12/03/12 [V5.0 R4.3] /MK Additional Feature - Added New Field For ShowAllEvents.
      if not FieldExists('ShowAllEvents') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add ShowAllEvents Boolean ');
                  ExecSQL;
               end;
         end;

      //    16/05/12 [V5.0 R5.7] /MK Additional Feature - New DefaultReportFilter Field Added.
      if not FieldExists('DefaultReportFilter') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add DefaultReportFilter CHAR(20) ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('UpdatedHeatlhDrugBatchNo') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add UpdatedHeatlhDrugBatchNo Boolean ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('AttachmentsDownloaded') then
         begin
            with UpdateQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add AttachmentsDownloaded Boolean ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET AttachmentsDownloaded = FALSE ');
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
         end;

      if ( not(FieldExists('AnimalLactNoFixCheck')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add AnimalLactNoFixCheck Boolean ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET AnimalLactNoFixCheck = True ');
                  ExecSQL;
               end;
         end;

      if ( not(FieldExists('AnimalLactNoFixCompleted')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add AnimalLactNoFixCompleted Boolean ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET AnimalLactNoFixCompleted = FALSE ');
                  ExecSQL;
               end;
         end;

      if ( not(FieldExists('NatIDMaskAdjusted')) ) then
         if ( FieldExists('NatIDMask') ) then
            begin
               with UpdateQuery do
                  try
                     SQL.Clear;
                     SQL.Add('SELECT NatIDMask');
                     SQL.Add('FROM '+UpdateTable.TableName);
                     Open;
                     if ( RecordCount > 0 ) then
                        begin
                           First;
                           sExistingMask := Fields[0].AsString;
                        end;
                     Close;
                     SQL.Clear;
                     SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" DROP NatIDMask');
                     ExecSQL;
                     SQL.Clear;
                     SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NatIDMask CHAR(40)');
                     ExecSQL;
                     if ( Length(sExistingMask) > 0 ) then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET NatIDMask = "'+sExistingMask+'"');
                           ExecSQL;
                        end;
                     SQL.Clear;
                     SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add NatIDMaskAdjusted BOOLEAN');
                     ExecSQL;
                     SQL.Clear;
                     SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET NatIDMaskAdjusted = True');
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
            end;

      if ( not(FieldExists('MainScreenEventGridWidth')) ) then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add MainScreenEventGridWidth INTEGER ');
                  ExecSQL;
               end;
         end;

      if not FieldExists('BordBiaRegistered') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add BordBiaRegistered BOOLEAN');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set BordBiaRegistered = TRUE');
                  ExecSQL;
               end;
         end;

      //   21/08/17 [V5.7 R2.0] /MK Additional Feature - New field, DrugXMLUpdateRequired, added to the defaults table.
      if not FieldExists('DrugXMLUpdateRequired') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add DrugXMLUpdateRequired BOOLEAN');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET DrugXMLUpdateRequired = TRUE');
                  ExecSQL;
               end;
         end;

      //   01/12/17 [V5.7 R5.9] /MK Additional Feature - New field, AppSyncTagCountryCheck, added to the defaults table.
      if not FieldExists('AppSyncTagCountryCheck') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add AppSyncTagCountryCheck BOOLEAN');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET AppSyncTagCountryCheck = FALSE');
                  ExecSQL;
               end;
         end;

      if not FieldExists('BeefAILastUpdateDate') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add BeefAILastUpdateDate DATE');
                  ExecSQL;
               end;
         end;
   except
      Result := False;
   end;
end;

function UpdatePDefs : Boolean;
begin
   Result := True;
   try
       // Create the pDefs Table
       UpdateTable.Close;
       UpdateTable.TableName := 'pDefs';
       if not UpdateTable.Exists then
          with UpdateQuery do
             begin
                SQL.Clear;
                SQL.Add('CREATE TABLE "pDefs"');
                SQL.Add('(');
                SQL.Add(' ID        AUTOINC,');
                SQL.Add(' NPDairyCow  FLOAT,');
                SQL.Add(' NPSucklerCow FLOAT,');
                SQL.Add(' NPCattle2YrsPlus FLOAT,');
                SQL.Add(' NPCattle1to2Yrs FLOAT,');
                SQL.Add(' NPCattle0to12Mths FLOAT,');
                SQL.Add(' NPMTEweLamb FLOAT, ');
                SQL.Add(' NPLowEweLamb FLOAT, ');
                SQL.Add(' NPMTHogget FLOAT, ');
                SQL.Add(' NPLowHogget FLOAT, ');
                SQL.Add(' PPDairyCow  FLOAT,');
                SQL.Add(' PPSucklerCow FLOAT,');
                SQL.Add(' PPCattle2YrsPlus FLOAT,');
                SQL.Add(' PPCattle1to2Yrs FLOAT,');
                SQL.Add(' PPCattle0to12Mths FLOAT,');
                SQL.Add(' PPMTEweLamb FLOAT, ');
                SQL.Add(' PPLowEweLamb FLOAT, ');
                SQL.Add(' PPMTHogget FLOAT, ');
                SQL.Add(' PPLowHogget FLOAT, ');
                SQL.Add(' PRIMARY KEY (ID)');
                SQL.Add(')');
                ExecSQL; // Create the TABLE
             end;


      if not FieldExists('NINPDairyCows') then
         with UpdateQuery do
            try
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NINPDairyCows FLOAT';
               ExecSQL;
            except
//               on e : exception do
  //                showmessage
            end;
      if not FieldExists('NINPCattleOver24Mths') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NINPCattleOver24Mths FLOAT';
               ExecSQL;
            end;
      if not FieldExists('NINPCattle12To24Mths') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NINPCattle12To24Mths FLOAT';
               ExecSQL;
            end;
      if not FieldExists('NINPBullBeef0To13Mths') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NINPBullBeef0To13Mths FLOAT';
               ExecSQL;
            end;
      if not FieldExists('NINPBullBeef6To13Mths') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NINPBullBeef6To13Mths FLOAT';
               ExecSQL;
            end;
      if not FieldExists('NINPCattle0To12Mths') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NINPCattle0To12Mths FLOAT';
               ExecSQL;
            end;
      if not FieldExists('NINPCalves6To12Mths') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NINPCalves6To12Mths FLOAT';
               ExecSQL;
            end;
      if not FieldExists('NINPCalves0To6Mths') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NINPCalves0To6Mths FLOAT';
               ExecSQL;
            end;
   except
   end;
end;

function UpdateAnimals : Boolean;

   function UpdatePenNameFromFeedGroup : Boolean;
   var
      qGetGroups,
      qUpdateAnimals : TQuery;
   begin
      Result := False;
      qGetGroups := TQuery.Create(nil);
      qUpdateAnimals := TQuery.Create(nil);
      try
         try
            qUpdateAnimals.DatabaseName := UpdateQuery.DatabaseName;
            qUpdateAnimals.Close;
            qUpdateAnimals.SQL.Clear;
            qUpdateAnimals.SQL.Add('UPDATE Animals');
            qUpdateAnimals.SQL.Add('SET PenName = :FeedGroup');
            qUpdateAnimals.SQL.Add('WHERE ID = :AId');

            qGetGroups.DatabaseName := UpdateQuery.DatabaseName;
            qGetGroups.SQL.Clear;
            qGetGroups.SQL.Add('SELECT A.Id, G.Description');
            qGetGroups.SQL.Add('FROM Grps G');
            qGetGroups.SQL.Add('LEFT JOIN GrpLinks GL ON (GL.GroupId = G.Id)');
            qGetGroups.SQL.Add('LEFT JOIN Animals A ON (A.Id = GL.AnimalId)');
            qGetGroups.SQL.Add('WHERE (A.InHerd = True)');
            qGetGroups.SQL.Add('AND   (A.AnimalDeleted = False)');
            qGetGroups.SQL.Add('AND   (A.HerdId IN (SELECT DefaultHerdId FROM Defaults))');
            qGetGroups.SQL.Add('AND   (Upper(G.GroupType) = "FEED")');
            qGetGroups.Open;
            if ( qGetGroups.RecordCount = 0 ) then Exit;

            qGetGroups.First;
            while ( not(qGetGroups.Eof) ) do
               begin
                  qUpdateAnimals.Close;
                  qUpdateAnimals.Params[0].AsString := qGetGroups.Fields[1].AsString;
                  qUpdateAnimals.Params[1].AsInteger := qGetGroups.Fields[0].AsInteger;
                  qUpdateAnimals.ExecSQL;
                  qGetGroups.Next;
               end;
         except
            on e : Exception do
               begin
                  ShowDebugMessage(e.Message);
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError(e.Message);
                  Result := False;
               end;
         end;
      finally
         if ( qGetGroups <> nil ) then
            FreeAndNil(qGetGroups);
         if ( qUpdateAnimals <> nil ) then
            FreeAndNil(qUpdateAnimals);
      end;
   end;

begin
   Result := True;
   UpdateTable.TableName := 'Animals';
   with UpdateQuery do
      try  // bug in import export set none herd bull sex value to 'Male'
         SQL.Text := 'UPDATE Animals SET Sex = "Bull" WHERE Sex = "Male"';
         ExecSQL;
      except
         Result := False;
      end;

   if not FieldExists('SearchNatID') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD SearchNatID CHAR(20)';
            ExecSQL;
         except
            Result := False;
         end;

   if not FieldExists('LocateNatID') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD LocateNatID CHAR(30)';
            ExecSQL;
         except
            Result := False;
         end;

   if not FieldExists('Pedigree') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD Pedigree Boolean';
            ExecSQL;

            SQL.Text := 'UPDATE Animals SET Pedigree = False';
            ExecSQL;
         except
            on e : exception do
               begin
                  Result := False;
                  ShowMessage(E.message);
               end;
        end;

   if not FieldExists('UKAISireCode') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD UKAISireCode CHAR(10)';
            ExecSQL;
         except
            Result := False;
         end;

   //   13/03/12 [V5.0 R4.3] /MK Additional Feature - New BVDDate Field Added To The Animals Table.
   if not FieldExists('BVDDate') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD BVDDate DATE';
            ExecSQL;
         except
            Result := False;
         end;

   //   21/06/12 SP - Stores the current AIM Registration status of animal.
   //   Default all animals to null value.
   if not FieldExists('AimRegStatus') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD AimRegStatus INTEGER';
            ExecSQL;
         except
            Result := False;
         end;

   //   05/03/13 SP - Flag used to determine if animal should be synchronized to kingswood farm.
   //   Default all animals to false
   if not FieldExists('IsSynchronized') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD IsSynchronized BOOLEAN';
            ExecSQL;

            SQL.Text := 'UPDATE Animals SET IsSynchronized = FALSE';
            ExecSQL;
         except
            Result := False;
         end;

   //   02/04/13 [V5.1 R6.1] /MK Additional Feature - New field QualityAssured added for IAD use.
   if not FieldExists('QualityAssured') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD QualityAssured BOOLEAN';
            ExecSQL;

            SQL.Text := 'UPDATE Animals SET QualityAssured = False';
            ExecSQL;

         except
            Result := False;
         end;

   //  12/12/13 [V5.2 R6.9] /MK Additional Feature - New QADate added to Animals table.
   if not FieldExists('QADate') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD QADate DATE';
            ExecSQL;
         except
            Result := False;
         end;

   //  03/02/14 [V5.2 R7.9] /MK Additional Feature - New FamilyName field added to Animals table.
   if not FieldExists('CowFamily') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD CowFamily CHAR(30)';
            ExecSQL;
         except
            Result := False;
         end;

   //   08/01/18 [V5.7 R7.4] /MK Additional Feature - New field, OverallWeightGain, created for the animals table.
   if not FieldExists('OverallWeightGain') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD OverallWeightGain FLOAT';
            ExecSQL;
         except
            Result := False;
         end;

   //   29/11/19 [V5.9 R1.4] /MK Additional Feature - Added QANoMovements for QADays field that comes in the Mart XML file - GL/SP request.
   if not FieldExists('QANoMovements') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD QANoMovements CHAR(10)';
            ExecSQL;
         except
            Result := False;
         end;

   if not FieldExists('PenName') then
      with UpdateQuery do
         try
            SQL.Text := 'ALTER TABLE Animals ADD PenName CHAR(30)';
            ExecSQL;
            UpdatePenNameFromFeedGroup;
         except
            Result := False;
         end;
end;

function UpdateSuppliersBreeders : Boolean;
var
   TempSuppliers : TTable;
begin
   Result := True;
   UpdateTable.TableName := 'SuppliersBreeders.db';
   try
      ResizeField(UpdateTable.TableName, 'Name', 50);
      with UpdateQuery do
         begin
            SQL.Clear;
            SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET AnimalSupplier = TRUE WHERE AnimalSupplier IS NULL ');
            ExecSQL;
         end;

      if not FieldExists('LocationId') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD LocationId Char(11), Add SubLocationId Char(2), Add MHSId Char(11)  ');
               ExecSQL;
            end;

      if not FieldExists('IsSynchronized') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD IsSynchronized Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set IsSynchronized = FALSE ');
               ExecSQL;
            end;

      //   24/04/13 [V5.1 R7.0] /MK Additional Feature - Added new string field to Suppliers for BTEHerdNo.
      if not FieldExists('BTEHerdNo') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD BTEHerdNo CHAR(12)');
               ExecSQL;

               // Go through suppliers table and see if BTEHerdNo exists in the Address1 field.
               // Copy BTEHerdNo into BTEHerdNo Field.
               TempSuppliers := TTable.Create(nil);
               with TempSuppliers do
                  try
                     DatabaseName := AliasName;
                     TableName := 'SuppliersBreeders';
                     Open;
                     while ( not(TempSuppliers.Eof) ) do
                        begin
                           if ( TempSuppliers.FieldByName('Address 1').AsString <> '' ) then
                              try
                                 TempSuppliers.Edit;
                                 TempSuppliers.FieldByName('BTEHerdNo').AsString := ValidateHerdID(TempSuppliers.FieldByName('Address 1').AsString);
                                 TempSuppliers.Post;
                              except
                                 TempSuppliers.Cancel;
                              end;
                           TempSuppliers.Next;
                        end;
                  finally
                     Free;
                  end;
            end;

      //   11/05/15 [V5.4 R5.6] /MK Additional Feature - Added new field to store change of name from new uChangeCustomerSupplierNames unit.
      if not FieldExists('NameChangedDate') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD NameChangedDate TIMESTAMP');
               ExecSQL;
            end;

      if not FieldExists('SlurrySupplier') then
         begin
            with UpdateQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add SlurrySupplier BOOLEAN ');
                  ExecSQL;
                  Result := True;
               end;
         end;

      if not FieldExists('InUse') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD InUse Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set InUse = TRUE ');
               ExecSQL;
            except
               Result := False;
            end;

      //   10/12/15 [V5.5 R1.6] /MK Additional Feature - Added BusinessID that is only used in Kingswood Fields currently.
      if not FieldExists('BusinessID') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD BusinessID CHAR(20)');
               ExecSQL;
            end;

   except
      Result := False;
   end;

end;

function UpdateGroups : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'grps.db';
   try
      if not FieldExists('EventDate') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD EventDate DATE, ADD DestSource INTEGER';
               ExecSQL;
            end;

      if not FieldExists('CrushLoadComplete') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD CrushLoadComplete Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '"SET CrushLoadComplete = True');
               ExecSQL;
            end;

      if not FieldExists('IsSynchronized') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD IsSynchronized Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '"SET IsSynchronized = False');
               ExecSQL;
            end;

      //   18/10/19 [V5.9 R1.0] /MK Additional Feature - Added new fields for sync down of groups through HerdSync.
      if not FieldExists('ClientId') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD ClientId CHAR(40)');
               ExecSQL;

               SQL.Clear;
               SQL.Add('CREATE INDEX iClientId ON "'+UpdateTable.TableName+'" (ClientId)');
               ExecSQL;
            end;

     if not FieldExists('Source') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD Source INTEGER');
               ExecSQL;
            end;

     if not FieldExists('CreatedOn') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD CreatedOn TIMESTAMP');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE '+UpdateTable.TableName+' SET CreatedOn = "'+FormatDateTime(cUSDateStyle,Now)+'"');
               ExecSQL;
            end;

     if not FieldExists('ModifiedOn') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD ModifiedOn TIMESTAMP');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE '+UpdateTable.TableName+' SET ModifiedOn = "'+FormatDateTime(cUSDateStyle,Now)+'"');
               ExecSQL;
            end;
   except
      Result := False;
   end;
end;

function UpdateDisbudding : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'Disbudding';
      if not UpdateTable.Exists then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "Disbudding"');
               SQL.Add('(');
               SQL.Add(' EventID INTEGER,');
               SQL.Add(' VetID   INTEGER,');
               SQL.Add(' PRIMARY KEY (EventID)');
               SQL.Add(')');
               ExecSQL; // Create the TABLE
            end;
   except
      Result := False;
   end;
end;

function UpdateMealFeeding : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'MealFeeding';
      if not UpdateTable.Exists then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "MealFeeding"');
               SQL.Add('(');
               SQL.Add(' EventID INTEGER,');
               SQL.Add(' PRIMARY KEY (EventID)');
               SQL.Add(')');
               ExecSQL; // Create the TABLE
            end;
   except
      Result := False;
   end;
end;

function UpdateWeaning : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'Weaning';
      if not UpdateTable.Exists then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "Weaning"');
               SQL.Add('(');
               SQL.Add(' EventID  INTEGER,');
               SQL.Add(' Docility INTEGER,');
               SQL.Add(' Quality  INTEGER,');
               SQL.Add(' Weight  FLOAT,');
               SQL.Add(' WeighingDate  DATE,');
               SQL.Add(' PRIMARY KEY (EventID)');
               SQL.Add(')');
               ExecSQL; // Create the TABLE
            end;
   except
      Result := False;
   end;
end;

function UpdateFertilityPrograms : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'FertPrograms';
      if not UpdateTable.Exists then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "'+UpdateTable.TableName+'"');
               SQL.Add('(');
               SQL.Add(' ID  AUTOINC,');
               SQL.Add(' Code Char(10),');
               SQL.Add(' Description Char(50),');
               SQL.Add(' StartDay  INTEGER,');
               SQL.Add(' PRIMARY KEY (ID)');
               SQL.Add(')');
               ExecSQL; // Create the TABLE
            end;
   except
      Result := False;
   end;
end;

function UpdateFertilityTreatments : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'FertTreatments';
      if not UpdateTable.Exists then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "'+UpdateTable.TableName+'"');
               SQL.Add('(');
               SQL.Add(' ID  AUTOINC,');
               SQL.Add(' ParentProgram INTEGER,');
               SQL.Add(' Code Char(10),');
               SQL.Add(' Description Char(50),');
               SQL.Add(' StartDay  INTEGER,');
               SQL.Add(' PRIMARY KEY (ID))');
               ExecSQL; // Create the TABLE

               SQL.Clear;
               SQL.Add(' CREATE INDEX iParentProgram ON "'+UpdateTable.TableName+'" (ParentProgram)');
               ExecSQL; // Create the INDEX
            end;
   except
      Result := False;
   end;
end;

function UpdateFertilityProgramAdmin : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'FertProgAdmin';
      if not UpdateTable.Exists then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "'+UpdateTable.TableName+'"');
               SQL.Add('(');
               SQL.Add(' ID  AUTOINC,');
               SQL.Add(' AnimalID INTEGER,');
               SQL.Add(' LactNo INTEGER,');
               SQL.Add(' ProgramID INTEGER,');
               SQL.Add(' ParentEvent INTEGER,');
               SQL.Add(' StartDate DATE,');
               SQL.Add(' PRIMARY KEY (ID))');
               ExecSQL; // Create the TABLE

               SQL.Clear;
               SQL.Add(' CREATE INDEX iAnimalID ON "'+UpdateTable.TableName+'" (AnimalID)');
               ExecSQL;

               SQL.Clear;
               SQL.Add(' CREATE INDEX iLactNo ON "'+UpdateTable.TableName+'" (LactNo)');
               ExecSQL;

               SQL.Clear;
               SQL.Add(' CREATE INDEX iProgramID ON "'+UpdateTable.TableName+'" (ProgramID)');
               ExecSQL;

               SQL.Clear;
               SQL.Add(' CREATE INDEX iParentEvent ON "'+UpdateTable.TableName+'" (ParentEvent)');
               ExecSQL; // Create the INDEX
            end;
   except
      Result := False;
   end;
end;

function UpdatePregDiag : Boolean;
begin
   Result := True;

   //   18/10/11 [V5.0 R1.5] /MK Additional Feature - Added UpdatePregDiag Back Into CheckDatabaseTables.
   UpdateTable.TableName := 'PregnancyDiag.db';
   try
      if not FieldExists('CalfType') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD CalfType Char(3)';
               ExecSQL;
            end;
   except
      Result := False;
   end;

   //   30/06/14 [V5.3 R3.0] /MK Additional Feature - Added ReCheck field and set to False to start with.
   UpdateTable.TableName := 'PregnancyDiag.db';
   try
      if not FieldExists('ReCheck') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD ReCheck BOOLEAN';
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE ' + UpdateTable.TableName + '');
               SQL.Add('SET ReCheck = FALSE');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;
   except
      Result := False;
   end;

{
   UpdateTable.TableName := 'PregnancyDiag.db';
   try
      if not FieldExists('EventDate') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD EventDate DATE, ADD DestSource INTEGER';
               ExecSQL;
            end;
   except
      Result := False;
   end;
}
end;

function UpdateCowFert : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'CowFertility';
      if not UpdateTable.Exists then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "'+UpdateTable.TableName+'"');
               SQL.Add('(');
               SQL.Add(' ID  AUTOINC,');
               SQL.Add(' AnimalID INTEGER,');
               SQL.Add(' Culled BOOLEAN,');
               SQL.Add(' PRIMARY KEY (ID))');
               ExecSQL; // Create the TABLE

               SQL.Clear;
               SQL.Add(' CREATE INDEX iAnimalID ON "'+UpdateTable.TableName+'" (AnimalID)');
               ExecSQL; // Create the INDEX
               SQL.Clear;
               SQL.Add(' CREATE INDEX iCulled ON "'+UpdateTable.TableName+'" (Culled)');
               ExecSQL; // Create the INDEX
            end;
   except
      Result := False;
   end;
end;

function UpdateDefaultHealthEvents : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'DefaultHealthEvents';
      if not UpdateTable.Exists then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "'+UpdateTable.TableName+'"');
               SQL.Add('(');
               SQL.Add(' ID AUTOINC,');
               SQL.Add(' DrugID INTEGER,');
               SQL.Add(' ApplicRate FLOAT,');
               SQL.Add(' ApplicRatePerKgs FLOAT,');
               SQL.Add(' UseDrugNameForComment BOOLEAN,');
               SQL.Add(' PRIMARY KEY (ID))');
               ExecSQL; // Create the TABLE

               SQL.Clear;
               SQL.Add(' CREATE INDEX iID ON "'+UpdateTable.TableName+'" (ID)');
               ExecSQL; // Create the INDEX
            end;

      if not FieldExists('CrushTreatment') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD CrushTreatment BOOLEAN';
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;

               SQL.Clear;
               SQL.Text := 'UPDATE"' + UpdateTable.TableName + '" SET CrushTreatment = FALSE';
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;
   except
      Result := False;
   end;
end;

function UpdateBuyers : Boolean;
var
   FieldName : string;
begin
   Result := True;
   UpdateTable.TableName := 'Buyers.db';
   try
      if not FieldExists('DefaultBuyer') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD DefaultBuyer BOOLEAN';
               ExecSQL;

               SQL.Text := 'UPDATE "' + UpdateTable.TableName + '" SET DefaultBuyer = FALSE';
            end;

      FieldName := 'IsSynchronized';
      if not FieldExists(FieldName) then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD '+FieldName+' Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set '+FieldName+' = FALSE ');
               ExecSQL;
            end;

      if not FieldExists('InUse') then
         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" ADD InUse Boolean');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" Set InUse = TRUE ');
               ExecSQL;
            end;
   except
      Result := False;
   end;
end;

function UpdateKingswoodMailBox : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'KingswoodMailBox';
      if not UpdateTable.Exists then
         begin

            with UpdateTable do
               try
                  with FieldDefs do
                     begin
                        Clear;
                        Add('ID', ftAutoInc);
                        Add('MsgReceived', ftDateTime);
                        Add('MsgFrom', ftstring,120);
                        Add('MsgSubject', ftstring,120);
                        Add('MsgBody', ftMemo,240);
                        Add('MsgRead', ftBoolean);
                        Add('StrMsgReceived', ftString,50);
                        Add('Content', ftBlob);
                        Add('MailType', ftInteger);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iID', 'ID', [ixPrimary, ixUnique]);
                     end;

                  CreateTable;
               except
                  on e : Exception do
                     begin
                        Result := False;
                        MessageDlg('Error creating '+UpdateTable.TableName+' - contact Kingswood',mtError,[mbOK],0);
                     end;
               end;

         end;
   except
      Result := False;
   end;
end;

function UpdateAnimalsExt : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'AnimalsExt.db';
   if not UpdateTable.Exists then
      begin
         with UpdateTable do
            try
               with FieldDefs do
                  begin
                     Clear;
                     Add('AnimalID', ftInteger);
                     Add('Comments', ftMemo,240);
                     Add('BVDResult', ftInteger);
                  end;

               with IndexDefs do
                  begin
                     Clear;
                     Add('iAnimalID', 'AnimalID', [ixPrimary, ixUnique]);
                     //Add('iComments', 'Comments', [ixCaseInsensitive]);
                  end;

               CreateTable;
            except
               on e : Exception do
                  begin
                     Result := False;
                     MessageDlg('Error creating '+UpdateTable.TableName+' - contact Kingswood',mtError,[mbOK],0);
                  end;
            end;
      end;

   if ( not(FieldExists('BVDResult')) ) then
      with UpdateQuery do
         try
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" ADD BVDResult INTEGER');
               ExecSQL;
               Result := True;
            except
               on e : Exception do
                  begin
                     Result := False;
                     ApplicationLog.LogException(e);
                     ApplicationLog.LogError(e.Message);
                     ApplicationLog.LogError('uUpdateTables - UpdateAnimalsExt - Error adding BVDResult field.');
                  end;
            end;
         finally
         end;

   //   06/09/21 [V6.0 R2.2] /MK Additional Feature - Added the ACI field to the AnimalExt table.
   if ( not(FieldExists('ACI')) ) then
      with UpdateQuery do
         try
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" ADD ACI FLOAT');
               ExecSQL;
               Result := True;
            except
               on e : Exception do
                  begin
                     Result := False;
                     ApplicationLog.LogException(e);
                     ApplicationLog.LogError(e.Message);
                     ApplicationLog.LogError('uUpdateTables - UpdateAnimalsExt - Error adding ACI field.');
                  end;
            end;
         finally
         end;
end;

function UpdateSires : Boolean;
var
   CreateField : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'Sires';
   if ( not(UpdateTable.Exists) ) then Exit;
   CreateField := not(FieldExists('BreedCode'));
   if CreateField then
      try
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE Sires Add BreedCode Char(3)');
               ExecSQL;
            finally
            end;
      except
         Result := False;
      end;
end;

function UpdateTagStore : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'TagStore';
      if not UpdateTable.Exists then
         begin
            with UpdateTable do
               try
                  with FieldDefs do
                     begin
                        Clear;
                        Add('ID', ftAutoInc);
                        Add('TagNumber', ftString,30);
                        Add('SortTagNumber', ftString,30);
                        Add('HerdID', ftInteger);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iID', 'ID', [ixPrimary, ixUnique]);
                        Add('iTagNumber', 'TagNumber', [ixCaseinsensitive]);
                        Add('iSortTagNumber', 'SortTagNumber', [ixCaseinsensitive]);
                        Add('iHerdID', 'HerdID', [ixCaseinsensitive]);
                     end;
                  CreateTable;
               except
                  on e : Exception do
                     begin
                        Result := False;
                        MessageDlg('Error creating '+UpdateTable.TableName+' - contact Kingswood',mtError,[mbOK],0);
                     end;
               end;
         end;
   except
      Result := False;
   end;
end;

function UpdateFertilityCheck : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'FertilityCheck';
      if not UpdateTable.Exists then
         begin
            with UpdateTable do
               begin
                  with FieldDefs do
                     begin
                        Clear;
                        Add('EventID', ftInteger);
                        Add('Status', ftInteger);
                        Add('Action', ftInteger);
                        Add('FertProgram', ftInteger);

                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iEventID', 'EventID', [ixPrimary, ixUnique]);
                        Add('iStatus', 'Status', [ixCaseinsensitive]);
                        Add('iAction', 'Action', [ixCaseinsensitive]);
                        Add('iFertProgram', 'FertProgram', [ixCaseinsensitive]);
                     end;
                  CreateTable;
               end;
         end;
   except
      Result := False;
      MessageDlg('Error creating '+UpdateTable.TableName+' - contact Kingswood',mtError,[mbOK],0);
   end;
end;

{function UpdateNewIDs : Boolean;
begin
   UpdateTable.TableName := 'UniqueId.db';
   try
      if not FieldExists('NewID2') then
         with UpdateQuery do
            begin
               SQL.Text := 'ALTER TABLE "' + UpdateTable.TableName + '" ADD NewID2 INTEGER';
               ExecSQL;
            end;
   except
      Result := False;
   end;
end;}

{
function UpdateBeefAISires : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'BeefAISires';
      if not UpdateTable.Exists then
         begin
            with UpdateTable do
               try
                  with FieldDefs do
                     begin
                        Clear;
                        Add('ID', ftAutoInc);
                        Add('Code', ftString,10);
                        Add('Name', ftString,60);
                        Add('BreedCode', ftString,6);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iID', 'ID', [ixPrimary, ixUnique]);
                        Add('iCode', 'Code', [ixCaseinsensitive]);
                        Add('iName', 'Name', [ixCaseinsensitive]);
                        Add('iBreedCode', 'BreedCode', [ixCaseinsensitive]);
                     end;
                  CreateTable;
               except
                  on e : Exception do
                     begin
                        Result := False;
                        MessageDlg(E.Message,mtError,[mbOK],0);
                     end;
               end;
         end;
   except
      Result := False;
   end;
end;

 }

function CreateAimRegistrationTable : Boolean;
begin
   Result := True;
   try
      UpdateTable.TableName := 'AimAnimalReg';
      if not UpdateTable.Exists then
         begin
            with UpdateTable do
               try
                  with FieldDefs do
                     begin
                        Clear;
                        Add('Id', ftAutoInc);
                        Add('AnimalId', ftInteger);
                        // Possible status values;
                        // 0 = Registered
                        // 1 = Queried
                        // 2 = Error
                        Add('Status', ftInteger);
                        Add('TransactionDate', ftDateTime);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iId', 'Id', [ixPrimary, ixUnique]);
                        Add('iAnimalId', 'AnimalId', [ixCaseInsensitive]);
                        Add('iTransactionDate', 'TransactionDate', [ixCaseInsensitive]);
                     end;

                  CreateTable;
               except
                  on e : Exception do
                     begin
                        Result := False;
                        MessageDlg('Error creating '+UpdateTable.TableName+' - contact Kingswood',mtError,[mbOK],0);
                     end;
               end;

         end;
   except
      Result := False;
   end;
end;


// ################################################################################################
// ################################################################################################
// ################################################################################################
// ################################################################################################
// ################################################################################################
// #################################### OLD UPDATE PROC ###########################################
// ################################################################################################
// ################################################################################################
// ################################################################################################
// ################################################################################################
// ################################################################################################
// ################################################################################################
// ################################################################################################



  function UpdateKingswd : Boolean;
  var
   MyQuery : TQuery;

  function CreateExtTable : Boolean;
  begin
      try
         with MyQuery do
            begin
               try
                  SQL.Clear;
                  SQL.Add('DROP TABLE "ext001.db"');
                  ExecSQL;
               except
                   // Do Nothing
               end;
               SQL.Clear;
               SQL.Add('CREATE TABLE "ext001.db"');
               SQL.Add('(');
                     SQL.Add(' HerdId INTEGER,');
                     SQL.Add(' YearToRun INTEGER,');
                     SQL.Add(' DateTo DATE,');
                     SQL.Add(' FHect FLOAT,');
                     SQL.Add(' LUExtPrem FLOAT,');
                     SQL.Add(' LUBase FLOAT,');
                     SQL.Add(' LUMin FLOAT,');
                     SQL.Add(' ExtAmt FLOAT,');
                     SQL.Add(' PremAmt FLOAT,');
                     SQL.Add(' MaxLUS FLOAT,');
                     SQL.Add(' MilkQuota FLOAT,');
               SQL.Add(' PndsCow FLOAT,');
               SQL.Add(' NoCows INTEGER,');

               SQL.Add(' PndsEwe FLOAT,');
               SQL.Add(' NoEwe INTEGER,');
               SQL.Add(' PndsSuckler FLOAT,');
               SQL.Add(' NoSuckler INTEGER,');
               SQL.Add(' LUS10Mth FLOAT,');
               SQL.Add(' LUSUnder24Mth FLOAT,');

               SQL.Add('LUSOver24Mth Float,');
               SQL.Add('LUSCow       Float,');
               SQL.Add('LUSEwe       Float,');
               SQL.Add('LUSSuckler   Float,');
               SQL.Add('TotalAmtCow  Float,');
               SQL.Add('TotalAmtEwe  Float,');
               SQL.Add('TotalAmtSuckler Float,');

               SQL.Add('seNo10Mth    Integer,');  // se = Still Eligible
               SQL.Add('seNoUnder24Mth Integer,');
               SQL.Add('seNoOver24Mth  Integer,');
               SQL.Add('se10MthLU      Float,');
               SQL.Add('seUnder24MthLU Float,');
               SQL.Add('seOver24MthLU  Float,');

               SQL.Add('neNo10Mth      Integer,');  // ne = Not Eligible
               SQL.Add('neNoUnder24Mth Integer,');
               SQL.Add('neNoOver24Mth  Integer,');
               SQL.Add('ne10MthLU      Float,');
               SQL.Add('neUnder24MthLU Float,');
               SQL.Add('neOver24MthLU  Float,');

               SQL.Add('TotalLUSStillElig  Float,');
               SQL.Add('TotalLUSAppliedFor Float,');
               SQL.Add('TotalLUS           Float,');

               //Results Screen
               SQL.Add('TotalLUSExceeding   Float,');
               SQL.Add('NoSteersUnder24Mths Float,');
               SQL.Add('NoSteersOver24Mths  Float,');

               SQL.Add('NoToDeduct10Mth      Integer,');
               SQL.Add('NoToDeductUnder24Mth Integer,');
               SQL.Add('NoToDeductOver24Mth  Integer,');

               SQL.Add('Deduct10MthLU        Float,');
               SQL.Add('DeductUnder24MthLU   Float,');
               SQL.Add('DeductOver24MthLU    Float,');

               SQL.Add('TotalSBPExExten      MONEY,');
               SQL.Add('TotalSBPInclExten    MONEY,');
               SQL.Add('AvgGallons           FLOAT,');
               SQL.Add('SucklerQuota         INTEGER,');
               SQL.Add('NoSucklerHeifers     INTEGER,');
               SQL.Add('LUSSucklerHeifers    FLOAT,');
               SQL.Add(' PRIMARY KEY(HerdID)');
               SQL.Add(')');
               ExecSQL; // Create the TABLE
            end;
      finally
         MyQuery.Close;
         RESULT := TRUE;
      end;
  end;

  procedure PurchGrpDataCreate;
  begin
     try
        with MyQuery do
           begin   //Create fields in the tPurchGrpHeader table
              SQL.Add('CREATE TABLE "PurchGrpData.db"');
                    SQL.Add('(');
              SQL.Add(' ID               AutoInc,');
              SQL.Add(' PurchGrpHeaderID Integer,');
              SQL.Add(' SeqNum           Smallint,');
              SQL.Add(' NatIDNum         CHAR(20),');
              SQL.Add(' AnimalNo         CHAR(10),');
              SQL.Add(' PrimaryBreed     Integer,');
              SQL.Add(' Weight           Float,');
              SQL.Add(' EventDesc        CHAR(30),');
              SQL.Add(' Grade            CHAR(15),');
              SQL.Add(' Colour           Integer,');
              SQL.Add(' MartPrice        Float,');
              SQL.Add(' CostIntoPen      Float,');
              SQL.Add(' DateOfBirth      Date,');
              SQL.Add(' TBTestDate       Date,');
              SQL.Add(' EventDate        Date,');
              SQL.Add(' SupplierID       Integer,');
              SQL.Add(' BuyerID          Integer,');
              SQL.Add(' Sex              CHAR(10),');
              SQL.Add(' GroupID          Integer,');
              SQL.Add(' PenID            Integer,');
              SQL.Add(' Breeding         Boolean,');
              SQL.Add(' LactationNumber  Smallint,');
              SQL.Add(' SupplierCosts    Float,');
              SQL.Add(' BuyerCosts       Float,');
              SQL.Add(' PRIMARY KEY(ID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
            end;
     finally
        MyQuery.Close;
     end;
  end;

  procedure PurchGrpHeaderCreate;
  begin
     try
        with MyQuery do
           begin   //Create fields in the tPurchGrpHeader table
              SQL.Add('CREATE TABLE "PurchGrpHeader.db"');
              SQL.Add('(');
                    SQL.Add(' ID               AUTOINC,');
              SQL.Add(' PurchGroupID     Integer,');
              SQL.Add(' PurchGrpCode     CHAR(6),');
              SQL.Add(' PurchaseDate     Date,');
              SQL.Add(' SupplierID       Integer,');
              SQL.Add(' SupplierCosts    Float,');
              SQL.Add(' BuyerID          Integer,');
              SQL.Add(' BuyerCosts       Float,');
              SQL.Add(' Sex              CHAR(10),');
              SQL.Add(' Number           SmallInt,');     //Number that should be in Group
              SQL.Add(' MartWeight       Float,');
              SQL.Add(' MartCost         Float,');
              SQL.Add(' VAT              Float,');           //VAT rate
              SQL.Add(' HerdID           Integer,');
              SQL.Add(' GroupID          Integer,');
              SQL.Add(' PenID            Integer,');
              SQL.Add(' Breeding         Boolean,');
              SQL.Add(' LactationNumber  Smallint,');
              SQL.Add(' EventDesc        CHAR(30),');
              SQL.Add(' OfficePhase1     Boolean,');
              SQL.Add(' TagWtVsMartWtVar Float,');
              SQL.Add(' DataPosted       Boolean,');
              SQL.Add(' ActualNumber     Integer,');
              SQL.Add(' TotWeight        Float,');
              SQL.Add(' TotMartPrice     Float,');
              SQL.Add(' TotCostIntoPen   Float,');
              SQL.Add(' PRIMARY KEY(ID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
            end;
     finally
        MyQuery.Close;
     end;
  end;

  procedure MakeSlghtApplic;
  Var
     SlghtQuery : TQuery;
  begin
     SlghtQuery := TQuery.Create(nil);
     try
        SlghtQuery.DatabaseName := AliasName;
        with SlghtQuery do
           begin
              SQL.Add('CREATE TABLE "SlghtApplic.db"');
             SQL.Add('(');
                SQL.Add(' ID AUTOINC,');
                   SQL.Add(' DateOfApplic DATE,');
                SQL.Add(' YearOfApplic INTEGER,');
                   SQL.Add(' HerdID INTEGER,');
                SQL.Add(' Description CHAR(30),');
              SQL.Add(' PRIMARY KEY(ID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
     finally
        SlghtQuery.Close;
        SlghtQuery.Free;
     end;
  end;

  procedure MakeSlghtAppliedFor;
  Var
     SlghtQuery : TQuery;
  begin
     SlghtQuery := TQuery.Create(nil);
     try
        SlghtQuery.DatabaseName := AliasName;
        with SlghtQuery do
           begin
              SQL.Add('CREATE TABLE "SlghtAppliedFor.db"');
             SQL.Add('(');
             SQL.Add(' ID AUTOINC,');
                   SQL.Add(' ApplicationID INTEGER,');
             SQL.Add(' AnimalID INTEGER,');
              SQL.Add(' PRIMARY KEY(ID,ApplicationID,AnimalID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
     finally
        SlghtQuery.Close;
        SlghtQuery.Free;
     end;
  end;

  // Create the Ssytem Users Table to keep Name of People using the System
  procedure MakeSysUsers;
  Var
     DefaultTemp,
     TempTable,
     SysUserTable : TTable;
  begin
     try

        DefaultTemp := TTable.Create(nil);
        DefaultTemp.DatabaseName := AliasName;
        DefaultTemp.TableName := 'Defaults';

        SysUserTable := TTable.Create(nil);
        SysUserTable.DatabaseName := AliasName;
        TempTable := TTable.Create(nil);
        TempTable.DatabaseName := AliasName;
        TempTable.TableName := 'Owners';
        with SysUserTable do
           begin
              TableName := 'SysUsers.db';
              DatabaseName := AliasName;
              FieldDefs.Add( 'ID',         ftAutoInc, 0,FALSE);
              FieldDefs.Add( 'Name',   ftString, 30,TRUE);  // Animal ID
              IndexDefs.Add( '','ID',[ixUnique,ixPrimary] );
              CreateTable;
              Open;
           end;
        TempTable.Open;
        TempTable.First;
        if TempTable.Recordcount > 0 then
           while NOT TempTable.EOF do
              begin
                 if TempTable.FieldByName('HerdIdentity').AsString <> 'NONE' then
                    begin
                       SysUserTable.Append;
                       if TempTable.FieldByName('Name').IsNull then
                          begin
                             if TempTable.FieldByName('HerdIdentity').IsNull then
                                SysUserTable.FieldByName('Name').AsString := 'No User Name Set Up'
                             else
                                SysUserTable.FieldByName('Name').AsString := TempTable.FieldByName('HerdIdentity').AsString;
                          end
                       else
                          SysUserTable.FieldByName('Name').AsString := TempTable.FieldByName('Name').AsString;
                       SysUserTable.Post;
                    end;
                 TempTable.Next;
              end;

        DefaultTemp.Open;
        DefaultTemp.First;
        SysUserTable.First;
        if DefaultTemp.RecordCount > 0 then
            begin
               DefaultTemp.Edit;
               DefaultTemp.FieldByName('CurrUser').AsInteger := SysUserTable.FieldByName('ID').AsInteger;
               DefaultTemp.Post;
            end;
     finally
        DefaultTemp.Close;
        DefaultTemp.Free;
        TempTable.Close;
        TempTable.Free;
        SysUserTable.Close;
        SysUserTable.Free;
     end;
  end;

  procedure MakeSAppliedFor;
  Var
     SucklerQuery : TQuery;
  begin
     try
        SucklerQuery := TQuery.Create(nil);
        SucklerQuery.DatabaseName := AliasName;
        with SucklerQuery do
           begin
              SQL.Add('CREATE TABLE "SAppliedFor.db"');
              SQL.Add('(');
              SQL.Add(' ID AUTOINC,');
              SQL.Add(' ApplicationID INTEGER,');
              SQL.Add(' AnimalID INTEGER,');
              SQL.Add(' PRIMARY KEY(ID,ApplicationID,AnimalID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
     finally
        SucklerQuery.Close;
        SucklerQuery.Free;
     end;
  end;

  procedure MakeSApplic;
  Var
     SucklerQuery : TQuery;
  begin
     try
        SucklerQuery := TQuery.Create(nil);
        SucklerQuery.DatabaseName := AliasName;
        with SucklerQuery do
           begin
              SQL.Add('CREATE TABLE "SApplic.db"');
              SQL.Add('(');
                    SQL.Add(' ID AUTOINC,');
              SQL.Add(' DateOfApplic DATE,');
                    SQL.Add(' RetensionDate DATE,');
              SQL.Add(' YearOfApplic INTEGER,');
                    SQL.Add(' HerdID INTEGER,');
              SQL.Add(' Description CHAR(30),');
              SQL.Add(' PRIMARY KEY(ID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
     finally
        SucklerQuery.Close;
        SucklerQuery.Free;
     end;
  end;

  // Create the Temporary Movement Table if it doesn't exist
  procedure MakeMovedTo;
  Var
     MovedTo : TTable;
  begin
     try
        MovedTo := TTable.Create(nil);
        MovedTo.DatabaseName := AliasName;
        with MovedTo do
           begin
              TableName := 'MovedTo.db';
              DatabaseName := AliasName;
              FieldDefs.Add( 'ID',           ftAutoInc, 0,  FALSE);
              FieldDefs.Add( 'HerdIdentity', ftString , 15,  FALSE);  // Animal ID
              FieldDefs.Add( 'Name',         ftString,  40,  FALSE);
              FieldDefs.Add( 'Townland',     ftString,  40,  FALSE);
              FieldDefs.Add( 'County',       ftString,  40,  FALSE);

              IndexDefs.Add( '','ID',[ixUnique,ixPrimary] );
              CreateTable;
           end;
     finally
        MovedTo.Close;
        MovedTo.Free;
     end;
  end;
  // Create the Purchase Deletion Table if it doesn't exist
  procedure MakePurchDeletion;
  Var
     PurchDeletionQuery : TQuery;
  begin
     try
        PurchDeletionQuery := TQuery.Create(nil);
        PurchDeletionQuery.DatabaseName := AliasName;
        with PurchDeletionQuery do
           begin
              SQL.Add('CREATE TABLE "phrd.db"');
              SQL.Add('(');
                    SQL.Add(' AID INTEGER,');
              SQL.Add(' PurchDate DATE,');
              SQL.Add(' PurchDesc CHAR(30),');
                    SQL.Add(' PurchPlace INTEGER,');
              SQL.Add(' Remark CHAR(40),');
                    SQL.Add(' DateChanged DATE,');
              SQL.Add(' TimeChanged TIME,');
                    SQL.Add(' ChangedBy CHAR(30),');
              SQL.Add(' HerdID INTEGER');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
     finally
        PurchDeletionQuery.Close;
        PurchDeletionQuery.Free;
     end;
  end;

  procedure MakeSaleDeletion;
  Var
     SaleDeletionQuery : TQuery;
  begin
     try
        SaleDeletionQuery := TQuery.Create(nil);
        SaleDeletionQuery.DatabaseName := AliasName;
        with SaleDeletionQuery do
           begin
              SQL.Add('CREATE TABLE "shrd.db"');
              SQL.Add('(');
                    SQL.Add(' AID INTEGER,');
              SQL.Add(' SaleDate DATE,');
                    SQL.Add(' SaleDesc CHAR(30),');
              SQL.Add(' SalePlace INTEGER,');
                    SQL.Add(' Remark CHAR(40),');
              SQL.Add(' DateChanged DATE,');
                    SQL.Add(' TimeChanged TIME,');
              SQL.Add(' ChangedBy CHAR(30),');
                    SQL.Add(' Sold BOOLEAN,');
              SQL.Add(' HerdID INTEGER');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
     finally
        SaleDeletionQuery.Close;
        SaleDeletionQuery.Free;
     end;
  end;

  procedure MakeMovement;
  Var
     MovementTable : TTable;
  begin
     try
        MovementTable := TTable.Create(nil);
        MovementTable.DatabaseName := AliasName;
        with MovementTable do
           begin
              TableName := 'Movements.db';
              DatabaseName := AliasName;
              FieldDefs.Add( 'EventID',      ftInteger, 0,  FALSE);
              FieldDefs.Add( 'AID',          ftInteger, 0,  FALSE);
              FieldDefs.Add( 'MovedTo',      ftInteger, 0,  FALSE);
              FieldDefs.Add( 'DateMovedBack',ftDate,    0,  FALSE);
              FieldDefs.Add( 'StillOffFarm' ,ftBoolean, 0,  FALSE);
              FieldDefs.Add( 'Remark' ,      ftString,  40,  FALSE);
              IndexDefs.Add( '','EventID',[ixUnique,ixPrimary] );
              CreateTable;
           end;
     finally
        MovementTable.Close;
        MovementTable.Free;
     end;
  end;

  procedure MakeInterHerd;
  Var
     InterHerdTable : TTable;
  begin
     try
        InterHerdTable := TTable.Create(nil);
        InterHerdTable.DatabaseName := AliasName;
        with InterHerdTable do
           begin
              TableName := 'IHM.db';
              DatabaseName := AliasName;

              FieldDefs.Clear;
              FieldDefs.Add( 'ID',         ftAutoInc,  0,FALSE);
              FieldDefs.Add( 'AnimalID',   ftInteger,  0,FALSE);
              FieldDefs.Add( 'LastHerdID', ftInteger,  0,FALSE);
              FieldDefs.Add( 'NewHerdID',  ftInteger,  0,FALSE);
              FieldDefs.Add( 'DateMoved',  ftDate,     0,FALSE);
              FieldDefs.Add( 'Remark',     ftString,  40,FALSE);
              FieldDefs.Add( 'OldSeqNo',   ftInteger,  0,FALSE);
              FieldDefs.Add( 'NewSeqNo',   ftInteger,  0,FALSE);
              CreateTable;
           end;
     finally
        InterHerdTable.Close;
        InterHerdTable.Free;
     end;
  end;

  procedure MakeAudit;
  Var
     DefTable,
     AuditTable : TTable;
  begin
     try
        AuditTable := TTable.Create(nil);
        AuditTable.DatabaseName := AliasName;

        DefTable := TTable.Create(nil);
        DefTable.DatabaseName := AuditTable.DatabaseName;
        DefTable.TableName := 'defaults.db';

        with AuditTable do
           begin
              TableName := 'Afdoa.db';
              DatabaseName := DefTable.DatabaseName;
              FieldDefs.Add( 'ID',         ftAutoInc, 0,FALSE);
              FieldDefs.Add( 'AID',   ftInteger, 0,FALSE);  // Animal ID
              FieldDefs.Add( 'DateChanged',ftDate,    0,FALSE);
              FieldDefs.Add( 'TimeChanged',ftTime,    0,FALSE);
              FieldDefs.Add( 'ItemChanged',ftSmallInt,0,FALSE);
              FieldDefs.Add( 'OldItem',    ftString,  20,FALSE);
              FieldDefs.Add( 'ChangedBy',  ftString,  30,FALSE);
              FieldDefs.Add( 'Remark',     ftString,  40,FALSE);

              IndexDefs.Add( '','ID',[ixUnique,ixPrimary] );
              IndexDefs.Add( 'iIDDate','AID;DateChanged',[ixCaseInsensitive] );
              CreateTable;
           end;

        try
           DefTable.Open;
           DefTable.First;
           if DefTable.RecordCount > 0 then
              begin
                 DefTable.Edit;
                 DefTable.FieldByName('AuditReCreated').AsDateTime := Now();
                 DefTable.Post;
              end;
        except

        end;

     finally
        DefTable.Close;
        DefTable.Free;
        AuditTable.Close;
        AuditTable.Free;
     end;
  end;

  procedure MakeBuyer;
  Var
     STable,
     BuyerTable : TTable;
     i : Integer;
  begin
     try
        BuyerTable := TTable.Create(nil);
        BuyerTable.TableName := 'Buyers.db';
        BuyerTable.DatabaseName := AliasName;

        STable := TTable.Create(nil);
        STable.TableName := 'suppliersbreeders.db';
        STable.DatabaseName := BuyerTable.DatabaseName;

        STable.Open;
        for i := 0 to STable.FieldCount-1 do
           if ( UPPERCASE(STable.FieldDefs.Items[i].Name) <> 'TRANSPORT' ) then
              BuyerTable.FieldDefs.Add( STable.FieldDefs.Items[i].Name,STable.FieldDefs.Items[i].DataType,
                                        STable.FieldDefs.Items[i].Size, STable.FieldDefs.Items[i].Required);
        BuyerTable.CreateTable;
     finally
        STable.Close;
        STable.Free;
        BuyerTable.Close;
        BuyerTable.Free;
     end;
  end;

  procedure MakeCowExt;
  Var
     CowExtQuery : TQuery;
  begin
     try
        CowExtQuery := TQuery.Create(nil);
        CowExtQuery.DatabaseName := AliasName;
        with CowExtQuery do
           begin
              SQL.Add('CREATE TABLE "CowExt.db"');
              SQL.Add('(');
                    SQL.Add(' AnimalId INTEGER,');
                    SQL.Add(' PIN INTEGER,');
              SQL.Add(' ITEM INTEGER,');
              SQL.Add(' CGI INTEGER,');
                    SQL.Add(' EBI SmallInt,');
                    SQL.Add(' CalcFrom CHAR(25),');
                    SQL.Add(' Country INTEGER,');
                    SQL.Add(' SRStatus CHAR(1),');
                    SQL.Add(' Awards CHAR(25),');
                    SQL.Add(' LatestClass CHAR(2),');
                    SQL.Add(' LatestClassScore INTEGER,');
              SQL.Add(' NoOfTimesClassedEX INTEGER,');
              SQL.Add(' FarmID CHAR(4),');
              SQL.Add(' PRIMARY KEY(AnimalID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
     finally
        CowExtQuery.Close;
        CowExtQuery.Free;
     end;
  end;

  var
     UpdateNo : Integer;  // To test against the iHerdVerNo in Const GenTypesConst.
     MyTable, LookUpDamSire, TmpTable : TTable;
     NoHFSNotifiedFlags, NoNotifiedFlags, AlterAncestors, AlterPregDiag, AlterCountries, AlterGenLookUp, AlterOwners, AlterBullExt,
     AlterDefaults, AlterDefaultsForExten, AlterDefaultsForUpdateNo, AlterDefaultHerd, AlterDefaultsShowAll, AlterDefaultBackUp,
     AlterNMR, AlterMilk, GenBool, AddLactIndex, AlterPurchSales, AlterSales, AlterPurch, AddTBDate, AddDeductions, AddIdentifier,
     AlterCustomers, AlterEvents, AlterDeaths, AlterOwnersCountry, AlterExtDefaults, UpDateOK, RunReCheck, RunReIndex : Boolean;
     NewID              : Integer;
  begin
     Result := False;
     try

     MyQuery := TQuery.Create(nil);
     MyQuery.DatabaseName := AliasName;

     LookUpDamSire := TTable.Create(nil);
     LookUpDamSire.DatabaseName := AliasName;
     LookUpDamSire.TableName := 'animals.db';

     MyTable := TTable.Create(nil);
     MyTable.DatabaseName := AliasName;

     try
        MyTable.TableName := 'MilkDisk';
        MyTable.Open;

        AlterNMR  := ( MyTable.FieldDefs.IndexOf('NMRRecording') > 0 );

        AlterMilk := ( MyTable.FieldDefs.IndexOf('EventType') > 0 );

     finally
        MyTable.Close;
     end;

     if AlterNMR Or AlterMilk then
        try
           // Drop a Field
           MyQuery.SQL.Clear;

           if AlterNMR then
              begin
                 MyQuery.SQL.Add('ALTER TABLE MilkDisk DROP NMRRecording');
                 MyQuery.Prepare;
                 MyQuery.ExecSQL;
                 MyQuery.Close;
              end;

           if AlterMilk then
              begin
                 MyQuery.SQL.Clear;
                 MyQuery.SQL.Add('ALTER TABLE MilkDisk DROP EventType, DROP EventDate, DROP HerdNumber, DROP DateOfRecording');
                 MyQuery.Prepare;
                 MyQuery.ExecSQL;
                 MyQuery.Close;
              end;
        finally
           MyQuery.Cancel;
        end;



   { Start of Default table alterations }
     // Can be used to Add Field to existing Data NOT in use at present
     try
        MyTable.TableName := 'Defaults';
        MyTable.Open;
        AlterDefaults := ( MyTable.FieldDefs.IndexOf('MilkLayout') < 0 );
        AlterDefaultHerd := ( MyTable.FieldDefs.IndexOf('DefaultHerdID') < 0 );
        AlterDefaultsForExten := ( MyTable.FieldDefs.IndexOf('LUCow') < 0 );
        AlterDefaultsForUpdateNo := ( MyTable.FieldDefs.IndexOf('UpdateNo') < 0 );
        AlterDefaultsShowAll := ( MyTable.FieldDefs.IndexOf('ShowAllAnimals') < 0 );

        // if the UpdateNo exist then set the UpdateNo to it
        UpdateNo := 0;
        MyTable.First;
        if NOT AlterDefaultsForUpdateNo then
           if ( MyTable.RecordCount > 0 ) then
              UpdateNo := MyTable.FieldByName('UpdateNo').AsInteger;
     finally
        MyTable.Close;
     end;

     if AlterDefaults then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD MilkLayout SMALLINT');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     if AlterDefaultHerd then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD DefaultHerdID INTEGER');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     if AlterDefaultsForExten then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD LUCow FLOAT, ADD LUEwe FLOAT,');
           MyQuery.SQL.Add('ADD LUSuckler FLOAT, ADD LU10Mth FLOAT, ADD LUUnder24Mth FLOAT,');
           MyQuery.SQL.Add('ADD LUOver24Mth FLOAT');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Defaults SET LUCow = 1.0, LUEwe = 0.15, LUSuckler = 1.0,');
           MyQuery.SQL.Add('LU10Mth = 0.6, LUUnder24Mth = 0.6, LUOver24Mth = 1.0');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;
     // Add a Number to store the Version Number
     if AlterDefaultsForUpdateNo then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD UpdateNo INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Defaults SET UpdateNo = 0');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add a Boolean to store the Show all Animals
     if AlterDefaultsShowAll then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD ShowAllAnimals BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Defaults SET ShowAllAnimals = FALSE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

   { End of Default table alterations }

     // Add New Fields to the Bull ext File
     try
        MyTable.TableName := 'BullExt';
        MyTable.Open;
        AlterBullExt := ( MyTable.FieldDefs.IndexOf('PIN') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterBullExt then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE BullExt ADD PIN INTEGER, ADD ITEM INTEGER, ADD CGI INTEGER, ADD CalcFrom CHAR(25),');
           MyQuery.SQL.Add('ADD SRStatus Char(1), ADD Awards CHAR(22), ADD LatestClass CHAR(2), ADD LatestClassScore INTEGER,');
           MyQuery.SQL.Add('ADD NoOfTimesClassedEX INTEGER, ADD FarmID CHAR(4)');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add New Fields to the Countries
     try
        MyTable.TableName := 'Countries';
        MyTable.Open;
        AlterCountries := ( MyTable.FieldDefs.IndexOf('UserCanDelete') < 0 );
     finally
        MyTable.Close;
     end;

     if AlterCountries then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Countries ADD UserCanDelete BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Countries SET UserCanDelete=FALSE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add New Fields to the Owners File
     try
        MyTable.TableName := 'Owners';
        MyTable.Open;
        AlterOwners := ( MyTable.FieldDefs.IndexOf('HerdPreFix') < 0 );
        AlterOwnersCountry := ( MyTable.FieldDefs.IndexOf('Country') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterOwners or AlterOwnersCountry then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           if AlterOwners then
              begin
                 MyQuery.SQL.Add('ALTER TABLE Owners ADD HerdPreFix CHAR(20), ADD HFSPIN INTEGER');
                 MyQuery.Prepare;
                 MyQuery.ExecSQL;
              end;
           MyQuery.Close;
           if AlterOwnersCountry then
              begin
                 // Country points at a record in the Countries Table
                 MyQuery.SQL.Clear;
                 MyQuery.SQL.Add('ALTER TABLE Owners ADD Country INTEGER,');
                 MyQuery.SQL.Add('ADD Restricted BOOLEAN');
                 MyQuery.Prepare;
                 MyQuery.ExecSQL;
                 try
                    MyTable.TableName := 'Countries';
                    MyTable.Open;
                    if NOT MyTable.Locate('Name','IRELAND',[loCaseInsensitive]) then
                       begin
                          // Add Ireland to the List
                          MyTable.Last;
                          NewID := MyTable.FieldByName('ID').AsInteger;
                          MyTable.Insert;
                          MyTable.FieldByName('ID').AsInteger := NewID+1;
                          MyTable.FieldByName('Name').AsString := 'IRELAND';
                          MyTable.FieldByName('UserCanDelete').AsBoolean := FALSE;
                          MyTable.Post;
                       end;
                    if NOT MyTable.Locate('Name','N.IRELAND',[loCaseInsensitive]) then
                       begin
                          // Add Ireland to the List
                          MyTable.Last;
                          NewID := MyTable.FieldByName('ID').AsInteger;
                          MyTable.Insert;
                          MyTable.FieldByName('ID').AsInteger := NewID+1;
                          MyTable.FieldByName('Name').AsString := 'N.IRELAND';
                          MyTable.FieldByName('UserCanDelete').AsBoolean := FALSE;
                          MyTable.Post;
                       end;
                 finally
                    MyTable.Cancel;
                    MyTable.Close;
                 end;
                 MyQuery.SQL.Clear;
                 MyQuery.SQL.Add('UPDATE Owners SET Country=1,');
                 MyQuery.SQL.Add('Restricted=FALSE');
                 MyQuery.Prepare;
                 MyQuery.ExecSQL;
              end;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add New Fields to the GenLookUp
     try
        MyTable.TableName := 'GenLook';
        MyTable.Open;
        AlterGenLookUp := ( MyTable.FieldDefs.IndexOf('LookUpCode') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterGenLookUp then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE GenLook ADD LookUpCode CHAR(6)');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;
     // Add New Index to the MilkDiskTrans
     try
        MyTable.TableName := 'MilkDiskTrans';
        MyTable.Open;
        try
           MyTable.IndexDefs.Update;
        except
           RunReIndex := TRUE;
        end;
        if NOT RunReIndex then
           RunReIndex := ( MyTable.IndexDefs.IndexOf('iMDTID') = -1 );
     finally
        MyTable.Close;
     end;
     // Add New Index to the Animal table
     try
        MyTable.TableName := 'Animals';
        MyTable.Open;
        try
           MyTable.IndexDefs.Update;
        except
           RunReIndex := TRUE;
        end;
        AlterAncestors := ( MyTable.FieldDefs.IndexOf('Ancestor') < 0 );
        if NOT RunReIndex then
           RunReIndex := ( MyTable.IndexDefs.IndexOf('iLactNo') = -1 );
     finally
        MyTable.Close;
     end;
     if AlterAncestors then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the Ancestor Flag
           // if true the animal can be hidden from user view.
           MyQuery.SQL.Add('ALTER TABLE Animals ADD Ancestor BOOLEAN');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
        finally
           MyQuery.Close;
        end;
     // Add New Fields to the Sales and Purchase files
     try
        MyTable.TableName := 'Purchases';
        MyTable.Open;
        AlterPurchSales := ( MyTable.FieldDefs.IndexOf('Price') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterPurchSales then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Purchases ADD Price FLOAT, ADD Weight FLOAT, ADD Grade CHAR(15)');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SalesDeaths ADD Price FLOAT, ADD Weight FLOAT, ADD Grade CHAR(15)');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;
     try
        MyTable.TableName := 'Customers';
        MyTable.Open;
        AlterCustomers := ( MyTable.FieldDefs.IndexOf('Licensed') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterCustomers then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Customers ADD Licensed BOOLEAN');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     try
        MyTable.TableName := 'Calvings';
        MyTable.Open;
        NoNotifiedFlags := ( MyTable.FieldDefs.IndexOf('ID1Notified') < 0 );
        NoHFSNotifiedFlags := ( MyTable.FieldDefs.IndexOf('ID1HFSNotified') < 0 );
     finally
        MyTable.Close;
     end;
     if NoNotifiedFlags then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Calvings ADD ID1Notified BOOLEAN,');
           MyQuery.SQL.Add('ADD ID2Notified BOOLEAN,');
           MyQuery.SQL.Add('ADD ID3Notified BOOLEAN,');
           MyQuery.SQL.Add('ADD ID4Notified BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Calvings SET ID1Notified=TRUE,');
           MyQuery.SQL.Add('ID2Notified=TRUE,');
           MyQuery.SQL.Add('ID3Notified=TRUE,');
           MyQuery.SQL.Add('ID4Notified=TRUE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     if NoHFSNotifiedFlags then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the fact the animals has been registered with
           // the HFS
           MyQuery.SQL.Add('ALTER TABLE Calvings ADD ID1HFSNotified BOOLEAN,');
           MyQuery.SQL.Add('ADD ID2HFSNotified BOOLEAN,');
           MyQuery.SQL.Add('ADD ID3HFSNotified BOOLEAN,');
           MyQuery.SQL.Add('ADD ID4HFSNotified BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Calvings SET ID1HFSNotified=FALSE,');
           MyQuery.SQL.Add('ID2HFSNotified=FALSE,');
           MyQuery.SQL.Add('ID3HFSNotified=FALSE,');
           MyQuery.SQL.Add('ID4HFSNotified=FALSE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     try
        MyTable.Close;
        MyTable.TableName := 'SalesDeaths';
        MyTable.Open;
        NoNotifiedFlags := ( MyTable.FieldDefs.IndexOf('Notified') < 0 );
     finally
        MyTable.Close;
     end;
     if NoNotifiedFlags then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SalesDeaths ADD Notified BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE SalesDeaths SET Notified=TRUE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Change Pregnany Diag and Set a BOOLEAN
     try
        MyTable.Close;
        MyTable.TableName := 'PregnancyDiag';
        MyTable.Open;
        AlterPregDiag := ( MyTable.FieldDefs.Items[MyTable.FieldDefs.IndexOf('PregnancyStatus')].DataType = ftString );
     finally
        MyTable.Close;
     end;
     if AlterPregDiag then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE PregnancyDiag ADD tPD BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE PregnancyDiag SET tPD=PregnancyStatus');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE PregnancyDiag DROP PregnancyStatus');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE PregnancyDiag ADD PregnancyStatus BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE PregnancyDiag SET PregnancyStatus=tPD');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE PregnancyDiag DROP tPD');
           MyQuery.ExecSQL;
           MyQuery.Close;

        finally
           MyQuery.Cancel;
        end;

     // Change Purchase Records add fields for Buyer
     try
        MyTable.TableName := 'Purchases';
        MyTable.Open;
        AlterPurch := (  MyTable.FieldDefs.IndexOf('Buyer') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterPurch then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Purchases ADD Buyer INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Change Sales/Deaths Records add fields for ColdDeadWt
     try
        MyTable.Close;
        MyTable.TableName := 'SalesDeaths';
        MyTable.Open;
        AlterSales := (  MyTable.FieldDefs.IndexOf('ColdDeadWt') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterSales then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SalesDeaths ADD ColdDeadWt FLOAT, ADD KillOut FLOAT');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Change Animals Records add fields for TBTestDate
     try
        MyTable.TableName := 'Animals';
        MyTable.Open;
        AddTBDate := (  MyTable.FieldDefs.IndexOf('TBTestDate') < 0 );
     finally
        MyTable.Close;
     end;
     if AddTBDate then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals ADD TBTestDate DATE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Change Owners to add Deductions
     try
        MyTable.TableName := 'Owners';
        MyTable.Open;
        AddDeductions := (  MyTable.FieldDefs.IndexOf('Deductions') < 0 );
        AddIdentifier := (  MyTable.FieldDefs.IndexOf('HerdIdentifier') < 0 );
     finally
        MyTable.Close;
     end;
     if AddDeductions Or AddIdentifier then
        try
           if AddDeductions then
              begin
                 MyQuery.SQL.Clear;
                 MyQuery.SQL.Add('ALTER TABLE Owners ADD Deductions FLOAT');
                 MyQuery.ExecSQL;
                 MyQuery.Close;
              end;
           if AddIdentifier then
              begin
                 MyQuery.SQL.Clear;
                 MyQuery.SQL.Add('ALTER TABLE Owners ADD HerdIdentifier CHAR(10)');
                 MyQuery.ExecSQL;
                 MyQuery.Close;
              end;
        finally
           MyQuery.Cancel;
        end;

     // Change Defaults to hold a date Audit File Created
     try
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('AuditCreated') < 0 );
        AlterDefaultBackUp := ( MyTable.FieldDefs.IndexOf('LastBackUp') < 0 );
     finally
        MyTable.Close;
     end;

     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD AuditCreated TIMESTAMP,');
           MyQuery.SQL.Add('ADD AuditReCreated TIMESTAMP, ADD CurrUser INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                 MyTable.Edit;
                 MyTable.FieldByName('AuditCreated').AsDateTime := Now();
                 MyTable.Post;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // Change Defaults to hold a Boolean to indicate if the user wants to use Mass Updates
     try
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('MassUpdates') < 0 );
     finally
        MyTable.Close;
     end;
     
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD MassUpdates BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                 MyTable.Edit;
                 MyTable.FieldByName('MassUpdates').AsBoolean := FALSE;
                 MyTable.Post;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // Add a Date to Store the Last BackUp Date
     if AlterDefaultBackUp then
        try
           MyQuery.SQL.Clear;
           // Add a Field to store the default Milk Country from Milk Layout Table
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD LastBackUp DATE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Change Defaults to hold a date Audit File Created
     try
        MyTable.TableName := 'SuppliersBreeders';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('Commission') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SuppliersBreeders ADD Commission FLOAT,');
           MyQuery.SQL.Add('ADD Transport FLOAT');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // Change Purchase Event Record
     try
        MyTable.TableName := 'Purchases';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('SupplierCosts') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Purchases ADD SupplierCosts FLOAT, ADD BuyerCosts FLOAT');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // Change Animals File Add a Deleted Boolean
     try
        MyTable.TableName := 'Animals';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('AnimalDeleted') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals ADD AnimalDeleted BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Animals SET AnimalDeleted=FALSE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // Add the HerdID to the Events Table
     try
        MyTable.Close;
        MyTable.TableName := 'Events';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('HerdID') < 0 );
     finally
        MyTable.Close;
     end;

     if GenBool then
        try
           LookUpDamSire.Open;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Events ADD HerdID INTEGER');
           MyQuery.ExecSQL;
           MyTable.TableName := 'Events';
           MyTable.Open;
           while NOT MyTable.EOF do
              begin
                 MyTable.Edit;
                 if LookUpDamSire.Locate('ID',MyTable.FieldByName('AnimalId').AsInteger,[] ) then
                    MyTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                 MyTable.Next;
              end;
        finally
           LookUpDamSire.Close;
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // Add the HerdID to the Applications Table
     try
        MyTable.Close;
        MyTable.TableName := 'Applications';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('HerdID') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           TmpTable := TTable.Create(nil);
           TmpTable.DatabaseName := AliasName;
           TmpTable.TableName := 'BeefSub';
           TmpTable.Filter := 'ApplicationID>-1';
           TmpTable.Filtered := TRUE;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Applications ADD HerdID INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyTable.TableName := 'Applications';
           MyTable.Open;
           TmpTable.Open;

           LookUpDamSire.Open;
           MyTable.First;
           while NOT MyTable.EOF do
              begin
                 MyTable.Edit;
                 if TmpTable.Locate('ApplicationID',MyTable.FieldByName('ApplicationID').AsInteger,[] ) then
                    if LookUpDamSire.Locate('ID',TmpTable.FieldByName('AnimalID').AsInteger,[] ) then
                       MyTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                 MyTable.Next;
              end;
        finally
           TmpTable.Close;
           TmpTable.Free;
           MyTable.Close;
           LookUpDamSire.Close;
           MyQuery.Cancel;
        end;

     // Check the Owners HFSPin is Alphanumeric
     try
        MyTable.Close;
        MyTable.TableName := 'Owners';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.Items[MyTable.FieldDefs.IndexOf('HFSPin')].DataType = ftInteger );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners ADD tHFS CHAR(15)');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyTable.Open;
           MyTable.First;
           while NOT MyTable.EOF do
              begin
                 MyTable.Edit;
                 MyTable.FieldByName('tHFS').AsString := MyTable.FieldByName('HFSPin').AsString;
                 MyTable.Post;
                 MyTable.Next;
              end;
           MyTable.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners DROP HFSPin');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners ADD HFSPin CHAR(15)');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Owners SET HFSPin=tHFS');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners DROP tHFS');
           MyQuery.ExecSQL;
           MyQuery.Close;

        finally
           MyQuery.Cancel;
        end;

     // Add the Active filter to Defaults
     try
        MyTable.Close;
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('ActiveFilter') < 0 );
     finally
        MyTable.Close;
     end;
     
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD ActiveFilter BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add the Default Farm to Defaults
     try
        MyTable.Close;
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('DefaultFarmID') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD DefaultFarmID INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     //Change Defaults.db to add a Boolean for UseScanner to indicate if the user wants to use a Bar Code Scanner
     try
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('UseScanner') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD UseScanner BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                 MyTable.Edit;
                 MyTable.FieldByName('UseScanner').AsBoolean := FALSE;
                 MyTable.Post;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // added 10/3/2000 K.Blackburn
     //Alter Customers.db to add Deductions and Transport
     try
        MyTable.TableName := 'Customers';
        MyTable.Open;
        AlterCustomers := ( MyTable.FieldDefs.IndexOf('Deductions') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterCustomers then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Customers ADD Deductions FLOAT, ADD Transport FLOAT');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // added 10/3/2000 K.Blackburn
     //Alter Purchases.db to add MeasuredWeight and MeasuredWtDate
     try
        MyTable.TableName := 'Purchases';
        MyTable.Open;
        AlterCustomers := ( MyTable.FieldDefs.IndexOf('MeasuredWeight') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterCustomers then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Purchases ADD MeasuredWeight FLOAT, ADD MeasuredWtDate DATE');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // added 10/3/2000 K.Blackburn
     //Alter SalesDeaths.db to add WeighingDate, FeedEndDate and CustomerCosts
     try
        MyTable.TableName := 'SalesDeaths';
        MyTable.Open;
        AlterCustomers := ( MyTable.FieldDefs.IndexOf('WeighingDate') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterCustomers then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SalesDeaths ADD CustomerCosts FLOAT, ADD FeedEndDate DATE, ADD WeighingDate DATE');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // added 10/3/2000 K.Blackburn
     //Alter Owners.db to add FixedCosts (Note: Deductions now in Customers.db)
     try
        MyTable.TableName := 'Owners';
        MyTable.Open;
        AlterCustomers := ( MyTable.FieldDefs.IndexOf('FixedCosts') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterCustomers then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners ADD FixedCosts FLOAT');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

   // add field owners.db for RSINumber SP 15/12/00
     with MyTable do
        try
           close;
           TableName := 'Owners.db';
           Open;
           try
              FieldByName('RSINumber').AsString;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text := 'ALTER TABLE Owners ADD RSINumber CHAR(20)';
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

     // add field owners.db for Title SP 15/12/00
     with MyTable do
        try
           close;
           TableName := 'Owners.db';
           Open;
           try
              FieldByName('Title').AsString;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text := 'ALTER TABLE Owners ADD Title CHAR(5)';
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

     // add field owners.db for Surname SP 15/12/00
     with MyTable do
        try
           close;
           TableName := 'Owners.db';
           Open;
           try
              FieldByName('Surname').AsString;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text := 'ALTER TABLE Owners ADD Surname CHAR(20)';
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

     // add field owners.db for Firstname SP 15/12/00
     with MyTable do
        try
           close;
           TableName := 'Owners.db';
           Open;
           try
              FieldByName('FirstName').AsString;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text := 'ALTER TABLE Owners ADD FirstName CHAR(20)';
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

     // add boolean to events table for ICBF events notified (added 28/2/2000 KR)
     try
        MyTable.TableName := 'Events';
        MyTable.Open;
        AlterEvents := ( MyTable.FieldDefs.IndexOf('ICBFNotified') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterEvents then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Events ADD ICBFNotified BOOLEAN');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                 MyTable.Edit;
                 MyTable.FieldByName('ICBFNotified').AsBoolean := FALSE;
                 MyTable.Post;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // add field to saledeath table for Culling reason (added 01/03/2000 KR)
     try
        MyTable.TableName := 'SalesDeaths';
        MyTable.Open;
        AlterDeaths := ( MyTable.FieldDefs.IndexOf('Culled') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterDeaths then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SalesDeaths ADD Culled INTEGER');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // add fields to calvings table for dead calves
     try
        MyTable.TableName := 'Calvings';
        MyTable.Open;
        AlterDeaths := ( MyTable.FieldDefs.IndexOf('DeadCalves') < 0 );
     finally
        MyTable.Close;
     end;
     if AlterDeaths then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Calvings ADD DeadCalves INTEGER,ADD Mortality INTEGER');
           MyQuery.Prepare;
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // Check the CowExt File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'CowExt';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeCowExt;
     end;

     // Check the Buyer Table exists
     try
        MyTable.Close;
        MyTable.TableName := 'Buyers';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeBuyer;
     end;

     // Check the Audit Table exists
     try
        MyTable.Close;
        MyTable.TableName := 'afdoa';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeAudit;
     end;

     // Check the Inter Herd File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'IHM';  // Herd Transfers between Herds on the System
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeInterHerd;
     end;

     // Check the Temporary Movement File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'Movements';  // Contain Temporary Movement Off Farm
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeMovement;
     end;

     // Check the Sale Deletion File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'shrd';  // Contain Sale Deletion info Herd Register
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('HerdID') < 0 );
     except
        RunReIndex := TRUE;
        MakeSaleDeletion;
     end;
     if GenBool then
        try
           MyTable.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE shrd ADD HerdID INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
           LookUpDamSire.Open;
           MyTable.Open;
           MyTable.First;
           while NOT MyTable.EOF do
              begin
                 if LookUpDamSire.Locate('Id',MyTable.FieldByName('AID').AsInteger, [] ) then
                    begin
                       MyTable.Edit;
                       MyTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                    end;
                 MyTable.Next;
              end;
        finally
           MyQuery.Cancel;
           LookUpDamSire.Close;
           MyTable.Close;
        end;

     // Check the Sale Deletion File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'phrd';  // Contain Sale Deletion info Herd Register
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('HerdID') < 0 );
     except
        RunReIndex := TRUE;
        MakePurchDeletion;
     end;
     if GenBool then
        try
           MyTable.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE phrd ADD HerdID INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
           LookUpDamSire.Open;
           MyTable.Open;
           MyTable.First;
           while NOT MyTable.EOF do
              begin
                 if LookUpDamSire.Locate('ID',MyTable.FieldByName('AID').AsInteger, [] ) then
                    begin
                       MyTable.Edit;
                       MyTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                    end;
                 MyTable.Next;
              end;
        finally
           MyQuery.Cancel;
           LookUpDamSire.Close;
           MyTable.Close;
        end;

     // Check the Moved To File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'MovedTo';   // Contains Name, HerdIdentity, Townland
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeMovedTo;
     end;

     // Check the Suckler Application File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'SApplic';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeSApplic;
     end;

     // Check the Suckler Application File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'SAppliedFor';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeSAppliedFor;
     end;

     // Add the PreSales Boolean to the SalesDeaths
     try
        MyTable.Close;
        MyTable.TableName := 'SalesDeaths';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('PreSale') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SalesDeaths ADD PreSale BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE SalesDeaths SET PreSale=FALSE');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     try
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Animals SET InHerd=FALSE');
           MyQuery.SQL.Add('WHERE ID IN (SELECT AnimalID FROM Animals,Events,SalesDeaths');
           MyQuery.SQL.Add('             WHERE (Animals.ID=Events.AnimalID)');
           MyQuery.SQL.Add('             AND   (Events.ID=SalesDeaths.EventID)');
           MyQuery.SQL.Add('             AND   (Events.EventType= '+IntToStr(CSaleDeathEvent)+')');
           MyQuery.SQL.Add('             AND   (SalesDeaths.PreSale=FALSE))');
           MyQuery.ExecSQL;
           MyQuery.Close;
        except
        //
        end
     finally
        MyQuery.Cancel;
     end;

     // Check the HerdBookNo Lenght it should be 16
     try
        MyTable.Close;
        MyTable.TableName := 'Animals';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.Items[MyTable.FieldDefs.IndexOf('HerdBookNo')].Size = 15 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals ADD tHBN CHAR(16)');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Animals SET tHBN=HerdBookNo');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals DROP HerdBookNo');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals ADD HerdBookNo CHAR(16)');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Animals SET HerdBookNo=tHBN');
           MyQuery.ExecSQL;
           MyQuery.Close;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals DROP tHBN');
           MyQuery.ExecSQL;
           MyQuery.Close;

        finally
           MyQuery.Cancel;
           RunReIndex := TRUE;
        end;

     // Add the Sequence Number to Animals
     try
        MyTable.Close;
        MyTable.TableName := 'Animals';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('SeqNo') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals ADD SeqNo INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add the Last Sequence Number to Owners File
     try
        MyTable.Close;
        MyTable.TableName := 'Owners';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('LastSeqNo') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners ADD LastSeqNo INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add the Sequence Number to Inter Herd Transfers
     try
        MyTable.Close;
        MyTable.TableName := 'ihm';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('OldSeqNo') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE ihm ADD OldSeqNo INTEGER, ADD NewSeqNo INTEGER');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Change Animals Records add field for SortAnimalNo
     try
        MyTable.TableName := 'Animals';
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('SortAnimalNo') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals ADD SortAnimalNo CHAR(10)');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     try
        MyTable.TableName := 'Animals';
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('SortNatID') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Animals ADD SortNatID CHAR(20)');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Check the System User File exists
     try
        MyTable.Close;
        MyTable.TableName := 'SysUsers';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeSysUsers;
     end;

     // Change Sales/Deaths Records add a field for KillNumber     KVB
     try
        MyTable.Close;
        MyTable.TableName := 'SalesDeaths';
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('KillNumber') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SalesDeaths ADD KillNumber CHAR(15)');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Check the Slaughter Application File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'SlghtAppliedFor';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeSlghtAppliedFor;
     end;

     // Check the Slaughter Animals on Application record File Exists
     try
        MyTable.Close;
        MyTable.TableName := 'SlghtApplic';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        MakeSlghtApplic;
     end;

     // Check if the Filters Default Table exists
     try
        MyTable.Close;
        MyTable.TableName := 'flt';
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('EventDateFrom') < 0 );
        if GenBool then
           try
              MyTable.Close;
              MyQuery.SQL.Clear;
              MyQuery.SQL.Add('ALTER TABLE flt ADD EventDateFrom DATE, ADD EventDateTo DATE');
              MyQuery.ExecSQL;
              MyQuery.Close;
           finally
              MyQuery.Cancel;
           end;
     except
        with MyQuery do
           begin
              SQL.Clear;
              SQL.Add('CREATE TABLE "flt.db"');
              SQL.Add('(');
                    SQL.Add(' ID        AUTOINC,');
                    SQL.Add(' HerdID    INTEGER,');   // NOT USED CURRENTLY
                    SQL.Add(' Sex1      BOOLEAN,');
                    SQL.Add(' Sex2      BOOLEAN,');
                    SQL.Add(' Sex3      BOOLEAN,');
                    SQL.Add(' DOBFrom   DATE,');
                    SQL.Add(' DOBTo     DATE,');
                    SQL.Add(' LactFrom  INTEGER,');
                    SQL.Add(' LactTo    INTEGER,');
                    SQL.Add(' Heats     BOOLEAN,');
                    SQL.Add(' Services  BOOLEAN,');
                    SQL.Add(' PD        BOOLEAN,');
                    SQL.Add(' DryingOff BOOLEAN,');
                    SQL.Add(' Calving   BOOLEAN,');
                    SQL.Add(' Health    BOOLEAN,');     // Determine if the Filter form should stay on top
                    SQL.Add(' Sales     BOOLEAN,');
                    SQL.Add(' Purchases BOOLEAN,');
                    SQL.Add(' Weighing  BOOLEAN,');
                    SQL.Add(' StayOnTop BOOLEAN,');     // Determine if the Filter form should stay on top
                    SQL.Add(' EventDateFrom DATE,');
                    SQL.Add(' EventDateTo   DATE,');
              SQL.Add(' PRIMARY KEY(ID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
        MyQuery.Close;
     end;

     // Add the Search Field Default to the Owners Table
     try
        MyTable.Close;
        MyTable.TableName := 'Owners';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('SearchField') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners ADD SearchField CHAR(10)');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Check the Purchase Header Table exists
     try
        MyTable.Close;
        MyTable.TableName := 'PurchGrpHeader';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        PurchGrpHeaderCreate;
     end;

     // Check the Purchase Detail Table exists
     try
        MyTable.Close;
        MyTable.TableName := 'PurchGrpData';
        MyTable.Open;
     except
        RunReIndex := TRUE;
        PurchGrpDataCreate;
     end;

     // Add VAT to Defaults
     try
        MyTable.Close;
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('VAT') < 0 );
     finally
        MyTable.Close;
     end;

     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD VAT FLOAT');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add Show Hints to Defaults
     try
        MyTable.Close;
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('ShowHints') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD ShowHints BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     // Add English Layout to MilkDisk Layouts
     try
        MyTable.Close;
        MyTable.TableName := 'MilkDiskLayout';
        GenBool := FALSE;
        MyTable.Open;
        // check for the English Record
        if ( NOT MyTable.Locate('Country','E',[] )) then
           GenBool := TRUE;
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyTable.Open;
           MyTable.Append;
           MyTable.FieldByName('Country').AsString := 'E';
           MyTable.FieldByName('DefaultName').AsString := 'dsmember.dat';
           MyTable.FieldByName('TestDatePos').AsInteger := 9;
           MyTable.FieldByName('TestDateLen').AsInteger := 8;
           MyTable.FieldByName('AnimalNoChars').AsInteger := 6;
           MyTable.FieldByName('AnimalNoPos').AsInteger := 18;
           MyTable.FieldByName('AnimalNoLen').AsInteger := 5;
           MyTable.FieldByName('DailyMilkYieldPos').AsInteger := 24;
           MyTable.FieldByName('DailyMilkYieldLen').AsInteger := 4;
           MyTable.FieldByName('DailyBFatPos').AsInteger := 29;
           MyTable.FieldByName('DailyBFatLen').AsInteger := 3;
           MyTable.FieldByName('DailyProtPos').AsInteger := 33;
           MyTable.FieldByName('DailyProtLen').AsInteger := 3;
           MyTable.FieldByName('DailyLactPos').AsInteger := 37;
           MyTable.FieldByName('DailyLactLen').AsInteger := 3;
           MyTable.FieldByName('Yield305Pos').AsInteger := 88;
           MyTable.FieldByName('Yield305Len').AsInteger := 6;
           MyTable.FieldByName('BFat305PercPos').AsInteger := 95;
           MyTable.FieldByName('BFat305PercLen').AsInteger := 3;
           MyTable.FieldByName('Prot305PercPos').AsInteger := 99;
           MyTable.FieldByName('Prot305PercLen').AsInteger := 3;
           MyTable.FieldByName('CumYieldPos').AsInteger := 48;
           MyTable.FieldByName('CumYieldLen').AsInteger := 6;
           MyTable.FieldByName('CumBFatPos').AsInteger := 55;
           MyTable.FieldByName('CumBFatLen').AsInteger := 3;
           MyTable.FieldByName('CumProtPos').AsInteger := 59;
           MyTable.FieldByName('CumProtLen').AsInteger := 3;
           MyTable.FieldByName('NoOfTestsPos').AsInteger := 67;
           MyTable.FieldByName('NoOfTestsLen').AsInteger := 2;
           MyTable.FieldByName('DaysInMilkPos').AsInteger := 70;
           MyTable.FieldByName('DaysInMilkLen').AsInteger := 3;
           MyTable.FieldByName('SCCPos').AsInteger := 41;
           MyTable.FieldByName('SCCLen').AsInteger := 6;
           MyTable.Post;
           MyTable.Close;
        except
        end;

     // Change SuppliersBreeders to hold type Booleans
     try
        MyTable.TableName := 'SuppliersBreeders';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('AnimalSupplier') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE SuppliersBreeders ADD AnimalSupplier BOOLEAN,');
           MyQuery.SQL.Add('ADD MedicineSupplier BOOLEAN, ADD FeedSupplier BOOLEAN');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE SuppliersBreeders SET AnimalSupplier = TRUE');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE SuppliersBreeders SET MedicineSupplier = TRUE');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE SuppliersBreeders SET FeedSupplier = TRUE');
           MyQuery.ExecSQL;
           MyQuery.Close;

        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     //Adds the four new fields for the various Premium amounts for the Sales Report
     try
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('AmtBullPrem') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD AmtBullPrem FLOAT, ADD Amt10MthPrem FLOAT,');
           MyQuery.SQL.Add('ADD Amt22MthPrem FLOAT, ADD AmtSlghtPrem FLOAT');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                 MyTable.Edit;
                 MyTable.FieldByName('AmtBullPrem').AsFloat := 106.32;
                 MyTable.FieldByName('Amt10MthPrem').AsFloat := 85.60;
                 MyTable.FieldByName('Amt22MthPrem').AsFloat := 85.60;
                 MyTable.FieldByName('AmtSlghtPrem').AsFloat := 21.00;
                 MyTable.Post;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;


     //Adds four new booleans to the Owners File for use in the Group Purchase Screens
     //VATRegistered if Owner is VAT Registered
     //PurchWeighing if Owner weighs animals on purchase
     //Premiums if Owner is interested in 10/22Mth premium information
     //PurchGrpAutoGridUpdates for Auotmatic Grid Updates on the Group Purchase Screen
     try
        MyTable.TableName := 'Owners';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('VATRegistered') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners ADD VATRegistered Boolean, ADD PurchWeighing Boolean,');
           MyQuery.SQL.Add('ADD Premiums Boolean, ADD PurchGrpAutoGridUpdates Boolean');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                   While Not ( MyTable.EOF ) do Begin
                       MyTable.Edit;
                       MyTable.FieldByName('VATRegistered').AsBoolean := False;
                       MyTable.FieldByName('PurchWeighing').AsBoolean := False;
                       MyTable.FieldByName('Premiums').AsBoolean := True;
                       MyTable.FieldByName('PurchGrpAutoGridUpdates').AsBoolean := True;
                       MyTable.Post;
                       MyTable.Next;
                   End;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     //Adds two new fields into PurchGrpData.db table for use in the Group Purchase Screen.
     //These fields hold the Booleans for the 10 and 22 month Premiums
     try
        MyTable.TableName := 'PurchGrpData';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('FirstPrem') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE PurchGrpData ADD FirstPrem Boolean, ADD SecondPrem Boolean');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                   While Not ( MyTable.EOF ) do Begin
                       MyTable.Edit;
                       MyTable.FieldByName('FirstPrem').AsBoolean := False;
                       MyTable.FieldByName('SecondPrem').AsBoolean := False;
                       MyTable.Post;
                       MyTable.Next;
                   End;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     //Adds one new field into PurchGrpData.db table for use in the Group Purchase Screen.
     //This field holds the Boolean for the Bull Premiums
     try
        MyTable.TableName := 'PurchGrpData';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('BullPrem') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE PurchGrpData ADD BullPrem Boolean');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                   While Not ( MyTable.EOF ) do Begin
                       MyTable.Edit;
                       MyTable.FieldByName('BullPrem').AsBoolean := False;
                       MyTable.Post;
                       MyTable.Next;
                   End;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     try
        MyTable.TableName := 'Defaults';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('LUEF0to6mths') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Defaults ADD LUEF0to6mths FLOAT, ADD LUEF6to12mths FLOAT,');
   //         MyQuery.SQL.Add('ADD LUEF1to2yrs FLOAT, ADD LUEF2plusyrs FLOAT, ADD LUEF2plusyrsCows FLOAT');
           MyQuery.SQL.Add('ADD LUEF1to2yrs FLOAT');
           MyQuery.ExecSQL;
           MyQuery.Close;
           MyTable.Open;
           MyTable.First;
           if MyTable.RecordCount > 0 then
              begin
                 MyTable.Edit;
                 MyTable.FieldByName('LUEF0to6mths').AsFloat := 0;
                 MyTable.FieldByName('LUEF6to12mths').AsFloat := 0.6;
                 MyTable.FieldByName('LUEF1to2yrs').AsFloat := 0.6;
                 MyTable.FieldByName('LUOver24Mth').AsFloat := 1.0;
                 MyTable.FieldByName('LUCow').AsFloat := 1.0;
                 MyTable.FieldByName('LUSuckler').AsFloat := 1.0;
                 MyTable.Post;
              end;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

     // Check if the AFilters Table exists - This hold ID currently on the Grid
     try
        MyTable.Close;
        MyTable.TableName := 'AFilters';
        MyTable.Open;
     except
        with MyQuery do
           begin
              SQL.Clear;
              SQL.Add('CREATE TABLE "AFilters.db"');
                    SQL.Add('(');
                    SQL.Add(' AID     INTEGER,');
              SQL.Add(' PRIMARY KEY(AID)');
              SQL.Add(')');
              ExecSQL; // Create the TABLE
           end;
        MyQuery.Close;
     end;

     // Check if the Primary Key for AFilters Table exists.      //KVB 30/01/2001
     try
        MyTable.Close;
        MyTable.TableName := 'AFilters';
        MyTable.DeleteTable;
        with MyQuery do
           begin
              SQL.Clear;
              SQL.Add('CREATE TABLE "AFilters.db"');
              SQL.Add('(');
              SQL.Add(' AID     INTEGER,');
              SQL.Add(' PRIMARY KEY(AID)');
              SQL.Add(')');
              ExecSQL;
           end;
        MyQuery.Close;
        MyTable.Open;
     except
        //MessageDlg('Cannot delete and recreate AFilters.db, Please contact Kingswood',mtInformation,[mbOK],0);
     end;

     // Check the Periods of the Premium Types
     try
        MyTable.Close;
        MyTable.TableName := 'PremiumTypes.DB';
        MyTable.Open;
        MyTable.First;
        RunReCheck := FALSE;
        while NOT MyTable.EOF do
           begin
               if ( MyTable.FieldByName('Type').AsString = 'B' ) and
                  ( MyTable.FieldByName('TimeFromDOBMonths').AsInteger <> 7 ) then
                  RunReCheck := TRUE;
               if ( MyTable.FieldByName('Type').AsString = 'F' ) and
                  ( MyTable.FieldByName('TimeFromDOBMonths').AsInteger <> 7 ) then
                  RunReCheck := TRUE;
               if ( MyTable.FieldByName('Type').AsString = 'S' ) and
                  ( MyTable.FieldByName('TimeFromDOBMonths').AsInteger <> 20 ) then
                  RunReCheck := TRUE;
               if RunReCheck then
                  begin
                     MyTable.Edit;
                     if ( MyTable.FieldByName('Type').AsString = 'B' ) or
                        ( MyTable.FieldByName('Type').AsString = 'F' ) then
                        begin
                           MyTable.FieldByName('TimeFromDOBMonths').AsInteger := 7;
                           if ( MyTable.FieldByName('Type').AsString = 'B' ) then
                              MyTable.FieldByName('TimeOutMonths').AsInteger := 0
                           else
                              MyTable.FieldByName('TimeOutMonths').AsInteger := 20;
                        end;
                     if ( MyTable.FieldByName('Type').AsString = 'S' ) then
                        begin
                           MyTable.FieldByName('TimeFromDOBMonths').AsInteger := 20;
                           MyTable.FieldByName('TimeOutMonths').AsInteger := 0;
                        end;
                     MyTable.FieldByName('RetensionDays').AsInteger := 2;
                  end;
               MyTable.Next;
           end;
        MyTable.Close;
     except
        MyTable.Close;
     end;

     // Check if the Ext001 Table has the Suckler Quota
     try
        MyTable.Close;
        MyTable.TableName := 'ext001';
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('SucklerQuota') < 0 );
        MyTable.Close;
        if GenBool then
           begin
              with MyQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Ext001 ADD SucklerQuota INTEGER');
                    ExecSQL; // Create the TABLE
                 end;
              MyQuery.Close;
           end;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('NoSucklerHeifers') < 0 );
        MyTable.Close;
        if GenBool then
           begin
              with MyQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Ext001 ADD NoSucklerHeifers INTEGER,');
                    SQL.Add('ADD LUSSucklerHeifers FLOAT');
                    ExecSQL; // Create the TABLE
                 end;
              MyQuery.Close;
           end;
     except
        MyTable.Close;
        CreateExtTable;
     end;

     // Check if the Animals Table has the BirthWeight
     try
        MyTable.Close;
        MyTable.TableName := 'Animals';
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('BirthWeight') < 0 );
        MyTable.Close;
        if GenBool then
           begin
              with MyQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Animals ADD BirthWeight FLOAT');
                    ExecSQL; // Create the Field
                 end;
              MyQuery.Close;
           end;
     except
        MyTable.Close;
     end;

     // Check if the Calving Table Birthtype is Integer
     try
        MyTable.Close;
        MyTable.TableName := 'Calvings';
        MyTable.Open;
        GenBool := (MyTable.FieldDefs.Items[MyTable.FieldDefs.IndexOf('BirthType')].DataType = ftString );
        MyTable.Close;
        if GenBool then
           begin
              with MyQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Calvings ADD TempBirthType INTEGER');
                    ExecSQL; // Create the Field
                    SQL.Clear;
                    SQL.Add('UPDATE Calvings SET TempBirthType=CAST(BirthType AS INTEGER)');
                    SQL.Add('WHERE (BirthType IS NOT NULL)');
                    ExecSQL; // Set the Field Values
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Calvings DROP BirthType');
                    ExecSQL; // Drop the Field
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Calvings ADD BirthType INTEGER');
                    ExecSQL; // Create the Field
                    SQL.Clear;
                    SQL.Add('UPDATE Calvings SET BirthType=TempBirthType');
                    ExecSQL; // Set New field Values
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Calvings DROP TempBirthType');
                    ExecSQL; // Drop Temp Field
                 end;
              MyQuery.Close;
           end;
     except
        MyTable.Close;
     end;


     { Create SaleGrps.db Table }
     with MyTable do
      try
       close;
       tablename:='SaleGrps.db';
       try
        open;
       except

        Active:=False;
        with fielddefs do
         begin
          clear;
          add('SaleGrps_Id',ftAutoInc,0,True);
          add('Group_Id',ftInteger,0,True);
          add('FileDate',ftDateTime,0,False);
          add('FileType',ftString,30,False);
          add('FileVersion',ftInteger,0,True);
          add('FileCreatedBy',ftInteger,0,False);
          add('Customer_Id',ftInteger,0,False);
          add('RemittanceCount',ftInteger,0,False);
          add('RemittanceNumber',ftInteger,0,False);
          add('RemittanceDate',ftDateTime,0,False);
          add('SlaughterDate',ftDateTime,0,False);
          add('LotReference',ftInteger,0,False);
          add('ProducerReference',ftInteger,0,False);
          add('CarcaseCount',ftInteger,0,False);
          add('TotalValue',ftFloat,0,False);
          add('TotalDeductions',ftFloat,0,False);
          add('PaymentAmt',ftFloat,0,False);
          add('PaymentNum',ftString,30,False);
         end;

         with indexdefs do
          begin
           clear;
           add('','SaleGrps_ID',[ixPrimary,ixUnique]);
           add('RemittanceDateIDX','RemittanceDate',[ixCaseInsensitive]);
          end;

         try
          CreateTable;
         except
         end;

       end;
      finally
       close;
      end;

     { Create Deductions Table }
     with MyTable do
      try
       close;
       TableName:='Deductions.db';
       try
        open;
       except
        Active:=False;
        with fielddefs do
        begin
         clear;
         add('deduction_id',ftautoinc,0,True);
         add('SaleGrps_id',ftInteger,0,False);
         add('Description',ftString,20,False);
         add('Details',ftString,30,False);
         add('Deducted',ftFloat,0,False);
         add('VAT',ftFloat,0,False);
        end;

        with indexdefs do
         begin
          clear;
          add('','deduction_id',[ixPrimary,ixUnique]);
         end;

        try
         CreateTable;
        except
        end;
       end;
      finally
       close;
      end;

     { Alter SalesDeath table }
     with myTable do
      try
       close;
       TableName:='SalesDeaths.db';
       Open;
       try
        FieldByName('CarcassNum').asInteger;
       except
        Close;

        with myquery do
         try
          sql.text:='alter table salesdeaths '+
                    'add CarcassNum integer, '+
                    'add CarcassSex varchar(1), '+
                    'add LeftWt     float, '+
                    'add RightWt    float, '+
                    'add CondemnedWt float, '+
                    'add PricePerKg float, '+
                    'add SaleGrps_Id integer';
          try
           execsql;
          except
          end;
         finally
         end;
       end;
      finally
       close;
      end;

     { Alter grps table }
     with myTable do
        try
           try
              close;
              tablename:='Grps.db';
              open;
              try
                 FieldByName('AdditionalData').asBoolean;
              except
                 Close;

                 with MyQuery do
                    try
                       sql.text:='alter table grps '+
                                 'add AdditionalData boolean';
                       execsql;
                    except
                      //
                    end;
              end;
           except
              //
           end;

      finally
       close;
      end;

   // new tables for feed costs as per kb's specs
   // create manufacturers table  19/5/00 - kr
     with MyTable do
        try
           close;
           tablename:='Manufacturers.db';
           try
              open;
           except
              Active:=False;
              with fielddefs do
                 begin
                    clear;
                    Add('ID',ftAutoInc,0,True);
                    Add('Name',ftString,30,False);
                    Add('Address1',ftString,30,False);
                    Add('Address2',ftString,30,False);
                    Add('Address3',ftString,30,False);
                    Add('Address4',ftString,30,False);
                    Add('Address5',ftString,30,False);
                    Add('Phone',ftString,30,False);
                    Add('Fax',ftString,30,False);
                    Add('EMail',ftString,50,False);
                 end;
              with indexdefs do
                 begin
                    clear;
                 end;
              try
                 CreateTable;
              except
                 //
              end;
           end;
        finally
           close;
        end;

   // create Feedtypes table  19/5/00 - kr
     with MyTable do
        try
           close;
           tablename:='FeedTypes.db';
           try
              open;
           except
              Active:=False;
              with fielddefs do
                 begin
                    clear;
                    Add('ID',ftAutoInc,0,True);
                    Add('Name',ftString,10,False);
                    Add('Description',ftString,30,False);
                    Add('Category',ftInteger,0,False);
                    Add('PurchUnit',ftInteger,0,False);
                    Add('FeedUnit',ftInteger,0,False);
                    Add('UnitCost',ftFloat,0,False);
                    Add('DefCostTon',ftFloat,0,False);
                    Add('DefQuantDay',ftFloat,0,False);
                    Add('Stock',ftFloat,0,False);
                    Add('LastFeedCalcDt',ftDate,0,False);
                    Add('CostTypeChangeDt',ftDate,0,False);
                    Add('InitStockDt',ftDate,0,False);
                    Add('StartDt',ftDate,0,False);
                    Add('EndDt',ftDate,0,False);
                    Add('LIFO',ftBoolean,0,False);
                    Add('IsSynchronized',ftBoolean,0,False);
                 end;
              with indexdefs do
                 begin
                    clear;
                 end;
              try
                 CreateTable;
              except
                 //
              end;
           end;
        finally
           close;
        end;

         try
            MyTable.TableName := 'PaddRotationExt';
            MyTable.Open;
            MyTable.Close;
         except
            with MyQuery do
               begin
                  SQL.Clear;
                  SQL.Add('CREATE TABLE "PaddRotationExt.db"');
                  SQL.Add('(');
                  SQL.Add(' EventID          INTEGER,');
                  SQL.Add(' Duration     INTEGER,');
                  SQL.Add(' PRIMARY KEY(EventID)');
                  SQL.Add(')');
                  ExecSQL; // Create the TABLE
               end;
         end;

     {
   // create FeedStocks table  19/5/00 - kr
     with MyTable do
        try
           close;
           tablename:='FeedStocks.db';
           try
              open;
           except
              Active:=False;
              with fielddefs do
                 begin
                    clear;
                    Add('ID',ftAutoInc,0,True);
                    Add('Name',ftString,10,False);
                    Add('Description',ftString,30,False);
                    Add('FeedType',ftInteger,0,False);
                    Add('StartDate',ftDate,0,False);
                    Add('EndDate',ftDate,0,False);
                    Add('UnitCost',ftFloat,0,False);
                    Add('UseDateInd',ftBoolean,0,False);
                    Add('InitialStock',ftFloat,0,False);
                    Add('StockQuantity',ftFloat,0,False);
                    Add('LowerPrice',ftFloat,0,False);
                    Add('UpperPrice',ftFloat,0,False);
                    Add('Sequence',ftFloat,0,False);
                 end;
              with indexdefs do
                 begin
                    clear;
                 end;
              try
                 CreateTable;
              except
                 //
              end;
           end;
        finally
           close;
        end;
   }
   // create FeedStockEvents table   19/5/00 - kr
     with MyTable do
        try
           close;
           tablename:='FdStkEvents.db';
           try
              open;
           except
              Active:=False;
              with fielddefs do
                 begin
                    clear;
                    Add('ID',ftAutoInc,0,True);
                    Add('FeedType',ftInteger,0,False);
                    Add('Supplier',ftInteger,0,False);
                    Add('Manufacturer',ftInteger,0,False);
                    Add('BatchNumber',ftString,30,False);
                    Add('EventDate',ftDate,0,False);
                    Add('Quantity',ftFloat,0,False);
                    Add('UnitCost',ftFloat,0,False);
                    Add('OtherCosts',ftFloat,0,False);
                    Add('FeedStock',ftInteger,0,False);
                    Add('Inc/Dec',ftBoolean,0,False);
                    Add('TotFeedPrice',ftFloat,0,False);
                 end;
              with indexdefs do
                 begin
                    clear;
                 end;
              try
                 CreateTable;
              except
                 //
              end;
           end;
        finally
           close;
        end;

   // create Feed Events table  19/5/00 - kr
     with MyTable do
        try
           close;
           tablename:='FeedEvents.db';
           try
              open;
           except
              Active:=False;
              with fielddefs do
                 begin
                    clear;
                    Add('ID',ftAutoInc,0,True);
                    Add('AnimalID',ftInteger,0,False);
                    Add('FeedType',ftInteger,0,False);
                    Add('AllocDate',ftDate,0,False);
                    Add('QuantDay',ftFloat,0,False);
                    Add('CostDay',ftFloat,0,False);
                    Add('Batch',ftInteger,0,False);
                    Add('FeedStock',ftInteger,0,False);
                    Add('EndDate',ftDate,0,False);
                    Add('TotalCost',ftFloat,0,False);
                 end;
              with indexdefs do
                 begin
                    clear;
                 end;
              try
                 CreateTable;
              except
                 //
              end;
           end;
        finally
           close;
        end;

   // create Feed Regime table  23/5/00 - kr
     with MyTable do
        try
           close;
           tablename:='FeedRegime.db';
           try
              open;
           except
              Active:=False;
              with fielddefs do
                 begin
                    clear;
                    Add('ID',ftAutoInc,0,True);
                    Add('GroupID',ftInteger,0,False);
                    Add('FeedType',ftInteger,0,False);
                    Add('AllocDate',ftDate,0,False);
                    Add('QuantDay',ftFloat,0,False);
                    Add('CostDay',ftFloat,0,False);
                 end;
              with indexdefs do
                 begin
                    clear;
                 end;
              try
                 CreateTable;
              except
                 //
              end;
           end;
        finally
           close;
        end;

   // Add field to Services - 22/5/00 - kr
     with myTable do
        try
           close;
           tablename:='Services.db';
           open;
           try
              FieldByName('GeneticDam').AsInteger;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text:='alter table services '+
                              'add GeneticDam integer';
                    try
                       ExecSQL;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

     // Add field to Animals - 30/5/00 - kr
     try
        MyTable.Close;
        MyTable.TableName := 'Animals';
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('DonorDamID') < 0 );
        MyTable.Close;
        if GenBool then
           begin
              with MyQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Animals ADD DonorDamID Integer');
                    ExecSQL;
                 end;
              MyQuery.Close;
           end;
     except
        MyTable.Close;
     end;

     // Add field to Medical Purchases - 22/5/00 - kr
   {   with myTable do
        try
           close;
           tablename:='MediPur.db';
           open;
           try
              FieldByName('BatchNo').AsString;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Clear;
                    SQL.Add('ALTER TABLE MediPur ADD BatchNo Char(30)');
                    ExecSQL;
                 except
                    //
                 end;
           end;
        finally
           close;
        end;

        SP Removed, using DrugPurchID instead.
   This will be used to get BatchNo and Expiry Date.

   }
   // Update SalesDeaths notified - 26/5/00 - kr
     with MyQuery do
        begin
           sql.clear;
           sql.add('update salesdeaths');
           sql.add('set Notified = TRUE');
           sql.add('where Notified IS NULL');
           try
              execsql;
           except
              //
           end;
        end;

   // ensure embryo transfer is available in gen look - kr 5/7/00
     with myTable do
        try
           close;
           TableName := 'GenLook';
           Open;
           if (NOT Locate('Description','Embryo Transfer',[])) then
              begin
                 Append;
                 FieldByName('ListType').AsInteger      := 1;
                 FieldByName('Description').AsString    := 'Embryo Transfer';
                 FieldByName('UserCanDelete').AsBoolean := False;
                 Post;
              end;
        finally
           close;
        end;

   // add boolean to customers.db for CMMS movement forms - kr 10/7/00
     with MyTable do
        try
           Close;
           TableName := 'Customers.db';
           Open;
           try
              FieldByName('CMMSForms').AsBoolean;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text := 'ALTER TABLE Customers ADD CMMSForms Boolean';
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

   // Update Customers CMMSForms notified - 13/7/00 - kr
     with MyQuery do
        begin
           SQL.Clear;
           SQL.Add('UPDATE Customers');
           SQL.Add('SET CMMSForms = TRUE');
           SQL.Add('WHERE CMMSForms IS NULL');
           try
              ExecSQL;
           except
              //
           end;
        end;

   // create cmms table to hold dept form allocations - 15/8/00 - kr
     try
        MyTable.Close;
        MyTable.TableName := 'CMMS';
        MyTable.Open;
     except
        with MyQuery do
           try
              SQL.Clear;
              SQL.Add('CREATE TABLE "CMMS.db"');
                    SQL.Add('(');
              SQL.Add('InitCMMSNo     INTEGER,');
              SQL.Add('CMMSAllocation INTEGER,');
                 SQL.Add('CurrCMMSNo     INTEGER,');
              SQL.Add('LastCMMSNo     INTEGER');
              SQL.Add(')');
              try
                 ExecSQL;
              except
                 //
              end;
           except
              //Messagedlg('Could Not Create CMMS table - Contact Kingswood',mtError,[mbok],0);
           end;
        MyTable.Close;
     end;

   // create blank initial record
     try
        MyTable.Close;
        MyTable.TableName := 'CMMS';
        MyTable.Open;
        if MyTable.IsEmpty then
           try
              MyTable.AppendRecord([0,0,0,0]);
              MyTable.Post;
           except
              //
           end;
     except
        MyTable.Close;
     end;

   // add boolean to customers.db for slaughter premium - kr 29/8/00
     with MyTable do
        try
           close;
           TableName := 'Customers.db';
           Open;
           try
              FieldByName('Slaughter').AsBoolean;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text := 'ALTER TABLE Customers ADD Slaughter Boolean';
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

   // Update Customers Slaughter boolean - 29/8/00 - kr
     with MyQuery do
        begin
           SQL.Clear;
           SQL.Add('UPDATE Customers');
           SQL.Add('SET Slaughter = TRUE');
           SQL.Add('WHERE Slaughter IS NULL');
           try
              ExecSQL;
           except
              //
           end;
        end;

   // add boolean to salesdeaths.db for slaughter premium - kr 29/8/00
     with MyTable do
        try
           close;
           TableName := 'SalesDeaths.db';
           Open;
           try
              FieldByName('Slaughter').AsBoolean;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text := 'ALTER TABLE Salesdeaths ADD Slaughter Boolean';
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

   // add field defaults.db for heifer slaughter premium - kr 30/8/00
     with MyTable do
        try
           close;
           TableName := 'Defaults.db';
           Open;
           try
              FieldByName('HeifSlghtPrem').AsFloat;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Text := 'ALTER TABLE Defaults ADD HeifSlghtPrem Float';
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

   // complete record
     try
        MyTable.Close;
        MyTable.TableName := 'Defaults';
        MyTable.Open;
        if MyTable.FieldByName('HeifSlghtPrem').IsNull then
           try
              MyTable.edit;
              MyTable.FieldByName('HeifSlghtPrem').AsFloat := 39.26;
              MyTable.Post;
           except
              //
           end;
     except
        MyTable.Close;
     end;

   //KVB Modify Owners.db to add VAT figure if VAT Registered
     try
        MyTable.Close;
        MyTable.TableName := 'Owners';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := ( MyTable.FieldDefs.IndexOf('VATRate') < 0 );
     finally
        MyTable.Close;
     end;
     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners ADD VATRate Float');
           MyQuery.ExecSQL;
        finally
           MyTable.Close;
           MyQuery.Cancel;
        end;

   // Add field to MDT for multi-herd recording - 28/9/00 - kr/sp
     with myTable do
        try
           close;
           tablename:='MDT.db';
           open;
           try
              FieldByName('MilkRecID').AsString;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Clear;
                    SQL.Add('ALTER TABLE MDT');
                    SQL.Add('ADD MilkRecID CHAR(15)');
                    try
                       ExecSQL;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

     // add field to events table for ICBF events action type - 8/11/00 - kr
     with MyTable do
        try
           Close;
           TableName:='Events.db';
           Open;
           try
              FieldByName('ICBFAction').AsString;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Events ADD ICBFAction Char(1)');
                    try
                       ExecSQL;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

   // Update Events for ICBFAction - 8/11/00 - kr
     with MyQuery do
        begin
           SQL.Clear;
           SQL.Add('UPDATE Events');
           SQL.Add('SET ICBFAction = "A"');
           SQL.Add('WHERE ICBFAction IS NULL');
           try
              ExecSQL;
           except
              //
           end;
        end;

     // add fields to Ext001.DB for extensification dates - kr 10/11/00
     with MyTable do
        try
           close;
           TableName := 'Ext001.DB';
           Open;
           try
              FieldByName('ExtDate1').AsDateTime;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Ext001 ADD ExtDate1 Date,');
                    SQL.Add('                   ADD ExtDate2 Date,');
                    SQL.Add('                   ADD ExtDate3 Date,');
                    SQL.Add('                   ADD ExtDate4 Date ');
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

   // create ICBF Deleted Events table - 15/11/00 - kr
     with MyTable do
        try
           close;
           tablename:='ICBFDelete.db';
           try
              open;
           except
              Active:=False;
              with fielddefs do
                 begin
                    clear;
                    Add('EventID',ftInteger,0,False);
                    Add('EventType',ftInteger,0,False);
                    Add('EventDate',ftDate,0,False);
                    Add('Action',ftString,1,False);
                    Add('Notified',ftBoolean,0,False);
                 end;
              with indexdefs do
                 begin
                    clear;
                 end;
              try
                 CreateTable;
              except
                 //
              end;
           end;
        finally
           close;
        end;

     // SP 23/03/01 Update CowExt drop RBI Add EBI
     if ( UpdateNo = 0 ) or ( UpdateNo < 3424 ) then
     with MyTable do
        try
           close;
           TableName := 'CowExt.DB';
           Open;
           try
              FieldByName('EBI').AsInteger;
           except
              Close;
              with MyQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('ALTER TABLE "CowExt.DB" DROP RBI');
                    ExecSQL;
                    SQL.Clear;
                    SQL.Add('ALTER TABLE "CowExt.DB" ADD EBI SmallInt,');
                    SQL.Add('                        ADD FamilyName Char(30)');
                    ExecSQL;
                 end;
           end;
        finally
           close;
        end;

     // SP 23/03/01 Create PedDetails (Pedigree Memo Table) - Link to animal via AnimalID SP 21/03/01
     with MyTable do
        try
           close;
           tablename:='PedDetails.db';
           try
              open;
           except
              Active:=False;
              with fielddefs do
                 begin
                    clear;
                    Add('ID',ftAutoInc,0,True);
                    Add('AnimalID',ftInteger,0,False);
                    Add('AnimalPedDetails',ftBlob,180,False);
                 end;
              with IndexDefs do
                 begin
                    Clear;
                 end;
              try
                 CreateTable;
              except
                 //
              end;
           end;
        finally
           close;
        end;

     // SP 23/03/01 Add Indexes for PedDetails Table
     with MyTable do
        try
           close;
           TableName:='PedDetails.db';
           MyTable.IndexDefs.Update;
           Active:=False;
           if (MyTable.IndexDefs.Count = 0) then
              begin
                 AddIndex(''           ,'ID'                              ,[ixPrimary,ixUnique]);
                 AddIndex('iAnimalID'   ,'AnimalID'                         ,[ixCaseInsensitive]);
              end;
        finally
           close;
        end;
     // Create new field in topping table "ApplicRate"

     // 15/05/01 Create table for Paddock Rotation Grid.
     With MyTable do
        try
           Close;
           TableName := 'TempPaddGrid';
           try
              open;
           except
              Active := False;
              with FieldDefs do
                 begin
                    FieldDefs.Clear;
                    FieldDefs.Add('PaddockID',ftInteger,0,FALSE);
                    FieldDefs.Add('Name',ftString,30,FALSE);
                    FieldDefs.Add('Selected',ftBoolean,0,FALSE);

                 end;
              with IndexDefs do
                 begin
                    Clear;
                    IndexDefs.Add('','PaddockID',[ixPrimary,ixUnique]);
                 end;
              try
                 CreateTable
              except
                //
              end;
           end;
        finally
           Close;
        end;

     // add fields to Owners.db for milk pricing/best cows in herd - kr 27/11/00
     with MyTable do
        try
           close;
           TableName := 'Owners.db';
           Open;
           try
              FieldByName('MilkPrice').AsFloat;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Owners ADD MilkPrice  Float,');
                    SQL.Add('                   ADD BFatPerc   Float,');
                    SQL.Add('                   ADD ProtPerc   Float,');
                    SQL.Add('                   ADD LactPerc   Float,');
                    SQL.Add('                   ADD BFatprice  Float,');
                    SQL.Add('                   ADD Protprice  Float,');
                    SQL.Add('                   ADD Lactprice  Float,');
                    SQL.Add('                   ADD BFatweight Float,');
                    SQL.Add('                   ADD Protweight Float,');
                    SQL.Add('                   ADD Lactweight Float,');
                    SQL.Add('                   ADD BFatvar    Float,');
                    SQL.Add('                   ADD Protvar    Float,');
                    SQL.Add('                   ADD Lactvar    Float,');
                    SQL.Add('                   ADD Measure Boolean');
                    try
                       execsql;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

   // Update owners for milkpricing - 27/11/00 - kr
     with MyQuery do
        begin
           SQL.Clear;
           SQL.Add('UPDATE Owners');
           SQL.Add('SET MilkPrice  = 0,');
           SQL.Add('    BFatPerc   = 3.6,');
           SQL.Add('    ProtPerc   = 3.3,');
           SQL.Add('    LactPerc   = 0,');
           SQL.Add('    BFatPrice  = 0,');
           SQL.Add('    ProtPrice  = 0,');
           SQL.Add('    LactPrice  = 0,');
           SQL.Add('    BFatWeight = 0,');
           SQL.Add('    ProtWeight = 0,');
           SQL.Add('    LactWeight = 0,');
           SQL.Add('    BFatVar    = 0,');
           SQL.Add('    ProtVar    = 0,');
           SQL.Add('    LactVar    = 0,');
           SQL.Add('    Measure    = True');
           SQL.Add('WHERE MilkPrice IS NULL');
           try
              ExecSQL;
           except
              //
           end;
        end;

     // add lactation field to feedevents table for bestcowsinherd report - 28/11/00 - kr
     with MyTable do
        try
           Close;
           TableName:='FeedEvents.db';
           Open;
           try
              FieldByName('Lact').AsInteger;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Clear;
                    SQL.Add('ALTER TABLE FeedEvents ADD Lact Integer');
                    try
                       ExecSQL;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;

     // add field to animals table for brucellosis testdate - 15/12/00 - kr
     with MyTable do
        try
           Close;
           TableName:='Animals.db';
           Open;
           try
              FieldByName('Brucellosis').AsDateTime;
           except
              Close;
              with MyQuery do
                 try
                    SQL.Clear;
                    SQL.Add('ALTER TABLE Animals ADD Brucellosis Date');
                    try
                       ExecSQL;
                    except
                       //
                    end;
                 finally
                    //
                 end;
           end;
        finally
           close;
        end;
     // add indexes to feedevents - 15/12/00 - kr
     with MyTable do
        try
           close;
           TableName:='FeedEvents.db';
           MyTable.IndexDefs.Update;
           Active:=False;
           if (MyTable.IndexDefs.Count = 0) then
              begin
                 AddIndex(''           ,'ID'                              ,[ixPrimary,ixUnique]);
                 AddIndex('AllocDate'  ,'AllocDate'                       ,[ixCaseInsensitive]);
                 AddIndex('iFeedType'  ,'FeedType'                        ,[ixCaseInsensitive]);
                 AddIndex('iLactAnimal','AnimalID;Lact;FeedType;AllocDate',[ixCaseInsensitive]);
              end;
        finally
           close;
        end;

     //KVB  19/04/2001
     //Add Year and Count to Defaults for Dept Calf Registration via Email
     try
        MyTable.Close;
        MyTable.TableName := 'Owners';
        GenBool := FALSE;
        MyTable.Open;
        GenBool := (  MyTable.FieldDefs.IndexOf('EMailYear') < 0 );
     finally
        MyTable.Close;
     end;

     if GenBool then
        try
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('ALTER TABLE Owners ADD EMailYear Integer, ADD EMailCount Integer');
           MyQuery.ExecSQL;

           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('UPDATE Owners');
           MyQuery.SQL.Add('SET EMailYear  = 2001,');
           MyQuery.SQL.Add('    EMailCount   = 1');
           MyQuery.ExecSQL;

           MyQuery.Close;
        finally
           MyQuery.Cancel;
        end;

     if LookUpDamSire <> nil then
        begin
           if LookUpDamSire.Active then
              LookUpDamSire.Active := False;
           LookUpDamSire.Free;
        end;

     if MyTable <> nil then
        begin
           if MyTable.Active then
              MyTable.Active := False;
           MyTable.Free;
        end;

     if MyQuery <> nil then
        begin
           if MyQuery.Active then
              MyQuery.Active := False;
           MyQuery.Free;
        end;

      Result := True;
     except
     end;

  end;

function CreateKilloutPerc : Boolean;

   procedure AddKillOutPercs (ACategory : String; APercentage : Double);
   begin
      UpdateTable.Append;
      UpdateTable.FieldByName('Category').AsString := ACategory;
      UpdateTable.FieldByName('Percentage').AsFloat := APercentage;
      UpdateTable.Post;
   end;

begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'KillOutPercs';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('Category', ftString, 20);
               Add('Percentage', ftFloat);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
            end;
         CreateTable;

         UpdateTable.TableName := 'KillOutPercs';
         UpdateTable.Open;
         if not ( UpdateTable.Locate('Category', 'Beef Cow', []) ) then
            begin
               AddKillOutPercs('Beef Cow', 52);
               AddKillOutPercs('Dairy Cow', 49);
               AddKillOutPercs('Beef Steer', 55);
               AddKillOutPercs('Dairy Steer', 51);
               AddKillOutPercs('Beef Bull', 57);
               AddKillOutPercs('Dairy Bull', 54);
               AddKillOutPercs('Beef Heifer', 53);
               AddKillOutPercs('Dairy Heifer', 49);
               AddKillOutPercs('Other', 50);
               UpdateTable.Close;
            end;
         Result := True;
      finally
         Free;
      end;
end;

function CreateMilkTemperament : Boolean;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'MilkTemperament';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('EventID', ftInteger);
               Add('Score', ftInteger);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iEventID', 'EventID', [ixUnique, ixPrimary] );
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

//   20/12/11 [V5.0 R2.9] /MK Additional Feature - New Genlook List Types For Tesco Johnes Event.
function CreateJohnesResultTable : Boolean;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'JohnesResult';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('EventID', ftInteger);
               Add('Result', ftInteger);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iEventID', 'EventID', [ixUnique, ixPrimary] );
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

//   28/03/12 [V5.0 R4.8] /MK Additional Feature - New Table To Store Reports.
function CreateReportsTable : Boolean;

   procedure AddKeyReport(AReportName : string);
   begin
      if not UpdateTable.Locate('ReportName', AReportName, []) then
         begin
            UpdateTable.Append;
            try
               UpdateTable.FieldByName('ReportName').AsString := AReportName;
               UpdateTable.FieldByName('KeyReport').AsBoolean := True;
               UpdateTable.FieldByName('Favourite').AsBoolean := False;
               UpdateTable.FieldByName('AmountUsed').AsInteger := 0;
               UpdateTable.FieldByName('ReportGenerator').AsBoolean := False;
               UpdateTable.Post;
            except
               UpdateTable.Cancel;
            end;
        end;
   end;

   procedure AddReportGenerator(AReportName : string);
   begin
      if not UpdateTable.Locate('ReportName', AReportName, []) then
         begin
            UpdateTable.Append;
            try
               UpdateTable.FieldByName('ReportName').AsString := AReportName;
               UpdateTable.FieldByName('KeyReport').AsBoolean := False;
               UpdateTable.FieldByName('Favourite').AsBoolean := False;
               UpdateTable.FieldByName('AmountUsed').AsInteger := 0;
               UpdateTable.FieldByName('ReportGenerator').AsBoolean := True;
               UpdateTable.Post;
            except
               UpdateTable.Cancel;
            end;
        end;
   end;

begin
   with UpdateTable do
     try
        TableName := 'Reports';
        if not Exists then
           begin
              with FieldDefs do
                 begin
                    Clear;
                    Add('ID', ftAutoInc);
                    Add('ReportName', ftString, 50);
                    Add('KeyReport', ftBoolean);
                    Add('Favourite', ftBoolean);
                    Add('AmountUsed', ftInteger);
                    Add('ReportGenerator', ftBoolean);
                    Add('SortID', ftInteger);
                 end;

              with IndexDefs do
                 begin
                    Clear;
                    Add('iID', 'ID', [ixUnique, ixPrimary] );
                 end;
              CreateTable;
           end;

         Active := True;


         // Add Key Reports
         AddKeyReport(cStockOnHandRep);
         AddKeyReport(cPurchSalesAnalysisRep);
         AddKeyReport(cLivestockInvRep);
         AddKeyReport(cNutrientProdRep);
         AddKeyReport(cVetRegisterRep);

         if ( Def.Definition.dUseManCal ) then
            AddKeyReport(cBreedingChartRep);

         if ( Def.Definition.dUseBeefMan ) then
            AddKeyReport(cCattleMargRep);

         if ( Def.Definition.dUseQuotaMan ) then
            AddKeyReport(cSeasonCalvHerdRep);

         if ( Def.Definition.dUseMilkRec ) then
            begin
               AddKeyReport(cBestCowsInHerdRep);
               AddKeyReport(cMonthRecReviewRep);
            end;

         // Add ReportGen Reports
         AddReportGenerator(cVetRepGenRep);

         if ( Def.Definition.dUseManCal ) then
            begin
               AddReportGenerator(cHerdRepGenRep);
               AddReportGenerator(cCalfPerfGenRep);
            end;

         if ( Def.Definition.dUseQuotaMan ) then
            AddReportGenerator(cFertRepGenRep);

         if ( Def.Definition.dUseMilkRec ) then
            AddReportGenerator(cMilkPerfGenRep);

         if ( Def.Definition.dUsePedigree ) then
            AddReportGenerator(cPedRepGenRep);

          Result := True;
     finally
        Active := False;
     end;
end;

//   16/05/12 [V5.0 R5.7] /MK Additional Feature - Added The New SortID And ReportGen Fields.
function UpdateReportsTable : Boolean;
var
   OldCalfPerformanceID : Integer;

   procedure UpdateSortAndReportGen ( ASortID : Integer; AReportName : String; AReportGen : Boolean );
   var
      qUpdateTable : TQuery;
   begin
      qUpdateTable := TQuery.Create(nil);
      with qUpdateTable do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE Reports');
            SQL.Add('SET SortID = :ASortID');
            SQL.Add('WHERE ReportName = :AReportName');
            Params[0].AsInteger := ASortID;
            Params[1].AsString := AReportName;
            Prepare;
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE Reports');
            SQL.Add('SET ReportGenerator = :AReportGen');
            SQL.Add('WHERE ReportName = :AReportName');
            Params[0].AsBoolean := AReportGen;
            Params[1].AsString := AReportName;
            Prepare;
            ExecSQL;

         finally
            Close;
            Free;
         end;
   end;

begin
   Result := False;
   UpdateTable.TableName := 'Reports';
   if not FieldExists('ReportGenerator') then // Make sure the field doesn't exist
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add ReportGenerator BOOLEAN');
            Prepare;
            ExecSQL;

            SQL.Clear;
            SQL.Add('ALTER TABLE "'+UpdateTable.TableName+'" Add SortID INTEGER');
            Prepare;
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE "'+UpdateTable.TableName+'" SET ReportGenerator = FALSE');
            Prepare;
            ExecSQL;

         except
            on e : exception do
               begin
                  Showmessage(e.Message);
                  Result := False;
                  Exit;
               end;
         end;

   with UpdateQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT * FROM "'+UpdateTable.TableName+'" ');
         Open;

         OldCalfPerformanceID := 0;
         First;
         while not EOF do
            begin
               // Update SortID Of Key Reports For Better Sorting
               if ( FieldByName('ReportName').AsString = cStockOnHandRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 1 ) ) then
                        UpdateSortAndReportGen(1,cStockOnHandRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cPurchSalesAnalysisRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 2 ) ) then
                        UpdateSortAndReportGen(2,cPurchSalesAnalysisRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cLivestockInvRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 3 ) ) then
                        UpdateSortAndReportGen(3,cLivestockInvRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cNutrientProdRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 4 ) ) then
                        UpdateSortAndReportGen(4,cNutrientProdRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cVetRegisterRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 5 ) ) then
                        UpdateSortAndReportGen(5,cVetRegisterRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cBreedingChartRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 6 ) ) then
                        UpdateSortAndReportGen(6,cBreedingChartRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cCattleMargRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 7 ) ) then
                        UpdateSortAndReportGen(7,cCattleMargRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cSeasonCalvHerdRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 8 ) ) then
                        UpdateSortAndReportGen(8,cSeasonCalvHerdRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cBestCowsInHerdRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 9 ) ) then
                        UpdateSortAndReportGen(9,cBestCowsInHerdRep,False);
                  end
               else if ( FieldByName('ReportName').AsString = cMonthRecReviewRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 10 ) ) then
                        UpdateSortAndReportGen(10,cMonthRecReviewRep,False);
                  end

               // Update SortID For Report Generator Reports
               else if ( FieldByName('ReportName').AsString = cHerdRepGenRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 11 ) ) then
                        UpdateSortAndReportGen(11,cHerdRepGenRep,True);
                  end
               else if ( FieldByName('ReportName').AsString = cCalfPerfGenRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 12 ) ) then
                        UpdateSortAndReportGen(12,cCalfPerfGenRep,True);
                  end
               else if ( FieldByName('ReportName').AsString = cVetRepGenRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 13 ) ) then
                        UpdateSortAndReportGen(13,cVetRepGenRep,True);
                  end
               else if ( FieldByName('ReportName').AsString = cFertRepGenRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 14 ) ) then
                        UpdateSortAndReportGen(14,cFertRepGenRep,True);
                  end
               else if ( FieldByName('ReportName').AsString = cMilkPerfGenRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 15 ) ) then
                        UpdateSortAndReportGen(15,cMilkPerfGenRep,True);
                  end
               else if ( FieldByName('ReportName').AsString = cPedRepGenRep ) then
                  begin
                     if ( not(FieldByName('SortID').AsInteger = 16 ) ) then
                        UpdateSortAndReportGen(16,cPedRepGenRep,True);
                  end;

               // Get the old Calf Performance Generator ReportGenerator ID from Reports table.
               //   26/11/18 [V5.8 R5.5] /MK Bug Fix - During the while not eof loop OldCalfPerformanceID was being assigned to zero so
               //                                      OldCalfPerformanceID would never be greater than zero, therefore the Calf Performance report
               //                                      was always showing when it should been removed.
               if ( FieldByName('ReportName').AsString = 'Calf Performance Generator' ) then
                  OldCalfPerformanceID := FieldByName('ID').AsInteger;

               Next;
            end;

         // Delete the old Calf Performance Generator ReportGenerator ID from Reports table.
         if OldCalfPerformanceID > 0 then
            begin
               // Delete Old Calf Performance Report Default.
               UpdateQuery.SQL.Clear;
               UpdateQuery.SQL.Add('DELETE FROM '+UpdateTable.TableName+'');
               UpdateQuery.SQL.Add('WHERE ID = '+IntToStr(OldCalfPerformanceID)+' ');
               try
                  UpdateQuery.ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;

      finally
         Result := True;
      end;
end;

function CreateSyncDefaults : Boolean;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'SyncDefaults';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('MaxInUseBullCount', ftInteger);
            end;
         CreateTable;

         with UpdateQuery do
            begin
               SQL.Clear;
               SQL.Add('INSERT INTO SyncDefaults (MaxInUseBullCount,NoOfYearsHealthHistory) VALUES ('+IntToStr(cSync_MaxInUseBullCount)+',1)');
               ExecSQL;
            end;

         Result := True;
      finally
         Free;
      end;
end;

function UpdateSyncDefaults : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'SyncDefaults';
   try
      //   03/08/21 [V6.0 R1.7] /MK Change - Add MaxInUseBullCount if the field doesn't exist and default count to 60.
      if not FieldExists('MaxInUseBullCount') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add MaxInUseBullCount INTEGER ');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET MaxInUseBullCount = 60 ');
               ExecSQL;

               Result := True;
            finally
            end;

      if not FieldExists('NoOfYearsHealthHistory') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add NoOfYearsHealthHistory INTEGER ');
               ExecSQL;

               SQL.Clear;
               SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET NoOfYearsHealthHistory = 1 ');
               ExecSQL;

               Result := True;
            finally
            end;

      if not FieldExists('SvrMilkTimeStamp') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add SvrMilkTimeStamp CHAR(25) ');
               ExecSQL;
               Result := True;
            finally
            end;

      if not FieldExists('SvrICBAPITimeStamp') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add SvrICBAPITimeStamp CHAR(25) ');
               ExecSQL;

               Result := True;
            finally
            end;

      if not FieldExists('SvrGrpTimeStamp') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add SvrGrpTimeStamp CHAR(25) ');
               ExecSQL;

               Result := True;
            finally
            end;

      if not FieldExists('ClientGrpTimeStamp') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add ClientGrpTimeStamp TIMESTAMP ');
               ExecSQL;

               Result := True;
            finally
            end;

      //   19/08/20 [V5.9 R5.5] /MK Additional Feature - Added the herdEvaluationModifiedOn for sync of EBI records from server.
      if not FieldExists('herdEvaluationModifiedOn') then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add herdEvaluationModifiedOn DATE ');
               ExecSQL;

               Result := True;
            finally
            end;

      //   03/08/21 [V6.0 R1.7] /MK Change - If MaxInUseBullCount field exists and count is currently 20 then change to 60 - GL/SP/Adrian Thackleberry request.
      if ( FieldExists('MaxInUseBullCount') ) then
         with UpdateQuery do
            try
               SQL.Clear;
               SQL.Add('SELECT MaxInUseBullCount FROM '+UpdateTable.TableName);
               Open;
               if ( FieldByName('MaxInUseBullCount').AsInteger = 20 ) then
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('UPDATE '+UpdateTable.TableName+' SET MaxInUseBullCount = 60');
                     ExecSQL;
                  end;
               Result := True;
            finally
            end;

   except
      Result := False;
   end;
end;

function CreateTargetWeightsTable : Boolean;
begin
   Result := False;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'TargetWeights';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('ID',ftAutoInc);
               Add('BirthTarget',ftFloat);
               Add('6WeekTarget',ftFloat);
               Add('3MonthTarget',ftFloat);
               Add('6MonthTarget',ftFloat);
               Add('12MonthTarget',ftFloat);
               Add('15MonthTarget',ftFloat);
               Add('21MonthTarget',ftFloat);
               Add('24MonthTarget',ftFloat);
               Add('DailyKgWarning',ftFloat);
            end;

         CreateTable;
         Open;

         // Add default params from Noel John O'Meara Reports.
         Append;
         FieldByName('BirthTarget').AsFloat := 38;
         FieldByName('6WeekTarget').AsFloat := 63;
         FieldByName('3MonthTarget').AsFloat := 90;
         FieldByName('6MonthTarget').AsFloat := 155;
         FieldByName('12MonthTarget').AsFloat := 280;
         FieldByName('15MonthTarget').AsFloat := 330;
         FieldByName('21MonthTarget').AsFloat := 490;
         FieldByName('24MonthTarget').AsFloat := 550;
         FieldByName('DailyKgWarning').AsFloat := 0.7;
         Post;

         Result := True;
      finally
         Free;
      end;
end;

function CreateICBFDamEventTable : Boolean;
begin
   Result := False;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'ICBFDamEvent';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('EventID',ftInteger);
               Add('MilkAbility',ftInteger);
               Add('Docility',ftInteger);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iEventID', 'EventID', [ixPrimary, ixUnique]);
            end;

         CreateTable;

         Result := True;
      finally
         Free;
      end;
end;

function CreateICBFStockBullEventTable : Boolean;
begin
   Result := False;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'ICBFStockBullEvent';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('EventID',ftInteger);
               Add('Functionality',ftInteger);
               Add('Docility',ftInteger);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iEventID', 'EventID', [ixPrimary, ixUnique]);
            end;

         CreateTable;

         Result := True;
      finally
         Free;
      end;
end;

function CreateParlourLinkTable : Boolean;
begin
   Result := False;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'ParlourLink';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('ParlourType',ftString,50);
               Add('ParlourDir',ftString,100);
               Add('LinkFileName',ftString,100);
               Add('Dryoff',ftBoolean);
               Add('Calving',ftBoolean);
               Add('Services',ftBoolean);
               Add('Heats',ftBoolean);
               Add('PD',ftBoolean);
               Add('Sales/Death',ftBoolean);
               Add('ParlourMilk',ftBoolean);
               Add('RationCalc',ftBoolean);
               Add('ParlourEvents',ftBoolean);
               Add('MilkGroupNo',ftInteger);
               Add('DryGroupNo',ftInteger);
               Add('HeiferGroupNo',ftInteger);
               Add('KGroups',ftBoolean);
               Add('KFeedGroups',ftBoolean);
               Add('KBatchGroups',ftBoolean);
               Add('ReadNetworkLink',ftBoolean);
            end;

         CreateTable;

         Result := True;
      finally
         Free;
      end;
end;

function UpdateParlourLink : Boolean;
begin
   Result := False;
   UpdateTable.TableName := 'Parlourlink';
   Result := ( FieldExists('ReadNetworkLink') );
   if ( not(Result) ) then // Make sure the field doesn't exist
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add ReadNetworkLink BOOLEAN ');
            try
               ExecSQL;
            except
               Result := False;
            end;

            SQL.Clear;
            SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET ReadNetworkLink = FALSE');
            try
               ExecSQL;
            except
               Result := False;
            end;
         finally
            Result := True;
         end;

   //   07/05/19 [V5.8 R9.2] /MK Change - Added MooMonitor field to ParlourLink.db.
   Result := ( FieldExists('ReadDairyMasterMooMonitor') );
   if ( not(Result) ) then // Make sure the field doesn't exist
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add ReadDairyMasterMooMonitor BOOLEAN ');
            try
               ExecSQL;
            except
               Result := False;
            end;

            SQL.Clear;
            SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET ReadDairyMasterMooMonitor = FALSE');
            try
               ExecSQL;
            except
               Result := False;
            end;
         finally
            Result := True;
         end;

   //   19/12/19 [V5.9 R1.5] /MK Change - Added ImportFromParlour field to ParlourLink.db.
   Result := ( FieldExists('ImportFromParlour') );
   if ( not(Result) ) then
      with UpdateQuery do
         try
            SQL.Clear;
            SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add ImportFromParlour BOOLEAN ');
            try
               ExecSQL;
            except
               Result := False;
            end;

            SQL.Clear;
            SQL.Add('UPDATE ' + UpdateTable.TableName + ' SET ImportFromParlour = False ');
            try
               ExecSQL
            except
               Result := False;
            end;
         finally
            Result := True;
         end;
end;

function CreateICBFCalfSurveyTable : Boolean;
begin
   Result := False;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'ICBFCalfSurveyEvent';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('EventID',ftInteger);
               Add('Quality',ftInteger);
               Add('Docility',ftInteger);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iEventID', 'EventID', [ixPrimary, ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

function UpdateICBFCalfSurvey : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'ICBFCalfSurveyEvent';
   Result := FieldExists('CalfVitality');
   if ( not(Result) ) then
      with UpdateQuery do
         try
            try
               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add CalfVitality INTEGER');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add CalfSize INTEGER');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add CalfScour INTEGER');
               ExecSQL;

               SQL.Clear;
               SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add CalfPneumonia INTEGER');
               ExecSQL;
            except
               on e : Exception do
                  begin
                     Result := False;
                     ShowMessage(e.Message);
                  end;
            end;
         finally
            Result := True;
         end;
end;

function CreateSyncWarnings : Boolean;
begin
   Result := False;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'SyncWarnings';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('Id',ftAutoInc);
               Add('NatIdNo',ftString,20);
               Add('Warning',ftMemo,240);
               Add('RecordTimeStamp',ftDateTime);
               Add('IsCurrent',ftBoolean);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary, ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

//   10/02/16 [V5.5 R2.7] /MK Bug Fix - AnimalCart table defintion was the same as the SyncWarnings table definitions.
function CreateAnimalCart : Boolean;
begin
   Result := False;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'AnimalCart';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('AnimalID',ftInteger);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iAnimalID', 'AnimalID', [ixPrimary, ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

//   11/11/14 [V5.3 R8.9] /MK Additional Feature - Added new FullyImported field to the DrugsRegImportHeader table.
function UpdateDrugRegisterHeader : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'DrugsRegImportHeader';
   if ( UpdateTable.Exists ) then
      begin
         Result := ( FieldExists('FullyImported') );
         if ( not(Result) ) then // Make sure the field doesn't exist
            with UpdateQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add FullyImported BOOLEAN ');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;

                  SQL.Clear;
                  SQL.Add('UPDATE '+UpdateTable.TableName+'');
                  SQL.Add('SET FullyImported = TRUE');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               finally
                  Result := True;
               end;
      end;
end;

//   13/11/14 [V5.3 R8.9] /MK Additional Feature - Added new TreatmentSaved field to the DrugsRegImportDetail table.
function UpdateDrugRegisterDetail : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'DrugsRegImportDetail';
   if ( UpdateTable.Exists ) then
      begin
         Result := FieldExists('TreatmentSaved');
         if ( not(Result) ) then // Make sure the field doesn't exist
            with UpdateQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add TreatmentSaved BOOLEAN ');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;

                  SQL.Clear;
                  SQL.Add('UPDATE '+UpdateTable.TableName+'');
                  SQL.Add('SET TreatmentSaved = FALSE');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               finally
                  Result := True;
               end;

         //   12/12/14 [V5.4 R0.4] /MK Additional Feature - Added AnimalGroupCategoryType field to DrugsRegImportDetail for Category/Group facility.
         Result := ( FieldExists('AnimalGroupCategoryType') );
         if ( not(Result) ) then
            with UpdateQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add AnimalGroupCategoryType INTEGER ');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;

                  SQL.Clear;
                  SQL.Add('UPDATE '+UpdateTable.TableName+' SET AnimalGroupCategoryType = 1');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
            finally
               Result := True;
            end;
      end;
end;

function CreateMartEmailSuppliers : Boolean;
begin
   Result := True;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'MartEmailSuppliers';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('Id',ftAutoInc);
               Add('MartName',ftString,30);
               Add('Address1',ftString,30);
               Add('Address2',ftString,30);
               Add('Address3',ftString,30);
               Add('Address4',ftString,30);
               Add('Email',ftString,40);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary, ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

function UpdateDeletedCalvings : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'DeletedCalvings';
   if ( UpdateTable.Exists ) then
      begin
         //   15/07/15 [V5.4 R7.0] /MK Change - New field to store whether a full calving was deleted or some calves were deleted
         //                                     for the cow so the calves can be added to another cow.
         Result := ( FieldExists('FullCalvingDeleted') );
         if ( not(Result) ) then // Make sure the field doesn't exist
            with UpdateQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add FullCalvingDeleted BOOLEAN ');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               finally
                  Result := True;
                  Free;
               end;
      end;
end;

{
//   27/03/12 [V5.0 R4.5] /MK Change - Coded Out - Not In Use.
function CreateProfitMonitorTable : Boolean;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'ProfitMonitor';

         if Exists then
            begin
               Result := True;
               Exit;
            end;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('HerdID', ftInteger);
               Add('MilkFedToCalves', ftFloat);
               Add('ProteinPerc', ftFloat);
               Add('FatPerc', ftFloat);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixUnique, ixPrimary] );
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;
}

//      MK - coded out to fix Declan Morrissey problem - 27/05/08
{
function UpdateTmpPaddGrid : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'TempPaddGrid.db';
   if not UpdateTable.Exists then
      try
         with UpdateTable do
            begin
               with FieldDefs do
                  begin
                     Clear;
                     Add('PaddockID',ftInteger,0,FALSE);
                     Add('Name',ftString,30,FALSE);
                     Add('Selected',ftBoolean,0,FALSE);
                  end;

               with IndexDefs do
                  begin
                     Clear;
                     Add('','PaddockID',[ixPrimary,ixUnique]);
                  end;
               CreateTable;
            end;
       except
          on e : exception do
             begin
                Result := False;
                MessageDlg(E.Message, mtError, [mbOK],0);
             end;
       end;
end;
}


{         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'ODA']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName(fListType).AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName(fDescription).AsString    := 'Official Disposal Agency';
               UpdateTable.FieldByName(fUserCanDelete).AsBoolean := False;
               UpdateTable.FieldByName(fLookUpCode).AsString     := 'ODA';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'VL']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName(fListType).AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName(Description).AsString    := 'Veterinary Laboratory';
               UpdateTable.FieldByName(fUserCanDelete).AsBoolean := False;
               UpdateTable.FieldByName(LookUpCode).AsString     := 'VL';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'BOF']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName(fListType).AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName(fDescription).AsString    := 'Burial On Farm';
               UpdateTable.FieldByName(fUserCanDelete).AsBoolean := False;
               UpdateTable.FieldByName(fLookUpCode).AsString     := 'BOF';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'HK/K']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName(fListType).AsInteger      := LNIDisposalManner;
               // UpdateTable.FieldByName('Description').AsString    := 'Hunt Kennel/Knackery';
               // New Description
               UpdateTable.FieldByName(fDescription).AsString    := 'Hunt Kennels/Knackery';
               UpdateTable.FieldByName(fUserCanDelete).AsBoolean := False;
               UpdateTable.FieldByName(fLookUpCode).AsString     := 'HK/K';
               UpdateTable.Post;
            end
         else
            begin
               if UpdateTable.FieldByName('Description').AsString <> 'Hunt Kennels/Knackery' then
                  begin
                     UpdateTable.Edit;
                     UpdateTable.FieldByName('Description').AsString    := 'Hunt Kennels/Knackery';
                     UpdateTable.Post;
                  end;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'DWND']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName('Description').AsString    := 'Drowned';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'DWND';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'OC']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName('Description').AsString    := 'Own Consumption';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'OC';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'IOF']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName('Description').AsString    := 'Incinerated On Farm';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'IOF';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'ODS-2']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName('Description').AsString    := 'Official Disposal Scheme + Two';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'ODS-2';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'NTSS']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName('Description').AsString    := 'Nat Fallen Stock Scheme';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'NTSS';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'RP']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName('Description').AsString    := 'Rendering Plant';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'RP';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'OTMS']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName('Description').AsString    := 'OTMS Casualty Slaughter';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'OTMS';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LNIDisposalManner,'FDS2']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LNIDisposalManner;
               UpdateTable.FieldByName('Description').AsString    := 'Free Disposal Scheme 2YO+';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'FDS2';
               UpdateTable.Post;
            end;



         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'AB']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Abortion';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'AB';
               UpdateTable.Post;
            end;


         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'SB']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Stillborn';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'SB';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'SC']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Diarrhoea (scour)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'SC';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'CO']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Coccidiosis ( blood scour)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'CO';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'PN']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Pneumonia';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'PN';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'LW']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Lungworm (Hoose)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'LW';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'JL']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Joint III';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'LW';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'RW']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Ringworm';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'RW';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'DC']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Dystocia (Difficult Calving)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'DC';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'RP']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Retained Placenta';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'RP';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'EN']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Endometritis';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'EN';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'ME']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Metritis';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'ME';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'PY']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Pyometra';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'PY';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'AN']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Anoestrus';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'AN';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'FC']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Follicular Cyst';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'FC';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'LC']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Luteal Cyst';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'LC';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'MF']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Milk Fever';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'MF';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'DN']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Downer Cow';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'DN';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'GT']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Grass Tetany';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'GT';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'KE']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Ketosis';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'KE';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'FL']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Fatty Liver Syndrome';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'FL';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'LD']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Left Displaced Abomasum';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'LD';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'RD']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode2;
               UpdateTable.FieldByName('Description').AsString    := 'Right Displaced Abomasum';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'RD';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'BL']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Grass Bloat';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'BL';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'BL']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Grass Bloat';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'BL';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'AC']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Rumen Accidosis';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'AC';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'CL']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode2;
               UpdateTable.FieldByName('Description').AsString    := 'Colic';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'CL';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode2, 'MA']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode2;
               UpdateTable.FieldByName('Description').AsString    := 'Mastitis (cause if known)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'MA';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'EC']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode2;
               UpdateTable.FieldByName('Description').AsString    := 'Environmental (E. Coli)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'EC';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode2, 'CT']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Contagious (Staph.)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'CT';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'SM']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Summer Mastitis';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'SM';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'LA']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Lameness (cause is known)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'LA';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'MR']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Digital Dermatitis (Mortellaro)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'MR';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'FF']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Foul-inFoot (Footrot/scald)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'FF';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'SH']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Slurry Heel';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'SH';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'UL']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Ulcer';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'UL';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'DR']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Drop (Foot abcess)';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'DR';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LHealthCode, 'WL']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'White line disease';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'WL';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'AB']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Abortion';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'AB';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'AB']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Abortion';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'AB';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'AG']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Age';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'AG';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'BE']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Behaviour/Temperament';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'BE';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'VD']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Bovine Viral Diarrhoea';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'VD';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'CO']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Conformation';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'CO';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'EB']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'EBI';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'EB';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'HP']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'General Health Problems';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'EB';
               UpdateTable.Post;
            end;


         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'SC']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'High Somatic Cell Count';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'SC';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'IF']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Infertility';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'IF';
               UpdateTable.Post;
            end;


         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'IJ']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Injury';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'IJ';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'IP']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Intestine Problem';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'IP';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'JD']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Johne''s Disease';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'JD';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'LA']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Lameness';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'LA';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'LM']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Low Milk Production';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'LM';
               UpdateTable.Post;
            end;

         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'MA']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Mastitis';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'MA';
               UpdateTable.Post;
            end;


         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'SR']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Surplus to Requirements';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'SR';
               UpdateTable.Post;
            end;


         if not UpdateTable.Locate(fsListTypeLookupCode, VarArrayOf([LCulledCode, 'ZZ']), []) then
            begin
               UpdateTable.Append;
               UpdateTable.FieldByName('fListType').AsInteger      := LHealthCode;
               UpdateTable.FieldByName('Description').AsString    := 'Unknown/None of the above';
               UpdateTable.FieldByName('fUserCanDelete').AsBoolean := False;
               UpdateTable.FieldByName('LookUpCode').AsString     := 'ZZ';
               UpdateTable.Post;
            end;
}

// SP 16/03/2016 - To facilitate syncing of Feed Types
// Version V5.5 R4.3
function UpdateFeedTypes : boolean;
begin
   Result := True;
   UpdateTable.TableName := 'FeedTypes';
   if FieldExists('IsSynchronized') then Exit;
   with UpdateQuery do
      try
         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add IsSynchronized BOOLEAN ');
         ExecSQL;

         SQL.Clear;
         SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET IsSynchronized = FALSE ');
         ExecSQL;
      except
         Result := False;
      end;
end;

function UpdateBullings : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'Bullings';
   if FieldExists('RcmdBullInd') then Exit;
   with UpdateQuery do
      try
         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add RcmdBullInd INTEGER');
         ExecSQL;
      except
         Result := False;
      end;
end;

function CreateDeletedGrps : Boolean;
begin
   Result := True;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'DeletedGrps';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('GroupID',ftInteger);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iGroupID', 'GroupID', [ixPrimary, ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

function UpdateDeletedGrps : Boolean;
begin
   Result := True;
   UpdateTable.TableName := 'DeletedGrps';
   if FieldExists('ID') then Exit;
   with UpdateQuery do
      try
         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add GroupIDNew INTEGER');
         ExecSQL;

         SQL.Clear;
         SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET GroupIDNew = GroupID');
         ExecSQL;

         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" DROP GroupID');
         ExecSQL;

         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add ID AUTOINC');
         ExecSQL;

         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add GroupID INTEGER');
         ExecSQL;

         SQL.Clear;
         SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET GroupID = GroupIDNew');
         ExecSQL;

         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" DROP GroupIDNew');
         ExecSQL;

         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add DateDeleted DATE');
         ExecSQL;

         SQL.Clear;
         SQL.Add('ALTER TABLE "' + UpdateTable.TableName + '" Add IsSynchronized BOOLEAN');
         ExecSQL;

         SQL.Clear;
         SQL.Add('UPDATE "' + UpdateTable.TableName + '" SET IsSynchronized = FALSE');
         ExecSQL;
      except
         Result := False;
      end;
end;

function CreateTransferredAnimals : Boolean;
begin
   Result := True;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'TransferredAnimals';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('ID',ftAutoInc);
               Add('SourceTable',ftString,20);
               Add('KeyIDName',ftString,20);
               Add('KeyID',ftString,30);
               Add('NewAnimalID',ftInteger);
               Add('OldAnimalID',ftInteger);
               Add('CreatedOn',ftDate);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iId','Id',[ixPrimary, ixUnique]);
               Add('iNewAnimalId','NewAnimalID',[ixCaseInsensitive]);
               Add('iOldAnimalId','OldAnimalID',[ixCaseInsensitive]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

function CreateMedicineDiposal : Boolean;
begin
   Result := True;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'MedicineDisposal';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('ID',ftAutoInc);
               Add('DrugID',ftInteger);
               Add('DrugPurchID',ftInteger);
               Add('DrugBatchNo',ftString,30);
               Add('QtyDeducted',ftFloat);
               Add('QtyBeforeDeduct',ftFloat);
               Add('DisposalDate',ftDate);
               Add('WasteReason',ftInteger);
               Add('DisposalDesc',ftString,30);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iId','Id',[ixPrimary, ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

function CreateICBFAPIHerdHealth : Boolean;
begin
   Result := True;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'ICBFAPIHerdHealth';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('ID',ftAutoInc);
               Add('AnimalId',ftInteger);
               Add('ResourceId',ftInteger);
               Add('Event',ftString,15);
               Add('EventDate',ftDate);
               Add('QuarterLeftBack',ftBoolean);
               Add('QuarterRightBack',ftBoolean);
               Add('QuarterLeftFront',ftBoolean);
               Add('QuarterRightFront',ftBoolean);
               Add('Reason',ftString,2);
               Add('Fatal',ftBoolean);
               Add('CreatedOn',ftDateTime);
               Add('ModifiedOn',ftDateTime);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iId','Id',[ixPrimary, ixUnique]);
               Add('iResourceId','ResourceId',[ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

function CreateDNAResults : Boolean;
begin
   Result := True;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'DNAResults';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('ID',ftAutoInc);
               Add('AnimalID',ftInteger);
               Add('A1A2',ftString,5);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iId','Id',[ixPrimary,ixUnique]);
               Add('iAnimalID','AnimalID',[ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

function CreateEventsExt : Boolean;
begin
   Result := True;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'EventsExt';
         if Exists then
            begin
               Result := True;
               Exit;
            end;
         with FieldDefs do
            begin
               Clear;
               Add('ID',ftAutoInc);
               Add('EventID',ftInteger);
               Add('ClientID',ftString,40);
               Add('NatIDNo',ftString,20);
               Add('EventType',ftInteger);
               Add('IsDeleted',ftBoolean);
               Add('IsSynchronized',ftBoolean);
            end;
         with IndexDefs do
            begin
               Clear;
               Add('iId','Id',[ixPrimary,ixUnique]);
               Add('iEventID','EventID',[ixUnique]);
            end;
         CreateTable;
         Result := True;
      finally
         Free;
      end;
end;

end.
