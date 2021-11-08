{
  07/01/2009 V3.9 R5.6 /SP Addtional Feature - Do not delete Sale/Purchase/Calving if user has not saved them in PDAEvents Review Screen.
                                             They should remain in the PDAEvents.db table until user saves or removes them.


  04/02/2009 [Rel V3.9 R4.9, V3.9 R5.9] /SP Bug Fix - Locate of ICBFHealth / HealthCode in genlook was not based on ListType field.

  22/04/2009 [Rel V3.9 R7.0] /SP Additional Events - Animal Welfare Disbudding, Castration, Meal Feeding and Weaning.

  02/07/2010 [V4.0 R3.9] /MK Additional Feature - Added New Field to PDAEvents for ElectronicID for Purchases
                                                  Allowed Import of ElectronicID from Purchases.

  27/09/12 [V5.0 R8.9] /MK Change - Allow Electronic ID be read in for Calving Events

  05/10/12 [V5.1 R0.2] /MK Additional Feature - Created ProcessTempMovements.

  18/12/13 [V5.2 R7.2] /MK Bug Fix - ProcessHealth - Quantity was used instead of RateofApplic.

  06/03/15 [V5.4 R1.9] /MK Bug Fix - ProcessServices, ProcessBullings - Was not checking if event date already existed - Johnny O'Hanlon.
                                   - All events - if no date was found in PDAEvents and EventSource is ParlourLink then the program was creating an event with todays date.

  10/03/15 [V5.4 R3.2] /MK Additional Feature - Changes made to ProcessServices to add ServiceBull from ParlourLink file
                                              - AddBullIDFromSireRegister - New function to get ParlourLink ServiceBull from Sires.db if it exists
                                                                            in Sires.db else add it as FR bull to NoneHerd.
                                              - GetBullByTagNo - New function to get bullid for bull if whole tag number supplied from ParlourEvents.
                                              - ActivateBullInUse - Activate bull in use if coming from ParlourEvents so bull exits in service event created.
                                              - Overall changes made to this unit to use the same logic of PDAEventsImport in ParlourEventsImport - Johnny O'Hanlon.  

  12/11/15 [V5.5 R0.5] /MK Change - ProcessHealth - Changes made bring in Milk Isolation events from Westfalia for Pat Aherne (7986).

  16/11/15 [V5.5 R0.7] /MK Bug Fix - ProcessHealth - Include esParlourLink after prior check for ParlourLink file type and ParlourType is Westfalia.

  18/12/15 [V5.5 R2.0] /MK Change - AddEventTableRecord - Change comment to Drying Off if not a health event.

  08/03/17 [V5.6 R6.6] /MK Bug Fix - Changed all instances of the byte variable to integers as when reading in a parlour file there can be more than 255 records.
                                   - AddBullIDFromSireRegister - Took out the requirement for the source value as its no longer available from the ICBF and when
                                                                 adding the bull from the sires table, if the source value didn't exists it would not save the bull.

  18/05/17 [V5.6 R8.3] /MK Change - ProcessServices - Search for bull by name as well as code because parlour file from Dairymaster Moo Monitor
                                                      contains the bull name not the code - requested Danny O'Connell.
                                  - AddBullIDFromSireRegister - Search the Name of the bull for the value that is passed on for the same reason as above.
                                                              - As we're now also searching the Name assign code of new bull created to code from register.

  14/09/17 [V5.7 R3.0] /MK Change - Changed WinData.AddToGroup to WinData.GroupManager.AddToGroup for more accurate calculation of FeedAllocation date based on purchase/birth date.

  22/09/17 [V5.7 R3.0] /MK Additional Feature - Added new Feeds unit along with FeedManager object.  

  19/10/17 [V5.7 R4.0] /MK Additional Feature - ProcessPDs - Allowed PD events to be imported from Parlour Link file - Richard Starrett.

  25/10/17 [V5.7 R4.1] /MK Change - ProcessHealth - Allocate the drying off event to the right lactation number.

  02/02/18 [V5.7 R7.8] /MK Additional Feature - ProcessHealth - CowManager parlour link can pass in the health level of the cow as a comment.

  04/05/18 [V5.8 R0.1] /MK Bug Fix - When saving the event check to see if the event exists already, this helps if event comes in twice from the parlour - Nick Kearney.   

  07/03/19 [V5.8 R8.0] /MK Change - CreateEvents - Removed this code as SQL for ElectronicID was not executing - no longer supporting PDA's anyway - SP.

  07/05/19 [V5.8 R9.2] /MK Additional Feature - SaveEvents - Added a ProgressBar here to show activity to the user.

  06/04/21 [V6.0 R0.1] /MK Bug Fix - ProcessHealth - Added new bRecordEvent variable to store whether to record the event or not to fix issue where
                                                     if event already exists, the focused record was moving to the next event but it wasn't being checked.
}

unit uCreateEvents;

interface

uses
   Classes, Sysutils, db, dbTables, dialogs, EventRecording, controls, GenTypesConst,
   ExtCtrls, Forms, Graphics, Windows, Parser, FileCtrl,
   PhoneLink, Groups, stdctrls, dxmdaset, uHerdLookup, DairyData, Feeds,
   uProgressIndicator;

type

  TPhoneLinkEvent = class
  private
    FEventType: Char;
    FAnimalNo: String;
    FEventDate: TDateTime;
  public
     property EventType : Char read FEventType write FEventType;
     property AnimalNo : String read FAnimalNo write FAnimalNo;
     property EventDate : TDateTime read FEventDate write FEventDate;
  end;

  TPhoneLinkSaleDeathEvent = class(TPhoneLinkEvent)
  private
    FSold: Boolean;
    FSaleWeight: Double;
    FPrice: Double;
    FCustomer: String;
    FGrade: string;
  public
     property Sold : Boolean read FSold write FSold;
     property Customer : String read FCustomer write FCustomer;
     property Price : Double read FPrice write FPrice;
     property SaleWeight : Double read FSaleWeight write FSaleWeight;
     property Grade : string read FGrade write FGrade;
  end;

  TPhoneLinkWeighingEvent = class(TPhoneLinkEvent)
  private
    FWeight: Double;
  public
     property Weight : Double read FWeight write FWeight;
  end;

  TCreateEvents = class
  private
    { Filename }

    EventsExist : Boolean;

    EventList : TStringList;
    FEventFile: String;
    EventSource : TEventFileSource;

    ErroneousItems : TStringList;

    EService : TServiceEvent;
    EBulling : TBullingEvent;
    EPregDiag : TPregDiagEvent;
    EHealth : THealthEvent;
    EWeighings : TWeighingEvent;
    EPurchase : TPurchaseEvent;
    NewAnimal : TAnimalRecord;
    EDisbudding : TDisbuddingEvent;
    ECastration : TCastrationEvent;
    EMealFeeding : TMealFeedingEvent;
    EWeaning : TWeaningEvent;

    PDATable, EventTable, LookUpDamSire  : TTable;
    UsedEvents : array of Integer;// stores id of event taken from PDATable.

    GenQuery, qBulls : TQuery;
    Parser : TParser;
    StrHerd : String;
    UserHerdID, NONEHerdID : Integer;

    LastServiceBull, LastHeatBull : string[10];
    LastPDStatus : TPDStatus;
    LastHealthCode, LastMediCode : string[6];
    LastBatchNo : string;
    LastBreedCode, LastColourCode : string[6];

    PL : TPhoneLink;

    PDACalvingsRecorded,
    PDAOtherEventsRecorded,
    PDAMovementsRecorded : Boolean;
    FNotEventsFound: Boolean;
    FAutoSaveCalvings : Boolean;

    procedure SetLinkType(const Value: TEventFileSource);
    function GetLinkType: TEventFileSource;
    procedure SetEventFile(const Value: String);
    procedure CreateTempTable;
    procedure GetBullList;
    procedure ProcessServices;
    procedure ProcessBullings;
    procedure ProcessPDs;
    procedure ProcessHealth;
    procedure ProcessCalvings;
    procedure ProcessSalesDeaths;
    procedure ProcessWeighings;
    procedure ProcessGroups;
    procedure ProcessPurchases;
    procedure ProcessMedicinePurchases;
    procedure ProcessFeedPurchases;
    procedure ProcessConditionScores;
    procedure ProcessDisbuddings;
    procedure ProcessCastrations;
    procedure ProcessMealFeedings;
    procedure ProcessWeanings;
    procedure ProcessTempMovements;

    procedure AddToUsedEvents(const id : Integer);
    procedure LocateHerdID;
    function ParamType(Param : string) : THealthParamType;
    function TrimUpperStr(Str : String) : String; // Trim and change to UpperCase
    function ExtractEventCode(MessageText : string) : Char;
    function ActiveMovement(AnimalID, HerdID : Integer) : Boolean;
    function ActiveMovementID(AnimalID : Integer) : Integer;
    procedure AddToErrorList(EType : Integer; const StrMessage : String);
    procedure SaveEvents;
    procedure ClearDeleted;
    procedure SaveErroneousList;
    function AddBullIDFromSireRegister (AAICode : String) : Integer;
    function GetBullByTagNo(var ABullID: Integer; var ABullNatID: String) : Boolean;
    procedure ActivateBullInUse(ABullID: Integer);
  public
    constructor create;
    destructor Destroy; override;
    function GetFile : string;
    procedure CreateEvents;
    property EventFile : String read FEventFile write SetEventFile;
    property LinkType  : TEventFileSource read GetLinkType write SetLinkType;
    property DisplayMsgIfNoEvents : Boolean read FNotEventsFound write FNotEventsFound;
  end;

const
   PDAAnimals = 'tPDAAnimals';

implementation
uses
   uSelectHerd, Tlhelp32, MenuUnit,
   KRoutines, KDBRoutines, uPhoneLinkEventsReview, uPreferences;

{ TCreateEvents }

constructor TCreateEvents.Create;
begin
   EventSource := esNoLink;
   ErroneousItems := TStringList.Create;
   LastPDStatus := pdUndefined;
   LastServiceBull := '';
   LastHeatBull := '';
   LastHealthCode := '';
   LastMediCode := '';
   LastBatchNo := '';
   LastBreedCode := '';
   LastColourCode := '';

   Parser := TParser.Create;
   Parser.FieldSep := ' ';
   with LookUpDamSire do
      begin
         LookUpDamSire := TTable.Create(nil);
         LookUpDamSire.DataBaseName := AliasName;
         LookUpDamSire.TableName := 'Animals';
         LookUpDamSire.Open;
      end;
   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName := AliasName;

   NONEHerdID := WinData.NONEHerdID;
   FNotEventsFound := False;
   PDACalvingsRecorded := False;
   PDAOtherEventsRecorded := False;
   PDAMovementsRecorded := False;

   FAutoSaveCalvings := Preferences.ValueAsBoolean[cGSCalving_AutoCompletePDA];
end;

destructor TCreateEvents.Destroy;
var
  i, etype : Integer;

begin
   if ( ErroneousItems <> nil ) then
      FreeAndNil(ErroneousItems);

   if ( Parser <> nil ) then
      Parser.Free;

   if ( LookupDamSire <> nil ) then
      begin
         LookUpDamSire.Close;
         LookUpDamSire.Free;
      end;
   if ( EventTable <> nil ) then
      begin
         EventTable.Close;
         EventTable.DeleteTable;
         EventTable.Free;
      end;

   if ( qBulls <> nil ) then
      begin
         qBulls.Close;
         qBulls.Free;
      end;

   if ( EventSource = esPDA ) and ( PDATable <> nil ) then
      begin
         with PDATable do
            begin
               while not eof do
                  begin
                     for i := 0 to Length(UsedEvents)-1 do
                       if UsedEvents[i] = FieldValues['id'] then
                          begin
                             if (FieldByName('Code').AsString[1] in ['A','M','C']) then // A=Purchase, M=SaleDeath, C=Calving
                                begin
                                   // only remove from PDAEvents table if the event has
                                   // been created from the tSMSEvents table in phonelinkreview

                                   if FieldByName('Code').AsString[1] = 'A' then
                                      etype := CPurchaseEvent
                                   else if FieldByName('Code').AsString[1] = 'M' then
                                      etype := CSaleDeathEvent
                                   else
                                      etype := CCalvingEvent;

                                   with TQuery.Create(nil) do
                                      try
                                         DatabaseName := AliasName;
                                         SQL.Clear;
                                         SQL.Add('Select AnimalID From tSMSEvents Where AnimalID=:AID And EventType=:ET And EventDate=:ED');
                                         Params[0].AsInteger := PDATable.FieldByName('AnimalID').AsInteger;
                                         Params[1].AsInteger := etype;
                                         Params[2].AsDateTime := PDATable.FieldByName('Date').AsDateTime;
                                         Open;
                                         try
                                            if RecordCount <= 0 then
                                               // event has been completed in review screen, remove from PDAEvents table.
                                               PDATable.Delete;
                                         finally
                                            Close;
                                         end;
                                      finally
                                         Free;
                                      end;
                                end
                             else
                                Delete; // remove from table if the event has been edited;
                          end;
                     Next;
                  end;
              DBIForceWrite(PDATable);
              PDATable.Close;
            end;
         PDATable.Free;
      end;

   with TTable.Create(nil) do
      try
         DAtabaseName := AliasName;
         TableName    := PDAAnimals;
         if Exists then
            DeleteTable;
      finally
         Free;
      end;
   SetLength(UsedEvents, 0);
   inherited;
end;

function TCreateEvents.GetFile : String;
begin
   Result := '';
   if FileExists(FEventFile) then
      Result := FEventFile;
end;

procedure TCreateEvents.CreateTempTable;
begin
   EventTable := TTable.Create(nil);
   EventTable.DataBaseName := AliasName;
   EventTable.TableName := 'SmsEvents';
   if EventTable.Exists then
      EventTable.DeleteTable;
   EventTable.FieldDefs.Clear;
   EventTable.FieldDefs.Add('ID',ftAutoInc);
   EventTable.FieldDefs.Add('AnimalID',ftInteger,0,False);
   EventTable.FieldDefs.Add('AnimalNo',ftString,10,False);
   EventTable.FieldDefs.Add('SortAnimalNo',ftString,10,False);
   EventTable.FieldDefs.Add('NatIDNum',ftString,20,False);
   EventTable.FieldDefs.Add('SortNatID',ftString,20,False);
   EventTable.FieldDefs.Add('LactNo',ftInteger,0,False);
   EventTable.FieldDefs.Add('HerdID',ftInteger,0,False);
   EventTable.FieldDefs.Add('BullID',ftInteger,0,False);
   EventTable.FieldDefs.Add('BullNo',ftString,10,False);
   EventTable.FieldDefs.Add('Pregnant',ftBoolean,0,False);
   EventTable.FieldDefs.Add('HealthCode',ftInteger,0,False);
   EventTable.FieldDefs.Add('FarmCode',ftInteger,0,False);
   EventTable.FieldDefs.Add('EventType',ftInteger,0,False);
   EventTable.FieldDefs.Add('DryOffEvent',ftBoolean,0,False);
   EventTable.FieldDefs.Add('EventDate',ftDate,0,False);
   EventTable.FieldDefs.Add('Comment',ftString,30,False);
   EventTable.FieldDefs.Add('CalfNo',ftString,20,False);
   EventTable.FieldDefs.Add('CalfSex',ftString,20,False);
   EventTable.FieldDefs.Add('EventID',ftInteger,0,False); // allows editing of event.
   EventTable.FieldDefs.Add('CalfRecorded',ftBoolean,0,False);
   EventTable.FieldDefs.Add('DrugUsed',ftInteger);
   EventTable.FieldDefs.Add('DrugPurchID',ftInteger);
   EventTable.FieldDefs.Add('BatchNo',ftString,20);
   EventTable.FieldDefs.Add('Deleted',ftBoolean);
   EventTable.FieldDefs.Add('CalfBreed',ftString,6);
   EventTable.FieldDefs.Add('CalfColour',ftString,6);
   EventTable.FieldDefs.Add('CalfBreedID',ftInteger);
   EventTable.FieldDefs.Add('CalfColourID',ftInteger);
   EventTable.FieldDefs.Add('CalfNo2',ftString,20,False);
   EventTable.FieldDefs.Add('CalfSex2',ftString,20,False);
   EventTable.FieldDefs.Add('CalfColour2',ftString,6);
   EventTable.FieldDefs.Add('CalfAnimalNo',ftString,10);
   EventTable.FieldDefs.Add('CalfBreeding',ftBoolean);
   EventTable.FieldDefs.Add('CalfDead',ftBoolean);
   EventTable.FieldDefs.Add('CalfMortality',ftInteger);
   EventTable.FieldDefs.Add('CalfName',ftstring,30);
   EventTable.FieldDefs.Add('Weight',ftFloat);
   EventTable.FieldDefs.Add('Price',ftFloat);
   EventTable.FieldDefs.Add('Grade',ftstring,15);
   EventTable.FieldDefs.Add('MedAdmin',ftInteger);
   EventTable.FieldDefs.Add('ApplicMethod',ftInteger);
   EventTable.FieldDefs.Add('NoDays',ftInteger);
   EventTable.FieldDefs.Add('NoTimes',ftInteger);
   EventTable.FieldDefs.Add('Quantity',ftFloat);
   EventTable.FieldDefs.Add('NewGroup',ftString,30);
   EventTable.FieldDefs.Add('NewGroupID',ftInteger);
   EventTable.FieldDefs.Add('Sold',ftBoolean);
   EventTable.FieldDefs.Add('CustomerID',ftInteger);
   EventTable.FieldDefs.Add('DisposalPlace',ftInteger);
   EventTable.FieldDefs.Add('NoOfCalves',ftInteger);
   EventTable.FieldDefs.Add('DaysInCalf',ftInteger);
   EventTable.FieldDefs.Add('SireID',ftInteger);
   EventTable.FieldDefs.Add('BirthType',ftInteger);
   EventTable.FieldDefs.Add('PurchasePrice',ftFloat);
   EventTable.FieldDefs.Add('HerdIdentity',ftInteger);
   EventTable.FieldDefs.Add('NationalID',ftString,20);
   EventTable.FieldDefs.Add('SupplierID',ftInteger);
   EventTable.FieldDefs.Add('BuyerID',ftInteger);
   EventTable.FieldDefs.Add('DisposalPlaceID',ftInteger);
   EventTable.FieldDefs.Add('CauseOfDeath',ftInteger);
   EventTable.FieldDefs.Add('Score',ftFloat);
   EventTable.FieldDefs.Add('DBVet',ftInteger);
   EventTable.FieldDefs.Add('WNWeight',ftFloat);
   EventTable.FieldDefs.Add('WNDocility',ftInteger);
   EventTable.FieldDefs.Add('WNQuality',ftInteger);
   EventTable.FieldDefs.Add('WNWeighingOnDate',ftDateTime);
   //   27/09/12 [V5.0 R8.9] /MK Change - Added ElectronicID field.
   EventTable.FieldDefs.Add('ElectronicID',ftString,20);
   EventTable.FieldDefs.Add('MovementType',ftString,12);

   EventTable.IndexDefs.Clear;
   EventTable.IndexDefs.Add('iID','ID',[ixPrimary]);
   EventTable.IndexDefs.Add('iEventDate','EventDate',[ixCaseInsensitive]);
{
   EventTable.IndexDefs.Add('iSortAnimalNo','SortAnimalNo',[ixCaseInsensitive]);
   EventTable.IndexDefs.Add('idSortAnimalNo','SortAnimalNo',[ixCaseInsensitive,ixDescending]);
   EventTable.IndexDefs.Add('iSortNatID','SortNatID',[ixCaseInsensitive]);
   EventTable.IndexDefs.Add('idSortNatID','SortNatID',[ixCaseInsensitive,ixDescending]);
}
   EventTable.CreateTable;
   EventTable.Open;
end;

procedure TCreateEvents.CreateEvents;
var
   i : Integer;
   sEventType : String;
   PLRes : Integer;
   PDAEventsExist : Boolean;
   LastHerdID : Integer;
   CreateSexField : Boolean;
begin
   PDAEventsExist := False;
   EventList := TStringList.Create;
   try
      if EventSource = esNokiaLink then
         begin
            PL := TPhoneLink.Create;
            try
               PL.ShowMain(PLRes);
               if PLRes = cPLSuccess then
                  begin
                     PL.LoadFromFile( EventList );
                     PL.SaveToFile;
                  end
            finally
               PL.Free;
            end;
            try
               Menuform.Update;
            except
            end;
         end
      else if EventSource = esPDA then
         begin
            if not DirectoryExists(PDAImportDir) then
               CreateDir(PDAImportDir);
            if not DirectoryExists(PDAImportDir+'\Backup') then
               CreateDir(PDAImportDir+'\Backup');
            if FileExists( IncludeTrailingBackslash( PDAImportDir ) + 'PDAEvents.DB' ) then
               begin
                  CopyFile( PChar(IncludeTrailingBackslash( PDAImportDir ) + 'PDAEvents.DB' ),
                            PChar(IncludeTrailingBackslash( PDAImportDir ) + 'Backup\PDAEvents '+FormatDateTime('ddmmyy hh.mm',now())+'.DB'), False );
               end
            else
               begin
                  //MessageDlg('The PDA event file does not exist.'+cCRLF+'You need to HotSync on the Kingswood CowPad before downloading events. ',mtError,[mbOK],0);
                  Exit;
               end;

            //   07/03/19 [V5.8 R8.0] /MK Change - Removed this code as SQL for ElectronicID was not executing - no longer supporting PDA's anyway - SP.
            {
            SetLength(UsedEvents, 0);
            with TQuery.Create(nil) do
               try
                  DatabaseName := PDAImportDir;
                  SQL.Clear;
                  SQL.Add('ALTER TABLE PDAEvents DROP Sex');
                  try
                     ExecSQL;
                  except
                  end;
                  SQL.Clear;
                  SQL.Add('ALTER TABLE PDAEvents ADD Sex CHAR(6)');
                  try
                     ExecSQL;
                  except
                  end;
                  SQL.Clear;
                  SQL.Add('ALTER TABLE PDAEvents ADD ElectronicID CHAR(20)');
                  try
                     ExecSQL;
                  except
                  end;
               finally
                  Free;
               end;
            }

            PDATable := TTable.Create(nil);
            PDATable.DatabaseName := PDAImportDir;
            PDATable.TableName := 'PDAEvents.DB';
            PDAEventsExist := PDATable.Exists;
            if PDAEventsExist then
               begin
                  PDATable.Active := True;
                  PDAEventsExist := ( PDATable.RecordCount > 0 );
                  if PDAEventsExist then
                     begin
                        PDATable.First;
                        while not PDATable.Eof do
                           begin
                              PDATable.Edit;
                              PDATable.FieldByName('DataDir').AsString := UpperCase(PDATable.FieldByName('DataDir').AsString);
                              PDATable.Post;
                              PDATable.Next;
                           end;
                        PDATable.First;

                     end;
               end;
         end
      else if EventSource = esParlourLink then
         begin
            SetLength(UsedEvents, 0);
            EventList.LoadFromFile(FEventFile);
         end;

      if ( EventList.Count > 0 ) or ( PDAEventsExist ) then
         begin
            if PDAEventsExist then
               begin
                  LastHerdID := WinData.UserDefaultHerdID;
                  WinData.UserDefaultHerdID := 0;
                  MenuForm.SetUpQuery(True);
               end;

            LocateHerdID;
            SaveEvents;

            if PDAEventsExist then
               begin
                  WinData.UserDefaultHerdID := LastHerdID;
                  MenuForm.SetUpQuery(True);
               end;
         end
      else
         case EventSource of
            esNokiaLink : case PLRes of
                             cPLFailedToInitialize : MessageDlg('PhoneLink: Failed to initialize.', mtInformation, [mbOK], 0);
                             // cPLSuccess : events found
                             cPLNoEventsFound : MessageDlg('PhoneLink: No events found.', mtInformation, [mbOK], 0);
                             cPLSeachCancelled : MessageDlg('PhoneLink: Search cancelled.', mtInformation, [mbOK], 0);
                             cPLFailedToConnect : MessageDlg('PhoneLink: Failed to connet to handset.', mtInformation, [mbOK], 0);
                          end;
            esPDA : if DisplayMsgIfNoEvents then MessageDlg('No PDA events have been found',mtInformation,[mbOK],0);
         end;
   finally
      FreeAndNil(EventList);
   end;
end;

procedure TCreateEvents.LocateHerdID;
begin
   if LinkType = esPDA then
      begin
         strHerd := UpperCase(DataDir);
         if strHerd = '' then
            raise Exception.Create('Cannot find herd identity');
      end
   else
      begin
         if WinData.OwnerFile.RecordCount > 2 then
            UserHerdID := uSelectHerd.CreateAndShow
         else
            with WinData.OwnerFile do
               begin
                  First;
                  while not (Eof) do
                     begin
                        if UpperCase(WinData.OwnerFile.FieldByName('HerdIdentity').AsString) <> 'NONE' then
                            begin
                               UserHerdID := WinData.OwnerFile.FieldByName('ID').AsInteger;
                               Break;
                            end;
                        Next;
                     end;
               end;
          if ( UserHerdID <= 0 ) then
             begin
                MessageDlg('No valid Herd Identity can be found',mtError,[mbOK],0);
                Abort;
             end;
         if WinData.OwnerFile.Locate('ID', UserHerdID,[]) then
           strHerd := UpperCase(WinData.OwnerFile.FieldByName('HerdIdentity').AsString);
      end;
end;

procedure TCreateEvents.SaveEvents;
var
   MsgText : string;
   i : Integer;
begin
   try
      //   07/05/19 [V5.8 R9.2] /MK Additional Feature - Added a ProgressBar here to show activity to the user.
      ShowProgressIndicator('Processing Events',0,21,1);
      ProgressIndicator.Max := 21;
      ProgressIndicator.Position := 1;
      Application.ProcessMessages;

      for i := 1 to 21 do
         begin
            case i of
                1 : CreateTempTable;
                2 : GetBullList;
                3 : ProcessMedicinePurchases;
                4 : ProcessFeedPurchases;
                5 : ProcessPurchases;
                6 : ProcessServices;
                7 : ProcessBullings;
                8 : ProcessPDs;
                9 : ProcessHealth;
               10 : ProcessConditionScores;
               11 : ProcessCalvings;
               12 : ProcessSalesDeaths;
               13 : ProcessWeighings;
               14 : ProcessGroups;
               15 : ProcessDisbuddings;
               16 : ProcessCastrations;
               17 : ProcessMealFeedings;
               18 : ProcessWeanings;
               19 : ProcessTempMovements;
               // now clear unwanted events.
               20 : ClearDeleted;
               21 : SaveErroneousList;
            end;
           ProgressIndicator.Position := ProgressIndicator.Position+1;
           Application.ProcessMessages;
         end;

      if ( PDAOtherEventsRecorded = True ) then
          begin
             if (( PDACalvingsRecorded = False ) and ( PDAMovementsRecorded = False )) then
                begin
                   if ( EventSource <> esParlourLink ) then
                      begin
                         if Application.MessageBox('All PDA events have been saved.'+cCRLF+cCRLF+
                                                   'Do you want to review these events?','PDALink',
                                                   MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = idYes then
                            ShowTheForm(TDBDataSet(EventTable), ErroneousItems, EventList, LinkType )
                      end
                   else
                      begin
                         if Application.MessageBox('All Parlour Link events have been saved.'+cCRLF+cCRLF+
                                                   'Do you want to review these events?','ParlourLink',
                                                   MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = idYes then
                            ShowTheForm(TDBDataSet(EventTable), ErroneousItems, EventList, LinkType )
                      end
                end
             else
                begin
                   if ( EventSource <> esParlourLink ) then
                      begin
                         Application.MessageBox('PDA Calving\Movement events must be completed.'+cCRLF+
                                                'All other PDA events have been saved.'+ cCRLF+ cCRLF+
                                                'Click OK to begin the completion of Calving\Movement events.', 'PDALink',MB_OK + MB_ICONWARNING);
                         ShowTheForm(TDBDataSet(EventTable), ErroneousItems, EventList, LinkType );
                      end
                   else
                      begin
                         Application.MessageBox('ParlourLink Calving\Movement events must be completed.'+cCRLF+
                                                'All other ParlourLink events have been saved.'+ cCRLF+ cCRLF+
                                                'Click OK to begin the completion of Calving\Movement events.', 'ParlourLink',MB_OK + MB_ICONWARNING);
                         ShowTheForm(TDBDataSet(EventTable), ErroneousItems, EventList, LinkType );
                      end;
                end
          end
      else if (( PDACalvingsRecorded = True ) or ( PDAMovementsRecorded = True )) then
         begin

            if not (( FAutoSaveCalvings=True ) and (PDAMovementsRecorded=False)) then
               begin
                  Application.MessageBox('PDA Calving\Movement events must be completed.'+cCRLF+cCRLF+
                                         'Click OK to begin the completion of Calving\Movement events.', 'PDALink',MB_OK + MB_ICONWARNING);
                  ShowTheForm(TDBDataSet(EventTable), ErroneousItems, EventList, LinkType );
               end;
         end;
   finally
      ProgressIndicator.Close;
   end;
end;

procedure TCreateEvents.ProcessHealth;
var
   i : Integer;
   Medicine, GenLook, MediPurch, MedAdmin : TTable;
   WestfaliaHealthLineFound,
   bRecordEvent,
   CancelDryOff : Boolean;
   ParlourInfo : TParlourDetails;
   HealthDryRecord : THealthDryRecord;
   iEventLactNo : Integer;

   function ParseHealthDryOff(FLine : String) : THealthDryRecord;
   var
      Index : integer;
      sDay,
      sMonth,
      sYear,
      sEventDate,
      PossibleBatchNo : string;
   begin
      Result.EventType := '';
      Result.AnimalNo  := '';
      Result.EventDate := 0;
      Result.MedicineCode := '';
      Result.HealthCode   := '';
      Result.DrugBatchNo := '';

      case EventSource of
         esNokiaLink   : begin
                            Parser.FieldSep := cSpaceDelimiter;
                            Parser.Parse(FLine);
                            Result.EventType := Parser.ParseFields[2];
                            Result.AnimalNo  := TrimUpperStr(Parser.ParseFields[3]);
                            Result.EventDate := StrToDate(Parser.ParseFields[1]);
                            PossibleBatchNo := '';
                            Index := 4;
                            while ( Index <= 6 ) do
                               begin
                                  if TrimUpperStr(Parser.ParseFields[Index]) <> '' then
                                     begin
                                        { Check if param is possible batchno, it is important to retain
                                          batchno value even if it doesn't have successful match in
                                          MediPur table. By storing this possible batchno it might help
                                          the user when editing the health event as to what the batchno
                                          it should have been.}
                                        if ( Length(Parser.ParseFields[Index]) > 5 ) then
                                           PossibleBatchNo := Parser.ParseFields[Index];

                                        case ParamType(Parser.ParseFields[Index]) of
                                           hptMedicineCode    : Result.MedicineCode := TrimUpperStr(Parser.ParseFields[Index]);
                                           hptHealthCode      : Result.HealthCode := TrimUpperStr(Parser.ParseFields[Index]);
                                           hptMedicineBatchNo : Result.DrugBatchNo := TrimUpperStr(Parser.ParseFields[Index]);
                                        else
                                           begin
                                              if Result.EventType = cHealthCode then
                                                 AddToErrorList(cHealthEvent, 'Med. Code/Health Code/Batch No "'+Parser.ParseFields[Index]+'" not found in database')
                                              else
                                                 AddToErrorList(cDryOffEvent, 'Med. Code/Health Code/Batch No "'+Parser.ParseFields[Index]+'" not found in database')
                                           end;
                                        end;
                                     end;
                                  Inc(Index);
                               end;

                               if ( Result.DrugBatchNo = '' ) then
                                  if PossibleBatchNo <> '' then Result.DrugBatchNo := PossibleBatchNo; // store possbible batchno if no successful match.

                               if ( Result.MedicineCode <> '' ) then
                                  LastMediCode := Result.MedicineCode
                               else if ( LastMediCode <> '' ) then
                                  Result.MedicineCode := LastMediCode;

                                if ( Result.HealthCode = '' ) then
                                   LastHealthCode := Result.HealthCode
                                else if ( LastHealthCode <> '' ) then
                                   Result.HealthCode := LastHealthCode;

                                if ( Result.DrugBatchNo <> '' ) then
                                   LastBatchNo := Result.DrugBatchNo
                                else if ( LastBatchNo <> '' ) then
                                   Result.DrugBatchNo := LastBatchNo;

                         end;
         esParlourLink : begin
                            // If file is a Westfalia export file then only export cow number and event date if indicator is 1.
                            // 0 = Normal, 1 = Antibiotics and 2 = Do Not Milk
                            // There are other records on the file that have date after the indicator but these are not the events
                            // that the user creates by pressing buttons on the machine in the parlour - Pat Aherne (7986).
                            if ( (UpperCase(ParlourInfo.ParlourType) = 'WESTFALIA4.3') or (UpperCase(ParlourInfo.ParlourType) = 'WESTFALIA') ) then
                               begin
                                  Result.EventType := cHealthCode;
                                  Result.AnimalNo  := StripAllSpaces(Copy(FLine,9,6));
                                  if ( Copy(FLine,19,1) = '1' ) then
                                     begin
                                        sDay := '';
                                        sMonth := '';
                                        sYear := '';
                                        sEventDate := '';
                                        sDay := Copy(FLine,35,2);
                                        sMonth := Copy(FLine,33,2);
                                        sYear := Copy(FLine,29,4);
                                        if ( Length(sDay) > 0 ) and ( sDay <> '??' ) then
                                           sEventDate := sDay + '/' + sMonth + '/' + sYear;
                                        if ( Length(sEventDate) > 0 ) then
                                           Result.EventDate := StrToDate(sEventDate);
                                     end;
                                  Result.MedicineCode := '';
                                  Result.HealthCode   := '';
                                  Result.DrugBatchNo := '';
                               end
                            else
                               begin
                                  Parser.FieldSep := cCommaDelimiter;
                                  Parser.Parse(FLine);
                                  Result.EventType := Parser.ParseFields[1];
                                  Result.AnimalNo  := TrimUpperStr(Parser.ParseFields[2]);
                                  Result.EventDate := CheckDate(TrimUpperStr(Parser.ParseFields[3]), True);
                                  Result.MedicineCode := '';
                                  Result.HealthCode   := '';
                                  Result.DrugBatchNo := '';
                                  Result.Comment := Parser.ParseFields[4];
                               end;
                         end;
      end;
   end;

   procedure AddEventTableRecord;
   begin
      with HealthDryRecord do
         begin
            EventTable.Append;
            EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
            EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
            EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
            EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
            EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
            EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
            EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
            if EventType = cHealthCode then
               begin
                  EventTable.FieldByName('EventType').AsInteger := CHealthEvent;
                  EventTable.FieldByName('DryOffEvent').AsBoolean := False
               end
            else
               begin
                  EventTable.FieldByName('EventType').AsInteger := CDryOffEvent;
                  EventTable.FieldByName('DryOffEvent').AsBoolean := True;
               end;

            if ( EventDate > 0 ) then
               EventTable.FieldByName('EventDate').AsDateTime := EventDate
            else if ( EventSource <> esParlourLink ) then
               EventTable.FieldByName('EventDate').AsDateTime := Date;

            if MedicineCode <> '' then
               if Medicine.Locate('DrugCode', MedicineCode, [loCaseInsensitive]) then
                  EventTable.FieldByName('DrugUsed').AsInteger := Medicine.FieldByName('ID').AsInteger;

            if HealthCode <> '' then
               begin
                  // 04/02/2009 [Rel V3.9 R4.9, V3.9 R5.9] /SP Bug Fix - Locate of ICBFHealth / HealthCode in genlook was not based on ListType field.
                  if GenLook.Locate('ListType;LookupCode', VarArrayOf([LHealthCode, HealthCode]), [loCaseInsensitive]) then
                     EventTable.FieldByName('HealthCode').AsInteger := GenLook.FieldByName('ID').AsInteger;
               end;

            if DrugBatchNo <> '' then
               begin
                  EventTable.FieldByName('BatchNo').AsString := DrugBatchNo;
                  { try locate the DrugPurchID From the Batch Number }
                  if MediPurch.Locate('BatchNo', DrugBatchNo, [loCaseInsensitive]) then
                     begin
                        EventTable.FieldByName('DrugPurchID').AsInteger := MediPurch.FieldByName('ID').AsInteger;
                        { try locate the DrugUsed From the Drug Purchase ID }
                        if Medicine.Locate('ID', MediPurch.FieldByName('DrugID').AsInteger, []) then
                           EventTable.FieldByName('DrugUsed').AsInteger := Medicine.FieldByName('ID').AsInteger
                        else
                           AddToErrorList(EventTable.FieldByName('EventType').AsInteger, 'Health event: No Drug is associated with given Drug Batch Number');
                     end;
               end;

            //   02/02/18 [V5.7 R7.8] /MK Additional Feature - CowManager parlour link can pass in the health level of the cow as a comment.
            if EventType = cHealthCode then
               begin
                  if ( Length(Comment) > 0 ) then
                     EventTable.FieldByName('Comment').AsString := Comment
                  else
                     EventTable.FieldByName('Comment').AsString := 'Health'
               end
            else
               //   18/12/15 [V5.5 R2.0] /MK Change - Change comment to Drying Off if not a health event.
               EventTable.FieldByName('Comment').AsString := 'Drying Off';

            EventTable.Post;
            if ( EventSource = esParlourLink ) then
               begin
                  AddToUsedEvents(EventTable.FieldByName('ID').AsInteger);
                  if not PDAOtherEventsRecorded then
                     PDAOtherEventsRecorded := True;
               end;
         end;
   end;

begin
   Medicine := TTable.Create(nil);
   GenLook := TTable.Create(nil);
   MediPurch := TTable.Create(nil);
   MedAdmin := TTable.Create(nil);
   ParlourInfo := TParlourDetails.Create;
   try
      try
         Medicine.DataBaseName := AliasName;
         Medicine.TableName := 'Medicine';
         Medicine.Open;

         GenLook.DataBaseName := AliasName;
         GenLook.TableName := 'GenLook';
         GenLook.Open;

         MediPurch.DataBaseName := AliasName;
         MediPurch.TableName := 'MediPur';
         MediPurch.Open;

         MedAdmin.DataBaseName := AliasName;
         MedAdmin.TableName := 'MedAdmin';
         MedAdmin.Open;

         EventTable.Active := True;

         if ( EventSource = esParlourLink ) and
            ( (UpperCase(ParlourInfo.ParlourType) = 'WESTFALIA4.3') or (UpperCase(ParlourInfo.ParlourType) = 'WESTFALIA') ) then
            begin
               WestfaliaHealthLineFound := False;
               for i := 0 to EventList.Count-1 do
                  if ( Length(EventList.Strings[i]) > 0 ) then
                     begin
                        if ( not(WestfaliaHealthLineFound) ) then
                           WestfaliaHealthLineFound := EventList.Strings[i] = 'DN000000Cow\6.0,Met\5.0,HldDt\9,RstDt\9';
                        if ( WestfaliaHealthLineFound ) then
                           begin
                               if ( Copy(EventList.Strings[i],20,8) = '????????' ) then
                                  begin
                                     HealthDryRecord := ParseHealthDryOff(EventList.Strings[i]);
                                     with HealthDryRecord do
                                        begin
                                           if ( EventDate > 0 ) and ( LookUpDamSire.Locate('AnimalNo;HerdID;InHerd', VarArrayOf([AnimalNo, UserHerdID, TRUE]), [loCaseInsensitive]) ) then
                                              AddEventTableRecord
                                           else
                                              AddToErrorList(EventTable.FieldByName('EventType').AsInteger, 'Unable to create Health event: Animal Number '+AnimalNo+' not found in Herd '+strHerd+'');
                                        end;
                                  end;
                           end;
                     end;
            end;

         //   16/11/15 [V5.5 R0.7] /MK Bug Fix - Include esParlourLink here as prior chech also checks for parlour type.
         if ( EventSource in [esParlourLink, esNoLink, esNokiaLink, esSiemensLink, esSmartPhone] ) then
            for i := 0 to EventList.Count-1 do
               if ( Length(EventList.Strings[i]) > 0 ) then
                  begin
                     if ( ExtractEventCode(EventList.Strings[i]) in [cHealthCode, cDryOffCode] ) then
                        begin
                           HealthDryRecord := ParseHealthDryOff(EventList.Strings[i]);
                           with HealthDryRecord do
                              if ( EventDate > 0 ) and ( LookUpDamSire.Locate('AnimalNo;HerdID;InHerd', VarArrayOf([AnimalNo, UserHerdID, TRUE]), [loCaseInsensitive]) ) then
                                 AddEventTableRecord
                              else
                                 AddToErrorList(EventTable.FieldByName('EventType').AsInteger, 'Unable to create Health event: Animal Number '+AnimalNo+' not found in Herd '+strHerd+'');
                        end;
                  end;

         if ( EventSource = esPDA ) then
            with PDATable do
               begin
                  Filter := '(((DataDir)='''+StrHerd+''') and ( Code=''H'' or Code=''D'' ))';
                  Filtered := True;
                  EventsExist := FindFirst;
                  while EventsExist do
                     begin
                        if ( FieldByName('Date').AsDateTime <= Date ) then
                           begin
                              if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                                 begin
                                    EventTable.Append;
                                    EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                    EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                    EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                    EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                    EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                    EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                    if FieldByName('Code').AsString = cHealthCode then
                                       begin
                                          EventTable.FieldByName('EventType').AsInteger := CHealthEvent;
                                          EventTable.FieldByName('DryOffEvent').AsBoolean := False
                                       end
                                    else
                                       begin
                                          EventTable.FieldByName('EventType').AsInteger := CDryOffEvent;
                                          EventTable.FieldByName('DryOffEvent').AsBoolean := True;
                                       end;

                                    if ( FieldByName('Date').AsDateTime > 0 ) then
                                       EventTable.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;

                                    if FieldByName('Medicine').AsString <> '' then
                                       if Medicine.Locate('DrugCode', FieldByName('Medicine').AsString, [loCaseInsensitive]) then
                                          EventTable.FieldByName('DrugUsed').AsInteger := Medicine.FieldByName('ID').AsInteger;

                                    if ( FieldByName('ICBFHealth').AsString <> '' ) then
                                       begin
                                          // 04/02/2009 [Rel V3.9 R4.9, V3.9 R5.9] /SP Bug Fix - Locate of ICBFHealth / HealthCode in genlook was not based on ListType field.
                                          if GenLook.Locate('ListType;LookupCode', VarArrayOf([LHealthCode, FieldByName('ICBFHealth').AsString]), [loCaseInsensitive]) then
                                             EventTable.FieldByName('HealthCode').AsInteger := GenLook.FieldByName('ID').AsInteger;
                                       end;

                                    if FieldByName('HealthCode').AsString <> '' then
                                       begin
                                          // 04/02/2009 [Rel V3.9 R4.9, V3.9 R5.9] /SP Bug Fix - Locate of ICBFHealth / HealthCode in genlook was not based on ListType field.
                                          if GenLook.Locate('ListType;LookupCode', VarArrayOf([LHealthCode, FieldByName('HealthCode').AsString]), [loCaseInsensitive]) then
                                             EventTable.FieldByName('FarmCode').AsInteger := GenLook.FieldByName('ID').AsInteger;
                                       end;

                                    if FieldByName('BatchNum').AsString <> '' then
                                       begin
                                          EventTable.FieldByName('BatchNo').AsString := FieldByName('BatchNum').AsString;
                                          { try locate the DrugPurchID From the Batch Number }
                                          if MediPurch.Locate('BatchNo', FieldByName('BatchNum').AsString, [loCaseInsensitive]) then
                                             begin
                                                EventTable.FieldByName('DrugPurchID').AsInteger := MediPurch.FieldByName('ID').AsInteger;
                                                { try locate the DrugUsed From the Drug Purchase ID }
                                                if Medicine.Locate('ID', MediPurch.FieldByName('DrugID').AsInteger, []) then
                                                   EventTable.FieldByName('DrugUsed').AsInteger := Medicine.FieldByName('ID').AsInteger
                                                else
                                                   AddToErrorList(EventTable.FieldByName('EventType').AsInteger, 'Health event: No Drug is associated with given Drug Batch Number');
                                             end;
                                       end;

                                    EventTable.FieldByName('MedAdmin').AsInteger := FieldByName('AdminBy').AsInteger;
                                    EventTable.FieldByName('ApplicMethod').AsInteger := FieldByName('ApplicMethod').AsInteger;
                                    if FieldByName('NoDays').AsInteger > 0 then
                                       EventTable.FieldByName('NoDays').AsInteger := FieldByName('NoDays').AsInteger;
                                    if FieldByName('NoTimes').AsInteger > 0 then
                                       EventTable.FieldByName('NoTimes').AsInteger := FieldByName('NoTimes').AsInteger;
                                    if FieldByName('Quantity').AsFloat > 0 then
                                       EventTable.FieldByName('Quantity').AsFloat := FieldByName('Quantity').AsFloat;
                                    if ( FieldByName('Comment').AsString <> '' ) then
                                       EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                                    else
                                       EventTable.FieldByName('Comment').AsString := 'Health';

                                    EventTable.Post;
                                    AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                    if not PDAOtherEventsRecorded then
                                       PDAOtherEventsRecorded := True;
                                 end
                              else
                                 AddToErrorList(EventTable.FieldByName('EventType').AsInteger, 'Unable to create Health event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                           end;
                        EventsExist := FindNext;
                     end;

                  Filter := '';
                  Filtered := False;
                  Refresh;
               end;

      if EventTable.RecordCount > 0 then
         begin
            EHealth := THealthEvent.Create('HRec');
            try
            EventTable.First;
            while not EventTable.eof do
               begin
                  CancelDryOff := False;
                  bRecordEvent := True;

                  //   06/04/21 [V6.0 R0.1] /MK Bug Fix - Added new bRecordEvent variable to store whether to record the event or not to fix issue where
                  //                                      if event already exists, the focused record was moving to the next event but it wasn't being checked.
                  if ( EventTable.FieldByName('EventType').AsInteger = CHealthEvent ) then
                     bRecordEvent := ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                                    CHealthEvent,EventTable.FieldByName('EventDate').AsDateTime)) );
                  if ( EventTable.FieldByName('EventType').AsInteger = CDryOffEvent ) then
                     bRecordEvent := ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                                    CDryOffEvent,EventTable.FieldByName('EventDate').AsDateTime)) );

                  if ( not(bRecordEvent) ) then
                     begin
                        AddToErrorList(EventTable.FieldByName('EventType').AsInteger, 'Unable to create Dry Off event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' already has Dry Off event');
                        EventTable.Edit;
                        EventTable.FieldByName('Deleted').AsBoolean := True;
                        EventTable.Post;
                     end;

                  if ( bRecordEvent ) and ( EventTable.FieldByName('EventType').AsInteger in ([CHealthEvent, CDryOffEvent]) ) then
                     begin
                        if not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) then
                           begin
                              if EventTable.FieldByName('EventType').AsInteger = CDryOffEvent then
                                 // Test the Animal hasn't already got a Drying Off Record for this Lactation
                                 CancelDryOff := Windata.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',
                                                                             VarArrayOf([EventTable.FieldByName('AnimalID').AsInteger,
                                                                                         EventTable.FieldByName('LactNo').AsInteger,
                                                                                         CDryOffEvent]),[]);
                              if not CancelDryOff then
                                 begin
                                    EHealth.Append;
                                    { Master details }
                                    if EventTable.FieldByName('EventType').AsInteger = CHealthEvent then
                                       begin
                                          EHealth.EventType    := THealth;
                                          if EventTable.FieldByName('Comment').AsString = '' then
                                             EHealth.EventComment := 'Health'
                                          else
                                             EHealth.EventComment := EventTable.FieldByName('Comment').AsString;
                                       end
                                    else
                                       begin
                                          EHealth.EventType    := TDryOff;
                                          if EventTable.FieldByName('Comment').AsString = '' then
                                             EHealth.EventComment := 'Dry Off'
                                          else
                                             EHealth.EventComment := EventTable.FieldByName('Comment').AsString;
                                       end;

                                    // If EventSource is ParlourLink and ParlourType is Westfalia then save health event with comment for Milk Isolation.
                                    if ( EventSource = esParlourLink ) and
                                       ( (UpperCase(ParlourInfo.ParlourType) = 'WESTFALIA4.3') or
                                         (UpperCase(ParlourInfo.ParlourType) = 'WESTFALIA') ) then
                                       EHealth.EventComment := 'Westfalia Milk Isolation';

                                    EHealth.AnimalID := EventTable.FieldByName('AnimalID').AsInteger;

                                    //   25/10/17 [V5.7 R4.1] /MK Change - Allocate the drying off event to the right lactation number.
                                    iEventLactNo := EventTable.FieldByName('LactNo').AsInteger;
                                    iEventLactNo := WinData.FBreedingDataHelper.BreedingEventLactNo(EventTable.FieldByName('AnimalID').AsInteger,
                                                                                                    iEventLactNo,
                                                                                                    EventTable.FieldByName('EventDate').AsDateTime);
                                    EHealth.AnimalLactNo := iEventLactNo;

                                    EHealth.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                                    EHealth.EventDate := EventTable.FieldByName('EventDate').AsDateTime;
                                    { Sub details }
                                    EHealth.HealthCode  := EventTable.FieldByName('HealthCode').AsInteger;
                                    EHealth.FarmCode    := EventTable.FieldByName('FarmCode').AsInteger;
                                    EHealth.DrugUsed    := EventTable.FieldByName('DrugUsed').AsInteger;
                                    EHealth.DryOffEvent := EventTable.FieldByName('DryOffEvent').AsBoolean;
                                    EHealth.DrugPurchID := EventTable.FieldByName('DrugPurchID').AsInteger;
                                    EHealth.AdminBy     := EventTable.FieldByName('MedAdmin').AsInteger;
                                    EHealth.ApplicMethod:= EventTable.FieldByName('ApplicMethod').AsInteger;
                                    EHealth.NoDays      := EventTable.FieldByName('NoDays').AsInteger;
                                    EHealth.NoTimes     := EventTable.FieldByName('NoTimes').AsInteger;
                                    //   18/12/13 [V5.2 R7.2] /MK Bug Fix - Quantity was used instead of RateofApplic.
                                    EHealth.RateApplic  := EventTable.FieldByName('Quantity').AsFloat;
                                    //   10/02/12 [V5.0 R3.7] /MK Additional Feature - New Field WinData.HealthDrugBatchNo Set By PDABatchNo.
                                    EHealth.DrugBatchNo := EventTable.FieldByName('BatchNo').AsString;
                                    //   28/08/13 [V5.2 R0.2] /MK Change - Added Manual Comment Boolean.
                                    EHealth.ManualComment := False;
                                    case EventSource of
                                       //esSiemensLink,
                                       esNokiaLink   : EHealth.EventSource := sPHONELINK;
                                       esParlourLink : EHealth.EventSource := sPARLOURLINK;
                                       esPDA : EHealth.EventSource := sPDA;
                                    end;
                                    EventTable.Edit;
                                    EventTable.FieldByName('EventID').AsInteger := EHealth.EventID;
                                    EventTable.Post;
                                    EHealth.Post;
                                 end
                              else
                                 begin
                                    AddToErrorList(EventTable.FieldByName('EventType').AsInteger, 'Unable to create Dry Off event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' already has Dry Off event');
                                    //EventTable.Delete; // Delete the Dry off !! it already exists.
                                    EventTable.Edit;
                                    EventTable.FieldByName('Deleted').AsBoolean := True;
                                    EventTable.Post;
                                 end;
                           end
                        else
                           AddToErrorList(EventTable.FieldByName('EventType').AsInteger, 'Unable to create Health event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                     end;
                     EventTable.Next;
                  end;
            finally
               EHealth.Free;
            end;
         end;
      except

         PDATable.Filter := '';
         PDATable.Filtered := False;
         raise Exception.Create('Unable to create Health event(s)');
      end;

   finally
      if EventTable.Active then
         EventTable.Active := False;
      if ( Medicine <> nil ) then
         begin
            Medicine.Close;
            FreeAndNil(Medicine);
         end;
      if ( GenLook <> nil ) then
         begin
            GenLook.Close;
            FreeAndNil(GenLook);
         end;
      if ( MediPurch <> nil ) then
         begin
            MediPurch.Close;
            FreeAndNil(MediPurch);
         end;
      if ( MedAdmin <> nil ) then
         begin
            MedAdmin.Close;
            FreeAndNil(MedAdmin);
         end;
      if ( ParlourInfo <> nil ) then
         FreeAndNil(ParlourInfo);
   end;
end;

procedure TCreateEvents.ProcessPDs;

   function ParsePregDiag(FLine: String): TPregDiagRecord;
   var
      PregStatus : string;
   begin
      case EventSource of
         esNokiaLink   : begin
                            Parser.Parse(FLine + cSpaceDelimiter);
                            Result.EventType   := Parser.ParseFields[2];
                            Result.AnimalNo    := TrimUpperStr(Parser.ParseFields[3]);
                            Result.EventDate   := StrToDate(Parser.ParseFields[1]);
                            PregStatus := TrimUpperStr(Parser.ParseFields[4]);
                            if PregStatus = 'Y' then
                               begin
                                  Result.Pregnant := True;
                                  LastPDStatus := pdPregnant;
                               end
                            else if PregStatus = 'N' then
                               begin
                                  Result.Pregnant := False;
                                  LastPDStatus := pdNotPregnant;
                               end
                            else if ( LastPDStatus <> pdUndefined ) then
                               Result.Pregnant := ( LastPDStatus = pdPregnant );
                         end;
         //   19/10/17 [V5.7 R4.0] /MK Additional Feature - Allowed PD events to be imported from Parlour Link file.
         esParlourLink : begin
                            Parser.FieldSep := cCommaDelimiter;
                            Parser.Parse(FLine);
                            Result.EventType := Parser.ParseFields[1];
                            Result.AnimalNo := TrimUpperStr(Parser.ParseFields[2]);
                            try
                               Result.EventDate := StrToDate(TrimUpperStr(Parser.ParseFields[3]));
                            except
                               Result.EventDate := CheckDate(TrimUpperStr(Parser.ParseFields[3]), True);
                            end;
                            Result.Pregnant := ( Parser.ParseFields[4] = '+' );
                         end;
      end;
   end;
   
var
   i,
   PDEventId : Integer;
begin
   try
      try
         EventTable.Active := True;

         if ( EventSource <> esPDA ) then
            begin
               for i := 0 to EventList.Count-1 do
                  if ( Length(EventList.Strings[i]) > 0 ) then
                     begin
                        if ( ExtractEventCode(EventList.Strings[i]) = cPregDiagCode ) then
                        with ParsePregDiag(EventList.Strings[i]) do
                           if LookUpDamSire.Locate('AnimalNo;HerdID;InHerd', VarArrayOf([AnimalNo, UserHerdID, TRUE]), [loCaseInsensitive]) then
                              begin
                                 if ( EventDate > 0 ) and ( WinData.EventDataHelper.GetLastEventDate(LookUpDamSire.FieldByName('ID').AsInteger,
                                                                                                    LookUpDamSire.FieldByName('LactNo').AsInteger,
                                                                                                    CPregDiagEvent) = 0 ) then
                                    if LookupDamSire.FieldByName('Sex').AsString = 'Female' then
                                       begin
                                           EventTable.Append;
                                           EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                           EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                           EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                           EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                           EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                           if ( EventDate > 0 ) then
                                              EventTable.FieldByName('EventDate').AsDateTime := EventDate
                                           else if ( EventSource <> esParlourLink ) then
                                              EventTable.FieldByName('EventDate').AsDateTime := Date;
                                           EventTable.FieldByName('EventType').AsInteger := CPregDiagEvent;
                                           EventTable.FieldByName('Pregnant').AsBoolean := Pregnant;
                                           EventTable.FieldByName('Comment').AsString := 'Pregnancy Diagnosis';
                                           EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                           EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                           EventTable.Post;
                                           if ( EventSource = esParlourLink ) then
                                              begin
                                                 AddToUsedEvents(EventTable.FieldByName('ID').AsInteger);
                                                 if not PDAOtherEventsRecorded then
                                                    PDAOtherEventsRecorded := True;
                                              end;
                                       end
                                    else
                                       AddToErrorList(CPregDiagEvent, 'Unable to create Pregnancy Diagnosis event: '+AnimalNo+' is not a female animal');
                              end
                           else
                              AddToErrorList(CPregDiagEvent, 'Unable to create Pregnancy Diagnosis event: Animal Number '+AnimalNo+' not found in Herd '+strHerd+'');
                     end;
            end
         else
            with PDATable do
               begin
                  Filter := 'Code=''P'' and ((DataDir)='''+StrHerd+''')';
                  Filtered := True;
                  EventsExist := FindFirst;
                  while EventsExist do
                     begin
                        if ( FieldByName('Date').AsDateTime <= Date ) then
                           begin
                              if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                                 begin
                                    if ( WinData.EventDataHelper.GetLastEventDate(LookUpDamSire.FieldByName('ID').AsInteger,
                                                                                  LookUpDamSire.FieldByName('LactNo').AsInteger,
                                                                                  CPregDiagEvent) = 0 ) then
                                       if LookupDamSire.FieldByName('Sex').AsString = 'Female' then
                                          begin
                                              EventTable.Append;
                                              EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                              EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                              EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                              EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                              EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                              if ( FieldbyName('Date').AsDateTime > 0 ) then
                                                 EventTable.FieldByName('EventDate').AsDateTime := FieldbyName('Date').AsDateTime;
                                              EventTable.FieldByName('EventType').AsInteger := CPregDiagEvent;
                                              EventTable.FieldByName('Pregnant').AsBoolean := FieldbyName('PD').AsBoolean;
                                              EventTable.FieldByName('NoOfCalves').AsInteger := FieldbyName('NumberOfCalves').AsInteger;
                                              EventTable.FieldByName('DaysInCalf').AsInteger := FieldbyName('DaysInCalf').AsInteger;                                       { Sub details }
                                              EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                              EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;

                                              if ( FieldByName('Comment').AsString <> '' ) then
                                                 EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                                              else
                                                 EventTable.FieldByName('Comment').AsString := 'Pregnancy Diagnosis';

                                              EventTable.Post;
                                              AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                              if not PDAOtherEventsRecorded then
                                                 PDAOtherEventsRecorded := True;
                                          end
                                       else
                                          AddToErrorList(CPregDiagEvent, 'Unable to create Pregnancy Diagnosis event: '+FieldbyName('AnimalNumber').AsString+' is not a female animal');
                                 end
                              else
                                 AddToErrorList(CPregDiagEvent, 'Unable to create Pregnancy Diagnosis event: Animal Number '+FieldbyName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                           end;
                        EventsExist := FindNext;
                     end;
                  Filter := '';
                  Filtered := False;
                  Refresh;
               end;

      if EventTable.RecordCount > 0 then
         begin
            EPregDiag := TPregDiagEvent.Create('PRec');
            try
               EventTable.First;
               while not EventTable.eof do
                  begin
                     if EventTable.FieldByName('EventType').AsInteger = CPregDiagEvent then
                        begin
                           if ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                             EventTable.FieldByName('EventType').AsInteger,
                                                             EventTable.FieldByName('EventDate').AsDateTime)) ) then
                              begin
                                 if not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, UserHerdID)) then
                                    begin
                                       EPregDiag.Append;
                                       { Master details }
                                       EPregDiag.EventType    := TPregDiag;
                                       EPregDiag.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                                       EPregDiag.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                                       EPregDiag.AnimalHerdID := EventTable.FieldByName('HerdId').AsInteger;
                                       EPregDiag.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                                       EPregDiag.EventComment := EventTable.FieldByName('Comment').AsString;
                                       EPregDiag.NoCalves     := EventTable.FieldByName('NoOfCalves').AsInteger;
                                       EPregDiag.DaysInCalf   := EventTable.FieldByName('DaysInCalf').AsInteger;
                                       if EventTable.FieldByName('Pregnant').AsBoolean then
                                          EPregDiag.PregnancyStatus  := True
                                       else
                                          EPregDiag.PregnancyStatus  := False;
                                       case EventSource of
                                          esNokiaLink   : EPregDiag.EventSource := sPHONELINK;
                                          esParlourLink : EPregDiag.EventSource := sPARLOURLINK;
                                          esPDA : EPregDiag.EventSource := sPDA;
                                       end;
                                       EventTable.Edit;
                                       EventTable.FieldByName('EventID').AsInteger := EPregDiag.EventID;
                                       EventTable.Post;
                                       EPregDiag.Post;
                                    end
                                 else
                                    AddToErrorList(CPregDiagEvent, 'Unable to create PD event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                              end
                           else
                              begin
                                 AddToErrorList(CPregDiagEvent, 'PD event updated: Animal '+EventTable.FieldByName('NatIDNum').AsString+'');
                                 PDEventId := WinData.CheckEvents.FieldByName('ID').AsInteger;

                                 EventTable.Edit;
                                 EventTable.FieldByName('EventID').AsInteger := PDEventId;
                                 EventTable.Post;

                                 with TQuery.Create(nil) do
                                    try
                                       DatabaseName := AliasName;
                                       SQL.Clear;
                                       SQL.Add('UPDATE Events               ');
                                       SQL.Add('SET EventDate = :AEventDate,');
                                       SQL.Add('    EventDesc = :AComment   ');
                                       SQL.Add('WHERE id = :AEventID   ');
                                       Params[0].AsDateTime := EventTable.FieldByName('EventDate').AsDateTime;
                                       Params[1].AsString   := EventTable.FieldByName('Comment').AsString;
                                       Params[2].AsInteger  := PDEventId;
                                       ExecSQL;

                                       SQL.Clear;
                                       SQL.Add('UPDATE PregnancyDiag                    ');
                                       SQL.Add('SET PregnancyStatus = :APregnancyStatus,');
                                       SQL.Add('    DaysInCalf = :ADaysInCalf,          ');
                                       SQL.Add('    NoCalves = :ANoCalves               ');
                                       SQL.Add('WHERE Eventid = :AEventID               ');
                                       Params[0].AsBoolean := EventTable.FieldByName('Pregnant').AsBoolean;
                                       Params[1].AsSmallInt  := EventTable.FieldByName('DaysInCalf').AsInteger;
                                       Params[2].AsSmallInt  := EventTable.FieldByName('NoOfCalves').AsInteger;
                                       Params[3].AsInteger  := PDEventId;
                                       ExecSQL;
                                    finally
                                       Free;
                                    end;
                              end;
                        end;
                      EventTable.Next;
                  end;
            finally
               EPregDiag.Free;
            end;
         end;

      except
         raise Exception.Create('Unable to create Pregnancy Diagnosis event(s)');
      end;

   finally
      if EventTable.Active then
         EventTable.Active := False;
   end;
end;

procedure TCreateEvents.ProcessServices;

   function ParseService(FLine : String) : TServiceRecord;
   begin
      case EventSource of
         esNokiaLink   : begin
                            Parser.FieldSep := cSpaceDelimiter;
                            Parser.Parse(FLine);
                            Result.EventType   := Parser.ParseFields[2];
                            Result.AnimalNo    := TrimUpperStr(Parser.ParseFields[3]);
                            Result.EventDate   := StrToDate(Parser.ParseFields[1]);
                            Result.ServiceBull := TrimUpperStr(Parser.ParseFields[4]);
                            if ( Result.ServiceBull <> '' ) then
                               LastServiceBull := Result.ServiceBull
                            else if ( LastServiceBull <> '' ) then
                               Result.ServiceBull := LastServiceBull;
                         end;
         esParlourLink : begin
                            Parser.FieldSep := cCommaDelimiter;
                            Parser.Parse(FLine);
                            Result.EventType   := Parser.ParseFields[1];
                            Result.AnimalNo    := TrimUpperStr(Parser.ParseFields[2]);
                            try
                               Result.EventDate   := StrToDate(TrimUpperStr(Parser.ParseFields[3]));
                            except
                               Result.EventDate   := CheckDate(TrimUpperStr(Parser.ParseFields[3]), True);
                            end;
                            Result.ServiceBull := TrimUpperStr(Parser.ParseFields[4]);
                         end;
      end;
   end;

var
   i,
   iBullID : Integer;
   sBullNumber : String;
begin
   try
      try
         EventList.SaveToFile('C:\TempFile.txt');
         EventTable.Active := True;
         if ( EventSource <> esPDA ) then
            begin
               for i := 0 to EventList.Count-1 do
                  begin
                     if ( Length(EventList.Strings[i]) > 0 ) then
                        begin
                           if ( ExtractEventCode( EventList.Strings[i]) = cServiceCode ) then
                              with ParseService(EventList.Strings[i]) do
                                 if ( LookUpDamSire.Locate('AnimalNo;HerdID;InHerd', VarArrayOf([AnimalNo, UserHerdID, TRUE]), [loCaseInsensitive]) ) then
                                    begin
                                       if ( EventDate > 0 ) and
                                          ( not(WinData.EventDataHelper.HasEventRecordedForDate(LookUpDamSire.FieldByName('ID').AsInteger,CServiceEvent,EventDate)) ) then
                                          begin
                                             if LookupDamSire.FieldByName('Sex').AsString = 'Female' then
                                                begin
                                                   EventTable.Append;
                                                   EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                                   EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                                   EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                                   EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                                   EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                                   if EventDate > 0 then
                                                      EventTable.FieldByName('EventDate').AsDateTime := EventDate
                                                   else if ( EventSource <> esParlourLink ) then
                                                      EventTable.FieldByName('EventDate').AsDateTime := Date;
                                                   EventTable.FieldByName('EventType').AsInteger := CServiceEvent;
                                                   EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                                   EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;

                                                   iBullID := 0;
                                                   sBullNumber := '';
                                                   if ( Length(Trim(ServiceBull)) > 0 ) then
                                                      begin
                                                         qBulls.Close;
                                                         qBulls.Open;
                                                         //   18/05/17 [V5.6 R8.3] /MK Change - Search for bull by name as well as code because parlour file from Dairymaster Moo Monitor
                                                         //                                     contains the bull name not the code - requested Danny O'Connell.
                                                         if ( qBulls.Locate('AnimalNo',Copy(ServiceBull,0,10),[loCaseInsensitive]) ) then
                                                            begin
                                                               EventTable.FieldByName('BullID').AsInteger := qBulls.FieldByName('ID').AsInteger;
                                                               EventTable.FieldByName('BullNo').AsString := qBulls.FieldByName('AnimalNo').AsString;
                                                            end
                                                         else if ( qBulls.Locate('Name',ServiceBull,[loCaseInsensitive]) ) then
                                                            begin
                                                               EventTable.FieldByName('BullID').AsInteger := qBulls.FieldByName('ID').AsInteger;
                                                               EventTable.FieldByName('BullNo').AsString := qBulls.FieldByName('AnimalNo').AsString;
                                                            end
                                                         else if ( EventSource = esParlourLink ) then
                                                            begin
                                                               sBullNumber := ServiceBull;
                                                               if ( GetBullByTagNo(iBullID,sBullNumber) ) then
                                                                  begin
                                                                     EventTable.FieldByName('BullID').AsInteger := iBullID;
                                                                     EventTable.FieldByName('BullNo').AsString := sBullNumber;
                                                                  end
                                                               else
                                                                  begin
                                                                     EventTable.FieldByName('BullID').AsInteger := AddBullIDFromSireRegister(ServiceBull);
                                                                     if Length(ServiceBull) > 10 then
                                                                        EventTable.FieldByName('BullNo').AsString := Copy(ServiceBull,0,10)
                                                                     else
                                                                        EventTable.FieldByName('BullNo').AsString := ServiceBull;
                                                                  end;
                                                            end
                                                         else
                                                            AddToErrorList(CServiceEvent, 'Bull Code '+ServiceBull+' not found. Bull may not be "InUse" ');
                                                         if ( EventTable.FieldByName('BullID').AsInteger > 0 ) then
                                                            ActivateBullInUse(EventTable.FieldByName('BullID').AsInteger);
                                                      end;

                                                   if ( EventTable.FieldByName('BullNo').AsString <> '' ) then
                                                      EventTable.FieldByName('Comment').AsString := 'Service'+'/'+EventTable.FieldByName('BullNo').AsString
                                                   else
                                                      EventTable.FieldByName('Comment').AsString := 'Service';
                                                   EventTable.Post;
                                                   if ( EventSource = esParlourLink ) then
                                                      begin
                                                         AddToUsedEvents(EventTable.FieldByName('ID').AsInteger);
                                                         if not PDAOtherEventsRecorded then
                                                            PDAOtherEventsRecorded := True;
                                                      end;
                                                end
                                             else
                                                AddToErrorList(CServiceEvent, 'Unable to create Service event: '+AnimalNo+' is not a female animal');
                                          end
                                       else
                                          AddToErrorList(CServiceEvent, 'Unable to create Service event: This event date already exists for animal '+AnimalNo+'.');
                                    end
                                 else
                                    AddToErrorList(CServiceEvent, 'Unable to create Service event: Animal Number '+AnimalNo+' not found in Herd '+strHerd+'');
                        end;
                  end;
            end
         else
            with PDATable do
               begin
                  First;
                  Filter := 'Code=''S'' and ((DataDir)='''+StrHerd+''')';
                  Filtered := True;

                  EventsExist := FindFirst;
                  while EventsExist do
                     begin
                        if ( FieldByName('Date').AsDateTime <= Date ) then
                           begin
                              if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                                 begin
                                    if ( not(WinData.EventDataHelper.HasEventRecordedForDate(LookUpDamSire.FieldByName('ID').AsInteger,
                                                                                             CServiceEvent,
                                                                                             PDATable.FieldByName('Date').AsDateTime)) ) then
                                       if LookupDamSire.FieldByName('Sex').AsString = 'Female' then
                                          begin
                                             EventTable.Append;
                                             EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                             EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                             EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                             EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                             EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                             if ( PDATable.FieldByName('Date').AsDateTime > 0 ) then
                                                EventTable.FieldByName('EventDate').AsDateTime := PDATable.FieldByName('Date').AsDateTime;
                                             EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                             EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                             EventTable.FieldByName('EventType').AsInteger := CServiceEvent;
                                             if Trim(PDATable.FieldByName('Bull').AsString) <> '' then
                                                if qBulls.Locate('AnimalNo', PDATable.FieldByName('Bull').AsString, [loCaseInsensitive]) then
                                                   begin
                                                      EventTable.FieldByName('BullID').AsInteger := qBulls.FieldByName('ID').AsInteger;
                                                      EventTable.FieldByName('BullNo').AsString  := qBulls.FieldByName('AnimalNo').AsString;
                                                   end
                                                else
                                                   AddToErrorList(CServiceEvent, 'Bull Code '+PDATable.FieldByName('Bull').AsString+' not found. Bull may not be "InUse" ');

                                             if ( FieldByName('Comment').AsString <> '' ) then
                                                EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                                             else
                                                EventTable.FieldByName('Comment').AsString := 'Service';
                                             EventTable.Post;
                                             AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                             if not PDAOtherEventsRecorded then
                                                PDAOtherEventsRecorded := True;
                                          end
                                       else
                                          AddToErrorList(CServiceEvent, 'Unable to create Service event: '+FieldByName('AnimalNumber').AsString+' is not a female animal')
                                    else
                                       AddToErrorList(CServiceEvent, 'Unable to create Service event: This event date already exists for animal '+FieldByName('AnimalNumber').AsString+'.');
                                 end
                              else
                                 AddToErrorList(CServiceEvent, 'Unable to create Service event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                           end;
                        EventsExist := FindNext;
                     end;
                  Filter := '';
                  Filtered := False;
                  Refresh;
               end;

      if ( EventTable.RecordCount > 0 ) then
         begin
            EService := TServiceEvent.Create('SRec');
            EventTable.First;
            while not EventTable.eof do
               begin
                  if ( EventTable.FieldByName('EventType').AsInteger = CServiceEvent ) then
                     begin
                        if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) ) or
                           ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                         CHealthEvent,EventTable.FieldByName('EventDate').AsDateTime)) ) then 
                           begin
                              EService.Append;
                              { Master details }
                              EService.EventType    := TService;
                              EService.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                              EService.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                              EService.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                              EService.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                              EService.EventComment := EventTable.FieldByName('Comment').AsString;

                              { Sub details }
                              EService.AmountOfStraw := 1;
                              if LookupDamSire.Locate('ID' , EventTable.FieldByName('BullID').AsInteger, []) then
                                 begin
                                    if LookupDamSire.FieldByName('HerdID').AsInteger = NONEHerdID then
                                       EService.ServiceType := 49 // AI Service
                                    else
                                       EService.ServiceType := 48; // Natural service
                                    EService.ServiceBull  := EventTable.FieldByName('BullID').AsInteger;
                                 end;
                              case EventSource of
                                 esNokiaLink   : EService.EventSource := sPHONELINK;
                                 esParlourLink : EService.EventSource := sPARLOURLINK;
                                 esPDA : EService.EventSource := sPDA;
                              end;
                              EventTable.Edit;
                              EventTable.FieldByName('EventID').AsInteger := EService.EventID;
                              EventTable.Post;
                              EService.Post;
                           end
                        else
                           AddToErrorList(CServiceEvent, 'Unable to create Service event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                     end;
                  EventTable.Next;
               end;
               EService.Free;
            end;
      except
         raise Exception.Create('Unable to create Service events');
      end;
  finally
     if EventTable.Active then
        EventTable.Active := False;
  end;
end;

procedure TCreateEvents.ProcessBullings;

   function ParseBulling(FLine : String) :  TBullingRecord;
   begin
      case EventSource of
         esNokiaLink   : begin
                            Parser.FieldSep := cSpaceDelimiter;
                            Parser.Parse(FLine);
                            Result.EventType := Parser.ParseFields[2];
                            Result.AnimalNo  := TrimUpperStr(Parser.ParseFields[3]);
                            Result.EventDate := StrToDate(Parser.ParseFields[1]);
                            Result.BullUsed  := TrimUpperStr(Parser.ParseFields[4]);
                            if ( Result.BullUsed <> '' ) then
                               LastHeatBull := Result.BullUsed
                            else if ( LastHeatBull <> '' ) then
                               Result.BullUsed := LastHeatBull;
                         end;
         esParlourLink : begin
                            Parser.FieldSep := cCommaDelimiter;
                            Parser.Parse(FLine);
                            Result.EventType := Parser.ParseFields[1];
                            Result.AnimalNo  := TrimUpperStr(Parser.ParseFields[2]);
                            Result.EventDate := CheckDate(TrimUpperStr(Parser.ParseFields[3]), True);
                            Result.BullUsed  := '';
                         end;
      end;
   end;

var
   i : Integer;
begin
   try
      try
         EventTable.Active := True;

         if ( EventSource <> esPDA ) then
            begin
               for i := 0 to EventList.Count-1 do
                  begin
                  if ( Length(EventList.Strings[i]) > 0 ) then
                     if ( ExtractEventCode(EventList.Strings[i]) = cBullingCode ) then
                        with ParseBulling(EventList.Strings[i]) do
                           if LookupDamSire.Locate('AnimalNo;HerdID;InHerd', VarArrayOf([AnimalNo, UserHerdID, TRUE]), [loCaseInsensitive]) then
                              begin
                                 if ( EventDate > 0 ) and
                                    ( not(WinData.EventDataHelper.HasEventRecordedForDate(LookUpDamSire.FieldByName('ID').AsInteger,CBullingEvent,EventDate)) ) and
                                    ( not(WinData.EventDataHelper.HasEventRecordedForDate(LookUpDamSire.FieldByName('ID').AsInteger,CServiceEvent,EventDate)) ) then
                                    if LookupDamSire.FieldByName('Sex').AsString = 'Female' then
                                       begin
                                          { Cow Number }
                                          EventTable.Append;
                                          EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                          EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                          EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                          EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                          EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                          EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                          EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                          if EventDate > 0 then
                                             EventTable.FieldByName('EventDate').AsDateTime := EventDate
                                          else if ( EventSource <> esParlourLink ) then
                                             EventTable.FieldByName('EventDate').AsDateTime := Date;
                                          EventTable.FieldByName('EventType').AsInteger := CBullingEvent;
                                          if Trim(BullUsed) <> '' then
                                             if qBulls.Locate('AnimalNo', BullUsed, [loCaseInsensitive]) then
                                                begin
                                                   EventTable.FieldByName('BullID').AsInteger := qBulls.FieldByName('ID').AsInteger;
                                                   EventTable.FieldByName('BullNo').AsString  := qBulls.FieldByName('AnimalNo').AsString;
                                                end
                                             else
                                                AddToErrorList(CBullingEvent, 'Bull Code '+BullUsed+' not found. Bull may not be "InUse" ');
                                          EventTable.FieldByName('Comment').AsString := 'Bulling';
                                          EventTable.Post;
                                          if ( EventSource = esParlourLink ) then
                                             begin
                                                AddToUsedEvents(EventTable.FieldByName('ID').AsInteger);
                                                if not PDAOtherEventsRecorded then
                                                   PDAOtherEventsRecorded := True;
                                             end;
                                       end
                                    else
                                       AddToErrorList(CBullingEvent, 'Unable to create Bulling event: '+AnimalNo+' is not a female animal')
                                 else
                                    AddToErrorList(CBullingEvent, 'Unable to create Bulling event: This event date already exists for animal '+AnimalNo+'.');
                              end
                           else
                              AddToErrorList(CBullingEvent, 'Unable to create Bulling event: Animal Number '+AnimalNo+' not found in Herd '+strHerd+'');
                  end;
            end
         else
            with PDATable do
               begin
                  Filter := 'Code=''B'' and ((DataDir)='''+StrHerd+''')';
                  Filtered := True;

                  EventsExist := FindFirst;
                  while EventsExist do
                     begin
                        if ( FieldByName('Date').AsDateTime <= Date ) then
                           begin
                              if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                                 if ( not(WinData.EventDataHelper.HasEventRecordedForDate(LookUpDamSire.FieldByName('ID').AsInteger,
                                                                                          CBullingEvent,
                                                                                          FieldByName('Date').AsDateTime)) ) then
                                    begin
                                       if LookupDamSire.FieldByName('Sex').AsString = 'Female' then
                                          begin
                                             { Cow Number }
                                             EventTable.Append;
                                             EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                             EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                             EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                             EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                             EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                             EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                             EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                             if FieldByName('Date').AsDateTime > 0 then
                                                EventTable.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;
                                             EventTable.FieldByName('EventType').AsInteger := CBullingEvent;
                                             if Trim(FieldByName('Bull').AsString) <> '' then
                                                if qBulls.Locate('AnimalNo', FieldByName('Bull').AsString, [loCaseInsensitive]) then
                                                   begin
                                                      EventTable.FieldByName('BullID').AsInteger := qBulls.FieldByName('ID').AsInteger;
                                                      EventTable.FieldByName('BullNo').AsString  := qBulls.FieldByName('AnimalNo').AsString;
                                                   end
                                                else
                                                   AddToErrorList(CBullingEvent, 'Bull Code '+FieldByName('Bull').AsString+' not found. Bull may not be "InUse" ');

                                             if ( FieldByName('Comment').AsString <> '' ) then
                                                EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                                             else
                                                EventTable.FieldByName('Comment').AsString := 'Bulling';
                                             EventTable.Post;
                                             AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                             if not PDAOtherEventsRecorded then
                                                PDAOtherEventsRecorded := True;
                                          end
                                       else
                                          AddToErrorList(CBullingEvent, 'Unable to create Bulling event: '+FieldByName('AnimalNumber').AsString+' is not a female animal');
                                    end
                              else
                                 AddToErrorList(CBullingEvent, 'Unable to create Bulling event: This event date already exists for animal '+FieldByName('AnimalNumber').AsString+'.');
                           end;
                        EventsExist := FindNext;
                     end;
                  Filter := '';
                  Filtered := False;
                  Refresh;
               end;

      if EventTable.RecordCount > 0 then
         begin
            EBulling := TBullingEvent.Create('BRec');
            EventTable.First;
            while ( not(EventTable.Eof) ) do
               begin
                  if EventTable.FieldByName('EventType').AsInteger = CBullingEvent then
                     if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) ) or
                        ( (not(WinData.EventDataHelper.HasEventRecordedForDate(LookUpDamSire.FieldByName('ID').AsInteger,CBullingEvent,
                                                                               EventTable.FieldByName('EventDate').AsDateTime))) and
                          (not(WinData.EventDataHelper.HasEventRecordedForDate(LookUpDamSire.FieldByName('ID').AsInteger,CServiceEvent,
                                                                              EventTable.FieldByName('EventDate').AsDateTime))) ) then
                        begin
                           EBulling.Append;
                           { Master details }
                           EBulling.EventType    := TBulling;
                           EBulling.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                           EBulling.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                           EBulling.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                           EBulling.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                           EBulling.EventComment := EventTable.FieldByName('Comment').AsString;
                           { Sub details }
                           EBulling.PlannedBull  := EventTable.FieldByName('BullID').AsInteger;
                           case EventSource of
//                              esSiemensLink,
                              esNokiaLink   : EBulling.EventSource := sPHONELINK;
                              esParlourLink : EBulling.EventSource := sPARLOURLINK;
                              esPDA : EBulling.EventSource := sPDA;
                           end;
                           EventTable.Edit;
                           EventTable.FieldByName('EventID').AsInteger := EBulling.EventID;
                           EventTable.Post;
                           EBulling.Post;
                        end
                     else
                        AddToErrorList(CBullingEvent, 'Unable to create Bulling event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                  EventTable.Next;
               end;
               EBulling.Free;
            end;
      except
         raise Exception.Create('Unable to create Bulling events');
      end;
   finally
      if EventTable.Active then
         EventTable.Active := False;
   end;
end;

procedure TCreateEvents.SetEventFile(const Value: String);
begin
  FEventFile := Value;
end;

function TCreateEvents.GetLinkType: TEventFileSource;
begin
   Result := EventSource;
end;

procedure TCreateEvents.SetLinkType(const Value: TEventFileSource);
begin
   if EventSource <> Value then
      begin
         EventSource := Value;
         if EventSource = esSiemensLink then
            EventFile := 'C:\Kingswood Herd Management\SMS\kingswood.dat';
      end;
end;

function TCreateEvents.TrimUpperStr(Str: String): String;
begin
   Result := UpperCase(Trim(Str));
end;

procedure TCreateEvents.GetBullList;
begin
    qBulls := TQuery.Create(nil);
    try
      qBulls.DatabaseName := WinData.KingData.DatabaseName;
      qBulls.SQL.Clear;
      qBulls.SQL.Add('SELECT ID, AnimalNo, Name, HerdID, SearchNatID');
      qBulls.SQL.Add('FROM Animals, BullSemenStk');
      qBulls.SQL.Add('WHERE (Animals.ID = BullSemenStk.AnimalID) ');
      qBulls.SQL.Add('AND   (BullSemenStk.InUse = True) ');
      qBulls.SQL.Add('AND   (UPPER(Animals.Sex)="BULL") ');
      qBulls.Open;
   except
      raise Exception.Create('Cannot create bull listing.');
   end;
end;

function TCreateEvents.ActiveMovement(AnimalID, HerdID: Integer): Boolean;
begin
   Result := False;
   with WinData do
      if CheckEvents.Locate('AnimalID;EventType', VarArrayOf([AnimalID,CMovementEvent]), [] ) then
         begin
            luMovements.Open;
            try
               if luMovements.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                   if luMovements.FieldByName('StillOffFarm').AsBoolean then
                      begin
                         Result := True;
                      end;
            finally
               luMovements.Close;
            end;
         end;
end;

function TCreateEvents.ExtractEventCode(MessageText: string): Char;
var
   EventCodeIndex : Integer;
begin
   try
      if EventSource = esParlourLink then
         EventCodeIndex := 1
      else
         EventCodeIndex := 12;
      Result := UpperCase(Trim(Copy(MessageText, EventCodeIndex, 1)))[1];
   except
      on e : Exception do
         ShowMessage(e.Message);
   end;
end;

procedure TCreateEvents.ProcessCalvings;
var
  confirmForm : TForm;
  qCalves : TQuery;
  Country : TCountry;
  CalvingFound : Boolean;
  CE : TCalvingEvent;
  CalfIndex : Integer;
  CalvingBirthType : Integer;
  CalvedDams : array of Integer;
  i : Integer;

  function ParseCalving(FLine: String): TCalvingsRecord;
  begin
     if ( EventSource = esNokiaLink ) then
        begin
           Parser.FieldSep := cSpaceDelimiter;
           Parser.Parse(FLine);
           Result.EventType   := Parser.ParseFields[2];
           Result.AnimalNo    := TrimUpperStr(Parser.ParseFields[3]);
           Result.EventDate   := StrToDate(Parser.ParseFields[1]);
           Result.CalfNo      := TrimUpperStr(Parser.ParseFields[4]);
           if ( Length(Result.CalfNo) = 1 ) and (((Result.CalfNo[1]) in ['F','M','B'])) then
              begin
                 // Calf No has been ommitted from the event.
                 case Result.CalfNo[1] of
                    'F' : Result.CalfSex := cSex_Female;
                    'M' : Result.CalfSex := cSex_Steer;
                    'B' : Result.CalfSex := cSex_Bull;
                 end;
                 Result.CalfNo := '';
                 Result.CalfBreed  := TrimUpperStr(Parser.ParseFields[5]);
                 Result.CalfColour := TrimUpperStr(Parser.ParseFields[6]);
              end
           else if ( Parser.ParseFields[5] <> '' ) and (Length(Parser.ParseFields[5]) = 1) then
              begin
                 case TrimUpperStr(Parser.ParseFields[5])[1] of
                    'F' : Result.CalfSex := cSex_Female;
                    'M' : Result.CalfSex := cSex_Steer;
                    'B' : Result.CalfSex := cSex_Bull;
                 end;
                 Result.CalfBreed   := TrimUpperStr(Parser.ParseFields[6]);
                 Result.CalfColour  := TrimUpperStr(Parser.ParseFields[7]);
              end;

           if ( Result.CalfBreed <> '' ) then
              LastBreedCode := Result.CalfBreed
           else if ( LastBreedCode <> '' ) then
              Result.CalfBreed := LastBreedCode;

           if ( Result.CalfColour <> '' ) then
              LastColourCode := Result.CalfColour
           else if ( LastColourCode <> '' ) then
              Result.CalfColour := LastColourCode;
        end
     else if ( EventSource = esParlourLink ) then
        begin
           Parser.FieldSep := cCommaDelimiter;
           Parser.Parse(FLine);
           Result.EventType   := Parser.ParseFields[1];
           Result.AnimalNo    := TrimUpperStr(Parser.ParseFields[2]);
           Result.EventDate   := CheckDate(TrimUpperStr(Parser.ParseFields[3]), True);
        end;
  end;

  procedure DeleteCalvings(const Dam : Integer);
  begin
     with TQuery.Create(nil) do
        begin
           DatabaseName := 'C:\Kingswood Herd Management\PDA Import Files';
           SQL.Text := 'Delete From PDAEvents where ( AnimalID = :AID ) And (Code = :Code)';
           Params[0].Value := Dam;
           Params[1].Value := 'C';
           ExecSQL;
        end;
  end;

var
   CalfNo, NatIDMask : string;
   LastCalvingDate : TDateTime;
begin

   SetLength(CalvedDams, 0);

   try
      try
         EventTable.Active := True;

         if ( EventSource <> esPDA ) then
            begin
               for i := 0 to EventList.Count-1 do
               begin
                  if ( Length(EventList.Strings[i]) > 0 ) then
                     if ( ExtractEventCode( EventList.Strings[i]) = cCalvingCode ) then
                        with ParseCalving(EventList.Strings[i]) do
                           if LookUpDamSire.Locate('AnimalNo;HerdID;InHerd', VarArrayOf([ AnimalNo, UserHerdID, TRUE ]), [loCaseInsensitive]) then
                              if ( EventDate > 0 ) then
                                 begin
                                    LastCalvingDate := WinData.EventDataHelper.GetLastEventDate(LookUpDamSire.FieldByName('ID').AsInteger,
                                                                                                LookUpDamSire.FieldByName('LactNo').AsInteger,
                                                                                                CCalvingEvent);
                                    if ( LastCalvingDate = 0 ) then
                                       LastCalvingDate := WinData.EventDataHelper.GetLastEventDate(LookUpDamSire.FieldByName('ID').AsInteger,
                                                                                                   CCalvingEvent);
                                    if ( EventDate > LastCalvingDate ) then
                                       if ( EventDate > IncMonth(LastCalvingDate,3) ) then
                                          if ( LookupDamSire.FieldByName('Sex').AsString = 'Female' ) then
                                             begin
                                                EventTable.Append;
                                                if ( EventSource <> esParlourLink ) then
                                                    begin
                                                       EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                                       EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                                       EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                                       EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                                       EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                                       EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                                       EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                                       if EventDate > 0 then
                                                          EventTable.FieldByName('EventDate').AsDateTime := EventDate
                                                       else if ( EventSource <> esParlourLink ) then
                                                          EventTable.FieldByName('EventDate').AsDateTime := Date;
                                                       EventTable.FieldByName('EventType').AsInteger := CCalvingEvent;
                                                       if Trim(CalfNo) <> '' then
                                                          EventTable.FieldByName('CalfNo').AsString := CalfNo;
                                                       EventTable.FieldByName('CalfSex').AsString := CalfSex;
                                                       EventTable.FieldByName('Comment').AsString := 'Calving';
                                                       if ( CalfBreed <> '' ) then
                                                          begin
                                                             EventTable.FieldByName('CalfBreed').AsString := CalfBreed;
                                                             if WinData.Breeds.Locate('Code', CalfBreed, []) then
                                                                EventTable.FieldByName('CalfBreedID').AsInteger := WinData.BreedsID.AsInteger
                                                             else
                                                                AddToErrorList(CCalvingEvent, Format('Breed Code %s does not exist',[CalfBreed]));
                                                          end;
                                                       if ( CalfColour <> '' ) then
                                                          begin
                                                             EventTable.FieldByName('CalfColour').AsString := CalfColour;
                                                             if WinData.GenLookUp.Locate('ListType;LookupCode', VarArrayOf([LAnimalColour,CalfColour]), []) then
                                                                EventTable.FieldByName('CalfColourID').AsInteger := WinData.GenLookUpID.AsInteger
                                                             else
                                                                AddToErrorList(CCalvingEvent, Format('Colour Code %s does not exist',[CalfColour]));

                                                          end;
                                                    end
                                                else if ( EventSource = esParlourLink ) then
                                                   begin
                                                       EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                                       EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                                       EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                                       EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                                       EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                                       EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                                       EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                                       if EventDate > 0 then
                                                          EventTable.FieldByName('EventDate').AsDateTime := EventDate
                                                       else if ( EventSource <> esParlourLink ) then
                                                          EventTable.FieldByName('EventDate').AsDateTime := Date;
                                                       EventTable.FieldByName('EventType').AsInteger := CCalvingEvent;
                                                   end;
                                                EventTable.Post;
                                                if ( EventSource = esParlourLink ) then
                                                   begin
                                                      AddToUsedEvents(EventTable.FieldByName('ID').AsInteger);
                                                      if not PDACalvingsRecorded then
                                                         PDACalvingsRecorded := True;
                                                   end;
                                             end
                                          else
                                             AddToErrorList(CCalvingEvent, 'Unable to create Calving event: '+AnimalNo+' is not a female animal')
                                    else
                                       AddToErrorList(CCalvingEvent, 'Unable to create Calving event: '+AnimalNo+' - New calving date is not greater than last calving date.');
                                 end
                           else
                              AddToErrorList(CCalvingEvent, 'Unable to create Calving event: Animal Number '+AnimalNo+' not found in Herd '+strHerd+'');
               end
            end
         else
            with PDATable do
               begin
                  Filter := 'Code=''C'' and ((DataDir)='''+StrHerd+''')';
                  Filtered := True;
                  EventsExist := FindFirst;
                  while EventsExist do
                     begin
                        if ( FieldByName('Date').AsDateTime <= Date ) then
                           begin
                              if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                                 begin
                                    if LookupDamSire.FieldByName('Sex').AsString = 'Female' then
                                       begin
                                          EventTable.Append;
                                          EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                          EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                          EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                          EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                          EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                          EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                          EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                          if FieldByName('Date').AsDateTime > 0 then
                                             EventTable.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;
                                          EventTable.FieldByName('EventType').AsInteger := CCalvingEvent;

                                          if ( Trim(FieldByName('CalfNationalID').AsString) <> '' ) then
                                             begin
                                                EventTable.FieldByName('CalfNo').AsString := FieldByName('CalfNationalID').AsString;
                                                EventTable.FieldByName('CalfAnimalNo').AsString := FieldByName('CalfTag').AsString;
                                             end
                                          else
                                             begin
                                                EventTable.FieldByName('CalfNo').AsString := FieldByName('CalfTag').AsString;
                                                EventTable.FieldByName('CalfAnimalNo').AsString := FieldByName('CalfTag').AsString;
                                             end;

                                          EventTable.FieldByName('CalfBreeding').AsBoolean := FieldByName('Breeding').AsBoolean;
                                          EventTable.FieldByName('CalfDead').AsBoolean := FieldByName('Dead').AsBoolean;
                                          EventTable.FieldByName('CalfMortality').AsInteger := FieldByName('MortalityID').AsInteger;
                                          EventTable.FieldByName('DisposalPlaceID').AsInteger := FieldByName('DisposalPlaceID').AsInteger;

                                          if ( UPPERCASE(FieldByName('CalfSex').AsString) = 'B' ) then
                                             EventTable.FieldByName('CalfSex').AsString := cSex_Bull
                                          else if ( UPPERCASE(FieldByName('CalfSex').AsString) = 'F' ) then
                                             EventTable.FieldByName('CalfSex').AsString := cSex_Female
                                          else
                                             EventTable.FieldByName('CalfSex').AsString := cSex_Steer;

                                          if ( FieldByName('Comment').AsString <> '' ) then
                                             EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                                          else
                                             EventTable.FieldByName('Comment').AsString := 'Calving';

                                          if ( FieldByName('CalfBreed').AsString <> '' ) then
                                             begin
                                                EventTable.FieldByName('CalfBreed').AsString := FieldByName('CalfBreed').AsString;
                                                if WinData.Breeds.Locate('Code', FieldByName('CalfBreed').AsString, []) then
                                                   EventTable.FieldByName('CalfBreedID').AsInteger := WinData.BreedsID.AsInteger
                                                else
                                                   AddToErrorList(CCalvingEvent, Format('Breed Code %s does not exist',[FieldByName('CalfBreed').AsString]));
                                             end;

                                          if ( FieldByName('CalfColour').AsString <> '' ) then
                                             begin
                                                EventTable.FieldByName('CalfColour').AsString := FieldByName('CalfColour').AsString;
                                                if WinData.GenLookUp.Locate('ListType;LookupCode', VarArrayOf([LAnimalColour,FieldByName('CalfColour').AsString]), []) then
                                                   EventTable.FieldByName('CalfColourID').AsInteger := WinData.GenLookUpID.AsInteger
                                                else
                                                   AddToErrorList(CCalvingEvent, Format('Colour Code %s does not exist',[FieldByName('CalfColour').AsString]));
                                             end;

                                          try
                                             if ( FieldByName('CalfSire').AsInteger > 0 ) then
                                                begin
                                                   EventTable.FieldByName('SireID').AsInteger := FieldByName('CalfSire').AsInteger;
                                                end;
                                          except
                                          end ;

                                          EventTable.FieldByName('Weight').AsFloat := FieldByName('Weight').AsFloat;
                                          EventTable.FieldByName('CalfName').AsString := PDATable.FieldByName('CalfName').AsString;

                                          if ( FieldByName('BirthTypeID').AsInteger > 0 ) then
                                             EventTable.FieldByName('BirthType').AsInteger := FieldByName('BirthTypeID').AsInteger;

                                          //   27/09/12 [V5.0 R8.9] /MK Change - Add ElectronicID from PDA Calving Events tables.
                                          if ( PDATable.FieldByName('FeedComment').AsString <> '' ) then
                                             begin
                                                EventTable.FieldByName('ElectronicID').AsString := PDATable.FieldByName('FeedComment').AsString;
                                             end;

                                          EventTable.Post;
                                          AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                          if not PDACalvingsRecorded then
                                             PDACalvingsRecorded := True;
                                       end
                                    else
                                       AddToErrorList(CCalvingEvent, 'Unable to create Calving event: '+FieldByName('AnimalNumber').AsString+' is not a female animal');
                                 end
                              else
                                 AddToErrorList(CCalvingEvent, 'Unable to create Calving event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                           end;
                        EventsExist := FindNext;
                     end;
                  Filter := '';
                  Filtered := False;
                  Refresh;

                  EventTable.Filter := 'EventType = 5';
                  EventTable.Filtered := True;

                  EventTable.IndexName := 'iEventDate';
{
                  confirmForm := TForm.Create(nil);
                  confirmForm.Position := poDesktopCenter;
                  confirmForm.BorderStyle := bsDialog;
                  confirmForm.ClientHeight := 180;
                  confirmForm.ClientWidth := 450;
                  confirmForm.Font.Name := 'Segoe UI';
                  confirmForm.Font.Size := 8;
                  confirmForm.Caption := 'PDA Events';


                  with TRadioGroup.Create(confirmForm) do
                     begin
                        Parent := confirmForm;
                        ParentFont := True;
                        Caption := 'Select option to continue';
                        Top := 20;
                        ClientHeight := 80;
                        ClientWidth := 400;
                        Left := 25;
                        Name := 'RG';
                        Items.Add('OPTION 1: Review and Complete PDA Calving Events Manually');
                        Items.Add('OPTION 2: Process and Save PDA Calving Events Automatically');
                        ItemIndex := 1;
                     end;

                  with TLabel.Create(confirmForm) do
                     begin
                        Parent := confirmForm;
                        ParentFont := True;
                        Font.Color := clRed;
                        Font.Style := [fsBold];
                        Left := 25;
                        Top := 112;
                        Caption := 'WARNING: Choosing option 2 will avoid dam/calf validation rules';
                     end;

                  with TButton.Create(confirmForm) do
                     begin
                        Caption := 'Select';
                        ParentFont := True;
                        Default := True;
                        Top :=142;
                        Width := 65;
                        Left := 360;
                        Parent := confirmForm;
                        ModalResult := mrOK;
                     end;
}
//                  confirmForm.ShowModal;
//                  autoSaveCalvings := (TRadioGroup(confirmForm.FindComponent('RG')).ItemIndex=1);
//                  FreeAndNil(confirmForm);

                  qCalves := TQuery.Create(nil);
                  qCalves.DatabaseName := 'kingswd';
                  qCalves.SQL.Clear;
                  qCalves.SQL.Add('SELECT * FROM '+EventTable.TableName);
                  qCalves.SQL.Add('WHERE ( EventType = :ET )');
                  qCalves.SQL.Add('AND   ( AnimalID = :AID )');

                  if FAutoSaveCalvings then
                     try
                        Screen.Cursor := crHourGlass;

                        PDACalvingsRecorded := False;
                        CE := TCalvingEvent.Create('CLVDB');
                        CE.Database.StartTransaction;
                        try
                           with EventTable do
                              begin
                                 CalvingFound := FindFirst;

                                 while (CalvingFound = True) do
                                    begin
                                       if ( Length(CalvedDams) > 0 ) then
                                          begin
                                             for i := 0 to Length(CalvedDams) -1 do
                                                begin
                                                   if CalvedDams[i] = FieldByName('AnimalID').AsInteger then
                                                      begin
                                                         CalvingFound := FindNext;
                                                         Continue;
                                                      end;
                                                end;
                                          end;

                                       qCalves.Close;
                                       qCalves.Params[0].AsInteger := cCalvingEvent;
                                       qCalves.Params[1].AsInteger := FieldByName('AnimalID').AsInteger;
                                       qCalves.Prepared := True;
                                       qCalves.Open;

                                       CalvingBirthType := 0;
                                       CalfIndex := 1;

                                       if ( qCalves.RecordCount in [1..4] ) then
                                          begin
                                             try
                                                try
                                                   qCalves.First;
                                                   while not qCalves.Eof do
                                                      begin
                                                         CalfNo := qCalves.FieldByName('CalfNo').AsString;
                                                         if ( CalfNo <> '' ) then
                                                            begin

                                                               if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland then
                                                                  begin
                                                                     if ( WhatStyleNatID(CalfNo, False) = StyleUnKnown ) and ( Length(CalfNo) = 5 ) then
                                                                        begin
                                                                           // OK what seems to be passed through is the Check Digit + Animal No e.g 12345
                                                                           // amalgamate the CalfNo onto the existing HerdNumber to create a valid tag.
                                                                           // ShowMessage(ExtractNatIDHerdNo(WinData.DefaultNatIDMask) + CalfNo);
                                                                           CheckNatID( ExtractNatIDHerdNo(WinData.DefaultNatIDMask) + CalfNo, CalfNo, False );
                                                                        end
                                                                     else
                                                                        CheckNatID( qCalves.FieldByName('CalfNo').AsString, CalfNo, False );
                                                                  end
                                                               else if WinData.DefCountry(Windata.AnimalFileByIDHerdID.AsInteger) = NIreland then
                                                                  {begin
                                                                     if ( Length(CalfNo) <= 5 ) then
                                                                        begin
                                                                           WinData.CalvingRecords[i]^.AnimalNo := Copy(CalfNo, 1, Length(CalfNo)-1);
                                                                           NatIDMask := ExtractNatIDHerdNo(WinData.DefaultNatIDMask);
                                                                           if not WinData.CheckNINatID( Copy( NatIDMask, 1, 3) + ' ' + Copy( NatIDMask, 4, MaxInt) + ' ' + Copy(CalfNo, 1, Length(CalfNo)-1) + ' ' + CalfNo[Length(CalfNo)], CalfNo ) then
                                                                              MessageDlg('Invalid National Identity Number',mtError,[mbOK],0)
                                                                        end
                                                                     else
                                                                        begin
                                                                           if ( WinData.IsNINatID(qCalves.FieldByName('CalfNo').AsString)) then
                                                                              if not WinData.CheckNINatID(qCalves.FieldByName('CalfNo').AsString, CalfNo) then
                                                                                 MessageDlg('Invalid National Identity Number',mtError,[mbOK],0)
                                                                        end;
                                                                  end;}
                                                                  begin

                                                                  end;

                                                            end;

                                                         CE.CalfRecord.Add;
                                                         CE.CalfRecord.NatIDNum := CalfNo;
                                                         CE.CalfRecord.AnimalNo := qCalves.FieldByName('CalfAnimalNo').AsString;
                                                         CE.CalfRecord.DateOfBirth := qCalves.FieldByName('EventDate').AsDateTime;
                                                         CE.CalfRecord.Sex := qCalves.FieldByName('CalfSex').AsString;
                                                         CE.CalfRecord.PrimaryBreed := qCalves.FieldByName('CalfBreedID').AsInteger;
                                                         if ( qCalves.FieldByName('Weight').AsFloat > 0 ) then
                                                            CE.CalfRecord.BirthWeight := qCalves.FieldByName('Weight').AsFloat
                                                         else
                                                            CE.CalfRecord.BirthWeight := cDefaultCalfWeight;
                                                         CE.CalfRecord.Colour := qCalves.FieldByName('CalfColourID').AsInteger;
                                                         CE.CalfRecord.DamID := FieldByName('AnimalID').AsInteger;
                                                         CE.CalfRecord.HerdID := FieldByName('HerdID').AsInteger;
                                                         CE.CalfRecord.Breeding := qCalves.FieldByName('CalfBreeding').AsBoolean;
                                                         CE.CalfRecord.Name := qCalves.FieldByName('CalfName').AsString;
                                                         CE.CalfRecord.Save;
                                                         CE.CalfID[CalfIndex] := CE.CalfRecord.ID;

                                                         if qCalves.FieldByName('CalfDead').AsBoolean then
                                                            begin
                                                               CE.CalfDead[CalfIndex] := True;
                                                               // create death event.
                                                               with CE.DeathEvent do  { SP 10/02/2003 Create Death events for all dead calves. }
                                                                  try
                                                                     Append;
                                                                     AnimalID  := CE.CalfRecord.ID;
                                                                     AnimalLactNo := 0;
                                                                     AnimalHerdID := CE.CalfRecord.HerdID;
                                                                     EventDate    := CE.CalfRecord.DateofBirth;
                                                                     EventComment := 'Died at birth';
                                                                     Sold := FALSE;
                                                                     Customer := 0;
                                                                     Notified := FALSE;
                                                                     PreSale  := FALSE;
                                                                     Slaughter := FALSE;
                                                                     EventSource := sPDA;
                                                                     Post;
                                                                  except
                                                                     Cancel;
                                                                  end;
                                                            end;

                                                         Inc(CalfIndex);

                                                         if ( CalvingBirthType <= 0 ) then
                                                            CalvingBirthType := qCalves.FieldByName('BirthType').AsInteger;
                                                         qCalves.Next;
                                                      end;

                                                   CE.Append;
                                                   CE.AnimalID := FieldByName('AnimalID').AsInteger;
                                                   CE.EventDate := qCalves.FieldByName('EventDate').AsDateTime;
                                                   CE.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger+1;
                                                   CE.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                                                   CE.EventComment := 'PDA Calving';
                                                   CE.EventSource := sPDA;
                                                   CE.BirthType := CalvingBirthType;
                                                   CE.Post;

                                                   SetLength(CalvedDams, Length(CalvedDams)+1);
                                                   CalvedDams[Length(CalvedDams)-1] := FieldByName('AnimalID').AsInteger;
                                                except
                                                   CE.Database.Rollback;
                                                   raise;
                                                end;
                                             finally
                                                qCalves.Close;
                                             end;
                                          end
                                       else
                                          MessageDlg('The number of recorded calves differs from the expected number',mtError,[mbOK],0);

                                       CalvingFound := FindNext;
                                    end;
                              end;
                        finally
                           if CE.Database.InTransaction then
                              begin
                                 CE.Database.Commit;
                                 if ( Length(CalvedDams) > 0 ) then
                                    begin
                                       for i := 0 to Length(CalvedDams) -1 do
                                          begin
                                             DeleteCalvings(CalvedDams[i]);
                                          end;
                                       MessageDlg('PDA Calving events successfully created.',mtInformation,[mbOK],0);
                                    end;

                              end;
                           FreeAndNil(CE);
                        end;
                     finally
                        Screen.Cursor := crDefault;
                     end;
                  EventTable.Filter := '';
                  EventTable.Filtered := False;
               end;
      except
         on e : exception do
            raise Exception.Create('Unable to create PDA Calving event(s)'+cCRLFx2+E.Message);
      end;
  finally
     if EventTable.Active then
        EventTable.Active := False;
  end;

end;

procedure TCreateEvents.AddToErrorList(EType : Integer; const StrMessage : String);
var
   EventDesc : String;
begin
   EventDesc := '';
   case EType of
      CBullingEvent  : EventDesc := 'Bulling';
      CServiceEvent  : EventDesc := 'Service';
      CPregDiagEvent : EventDesc := 'Preg. Diagnosis';
      CHealthEvent   : EventDesc := 'Health';
      CDryOffEvent   : EventDesc := 'Dry Off';
      CCalvingEvent  : EventDesc := 'Calving';
      CSaleDeathEvent : EventDesc := 'Sale\Death';
      CWeightEvent :  EventDesc := 'Weighing';
   end;

   if ( ErroneousItems.IndexOf(EventDesc + ' - ' + StrMessage ) = -1 ) then
      ErroneousItems.Add(EventDesc + ' - ' + StrMessage );
end;

procedure TCreateEvents.ClearDeleted;
begin
   with TQuery.create(nil) do
      try
         DatabaseName := WinData.KingData.DatabaseName;
         SQL.Add('Delete From SmsEvents where ( Deleted = True ) ');
         ExecSQL;
      finally
         Free;
      end;
end;

function TCreateEvents.ParamType(Param: string): THealthParamType;
begin
   Result := htpInvalid;
   Param := UpperCase(Param);

   // Check if Valid Medicine Code;
   with GenQuery do
      begin

         SQL.Clear;
         SQL.Add('Select ID From Medicine where UPPER(DrugCode) = :ADrugCode ');
         Params[0].Value := Param;
         Open;

         try
            if not IsEmpty then
               begin
                  First;
                  if ( FieldByName('ID').AsInteger > 0 ) then
                     Result := hptMedicineCode;
               end;
         finally
            Close;
         end;
      end;

   if ( Result <> htpInvalid ) then Exit;

   // Check if Valid Health Code;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select ID From GenLook where UPPER(LookupCode) = :ALookupCode ');
         SQL.Add('and ListType in (13,14)');
         Params[0].Value := Param;
         Open;
         try
            if not IsEmpty then
               begin
                  First;
                  if ( FieldByName('ID').AsInteger > 0 ) then
                     Result := hptHealthCode;
               end;
         finally
            Close;
         end;
      end;

   if ( Result <> htpInvalid ) then Exit;

   // Check if Valid Health Code;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select ID From MediPur where UPPER(BatchNo) = :ABatchNo ');
         Params[0].Value := Param;
         Open;
         try
            if not IsEmpty then
               begin
                  First;
                  if ( FieldByName('ID').AsInteger > 0 ) then
                     Result := hptMedicineBatchNo;
               end;
         finally
            Close;
         end;
      end;
end;

procedure TCreateEvents.SaveErroneousList;
var
   sl : tstringlist;
begin
   if ( ErroneousItems.Count > 0 ) then
      if FileExists( '' ) then
         begin
            sl := TStringList.Create;
            try
               sl.LoadFromFile('' );
               sl.Append( cCRLF );
               sl.Append( '######### Not Found #########' );
               sl.Append( cCRLF );
               sl.AddStrings(ErroneousItems);
               sl.SaveToFile('' );
            finally
               FreeAndNil(sl);
            end;
         end;
end;


procedure TCreateEvents.ProcessSalesDeaths;
function ParseSalesDeaths(FLine : String) : TPhoneLinkSaleDeathEvent;
begin
   Result := TPhoneLinkSaleDeathEvent.Create;
   if Result <> nil then
   case EventSource of
      esNokiaLink   : begin
                         Parser.Parse(FLine + cSpaceDelimiter);
                         Result.EventType   := Parser.ParseFields[2][1];
                         Result.AnimalNo    := TrimUpperStr(Parser.ParseFields[3]);
                         Result.EventDate   := StrToDate(Parser.ParseFields[1]);
{                         if Parser.ParseFields[4] <> '' then
                            begin
                               Result.Customer  := Parser.ParseFields[4];
                            end
                         else
                            Result.Customer := '';
                         Result.Sold := TrimUpperStr(Parser.ParseFields[5]) = 'Y';
}
                         if Parser.ParseFields[4] <> '' then
                            begin
                               try
                                  Result.Price := StrToFloat(Parser.ParseFields[4]) / 100;
                               except
                                  Result.Price := 0;
                               end;
                            end;
                         if Parser.ParseFields[5] <> '' then
                            begin
                               try
                                  Result.SaleWeight := StrToFloat(Parser.ParseFields[5]);
                               except
                                  Result.SaleWeight := 0;
                               end;
                            end;
                         if Parser.ParseFields[6] <> '' then
                            begin
                               try
                                  Result.Grade := Parser.ParseFields[6];
                               except
                                  Result.Grade := '';
                               end;
                            end;
                      end;
      esParlourLink : begin
                         { Not yet imported from the parlour link }
                      end;
   end;
end;
var
   i : Integer;
   SaleDeath : TPhoneLinkSaleDeathEvent;
begin
   try
      try
         EventTable.Active := True;
         if (EventSource <> esPDA ) then
            begin
               for i := 0 to EventList.Count-1 do
                  begin
                     if ( Length(EventList[i]) > 0 ) then
                        if ( ExtractEventCode( EventList.Strings[i]) = cSaleDeathsCode ) then
                           begin
                              SaleDeath := ParseSalesDeaths(EventList.Strings[i]);
                              try
                                 if ( SaleDeath.EventDate > 0 ) and ( LookUpDamSire.Locate('AnimalNo;HerdID;InHerd', VarArrayOf([ SaleDeath.AnimalNo, UserHerdID, TRUE ]), [loCaseInsensitive]) ) then
                                    begin
                                       EventTable.Append;
                                       EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                       EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                       EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                       EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                       EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                       EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                       EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                       if ( SaleDeath.EventDate > 0 ) then
                                          EventTable.FieldByName('EventDate').AsDateTime := SaleDeath.EventDate
                                       else if ( EventSource = esParlourLink ) then
                                          EventTable.FieldByName('EventDate').AsDateTime := Date;
                                       EventTable.FieldByName('EventType').AsInteger := CSaleDeathEvent;
                                       EventTable.FieldByName('Comment').AsString := 'Sale';
                                       EventTable.FieldByName('Price').AsFloat := SaleDeath.Price;
                                       EventTable.FieldByName('Weight').AsFloat := SaleDeath.SaleWeight;
                                       EventTable.FieldByName('Grade').AsString := SaleDeath.Grade;
         {                              if SaleDeath.Sold then
                                          EventTable.FieldByName('Comment').AsString := 'Sale'
                                       else
                                          EventTable.FieldByName('Comment').AsString := 'Death';
         }
                                       EventTable.Post;
                                       if ( EventSource = esParlourLink ) then
                                          begin
                                             AddToUsedEvents(EventTable.FieldByName('ID').AsInteger);
                                             if not PDAMovementsRecorded then
                                                PDAMovementsRecorded := True;
                                          end;
                                    end
                                 else
                                    AddToErrorList(CSaleDeathEvent, 'Unable to create Sale/Death event: Animal Number '+SaleDeath.AnimalNo+' not found in Herd '+strHerd+'');
                              finally
                                 SaleDeath.Free;
                              end;
                           end;
                  end;
            end
         else
            with PDATable do
               begin
                  Filter := 'Code=''M'' and ((DataDir)='''+StrHerd+''')';
                  Filtered := True;
                  EventsExist := FindFirst;
                  while EventsExist do
                     begin
                        if ( FieldByName('Date').AsDateTime <= Date ) then
                           begin
                              if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                                 begin
                                    EventTable.Append;
                                    EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                    EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                    EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                    EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                    EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                    EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                    if FieldByName('Date').AsDateTime > 0 then
                                       EventTable.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;
                                    EventTable.FieldByName('EventType').AsInteger := CSaleDeathEvent;

                                    if ( FieldByName('Comment').AsString <> '' ) then
                                       EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                                    else
                                       EventTable.FieldByName('Comment').AsString := 'Sale';
                                    EventTable.FieldByName('Price').AsFloat := FieldByName('SalePrice').AsFloat;
                                    EventTable.FieldByName('Weight').AsFloat := FieldByName('SaleWeight').AsFloat;
                                    EventTable.FieldByName('Grade').AsString := FieldByName('SaleGrade').AsString;
                                    EventTable.FieldByName('Sold').AsBoolean := not FieldByName('Dead').AsBoolean;
                                    EventTable.FieldByName('CustomerID').AsInteger := FieldByName('CustomerID').AsInteger;

                                    if FindField('DisposalPlaceID') <> nil then
                                       EventTable.FieldByName('DisposalPlace').AsInteger := FieldByName('DisposalPlaceID').AsInteger;
                                    if FindField('ICBFDeathReasonID') <> nil then
                                       EventTable.FieldByName('CauseOfDeath').AsInteger := FieldByName('ICBFDeathReasonID').AsInteger;

                                    EventTable.Post;
                                    AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                    if not PDAMovementsRecorded then
                                       PDAMovementsRecorded := True;
                                 end
                              else
                                 AddToErrorList(CSaleDeathEvent, 'Unable to create Sale/Death event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                           end;
                        EventsExist := FindNext;
                     end;
                  Filter := '';
                  Filtered := False;
                  Refresh;
               end;
      except
         on e : Exception do
         raise Exception.Create(E.Message + ' Unable to create Sale/Death event(s)');
      end;
  finally
     if EventTable.Active then
        EventTable.Active := False;
  end;
end;


procedure TCreateEvents.ProcessWeighings;
function ParseWeighing(
  FLine: String): TPhoneLinkWeighingEvent;
begin
   Result := TPhoneLinkWeighingEvent.Create;
   if Result <> nil then
   case EventSource of
      esNokiaLink   : begin
                         Parser.Parse(FLine + cSpaceDelimiter);
                         Result.EventType   := Parser.ParseFields[2][1];
                         Result.AnimalNo    := TrimUpperStr(Parser.ParseFields[3]);
                         Result.EventDate   := StrToDate(Parser.ParseFields[1]);
                         if Parser.ParseFields[4] <> '' then
                            begin
                               try
                                  Result.Weight := StrToFloat(Parser.ParseFields[4]);
                               except
                                  Result.Weight := 0;
                               end;
                            end;
                      end;
      esParlourLink : begin
                         { Not yet imported from the parlour link }
                      end;
   end;
end;
var
   i : Integer;
   plWeighingObj : TPhoneLinkWeighingEvent;
   WeighingEvent : TWeighingEvent;
begin
   try
      try
         EventTable.Active := True;
         if (EventSource <> esPDA ) then
            begin
               for i := 0 to EventList.Count-1 do
                  begin
                     if ( Length(EventList.Strings[i]) > 0 ) then
                        if ( ExtractEventCode( EventList.Strings[i]) = cWeighingCode ) then
                           begin
                              plWeighingObj := ParseWeighing(EventList.Strings[i]);
                              try
                                 if ( LookUpDamSire.Locate('AnimalNo;HerdID;InHerd', VarArrayOf([ plWeighingObj.AnimalNo, UserHerdID, TRUE ]), [loCaseInsensitive]) ) and
                                    ( plWeighingObj.EventDate > 0 ) then
                                    begin
                                       EventTable.Append;
                                       EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                       EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                       EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                       EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                       EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                       EventTable.FieldByName('Comment').AsString := 'Weighing';
                                       EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                       EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                       if plWeighingObj.EventDate > 0 then
                                          EventTable.FieldByName('EventDate').AsDateTime := plWeighingObj.EventDate
                                       else if ( EventSource = esParlourLink ) then
                                          EventTable.FieldByName('EventDate').AsDateTime := Date;
                                       EventTable.FieldByName('EventType').AsInteger := CWeightEvent;
                                       EventTable.FieldByName('Weight').AsFloat := plWeighingObj.Weight;
                                       EventTable.Post;
                                       if ( EventSource = esParlourLink ) then
                                          begin
                                             AddToUsedEvents(EventTable.FieldByName('ID').AsInteger);
                                             if not PDAOtherEventsRecorded then
                                                PDAOtherEventsRecorded := True;
                                          end;
                                    end
                                 else
                                    AddToErrorList(CWeightEvent, 'Unable to create Weighing event: Animal Number '+plWeighingObj.AnimalNo+' not found in Herd '+strHerd+'');
                              finally
                                 plWeighingObj.Free;
                              end;
                           end;
                  end;
            end
         else
            with PDATable do
               begin
                  Filter := 'Code=''W'' and ((DataDir)='''+StrHerd+''')';
                  Filtered := True;
                  EventsExist := FindFirst;
                  while EventsExist do
                     begin
                        if ( FieldByName('Date').AsDateTime <= Date ) then
                           begin
                              if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                                 begin
                                    EventTable.Append;
                                    EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                    EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                    EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                    EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                    EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                    EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                    if ( FieldByName('Comment').AsString <> '' ) then
                                       EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                                    else
                                       EventTable.FieldByName('Comment').AsString := 'Weighing';
                                    if FieldByName('Date').AsDateTime > 0 then
                                       EventTable.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;
                                    EventTable.FieldByName('EventType').AsInteger := CWeightEvent;
                                    EventTable.FieldByName('Weight').AsFloat := FieldByName('Weight').AsFloat;
                                    EventTable.Post;
                                    AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                    if not PDAOtherEventsRecorded then
                                       PDAOtherEventsRecorded := True;
                                 end
                              else
                                 AddToErrorList(CWeightEvent, 'Unable to create Weighing event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                           end;
                        EventsExist := FindNext;
                     end;
                  Filter := '';
                  Filtered := False;
                  Refresh;
               end;

      if ( EventTable.RecordCount > 0 ) then
         begin
            WeighingEvent := TWeighingEvent.Create('BRec');
            EventTable.First;
            while not EventTable.eof do
               begin
                  if ( EventTable.FieldByName('EventType').AsInteger = CWeightEvent ) then
                     if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) ) and
                        ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger, CWeightEvent,
                                                       EventTable.FieldByName('EventDate').AsDateTime)) )then
                        begin
                           WeighingEvent.Append;
                           { Master details }
                           WeighingEvent.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                           WeighingEvent.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                           WeighingEvent.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                           WeighingEvent.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                           WeighingEvent.Weight       := EventTable.FieldByName('Weight').AsFloat;
                           WeighingEvent.EventComment := EventTable.FieldByName('Comment').AsString;
                           { Sub details }
                           case EventSource of
//                              esSiemensLink,
                              esNokiaLink   : WeighingEvent.EventSource := sPHONELINK;
                              esParlourLink : WeighingEvent.EventSource := sPARLOURLINK;
                              esPDA : WeighingEvent.EventSource := sPDA;
                           end;
                           WeighingEvent.Post;

                           EventTable.Edit;
                           EventTable.FieldByName('EventID').AsInteger := WeighingEvent.EventID;
                           EventTable.Post;
                        end
                     else
                        AddToErrorList(CWeightEvent, 'Unable to create Weighing event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                  EventTable.Next;
               end;
               WeighingEvent.Free;
            end;
      except
         raise Exception.Create('Unable to create Weighing event(s)');
      end;
  finally
     if EventTable.Active then
        EventTable.Active := False;
  end;
end;

procedure TCreateEvents.AddToUsedEvents(const id: Integer);
begin
   SetLength(UsedEvents, Length(UsedEvents) +1);
   Usedevents[Length(UsedEvents)-1] := id;
end;

procedure TCreateEvents.ProcessGroups;
var
   qGetGroupName : TQuery;
   Groups : TTable;
   EventsExist : Boolean;
   FeedManager : TFeedManager;
   GroupType : TGroupType;

   MemData : TdxMemData;
begin
   if (EventSource = esPDA ) then
   begin
      // create InMemory dataset of unique group movements.
      // Problems with the hotsync using a windows CE system lead to duplicate entries in the PDATable for groups.
      // ensure that only unique movement events are processed.
      // return an inMemory dataset with only UNIQUE group movements.
      MemData := WinData.GetInMemoryDataset('C:\Kingswood Herd Management\PDA Import Files', 'Select DISTINCT p.AnimalID, p.GroupID, p."Date" from pdaevents p where p.code = ''G''');


   qGetGroupName := TQuery.Create(nil);
   qGetGroupName.DatabaseName := AliasName;
   qGetGroupName.SQL.Add('Select G.Description From Grps G');
   qGetGroupName.SQL.Add('Where ( G.ID =:ID )');

   Groups := TTable.Create(nil);
   Groups.DatabaseName := AliasName;
   Groups.TableName := 'grps';

   Groups.Active := True;
   EventTable.Active := True;
   try
      with PDATable do
         begin
            Filter := 'Code=''G'' and ((DataDir)='''+StrHerd+''')';
            Filtered := True;

            EventsExist := FindFirst;
            while EventsExist do
               begin

                  if MemData.Locate('AnimalID;GroupId;Date', VarArrayOf([FieldByName('AnimalId').AsInteger,
                                                                         FieldByName('GroupId').AsInteger,
                                                                         FieldByName('Date').AsDateTime]), []) then
                     begin
                        MemData.Delete;
                        if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                           begin
                              EventTable.Append;
                              EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                              EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                              EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                              EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                              EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                              EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                              EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                              if ( FieldByName('Comment').AsString <> '' ) then
                                 EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                              else
                              EventTable.FieldByName('Comment').AsString := 'Group Change';

                              if FieldByName('Date').AsDateTime > 0 then
                                 EventTable.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;
                              EventTable.FieldByName('NewGroupID').AsInteger := FieldByName('GroupID').AsInteger;
                              if FieldByName('GroupID').AsInteger > 0 then
                                 begin
                                    qGetGroupName.Close;
                                    qGetGroupName.Params[0].AsInteger := EventTable.FieldByName('NewGroupID').AsInteger;
                                    qGetGroupName.Open;
                                    try
                                        qGetGroupName.First;
                                        EventTable.FieldByName('NewGroup').AsString := qGetGroupName.FieldByName('Description').AsString;
                                    finally
                                       qGetGroupName.Close;
                                    end;

                                    GroupType := WinData.GroupManager.GetGroupIDGroupType(EventTable.FieldByName('NewGroupID').AsInteger);
                                    WinData.GroupManager.AddToGroup(EventTable.FieldByName('AnimalID').AsInteger,
                                                                    EventTable.FieldByName('NewGroupID').AsInteger,
                                                                    True, Date, EventTable.FieldByName('NatIDNum').AsString, False);
                                    if ( GroupType = gtFeed ) then
                                       WinData.FeedManager.CreateFeedsForAnimal(EventTable.FieldByName('AnimalID').AsInteger,
                                                                                EventTable.FieldByName('NewGroupID').AsInteger,
                                                                                Date);

                                    EventTable.FieldByName('EventType').AsInteger := CChangeOfGroup;
                                 end
                              else
                                 begin
                                    WinData.GroupManager.RemoveAnimalFromGrp(EventTable.FieldByName('AnimalID').AsInteger,FieldByName('GroupID').AsInteger,False);
                                    if ( GroupType = gtFeed ) then
                                       WinData.FeedManager.EndFeedEventsForAnimal(EventTable.FieldByName('AnimalID').AsInteger);
                                 end;

                              AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                              if not PDAOtherEventsRecorded then
                                PDAOtherEventsRecorded := True;
                              EventTable.Post;
                        end;
                     end
                  else
                     AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                  EventsExist := FindNext;
               end;
            Filter := '';
            Filtered := False;
            Refresh;
         end;
   finally
      EventTable.Active := False;
      Groups.Close;
      Groups.Free;
      qGetGroupName.Close;
      qGetGroupName.Free;
      if Assigned(MemData) then
         begin
            MemData.Close;
            FreeAndNil(MemData);
         end;
   end;
   end;
end;

procedure TCreateEvents.ProcessPurchases;
var
   NatIDNum : String;
   tOwners : TTable;
   HerdID : Integer;
begin
   if (EventSource = esPDA ) then
   begin
      tOwners := TTable.Create(nil);
      try
         tOwners.DatabaseName := AliasName;
         tOwners.TableName := 'Owners';
         tOwners.Active := True;

         with PDATable do
            begin
               Filter := 'Code=''A'' and ((DataDir)='''+StrHerd+''')';
               Filtered := True;
               EventsExist := FindFirst;
               while EventsExist do
                  begin
                     HerdID := 0; // default to 0;
                     Edit;
                     if FieldByName('HerdIdentity').AsString <> '' then
                        begin
                           if tOwners.Locate('HerdIdentity', FieldByName('HerdIdentity').AsString, []) then
                              HerdID := tOwners.FieldByName('ID').AsInteger;
                        end
                     else
                        begin
                           tOwners.Filter := 'HerdIdentity <> ''NONE''';
                           tOwners.Filtered := True;
                           try
                              if tOwners.RecordCount = 1 then
                                 HerdID := tOwners.FieldByName('ID').AsInteger;
                           finally
                              tOwners.Filter := '';
                              tOwners.Filtered := True;
                           end;
                        end;

                     PDATable.FieldByName('HerdID').AsInteger := HerdID;
                     if ( PDATable.FieldByName('CalfSex').AsString <> '' ) then
                        case PDATable.FieldByName('CalfSex').AsString[1] of
                           'F' : PDATable.FieldByName('Sex').AsString := cSex_Female;
                           'M' : PDATable.FieldByName('Sex').AsString := cSex_Steer;
                           'B' : PDATable.FieldByName('Sex').AsString := cSex_Bull;
                        end;

                     if ( PDATable.FieldByName('CalfBreed').AsString <> '' ) then
                        begin
                           if WinData.Breeds.Locate('Code', FieldByName('CalfBreed').AsString, []) then
                              FieldByName('CalfBreed').AsInteger := WinData.BreedsID.AsInteger
                        end;

                     if ( PDATable.FieldByName('CalfColour').AsString <> '' ) then
                        begin
                           if WinData.GenLookUp.Locate('ListType;LookupCode', VarArrayOf([LAnimalColour,FieldByName('CalfColour').AsString]), []) then
                              FieldByName('CalfColour').AsInteger := WinData.GenLookUpID.AsInteger
                        end;

                     if ( PDATable.FieldByName('FeedComment').AsString <> '' ) then
                        PDATable.FieldByName('ElectronicID').AsString := PDATable.FieldByName('FeedComment').AsString;

                     if ( PDATable.FieldByName('Comment').AsString = '' ) then
                        PDATable.FieldByName('Comment').AsString := 'Purchase';

                     AddToUsedEvents(FieldByName( 'id' ).AsInteger);

                     Post;
                     PDAMovementsRecorded := True;
                     EventsExist := FindNext;
                  end;
               Filter := '';
               Filtered := False;
               Refresh;
            end;
      finally
      end;
   end;
end;

procedure TCreateEvents.ProcessFeedPurchases;
var
   EventsExist : Boolean;
   FeedPurchase : TTable;
begin
   if (EventSource = esPDA ) then
      try
         FeedPurchase := TTable.Create(nil);
         FeedPurchase.DatabaseName := AliasName;
         FeedPurchase.TableName := 'FdStkEvents.db';
         FeedPurchase.Active := True;

         with PDATable do
            begin
               Filter := 'Code=''F'' and ((DataDir)='''+StrHerd+''')';
               Filtered := True;

               EventsExist := FindFirst;
               while EventsExist do
                  begin
                     FeedPurchase.Append;
                     if FindField( 'BatchNum' ) <> nil then
                        FeedPurchase.FieldByName('BatchNumber').AsString := FieldByName('BatchNum').AsString;
                     if FindField( 'Quantity' ) <> nil then
                        FeedPurchase.FieldByName('Quantity').AsFloat := FieldByName('Quantity').AsFloat;
                     if FindField( 'Date' ) <> nil then
                        FeedPurchase.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;
                     if FindField( 'FeedID' ) <> nil then
                        FeedPurchase.FieldByName('FeedType').AsInteger := FieldByName('FeedID').AsInteger;
                     if FindField( 'SupplierID' ) <> nil then
                        FeedPurchase.FieldByName('Supplier').AsInteger := FieldByName('SupplierID').AsInteger;
                     if FindField( 'BuyerID' ) <> nil then // stores Manufacturer ID
                        FeedPurchase.FieldByName('Manufacturer').AsInteger := FieldByName('BuyerID').AsInteger;
                     if FindField( 'FeedComment' ) <> nil then
                        FeedPurchase.FieldByName('Comment').AsString := FieldByName('FeedComment').AsString
                     else if FindField( 'Comment' ) <> nil then
                        FeedPurchase.FieldByName('Comment').AsString := FieldByName('Comment').AsString;
                     FeedPurchase.Post;
                     AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                     EventsExist := FindNext;
                  end;
               Filter := '';
               Filtered := False;
               Refresh;
            end;
      finally
         EventTable.Active := False;
         FeedPurchase.Active := False;
         FeedPurchase.Free;
      end;
end;

procedure TCreateEvents.ProcessMedicinePurchases;
var
   EventsExist : Boolean;
   MedicinePurchase,Medicine : TTable;
begin
   if (EventSource = esPDA ) then
      try
         Medicine := TTable.Create(nil);
         Medicine.DataBaseName := AliasName;
         Medicine.TableName := 'Medicine';
         Medicine.Open;

         MedicinePurchase := TTable.Create(nil);
         MedicinePurchase.DatabaseName := AliasName;
         MedicinePurchase.TableName := 'MediPur.db';
         MedicinePurchase.Active := True;

         with PDATable do
            begin
               Filter := 'Code=''V'' and ((DataDir)='''+StrHerd+''')';
               Filtered := True;

               EventsExist := FindFirst;
               while EventsExist do
                  begin
                     MedicinePurchase.Append;
                     if FindField( 'BatchNum' ) <> nil then
                        MedicinePurchase.FieldByName('BatchNo').AsString := FieldByName('BatchNum').AsString;
                     if FindField( 'Quantity' ) <> nil then
                        MedicinePurchase.FieldByName('Quantity').AsFloat := FieldByName('Quantity').AsFloat;
                     if FindField( 'Date' ) <> nil then
                        MedicinePurchase.FieldByName('PurchDate').AsDateTime := FieldByName('Date').AsDateTime;
                     if FindField( 'SupplierID' ) <> nil then
                        MedicinePurchase.FieldByName('SuppID').AsInteger := FieldByName('SupplierID').AsInteger;
                     if FindField( 'ExpiryDate' ) <> nil then
                        MedicinePurchase.FieldByName('ExpiryDate').AsDateTime := FieldByName('ExpiryDate').AsDateTime;


                     if FindField( 'MedicineID' ) <> nil then
                        MedicinePurchase.FieldByName('DrugID').AsInteger := FieldByName('MedicineID').AsInteger
                     else if FindField( 'HealthCode' ) <> nil then
                        begin
                           if FieldByName('HealthCode').AsString <> '' then
                              begin
                                 if Medicine.Locate('DrugCode', FieldByName('HealthCode').AsString, [loCaseInsensitive]) then
                                    MedicinePurchase.FieldByName('DrugID').AsInteger := Medicine.FieldByName('ID').AsInteger;
                              end;
                        end;

                     MedicinePurchase.FieldByName('InUse').AsBoolean := True;

                     MedicinePurchase.Post;
                     AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                     EventsExist := FindNext;
                  end;
               Filter := '';
               Filtered := False;
               Refresh;
            end;
      finally
         EventTable.Active := False;

         Medicine.Active := False;
         Medicine.Free;
         MedicinePurchase.Active := False;
         MedicinePurchase.Free;
      end;
end;

procedure TCreateEvents.ProcessConditionScores;
var
   EventsExist : Boolean;
   ConditionScoreEvent : TConditionScoreEvent;
begin
   if (EventSource = esPDA ) then
      try
         try
            with PDATable do
               begin
                  EventTable.Active := True;
                  Filter := 'Code=''$'' and ((DataDir)='''+StrHerd+''')';
                  Filtered := True;
                  EventsExist := FindFirst;
                  while EventsExist do
                     begin
                        if ( FieldByName('Date').AsDateTime <= Date ) then
                           begin
                              if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                                 begin
                                    EventTable.Append;
                                    EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                    EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                    EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                    EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                    EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                    EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                    if ( FieldByName('Comment').AsString <> '' ) then
                                       EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString
                                    else
                                       EventTable.FieldByName('Comment').AsString := 'Condition Score';
                                    if FieldByName('Date').AsDateTime > 0 then
                                       EventTable.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;
                                    EventTable.FieldByName('EventType').AsInteger := CCondScoreEvent;
                                    EventTable.FieldByName('Score').AsFloat := FieldByName('Quantity').AsFloat;
                                    EventTable.Post;
                                    AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                    if not PDAOtherEventsRecorded then
                                       PDAOtherEventsRecorded := True;
                                 end
                              else
                                 AddToErrorList(CCondScoreEvent, 'Unable to create Condition Score event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                           end;
                        EventsExist := FindNext;
                     end;
                  Filter := '';
                  Filtered := False;
                  Refresh;
               end;

      if ( EventTable.RecordCount > 0 ) then
         begin
            ConditionScoreEvent := TConditionScoreEvent.Create('CSRec');
            EventTable.First;
            while not EventTable.eof do
               begin
                  if ( EventTable.FieldByName('EventType').AsInteger = CCondScoreEvent ) then
                     if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) ) and
                        ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger, CCondScoreEvent,
                              EventTable.FieldByName('EventDate').AsDateTime)) )then
                        begin
                           ConditionScoreEvent.Append;
                           { Master details }
                           ConditionScoreEvent.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                           ConditionScoreEvent.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                           ConditionScoreEvent.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                           ConditionScoreEvent.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                           ConditionScoreEvent.Score        := EventTable.FieldByName('Score').AsFloat;
                           if (Trim(EventTable.FieldByName('Comment').AsString) <> '') then
                              ConditionScoreEvent.EventComment := EventTable.FieldByName('Comment').AsString;
                           { Sub details }
                           case EventSource of
//                              esSiemensLink,
                              esNokiaLink   : ConditionScoreEvent.EventSource := sPHONELINK;
                              esParlourLink : ConditionScoreEvent.EventSource := sPARLOURLINK;
                              esPDA : ConditionScoreEvent.EventSource := sPDA;
                           end;
                           ConditionScoreEvent.Post;

                           EventTable.Edit;
                           EventTable.FieldByName('EventID').AsInteger := ConditionScoreEvent.EventID;
                           EventTable.Post;
                        end
                     else
                        AddToErrorList(CCondScoreEvent, 'Unable to create Condition Score event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                  EventTable.Next;
               end;
               ConditionScoreEvent.Free;
            end;
         except
            on e : exception do
               raise Exception.Create('Unable to create Condition Score event(s)');
         end;
      finally
         if EventTable.Active then
            EventTable.Active := False;
      end;
end;

procedure TCreateEvents.ProcessCastrations;
var
   i : Integer;
begin
   if ( EventSource <> esPDA ) then Exit;

   EventTable.Active := True;
   try
      with PDATable do
         begin
            First;
            Filter := 'Code=''*'' and ((DataDir)='''+StrHerd+''')';
            Filtered := True;

            EventsExist := FindFirst;
            while EventsExist do
               begin
                  if ( FieldByName('Date').AsDateTime <= Date ) then
                     begin
                        if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                           begin
                              if LookUpDamSire.FieldByName('Sex').AsString = cSex_Bull then
                                 begin
                                    EventTable.Append;
                                    EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                                    EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                                    EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                                    EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                    if ( PDATable.FieldByName('Date').AsDateTime > 0 ) then
                                       EventTable.FieldByName('EventDate').AsDateTime := PDATable.FieldByName('Date').AsDateTime;
                                    EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                                    EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                                    EventTable.FieldByName('EventType').AsInteger := CCastrateEvent;
                                    if ( FieldByName('Comment').AsString <> '' ) then
                                       EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString;
                                    EventTable.Post;
                                    AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                                    if not PDAOtherEventsRecorded then
                                       PDAOtherEventsRecorded := True;
                                 end
                              else
                                 AddToErrorList(CCastrateEvent, 'Unable to create Castration event: Animal Number '+FieldByName('AnimalNumber').AsString+' is not a Bull.');

                           end
                        else
                           AddToErrorList(CCastrateEvent, 'Unable to create Castration event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                     end
                  else
                     AddToErrorList(CCastrateEvent, 'Unable to create Castration event: Event date '+FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime)+' is a date in the future .');
                  EventsExist := FindNext;
               end;
            Filter := '';
            Filtered := False;
            Refresh;
         end;

   if ( EventTable.RecordCount > 0 ) then
      begin
         ECastration := TCastrationEvent.Create('CRec');
         try
            EventTable.First;
            while not EventTable.eof do
               begin
                  if EventTable.FieldByName('EventType').AsInteger = CCastrateEvent then
                     if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) ) and
                        ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                       CCastrateEvent,
                                                       EventTable.FieldByName('EventDate').AsDateTime)) ) then
                        begin
                           ECastration.Append;
                           try
                              { Master details }
                              ECastration.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                              ECastration.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                              ECastration.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                              ECastration.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                              if (Trim(EventTable.FieldByName('Comment').AsString) <> '') then
                                 ECastration.EventComment := EventTable.FieldByName('Comment').AsString;
                              case EventSource of
                                 esPDA : ECastration.EventSource := sPDA;
                              end;

                              EventTable.Edit;
                              EventTable.FieldByName('EventID').AsInteger := ECastration.EventID;
                              if (Trim(EventTable.FieldByName('Comment').AsString) = '') then
                                 EventTable.FieldByName('Comment').AsString := ECastration.EventComment;
                              EventTable.Post;

                              ECastration.Post;
                           except
                              ECastration.Cancel;
                           end;
                        end
                     else
                        AddToErrorList(CCastrateEvent, 'Unable to create Castration event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                  EventTable.Next;
               end;
         finally
            FreeAndNil(ECastration);
         end;
      end;
   finally
      EventTable.Active := False;
   end;
end;

procedure TCreateEvents.ProcessDisbuddings;
begin
   if ( EventSource <> esPDA ) then Exit;

   EventTable.Active := True;
   try
      with PDATable do
         begin
            First;
            Filter := 'Code=''Q'' and ((DataDir)='''+StrHerd+''')';
            Filtered := True;

            EventsExist := FindFirst;
            while EventsExist do
               begin
                  if ( FieldByName('Date').AsDateTime <= Date ) then
                     begin
                        if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                           begin
                              EventTable.Append;
                              EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                              EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                              EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                              EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                              EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                              if ( PDATable.FieldByName('Date').AsDateTime > 0 ) then
                                 EventTable.FieldByName('EventDate').AsDateTime := PDATable.FieldByName('Date').AsDateTime;
                              EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                              EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                              EventTable.FieldByName('EventType').AsInteger := CDisbuddingEvent;
                              if ( FieldByName('Comment').AsString <> '' ) then
                                 EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString;
                              if ( PDATable.FieldByName('AdminBy').AsInteger > 0 ) then
                                 EventTable.FieldByName('DBVet').AsInteger := PDATable.FieldByName('AdminBy').AsInteger;
                              EventTable.Post;
                              AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                              if not PDAOtherEventsRecorded then
                                 PDAOtherEventsRecorded := True;
                           end
                        else
                           AddToErrorList(CDisbuddingEvent, 'Unable to create Disbudding event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                     end
                  else
                     AddToErrorList(CDisbuddingEvent, 'Unable to create Disbudding event: Event date '+FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime)+' is a date in the future .');
                  EventsExist := FindNext;
               end;
            Filter := '';
            Filtered := False;
            Refresh;
         end;

   if ( EventTable.RecordCount > 0 ) then
      begin
         EDisbudding := TDisbuddingEvent.Create('DRec');
         try
            EventTable.First;
            while not EventTable.eof do
               begin
                  if EventTable.FieldByName('EventType').AsInteger = CDisbuddingEvent then
                     if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) ) and
                        ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                       CDisbuddingEvent,
                                                       EventTable.FieldByName('EventDate').AsDateTime)) ) then
                        begin
                           EDisbudding.Append;
                           try
                              { Master details }
                              EDisbudding.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                              EDisbudding.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                              EDisbudding.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                              EDisbudding.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                              if (Trim(EventTable.FieldByName('Comment').AsString) <> '') then
                                 EDisbudding.EventComment := EventTable.FieldByName('Comment').AsString;
                              if ( EventTable.FieldByName('DBVet').AsInteger > 0 ) then
                                 EDisbudding.Vet := EventTable.FieldByName('DBVet').AsInteger;
                              case EventSource of
                                 esPDA : EDisbudding.EventSource := sPDA;
                              end;

                              EventTable.Edit;
                              EventTable.FieldByName('EventID').AsInteger := EDisbudding.EventID;
                              if (Trim(EventTable.FieldByName('Comment').AsString) = '') then
                                 EventTable.FieldByName('Comment').AsString := EDisbudding.EventComment;
                              EventTable.Post;

                              EDisbudding.Post;
                           except
                              EDisbudding.Cancel;
                           end;
                        end
                     else
                        AddToErrorList(CDisbuddingEvent, 'Unable to create Disbudding event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                  EventTable.Next;
               end;
         finally
            FreeAndNil(EDisbudding);
         end;
      end;

   finally
      EventTable.Active := False;
   end;
end;

procedure TCreateEvents.ProcessMealFeedings;
var
   i : Integer;
begin
   if ( EventSource <> esPDA ) then Exit;

   EventTable.Active := True;
   try
      with PDATable do
         begin
            First;
            Filter := 'Code=''5'' and ((DataDir)='''+StrHerd+''')';
            Filtered := True;

            EventsExist := FindFirst;
            while EventsExist do
               begin
                  if ( FieldByName('Date').AsDateTime <= Date ) then
                     begin
                        if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                           begin
                              EventTable.Append;
                              EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                              EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                              EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                              EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                              EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                              if ( PDATable.FieldByName('Date').AsDateTime > 0 ) then
                                 EventTable.FieldByName('EventDate').AsDateTime := PDATable.FieldByName('Date').AsDateTime;
                              EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                              EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                              EventTable.FieldByName('EventType').AsInteger := CMealFeedingEvent;
                              if (Trim(EventTable.FieldByName('Comment').AsString) <> '') then
                                 EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString;
                              EventTable.Post;
                              AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                              if not PDAOtherEventsRecorded then
                                 PDAOtherEventsRecorded := True;
                           end
                        else
                           AddToErrorList(CMealFeedingEvent, 'Unable to create Meal Feeding event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                     end
                  else
                     AddToErrorList(CMealFeedingEvent, 'Unable to create Meal Feeding event: Event date '+FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime)+' is a date in the future .');
                  EventsExist := FindNext;
               end;
            Filter := '';
            Filtered := False;
            Refresh;
         end;

   if ( EventTable.RecordCount > 0 ) then
      begin
         EMealFeeding := TMealFeedingEvent.Create('MRec');
         try
            EventTable.First;
            while not EventTable.eof do
               begin
                  if EventTable.FieldByName('EventType').AsInteger = CMealFeedingEvent then
                     if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) ) and
                        ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                       CMealFeedingEvent,
                                                       EventTable.FieldByName('EventDate').AsDateTime)) ) then
                        begin
                           EMealFeeding.Append;
                           try
                              { Master details }
                              EMealFeeding.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                              EMealFeeding.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                              EMealFeeding.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                              EMealFeeding.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                              if (Trim(EventTable.FieldByName('Comment').AsString) <> '') then
                                 EMealFeeding.EventComment := EventTable.FieldByName('Comment').AsString;
                              case EventSource of
                                 esPDA : EMealFeeding.EventSource := sPDA;
                              end;

                              EventTable.Edit;
                              EventTable.FieldByName('EventID').AsInteger := EMealFeeding.EventID;
                              if (Trim(EventTable.FieldByName('Comment').AsString) = '') then
                                 EventTable.FieldByName('Comment').AsString := EMealFeeding.EventComment;
                              EventTable.Post;

                              EMealFeeding.Post;
                           except
                              EMealFeeding.Cancel;
                           end;
                        end
                     else
                        AddToErrorList(CMealFeedingEvent, 'Unable to create Meal Feeding event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                  EventTable.Next;
               end;
         finally
            FreeAndNil(EMealFeeding);
         end;
      end;
   finally
      EventTable.Active := False;
   end;
end;

procedure TCreateEvents.ProcessWeanings;
begin
   if ( EventSource <> esPDA ) then Exit;

   EventTable.Active := True;
   try
      with PDATable do
         begin
            First;
            Filter := 'Code=''6'' and ((DataDir)='''+StrHerd+''')';
            Filtered := True;

            EventsExist := FindFirst;
            while EventsExist do
               begin
                  if ( FieldByName('Date').AsDateTime <= Date ) then
                     begin
                        if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                           begin
                              EventTable.Append;
                              EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                              EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                              EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                              EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                              EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                              if ( PDATable.FieldByName('Date').AsDateTime > 0 ) then
                                 EventTable.FieldByName('EventDate').AsDateTime := PDATable.FieldByName('Date').AsDateTime;
                              EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                              EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;
                              EventTable.FieldByName('EventType').AsInteger := CWeaningEvent;
                              if ( FieldByName('Comment').AsString <> '' ) then
                                 EventTable.FieldByName('Comment').AsString := FieldByName('Comment').AsString;

                              if ( Trim( PDATable.FieldByName('SaleGrade').AsString) <> '' ) then
                                 try
                                    EventTable.FieldByName('WNWeight').AsFloat := StrToFloat(PDATable.FieldByName('SaleGrade').AsString);
                                 except
                                    EventTable.FieldByName('WNWeight').AsFloat := 0;
                                 end;

                              if ( PDATable.FieldByName('MedicineID').AsInteger > 0 ) then
                                 EventTable.FieldByName('WNDocility').AsInteger := PDATable.FieldByName('MedicineID').AsInteger;

                              if ( PDATable.FieldByName('BirthTypeID').AsInteger > 0 ) then
                                 EventTable.FieldByName('WNQuality').AsInteger := PDATable.FieldByName('BirthTypeID').AsInteger;

                              if ( Trim( PDATable.FieldByName('BatchNum').AsString) <> '' ) then
                                 try
                                    EventTable.FieldByName('WNWeighingOnDate').AsDateTime := StrToDate(PDATable.FieldByName('BatchNum').AsString);
                                 except
                                 end;

                              EventTable.Post;
                              AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                              if not PDAOtherEventsRecorded then
                                 PDAOtherEventsRecorded := True;
                           end
                        else
                           AddToErrorList(CWeaningEvent, 'Unable to create Weaning event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                     end
                  else
                     AddToErrorList(CWeaningEvent, 'Unable to create Weaning event: Event date '+FormatDateTime(cIrishDateStyle,FieldByName('EventDate').AsDateTime)+' is a date in the future .');
                  EventsExist := FindNext;
               end;
            Filter := '';
            Filtered := False;
            Refresh;
         end;

   if ( EventTable.RecordCount > 0 ) then
      begin
         EWeaning := TWeaningEvent.Create('WRec');
         try
            EventTable.First;
            while not EventTable.eof do
               begin
                  if EventTable.FieldByName('EventType').AsInteger = CWeaningEvent then
                     if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger, EventTable.FieldByName('HerdID').AsInteger)) ) and
                        ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                       CWeaningEvent,
                                                       EventTable.FieldByName('EventDate').AsDateTime)) ) then
                        begin
                           EWeaning.Append;
                           try
                              { Master details }
                              EWeaning.AnimalID     := EventTable.FieldByName('AnimalID').AsInteger;
                              EWeaning.AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                              EWeaning.AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                              EWeaning.EventDate    := EventTable.FieldByName('EventDate').AsDateTime;
                              if (Trim(EventTable.FieldByName('Comment').AsString) <> '') then
                                 EWeaning.EventComment := EventTable.FieldByName('Comment').AsString;
                              if ( EventTable.FieldByName('WNDocility').AsInteger > 0 ) then
                                 EWeaning.Docility := EventTable.FieldByName('WNDocility').AsInteger;
                              if ( EventTable.FieldByName('WNQuality').AsInteger > 0 ) then
                                 EWeaning.Quality := EventTable.FieldByName('WNQuality').AsInteger;
                              if ( EventTable.FieldByName('WNWeight').AsFloat > 0 ) then
                                 EWeaning.Weight := EventTable.FieldByName('WNWeight').AsFloat;
                              if ( EventTable.FieldByName('WNWeighingOnDate').AsDateTime > 0 ) then
                                 EWeaning.WeightOnDate := EventTable.FieldByName('WNWeighingOnDate').AsDateTime;

                              case EventSource of
                                 esPDA : EWeaning.EventSource := sPDA;
                              end;

                              EventTable.Edit;
                              EventTable.FieldByName('EventID').AsInteger := EWeaning.EventID;
                              if (Trim(EventTable.FieldByName('Comment').AsString) = '') then
                                 EventTable.FieldByName('Comment').AsString := EWeaning.EventComment;
                              EventTable.Post;

                              EWeaning.Post;
                           except
                              EWeaning.Cancel;
                           end;
                        end
                     else
                        AddToErrorList(CWeaningEvent, 'Unable to create Weaning event: Animal '+EventTable.FieldByName('NatIDNum').AsString+' has an Active Temporary Movement');
                  EventTable.Next;
               end;
         finally
            FreeAndNil(EWeaning);
         end;
      end;

   finally
      EventTable.Active := False;
   end;
end;

//   05/10/12 [V5.1 R0.2] /MK Additional Feature - Created ProcessTempMovements.
procedure TCreateEvents.ProcessTempMovements;
const
   cTempMoveIn = 'TempMoveIn';
   cTempMoveOut = 'TempMoveOut';
var
   TempMovementEvent : TTemporaryMovement;
   iActiveMovementID : Integer;
begin
   if ( EventSource <> esPDA ) then Exit;

   EventTable.Active := True;
   try
      with PDATable do
         begin
            First;
            Filter := 'Code=''L'' and ((DataDir)='''+StrHerd+''')';
            Filtered := True;

            EventsExist := FindFirst;

            while EventsExist do
               begin
                  if ( FieldByName('Date').AsDateTime <= Date ) then
                     begin
                        if LookUpDamSire.Locate('ID',FieldByName('AnimalID').AsInteger, [loCaseInsensitive]) then
                           begin
                              EventTable.Append;
                              EventTable.FieldByName('AnimalID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                              EventTable.FieldByName('AnimalNo').AsString := LookUpDamSire.FieldByName('AnimalNo').AsString;
                              EventTable.FieldByName('NatIDNum').AsString := LookUpDamSire.FieldByName('NatIDNum').AsString;
                              EventTable.FieldByName('LactNo').AsInteger := LookUpDamSire.FieldByName('LactNo').AsInteger;
                              EventTable.FieldByName('HerdID').AsInteger := LookUpDamSire.FieldByName('HerdID').AsInteger;
                              EventTable.FieldByName('SortAnimalNo').AsString := LookUpDamSire.FieldByName('SortAnimalNo').AsString;
                              EventTable.FieldByName('SortNatID').AsString := LookUpDamSire.FieldByName('SortNatID').AsString;

                              if ( FieldByName('BatchNum').AsString = '0' ) then
                                 begin
                                    EventTable.FieldByName('MovementType').AsString := cTempMoveOut;
                                    EventTable.FieldByName('Comment').AsString := 'Temp Movement Out '+FieldByName('Comment').AsString;
                                 end
                              else if ( FieldByName('BatchNum').AsString = '1' ) then
                                 begin
                                    EventTable.FieldByName('MovementType').AsString := cTempMoveIn;
                                    EventTable.FieldByName('Comment').AsString := 'Temp Movement In '+FieldByName('Comment').AsString
                                 end;

                              if FieldByName('Date').AsDateTime > 0 then
                                 EventTable.FieldByName('EventDate').AsDateTime := FieldByName('Date').AsDateTime;

                              EventTable.FieldByName('CustomerID').AsInteger := FieldByName('CustomerID').AsInteger;
                              EventTable.FieldByName('EventType').AsInteger := CMovementEvent;
                              EventTable.Post;
                              AddToUsedEvents(FieldByName( 'id' ).AsInteger);
                              if not PDAOtherEventsRecorded then
                                 PDAOtherEventsRecorded := True;
                           end
                        else
                           AddToErrorList(CCondScoreEvent, 'Unable to create Temp Movement event: Animal Number '+FieldByName('AnimalNumber').AsString+' not found in Herd '+strHerd+'');
                     end;
                  EventsExist := FindNext;
               end;
            Filter := '';
            Filtered := False;
            Refresh;
         end;

      if ( EventTable.RecordCount > 0 ) then
         begin
            EventTable.First;
            while ( not(EventTable.Eof) ) do
               begin
                  // If not a Movement Event then got to next record.
                  if ( not(EventTable.FieldByName('EventType').AsInteger = CMovementEvent) ) then
                     begin
                        EventTable.Next;
                        Continue;
                     end;

                  if ( EventTable.FieldByName('MovementType').AsString = cTempMoveOut ) then
                     begin
                        if ( not(ActiveMovement(EventTable.FieldByName('AnimalID').AsInteger,EventTable.FieldByName('HerdID').AsInteger)) ) and
                           ( not(WinData.CheckEventExists(EventTable.FieldByName('AnimalID').AsInteger,
                                                          CMovementEvent, EventTable.FieldByName('EventDate').AsDateTime)) ) then
                           begin
                              try
                                 TempMovementEvent := TTemporaryMovement.Create('TempMoves');
                                 with TempMovementEvent do
                                    try
                                       Append;
                                       AnimalID := EventTable.FieldByName('AnimalID').AsInteger;
                                       AnimalLactNo := EventTable.FieldByName('LactNo').AsInteger;
                                       AnimalHerdID := EventTable.FieldByName('HerdID').AsInteger;
                                       EventType := TMovement;
                                       EventComment := EventTable.FieldByName('Comment').AsString;
                                       EventDate := EventTable.FieldByName('EventDate').AsDateTime;
                                       AID := AnimalID;
                                       MovedTo := EventTable.FieldByName('CustomerID').AsInteger;
                                       StillOffFarm := True;
                                       Remark := EventComment;
                                       Post;
                                    except
                                       Cancel;
                                    end;
                              finally
                                 FreeAndNil(TempMovementEvent);
                              end;
                           end
                     end
                  else if ( EventTable.FieldByName('MovementType').AsString = cTempMoveIn ) then
                     begin
                        iActiveMovementID := ActiveMovementID(EventTable.FieldByName('AnimalID').AsInteger);
                        if ( iActiveMovementID > 0 ) then
                           try
                              WinData.UpdateTempMovementEvents(iActiveMovementID,
                                                               EventTable.FieldByName('EventDate').AsDateTime);
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;
                     end;
                  EventTable.Next;
               end;
         end;
   finally
      EventTable.Active := False;
   end;
end;

function TCreateEvents.ActiveMovementID(AnimalID: Integer): Integer;
begin
   Result := 0;
   with WinData do
      if CheckEvents.Locate('AnimalID;EventType', VarArrayOf([AnimalID,CMovementEvent]), [] ) then
         begin
            luMovements.Open;
            try
               if luMovements.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                   if luMovements.FieldByName('StillOffFarm').AsBoolean then
                      begin
                         Result := WinData.CheckEvents.FieldByName('ID').AsInteger;
                      end;
            finally
               luMovements.Close;
            end;
         end;
end;

function TCreateEvents.AddBullIDFromSireRegister(AAICode : String) : Integer;
var
   NewBull : TAnimalRecord;
   sAICode, sHerdBookNo, sBreedCode, sName, sReliability, sSQLStr : String;
   iCountry : Integer;
   fRBI, fMilkPredDiff, fFatKgs, fFatPerc, fProtKgs, fProtPerc, fCalvingDifficulty : Double;
   qAddFromRegister : TQuery;
begin
   Result := 0;
   if ( Length(Trim(AAICode)) = 0 ) then Exit;
   qAddFromRegister := TQuery.Create(nil);
   with qAddFromRegister do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Sires');
         SQL.Add('WHERE (AICode = :AAICode)');
         SQL.Add('OR    (Name = :AAICode)');
         Params[0].AsString := AAICode;
         //   18/05/17 [V5.6 R8.3] /MK Bug Fix - Search the Name of the bull for the value that is passed on for the same reason as above.
         Params[1].AsString := AAICode;
         try
            Open;
            if ( RecordCount = 1 ) then
               begin
                  //   18/05/17 [V5.6 R8.3] /MK Bug Fix - As we're now also searching the Name assign code of new bull created to code from register.
                  sAICode := '';
                  sAICode := FieldByName('AICode').AsString;
                  sHerdBookNo := '';
                  sHerdBookNo := FieldByName('HerdBookNo').AsString;
                  sName := '';
                  sName := FieldByName('Name').AsString;
                  sBreedCode := '';
                  sBreedCode := FieldByName('BreedCode').AsString;
                  iCountry := 0;
                  iCountry := FieldByName('Country').AsInteger;
                  fRBI := 0;
                  fRBI := FieldByName('RBI').AsFloat;
                  fMilkPredDiff := 0;
                  fMilkPredDiff := FieldByName('MilkPredDiff').AsFloat;
                  fFatKgs := 0;
                  fFatKgs := FieldByName('FatKgs').AsFloat;
                  fFatPerc := 0;
                  fFatPerc := FieldByName('FatPerc').AsFloat;
                  fProtKgs := 0;
                  fProtKgs := FieldByName('ProtKgs').AsFloat;
                  fProtPerc := 0;
                  fProtPerc := FieldByName('ProtPerc').AsFloat;
                  sReliability := '';
                  sReliability := FieldByName('Reliability').AsString;
                  fCalvingDifficulty := 0;
                  fCalvingDifficulty := FieldByName('CalvingDifficulty').AsFloat;

                  NewBull := TAnimalRecord.Create;
                  try
                     try
                        NewBull.AddToNoneHerd;
                        NewBull.HerdBookNo := sHerdBookNo;
                        NewBull.AnimalNo := sAICode;
                        NewBull.Name := Name;
                        NewBull.Sex := cSex_Bull;
                        if ( not(sBreedCode <> '') ) then
                           sBreedCode := 'FR';
                        NewBull.PrimaryBreedCode := sBreedCode;
                        NewBull.Breeding := True;
                        if ( NewBull.Save ) then
                           Result := NewBull.Id;
                     except
                        NewBull.Cancel;
                     end;
                  finally
                     FreeAndNil(NewBull);
                  end;

                  sSQLStr := '';
                  sSQLStr := 'INSERT INTO BullExt (AnimalID, Country, RBI, MilkPredDiff, FatKgs, FatPerc, ProtKgs, ProtPerc, Reliability, CalvingDifficulty)'+cCRLF+
                             'VALUES ('+IntToStr(Result)+','+IntToStr(iCountry)+','+FloatToStr(fRBI)+','+FloatToStr(fMilkPredDiff)+','+FloatToStr(fFatKgs)+','+
                                      FloatToStr(fFatPerc)+','+FloatToStr(fProtKgs)+','+FloatToStr(fProtPerc)+',"'+sReliability+'",'+FloatToStr(fCalvingDifficulty)+')';
                  SQL.Clear;
                  SQL.Text := sSQLStr;
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               end
            else if RecordCount = 0 then
               begin
                  NewBull := TAnimalRecord.Create;
                  try
                     try
                        NewBull.AddToNoneHerd;
                        NewBull.HerdBookNo := sHerdBookNo;
                        NewBull.AnimalNo := AAICode;
                        NewBull.Name := Name;
                        NewBull.Sex := cSex_Bull;
                        NewBull.PrimaryBreedCode := 'FR';
                        NewBull.Breeding := True;
                        if ( NewBull.Save ) then
                           Result := NewBull.Id;
                     except
                        NewBull.Cancel;
                     end;
                  finally
                     FreeAndNil(NewBull);
                  end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         FreeAndNil(qAddFromRegister);
      end;
end;

function TCreateEvents.GetBullByTagNo(var ABullID : Integer; var ABullNatID : String) : Boolean;
begin
   Result := False;
   if ( ABullNatID = '' ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, AnimalNo');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE SearchNatID Like "%'+ABullNatID+'%"');
         SQL.Add('AND Upper(Sex) = "BULL"');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            if ( Fields[0].AsInteger > 0 ) then
               ABullID := Fields[0].AsInteger;
            if ( Fields[1].AsString <> '' ) then
               ABullNatID := Fields[1].AsString;
            Result := ( ABullID > 0 ); 
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TCreateEvents.ActivateBullInUse(ABullID : Integer);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Animals');
         SQL.Add('SET Breeding = TRUE');
         SQL.Add('WHERE ID = '+IntToStr(ABullID)+'');
         try
            ExecSQL;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM BullSemenStk');
            SQL.Add('WHERE AnimalID = '+IntToStr(ABullID)+'');
            try
               Open;
               if ( RecordCount = 0 ) then
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('INSERT INTO BullSemenStk (AnimalID, InUse)');
                     SQL.Add('VALUES ('+IntToStr(ABullID)+',TRUE)');
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  end
               else
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('UPDATE BullSemenStk');
                     SQL.Add('SET InUse = TRUE');
                     SQL.Add('WHERE AnimalID = '+IntToStr(ABullID)+'');
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  end;
            except
               on e : Exception do
                 ShowMessage(e.Message);
            end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

end.
