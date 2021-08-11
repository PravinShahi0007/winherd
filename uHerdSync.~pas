{
   01/04/14 [V5.2 R9.3] /MK Change - Change made for export of groups if Drafting groups exist.

   14/10/14 [V5.3 R7.5] /MK Additional Feature - Added new function, GetTotNumberOfEvents, to get total of Herd data for Sync.

   06/11/14 [V5.3 R8.8] /MK Change - Main Calving Query - Use LEFT JOIN instead of INNER JOIN for GB customers that don't record Birth Type - SP/GL/TGM request.

   02/2015 SP - LocateAnimal Method.

   20/03/15 [V5.4 R3.4] /MK Additional Feature - CreateMedicinePurchases - Update medicine quantity and stock.

   30/04/15 [V5.4 R5.3] /MK Change - CreateHealthEvents - DrugPurchID = 0, don't create shell of drug purchase - GL/SP request.

   13/08/15 [V5.4 R7.3] /SP Bug Fix - FHerdQuery , while creating the Herd Node, the call to FHerdQuery.First was missing. generally not
                                      a problem but for Jan Fredricks his NoneHerd came after his own herd in the ownerfile.

   16/09/15 [V5.4 R8.5] /MK Additional Feature - Added new function, DBModifiedCount, to count the amount of events that have been modified.
                                                 These are non HerdSync events (animals, events, medicines, etc) that are set to synchronized where they were edited.

   23/09/15 [V5.4 R8.6] /SP Bug Fix - CreatePregDiagEvents - Set comment to not pregnant if not pregnant or keep comment user entered on app.

   30/10/15 [V5.4 R9.8] /MK Change - UpdatePregDiagEvent - Set the EventType to a new event type to allow for another PD to go in on the same lactation.

   09/11/15 [V5.5 R0.5] /MK Additional Feature - When creating Customers, Suppliers, Buyers & MedAdmin nodes export InUse field from table.
                                               - When create MedAdmin table export IsVet field from table.

   07/12/16 [V5.5 R2.1] /MK Bug Fix - GetDrugWithdrawalDates - Only assign MaxMeatWithDrawal, MaxMilkWithDrawal Date if drug is not an NA drug - SP request.
                                    - CreateHerdSyncData - Creating Drug Node - If MeatNADrug or MilkNADrug then create blank node - SP request.

   24/03/16 [V5.5 R4.5] /SP - Feed Purchase support

   06/07/16 [V5.5 R7.1] /SP - Incorporated change from relase version of purchase and sale CTSReg for Mike Green.

   28/09/16 [V5.6 R0.4] /SP - Added weighing events to export file.

   10/10/16 [V5.6 RX.X] /SP - Added support for TagPrefix - for use in APP for IE+EID tags

   12/04/17 [V5.6 R5.7] /MK Additional Feature - CreateAnimalNode - If female animal and animal is to be synchronised then add
                                                                    planned bull node to animal node if planned bull or bulling event exists or not - GL/SP request.

   25/04/17 [V5.6 R7.1] /MK Change - CreateAnimalNode - If female animal is in the herd only then create the planned bull node - SP request.
                                                      - If the animal is not breeding the create a blank planned bull node - SP request.

   28/09/17 [V5.7 R2.8] /MK Change - CreateHerdSyncData - Only export the first 25 characters of the batch number - SP Request.

   05/02/18 [V5.7 R7.8] /MK Bug Fix - CreateHerdSyncData - Bug introduced when I started to code the export of tranponders for SP. I then
                                                           took out the changes but forgot to enter in a comma on first line of FSyncDataQuery.

   11/07/18 [V5.8 R0.9] /MK Bug Fix - CreateWeighingEvents - If Comment entered on App then update EventComment with comment from App.

   01/11/18 [V5.8 R3.2] /MK Bug Fix - ReadHerdSyncData - Bring in the medicine purchases before the animal remedies.

   09/11/18 [V5.8 R4.6] /MK Additional Feature - CreateHerdSyncData - Added code to sync the DeletedGrps table.

   29/11/18 [V5.8 R5.5] /MK Bug Fix - CreateHerdSyncData - The Health and Weighing Events were outside of the FHerdQuery while not eof loop.

   03/12/18 [V5.8 R5.6] /MK Change - CreateHerdSyncData - Use FarmSyncSetting verbose parameter to see whether to sync sold animals - SP/R.Bourns.

   05/04/19 [V5.8 R8.5] /MK Change - CreateHerdSyncData - If the herd is not in Ireland then out put the Herd Identity as the Herd Identifier.

   08/04/19 [V5.8 R8.6] /MK Change - CreateSaleDeathEvents - PreSale needs to be set here for GetSaleEventInfo to pick up animal.

   16/05/19 [V5.8 R9.2] /MK Additional Feature - Added ToBeCulled status of the animal to AnimalNode - SP request.

   24/06/19 [V5.8 R9.6] /MK Additional Feature - Added MediPur and FdStkEvent to SyncOut file.

   01/10/19 [V5.9 R0.7] /MK Additional Feature - Added new procedure, CreateMilkProduction, to bring ICBF lact records down from server - SP request.

   04/11/19 [V5.9 R1.0] /MK Additional Feature - Removed sending and receiving of milk data until new FarmSync changes are ready - server database update - SP.

   08/11/19 [V5.9 R1.2] /MK Additional Feature - Receive Milk Production, Milk Recording and ICBFHerdHealth tables online.
                                               - Send/Receive Milk and ICBF Herd Health Sync TimeStamps.

   19/11/19 [V5.9 R1.3] /MK Change - SystemRegisteredCountry - If Owners.Country is Scotland, England, Wales then treat as England i.e. Britain.

   24/02/20 [V5.9 R2.5] /MK Bug Fix - CreateMilkRecording - Protein Perc was not being downloaded - Basil Helen.

   11/03/20 [V5.9 R2.8] /MK Change - CreateHerdSyncData - Sync MediPur - Only sync out the first 25 characters of Batch Number.
                                                        - Sync Customers - Trim the Customers name to 40 characters.
                                                        - Sync SuppliersBreeders - Trim the SuppliersBreeders name to 40 characters.

   11/03/20 [V5.9 R2.8] /MK Bug Fix - CreateHerdSyncData - Don't syc FdstkEvent records if there is no supplier selected.

   21/04/20 [V5.9 R3.5] /MK Additional Feature - New procedure, AddEventToEventsExt, which adds the clientID and EventId of new event to EventsExt table.
                                               - Added ClientId to Calvings, Remedy, DryOff, Service and Bulling events.
                                               - Added AddEventToEventsExt to these events also.
                                               - Added ClientId and AddEventsToEventsExt to Purchase, Sale and NewID events.
                            Bug Fix - CreateHerdSyncData - FdstkEvents - Only sync the first 25 characters of the batch number - Noel Walsh.

   12/05/20 [V5.9 R4.5] /MK Change - CreateCalvingEvents - When there are no calves then treat this as an aborted calving i.e. dead not tagged.

   19/05/20 [V5.9 R4.8] /MK Change - ResetSyncFlagsOnAllData - Added DeletedGrps and ModifiedOn to Grps reset sync.

   11/06/20 [V5.9 R4.8] /MK Additional Feature - Added the sexed semen to the output of the service events.
                                               - Added the sexed semen list type to FGenLookQuery on Initialize.
                                               - Added sexed semen to CreateServiceEvents.

   11/08/20 [V5.9 R5.3] /MK Change - CreateLastMilkRecCumulativeRecords - When the milk recording is imported allocate the animals last cummualtive record to the last milk recording imported.

   19/08/20 [V5.9 R5.5] /MK Additional Feature - Sync down of EBI values from ICBF.
                                               - Sync down the herdEvaluationModifiedOn from the server and store in syncDefaults.
                                               - Sync this up again to stop the EBI's coming down a second time.
                                               - Output SyncedEvents.xml file that holds all events that came down from the server to mark them as synced before RiaServices finishes sync.

   26/08/20 [V5.9 R6.0] /MK Additional Feature - CreateCalvingEvents - Get the existing EventID from the incoming ClientId.
                                                                     - If we don't have the ClientId already then do checks for Last Calving Event.
                                                                     - If we have already imported the calving event then check to see if the sire or dam needs to be changed.

   02/09/20 [V5.9 R6.0] /MK Change - Changed FAnimalQuery SQL to include animals that had left the herd.
                                   - Included the InHerd flag in the FAnimalQuery.
                                   - Allowed animals that had left the herd to have events recorded for them bar SaleDeath events.
                                   - This would allow events that come down from the server regardless if their sold or died to be stored in the EventsExt table - SP request.

   07/09/20 [V5.9 R6.0] /MK Change - When creating events, if the event date already exists for the event then add the event to EventExt table and
                                     add it to the array to FSyncedEventsArray and let it go back up the server as synced.
                                   - If the event already exists in the EventExt table, edit the record and add it to the FSyncedEventsArray
                                     so that it goes back up to the server as synced.

   16/09/20 [V5.9 R6.0] /MK Change - Bring down the DesktopId of the event from the server, then search for the ClientId first, if not found then search for the Event DesktopId
                                     to see if the event needs to be edited.

   22/09/20 [V5.9 R6.1] /MK Bug Fix - Removed saving of difference.txt to Temp folder, Gerard O'Malley didn't have a Temp folder to save the file
                                      so the sync didn't complete properly.

   22/10/20 [V5.9 R6.3] /SP Additional Feature - Added sync in and out of Condition Score events.

   20/11/20 [V5.9 R7.5] /MK Change - LocateAnimal - Search for animals In Herd first, if the animal is not in herd then use a filter for the tag number and get recent instance of animal.
                            Additional Feature - CreateHerdSyncData - Added code to sync out the Mastitis and Lameness events - Geraldine Murphy

   04/12/20 [V5.9 R7.8] /MK Change - CreateHealthEvents - If multi treatment then save first event as dryoff and any following treatments as remedy events.
                                                        - Also change the comment of following treatments of dry off events to Remedy Event similar to non Dry Off Events.
                                                        - Set new DryOffSaved variable boolean to true if event is dry off and its the first treatment.
                                   - AddEventToEventsExt - No need to check for EventId as we allow events to come in here that were not saved
                                                           because the animal doesn't exist in the database so push back the event as synced.

   05/02/21 [V5.9 R8.2] /MK Bug Fix - AddEventToEventsExt - Using Client instead of ClientId and not using double quotes around AClientId.

   09/02/21 [V5.9 R8.3] /SP Change - CreateHerdSyncData - Added ReportInDays to the Health events to be synced to the server.

   23/02/21 [V5.9 R8.5] /MK Change - CreateExistingClientIdElement - Changed format of eventDate node to 4 digit year to match server format
                                                                   - Changed format of dateofBirth node to 4 digit year to match server format
                                                                   - OpenCalvingQuery - Change LEFT JOIN to INNER JOIN to make the query quicker.
}

unit uHerdSync;

interface
uses
   db, dbTables, MSXML2_TLB, ComObj, Windows, SysUtils, Dialogs,
   KRoutines, EventRecording, GenTypesConst, uEventDataHelper,
   contnrs, uMedicinePurchaseRepository, uFeedPurchaseRepository,
   uMedicineRepository, ChkDebug, Def, classes, KDBRoutines,
   DateUtil, uFarmSyncSettings, bde, ShellApi, uAnimal;

const
    AnimalSync = 0;
    EventSync = 1;
    SupplierSync = 2;
    BuyerSync = 3;
    MilkLactSync = 4;
    GenLookSync = 5;
    VetAdminSync = 6;
    CustomerSync = 7;
    GroupSync = 8;
    MedicineSync = 9;
    DeletedEventsSync = 10;
    FeedTypeSync = 11;
    HerdFileSync = 12;
    DeletedGrps = 13;
    MediPurch = 14;
    FdStkEvents = 15;
    EventsExtSync = 16;

type
  TSyncOp = (soSyncDataIn, soSyncDataOut);
  TSyncDirection = (soSyncDataBothWays, soSyncDataToServerOnly);

  TSyncOutputParams = class
  private
    FResetSyncFlagsBeforeStart: Boolean;
    FOutputDrugWithdrawalDates: Boolean;
    FDatabaseName: string;
  public
     constructor create(AParams : TStrings);
     property ResetSyncFlagsBeforeStart : Boolean read FResetSyncFlagsBeforeStart;
     property OutputDrugWithdrawalDates : Boolean read FOutputDrugWithdrawalDates;
     property DatabaseName : string read FDatabaseName;
  end;

  TLookupObject = class
  private
    FDescription: string;
    FCode: string;
    function GetIsValid: Boolean;virtual;
    function GetCode: string;
  public
    property Code : string read GetCode write FCode;
    property Description : string read FDescription write FDescription;
    property IsValid : Boolean read GetIsValid;
  end;

  THealthCodeObject = class(TLookupObject);
  TApplicationMethod = class(TLookupObject);
  TServerDrug = class(TLookupObject)
  private
    FVPANumber: string;
    function GetIsValid: Boolean;override;
  public
     property VPANumber : string read FVPANumber write FVPANumber;
  end;

  TRemedyTreatment = class
  private
    FDaysTaken: byte;
    FTimesDaily: byte;
    FApplicationRate: double;
    FDrugVPANumber: string;
    FApplicationMethod: TApplicationMethod;
    FDrugBatchNumber: string;
    FAdministeredBy: string;
    FDrugName: string;
    FOfficialHealthCode: THealthCodeObject;
    FFarmHealthCode: THealthCodeObject;
  public
    constructor create;
    destructor destroy;override;
    property AdministeredBy : string read FAdministeredBy write FAdministeredBy;
    property ApplicationMethod : TApplicationMethod read FApplicationMethod write FApplicationMethod;
    property ApplicationRate : double read FApplicationRate write FApplicationRate;
    property TimesDaily : byte read FTimesDaily write FTimesDaily;
    property DaysTaken : byte read FDaysTaken write FDaysTaken;
    property DrugName : string read FDrugName write FDrugName;
    property DrugVPANumber : string read FDrugVPANumber write FDrugVPANumber;
    property DrugBatchNumber : string read FDrugBatchNumber write FDrugBatchNumber;
    property OfficialHealthCode : THealthCodeObject read FOfficialHealthCode write FOfficialHealthCode;
    property FarmHealthCode : THealthCodeObject read FFarmHealthCode write FFarmHealthCode;
  end;

  TRemedyTreatments = class(TObjectList)
  public
  end;

  THerdSync = class
  private
     FDatabasePath : string;

     FSyncOutputParams : TSyncOutputParams;

     FDocument : IXMLDOMDocument;
     FDrugListingDocument : IXMLDOMDocument;
     FRootNode,
     FOutputHerdsNode,
     FHerdNode,
     FOutputAnimalsNode,
     FOutputAnimalNode,
     FChildNode,
     FTechniciansNode,
     FTechnicianNode,
     FMedicineAdministratorsNode,
     FMedicineAdministratorNode,
     FFarmHealthCodesNode,
     FFarmHealthCodeNode,
     FSuppliersNode,
     FSupplierNode,
     FCustomersNode,
     FCustomerNode,
     FBuyersNode,
     FBuyerNode,
     FDrugsNode,
     FDrugNode,
     FDeleteIdsNode,
     FDeleteIdNode,

     FCullingCodesNode, FCullingCodeNode,
     FGroupsNode, FGroupNode, FGroupLinksNode, FGroupLinkNode, FGroupLinkChildNode,
     FOutputDeletedAnimalsNode : IXMLDOMNode;
     FTempNode : IXMLDOMNode;

     FBreedsNode,

     FListNode,
     FNode : IXMLDOMNode;

     FInputHerdsNode,
     FInputAnimalsNode : IXMLDOMNodeList;
     FInputAnimalsRootNode : IXMLDOMNode;
     FInputAnimalNode : IXMLDOMNode;

     FInputEventsNode : IXMLDOMNode;
     FInputEventNode : IXMLDOMNode;

     FInputSystemNode : IXMLDOMNode;

     FInputMilkLactationsNode : IXMLDOMNode;
     FInputMilkLactationNode : IXMLDOMNode;

     FInputAnimalRegistrationNode : IXMLDOMNode;
     FMilkProductionNode : IXMLDOMNode;
     FMilkRecordingNode : IXMLDOMNode;

     FICBFAPIHerdHealth : IXMLDOMNode;

     FUserWarningsNode : IXMLDOMNode;

     FSyncInMilkSyncTimeStampNode : IXMLDOMNode;

     FSyncInICBFAPISyncTimeStampNode : IXMLDOMNode;

     FSyncInICBFDownloadNode : IXMLDOMNode;
     FSyncInICBFHerdEvalNode : IXMLDOMNode;
     FSyncInICBFHerdEvalNodeList : IXMLDOMNodeList;

     FSyncInGroupsSyncTimeStampNode : IXMLDOMNode;

     FAnimalGroupsNode : IXMLDOMNode;

     FSyncedEventsArray : array of String;

     FSyncedEventsNode : IXMLDOMNode;

     FNoneHerdID : Integer;
     FHerdID : Integer;

     FBullingEvent : TBullingEvent;
     FServiceEvent : TServiceEvent;
     FCalvingEvent : TCalvingEvent;
     FHealthEvent : THealthEvent;
     FWeighingEvent : TWeighingEvent;
     FPregDiagEvent : TPregDiagEvent;
     FConditionSoreEvent: TConditionScoreEvent;

     FHerdQuery, FAnimalQuery,
     FBullQuery, FBreedQuery,
     FGenlookQuery, FMedAdminQuery,
     FFarmHealthCodeQuery : TQuery;
     FDiseasesQuery : TQuery;
     FOfficialHealthCodeQuery : TQuery;
     FMedicinesQuery : TQuery;
     FMarkAsSynchronizedQuery : TQuery;

     FSyncDataQuery : TQuery;
     FToBeCulledQuery : TQuery;

     FMedicineRepository : TMedicineRepository;
     FMedicinePurchaseRepository : TMedicinePurchaseRepository;
     FFeedPurchaseRepository : TFeedPurchaseRepository;

     FEventDataHelper : TEventDataHelper;
     FRegisteredCountry : TCountry;

     FMedicinesMarkedInUse : array of Integer;
     FDrugWithdrawalQuery : TQuery;

     FSyncIds : TTable;

     FFileName : string;

     FSyncWarnings : TTable;

     FAnimalCart : TTable;

     FLastSyncDate : string;

     FSyncDataStore : string;

     // Holds list of tagnumbers which have been duplicated in specified herd.
     FMultiInstancesList : TStringList;
     procedure Initialize(ASyncOp : TSyncOp);
     procedure FreeAndNilObjects;

     procedure CreateLogEntry(ALogEntry : String);
     function CreateAnimalNode(AId : Integer;
                               AAnimalNo, ANatIDNum, AName : String;
                               ADOB, AQADate, ABrucellosisDate, ATBTestDate, ABVDTestDate : TDateTime;
                               ASex, ABreedCode, AColourCode: String;
                               ALactNo, AHerdID: Integer;
                               AInHerd, AInUse, ABullUsed, ABreeding, AIsSynchronized, AIsMultiInstance, AQualityAssured, AToBeCulled : Boolean;
                               AEBI : Variant): IXMLDOMNode;
     procedure AddCalvingInformation(const AEventId : Integer; ANode : IXMLDomNode);
     function IsBullInUse(const AnimalId : Integer) : Boolean;

     procedure AddUserWarning(AWarningMessage : string; AShouldHaltSync : Boolean);

     procedure CreateBullingEvents(ABullingsNode : IXMLDOMNodeList);
     procedure CreateServiceEvents(AServicesNode : IXMLDOMNodeList);
     procedure CreateCalvingEvents(ACalvingsNode : IXMLDOMNodeList);
     procedure CreateHealthEvents(ARemediesNode : IXMLDOMNodeList; IsDryOffEvent : Boolean);
     procedure CreateWeighingEvents(AWeighingsNode : IXMLDOMNodeList);
     procedure CreateConditionScoreEvents(AConditionScoreNode : IXMLDOMNodeList);
     procedure CreateMedicinePurchases(APurchasesNode : IXMLDOMNodeList);
     procedure CreateFeedPurchases(APurchasesNode : IXMLDOMNodeList);
     procedure CreatePurchaseEvents(APurchasesNode : IXMLDOMNodeList);
     procedure CreateSaleDeathEvents(ASaleDeathsNode : IXMLDOMNodeList);
     procedure CreatePregDiagEvents(APregDiagsNode : IXMLDOMNodeList);
     procedure CreateNewIdEvents(ANewIdsNode : IXMLDOMNodeList);
     procedure CreateHerdEvalEvents(AEvalNode : IXMLDOMNode);
     procedure AddEventToEventsExt(AEventID, AEventType : Integer; AClientID, ANatIDNo : String);

     procedure ProcessRegistrations(ARegistrations : IXMLDOMNodeList);
     procedure StoreAnimalCart(AAnimalCartNode : IXMLDomNode);
     procedure CreateMilkProduction(AMilkProductionNode : IXMLDOMNodeList);
     procedure CreateMilkRecording(AMilkRecordingNode : IXMLDOMNodeList);
     procedure CreateLastMilkRecCumulativeRecords();
     procedure CreateICBFAPIHerdHealth(AICBFAPIHerdHealthNode : IXMLDOMNodeList);
     procedure CreateAnimalGroups(AAnimalGroupNode: IXMLDOMNodeList);

     function GetMaxInUseBullCount : Integer;
     function GetNoOfYearsHealthHistory: Integer;
     function GetNoneHerdId: Integer;
     function GetColourIdFromCode(AColourCode : string) : Integer;
     function GetBirthTypeFromDescription(ALookupCode, ADescription : string) : Integer;
     function GetDefaultBirthTypeFromDescription() : Integer;
     function GetCalfMortalityFromDescription(ADescription : string) : Integer;
     function GetTechnicianFromDescription(ADescription : string) : Integer;
     function GetServiceType(ADescriptionOrCode : string) : Integer;
     function GetCulledIdFromCode(ACode : string) : Integer;
     function GetCullingStatus(AAnimalId: Integer) : Boolean;
     function GetSexedSemenId(ACode : string) : Integer;

     procedure AddGenLookRecord(AListType : Integer; const ACode, ADescription : string;  AAllowUserDelete : Boolean);
     procedure AddDrugApplicationMethod(AApplicationMethod : TApplicationMethod);
     procedure AddOfficialHealthCode(AHealthCode :THealthCodeObject);
     procedure AddFarmHealthCode(AHealthCode :THealthCodeObject);
     procedure SetDrugAsInUse(const ADrugId : Integer; const AInUse : Boolean);

     function EnforceOfficialBreedCode(ABreedCode: string): string;

     function GetDrugFromServerListing(AVPANumber : string) : TServerDrug;
     procedure MarkMedicineInUse(const AMedicineId : Integer);
     function IsMedicineMarkedInUse(const AMedicineId : Integer) : Boolean;
     procedure FlagAsSynchronized(AIds : array of Integer; ASyncType : Integer);
     function GetBreedingBullCount : Integer;
     function DuplicateAITechniciansDetected() : Boolean;
     function DuplicateVetAdministratorsDetected() : Boolean;
//     function DuplicateAnimalNumbersDetected() : Boolean;
     function SystemRegisteredCountry: TCountry;
     procedure UpdateNextCalfNatId;

     function ValidateWeighingEventDetail(const ANatIdNo : string; const ADateOfBirth, AEventDate : TDateTime) : Boolean;

     function GetDrugIdByVPANumber(const ADrugVPANumber: string): Integer;
     function FeedTypeOnFile(const AFeedTypeId: Integer): Boolean;

     procedure AddAncestryInformation(AAnimalNode : IXMLDOMNode);
     procedure AddDrugWithdrawalDates(AAnimalId : Integer;
        AAnimalNode : IXMLDOMNode);

     procedure OutputBreed(ABreedCode : string);
     function GetLastHerdSyncDate(AHerdNumber : string) : string;
     procedure SetLastHerdSyncDate(AHerdNumber : string; ALastSyncDate : string);

     function CanAddAnimalNoToNoneHerd(AAnimalNo : string) : Boolean;
     function GetDrugWithdrawalDates(const AID : Integer;
        ACheckDate : TDateTime) : THealthWithDrawalInfo;

     procedure AddSyncWarning(ANatIdNo, AWarning : string);
     procedure UpdateAnimalRegistrationStatus(ADamId, ADamLact : Integer; ACalvingDate :TDateTime;
          ACalfId : Integer; AIsRegistered : Boolean;
          AActionDate : TDateTime; AConfirmationId : string);overload;

     procedure UpdateAnimalRegistrationStatus(
          const AAnimalId : Integer; AIsRegistered: Boolean; ALastActionDate: TDateTime; AConfirmationId : string);overload;

     function BullUsed(const AAnimalId : Integer) : Boolean;
     procedure LoadNatIdNumMultiInstances(const AHerdId : Integer);
     function IsMultiInstanceNatIdNum(const ANatIdNum : string) : Boolean;

     function LocateAnimal(ANatIdNum : string) : Boolean;
     procedure UpdatePregDiagEvent(AAnimalID, AAnimalLactNo : Integer);

     function EventsExtClientIdEventId (AClientId : String) : Integer;

     function CreateExistingClientIdElement (AClientID : String; AEventID, AEventType : Integer) : IXMLDOMNode;

     function FixedEventDifferences ( ADifferences : TStringList; AExistEventId, AEventType : Integer ) : Boolean;

     function ValidateConditionScoreEventDetail(const ANatIdNo: string;
          const ADateOfBirth, AEventDate: TDateTime): Boolean;

     property NoneHerdId : Integer read GetNoneHerdId;

  public
     constructor Create;
     destructor Destroy;override;
     class procedure CreateHerdSyncData(ASyncOutputParams : TSyncOutputParams);
     class procedure ReadHerdSyncData(AFileName : String);
     class procedure ReadAnimalRemedyEvents(AFileName : String);
     class procedure MarkAsSynchronized(const ADatabasePath : string);
     class function DBRecordCount : Integer;
     class function DBModifiedCount : Integer;
  end;

  procedure ResetSyncFlagsOnAllData(const ANotifySuccess : Boolean);
  procedure ResetSyncFlagForGroup(const AGroupId : Integer);
  // adapted version from Kroutines to exclude 0 values from output array
  function IntArrayToSQLInString( const AValue : array of Integer ) : string;

  procedure Sync(AParams : TStrings);

var
   SESSION_PASSWORD_PROTECTED : Boolean = False;

implementation
uses
   FileCtrl, uAimAnimalRegistration, uHerdOwner, uApplicationLog;

   procedure Sync(AParams : TStrings);
   var
      SyncOutputParams : TSyncOutputParams;
   begin
      if (AParams[1] = '-o') and (AParams[2] <> '') then
         begin
            SyncOutputParams := TSyncOutputParams.Create(AParams);
            if ( SyncOutputParams.ResetSyncFlagsBeforeStart ) then
               ResetSyncFlagsOnAllData(False);
            THerdSync.CreateHerdSyncData(SyncOutputParams);
         end
      //{-i = load and save data for sync purposes
      else if (AParams[1] = '-i') and (AParams[2] <> '') then
         THerdSync.ReadHerdSyncData(AParams[2])
      else if (AParams[1] = '-m') and (AParams[2] <> '') then
         THerdSync.MarkAsSynchronized(AParams[2]);
   end;

  procedure ResetSyncFlagsOnAllData(const ANotifySuccess : Boolean);

     procedure ResetSyncStatus(AATableName : string);
     begin
        with TQuery.Create(nil) do
           try
              DatabaseName := 'Kingswd';
              SQL.Clear;
              SQL.Add('UPDATE '+ AATableName +' SET IsSynchronized = False');
              ExecSQL;

              if ( UpperCase(AATableName) = 'GRPS' ) then
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE Grps SET ModifiedOn = :ModOn');
                    Params[0].AsDateTime := Now;
                    ExecSQL;
                 end;
           finally
              Free;
           end;
     end;

  begin
     try
        ResetSyncStatus('animals');
        ResetSyncStatus('events');
        ResetSyncStatus('milkdisk');
        ResetSyncStatus('suppliersbreeders');
        ResetSyncStatus('customers');
        ResetSyncStatus('buyers');
        ResetSyncStatus('genlook');
        ResetSyncStatus('medadmin');
        ResetSyncStatus('grps');
        ResetSyncStatus('feedtypes');
        ResetSyncStatus('medipur');
        ResetSyncStatus('fdstkevents');
        ResetSyncStatus('eventsext');
        ResetSyncStatus('deletedgrps');

        if (ANotifySuccess) then
           MessageDlg('Data sync flags have been successfully reset.',mtInformation,[mbOK],0);
     except
        if (ANotifySuccess) then
           MessageDlg('An error occurred while resetting the data sync flags.',mtError,[mbOK],0);
     end;
  end;

  procedure ResetSyncFlagForGroup(const AGroupId : Integer);
  begin
     with TQuery.Create(nil) do
        try
           DatabaseName := 'Kingswd';
           SQL.Clear;
           SQL.Add('UPDATE Grps SET IsSynchronized = False, ModifiedOn = :ModOn');
           SQL.Add('WHERE Id =:GroupId');
           Params[0].AsDateTime := Now;
           Params[1].AsInteger := AGroupId;
           ExecSQL;
        finally
           Free;
        end;
  end;

function IntArrayToSQLInString( const AValue : array of Integer ) : string;
var
   I : Integer;
begin
   Result := '';
   if Length( AValue ) = 1 then
      begin
         Result := '(' + IntToStr( AValue[ 0 ] ) +')';
      end
   else
      begin
         for I := 0 to Length( AValue ) - 1 do      // Iterate
            begin
               if ( AValue[ I ] > 0) then  // << ensure only numbers greater than 0 are output to result
                  begin
                     if Length( Result ) = 0 then
                        Result := '(' + IntToStr( AValue[ I ] )
                     else
                        Result := Result +', '+  IntToStr( AValue[ I ] );
                  end;
            end;  // for
         if Result <> '' then
            Result := Result + ')'
         else
            Result := Result + '()'
       end;
end;

{ THerdSync }

procedure THerdSync.CreateLogEntry(ALogEntry: String);
begin
   ALogEntry := Format('[START: %s]',[FormatDateTime('dd/MM/yyyy hh:nn:ss',Now)]) + #13#10 + #13#10 +
                       ALogEntry + #13#10 + #13#10 +
                       '[END]' + #13#10 + #13#10;
   InsertAllText(ALogEntry, DefaultDirectory +'\Services\log.txt');
end;

constructor THerdSync.Create;
begin
   FDatabasePath := '';
   FDocument := nil;

   Session.AddPassword(MASTER_PASSWORD);
end;

destructor THerdSync.Destroy;
begin
  FreeAndNilObjects();
  inherited;
end;

class procedure THerdSync.ReadHerdSyncData(AFileName : String);
var
   HerdSync : THerdSync;
   h, a, ad : Integer;

   AnimalRecord : TAnimalRecord;

   FileName : string;

   AddAnimalToDb : Boolean;

   AnimalNo : string;
   Sex : string;
   BreedCode, ColourCode : string;
   NatIdNo : string;
   Name, HerdBookNo : string;
   DateOfBirth : TDateTime;
   LactNo : Integer;
   IsBreeding : Boolean;
   InHerd : Boolean;

   MilkSyncTimeStamp : String;
   ICBFAPITimeStamp : String;
   ICBFAPIHerdEvalTimeDate : TDateTime;
   GroupsTimeStamp : String;

   i : Integer;
begin

   HerdSync := THerdSync.Create;
   with HerdSync do
      try
         SetLength(FSyncedEventsArray,0);

         FFilename := AFilename;
         if not FileExists(AFilename) then
            begin
               CreateLogEntry(Format('Data sync file %s not found.',[AFileName]));
               Exit;
            end;

         try
            FDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
            FDocument.load(AFilename);

            FRootNode := FDocument.documentElement;
            if (FRootNode = nil) then Exit;

            if FRootNode.attributes.length = 1 then
               try
                  FDatabasePath := IncludeTrailingBackSlash(DefaultDirectory) + FRootNode.attributes.item[0].text;
                  if ( not(DirectoryExists(FDatabasePath)) ) then
                     begin
                        CreateLogEntry('Path "'+FDatabasePath+'" does not exist.');
                        Exit;
                     end;

                  FSyncDataStore := FDatabasePath + '\sync';
                  if not(DirectoryExists(FSyncDataStore)) then
                     begin
                        if not CreateDir(FSyncDataStore) then
                           CreateLogEntry('Failed to create store dir '+FSyncDataStore);
                     end;

                  // The first thing to do is to archive the syncInput xml file that
                  // has been passed in by the FarmSync program.
                  // We do this just in case there are any errors whilst reading file
                  // we then have something to go back to. Most if not all errors that
                  // occur at this stage are due to lack of BDE memory.
                  FileName := FSyncDataStore + '\syncdata ' + FormatDateTime('yymmdd hhnnss',now) + '.xml';
                  if not (CopyFile(pChar(AFilename), Pchar(FileName), false)) then
                     CreateLogEntry('Could not create archive of data sync file.');

                  Initialize(soSyncDataIn);

                  if (FileExists(ApplicationPath + '\druglisting.xml')) then
                     begin
                        FDrugListingDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                        FDrugListingDocument.load(ApplicationPath + '\druglisting.xml');
                     end;
               except
                 on e:Exception do
                    begin
                       CreateLogEntry(e.Message);
                       raise;
                    end;
               end
            else
               begin
                  CreateLogEntry('Xml document does not contain the expected format.');
                  Exit;
               end;


            FInputHerdsNode := FDocument.getElementsByTagName('herd');

            FAnimalQuery.SQL.Clear;
            FAnimalQuery.SQL.Text := 'SELECT Id, NatIdNum, AnimalNo, Sex, LactNo, HerdId, DateOfBirth, SearchNatID, InHerd '+
                                     'FROM Animals '+
                                     'WHERE (AnimalDeleted = False) '+
                                     'ORDER BY Id ASC';
            try
               FAnimalQuery.Open;
            except
               CreateLogEntry('ReadHerdSyncData() : Error opening animal query.');
               raise;
            end;

            try
               // herds Node
               for h := 0 to FInputHerdsNode.Get_length-1 do
                  begin
                     FHerdNode := FInputHerdsNode.item[h];
                     if ( FHerdNode = nil ) then continue;

                     FChildNode := FHerdNode.selectSingleNode('herdIdentity');
                     if FChildNode = nil then continue;

                     if not (FHerdQuery.Locate('HerdIdentity', FChildNode.Get_text, [loCaseInsensitive])) then continue;

                     FTempNode := FHerdNode.selectSingleNode('lastSyncDate');
                     if (FTempNode <> nil) then
                        begin
                           try
                              SetLastHerdSyncDate(FChildNode.Get_text, FTempNode.text);
                           except
                              CreateLogEntry('ReadHerdSyncData() : Could not set LastSyncDate value.');
                           end;
                        end;

                     FHerdID := FHerdQuery.FieldByName('Id').AsInteger;

                     FInputAnimalsRootNode := FHerdNode.selectSingleNode('animals');
                     if FInputAnimalsRootNode = nil then Continue;

                     FInputAnimalsNode := FInputAnimalsRootNode.selectNodes('animal');
                     if FInputAnimalsNode = nil then Continue;

                     // animals Node
                     for a := 0 to FInputAnimalsNode.Get_length-1 do
                        begin
                           FInputAnimalNode := FInputAnimalsNode.item[a];
                           if FInputAnimalNode = nil then Continue;

                           NatIdNo := '';
                           AnimalNo := '';
                           Sex := '';
                           BreedCode := '';
                           ColourCode := '';
                           Name := '';
                           HerdBookNo := '';
                           DateOfBirth := 0;
                           LactNo := 0;
                           IsBreeding := False;
                           InHerd := False;

                           // animal Node
                           for ad := 0 to FInputAnimalNode.childNodes.Get_length-1 do
                              begin
                                 FChildNode := FInputAnimalNode.childNodes[ad];
                                 if ( FChildNode <> nil ) then
                                    begin
                                       if ( FChildNode.nodeName = 'natIdNo' ) then
                                          NatIdNo := (FChildNode.text)
                                       else if ( FChildNode.nodeName = 'animalNo' ) then
                                          AnimalNo := (FChildNode.text)
                                       else if ( FChildNode.nodeName = 'dob' ) then
                                          try
                                             DateOfBirth := ( StrToDate(FChildNode.text) )
                                          except
                                             DateOfBirth := 0;
                                          end
                                       else if ( FChildNode.nodeName = 'breedCode' ) then
                                          BreedCode := (FChildNode.text)
                                       else if ( FChildNode.nodeName = 'colourCode' ) then
                                          ColourCode := (FChildNode.text)
                                       else if ( FChildNode.nodeName = 'sex' ) then
                                          Sex := (FChildNode.text)
                                       else if ( FChildNode.nodeName = 'isBreeding' ) then
                                          IsBreeding := UpperCase(FChildNode.text) = 'TRUE'
                                       else if ( FChildNode.nodeName = 'inHerd' ) then
                                          Inherd := UpperCase(FChildNode.text) = 'TRUE'
                                       else if ( FChildNode.nodeName = 'lactNo' ) then
                                          try
                                             LactNo := StrToInt(FChildNode.text)
                                          except
                                             LactNo := 0;
                                             CreateLogEntry('ReadHerdSyncData() : ' + NatIdNo + ' Invalid value for lact no. ');
                                          end
                                       else if ( FChildNode.nodeName = 'name' ) then
                                          Name := (FChildNode.text)
                                       else if ( FChildNode.nodeName = 'herdBookNo' ) then
                                          HerdBookNo := (FChildNode.text)
                                    end;
                              end;

                           if (InHerd) then // more likely a purchased animal
                              begin
                                 AddAnimalToDb := true;
                              end
                           else
                              begin
                                 if (UPPERCASE(Sex) = 'BULL') then
                                    begin
                                       AddAnimalToDb := ((AnimalNo <> '') and ( not(FBullQuery.Locate('AnimalNo', AnimalNo,[]))));
                                    end
                                 else
                                    begin
                                       AddAnimalToDb := ((AnimalNo <> '') and ( CanAddAnimalNoToNoneHerd(AnimalNo)));
                                    end;
                              end;

                           if ( not(AddAnimalToDb) ) then
                              begin
                                 if ( AnimalNo = '' ) then
                                    CreateLogEntry('Unable to create Animal. Animal No. is null or empty')
                                 else
                                    CreateLogEntry(Format('Unable to create Animal. Animal No. %s already exists.',[AnimalNo]));
                                 Continue;
                              end;

                           try
                              AnimalRecord := TAnimalRecord.Create('');
                              AnimalRecord.ValidateIDTags := False;
                              AnimalRecord.ValidateBreed := False;
                              AnimalRecord.ValidateColour := False;
                              AnimalRecord.ValidateDOB := False;
                              try

                                 if InHerd then
                                    begin
                                       AnimalRecord.Add;
                                       AnimalRecord.HerdID := FHerdID;
                                       AnimalRecord.NatIDNum := NatIdNo;
                                       AnimalRecord.AnimalNo := AnimalNo;
                                       AnimalRecord.Name := Name;
                                       AnimalRecord.HerdBookNo := HerdBookNo;
                                       AnimalRecord.LactNo := LactNo;
                                       if (DateOfBirth>0) then
                                          AnimalRecord.DateOfBirth := DateOfBirth;
                                       AnimalRecord.Breeding := IsBreeding;
                                    end
                                 else
                                    begin
                                       AnimalRecord.AddToNoneHerd;
                                       AnimalRecord.AnimalNo := AnimalNo;
                                    end;

                                 AnimalRecord.Sex := Sex;
                                 AnimalRecord.InHerd := InHerd;
                                 AnimalRecord.PrimaryBreed := GetBreedIdFromCode(BreedCode);
                                 AnimalRecord.IsSynchronized := False;
                                 AnimalRecord.Save;
                              except
                                 on e : exception do
                                    begin
                                       AnimalRecord.Cancel;
                                       CreateLogEntry(e.message);
                                    end;
                              end;
                           finally
                              FreeAndNil(AnimalRecord);
                           end;
                        end;

                     // Once all animals have been added refresh the FBullQuery query
                     // which will contain any new bulls.
                     // FBullQuery.Refresh; << refresh doesn't do what it says on the tin, use Open & Close instead.
                     try
                        FBullQuery.Close;
                        FBullQuery.Open;
                     except
                        CreateLogEntry('ReadHerdSyncData() : Error opening Bull query.');
                        raise;
                     end;

                     try
                        FAnimalQuery.Close;
                        FAnimalQuery.Open;

                        // Set filter (Inherd=True) at this point.
                     except
                        CreateLogEntry('ReadHerdSyncData() : Error opening Animal query.');
                        raise;
                     end;

                     //   01/11/18 [V5.8 R3.2] /MK Bug Fix - Bring in the medicine purchases before the animal remedies.
                     FInputSystemNode := FHerdNode.selectSingleNode('system');
                     if (FInputSystemNode <> nil) then
                        begin
                           try
                              CreateMedicinePurchases(FInputSystemNode.selectNodes('drugPurchase'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Drug Purchases.');
                              raise;
                           end;

                           // 24/03/2016 - SP - V5.5 R4.5 Feed Purchase support
                           try
                              CreateFeedPurchases(FInputSystemNode.selectNodes('feedPurchase'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Feed Purchases.');
                              raise;
                           end;
                        end;

                     FInputEventsNode := FHerdNode.selectSingleNode('events');
                     if (FInputEventsNode <> nil) then
                        begin
                           // Ensure calvings are processed first!
                           // This ensure's that new calves are written to the database,
                           // and their events, if any recorded on the server,
                           // will be properly attached to the calf record.

                           try
                              CreateCalvingEvents(FInputEventsNode.selectNodes('calvingEvent'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Calving events.');
                              raise;
                           end;

                           try
                              CreateBullingEvents(FInputEventsNode.selectNodes('bullingEvent'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Bulling events.');
                              raise;
                           end;

                           try
                              CreateServiceEvents(FInputEventsNode.selectNodes('serviceEvent'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Service events.');
                              raise;
                           end;

                           try
                              CreatePregDiagEvents(FInputEventsNode.selectNodes('pregDiagEvent'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating PregDiag events.');
                              raise;
                           end;

                           try
                              CreateHealthEvents(FInputEventsNode.selectNodes('remedyEvent'), False);
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Remedy events.');
                              raise;
                           end;

                           try
                              CreateHealthEvents(FInputEventsNode.selectNodes('dryOffEvent'), True);
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Dry Off events.');
                              raise;
                           end;

                           try
                              CreateWeighingEvents(FInputEventsNode.selectNodes('weighingEvent'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Weighing events.');
                              raise;
                           end;

                        try
                           CreateConditionScoreEvents(FInputEventsNode.selectNodes('conditionScoreEvent'));
                        except
                           CreateLogEntry('ReadHerdSyncData() : Error creating Condition Score events.');
                           raise;
                        end;

                        try
                           CreatePurchaseEvents(FInputEventsNode.selectNodes('purchaseEvent'));
                        except
                           CreateLogEntry('ReadHerdSyncData() : Error creating Purchase events.');
                           raise;
                        end;

                           try
                              CreateSaleDeathEvents(FInputEventsNode.selectNodes('saledeathEvent'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating Sale/Death events.');
                              raise;
                           end;

                           try
                              CreateNewIdEvents(FInputEventsNode.selectNodes('newIdEvent'));
                           except
                              CreateLogEntry('ReadHerdSyncData() : Error creating NewId events.');
                              raise;
                           end;
                        end;

                     try
                        FMilkProductionNode := FHerdNode.selectSingleNode('milkProduction');
                        if (FMilkProductionNode <> nil) then
                            CreateMilkProduction(FMilkProductionNode.selectNodes('lactationMilkSummary'));
                     except
                        CreateLogEntry('ReadHerdSyncData() : Error creating ICBF Milk Lactation records.');
                        raise;
                     end;

                     try
                        FMilkRecordingNode := FHerdNode.selectSingleNode('milkRecordings');
                        if ( FMilkRecordingNode <> nil ) then
                           begin
                              CreateMilkRecording(FMilkRecordingNode.selectNodes('milkRecording'));
                              //   11/08/20 [V5.9 R5.3] /MK Change - When the milk recording is imported allocate the animals last cummualtive record to the last milk recording imported.
                              CreateLastMilkRecCumulativeRecords();
                           end;
                     except
                        CreateLogEntry('ReadHerdSyncData() : Error creating ICBF Milk Recording records.');
                     end;

                     try
                        FICBFAPIHerdHealth := FHerdNode.selectSingleNode('icbfHerdHealths');
                        if ( FICBFAPIHerdHealth <> nil ) then
                           CreateICBFAPIHerdHealth(FICBFAPIHerdHealth.selectNodes('icbfHerdHealth'));
                     except
                        CreateLogEntry('ReadHerdSyncData() : Error creating ICBF Herd Health records.');
                     end;

                     try
                        FAnimalGroupsNode := FHerdNode.selectSingleNode('animalGroups');
                        if ( FAnimalGroupsNode <> nil ) then
                           CreateAnimalGroups(FAnimalGroupsNode.selectNodes('animalGroup'));
                     except
                        CreateLogEntry('ReadHerdSyncData() : Error creating Animal Group records.');
                        raise;
                     end;

                     try
                        FInputAnimalRegistrationNode := FHerdNode.selectSingleNode('registrations');
                        if (FInputAnimalRegistrationNode <> nil) then
                           ProcessRegistrations(FInputAnimalRegistrationNode.selectNodes('registration'));
                     except
                        CreateLogEntry('ReadHerdSyncData() : Error creating Animal Registrations records.');
                        raise;
                     end;

                     try
                        FSyncInICBFDownloadNode := FHerdNode.selectSingleNode('icbfDownload');
                        if ( FSyncInICBFDownloadNode <> nil ) then
                            begin
                               FSyncInICBFHerdEvalNode := FSyncInICBFDownloadNode.selectSingleNode('herdEvaluations');
                               if ( FSyncInICBFHerdEvalNode <> nil ) then
                                  CreateHerdEvalEvents(FSyncInICBFHerdEvalNode);
                            end;
                     except
                        on e : Exception do
                           CreateLogEntry(Format('Error updating SyncDefaults.SvrICBAPIHerdEvalTimeStamp with Exception : %s',[e.Message]));
                     end;

                     try
                        FSyncInMilkSyncTimeStampNode := FHerdNode.selectSingleNode('milkSync');
                        if ( FSyncInMilkSyncTimeStampNode <> nil ) then
                           begin
                              FChildNode := FSyncInMilkSyncTimeStampNode.childNodes[0];
                              if ( FChildNode <> nil ) then
                                 begin
                                    MilkSyncTimeStamp := FChildNode.Text;
                                    if ( Length(MilkSyncTimeStamp) > 0 ) then
                                       with TQuery.Create(nil) do
                                          try
                                             DatabaseName := AliasName;
                                             SQL.Clear;
                                             SQL.Add('UPDATE SyncDefaults');
                                             SQL.Add('SET SvrMilkTimeStamp = :MilkSyncDate');
                                             Params[0].AsString := MilkSyncTimeStamp;
                                             ExecSQL;
                                          finally
                                             Free;
                                          end;
                                 end;
                           end;
                     except
                        on e : Exception do
                           CreateLogEntry(Format('Error updating SyncDefaults.SvrMilkTimeStamp with Exception : %s',[e.Message]));
                     end;

                     try
                        FSyncInICBFAPISyncTimeStampNode := FHerdNode.selectSingleNode('icbfAPISync');
                        if ( FSyncInICBFAPISyncTimeStampNode <> nil ) then
                           begin
                              FChildNode := FSyncInICBFAPISyncTimeStampNode.childNodes[0];
                              if ( FChildNode <> nil ) then
                                 begin
                                    ICBFAPITimeStamp := FChildNode.Text;
                                    if ( Length(ICBFAPITimeStamp) > 0 ) then
                                       with TQuery.Create(nil) do
                                          try
                                             DatabaseName := AliasName;
                                             SQL.Clear;
                                             SQL.Add('UPDATE SyncDefaults');
                                             SQL.Add('SET SvrICBAPITimeStamp = :ICBFAPISyncDate');
                                             Params[0].AsString := ICBFAPITimeStamp;
                                             ExecSQL;
                                          finally
                                             Free;
                                          end;
                                 end;
                           end;
                     except
                        on e : Exception do
                           CreateLogEntry(Format('Error updating SyncDefaults.SvrICBAPITimeStamp with Exception : %s',[e.Message]));
                     end;

                     try
                        FSyncInGroupsSyncTimeStampNode := FHerdNode.selectSingleNode('groupSync');
                        if ( FSyncInGroupsSyncTimeStampNode <> nil ) then
                           begin
                              FChildNode := FSyncInGroupsSyncTimeStampNode.childNodes[0];
                              if ( FChildNode <> nil ) then
                                 begin
                                    GroupsTimeStamp := FChildNode.text;
                                    if ( Length(GroupsTimeStamp) > 0 ) then
                                       with TQuery.Create(nil) do
                                          try
                                             DatabaseName := AliasName;
                                             SQL.Clear;
                                             SQL.Add('UPDATE SyncDefaults');
                                             SQL.Add('SET SvrGrpTimeStamp = :SvrGrpTimeStamp');
                                             Params[0].AsString := GroupsTimeStamp;
                                             ExecSQL;
                                          finally
                                             Free;
                                          end;
                                 end;
                           end;
                     except
                        on e : Exception do
                           CreateLogEntry(Format('Error updating SyncDefaults.SvrGrpTimeStamp with Exception : %s',[e.Message]));
                     end;

                     StoreAnimalCart(FHerdNode.selectSingleNode('animalCart'));
                  end;

                  // output new SyncOut
                  FileName := FDatabasePath + '\syncedevents.xml';
                  if FileExists(FileName) then
                     DeleteFile(FileName);
                  if ( Length(FSyncedEventsArray) > 0 ) then
                     begin
                        FDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;

                        FDocument.appendChild(FDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'));

                        FRootNode := FDocument.createElement('herdData');
                        FDocument.appendChild(FRootNode);

                        FSyncedEventsNode := FDocument.createElement('syncedEvents');
                        FRootNode.appendChild(FSyncedEventsNode);

                        for i := 0 to Length(FSyncedEventsArray) -1 do
                           begin
                              FChildNode := FDocument.createElement('clientId');
                              FChildNode.Set_text(FSyncedEventsArray[i]);
                              FSyncedEventsNode.appendChild(FChildNode);
                           end;

                        FDocument.Save(Filename);
                     end;

            finally
               DeleteFile(AFilename)
            end;
         except
            on e : Exception do
               begin
                  CreateLogEntry('ReadHerdSyncData() : '+e.Message);
               end;
         end;

      finally
         if (FEventDataHelper <> nil) then FreeAndNil(FEventDataHelper);
         if (HerdSync <> nil) then FreeAndNil(HerdSync);
      end;
end;

class procedure THerdSync.CreateHerdSyncData(ASyncOutputParams : TSyncOutputParams);
const
   cDuplicateCode = 'Cannot proceed with Sync operation - duplicate %s codes have been detected. Please contact Kingswood.';
var
   Filename : string;
   I : Integer;
   IsDefault : Boolean;
   HerdSync : THerdSync;

   AnimalId : Integer; AnimalNo, NatIDNum, Name : String;
   AnimalSex, BreedCode, ColourCode : String;
   AnimalDOB, QADate,
   TBTestDate, Brucellosis, BVDDate,
   ClientGrpTimeStamp : TDateTime;
   SvrGrpTimeStamp : String;
   LactNo, HerdID : Integer;
   InHerd, InUse, Breeding, BullWasUsed, IsMultiInstance, QualityAssured : Boolean;
   EBI : Variant;
   MaxInUseBullCount : Integer;
   BreedingBullCount : Integer;
   ToBeCulled : Boolean;

   MyArray : array of Integer;
   ArrayIndex : Integer;
   initialtime, elapsedtime: DWord;
   TempStr : string;

   Verbose : Boolean;

   ServerDrug : TServerDrug;
begin
   initialtime := Windows.GetTickCount;
   SetLength(MyArray, 0);

   HerdSync := THerdSync.Create;
   with HerdSync do
      try
         FSyncOutputParams := ASyncOutputParams;
         if (FSyncOutputParams.ResetSyncFlagsBeforeStart) then
            ResetSyncFlagsOnAllData(false);

         try
            FDatabasePath := IncludeTrailingBackSlash(DefaultDirectory) + FSyncOutputParams.DatabaseName;
            if not DirectoryExists(FDatabasePath) then
               begin
                  CreateLogEntry(Format('Database path not found %s',[FDatabasePath]));
                  Exit;
               end;

            Initialize(soSyncDataOut);

            if (FileExists(ApplicationPath + '\druglisting.xml')) then
               begin
                  FDrugListingDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                  FDrugListingDocument.load(ApplicationPath + '\druglisting.xml');
               end;

            FDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;

            MaxInUseBullCount := GetMaxInUseBullCount;
            BreedingBullCount := GetBreedingBullCount;

            FileName := FDatabasePath + '\herdData_input.xml';
            if FileExists(FileName) then
               DeleteFile(FileName);
            FDocument.appendChild(FDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'));

            FRootNode := FDocument.createElement('herdData');
            FDocument.appendChild(FRootNode);

            FOutputHerdsNode := FDocument.createElement('herds'); // Create Root Node
            FRootNode.appendChild(FOutputHerdsNode);

            FBreedsNode := FDocument.createElement('breeds'); // this element is added too as the animals are being processed for sync.

            { Do not implement check for Duplicate animal numbers in the short term. We need to
              introduce during quite season so we can handle the volumn of customer queries
              as best as possible.

            if DuplicateAnimalNumbersDetected() then
               begin
                  AddUserWarning(Format(cDuplicateCode, ['Animal No']),True);
                  FDocument.Save(Filename);
                  Exit;
               end
            else }if (BreedingBullCount > MaxInUseBullCount) then
               begin
                  // we might have problem here, no user should ever have more than 20 bulls that
                  // are currently "in use" (according to GL)
                  // set marker in sync data file indicating that sync should be halted until user
                  // has cleaned up their "In Use" bull listing.
                  AddUserWarning(Format('%s : The total bulls marked in use (%d) exceeds the permitted allowed (%d).',
                  [FHerdQuery.FieldByName('HerdIdentity').AsString,
                   BreedingBullCount,MaxInUseBullCount]),true);
                   FDocument.Save(Filename);
                   Exit;
               end
            else if DuplicateAITechniciansDetected() then
               begin
                  AddUserWarning(Format(cDuplicateCode, ['AI Technician']),True);
                  FDocument.Save(Filename);
                  Exit;
               end
            else if DuplicateVetAdministratorsDetected() then
               begin
                  AddUserWarning(Format(cDuplicateCode, ['Vet Administrator']),True);
                  FDocument.Save(Filename);
                  Exit;
               end;

            IsDefault := True;

            ArrayIndex := 0;
            SetLength(MyArray, 0);

            FHerdQuery.First;
            while not FHerdQuery.Eof do
               begin

                  // don't output the NONE herd
                  if (FHerdQuery.FieldByName('Id').AsInteger = NoneHerdId) then
                     begin
                        FHerdQuery.Next;
                        Continue;
                     end;

                  LoadNatIdNumMultiInstances(FHerdQuery.FieldByName('Id').AsInteger);

                  // Add The Herd To The XML File
                  FHerdNode := FDocument.createElement('herd');

                  FChildNode := FDocument.createAttribute('isDefault');
                  if IsDefault then
                     begin
                        IsDefault := False;
                        FChildNode.Set_nodeValue('true');
                     end
                  else
                     FChildNode.Set_nodeValue('false');

                  FHerdNode.attributes.setNamedItem(FChildNode);

                  FChildNode := FDocument.createElement('herdIdentity');
                  FChildNode.Set_text(FHerdQuery.FieldByName('HerdIdentity').AsString);
                  FHerdNode.appendChild(FChildNode);

                  FChildNode := FDocument.createElement('herdIdentifier');
                  //   05/04/19 [V5.8 R8.5] /MK Change - If the herd is not in Ireland then out put the Herd Identity as the Herd Identifier.
                  if ( FRegisteredCountry = Ireland ) then
                     FChildNode.Set_text(FHerdQuery.FieldByName('HerdIdentifier').AsString)
                  else
                     FChildNode.Set_text(FHerdQuery.FieldByName('HerdIdentity').AsString);
                  FHerdNode.appendChild(FChildNode);

                  // SP 10/10/2016
                  FChildNode := FDocument.createElement('tagPrefix');
                  FChildNode.Set_text(FHerdQuery.FieldByName('TagPrefix').AsString);
                  FHerdNode.appendChild(FChildNode);

                  FLastSyncDate := GetLastHerdSyncDate(FHerdQuery.FieldByName('HerdIdentity').AsString);
                  if ( FLastSyncDate<>'') then
                     begin
                        FChildNode := FDocument.createElement('lastSyncDate');
                        FChildNode.Set_text(FLastSyncDate);
                        FHerdNode.appendChild(FChildNode);
                     end;

                  SetLength(MyArray, 1);
                  MyArray[0] := FHerdQuery.FieldByName('Id').AsInteger;
                  FlagAsSynchronized(MyArray, HerdFileSync);

                  // Add First The Female Animals That Are In Herd.
                  FOutputAnimalsNode := FDocument.createElement('animals');

                  FHerdID := FHerdQuery.Fields[0].AsInteger;

                  Verbose := TfmFarmSyncSettings.GetVerbose(FHerdQuery.FieldByName('HerdIdentity').AsString,FHerdID);

                  FSyncDataQuery.SQL.Clear;
                  // Animal Info
                  FSyncDataQuery.SQL.Add('SELECT A.ID, A.AnimalNo, A.NatIdNum, A.DateOfBirth,');
                  FSyncDataQuery.SQL.Add('       A.Sex, A.LactNo, A.HerdId, A.Inherd, A.Name, A.Breeding,');
                  FSyncDataQuery.SQL.Add('       A.IsSynchronized, B.Code BreedCode, C.LookupCode ColourCode, A.QADate,');
                  FSyncDataQuery.SQL.Add('       A.QualityAssured, A.TBTestDate, A.Brucellosis, A.BVDDate,');
                  // Dam Info
                  FSyncDataQuery.SQL.Add('       D.ID AS DId, D.HerdId DHerdId, D.AnimalNo AS DAnimalNo, D.NatIdNum AS DNatIdNum,');
                  FSyncDataQuery.SQL.Add('       D.Name AS DName, D.HerdBookNo AS DHerdBookNo, D.Breeding AS DBreeding, D.LactNo AS DLactNo,');
                  FSyncDataQuery.SQL.Add('       D.DateOfBirth AS DDateOfBirth, DB.Code AS DBreedCode, DC.LookupCode AS DColourCode, D.InHerd AS DInherd, D.AnimalDeleted DAnimalDeleted,');
                  // Sire Info
                  FSyncDataQuery.SQL.Add('       S.ID AS SId, S.HerdId SHerdId, S.AnimalNo AS SAnimalNo, S.NatIdNum AS SNatIdNum,');
                  FSyncDataQuery.SQL.Add('       S.Name AS SName, S.HerdBookNo AS SHerdBookNo, S.Breeding AS SBreeding,');
                  FSyncDataQuery.SQL.Add('       S.DateOfBirth AS SDateOfBirth, SB.Code AS SBreedCode, SC.LookupCode AS SColourCode, S.InHerd AS SInHerd, S.AnimalDeleted SAnimalDeleted,');
                  // EBI Info
                  FSyncDataQuery.SQL.Add('       B1.RBI AS BullEBI, C1.EBI AS CowEBI, C2.EBI AS DamEBI, C3.EBI AS SireEBI');

                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Breeds B  ON (B.ID = A.PrimaryBreed)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN GenLook C ON (A.Colour = C.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Animals D ON (A.DamId = D.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Breeds DB ON (D.PrimaryBreed = DB.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN GenLook DC ON (D.Colour = DC.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Animals S ON (A.SireId = S.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Breeds SB ON (S.PrimaryBreed = SB.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN GenLook SC ON (S.Colour = SC.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN CowExt C1 ON (A.Id = C1.AnimalId)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN CowExt C2 ON (D.Id = C2.AnimalId)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN CowExt C3 ON (S.Id = C3.AnimalId)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN BullExt B1 ON (A.Id = B1.AnimalId)');
                  FSyncDataQuery.SQL.Add('WHERE (A.HerdID = :AHerdID)');
                  FSyncDataQuery.SQL.Add('AND   (A.AnimalDeleted = False)');

                  //   03/12/18 [V5.8 R5.6] /MK Change - Use FarmSyncSetting verbose parameter to see whether to sync sold animals - SP/R.Bourns.
                  if ( Verbose ) then
                     FSyncDataQuery.SQL.Add('AND (A.IsSynchronized = False)');

                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  FDrugWithdrawalQuery.Params[0].AsInteger := FHerdID;
                  FDrugWithdrawalQuery.Active := True;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);
                  try
                     AnimalNo := '';
                     NatIDNum := '';
                     Name := '';
                     AnimalSex := '';
                     BreedCode := '';
                     ColourCode := '';
                     InUse := False;
                     EBI := Null;

                     FSyncDataQuery.First;
                     while not FSyncDataQuery.Eof do
                        begin
                           AnimalId := FSyncDataQuery.FieldByName('ID').AsInteger;
                           AnimalNo := Trim(FSyncDataQuery.FieldByName('AnimalNo').AsString);
                           NatIDNum := Trim(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                           AnimalDOB := FSyncDataQuery.FieldByName('DateOfBirth').AsDateTime;
                           AnimalSex := FSyncDataQuery.FieldByName('Sex').AsString;
                           BreedCode := EnforceOfficialBreedCode(FSyncDataQuery.FieldByName('BreedCode').AsString);
                           OutputBreed(BreedCode);
                           ColourCode := FSyncDataQuery.FieldByName('ColourCode').AsString;
                           LactNo := FSyncDataQuery.FieldByName('LactNo').AsInteger;
                           HerdID := FSyncDataQuery.FieldByName('HerdID').AsInteger;
                           InHerd := FSyncDataQuery.FieldByName('InHerd').AsBoolean;
                           Name := FSyncDataQuery.FieldByName('Name').AsString;
                           Breeding := FSyncDataQuery.FieldByName('Breeding').AsBoolean;
                           QADate := FSyncDataQuery.FieldByName('QADate').AsDateTime;
                           TBTestDate := FSyncDataQuery.FieldByName('TBTestDate').AsDateTime;
                           Brucellosis := FSyncDataQuery.FieldByName('Brucellosis').AsDateTime;
                           BVDDate := FSyncDataQuery.FieldByName('BVDDate').AsDateTime;
                           QualityAssured := FSyncDataQuery.FieldByName('QualityAssured').AsBoolean;

                           if (FSyncDataQuery.FieldByName('Sex').AsString = 'Bull') then
                              InUse := IsBullInUse(AnimalId);

                           if (AnimalSex = 'Female') then
                              EBI := FSyncDataQuery.FieldByName('CowEBI').Value
                           else if (AnimalSex = 'Bull') then
                              EBI := FSyncDataQuery.FieldByName('BullEBI').Value;

                           IsMultiInstance := IsMultiInstanceNatIdNum(FSyncDataQuery.FieldByName('NatIDNum').AsString);

                           //   16/05/19 [V5.8 R9.2] /MK Additional Feature - Added ToBeCulled status of the animal to AnimalNode - SP request.
                           ToBeCulled := GetCullingStatus(AnimalID);

                           FOutputAnimalNode := CreateAnimalNode(AnimalId, AnimalNo, NatIDNum, Name, AnimalDOB,
                                                                 QADate, Brucellosis, TBTestDate, BVDDate,
                                                                 AnimalSex, BreedCode, ColourCode, LactNo, HerdID, InHerd,
                                                                 InUse, FALSE, Breeding,
                                                                 FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean,
                                                                 IsMultiInstance, QualityAssured, ToBeCulled, EBI);

                           if ( not(FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean) ) then
                              begin
                                 // Lets also include the animals Dam/Sire information.
                                 AddAncestryInformation(FOutputAnimalNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := AnimalId;
                                 Inc(ArrayIndex);
                              end;

                           if InHerd then
                              if FSyncOutputParams.OutputDrugWithdrawalDates then
                                 AddDrugWithdrawalDates(AnimalId,FOutputAnimalNode);

                           FOutputAnimalsNode.appendChild(FOutputAnimalNode);
                           FSyncDataQuery.Next;
                        end;

                     FlagAsSynchronized(MyArray, AnimalSync);
                  finally
                     FSyncDataQuery.Active := False;
                     FDrugWithdrawalQuery.Active := False;
                  end;

                  // Now Add NoneHerd Breeding Bulls To The List Of Animals

                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.Id, A.HerdId, A.AnimalNo, A.Name, B.Code BreedCode, C.LookupCode ColourCode, ');
                  FSyncDataQuery.SQL.Add('       BS.InUse, A.IsSynchronized, B1.RBI AS BullEBI ');
                  FSyncDataQuery.SQL.Add('FROM Animals A ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Breeds B On (B.ID = A.PrimaryBreed) ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN GenLook C ON (C.Id = A.Colour)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN BullSemenStk BS ON (BS.AnimalID = A.ID) ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN BullExt B1 ON (A.Id = B1.AnimalId)');
                  FSyncDataQuery.SQL.Add('WHERE (A.AnimalDeleted = False) ');
                  FSyncDataQuery.SQL.Add('AND (Upper(A.Sex) = "BULL") ');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId = '+IntToStr(NoneHerdId)+') ');
                  // allow bulls marked out of use to be processed by FarmSync program
                  // These bulls will not be sync'd over to server but will be used
                  // to cross check against bulls retrieved from server to ensure
                  // duplicate bulls do not get save to database.
                  //FAnimalQuery.SQL.Add('AND   (BS.InUse = True)');
                  FSyncDataQuery.Active := True;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  try
                     AnimalNo := '';
                     NatIDNum := '';
                     AnimalDOB := 0;
                     AnimalSex := '';
                     BreedCode := '';
                     ColourCode := '';
                     LactNo := 0;
                     EBI := Null;

                     FSyncDataQuery.First;
                     while not FSyncDataQuery.Eof do
                        begin
                           AnimalId := FSyncDataQuery.FieldByName('ID').AsInteger;
                           HerdID := FSyncDataQuery.FieldByName('HerdID').AsInteger;
                           AnimalNo := Trim(FSyncDataQuery.FieldByName('AnimalNo').AsString);
                           Name := FSyncDataQuery.FieldByName('Name').AsString;
                           AnimalSex := 'Bull';
                           BreedCode := EnforceOfficialBreedCode(FSyncDataQuery.FieldByName('BreedCode').AsString);
                           OutputBreed(BreedCode);
                           ColourCode := FSyncDataQuery.FieldByName('ColourCode').AsString;
                           InHerd := False;
                           Breeding := True;
                           InUse := FSyncDataQuery.FieldByName('InUse').AsBoolean;
                           BullWasUsed := False;
                           if not InUse then
                              begin
                                 // SP 12/02/2015

                                 // We should now include a BullUsed indicator to the server.
                                 // A problem occurred when service & heat events arrived to the server with a Bull Code, but
                                 // that Bull was never sync'd and as a result of this the service/heat events would be saved to
                                 // the database with a NULL BullId value.

                                 // When sync'ing breeding events to server which require the bull Ids its important
                                 // the associated bull is also sync'd. To do this we must query the database
                                 // for any service/heat events where the bull might have been selected. If the bull was
                                 // selected we should mark the BullUsed flag true.

                                 BullWasUsed := BullUsed(AnimalId);
                              end;

                           EBI := FSyncDataQuery.FieldByName('BullEBI').Value;

                           FOutputAnimalNode := CreateAnimalNode(AnimalId, AnimalNo, NatIDNum, Name, AnimalDOB, 0, 0, 0, 0,
                                                                 AnimalSex, BreedCode, ColourCode, LactNo, HerdID, InHerd,
                                                                 InUse, BullWasUsed, Breeding,
                                                                 FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean,
                                                                 FALSE, False, False, EBI);

                           FOutputAnimalsNode.appendChild(FOutputAnimalNode);

                           if ( not FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean ) then
                              begin
                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := AnimalId;
                                 Inc(ArrayIndex);
                              end;

                           FSyncDataQuery.Next;
                        end;

                     FlagAsSynchronized(MyArray, AnimalSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  FHerdNode.appendChild(FOutputAnimalsNode);

                  // Output all animals marked as Deleted.
                  FOutputDeletedAnimalsNode := FDocument.createElement('deletedAnimals');

                  FSyncDataQuery.SQL.Clear;
                  // Animal Info
                  FSyncDataQuery.SQL.Add('SELECT A.ID ');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('WHERE (A.AnimalDeleted = True)');
                  FSyncDataQuery.Active := True;

                  try
                     FSyncDataQuery.First;
                     while not FSyncDataQuery.Eof do
                        begin
                           AnimalId := FSyncDataQuery.FieldByName('ID').AsInteger;

                           FChildNode := FDocument.createElement('animalId');
                           FChildNode.Set_text(IntToStr(AnimalId));
                           FOutputDeletedAnimalsNode.appendChild(FChildNode);

                           FSyncDataQuery.Next;
                        end;
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  FHerdNode.appendChild(FOutputDeletedAnimalsNode);

                  // events
                  FInputEventsNode := FDocument.createElement('events');
                  FHerdNode.appendChild(FInputEventsNode);

                  // Calving Events

                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo, ');
                  FSyncDataQuery.SQL.Add('       E.EventDesc AS EventComment, G.LookupCode As CalvingSurvey');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
                  FSyncDataQuery.SQL.Add('INNER JOIN Calvings C ON (C.EventId=E.Id)');
                  //   06/11/14 [V5.3 R8.8] /MK Change - Use LEFT JOIN instead of INNER JOIN for GB customers that don't record Birth Type - SP/GL/TGM request.
                  FSyncDataQuery.SQL.Add('LEFT JOIN GenLook G ON (G.Id=C.BirthType)');
                  FSyncDataQuery.SQL.Add('WHERE (E.EventType=5)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=False)');
                  FSyncDataQuery.SQL.Add('AND (A.InHerd=True)');
                  FSyncDataQuery.SQL.Add('AND (A.Sex = ''Female'')');
                  FSyncDataQuery.SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                  FSyncDataQuery.SQL.Add('ORDER BY E.EventDate Desc');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  try
                     // Add Node For Calving Event
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('calvingEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('calvingSurvey');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('CalvingSurvey').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 AddCalvingInformation(FSyncDataQuery.FieldByName('EventID').AsInteger,FInputEventNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventID').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  //   11/06/20 [V5.9 R4.8] /MK Additional Feature - I added the sexed semen to the output of the service events.
                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo, ');
                  FSyncDataQuery.SQL.Add('       E.EventDesc AS EventComment, A2.AnimalNo AS SireNo, ');
                  FSyncDataQuery.SQL.Add('	A2.NatIDNum AS SireNatId, G.LookupCode AS StrawType');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
                  FSyncDataQuery.SQL.Add('INNER JOIN Services S ON (S.EventId=E.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  Animals A2 ON (S.ServiceBull=A2.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  GenLook G ON (G.ID = S.SexedSemen)');
                  FSyncDataQuery.SQL.Add('WHERE (E.EventType=2)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=False)');
                  FSyncDataQuery.SQL.Add('AND (A.InHerd=True)');
                  FSyncDataQuery.SQL.Add('AND (A.Sex = ''Female'')');
                  FSyncDataQuery.SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                  FSyncDataQuery.SQL.Add('ORDER BY E.EventDate Desc');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  try
                     // Add Node For Service Event
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('serviceEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('sireNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('SireNo').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('sireNatIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('SireNatId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('strawType');
                                 FChildNode.Set_text(StripAllNomNumAlpha(UpperCase(FSyncDataQuery.FieldByName('StrawType').AsString)));
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventID').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.Active := False;
                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo,');
                  FSyncDataQuery.SQL.Add('       E.EventDesc AS EventComment,');
                  FSyncDataQuery.SQL.Add('		 A2.AnimalNo AS PlannedBullNo, A2.NatIDNum AS PlannedBullNatId');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
                  FSyncDataQuery.SQL.Add('INNER JOIN Bullings B ON (B.EventId=E.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Animals A2 ON (B.PlannedBull=A2.Id)');
                  FSyncDataQuery.SQL.Add('WHERE (E.EventType=1)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=False)');
                  FSyncDataQuery.SQL.Add('AND (A.InHerd=True)');
                  FSyncDataQuery.SQL.Add('AND (A.Sex = ''Female'')');
                  FSyncDataQuery.SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                  FSyncDataQuery.SQL.Add('ORDER BY E.EventDate Desc');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  try
                     // Add Node For Bulling (aka Heat) Event
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('bullingEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('plannedBullNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('PlannedBullNo').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('plannedBullNatIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('PlannedBullNatId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;


                  // *************** Preg Diag *************** \\

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.Active := False;
                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo,');
                  FSyncDataQuery.SQL.Add('       E.EventDesc AS EventComment,');
                  FSyncDataQuery.SQL.Add('		 P.PregnancyStatus, P.DaysInCalf, P.NoCalves, P.CalfType');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
                  FSyncDataQuery.SQL.Add('INNER JOIN PregnancyDiag P ON (P.EventId=E.Id)');
                  FSyncDataQuery.SQL.Add('WHERE (E.EventType=3)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=False)');
                  FSyncDataQuery.SQL.Add('AND (A.InHerd=True)');
                  FSyncDataQuery.SQL.Add('AND (A.Sex = ''Female'')');
                  FSyncDataQuery.SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                  FSyncDataQuery.SQL.Add('ORDER BY E.EventDate Desc');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  try
                     // Add Node For Preg Diagnosis Events
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('pregDiagEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('isPregnant');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('PregnancyStatus').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('daysInCalf');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('DaysInCalf').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('numberOfCalves');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('NoCalves').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('calfGenders');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('CalfType').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  // *************** Dry Off Event *************** \\

                  // 02/09/2015 SP - Block of code rem'd out because dryoff is now output as part of
                  // the newer Health event block

                  {ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.Active := False;
                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo,');
                  FSyncDataQuery.SQL.Add('       E.EventDesc AS EventComment');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
                  FSyncDataQuery.SQL.Add('WHERE (E.EventType=4)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=False)');
                  FSyncDataQuery.SQL.Add('AND (A.InHerd=True)');
                  FSyncDataQuery.SQL.Add('AND (A.Sex = ''Female'')');
                  FSyncDataQuery.SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                  FSyncDataQuery.SQL.Add('ORDER BY E.EventDate Desc');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  try
                     // Add Node For Dry Off Events
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('dryOffEvent');

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;}

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo,');
                  FSyncDataQuery.SQL.Add('       E.EventDesc AS EventComment,  B.Id AS BuyerId, ');
                  FSyncDataQuery.SQL.Add('       S.Id SupplierId, P.Price, P.Weight, P.Grade ,');
                  FSyncDataQuery.SQL.Add('		  P.LotNumber, P.MeasuredWeight, P.MeasuredWtDate, P.FQASDays ');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
                  FSyncDataQuery.SQL.Add('INNER JOIN Purchases P ON (P.EventId=E.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN SuppliersBreeders S ON (P.Supplier=S.Id)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Buyers B ON (P.Buyer=B.Id)');
                  FSyncDataQuery.SQL.Add('WHERE (E.EventType=12)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=False)');
                  FSyncDataQuery.SQL.Add('AND (A.InHerd=True)');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;
                  try
                     // Add Node For Purchase Event
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('purchaseEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('buyerId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('BuyerId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('supplierId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('SupplierId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('price');
                                 if (FSyncDataQuery.FieldByName('Price').AsFloat>0) then
                                     FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('Price').AsFloat));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('weight');
                                 if (FSyncDataQuery.FieldByName('Weight').AsFloat>0) then
                                    FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('Weight').AsFloat));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('grade');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('Grade').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lotNumber');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('LotNumber').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('farmWeight');
                                 if (FSyncDataQuery.FieldByName('MeasuredWeight').AsFloat>0) then
                                    FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('MeasuredWeight').AsFloat));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('farmWeightDate');
                                 if (FSyncDataQuery.FieldByName('MeasuredWtDate').AsDateTime>0) then
                                     FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('MeasuredWtDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.Active := False;

                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo,');
                  FSyncDataQuery.SQL.Add('       E.EventDesc AS EventComment, C.Score');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
                  FSyncDataQuery.SQL.Add('INNER JOIN ConditionScore C ON (C.EventId=E.Id)');
                  FSyncDataQuery.SQL.Add('WHERE (E.EventType=20)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=False)');
                  FSyncDataQuery.SQL.Add('AND (A.InHerd=True)');
                  FSyncDataQuery.SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                  FSyncDataQuery.SQL.Add('ORDER BY E.EventDate Desc');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  try
                     // Add Node For Condition Score
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('conditionScoreEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('score');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('Score').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT EventId, EventType     ');
                  FSyncDataQuery.SQL.Add('FROM ICBFDelete               ');
                  FSyncDataQuery.SQL.Add('WHERE (IsSynchronized = False)');
                  FSyncDataQuery.SQL.Add('AND   (HerdId =:HerdId)');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;
                  try
                     // Add Node For Delete Event Ids
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FDeleteIdsNode := FDocument.createElement('deletedEvents');
                           FRootNode.appendChild(FDeleteIdsNode);

                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FDeleteIdNode := FDocument.createElement('deletedEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FDeleteIdNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventType');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventType').AsString);
                                 FDeleteIdNode.appendChild(FChildNode);

                                 FDeleteIdsNode.appendChild(FDeleteIdNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                      FlagAsSynchronized(MyArray, DeletedEventsSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  ArrayIndex := 0;
                  SetLength(MyArray,0);

                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT EventID, ClientID, NatIDNo, EventType');
                  FSyncDataQuery.SQL.Add('FROM EventsExt');
                  FSyncDataQuery.SQL.Add('WHERE IsDeleted = True');
                  FSyncDataQuery.SQL.Add('AND   IsSynchronized = False');
                  FSyncDataQuery.Active := True;

                  try
                     if ( FSyncDataQuery.RecordCount > 0 ) then
                        begin
                           if ( FDeleteIdsNode = nil ) then
                              begin
                                 FDeleteIdsNode := FDocument.createElement('deletedEvents');
                                 FRootNode.appendChild(FDeleteIdsNode);
                              end;

                           FSyncDataQuery.First;
                           while ( not(FSyncDataQuery.Eof) ) do
                              begin
                                 FDeleteIdNode := FDocument.createElement('deletedEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FDeleteIdNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('clientId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('ClientId').AsString);
                                 FDeleteIdNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNo').AsString);
                                 FDeleteIdNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventType');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventType').AsString);
                                 FDeleteIdNode.appendChild(FChildNode);

                                 FDeleteIdsNode.appendChild(FDeleteIdNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;
                      FlagAsSynchronized(MyArray, EventsExtSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  if ( FDeleteIdsNode <> nil ) and ( FDeleteIdsNode.hasChildNodes ) then
                     FHerdNode.appendChild(FDeleteIdsNode);

                  if ( FRegisteredCountry <> Ireland ) then
                     begin
                        ArrayIndex := 0;
                        SetLength(MyArray, 0);

                        FSyncDataQuery.Active := False;
                        FSyncDataQuery.SQL.Clear;
                        FSyncDataQuery.SQL.Add('SELECT A.NatIdNum, M.*');
                        FSyncDataQuery.SQL.Add('From MilkDisk M');
                        FSyncDataQuery.SQL.Add('INNER JOIN Animals A ON (A.Id=M.AnimalId)');
                        FSyncDataQuery.SQL.Add('WHERE (A.InHerd = True)');
                        FSyncDataQuery.SQL.Add('AND (M.LactNo <= A.LactNo)');
                        FSyncDataQuery.SQL.Add('AND (M.IsSynchronized = False)');
                        FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                        FSyncDataQuery.SQL.Add('AND (A.InHerd = True)');
                        FSyncDataQuery.SQL.Add('ORDER BY M.AnimalId, M.LactNo DESC');
                        FSyncDataQuery.Params[0].AsInteger := FHerdID;
                        FSyncDataQuery.Active := True;
                        try
                           // Add Node For Purchase Event
                           if FSyncDataQuery.RecordCount > 0 then
                              begin
                                 // completedLactations
                                 FInputMilkLactationsNode := FDocument.createElement('milkProduction');
                                 FHerdNode.appendChild(FInputMilkLactationsNode);

                                 FSyncDataQuery.First;
                                 while not FSyncDataQuery.Eof do
                                    begin
                                       FInputMilkLactationNode := FDocument.createElement('lactationMilkSummary');

                                       FChildNode := FDocument.createElement('natIdNo');
                                       FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('lactNo');
                                       FChildNode.Set_text(FSyncDataQuery.FieldByName('LactNo').AsString);
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('sCC');
                                       if (FSyncDataQuery.FieldByName('SCC').AsFloat>0) then
                                          FChildNode.Set_text(FSyncDataQuery.FieldByName('SCC').AsString);
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('noOfRecordings');
                                       if (FSyncDataQuery.FieldByName('NoOfRecordings').AsInteger>0) then
                                          FChildNode.Set_text(FSyncDataQuery.FieldByName('NoOfRecordings').AsString);
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('daysInMilk');
                                       if (FSyncDataQuery.FieldByName('DaysInMilk').AsInteger>0) then
                                          FChildNode.Set_text(FSyncDataQuery.FieldByName('DaysInMilk').AsString);
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('cumYield');
                                       if (FSyncDataQuery.FieldByName('CumYield').AsFloat>0) then
                                          FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('CumYield').AsFloat));
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('cumBFatPerc');
                                       if (FSyncDataQuery.FieldByName('cumBFatPerc').AsFloat>0) then
                                          FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('cumBFatPerc').AsFloat));
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('cumProtPerc');
                                       if (FSyncDataQuery.FieldByName('CumProtPerc').AsFloat>0) then
                                          FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('CumProtPerc').AsFloat));
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('yield305');
                                       if (FSyncDataQuery.FieldByName('Yield305').AsFloat>0) then
                                          FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('Yield305').AsFloat));
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('bFatPerc305');
                                       if (FSyncDataQuery.FieldByName('BFatPerc305').AsFloat>0) then
                                          FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('BFatPerc305').AsFloat));
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('protPerc305');
                                       if (FSyncDataQuery.FieldByName('ProtPerc305').AsFloat>0) then
                                          FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('ProtPerc305').AsFloat));
                                       FInputMilkLactationNode.appendChild(FChildNode);

                                       FInputMilkLactationsNode.appendChild(FInputMilkLactationNode);

                                       SetLength(myArray, ArrayIndex+1);
                                       myArray[ArrayIndex] := FSyncDataQuery.FieldByName('MilkDiskId').AsInteger;
                                       Inc(ArrayIndex);

                                       FSyncDataQuery.Next;
                                    end;
                              end;

                           FlagAsSynchronized(MyArray, MilkLactSync);
                        finally
                           FSyncDataQuery.Active := False;
                        end;
                     end;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo, ');
                  FSyncDataQuery.SQL.Add('E.EventDesc AS EventComment, E.EventType, E.Modified,            ');
                  FSyncDataQuery.SQL.Add('H.RateApplic, H.DrugBatchNo, H.NoDays, H.NoTimes, M.VPANo,       ');
                  FSyncDataQuery.SQL.Add('G1.LookupCode AS HealthCode, G2.LookupCode AS FarmCode,          ');
                  FSyncDataQuery.SQL.Add('G3.Description AS ApplicMethod,                                  ');
                  FSyncDataQuery.SQL.Add('MA1.AdminCode AS VetCode, MA2.AdminCode AS AdminByCode,          ');
                  FSyncDataQuery.SQL.Add('G4.Description DiseaseDesc1, G5.Description DiseaseDesc2,        ');
                  FSyncDataQuery.SQL.Add('MP.BatchNo, H.ReportInDays                                       ');
                  FSyncDataQuery.SQL.Add('FROM Events E                                                    ');
                  FSyncDataQuery.SQL.Add('INNER JOIN Animals A  ON   (E.AnimalId=A.Id)                     ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  Health H   ON   (E.Id=H.EventId)                      ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  Medicine M ON   (M.ID=H.DrugUsed)                     ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  GenLook G1 ON   (H.HealthCode=G1.ID)                  ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  GenLook G2 ON   (H.FarmCode=G2.ID)                    ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  GenLook G3 ON   (H.ApplicMethod=G3.ID)                ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  GenLook G4 ON   (H.FarmCode=G4.ID)                    ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  GenLook G5 ON   (H.ApplicMethod=G5.ID)                ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  MedAdmin MA1 ON (H.VetPresc=MA1.ID)                   ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  MedAdmin MA2 ON (H.AdMinBy=MA2.ID)                    ');
                  FSyncDataQuery.SQL.Add('LEFT JOIN  MediPur MP   ON (MP.ID=H.DrugPurchId)                 ');
                  FSyncDataQuery.SQL.Add('WHERE (A.HerdId =:AHerdId)                                       ');
                  FSyncDataQuery.SQL.Add('AND   (E.EventType IN                                            ');
                  FSyncDataQuery.SQL.Add('         ('+ IntToStr(cHealthEvent) +','+IntToStr(CHerdVaccination) +','+IntToStr(CDryOffEvent) +',');
                  FSyncDataQuery.SQL.Add('          '+ IntToStr(CNewMastitisEvent) +','+IntToStr(CLamenessEvent) +'))');
                  FSyncDataQuery.SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy', IncYear(Date,-GetNoOfYearsHealthHistory())) + '''' +
                                                         ' AND ' + '''' + FormatDateTime('mm/dd/yyyy',Date) + '''' + ')');
                  FSyncDataQuery.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=FALSE)');

                  // ** DO NOT INCLUDE EVENTS PREVIOUSLY DOWNLOADED FROM SERVER
                  FSyncDataQuery.SQL.Add('AND ((E.EventSource <> ' + IntToStr(sSMARTPHONE) + ') OR (E.EventSource IS NULL))');

                  //FSyncDataQuery.SQL.Add('AND (M.VPANo IS NOT NULL)');

                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  try
                     // Add Node For Health | Dry Off | Vaccination | Mastitis | Lameness Events
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 // We need to establish if the event has a drug which contains a valid VPA Number
                                 // as we'll use the VPA Number to match the drug against drug records on the server.
                                 // EXCEPT... in cases of dry off events, do not exclude from output event if there is no
                                 // VPA Number is present as dry off events can be stored/saved without a drug value.
                                 if (((FSyncDataQuery.FieldByName('EventType').AsInteger = cHealthEvent) or
                                      (FSyncDataQuery.FieldByName('EventType').AsInteger = CHerdVaccination)) and
                                     (Length(FSyncDataQuery.FieldByName('VPANo').AsString) = 0)) then
                                     begin
                                        FSyncDataQuery.Next;
                                        Continue;
                                     end;

                                 if (FSyncDataQuery.FieldByName('EventType').AsInteger = cHealthEvent) then
                                    FInputEventNode := FDocument.createElement('healthEvent')
                                 else if (FSyncDataQuery.FieldByName('EventType').AsInteger = CDryOffEvent) then
                                    FInputEventNode := FDocument.createElement('dryOffEvent')
                                 else if (FSyncDataQuery.FieldByName('EventType').AsInteger = CHerdVaccination) then
                                    FInputEventNode := FDocument.createElement('vaccinationEvent')
                                 else if (FSyncDataQuery.FieldByName('EventType').AsInteger = CNewMastitisEvent) then
                                    FInputEventNode := FDocument.createElement('mastitisEvent')
                                 else if (FSyncDataQuery.FieldByName('EventType').AsInteger = CLamenessEvent) then
                                    FInputEventNode := FDocument.createElement('lamenessEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('edited');
                                 if (FSyncDataQuery.FieldByName('Modified').AsBoolean) then
                                     FChildNode.Set_text('true')
                                 else
                                     FChildNode.Set_text('false');
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('vpaNumber');
                                 FChildNode.Set_text(FormatVPANumber(FSyncDataQuery.FieldByName('VPANo').AsString));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('applicRate');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('RateApplic').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 //   28/09/17 [V5.7 R2.8] /MK Change - Only export the first 25 characters of the batch number - SP Request.
                                 FChildNode := FDocument.createElement('batchNo');
                                 if Length(Trim(FSyncDataQuery.FieldByName('BatchNo').AsString)) > 0 then
                                    FChildNode.Set_text(Copy(FSyncDataQuery.FieldByName('BatchNo').AsString,0,25))
                                 else
                                    FChildNode.Set_text(Copy(FSyncDataQuery.FieldByName('DrugBatchNo').AsString,0,25));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('noOfDays');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NoDays').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('noOfTimes');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NoTimes').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 //   09/02/21 [V5.9 R8.3] /SP Change - Added ReportInDays to the Health events to be synced to the server.
                                 FChildNode := FDocument.createElement('reminderDays');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('ReportInDays').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 // Special case here, MK stored the vaccination code in either the health or farm code field
                                 // depending on the country code. So to address this, in cases of vaccination event we should take
                                 // the value from either field and create a dedicated vaccinationCode field so FarmSync can process
                                 // without complication.
                                 if (FSyncDataQuery.FieldByName('EventType').AsInteger = CHerdVaccination) then
                                    begin
                                       FChildNode := FDocument.createElement('diseaseDesc');
                                       if (Length(Trim(FSyncDataQuery.FieldByName('diseaseDesc1').AsString)) >0) then
                                          FChildNode.Set_text(FSyncDataQuery.FieldByName('diseaseDesc1').AsString)
                                       else if (Length(Trim(FSyncDataQuery.FieldByName('diseaseDesc2').AsString)) >0) then
                                          FChildNode.Set_text(FSyncDataQuery.FieldByName('diseaseDesc2').AsString);
                                       FInputEventNode.appendChild(FChildNode);
                                    end
                                 else
                                    begin
                                       FChildNode := FDocument.createElement('healthCode');
                                       FChildNode.Set_text(FSyncDataQuery.FieldByName('HealthCode').AsString);
                                       FInputEventNode.appendChild(FChildNode);

                                       FChildNode := FDocument.createElement('farmCode');
                                       FChildNode.Set_text(FSyncDataQuery.FieldByName('FarmCode').AsString);
                                       FInputEventNode.appendChild(FChildNode);
                                    end;

                                 FChildNode := FDocument.createElement('applicMethod');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('applicMethod').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('vetCode');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('VetCode').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('adminByCode');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('AdminByCode').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventID').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.Active := False;
                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT A.NatIDNum, E.Id AS EventId, E.EventDate, E.AnimalLactNo,');
                  FSyncDataQuery.SQL.Add('       E.EventDesc AS EventComment, W.Weight');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
                  FSyncDataQuery.SQL.Add('INNER JOIN Weights W ON (W.EventId=E.Id)');
                  FSyncDataQuery.SQL.Add('WHERE (E.EventType=7)');
                  FSyncDataQuery.SQL.Add('AND (E.IsSynchronized=False)');
                  FSyncDataQuery.SQL.Add('AND (A.InHerd=True)');
                  FSyncDataQuery.SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                  FSyncDataQuery.SQL.Add('AND (A.HerdId =:AHerdId)');
                  FSyncDataQuery.SQL.Add('ORDER BY E.EventDate Desc');
                  FSyncDataQuery.Params[0].AsInteger := FHerdID;
                  FSyncDataQuery.Active := True;

                  try
                     // Add Node For Weighing
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('weighingEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIDNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('AnimalLactNo').AsInteger));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventComment').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('weight');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('Weight').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  ArrayIndex := 0;
                  SetLength(MyArray, 0);

                  FSyncDataQuery.Active := False;
                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT E.ID EventId, A.NatIdNum, E.EventDate, A.LactNo, E.EventDesc,');
                  FSyncDataQuery.SQL.Add('	 S.Sold, S.Customer CustomerId, S.Price, S.ColdDeadWt DeadWeight, S.Weight LiveWeight,');
                  FSyncDataQuery.SQL.Add('	 S.Grade, G.LookupCode CullingCode');
                  FSyncDataQuery.SQL.Add('FROM Animals A');
                  FSyncDataQuery.SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
                  FSyncDataQuery.SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventId = E.ID)');
                  FSyncDataQuery.SQL.Add('Left Join GenLook G ON ((G.ID = S.Culled) AND (G.ListType = 14))');
                  FSyncDataQuery.SQL.Add('WHERE (A.Inherd = False)');
                  FSyncDataQuery.SQL.Add('AND   (A.HerdId = :AHerdId)');
                  FSyncDataQuery.SQL.Add('AND   (A.AnimalDeleted = False)');
                  FSyncDataQuery.SQL.Add('AND   (E.EventType = :SaleDeathEvent)');
                  FSyncDataQuery.SQL.Add('AND   (E.EventDate > "01/01/2019")');
                  FSyncDataQuery.SQL.Add('AND   (E.IsSynchronized = False)');
                  FSyncDataQuery.Params[0].AsInteger := FHerdId;
                  FSyncDataQuery.Params[1].AsInteger := CSaleDeathEvent;
                  FSyncDataQuery.Active := True;

                  try
                     // Add Node For Sale Death Event
                     if FSyncDataQuery.RecordCount > 0 then
                        begin
                           FSyncDataQuery.First;
                           while not FSyncDataQuery.Eof do
                              begin
                                 FInputEventNode := FDocument.createElement('saleDeathEvent');

                                 FChildNode := FDocument.createElement('eventId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('natIdNo');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('NatIdNum').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventDate');
                                 FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('lactationNumber');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('LactNo').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('eventComment');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('EventDesc').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('isDeath');
                                 if ( FSyncDataQuery.FieldByName('Sold').AsBoolean ) then
                                    FChildNode.Set_text('false')
                                 else
                                    FChildNode.Set_text('true');
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('customerId');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('CustomerId').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('price');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('Price').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('deadWeight');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('DeadWeight').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('liveWeight');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('LiveWeight').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('grade');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('Grade').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FChildNode := FDocument.createElement('cullingCode');
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('CullingCode').AsString);
                                 FInputEventNode.appendChild(FChildNode);

                                 FInputEventsNode.appendChild(FInputEventNode);

                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FSyncDataQuery.FieldByName('EventId').AsInteger;
                                 Inc(ArrayIndex);

                                 FSyncDataQuery.Next;
                              end;
                        end;

                     FlagAsSynchronized(MyArray, EventSync);
                  finally
                     FSyncDataQuery.Active := False;
                  end;

                  FTempNode := FDocument.createElement('icbfDownloadStatus');
                  FHerdNode.appendChild(FTempNode);
                  FSyncDataQuery.Active := False;
                  FSyncDataQuery.SQL.Clear;
                  FSyncDataQuery.SQL.Add('SELECT herdEvaluationModifiedOn');
                  FSyncDataQuery.SQL.Add('FROM SyncDefaults');
                  FSyncDataQuery.Active := True;
                  if ( FSyncDataQuery.RecordCount > 0 ) then
                     try
                        FChildNode := FDocument.createElement('herdEvaluationModifiedOn');
                        if ( FSyncDataQuery.FieldByName('herdEvaluationModifiedOn').AsDateTime > 0 ) then
                           FChildNode.Set_text(DateToStr(FSyncDataQuery.FieldByName('herdEvaluationModifiedOn').AsDateTime));
                        FTempNode.appendChild(FChildNode);
                     except
                     end;

                  FOutputHerdsNode.appendChild(FHerdNode);

                  FHerdQuery.Next;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               // Add Node For Observers/AI technicians;
               FGenlookQuery.Active := False;
               FGenlookQuery.SQL.Clear;
               FGenlookQuery.SQL.Add('SELECT Id, LookupCode, Description, IsSynchronized');
               FGenlookQuery.SQL.Add('FROM Genlook');
               FGenlookQuery.SQL.Add('WHERE ListType = 10');
               FGenlookQuery.Active := True;

               if FGenlookQuery.RecordCount > 0 then
                  begin
                     FTechniciansNode := FDocument.createElement('technicians');
                     FRootNode.appendChild(FTechniciansNode);

                     FGenlookQuery.First;
                     while not FGenlookQuery.Eof do
                        begin
                           FTechnicianNode := FDocument.createElement('technician');

                           FChildNode := FDocument.createElement('code');
                           FChildNode.Set_text( FGenlookQuery.FieldByName('LookupCode').AsString);
                           FTechnicianNode.appendChild(FChildNode);

                           FChildNode := FDocument.createElement('description');
                           FChildNode.Set_text( FGenlookQuery.FieldByName('Description').AsString);
                           FTechnicianNode.appendChild(FChildNode);

                           FChildNode := FDocument.createElement('isSynchronized');
                           FChildNode.Set_text(FGenlookQuery.FieldByName('IsSynchronized').AsString);
                           FTechnicianNode.appendChild(FChildNode);

                           FTechniciansNode.appendChild(FTechnicianNode);

                           if (not FGenlookQuery.FieldByName('IsSynchronized').AsBoolean) then
                              begin
                                 SetLength(myArray, ArrayIndex+1);
                                 myArray[ArrayIndex] := FGenlookQuery.FieldByName('Id').AsInteger;
                                 Inc(ArrayIndex);
                              end;

                           FGenlookQuery.Next;
                        end;

                     FlagAsSynchronized(MyArray, GenLookSync);
                  end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FMedAdminQuery.Active := True;
               try
                  // Add Node For Medicine Administrators;
                  if FMedAdminQuery.RecordCount > 0 then
                     begin
                        FMedicineAdministratorsNode := FDocument.createElement('veterinaryAdministrators');
                        FRootNode.appendChild(FMedicineAdministratorsNode);

                        FMedAdminQuery.First;
                        while not FMedAdminQuery.Eof do
                           begin
                              FMedicineAdministratorNode := FDocument.createElement('veterinaryAdministrator');

                              FChildNode := FDocument.createElement('code');
                              FChildNode.Set_text( FMedAdminQuery.FieldByName('AdminCode').AsString);
                              FMedicineAdministratorNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('name');
                              FChildNode.Set_text( FMedAdminQuery.FieldByName('Name').AsString);
                              FMedicineAdministratorNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('administratorType');

                              if (POS('VET', UPPERCASE(FMedAdminQuery.FieldByName('Position').AsString)) > 0) then
                                  FChildNode.Set_text('1') // Veterinarian
                              else
                                  FChildNode.Set_text('2'); // Farmer/Other
                              FMedicineAdministratorNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isSynchronized');
                              FChildNode.Set_text(FMedAdminQuery.FieldByName('IsSynchronized').AsString);
                              FMedicineAdministratorNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('inUse');
                              FChildNode.Set_text(FMedAdminQuery.FieldByName('InUse').AsString);
                              FMedicineAdministratorNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isVet');
                              FChildNode.Set_text(FMedAdminQuery.FieldByName('IsVet').AsString);
                              FMedicineAdministratorNode.appendChild(FChildNode);

                              FMedicineAdministratorsNode.appendChild(FMedicineAdministratorNode);

                              if (not FMedAdminQuery.FieldByName('IsSynchronized').AsBoolean) then
                                 begin
                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FMedAdminQuery.FieldByName('Id').AsInteger;
                                    Inc(ArrayIndex);
                                 end;

                              FMedAdminQuery.Next;
                           end;
                     end;

                   FlagAsSynchronized(MyArray, VetAdminSync);
               finally
                  FMedAdminQuery.Active := False;
               end;

               // Add Node For Culling Codes
               with FGenlookQuery do
               begin
                  Active := False;
                  SQL.Clear;
                  SQL.Add('SELECT LookupCode, Description');
                  SQL.Add('FROM Genlook');
                  SQL.Add('WHERE ListType = 14');
                  Active := True;
                  try
                     FCullingCodesNode := FDocument.createElement('cullingCodes');
                     FRootNode.appendChild(FCullingCodesNode);

                     FGenlookQuery.First;
                     while not FGenlookQuery.Eof do
                        begin
                           FCullingCodeNode := FDocument.createElement('cullingCode');

                           FChildNode := FDocument.createElement('code');
                           FChildNode.Set_text( FGenlookQuery.FieldByName('LookupCode').AsString);
                           FCullingCodeNode.appendChild(FChildNode);

                           FChildNode := FDocument.createElement('description');
                           if (Copy(FGenlookQuery.FieldByName('Description').AsString, 1,5) = 'ICBF-') then
                              FChildNode.Set_text( Copy(FGenlookQuery.FieldByName('Description').AsString,6, MaxInt))
                           else
                              FChildNode.Set_text( FGenlookQuery.FieldByName('Description').AsString);
                           FCullingCodeNode.appendChild(FChildNode);

                           FCullingCodesNode.appendChild(FCullingCodeNode);

                           FGenlookQuery.Next;
                        end;
                  finally
                     FGenlookQuery.Filter := '';
                     FGenlookQuery.Filtered := False;
                  end;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FFarmHealthCodeQuery.Active := True;
               try
                  // Add Node For Health Codes
                  if FFarmHealthCodeQuery.RecordCount > 0 then
                     begin
                        FFarmHealthCodesNode := FDocument.createElement('farmHealthCodes');
                        FRootNode.appendChild(FFarmHealthCodesNode);

                        FFarmHealthCodeQuery.First;
                        while not FFarmHealthCodeQuery.Eof do
                           begin
                              FFarmHealthCodeNode := FDocument.createElement('farmHealthCode');

                              FChildNode := FDocument.createElement('description');
                              FChildNode.Set_text(FFarmHealthCodeQuery.FieldByName('Description').AsString);
                              FFarmHealthCodeNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isSynchronized');
                              FChildNode.Set_text(FFarmHealthCodeQuery.FieldByName('IsSynchronized').AsString);
                              FFarmHealthCodeNode.appendChild(FChildNode);

                              FFarmHealthCodesNode.appendChild(FFarmHealthCodeNode);

                              if (not FFarmHealthCodeQuery.FieldByName('IsSynchronized').AsBoolean) then
                                 begin
                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FFarmHealthCodeQuery.FieldByName('Id').AsInteger;
                                    Inc(ArrayIndex);
                                 end;

                              FFarmHealthCodeQuery.Next;
                           end;
                     end;

                   FlagAsSynchronized(MyArray, GenLookSync);
               finally
                  FFarmHealthCodeQuery.Active := False;
               end;

               //  Sync SuppliersBreeders
               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT * From SuppliersBreeders');
               FSyncDataQuery.Active := True;
               try
                  // Add Node For Suppliers
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        FSuppliersNode := FDocument.createElement('suppliers');
                        FRootNode.appendChild(FSuppliersNode);

                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              FSupplierNode := FDocument.createElement('supplier');

                              FChildNode := FDocument.createElement('supplierId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Id').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              //   11/03/20 [V5.9 R2.8] /MK Change - Trim the SuppliersBreeders name to 40 characters.
                              FChildNode := FDocument.createElement('name');
                              FChildNode.Set_text(Copy(FSyncDataQuery.FieldByName('Name').AsString,0,40));
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address1');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 1').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address2');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 2').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address3');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 3').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address4');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 4').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('phoneNo');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Phone').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('faxNo');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Fax').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('emailAddress');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('E-mail').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isLivestockSupplier');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('AnimalSupplier').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isVeterinarySupplier');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('MedicineSupplier').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isFeedSupplier');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('FeedSupplier').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('defaultCommissionCost');
                              if (FSyncDataQuery.FieldByName('Commission').AsFloat>0) then
                                  FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('Commission').AsFloat));
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('defaultTransportCost');
                              if (FSyncDataQuery.FieldByName('Transport').AsFloat>0) then
                                 FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('Transport').AsFloat));
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isSynchronized');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('IsSynchronized').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('inUse');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('InUse').AsString);
                              FSupplierNode.appendChild(FChildNode);

                              FSuppliersNode.appendChild(FSupplierNode);

                              if (not FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean) then
                                 begin
                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FSyncDataQuery.FieldByName('Id').AsInteger;;
                                    Inc(ArrayIndex);
                                 end;

                              FSyncDataQuery.Next;
                           end;
                     end;

                  FlagAsSynchronized(MyArray, SupplierSync);
               finally
                  FSyncDataQuery.Active := False;
               end;

               // Sync Customers
               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT * From Customers');
               FSyncDataQuery.Active := True;
               try
                  // Add Node For Customers
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        FCustomersNode := FDocument.createElement('customers');
                        FRootNode.appendChild(FCustomersNode);

                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              FCustomerNode := FDocument.createElement('customer');

                              FChildNode := FDocument.createElement('customerId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Id').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('herdNumber');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('BTEHerdNo').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              //   11/03/20 [V5.9 R2.8] /MK Change - Trim the Customers name to 40 characters.
                              FChildNode := FDocument.createElement('name');
                              FChildNode.Set_text(Copy(FSyncDataQuery.FieldByName('Name').AsString,0,40));
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address1');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 1').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address2');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 2').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address3');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 3').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address4');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 4').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('phoneNo');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Phone').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('faxNo');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Fax').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('emailAddress');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('E-mail').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isLicensedMeatExporter');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Licensed').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isMeatFactory');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('MeatFactory').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('defaultDeductionsCost');
                              if (FSyncDataQuery.FieldByName('Deductions').AsFloat>0) then
                                  FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('Deductions').AsFloat));
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('defaultTransportCost');
                              if (FSyncDataQuery.FieldByName('Transport').AsFloat>0) then
                                 FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('Transport').AsFloat));
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isSynchronized');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('IsSynchronized').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('inUse');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('InUse').AsString);
                              FCustomerNode.appendChild(FChildNode);

                              FCustomersNode.appendChild(FCustomerNode);

                              if (not FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean) then
                                 begin
                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FSyncDataQuery.FieldByName('Id').AsInteger;;
                                    Inc(ArrayIndex);
                                 end;

                              FSyncDataQuery.Next;
                           end;
                     end;

                  FlagAsSynchronized(MyArray, CustomerSync);
               finally
                  FSyncDataQuery.Active := False;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT * From Buyers');
               FSyncDataQuery.Active := True;
               try
                  // Add Node For Buyers
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        FBuyersNode := FDocument.createElement('buyers');
                        FRootNode.appendChild(FBuyersNode);

                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              FBuyerNode := FDocument.createElement('buyer');

                              FChildNode := FDocument.createElement('buyerId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Id').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('name');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Name').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address1');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 1').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address2');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 2').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address3');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 3').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('address4');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Address 4').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('telNo');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Phone').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('faxNo');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Fax').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('faxNo');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Fax').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('emailAddress');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('E-mail').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('defaultCommissionCost');
                              if (FSyncDataQuery.FieldByName('Commission').AsFloat>0) then
                                 FChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('Commission').AsFloat));
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isSynchronized');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('IsSynchronized').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('inUse');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('InUse').AsString);
                              FBuyerNode.appendChild(FChildNode);

                              FBuyersNode.appendChild(FBuyerNode);

                              if (not FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean) then
                                 begin
                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FSyncDataQuery.FieldByName('Id').AsInteger;
                                    Inc(ArrayIndex);
                                 end;

                              FSyncDataQuery.Next;
                           end;
                     end;

                  FlagAsSynchronized(MyArray, BuyerSync);
               finally
                  FSyncDataQuery.Active := False;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FDiseasesQuery.Active := True;
               try
                  // Add Node For Disease Codes
                  if FDiseasesQuery.RecordCount > 0 then
                     begin
                        FFarmHealthCodesNode := FDocument.createElement('diseaseCodes');
                        FRootNode.appendChild(FFarmHealthCodesNode);

                        FDiseasesQuery.First;
                        while not FDiseasesQuery.Eof do
                           begin
                              FFarmHealthCodeNode := FDocument.createElement('diseaseCode');

                              FChildNode := FDocument.createElement('description');
                              FChildNode.Set_text(FDiseasesQuery.FieldByName('Description').AsString);
                              FFarmHealthCodeNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isSynchronized');
                              FChildNode.Set_text(FDiseasesQuery.FieldByName('IsSynchronized').AsString);
                              FFarmHealthCodeNode.appendChild(FChildNode);

                              FFarmHealthCodesNode.appendChild(FFarmHealthCodeNode);

                              if (not FDiseasesQuery.FieldByName('IsSynchronized').AsBoolean) then
                                 begin
                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FDiseasesQuery.FieldByName('Id').AsInteger;
                                    Inc(ArrayIndex);
                                 end;

                              FDiseasesQuery.Next;
                           end;
                     end;

                   FlagAsSynchronized(MyArray, GenLookSync);
               finally
                  FDiseasesQuery.Active := False;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT M.Id, M.VPANo, M.Name, M.Withdrawal,                ');
               FSyncDataQuery.SQL.Add('       M.MilkWithdrawal, M.OrganicMeatWithdrawal,          ');
               FSyncDataQuery.SQL.Add('       M.OrganicMilkWithdrawal, G.Description AS DrugGroup,');
               FSyncDataQuery.SQL.Add('       M.MilkN_A_Drug, M.MeatN_A_Drug,                     ');
               FSyncDataQuery.SQL.Add('       DU.UnitCode DoseUnit, PU.UnitCode PurchUnit         ');
               FSyncDataQuery.SQL.Add('FROM Medicine M                                            ');
               FSyncDataQuery.SQL.Add('LEFT JOIN GenLook G ON (M.MediGroup=G.Id)                  ');
               FSyncDataQuery.SQL.Add('LEFT JOIN Units DU ON (M.DoseUnit=DU.Id)                   ');
               FSyncDataQuery.SQL.Add('LEFT JOIN Units PU ON (M.PurchUnit=PU.Id)                  ');
               FSyncDataQuery.SQL.Add('WHERE IsSynchronized = FALSE                               ');
               FSyncDataQuery.SQL.Add('AND ((VPANo IS NOT NULL) AND (TRIM(VPANo) <> ''''))        ');
               FSyncDataQuery.Active := True;
               try
                  // Add Node For Drugs
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        FDrugsNode := FDocument.createElement('drugs');
                        FRootNode.appendChild(FDrugsNode);

                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              FDrugNode := FDocument.createElement('drug');

                              FChildNode := FDocument.createElement('vpaNumber');
                              TempStr := FormatVPANumber(FSyncDataQuery.FieldByName('VPANo').AsString);
                              FChildNode.Set_text(TempStr);
                              FDrugNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('name');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Name').AsString);
                              FDrugNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('meatWithdrawal');
                              //   07/12/16 [V5.5 R2.1] /MK Bug Fix - If MeatNADrug then create blank node.
                              if ( not(FSyncDataQuery.FieldByName('MeatN_A_Drug').AsBoolean) ) then
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('Withdrawal').AsString)
                              else
                                 FChildNode.Set_text('');
                              FDrugNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('milkWithdrawal');
                              //   07/12/16 [V5.5 R2.1] /MK Bug Fix - If MilkNADrug then create blank node.
                              if ( not(FSyncDataQuery.FieldByName('MilkN_A_Drug').AsBoolean) ) then
                                 FChildNode.Set_text(FSyncDataQuery.FieldByName('MilkWithdrawal').AsString)
                              else
                                 FChildNode.Set_text('');
                              FDrugNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('organicMeatWithdrawal');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('OrganicMeatWithdrawal').AsString);
                              FDrugNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('organicMilkWithdrawal');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('OrganicMilkWithdrawal').AsString);
                              FDrugNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('drugGroup');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('DrugGroup').AsString);
                              FDrugNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('doseUnit');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('DoseUnit').AsString);
                              FDrugNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('purchUnit');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('PurchUnit').AsString);
                              FDrugNode.appendChild(FChildNode);

                              FDrugsNode.appendChild(FDrugNode);

                              SetLength(myArray, ArrayIndex+1);
                              myArray[ArrayIndex] := FSyncDataQuery.FieldByName('Id').AsInteger;
                              Inc(ArrayIndex);

                              FSyncDataQuery.Next;
                           end;
                     end;

                  FlagAsSynchronized(MyArray, MedicineSync);
               finally
                  FSyncDataQuery.Active := False;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT SvrGrpTimeStamp, ClientGrpTimeStamp');
               FSyncDataQuery.SQL.Add('FROM SyncDefaults');
               FSyncDataQuery.Active := True;
               SvrGrpTimeStamp := FSyncDataQuery.FieldByName('SvrGrpTimeStamp').AsString;
               ClientGrpTimeStamp := FSyncDataQuery.FieldByName('ClientGrpTimeStamp').AsDateTime;

               FGroupsNode := FDocument.createElement('groups');
               FRootNode.appendChild(FGroupsNode);

               FChildNode := FDocument.createAttribute('timestamp');
               if ( Length(SvrGrpTimeStamp) > 0 ) then
                  FChildNode.Set_nodeValue(SvrGrpTimeStamp);
               FGroupsNode.attributes.setNamedItem(FChildNode);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT *');
               FSyncDataQuery.SQL.Add('FROM Grps');
               FSyncDataQuery.SQL.Add('WHERE GroupType <> "Drafting"');
               if ( Length(SvrGrpTimeStamp) > 0 ) then
                  FSyncDataQuery.SQL.Add('AND IsSynchronized = False');
               if ( ClientGrpTimeStamp > 0 ) then
                  begin
                     FSyncDataQuery.SQL.Add('AND ((CreatedOn > :LastDate) OR (ModifiedOn > :LastDate))');
                     FSyncDataQuery.Params[0].AsDateTime := ClientGrpTimeStamp;
                     FSyncDataQuery.Params[1].AsDateTime := ClientGrpTimeStamp;
                  end;
               FSyncDataQuery.Active := True;

               try
                  // Add Node For Groups
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              FGroupNode := FDocument.createElement('group');

                              FChildNode := FDocument.createElement('groupId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Id').AsString);
                              FGroupNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('code');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Code').AsString);
                              FGroupNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('description');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Description').AsString);
                              FGroupNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('groupType');
                              if (FSyncDataQuery.FieldByName('GroupType').AsString = 'Batch') then
                                 FChildNode.Set_text('B')
                              else if (FSyncDataQuery.FieldByName('GroupType').AsString = 'Feed') then
                                 FChildNode.Set_text('F')
                              else if (FSyncDataQuery.FieldByName('GroupType').AsString = 'Sales') then
                                 FChildNode.Set_text('S')
                              else if (FSyncDataQuery.FieldByName('GroupType').AsString = 'Purchase') then
                                 FChildNode.Set_text('P')
                              else
                                 raise Exception.CreateFmt('Unknown GroupType detected %s',[FSyncDataQuery.FieldByName('GroupType').AsString]);
                              FGroupNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('createdOn');
                              if ( FSyncDataQuery.FieldByName('CreatedOn').AsDateTime > 0 ) then
                                 FChildNode.Set_text(DateTimeToStr(FSyncDataQuery.FieldByName('CreatedOn').AsDateTime))
                              else
                                 FChildNode.Set_text('');
                              FGroupNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('modifiedOn');
                              if ( FSyncDataQuery.FieldByName('ModifiedOn').AsDateTime > 0 ) then
                                 FChildNode.Set_text(DateTimeToStr(FSyncDataQuery.FieldByName('ModifiedOn').AsDateTime))
                              else
                                 FChildNode.Set_text('');
                              FGroupNode.appendChild(FChildNode);

                              FGroupLinksNode := FDocument.createElement('animals');

                              with TQuery.Create(nil) do
                                 try
                                    DatabaseName := FDatabasePath;
                                    SQL.Clear;
                                    SQL.Add('SELECT AnimalId, DateJoined');
                                    SQL.Add('FROM GrpLinks');
                                    SQL.Add('WHERE (GroupId = :GroupId)');
                                    Params[0].AsInteger := FSyncDataQuery.FieldByName('Id').AsInteger;
                                    Open;

                                    while not eof do
                                       begin
                                          FGroupLinkNode := FDocument.createElement('animal');

                                          FGroupLinkChildNode := FDocument.createElement('animalId');
                                          FGroupLinkChildNode.Set_text(FieldByName('AnimalId').AsString);
                                          FGroupLinkNode.appendChild(FGroupLinkChildNode);

                                          FGroupLinkChildNode := FDocument.createElement('dateJoined');
                                          FGroupLinkChildNode.Set_text(FieldByName('DateJoined').AsString);
                                          FGroupLinkNode.appendChild(FGroupLinkChildNode);

                                          FGroupLinksNode.appendChild(FGroupLinkNode);

                                          Next;
                                       end;
                                 finally
                                    Free;
                                 end;

                              FGroupNode.appendChild(FGroupLinksNode);
                              FGroupsNode.appendChild(FGroupNode);

                              if (not FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean) then
                                 begin
                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FSyncDataQuery.FieldByName('Id').AsInteger;
                                    Inc(ArrayIndex);
                                 end;

                              FSyncDataQuery.Next;
                           end;
                     end;

                  FlagAsSynchronized(MyArray, GroupSync);
               finally
                  FSyncDataQuery.Active := False;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT * FROM DeletedGrps');
               FSyncDataQuery.SQL.Add('WHERE IsSynchronized = False');
               FSyncDataQuery.Active := True;

               try
                  // Append to Groups node groups that were deleted.
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        if ( FGroupsNode = nil ) then
                           begin
                              FGroupsNode := FDocument.createElement('groups');
                              FRootNode.appendChild(FGroupsNode);
                           end;

                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              FGroupNode := FDocument.createElement('group');

                              FChildNode := FDocument.createElement('groupId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('GroupId').AsString);
                              FGroupNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('isDeleted');
                              FChildNode.Set_text('True');
                              FGroupNode.appendChild(FChildNode);

                              FGroupsNode.appendChild(FGroupNode);

                              SetLength(myArray, ArrayIndex+1);
                              myArray[ArrayIndex] := FSyncDataQuery.FieldByName('Id').AsInteger;
                              Inc(ArrayIndex);

                              FSyncDataQuery.Next;
                           end;
                     end;

                  FlagAsSynchronized(MyArray, DeletedGrps);
               finally
                  FSyncDataQuery.Active := False;
               end;

               // Add Node For Feed Types

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT F.Id, F.Name, F.IsSynchronized, G.Description AS FeedCategory FROM FeedTypes F ');
               FSyncDataQuery.SQL.Add('LEFT JOIN GenLook G  ON (G.ID=F.Category)');
               FSyncDataQuery.SQL.Add('WHERE F.IsSynchronized = False');
               FSyncDataQuery.SQL.Add('AND ((G.ListType = '+ IntToStr(LFeedCategory) +') OR (G.ListType IS NULL))');
               FSyncDataQuery.Active := True;

               try
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        FListNode := FDocument.createElement('feedTypes');
                        FRootNode.appendChild(FListNode);

                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              FNode := FDocument.createElement('feedType');

                              FChildNode := FDocument.createElement('feedTypeId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Id').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('name');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Name').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('category');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('FeedCategory').AsString);
                              FNode.appendChild(FChildNode);

                              FListNode.appendChild(FNode);

                              if (not FSyncDataQuery.FieldByName('IsSynchronized').AsBoolean) then
                                 begin
                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FSyncDataQuery.FieldByName('Id').AsInteger;
                                    Inc(ArrayIndex);
                                 end;

                              FSyncDataQuery.Next;
                           end;
                     end;

                  FlagAsSynchronized(MyArray, FeedTypeSync);
               finally
                  FSyncDataQuery.Active := False;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               //  Sync MediPur
               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT MP.ID, MP.DrugID, MP.PurchDate, MP.Quantity, MP.CostUnit,');
               FSyncDataQuery.SQL.Add('       MP.UnitUsed, MP.SuppId, MP.BatchNo, MP.ExpiryDate, MP.InUse, MP.EventSource,');
               FSyncDataQuery.SQL.Add('       M.VPANo');
               FSyncDataQuery.SQL.Add('FROM MediPur MP');
               FSyncDataQuery.SQL.Add('LEFT JOIN Medicine M ON (M.ID = MP.DrugID)');
               FSyncDataQuery.SQL.Add('WHERE MP.IsSynchronized = False');
               FSyncDataQuery.SQL.Add('AND   SUBSTRING(M.VPANo FROM 1 FOR 3) IS NOT NULL');
               FSyncDataQuery.SQL.Add('AND   PurchDate >= :MinPurchDate');
               FSyncDataQuery.SQL.Add('AND   BatchNo IS NOT NULL');
               FSyncDataQuery.Params[0].AsDateTime := IncYear(Date,-1);
               FSyncDataQuery.Active := True;

               try
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        FListNode := FDocument.createElement('drugPurchases');
                        FRootNode.appendChild(FListNode);

                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              ServerDrug := GetDrugFromServerListing(FSyncDataQuery.FieldByName('VPANo').AsString);
                              if (ServerDrug.IsValid) then
                                 begin
                                    FNode := FDocument.createElement('drugPurchase');

                                    FChildNode := FDocument.createElement('vpaNumber');
                                    FChildNode.Set_text(FSyncDataQuery.FieldByName('VPANo').AsString);
                                    FNode.appendChild(FChildNode);

                                    FChildNode := FDocument.createElement('drugPurchaseId');
                                    FChildNode.Set_text(FSyncDataQuery.FieldByName('Id').AsString);
                                    FNode.appendChild(FChildNode);

                                    FChildNode := FDocument.createElement('purchaseDate');
                                    FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('PurchDate').AsDateTime,dsIrish));
                                    FNode.appendChild(FChildNode);

                                    FChildNode := FDocument.createElement('quantity');
                                    FChildNode.Set_text(FSyncDataQuery.FieldByName('Quantity').AsString);
                                    FNode.appendChild(FChildNode);

                                    FChildNode := FDocument.createElement('unitCost');
                                    FChildNode.Set_text(FSyncDataQuery.FieldByName('CostUnit').AsString);
                                    FNode.appendChild(FChildNode);

                                    FChildNode := FDocument.createElement('supplierId');
                                    FChildNode.Set_text(FSyncDataQuery.FieldByName('SuppId').AsString);
                                    FNode.appendChild(FChildNode);

                                    //   11/03/20 [V5.9 R2.8] /MK Change - Only sync out the first 25 characters of Batch Number.
                                    FChildNode := FDocument.createElement('batchNumber');
                                    FChildNode.Set_text(Copy(FSyncDataQuery.FieldByName('BatchNo').AsString,0,25));
                                    FNode.appendChild(FChildNode);

                                    FChildNode := FDocument.createElement('expiryDate');
                                    FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('ExpiryDate').AsDateTime,dsIrish));
                                    FNode.appendChild(FChildNode);

                                    FChildNode := FDocument.createElement('source');
                                    FChildNode.Set_text(FSyncDataQuery.FieldByName('EventSource').AsString);
                                    FNode.appendChild(FChildNode);

                                    FListNode.appendChild(FNode);

                                    SetLength(myArray, ArrayIndex+1);
                                    myArray[ArrayIndex] := FSyncDataQuery.FieldByName('ID').AsInteger;
                                    Inc(ArrayIndex);
                                 end;
                              FSyncDataQuery.Next;
                           end;
                     end;
                  FlagAsSynchronized(MyArray, MediPurch);
               finally
                  FSyncDataQuery.Active := False;
               end;

               ArrayIndex := 0;
               SetLength(MyArray, 0);

               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT *');
               FSyncDataQuery.SQL.Add('FROM FdStkEvents');
               FSyncDataQuery.SQL.Add('WHERE IsSynchronized = False');
               FSyncDataQuery.SQL.Add('AND   EventDate >= :MinPurchDate');
               FSyncDataQuery.SQL.Add('AND   BatchNumber IS NOT NULL');
               //   11/03/20 [V5.9 R2.8] /MK Bug Fix - Don't syc FdstkEvent records if there is no supplier selected. 
               FSyncDataQuery.SQL.Add('AND   ((Supplier IS NOT NULL) And (Supplier > 0))');
               FSyncDataQuery.Params[0].AsDateTime := IncYear(Date,-1);
               FSyncDataQuery.Active := True;

               try
                  if FSyncDataQuery.RecordCount > 0 then
                     begin
                        FListNode := FDocument.createElement('feedPurchases');
                        FRootNode.appendChild(FListNode);

                        FSyncDataQuery.First;
                        while not FSyncDataQuery.Eof do
                           begin
                              FNode := FDocument.createElement('feedPurchase');

                              FChildNode := FDocument.createElement('feedPurchaseId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Id').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('feedTypeId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('FeedType').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('supplierId');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Supplier').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('batchNumber');
                              //   21/04/20 [V5.9 R3.5] /MK Bug Fix - Only sync the first 25 characters of the batch number - Noel Walsh.
                              FChildNode.Set_text(Copy(FSyncDataQuery.FieldByName('BatchNumber').AsString,0,25));
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('purchaseDate');
                              FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('EventDate').AsDateTime,dsIrish));
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('quantity');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Quantity').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('unitCost');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('UnitCost').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('otherCosts');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('OtherCosts').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('comment');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('Comment').AsString);
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('expiryDate');
                              FChildNode.Set_text(FormatDate(FSyncDataQuery.FieldByName('ExpiryDate').AsDateTime,dsIrish));
                              FNode.appendChild(FChildNode);

                              FChildNode := FDocument.createElement('source');
                              FChildNode.Set_text(FSyncDataQuery.FieldByName('EventSource').AsString);
                              FNode.appendChild(FChildNode);

                              FListNode.appendChild(FNode);

                              SetLength(myArray, ArrayIndex+1);
                              myArray[ArrayIndex] := FSyncDataQuery.FieldByName('ID').AsInteger;
                              Inc(ArrayIndex);

                              FSyncDataQuery.Next;
                           end;
                     end;
                  FlagAsSynchronized(MyArray, FdStkEvents);
               finally
                  FSyncDataQuery.Active := False;
               end;

               // Sync Out Last Milk Rec Sync Date
               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT SvrMilkTimeStamp');
               FSyncDataQuery.SQL.Add('FROM SyncDefaults');
               FSyncDataQuery.Active := True;
               if ( FSyncDataQuery.RecordCount > 0 ) then
                  try
                     FTempNode := FDocument.createElement('milkSync');
                     FRootNode.appendChild(FTempNode);
                     FChildNode := FDocument.createAttribute('timestamp');
                     if ( Length(FSyncDataQuery.FieldByName('SvrMilkTimeStamp').AsString) > 0 ) then
                        FChildNode.Set_nodeValue(FSyncDataQuery.FieldByName('SvrMilkTimeStamp').AsString);
                     FTempNode.attributes.setNamedItem(FChildNode);
                  except
                  end;

               // Sync Out Last ICBF API Sync Date
               FSyncDataQuery.Active := False;
               FSyncDataQuery.SQL.Clear;
               FSyncDataQuery.SQL.Add('SELECT SvrICBAPITimeStamp');
               FSyncDataQuery.SQL.Add('FROM SyncDefaults');
               FSyncDataQuery.Active := True;
               if ( FSyncDataQuery.RecordCount > 0 ) then
                  try
                     FTempNode := FDocument.createElement('icbfAPISync');
                     FRootNode.appendChild(FTempNode);
                     FChildNode := FDocument.createAttribute('timestamp');
                     if ( Length(FSyncDataQuery.FieldByName('SvrICBAPITimeStamp').AsString) > 0 ) then
                        FChildNode.Set_nodeValue(FSyncDataQuery.FieldByName('SvrICBAPITimeStamp').AsString);
                     FTempNode.attributes.setNamedItem(FChildNode);
                  except
                  end;

               // Finally add the Breed Node, after all breeds have been added through various means
               FRootNode.appendChild(FBreedsNode);

               FDocument.Save(Filename);

         except
            on e : Exception do
               begin
                  CreateLogEntry('CreateHerdSyncData() : '+e.Message);
               end;
         end;
      finally
         FreeAndNil(HerdSync);
         elapsedtime := Windows.GetTickCount - initialtime;
         if (FileExists(Filename)) then
             CreateLogEntry('Sync output file successfully created.' + cCRLFx2 +'Time elapsed: ' + FloatToStr(elapsedtime / 1000) + ' seconds');
      end;
end;

function THerdSync.CreateAnimalNode(AId : Integer;
                                    AAnimalNo, ANatIDNum, AName : String;
                                    ADOB, AQADate, ABrucellosisDate, ATBTestDate, ABVDTestDate : TDateTime;
                                    ASex, ABreedCode, AColourCode: String;
                                    ALactNo, AHerdID: Integer;
                                    AInHerd, AInUse, ABullUsed, ABreeding, AIsSynchronized, AIsMultiInstance, AQualityAssured, AToBeCulled : Boolean;
                                    AEBI : Variant): IXMLDOMNode;
var
   iPlannedBull : Integer;
   sPlannedBull : String;
begin
   Result := FDocument.createElement('animal');

   FChildNode := FDocument.createElement('id');
   FChildNode.Set_text(IntToStr(AId));
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('animalNo');
   FChildNode.Set_text(Trim(AAnimalNo));
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('natIdNo');
   FChildNode.Set_text(ANatIDNum);
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('name');
   FChildNode.Set_text(AName);
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('dob');
   FChildNode.Set_text(DateToStr(ADOB));
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('sex');
   FChildNode.Set_text(ASex);
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('breed');
   FChildNode.Set_text(ABreedCode);
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('colour');
   FChildNode.Set_text(AColourCode);
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('lactNo');
   FChildNode.Set_text(IntToStr(ALactNo));
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('inHerd');
   if ( AInHerd ) then
      FChildNode.Set_text('True')
   else
      FChildNode.Set_text('False');
   Result.appendChild(FChildNode);

   if ( UpperCase(ASex) = 'BULL' ) then
      begin
         FChildNode := FDocument.createElement('inUse');
         if (AInUse) then
            FChildNode.Set_text('True')
         else
            FChildNode.Set_text('False');
         Result.appendChild(FChildNode);

         FChildNode := FDocument.createElement('bullUsed');
         if (ABullUsed) then
            FChildNode.Set_text('True')
         else
            FChildNode.Set_text('False');
         Result.appendChild(FChildNode);
      end
   else if ( UpperCase(ASex) = 'FEMALE' ) then
      begin
         FChildNode := FDocument.createElement('breeding');
         if ( ABreeding ) then
            FChildNode.Set_text('True')
         else
            FChildNode.Set_text('False');
         Result.appendChild(FChildNode);
         //   12/04/17 [V5.6 R5.7] /MK Additional Feature - If female animal and animal is to be synchronised then add
         //                                                 planned bull node to animal node if planned bull or bulling event exists or not - GL/SP request.
         //   25/04/17 [V5.6 R7.1] /MK Change - If female animal is in the herd only then create the planned bull node - SP request.
         //                                   - If the animal is not breeding the create a blank planned bull node - SP request.
         if ( not(AIsSynchronized) ) and ( AInHerd ) then
            begin
               sPlannedBull := '';
               if ( ABreeding ) then
                  begin
                     iPlannedBull := FEventDataHelper.GetPlannedBull(AID,ALactNo);
                     if ( iPlannedBull > 0 ) then
                        sPlannedBull := UpperCase(GetAnimalInfo(iPlannedBull,'AnimalNo'));
                  end;
               FChildNode := FDocument.createElement('plannedBull');
               FChildNode.Set_text(sPlannedBull);
               Result.appendChild(FChildNode);
            end;
      end;

   if ( AHerdID <> FHerdID) then
      begin
         FChildNode := FDocument.createElement('isAncestor');
         FChildNode.Set_text('True');
         Result.appendChild(FChildNode);
      end;

   FChildNode := FDocument.createElement('isMultiInstance');
   if AIsMultiInstance then
      FChildNode.Set_text('True')
   else
      FChildNode.Set_text('False');
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('qualityAssured');
   if AQualityAssured then
      FChildNode.Set_text('True')
   else
      FChildNode.Set_text('False');
   Result.appendChild(FChildNode);

   if ( AQADate > 0 ) then
      begin
         FChildNode := FDocument.createElement('qaDate');
         FChildNode.Set_text(DateToStr(AQADate));
         Result.appendChild(FChildNode);
      end;

   if ( ABrucellosisDate > 0 ) then
      begin
         FChildNode := FDocument.createElement('bruceTestDate');
         FChildNode.Set_text(DateToStr(ABrucellosisDate));
         Result.appendChild(FChildNode);
      end;

   if ( ATBTestDate > 0 ) then
      begin
         FChildNode := FDocument.createElement('tbTestDate');
         FChildNode.Set_text(DateToStr(ATBTestDate));
         Result.appendChild(FChildNode);
      end;

   if ( ABVDTestDate > 0 ) then
      begin
         FChildNode := FDocument.createElement('bvdTestDate');
         FChildNode.Set_text(DateToStr(ABVDTestDate));
         Result.appendChild(FChildNode);
      end;

   if ( not(VarIsNull(AEBI)) ) then
      begin
         FChildNode := FDocument.createElement('ebi');
         FChildNode.Set_text(FloatToStr(AEBI));
         Result.appendChild(FChildNode);
      end;

   FChildNode := FDocument.createElement('isSynchronized');
   if AIsSynchronized then
      FChildNode.Set_text('True')
   else
      FChildNode.Set_text('False');
   Result.appendChild(FChildNode);

   FChildNode := FDocument.createElement('toBeCulled');
   if AToBeCulled then
      FChildNode.Set_text('True')
   else
      FChildNode.Set_text('False');
   Result.appendChild(FChildNode);
end;

procedure THerdSync.Initialize(ASyncOp : TSyncOp);
begin
   FNoneHerdID := 0;
   FRootNode := nil;
   FChildNode := nil;
   FListNode := nil;
   FNode := nil;
   FHerdNode := nil;

   FInputHerdsNode := nil;
   FInputAnimalsNode := nil;
   FInputAnimalsRootNode := nil;
   FInputAnimalNode := nil;

   FInputAnimalsNode := nil;
   FInputAnimalNode := nil;

   FUserWarningsNode := nil;

   FTechnicianNode := nil;
   FTechniciansNode := nil;

   FOutputAnimalsNode := nil;
   FOutputAnimalNode := nil;

   FInputEventsNode := nil;

   FInputMilkLactationsNode := nil;
   FInputMilkLactationNode := nil;

   FInputAnimalRegistrationNode := nil;

   FSyncInMilkSyncTimeStampNode := nil;

   FSyncInICBFAPISyncTimeStampNode := nil;

   FSyncInGroupsSyncTimeStampNode := nil;

   FMedicineAdministratorsNode := nil;

   FMedicineAdministratorNode  := nil;
   FFarmHealthCodesNode := nil;
   FFarmHealthCodeNode := nil;

   FMilkProductionNode := nil;

   FMilkRecordingNode := nil;

   FAnimalGroupsNode := nil;
   
   FSuppliersNode := nil;
   FSupplierNode := nil;
   FCustomersNode := nil;
   FCustomerNode := nil;
   FSupplierNode := nil;
   FBuyersNode := nil;
   FBuyerNode := nil;

   FAnimalQuery := TQuery.Create(nil);
   FAnimalQuery.DatabaseName := FDatabasePath;

   FHerdQuery := TQuery.Create(nil);
   FHerdQuery.DatabaseName := FDatabasePath;
   FHerdQuery.SQL.Clear;
   FHerdQuery.SQL.Add('SELECT ID, HerdIdentity, HerdIdentifier, TagPrefix');
   FHerdQuery.SQL.Add('FROM Owners');
   FHerdQuery.Open;

   if (ASyncOp = soSyncDataIn) then
      begin
         FBullQuery := TQuery.Create(nil);
         FBullQuery.DatabaseName := FDatabasePath;
         FBullQuery.SQL.Clear;
         FBullQuery.SQL.Add('SELECT Id, NatIdNum, AnimalNo, HerdId');
         FBullQuery.SQL.Add('FROM Animals');
         FBullQuery.SQL.Add('WHERE (Sex = :Sex)');
         FBullQuery.Params[0].AsString := cSex_Bull;
         FBullQuery.Open;
      end;

   FBreedQuery := TQuery.Create(nil);
   FBreedQuery.DatabaseName := FDatabasePath;
   FBreedQuery.SQL.Clear;
   FBreedQuery.SQL.Add('SELECT Id, Code, GestationPeriod, PedigreeBreed, EligibleforPremium');
   FBreedQuery.SQL.Add('FROM Breeds');
   FBreedQuery.Open;

   FGenlookQuery := TQuery.Create(nil);
   FGenlookQuery.DatabaseName := FDatabasePath;
   if (ASyncOp = soSyncDataIn) then
      begin
         FGenlookQuery.SQL.Clear;
         FGenlookQuery.SQL.Add('SELECT * FROM Genlook');
         FGenlookQuery.SQL.Add('WHERE ListType IN');
         FGenlookQuery.SQL.Add('( 1,   '); // ServiceTypes(1)
         FGenlookQuery.SQL.Add('  6,   '); // BirthTypes (6),
         FGenlookQuery.SQL.Add('  9,   '); // Colours (9)
         FGenlookQuery.SQL.Add('  10,  '); // ObservedBy/Inseminators(10)
         FGenlookQuery.SQL.Add('  12,  '); // Medicine Application Methods
         FGenlookQuery.SQL.Add('  14,  '); // Culling Codes, used during data merge before displaying sync data summary to user
         FGenlookQuery.SQL.Add('  15,  '); // Mortality (15)
         FGenLookQuery.SQL.Add('  32)  '); // Sexed Semen (32)
         FGenlookQuery.Open;
      end;

   FMedAdminQuery := TQuery.Create(nil);
   FMedAdminQuery.DatabaseName := FDatabasePath;
   FMedAdminQuery.SQL.Clear;
   FMedAdminQuery.SQL.Add('SELECT * FROM MedAdmin');
   FMedAdminQuery.Open;

   FFarmHealthCodeQuery := TQuery.Create(nil);
   FFarmHealthCodeQuery.DatabaseName := FDatabasePath;
   FFarmHealthCodeQuery.SQL.Clear;
   FFarmHealthCodeQuery.SQL.Add('SELECT DISTINCT ID, Description, LookupCode, IsSynchronized');
   FFarmHealthCodeQuery.SQL.Add('FROM GenLook.DB ');
   FFarmHealthCodeQuery.SQL.Add('WHERE ListType = :HealthCodeListType');
   FFarmHealthCodeQuery.SQL.Add('AND NOT(UPPER(Description) LIKE "ICBF%")'); // << important to EXCLUDE Icbf health codes.
   FFarmHealthCodeQuery.SQL.Add('ORDER BY Description');
   FFarmHealthCodeQuery.Params[0].AsInteger := LHealthCode;

   FDiseasesQuery := TQuery.Create(nil);
   FDiseasesQuery.DatabaseName := FDatabasePath;
   FDiseasesQuery.SQL.Clear;
   FDiseasesQuery.SQL.Add('SELECT DISTINCT ID, Description, LookupCode, IsSynchronized');
   FDiseasesQuery.SQL.Add('FROM GenLook.DB ');
   FDiseasesQuery.SQL.Add('WHERE ListType = :DiseaseListType');
   FDiseasesQuery.SQL.Add('ORDER BY Description');
   FDiseasesQuery.Params[0].AsInteger := LVaccination_DiseaseCode;

   FOfficialHealthCodeQuery := TQuery.Create(nil);
   FOfficialHealthCodeQuery.DatabaseName := FDatabasePath;
   if (ASyncOp = soSyncDataIn) then
      begin
         FOfficialHealthCodeQuery.SQL.Clear;
         FOfficialHealthCodeQuery.SQL.Add('SELECT DISTINCT ID, Description, LookupCode ');
         FOfficialHealthCodeQuery.SQL.Add('FROM GenLook.DB ');
         FOfficialHealthCodeQuery.SQL.Add('WHERE ListType = :HealthCodeListType');
         FOfficialHealthCodeQuery.SQL.Add('AND (UPPER(Description) LIKE "ICBF%")'); // << important to INCLUDE Icbf health codes only
         FOfficialHealthCodeQuery.SQL.Add('ORDER BY Description');
         FOfficialHealthCodeQuery.Params[0].AsInteger := LHealthCode;
      end;

   FMedicinesQuery := TQuery.Create(nil);
   FMedicinesQuery.DatabaseName := FDatabasePath;
   if (ASyncOp = soSyncDataIn) then
      begin
         FMedicinesQuery.SQL.Clear;
         FMedicinesQuery.SQL.Add('SELECT Id, Name, VPANo, InUse');
         FMedicinesQuery.SQL.Add('FROM Medicine ');
      end;

   if (ASyncOp = soSyncDataOut) then
      begin
         FSyncDataQuery := TQuery.Create(nil);
         FSyncDataQuery.DatabaseName := FDatabasePath;

         FMarkAsSynchronizedQuery := TQuery.Create(nil);
         FMarkAsSynchronizedQuery.DatabaseName := FDatabasePath;

         FSyncIds := TTable.Create(nil);
         FSyncIds.DatabaseName := FDatabasePath;
         FSyncIds.TableName := 'SyncIds';
         with FSyncIds.FieldDefs do
            begin
               Clear;
               Add('KeyValue', ftInteger);
               Add('SyncType', ftInteger);
            end;
         if (FSyncIds.Exists) then
            FSyncIds.DeleteTable;
         FSyncIds.CreateTable;
         FSyncIds.Active := True;

         FDrugWithdrawalQuery := TQuery.Create(nil);
         FDrugWithdrawalQuery.DatabaseName := FDatabasePath;
         FDrugWithdrawalQuery.SQL.Add('SELECT E.AnimalId, E.ID, E.EventDate, E.EventType, H.NoDays,');
         FDrugWithdrawalQuery.SQL.Add('       M.WithDrawal MeatDays, M.MilkWithDrawal MilkDays,');
         FDrugWithdrawalQuery.SQL.Add('	      M.MilkN_A_Drug, M.MeatN_A_Drug,');
         FDrugWithdrawalQuery.SQL.Add('       M.OrganicMeatWithDrawal OrganicMeatDays, M.OrganicMilkWithDrawal OrganicMilkDays');
         FDrugWithdrawalQuery.SQL.Add('FROM Events E');
         FDrugWithdrawalQuery.SQL.Add('INNER JOIN Animals A ON (E.AnimalId=A.ID)    ');
         FDrugWithdrawalQuery.SQL.Add('INNER JOIN Health H  on (E.ID=H.EventID)     ');
         FDrugWithdrawalQuery.SQL.Add('INNER JOIN Medicine M on (H.DrugUsed = M.ID )');
         FDrugWithdrawalQuery.SQL.Add('WHERE (E.HerdID =:HerdId) ');
         FDrugWithdrawalQuery.SQL.Add('AND   (A.InHerd = True)');
         FDrugWithdrawalQuery.SQL.Add('AND   (A.AnimalDeleted = False)');
         FDrugWithdrawalQuery.SQL.Add('AND   (E.EventType IN (4,6))');
         FDrugWithdrawalQuery.SQL.Add('AND   (H.DrugUsed>0)');
      end;

   FEventDataHelper := TEventDataHelper.Create;

   FMedicineRepository := TMedicineRepository.Create(FDatabasePath);

   SetLength(FMedicinesMarkedInUse, 0);

   FRegisteredCountry := SystemRegisteredCountry;

   FSyncWarnings := TTable.Create(nil);
   FSyncWarnings.DatabaseName := FDatabasePath;
   FSyncWarnings.TableName := 'SyncWarnings';
   FSyncWarnings.Active := True;

   if (ASyncOp = soSyncDataIn) then
      begin
         FAnimalCart := TTable.Create(nil);
         FAnimalCart.DatabaseName := FDatabasePath;
         FAnimalCart.TableName := 'AnimalCart';
         if (FAnimalCart.Exists) then
            SQLEmptyTable(FAnimalCart.TableName);
         FAnimalCart.Active := True;
      end;
end;

procedure THerdSync.FreeAndNilObjects;
begin
   FDocument := nil;
   FRootNode := nil;
   FChildNode := nil;
   FHerdNode := nil;

   FInputHerdsNode := nil;
   FInputAnimalsNode := nil;
   FInputAnimalsRootNode := nil;
   FInputAnimalNode := nil;

   FInputAnimalsNode := nil;
   FInputAnimalNode := nil;

   FUserWarningsNode := nil;

   FTechnicianNode := nil;
   FTechniciansNode := nil;

   FOutputAnimalsNode := nil;
   FOutputAnimalNode := nil;

   FInputEventsNode := nil;

   FInputAnimalRegistrationNode := nil;

   FSyncInMilkSyncTimeStampNode := nil;

   FSyncInICBFAPISyncTimeStampNode := nil;

   FSyncInGroupsSyncTimeStampNode := nil;

   FMedicineAdministratorsNode := nil;

   FMedicineAdministratorNode  := nil;
   FFarmHealthCodesNode := nil;
   FFarmHealthCodeNode := nil;

   FMilkProductionNode := nil;

   FMilkRecordingNode := nil;

   FAnimalGroupsNode := nil;

   FDrugListingDocument := nil;

   FAnimalCart := nil;

   if (FMultiInstancesList <> nil) then
      FreeAndNil(FMultiInstancesList);
   if (FAnimalQuery <> nil) then
      begin
         FAnimalQuery.Close;
         FreeAndNil(FAnimalQuery);
      end;

   if (FHerdQuery <> nil) then
      begin
         FHerdQuery.Close;
         FreeAndNil(FHerdQuery);
      end;

   if (FBullQuery <> nil) then
      begin
         FBullQuery.Close;
         FreeAndNil(FBullQuery);
      end;

   if (FBreedQuery <> nil) then
      begin
         FBreedQuery.Close;
         FreeAndNil(FBreedQuery);
      end;

   if (FGenlookQuery <> nil) then
      begin
         FGenlookQuery.Close;
         FreeAndNil(FGenlookQuery);
      end;

   if (FMedAdminQuery <> nil) then
      begin
         FMedAdminQuery.Close;
         FreeAndNil(FMedAdminQuery);
      end;

   if (FFarmHealthCodeQuery <> nil) then
      begin
         FFarmHealthCodeQuery.Close;
         FreeAndNil(FFarmHealthCodeQuery);
      end;

   if (FDiseasesQuery <> nil) then
      begin
         FDiseasesQuery.Close;
         FreeAndNil(FDiseasesQuery);
      end;

   if (FSyncDataQuery <> nil) then
      begin
         FSyncDataQuery.Close;
         FreeAndNil(FSyncDataQuery);
      end;

   if (FMarkAsSynchronizedQuery <> nil) then
      begin
         FMarkAsSynchronizedQuery.Close;
         FreeAndNil(FMarkAsSynchronizedQuery);
      end;

   if (FEventDataHelper <> nil) then
      begin
         FreeAndNil(FEventDataHelper);
      end;

   if (FMedicineRepository <> nil) then
      FreeAndNil(FMedicineRepository);

   if (FSyncIds <> nil) then
      begin
         FSyncIds.Active := False;
         FreeAndNil(FSyncIds);
      end;

   if (FSyncWarnings <> nil) then
      begin
         FSyncWarnings.Active := False;
         FreeAndNil(FSyncWarnings);
      end;

   if (FAnimalCart <> nil) then
      begin
         FAnimalCart.Active := False;
         FreeAndNil(FAnimalCart);
      end;

   if (FToBeCulledQuery <> nil) then
      FreeAndNil(FToBeCulledQuery);
end;

function THerdSync.GetNoneHerdId: Integer;
const
   ErrorMsg = 'Error detecting the value of NONE herd Id.';
begin
   if (FNoneHerdId <= 0) then
      begin
         if (FHerdQuery.Locate('HerdIdentity', 'NONE', [])) then
            FNoneHerdId := FHerdQuery.FieldByName('Id').AsInteger;

         if (FNoneHerdID <= 0) then
            begin
               raise Exception.Create(ErrorMsg);
            end;
      end;

   Result := FNoneHerdID;
end;

function THerdSync.IsBullInUse(const AnimalId: Integer): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;
         SQL.Clear;
         SQL.Add('SELECT BS.InUse');
         SQL.Add('FROM BullSemenStk BS');
         SQL.Add('INNER JOIN Animals A ON (BS.AnimalId = A.Id)');
         SQL.Add('WHERE (A.Id = :AAnimalId)');
         Params[0].AsInteger := AnimalId;
         try
            Open;
            try
               First;
               Result := Fields[0].AsBoolean;
            finally
               Close;
            end;
         except
            on e : exception do
               CreateLogEntry(e.message);
         end
      finally
         Free;
      end;
end;


function THerdSync.GetBirthTypeFromDescription(ALookupCode, ADescription : string) : Integer;
begin
   Result := 0;
   if (Trim(ADescription) = '') then
      Exit;

   if (ADescription = 'Normal') then
      ADescription := 'Normal Calving';

   if FGenlookQuery.Locate('ListType;Description', VarArrayOf([LBirthType, 'ICBF-'+ALookupCode+'='+ADescription]),[loCaseInsensitive]) then
      begin
         Result := FGenlookQuery.FieldByName('ID').AsInteger;
      end;
   if (Result = 0)then
      Result := GetDefaultBirthTypeFromDescription();
end;

function THerdSync.GetDefaultBirthTypeFromDescription: Integer;
begin
   Result := 0;
   if FGenlookQuery.Locate('ListType;Description', VarArrayOf([LBirthType, 'ICBF-1=Normal Calving']),[loCaseInsensitive]) then
      Result := FGenlookQuery.FieldByName('ID').AsInteger;
end;

function THerdSync.GetTechnicianFromDescription(
  ADescription: string): Integer;
begin
   Result := 0;
   if FGenlookQuery.Locate('ListType;Description', VarArrayOf([LObservedBy, ADescription]),[]) then
      begin
         Result := FGenlookQuery.FieldByName('ID').AsInteger;
      end;
end;

function THerdSync.GetColourIdFromCode(AColourCode : string) : Integer;
begin
   Result := 0;
   if (Trim(AColourCode) = '') then
      Exit;

   if FGenlookQuery.Locate('ListType;LookUpCode', VarArrayOf([LAnimalColour, AColourCode]),[]) then
      begin
         Result := FGenlookQuery.FieldByName('ID').AsInteger;
      end;
end;

function THerdSync.GetServiceType(ADescriptionOrCode: string): Integer;
begin
   // Match service type based on description
   // If no match is found on description, try removing all non alpha/chars
   // and try locate code based on adjusted string.
   Result := 0;
   if (Trim(ADescriptionOrCode) = '') then
      Exit;

   if ( FGenlookQuery.Locate('ListType;Description',VarArrayOf([LServiceType,ADescriptionOrCode]),[]) ) then
      Result := FGenlookQuery.FieldByName('ID').AsInteger
   else
      begin
         ADescriptionOrCode := kRoutines.StripAllNomNumAlpha(ADescriptionOrCode);
         if FGenlookQuery.Locate('ListType;LookUpCode',VarArrayOf([LServiceType,ADescriptionOrCode]),[]) then
            Result := FGenlookQuery.FieldByName('ID').AsInteger
      end;
end;

procedure THerdSync.AddUserWarning(AWarningMessage: string;
  AShouldHaltSync: Boolean);
var
   WarningNode : IXMLDOMNode;
begin
   if ( FUserWarningsNode = nil) then
      begin
         FUserWarningsNode := FDocument.createElement('userWarnings');
         FRootNode.appendChild(FUserWarningsNode);
      end;

   WarningNode := FDocument.createElement('warning');

   if (WarningNode = nil) then
      Exit;

   FChildNode := FDocument.createElement('message');
   FChildNode.text := AWarningMessage;
   WarningNode.appendChild(FChildNode);

   FChildNode := FDocument.createElement('canHaltSync');
   if ( AShouldHaltSync ) then
      FChildNode.text := 'true'
   else
      FChildNode.text := 'false';
   WarningNode.appendChild(FChildNode);

   FUserWarningsNode.appendChild(WarningNode)
end;

function THerdSync.GetMaxInUseBullCount: Integer;
begin
   Result := cSync_MaxInUseBullCount;
   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;
         SQL.Clear;
         SQL.Add('SELECT MaxInUseBullCount FROM SyncDefaults');
         try
            Open;
            try
               First;
               Result := Fields[0].AsInteger;
            finally
               Close;
            end;
         except
            on e : exception do
               CreateLogEntry(e.message);
         end
      finally
         Free;
      end;
end;

function THerdSync.GetNoOfYearsHealthHistory: Integer;
begin
   Result := 1;
   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;
         SQL.Clear;
         SQL.Add('SELECT NoOfYearsHealthHistory FROM SyncDefaults');
         try
            Open;
            try
               First;
               if (Fields[0].AsInteger>1) then
                   Result := Fields[0].AsInteger;
            finally
               Close;
            end;
         except
            on e : exception do
               CreateLogEntry(e.message);
         end
      finally
         Free;
      end;
end;

procedure THerdSync.CreateBullingEvents(ABullingsNode : IXMLDOMNodeList);
var
   i, j : Integer;
   EventNode : IXMLDOMNode;
   NatIdNo,
   ObservedBy,
   PlannedBull,
   EventComment,
   ClientId : String;
   EventDate : TDateTime;
   ExistEventId : Integer;
begin
   if ( ABullingsNode = nil ) then Exit;

   for i := 0 to ABullingsNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         EventComment := '';
         ObservedBy := '';
         PlannedBull := '';

         EventNode := ABullingsNode.item[i];

         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'animalId' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        EventComment := FChildNode.text
                     else if ( FChildNode.nodeName = 'observedBy' ) then
                        ObservedBy := FChildNode.text
                     else if ( FChildNode.nodeName = 'plannedBull' ) then
                        PlannedBull := (FChildNode.text)
                  end;
            end;

         if ( NatIdNo = '' ) or (EventDate = 0) then
            begin
               CreateLogEntry('Could not create bulling. Event details are missing.');
               continue;
            end;

         if (not LocateAnimal(NatIdNo)) then
            begin
               CreateLogEntry(Format('Could not create bulling. Animal tag %s not found in the database.',[NatIdNo]));
               AddEventToEventsExt(0,CBullingEvent,ClientId,NatIdNo);
               continue;
            end;

         ExistEventId := FEventDataHelper.GetEventID(FAnimalQuery.FieldByName('ID').AsInteger,
                                                     FAnimalQuery.FieldByName('LactNo').AsInteger,
                                                     CBullingEvent,
                                                     EventDate);
         if ( ExistEventId > 0 ) then
            begin
               AddEventToEventsExt(ExistEventId,CBullingEvent,ClientId,NatIdNo);
               Continue;
            end;

         FBullingEvent := TBullingEvent.Create('tBulling');
         try
            FBullingEvent.Append;
            try
               FBullingEvent.AnimalID := FAnimalQuery.FieldByName('ID').AsInteger;
               FBullingEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
               FBullingEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
               FBullingEvent.EventDate := EventDate;
               if (Trim(PlannedBull) <> '') then
                  FBullingEvent.EventComment := EventComment + ' / ' + PlannedBull
               else
                  FBullingEvent.EventComment := EventComment;

               FBullingEvent.EventSource := sSMARTPHONE;

               FBullingEvent.ObservedBy := GetTechnicianFromDescription(ObservedBy);
               FBullingEvent.PlannedBull := GetBull(PlannedBull);
               FBullingEvent.IsSynchronized := True;

               FBullingEvent.Post;

               AddEventToEventsExt(FBullingEvent.EventId,CBullingEvent,ClientId,NatIdNo);
             except
               FBullingEvent.Cancel;
               CreateLogEntry(Format('AnimalId: %d - Failed to create bulling event.',
               [FAnimalQuery.FieldByName('ID').AsInteger]))
             end;
         finally;
            FBullingEvent.Free;
         end;
      end;
end;

procedure THerdSync.CreateServiceEvents(AServicesNode : IXMLDOMNodeList);
var
   i, j : Integer;
   EventNode : IXMLDOMNode;
   NatIdNo,
   Technician,
   ServiceType,
   ServiceBull,
   SexedSemen,
   ClientId : String;
   EventDate : TDateTime;
   EventComment : String;
   NoStraws : Double;
   ExistEventId : Integer;
begin
   if ( AServicesNode = nil ) then Exit;

   for i := 0 to AServicesNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         EventComment := '';
         Technician := '';
         ServiceBull := '';
         ServiceType := '';
         SexedSemen := '';
         NoStraws := 0;

         EventNode := AServicesNode.item[i];
         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'animalId' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := FChildNode.text
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        EventComment := FChildNode.text
                     else if ( FChildNode.nodeName = 'serviceType' ) then
                        ServiceType := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'serviceBull' ) then
                        ServiceBull := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'inseminator' ) then
                        Technician := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'amountOfStraw' ) then
                        NoStraws := StrToFloat(FChildNode.text)
                     else if ( FChildNode.nodeName = 'strawType' ) then
                        SexedSemen := FChildNode.text;
                  end;
            end;

        if ( NatIdNo = '' ) or (EventDate = 0) then
           begin
              CreateLogEntry('Could not create service event. Event details are missing.');
              continue;
           end;

        if (not LocateAnimal(NatIdNo)) then
           begin
              CreateLogEntry(Format('Could not create service event. Animal tag %s not found in the database.',[NatIdNo]));
              AddEventToEventsExt(0,CServiceEvent,ClientId,NatIdNo);
              continue;
           end;

        ExistEventId := FEventDataHelper.GetEventID(FAnimalQuery.FieldByName('ID').AsInteger,
                                                    FAnimalQuery.FieldByName('LactNo').AsInteger,
                                                    CServiceEvent,
                                                    EventDate);
        if ( ExistEventId > 0 ) then
           begin
              AddEventToEventsExt(ExistEventId,CServiceEvent,ClientId,NatIdNo);
              Continue;
           end;

        FServiceEvent := TServiceEvent.Create('tService');
        try
           FServiceEvent.Append;
           try
              FServiceEvent.AnimalID := FAnimalQuery.FieldByName('ID').AsInteger;
              FServiceEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
              FServiceEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
              FServiceEvent.EventDate := EventDate;
              if ( Trim(ServiceBull) <> '' ) and ( Pos(ServiceBull,EventComment) = 0 ) then
                 FServiceEvent.EventComment := EventComment + ' / ' + ServiceBull
              else
                 FServiceEvent.EventComment := EventComment;
              FServiceEvent.EventSource := sSMARTPHONE;
              FServiceEvent.Technician := GetTechnicianFromDescription(Technician);
              FServiceEvent.ServiceType := GetServiceType(ServiceType);
              FServiceEvent.ServiceBull := GetBull(ServiceBull);
              FServiceEvent.SexedSemen := GetSexedSemenId(SexedSemen);
              FServiceEvent.AmountOfStraw := NoStraws;

              FServiceEvent.IsSynchronized := True;

              FServiceEvent.Post;

              AddEventToEventsExt(FServiceEvent.EventId,CServiceEvent,ClientId,NatIdNo);
           except
              FServiceEvent.Cancel;
              CreateLogEntry(Format('AnimalId: %d - Failed to create service event.',
                             [FAnimalQuery.FieldByName('ID').AsInteger]))
           end;
        finally
           FServiceEvent.Free;
        end;
     end;

end;

procedure THerdSync.CreateCalvingEvents(ACalvingsNode : IXMLDOMNodeList);
var
   i, j, c : Integer;

   CalfId : Integer;
   CalfNatIdNo : string;

   EventNode : IXMLDOMNode;
   NatIdNo : String;
   ClientId : String;
   AnimalNo : String;
   EventDate : TDateTime;
   EventComment : String;

   DamId : Integer;
   AnimalLactNo : Integer;
   EventId : Integer;

   // sire
   SireId : Integer;
   SireNo : string;
   SireNatIdNo : string;
   SireBreedCode : string;

   // gen dam
   GenDamId : Integer;
   GenDamAnimalNo : string;
   GenDamNatIdNo : string;
   GenDamBreedCode : string;

   AbortedTagNo : string;

   // calving details
   CalvingSurvey : string;
   CalvingSurveyCode : string; // more reliable

   // calf details
   CalfIndex : Byte;
   CalfDetails : array[1..4, 1..13] of string;

   CalvesNode : IXMLDOMNodeList;
   CalfNode : IXMLDOMNode;

   ChildNode,
   TempNode : IXMLDOMNode;

   LastActionDate : TDateTime;

   AimAnimalRegistration : TAimAnimalRegistration;
   UpdateNextCalfIdNo : Boolean;
   ExistingCalvingDate : TDateTime;
   WarningText : string;

   CalvingStored : Boolean;

   iClientIdEventId : Integer;

   ExistClientIdEventNode : IXMLDOMNode;

   slDifferences : TStringList;

   ExistEventId : Integer;

   ServerDesktopId : Integer;

   CalvingDifDoc : IXMLDOMDocument;

   EditedNodesDoc : IXMLDOMDocument;

begin
   UpdateNextCalfIdNo := false;
   if ( ACalvingsNode = nil ) then Exit;

   AimAnimalRegistration := TAimAnimalRegistration.create(0, FHerdID);

   for i := 0 to ACalvingsNode.Length-1 do
      try
         UpdateNextCalfIdNo := True;
         GenDamId := 0;
         NatIdNo := '';
         ClientId := '';
         AnimalNo := '';
         EventDate := 0;
         AnimalLactNo := -1;
         EventComment := '';
         SireNo := '';
         SireNatIdNo := '';
         SireBreedCode := '';

         GenDamAnimalNo := '';
         GenDamNatIdNo := '';
         GenDamBreedCode := '';

         CalvingSurvey := '';
         CalvingSurveyCode := '';

         AbortedTagNo := '';

         ServerDesktopId := 0;

         CalvingStored := False;

         for j := 1 to 4 do
            for c := 1 to 13 do
               CalfDetails[j, c] := '';

         EventNode := ACalvingsNode.item[i];
         if (EventNode = nil) then
            Continue;

         FChildNode := EventNode.selectSingleNode('animalId');
         if (FChildNode <> nil) then
            NatIdNo := FChildNode.text;

         FChildNode := EventNode.selectSingleNode('clientId');
         if (FChildNode <> nil ) then
            ClientId := FChildNode.text;

         FChildNode := EventNode.selectSingleNode('desktopId');
         if ( FChildNode <> nil ) then
            if ( Length(FChildNode.text) > 0 ) then
               ServerDesktopId := StrToInt(FChildNode.text);

         FChildNode := EventNode.selectSingleNode('animalNo');
         if (FChildNode <> nil) then
            AnimalNo := FChildNode.text;

         FChildNode := EventNode.selectSingleNode('animalLactNo');
         if (FChildNode <> nil) then
            try
               AnimalLactNo := StrToInt(FChildNode.text);
            except
            end;

         FChildNode := EventNode.selectSingleNode('eventDate');
         if (FChildNode <> nil) then
            try
               EventDate := ( StrToDate(FChildNode.text) )
            except
            end;

         FChildNode := EventNode.selectSingleNode('eventDescription');
         if (FChildNode <> nil) then
            EventComment := FChildNode.text;

         FChildNode := EventNode.selectSingleNode('calvingSurvey');
         if (FChildNode <> nil) then
            CalvingSurvey := FChildNode.text;

         FChildNode := EventNode.selectSingleNode('calvingSurveyCode');
         if (FChildNode <> nil) then
            begin
               if ((FChildNode.text = '1') OR
                   (FChildNode.text = '2') OR
                   (FChildNode.text = '3') OR
                   (FChildNode.text = '4')) then
                   begin
                      CalvingSurveyCode := FChildNode.text;
                   end;
            end;

         FChildNode := EventNode.selectSingleNode('sire');
         if (FChildNode <> nil) then
            begin
               TempNode := FChildNode.selectSingleNode('sireNo');
               if (TempNode <> nil) then
                   SireNo := TempNode.text;

               TempNode := FChildNode.selectSingleNode('sireNatIdNo');
               if (TempNode <> nil) then
                   SireNatIdNo := TempNode.text;

               TempNode := FChildNode.selectSingleNode('sireBreedCode');
               if (TempNode <> nil) then
                   SireBreedCode := TempNode.text;
            end;

         FChildNode := EventNode.selectSingleNode('genDam');
         if (FChildNode <> nil) then
            begin
               TempNode := FChildNode.selectSingleNode('genDamAnimalNo');
               if (TempNode <> nil) then
                   GenDamAnimalNo := TempNode.text;

               TempNode := FChildNode.selectSingleNode('genDamNatIdNo');
               if (TempNode <> nil) then
                   GenDamNatIdNo := TempNode.text;

               TempNode := FChildNode.selectSingleNode('genDamBreedCode');
               if (TempNode <> nil) then
                   GenDamBreedCode := TempNode.text;
            end;

         FChildNode := EventNode.selectSingleNode('calves');

         CalvesNode := FChildNode.selectNodes('calf');
         if ( CalvesNode <> nil ) then
            if ( CalvesNode.length > 0 ) then
               begin
                  for c := 1 to CalvesNode.length do
                     begin
                        if (c > 4) then Continue;

                        CalfNode := CalvesNode.Get_item(c-1);
                        if (CalfNode = nil) then Continue;

                        TempNode := CalfNode.selectSingleNode('natIdNo');
                        if (TempNode <> nil) then
                           CalfDetails[c, 1] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('sex');
                        if (TempNode <> nil) then
                           CalfDetails[c, 2] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('dateOfBirth');
                        if (TempNode <> nil) then
                           CalfDetails[c, 3] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('breedCode');
                        if (TempNode <> nil) then
                           CalfDetails[c, 4] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('animalNo');
                        if (TempNode <> nil) then
                           CalfDetails[c, 5] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('colourCode');
                        if (TempNode <> nil) then
                           CalfDetails[c, 6] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('herdBookNo');
                        if (TempNode <> nil) then
                           CalfDetails[c, 7] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('name');
                        if (TempNode <> nil) then
                           CalfDetails[c, 8] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('birthWeight');
                        if (TempNode <> nil) then
                           CalfDetails[c, 9] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('mortality');
                        if (TempNode <> nil) then
                           CalfDetails[c, 10] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('regStatus');
                        if (TempNode <> nil) then
                           CalfDetails[c, 11] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('lastActionDate');
                        if (TempNode <> nil) then
                           CalfDetails[c, 12] := TempNode.text;

                        TempNode := CalfNode.selectSingleNode('aphisConfirmId');
                        if (TempNode <> nil) then
                           CalfDetails[c, 13] := TempNode.text;
                     end;
               end
            else
               begin
                  //   12/05/20 [V5.9 R4.5] /MK Change - When there are no calves then treat this as an aborted calving i.e. dead not tagged.
                  AbortedTagNo := 'ABOR' + StripAllNomNumAlpha(NatIdNo) + FormatDateTime('yymm',EventDate);
                  if ( Length(AbortedTagNo) > 20 ) then
                     AbortedTagNo := Copy(AbortedTagNo, 1, 20);
                  CalfDetails[1, 1] := AbortedTagNo;
                  CalfDetails[1, 2] := cSex_Female;
                  CalfDetails[1, 3] := DateToStr(EventDate);
                  CalfDetails[1, 4] := SireBreedCode;
                  CalfDetails[1, 5] := '';
                  CalfDetails[1, 6] := '';
                  CalfDetails[1, 7] := '';
                  CalfDetails[1, 8] := '';
                  CalfDetails[1, 9] := '';
                  CalfDetails[1, 10] := 'ABORTED';
                  CalfDetails[1, 11] := 'ACCEPTED';
                  CalfDetails[1, 12] := DateToStr(EventDate);
                  CalfDetails[1, 13] := '';
               end;

        if ( NatIdNo = '' ) or (EventDate = 0) then
           begin
              CreateLogEntry('Could not create calving event. Event details are missing.');
              continue;
           end;

        if (not LocateAnimal(NatIdNo)) then
           begin
              CreateLogEntry(Format('Could not create calving event. Animal tag %s not found in the database.',[NatIdNo]));
              AddEventToEventsExt(0,CCalvingEvent,ClientId,NatIdNo);
              continue;
           end;

         DamId := FAnimalQuery.FieldByName('ID').AsInteger;

         if (AnimalLactNo <> FAnimalQuery.FieldByName('LactNo').AsInteger) then
            CreateLogEntry(Format('%s - Animal Lactation Number (%d) does not match stored Lactation Number (%d)',
              [FAnimalQuery.FieldByName('NatIdNum').AsString, AnimalLactNo, FAnimalQuery.FieldByName('LactNo').AsInteger]));

         // The lactation number stored in the herd paradox database must be used for calving purposes otherwise
         // the potential for unexplained increase in lact no value within the event is likely.
         AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;

         //   26/08/20 [V5.9 R6.0] /MK Additional Feature - Get the existing EventID from the incoming ClientId
         iClientIdEventId := EventsExtClientIdEventId(ClientId);
         if ( iClientIdEventId = 0 ) and ( ServerDesktopId > 0 ) then
            if ( FEventDataHelper.EventIdExists(ServerDesktopId) ) then
               begin
                  AddEventToEventsExt(ServerDesktopId,CCalvingEvent,ClientId,NatIdNo);
                  iClientIdEventId := ServerDesktopId;
               end;

         //   26/08/20 [V5.9 R6.0] /MK Additional Feature - If we don't have the ClientId already then do checks for Last Calving Event.
         if ( iClientIdEventId = 0 ) then
            begin
               if ( FEventDataHelper.GetLastEventDate(FAnimalQuery.FieldByName('ID').AsInteger, CCalvingEvent) = EventDate) then
                  begin
                     CreateLogEntry(Format('%s - Calving date %s already detected.',
                         [FAnimalQuery.FieldByName('NatIdNum').AsString, FormatDate(EventDate, dsIrish)]));
                     ExistEventId := FEventDataHelper.GetEventId(FAnimalQuery.FieldByName('ID').AsInteger,AnimalLactNo,CCalvingEvent,EventDate);
                     AddEventToEventsExt(ExistEventId,CCalvingEvent,ClientId,NatIdNo);
                     continue;
                  end
               else
                  begin
                     ExistingCalvingDate := FEventDataHelper.GetEventDateBetweenDates(FAnimalQuery.FieldByName('ID').AsInteger, CCalvingEvent,
                                                                                      IncMonth(EventDate,-5), IncMonth(EventDate,5));
                     if ( ExistingCalvingDate > 0 ) then
                        begin
                           WarningText := Format('%s - Unable to create Calving Event on %s. ' + cCRLF +
                                                 'A calving date has already been found which is within 5 months of this calving date %s.' + cCRLFx2 +
                                                 'Contact Kingswood Support - 01-4599491/info@kingswood.ie',
                               [FAnimalQuery.FieldByName('NatIdNum').AsString, FormatDate(ExistingCalvingDate, dsIrish), FormatDate(EventDate, dsIrish)]);

                           AddSyncWarning(FAnimalQuery.FieldByName('NatIdNum').AsString, WarningText);
                           CreateLogEntry(WarningText);
                           ExistEventId := FEventDataHelper.GetEventId(FAnimalQuery.FieldByName('ID').AsInteger,AnimalLactNo,CCalvingEvent,ExistingCalvingDate);
                           AddEventToEventsExt(ExistEventId,CCalvingEvent,ClientId,NatIdNo);
                           continue;
                        end;
                  end;
            end;

         // << try get bull by AnimalNo,
         // if bull isn't found try locating on natIdNum which is a field likely to be used by a stock bull
         SireId := GetBull(SireNo);
         if (SireId <= 0) then
             SireId := GetBull(SireNo, 'NatIdNum');

         if (SireId <= 0) then
            begin
               CreateLogEntry(Format('%s - Cannot create Calving event, Sire details could not been found in database.',[SireNo]));
               Continue;
            end;

         if (Length(GenDamNatIdNo) > 0) then
            begin
               GenDamId := GetDam(GenDamNatIdNo);
               if (GenDamId <= 0) then
                  GenDamId := GetDam(GenDamAnimalNo);

               if (GenDamId <= 0) then
                  begin
                     CreateLogEntry(Format('%s - Cannot create Calving event, Genetic Dam details could not been found in database.',[GenDamAnimalNo]));
                     Continue;
                  end;
            end;

         //    26/08/20 [V5.9 R6.0] /MK Additional Feature - If we have already imported the calving event then check to see if the sire or dam needs to be changed.
         if ( iClientIdEventId > 0 ) then
            begin
               ExistClientIdEventNode := CreateExistingClientIdElement(ClientId,iClientIdEventId,CCalvingEvent);
               if ( ExistClientIdEventNode.childNodes.length > 0 ) then
                  begin
                     try
                        slDifferences := TStringList.Create();
                        try
                           CompareNodes(EventNode,ExistClientIdEventNode,slDifferences);
                        except
                           on e : Exception do
                              CreateLogEntry(Format('Unable to compare nodes. %s',[e.Message]));
                        end;
                     finally
                        if ( slDifferences <> nil ) then
                           begin
                              if ( slDifferences.Count > 0 ) then
                                 begin
                                    if ( FixedEventDifferences(slDifferences,iClientIdEventId,CCalvingEvent) ) then
                                       begin
                                          EditedNodesDoc := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                                          try
                                             EditedNodesDoc.appendChild(FDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'));
                                             TempNode := EditedNodesDoc.CreateElement('editedEvents');

                                             ChildNode := EditedNodesDoc.CreateElement('existingEventNode');
                                             ChildNode.appendChild(ExistClientIdEventNode);
                                             TempNode.appendChild(ChildNode);

                                             ChildNode := EditedNodesDoc.createElement('incomingEventNode');
                                             ChildNode.appendChild(EventNode);
                                             TempNode.appendChild(ChildNode);

                                             EditedNodesDoc.appendChild(TempNode);
                                             EditedNodesDoc.save(FSyncDataStore+'\editedEvents ' + FormatDateTime('yymmdd hhnnss',now) + '.xml');
                                          finally
                                             if ( EditedNodesDoc <> nil ) then
                                                EditedNodesDoc := nil;
                                          end;
                                       end;
                                 end;
                              FreeAndNil(slDifferences);
                           end;
                     end;
                  end;
               AddEventToEventsExt(iClientIdEventId,CCalvingEvent,ClientId,NatIdNo);
               Continue;
            end;

         FCalvingEvent := TCalvingEvent.Create('CLVDB');
         FCalvingEvent.Database.StartTransaction;
         try
            try
              for c := Low(CalfDetails) to High(CalfDetails) do
                begin
                    if (CalfDetails[c,2] = '') then  // check sex, if none specified  break out of loop
                       break;

                    CalfNatIdNo := CalfDetails[c,1];
                    if (not LocateAnimal(CalfNatIdNo)) then
                       begin
                          FCalvingEvent.CalfRecord.Add;
                          FCalvingEvent.CalfRecord.NatIDNum := CalfDetails[c,1];
                          FCalvingEvent.CalfRecord.Sex := CalfDetails[c,2];
                          FCalvingEvent.CalfRecord.DateOfBirth := StrToDate(CalfDetails[c,3]);
                          FCalvingEvent.CalfRecord.PrimaryBreed := GetBreedIdFromCode(CalfDetails[c,4]);
                          FCalvingEvent.CalfRecord.AnimalNo := CalfDetails[c,5];
                          FCalvingEvent.CalfRecord.Colour := GetColourIdFromCode(CalfDetails[c,6]);
                          FCalvingEvent.CalfRecord.HerdBookNo := CalfDetails[c,7];
                          FCalvingEvent.CalfRecord.Name := CalfDetails[c,8];
                          if (CalfDetails[c,9] <> '') then
                             try
                                FCalvingEvent.CalfRecord.BirthWeight := StrToFloat(CalfDetails[c,9]);
                             except
                                FCalvingEvent.CalfRecord.BirthWeight := cDefaultCalfWeight;
                             end
                          else
                             FCalvingEvent.CalfRecord.BirthWeight := cDefaultCalfWeight;

                          FCalvingEvent.CalfRecord.DamID := DamId;
                          FCalvingEvent.CalfRecord.SireId := SireId;
                          FCalvingEvent.CalfRecord.DonorDamID := GenDamId;
                          FCalvingEvent.CalfRecord.HerdID := FHerdID;
                          FCalvingEvent.CalfRecord.Breeding := UPPERCASE(FCalvingEvent.CalfRecord.Sex) = 'FEMALE';
                          FCalvingEvent.CalfRecord.Save;
                          FCalvingEvent.CalfID[c] := FCalvingEvent.CalfRecord.ID;
                       end
                    else
                       begin
                          CreateLogEntry(Format('Could not create calf record. Calf tag "%s" already recorded for this herd.' +cCRLF+
                                                'Animal record has been associated to calving event.',[CalfNatIdNo]));
                          FCalvingEvent.CalfID[c] := FAnimalQuery.FieldByName('Id').AsInteger;
                       end;

                    if (UPPERCASE(CalfDetails[c, 10]) <> 'ALIVE') then
                       begin
                          FCalvingEvent.CalfDead[c] := True;
                          FCalvingEvent.CalfMortality[c] := GetCalfMortalityFromDescription(CalfDetails[c, 10]);
                          // create death event.
                          with FCalvingEvent.DeathEvent do
                             try
                                Append;
                                AnimalID  := FCalvingEvent.CalfID[c];
                                AnimalLactNo := 0;
                                AnimalHerdID := FHerdID;
                                EventDate    := StrToDate(CalfDetails[c,3]);
                                EventComment := CalfDetails[c, 10];
                                EventSource := sSMARTPHONE;
                                Sold := False;
                                Post;
                             except
                                Cancel;
                             end;
                       end;

                   FCalvingEvent.CalfReg[c] := (UPPERCASE(CalfDetails[c, 11]) = 'ACCEPTED') OR (UPPERCASE(CalfDetails[c, 11]) = 'QUERIED');

                end;

              FCalvingEvent.Append;
              FCalvingEvent.AnimalID := DamId;
              FCalvingEvent.EventDate := EventDate;
              FCalvingEvent.AnimalLactNo := AnimalLactNo+1;
              FCalvingEvent.AnimalHerdID := FHerdID;
              if ( FCalvingEvent.EventComment = 'Calving Event' ) then
                 FCalvingEvent.EventComment := 'Calving from Phone'
              else
                 FCalvingEvent.EventComment := EventComment;

              FCalvingEvent.EventSource := sSMARTPHONE;

              FCalvingEvent.BirthType := GetBirthTypeFromDescription(CalvingSurveyCode, CalvingSurvey);
              FCalvingEvent.IsSynchronized := True;
              FCalvingEvent.Post;

              FCalvingEvent.Database.Commit;

              AddEventToEventsExt(FCalvingEvent.EventId,CCalvingEvent,ClientId,NatIdNo);

              CalvingStored := True;
            except
              CreateLogEntry(Format('AnimalId: %d - Failed to create calving event.',[DamId]));
              FCalvingEvent.Database.Rollback;
              raise;
            end;
         finally
            FreeAndNil(FCalvingEvent);
            FreeAndNil(AimAnimalRegistration);
         end;

         if not CalvingStored then continue;

         // Registration Status Indicators
         // 2 = Error
         // 3 = Accepted
         // 4 = Queried
         // 5 = Deleted
         for c := Low(CalfDetails) to High(CalfDetails) do
           begin
              if (CalfDetails[c,2] = '') then  // check sex, if none specified break out of loop
                 break;

              CalfId := GetAnimalIdByNatIdNo(CalfDetails[c, 1]);

              try
                 LastActionDate := (StrToDateTime(CalfDetails[c, 12]));

                 if (WhatStyleNatID(CalfDetails[c, 1],true) in [StyleEID,Style1999]) then
                    begin
                       if (UPPERCASE(CalfDetails[c, 11]) = 'ACCEPTED') then
                          AimAnimalRegistration.UpdateAnimalRegistrationStatus(CalfId, 3, LastActionDate)
                       else if (UPPERCASE(CalfDetails[c, 11]) = 'QUERIED') then
                          AimAnimalRegistration.UpdateAnimalRegistrationStatus(CalfId, 4, LastActionDate)
                       else if (UPPERCASE(CalfDetails[c, 11]) = 'DELETED') then
                          AimAnimalRegistration.UpdateAnimalRegistrationStatus(CalfId, 5, LastActionDate);
                    end
                 else if IsNINatID(CalfDetails[c, 1]) then
                    try
                       UpdateAnimalRegistrationStatus(DamId, AnimalLactNo+1, EventDate,
                               CalfId,(UPPERCASE(CalfDetails[c, 11]) = 'ACCEPTED'),
                               LastActionDate,CalfDetails[c, 13]);
                    except
                       on e : Exception do
                          begin
                             if (IsWinherdDebugging) then
                                begin
                                   CreateLogEntry(Format('Calf: %s - Failed to update animal registration record.',[CalfDetails[c, 1]]) + ' --- ' + e.message);
                                   ShowMessage(e.Message);
                                end
                             else
                                CreateLogEntry(Format('Calf: %s - Failed to update animal registration record.',[CalfDetails[c, 1]]));
                          end;
                    end;
              except

              end;
           end;
      finally
         CalvesNode := nil;
         CalfNode := nil;
         FAnimalQuery.Active := False;
         FAnimalQuery.Active := True;
      end;

   if ((SystemRegisteredCountry = Ireland) and (UpdateNextCalfIdNo)) then
       UpdateNextCalfNatId();
end;


function THerdSync.EnforceOfficialBreedCode(ABreedCode: string): string;
begin
   Result := ABreedCode;
   if (FRegisteredCountry = Ireland) then
      begin
         // SP 26/06/2012
         // For purposes of Bandon Reg, "HO" Holstein becomes "FR" Holstein Friesian
         // If Tempstr = "HO", replace with "FR"
         // If Tempstr = "HOX", replace with "FRX"
         if (ABreedCode = 'HO') then
            Result := 'FR'
         else if (ABreedCode = 'HOX') then
            Result := 'FRX';
         // SP 26/02/2004
      end
   else if (FRegisteredCountry = England) then
      begin
         // SP 05/04/2013
         // For purposes of BCMS Compliancy, "FR" Holstein Friesian must become "HF" Holstein Friesian
         // If Tempstr = "FR", replace with "HF"
         // If Tempstr = "FRX", replace with "HFX"
         if (ABreedCode = 'FR') then
            Result := 'HF'
         else if (ABreedCode = 'FRX') then
            Result := 'HFX';
         // SP 05/04/2013
      end;
end;

function THerdSync.GetCalfMortalityFromDescription(
  ADescription: string): Integer;
begin
   Result := 0;
   if (Trim(ADescription) = '') then
      Exit;

   if FGenlookQuery.Locate('ListType;Description', VarArrayOf([LMortality, 'ICBF-'+ADescription]),[loCaseInsensitive]) then
      begin
         Result := FGenlookQuery.FieldByName('ID').AsInteger;
      end;
end;

procedure THerdSync.ProcessRegistrations(
  ARegistrations: IXMLDOMNodeList);
var
   CalfQuery : TQuery;

   i, j : Integer;
   RegistrationNode : IXMLDOMNode;
   NatIdNo : String;
   AnimalId, Status : Integer;
   LastActionDate : TDateTime;
   ConfirmId : String;
   AimAnimalRegistration : TAimAnimalRegistration;

begin
   RegistrationNode := nil;

   if ( ARegistrations = nil ) then Exit;

   try
      try

         AimAnimalRegistration := TAimAnimalRegistration.create(0, FHerdID);

         CalfQuery := TQuery.Create(nil);
         with CalfQuery do
            begin
               DatabaseName := FDatabasePath;
               SQL.Add('SELECT ID FROM Animals');
               SQL.Add('WHERE HerdId =:AHerdId');
               SQL.Add('AND NatIdNum = :ANatIdNum');
            end;

         for i := 0 to ARegistrations.Length-1 do
            begin
               AnimalId := 0;
               NatIdNo := '';
               Status := -1;
               LastActionDate := 0;
               ConfirmId := '';

               RegistrationNode := ARegistrations.item[i];

               for j := 0 to RegistrationNode.childNodes.Get_length-1 do
                  begin
                     FChildNode := RegistrationNode.childNodes[j];
                     if ( FChildNode = nil ) then Continue;

                     if ( FChildNode.nodeName = 'natIdNo' ) then
                        NatIdNo := Trim(FChildNode.text)
                     else if ( FChildNode.nodeName = 'status' ) then
                        try
                           Status := ( StrToInt(FChildNode.text) );
                        except
                        end
                     else if ( FChildNode.nodeName = 'lastActionDate' ) then
                        try
                           LastActionDate := ( StrToDateTime(FChildNode.text) );
                        except
                        end
                     else if ( FChildNode.nodeName = 'aphisConfirmId' ) then
                        try
                           ConfirmId := FChildNode.text;
                        except
                        end;
                  end;

               if ( NatIdNo = '' ) then
                  begin
                     CreateLogEntry('Could not update animal registration. NatIdNo value is empty.');
                     continue;
                  end;

               if (Status = -1) then
                  begin
                     CreateLogEntry(Format('%s: Could not update animal registration. Unknown status value: %d',[NatIdNo,Status]));
                     continue;
                  end;

               CalfQuery.Params[0].AsInteger := FHerdID;
               CalfQuery.Params[1].AsString := NatIdNo;
               CalfQuery.Open;
               try
                  if not CalfQuery.Eof or CalfQuery.Bof then
                     AnimalId := CalfQuery.FieldByName('Id').AsInteger;
               finally
                  CalfQuery.Close;
               end;

               if (AnimalId <= 0) then
                  begin
                     CreateLogEntry(Format('%s: Could not update animal registration. Failed to locate animal within specified date of birth range.',[NatIdNo]));
                     continue;
                  end;

               if ( WhatStyleNatID(NatIdNo,true) in [StyleEID,Style1999] ) then
                  AimAnimalRegistration.UpdateAnimalRegistrationStatus(AnimalId, Status, LastActionDate)
               else if IsNINatID(NatIdNo) then
                  UpdateAnimalRegistrationStatus(AnimalId, Status=3, LastActionDate, ConfirmId);
            end;
      except
         CreateLogEntry('ReadHerdSyncData() : Error processing calf registrations.');
         raise;
      end;

   finally
      if (CalfQuery <> nil) then
         FreeAndNil(CalfQuery);
      if (AimAnimalRegistration <> nil) then
         FreeAndNil(AimAnimalRegistration);
   end;
end;

procedure THerdSync.CreateHealthEvents(ARemediesNode : IXMLDOMNodeList; IsDryOffEvent : Boolean);
   {function GetDrugUsed(const ADrugVPANumber: string): Integer;
   var
      ServerDrug : TServerDrug;
   begin
      Result := 0;
      if Trim(ADrugVPANumber) = '' then Exit;

      if FMedicinesQuery.Locate('VPANo', ADrugVPANumber, [loCaseInsensitive]) then
         begin
            Result := FMedicinesQuery.Fields[0].AsInteger;
            if not FMedicinesQuery.Fields[3].AsBoolean then
               MarkMedicineInUse(Result);
         end
      else
         begin
            ServerDrug := GetDrugFromServerListing(ADrugVPANumber);
            if (ServerDrug.IsValid) then
               begin
                  Result := FMedicineRepository.CreateMedicine(ServerDrug.Description, ServerDrug.Code);
                  // Refresh the FMedicinesQuery to include the newly created drug
                  FMedicinesQuery.Active := False;
                  FMedicinesQuery.Active := True;
               end;
         end;
   end;}

   function GetDrugPurchaseId(const ADrugId : Integer; const ABatchNo : string; APurchaseDate : TDateTime) : Integer;
   begin
      Result := 0;
      if (ADrugId <= 0) or (Trim(ABatchNo) = '') then Exit;

      Result := FMedicinePurchaseRepository.GetMostRecentPurchaseId(ADrugId, ABatchNo, APurchaseDate);
   end;

   function GetDrugApplicationMethod(
     const AApplicationMethod: string): Integer;
   begin
      Result := 0;
      if Trim(AApplicationMethod) = '' then Exit;

      if FGenlookQuery.Locate('ListType;Description', VarArrayOf([LApplicMethod,AApplicationMethod]), [loCaseInsensitive]) then
         Result := FGenlookQuery.Fields[0].AsInteger;
   end;

   function GetVeterinaryAdministrator(
     const AAdministrator: string): Integer;
   begin
      Result := 0;
      if Trim(AAdministrator) = '' then Exit;

      if FMedAdminQuery.Locate('Name', AAdministrator, [loCaseInsensitive]) then
         Result := FMedAdminQuery.Fields[0].AsInteger;
   end;

   function GetPrescribingVet(
     const APrescribingVet: string): Integer;
   begin
      Result := 0;
      if Trim(APrescribingVet) = '' then Exit;
      if FMedAdminQuery.Locate('Name', APrescribingVet, [loCaseInsensitive]) then
         Result := FMedAdminQuery.Fields[0].AsInteger;
   end;

   function GetHealthCode(const AHealthCode : THealthCodeObject;
     IsOfficialCode: Boolean): Integer;
   begin
      Result := 0;
      if (not AHealthCode.IsValid) then Exit;

      try
      if (IsOfficialCode) then
         begin
            if FOfficialHealthCodeQuery.Locate('LookupCode', AHealthCode.Code, []) then
               Result := FOfficialHealthCodeQuery.Fields[0].AsInteger;
         end
      else
         begin
            if FFarmHealthCodeQuery.Locate('Description', AHealthCode.Description, []) then
               Result := FFarmHealthCodeQuery.Fields[0].AsInteger;
         end;
      except
         on e : exception do
         CreateLogEntry(e.Message);
      end;
   end;


var
   i, j, x : Integer;
   EventNode : IXMLDOMNode;
   NatIdNo : String;
   EventDate : TDateTime;
   LastCalvingDate : TDateTime;
   EventComment : String;
   PrescribingVet : String;
   ClientId : String;
   AnimalLactNo : Integer;
   RemedyTreatment : TRemedyTreatment;
   RemedyTreatments : TRemedyTreatments;

   RemedyTreatmentsNode : IXMLDOMNodeList;
   RemedyTreatmentNode : IXMLDOMNode;

   TempNode : IXMLDOMNode;
   TempNode_Child : IXMLDOMNode;

   ExistEventId : Integer;

   DryOffSaved : Boolean;

begin
   if ( ARemediesNode = nil ) then Exit;

   RemedyTreatmentsNode := nil;
   RemedyTreatmentNode := nil;
   TempNode := nil;
   TempNode_Child := nil;

   FMedicinesQuery.Active := True;
   FMedAdminQuery.Active := True;
   FGenlookQuery.Active := True;
   FOfficialHealthCodeQuery.Active := True;
   FFarmHealthCodeQuery.Active := True;

   FMedicinePurchaseRepository := TMedicinePurchaseRepository.Create(FDatabasePath);

   RemedyTreatments := TRemedyTreatments.Create();
   try
      for i := 0 to ARemediesNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         EventComment := '';

         EventNode := ARemediesNode.item[i];
         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'animalId' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := ( FChildNode.text )
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        EventComment := FChildNode.text
                     else if ( FChildNode.nodeName = 'prescribingVet' ) then
                        PrescribingVet := (FChildNode.text)
                  end;
            end;

        if ( NatIdNo = '' ) or (EventDate = 0) then
           begin
              CreateLogEntry('Could not create remedy event. Event details are missing.');
              continue;
           end;

        if (not LocateAnimal(NatIdNo)) then
           begin
              CreateLogEntry(Format('Could not create remedy event. Animal tag %s not found in the database.',[NatIdNo]));
              AddEventToEventsExt(0,CDryOffEvent,ClientId,NatIdNo);
              continue;
           end;

         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode = nil ) then Continue;

               if ( FChildNode.nodeName = 'remedyTreatments' ) then
                  begin
                     // read all Treatment nodes
                     for x := 0 to FChildNode.childNodes.length-1 do
                        begin
                           RemedyTreatmentNode := FChildNode.childNodes[x];

                           if (RemedyTreatmentNode = nil) then Continue;

                           RemedyTreatment := TRemedyTreatment.Create;

                           TempNode := RemedyTreatmentNode.selectSingleNode('administeredBy');
                           if( TempNode <> nil) then
                              RemedyTreatment.AdministeredBy := TempNode.text;

                           TempNode := RemedyTreatmentNode.selectSingleNode('applicationMethod');
                           if( TempNode <> nil) then
                              begin
                                 TempNode_Child := TempNode.selectSingleNode('code');
                                 if (TempNode_Child <> nil) then
                                     RemedyTreatment.ApplicationMethod.Code := TempNode_Child.text;
                                 TempNode_Child := TempNode.selectSingleNode('description');
                                 if (TempNode_Child <> nil) then
                                     RemedyTreatment.ApplicationMethod.Description := TempNode_Child.text;
                              end;

                           TempNode := RemedyTreatmentNode.selectSingleNode('applicationRate');
                           if( TempNode <> nil) then
                              try
                                 RemedyTreatment.ApplicationRate := StrToFloat(TempNode.text);
                              except
                              end;

                           TempNode := RemedyTreatmentNode.selectSingleNode('timesDaily');
                           if( TempNode <> nil) then
                              try
                                 RemedyTreatment.TimesDaily := StrToInt(TempNode.text);
                              except
                              end;

                           TempNode := RemedyTreatmentNode.selectSingleNode('daysTaken');
                           if( TempNode <> nil) then
                              try
                                 RemedyTreatment.DaysTaken := StrToInt(TempNode.text);
                              except
                              end;

                           TempNode := RemedyTreatmentNode.selectSingleNode('drugName');
                           if( TempNode <> nil) then
                              RemedyTreatment.DrugName := TempNode.text;

                           TempNode := RemedyTreatmentNode.selectSingleNode('drugVPANumber');
                           if( TempNode <> nil) then
                              RemedyTreatment.DrugVPANumber := TempNode.text;

                           TempNode := RemedyTreatmentNode.selectSingleNode('drugBatchNumber');
                           if( TempNode <> nil) then
                              RemedyTreatment.DrugBatchNumber := TempNode.text;

                           TempNode := RemedyTreatmentNode.selectSingleNode('officialHealthCode');
                           if( TempNode <> nil) then
                              begin
                                 TempNode_Child := TempNode.selectSingleNode('code');
                                 if (TempNode_Child <> nil) then
                                     RemedyTreatment.OfficialHealthCode.Code := TempNode_Child.text;
                                 TempNode_Child := TempNode.selectSingleNode('description');
                                 if (TempNode_Child <> nil) then
                                     RemedyTreatment.OfficialHealthCode.Description := TempNode_Child.text;
                              end;

                           TempNode := RemedyTreatmentNode.selectSingleNode('farmHealthCode');
                           if( TempNode <> nil) then
                              begin
                                 TempNode_Child := TempNode.selectSingleNode('code');
                                 if (TempNode_Child <> nil) then
                                     RemedyTreatment.FarmHealthCode.Code := TempNode_Child.text;
                                 TempNode_Child := TempNode.selectSingleNode('description');
                                 if (TempNode_Child <> nil) then
                                     RemedyTreatment.FarmHealthCode.Description := TempNode_Child.text;
                              end;

                           RemedyTreatments.Add(RemedyTreatment);
                        end;
                     Continue;
                  end;
            end;

        AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
        if (IsDryOffEvent) then
           begin
              ExistEventId := FEventDataHelper.GetEventID(FAnimalQuery.FieldByName('ID').AsInteger,
                                                          AnimalLactNo, CDryOffEvent, EventDate);
              if ( ExistEventId > 0 ) then
                  begin
                     AddEventToEventsExt(ExistEventId,CDryOffEvent,ClientId,NatIdNo);
                     CreateLogEntry(Format('AnimalId: %d - Failed to create Dry Off event. Dry Off event already found for specified lactation (%d).',
                                    [FAnimalQuery.FieldByName('ID').AsInteger,AnimalLactNo]));
                     RemedyTreatments.Clear;
                     Continue;
                  end;

              LastCalvingDate := FEventDataHelper.GetLastEventDate(FAnimalQuery.FieldByName('ID').AsInteger,
                                                                   AnimalLactNo,
                                                                   CCalvingEvent);
              if ( EventDate < LastCalvingDate ) then
                 AnimalLactNo := AnimalLactNo-1;
           end;

         FHealthEvent := THealthEvent.Create('tHealth');
         try
            // if there are no treatments items just record the bare bones of a health event.
            if (RemedyTreatments.Count = 0) then
               begin
                  FHealthEvent.Append;
                  try
                     FHealthEvent.AnimalID := FAnimalQuery.FieldByName('ID').AsInteger;
                     FHealthEvent.AnimalLactNo := AnimalLactNo;
                     FHealthEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
                     FHealthEvent.EventDate := EventDate;
                     FHealthEvent.EventComment := EventComment;
                     FHealthEvent.EventSource := sSMARTPHONE;
                     FHealthEvent.DryOffEvent := IsDryOffEvent;
                     //   28/08/13 [V5.2 R0.2] /MK Change - Added Manual Comment Boolean.
                     FHealthEvent.ManualComment := False;
                     FHealthEvent.IsSynchronized := True;
                     FHealthEvent.Post;
                     if ( IsDryOffEvent ) then
                        AddEventToEventsExt(FHealthEvent.EventID,CDryOffEvent,ClientId,NatIdNo)
                     else
                        AddEventToEventsExt(FHealthEvent.EventID,CHealthEvent,ClientId,NatIdNo);
                  except
                     FHealthEvent.Cancel;
                     CreateLogEntry(Format('AnimalId: %d - Failed to create health event.',
                                    [FAnimalQuery.FieldByName('ID').AsInteger]))
                  end;
               end
            else
               begin
                  DryOffSaved := False;
                  for x := 0 to RemedyTreatments.Count-1 do
                     begin
                        RemedyTreatment :=  TRemedyTreatment(RemedyTreatments[x]);

                        FHealthEvent.Append;
                        try
                           FHealthEvent.AnimalID := FAnimalQuery.FieldByName('ID').AsInteger;
                           FHealthEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
                           FHealthEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
                           FHealthEvent.EventDate := EventDate;
                           FHealthEvent.EventComment := EventComment;
                           FHealthEvent.EventSource := sSMARTPHONE;

                           //   04/12/20 [V5.9 R7.8] /MK Change - If multi treatment then save first event as dryoff and any following treatments as remedy events.
                           FHealthEvent.DryOffEvent := ( (IsDryOffEvent) and (not(DryOffSaved)) );
                           //   04/12/20 [V5.9 R7.8] /MK Change - Also change the comment of following treatments of dry off events to Remedy Event similar to non Dry Off Events.
                           if ( IsDryOffEvent ) and ( not(FHealthEvent.DryOffEvent) ) then
                              FHealthEvent.EventComment := 'Remedy Event';

                           FHealthEvent.IsSynchronized := True;

                           FHealthEvent.DrugUsed := GetDrugIdByVPANumber(RemedyTreatment.DrugVPANumber);
                           FHealthEvent.RateApplic := RemedyTreatment.ApplicationRate;
                           FHealthEvent.NoTimes := RemedyTreatment.TimesDaily;
                           FHealthEvent.NoDays := RemedyTreatment.DaysTaken;

                           if (RemedyTreatment.ApplicationMethod.IsValid) then
                              begin
                                 // search the application method by the description, as codes are user defined therefore unreliable for matching
                                 FHealthEvent.ApplicMethod := GetDrugApplicationMethod(RemedyTreatment.ApplicationMethod.Description);
                                 if (FHealthEvent.ApplicMethod <= 0) then
                                    begin
                                       AddDrugApplicationMethod(RemedyTreatment.ApplicationMethod);
                                       FHealthEvent.ApplicMethod := GetDrugApplicationMethod(RemedyTreatment.ApplicationMethod.Description);
                                    end;
                              end;

                           FHealthEvent.AdminBy := GetVeterinaryAdministrator(RemedyTreatment.AdministeredBy);
                           FHealthEvent.PrescribingVet := GetVeterinaryAdministrator(PrescribingVet);

                           FHealthEvent.DrugBatchNo := RemedyTreatment.FDrugBatchNumber;

                           if (FHealthEvent.DrugUsed > 0) and (FHealthEvent.DrugBatchNo <> '') then
                              begin
                                 FHealthEvent.DrugPurchID := GetDrugPurchaseId(FHealthEvent.DrugUsed,FHealthEvent.DrugBatchNo,FHealthEvent.EventDate);
                                 {
                                 //   30/04/15 [V5.4 R5.3] /MK Change - Don't create shell of drug purchase - GL/SP request.
                                 if (FHealthEvent.DrugPurchID <= 0) then
                                    begin
                                       FHealthEvent.DrugPurchID := FMedicinePurchaseRepository.CreateMedicinePurchase(
                                                                     FHealthEvent.DrugUsed,0,
                                                                     FHealthEvent.EventDate,0,
                                                                     FHealthEvent.DrugBatchNo,'','',0,0);
                                    end;
                                  }  
                              end;

                           if (RemedyTreatment.OfficialHealthCode.IsValid) then
                              begin
                                 // search official health code by the actual code value. these codes are reliable!
                                 FHealthEvent.HealthCode := GetHealthCode(RemedyTreatment.OfficialHealthCode,True);
                                 if (FHealthEvent.HealthCode <= 0) then
                                    begin
                                       AddOfficialHealthCode(RemedyTreatment.OfficialHealthCode);
                                       FHealthEvent.HealthCode := GetHealthCode(RemedyTreatment.OfficialHealthCode,True);
                                    end;
                              end;

                           if (RemedyTreatment.FarmHealthCode.IsValid) then
                              begin
                                 FHealthEvent.FarmCode :=  GetHealthCode(RemedyTreatment.FarmHealthCode,False);
                                 if (FHealthEvent.FarmCode <= 0) then
                                    begin
                                       AddFarmHealthCode(RemedyTreatment.FarmHealthCode);
                                       FHealthEvent.FarmCode :=  GetHealthCode(RemedyTreatment.FarmHealthCode,False);
                                    end;
                              end;

                           FHealthEvent.Post;

                           //   04/12/20 [V5.9 R7.8] /MK Change - Set new DryOffSaved variable boolean to true if event is dry off and its the first treatment.
                           DryOffSaved := ( IsDryOffEvent ) and ( x = 0 );

                           if ( IsDryOffEvent ) then
                              AddEventToEventsExt(FHealthEvent.EventID,CDryOffEvent,ClientId,NatIdNo)
                           else
                              AddEventToEventsExt(FHealthEvent.EventID,CHealthEvent,ClientId,NatIdNo);
                        except
                           on e : exception do
                              begin
                                 FHealthEvent.Cancel;
                                 CreateLogEntry(Format('AnimalId: %d - Failed to create Health/Dry Off event. (%s)',
                                               [FAnimalQuery.FieldByName('ID').AsInteger, e.Message]));
                              end;
                        end;
                     end;
               end;
         finally
            FHealthEvent.Free;
         end;

         RemedyTreatments.Clear;
      end;
   finally
      RemedyTreatmentsNode := nil;
      RemedyTreatmentNode := nil;
      TempNode := nil;
      TempNode_Child := nil;

      FMedicinesQuery.Active := False;
      FMedAdminQuery.Active := False;
      FGenlookQuery.Active := False;
      FOfficialHealthCodeQuery.Active := False;
      FFarmHealthCodeQuery.Active := False;

      FreeAndNil(RemedyTreatments);
      FreeAndNil(FMedicinePurchaseRepository);
   end;
end;

procedure THerdSync.AddDrugApplicationMethod(AApplicationMethod : TApplicationMethod);
begin
   AddGenLookRecord(LApplicMethod, AApplicationMethod.Code, AApplicationMethod.Description, False);
   FGenlookQuery.Close;
   FGenlookQuery.Open;
end;

procedure THerdSync.AddOfficialHealthCode(AHealthCode :THealthCodeObject);
begin
   AddGenLookRecord(LHealthCode, AHealthCode.Code, 'ICBF-'+AHealthCode.Description, False);
   FOfficialHealthCodeQuery.Active := False;
   FOfficialHealthCodeQuery.Active := True;
end;

procedure THerdSync.AddGenLookRecord(AListType: Integer; const ACode,
  ADescription: string; AAllowUserDelete: Boolean);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;
         SQL.Clear;
         SQL.Add('INSERT INTO GenLook (ListType, LookupCode, Description, UserCanDelete, InUse)');
         SQL.Add('VALUES (:ListType, :LookupCode, :Description, :UserCanDelete, :InUse)');
         Params[0].AsInteger := AListType;
         Params[1].AsString := ACode;
         Params[2].AsString := ADescription;
         Params[3].AsBoolean := AAllowUserDelete; // can delete
         Params[4].AsBoolean := True; // inuse
         try
            ExecSQL;
         except
            CreateLogEntry(Format('Failed to create listtype ["%d"] for data [code:"%s" description:"%s"]',[AListType,ACode,ADescription]));
         end;
      finally
         Free;
      end;
end;

procedure THerdSync.AddFarmHealthCode(AHealthCode: THealthCodeObject);
begin
   AddGenLookRecord(LHealthCode, AHealthCode.Code, AHealthCode.Description, False);
   FFarmHealthCodeQuery.Active := False;
   FFarmHealthCodeQuery.Active := True;
end;

procedure THerdSync.SetDrugAsInUse(const ADrugId : Integer; const AInUse : Boolean);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;
         SQL.Clear;
         SQL.Add('UPDATE Medicine SET Inuse = :AInUse');
         SQL.Add('WHERE Id = :Id');
         Params[0].AsBoolean := AInUse;
         Params[1].AsInteger := ADrugId;
         try
            ExecSQL;
         except
           CreateLogEntry(Format('Failed to update drug''s InUse status ["%d"]',[ADrugId]));
         end;
      finally
         Free;
      end;
end;

function THerdSync.GetDrugFromServerListing(
  AVPANumber: string): TServerDrug;
var
   i : Integer;
   DrugsNode : IXMLDOMNodeList;
   DrugNode : IXMLDOMNode;
   ChildNode: IXMLDOMNode;
begin
   DrugsNode := nil;
   DrugNode := nil;
   ChildNode := nil;
   Result := TServerDrug.Create;
   try
      if (FDrugListingDocument = nil) then Exit;

      DrugsNode := FDrugListingDocument.getElementsByTagName('drug');
      for i := 0 to DrugsNode.length-1 do
         begin
            DrugNode := DrugsNode[i];
            if (DrugNode = nil) then continue;

            ChildNode := DrugNode.selectSingleNode('vpaNumber');
            if (ChildNode = nil) then continue;
               begin
                  AVPANumber := UPPERCASE(TRIM(AVPANumber));
                  if UPPERCASE(Trim( ChildNode.text )) = AVPANumber then
                     begin
                        Result.VPANumber := AVPANumber;
                        ChildNode := DrugNode.selectSingleNode('name');
                        if (ChildNode <> nil) then
                           Result.Description := ChildNode.Text;
                        if ( Result.IsValid ) then Continue;
                     end;
               end;
         end;
   finally
      DrugsNode := nil;
      DrugNode := nil;
      ChildNode := nil;
   end;
end;

function THerdSync.IsMedicineMarkedInUse(
  const AMedicineId: Integer): Boolean;
var
   i : Integer;
begin
   Result := False;
   if (Length(FMedicinesMarkedInUse) = 0 ) then Exit;

   for i := 0 to Length(FMedicinesMarkedInUse)-1 do
       begin
          if (FMedicinesMarkedInUse[i] = AMedicineId) then
             begin
                Result := True;
                Break;
             end
       end;
end;

procedure THerdSync.MarkMedicineInUse(const AMedicineId: Integer);
begin
   if not IsMedicineMarkedInUse( AMedicineId ) then
      begin
         FMedicineRepository.SetMedicineInUseStatus(AMedicineId, True);
         SetLength(FMedicinesMarkedInUse, Length(FMedicinesMarkedInUse)+1);
         FMedicinesMarkedInUse[Length(FMedicinesMarkedInUse)-1] := AMedicineId;
      end;
end;

{procedure THerdSync.MarkAsSynchronized(AId, ASyncType: Integer;
  const IsSynchronized: Boolean);
var
   KeyField, TableName : string;
begin
   if (AId <= 0) then Exit;

   KeyField := 'Id';

   if (ASyncType = AnimalSync) then
      TableName := 'Animals'
   else if (ASyncType = EventSync) then
      TableName := 'Events'
   else if (ASyncType = SupplierSync) then
      TableName := 'SuppliersBreeders'
   else if (ASyncType = BuyerSync) then
      TableName := 'Buyers'
   else if (ASyncType = CustomerSync) then
      TableName := 'Customers'
   else if (ASyncType = MilkLactSync) then
      begin
         TableName := 'MilkDisk';
         KeyField := 'MilkDiskId';
      end
   else if (ASyncType = GroupSync) then
      TableName := 'Grps'
   else
      begin
         CreateLogEntry('MarkAsSynchronized() : Unsupported argument AType (' + IntToStr(ASyncType) + ')');
         Exit;
      end;

   with FMarkAsSynchronizedQuery do
      begin
         SQL.Clear;
         SQL.Add('UPDATE ' + TableName + ' SET IsSynchronized = :IsSynchronized');
         SQL.Add('WHERE ('+KeyField+' = :AValue)');
         Params[0].AsBoolean := IsSynchronized;
         Params[1].AsInteger := AId;
         Prepared := True;
         try
            ExecSQL;
         except
            on E : Exception do
               CreateLogEntry(E.Message);
         end;
      end;
end;}

function THerdSync.GetBreedingBullCount: Integer;
begin
   with TQuery.Create(nil) do
      begin
         DatabaseName := FDatabasePath;
         SQL.Clear;
         SQL.Add('SELECT Count(A.Id)');
         SQL.Add('FROM Animals A ');
         SQL.Add('LEFT JOIN Breeds B On (B.ID = A.PrimaryBreed) ');
         SQL.Add('LEFT JOIN BullSemenStk BS ON (BS.AnimalID = A.ID) ');
         SQL.Add('WHERE (A.Breeding = True) AND (BS.InUse = True)');
         SQL.Add('AND   (A.AnimalDeleted = False) ');
         SQL.Add('AND   (Upper(A.Sex) = "BULL") ');
         SQL.Add('AND   (A.HerdId = '+IntToStr(NoneHerdId)+') ');
         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      end;
end;

function THerdSync.DuplicateAITechniciansDetected: Boolean;
begin
   with TQuery.Create(nil) do
      begin
         DatabaseName := FDatabasePath;

         SQL.Add('SELECT LookupCode');
         SQL.Add('FROM Genlook');
         SQL.Add('WHERE ListType = 10 ');
         SQL.Add('GROUP BY LookupCode');
         SQL.Add('HAVING COUNT(LookupCode) > 1');
         Open;
         try
            Result := (RecordCount>0);
         finally
            Close;
         end;
      end;
end;

function THerdSync.DuplicateVetAdministratorsDetected: Boolean;
begin
   with TQuery.Create(nil) do
      begin
         DatabaseName := FDatabasePath;

         SQL.Add('SELECT AdminCode');
         SQL.Add('FROM MedAdmin');
         SQL.Add('GROUP BY AdminCode');
         SQL.Add('HAVING COUNT(AdminCode) > 1');
         Open;
         try
            Result := (RecordCount>0);
         finally
            Close;
         end;
      end;
end;

class procedure THerdSync.MarkAsSynchronized(const ADatabasePath : string);
var
   SyncType : Integer;
   KeyField, TableName : string;
begin
   Session.AddPassword(MASTER_PASSWORD);
   with TQuery.Create(nil) do
      try
         DatabaseName := ADatabasePath;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM SyncIDs');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
         except
         end;
      finally
         Free;
      end;

   for SyncType := AnimalSync to EventsExtSync do
      begin
         KeyField := 'Id';
         if (SyncType = AnimalSync) then
            TableName := 'Animals'
         else if (SyncType = EventSync) then
            TableName := 'Events'
         else if (SyncType = SupplierSync) then
            TableName := 'SuppliersBreeders'
         else if (SyncType = CustomerSync) then
            TableName := 'Customers'
         else if (SyncType = BuyerSync) then
            TableName := 'Buyers'
         else if (SyncType = MilkLactSync) then
            begin
               TableName := 'MilkDisk';
               KeyField := 'MilkDiskId';
            end
         else if (SyncType = GenLookSync) then
            TableName := 'GenLook'
         else if (SyncType = VetAdminSync) then
            TableName := 'MedAdmin'
         else if (SyncType = GroupSync) then
            TableName := 'Grps'
         else if (SyncType = MedicineSync) then
            TableName := 'Medicine'
         else if (SyncType = FeedTypeSync) then
            TableName := 'FeedTypes'
         else if (SyncType = DeletedEventsSync) then
            begin
               TableName := 'ICBFDelete';
               KeyField := 'EventId';
            end
         else if (SyncType = HerdFileSync) then
            TableName := 'Owners'
         else if (SyncType = DeletedGrps) then
            TableName := 'DeletedGrps'
         else if (SyncType = MediPurch) then
            TableName := 'MediPur'
         else if (SyncType = FdStkEvents) then
            TableName := 'FdStkEvents'
         else if (SyncType = EventsExtSync ) then
            begin
               TableName := 'EventsExt';
               KeyField := 'EventId';
            end
         else
            begin
               Continue;
            end;

         ApplicationLog.LogDebugMessage('Before '+TableName+' IsSynchronized SQL');
         with TQuery.Create(nil) do
            try
               DatabaseName := ADatabasePath;
               SQL.Clear;
               SQL.Add('UPDATE ' + TableName + ' SET IsSynchronized = True');
               SQL.Add('WHERE '+KeyField+' IN');
               SQL.Add('       (SELECT KeyValue');
               SQL.Add('        FROM SyncIds   ');
               SQL.Add('        WHERE (SyncType = '+IntToStr(SyncType)+'))');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ApplicationLog.LogDebugMessage(e.Message);
               end;
            finally
               Free;
            end;
        ApplicationLog.LogDebugMessage('After '+TableName+' IsSynchronized SQL');
      end;

   ApplicationLog.LogDebugMessage('Before Drop SyncIDs');
   with TQuery.Create(nil) do
      try
         DatabaseName := ADatabasePath;
         SQL.Clear;
         SQL.Add('DROP TABLE SyncIds');
         try
            ExecSQL;
         except
         end;
      finally
         Free;
      end;
   ApplicationLog.LogDebugMessage('After Drop SyncIDs');

   ApplicationLog.LogDebugMessage('Before SyncDefaults ClientGrpTimeStamp Update');
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE SyncDefaults');
         SQL.Add('SET ClientGrpTimeStamp = :Now');
         Params[0].AsDateTime := Now;
         try
            ExecSQL;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
   ApplicationLog.LogDebugMessage('After SyncDefaults ClientGrpTimeStamp Update');
end;

{procedure THerdSync.MarkAsSynchronized(AIds : array of Integer; ASyncType : Integer);
var
   KeyField, TableName, SqlInData : string;
   arrayIndex, index : Integer;
   workingArray : array[0..199] of integer;
begin
   if (@AIds = nil) or ((Length(AIds)=0)) then Exit;

   index := 0;
   arrayIndex := Length(AIds)-1;

   FillChar(workingArray, SizeOf(workingArray), 0);
   while arrayIndex > -1 do  // do in batch of 200 ids each time
      begin
         workingArray[index] := Aids[arrayIndex];
         Inc(index);
         Dec(arrayIndex);

         if ((index = 200) or (arrayIndex = -1)) then
            begin
               index := 0;
               SqlInData := IntArrayToSQLInString(workingArray);

               KeyField := 'Id';
               if (ASyncType = AnimalSync) then
                  TableName := 'Animals'
               else if (ASyncType = EventSync) then
                  TableName := 'Events'
               else if (ASyncType = SupplierSync) then
                  TableName := 'SuppliersBreeders'
               else if (ASyncType = CustomerSync) then
                  TableName := 'Customers'
               else if (ASyncType = BuyerSync) then
                  TableName := 'Buyers'
               else if (ASyncType = MilkLactSync) then
                  begin
                     TableName := 'MilkDisk';
                     KeyField := 'MilkDiskId';
                  end
               else if (ASyncType = GenLookSync) then
                  TableName := 'GenLook'
               else if (ASyncType = VetAdminSync) then
                  TableName := 'MedAdmin'
               else if (ASyncType = GroupSync) then
                  TableName := 'Grps'
               else
                  begin
                     CreateLogEntry('MarkAsSynchronized() : Unsupported argument AType (' + IntToStr(ASyncType) + ')');
                     Exit;
                  end;

               with TQuery.Create(nil) do
                  try
                     DatabaseName := FDatabasePath;
                     SQL.Clear;
                     SQL.Add('UPDATE ' + TableName + ' SET IsSynchronized = True');
                     SQL.Add('WHERE ('+KeyField+' IN '+SqlInData+')');
                     try
                        ExecSQL;
                     except
                        on E : Exception do
                           CreateLogEntry(E.Message);
                     end;
                  finally
                     Free;
                  end;
                  FillChar(workingArray, SizeOf(workingArray), 0);
               end;
      end;
end;}

function THerdSync.SystemRegisteredCountry: TCountry;
begin
   Result := Ireland;
   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;
         SQL.Text := 'Select HerdIdentity, Country From Owners';
         Active := True;
         try
            First;
            while not eof do
               begin
                  if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') then
                     begin
                        case FieldByName('Country').AsInteger of
                           //   19/11/19 [V5.9 R1.3] /MK Change - If Owners.Country is Scotland, England, Wales then treat as England i.e. Britain.
                           7, 14, 15, 16 : Result := England;
                           12 : Result := NIreland;
                        end;
                        Break;
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

procedure THerdSync.UpdateNextCalfNatId;
var
   HerdOwnerData : THerdOwnerData;
begin
   HerdOwnerData := THerdOwnerData.create(nil,FHerdID);
   try
      try
         HerdOwnerData.NextNatID := NextIrishNatIDNumber(HerdOwnerData.HerdIdentifier);
      except
         on e : Exception do
            begin
               if (IsWinherdDebugging) then
                  CreateLogEntry(e.message)
               else
                  CreateLogEntry('Unable to complete Auto Generate Calf Nat Id. update.');
            end;
      end;
   finally
      FreeAndNil(HerdOwnerData);
   end;
end;

procedure THerdSync.AddCalvingInformation(const AEventId : Integer; ANode : IXMLDomNode);
var
   CalfArray : Array of Integer;
   I : Integer;
   CalfId : Integer;
   CalfXmlNode : IXMLDOMNode;
   SireId, GenDamId : Integer;
   CalvesNode : IXMLDomNode;
   SireNatIdNum : string;
   SireAnimalNo : string;
   GenDamAnimalNo : string;
   GenDamNatIdNum : string;
   BreedCode : string;
begin
   SetLength(CalfArray, 0);

   CalvesNode := FDocument.createElement('calves');

   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;

         SQL.Clear;
         SQL.Add('SELECT C.ID1, C.ID2, C.ID3, C.ID4 ');
         SQL.Add('FROM Calvings C ');
         SQL.Add('WHERE (C.EventId=:AEventId)');
         Params[0].AsInteger := AEventId;
         Open;

         try
            for i := 1 to 4 do
               begin
                  CalfId := FieldByName('Id'+IntToStr(I)).AsInteger;
                  if (CalfId>0) then
                     begin
                        SetLength(CalfArray, Length(CalfArray)+1);
                        CalfArray[Length(CalfArray)-1] := CalfId;
                     end;
               end;
         finally
            Close;
         end;

         for i := 0 to Length(CalfArray)-1 do
            begin
               CalfXmlNode := FDocument.createElement('calf');

               SQL.Clear;
               SQL.Add('SELECT A.Id, A.NatIdNum, A.AnimalNo, A.Sex, A.DateOfBirth, B.Code BreedCode, A.SireId, A.DonorDamId');
               SQL.Add('FROM Animals A');
               SQL.Add('LEFT JOIN Breeds B ON (B.Id=A.PrimaryBreed)');
               SQL.Add('WHERE (A.Id=:AId)');
               Params[0].AsInteger := CalfArray[i];
               Open;

               try
                  FChildNode := FDocument.createElement('animalId');
                  FChildNode.Set_text(IntToStr(FieldByName('Id').AsInteger));
                  CalfXmlNode.appendChild(FChildNode);

                  FChildNode := FDocument.createElement('natIdNo');
                  FChildNode.Set_text(FieldByName('NatIdNum').AsString);
                  CalfXmlNode.appendChild(FChildNode);

                  FChildNode := FDocument.createElement('animalNo');
                  FChildNode.Set_text(FieldByName('AnimalNo').AsString);
                  CalfXmlNode.appendChild(FChildNode);

                  FChildNode := FDocument.createElement('sex');
                  FChildNode.Set_text(FieldByName('Sex').AsString);
                  CalfXmlNode.appendChild(FChildNode);

                  FChildNode := FDocument.createElement('dob');
                  FChildNode.Set_text(DateToStr(FieldByName('DateOfBirth').AsDateTime));
                  CalfXmlNode.appendChild(FChildNode);

                  BreedCode := EnforceOfficialBreedCode(FieldByName('BreedCode').AsString);
                  FChildNode := FDocument.createElement('breedCode');
                  FChildNode.Set_text(BreedCode);
                  OutputBreed(BreedCode);
                  CalfXmlNode.appendChild(FChildNode);

                  SireId := FieldByName('SireId').AsInteger;
                  GenDamId := FieldByName('DonorDamId').AsInteger;

                  CalvesNode.appendChild(CalfXmlNode);
               finally
                  Close;
               end;

               if (i = 0) then
                  begin
                     if (SireId >0) then
                        begin
                           Params[0].AsInteger := SireId;
                           Open;

                           try
                              if Length(Trim(FieldByName('AnimalNo').AsString)) > 0 then
                                 SireAnimalNo := FieldByName('AnimalNo').AsString;
                              if Length(Trim(FieldByName('NatIdNum').AsString)) > 0 then
                                 SireNatIdNum := FieldByName('NatIdNum').AsString;
                           finally
                              Close;
                           end;
                        end;

                     if (GenDamId >0) then
                        begin
                           Params[0].AsInteger := SireId;
                           Open;

                           try
                              if Length(Trim(FieldByName('AnimalNo').AsString)) > 0 then
                                 GenDamAnimalNo := FieldByName('AnimalNo').AsString;
                              if Length(Trim(FieldByName('NatIdNum').AsString)) > 0 then
                                 GenDamNatIdNum := FieldByName('NatIdNum').AsString;
                           finally
                              Close;
                           end;
                        end;

                     FChildNode := FDocument.createElement('sireNo');
                     FChildNode.Set_text(SireAnimalNo);
                     ANode.appendChild(FChildNode);

                     FChildNode := FDocument.createElement('sireNatIdNo');
                     FChildNode.Set_text(SireNatIdNum);
                     ANode.appendChild(FChildNode);

                     FChildNode := FDocument.createElement('genDamNo');
                     FChildNode.Set_text(GenDamAnimalNo);
                     ANode.appendChild(FChildNode);

                     FChildNode := FDocument.createElement('genDamNatIdNo');
                     FChildNode.Set_text(GenDamNatIdNum);
                     ANode.appendChild(FChildNode);

                  end;
            end;
            ANode.appendChild(CalvesNode);
      finally
         Free;
      end;
end;

procedure THerdSync.CreateWeighingEvents(AWeighingsNode: IXMLDOMNodeList);
var
   i, j : Integer;
   EventNode : IXMLDOMNode;
   NatIdNo,
   ClientId,
   Weight,
   EventComment : String;
   EventDate : TDateTime;
   ExistEventId : Integer;
begin
   if ( AWeighingsNode = nil ) then Exit;

   for i := 0 to AWeighingsNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         EventComment := '';
         Weight := '';

         EventNode := AWeighingsNode.item[i];

         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'animalId' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        EventComment := FChildNode.text
                     else if ( FChildNode.nodeName = 'weight' ) then
                        Weight := FChildNode.text
                  end;
            end;

         if not ValidateWeighingEventDetail(NatIdNo, FAnimalQuery.FieldByName('DateOfBirth').AsDateTime, EventDate) then
            continue;

         ExistEventId := FEventDataHelper.GetEventID(FAnimalQuery.FieldByName('ID').AsInteger,
                                                     FAnimalQuery.FieldByName('LactNo').AsInteger,
                                                     CWeightEvent,
                                                     EventDate);
         if ( ExistEventId > 0 ) then
            begin
               AddEventToEventsExt(ExistEventId,CWeightEvent,ClientId,NatIdNo);
               Continue;
            end;

         FWeighingEvent := TWeighingEvent.Create('tWeighing');
         try
            FWeighingEvent.Append;
            try
               FWeighingEvent.AnimalID := FAnimalQuery.FieldByName('ID').AsInteger;
               FWeighingEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
               FWeighingEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
               FWeighingEvent.EventDate := EventDate;
               FWeighingEvent.EventSource := sSMARTPHONE;
               if ( Length(EventComment) > 0 ) then
                  FWeighingEvent.EventComment := EventComment;
               try
                  FWeighingEvent.Weight := StrToFloat(Weight);
               except
               end;
               FWeighingEvent.IsSynchronized := True;

               FWeighingEvent.Post;

               AddEventToEventsExt(FWeighingEvent.EventId,CWeightEvent,ClientId,NatIdNo);
             except
               FWeighingEvent.Cancel;
               CreateLogEntry(Format('AnimalId: %d - Failed to create weighing event.',
                  [FAnimalQuery.FieldByName('ID').AsInteger]));
             end;
         finally;
            FWeighingEvent.Free;
         end;
      end;
end;

function THerdSync.ValidateWeighingEventDetail(const ANatIdNo: string;
  const ADateOfBirth, AEventDate: TDateTime): Boolean;
begin
   Result := False;
   if ( ANatIdNo = '' ) then
      begin
         CreateLogEntry('Could not create weighing. Argument [NatIdNo] is empty.');
         Exit;
      end
   else if ( AEventDate = 0 ) then
      begin
         CreateLogEntry('Could not create weighing event. Argument [EventDate] is empty.');
         Exit;
      end
   else if (not LocateAnimal(ANatIdNo)) then
      begin
         CreateLogEntry(Format('Could not create weighing event. %s cannot be found in the database.',[ANatIdNo]));
         Exit;
      end
   else if ( FAnimalQuery.FieldByName('DateOfBirth').AsDateTime > AEventDate ) then
      begin
         CreateLogEntry('Could not create weighing. Event date must be after Date Of Birth.');
         Exit;
      end;
   Result := True;
end;

function THerdSync.ValidateConditionScoreEventDetail(const ANatIdNo: string;
  const ADateOfBirth, AEventDate: TDateTime): Boolean;
begin
   Result := False;
   if ( ANatIdNo = '' ) then
      begin
         CreateLogEntry('Could not create condition score event. Argument [NatIdNo] is empty.');
         Exit;
      end
   else if ( AEventDate = 0 ) then
      begin
         CreateLogEntry('Could not create condition score event. Argument [EventDate] is empty.');
         Exit;
      end
   else if (not LocateAnimal(ANatIdNo)) then
      begin
         CreateLogEntry(Format('Could not create condition score event. %s cannot be found.',[ANatIdNo]));
         Exit;
      end
   else if ( FAnimalQuery.FieldByName('DateOfBirth').AsDateTime > AEventDate ) then
      begin
         CreateLogEntry('Could not create condition score event. Event date must be after Date Of Birth.');
         Exit;
      end;
   Result := True;
end;

procedure THerdSync.CreatePurchaseEvents(APurchasesNode: IXMLDOMNodeList);
var
   i, j : Integer;
   EventNode : IXMLDOMNode;

   NatIdNo : string;
   EventComment : String;
   ClientId : String;
   EventDate : TDateTime;

   Price, Weight : Double;
   Grade, LotNo : string;
   SupplierId, BuyerId : Integer;

   PurchaseEvent : TPurchaseEvent;

   ExistEventId : Integer;
begin
   if ( APurchasesNode = nil ) then Exit;

   for i := 0 to APurchasesNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         EventComment := '';

         Price := 0;
         Weight := 0;
         Grade := '';
         LotNo := '';

         SupplierId := 0;
         BuyerId := 0;

         EventNode := APurchasesNode.item[i];

         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'natIdNo' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        EventComment := FChildNode.text
                     else if ( FChildNode.nodeName = 'price' ) then
                        try
                           Price := StrToFloat(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'weight' ) then
                        try
                           Weight := StrToFloat(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'grade' ) then
                        Grade := FChildNode.text
                     else if ( FChildNode.nodeName = 'lotNumber' ) then
                        LotNo := FChildNode.text
                     else if ( FChildNode.nodeName = 'supplierId' ) then
                        try
                           SupplierId := StrToInt(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'buyerId' ) then
                        try
                           BuyerId := StrToInt(FChildNode.text)
                        except
                        end;
                  end;
            end;

         if ( not LocateAnimal(NatIdNo) ) then
            begin
               CreateLogEntry(Format('Could not create Purchase event for animal (%s). Animal tag not found in the database.',[NatIdNo]));
               AddEventToEventsExt(0,CPurchaseEvent,ClientId,NatIdNo);
               Continue;
            end;

         ExistEventId := FEventDataHelper.GetEventID(FAnimalQuery.FieldByName('Id').AsInteger,
                                                     FAnimalQuery.FieldByName('LactNo').AsInteger,
                                                     CPurchaseEvent, EventDate);
         if ( ExistEventId > 0 ) then
            begin
               AddEventToEventsExt(ExistEventId,CPurchaseEvent,ClientId,NatIdNo);
               Continue;
            end;

         PurchaseEvent := TPurchaseEvent.Create('PDB');
         try
            PurchaseEvent.Append;
            try
               PurchaseEvent.EventType := TPurchase;
               PurchaseEvent.AnimalID := FAnimalQuery.FieldByName('Id').AsInteger;
               PurchaseEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
               PurchaseEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
               PurchaseEvent.EventComment := EventComment;
               PurchaseEvent.EventSource  := sSMARTPHONE;
               PurchaseEvent.EventDate := EventDate;
               PurchaseEvent.Supplier := SupplierId;
               PurchaseEvent.Buyer := BuyerId;
               PurchaseEvent.Price := Price;
               PurchaseEvent.Weight := Weight;
               PurchaseEvent.LotNumber := LotNo;
               PurchaseEvent.Grade := Grade;
               //PurchaseEvent.FQASDays := DaysToQAQualification;
               try
                  PurchaseEvent.CTSReg := False;
               except
               end;

               PurchaseEvent.IsSynchronized := True;

               PurchaseEvent.Post;

               AddEventToEventsExt(PurchaseEvent.EventID,CPurchaseEvent,ClientId,NatIdNo);
            except
               on e : Exception do
                  begin
                     CreateLogEntry(Format('%s: Failed to create Purchase Event.' + cCRLFx2 + e.Message,[NatIdNo]));
                     PurchaseEvent.Cancel;
                  end
            end;
         finally
            FreeAndNil(PurchaseEvent);
         end;
      end;
end;

procedure THerdSync.CreateSaleDeathEvents(ASaleDeathsNode: IXMLDOMNodeList);
var
   i, j : Integer;
   EventNode : IXMLDOMNode;

   NatIdNo : string;
   EventComment : String;
   ClientId : string;
   EventDate : TDateTime;
   AnimalLactNo : Integer;

   Price, LiveWeight, DeadWeight : Double;
   Grade, CullingCode : string;
   CustomerId : Integer;
   IsDeath : Boolean;

   SaleDeathEvent : TSaleDeathEvent;

   ExistEventId : Integer;
begin
   if ( ASaleDeathsNode = nil ) then Exit;

   FGenlookQuery.Active := True;
   try
   for i := 0 to ASaleDeathsNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         EventComment := '';

         Price := 0;
         LiveWeight := 0;
         DeadWeight := 0;

         Grade := '';
         CullingCode := '';

         CustomerId := 0;
         IsDeath := False;

         EventNode := ASaleDeathsNode.item[i];

         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'natIdNo' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        EventComment := FChildNode.text
                     else if ( FChildNode.nodeName = 'animallactNo' ) then
                        try
                           AnimalLactNo := StrToInt(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'price' ) then
                        try
                           Price := StrToFloat(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'liveWeight' ) then
                        try
                           LiveWeight := StrToFloat(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'deadWeight' ) then
                        try
                           DeadWeight := StrToFloat(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'grade' ) then
                        Grade := FChildNode.text
                     else if ( FChildNode.nodeName = 'cullingCode' ) then
                        CullingCode := FChildNode.text
                     else if ( FChildNode.nodeName = 'customerId' ) then
                        try
                           CustomerId := StrToInt(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'isDeath' ) then
                        isDeath := (Lowercase(FChildNode.text) = 'true')
                  end;
            end;

         if (not LocateAnimal(NatIdNo)) then
            begin
               CreateLogEntry(Format('Could not create Sale/Death event for animal (%s). Animal tag not found in the database.',[NatIdNo]));
               AddEventToEventsExt(0,CSaleDeathEvent,ClientId,NatIdNo);
               continue;
            end;

         ExistEventId := FEventDataHelper.GetEventID(FAnimalQuery.FieldByName('Id').AsInteger,
                                                     FAnimalQuery.FieldByName('LactNo').AsInteger,
                                                     CSaleDeathEvent, EventDate);
         if ( ExistEventId > 0 ) then
            begin
               AddEventToEventsExt(ExistEventId,CSaleDeathEvent,ClientId,NatIdNo);
               Continue;
            end;

         if ( not(FAnimalQuery.FieldByName('InHerd').AsBoolean) ) then
            begin
               CreateLogEntry(Format('Could not create Sale/Death event for animal (%s). Animal tag not found in herd.',[NatIdNo]));
               continue;
            end;

         SaleDeathEvent := TSaleDeathEvent.Create('SDDB');
         try
            SaleDeathEvent.Append;
            try
               SaleDeathEvent.CanCheckWeaning := False;
               SaleDeathEvent.EventType := TSaleDeath;
               SaleDeathEvent.AnimalID := FAnimalQuery.FieldByName('Id').AsInteger;
               SaleDeathEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
               SaleDeathEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
               SaleDeathEvent.EventComment := EventComment;
               SaleDeathEvent.EventSource  := sSMARTPHONE;
               SaleDeathEvent.EventDate := EventDate;
               SaleDeathEvent.Sold := not IsDeath;
               //   08/04/19 [V5.8 R8.5] /MK Change - PreSale needs to be set here for GetSaleEventInfo to pick up animal.
               SaleDeathEvent.PreSale := False;
               SaleDeathEvent.Customer := CustomerId;
               SaleDeathEvent.Price := Price;
               SaleDeathEvent.Weight := LiveWeight;
               SaleDeathEvent.ColdDeadWt := DeadWeight;
               SaleDeathEvent.Grade := Grade;
               SaleDeathEvent.Culled := GetCulledIdFromCode(CullingCode);
               try
                  SaleDeathEvent.CTSReg := False;
               except
               end;
               SaleDeathEvent.IsSynchronized := True;
               
               SaleDeathEvent.Post;

               AddEventToEventsExt(SaleDeathEvent.EventID,CSaleDeathEvent,ClientId,NatIdNo);
            except
               on e : Exception do
                  begin
                     CreateLogEntry(Format('%s: Failed to create Sale/Death Event.' + cCRLFx2 + e.Message,[NatIdNo]));
                     SaleDeathEvent.Cancel;
                  end
            end;
         finally
            FreeAndNil(SaleDeathEvent);
         end;
      end;
   finally
      FGenlookQuery.Active := True;
   end;
end;

procedure THerdSync.CreateMedicinePurchases(APurchasesNode: IXMLDOMNodeList);
var
   i, j : Integer;
   PurchaseNode : IXMLDOMNode;
   VPANo : string;
   BatchNo : string;
   PurchaseDate : TDateTime;
   ExpiryDate : TDateTime;
   Quantity : double;
   SupplierId : Integer;
   DrugId : Integer;
   CostPerUnit : Double;
   Comment : string;
begin
   if ( APurchasesNode = nil ) then Exit;

   FMedicinesQuery.Active := True;
   FMedicinePurchaseRepository := TMedicinePurchaseRepository.Create(FDatabasePath);
   try

   for i := 0 to APurchasesNode.Length-1 do
      begin
         VPANo := '';
         BatchNo := '';
         Quantity := 0;
         PurchaseDate := 0;
         ExpiryDate := 0;
         SupplierId := 0;
         CostPerUnit := 0;
         Comment := '';

         PurchaseNode := APurchasesNode.item[i];

         for j := 0 to PurchaseNode.childNodes.Get_length-1 do
            begin
               FChildNode := PurchaseNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'vpaNumber' ) then
                        VPANo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'batchNumber' ) then
                        BatchNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'purchaseDate' ) then
                        try
                           PurchaseDate := ( StrToDate(FChildNode.text) );
                        except
                        end
                     else if ( FChildNode.nodeName = 'expiryDate' ) then
                        try
                        ExpiryDate := ( StrToDate(FChildNode.text) );
                        except
                        end
                     else if ( FChildNode.nodeName = 'quantity' ) then
                        try
                        Quantity := StrToFloat(FChildNode.text);
                        except
                        end
                     else if ( FChildNode.nodeName = 'costPerUnit' ) then
                        try
                        CostPerUnit := StrToFloat(FChildNode.text);
                        except
                        end
                     else if ( FChildNode.nodeName = 'supplierId' ) then
                        try
                           SupplierId := StrToInt(FChildNode.text)
                        except
                        end
                     else if ( FChildNode.nodeName = 'comment' ) then
                        Comment := (FChildNode.text)
                  end;
            end;
        if (Length(Trim(VPANo)) = 0) or (PurchaseDate = 0) then Continue;

        DrugId := GetDrugIdByVPANumber(VPANo);
        if (DrugId <=0) then Continue;

        FMedicinePurchaseRepository.CreateMedicinePurchase(
                DrugId, SupplierId, PurchaseDate, ExpiryDate, BatchNo, '', '', Quantity, CostPerUnit, Comment, sSMARTPHONE);

        //   20/03/15 [V5.4 R3.4] /MK Additional Feature - Update medicine quantity and stock.
        FMedicineRepository.UpdateMedicineStock(CostPerUnit,DrugID,Quantity);
      end;
   finally
      FMedicinesQuery.Active := False;
      FreeAndNil(FMedicinePurchaseRepository);
      PurchaseNode := nil;
   end;
end;

function THerdSync.GetDrugIdByVPANumber(const ADrugVPANumber: string): Integer;
var
   ServerDrug : TServerDrug;
begin
   Result := 0;
   if Trim(ADrugVPANumber) = '' then Exit;

   if FMedicinesQuery.Locate('VPANo', ADrugVPANumber, [loCaseInsensitive]) then
      begin
         Result := FMedicinesQuery.Fields[0].AsInteger;
         if not FMedicinesQuery.Fields[3].AsBoolean then
            MarkMedicineInUse(Result);
      end
   else
      begin
         ServerDrug := GetDrugFromServerListing(ADrugVPANumber);
         if (ServerDrug.IsValid) then
            begin
               Result := FMedicineRepository.CreateMedicine(ServerDrug.Description, ServerDrug.VPANumber);

               if (FMedicinesQuery.Active) then
                  begin
                     // Refresh the FMedicinesQuery to include the newly created drug
                     FMedicinesQuery.Active := False;
                     FMedicinesQuery.Active := True;
                  end;
            end;
      end;
end;

procedure THerdSync.AddAncestryInformation(AAnimalNode: IXMLDOMNode);
var
   ParentNode, ChildNode : IXMLDOMNode;
   i : Integer;
   Ident : string;
   ParentExists : Boolean;
   BreedCode : string;
begin
   for i := 1 to 2 do
      begin
         if i = 1 then
            begin
               Ident := 'D';
               ParentNode := FDocument.createElement('dam');
            end
         else
            begin
               Ident := 'S';
               ParentNode := FDocument.createElement('sire');
            end;

         ParentExists := (Length(Trim(FSyncDataQuery.FieldByName(Ident+'AnimalNo').AsString))>0) or
                         (Length(Trim(FSyncDataQuery.FieldByName(Ident+'NatIdNum').AsString))>0) or
                         (Length(Trim(FSyncDataQuery.FieldByName(Ident+'Name').AsString))>0) or
                         (Length(Trim(FSyncDataQuery.FieldByName(Ident+'HerdBookNo').AsString))>0);
         if (not ParentExists) or
            (FSyncDataQuery.FieldByName(Ident+'AnimalDeleted').AsBoolean) or
            (Length(Trim(FSyncDataQuery.FieldByName(Ident+'BreedCode').AsString))<=0) then Exit;

         ChildNode := FDocument.createElement('id');
         ChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName(Ident+'Id').AsInteger));
         ParentNode.appendChild(ChildNode);

         if (Length(Trim(FSyncDataQuery.FieldByName(Ident+'AnimalNo').AsString))>0) then
            begin
               ChildNode := FDocument.createElement('animalNo');
               ChildNode.Set_text(Trim(FSyncDataQuery.FieldByName(Ident+'AnimalNo').AsString));
               ParentNode.appendChild(ChildNode);
            end;

         if (Length(Trim(FSyncDataQuery.FieldByName(Ident+'NatIdNum').AsString))>0) then
            begin
               ChildNode := FDocument.createElement('natIdNo');
               ChildNode.Set_text(Trim(FSyncDataQuery.FieldByName(Ident+'NatIdNum').AsString));
               ParentNode.appendChild(ChildNode);
            end;

         if (Length(Trim(FSyncDataQuery.FieldByName(Ident+'Name').AsString))>0) then
            begin
               ChildNode := FDocument.createElement('name');
               ChildNode.Set_text(FSyncDataQuery.FieldByName(Ident+'Name').AsString);
               ParentNode.appendChild(ChildNode);
            end;

         if (FSyncDataQuery.FieldByName(Ident+'DateOfBirth').AsDateTime>0) then
            begin
               ChildNode := FDocument.createElement('dob');
               ChildNode.Set_text(DateToStr(FSyncDataQuery.FieldByName(Ident+'DateOfBirth').AsDateTime));
               ParentNode.appendChild(ChildNode);
            end;

         if (Length(Trim(FSyncDataQuery.FieldByName(Ident+'HerdBookNo').AsString))>0) then
            begin
               ChildNode := FDocument.createElement('herdBookNo');
               ChildNode.Set_text(FSyncDataQuery.FieldByName(Ident+'HerdBookNo').AsString);
               ParentNode.appendChild(ChildNode);
            end;

         BreedCode := EnforceOfficialBreedCode(FSyncDataQuery.FieldByName(Ident+'BreedCode').AsString);
         ChildNode := FDocument.createElement('breed');
         ChildNode.Set_text(BreedCode);
         OutputBreed(BreedCode);

         ParentNode.appendChild(ChildNode);

         if (Length(Trim(FSyncDataQuery.FieldByName(Ident+'ColourCode').AsString))>0) then
            begin
               ChildNode := FDocument.createElement('colour');
               ChildNode.Set_text(FSyncDataQuery.FieldByName(Ident+'ColourCode').AsString);
               ParentNode.appendChild(ChildNode);
            end;

         ChildNode := FDocument.createElement('sex');
         if (Ident = 'D') then
            ChildNode.Set_text('Female')
         else
            ChildNode.Set_text('Bull');
         ParentNode.appendChild(ChildNode);

         ChildNode := FDocument.createElement('isAncestor');
         // If HerdId differs from FHerdID it means the animal was never actually "in" the herd and
         // must be classified as an ancestor animal
         if (FHerdID <> FSyncDataQuery.FieldByName(Ident+'HerdId').AsInteger) then
            ChildNode.Set_text('true')
         else
            ChildNode.Set_text('false');
         ParentNode.appendChild(ChildNode);

         ChildNode := FDocument.createElement('breeding');
         ChildNode.Set_text(LowerCase(FSyncDataQuery.FieldByName(Ident+'Breeding').AsString));
         ParentNode.appendChild(ChildNode);

         ChildNode := FDocument.createElement('inHerd');
         if (FSyncDataQuery.FieldByName(Ident+'InHerd').AsBoolean) then
            ChildNode.Set_text('true')
         else
            ChildNode.Set_text('false');
         ParentNode.appendChild(ChildNode);

         ChildNode := FDocument.createElement('lactNo');
         if (Ident = 'D') then
           ChildNode.Set_text(IntToStr(FSyncDataQuery.FieldByName('DLactNo').AsInteger));
         ParentNode.appendChild(ChildNode);

         ChildNode := FDocument.createElement('ebi');
         if (Ident = 'D') then
            ChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('DamEBI').AsFloat))
         else
            ChildNode.Set_text(FloatToStr(FSyncDataQuery.FieldByName('SireEBI').AsFloat));
         ParentNode.appendChild(ChildNode);

         AAnimalNode.appendChild(ParentNode);
      end;
end;

function THerdSync.GetCulledIdFromCode(ACode: string): Integer;
begin
   Result := 0;
   if (Trim(ACode) = '') then Exit;
   if FGenlookQuery.Locate('ListType;LookupCode', VarArrayOf([LCulledCode, ACode]),[loCaseInsensitive]) then
      Result := FGenlookQuery.FieldByName('ID').AsInteger;
end;

class procedure THerdSync.ReadAnimalRemedyEvents(AFileName: String);
var
   HerdSync : THerdSync;
   h : Integer;
   HerdIdentity : string;
begin
   HerdSync := THerdSync.Create;
   with HerdSync do
      try
      try
         FDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
         FDocument.load(AFilename);

         FRootNode := FDocument.documentElement;
         if (FRootNode = nil) then Exit;

         if FRootNode.attributes.length = 1 then
            try
               FDatabasePath := IncludeTrailingBackSlash(DefaultDirectory) + FRootNode.attributes.item[0].text;
               if ( not(DirectoryExists(FDatabasePath)) ) then
                  begin
                     CreateLogEntry('Path "'+FDatabasePath+'" does not exist.');
                     Exit;
                  end;
               Initialize(soSyncDataIn);

               if (FileExists(ApplicationPath + '\druglisting.xml')) then
                  begin
                     FDrugListingDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                     FDrugListingDocument.load(ApplicationPath + '\druglisting.xml');
                  end;
            except
              on e:Exception do
                 CreateLogEntry(e.Message);
            end
         else
            begin
               CreateLogEntry('Xml document does not contain the expected format.');
               Exit;
            end;

         FInputHerdsNode := FDocument.getElementsByTagName('herd');

         FAnimalQuery.SQL.Text := 'SELECT Id, NatIdNum, AnimalNo, Sex, LactNo, HerdId, DateOfBirth '+
                                  'FROM Animals '+
                                  'WHERE (AnimalDeleted = False)';
         FAnimalQuery.Open;

         // herds Node
         for h := 0 to FInputHerdsNode.Get_length-1 do
            begin
               FHerdNode := FInputHerdsNode.item[h];
               if ( FHerdNode = nil ) then continue;

               FChildNode := FHerdNode.selectSingleNode('herdIdentity');
               if FChildNode = nil then continue;

               HerdIdentity := FChildNode.Get_text;

               if not (FHerdQuery.Locate('HerdIdentity', HerdIdentity, [loCaseInsensitive])) then continue;

               FHerdID := FHerdQuery.FieldByName('Id').AsInteger;

               FAnimalQuery.Close;
               FAnimalQuery.Open;

               FInputEventsNode := FHerdNode.selectSingleNode('events');
               if (FInputEventsNode <> nil) then
                  CreateHealthEvents(FInputEventsNode.selectNodes('remedyEvent'), False);
            end;

      except
         on e : Exception do
            begin
               CreateLogEntry('ReadHerdSyncData() : '+e.Message);
            end;
      end;

      finally
         if (FEventDataHelper <> nil) then FreeAndNil(FEventDataHelper);
         if (HerdSync <> nil) then FreeAndNil(HerdSync);
      end;
end;


procedure THerdSync.CreatePregDiagEvents(APregDiagsNode: IXMLDOMNodeList);
var
   i, j : Integer;
   EventNode : IXMLDOMNode;
   NatIdNo,
   ClientId,
   EventComment : String;
   EventDate : TDateTime;
   IsPregnant : Boolean;
   DaysInCalf : Integer;
   NumberOfCalves : Integer;
   CalfGenders : string;
   ExistPregDiagDate : TDateTime;
   UpdatedComment : String;
   IsRecheck : Boolean;
   ExistEventId : Integer;

   procedure CreatePregDiagEvent;
   begin
      FPregDiagEvent := TPregDiagEvent.Create('tPregDiag');
      try
         FPregDiagEvent.Append;
         try
            FPregDiagEvent.AnimalID := FAnimalQuery.FieldByName('ID').AsInteger;
            FPregDiagEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
            FPregDiagEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
            FPregDiagEvent.EventDate := EventDate;
            if ( IsPregnant ) then
               begin
                  if (DaysInCalf > -1) then
                     begin
                        FPregDiagEvent.DaysInCalf := DaysInCalf;
                        if (EventComment = 'Pregnancy Diagnosis Event') then
                           FPregDiagEvent.EventComment := 'Pregnant / ' + IntToStr(DaysInCalf) + ' days'
                        else
                           FPregDiagEvent.EventComment := EventComment + ' / ' + IntToStr(DaysInCalf) + ' days';
                     end
                  else
                     FPregDiagEvent.EventComment := EventComment;
               end
            //    23/09/15 [V5.4 R8.6] /SP Bug Fix - Set comment to not pregnant if not pregnant or keep comment user entered on app.
            else if (EventComment = 'Pregnancy Diagnosis Event') then
               FPregDiagEvent.EventComment := 'Not Pregnant'
            else
               FPregDiagEvent.EventComment := EventComment;

            FPregDiagEvent.EventSource := sSMARTPHONE;
            FPregDiagEvent.PregnancyStatus := IsPregnant;
            FPregDiagEvent.NoCalves := NumberOfCalves;
            FPregDiagEvent.CalfType := CalfGenders;
            FPregDiagEvent.IsSynchronized := True;
            FPregDiagEvent.IsRecheck := IsRecheck;

            FPregDiagEvent.Post;

            AddEventToEventsExt(FPregDiagEvent.EventId,CPregDiagEvent,ClientId,NatIdNo);
          except
            FPregDiagEvent.Cancel;
            CreateLogEntry(Format('AnimalId: %d - Failed to create pregnancy diagnosis event.',
            [FAnimalQuery.FieldByName('ID').AsInteger]))
          end;
      finally;
         FPregDiagEvent.Free;
      end;
   end;

begin
   if ( APregDiagsNode = nil ) then Exit;

   for i := 0 to APregDiagsNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         IsPregnant := False;
         DaysInCalf := 0;
         NumberOfCalves := 0;
         CalfGenders := '';
         IsRecheck := False;

         EventNode := APregDiagsNode.item[i];

         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'animalId' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        begin
                            EventComment := FChildNode.text;
                            IsRecheck := Pos('Recheck',EventComment)>-0;
                        end
                     else if ( FChildNode.nodeName = 'isPregnant' ) then
                        IsPregnant := UpperCase(FChildNode.text) = 'TRUE'
                     else if ( FChildNode.nodeName = 'daysInCalf' ) then
                        try
                           DaysInCalf := StrToInt(FChildNode.text);
                        except
                           DaysInCalf := -1;
                        end
                     else if ( FChildNode.nodeName = 'numberOfCalves' ) then
                        try
                           NumberOfCalves := StrToInt(FChildNode.text);
                        except
                        end
                     else if ( FChildNode.nodeName = 'calfGenders' ) then
                        CalfGenders := FChildNode.text;
                  end;
            end;

        if ( NatIdNo = '' ) or (EventDate = 0) then
           begin
              CreateLogEntry('Could not create PD event. Event details are missing.');
              continue;
           end;

        if (not LocateAnimal(NatIdNo)) then
           begin
              CreateLogEntry(Format('Could not create PD event. Animal tag %s not found in the database.',[NatIdNo]));
              AddEventToEventsExt(0,CPregDiagEvent,ClientId,NatIdNo);
              continue;
           end;

         // Only record PD event when if PD event doesn't already exist for specified lactation.
         ExistPregDiagDate := FEventDataHelper.GetFirstEventDate(FAnimalQuery.FieldByName('ID').AsInteger,
                                                                 FAnimalQuery.FieldByName('LactNo').AsInteger,
                                                                 CPregDiagEvent);
         if ( ExistPregDiagDate <= 0 ) then
            CreatePregDiagEvent
         else if ( (EventDate > 0) and (ExistPregDiagDate > 0) ) then
            begin
               if ( EventDate > ExistPregDiagDate ) then
                  begin
                     if ( IsPregnant ) then
                        begin
                           if ( DaysInCalf > -1 ) then
                              begin
                                 if (EventComment = 'Pregnancy Diagnosis Event') then
                                    UpdatedComment := 'Pregnant / ' + IntToStr(DaysInCalf)
                                 else
                                    UpdatedComment := EventComment + ' / ' + IntToStr(DaysInCalf)
                              end
                           else
                              UpdatedComment := EventComment;
                        end
                     else
                        //    23/09/15 [V5.4 R8.6] /SP Bug Fix - Set comment to not pregnant if not pregnant or keep comment user entered on app.
                        begin
                           if (EventComment = 'Pregnancy Diagnosis Event') then
                              UpdatedComment := 'Not Pregnant'
                           else
                              UpdatedComment := EventComment;
                        end;

                     UpdatePregDiagEvent(FAnimalQuery.FieldByName('ID').AsInteger,
                                         FAnimalQuery.FieldByName('LactNo').AsInteger);

                     CreatePregDiagEvent;
                  end
               else
                  begin
                     ExistEventId := FEventDataHelper.GetEventID(FAnimalQuery.FieldByName('ID').AsInteger,
                                                                 FAnimalQuery.FieldByName('LactNo').AsInteger,
                                                                 CPregDiagEvent);
                     AddEventToEventsExt(ExistEventId,CPregDiagEvent,ClientId,NatIdNo);
                  end;
            end;
      end;
end;

procedure THerdSync.OutputBreed(ABreedCode: string);
var
  BreedNode, ChildNode : IXMLDOMNode;
  querystring : string;
begin
   BreedNode := nil;
   ChildNode := nil;

   if (Trim(ABreedCode) = '') OR (FBreedsNode = nil) then
      Exit;

   querystring := '/breed[code="'+ABreedCode+'"]';
   BreedNode := FBreedsNode.selectSingleNode(querystring);
   if (BreedNode <> nil) then Exit;

   if FBreedQuery.Locate('Code', ABreedCode,[]) then
      begin
         BreedNode := FDocument.createElement('breed');

         ChildNode := FDocument.createElement('code');
         ChildNode.Set_text(FBreedQuery.FieldByName('Code').AsString);
         BreedNode.appendChild(ChildNode);

         ChildNode := FDocument.createElement('gestationPeriod');
         ChildNode.Set_text(FBreedQuery.FieldByName('GestationPeriod').AsString);
         BreedNode.appendChild(ChildNode);

         ChildNode := FDocument.createElement('isDairy');
         if (FBreedQuery.FieldByName('EligibleforPremium').AsBoolean) then
            ChildNode.Set_text('false')
         else
            ChildNode.Set_text('true');
         BreedNode.appendChild(ChildNode);

         ChildNode := FDocument.createElement('pedigreeCode');
         ChildNode.Set_text(FBreedQuery.FieldByName('PedigreeBreed').AsString);
         BreedNode.appendChild(ChildNode);

         FBreedsNode.appendChild(BreedNode);
      end
   else
      CreateLogEntry(Format('BreedCode: %s not found.',[ABreedCode]));
end;

function THerdSync.CanAddAnimalNoToNoneHerd(AAnimalNo: string): Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;
         SQL.Clear;
         SQL.Add('SELECT COUNT(ID)');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE (HerdId = :AHerdId)');
         SQL.Add('AND (UPPER(AnimalNo) =:AnimalNo)');
         Params[0].AsInteger := NoneHerdId;
         Params[1].AsString := UPPERCASE(AAnimalNo);
         Open;
         try
            First;
            Result := Fields[0].AsInteger <= 0;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;


procedure THerdSync.AddDrugWithdrawalDates(AAnimalId: Integer;
  AAnimalNode: IXMLDOMNode);
var
   HealthWithDrawalInfo : THealthWithDrawalInfo;
   DrugWithdrawalInfoNode, ChildNode : IXMLDOMNode;
begin
   HealthWithDrawalInfo := GetDrugWithdrawalDates(AAnimalId, Date);

   DrugWithdrawalInfoNode := FDocument.createElement('drugWithdrawalInfo');

   if (HealthWithDrawalInfo.MeatWithDrawalDate>0) then
      begin
         ChildNode := FDocument.createElement('meatWD');
         ChildNode.Set_text(DateToStr(HealthWithDrawalInfo.MeatWithDrawalDate));
         DrugWithdrawalInfoNode.appendChild(ChildNode);
      end;

   if (HealthWithDrawalInfo.MilkWithDrawalDate>0) then
      begin
         ChildNode := FDocument.createElement('milkWD');
         ChildNode.Set_text(DateToStr(HealthWithDrawalInfo.MilkWithDrawalDate));
         DrugWithdrawalInfoNode.appendChild(ChildNode);
      end;

   if (HealthWithDrawalInfo.OrganicMeatWithDrawalDate>0) then
      begin
         ChildNode := FDocument.createElement('organicMeatWD');
         ChildNode.Set_text(DateToStr(HealthWithDrawalInfo.OrganicMeatWithDrawalDate));
         DrugWithdrawalInfoNode.appendChild(ChildNode);
      end;

   if (HealthWithDrawalInfo.OrganicMilkWithDrawalDate>0) then
      begin
         ChildNode := FDocument.createElement('organicMilkWD');
         ChildNode.Set_text(DateToStr(HealthWithDrawalInfo.OrganicMilkWithDrawalDate));
         DrugWithdrawalInfoNode.appendChild(ChildNode);
      end;

   AAnimalNode.appendChild(DrugWithdrawalInfoNode);
end;

{function THerdSync.DuplicateAnimalNumbersDetected: Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := FDatabasePath;
         try
         SQL.Clear;
         SQL.Add('DROP TABLE "DupAnimals" ');
         ExecSQL;
         except
         end;

         SQL.Clear;
         SQL.Add('CREATE TABLE "DupAnimals" ');
         SQL.Add('  ( AnimalNo CHAR(10) )');
         ExecSQL;

         SQL.Clear;
         SQL.Add('INSERT INTO DupAnimals (AnimalNo)');
         SQL.Add('SELECT A.AnimalNo');
         SQL.Add('FROM Animals A');
         SQL.Add('GROUP BY A.AnimalNo');
         SQL.Add('HAVING COUNT(A.AnimalNo)>1');
         ExecSQL;

         SQL.Clear;
         SQL.Add('SELECT COUNT(AnimalNo)');
         SQL.Add('FROM DupAnimals');
         Open;
         try
            First;
            Result := (Fields[0].AsInteger>0);
         finally
            Close;
         end;
      finally
         Free;
      end;
end;}

function THerdSync.GetDrugWithdrawalDates(const AID: Integer;
  ACheckDate: TDateTime): THealthWithDrawalInfo;
var
   RecID, i : Integer;
   MilkDateToUse,
   MeatDateToUse,
   OrganicMilkDateToUse,
   OrganicMeatDateToUse : TDateTime;
   RecFound : Boolean;
   WithdrawalDate : TDateTime;
   WithdrawalDays : Integer;
   NoOfDaysAdministered : Integer;
begin
   RecID := 0;
   MilkDateToUse := 0;
   MeatDateToUse := 0;
   OrganicMilkDateToUse := 0;
   OrganicMeatDateToUse := 0;

   FDrugWithdrawalQuery.Filter := Format('AnimalId = %d', [AID]);
   FDrugWithdrawalQuery.Filtered := True;
   FillChar(Result, SizeOf(THealthWithDrawalInfo), 0);
   with FDrugWithdrawalQuery do
      try
         RecFound := FindFirst;
         while RecFound do
            begin
               for i := 1 to 4 do
                  begin
                     NoOfDaysAdministered := 1;
                     case i of
                        1 : begin
                               //   07/12/16 [V5.5 R2.1] /MK Bug Fix - Only assign MaxMeatWithDrawal Date if drug is not an NA drug.
                               if ( not(FDrugWithdrawalQuery.FieldByName('MeatN_A_Drug').AsBoolean) ) then
                                  begin
                                     WithdrawalDays := FDrugWithdrawalQuery.FieldByName('MeatDays').AsInteger;
                                     if ( WithdrawalDays > 0 ) then
                                        begin
                                           if ( FDrugWithdrawalQuery.FieldByName('NoDays').AsInteger > 1 )  then
                                              NoOfDaysAdministered := FDrugWithdrawalQuery.FieldByName('NoDays').AsInteger;

                                           WithdrawalDate := CalcDrugWithdrawalDate(
                                                               FDrugWithdrawalQuery.FieldByName('EventDate').AsDateTime,
                                                               WithdrawalDays,
                                                               NoOfDaysAdministered);

                                           if ( WithdrawalDate > MeatDateToUse ) then
                                              begin
                                                 RecID := FDrugWithdrawalQuery.FieldByName('ID').AsInteger;
                                                 MeatDateToUse := WithdrawalDate;
                                              end;
                                        end;
                                  end;
                            end;
                        2 : begin
                               //   07/12/16 [V5.5 R2.1] /MK Bug Fix - Only assign MaxMilkWithDrawal Date if drug is not an NA drug.
                               if ( not(FDrugWithdrawalQuery.FieldByName('MilkN_A_Drug').AsBoolean) ) then
                                  begin
                                     WithdrawalDays := FDrugWithdrawalQuery.FieldByName('MilkDays').AsInteger;
                                     if ( WithdrawalDays > 0 ) then
                                        begin
                                           if ( FDrugWithdrawalQuery.FieldByName('NoDays').AsInteger > 1 ) then
                                              NoOfDaysAdministered := FDrugWithdrawalQuery.FieldByName('NoDays').AsInteger;

                                           WithdrawalDate := CalcDrugWithdrawalDate(
                                                               FDrugWithdrawalQuery.FieldByName('EventDate').AsDateTime,
                                                               WithdrawalDays,
                                                               NoOfDaysAdministered);

                                           if ( WithdrawalDate > MilkDateToUse ) then
                                              begin
                                                 RecID := FDrugWithdrawalQuery.FieldByName('ID').AsInteger;
                                                 MilkDateToUse := WithdrawalDate;
                                              end;
                                        end;
                                  end;
                            end;
                        // include organic withdrawal dates
                        3 : begin
                               WithdrawalDays := FDrugWithdrawalQuery.FieldByName('OrganicMeatDays').AsInteger;
                               if (WithdrawalDays>0) then
                                  begin
                                     if ( FDrugWithdrawalQuery.FieldByName('NoDays').AsInteger > 1 )  then
                                        NoOfDaysAdministered := FDrugWithdrawalQuery.FieldByName('NoDays').AsInteger;

                                     WithdrawalDate := CalcDrugWithdrawalDate(
                                                         FDrugWithdrawalQuery.FieldByName('EventDate').AsDateTime,
                                                         WithdrawalDays,
                                                         NoOfDaysAdministered);

                                     if (WithdrawalDate> OrganicMeatDateToUse) then
                                        begin
                                           RecID := FDrugWithdrawalQuery.FieldByName('ID').AsInteger;
                                           OrganicMeatDateToUse := WithdrawalDate;
                                        end;
                                  end
                            end;
                        4 : begin
                               WithdrawalDays := FDrugWithdrawalQuery.FieldByName('OrganicMilkDays').AsInteger;
                               if (WithdrawalDays>0) then
                                  begin
                                     if ( FDrugWithdrawalQuery.FieldByName('NoDays').AsInteger > 1 ) then
                                        NoOfDaysAdministered := FDrugWithdrawalQuery.FieldByName('NoDays').AsInteger;

                                     WithdrawalDate := CalcDrugWithdrawalDate(
                                                         FDrugWithdrawalQuery.FieldByName('EventDate').AsDateTime,
                                                         WithdrawalDays,
                                                         NoOfDaysAdministered);

                                     if (WithdrawalDate> OrganicMilkDateToUse) then
                                        begin
                                           RecID := FDrugWithdrawalQuery.FieldByName('ID').AsInteger;
                                           OrganicMilkDateToUse := WithdrawalDate;
                                        end;
                                  end;
                            end;
                     end;
                  end;
               RecFound := FindNext;
            end;
      finally
         if Locate('ID', RecID, []) then
            begin
               Result.DryOff := ( FDrugWithdrawalQuery.FieldByName('EventType').AsInteger = cDryOffEvent );
               Result.StartDate := FDrugWithdrawalQuery.FieldByName('EventDate').AsDateTime;
               Result.NoDaysSinceStart := Trunc(Date - Result.StartDate);
               Result.MilkWithDrawalDate := MilkDateToUse;
               Result.MeatWithDrawalDate := MeatDateToUse;
               Result.OrganicMilkWithDrawalDate := OrganicMilkDateToUse;
               Result.OrganicMeatWithDrawalDate := OrganicMeatDateToUse;
            end;
      end;
end;

procedure THerdSync.FlagAsSynchronized(AIds: array of Integer;
  ASyncType: Integer);
var
   Index, ArrayLen : Integer;
begin
   if (@AIds = nil) or ((Length(AIds)=0) or (FSyncIds = nil) or (not FSyncIds.Active)) then Exit;
   ArrayLen := Length(AIds);
   for Index := 0 to ArrayLen-1 do
      begin
         FSyncIds.Append;
         FSyncIds.Fields[0].AsInteger := AIds[Index];
         FSyncIds.Fields[1].AsInteger := ASyncType;
         FSyncIds.Post;
      end;
end;

procedure THerdSync.CreateNewIdEvents(ANewIdsNode: IXMLDOMNodeList);
var
   i, j : Integer;
   EventNode : IXMLDOMNode;
   NatIdNo,
   ClientId,
   EventComment : String;
   EventDate : TDateTime;

   NewIDEvent : TNewIDEvent;
begin
   if ( ANewIdsNode = nil ) then Exit;

   for i := 0 to ANewIdsNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         EventComment := '';

         EventNode := ANewIdsNode.item[i];

         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'animalId' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        EventComment := FChildNode.text;
                  end;
            end;

        if ( NatIdNo = '' ) or (EventDate = 0) then
           begin
              CreateLogEntry('Could not create NewId event. Event details are missing.');
              continue;
           end;

        if (not LocateAnimal(NatIdNo)) then
           begin
              CreateLogEntry(Format('Could not create NewId event. Animal tag %s not found in the database.',[NatIdNo]));
              AddEventToEventsExt(0,CNewIDEvent,ClientId,NatIdNo);
              continue;
           end;

        if not( FEventDataHelper.HasEventRecordedForDate(FAnimalQuery.FieldByName('ID').AsInteger,
                                                         CNewIDEvent,
                                                         EventDate)) then
           begin
              NewIDEvent := TNewIDEvent.Create('tNewId');
              try
                 NewIDEvent.Append;
                 try
                    NewIDEvent.AnimalID := FAnimalQuery.FieldByName('ID').AsInteger;
                    NewIDEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
                    NewIDEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
                    NewIDEvent.EventDate := EventDate;
                    NewIDEvent.EventSource := sSMARTPHONE;
                    NewIDEvent.IsSynchronized := True;
                    NewIDEvent.Post;

                    AddEventToEventsExt(NewIDEvent.EventID,CNewIDEvent,ClientId,NatIdNo);
                  except
                    NewIDEvent.Cancel;
                    CreateLogEntry(Format('AnimalId: %d - Failed to create New Id event.',
                       [FAnimalQuery.FieldByName('ID').AsInteger]));
                  end;
              finally;
                 NewIDEvent.Free;
              end;
           end;
      end;
end;

procedure THerdSync.CreateHerdEvalEvents(AEvalNode : IXMLDOMNode);
var
   EvalNodeList : IXMLDOMNodeList;
   EvalModifiedDateNode,
   EvaluationsHeadNode,
   EventNode : IXMLDOMNode;
   dEvalModifedDate : TDateTime;
   i, j, iAnimalID : Integer;
   sNatID, sEBI, sTableName, sFieldName : String;
   fEBI : Double;
   qExistEBIRec,
   qUpdateEBIRec : TQuery;
begin
   if ( AEvalNode = nil ) then Exit;

   EvalModifiedDateNode := AEvalNode.selectSingleNode('modifiedOn');
   FChildNode := EvalModifiedDateNode.childNodes[0];
   if ( FChildNode <> nil ) and ( Length(FChildNode.Text) > 0 ) then
      dEvalModifedDate := StrToDate(FChildNode.Text)
   else
      dEvalModifedDate := Date;

   EvaluationsHeadNode := AEvalNode.selectSingleNode('evaluations');
   if ( EvaluationsHeadNode <> nil ) then
      begin
         qExistEBIRec := TQuery.Create(nil);
         qUpdateEBIRec := TQuery.Create(nil);
         try
            qExistEBIRec.DatabaseName := AliasName;
            qUpdateEBIRec.DatabaseName := AliasName;

            EvalNodeList := EvaluationsHeadNode.selectNodes('evaluation');
            for i := 0 to EvalNodeList.length-1 do
               begin
                  EventNode := EvalNodeList.item[i];
                  sNatID := '';
                  sEBI := '';
                  if ( EventNode.childNodes.Get_length > 0 ) then
                     for j := 0 to EventNode.childNodes.Get_length-1 do
                        begin
                           FChildNode := EventNode.childNodes[j];
                           if ( FChildNode <> nil ) then
                              begin
                                 if ( FChildNode.nodeName = 'natIdNo' ) then
                                    sNatID := FChildNode.text
                                 else if ( FChildNode.nodeName = 'ebi' ) then
                                    sEBI := FChildNode.text;
                              end;
                        end;

                  if ( Length(sNatID) = 0 ) or ( Length(sEBI) = 0 ) then
                     begin
                        CreateLogEntry('Could not update EBI record. EBI details are missing.');
                        continue;
                     end;

                  if ( not(LocateAnimal(sNatID)) ) then
                     begin
                        CreateLogEntry(Format('Could not update EBI record for animal as Animal tag %s not found in current herd.',[sNatID]));
                        continue;
                     end;

                  if ( UpperCase(FAnimalQuery.FieldByName('Sex').AsString) = 'FEMALE' ) then
                     begin
                        sTableName := 'CowExt';
                        sFieldName := 'EBI';
                     end
                  else if ( UpperCase(FAnimalQuery.FieldByName('Sex').AsString) = 'BULL' ) then
                     begin
                        sTableName := 'BullExt';
                        sFieldName := 'RBI';
                     end;

                  qExistEBIRec.Close;
                  qExistEBIRec.SQL.Clear;
                  qExistEBIRec.SQL.Add('SELECT *');
                  qExistEBIRec.SQL.Add('FROM '+sTableName);
                  qExistEBIRec.SQL.Add('WHERE AnimalID = '+IntToStr(FAnimalQuery.FieldByName('ID').AsInteger));
                  qExistEBIRec.Open;
                  if ( qExistEBIRec.RecordCount > 0 ) then
                     begin
                        qUpdateEBIRec.Close;
                        qUpdateEBIRec.SQL.Clear;
                        qUpdateEBIRec.SQL.Add('UPDATE '+sTableName);
                        qUpdateEBIRec.SQL.Add('SET '+sFieldName+' = '+sEBI);
                        qUpdateEBIRec.SQL.Add('WHERE AnimalID = '+IntToStr(FAnimalQuery.FieldByName('ID').AsInteger));
                        qUpdateEBIRec.ExecSQL;
                     end
                  else
                     begin
                        qUpdateEBIRec.Close;
                        qUpdateEBIRec.SQL.Clear;
                        qUpdateEBIRec.SQL.Add('INSERT INTO '+sTableName+' (AnimalID, '+sFieldName+')');
                        qUpdateEBIRec.SQL.Add('VALUES ('+IntToStr(FAnimalQuery.FieldByName('ID').AsInteger)+', '+sEBI+')');
                        qUpdateEBIRec.ExecSQL;
                     end;
               end;
         finally
            FreeAndNil(qExistEBIRec);
            FreeAndNil(qUpdateEBIRec);
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('UPDATE SyncDefaults');
                  SQL.Add('SET herdEvaluationModifiedOn = :ModDate');
                  Params[0].AsDateTime := dEvalModifedDate;
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowDebugMessage(e.Message);
                  end;
               finally
                  Free;
               end;
         end;
      end;
end;

procedure THerdSync.AddSyncWarning(ANatIdNo, AWarning: string);
begin
   if (FSyncWarnings = nil) or not(FSyncWarnings.Active) then Exit;

   FSyncWarnings.Append;
   try
      FSyncWarnings.FieldByName('NatIdNo').AsString := ANatIdNo;
      FSyncWarnings.FieldByName('Warning').AsString := AWarning;
      FSyncWarnings.FieldByName('RecordTimeStamp').AsDateTime := Now();
      FSyncWarnings.FieldByName('IsCurrent').AsBoolean := True;
      FSyncWarnings.Post;
   except
      FSyncWarnings.Cancel;
      CreateLogEntry('Unable to create sync warning record.');
   end;
end;

procedure THerdSync.StoreAnimalCart(AAnimalCartNode: IXMLDomNode);
var
   i, AnimalId : Integer;
   AnimalNode : IXMLDOMNode;
begin
   if ( AAnimalCartNode = nil ) or (FAnimalCart = nil) or (not(FAnimalCart.Active)) then Exit;

   try
      for i := 0 to AAnimalCartNode.childNodes.Length-1 do
         begin
            AnimalId := 0;
            try
               AnimalNode := AAnimalCartNode.childNodes[i];
               if ( AnimalNode <> nil) then
                  begin
                     FChildNode := AnimalNode.childNodes[0];
                     if (FChildNode <> nil) then
                        begin
                           AnimalId := StrToInt(FChildNode.Text);
                        end;
                  end;

              if (AnimalId>0) then
                 begin
                    FAnimalCart.Append;
                    FAnimalCart.FieldByName('AnimalId').AsInteger := AnimalId;
                    FAnimalCart.Post;
                 end;
            except
            end;
         end;
   except
      CreateLogEntry('ReadHerdSyncData() : Error processing animal cart.');
   end;
end;

procedure THerdSync.UpdateAnimalRegistrationStatus(ADamId, ADamLact : Integer; ACalvingDate :TDateTime;
   ACalfId : Integer; AIsRegistered : Boolean;
   AActionDate : TDateTime; AConfirmationId : string);
var
   EventId : Integer;
   FieldToModify1, FieldToModify2, FieldToModify3, FieldToModify4 : string;
begin
   FieldToModify1 := '';
   FieldToModify2 := '';
   FieldToModify3 := '';
   FieldToModify4 := '';

   with TQuery.Create(nil) do
   try
      DatabaseName := FDatabasePath;
      SQL.Add('SELECT E.Id, C.ID1, C.ID2, C.ID3, C.ID4');
      SQL.Add('FROM Events E');
      SQL.Add('INNER JOIN Calvings C ON (E.Id=C.EventId)');
      SQL.Add('WHERE (E.EventType = 5)');
      SQL.Add('AND (E.AnimalId = :AAnimalId)');
      SQL.Add('AND (E.EventDate = :AEventDate)');
      SQL.Add('AND (E.AnimalLactNo = :ALactNo)');
      Params[0].AsInteger := ADamId;
      Params[1].AsDateTime := ACalvingDate;
      Params[2].AsInteger := ADamLact;
      Open;

      First;
      EventId := Fields[0].AsInteger;
      if (EventId>0) then
         begin
            if ( FieldByName('ID1').AsInteger = ACalfId ) then
               begin
                  FieldToModify1 := 'ID1Notified';
                  FieldToModify2 := 'ID1NINotifyDateTime';
                  FieldToModify3 := 'ID1NIWSNotified';
                  FieldToModify4 := 'ID1NIWSConfirmId';
               end
            else if ( FieldByName('ID2').AsInteger = ACalfId ) then
               begin
                  FieldToModify1 := 'ID2Notified';
                  FieldToModify2 := 'ID2NINotifyDateTime';
                  FieldToModify3 := 'ID2NIWSNotified';
                  FieldToModify4 := 'ID2NIWSConfirmId';
               end
            else if ( FieldByName('ID3').AsInteger = ACalfId ) then
               begin
                  FieldToModify1 := 'ID3Notified';
                  FieldToModify2 := 'ID3NINotifyDateTime';
                  FieldToModify3 := 'ID3NIWSNotified';
                  FieldToModify4 := 'ID3NIWSConfirmId';
               end
            else if ( FieldByName('ID4').AsInteger = ACalfId ) then
               begin
                  FieldToModify1 := 'ID4Notified';
                  FieldToModify2 := 'ID4NINotifyDateTime';
                  FieldToModify3 := 'ID4NIWSNotified';
                  FieldToModify4 := 'ID4NIWSConfirmId';
               end;

            if ( FieldToModify1 <> '' ) then
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE Calvings SET ');
                  SQL.Add(FieldToModify1 + ' = :val1,');
                  SQL.Add(FieldToModify2 + ' = :val2,');
                  SQL.Add(FieldToModify3 + ' = :val3,');
                  SQL.Add(FieldToModify4 + ' = :val4');
                  SQL.Add('WHERE EventId = :val5');
                  Params[0].AsBoolean := AIsRegistered;
                  Params[1].AsDateTime := AActionDate;
                  Params[2].AsBoolean := AIsRegistered;
                  Params[3].AsString := AConfirmationId;
                  Params[4].AsInteger := EventId;

                  ExecSQL;
               end;
         end;
   finally
      Close;
      Free;
   end;

end;

procedure THerdSync.UpdateAnimalRegistrationStatus(const AAnimalId : Integer;
  AIsRegistered: Boolean; ALastActionDate: TDateTime;
  AConfirmationId: string);
var
   EventId : Integer;
   IdPrefix : string;

   procedure GetCalvingDetailByAnimalId();
   begin
      IdPrefix := '';
      EventId := 0;
      // get the calving record
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT * FROM Calvings');
            SQL.Add('WHERE ((Id1 =:AnimalId) OR ');
            SQL.Add('       (Id2 =:AnimalId) OR ');
            SQL.Add('       (Id3 =:AnimalId) OR ');
            SQL.Add('       (Id4 =:AnimalId)) ');
            Params[0].AsInteger := AAnimalId;
            Open;

            try
               if (RecordCount = 1) then
                  begin
                     EventId := FieldByName('EventID').AsInteger;
                     if ( FieldByName('ID1').AsInteger = AAnimalId ) then
                        IdPrefix := 'ID1'
                     else if ( FieldByName('ID2').AsInteger = AAnimalId ) then
                        IdPrefix := 'ID2'
                     else if ( FieldByName('ID3').AsInteger = AAnimalId ) then
                        IdPrefix := 'ID3'
                     else if ( FieldByName('ID4').AsInteger = AAnimalId ) then
                        IdPrefix := 'ID4';
                  end
            finally
               Close;
            end;
         finally
            Free;
         end;

   end;

begin
   if (AAnimalId <= 0) then
      Exit;

   // Possible status values;
   // 2 = Error
   // 3 = Accepted
   // 4 = Queried
   // 5 = Deleted
   with TQuery.Create(nil) do
      try
         try
            DatabaseName := AliasName;

            GetCalvingDetailByAnimalId();
            if (IdPrefix = '') or (EventId = 0) then Exit;

            // Update the calvings table if registration was accepted or queried.
            SQL.Clear;
            SQL.Add('UPDATE Calvings SET ');
            SQL.Add(IdPrefix+'Notified = :AIsRegistered, ');
            SQL.Add(IdPrefix+'NIWSNotified = :AIsRegistered,');
            SQL.Add(IdPrefix+'NINotifyDateTime = :ALastActionDate,');
            SQL.Add(IdPrefix+'NIWSConfirmId = :ConfirmId');
            SQL.Add('WHERE (EventId =:EventId)');
            Params[0].AsBoolean := AIsRegistered;
            Params[1].AsBoolean := AIsRegistered;
            Params[2].AsDateTime := ALastActionDate;
            Params[3].AsString := AConfirmationId;
            Params[4].AsInteger := EventId;
            ExecSQL;
         except
            on e : exception do
            begin
                if (IswinHerdDebugging) then
                   ApplicationLog.LogException(e)
                else
                   ApplicationLog.LogError(Format('UpdateAnimalRegistrationStatus() failed. [AnimalId:%d]',[AAnimalId]));
            end;
         end;
      finally
         Free;
      end;
end;

procedure THerdSync.SetLastHerdSyncDate(AHerdNumber : string; ALastSyncDate : string);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Owners SET LastSyncDate = :ALastSyncDate');
         SQL.Add('WHERE HerdIdentity = :AHerdNumber');
         Params[0].AsString := ALastSyncDate;
         Params[1].AsString := AHerdNumber;
         ExecSQL;
      finally
         Free;
      end;
end;

function THerdSync.GetLastHerdSyncDate(AHerdNumber: string): string;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT LastSyncDate');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE HerdIdentity = :AHerdNumber');
         Params[0].AsString := AHerdNumber;
         Open;
         try
            First;
            Result := Fields[0].AsString;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

class function THerdSync.DBRecordCount: Integer;
var
   i : Integer;
   sFieldName,
   sTableName : String;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         for i := AnimalSync to EventsExtSync do
            begin
               if i = AnimalSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'Animals';
                  end
               else if i = EventSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'Events';
                  end
               else if i = SupplierSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'SuppliersBreeders';
                  end
               else if i = BuyerSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'Buyers';
                  end
               else if i = MilkLactSync then
                  begin
                     sFieldName := 'MilkDiskID';
                     sTableName := 'MilkDisk';
                  end
               else if i = GenLookSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'GenLook';
                  end
               else if i = VetAdminSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'MedAdmin';
                  end
               else if i = CustomerSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'Customers';
                  end
               else if i = GroupSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'Grps';
                  end
               else if i = MedicineSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'Medicine';
                  end
               else if i = DeletedEventsSync then
                  begin
                     sFieldName := 'EventId';
                     sTableName := 'ICBFDelete';
                  end
              else if i = FeedTypeSync then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'FeedTypes';
                  end
              else if i = DeletedGrps then
                  begin
                     sFieldName := 'GroupID';
                     sTableName := 'DeletedGrps';
                  end
              else if i = MediPurch then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'MediPur';
                  end
              else if i = FdStkEvents then
                  begin
                     sFieldName := 'ID';
                     sTableName := 'FdStkEvents';
                  end
               else if i = EventsExtSync then
                  begin
                     sFieldName := 'EventId';
                     sTableName := 'EventsExt';
                  end;
               SQL.Clear;
               SQL.Add('SELECT Count('+sFieldName+')');
               SQL.Add('FROM '+sTableName+'');
               if ( UpperCase(sTableName) = 'EVENTS' ) then
                  begin
                     SQL.Add('WHERE ( (EventSource <> '+IntToStr(sSMARTPHONE)+')');
                     SQL.Add('         OR (EventSource IS NULL) ');
                     SQL.Add('         OR (EventSource = 0) )');
                  end;
               try
                  Open;
                  Result := Result + Fields[0].AsInteger;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;
      finally
         Free;
      end;
end;

function THerdSync.BullUsed(const AAnimalId: Integer): Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Distinct(S.ServiceBull)');
         SQL.Add('FROM Services S');
         SQL.Add('WHERE (S.ServiceBull=:AAnimalId)');
         Params[0].AsInteger := AAnimalId;
         Open;
         try
            First;
            Result := Fields[0].AsInteger>0;

            if (not Result) then
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT Distinct(B.PlannedBull)');
                  SQL.Add('FROM Bullings B');
                  SQL.Add('WHERE (B.PlannedBull=:AAnimalId)');
                  Params[0].AsInteger := AAnimalId;
                  Open;
                  try
                     First;
                     Result := Fields[0].AsInteger>0;
                  finally
                     Close;
                  end;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure THerdSync.LoadNatIdNumMultiInstances(const AHerdId : Integer);
begin
   if (FMultiInstancesList = nil) then
      FMultiInstancesList := TStringList.Create;
   FMultiInstancesList.Clear;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select NatIdNum, Count(NatIdNum)');
         SQL.Add('From Animals');
         SQL.Add('Where HerdId =:HerdId');
         SQL.Add('Group By NatIdNum');
         SQL.Add('Having Count(NatIdNum)>1');
         Params[0].AsInteger := AHerdId;
         try
            Open;
            try
               First;
               while not eof do
                  begin
                     if (Fields[1].AsInteger>1) then // should always be given we've specified in having clause
                        FMultiInstancesList.Add(Fields[0].AsString);
                     Next;
                  end;
            finally
               Close;
            end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdSync.LocateAnimal(ANatIdNum: string): Boolean;
begin
   // So what if we didn't filter the query until there was no match. thats the hope i had.
   Result := False;
   if (FAnimalQuery = nil) then Exit;
   try
      if ( FAnimalQuery.Filtered ) then
         FAnimalQuery.Filtered := False;

      Result := ( FAnimalQuery.Locate('NatIDNum;InHerd', VarArrayOf([ANatIdNum,true]), [loCaseInsensitive]) or
                  FAnimalQuery.Locate('SearchNatId;InHerd', VarArrayOf([StripAllNomNumAlpha(ANatIdNum),true]), [loCaseInsensitive]) );
      if ( Result ) then Exit;

      FAnimalQuery.Filter := '(NatIdNum = '''+ANatIdNum+''') OR (SearchNatId = '''+StripAllNomNumAlpha(ANatIdNum)+''')';
      FAnimalQuery.Filtered := True;
      Result := FAnimalQuery.FindLast;
      if (not Result) then
         begin
            FAnimalQuery.Filter := '';
            FAnimalQuery.Filtered := False;
         end;
   except
      on e : Exception do
         begin
            ApplicationLog.LogError('Error locating animal NatIDNum '+ANatIdNum);
            ApplicationLog.LogException(e);
            ApplicationLog.LogError(e.Message);
         end;
   end;
end;

function THerdSync.IsMultiInstanceNatIdNum(
  const ANatIdNum: string): Boolean;
begin
   Result := FMultiInstancesList.IndexOf(ANatIdNum)>-1;
end;

procedure THerdSync.UpdatePregDiagEvent(AAnimalID, AAnimalLactNo : Integer);
var
   CurrPregDiagID : Integer;
   qUpdateExistPregDiag : TQuery;
begin
   qUpdateExistPregDiag := TQuery.Create(nil);
   with qUpdateExistPregDiag do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID');
         SQL.Add('FROM Events E ');
         SQL.Add('WHERE (E.AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (E.AnimalLactNo = '+IntToStr(AAnimalLactNo)+')');
         SQL.Add('AND   (E.EventType = '+IntToStr(CPregDiagEvent)+')');
         Open;
         try
            First;
            CurrPregDiagID := Fields[0].AsInteger;
         finally
            Close;
         end;

         //   30/10/15 [V5.4 R9.7] /MK Change - Set the EventType to a new event type to allow for another PD to go in on the same lactation.
         if ( CurrPregDiagID > 0 ) then
            try
                SQL.Clear;
                SQL.Add('UPDATE Events');
                SQL.Add('SET EventType = EventType + 100');
                SQL.Add('WHERE ID = :CurrPregDiagID');
                Params[0].AsInteger := CurrPregDiagID;
                ExecSQL;
            except
               on E : Exception do
                  begin
                     ShowMessage(e.Message);
                  end;
            end;
      finally
         Free;
      end;
end;

class function THerdSync.DBModifiedCount: Integer;
var
   i : Integer;
   sTableName : String;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
      try
         DatabaseName := AliasName;
         for i := AnimalSync to EventsExtSync do
            begin
               if i = AnimalSync then
                  sTableName := 'Animals'
               else if i = EventSync then
                 sTableName := 'Events'
               else if i = SupplierSync then
                     sTableName := 'SuppliersBreeders'
               else if i = BuyerSync then
                  sTableName := 'Buyers'
               else if i = MilkLactSync then
                  sTableName := 'MilkDisk'
               else if i = GenLookSync then
                  sTableName := 'GenLook'
               else if i = VetAdminSync then
                  sTableName := 'MedAdmin'
               else if i = CustomerSync then
                  sTableName := 'Customers'
               else if i = GroupSync then
                  sTableName := 'Grps'
               else if i = MedicineSync then
                  sTableName := 'Medicine'
               else if i = DeletedEventsSync then
                  sTableName := 'ICBFDelete'
               else if i = FeedTypeSync then
                  sTableName := 'FeedTypes'
               else if i = DeletedGrps then
                  sTableName := 'DeletedGrps'
               else if i = MediPurch then
                  sTableName := 'MediPur'
               else if i = FdStkEvents then
                  sTableName := 'FdStkEvents'
               else if i = EventsExtSync then
                  sTableName := 'EventsExt';

               SQL.Clear;
               SQL.Add('SELECT Count(IsSynchronized)');
               SQL.Add('FROM '+sTableName+'');
               SQL.Add('WHERE IsSynchronized = FALSE');
               if ( UpperCase(sTableName) = 'EVENTS' ) then
                  begin
                     SQL.Add('AND ( (EventSource <> '+IntToStr(sSMARTPHONE)+')');
                     SQL.Add('       OR (EventSource IS NULL) ');
                     SQL.Add('       OR (EventSource = 0) )');
                  end;
               Open;

               Result := Result + Fields[0].AsInteger;
            end;
      except

      end;
      finally
         Free;
      end;
end;

procedure THerdSync.CreateFeedPurchases(APurchasesNode: IXMLDOMNodeList);
var
   i, j : Integer;
   PurchaseNode : IXMLDOMNode;
   BatchNo : string;
   PurchaseDate : TDateTime;
   ExpiryDate : TDateTime;
   Quantity : double;
   SupplierId : Integer;
   FeedTypeId : Integer;
   UnitCost : Double;
   Comment : string;
begin
   if ( APurchasesNode = nil ) then Exit;

   FMedicinesQuery.Active := True;
   FFeedPurchaseRepository := TFeedPurchaseRepository.create(FDatabasePath);
   try

   for i := 0 to APurchasesNode.Length-1 do
      begin
         BatchNo := '';
         Quantity := 0;
         PurchaseDate := 0;
         ExpiryDate := 0;
         SupplierId := 0;
         UnitCost := 0;
         Comment := '';

         PurchaseNode := APurchasesNode.item[i];

         for j := 0 to PurchaseNode.childNodes.Get_length-1 do
            begin
               FChildNode := PurchaseNode.childNodes[j];
               if ( FChildNode = nil ) then continue;

               if ( FChildNode.nodeName = 'feedTypeId' ) then
                  try
                  FeedTypeId := StrToInt(FChildNode.text);
                  except
                  end
               else if ( FChildNode.nodeName = 'batchNumber' ) then
                  BatchNo := (FChildNode.text)
               else if ( FChildNode.nodeName = 'purchaseDate' ) then
                  try
                     PurchaseDate := ( StrToDate(FChildNode.text) );
                  except
                  end
               else if ( FChildNode.nodeName = 'expiryDate' ) then
                  try
                  ExpiryDate := ( StrToDate(FChildNode.text) );
                  except
                  end
               else if ( FChildNode.nodeName = 'quantity' ) then
                  try
                  Quantity := StrToFloat(FChildNode.text);
                  except
                  end
               else if ( FChildNode.nodeName = 'unitCost' ) then
                  try
                  UnitCost := StrToFloat(FChildNode.text);
                  except
                  end
               else if ( FChildNode.nodeName = 'supplierId' ) then
                  try
                     SupplierId := StrToInt(FChildNode.text)
                  except
                  end
               else if ( FChildNode.nodeName = 'comment' ) then
                  Comment := (FChildNode.text)
            end;

        if (PurchaseDate = 0) or (not FeedTypeOnFile(FeedTypeId)) then Continue;

        FFeedPurchaseRepository.CreatePurchase(
                FeedTypeId, SupplierId, PurchaseDate, ExpiryDate, BatchNo, Quantity, UnitCost, Comment, sSMARTPHONE);
      end;
   finally
      FreeAndNil(FFeedPurchaseRepository);
      PurchaseNode := nil;
   end;
end;

function THerdSync.FeedTypeOnFile(
  const AFeedTypeId: Integer): Boolean;
begin
   Result := False;
   if AFeedTypeId <= 0 then Exit;

   with TQuery.Create(nil) do
      try
         DatabaseName := 'Kingswd';
         SQL.Clear;
         SQL.Add('SELECT Id, Name FROM FeedTypes');
         SQL.Add('WHERE (Id = :Id)');
         Params[0].AsInteger := AFeedTypeId;
         Open;
         try
            Result := (RecordCount=1);
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function THerdSync.GetCullingStatus(AAnimalId: Integer): Boolean;
begin
   Result := False;
   if ( FToBeCulledQuery = nil ) then
      begin
         FToBeCulledQuery := TQuery.Create(nil);
         FToBeCulledQuery.DatabaseName := AliasName;
         FToBeCulledQuery.SQL.Clear;
         FToBeCulledQuery.SQL.Add('SELECT A.ID, A.LactNo, E.EventDate CullingDate');
         FToBeCulledQuery.SQL.Add('FROM Animals A');
         FToBeCulledQuery.SQL.Add('INNER JOIN Events E ON (E.AnimalId=A.Id)');
         FToBeCulledQuery.SQL.Add('WHERE (E.EventType=24)');
         FToBeCulledQuery.SQL.Add('AND   (E.IsSynchronized=False)');
         FToBeCulledQuery.SQL.Add('AND   (A.InHerd=True)');
         FToBeCulledQuery.SQL.Add('AND   (A.Sex = ''Female'')');
         FToBeCulledQuery.SQL.Add('AND   (A.LactNo = E.AnimalLactNo)');
         FToBeCulledQuery.SQL.Add('AND   (A.HerdId =:AHerdId)');
         FToBeCulledQuery.SQL.Add('ORDER BY E.EventDate Desc');
         FToBeCulledQuery.Params[0].AsInteger := FHerdID;
         FToBeCulledQuery.Active := True;
      end;
   Result := ( FToBeCulledQuery.Locate('ID',AAnimalID,[]) );
end;

procedure THerdSync.CreateMilkProduction(AMilkProductionNode: IXMLDOMNodeList);
var
   i : Integer;
   NatIdNo : string;
   AnimalId : Integer;
   LactNo : Integer;
   DaysInMilk : Integer;
   DailyYield : Double;
   DailyBFatPerc : Double;
   DailyProtPerc : Double;
   DailyLactPerc : Double;
   CumYield : Double;
   CumBFatPerc : Double;
   CumProtPerc : Double;
   CumLactPerc : Double;
   Yield305 : Double;
   BFatPerc305 : Double;
   ProtPerc305 : Double;
   LactPerc305 : Double;
   MilkDisk : TTable;
begin
   if ( AMilkProductionNode = nil ) then Exit;

   MilkDisk := TTable.Create(nil);
   try
      MilkDisk.DatabaseName := AliasName;
      MilkDisk.TableName := 'MilkDisk.db';
      MilkDisk.Active := True;

      for i := 0 to AMilkProductionNode.Length-1 do
         begin
            NatIdNo := '';
            AnimalId := 0;
            LactNo:= 0;
            DaysInMilk := 0;
            DailyYield := 0;
            DailyBFatPerc := 0;
            DailyProtPerc := 0;
            DailyLactPerc := 0;
            CumYield := 0;
            CumBFatPerc := 0;
            CumProtPerc := 0;
            CumLactPerc := 0;
            Yield305 := 0;
            BFatPerc305 := 0;
            ProtPerc305 := 0;
            LactPerc305 := 0;

            try
               NatIdNo := AMilkProductionNode.item[i].selectSingleNode('natIdNo').text;
               if (not LocateAnimal(NatIdNo)) then
                  begin
                     CreateLogEntry(Format('Could not create milk production record. Animal tag %s not found in current herd.',[NatIdNo]));
                     continue;
                  end;
               AnimalId := FAnimalQuery.FieldByName('ID').AsInteger;
            except
               CreateLogEntry('Could not create milk production record. Node[natIdNo] not found.');
               continue; // no valid animal identifer, skip and move to next record
            end;

            try
               LactNo := StrToInt(AMilkProductionNode.item[i].selectSingleNode('lactNo').text);
            except
               CreateLogEntry('Could not create milk production record. Node[lactNo] not found.');
               continue; // animal lactno not present, skip and move to next record
            end;

            try
               DailyYield := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('dailyYield').text);
            except
            end;

            try
               DailyBFatPerc := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('dailyBFatPerc').text);
            except
            end;

            try
               DailyProtPerc := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('dailyProtPerc').text);
            except
            end;

            try
               DailyLactPerc := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('dailyLactPerc').text);
            except
            end;

            try
               CumYield := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('cumYield').text);
            except
            end;

            try
               CumBFatPerc := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('cumBfatPerc').text);
            except
            end;

            try
               CumProtPerc := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('cumProtPerc').text);
            except
            end;

            try
               CumLactPerc := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('cumLactosePerc').text);
            except
            end;

            try
               yield305 := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('yield305').text);
            except
            end;

            try
               bFatPerc305 := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('bfatPerc305').text);
            except
            end;

            try
               protPerc305 := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('protPerc305').text);
            except
            end;

            try
               LactPerc305 := StrToFloat(AMilkProductionNode.item[i].selectSingleNode('lactosePerc305').text);
            except
            end;

            try
               DaysInMilk := StrToInt(AMilkProductionNode.item[i].selectSingleNode('daysInMilk').text);
            except
            end;

            try
               try
                  if MilkDisk.Locate('AnimalID;LactNo',VarArrayOf([AnimalId,LactNo]),[]) then
                     begin
                        if ( CumYield < MilkDisk.FieldByName('CumYield').AsFloat ) then
                            begin
                               CreateLogEntry(Format('Milk production record skipped, newer version found on file for %s[%d].',[NatIdNo,LactNo]));
                               Continue;
                            end;

                        MilkDisk.Edit;
                     end
                  else
                     begin
                        MilkDisk.Append;
                        MilkDisk.FieldByName('AnimalID').Value := AnimalId;
                        MilkDisk.FieldByName('LactNo').Value := LactNo;
                     end;

                  MilkDisk.FieldByName('Source').Value := sICBF_API;

                  MilkDisk.FieldByName('CumYield').Value := CumYield;
                  MilkDisk.FieldByName('CumProtPerc').Value := CumProtPerc;
                  MilkDisk.FieldByName('CumBFatPerc').Value := CumBFatPerc;
                  MilkDisk.FieldByName('CumLactosePerc').Value := CumLactPerc;

                  MilkDisk.FieldByName('DailyYield').Value := DailyYield;
                  MilkDisk.FieldByName('DailyBFatPerc').Value := DailyBFatPerc;
                  MilkDisk.FieldByName('DailyProtPerc').Value := DailyProtPerc;
                  MilkDisk.FieldByName('DailyLactosePerc').Value := DailyLactPerc;

                  MilkDisk.FieldByName('Yield305').Value := Yield305;
                  MilkDisk.FieldByName('BFatPerc305').Value := BFatPerc305;
                  MilkDisk.FieldByName('ProtPerc305').Value := ProtPerc305;
                  MilkDisk.FieldByName('LactosePerc305').Value := LactPerc305;

                  MilkDisk.FieldByName('IsSynchronized').Value := True;

                  MilkDisk.FieldByName('DaysInMilk').Value := DaysInMilk;

                  MilkDisk.Post;

               except
                   MilkDisk.Cancel;
                   CreateLogEntry(Format('Create milk production record failed for %s[%d].',[NatIdNo,LactNo]));
               end;

            finally
                DBISaveChanges(MilkDisk.Handle);
            end;
         end;

   finally
      FreeAndNil(MilkDisk);
   end;
end;

procedure THerdSync.CreateMilkRecording(AMilkRecordingNode: IXMLDOMNodeList);
var
   MDT,
   MilkDiskTrans : TTable;
   RecDate : TDateTime;
   DailyYield,
   DailyBFatPerc,
   DailyProtPerc,
   DailyLactPerc,
   SCC : Double;
   i, LactNo, AnimalId, MDTId : Integer;
   AnimalNo, NatIdNo : String;
begin
   if ( AMilkRecordingNode = nil ) then Exit;

   MDT := TTable.Create(nil);
   MilkDiskTrans := TTable.Create(nil);
   try
      MDT.DatabaseName := AliasName;
      MDT.TableName := 'MDT.db';
      MDT.Open;

      MilkDiskTrans.DatabaseName := AliasName;
      MilkDiskTrans.TableName := 'MilkDiskTrans.db';
      MilkDiskTrans.Open;

      for i := 0 to AMilkRecordingNode.Length-1 do
         begin
            NatIdNo := '';
            AnimalId := 0;
            LactNo:= 0;
            RecDate := 0;
            DailyYield := 0;
            DailyBFatPerc := 0;
            DailyProtPerc := 0;
            DailyLactPerc := 0;
            SCC := 0;

            try
               NatIdNo := AMilkRecordingNode.item[i].selectSingleNode('natIdNo').text;
               if (not LocateAnimal(NatIdNo)) then
                  begin
                     CreateLogEntry(Format('Could not create milk recording record. Animal tag %s not found in current herd.',[NatIdNo]));
                     continue;
                  end;
               AnimalId := FAnimalQuery.FieldByName('ID').AsInteger;
               AnimalNo := FAnimalQuery.FieldByName('AnimalNo').AsString;
            except
               CreateLogEntry('Could not create milk recording record. Node[natIdNo] not found.');
               continue;
            end;

            try
               LactNo := StrToInt(AMilkRecordingNode.item[i].selectSingleNode('lactNo').text);
            except
               CreateLogEntry('Could not create milk production record. Node[lactNo] not found.');
               continue;
            end;

            try
               RecDate := StrToDate(AMilkRecordingNode.item[i].selectSingleNode('recordingDate').text);
            except
               CreateLogEntry('Could not create milk production record. Node[recordingDate] not found or is null/empty.');
               continue;
            end;

            try
               DailyYield := StrToFloat(AMilkRecordingNode.item[i].selectSingleNode('dailyYield').text);
            except
            end;

            try
               DailyBFatPerc := StrToFloat(AMilkRecordingNode.item[i].selectSingleNode('dailyBfatPerc').text);
            except
            end;

            //   24/02/20 [V5.9 R2.5] /MK Bug Fix - Protein Perc was not being downloaded.
            try
               DailyProtPerc := StrToFloat(AMilkRecordingNode.item[i].selectSingleNode('dailyProtPrec').text);
            except
            end;

            try
               DailyLactPerc := StrToFloat(AMilkRecordingNode.item[i].selectSingleNode('dailyLactPerc').text);
            except
            end;

            try
               SCC := StrToFloat(AMilkRecordingNode.item[i].selectSingleNode('sCC').text);
            except
            end;

            try
               try
                  if ( MilkDiskTrans.Locate('AnimalID;DateofRecording',VarArrayOf([AnimalId,RecDate]),[]) ) or
                     ( DailyYield = 0 ) then Continue;

                  if ( not(MDT.Locate('RecordingDate',RecDate,[])) ) then
                     try
                        try
                           MDT.Append;
                           MDT.FieldByName('RecordingDate').AsDateTime := RecDate;
                           MDT.FieldByName('Description').AsString := 'Milk Recording on '+DateToStr(RecDate);
                           MDT.FieldByName('NMRRecording').AsBoolean := False;
                           MDT.Post;
                        except
                           MDT.Cancel;
                           CreateLogEntry(Format('Create MDT record failed for %s[%d].',[NatIdNo,LactNo]));
                        end;
                     finally
                        DbiSaveChanges(MDT.Handle);
                     end;
                  MDTId := MDT.FieldByName('ID').AsInteger;

                  MilkDiskTrans.Append;
                  MilkDiskTrans.FieldByName('MDTID').Value := MDTId;
                  MilkDiskTrans.FieldByName('AnimalID').Value := AnimalId;
                  MilkDiskTrans.FieldByName('AnimalCode').Value := AnimalNo;
                  MilkDiskTrans.FieldByName('LactNo').Value := LactNo;

                  MilkDiskTrans.FieldByName('DateofRecording').Value := RecDate;
                  MilkDiskTrans.FieldByName('DailyYield').Value := DailyYield;
                  MilkDiskTrans.FieldByName('DailyBfatPerc').Value := DailyBFatPerc;
                  MilkDiskTrans.FieldByName('DailyProtPerc').Value := DailyProtPerc;
                  MilkDiskTrans.FieldByName('DailyLactPerc').Value := DailyLactPerc;
                  MilkDiskTrans.FieldByName('SCC').Value := SCC;

                  MilkDiskTrans.FieldByName('Source').Value := sICBF_API;

                  MilkDiskTrans.Post;
               except
                  MilkDiskTrans.Cancel;
                  CreateLogEntry(Format('Create milk production record failed for %s[%d].',[NatIdNo,LactNo]));
               end;
            finally
               DbiSaveChanges(MilkDiskTrans.Handle);
            end;
         end;

   finally
      FreeAndNil(MilkDiskTrans);
      FreeAndNil(MDT);
   end;
end;

procedure THerdSync.CreateLastMilkRecCumulativeRecords;
var
   qMilkTransRecs,
   qMilkDiskRecs,
   qUpdateMilkTrans : TQuery;
   iAnimalId,
   iAnimalLactNo,
   iMDTId,
   iDaysInMilk : Integer;
   fCumYield,
   fCumBfat,
   fCumProt,
   fCumLact,
   fYield305,
   fBFat305,
   fProt305,
   fLact305 : Double;
begin
   qMilkTransRecs := TQuery.Create(nil);
   qMilkDiskRecs := TQuery.Create(nil);
   qUpdateMilkTrans := TQuery.Create(nil);
   try
      qMilkTransRecs.DatabaseName := AliasName;
      qMilkTransRecs.SQL.Clear;
      qMilkTransRecs.SQL.Add('SELECT DISTINCT(DateOfRecording), MDTID');
      qMilkTransRecs.SQL.Add('FROM MilkDiskTrans');
      qMilkTransRecs.SQL.Add('WHERE Source = '+IntToStr(sICBF_API));
      qMilkTransRecs.SQL.Add('AND   ((CumYield IS NULL) OR (CumYield = ""))');
      qMilkTransRecs.SQL.Add('ORDER BY DateOfRecording DESC');
      qMilkTransRecs.Open;
      iMDTId := 0;
      if ( qMilkTransRecs.RecordCount > 0 ) then
         begin
            iMDTId := qMilkTransRecs.FieldByName('MDTID').AsInteger;
            if ( iMDTId > 0 ) then
               begin
                  qMilkDiskRecs.DatabaseName := AliasName;
                  qMilkDiskRecs.Close;
                  qMilkDiskRecs.SQL.Clear;
                  qMilkDiskRecs.SQL.Add('SELECT CumYield, CumBfatPerc, CumProtPerc, CumLactosePerc,');
                  qMilkDiskRecs.SQL.Add('       DaysInMilk, Yield305, BfatPerc305, ProtPerc305, LactosePerc305');
                  qMilkDiskRecs.SQL.Add('FROM MilkDisk');
                  qMilkDiskRecs.SQL.Add('WHERE AnimalId = :AnimalId');
                  qMilkDiskRecs.SQL.Add('AND   LactNo = :LactNo');

                  qUpdateMilkTrans.DatabaseName := AliasName;
                  qUpdateMilkTrans.Close;
                  qUpdateMilkTrans.SQL.Clear;
                  qUpdateMilkTrans.SQL.Add('UPDATE MilkDiskTrans');
                  qUpdateMilkTrans.SQL.Add('SET CumYield = :CumYield,');
                  qUpdateMilkTrans.SQL.Add('    CumBfatPerc = :CumBfat,');
                  qUpdateMilkTrans.SQL.Add('    CumProtPerc = :CumProt,');
                  qUpdateMilkTrans.SQL.Add('    CumLactPerc = :CumLact,');
                  qUpdateMilkTrans.SQL.Add('    DaysInMilk = :DaysInMilk,');
                  qUpdateMilkTrans.SQL.Add('    Yield305 = :Yield305,');
                  qUpdateMilkTrans.SQL.Add('    BFat305Perc = :BFat305,');
                  qUpdateMilkTrans.SQL.Add('    Prot305Perc = :Prot305,');
                  qUpdateMilkTrans.SQL.Add('    Lact305Perc = :Lact305');
                  qUpdateMilkTrans.SQL.Add('WHERE AnimalId = :AnimalID');
                  qUpdateMilkTrans.SQL.Add('AND   LactNo = :LactNo');
                  qUpdateMilkTrans.SQL.Add('AND   MDTID = :MDTID');

                  qMilkTransRecs.Close;
                  qMilkTransRecs.SQL.Clear;
                  qMilkTransRecs.SQL.Add('SELECT *');
                  qMilkTransRecs.SQL.Add('FROM MilkDiskTrans');
                  qMilkTransRecs.SQL.Add('WHERE MDTID = '+IntToStr(iMDTId));
                  qMilkTransRecs.Open;
                  if ( qMilkTransRecs.RecordCount > 0 ) then
                     begin
                        qMilkTransRecs.First;
                        while ( not(qMilkTransRecs.Eof) ) do
                           begin
                              iAnimalId := 0;
                              iAnimalId := qMilkTransRecs.FieldByName('AnimalId').AsInteger;
                              iAnimalLactNo := 0;
                              iAnimalLactNo := qMilkTransRecs.FieldByName('LactNo').AsInteger;
                              qMilkDiskRecs.Close;
                              if ( iAnimalID > 0 ) and ( iAnimalLactNo > 0 ) then
                                 begin
                                    qMilkDiskRecs.Params[0].AsInteger := iAnimalId;
                                    qMilkDiskRecs.Params[1].AsInteger := iAnimalLactNo;
                                    qMilkDiskRecs.Open;
                                    if ( qMilkDiskRecs.RecordCount > 0 ) then
                                       begin
                                          iDaysInMilk := 0;
                                          fCumYield := 0;
                                          fCumBfat := 0;
                                          fCumProt := 0;
                                          fCumLact := 0;
                                          fYield305 := 0;
                                          fBFat305 := 0;
                                          fProt305 := 0;
                                          fLact305 := 0;

                                          iDaysInMilk := qMilkDiskRecs.FieldByName('DaysInMilk').AsInteger;
                                          fCumYield := qMilkDiskRecs.FieldByName('CumYield').AsFloat;
                                          fCumBfat := qMilkDiskRecs.FieldByName('CumBfatPerc').AsFloat;
                                          fCumProt := qMilkDiskRecs.FieldByName('CumProtPerc').AsFloat;
                                          fCumLact := qMilkDiskRecs.FieldByName('CumLactosePerc').AsFloat;
                                          fYield305 := qMilkDiskRecs.FieldByName('Yield305').AsFloat;
                                          fBFat305 := qMilkDiskRecs.FieldByName('BfatPerc305').AsFloat;
                                          fProt305 := qMilkDiskRecs.FieldByName('ProtPerc305').AsFloat;
                                          fLact305 := qMilkDiskRecs.FieldByName('LactosePerc305').AsFloat;

                                          qUpdateMilkTrans.Close;
                                          qUpdateMilkTrans.Params[0].AsFloat := fCumYield;
                                          qUpdateMilkTrans.Params[1].AsFloat := fCumBfat;
                                          qUpdateMilkTrans.Params[2].AsFloat := fCumProt;
                                          qUpdateMilkTrans.Params[3].AsFloat := fCumLact;
                                          qUpdateMilkTrans.Params[4].AsSmallInt := iDaysInMilk;
                                          qUpdateMilkTrans.Params[5].AsFloat := fYield305;
                                          qUpdateMilkTrans.Params[6].AsFloat := fBFat305;
                                          qUpdateMilkTrans.Params[7].AsFloat := fProt305;
                                          qUpdateMilkTrans.Params[8].AsFloat := fLact305;
                                          qUpdateMilkTrans.Params[9].AsInteger := iAnimalId;
                                          qUpdateMilkTrans.Params[10].AsInteger := iAnimalLactNo;
                                          qUpdateMilkTrans.Params[11].AsInteger := iMDTId;
                                          qUpdateMilkTrans.ExecSQL;
                                       end;
                                 end;
                              qMilkTransRecs.Next;
                           end;
                     end;
               end;
         end;
   finally
      if ( qMilkTransRecs <> nil ) then
         qMilkTransRecs.Free;
      if ( qMilkDiskRecs <> nil ) then
         qMilkDiskRecs.Free;
      if ( qUpdateMilkTrans <> nil ) then
         qUpdateMilkTrans.Free;
   end;
end;

procedure THerdSync.CreateICBFAPIHerdHealth(AICBFAPIHerdHealthNode: IXMLDOMNodeList);
var
   ICBFAPIHerdHealth : TTable;
   NatIdNo,
   sEvent,
   sReason : String;
   i,
   AnimalId,
   ResourceID : Integer;
   EventDate,
   CreatedOn,
   ModifiedOn : TDateTime;
   QTRLeftBack,
   QTRRightBack,
   QTRLeftFront,
   QTRRightFront,
   Fatal : Boolean;
begin
   if ( AICBFAPIHerdHealthNode = nil ) then Exit;

   ICBFAPIHerdHealth := TTable.Create(nil);
   try
      ICBFAPIHerdHealth.DatabaseName := AliasName;
      ICBFAPIHerdHealth.TableName := 'ICBFAPIHerdHealth.db';
      ICBFAPIHerdHealth.Open;

      for i := 0 to AICBFAPIHerdHealthNode.Length-1 do
         begin
            NatIdNo := '';
            sEvent := '';
            sReason := '';
            AnimalId := 0;
            ResourceID := 0;
            EventDate := 0;
            CreatedOn := 0;
            ModifiedOn := 0;
            QTRLeftBack := False;
            QTRRightBack := False;
            QTRLeftFront := False;
            QTRRightFront := False;
            Fatal := False;

            try
               NatIdNo := AICBFAPIHerdHealthNode.item[i].selectSingleNode('natIdNo').text;
               if (not LocateAnimal(NatIdNo)) then
                  begin
                     CreateLogEntry(Format('Could not create ICBF herd health record. Animal tag %s not found in current herd.',[NatIdNo]));
                     continue;
                  end;
               AnimalId := FAnimalQuery.FieldByName('ID').AsInteger;
            except
               CreateLogEntry('Could not create ICBF herd health record. Node[natIdNo] not found.');
               continue;
            end;

            try
               ResourceID := StrToInt(AICBFAPIHerdHealthNode.item[i].selectSingleNode('resoureId').text);
            except
               CreateLogEntry('Could not create ICBF herd health record. Node[resourceID] not found or is null/empty.');
               continue;
            end;

            try
               sEvent := AICBFAPIHerdHealthNode.item[i].selectSingleNode('event').text;
            except
               CreateLogEntry('Could not create ICBF herd health record. Node[event] not found or is null/empty.');
               continue;
            end;

            try
               EventDate := StrToDate(AICBFAPIHerdHealthNode.item[i].selectSingleNode('eventDate').text);
            except
            end;

            if ( UpperCase(sEvent) = cICBFAPI_Mastitis ) then
               begin
                  try
                     if ( Length(AICBFAPIHerdHealthNode.item[i].selectSingleNode('qtrLeftBack').text) > 0 ) then
                        QTRLeftBack := ( UpperCase(AICBFAPIHerdHealthNode.item[i].selectSingleNode('qtrLeftBack').text) = 'TRUE' );
                  except
                  end;

                  try
                     if ( Length(AICBFAPIHerdHealthNode.item[i].selectSingleNode('qtrRightBack').text) > 0 ) then
                        QTRRightBack := ( UpperCase(AICBFAPIHerdHealthNode.item[i].selectSingleNode('qtrRightBack').text) = 'TRUE' );
                  except
                  end;

                  try
                     if ( Length(AICBFAPIHerdHealthNode.item[i].selectSingleNode('qtrLeftFront').text) > 0 ) then
                        QTRLeftFront := ( UpperCase(AICBFAPIHerdHealthNode.item[i].selectSingleNode('qtrLeftFront').text) = 'TRUE' );
                  except
                  end;

                  try
                     if ( Length(AICBFAPIHerdHealthNode.item[i].selectSingleNode('qtrRightFront').text) > 0 ) then
                        QTRRightFront := ( UpperCase(AICBFAPIHerdHealthNode.item[i].selectSingleNode('qtrRightFront').text) = 'TRUE' );
                  except
                  end;
               end;

            try
               sReason := AICBFAPIHerdHealthNode.item[i].selectSingleNode('reason').text;
            except
            end;

            try
               if ( Length(AICBFAPIHerdHealthNode.item[i].selectSingleNode('fatal').text) > 0 ) then
                  Fatal := ( UpperCase(AICBFAPIHerdHealthNode.item[i].selectSingleNode('fatal').text) = 'TRUE' );
            except
            end;

            try
               if ( Length(AICBFAPIHerdHealthNode.item[i].selectSingleNode('createdOn').text) > 0 ) then
                  CreatedOn := StrToDate(AICBFAPIHerdHealthNode.item[i].selectSingleNode('createdOn').text);
            except
            end;

            try
               if ( Length(AICBFAPIHerdHealthNode.item[i].selectSingleNode('modifiedOn').text) > 0 ) then
                  ModifiedOn := StrToDate(AICBFAPIHerdHealthNode.item[i].selectSingleNode('modifiedOn').text);
            except
            end;

            try
               try
                  if ( ICBFAPIHerdHealth.Locate('ResourceId',ResourceID,[]) ) then
                     begin
                        CreateLogEntry(Format('Could not create ICBF herd health record - ResourceID %d already exists.',[ResourceID]));
                        Continue;
                     end;

                  ICBFAPIHerdHealth.Append;
                  ICBFAPIHerdHealth.FieldByName('AnimalId').AsInteger := AnimalId;
                  ICBFAPIHerdHealth.FieldByName('ResourceId').AsInteger := ResourceID;
                  ICBFAPIHerdHealth.FieldByName('Event').AsString := sEvent;
                  ICBFAPIHerdHealth.FieldByName('EventDate').AsDateTime := EventDate;
                  if ( UpperCase(sEvent) = cICBFAPI_Mastitis ) then
                     begin
                        ICBFAPIHerdHealth.FieldByName('QuarterLeftBack').AsBoolean := QTRLeftBack;
                        ICBFAPIHerdHealth.FieldByName('QuarterRightBack').AsBoolean := QTRRightBack;
                        ICBFAPIHerdHealth.FieldByName('QuarterLeftFront').AsBoolean := QTRLeftFront;
                        ICBFAPIHerdHealth.FieldByName('QuarterRightFront').AsBoolean := QTRRightFront;
                     end;
                  ICBFAPIHerdHealth.FieldByName('Reason').AsString := sReason;
                  ICBFAPIHerdHealth.FieldByName('Fatal').AsBoolean := Fatal;
                  if ( CreatedOn > 0 ) then
                     ICBFAPIHerdHealth.FieldByName('CreatedOn').AsDateTime := CreatedOn;
                  if ( ModifiedOn > 0 ) then
                     ICBFAPIHerdHealth.FieldByName('ModifiedOn').AsDateTime := ModifiedOn;
                  ICBFAPIHerdHealth.Post;
               except
                  ICBFAPIHerdHealth.Cancel;
                  CreateLogEntry(Format('Create ICBF herd health record failed for %s of ResourceID %d.',[NatIdNo,ResourceID]));
               end;
            finally
               DbiSaveChanges(ICBFAPIHerdHealth.Handle);
            end;
         end;
   finally
      FreeAndNil(ICBFAPIHerdHealth);
   end;
end;

procedure THerdSync.CreateAnimalGroups(AAnimalGroupNode: IXMLDOMNodeList);
var
   sGroupCode,
   sGroupDesc,
   sClientId,
   sNatIdNo : String;
   i, j, k, l,
   iGroupSource,
   iGroupType,
   iDesktopGroupId,
   iAnimalId : Integer;
   bGroupIsDeleted : Boolean;
   LinksNode : IXMLDOMNode;
   GroupNode : IXMLDOMNode;
   AnimalNode : IXMLDOMNode;
   ChildNode : IXMLDomNode;
   GrpsTable,
   GrpLinksTable,
   DeletedGrps : TTable;
   dDateCreated,
   dDateModified,
   dDateJoined : TDateTime;
   bGroupLinkDeleted : Boolean;

   function NewGroupCode : String;
   var
      i : Integer;
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            for i := 1 to 100 do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT *');
                  SQL.Add('FROM Grps');
                  SQL.Add('WHERE Code = "KWB'+IntToStr(i)+'"');
                  Open;
                  if ( RecordCount = 0 ) then
                     begin
                        Result := 'KWB'+IntToStr(i);
                        Break;
                     end;
               end;
         finally
            Free;
         end;
   end;

begin
   if ( AAnimalGroupNode = nil ) then Exit;

   GrpsTable := TTable.Create(nil);
   GrpLinksTable := TTable.Create(nil);
   DeletedGrps := TTable.Create(nil);
   try
      GrpsTable.DatabaseName := AliasName;
      GrpsTable.TableName := 'Grps';
      GrpsTable.Open;

      GrpLinksTable.DatabaseName := AliasName;
      GrpLinksTable.TableName := 'GrpLinks';
      GrpLinksTable.Open;

      DeletedGrps.DatabaseName := AliasName;
      DeletedGrps.TableName := 'DeletedGrps';
      DeletedGrps.Open;

      // Loop through Group Node.
      for i := 0 to AAnimalGroupNode.length-1 do
         begin
            GroupNode := AAnimalGroupNode.item[i];
            if ( GroupNode = nil ) then Continue;
            for j := 0 to GroupNode.childNodes.Get_length-1 do
               begin
                  ChildNode := GroupNode.childNodes[j];
                  if ( ChildNode.nodeName = 'clientId' ) then
                     try
                        sClientId := ChildNode.text;
                     except
                     end
                  else if ( ChildNode.nodeName = 'desktopId' ) then
                     try
                        iDesktopGroupId := StrToInt(ChildNode.text);
                     except
                     end
                  else if ( ChildNode.nodeName = 'groupCode' ) then
                     try
                        sGroupCode := ChildNode.text;
                     except
                     end
                  else if ( ChildNode.nodeName = 'groupDesc' ) then
                     try
                        sGroupDesc := ChildNode.text;
                     except
                     end
                  else if ( ChildNode.nodeName = 'groupType' ) then
                     try
                        iGroupType := StrToInt(ChildNode.text);
                     except
                     end
                  else if ( ChildNode.nodeName = 'source' ) then
                     try
                        iGroupSource := StrToInt(ChildNode.text);
                     except
                     end
                  else if ( ChildNode.nodeName = 'isDeleted' ) then
                     try
                        bGroupIsDeleted := ( UpperCase(ChildNode.text) = 'TRUE' );
                     except
                     end
                  else if ( ChildNode.nodeName = 'createdOn' ) then
                     try
                        dDateCreated := ( StrToDateTime(ChildNode.text) );
                     except
                     end
                  else if ( ChildNode.nodeName = 'modifiedOn' ) then
                     try
                        dDateModified := ( StrToDateTime(ChildNode.text) );
                     except
                     end
                  else if ( ChildNode.nodeName = 'links' ) then
                     try
                        LinksNode := ChildNode;
                     except
                     end;
               end;

            // If there is no ClientId for the group on server then move on.
            if ( Length(sClientId) = 0 ) then Continue;

            // If there is a DesktopId on the server then the group started on the PC so edit it.
            if ( iDesktopGroupId > 0 ) then
               begin
                  if ( GrpsTable.Locate('ID',iDesktopGroupId,[]) ) then
                     begin
                        // If the Group on the PC does not have a ClientId then add the ClientId to it.
                        if ( GrpsTable.FieldByName('ClientId').IsNull ) then
                           try
                              GrpsTable.Edit;
                              GrpsTable.FieldByName('ClientId').AsString := sClientId;
                              if ( dDateModified > 0 ) then
                                 GrpsTable.FieldByName('ModifiedOn').AsDateTime := dDateModified
                              else
                                 GrpsTable.FieldByName('ModifiedOn').AsDateTime := Now;
                              GrpsTable.Post;
                            except
                               on e : Exception do
                                 begin
                                    GrpsTable.Cancel;
                                    ApplicationLog.LogException(e);
                                    ApplicationLog.LogError(Format('Error updating GroupId %d with ClientId',[iDesktopGroupId]));
                                 end;
                            end;

                        // If the Group Description on the server differs to the PC then change the Group Description on the PC.
                        if ( UpperCase(GrpsTable.FieldByName('Description').AsString) <> UpperCase(sGroupDesc) ) then
                           try
                              GrpsTable.Edit;
                              GrpsTable.FieldByName('Description').AsString := sGroupDesc;
                              if ( dDateModified > 0 ) then
                                 GrpsTable.FieldByName('ModifiedOn').AsDateTime := dDateModified
                              else
                                 GrpsTable.FieldByName('ModifiedOn').AsDateTime := Now;
                              GrpsTable.Post;
                            except
                               on e : Exception do
                                 begin
                                    GrpsTable.Cancel;
                                    ApplicationLog.LogException(e);
                                    ApplicationLog.LogError(Format('Error updating GroupId %d with Description',[iDesktopGroupId]));
                                 end;
                            end;
                     end;
               end
            else if ( not(bGroupIsDeleted) ) and ( not(GrpsTable.Locate('ClientID',sClientId,[])) ) then
               // If the DesktopGroupId is zero then add the group to the PC.
               try
                  GrpsTable.Append;
                  GrpsTable.FieldByName('Code').AsString := NewGroupCode;
                  GrpsTable.FieldByName('Description').AsString := sGroupDesc;
                  GrpsTable.FieldByName('GroupType').AsString := 'Batch';
                  GrpsTable.FieldByName('Selected').AsBoolean := False;
                  GrpsTable.FieldByName('IsSynchronized').AsBoolean := True;
                  GrpsTable.FieldByName('ClientId').AsString := sClientId;
                  GrpsTable.FieldByName('Source').AsInteger := sgEID;
                  if ( dDateCreated > 0 ) then
                     GrpsTable.FieldByName('CreatedOn').AsDateTime := dDateCreated
                  else
                     GrpsTable.FieldByName('CreatedOn').AsDateTime := Now;
                  if ( dDateModified > 0 ) then
                     GrpsTable.FieldByName('ModifiedOn').AsDateTime := dDateModified;
                  GrpsTable.Post;
                  GrpsTable.Last;
                  // Return the newly created DesktopGroupId for the GroupLinks table.
                  iDesktopGroupId := GrpsTable.FieldByName('ID').AsInteger;
               except
                  on e : Exception do
                    begin
                       GrpsTable.Cancel;
                       ApplicationLog.LogException(e);
                       ApplicationLog.LogError(Format('Error creating new group %s from App',[sGroupDesc]));
                    end;
               end;

            // If there are no animals in the group then move on to the next group in the XML file.
            if ( LinksNode.childNodes.Get_length = 0 ) and ( not(bGroupIsDeleted) ) then Continue;

            // Delete the animals for the group from the GroupLinks table.
            bGroupLinkDeleted := False;
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('DELETE FROM GrpLinks');
                  SQL.Add('WHERE GroupID = :DesktopID');
                  Params[0].AsInteger := iDesktopGroupId;
                  try
                     ExecSQL;
                     bGroupLinkDeleted := True;
                  except
                     on e : Exception do
                        begin
                           bGroupLinkDeleted := False;
                           ApplicationLog.LogException(e);
                           ApplicationLog.LogError(Format('Unable to delete GrpLinks table entries for DesktopID %d',[iDesktopGroupId]));
                        end;
                  end;
               finally
                  Free;
               end;

            // If the group is marked as deleted on the server and the GroupLinks table records were deleted then
            // add the Group to the DeletedGroups table and move on to the next group in the XML file.
            if ( bGroupIsDeleted and bGroupLinkDeleted ) then
               begin
                  try
                     if ( GrpsTable.Locate('ID',iDesktopGroupId,[]) ) then
                        GrpsTable.Delete;
                  except
                     on e : Exception do
                        begin
                           DeletedGrps.Cancel;
                           ApplicationLog.LogException(e);
                           ApplicationLog.LogError(Format('Error deleting GroupId %d from Grps table',[iDesktopGroupId]));
                        end;
                  end;

                  try
                     DeletedGrps.Append;
                     DeletedGrps.FieldByName('GroupID').AsInteger := iDesktopGroupId;
                     DeletedGrps.FieldByName('DateDeleted').AsDateTime := Date;
                     DeletedGrps.FieldByName('IsSynchronized').AsBoolean := True;
                     DeletedGrps.Post;

                  except
                     on e : Exception do
                        begin
                           DeletedGrps.Cancel;
                           ApplicationLog.LogException(e);
                           ApplicationLog.LogError(Format('Error adding GroupId %d to DeletedGrps table',[iDesktopGroupId]));
                        end;
                  end;

                  Continue;
               end;

            // Go through each animal node for the current group on the XML file.
            for k := 0 to LinksNode.childNodes.Get_length-1 do
               begin
                  AnimalNode := LinksNode.childNodes[k];
                  iAnimalId := 0;
                  dDateJoined := 0;
                  for l := 0 to AnimalNode.childNodes.Get_length-1 do
                     begin
                        ChildNode := AnimalNode.childNodes[l];
                        if ( ChildNode = nil ) then Continue;

                        if ( ChildNode.nodeName = 'natIdNo' ) then
                           try
                              // Search for the animal's NationalId in the database and return is AnimalId.
                              sNatIdNo := ChildNode.text;
                              if ( not LocateAnimal(sNatIdNo) ) then Continue;
                              if ( not(FAnimalQuery.FieldByName('InHerd').AsBoolean) ) then Continue;
                              iAnimalId := FAnimalQuery.FieldByName('ID').AsInteger;
                           except
                              Continue;
                           end
                        else if ( ChildNode.nodeName = 'dateJoined' ) then
                           try
                              dDateJoined := StrToDate(ChildNode.text);
                           except
                              Continue;
                           end;
                     end;

                  // If the Group is not marked as deleted then append the AnimalId and DateJoined for the current DesktopGroupId to the GrpLinks table.
                  if ( not(bGroupIsDeleted) ) then
                     begin
                        if ( iAnimalId > 0 ) then
                           try
                              GrpLinksTable.Append;
                              GrpLinksTable.FieldByName('GroupID').AsInteger := iDesktopGroupId;
                              GrpLinksTable.FieldByName('AnimalId').AsInteger := iAnimalID;
                              GrpLinksTable.FieldByName('DateJoined').AsDateTime := dDateJoined;
                              GrpLinksTable.Post;
                           except
                              on e : Exception do
                                 begin
                                    GrpLinksTable.Cancel;
                                    ApplicationLog.LogException(e);
                                    ApplicationLog.LogError(Format('Unable to add AnimalId %d to GroupId %d',[iAnimalID,iDesktopGroupId]));
                                 end;
                           end;
                     end;
               end;
         end;
   finally
      if ( GrpsTable <> nil ) then
         FreeAndNil(GrpsTable);
      if ( GrpLinksTable <> nil ) then
         FreeAndNil(GrpLinksTable);
      if ( DeletedGrps <> nil ) then
         FreeAndNil(DeletedGrps);
      if ( GroupNode <> nil ) then
         GroupNode := nil;
      if ( LinksNode <> nil ) then
         LinksNode := nil;
      if ( ChildNode <> nil ) then
         ChildNode := nil;
      if ( AnimalNode <> nil ) then
         AnimalNode := nil;
   end;
end;

procedure THerdSync.AddEventToEventsExt(AEventID, AEventType : Integer; AClientID, ANatIDNo : String);
var
   tEventsExt : TTable;
   iExistEvExtId : Integer;

   function InFSyncedEventsArray : Boolean;
   var
      i : Integer;
   begin
      Result := False;
      for i := 0 to Length(FSyncedEventsArray)-1 do
         begin
            Result := ( FSyncedEventsArray[i] = AClientId );
            if ( Result ) then
               Break;
         end;
   end;

begin
   //   04/12/20 [V5.9 R7.8] /MK Change - No need to check for EventId as we allow events to come in here that were not saved
   //                                     because the animal doesn't exist in the database so push back the event as synced.
   if ( Length(AClientID) = 0 ) then Exit;

   tEventsExt := TTable.Create(nil);
   with tEventsExt do
      try
         DatabaseName := AliasName;
         TableName := 'EventsExt';
         Open;
         iExistEvExtId := 0;

         try
            //   04/12/20 [V5.9 R7.8] /MK Change - Use a query to find the EventId or the ClientId.
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('SELECT *');
                  SQL.Add('FROM EventsExt');
                  if ( AEventId > 0 ) then
                     SQL.Add('WHERE EventId = '+IntToStr(AEventID))
                  else
                     //   05/02/21 [V5.9 R8.2] /MK Bug Fix - Using Client instead of ClientId and not using double quotes around AClientId.
                     SQL.Add('WHERE ClientId = "'+AClientId+'"');
                  try
                     Open;
                     if ( RecordCount > 0 ) then
                        iExistEvExtId := FieldByName('Id').AsInteger;
                  except
                     on e : Exception do
                        ShowDebugMessage(e.Message);
                  end;
               finally
                  Free;
               end;

            if ( iExistEvExtId > 0 ) and ( Locate('Id',iExistEvExtId,[]) ) then
               Edit
            else
               Append;

            FieldByName('EventID').AsInteger := AEventID;
            FieldByName('ClientID').AsString := AClientID;
            FieldByName('NatIDNo').AsString := ANatIDNo;
            FieldByName('EventType').AsInteger := AEventType;
            FieldByName('IsDeleted').AsBoolean := False;
            FieldByName('IsSynchronized').AsBoolean := False;
            Post;

            if ( Length(FSyncedEventsArray) = 0 ) or ( not(InFSyncedEventsArray) ) then
               begin
                  SetLength(FSyncedEventsArray,Length(FSyncedEventsArray)+1);
                  FSyncedEventsArray[Length(FSyncedEventsArray)-1] := AClientID;
               end;

         except
            on e : Exception do
               begin
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError(e.Message);
                  Cancel;
               end;
         end;
      finally
         Close;
         Free;
      end;
end;

function THerdSync.GetSexedSemenId(ACode: string): Integer;
const
   cArrayofSexedSemenCodes : array [0..3] of string = ('90F', '75F', '90M', '75M');
begin
   Result := 0;
   if (Trim(ACode) = '') then Exit;
   if ( not(InArray(ACode,cArrayofSexedSemenCodes)) ) then Exit;
   ACode := '-'+ACode;
   if FGenlookQuery.Locate('ListType;LookUpCode',VarArrayOf([LSexedSemen,ACode]),[]) then
      Result := FGenlookQuery.FieldByName('ID').AsInteger;
end;

function THerdSync.EventsExtClientIdEventId (AClientId : String) : Integer;
begin
   Result := 0;
   if ( Length(AClientId) = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT EventId');
         SQL.Add('FROM EventsExt');
         SQL.Add('WHERE ClientID = "'+AClientId+'"');
         try
            Open;
            if ( RecordCount > 0 ) and ( Fields[0].AsInteger > 0 ) then
               Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function THerdSync.CreateExistingClientIdElement (AClientID : String; AEventID, AEventType : Integer) : IXMLDOMNode;
var
   qEvent : TQuery;
   i : Integer;
   Doc : IXMLDOMDocument;
   ChildNode,
   TempNode,
   Node : IXMLDOMNode;
   si,
   CalvingDesc,
   SurveyCode,
   SurveyDesc,
   sTempStr : String;

   procedure OpenCalvingQuery (AFieldId : String);
   begin
      qEvent.Close;
      qEvent.SQL.Clear;
      qEvent.SQL.Add('SELECT A.ID, A.NatIDNum, A.AnimalNo, A.LactNo,');
      qEvent.SQL.Add('	     E.EventDate, E.EventDesc, G.Description Survey,');
      qEvent.SQL.Add('	     C.ID'+AFieldId+' CalfID'+AFieldId+', C'+AFieldId+'.NatIDNum C'+AFieldId+'NatID, C'+AFieldId+'.Sex C'+AFieldId+'Sex,');
      qEvent.SQL.Add('	     C'+AFieldId+'.DateOfBirth C'+AFieldId+'DOB, C'+AFieldId+'.AnimalNo C'+AFieldId+'ANo,');
      qEvent.SQL.Add('	     C'+AFieldId+'B.Code C'+AFieldId+'Breed, C'+AFieldId+'G.LookupCode C'+AFieldId+'Colour, C'+AFieldId+'.Name C'+AFieldId+'Name,');
      qEvent.SQL.Add('	     C'+AFieldId+'.HerdBookNo C'+AFieldId+'HerdBook, C'+AFieldId+'.BirthWeight C'+AFieldId+'Weight, C'+AFieldId+'.InHerd C'+AFieldId+'InHerd,');
      qEvent.SQL.Add('	     S.AnimalNo BullNo, S.NatIDNum BullNatID, SB.Code BullBreed');
      qEvent.SQL.Add('FROM Animals A');
      //   23/02/21 [V5.9 R8.5] /MK Change - Change LEFT JOIN to INNER JOIN to make the query quicker.
      qEvent.SQL.Add('INNER JOIN Events E ON (E.AnimalID = A.ID)');
      qEvent.SQL.Add('INNER JOIN Calvings C ON (C.EventID = E.ID)');
      qEvent.SQL.Add('LEFT JOIN GenLook G ON (G.ID = C.BirthType)');
      qEvent.SQL.Add('LEFT JOIN Animals C'+AFieldId+' ON (C'+AFieldId+'.ID = C.ID'+AFieldId+')');
      qEvent.SQL.Add('LEFT JOIN Breeds C'+AFieldId+'B ON (C'+AFieldId+'B.ID = C'+AFieldId+'.PrimaryBreed)');
      qEvent.SQL.Add('LEFT JOIN GenLook C'+AFieldId+'G ON (C'+AFieldId+'G.ID = C'+AFieldId+'.Colour)');
      qEvent.SQL.Add('LEFT JOIN Animals S ON (S.ID = C'+AFieldId+'.SireID)');
      qEvent.SQL.Add('LEFT JOIN Breeds SB ON (SB.ID = S.PrimaryBreed)');
      qEvent.SQL.Add('WHERE E.ID = :EvID');
      qEvent.Params[0].AsInteger := AEventID;
      qEvent.Open;
   end;

begin
   Result := nil;
   if ( AEventID = 0 ) then Exit;
   qEvent := TQuery.Create(nil);
   try
      qEvent.DatabaseName := AliasName;
      try
         case AEventType of
            CCalvingEvent : begin
                               Doc := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                               try
                                  Doc.appendChild(FDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'));
                                  Result := Doc.CreateElement('calvingEvent');
                                  si := IntToStr(1);
                                  OpenCalvingQuery(si);
                                  if ( qEvent.RecordCount = 0 ) then Exit;

                                  ChildNode := Doc.createElement('animalId');
                                  ChildNode.Set_text(qEvent.FieldByName('NatIDNum').AsString);
                                  Result.appendChild(ChildNode);
                                  ChildNode := Doc.createElement('clientId');
                                  ChildNode.Set_text(AClientID);
                                  Result.appendChild(ChildNode);
                                  ChildNode := Doc.createElement('desktopId');
                                  ChildNode.Set_text(IntToStr(AEventID));
                                  Result.appendChild(ChildNode);
                                  ChildNode := Doc.createElement('animalNo');
                                  ChildNode.Set_text(qEvent.FieldByName('AnimalNo').AsString);
                                  Result.appendChild(ChildNode);
                                  ChildNode := Doc.createElement('animalLactNo');
                                  ChildNode.Set_text(IntToStr(qEvent.FieldByName('LactNo').AsInteger));
                                  Result.appendChild(ChildNode);
                                  //   23/02/21 [V5.9 R8.5] /MK Change - Changed format of eventDate node to 4 digit year to match server format
                                  ChildNode := Doc.createElement('eventDate');
                                  ChildNode.Set_text(FormatDateTime('dd/MM/yyyy',qEvent.FieldByName('EventDate').AsDateTime));
                                  Result.appendChild(ChildNode);
                                  ChildNode := Doc.createElement('eventDescription');
                                  ChildNode.Set_text(qEvent.FieldByName('EventDesc').AsString);
                                  Result.appendChild(ChildNode);
                                  SurveyCode := '';
                                  SurveyDesc := '';
                                  CalvingDesc := qEvent.FieldByName('Survey').AsString;
                                  if ( Pos('ICBF',CalvingDesc) > 0 ) then
                                     begin
                                        SurveyCode := Copy(CalvingDesc,6,1);
                                        sTempStr := Copy(CalvingDesc,Pos('=',CalvingDesc)+1,Length(CalvingDesc)-Pos(CalvingDesc,SurveyCode));
                                        SurveyDesc := Copy(sTempStr,1,Pos(' ',sTempStr)-1);
                                     end;
                                  ChildNode := Doc.createElement('calvingSurvey');
                                  ChildNode.Set_text(SurveyDesc);
                                  Result.appendChild(ChildNode);
                                  ChildNode := Doc.createElement('calvingSurveyCode');
                                  ChildNode.Set_text(SurveyCode);
                                  Result.appendChild(ChildNode);

                                  ChildNode := Doc.createElement('sire');
                                  Result.appendChild(ChildNode);
                                  TempNode := Doc.createElement('sireNo');
                                  TempNode.Set_text(qEvent.FieldByName('BullNo').AsString);
                                  ChildNode.appendChild(TempNode);
                                  TempNode := Doc.createElement('sireNatIdNo');
                                  TempNode.Set_text(qEvent.FieldByName('BullNatID').AsString);
                                  ChildNode.appendChild(TempNode);
                                  TempNode := Doc.createElement('sireBreedCode');
                                  TempNode.Set_text(qEvent.FieldByName('BullBreed').AsString);
                                  ChildNode.appendChild(TempNode);

                                  ChildNode := Doc.createElement('calves');
                                  Result.appendChild(ChildNode);
                                  for i := 1 to 4 do
                                     begin
                                        si := IntToStr(i);
                                        OpenCalvingQuery(si);
                                        if ( qEvent.RecordCount > 0 ) and ( qEvent.FieldByName('CalfID'+si).AsInteger > 0 ) then
                                           begin
                                              TempNode := Doc.createElement('calf');
                                              ChildNode.appendChild(TempNode);

                                              Node := Doc.createElement('natIdNo');
                                              Node.Set_text(qEvent.FieldByName('C'+si+'NatID').AsString);
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('sex');
                                              Node.Set_text(qEvent.FieldByName('C'+si+'Sex').AsString);
                                              TempNode.appendChild(Node);
                                              //   23/02/21 [V5.9 R8.5] /MK Change - Changed format of dateofBirth node to 4 digit year to match server format
                                              Node := Doc.createElement('dateOfBirth');
                                              Node.Set_text(FormatDateTime('dd/MM/yyyy',qEvent.FieldByName('C'+si+'DOB').AsDateTime));
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('breedCode');
                                              Node.Set_text(qEvent.FieldByName('C'+si+'Breed').AsString);
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('animalNo');
                                              Node.Set_text(qEvent.FieldByName('C'+si+'ANo').AsString);
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('colourCode');
                                              Node.Set_text(qEvent.FieldByName('C'+si+'Colour').AsString);
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('herdBookNo');
                                              Node.Set_text(qEvent.FieldByName('C'+si+'HerdBook').AsString);
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('name');
                                              Node.Set_text(qEvent.FieldByName('C'+si+'Name').AsString);
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('birthWeight');
                                              if ( qEvent.FieldByName('C'+si+'Weight').AsFloat > 0 ) then
                                                 Node.Set_text(FloatToStr(qEvent.FieldByName('C'+si+'Weight').AsFloat))
                                              else
                                                 Node.Set_text('');
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('mortality');
                                              if ( qEvent.FieldByName('C'+si+'InHerd').AsBoolean ) then
                                                 Node.Set_text('Alive')
                                              else
                                                 Node.Set_text('Dead');
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('regStatus');
                                              Node.Set_text('Accepted');
                                              TempNode.appendChild(Node);
                                              Node := Doc.createElement('lastActionDate');
                                              Node.Set_text(FormatDateTime('dd/MM/yyyy hh:nn:ss',Now));
                                              TempNode.appendChild(Node);

                                              Result.appendChild(ChildNode);
                                           end;
                                     end;
                                  Result.appendChild(ChildNode);
                                  Doc.appendChild(Result);
                               finally
                                  if ( Doc <> nil ) then
                                     Doc := nil;
                               end;
                            end;
         end;
      except
         on e : Exception do
            ShowDebugMessage(e.Message);
      end;
   finally
      if ( qEvent <> nil ) then
         FreeAndNil(qEvent);
   end;
end;

function THerdSync.FixedEventDifferences ( ADifferences : TStringList; AExistEventId, AEventType : Integer ) : Boolean;
var
   i, iDiffPos : Integer;
   sLine : String;
   sNodeName, sDifference, sNewItem : String;
   dNewEventDate : TDateTime;
   Animal : TAnimal;
   sCalfNatID : String;
   iDiffsFixed : Integer;
begin
   Result := False;
   if ( ADifferences.Count = 0 ) or ( AExistEventId = 0 ) then Exit;
   iDiffsFixed := 0;
   for i := 0 to ADifferences.Count-1 do
      begin
         sLine := UpperCase(ADifferences.Strings[i]);
         sNodeName := ADifferences.Names[i];
         sDifference := ADifferences.Values[sNodeName];
         sNewItem := sDifference;
         Delete(sNewItem,Pos('|',sNewItem),Length(sNewItem)-Pos('|',sNewItem)+1);

         if ( Pos('natIdNo',sNodeName) > 0 ) then
            sCalfNatID := sNewItem;

         // Need to make all update procedures below functions so that I can get a return back.
         // Inc iDiffsFixed after each return.
         // Set Result of this function, FixedEventDifferences, to true
         // Then create XML file of nodes.
         if ( Pos('Difference',sNodeName) > 0 ) then
            begin
               sNodeName := Copy(sNodeName,Pos(' ',sNodeName)+1,Length(sNodeName)-Pos(' ',sNodeName));
               if ( sNodeName = 'animalId' ) then
                  begin
                     Animal := GetAnimal(sNewItem);
                     if ( Animal.Id > 0 ) then
                        if ( ChangedEventAnimalIdBySQL(AExistEventId,AEventType,Animal.Id) ) then
                           Inc(iDiffsFixed);
                  end
               else if ( sNodeName = 'eventDate' ) then
                  begin
                     dNewEventDate := StrToDate(sNewItem);
                     if ( dNewEventDate > 0 ) then
                        if ( ChangedEventDateBySQL(AExistEventId,dNewEventDate) ) then
                           Inc(iDiffsFixed);
                  end
               else if ( sNodeName = 'eventDescription' ) then
                  begin
                     if ( ChangedEventDescBySQL(AExistEventId,sNewItem) ) then
                        Inc(iDiffsFixed);
                  end
               else if ( sNodeName = 'sireNo' ) then
                  begin
                     Animal := GetAnimal(GetBull(sNewItem));
                     if ( (Animal <> nil) and (Animal.Id > 0) ) then
                        if ( ChangedCalvingSire(AExistEventId,Animal.Id) ) then
                           Inc(iDiffsFixed);
                  end
               else if ( sNodeName = 'sireBreedCode' ) then
                  begin
                     if ( (Animal <> nil) and (Animal.Id > 0) and (Length(sNewItem) > 0) ) then
                        if ( ChangedAnimalBreedBySQL(Animal.Id,GetBreedIdFromCode(sNewItem)) ) then
                           Inc(iDiffsFixed);
                  end
               else if ( sNodeName = 'sex' ) then
                  begin
                     if ( Length(sCalfNatID) > 0 ) then
                        begin
                           Animal := GetAnimal(sCalfNatId);
                           if ( Animal <> nil ) then
                             if ( ChangedAnimalRecordBySQL(Animal.Id,'Sex',sNewItem) ) then
                                Inc(iDiffsFixed);
                        end;
                  end
               else if ( sNodeName = 'dateOfBirth' ) then
                  begin
                     if ( Length(sCalfNatID) > 0 ) then
                        begin
                           Animal := GetAnimal(sCalfNatId);
                           if ( Animal <> nil ) then
                             if ( ChangedAnimalRecordBySQL(Animal.Id,'DateOfBirth',sNewItem) ) then
                                Inc(iDiffsFixed);
                        end;
                  end
               else if ( sNodeName = 'breedCode' ) then
                  begin
                     if ( Length(sCalfNatID) > 0 ) then
                        begin
                           Animal := GetAnimal(sCalfNatId);
                           if ( Animal <> nil ) then
                             if ( ChangedAnimalBreedBySQL(Animal.Id,GetBreedIdFromCode(sNewItem)) ) then
                                Inc(iDiffsFixed);
                        end;
                  end;
            end;
      end;
   Result := ( iDiffsFixed > 0 );
end;

procedure THerdSync.CreateConditionScoreEvents(AConditionScoreNode: IXMLDOMNodeList);
var
   i, j : Integer;
   EventNode : IXMLDOMNode;
   NatIdNo,
   Score,
   EventComment,
   ClientId : String;
   EventDate : TDateTime;
   ExistEventId : Integer;
begin
   if ( AConditionScoreNode = nil ) then Exit;

   for i := 0 to AConditionScoreNode.Length-1 do
      begin
         NatIdNo := '';
         ClientId := '';
         EventDate := 0;
         EventComment := '';
         Score := '';

         EventNode := AConditionScoreNode.item[i];

         for j := 0 to EventNode.childNodes.Get_length-1 do
            begin
               FChildNode := EventNode.childNodes[j];
               if ( FChildNode <> nil ) then
                  begin
                     if ( FChildNode.nodeName = 'animalId' ) then
                        NatIdNo := (FChildNode.text)
                     else if ( FChildNode.nodeName = 'clientId' ) then
                        ClientId := FChildNode.text
                     else if ( FChildNode.nodeName = 'eventDate' ) then
                        EventDate := ( StrToDate(FChildNode.text) )
                     else if ( FChildNode.nodeName = 'eventDescription' ) then
                        EventComment := FChildNode.text
                     else if ( FChildNode.nodeName = 'score' ) then
                        Score := FChildNode.text
                  end;
            end;

         if ( not(ValidateConditionScoreEventDetail(NatIdNo, FAnimalQuery.FieldByName('DateOfBirth').AsDateTime, EventDate)) ) then Continue;

         ExistEventId := FEventDataHelper.GetEventID(FAnimalQuery.FieldByName('ID').AsInteger,
                                                     FAnimalQuery.FieldByName('LactNo').AsInteger,
                                                     CCondScoreEvent, EventDate);
         if ( ExistEventId > 0 ) then
            begin
               AddEventToEventsExt(ExistEventId,CCondScoreEvent,ClientId,NatIdNo);
               Continue;
            end;

         FConditionSoreEvent := TConditionScoreEvent.Create('tConditionScore');
         try
            FConditionSoreEvent.Append;
            try
               FConditionSoreEvent.AnimalID := FAnimalQuery.FieldByName('ID').AsInteger;
               FConditionSoreEvent.AnimalLactNo := FAnimalQuery.FieldByName('LactNo').AsInteger;
               FConditionSoreEvent.AnimalHerdID := FAnimalQuery.FieldByName('HerdId').AsInteger;
               FConditionSoreEvent.EventDate := EventDate;
               FConditionSoreEvent.EventSource := sSMARTPHONE;
               if ( Length(EventComment) > 0 ) then
                  FConditionSoreEvent.EventComment := EventComment;
               try
                  FConditionSoreEvent.Score := StrToFloat(Score);
               except
               end;
               FConditionSoreEvent.IsSynchronized := True;

               FConditionSoreEvent.Post;

               AddEventToEventsExt(FConditionSoreEvent.EventID,CCondScoreEvent,ClientId,NatIdNo);
            except
               FConditionSoreEvent.Cancel;
               CreateLogEntry(Format('AnimalId: %d - Failed to create condition score event.',
                  [FAnimalQuery.FieldByName('ID').AsInteger]));
            end;
         finally;
            FConditionSoreEvent.Free;
         end;
      end;
end;


{ TRemedyTreatment }

constructor TRemedyTreatment.create;
begin
   OfficialHealthCode := THealthCodeObject.Create;
   FarmHealthCode := THealthCodeObject.Create;
   ApplicationMethod := TApplicationMethod.Create;
end;

destructor TRemedyTreatment.destroy;
begin
  inherited;
  FreeAndNil(FOfficialHealthCode);
  FreeAndNil(FFarmHealthCode);
  FreeAndNil(FApplicationMethod);
end;

{ TLookupObject }

function TLookupObject.GetCode: string;
begin
   if (length(FCode) > 6) then
      Result := Copy(FCode, 1, 6)
   else
      Result := FCode;
end;

function TLookupObject.GetIsValid: Boolean;
begin
   Result := (Trim(Code) <> '') and (Trim(Description) <> '');
end;

{ TServerDrug }

function TServerDrug.GetIsValid: Boolean;
begin
   Result := (Trim(VPANumber) <> '') and (Trim(Description) <> '');
end;

{ TSyncOutputParams }

constructor TSyncOutputParams.create(AParams: TStrings);
var
   I : Integer;
begin
   FDatabaseName := AParams[2];
   FResetSyncFlagsBeforeStart := False;
   FOutputDrugWithdrawalDates := True;

   for i := 3 to AParams.Count-1 do
      begin
         if (AParams[i]  = '-resetflags') then
            FResetSyncFlagsBeforeStart := True
         else if (AParams[i]  = '-outputDrugWithdrawalDates') then
            FOutputDrugWithdrawalDates := True;
      end;
end;

end.
