{
  ----------------------------------------------------------------------------
  SP 04/10/2002:-

  Donor Dam ID
  Donor Dam Breed
  These two items where added to the ICBF Calving File.

  SP 04/10/2002.
  ----------------------------------------------------------------------------
               
  SP 27/01/2003:-

  Only allow valid ICBF Health Events to be registered. Validation is based
  on the ICBF Health Code

  SP 27/01/2003.

  02/02/2009 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Additional Feature - Allow user to permanently remove calves from registration
                                            /SP Additional Feature - Allow user to permanently remove events from registration

  23/07/10 [V4.0 R4.1] /MK Additional Feature - Allow Invalid Tag to be registered from DeadCalf Tag but remove Tag and Sex from File Export.

  08/09/11 [V5.0 R0.6] /MK Additional Feature - New MilkTemperament Included In ICBFExport For New Event and Deleted Event.

  09/02/13 [V5.1 R4.1] /MK Additional Feature - QueryCalvings - Check to see if RelinkCalvesToDams needs to run.

  13/05/13 [V5.1 R7.1] /MK Additional Feature - Added export of new ICBF Cow and Stock Bull events.

  17/05/13 [V5.1 R7.1] /MK Additional Feature - Only events show events with Health as ICBFCE or ICBFSB for ICBF Dam
                                                and Stock Bull Events that have been deleted.

  19/09/13 [V5.2 R1.4] /MK Bug Fix - SendToICBF - Don't empty table here as needed for MarkAsRegistered.

  20/09/13 [V5.2 R1.5] /MK Change - Export Calf Quality and Docility for new Calf Survey Event.
                                  - Removed export of Calf Quality and Docility for Weaning.

  21/02/14 [V5.2 R8.4] /MK Change - Procedure, AddSexedSemenCodeToBullString, created to add Sexed Semen from GenLookup.LookupCode to SireCode.
                                  - Only strip off punction if SireNatID Number not SireCode as Sexed Semen e.g. -90F, added to SireCode.

  01/10/14 [V5.3 R7.4] /MK Bug Fix - Strip out value after decimal in weight before sending - John McEnroe.
                                     Only add weight to file if length of weight is 3 after decimal value after is stripped.

  29/10/14 [V5.3 R8.7] /MK Bug Fix - Since change to weight decimals (above), other events (Service & Other) were not given the right length in the file.

  06/11/14 [V5.3 R8.8] /MK Change - FormActivate - Show user urgent warning if events have been reset to be resent - don't auto resend - GL request.

  09/12/14 [V5.3 R9.1] /MK Change - CheckHerdIdentifier - Changed Identifier in messages to Designator.

  16/06/16 [V5.5 R6.8] /MK Additional Feature - New traits required for ICBFCalfSurvey event.

  07/10/16 [V5.6 R2.0] /MK Additional Feature - Added new lengths for 372 tag numbers as requested by ICBF.

  19/10/16 [V5.6 R2.3] /MK Change - Name of calving file changed to have B at start of file instead of C for 15 digit tag length files.
                                  - Name of services file changed to have E at start of file instead of C for 15 digit tag length files.

  26/10/16 [V5.6 R2.7] /MK Change - ICBF now want the Herd Number to be added to the name of the file instead of the Herd Identifier.

  23/11/16 [V5.6 R3.5] /MK Change - No point going through SQL's for Calvings and Services if there are no events to register - MK.

  29/06/17 [V5.6 R9.0] /MK Change - MarkAsRegistered - Mark all events except for Calf Survey events as registered.
                                                     - For Calf Survey events only register the events that are completed i.e have all 6 parameters.

  06/02/18 [V5.7 R8.0] /MK Bug Fix - CheckHerdNumber - Need to pass in Herd Number because if user enters an animal into None Herd then None Herd is set as HerdOwnerData.HerdID - Enda Ryan.
                                   - OpenSetupHerd - Removed if AStartClick then sbStart.Click as causing loop - SP request.

  14/08/19 [V5.8 R9.8] /MK Bug Fix - sbStartClick - Only do this check if the user hasn't ticked "Include Events Already Marked As Registered" - Captal Farms.

  13/09/19 [V5.9 R0.3] /MK Change - MarkAsRegistered - If Incomplete ICBF Calf Survey events found then show message after file has been sent - Michael Cawe's.

  24/03/20 [V5.9 R3.0] /MK Additional Feature - Show uMessageScr if the user has the App or if they don't that this will be the last time to use the ICBF email option.
                                              - If the user has recorded BDP welfare events in the last year then don't show uMessageScr.

  08/11/21 [V6.0 R2.8] /MK Additional Feature - If the user has the App then only allow BDP Welfare Events to be emailed and tell the user this in uMessageScr.                                              
}

unit uICBFEventExport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, DBTables, Grids, DBGrids, ToolWin, ComCtrls, ExtCtrls,
  RXCtrls, RXSplit, StdCtrls, Mask, ToolEdit, DbPrgrss, Psock, NMsmtp,
  RxLookup, RXDBCtrl, TB97, TB97Tlbr, Email, SMapi, Menus, KRxSpeedButton,
  cxControls, dxStatusBar, FileCtrl, Def, DairyData, uMessageScr,
  uFarmSyncSettings, DateUtil, uApplicationLog;

type
  TGridSort = (gsAscending, gsDescending);
  TfICBFEventExport = class(TForm)
    tICBFServices: TTable;
    tICBFCalving: TTable;
    dsICBFServices: TDataSource;
    dsICBFCalving: TDataSource;
    qICBFServices: TQuery;
    qICBFCalving: TQuery;
    tbICBF: TToolBar;
    sbExit: TRxSpeedButton;
    sbStart: TRxSpeedButton;
    sbFile: TRxSpeedButton;
    GenQuery: TQuery;
    pReRegister: TPanel;
    lDateFrom: TLabel;
    lDateTo: TLabel;
    cbReRegister: TCheckBox;
    sbHelp: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    tICBFServicesSEventDate: TDateField;
    tICBFServicesSWithinHerdID: TStringField;
    tICBFServicesSHerdID: TStringField;
    tICBFServicesSNationalID: TStringField;
    tICBFServicesNewIDEvent: TStringField;
    tICBFServicesSSireID: TStringField;
    tICBFServicesBullInOut: TStringField;
    tICBFServicesHealth: TStringField;
    tICBFServicesPregnancy: TStringField;
    tICBFServicesWeight: TFloatField;
    tICBFServicesDryOff: TStringField;
    tICBFServicesCulled: TStringField;
    tICBFServicesSAction: TStringField;
    tICBFServicesSEventID: TIntegerField;
    tICBFServicesSEventType: TIntegerField;
    tICBFServicesSHerdType: TIntegerField;
    tICBFServicesSAIBull: TBooleanField;
    tICBFServicesSBullNo: TStringField;
    tICBFServicesSBullID: TStringField;
    tICBFServicesSBullHerd: TIntegerField;
    tICBFServicesPregStatus: TBooleanField;
    tICBFCalvingCEventDate: TDateField;
    tICBFCalvingCHerdID: TStringField;
    tICBFCalvingCDamNatID: TStringField;
    tICBFCalvingCalfNatID: TStringField;
    tICBFCalvingCalcSex: TStringField;
    tICBFCalvingCSireID: TStringField;
    tICBFCalvingMortality: TStringField;
    tICBFCalvingCalfEase: TStringField;
    tICBFCalvingCalfName: TStringField;
    tICBFCalvingCAction: TStringField;
    tICBFCalvingCEventID: TIntegerField;
    tICBFCalvingSex: TStringField;
    tICBFCalvingCAIBull: TBooleanField;
    tICBFCalvingCBullNo: TStringField;
    tICBFCalvingCBullID: TStringField;
    tICBFCalvingCBullHerd: TIntegerField;
    ToolButton5: TToolButton;
    tICBFCalvingCBull: TIntegerField;
    MailSender: TNMSMTP;
    tICBFServicesSEventDesc: TStringField;
    pEMail: TPanel;
    EMailMemo: TMemo;
    sbSettings: TRxSpeedButton;
    sbCancel: TRxSpeedButton;
    ErrorMemo: TMemo;
    Panel1: TPanel;
    lServiceWait: TLabel;
    lCalvingWait: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    cbHerdID: TRxDBLookupCombo;
    DateTo: TDateEdit;
    DateFrom: TDateEdit;
    ToolButton7: TToolButton;
    tICBFCalvingCDamBreed: TStringField;
    tICBFCalvingCSireBreed: TStringField;
    qValidCodes: TQuery;
    tICBFServicesID: TAutoIncField;
    tICBFCalvingID: TAutoIncField;
    ICBFMail: TEmail;
    tICBFCalvingCID: TIntegerField;
    RxSpeedButton3: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    IncludeEventsalreadyMarkedasRegisteredtoICBF1: TMenuItem;
    QueryICBFCalfSurveyDetails: TQuery;
    N1: TMenuItem;
    ReviewSucklerComplianceEvents1: TMenuItem;
    KRxSpeedButton1: TKRxSpeedButton;
    ToolButton6: TToolButton;
    Panel7: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    dbCalvingGrid: TDBGrid;
    Panel8: TPanel;
    Label2: TLabel;
    dbServicesGrid: TDBGrid;
    dxStatusBar1: TdxStatusBar;
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    RemovePermanently: TQuery;
    tICBFServicesSMilkTemperamentScore: TIntegerField;
    procedure CreateTables;
    procedure ServiceQuery;
    procedure CalvingQuery;
    procedure sbExitClick(Sender: TObject);
    procedure sbStartClick(Sender: TObject);
    procedure sbCreateClick(Sender: TObject);
    procedure MarkAsRegistered;
    procedure tICBFServicesCalcFields(DataSet: TDataSet);
    procedure tICBFCalvingCalcFields(DataSet: TDataSet);
    Function  StripPunctuation ( StrToStrip : String ) : String;
    procedure StripRight (var StrToStrip : String; Len : Integer);
    procedure StripLeft (var StrToStrip : String; Len : Integer);
    procedure PadRight(Var St : String; Len : Integer);
    procedure PadLeft(Var St : String; Len : Integer);
    procedure cbReRegisterClick(Sender: TObject);
    procedure o(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure sbEMailClick(Sender: TObject);
    procedure MailSenderAttachmentNotFound(Filename: String);
    procedure MailSenderConnectionFailed(Sender: TObject);
    procedure MailSenderFailure(Sender: TObject);
    procedure MailSenderSendStart(Sender: TObject);
    procedure MailSenderSuccess(Sender: TObject);
    procedure MailSenderInvalidHost(var Handled: Boolean);
    procedure MailSenderRecipientNotFound(Recipient: String);
    procedure tICBFCalvingNewRecord(DataSet: TDataSet);
    procedure sbCancelClick(Sender: TObject);
    procedure MailSenderAuthenticationFailed(var Handled: Boolean);
    procedure MailSenderConnect(Sender: TObject);
    procedure MailSenderDisconnect(Sender: TObject);
    procedure MailSenderHostResolved(Sender: TComponent);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbHerdIDChange(Sender: TObject);
    procedure DateFromChange(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure dbCalvingGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbServicesGridTitleClick(Column: TColumn);
    procedure dbCalvingGridTitleClick(Column: TColumn);
    procedure IncludeEventsalreadyMarkedasRegisteredtoICBF1Click(
      Sender: TObject);
    procedure DateToChange(Sender: TObject);
    procedure btnNoEventsOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReviewSucklerComplianceEvents1Click(Sender: TObject);
    procedure KRxSpeedButton1Click(Sender: TObject);
  private
    FCGridSort: TGridSort;
    FSGridSort: TGridSort;
    procedure SetCGridSort(const Value: TGridSort);
    procedure SetGridSort(const Value: TGridSort);
    procedure SetSGridSort(const Value: TGridSort);
    procedure OpenSetupHerd(const AStartClick : Boolean = True);
    function GetHasRecentBDPEvents: Boolean;
  private
    { Private declarations }
    MAPIConnect,
    EventsRegistered,
    Pedigree : Boolean;
    CalvFile,
    ServFile : String;
    HerdIdentifier : String;
    HerdIdentifierWithOutIE : String;
    FormActivated : Boolean;
    FICBFDamScoreQuery,
    FICBFStockBullScoreQuery : TQuery;
    FActiveFarmSync : Boolean;
    function StripLeadingZeros ( ItemToStrip : String ) : String;
    procedure CheckValidHealthCodes; // All Health codes MUST be ICBF Health Codes
    procedure CheckValidNatIDs;      // All National ID's, bare NONE Herds Animals require Valid NatID's
    procedure CheckNames;            // Ensure Herd Prefix is entered in program, when it is strip it from all animal names.
    procedure CheckForLeadingZeros;
    function StripNameOfPreFix(Name, PreFix : String; Pos : Integer) : String;
    procedure CheckHerdIdentifier;
    procedure CheckHerdNumber;
    function SendToICBF : Boolean;
    procedure DeleteNonICBFHealthEvents;
    procedure HighlightListEventsButton(AHighLight : Boolean);
    procedure RegisterEvent(AEventID : Integer; ADeletion : Boolean);
    procedure AddSexedSemenCodeToBullString;
    property CGridSort : TGridSort read FCGridSort write SetCGridSort;
    property SGridSort : TGridSort read FSGridSort write SetSGridSort;
    property HasRecentBDPEvents : Boolean read GetHasRecentBDPEvents;
  public
    { Public declarations }

  end;

procedure ShowTheForm;
function IsSucklerWelfareEvent(AHealthCode : string) : Boolean;

implementation

uses
   GenTypesConst, ShellAPI, Registry, uHerdSetUp, kRoutines,
   uICBFEventExportStatus, kDBRoutines, uAWReviewEvents, uConnect,
   uMailBoxHelper, uHerdLookup;

var
  fICBFEventExport: TfICBFEventExport;


const
   ICBFStartDate = '01/12/2001';
   cMsg_RemovePermanently = 'Do you want to permanently remove selected %s?';

{$R *.DFM}

procedure ShowTheForm;
begin
   try
      // Create the Form if it doesn't exist
      if (fICBFEventExport = nil) then
         Application.CreateForm(TfICBFEventExport,fICBFEventExport);
      with fICBFEventExport do
         begin
            ShowModal;
         end;
   finally
      FreeAndNil(fICBFEventExport);
   end;
end;

function IsSucklerWelfareEvent(AHealthCode : string) : Boolean;
begin
   AHealthCode := UPPERCASE(AHealthCode);
   Result := ((AHealthCode='DB') or (AHealthCode='ND') or (AHealthCode='ML') or (AHealthCode='WN') or
              (AHealthCode='CA') or (AHealthCode='NC') or
              (AHealthCode='Q1') or (AHealthCode='Q2') or (AHealthCode='Q3') or (AHealthCode='Q4') or (AHealthCode='Q5') or
              (AHealthCode='D1') or (AHealthCode='D2') or (AHealthCode='D3') or (AHealthCode='D4') or (AHealthCode='D5'));
end;

procedure TfICBFEventExport.sbStartClick(Sender: TObject);
var
   bHasEvents : Boolean;
begin
   if ( cbHerdID.Value = '' ) then
      begin
         MessageDlg('Please select a herd',mtWarning,[mbOK],0);
         Abort;
      end
   else
      begin
         CheckHerdIdentifier;
         CheckHerdNumber;
      end;

   Update;
   ShowStatus(stListingData,False);

   EventsRegistered := False;
   DateFromChange(Sender);
   HighlightListEventsButton(False);
   sbFile.Enabled := True;

   //   14/08/19 [V5.8 R9.8] /MK Bug Fix - Only do this check if the user hasn't ticked "Include Events Already Marked As Registered" - Captal Farms.
   if ( not(IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked) ) then
      begin
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT *');
               SQL.Add('FROM Events');
               SQL.Add('WHERE ICBFNotified = False');
               if ( FActiveFarmSync ) then
                  SQL.Add('AND EventType IN ('+IntToStr(CICBFCalfSurveyEvent)+', '+IntToStr(CICBFDamEvent)+', '+IntToStr(CICBFStockBullEvent)+')');
               try
                  Open;
                  if ( FActiveFarmSync ) then
                     TfmMessageScr.ShowTheForm(mtICBFAppWarning);
                  bHasEvents := ( RecordCount > 0 );
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Free;
            end;
       end;

   Update;
   //   23/11/16 [V5.6 R3.5] /MK Change - No point going through SQL's for Calvings and Services if there are no events to register - MK.
   if ( not(bHasEvents) ) then
      begin
         HideStatus;
         if ( not(FActiveFarmSync) ) then
            begin
               ShowStatus(stReviewPeriod,false);
               HideStatus;
            end;
         Update;
         Exit;
      end;
   HideStatus;
   Update;

   CreateTables;
   Update;

   if ( not(FActiveFarmSync) ) then
      begin
         CalvingQuery;
         Update;
      end;

   ServiceQuery;
   Update;

   HideStatus;
   if ( tICBFServices.RecordCount = 0 ) and ( tICBFCalving.RecordCount = 0 ) then
      ShowStatus(stReviewPeriod,false);
   HighlightListEventsButton(False);
   Update;
end;

procedure TfICBFEventExport.CreateTables;
begin
   try
      with tICBFCalving do
         begin
            Close;
            TableName := 'ICBFCalving';
            with FieldDefs do
               begin
                  Clear;
                  //Tag No Fields must be a length of 20 to pass check for new 372 tag.
                  Add('ID',ftAutoInc,0,False);
                  Add('CID',ftInteger,0,False);
                  Add('CEventDate',ftDate,0,False);
                  Add('CHerdID',ftString,15,False);
                  Add('CDamNatID',ftString,20,False);
                  Add('CDamSortNatID',ftString,20,False);
                  Add('CDamBreed',ftString,3,False);
                  Add('CalfNatID',ftString,20,False);
                  Add('CSortNatID',ftString,20,False);
                  Add('CalcSex',ftString,1,False);
                  Add('CSireID',ftString,20,False);
                  Add('CSireBreed',ftString,3,False);
                  Add('Mortality',ftString,6,False);
                  Add('CalfEase',ftString,6,False);
                  Add('CalfName',ftString,40,False);
                  Add('CAction',ftString,1,False);
                  Add('CEventID',ftInteger,0,False);
                  Add('Sex',ftString,10,False);
                  Add('CAIBull',ftBoolean,0,False);
                  Add('CBull',ftInteger,0,False);
                  Add('CBullNo',ftString,10,False);
                  Add('CBullID',ftString,20,False);
                  Add('CBullHerd',ftInteger,0,False);
               end;

            with IndexDefs do
               begin
                  Clear;
                  Add('', 'ID', [ixPrimary, ixUnique]);
                  Add('iaEventDate', 'CEventDate', [ixCaseInsensitive]);
                  Add('idEventDate', 'CEventDate', [ixDescending]);
                  Add('iaCalfNatID', 'CSortNatID', [ixCaseInsensitive]);
                  Add('idCalfNatID', 'CSortNatID', [ixDescending]);
                  Add('iaCDamSortNatID', 'CDamSortNatID', [ixCaseInsensitive]);
                  Add('idCDamSortNatID', 'CDamSortNatID', [ixDescending]);
               end;

            CreateTable;
            tICBFCalving.IndexName := 'idEventDate';
            CGridSort := gsDescending;

         end;
      with tICBFServices do
         begin
            Close;
            TableName := 'ICBFServices';
            with FieldDefs do
               begin
                  Clear;
                  //Tag No Fields must be a length of 20 to pass check for new 372 tag.
                  Add('ID',ftAutoInc,0,False);
                  Add('SEventDate',ftDate,0,False);
                  Add('SWithinHerdID',ftString,10,False);
                  Add('SortAnimalNo',ftString,10,False);
                  Add('SHerdID',ftString,15,False);
                  Add('SNationalID',ftString,20,False);
                  Add('SortNatID',ftString,20,False);
                  Add('NewIDEvent',ftString,1,False);
                  Add('SSireID',ftString,20,False);
                  Add('BullInOut',ftString,1,False);
                  Add('Health',ftString,6,False);
                  Add('Pregnancy',ftString,1,False);
                  Add('Weight',ftFloat,0,False);
                  Add('DryOff',ftString,1,False);
                  Add('Culled',ftString,6,False);
                  Add('SAction',ftString,1,False);
                  Add('SEventID',ftInteger,0,False);
                  Add('SEventType',ftInteger,0,False);
                  Add('SEventDesc',ftString,30,False);
                  Add('SHerdType',ftInteger,0,False);
                  Add('SAIBull',ftBoolean,0,False);
                  Add('SBullNo',ftString,20,False);
                  Add('SBullID',ftString,20,False);
                  Add('SBullHerd',ftInteger,0,False);
                  Add('PregStatus',ftBoolean,0,False);
                  Add('SMilkTemperamentScore',ftInteger,0,False);
               end;

            with IndexDefs do
               begin
                  Clear;
                  Add('', 'ID', [ixPrimary, ixUnique]);

                  Add('iaEventDate', 'SEventDate', [ixCaseInsensitive]);
                  Add('idEventDate', 'SEventDate', [ixDescending]);

                  Add('iaSortNatID', 'SortNatID', [ixCaseInsensitive]);
                  Add('idSortNatID', 'SortNatID', [ixDescending]);

                  Add('iaSortAnimalNo', 'SortAnimalNo', [ixCaseInsensitive]);
                  Add('idSortAnimalNo', 'SortAnimalNo', [ixDescending]);
               end;
            CreateTable;
            tICBFServices.IndexName := 'idEventDate';
            SGridSort := gsDescending
         end;
   finally
      qICBFServices.Close;
      qICBFCalving.Close;
      tICBFServices.Close;
      tICBFCalving.Close;
   end;
end;

procedure TfICBFEventExport.CalvingQuery;
const

   LiveCalf : Array [1..4] of String = ('WHERE ((A.ID = C.ID1) AND (C.CalfDead1=False))',
                                        'WHERE ((A.ID = C.ID2) AND (C.CalfDead2=False))',
                                        'WHERE ((A.ID = C.ID3) AND (C.CalfDead3=False))',
                                        'WHERE ((A.ID = C.ID4) AND (C.CalfDead4=False))');

   DeadCalf : Array [1..4] of String = ('LEFT JOIN GenLook GG ON (GG.ID = C.CalfMortality1) WHERE ((A.ID = C.ID1) AND (C.CalfDead1=True))',
                                        'LEFT JOIN GenLook GG ON (GG.ID = C.CalfMortality2) WHERE ((A.ID = C.ID2) AND (C.CalfDead2=True))',
                                        'LEFT JOIN GenLook GG ON (GG.ID = C.CalfMortality3) WHERE ((A.ID = C.ID3) AND (C.CalfDead3=True))',
                                        'LEFT JOIN GenLook GG ON (GG.ID = C.CalfMortality4) WHERE ((A.ID = C.ID4) AND (C.CalfDead4=True))');

var
   i : Integer;
begin
   tICBFCalving.Close;
   tICBFCalving.EmptyTable;
   dbCalvingGrid.Refresh;
   qICBFCalving.Close;
   tICBFCalving.DisableControls;

   // 25/04/01 SP Relink Dams/Calves Missing Calving Records from Calvings.db
   // 09/02/13 [V5.1 R4.1] /MK Additional Feature - Check to see if RelinkCalvesToDams needs to run.
   WinData.CheckForRelinkCalvesToDams(cCheckCalvesForOneMonth);

   with qICBFCalving do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM '+tICBFCalving.TableName);
         ExecSQL;
      end;

   for i := 1 to 4 do
      with qICBFCalving do
         begin
            SQL.Clear;
            SQL.Add('INSERT INTO '+tICBFCalving.TableName);
            SQL.Add('      (CID, CEventDate, CHerdID, CDamNatID, CDamSortNatID, CalfNatID, CSortNatID, ');    { SP 04/10/2002  Calf ID Added  }
            SQL.Add('       CalfEase, CalfName, CAction, CEventID,');
            SQL.Add('       Sex, CBull)');
            SQL.Add('SELECT A.ID, E.EventDate, '+'"'+HerdIdentifier+'"'+', D.NatIDNum, D.SortNatID, A.NatIDNum, A.SortNatID, ');
            SQL.Add('       G.LookUpCode, A.Name, E.ICBFAction, E.ID,');
            SQL.Add('       A.Sex, A.SireID ');
            SQL.Add('FROM Animals A, Calvings C');
            SQL.Add('LEFT JOIN Events   E ON (E.ID = C.EventID)');
            SQL.Add('LEFT JOIN Animals  D ON (D.ID = E.AnimalID)');
            SQL.Add('LEFT JOIN Owners   O ON (O.ID = D.HerdID)');
            SQL.Add('LEFT JOIN GenLook  G ON (G.ID = C.BirthType)');
            SQL.Add(LiveCalf[i]);
            SQL.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+')');
            SQL.Add('AND   (D.HerdID = ' + cbHerdID.Value+')' );
            if not IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked then
               SQL.Add('AND ((E.ICBFNotified = False) OR (E.ICBFNotified IS NULL))');
            if (DateFrom.Date <> 0) and (DateTo.Date <> 0) then
               SQL.Add('AND (E.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateFrom.Text))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')')
            else if (DateFrom.Date > 0) then
               SQL.Add('AND (E.EventDate >= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')')
            else if (DateTo.Date > 0) then
               SQL.Add('AND (E.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(ICBFStartDate))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')');

            Prepare;
            ExecSQL;
         end;

   for i := 1 to 4 do
      with qICBFCalving do
         begin
            SQL.Clear;
            SQL.Add('INSERT INTO '+tICBFCalving.TableName);
            SQL.Add('      (CID, CEventDate, CHerdID, CDamNatID, CDamSortNatID, CalfNatID, CSortNatID,'); { SP 04/10/2002  Calf ID Added  }
            SQL.Add('       Mortality, CalfEase, CalfName, CAction, CEventID,');
            SQL.Add('       Sex, CBull)');
            SQL.Add('SELECT A.ID, E.EventDate, '+'"'+HerdIdentifier+'"'+', D.NatIDNum, D.SortNatID, A.NatIDNum, A.SortNatID, ');
            SQL.Add('       GG.LookUpCode, G.LookUpCode, A.Name, E.ICBFAction, E.ID,');
            SQL.Add('       A.Sex, A.SireID ');
            SQL.Add('FROM Animals A, Calvings C');
            SQL.Add('LEFT JOIN Events   E ON (E.ID = C.EventID)');
            SQL.Add('LEFT JOIN Animals  D ON (D.ID = E.AnimalID)');
            SQL.Add('LEFT JOIN Owners   O ON (O.ID = D.HerdID)');
            SQL.Add('LEFT JOIN GenLook  G ON (G.ID = C.BirthType)');
            SQL.Add(DeadCalf[i]);
            SQL.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+')');
            SQL.Add('AND   (D.HerdID = ' + cbHerdID.Value+')' );
//            if (cbReRegister.Checked = FALSE) then
            if not IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked then
               SQL.Add('AND ((E.ICBFNotified = False) OR (E.ICBFNotified IS NULL))');
            if (DateFrom.Date <> 0) and (DateTo.Date <> 0) then
               SQL.Add('AND (E.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateFrom.Text))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')')
            else if (DateFrom.Date > 0) then
               SQL.Add('AND (E.EventDate >= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')')
            else if (DateTo.Date > 0) then
               //SQL.Add('AND (E.EventDate <= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')');
               SQL.Add('AND (E.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(ICBFStartDate))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')');

            Prepare;
            ExecSQL;
         end;

   with qICBFCalving do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO '+tICBFCalving.TableName);
         SQL.Add('      (CID, CEventDate, CHerdID, CDamNatID, CDamSortNatID, CalfNatID, CSortNatID,');
         SQL.Add('       Mortality, CalfEase, CalfName, CAction, CEventID,');
         SQL.Add('       Sex, CBull)');
         SQL.Add('SELECT A.ID, E.EventDate, '+'"'+HerdIdentifier+'"'+', D.NatIDNum, D.SortNatID, A.NatIDNum, A.SortNatID, '); { SP 04/10/2002  Calf ID Added  }
         SQL.Add('       GG.LookUpCode, G.LookUpCode, A.Name, E.ICBFAction, E.ID,');
         SQL.Add('       A.Sex, A.SireID ');
         SQL.Add('FROM Animals A, Calvings C');
         SQL.Add('LEFT JOIN Events   E ON (E.ID = C.EventID)');
         SQL.Add('LEFT JOIN Animals  D ON (D.ID = E.AnimalID)');
         SQL.Add('LEFT JOIN Owners   O ON (O.ID = D.HerdID)');
         SQL.Add('LEFT JOIN GenLook  G ON (G.ID = C.BirthType)');
         SQL.Add('LEFT JOIN GenLook GG ON (GG.ID = C.Mortality)');
         SQL.Add('WHERE (A.ID = C.ID1  ');
         SQL.Add('OR     A.ID = C.ID2  ');
         SQL.Add('OR     A.ID = C.ID3  ');
         SQL.Add('OR     A.ID = C.ID4) ');
         SQL.Add('AND  NOT(E.ID IN (Select CEventID From ICBFCalving)) ');
         SQL.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+')');
         SQL.Add('AND   (D.HerdID = ' + cbHerdID.Value+')' );
//         if (cbReRegister.Checked = FALSE) then
         if not IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked then
            SQL.Add('AND ((E.ICBFNotified = False) OR (E.ICBFNotified IS NULL))');
         if (DateFrom.Date <> 0) and (DateTo.Date <> 0) then
            SQL.Add('AND (EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateFrom.Text))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')')
         else if (DateFrom.Date > 0) then
            SQL.Add('AND (EventDate >= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')')
         else if (DateTo.Date > 0) then
            //SQL.Add('AND (EventDate <= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')');
               SQL.Add('AND (EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(ICBFStartDate))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')');
         Prepare;
         ExecSQL;
      end;

   // Old style calving without calves second query for calving events with no calves
   with qICBFCalving do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO ' + tICBFCalving.TableName);
         SQL.Add('      (CID, CEventDate, CHerdID, CDamNatID, CDamSortNatID,'); { SP 04/10/2002  Calf ID Added  }
         SQL.Add('       Mortality, CalfEase, CAction, CEventID)');
         SQL.Add('SELECT D.ID, E.EventDate, '+'"'+HerdIdentifier+'"'+', D.NatIDNum, D.SortNatID, ');
         SQL.Add('       GG.LookUpCode, G.LookUpCode, E.ICBFAction, E.ID');
         SQL.Add('FROM Calvings C');
         SQL.Add('LEFT JOIN Events   E ON (E.ID = C.EventID)    ');
         SQL.Add('LEFT JOIN Animals  D ON (D.ID = E.AnimalID)   ');
         SQL.Add('LEFT JOIN Owners   O ON (O.ID = D.HerdID)     ');
         SQL.Add('LEFT JOIN GenLook  G ON (G.ID = C.BirthType)  ');
         SQL.Add('LEFT JOIN GenLook GG ON (GG.ID = C.Mortality) ');
         SQL.Add('WHERE ((D.ID = 0) AND (C.CalfDead1 IS Null))  ');
         SQL.Add('OR    ((D.ID = 0) AND (C.CalfDead2 IS Null))  ');
         SQL.Add('OR    ((D.ID = 0) AND (C.CalfDead3 IS Null))  ');
         SQL.Add('OR    ((D.ID = 0) AND (C.CalfDead4 IS Null))  ');
         SQL.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+') ');
         SQL.Add('AND   (D.HerdID = ' + cbHerdID.Value+')           ');

//         if (cbReRegister.Checked = FALSE) then
         if not IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked then
            SQL.Add('AND ((E.ICBFNotified = False) OR (E.ICBFNotified IS NULL))');
         if (DateFrom.Date <> 0) and (DateTo.Date <> 0) then
            SQL.Add('AND (E.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateFrom.Text))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')')
         else if (DateFrom.Date > 0) then
            SQL.Add('AND (E.EventDate >= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')')
         else if (DateTo.Date > 0) then
            //SQL.Add('AND (E.EventDate <= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')');
            SQL.Add('AND (E.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(ICBFStartDate))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')');

         Prepare;
         ExecSQL;
      end;

   // re-query for Donor Dam / Sire details
   with tICBFCalving do
      begin
         open;
         if (tICBFCalving.RecordCount > 0) then
            begin
               First;
               while ( NOT Eof ) do
                  begin

    { SP 04/10/2002 } if WinData.LookUpDamSire.Locate('ID', FieldByName('CID').AsInteger, []) then
                        begin
                           if WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger > 0 then
                              begin

                                 if WinData.LookUpDamSire.Locate('ID', WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger, []) then
                                    begin
                                       Edit;
                                       FieldByName('CDamNatID').AsString := WinData.LookUpDamSire.FieldByName('NatIDNum').AsString;
                                       if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger,[]) then
                                          FieldByName('CDamBreed').AsString := WinData.Breeds.FieldByName('Code').AsString;
                                       Post;
                                    end;
                              end
                           else
                              begin
                                 if WinData.LookUpDamSire.Locate('NatIDNum',tICBFCalvingCDamNatID.AsString,[]) then
                                    if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger,[]) then
                                       begin
                                          Edit;
                                          FieldByName('CDamBreed').AsString := WinData.Breeds.FieldByName('Code').AsString;
                                          Post;
                                       end;
                              end;
    { SP 04/10/2002. }  end;

                     if (NOT tICBFCalvingCBull.IsNull) then
                        if (WinData.LookUpDamSire.Locate('ID',tICBFCalvingCBull.AsInteger,[])) then
                           begin
                              Edit;
                              FieldByName('CBullID').AsString    := WinData.LookUpDamSire.FieldByName('NatIDNum').AsString;
                              FieldByName('CSireID').AsString    := WinData.LookUpDamSire.FieldByName('NatIDNum').AsString;
                              FieldByName('CBullNo').AsString    := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                              FieldByName('CBullHerd').AsInteger := WinData.LookUpDamSire.FieldByName('HerdID').AsInteger;
                              post;
                           end;


                     if WinData.LookUpDamSire.Locate('ID',tICBFCalvingCBull.AsInteger,[]) then
                        if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger,[]) then
                           begin
                              Edit;
                              FieldByName('CSireBreed').AsString := WinData.Breeds.FieldByName('Code').AsString;
                              Post;
                           end;

                     Next;
                  end;
            end;
         Close;
         Open;
      end;

   // update for deleted items
   with qICBFCalving do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO '+tICBFCalving.TableName);
         SQL.Add('      (CEventDate, CAction, CEventID)');
         SQL.Add('SELECT I.EventDate, I.Action, I.EventID');
         SQL.Add('FROM ICBFDelete I ');
         SQL.Add('WHERE (I.EventType = '+IntToStr(cCalvingEvent)+')');
         SQL.Add('AND   (I.HerdID = ' + cbHerdID.Value+')' );
//         if (cbReRegister.Checked = FALSE) then
         if not IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked then
            SQL.Add('AND NOT (I.Notified = True)');
         if (DateFrom.Date <> 0) and (DateTo.Date <> 0) then
            SQL.Add('AND (I.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateFrom.Text))+''''+' And '+''''+ FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')')
         else if (DateFrom.Date > 0) then
            SQL.Add('AND (I.EventDate >= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')')
         else if (DateTo.Date > 0) then
//            SQL.Add('AND (I.EventDate <= '+''''+FormatDateTime(cUSDateStyle,DateTo.Date)+''''+')');
            SQL.Add('AND (I.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(ICBFStartDate))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')');
         Prepare;
         ExecSQL;
      end;
   tICBFCalving.EnableControls;

   tICBFCalving.Close;
   tICBFCalving.Open;

   dbCalvingGrid.Refresh;
end;

procedure TfICBFEventExport.ServiceQuery;
var
   VarArray : Variant;

   BK : TBookmark;
   i : Integer;

begin
   tICBFServices.Close;
   tICBFServices.EmptyTable;
   dbServicesGrid.Refresh;
   qICBFServices.Close;
   with qICBFServices do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM ' + tICBFServices.TableName);
         ExecSQL;
      end;

   tICBFServices.DisableControls;
   with qICBFServices do
      try
         SQL.Clear;
         SQL.Add('INSERT INTO ' + tICBFServices.TableName);
         SQL.Add('      (SEventDate, SWithinHerdID, SHerdID, SNationalID, SortNatID, SortAnimalNo, Health,');
         SQL.Add('       Weight, Culled, SAction, SEventID, SEventType, SEventDesc,');
         SQL.Add('       SHerdType, SBullNo, SBullID, SBullHerd, PregStatus, SMilkTemperamentScore)');
         SQL.Add('SELECT E.EventDate, A.AnimalNo, '+'"'+HerdIdentifier+'"'+', A.NatIDNum, A.SortNatID, A.SortAnimalNo, G.LookUpCode,');
         SQL.Add('       W.Weight, GG.LookUpCode, E.ICBFAction, E.ID, E.EventType, E.EventDesc,');
         SQL.Add('       O.TypeOfHerd, AA.AnimalNo, AA.NatIDNum, AA.HerdID, P.PregnancyStatus, MT.Score');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Animals         A ON (A.ID = E.AnimalID)');
         SQL.Add('LEFT JOIN Owners          O ON (O.ID = A.HerdID)');
         SQL.Add('LEFT JOIN Services        S ON (E.ID = S.EventID)');
         SQL.Add('LEFT JOIN Animals         AA ON (AA.ID = S.ServiceBull)');
         SQL.Add('LEFT JOIN Breeds          B ON (B.ID = AA.PrimaryBreed)');
         SQL.Add('LEFT JOIN Health          H ON (E.ID = H.EventID)');
         SQL.Add('LEFT JOIN GenLook         G ON (G.ID = H.HealthCode)');
         SQL.Add('LEFT JOIN PregnancyDiag   P ON (E.ID = P.EventID)');
         SQL.Add('LEFT JOIN Weights         W ON (E.ID = W.EventID)');
         SQL.Add('LEFT JOIN SalesDeaths     SD ON (E.ID = SD.EventID) ');
         SQL.Add('LEFT JOIN GenLook         GG ON (GG.ID = SD.Culled) ');
         SQL.Add('LEFT JOIN MilkTemperament MT ON (E.ID = MT.EventID) ');
         SQL.Add('WHERE E.EventType IN ('+IntToStr(CCastrateEvent)+','+IntToStr(cMealFeedingEvent)+','+IntToStr(CWeaningEvent)+',');
         SQL.Add('                      '+IntToStr(CDisbuddingEvent)+','+IntToStr(CCastrationNAEvent)+','+IntToStr(CDisbuddingNAEvent)+',');
         SQL.Add('                      '+IntToStr(CICBFCalfSurveyEvent)+','+IntToStr(CICBFDamEvent)+','+IntToStr(CICBFStockBullEvent)+')');
         if ( not(FActiveFarmSync) ) then
            begin
               SQL.Add('OR   E.EventType IN ('+IntToStr(cBullingEvent)+  ','+IntToStr(cServiceEvent)+  ','+ IntToStr(cPregDiagEvent)+',');
               SQL.Add('                     '+IntToStr(cDryOffEvent)+   ','+IntToStr(cWeightEvent)+   ','+ IntToStr(cHealthEvent)+',');
               SQL.Add('                     '+IntToStr(cSaleDeathEvent)+','+IntToStr(cStockBullEvent)+','+IntToStr(cNewIDEvent)+',');
               SQL.Add('                     '+IntToStr(CMilkTemperament)+')');
            end;

         SQL.Add('AND   (A.HerdID = ' + cbHerdID.Value+')' );

         if not IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked then
            SQL.Add('AND NOT (E.ICBFNotified = True)');
         if (DateFrom.Date <> 0) and (DateTo.Date <> 0) then
            SQL.Add('AND (EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(DateFrom.Text)) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text)) + '''' + ')')
         else if (DateFrom.Date > 0) then
            SQL.Add('AND (EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, DateTo.Date ) + '''' + ')')
         else if (DateTo.Date > 0) then
            SQL.Add('AND (EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(ICBFStartDate))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')');
         Prepare;
         ExecSQL;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;

   // Remove any non-icbf culling events.
   with qICBFServices do
      try
         SQL.Clear;
         SQL.Add('DELETE FROM ' + tICBFServices.TableName);
         SQL.Add('WHERE ( SEventType = '+IntToStr(cSaleDeathEvent) + ')');
         SQL.Add('AND (Culled IS NULL)');
         ExecSQL;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;

   // update for deleted items
   with qICBFServices do
      try
         SQL.Clear;
         SQL.Add('INSERT INTO ' + tICBFServices.TableName);
         SQL.Add('      (SEventDate, SHerdID, SAction, SEventID, SEventType)');
         SQL.Add('SELECT I.EventDate, '+'"'+HerdIdentifier+'"'+', I.Action, I.EventID, I.EventType');
         SQL.Add('FROM ICBFDelete I ');

         SQL.Add('WHERE I.EventType IN ('+IntToStr(CCastrateEvent)+','+IntToStr(cMealFeedingEvent)+','+IntToStr(CWeaningEvent)+',');
         SQL.Add('                      '+IntToStr(CDisbuddingEvent)+','+IntToStr(CCastrationNAEvent)+','+IntToStr(CDisbuddingNAEvent)+',');
         SQL.Add('                      '+IntToStr(CICBFCalfSurveyEvent)+','+IntToStr(CICBFDamEvent)+','+IntToStr(CICBFStockBullEvent)+')');
         if ( not(FActiveFarmSync) ) then
            begin
               SQL.Add('OR   I.EventType IN ('+IntToStr(cBullingEvent)+  ','+IntToStr(cServiceEvent)+  ','+ IntToStr(cPregDiagEvent)+',');
               SQL.Add('                     '+IntToStr(cDryOffEvent)+   ','+IntToStr(cWeightEvent)+   ','+ IntToStr(cHealthEvent)+',');
               SQL.Add('                     '+IntToStr(cSaleDeathEvent)+','+IntToStr(cStockBullEvent)+','+IntToStr(cNewIDEvent)+', ');
               SQL.Add('                     '+IntToStr(CMilkTemperament)+')');
            end;

         if not IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked then
            SQL.Add('AND NOT (I.Notified = True)');
         SQL.Add('AND   (I.HerdID = ' + cbHerdID.Value+')' );
         if (DateFrom.Date <> 0) and (DateTo.Date <> 0) then
            SQL.Add('AND (I.EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(DateFrom.Text)) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text)) + '''' + ')')
         else if (DateFrom.Date > 0) then
            SQL.Add('AND (I.EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, DateTo.Date ) + '''' + ')')
         else if (DateTo.Date > 0) then
            SQL.Add('AND (I.EventDate Between '+''''+FormatDateTime(cUSDateStyle,StrToDate(ICBFStartDate))+''''+' And '+''''+FormatDateTime(cUSDateStyle,StrToDate(DateTo.Text))+''''+')');
         Prepare;
         ExecSQL;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;

   DeleteNonICBFHealthEvents; // SP 27/01/2003
   tICBFServices.Open;
   try
      with tICBFServices do
         try
            WinData.WeaningScores.Active := True;
            WinData.mdICBFCalfSizeScores.Active := True;
            WinData.DamAndBullICBFScores.Active := True;
            First;
            while not eof do
               begin
                  if (tICBFServicesSEventType.AsInteger in [CDisbuddingEvent,CMealFeedingEvent,CWeaningEvent,CCastrateEvent,CDisbuddingNAEvent,
                                                            CCastrationNAEvent,CMilkTemperament,CICBFDamEvent,CICBFStockBullEvent,
                                                            CICBFCalfSurveyEvent]) then
                     begin
                        case tICBFServicesSEventType.AsInteger of
                           CDisbuddingEvent  : begin
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'DB';
                                                  // now set the SEventType value to Health Event .
                                                  // This will ensure Disbudding, MealFeeding ,Weaning, Castrate Events will output as Health Events as
                                                  // required by ICBF.
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;
                                               end;
                           CDisbuddingNAEvent: begin
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'ND';
                                                  // now set the SEventType value to Health Event .
                                                  // This will ensure Disbudding, MealFeeding ,Weaning, Castrate Events will output as Health Events as
                                                  // required by ICBF.
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;
                                               end;
                           CMealFeedingEvent : begin
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'ML';
                                                  // now set the SEventType value to Health Event .
                                                  // This will ensure Disbudding, MealFeeding ,Weaning, Castrate Events will output as Health Events as
                                                  // required by ICBF.
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;
                                               end;
                           CWeaningEvent     : begin
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'WN';
                                                  // now set the SEventType value to Health Event .
                                                  // This will ensure Disbudding, MealFeeding ,Weaning, Castrate Events will output as Health Events as
                                                  // required by ICBF.
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;
                                               end;
                           CCastrateEvent    : begin
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'CA';
                                                  // now set the SEventType value to Health Event .
                                                  // This will ensure Disbudding, MealFeeding ,Weaning, Castrate Events will output as Health Events as
                                                  // required by ICBF.
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;
                                               end;
                           CCastrationNAEvent: begin
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'NC';
                                                  // now set the SEventType value to Health Event .
                                                  // This will ensure Castrate NOT APPLICABLE Event will output as Health Events as
                                                  // required by ICBF.
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;
                                               end;
                           CMilkTemperament  : begin
                                                  Edit;
                                                  if tICBFServicesSMilkTemperamentScore.AsInteger > 0 then
                                                     tICBFServicesHealth.AsString := 'T'+ IntToStr(tICBFServicesSMilkTemperamentScore.AsInteger);
                                                  // now set the SEventType value to Health Event .
                                                  // This will ensure Castrate NOT APPLICABLE Event will output as Health Events as
                                                  // required by ICBF.
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;
                                               end;
                           CICBFDamEvent     : begin
                                                  // Add Health as ICBFCE as header event - this is not being sent to ICBF
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'ICBFCE';
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;

                                                  FICBFDamScoreQuery.Close;
                                                  FICBFDamScoreQuery.Params[0].AsInteger := tICBFServicesSEventID.AsInteger;
                                                  FICBFDamScoreQuery.Open;
                                                  if ( FICBFDamScoreQuery.FieldByName('MilkAbility').AsInteger > 0 ) or
                                                     ( FICBFDamScoreQuery.FieldByName('Docility').AsInteger > 0 ) then
                                                     begin
                                                        BK := tICBFServices.GetBookmark;
                                                        tICBFServices.OnNewRecord := nil;
                                                        try
                                                           CloneRecord(tICBFServices, VarArray);
                                                           try
                                                              if ( FICBFDamScoreQuery.FieldByName('MilkAbility').AsInteger > 0 ) then
                                                                 begin
                                                                     if WinData.DamAndBullICBFScores.Locate('ID', FICBFDamScoreQuery.FieldByName('MilkAbility').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'M' + IntTostr(WinData.DamAndBullICBFScoresScore.AsInteger);
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;

                                                              if ( FICBFDamScoreQuery.FieldByName('Docility').AsInteger > 0 ) then
                                                                 begin
                                                                    if WinData.DamAndBullICBFScores.Locate('ID', FICBFDamScoreQuery.FieldByName('Docility').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'C' + IntTostr(WinData.DamAndBullICBFScoresScore.AsInteger) ;
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;
                                                           except
                                                              on e : Exception do
                                                                 begin
                                                                    Raise Exception.Create('ICBF Dam events could not be created - contact Kingswood'+#13#10+#13#10+
                                                                                            E.Message);
                                                                 end;
                                                           end;
                                                        finally
                                                           tICBFServices.GotoBookmark(BK);
                                                           tICBFServices.FreeBookmark(BK);
                                                           tICBFServices.OnNewRecord := tICBFCalvingNewRecord;
                                                        end;
                                                     end;
                                               end;
                         CICBFStockBullEvent : begin
                                                  // Add Health as ICBFSB as header event - this is not being sent to ICBF
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'ICBFSB';
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;

                                                  FICBFStockBullScoreQuery.Close;
                                                  FICBFStockBullScoreQuery.Params[0].AsInteger := tICBFServicesSEventID.AsInteger;
                                                  FICBFStockBullScoreQuery.Open;
                                                  if ( FICBFStockBullScoreQuery.FieldByName('Functionality').AsInteger > 0 ) or
                                                     ( FICBFStockBullScoreQuery.FieldByName('Docility').AsInteger > 0 ) then
                                                     begin
                                                        BK := tICBFServices.GetBookmark;
                                                        tICBFServices.OnNewRecord := nil;
                                                        try
                                                           CloneRecord(tICBFServices, VarArray);
                                                           try
                                                              if ( FICBFStockBullScoreQuery.FieldByName('Functionality').AsInteger > 0 ) then
                                                                 begin
                                                                     if WinData.DamAndBullICBFScores.Locate('ID', FICBFStockBullScoreQuery.FieldByName('Functionality').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'F' + IntTostr(WinData.DamAndBullICBFScoresScore.AsInteger);
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;

                                                              if ( FICBFStockBullScoreQuery.FieldByName('Docility').AsInteger > 0 ) then
                                                                 begin
                                                                    if WinData.DamAndBullICBFScores.Locate('ID', FICBFStockBullScoreQuery.FieldByName('Docility').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'B' + IntTostr(WinData.DamAndBullICBFScoresScore.AsInteger) ;
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;
                                                           except
                                                              on e : Exception do
                                                                 begin
                                                                    Raise Exception.Create('ICBF Dam events could not be created - contact Kingswood'+#13#10+#13#10+
                                                                                            E.Message);
                                                                 end;
                                                           end;
                                                        finally
                                                           tICBFServices.GotoBookmark(BK);
                                                           tICBFServices.FreeBookmark(BK);
                                                           tICBFServices.OnNewRecord := tICBFCalvingNewRecord;
                                                        end;
                                                     end;
                                               end;
                         CICBFCalfSurveyEvent : begin
                                                  // Add Health as ICBFCS as header event - this is not being sent to ICBF
                                                  Edit;
                                                  tICBFServicesHealth.AsString := 'ICBFCS';
                                                  tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                  Post;

                                                  QueryICBFCalfSurveyDetails.Close;
                                                  QueryICBFCalfSurveyDetails.Params[0].AsInteger := tICBFServicesSEventID.AsInteger;
                                                  try
                                                     QueryICBFCalfSurveyDetails.Open;
                                                  except
                                                     on e : Exception do
                                                        ShowMessage(e.Message);
                                                  end;
                                                  if ( QueryICBFCalfSurveyDetails.FieldByName('Quality').AsInteger > 0 ) or
                                                     ( QueryICBFCalfSurveyDetails.FieldByName('Docility').AsInteger > 0 ) or
                                                     ( QueryICBFCalfSurveyDetails.FieldByName('CalfVitality').AsInteger > 0 ) or
                                                     ( QueryICBFCalfSurveyDetails.FieldByName('CalfSize').AsInteger > 0 ) or
                                                     ( QueryICBFCalfSurveyDetails.FieldByName('CalfScour').AsInteger > 0 ) or
                                                     ( QueryICBFCalfSurveyDetails.FieldByName('CalfPneumonia').AsInteger > 0 ) then
                                                     begin
                                                        BK := tICBFServices.GetBookmark;
                                                        tICBFServices.OnNewRecord := nil;
                                                        try
                                                           CloneRecord(tICBFServices, VarArray);
                                                           try
                                                              if ( QueryICBFCalfSurveyDetails.FieldByName('Docility').AsInteger > 0 ) then
                                                                 begin
                                                                     if WinData.WeaningScores.Locate('ID', QueryICBFCalfSurveyDetails.FieldByName('Docility').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'D' + IntTostr(WinData.WeaningScoresScore.AsInteger);
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;

                                                              if ( QueryICBFCalfSurveyDetails.FieldByName('Quality').AsInteger > 0 ) then
                                                                 begin
                                                                     if WinData.WeaningScores.Locate('ID', QueryICBFCalfSurveyDetails.FieldByName('Quality').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'Q' + IntTostr(WinData.WeaningScoresScore.AsInteger);
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;

                                                              if ( QueryICBFCalfSurveyDetails.FieldByName('CalfVitality').AsInteger > 0 ) then
                                                                 begin
                                                                     if WinData.WeaningScores.Locate('ID', QueryICBFCalfSurveyDetails.FieldByName('CalfVitality').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'V' + IntTostr(WinData.WeaningScoresScore.AsInteger);
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;

                                                              if ( QueryICBFCalfSurveyDetails.FieldByName('CalfSize').AsInteger > 0 ) then
                                                                 begin
                                                                     if WinData.WeaningScores.Locate('ID', QueryICBFCalfSurveyDetails.FieldByName('CalfSize').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'S' + WinData.mdICBFCalfSizeScoresScore.AsString;
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;

                                                              if ( QueryICBFCalfSurveyDetails.FieldByName('CalfScour').AsInteger > 0 ) then
                                                                 begin
                                                                     if WinData.WeaningScores.Locate('ID', QueryICBFCalfSurveyDetails.FieldByName('CalfScour').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'S' + IntTostr(WinData.WeaningScoresScore.AsInteger);
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;

                                                              if ( QueryICBFCalfSurveyDetails.FieldByName('CalfPneumonia').AsInteger > 0 ) then
                                                                 begin
                                                                     if WinData.WeaningScores.Locate('ID', QueryICBFCalfSurveyDetails.FieldByName('CalfPneumonia').AsInteger, []) then
                                                                       begin
                                                                          tICBFServices.Append;
                                                                          for i := 0 to (tICBFServices.FieldCount-1) do
                                                                             tICBFServices.Fields[i].Value := VarArray[i] ;
                                                                          tICBFServicesHealth.AsString := 'P' + IntTostr(WinData.WeaningScoresScore.AsInteger);
                                                                          tICBFServicesSEventType.AsInteger := cHealthEvent;
                                                                          tICBFServices.Post;
                                                                       end;
                                                                 end;

                                                           except
                                                              on e : Exception do
                                                                 begin
                                                                    Raise Exception.Create('ICBF Dam events could not be created - contact Kingswood'+#13#10+#13#10+
                                                                                            E.Message);
                                                                 end;
                                                           end;
                                                        finally
                                                           tICBFServices.GotoBookmark(BK);
                                                           tICBFServices.FreeBookmark(BK);
                                                           tICBFServices.OnNewRecord := tICBFCalvingNewRecord;
                                                        end;
                                                     end;
                                                end;
                        end;
                     end;
                  Next;
               end;

             //   17/05/13 [V5.1 R7.1] /MK Additional Feature - Only show events with Health as ICBFCE or ICBFSB
             //                                                 for ICBF Dam and Stock Bull Events that have been deleted.
             with TQuery.Create(nil) do
                try
                   DatabaseName := AliasName;
                   SQL.Clear;
                   SQL.Add('DELETE FROM '+tICBFServices.TableName+'');
                   SQL.Add('WHERE SNationalID IS NOT NULL');
                   SQL.Add('AND ( (Health = "ICBFCE") OR (Health = "ICBFSB") OR (Health = "ICBFCS") )');
                   try
                      ExecSQL;
                   except
                   end;
                finally
                   Close;
                   Free;
                end;

              AddSexedSemenCodeToBullString;

              tICBFServices.Close;
              tICBFServices.Open;

         finally
            WinData.WeaningScores.Active := False;
            WinData.mdICBFCalfSizeScores.Active := False;
            WinData.DamAndBullICBFScores.Active := False;
            First;
            EnableControls;
         end;
   except
      on e : exception do
         begin
            ShowMessage(e.Message);
         end;
   end;

   dbServicesGrid.Refresh;
end;

procedure TfICBFEventExport.sbCreateClick(Sender: TObject);
var
   eMailDir : String;
   CalvReg,
   ServReg : TextFile;
   ItemCount : Integer;
   DateToday,
   Buffer,
   TempStr,
   FieldToFile : String;
   i : Integer;

   function StripDecimalValueFromWeight (AWeight : String) : String;
   var
      DecimalID,
      i : Integer;
   begin
      Result := '   ';
      if ( AWeight = '' ) then Exit;
      for i := 0 to Length(AWeight) do
         begin
            if AWeight[i] = '.' then
               begin
                  DecimalID := i;
                  Break;
               end;
         end;
      Result := '';
      Result := Copy(AWeight,0,DecimalID-1);
   end;

begin
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         Exit;
      end;

   if (tICBFServices.IsEmpty) and (tICBFCalving.IsEmpty) then
      begin
         raise errormsg.createfmt('There are no records processed',[nil]);
         Exit;
      end;

   // Check files have not already been sent for todays date.
   HerdLookup.HerdOwnerData.HerdID := StrToInt(cbHerdID.Value);
   if HerdLookup.HerdOwnerData.ICBFExportDate > 0 then
      begin
         if HerdLookup.HerdOwnerData.ICBFExportDate >= Date then
            begin
               MessageDlg('Unable to send email to ICBF.'+cCRLFx2+
                   Format('ICBF export files have already been emailed today "%s".',[FormatDate(Date, dsIrish)])+cCRLF+
                          'You can only send one ICBF email per day.',mtWarning,[mbOK],0);
               Abort;
            end;
      end;

   CheckValidNatIDs; // Check all NatID's are the correct format!
   CheckValidHealthCodes; // Make sure all Healths are ICBF health codes!
   CheckForLeadingZeros; // Strip all leading zeros.

   CheckNames; // Strip Herd Prefix ie "REISK" from Names
   CalvFile := '';
   ServFile := '';
   if ( Application.MessageBox('Are all the details correct?','Check',mb_yesno) <> IdYes ) then Exit;
   // Set File Codes
   DateToday := FormatDateTime('ddmmyyyy',Now());

   // Calvings File
   if (tICBFCalving.FindFirst) then
      begin
         try
            // Create Directory for Files
            try
               eMailDir := '';
               SetCurrentDir(ExtractFilePath(ParamStr(0)));
               eMailDir := ExtractFilePath(ParamStr(0))+'ICBF Events files';
               mkDir(eMailDir);
            except
               // Directory already exists
            end;

            //   19/10/16 [V5.6 R2.3] /MK Change - Name of calving file changed to have B at start of file instead of C for 15 digit tag length files.

            // Create File for sending
            // eMailDir := (eMailDir + '\B' + HerdIdentifierWithOutIE + DateToday + '.ERS');
            //   26/10/16 [V5.6 R2.7] /MK Change - ICBF now want the Herd Number to be added to the name of the file instead of the Herd Identifier.
            eMailDir := (eMailDir + '\B' + cbHerdID.Text + DateToday + '.ERS');
            CalvFile := eMailDir;
            AssignFile(CalvReg,eMailDir);
            ReWrite(CalvReg);
            ItemCount := 0;
            // Add Calving Records to file
            if (tICBFCalving.RecordCount > 0) then
               begin
                  tICBFCalving.First;
                  while (NOT tICBFCalving.EOF) do
                     begin
                        ItemCount := 0;
                        Buffer := '';
                        while (ItemCount <= 13) do
                           begin
                              FieldToFile := '';
                              // EventDate
                              if ItemCount = 0 then
                                 begin
                                    FieldToFile := (FormatDateTime('ddmmyyyy',tICBFCalving.Fields[ItemCount].AsDateTime));
                                    PadRight(FieldToFile,8);
                                    StripRight(FieldToFile,8);
                                 end;
                              // HerdID
                              if (ItemCount = 1) then
                                 begin
                                    FieldToFile := tICBFCalving.Fields[ItemCount].AsString;
                                    PadRight(FieldToFile,10);
                                    StripRight(FieldToFile,10);
                                 end;
                              // Dam National ID
                              if (ItemCount = 2) then
                                 begin
                                    FieldToFile := StripPunctuation(tICBFCalving.Fields[ItemCount].AsString);
                                    PadRight(FieldToFile,15);
                                    StripRight(FieldToFile,15);
                                 end;
                              //Insert to Dam Breed
                              if (ItemCount = 3) then
                                 begin
                                    FieldToFile := StripPunctuation(tICBFCalving.Fields[ItemCount].AsString);
                                    PadRight(FieldToFile,3);
                                    StripRight(FieldToFile,3);
                                 end;
                              // Calf National ID
                              if (ItemCount = 4) then
                                 begin
                                    FieldToFile := StripPunctuation(tICBFCalving.Fields[ItemCount].AsString);
                                    PadLeft(FieldToFile,5);
                                    StripLeft(FieldToFile,5);
                                 end;
                              // Calf Sex
                              if (ItemCount = 5) then
                                 begin
                                    FieldToFile := tICBFCalving.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // Sire National ID
                              if (ItemCount = 6) then
                                 begin
                                    FieldToFile := StripPunctuation(tICBFCalving.Fields[ItemCount].AsString);
                                    PadRight(FieldToFile,15);
                                    StripRight(FieldToFile,15);
                                 end;
                              //Insert to Sire Breed
                              if (ItemCount = 7) then
                                 begin
                                    FieldToFile := StripPunctuation(tICBFCalving.Fields[ItemCount].AsString);
                                    PadRight(FieldToFile,3);
                                    StripRight(FieldToFile,3);
                                 end;
                              // Calf Mortality
                              if (ItemCount = 8) then
                                 begin
                                    FieldToFile := tICBFCalving.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // Calf Ease
                              if (ItemCount = 9) then
                                 begin
                                    FieldToFile := tICBFCalving.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // Calf Name
                              if (ItemCount = 10) then
                                 begin
                                 //   if Pedigree then
                                    FieldToFile := tICBFCalving.Fields[ItemCount].AsString;
                                   // else
                                     //  FieldToFile := '';
                                    PadRight(FieldToFile,30);   // was length 16 for some reason!
                                    StripRight(FieldToFile,30);
                                 end;
                              // Action required
                              if (ItemCount = 11) then
                                 begin
                                    FieldToFile := tICBFCalving.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // EventID
                              if (ItemCount = 12) then
                                 begin
                                    FieldToFile := tICBFCalving.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,5);
                                 end;
                              // Add to buffer
                              Buffer := Buffer + FieldToFile;
                              Inc(ItemCount);
                           end;
                        WriteLn(CalvReg,Buffer);
                        tICBFCalving.Next;
                     end;
               end;
            CloseFile(CalvReg);
         except
            // file already exists or Disk is Full
         end;
      end;

   //   17/05/13 [V5.1 R7.1] /MK Additional Feature - Don't send off Health as ICBFCE or ICBFCE for deleted
   //                                                 ICBF Dam or Stock Events as ICBF just need the event number on the file.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE '+tICBFServices.TableName+'');
         SQL.Add('SET Health = ""');
         SQL.Add('WHERE ( (Health = "ICBFCE") OR (Health = "ICBFCE") )');
         try
            ExecSQL;
         except
         end;
      finally
         Close;
         Free;
      end;

   // Services File
   if (tICBFServices.FindFirst) then
      begin
         try
            // Create Directory for Files
            try
               eMailDir := '';
               SetCurrentDir(ExtractFilePath(ParamStr(0)));
               eMailDir := ExtractFilePath(ParamStr(0))+'ICBF Events files';
               if ( not(DirectoryExists(eMailDir)) ) then
                  mkDir(eMailDir);
               //mkDir(eMailDir);
            except
               // Directory already exists
            end;

            //   19/10/16 [V5.6 R2.3] /MK Change - Name of services file changed to have E at start of file instead of C for 15 digit tag length files.

            // Create File for sending
            // eMailDir := (eMailDir + '\E' + HerdIdentifierWithOutIE + DateToday + '.ERS');
            //   26/10/16 [V5.6 R2.7] /MK Change - ICBF now want the Herd Number to be added to the name of the file instead of the Herd Identifier.
            eMailDir := (eMailDir + '\E' + cbHerdID.Text + DateToday + '.ERS');
            ServFile := eMailDir;
            AssignFile(ServReg,eMailDir);
            ReWrite(ServReg);
            ItemCount := 0;
            // Add Service records to file
            if (tICBFServices.RecordCount > 0) then
               begin
                  tICBFServices.First;
                  while (NOT tICBFServices.EOF) do
                     begin
                        // Strip leading zeros from AnimalNo
                        ItemCount := 0;
                        Buffer := '';
                        while (ItemCount <= 13) do
                           begin
                              FieldToFile := '';
                              // EventDate
                              if (ItemCount = 0) then
                                 begin
                                    FieldToFile := (FormatDateTime('ddmmyyyy',tICBFServices.Fields[ItemCount].AsDateTime));
                                    PadRight(FieldToFile,8);
                                    StripRight(FieldToFile,8);
                                 end;
                              // Animal No
                              if (ItemCount = 1) then
                                 begin
                                    FieldToFile := StripPunctuation(tICBFServices.Fields[ItemCount].AsString);
                                    PadRight(FieldToFile,5);
                                    StripRight(FieldToFile,5);
                                 end;
                              // HerdID
                              if (ItemCount = 2) then
                                 begin
                                    FieldToFile := StripPunctuation(tICBFServices.Fields[ItemCount].AsString);
                                    PadRight(FieldToFile,10);
                                    StripRight(FieldToFile,10);
                                 end;
                              // National ID
                              if (ItemCount = 3) then
                                 begin
                                    FieldToFile := StripPunctuation(tICBFServices.Fields[ItemCount].AsString);
                                    PadRight(FieldToFile,15);
                                    StripRight(FieldToFile,15);
                                 end;
                              // New Event ID
                              if (ItemCount = 4) then
                                 begin
                                    FieldToFile := tICBFServices.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // Sire ID
                              if (ItemCount = 5) then
                                 begin
                                    //   21/02/14 [V5.2 R8.4] /MK Change - Only strip off punction if SireNatID Number not SireCode as
                                    //                                     Sexed Semen e.g. -90F, added to SireCode.
                                    if ( tICBFServices.FieldByName('SBullID').AsString = '' ) then
                                       FieldToFile := tICBFServices.Fields[ItemCount].AsString
                                    else if ( tICBFServices.FieldByName('SBullID').AsString <> '' ) then
                                       FieldToFile := StripPunctuation(tICBFServices.Fields[ItemCount].AsString);
                                    PadRight(FieldToFile,15);
                                    StripRight(FieldToFile,15);
                                 end;
                              // Stock Bull in/out
                              if (ItemCount = 6) then
                                 begin
                                    FieldToFile := tICBFServices.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // Health
                              if (ItemCount = 7) then
                                 begin
                                    FieldToFile := tICBFServices.Fields[ItemCount].AsString;
                                    PadRight(FieldToFile,2);
                                    StripRight(FieldToFile,2);
                                 end;
                              // Heat/PD
                              if (ItemCount = 8) then
                                 begin
                                    FieldToFile := tICBFServices.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // Weight
                              if (ItemCount = 9) then
                                 begin
                                    //   01/10/14 [V5.3 R7.4] /MK Bug Fix - Strip out value after decimal in weight before sending - John McEnroe.
                                    //                                      Only add weight to file if length of weight is 3 after value after decimal is stripped.
                                    if ( Length(StripDecimalValueFromWeight(tICBFServices.Fields[ItemCount].AsString)) <= 3 ) then
                                       FieldToFile := StripDecimalValueFromWeight(tICBFServices.Fields[ItemCount].AsString);
                                    PadLeft(FieldToFile,3);
                                    StripLeft(FieldToFile,3);
                                 end;
                              // Drying Off
                              if (ItemCount = 10) then
                                 begin
                                    FieldToFile := tICBFServices.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // Culled
                              if (ItemCount = 11) then
                                 begin
                                    FieldToFile := tICBFServices.Fields[ItemCount].AsString;
                                    PadRight(FieldToFile,2);
                                    StripRight(FieldToFile,2);
                                 end;
                              // Action required
                              if (ItemCount = 12) then
                                 begin
                                    FieldToFile := tICBFServices.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,1);
                                    StripLeft(FieldToFile,1);
                                 end;
                              // EventID
                              if (ItemCount = 13) then
                                 begin
                                    FieldToFile := tICBFServices.Fields[ItemCount].AsString;
                                    PadLeft(FieldToFile,5);
                                 end;
                              // Add to buffer
                              Buffer := Buffer + FieldToFile;
                              Inc(ItemCount);
                           end;
                        // Write buffer to file
                        WriteLn(ServReg,Buffer);
                        tICBFServices.Next;
                     end;
               end;
            CloseFile(ServReg);
         except
            // directory already exists or Disk is Full
         end;
      end;
   if ( SendToICBF ) then
      MarkAsRegistered;
end;

Function TfICBFEventExport.StripPunctuation(StrToStrip: String ): String;
var
   i,
   LenOfStr : Integer;
   TempStr  : String;
begin
   TempStr := StrToStrip;
   LenOfStr := Length(TempStr);
   if (LenOfStr > 0) then
      for i := 1 to LenOfStr do
         if NOT (TempStr[i] IN ['A'..'Z','a'..'z','0'..'9']) then
            Delete(TempStr,i,1);
   Result := TempStr;
end;

procedure TfICBFEventExport.StripRight (var StrToStrip : String; Len : Integer);
begin
   while Length(StrToStrip) > Len Do
      Delete(StrToStrip,(Length(StrToStrip)),1);
end;

procedure TfICBFEventExport.StripLeft (var StrToStrip : String; Len : Integer);
begin
   while Length(StrToStrip) > Len Do
      Delete(StrToStrip,1,1);
end;

procedure TfICBFEventExport.PadRight(Var St : String; Len : Integer);
begin
   while Length(St) < Len Do
      St := St + ' ';
end;

procedure TfICBFEventExport.PadLeft(Var St : String; Len : Integer);
begin
   while Length(St) < Len Do
      St := ' ' + St;
end;

procedure TfICBFEventExport.MarkAsRegistered;
var
   iaCalfSurveyEventsToRegister : array of Integer;
   iCalfSurveyNotRegCount : Integer;
begin
   try
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('UPDATE Events');
            SQL.Add('SET ICBFNotified = TRUE');
            SQL.Add('WHERE ID IN (SELECT CEventID FROM ICBFCalving)');
            try
               ExecSQL;
            except
            end;

            SQL.Clear;
            SQL.Add('UPDATE ICBFDelete');
            SQL.Add('SET Notified=TRUE');
            SQL.Add('WHERE EventID IN (SELECT CEventID FROM ICBFCalving)');
            try
               ExecSQL;
            except
            end;

            //   29/06/17 [V5.6 R9.0] /MK Change - Mark all events except for Calf Survey events as registered.
            SQL.Clear;
            SQL.Add('UPDATE Events');
            SQL.Add('SET ICBFNotified=TRUE');
            SQL.Add('WHERE (EventType <> '+IntToStr(CICBFCalfSurveyEvent)+')');
            SQL.Add('AND   (ID IN (SELECT SEventID FROM ICBFServices))');
            try
               ExecSQL;
            except
            end;

            //   29/06/17 [V5.6 R9.0] /MK Change - For Calf Survey events only register the events that are completed i.e have all 6 parameters.
            SQL.Clear;
            SQL.Add('SELECT ID');
            SQL.Add('FROM Events');
            SQL.Add('WHERE EventType = '+IntToStr(CICBFCalfSurveyEvent)+'');
            SQL.Add('AND   (ID IN (SELECT SEventID FROM ICBFServices))');
            try
               Open;
               First;
               SetLength(iaCalfSurveyEventsToRegister,0);
               iCalfSurveyNotRegCount := 0;
               while ( not(Eof) ) do
                  begin
                     if ( not(WinData.IsIncompleteCalfSurveyEvent(Fields[0].AsInteger)) ) then
                        begin
                           SetLength(iaCalfSurveyEventsToRegister,Length(iaCalfSurveyEventsToRegister)+1);
                           iaCalfSurveyEventsToRegister[Length(iaCalfSurveyEventsToRegister)-1] := Fields[0].AsInteger;
                        end
                     else
                        Inc(iCalfSurveyNotRegCount);
                     Next;
                  end;
               Close;
               if ( Length(iaCalfSurveyEventsToRegister) > 0 ) then
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE Events');
                     SQL.Add('SET ICBFNotified = TRUE');
                     SQL.Add('WHERE ID IN '+IntArrayToSQLInString(iaCalfSurveyEventsToRegister)+'');
                     ExecSQL
                  end;
            except
            end;

            SQL.Clear;
            SQL.Add('UPDATE ICBFDelete');
            SQL.Add('SET Notified=TRUE');
            SQL.Add('WHERE EventID IN (SELECT SEventID FROM ICBFServices)');
            try
               ExecSQL;
            except
            end;

            EventsRegistered := True;
         end;

      try
         // update the defaults table
         if DateFrom.Date > 0 then
            begin
               WinData.Defaults.Open;
               try
                  WinData.Defaults.Edit;
                  WinData.Defaults.FieldByName('ICBFDefaultDate').AsDateTime := DateFrom.Date;
                  WinData.Defaults.Post;
               except
               end;
               WinData.Defaults.Close;
            end;
      except
      end;
   finally
      tICBFCalving.Close;
      tICBFCalving.EmptyTable;
      tICBFServices.Close;
      tICBFServices.EmptyTable;
      //   13/09/19 [V5.9 R0.3] /MK Change - If Incomplete ICBF Calf Survey events found then show message after file has been sent - Michael Cawe's.
      if ( iCalfSurveyNotRegCount > 0 ) then
         MessageDlg(Format('There are %d Incomplete Calf Survey Events sent to ICBF but not marked as sent.'+cCRLF+
                           'These events will continue to appear to be sent to ICBF until the'+cCRLF+
                           'Vitality, Size, Scour and Pneumonia records are also recorded.',[iCalfSurveyNotRegCount]),
                           mtInformation,[mbOK],0);
   end;
end;

procedure TfICBFEventExport.tICBFServicesCalcFields(DataSet: TDataSet);
begin
   if tICBFServicesSBullHerd.AsInteger = WinData.NoneHerdID then
      tICBFServicesSAIBull.AsBoolean := TRUE;

   if Uppercase(tICBFServicesPregStatus.AsString) = 'TRUE' then
      tICBFServicesPregnancy.AsString := '1';
   if Uppercase(tICBFServicesPregStatus.AsString) = 'FALSE' then
      tICBFServicesPregnancy.AsString := '2';

   if tICBFServicesSEventType.AsString = IntToStr(cDryOffEvent) then
      begin
         // Dairy Herd
         if tICBFServicesSHerdType.AsInteger = 24 then
            tICBFServicesDryOff.AsString := '1'
         // Suckler/Beef Herd
         else
            tICBFServicesDryOff.AsString := '2';
      end;

   if tICBFServicesSAIBull.AsBoolean then
      tICBFServicesSSireID.AsString := tICBFServicesSBullNo.AsString
   else
      tICBFServicesSSireID.AsString := tICBFServicesSBullID.AsString;

   if tICBFServicesSEventType.AsString = IntToStr(cBullingEvent) then
      tICBFServicesBullInOut.AsString := '1';

   if (tICBFServicesSEventType.AsInteger = cStockBullEvent) then
      begin
         if (tICBFServicesSEventDesc.AsString = 'Stock Bull In') then
            tICBFServicesBullInOut.AsString := '1'
         else
            tICBFServicesBullInOut.AsString := '2';
      end;

   if (tICBFServicesSEventType.AsInteger = cNewIDEvent) then
      begin// 1=allocate, 2=remove
         if Length(tICBFServicesSWithinHerdID.AsString) > 0 then
            tICBFServicesNewIDEvent.AsString := '1'
         else
            tICBFServicesNewIDEvent.AsString := '2';
      end;
end;

procedure TfICBFEventExport.tICBFCalvingCalcFields(DataSet: TDataSet);
begin
{
   if (Uppercase(tICBFCalvingSex.AsString)='FEMALE') then
      tICBFCalvingCalcSex.AsString := 'F';
   if (Uppercase(tICBFCalvingSex.AsString)='BULL') or (Uppercase(tICBFCalvingSex.AsString)='STEER') then
      tICBFCalvingCalcSex.AsString := 'M';
   if (tICBFCalvingCBullHerd.AsInteger = WinData.NoneHerdID) then
      tICBFCalvingCAIBull.AsBoolean := TRUE;
   if (tICBFCalvingCAIBull.AsBoolean) then
      tICBFCalvingCSireID.AsString := tICBFCalvingCBullNo.AsString
   else
      tICBFCalvingCSireID.AsString := tICBFCalvingCBullID.AsString;
}
   if (Uppercase(tICBFCalvingSex.AsString)='FEMALE') then
      tICBFCalvingCalcSex.AsString := 'F';
   if (Uppercase(tICBFCalvingSex.AsString)='BULL') or (Uppercase(tICBFCalvingSex.AsString)='STEER') then
      tICBFCalvingCalcSex.AsString := 'M';
   if (tICBFCalvingCBullHerd.AsInteger = WinData.NoneHerdID) then
      tICBFCalvingCAIBull.AsBoolean := TRUE;
   if (tICBFCalvingCAIBull.AsBoolean) then  // joanne 21/04/2004 (Remark SP requested by Kevin Downin)
      begin
         if tICBFCalvingCBullID.AsString <> '' then
            tICBFCalvingCSireID.AsString := tICBFCalvingCBullID.AsString
         else
            tICBFCalvingCSireID.AsString := tICBFCalvingCBullNo.AsString
      end
   else
      tICBFCalvingCSireID.AsString := tICBFCalvingCBullID.AsString;
end;

procedure TfICBFEventExport.sbExitClick(Sender: TObject);
begin
   if tICBFServices.Exists then
      begin
         tICBFServices.Close;
         tICBFServices.EmptyTable;
         tICBFCalving.Close;
         tICBFCalving.EmptyTable;
      end;
   Close;
end;

procedure TfICBFEventExport.cbReRegisterClick(Sender: TObject);
begin
{   if cbReRegister.Checked then
      begin
         DateFrom.Enabled := TRUE;
         DateTo.Enabled := TRUE;
         lDateFrom.Enabled := TRUE;
         lDateTo.Enabled := TRUE;
      end
   else
      begin
         DateFrom.Text := '  /  /  ';
         DateTo.Text := '  /  /  ';
         DateFrom.Enabled := FALSE;
         DateTo.Enabled := FALSE;
         lDateFrom.Enabled := FALSE;
         lDateTo.Enabled := FALSE;
      end;
}
end;

procedure TfICBFEventExport.o(Sender: TObject);
begin
   IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked := False;
//   cbReRegister.Checked := False;
end;

procedure TfICBFEventExport.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('ICBFreg.htm');
end;

procedure TfICBFEventExport.tICBFCalvingNewRecord(DataSet: TDataSet);
begin
   DataSet.Cancel;
end;

procedure TfICBFEventExport.sbEMailClick(Sender: TObject);
begin
   //
end;

procedure TfICBFEventExport.sbCancelClick(Sender: TObject);
begin
   // Cancel MailSender
   if MailSender.Connected then
      MailSender.Disconnect;
   pEMail.Hide;
   sbExit.Enabled  := True;
   sbStart.Enabled := True;
   sbFile.Enabled  := True;
//   sbEMail.Enabled := True;
   sbHelp.Enabled  := True;
end;

procedure TfICBFEventExport.MailSenderAttachmentNotFound(Filename: String);
begin
   ErrorMemo.Lines.Add('Attachment Not Found.');
   EMailMemo.Lines.Add('Operation cancelled.');
end;

procedure TfICBFEventExport.MailSenderConnectionFailed(Sender: TObject);
begin
   ErrorMemo.Lines.Add('A connection to the internet could not be established.');
   EMailMemo.Lines.Add('Operation cancelled.');
end;

procedure TfICBFEventExport.MailSenderFailure(Sender: TObject);
begin
   ErrorMemo.Lines.Add('Message sending failed.');
   EMailMemo.Lines.Add('Operation cancelled. Please Try Again.');
   EMailMemo.Lines.Add('If this persists, send the following files through your e-mail program');
   EMailMemo.Lines.Add(CalvFile);
   EMailMemo.Lines.Add(ServFile);
   EMailMemo.Lines.Add('To: animalevents@icbf.com');
end;

procedure TfICBFEventExport.MailSenderSendStart(Sender: TObject);
begin
   EMailMemo.Lines.Add('Sending message ...');
end;

procedure TfICBFEventExport.MailSenderSuccess(Sender: TObject);
begin
   EMailMemo.Lines.Add('Message Sent.');
end;

procedure TfICBFEventExport.MailSenderInvalidHost(var Handled: Boolean);
begin
   ErrorMemo.Lines.Add('Invalid Host Server.');
   EMailMemo.Lines.Add('Operation cancelled. Check E-mail settings.');
end;

procedure TfICBFEventExport.MailSenderRecipientNotFound(Recipient: String);
begin
   ErrorMemo.Lines.Add('Destination Address not found.');
   EMailMemo.Lines.Add('Operation cancelled. If this problem persists, contact Kingswood.');
end;

procedure TfICBFEventExport.MailSenderAuthenticationFailed(var Handled: Boolean);
begin
   ErrorMemo.Lines.Add('Invalid User ID.');
   EMailMemo.Lines.Add('Operation cancelled. Check E-mail settings');
end;

procedure TfICBFEventExport.MailSenderConnect(Sender: TObject);
begin
   EMailMemo.Lines.Add('Connection established.');
end;

procedure TfICBFEventExport.MailSenderDisconnect(Sender: TObject);
begin
   //
end;

procedure TfICBFEventExport.MailSenderHostResolved(Sender: TComponent);
begin
   EMailMemo.Lines.Add('Host Server found.');
end;

procedure TfICBFEventExport.FormCreate(Sender: TObject);
begin
   FormActivated := False;
   DateFrom.Date := IncMonth(Date,-1);
   DateTo.Date := Date;

   FICBFDamScoreQuery := TQuery.Create(nil);
   FICBFDamScoreQuery.DatabaseName := AliasName;
   FICBFDamScoreQuery.SQL.Clear;
   FICBFDamScoreQuery.SQL.Add('SELECT MilkAbility, Docility');
   FICBFDamScoreQuery.SQL.Add('FROM ICBFDamEvent');
   FICBFDamScoreQuery.SQL.Add('WHERE EventID = :EventID');

   FICBFStockBullScoreQuery := TQuery.Create(nil);
   FICBFStockBullScoreQuery.DatabaseName := AliasName;
   FICBFStockBullScoreQuery.SQL.Clear;
   FICBFStockBullScoreQuery.SQL.Add('SELECT Functionality, Docility');
   FICBFStockBullScoreQuery.SQL.Add('FROM ICBFStockBullEvent');
   FICBFStockBullScoreQuery.SQL.Add('WHERE EventID = :EventID');
end;

procedure TfICBFEventExport.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
//   DateFrom.Date := IncMonth(Date,-1);
//   DateTo.Date := Date;
//   cbReRegister.Checked := False;
//   if not FormActivated then
  //    begin

   FActiveFarmSync := ( TfmFarmSyncSettings.SyncConfigured(DataDir, WinData.GetSyncingHerd(), stHerd) );

   IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked := False;
   Screen.ActiveForm.Refresh; // don not remove this.
   sbStartClick(Sender);

   //  FormActivated := True;
   //  end;
   //   06/11/14 [V5.3 R8.1] /MK Change - Show user urgent warning if events have been reset to be resent - don't auto resend - GL request.
   if ( WinData.FICBFEventsToBeResent ) then
      begin
         MessageDlg('URGENT : Click on the Email File(s) button immediatley'+cCRLF+
                    'to send off your BDP and other Animal events to ICBF.',mtInformation,[mbOK],0);
         WinData.FICBFEventsToBeResent := False;
      end
   else if ( not(HasRecentBDPEvents) ) then
      if ( not(FActiveFarmSync) ) then
         TfmMessageScr.ShowTheForm(mtICBFNoAppWarning);
end;

procedure TfICBFEventExport.FormShow(Sender: TObject);
begin
   if ICBFMail.MapiAvail then
      MAPIConnect := True
   else
      MAPIConnect := False;
   // Set the from date to last used fromdate
   try
      WinData.Defaults.Open;
      if WinData.Defaults.FieldDefs.IndexOf('ICBFDefaultDate') > 0 then
         begin
            {if WinData.Defaults.FieldByName('ICBFDefaultDate').AsDateTime > 0 then
               DateFrom.Date := WinData.Defaults.FieldByName('ICBFDefaultDate').AsDateTime
            else
               DateFrom.Date := IncMonth(Date,-1);
            }
            DateFrom.Date := EncodeDate(2008,01,01);
         end;
      WinData.Defaults.Close;
   except
      DateFrom.Date := IncMonth(Date,-1);
   end;
   EventsRegistered := False;
   Pedigree := Def.Definition.dUsePedigree;
   cbHerdID.LookupSource := WinData.OwnerSource;
   cbHerdID.Value := IntToStr(WinData.UserDefaultHerdID);
   cbHerdID.Enabled := False;
   DateTo.Date := Date;
end;

procedure TfICBFEventExport.cbHerdIDChange(Sender: TObject);
begin
   sbStartClick(Sender);
end;

procedure TfICBFEventExport.DateFromChange(Sender: TObject);
begin
   if DateFrom.Date > 0 then
      begin
         if DateFrom.Date < StrToDate(ICBFStartDate) then
            begin
               DateFrom.Date := IncMonth(DateTo.Date, -1);
               raise ErrorMsg.CreateFmt('All events must be on or after 01/12/2001, date re-setting',[nil]);
            end;
      end;
   HighlightListEventsButton(True);
end;

procedure TfICBFEventExport.CheckValidHealthCodes;
var
   i : Integer;
   EAbort : Boolean;
begin

   with tICBFServices do
      begin
         First;
         While NOT Eof do
            begin
               if (tICBFServicesSEventType.AsInteger = cHealthEvent) then
                  begin
                     if tICBFServicesSAction.AsString <> 'D' then
                        begin
                           for i := Low(HealthCodeArray) to High(HealthCodeArray) do
                              begin
                                 if ((tICBFServicesHealth.AsString) <> HealthCodeArray[i]) then
                                    EAbort := True
                                 else
                                    begin
                                       EAbort := False;
                                       Break;
                                    end;
                              end;
                           if EAbort then
                              begin
                                 MessageDlg('Some Health records contain invalid ICBF Health Codes \ '+tICBFServicesHealth.AsString+'.'+#13+
                                            'Please replace with valid codes',mtWarning,[mbOK],0);
                                 dbServicesGrid.SetFocus; // Select record on grid!
                                 SysUtils.Abort;
                              end;
                        end;
                  end
               else if (tICBFServicesSEventType.AsInteger = cSaleDeathEvent) then
                  begin
                     if tICBFServicesSAction.AsString <> 'D' then
                        begin
                           for i := Low(CullingCodeArray) to High(CullingCodeArray) do
                              begin
                                 if ((tICBFServicesCulled.AsString) <> CullingCodeArray[i]) then
                                    EAbort := True
                                 else
                                    begin
                                       EAbort := False;
                                       Break;
                                    end;
                              end;

                           if EAbort then
                              begin
                                 MessageDlg('Some Culling records contain invalid ICBF Health Codes\ '+tICBFServicesCulled.AsString+'.'+#13+
                                            'Please replace with valid codes',mtWarning,[mbOK],0);
                                 dbServicesGrid.SetFocus; // Select record on grid!
                                 SysUtils.Abort;
                              end;
                        end;
                  end;
               Next;
            end;
      end;
end;

procedure TfICBFEventExport.RxSpeedButton2Click(Sender: TObject);
var
   i : Integer;
   IDArray : TIntegerArray;
   bPermanentlyRemove : Boolean;
begin
   // 02/02/2009 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Additional Feature - Allow user to permanently remove calves from registration

   bPermanentlyRemove := (MessageDlg(Format(cMsg_RemovePermanently,['calf/calves']),mtConfirmation,[mbYes,mbNo],0) = idYes); 

   SetLength(IDArray, 0);
   if dbCalvingGrid.SelectedRows.Count > 0 then    // register all selected records.
      begin
         for i := 0 to dbCalvingGrid.SelectedRows.Count -1 do
            begin
               if dbCalvingGrid.DataSource.DataSet.BookmarkValid(pointer(dbCalvingGrid.SelectedRows.Items[i])) then
                  begin
                     dbCalvingGrid.DataSource.DataSet.GotoBookmark(pointer(dbCalvingGrid.SelectedRows.Items[i]));
                     if bPermanentlyRemove then
                        RegisterEvent(dsICBFCalving.DataSet.FieldByName('CEventID').AsInteger,dsICBFCalving.DataSet.FieldByName('CAction').AsString='D');

                     // 02/02/2009 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Additional Feature - Allow user to permanently remove calves from registration
                     SetLength(IDArray, Length(IDArray)+1);
                     IDArray[Length(IDArray)-1] := dsICBFCalving.DataSet.FieldByName('ID').AsInteger;
                  end;
            end;
      end;

   if ( Length(IDArray) > 0 ) then
      begin
         with TQuery.Create(nil) do
              try
                 DatabaseName := AliasName;
                 SQL.Add('DELETE FROM "' + TTable(dsICBFCalving.DataSet).TableName + '"');
                 SQL.Add('WHERE ID IN ' + IntArrayToSQLInString(IDArray) );
                 ExecSQL;
              finally
                 Free;
              end;
          dsICBFCalving.DataSet.Refresh;
      end;
end;

procedure TfICBFEventExport.RxSpeedButton1Click(Sender: TObject);
var
   i : Integer;
   IDArray : TIntegerArray;
   bPermanentlyRemove : Boolean;
begin
   // 02/02/2009 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Additional Feature - Allow user to permanently remove Events from registration
   bPermanentlyRemove := (MessageDlg(Format(cMsg_RemovePermanently,['event(s)']),mtConfirmation,[mbYes,mbNo],0) = idYes);

   SetLength(IDArray, 0);
   if dbServicesGrid.SelectedRows.Count > 0 then    // register all selected records.
      begin
         for i := 0 to dbServicesGrid.SelectedRows.Count -1 do
            begin
               if dbServicesGrid.DataSource.DataSet.BookmarkValid(pointer(dbServicesGrid.SelectedRows.Items[i])) then
                  begin
                     dbServicesGrid.DataSource.DataSet.GotoBookmark(pointer(dbServicesGrid.SelectedRows.Items[i]));
                     if bPermanentlyRemove then
                        RegisterEvent(dsICBFServices.DataSet.FieldByName('SEventID').AsInteger, dsICBFServices.DataSet.FieldByName('SAction').AsString='D');

                     // 02/02/2009 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Additional Feature - Allow user to permanently remove calves from registration
                     SetLength(IDArray, Length(IDArray)+1);
                     IDArray[Length(IDArray)-1] := dsICBFServices.DataSet.FieldByName('ID').AsInteger;
                  end;
            end;
      end;

   if ( Length(IDArray) > 0 ) then
      begin
         with TQuery.Create(nil) do
              try
                 DatabaseName := AliasName;
                 SQL.Add('DELETE FROM "' + TTable(dsICBFServices.DataSet).TableName + '"');
                 SQL.Add('WHERE ID IN ' + IntArrayToSQLInString(IDArray) );
                 ExecSQL;
              finally
                 Free;
              end;
          dsICBFServices.DataSet.Refresh;
      end;
end;

procedure TfICBFEventExport.CheckValidNatIDs;
begin
   tICBFCalving.First;
   while ( not(tICBFCalving.Eof) ) do
      begin
         // Only validate if animal is alive!
         if ( Length(tICBFCalvingMortality.AsString) <= 0 ) then
            if ( not(WhatStyleNatID(tICBFCalvingCalfNatID.AsString, False) in [StyleEID,Style1999]) ) then
               begin
                  MessageDlg(''+'"'+(tICBFCalvingCalfNatID.AsString)+'"'+' Invalid National ID found, please re-enter in Setup Animal screen',mtInformation,[mbOK],0);
                  dbCalvingGrid.SetFocus; // Select record on grid!
                  SysUtils.Abort;
               end;
         tICBFCalving.Next;
      end;
end;

Function TfICBFEventExport.StripLeadingZeros ( ItemToStrip : String ) : String;
Var
   i : Integer;
   TestStr : String;
begin
   TestStr := ItemToStrip;
   if Length(TestStr) > 0 then
      while TestStr[1] = '0' do
         begin
            if Length(TestStr) > 1 then
               Delete ( TestStr, 1, 1 )
            else
                Break;  // Exit the while loop
         end;
   ReSult := TestStr;
end;

procedure TfICBFEventExport.CheckNames;
var
   HerdPrefix : String;
   Len : Integer;
   Ps,
   n : Integer;
   Name : String;
   s : String;
   i : Integer;
   Result : Boolean;
   Sender : TObject;
begin
   if WinData.OwnerFile.Locate('ID',cbHerdID.Value,[]) then
      begin
{         if WinData.OwnerFileHerdPreFix.IsNull then
            begin
               MessageDlg('Unable to locate Herd Prefix, please enter in Herd Setup',mtInformation,[mbOK],0);
               uHerdSetUp.ShowTheForm(FALSE);
               sbStartClick(Sender);
               Abort;
            end;
}
         with tICBFCalving do
            begin
               HerdPrefix := WinData.OwnerFileHerdPreFix.AsString;
               Len := 0;
               PS := 0;
               First;
               While NOT(tICBFCalving.Eof) do
                  begin
                     if Pos(HerdPrefix, tICBFCalvingCalfName.AsString) > 0 then
                        begin
                           n := Length(HerdPreFix);
                           s := StripNameOFPreFix(tICBFCalvingCalfName.AsString, HerdPrefix, n);
                           if s <> tICBFCalvingCalfName.AsString then
                              begin
                                 tICBFCalving.Edit;
                                 tICBFCalvingCalfName.AsString := s;
                                 tICBFCalving.Post;
                              end;
                           end;
                     Next;
                  end;
            end;
      end;
end;

function TfICBFEventExport.StripNameOfPreFix(Name, PreFix: String;
  Pos: Integer): String;
begin
   if Copy(tICBFCalvingCalfName.AsString, 1, Pos) = PreFix then
      begin
         System.Delete(Name,1,Pos);
         RESULT := TrimLeft(Name);
      end
   else
      RESULT := Name;
end;

procedure TfICBFEventExport.CheckForLeadingZeros;
begin
   with tICBFServices do
      begin
         First;
         While NOT tICBFServices.Eof do
            begin
               Edit;
               tICBFServices.FieldByName('SWithinHerdID').AsString := StripLeadingZeros(tICBFServices.FieldByName('SWithinHerdID').AsString);
               Post;
               Next;
            end;
      end
end;

procedure TfICBFEventExport.CheckHerdIdentifier;
var
   Sender : TObject;

   function NonNumericIdendifier : Boolean;
   var
      i : Integer;
   begin
      Result := False;
      for i := 0 to Length(WinData.OwnerFileHerdIdentifier.AsString)-1 do
         begin
            Result := ( not(WinData.OwnerFileHerdIdentifier.AsString[i] in ['0'..'9']) );
            if ( not(Result) ) then Exit;
         end;
   end;

begin
   if ( WinData.OwnerFile.Locate('ID',cbHerdID.Value,[]) ) then
      begin
         if ( WinData.OwnerFileHerdIdentifier.IsNull ) then
            begin
               MessageDlg('Unable to locate Herd Designator, please enter in Herd Setup'+#13+
                          'Herd Designator must be a 7 digit number without spaces or separators',mtInformation,[mbOK],0);
               OpenSetupHerd;
            end
         else if ( Length(WinData.OwnerFileHerdIdentifier.AsString) <> 7 ) then
            begin
               MessageDlg('Your Herd Designator '+WinData.OwnerFileHerdIdentifier.AsString+' is not valid.'+#13+
                          'Please use a 7 digit number without spaces or separators',mtError,[mbOK],0);
               OpenSetupHerd;
            end
         else if ( NonNumericIdendifier ) then
            begin
               MessageDlg('Your Herd Designator '+WinData.OwnerFileHerdIdentifier.AsString+' contains non numeric characters. '+#13+
                          'Please use a 7 digit number without spaces or separators',mtError,[mbOK],0);
               OpenSetupHerd(False);
            end
         else if ( GetTagPreFix(WinData.OwnerFileId.AsInteger) = cTagPreFix_372 ) then
            begin
               if ( not(StrToInt(Copy(WinData.OwnerFileHerdIdentifier.AsString,1,2)) in [21..23] )) then
                  MessageDlg('Herd Identifier was classified as an EID tag but contains an invalid Bovine Range.',mtError,[mbOK],0);
               OpenSetupHerd;
            end;
         HerdIdentifierWithOutIE := WinData.OwnerFileHerdIdentifier.AsString;
         HerdIdentifier := Trim(GetTagPreFix(WinData.OwnerFileId.AsInteger))+WinData.OwnerFileHerdIdentifier.AsString;
      end;
end;

procedure TfICBFEventExport.dbCalvingGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F2 then
      if MAPIConnect then
         begin
            ShowMessage('SMTP Connect');
            MAPIConnect := False;
         end
      else
         begin
            ShowMessage('MAPI Connect');
            MAPIConnect := True;
         end;
end;

function TfICBFEventExport.SendToICBF : Boolean;
var
   SMTPHost,
   SMTPID,
   Account,
   UserName,
   UserAddress : String;
   Reg : TRegistry;
   MailAdd : String;
   bConnected : Boolean;
   EmailClient : string;
   FileNames : string;
begin
   Result := False;
   try
      sbStart.Enabled := False;
      sbFile.Enabled  := False;

      EmailClient := WinData.DefaultEmailClient;
      if EmailClient = cEmailClient_MS then
         begin
            if MAPIConnect then
               begin
                  try
                     MailAdd := 'animalevents@icbf.com';
                     // Now to create and send email file.

                     // Clear the message
                     ICBFMail.Clear;
                     // Use default Profile
                     ICBFMail.UseDefProfile := True;
                     // Logon to MAPI
                     ICBFMail.Logon;
                     // Check Email Add.
                     ICBFMail.CheckRecipient(MailAdd);

                     // Clear Recipient stringlist
                     ICBFMail.Recipient.Clear;
                     // Add email add
                     ICBFMail.Recipient.Add(MailAdd);

                     // Clear Attachments
                     ICBFMail.Attachment.Clear;
                     // If the calvfile exists, attach the file.
                     if FileExists(CalvFile) then
                        ICBFMail.Attachment.Add(CalvFile);
                     // If the servefile exists, attach the file.
                     if FileExists(ServFile) then
                        ICBFMail.Attachment.Add(ServFile);

                     // Add the subject
                     ICBFMail.Subject       := 'Animal Events Registration';
                     // Add the Body
                     ICBFMail.Text          := 'Please find enclosed Calving and Services Events files.';

                     // Send mail, wait for response back.
                    if (ICBFMail.SendMail = EMAIL_OK) then
                       begin
                          Result := True;
                          MessageDlg('ICBF Reg File has been sent to your default mail program. '+#13+
                                     'You should receive an email message from ICBF acknowledging '+#13+
                                     'that your Registration File(s) have been received.'+#13+
                                     'Please check your Outbox if you have not received this email receipt and '+#13+
                                     're-send the latest ICBF Reg file(s), if necessary.',mtInformation,[mbOK],0);

                          HerdLookup.HerdOwnerData.HerdID := StrToInt(cbHerdID.Value);
                          HerdLookup.HerdOwnerData.ICBFExportDate := Date;
                       end
                    else
                       MessageDlg('Message failed to send!',mtWarning,[mbOK],0);
                     // Log off MAPI
                     ICBFMail.Logoff;
                     // Clear the message
                     ICBFMail.Clear;
                  except
                     Raise
                  end;
               end
            else
               begin
                 // show status panel & disable buttons
                  EMailMemo.Lines.Clear;
                  EMailMemo.Lines.Add('Please Wait ....');
                  EMailMemo.Lines.Add('');
                  ErrorMemo.Lines.Clear;
                  pEMail.Show;

                  // check registry for mail account details
                  try
                     Reg := TRegistry.Create;
                     Reg.RootKey := HKEY_USERS;
                     // get Default Mail Account First
                     if (Reg.OpenKey('.DEFAULT\Software\Microsoft\Internet Account Manager',False)) then
                        Account := Reg.ReadString('Default Mail Account');
                     Reg.CloseKey;
                     // get Account Details
                     if (Reg.OpenKey(('.DEFAULT\Software\Microsoft\Internet Account Manager\Accounts\'+Account+''),False)) then
                        begin
                           SMTPHost    := Reg.ReadString('SMTP Server');
                           SMTPID      := Reg.ReadString('POP3 User Name');
                           UserName    := Reg.ReadString('SMTP Display Name');
                           UserAddress := Reg.ReadString('SMTP EMail Address');
                        end;
                     Reg.CloseKey;
                  except
                     ErrorMemo.Lines.Add('A Default E-Mail program is not installed or cannot be found.');
                     EMailMemo.Lines.Add('Operation cancelled.');
                     abort;
                  end;
                  // Open e-mail and attach files
                  with MailSender do
                     try
                        Host   := SMTPHost;
                        UserID := SMTPID;
                        EMailMemo.Lines.Add('Connecting ....');
                        if (NOT Connected) then
                           try
                              Connect;
                           except
                              ErrorMemo.Lines.Add('A connection to the internet could not be established.');
                              EMailMemo.Lines.Add('Please check your Modem and telephone line and try again.');
                              EMailMemo.Lines.Add('If this persists, send the following files through your e-mail program');
                              EMailMemo.Lines.Add(CalvFile);
                              EMailMemo.Lines.Add(ServFile);
                              EMailMemo.Lines.Add('To: animalevents@icbf.com');
                              abort;
                           end;
                        if Connected then
                           begin
                              ClearParams := True;
                              SubType     := mtPlain;
                              with PostMessage do
                                 begin
                                    FromAddress := UserAddress;
                                    FromName    := UserName;
                                    ReplyTo     := UserAddress;
                                    Body.Text   := 'Please find enclosed Calving and Services Events files.';
                                    if (CalvFile <> '') and (ServFile <> '') then
                                       Attachments.Text := CalvFile+#13+ServFile
                                    else if (CalvFile = '') then
                                       Attachments.Text := ServFile
                                    else
                                       Attachments.Text := CalvFile;
                                    Subject     := 'Animal Events Registration';
                                    Date        := FormatDateTime('dd/mm/yyyy',Now());
                                 end;
                              SendMail;
                              Result := True;
                              HerdLookup.HerdOwnerData.HerdID := StrToInt(cbHerdID.Value);
                              HerdLookup.HerdOwnerData.ICBFExportDate := Date;
                           end;
                     finally
                        EMailMemo.Lines.Add('Disconnecting ...');
                        if connected then
                           Disconnect;
                     end;
                     pEMail.Hide;
               end;
         end
      else if EmailClient = cEmailClient_GMail then
         begin
            Update;
            bConnected := IsNetConnected;
            if not bConnected then
              ShowConnectForm(bConnected);

            if not bConnected then
               begin
                  MessageDlg(cINTERNET_CONNECTION_NOT_ESTABLISHED,mtError,[mbOK],0);
                  Exit;
               end;

            SetCurrentDir(ApplicationPath);
            if not FileExists( IncludeTrailingBackslash(ApplicationPath)+ KingswoodMailBoxDLL) then
               begin
                  MessageDlg(cKingswoodMailBoxDLLNotFound,mtError,[mbOk],0);
                  Exit;
               end;

            DLLHandle := LoadLibrary(KingswoodMailBoxDLL);
            try
               if (DLLHandle = 0) then
                  begin
                     MessageDlg(cKingswoodMailBoxDLLUnableToLoad,mtError,[mbOk],0);
                     Exit;
                  end;

              @SendMail := GetProcAddress(DLLHandle, 'SendMail');
              if @SendMail = nil then
                 begin
                    MessageDlg(Format(cKingswoodMailBoxDLLCallToFunctionFailed,['SendMail']),mtError,[mbOk],0);
                    Exit;
                 end;

              if FileExists(CalvFile) then
                 FileNames := ExtractFileName( CalvFile ) + ';';
              if FileExists(ServFile) then
                 FileNames := FileNames+ExtractFileName( ServFile );

              SendMailResult := SendMail(cICBFEmail, '', PChar(FileNames),False);
              case SendMailResult of
                -1 : MessageDlg(cEMailSendError_1,mtError,[mbOK],0);
                 0 : begin
                        Result := True;
                        HerdLookup.HerdOwnerData.HerdID := StrToInt(cbHerdID.Value);
                        HerdLookup.HerdOwnerData.ICBFExportDate := Date;
                        MessageDlg('ICBF Registration email successfully sent.',mtInformation,[mbOK],0);
                     end;
                 1 : MessageDlg(cEMailSendError_2,mtError,[mbOK],0);
                 2,4 : MessageDlg(cEMailSendError_3,mtError,[mbOK],0);
                 3 : MessageDlg(cEMailSendError_4,mtError,[mbOK],0);
              end;
            finally
               FreeLibrary(DLLHandle);
            end;
         end;

   finally
      sbStart.Enabled := True;

      tICBFCalving.DisableControls;
      tICBFServices.DisableControls;

      tICBFCalving.Close;
      tICBFServices.Close;

      //   19/09/13 [V5.2 R1.4] /MK Bug Fix - Don't empty table here as needed for MarkAsRegistered.
      //tICBFCalving.EmptyTable;
      //tICBFServices.EmptyTable;

      tICBFCalving.EnableControls;
      tICBFServices.EnableControls;
   end;
end;

procedure TfICBFEventExport.DeleteNonICBFHealthEvents;
var
   SQLInStr : String;
begin
   // update for deleted items
   with qICBFServices do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM '+tICBFServices.TableName+'');
         SQL.Add('WHERE SEventType = '+ IntToStr(cHealthEvent)+' ');
         SQLInStr := kRoutines.StrArrayToSQLInString(HealthCodeArray);
         SQL.Add('AND NOT(Health in '+SQLInStr+')');//("DS", "GS", "KE", "MF", "MA", "CA", "CO", "RP", "LM", "PI", "RD", "SC"))');
         Prepare;
         ExecSQL;
      end;
end;

procedure TfICBFEventExport.dbServicesGridTitleClick(Column: TColumn);
{  TGridSort = (gsAscending, gsDescending); }
begin
   if not tICBFServices.Active then Exit;
   try
      if SGridSort = gsAscending then
         SGridSort := gsDescending
      else
         SGridSort := gsAscending;

      case Column.Index of
         1 : begin
                if SGridSort = gsAscending then
                   tICBFServices.IndexName := 'iaEventDate'
                else
                   tICBFServices.IndexName := 'idEventDate';
             end;
         2 : begin
                if SGridSort = gsAscending then
                   tICBFServices.IndexName := 'iaSortAnimalNo'
                else
                   tICBFServices.IndexName := 'idSortAnimalNo'
             end;
         4 : begin
                if SGridSort = gsAscending then
                   tICBFServices.IndexName := 'iaSortNatID'
                else
                   tICBFServices.IndexName := 'idSortNatID';
             end;
      end;
   except
   end;
end;

procedure TfICBFEventExport.SetGridSort(const Value: TGridSort);
begin

end;

procedure TfICBFEventExport.dbCalvingGridTitleClick(Column: TColumn);
begin
   if not tICBFCalving.Active then Exit;
   try
      if CGridSort = gsAscending then
         CGridSort := gsDescending
      else
         CGridSort := gsAscending;

      case Column.Index of
         0 : begin
                if CGridSort = gsAscending then
                   tICBFCalving.IndexName := 'iaEventDate'
                else
                   tICBFCalving.IndexName := 'idEventDate';
             end;
         2 : begin
                if CGridSort = gsAscending then
                   tICBFCalving.IndexName := 'iaCDamSortNatID'
                else
                   tICBFCalving.IndexName := 'idCDamSortNatID';
             end;
         4 : begin
                if CGridSort = gsAscending then
                   tICBFCalving.IndexName := 'iaCalfNatID'
                else
                   tICBFCalving.IndexName := 'idCalfNatID'
             end;
      end;
   except
   end;
end;

procedure TfICBFEventExport.SetCGridSort(const Value: TGridSort);
begin
  FCGridSort := Value;
end;

procedure TfICBFEventExport.SetSGridSort(const Value: TGridSort);
begin
  FSGridSort := Value;
end;

procedure TfICBFEventExport.IncludeEventsalreadyMarkedasRegisteredtoICBF1Click(
  Sender: TObject);
begin
   IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked := not IncludeEventsalreadyMarkedasRegisteredtoICBF1.Checked;
   HighlightListEventsButton(True);
end;

procedure TfICBFEventExport.HighlightListEventsButton(AHighLight: Boolean);
begin
   if ( not(Assigned(OnActivate)) ) then
      begin
         if AHighLight then
            sbStart.Font.Color :=clRed
         else
            sbStart.Font.Color :=clWindowText;
      end;
end;

procedure TfICBFEventExport.DateToChange(Sender: TObject);
begin
   HighlightListEventsButton(True);
end;

procedure TfICBFEventExport.btnNoEventsOKClick(Sender: TObject);
begin
//   pRegistrationInfo.Hide;
end;

procedure TfICBFEventExport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // HideStatus;
  FICBFDamScoreQuery.Close;
  FICBFDamScoreQuery.Free;

  FICBFStockBullScoreQuery.Close;
  FICBFStockBullScoreQuery.Free;
end;

procedure TfICBFEventExport.ReviewSucklerComplianceEvents1Click(
  Sender: TObject);
begin
//    TfmSucklerEventsReview.Show;
end;

procedure TfICBFEventExport.KRxSpeedButton1Click(Sender: TObject);
begin
   TfmAWReviewEvents.Show(cbHerdID.KeyValue);
end;

procedure TfICBFEventExport.RegisterEvent(AEventID: Integer; ADeletion : Boolean);
begin
   if (AEventID>0) then
      begin
         if not ADeletion then
            begin
               RemovePermanently.Close;
               RemovePermanently.SQL.Text := 'UPDATE Events SET ICBFNotified=True WHERE ID=:EID';
               RemovePermanently.Params[0].AsInteger := AEventID;
               RemovePermanently.ExecSQL;
            end
         else
            begin
               RemovePermanently.Close;
               RemovePermanently.SQL.Text := 'UPDATE ICBFDelete SET Notified=True WHERE EventID=:EID';
               RemovePermanently.Params[0].AsInteger := AEventID;
               RemovePermanently.ExecSQL;
            end;
      end;
end;

procedure TfICBFEventExport.AddSexedSemenCodeToBullString;
var
   qSexedSemenCodes : TQuery;
begin
   qSexedSemenCodes := TQuery.Create(nil);
   with qSexedSemenCodes do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT S.EventID, G.LookupCode SexedSemenCode');
         SQL.Add('FROM Services S');
         SQL.Add('LEFT JOIN GenLook G On (G.ID = S.SexedSemen)');
         SQL.Add('WHERE SexedSemen > 0');
         SQL.Add('AND EventID IN (SELECT SEventID FROM ICBFServices)');
         Open;
         while ( not(Eof) ) do
            begin
               if ( FieldByName('SexedSemenCode').AsString <> '' ) then
                  begin
                     if ( tICBFServices.Locate('SEventID',FieldByName('EventID').AsInteger,[]) ) then
                        try
                           tICBFServices.Edit;
                           tICBFServices.FieldByName('SBullNo').AsString := tICBFServices.FieldByName('SBullNo').AsString+FieldByName('SexedSemenCode').AsString;
                           tICBFServices.Post;
                        except
                           on e : Exception do
                              ShowMessage(e.Message);
                        end;
                  end;
               Next;
            end;
         Close;
      finally
         Free;
      end;
end;

procedure TfICBFEventExport.OpenSetupHerd(const AStartClick : Boolean = True);
begin
   if WinData.OwnerFile.Locate('ID',cbHerdID.Value,[]) then
      begin
         uHerdSetUp.ShowTheForm(FALSE);
         cbHerdID.LookupSource.DataSet.Close;
         cbHerdID.LookupSource.DataSet.Open;
      end;
   //   06/02/18 [V5.7 R8.0] /MK Bug Fix - Removed if AStartClick then sbStart.Click as causing loop - SP request.
end;

procedure TfICBFEventExport.CheckHerdNumber;
begin
   if ( Def.Definition.dSerialNo = 10001 ) then Exit;
   if ( not(HerdLookup.IsValidHerdNumber(Ireland,cbHerdID.Text)) ) then
      begin
         //   06/02/18 [V5.7 R8.0] /MK Bug Fix - Need to pass in Herd Number because if user enters an animal into None Herd then None Herd is set as HerdOwnerData.HerdID - Enda Ryan.
         MessageDlg(cInvalid_Irish_HerdNumber,mtInformation,[mbOK],0);
         OpenSetupHerd(False);
      end;
end;

function TfICBFEventExport.GetHasRecentBDPEvents: Boolean;
var
   qHasBDPEvents : TQuery;
begin
   Result := False;
   qHasBDPEvents := TQuery.Create(nil);
   with qHasBDPEvents do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Events');
         SQL.Add('WHERE EventDate >= :InLastYear');
         SQL.Add('AND   ICBFNotified = False');
         SQL.Add('AND   EventType IN ('+IntToStr(CCastrateEvent)+','+IntToStr(cMealFeedingEvent)+','+IntToStr(CWeaningEvent)+', ');
         SQL.Add('                    '+IntToStr(CDisbuddingEvent)+','+IntToStr(CCastrationNAEvent)+','+IntToStr(CDisbuddingNAEvent)+', ');
         SQL.Add('                    '+IntToStr(CMilkTemperament)+','+IntToStr(CICBFDamEvent)+','+IntToStr(CICBFStockBullEvent)+') ');
         Params[0].AsDateTime := IncYear(Date,-1);
         try
            Open;
            Result := ( RecordCount > 0 );
         except
            on e : Exception do
               begin
                  Result := False;
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError(e.Message);
               end;
         end;
      finally
         Free;
      end;
end;

end.

