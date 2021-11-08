{

 29/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user view pedigree serial nos when PedButton clicked.

 02/02/2009 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Program Change - Clarify Labels on Calf Details panel, previously National ID = Nat. Id. No.,
                                                                     Calf Number = Farm tag etc..

 03/02/2009 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Program Change - TempCalving.Sex.Required was "True",
                                                     changed to "False" to facilitate enhanced error handling of invalid sex value

 17/02/2009 [Dev V3.9 R6.2] /SP Program Change - Allow user to enter condition score event after saving calving event.
                                               - Allow user to enter health event after saving calving event.
                                               - lBirthType.Caption := 'ICBF Survey' if herd is registered in republic, was previously calving survey.

 17/02/2009 [Dev V3.9 R6.5] /SP Program Change - lFBJumboNo caption changed from "On-farm Calf No". to "F.B./Jumbo". "On-farm Calf No" was cause of serious
                                               confusion for customers

 11/03/2009 [Dev V3.9 R6.6] /SP Program Change - In allowing the Deletion of calving event, check for NewID Events, if they exist shift them down a lactation.
                                               - Set ProjCalvingDate.Caption := 'N/A' (not applicable) if there is no projected calving date.

 14/04/09 [V3.9 R6.7] /MK Additional Feature - Show the ICBF Survey as ICBF Normal when New Calving Event created.

 27/07/10 [V4.0 R4.1] /MK Additional Feature - When user ticks Dead Calf radio buttons for Full Term and Abortion appear.
                                             - If Full Term selected the user must enter a valid tag.
                                             - If Abortion selected the program creates a tag number from Tag Number of Dam plus Todays Month and Year.
                                             - Do not register calf if Dead Calf is ticked and National ID is an Invalid Tag.
                                             - Allow ICBF to be registered but where remove Tag Number and Sex from File.

 09/09/10 [V4.0 R4.7] /MK Change - Removed CalfDeadOnChange Generate of NITag As WinData.TempCalfCalfDeadChange is already doing this.
                                   Only ToggleCalfLiveDeadControls and RBFullTerm Changes.

 15/09/10 [V4.0 R4.7] /MK Additional Feature - EnableMultipleCalves Changed To Show bNewCalf, bCancelCalf and bRemoveCalf only if the
                                               CalfAddingOrAmending is Add. If Amending then don't show.
                                             - Label1 and HyperLinkEdit Visble Is False Where CalfAddingOrAmending Is Amending and
                                               DefCountry Is England.
                                             - HyperLinkEdit.Text Is Defaulted To "Manual Input" If HerdLookup.HerdOwnerData.InputNatIDStyle = 0.
                                             - bSet.Visible If Country Is <> Ireland And CalfAddingOrAmending Is Add And cmboNatIDNum Is Not Visible.
                                             - dbcbComplianceCert.Enabled If Country Is Ireland And CalfAddingOrAmending Is Add.

 27/11/10 [V4.0 R5.9] /MK Change - Changed Full Term Caption To Calf Tagged and Abortion Caption To Foetus.

 06/07/11 [V4.1 R2.2] /MK Bug Fix - If EventStatus = Amending Then ETCalving Event Is Based On AnimalLactNo - 1 Else CurrentLactNo.

 30/09/11 [V5.0 R1.0] /MK Change - bSet Is Visible Where Country Is Not Ireland Or NIreland.

 10/10/11 [V5.0 R1.3] /MK Change - Added Pedigree Tick Box If Pedigree Module.

 18/10/11 [V5.0 R1.5] /MK Bug Fix - TempCalvingCalfDeadChange - WinData.RollBackTag Set So For Irish Herds Dead Calf Checked Does Not Roll Back Only On Foetus.

 22/11/11 [V5.0 R2.2] /MK Change - CheckAnimal - Changed This Error To A Yes/No Warning.

 08/12/11 [V5.0 R2.6] /MK Change - If Amending Then dsBulls.DataSet := qHistBullsUsed. If Adding Then dsBulls.DataSet := qBullUsed.

 13/12/11 [V5.0 R2.8] /MK Additional Feature - Changed Position Of Where dsBulls.DataSet Was Assigned.

 30/01/12 [V5.0 R3.6] /MK Bug Fix - Do Not Set rbFullTerm Or rbAbortion On CalfDeadChange If PDAEvent Calving.

 09/02/12 [V5.0 R3.7] /MK Additional Feature - btnCalvingSurvey - New Button To Query Calving Survey Events To Allow An Edit.

 22/03/12 [V5.0 R4.5] /MK Change - sbDeleteCalving - New SubProcedure To Delete Weighing Event If Weighing Event Date Is DateOfBirth Date.

 31/05/12 [V5.0 R6.0] /MK Bug Fix - cmboNatIDNum.Top Set To Same As CalfNatID.

 11/12/12 [V5.1 R3.5] /MK Change - CheckAnimal - Removed this DryOff message as message already in MenuForm and uPhoneLinkEventsReview.

 09/04/13 [V5.1 R6.2] /MK Additional Feature - New label added after Calf Sex to show Projected Calf Sex if any in last PD record.

 22/05/13 [V5.1 R6.6] /MK Change - Only show compliance cert labels and checkbox if AIM does not exist.

 05/02/14 [V5.2 R6.8] /MK Change - Removed "cannot be deleted" from the warning when saving the calvings.

 16/02/14 [V5.2 R8.3] /MK Change - If editing calving and calving date changed then, on save, give warning that program will now
                                   update the date of birth of the calf/calves.

 19/02/15 [V5.4 R2.6] /MK Bug Fix - CalfDeadPropertiesChange - Only move to rbFullTerm if Inserting record - rbFullTermClick is also inserting a record.

 14/09/17 [V5.7 R3.0] /MK Change - Changed WinData.AddToGroup to WinData.GroupManager.AddToGroup for more accurate calculation of FeedAllocation date based on purchase/birth date. 
}

unit uCalvings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids,
  ComCtrls, RXLookup, ToolEdit, RXDBCtrl, uListAnimals, RXCtrls, ToolWin,
  RXSpin, ActnList, cxControls, dxStatusBar, GenTypesConst, DBCtrlsEh,
  DBLookupEh, kDBRoutines, cxButtons, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxDBEdit, cxHyperLinkEdit, KRxSpeedButton,
  Groups, cxRadioGroup, uCalvingSurvey, uCalvingSurveyForm, uAIMClient;

type
  TAddOrAmend = (Add, Amending, AddAtSetUp);
  TfCalving = class(TkwEventForm)
    dsTemp: TDataSource;
    CalfGrid: TDBGrid;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    CalfDOB: TDBDateEdit;
    lComment: TLabel;
    dbComment: TDBEdit;
    lBirthType: TLabel;
    BirthType: TRxDBLookupCombo;
    lNo: TLabel;
    SearchForAnimal: TComboEdit;
    BullUsed: TRxDBLookupCombo;
    Label15: TLabel;
    qBullUsed: TQuery;
    dsBulls: TDataSource;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbSaveCalvings: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    Label12: TLabel;
    rxcMortality: TRxDBLookupCombo;
    lMortality: TLabel;
    Label16: TLabel;
    seDeadCalves: TRxSpinEdit;
    qLastCalf: TQuery;
    qLastCalfMAXOFEventDate: TDateField;
    dbcGenDam: TRxDBLookupCombo;
    lGenDam: TLabel;
    dsGenDam: TDataSource;
    qGenDam: TQuery;
    lDonorDam: TLabel;
    GenQuery: TQuery;
    ProjCalvingDate: TLabel;
    Label13: TLabel;
    lDamname: TLabel;
    qBreedEvents: TQuery;
    sbDeleteCalving: TRxSpeedButton;
    DelCalvingSep: TToolButton;
    ActionList1: TActionList;
    Action1: TAction;
    lAssignGrp: TLabel;
    qGroups: TQuery;
    dsGroups: TDataSource;
    dblkcomboDamGroupListing: TRxDBLookupCombo;
    GroupBox2: TGroupBox;
    lFBJumboNo: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    sbPedName: TRxSpeedButton;
    Label22: TLabel;
    CalfNo: TDBEdit;
    CalfNatId: TDBEdit;
    CalfName: TDBEdit;
    CalfSex: TDBComboBox;
    CalfColour: TRxDBLookupCombo;
    bNewCalf: TBitBtn;
    bRemoveCalf: TBitBtn;
    bSet: TBitBtn;
    bCancelCalf: TBitBtn;
    pLiveCalfDetails: TPanel;
    Label14: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Breeding: TDBCheckBox;
    BirthWeight: TDBEdit;
    dblkcmboCalfGroupListing: TRxDBLookupCombo;
    pDeadCalfDetails: TPanel;
    lCalfMortality: TLabel;
    CalfMortality: TRxDBLookupCombo;
    Label18: TLabel;
    Customer: TRxDBLookupCombo;
    GetDisposalPlace: TQuery;
    StatusBar: TdxStatusBar;
    CalfBreed: TDBLookupComboboxEh;
    Label1: TLabel;
    teSireName: TcxTextEdit;
    teDamName: TcxTextEdit;
    cmboNatIDNum: TcxDBLookupComboBox;
    CalfDead: TcxDBCheckBox;
    HyperLinkEdit: TcxHyperLinkEdit;
    pMovementCert: TPanel;
    Label4: TLabel;
    dbcbComplianceCert: TDBCheckBox;
    Label11: TLabel;
    lComplianceCertInstruction: TLabel;
    rbFullTerm: TcxRadioButton;
    rbAbortion: TcxRadioButton;
    sbCalvingOptions: TRxSpeedButton;
    ToolButton4: TToolButton;
    Pedigree: TDBCheckBox;
    qHistBullsUsed: TQuery;
    ToolButton6: TToolButton;
    btnCalvingSurvey: TRxSpeedButton;
    Label5: TLabel;
    ProjCalfType: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure CalfDOBExit(Sender: TObject);
    procedure CalfBreed1CloseUp(Sender: TObject);
    procedure CalfColourCloseUp(Sender: TObject);
    procedure CalfBreedExit(Sender: TObject);
    procedure CalfColourExit(Sender: TObject);
    procedure bRemoveCalfClick(Sender: TObject);
    procedure bSetClick(Sender: TObject);
    procedure BirthTypeCloseUp(Sender: TObject);
    procedure bCancelCalfClick(Sender: TObject);
    procedure sbSaveCalvings1Click(Sender: TObject);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure BullUsedChange(Sender: TObject);
    procedure SearchForAnimalExit(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure seDeadCalvesEnter(Sender: TObject);
    procedure seDeadCalvesExit(Sender: TObject);
    procedure rxcMortalityExit(Sender: TObject);
    procedure CalfComponentsOnExit(Sender: TObject);
    procedure sbPedNameClick(Sender: TObject);
    procedure dbcGenDamChange(Sender: TObject);
    procedure CalfSexChange(Sender: TObject);
    procedure BreedingClick(Sender: TObject);
    procedure CalfMortalityCloseUp(Sender: TObject);
    procedure CalfMortalityEnter(Sender: TObject);
    procedure CalfSexExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbDeleteCalvingClick(Sender: TObject);
    procedure CalfDOBChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure BirthTypeChange(Sender: TObject);
    procedure dblkcomboDamGroupListingChange(Sender: TObject);
    procedure dbCommentChange(Sender: TObject);
    procedure CalfNoChange(Sender: TObject);
    procedure CalfNatIdChange(Sender: TObject);
    procedure CalfNameChange(Sender: TObject);
    procedure CalfBreed1Change(Sender: TObject);
    procedure CalfColourChange(Sender: TObject);
    procedure dblkcmboCalfGroupListingChange(Sender: TObject);
    procedure CustomerChange(Sender: TObject);
    procedure CalfMortalityChange(Sender: TObject);
    procedure CalfBreedChange(Sender: TObject);
    procedure CalfNatIdEnter(Sender: TObject);
    procedure CalfNatIdMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAutoGenerateNatIDNoClick(Sender: TObject);
    procedure cxDBLookupComboBox1PropertiesChange(Sender: TObject);
    procedure CalfDeadPropertiesChange(Sender: TObject);
    procedure cmboNatIDNumPropertiesChange(Sender: TObject);
    procedure cmboNatIDNumPropertiesEditValueChanged(Sender: TObject);
    procedure HyperLinkEditClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure rbAbortionClick(Sender: TObject);
    procedure rbFullTermClick(Sender: TObject);
    procedure sbCalvingOptionsClick(Sender: TObject);
    procedure PedigreeClick(Sender: TObject);
    procedure btnCalvingSurveyClick(Sender: TObject);
  private
    { Private declarations }
    ExitOK : Boolean;   // Set to FALSE if a dup NatId or Animal No
    CheckCalfReg : Boolean;
//    NewNatID        : String;
    CalvingID       : Integer;
    StillBirth : Boolean;
    LastCalvDate : TDateTime;
    OriginalCalvDate : TDateTime;
    CalfMortValue : Integer;
    DeletingCalvingRecord : Boolean;
    DamFeedGroup : Integer;
    FormShowing : Boolean;
    DefaultCountry : TCountry;
    HUKLogInRequired : Boolean;
    FAbortedTagGenerated : Boolean;
    FCalfNewDOB : TDateTime;
    procedure CheckCalvingDateDiff;
    procedure SetFields(TrueOrFalse : Boolean);
    procedure GetAnimalInfo;
    procedure GetDamDetails;
    procedure GetSireDetails;
    procedure AssignCalfBreed;
    procedure CheckAnimal;
    procedure CheckBreedInterval;
    Function  CheckHeiferAge : Double;
    procedure CheckReplacement;
    procedure CheckBreedingEvents(var MsgStr : String);
    procedure TempCalvingCalfDeadChange(Sender: TField);
    procedure TempCalvingAfterScroll(DataSet: TDataSet);
    procedure DoRequiredFieldValidation(const ACountry : TCountry);
    Procedure CMDialogKey( var msg: TWMKey ); message CM_DIALOGKEY;
    Procedure CheckAutoGenNatIDNo;
    procedure EnableMultipleCalves;
    procedure ToggleCalfLiveDeadControls(const ACalfDead : Boolean);
    procedure ShowCalfEntryFields(const AShow : Boolean = False);
  public
    { Public declarations }
  end;

const
    sRemoveFromGroup = '<Remove From Current Group>';

procedure ShowCalvings ( AddOrAmend : TAddOrAmend );

var
    CalfAddingOrAmending : TAddOrAmend;


implementation
uses
    uDefaults,
    uGenLookSetUp,
    SetUpBreeds,
    DairyData,
    Def,
    uPedName,
    {uSuckSubstitute,}
    MenuUnit, kRoutines, uHerdLookup, uHerdSetUp, uGlobalSettings,
    uHUKINameSerialNoViewer, uConditionScoreEventForm, uPreferences, uHealthEventForm,
    SQLHelper;

{$R *.DFM}

procedure ShowCalvings ( AddOrAmend : TAddOrAmend );
var
   CalfArray : Array [1..4] of Integer;
   DeadCalfArray : Array [1..4] of Boolean;
   CalfMortalityArray : Array [1..4] of Integer;
   CalfBreeding : Array [1..4] of Boolean;
   CalfPedigree : Array [1..4] of Boolean;
   CalfDispoalPlaceArray : Packed Array [1..4] of Integer;
   CalfComplianceCertArray : Packed Array [1..4] of Boolean;
   i : Integer;
   SireNatId : string;
   ProjDate : TDateTime;
   NoOfCalves : Integer;
   IsPreg,
   sProjCalfType : string;
begin
   FillChar(CalfArray,SizeOf(CalfArray),0);
   FillChar(DeadCalfArray,SizeOf(DeadCalfArray),FALSE);
   FillChar(CalfBreeding,SizeOf(CalfBreeding),FALSE);
   FillChar(CalfPedigree,SizeOf(CalfPedigree),FALSE);
   CalfAddingOrAmending := AddOrAmend;

   with TfCalving.Create(nil) do
      try
         ToolButton3.Visible := True;
         sbExit.Visible := True;
         ToolButton1.Visible := True;
         sbSaveCalvings.Visible := True;
         DelCalvingSep.Style := tbsSeparator;
         sbDeleteCalving.Width := 0;
         sbDeleteCalving.Caption := '';
         sbDeleteCalving.Glyph := nil;
         ToolButton2.Visible := True;
         sbCalvingOptions.Visible := True;
         ToolButton4.Visible := True;
         btnCalvingSurvey.Width := 0;
         btnCalvingSurvey.Caption := '';
         ToolButton6.Style := tbsSeparator;

         CheckCalfReg := False;
         if NOT def.Definition.dUsePedigree then
            sbPedName.Hide;
         WinData.OrigBull := -1;
         WinData.EventType := TCalving;
         ThisCombo := SearchForAnimal;
         ThisNav := sbSaveCalvings;
         ThisComment := dbComment;
         pSexToList := 'Female';
         // drop down list of available bulls
         qBullUsed.Open;
         qHistBullsUsed.Open;
         // genetic dam drop down list
         qGenDam.ParamByName('AID').AsInteger := Windata.AnimalFileByIDID.AsInteger; // SP 17/03/2003 Donor and Reciep cannot be the same!
         qGenDam.Open;

         ProjDate := WinData.GetProjCalving(WinData.AnimalFileByIdId.AsInteger, WinData.AnimalFileByIDLActNo.AsInteger, NoOfCalves, IsPreg);
         if (ProjDate > 0) then
            ProjCalvingDate.Caption := FormatDateTime('dd/mm/yy',ProjDate)
         else
            ProjCalvingDate.Caption := 'N/A';

         sbDeleteCalving.Visible := False;

         if AddOrAmend = Add then
            begin
               SearchForAnimal.Color := clTeal;
               SearchForAnimal.Font.Color := clHighlightText;
               CalfDOB.Color := clTeal;
               CalfDOB.Font.Color := clHighlightText;
               BullUsed.Color := clTeal;
               BullUsed.EmptyItemColor := clTeal;
               BullUsed.Font.Color := clHighlightText;

               cmboNatIDNum.Style.Color := clTeal;
               cmboNatIDNum.Style.TextColor := clHighlightText;

               CalfNatId.Color := clTeal;
               CalfNatId.Font.Color := clHighlightText;
               CalfSex.Color := clTeal;
               CalfSex.Font.Color := clHighlightText;
               CalfBreed.Color := clTeal;
               CalfBreed.DropDownBox.SpecRow.Color := clTeal;
               CalfBreed.Font.Color := clHighlightText;
               if DefaultCountry = NIreland then
                  begin
                     CalfColour.Color := clTeal;
                     CalfColour.EmptyItemColor := clTeal;
                     CalfColour.Font.Color := clHighlightText;
                  end;

               //   31/05/12 [V5.0 R6.0] /MK Bug Fix - cmboNatIDNum.Top Set To Same As CalfNatID.
               cmboNatIDNum.Visible := (HerdLookup.HerdOwnerData.InputNatIDStyle = cInputNatIDStyle_ListInput);
               if ( cmboNatIDNum.Visible ) then
                  cmboNatIDNum.Top := 60;

               CalfNatId.Visible := not(cmboNatIDNum.Visible);
               //   03/10/11 [V5.0 R1.0] /MK Change - bSet.Visible If Country Is England And Adding.
               bSet.Visible := not(cmboNatIDNum.Visible) and ( DefaultCountry = England ) and (CalfAddingOrAmending = Add);
               //   13/12/11 [V5.0 R2.8] /MK Additional Feature - Changed Position Of Where dsBulls.DataSet Was Assigned.
               dsBulls.DataSet := qBullUsed;

               sProjCalfType := WinData.GetProjCalfType(WinData.AnimalFileByIdId.AsInteger, WinData.AnimalFileByIDLActNo.AsInteger);
            end
         else
            begin
               cmboNatIDNum.Visible := False;
               CalfNatId.Visible := True;
               SearchForAnimal.Color := clWindow;
               SearchForAnimal.Font.Color := clWindowText;
               CalfDOB.Color := clWindow;
               CalfDOB.Font.Color := clWindowText;
               BullUsed.Color := clWindow;
               BullUsed.EmptyItemColor := clWindow;
               BullUsed.Font.Color := clWindowText;
               CalfNatId.Color := clWindow;
               CalfNatId.Font.Color := clWindowText;
               cmboNatIDNum.Style.Color := clWindow;
               cmboNatIDNum.Style.TextColor := clWindowText;
               CalfSex.Color := clWindow;
               CalfSex.Font.Color := clWindowText;
               CalfBreed.Color := clWindow;
               CalfBreed.DropDownBox.SpecRow.Color := clWindow;
               CalfBreed.Font.Color := clWindowText;
               if DefaultCountry = NIreland then
                  begin
                     CalfColour.Color := clWindow;
                     CalfColour.EmptyItemColor := clWindow;
                     CalfColour.Font.Color := clWindowText;
                  end;
               //   13/12/11 [V5.0 R2.8] /MK Additional Feature - Changed Position Of Where dsBulls.DataSet Was Assigned.
               dsBulls.DataSet := qHistBullsUsed;

               sProjCalfType := WinData.GetProjCalfType(WinData.AnimalFileByIdId.AsInteger, WinData.AnimalFileByIDLActNo.AsInteger-1);
            end;

         if ( sProjCalfType <> '' ) then
            ProjCalfType.Caption := sProjCalfType
         else
            ProjCalfType.Caption := 'N/A';

         if DefaultCountry = NIreland then
            begin
               CalfMortality.LookupSource := HerdLookup.dsNIStillBornReasons;
               CalfMortality.DropDownWidth := 300;
            end
         else
            begin
               CalfMortality.LookupSource := WinData.dsMortality;
               CalfMortality.DropDownWidth := 180;
            end;

         if WinData.ActivePDAEvents() then
            begin
               if ( WinData.CalvingBirthType > 0 ) then
                  try
                     BirthType.Value := IntToStr(WinData.CalvingBirthType);
                  except
                  end;
            end
         else
            begin
               WinData.CalvingBirthType := 0;
               if DefaultCountry = Ireland then
                  BirthType.Value := IntToStr(WinData.ICBF_NormalBirthType_ID);
            end;

         // Used to identify the Calving record if Amending a calving
         CalvingID := 0;
         //CalfAddingOrAmending := AddOrAmend;
         CalfMortality.Enabled := False;
         if ( AddOrAmend = Add ) then
            begin
               WinData.EventStatus := EAdding;
               WinData.ModifyingEvent := False;
//               New(WinData.CalfDeathCustomers);


            end
         else if ( AddOrAmend = AddAtSetUp ) then
            begin
               WinData.EventStatus := EAddingAtSetUp;
               WinData.ModifyingEvent := False;
            end
         else
            begin
               WinData.EventStatus := EAmending;
               {If WinData.EventsICBFNotified.AsBoolean = True then
                  Begin
                     EventBookMark := WinData.Events.GetBookmark;
                     WinData.Events.Edit;
                     WinData.EventsICBFNotified.AsBoolean := False;
                     WinData.EventsICBFAction.AsString    := 'M';
                     WinData.Events.Post;
                     WinData.Events.GotoBookmark(EventBookmark);
                     WinData.Events.FreeBookmark(EventBookmark);
                  End;
               }
               WinData.ModifyingEvent := True;
            end;

         with WinData.TempCalving do
            begin
               Close;
               TableType := ttParadox;
               TableName := 'Temp1';
               FieldDefs.Clear;
               FieldDefs.Add('ID',ftAutoInc,0,True);
               FieldDefs.Add('CalfNo',ftString,10,False);
               FieldDefs.Add('NatID',ftString,20,False);
               FieldDefs.Add('Name', ftString,40,False);
               FieldDefs.Add('Sex',  ftString,10,False);
               FieldDefs.Add('Breed',ftInteger,0,False);
               FieldDefs.Add('HerdID', ftInteger,0,False);
               FieldDefs.Add('Colour', ftInteger,0,False);
               FieldDefs.Add('DOB', ftDate,0,False);
               FieldDefs.Add('BirthWeight',ftFloat,0,False);
               FieldDefs.Add('DeadCalves',ftInteger,0,False);
               FieldDefs.Add('Mortality',ftInteger,0,False);
               FieldDefs.Add('DonorDamID',ftInteger,0,False);
               FieldDefs.Add('CalfDead',ftBoolean,0,False);
               FieldDefs.Add('CalfMortality',ftInteger,0,False);
               FieldDefs.Add('Breeding',ftBoolean,0,False);
               FieldDefs.Add('Pedigree',ftBoolean,0,False);
               FieldDefs.Add('CalfID',ftInteger);
               FieldDefs.Add('DisposalPlace', ftInteger);
               FieldDefs.Add('GroupID', ftInteger);
               FieldDefs.Add('ComplianceCert', ftBoolean);
               //   27/09/12 [V5.0 R8.9] /MK Change - Add ElectronicID field for PDA Calving.
               FieldDefs.Add('ElectronicID',ftString,20);
               IndexDefs.Clear;
               IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
               CreateTable;
               Open;
               Fields[1].DisplayLabel := 'Calf No';
               Fields[2].DisplayLabel := 'National ID Number';
               Fields[1].Required := FALSE;

               // 03/02/2009 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Program Change - TempCalving.Sex.Required was "True",
               //                                                     changed to "False" to facilitate proper handling of invalid sex value
               Fields[4].Required := False;
               CalfGrid.Columns[0].FieldName := 'CalfNo';
               if ( WinData.EventStatus = EAdding )  then
                  CalfGrid.Columns[1].FieldName := 'CalcNatID'
               else
                  CalfGrid.Columns[1].FieldName := 'NatID';
               CalfGrid.Columns[2].FieldName := 'Name';
               CalfGrid.Columns[3].FieldName := 'Sex';
               CalfGrid.Columns[4].FieldName := 'HerdId';
               CalfGrid.Columns[5].FieldName := 'Breed';
               CalfGrid.Columns[6].FieldName := 'Colour';
               CalfGrid.Columns[7].FieldName := 'BirthWeight';
               CalfGrid.Columns[7].Title.Caption := 'Birth Wgt. Kgs.';
               dsTemp := DataSource;
            end;
         // Set Edit Components to there relevant Fields.
         // for each calf
         //ID.DataField := 'ID';
         CalfNo.DataField := 'CalfNo';
         CalfNatID.DataField := 'NatId';
         cmboNatIDNum.DataBinding.DataField := CalfNatID.DataField;
         CalfName.DataField := 'Name';
         CalfBreed.DataField := 'Breed';
         CalfSex.DataField := 'Sex';
         //CalfHerdID.DataField := 'HerdID';
         CalfColour.DataField := 'Colour';
         BirthWeight.DataField := 'BirthWeight';
         CalfDead.DataBinding.DataField := 'CalfDead';
         CalfMortality.DataField := 'CalfMortality';
         Breeding.DataField := 'Breeding';
         Pedigree.DataField := 'Pedigree';
         Customer.DataField := 'DisposalPlace';

         dblkcmboCalfGroupListing.DataField := 'GroupID';
         dbcbComplianceCert.DataField := 'ComplianceCert';

         // open the Birth Type Query
         WinData.qBirthType.Open;
         // AMENDING CALVING
         // Bring back the Calf details
         if ( CalfAddingOrAmending = Amending ) then
            begin
               { Only delete of calving event when in Amend mode}
               {
               sbDeleteCalving.Visible := True;
               DelCalvingSep.Visible := True;
               }

               sbDeleteCalving.Visible := True;
               sbDeleteCalving.Width := 122;
               sbDeleteCalving.Caption := 'Delete Calving';
               DelCalvingSep.Style := tbsDivider;

               if ( DefaultCountry = England ) then
                  begin
                     btnCalvingSurvey.Width := 105;
                     btnCalvingSurvey.Caption := 'Calving Survey';
                     ToolButton6.Style := tbsDivider;
                  end;

               if WinData.Calvings.Locate('EventID',WinData.EventID.AsInteger,[] ) then
                  begin
                     // Store the Calving Record ID
                     CalvingID := WinData.Calvings.FieldByName('EventID').AsInteger;
                     // Assign birth type, dead calves & mortality from table to components
                     BirthType.Value := Windata.Calvings.FieldByName('BirthType').AsString;
                     Windata.DeadCalves := Windata.Calvings.FieldByName('DeadCalves').AsInteger;
                     WinData.Mortality := Windata.Calvings.FieldByName('Mortality').AsInteger;
                     seDeadCalves.AsInteger := Windata.Calvings.FieldByName('DeadCalves').AsInteger;
                     rxcMortality.Value := Windata.Calvings.FieldByName('Mortality').AsString;

                     CalfMortality.Enabled := False;
                     CalfDead.Enabled := False;
                     Breeding.Enabled := False;
                     Pedigree.Enabled := False;

                     // and calf id's
                     CalfArray[1] := WinData.Calvings.FieldByName('ID1').AsInteger;
                     CalfArray[2] := WinData.Calvings.FieldByName('ID2').AsInteger;
                     CalfArray[3] := WinData.Calvings.FieldByName('ID3').AsInteger;
                     CalfArray[4] := WinData.Calvings.FieldByName('ID4').AsInteger;
                     try
                        DeadCalfArray[1] := WinData.Calvings.FieldByName('CalfDead1').AsBoolean;
                        DeadCalfArray[2] := WinData.Calvings.FieldByName('CalfDead2').AsBoolean;
                        DeadCalfArray[3] := WinData.Calvings.FieldByName('CalfDead3').AsBoolean;
                        DeadCalfArray[4] := WinData.Calvings.FieldByName('CalfDead4').AsBoolean;
                        CalfMortalityArray[1] := WinData.Calvings.FieldByName('CalfMortality1').AsInteger;
                        CalfMortalityArray[2] := WinData.Calvings.FieldByName('CalfMortality2').AsInteger;
                        CalfMortalityArray[3] := WinData.Calvings.FieldByName('CalfMortality3').AsInteger;
                        CalfMortalityArray[4] := WinData.Calvings.FieldByName('CalfMortality4').AsInteger;
                        CalfComplianceCertArray[1] := WinData.Calvings.FieldByName('ID1ComplianceCert').AsBoolean;
                        CalfComplianceCertArray[2] := WinData.Calvings.FieldByName('ID2ComplianceCert').AsBoolean;
                        CalfComplianceCertArray[3] := WinData.Calvings.FieldByName('ID3ComplianceCert').AsBoolean;
                        CalfComplianceCertArray[4] := WinData.Calvings.FieldByName('ID4ComplianceCert').AsBoolean;
                     except
                       //
                     end;

                     for i := 1 to 4 do
                     if WinData.LookUpDamSire.Locate('ID',CalfArray[i],[]) then
                        begin  // Load Calf info
                           WinData.TempCalving.Insert;
                           WinData.TempCalving.FieldByName('CalfNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                           WinData.TempCalving.FieldByName('NatID').AsString      := WinData.LookUpDamSire.FieldByName('NatIDNum').AsString;
                           WinData.TempCalving.FieldByName('Name').AsString       := WinData.LookUpDamSire.FieldByName('Name').AsString;
                           WinData.TempCalving.FieldByName('Sex').AsString        := WinData.LookUpDamSire.FieldByName('Sex').AsString;
                           WinData.TempCalving.FieldByName('Breed').AsInteger     := WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger;
                           WinData.TempCalving.FieldByName('HerdID').AsInteger    := WinData.LookUpDamSire.FieldByName('HerdID').AsInteger;
                           WinData.TempCalving.FieldByName('Colour').AsInteger    := WinData.LookUpDamSire.FieldByName('Colour').AsInteger;
                           WinData.TempCalving.FieldByName('DOB').AsDateTime      := WinData.LookUpDamSire.FieldByName('DateOfBirth').AsDateTime;
                           WinData.TempCalving.FieldByName('BirthWeight').AsFloat := WinData.LookUpDamSire.FieldByName('BirthWeight').AsFloat;
                           WinData.TempCalving.FieldByName('Breeding').AsBoolean  := WinData.LookUpDamSire.FieldByName('Breeding').AsBoolean;
                           WinData.TempCalving.FieldByName('Pedigree').AsBoolean  := WinData.LookUpDamSire.FieldByName('Pedigree').AsBoolean;
                           WinData.TempCalving.FieldByName('CalfDead').AsBoolean  := DeadCalfArray[i];
                           WinData.TempCalving.FieldByName('CalfMortality').AsInteger := CalfMortalityArray[i];
                           WinData.TempCalving.FieldByName('ComplianceCert').AsBoolean := CalfComplianceCertArray[i];

                           // Get Animals Dispoal Place.
                           with GetDisposalPlace do
                              begin
                                 Close;
                                 Params[0].Value := CalfArray[i];
                                 Open;
                                 try
                                    First;
                                    if ( Fields[0].AsInteger > 0 ) then
                                        WinData.TempCalving.FieldByName('DisposalPlace').AsInteger := Fields[0].AsInteger
                                 finally
                                    Close;
                                 end;
                              end;
                           WinData.TempCalving.Post;
                        end;
                  end;
            end
         else
            begin
               AddEvent;
            end;

         // Open the LookUp Table for Calvings
         WinData.LookUpTempCalving.Open;
         if WinData.ActivePDAEvents then
            with WinData do
               begin
                  BullUsed.Value := IntToStr(WinData.LastBull);
                  for i := 1 to cMaxCalves do
                     begin
                        if CalvingRecords[i] <> nil then
                           begin
                              TempCalving.Append; // insert record allow for phonelink data to be inserted on the TempCalvingOnNewRecord event.
                              TempCalvingNatID.EditMask := '';
                              //   10/03/15 [V5.4 R3.2] /MK Change - If ParlourLinkEvents file found then blank calving is passed in so default NatIDMask to HerdIdentifier.
                              if ( WinData.ActiveParlourLinkEvents ) then
                                 begin
                                    TempCalvingNatID.EditMask := DefaultNatIDMaskFromHerdIdentifierMask;
                                    TempCalving.FieldByName('Breed').AsInteger := 0;
                                    if ( WinData.EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDID.AsInteger,AnimalFileByIDLactNo.AsInteger,CServiceEvent) = 0 ) or
                                       ( WinData.EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDID.AsInteger,AnimalFileByIDLactNo.AsInteger,CBullingEvent) = 0 ) then
                                       WinData.LastBull := 0;
                                    TempCalving.FieldByName('Name').AsString := Trim(PedigreeNamePrefix(WinData.AnimalFileByIDHerdID.AsInteger));
                                 end
                              else
                                 begin
                                    if ( CalvingRecords[i]^.CalfNo <> '' ) then
                                       begin
                                          TempCalving.FieldByName('NatID').AsString := WinData.CalvingRecords[i]^.CalfNo;
                                          CalvingRecords[i]^.CalfNo := '';
                                       end;

                                    if ( CalvingRecords[i]^.CalfAnimalNo <> '' ) then
                                       begin
                                          TempCalving.FieldByName('CalfNo').AsString := WinData.CalvingRecords[i]^.CalfAnimalNo;
                                          CalvingRecords[i]^.CalfAnimalNo := '';
                                       end;

                                    if ( CalvingRecords[i]^.CalfSex <> '' ) then
                                       begin
                                          TempCalving.FieldByName('Sex').AsString := WinData.CalvingRecords[i]^.CalfSex;
                                          CalvingRecords[i]^.CalfSex := '';
                                       end;

                                    if ( CalvingRecords[i]^.CalfBreedID > 0 ) then
                                       begin
                                          TempCalving.FieldByName('Breed').AsInteger := WinData.CalvingRecords[i]^.CalfBreedID;
                                       end;

                                    if ( CalvingRecords[i]^.CalfColourID > 0 ) then
                                       begin
                                          TempCalving.FieldByName('Colour').AsInteger := WinData.CalvingRecords[i]^.CalfColourID;
                                       end;

                                    if ( WinData.CalvingRecords[i]^.CalfWeight > 0 ) then
                                       begin
                                         TempCalving.FieldByName('BirthWeight').AsFloat := CalvingRecords[i]^.CalfWeight;
                                       end;

                                    if ( WinData.CalvingRecords[i]^.CalfMortality > 0 ) then
                                       begin
                                         TempCalving.FieldByName('CalfMortality').AsInteger := CalvingRecords[i]^.CalfMortality;
                                       end;

                                    if ( WinData.CalvingRecords[i]^.CalfDisposalPlace > 0 ) then
                                       begin
                                         TempCalving.FieldByName('DisposalPlace').AsInteger := CalvingRecords[i]^.CalfDisposalPlace;
                                       end;

                                    TempCalving.FieldByName('CalfDead').AsBoolean := CalvingRecords[i]^.CalfDead;
                                    TempCalving.FieldByName('Breeding').AsBoolean := CalvingRecords[i]^.CalfBreeding;
                                    TempCalving.FieldByName('Pedigree').AsBoolean := CalvingRecords[i]^.CalfPedigree;
                                    TempCalving.FieldByName('Name').AsString := Trim(PedigreeNamePrefix( WinData.AnimalFileByIDHerdID.AsInteger) + ' ' + CalvingRecords[i]^.CalfName);
                                    //   27/09/12 [V5.0 R8.9] /MK Change - Add ElectronicID from PDAEvents tables.
                                    TempCalving.FieldByName('ElectronicID').AsString := CalvingRecords[i].CalfEID;
                                 end;
                              if ( WinData.Events.State in dsEditModes ) then
                                 if ( CalvingRecords[i]^.EventDate > 0 ) then
                                    WinData.EventsEventDate.AsDateTime := CalvingRecords[i]^.EventDate;

                              if ( not(WinData.ActiveParlourLinkEvents) ) then
                                 TempCalving.Post;
                              //TempCalving.Edit;
                           end
                     end;
               end;

         // Set the Animal Number to the one on the Grid
         SetSearchField ( SearchForAnimal );
         // Set the Button Colour
         bSet.Font.Color := WinData.SetButtonColour;
         if ( CalfAddingOrAmending = Amending ) then
            begin
               // reset natid mask - 3/8/00 - kr
               WinData.TempCalvingNatID.EditMask := '';
               // bring back sire - 11/4/00 - kr
               if CalfNatId.Text <> '' then
                  if WinData.LookUpDamSire.Locate('NatIDNum',CalfNatId.Text,[] ) then
                     begin
                        SireNatId := WinData.LookUpDamSire.FieldByName('SireID').AsString;
                        try
                           if SireNatID <> '' then  // Ensure sire string is not blank
                              begin
                                 if WinData.LookUpDamSire.Locate('ID',SireNatId,[] ) then
                                    begin
                                       teSireName.Enabled      := True;
                                       teSireName.Text      := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                       BullUsed.DisplayValue := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    end;
                              end;
                        except
                        end;
                     end;
{
               // get genetic dam id - 30/5/00 - kr
               if CalfNatId.Text <> '' then
                  // find calf details
                  if WinData.LookUpDamSire.Locate('NatIDNum',CalfNatId.Text,[] ) then
                     begin
                        // check if donor dam used
                        if WinData.LookUpDamSire.FieldByName('DonorDamID').AsString <> '' then
                           // locate donor dam details
                           if WinData.LookUpDamSire.Locate('ID',WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger,[] ) then
                              begin
                                 DamName.Enabled        := True;
                                 DamName.Caption        := (WinData.LookUpDamSire.FieldByName('Name').AsString + ' (Donor)');
                                 dbcGenDam.DisplayValue := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                              end;
                     end;
}
            end
         else if not WinData.ActivePDAEvents then
            WinData.TempCalving.Append;


// MK 02.12.07 - To get rid of Projecting Calving Message on Calving screen on Calving.AddorAmend

         if not WinData.InsertCalving then
            begin
               StatusBar.Panels[0].Text := '';
            end;

         ShowModal;
      finally
         WinData.LookUpTempCalving.Close;
         Free;
      end;
end;

procedure TfCalving.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfCalving.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if not ( DeletingCalvingRecord ) then
      CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified )
   else
      Menuform.SetUpQuery;
end;

procedure TfCalving.GetDamDetails;
begin
   teDamName.Text := '';
    // get genetic dam id - 30/5/00 - kr
    with genquery do
       begin
          SQL.Clear;
          SQL.Add('SELECT E.AnimalID, E.AnimalLactNo, E.EventDate AS LastService,');
          SQL.Add('	     G.Description AS ServiceType,  A.AnimalNo AS ServiceBull ,');
          SQL.Add('	     S.GeneticDam AS GenDamID, AA.AnimalNo AS GeneticDam, ');
          SQL.Add('       AA.Name AS GenDamName');
          SQL.Add('FROM Events E');
          SQL.Add('LEFT JOIN Services S ON (S.EventID = E.ID)');
          SQL.Add('LEFT JOIN GenLook G  ON (G.ID = S.ServiceType)');
          SQL.Add('LEFT JOIN Animals A  ON (A.ID = S.ServiceBull)');
          SQL.Add('LEFT JOIN Animals AA ON (AA.ID = S.GeneticDam)');
          SQL.Add('WHERE E.EventType = ' + IntToStr(cServiceEvent));
          SQL.Add('AND   E.AnimalID = ' + IntToStr(WinData.AnimalFileByIDID.Value));
          SQL.Add('ORDER BY E.EventDate desc');
          open;
          FindFirst;
          // check last service is within one year and genetic dam was used
          if ((CalfDoB.Date - genquery.FieldByName('LastService').AsDateTime) < 365) and
             (genquery.FieldByName('GeneticDam').AsString <> '') then
             // assign genetic dam details
             begin
                WinData.DonorDamID     := genquery.FieldByName('GenDamID').AsInteger;
                teDamName.Text        := (genquery.FieldByName('GenDamName').AsString + ' (Donor Dam)');
                dbcGenDam.DisplayValue := genquery.FieldByName('GeneticDam').AsString;
             end
          else
             // assign natural dam details
             begin
                WinData.DonorDamID     := 0;
                teDamName.Text        := WinData.AnimalFileByIDName.AsString;
                dbcGenDam.DisplayValue := '';
             end;
       end;
end;

procedure TfCalving.GetSireDetails;
begin
   // 02/08/2013 - SP - Need to clear the calf breed value if the sire id has not been detected.
   WinData.LastBull := 0;
   WinData.CalvingSireBreedId := 0;
   teSireName.Text := '';
   if ( BullUsed.Value > '0') then
      begin
         WinData.LastBull := StrToInt(BullUsed.Value);
         if WinData.LookUpDamSire.Locate('ID', WinData.LastBull,[] ) then
            begin
               WinData.CalvingSireBreedId := WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger;
               teSireName.Text := WinData.LookUpDamSire.FieldByName('Name').AsString;
            end;
      end;
end;

Function TfCalving.CheckHeiferAge : Double;
begin
   RESULT := ((Windata.EventsEventDate.AsDateTime) -
               (WinData.AnimalFileByIdDateOfBirth.AsDateTime));
end;

procedure TfCalving.CheckCalvingDateDiff;
Var
   DaysDiff,
   AgeDiff  : Double;
   NoOfCalves,
   TmpBull : Integer;
   ProjDate  : TDateTime;
   IsPreg    : String;
begin
   if sbSaveCalvings.Enabled then
      begin
         // Store the LastBull as the GetProjCalving may set it to none if the animal
         // has no service records
         TmpBull := WinData.LastBull;
         ProjDate := WinData.GetProjCalving(WinData.AnimalFileByIdId.AsInteger, WinData.AnimalFileByIDLActNo.AsInteger, NoOfCalves, IsPreg);
         // check if old enough to breed
         if WinData.HerdSpecies = cSpecies_Goats then
            begin
               { Check GOAT under 9 months }
               if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(WinData.EventsEventDate.AsDateTime, -9)) then
                  begin
                     CalfDOB.SetFocus;
                     WinData.TempCalving.Cancel;
                     raise errormsg.CreateFmt('Dam is less than 9 Months old',[nil])
                  end;
            (*   else if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(WinData.EventsEventDate.AsDateTime, -14)) then
               { Check GOAT under 14 months, if so warn user }
                  if MessageDlg('Dam is less than 14 months old, continue anyway?',mtWarning,[mbYes,mbNo],0) = mrNo then
                     begin
                        WinData.TempCalving.Cancel;
                        Close;
                     end;
            *)
            end
         else
            begin
               AgeDiff := CheckHeiferAge;
               if AgeDiff < 366 then
                  begin
                     CalfDOB.SetFocus;
                     WinData.TempCalving.Cancel;
                     raise errormsg.CreateFmt('Dam is less than one year old',[nil]);
                  end;
            end;


         DaysDiff := ( ProjDate - WinData.EventsEventDate.AsDateTime );
         if ( ProjDate > 0 ) then
            ProjCalvingDate.Caption := FormatDateTime('dd/mm/yy',ProjDate);

         if ( DaysDiff > 10 ) then
            StatusBar.Panels[0].Text := 'Actual Differs from Projected by more than 10 Days.';

         if ( WinData.OrigBull = -1 ) then
            WinData.OrigBull := WinData.LastBull;

         // Restore the Bull code that was used when entering this event
         if TmpBull > 0 then
            WinData.LastBull := TmpBull;

         if ( dsBulls.DataSet = qBullUsed ) then
            begin
               if qBullUsed.Locate('ID',WinData.LastBull,[] ) then  // try and find the Last bull
                  BullUsed.Value := qBullUsed.FieldByName('ID').AsString
               else
                  BullUsed.Value := '0';
            end
         else if ( dsBulls.DataSet = qHistBullsUsed ) then
            begin
               if qHistBullsUsed.Locate('ID',WinData.LastBull,[] ) then  // try and find the Last bull
                  BullUsed.Value := qHistBullsUsed.FieldByName('ID').AsString
               else
                  BullUsed.Value := '0';
            end;

         GetDamDetails;
         GetSireDetails;

         AssignCalfBreed();
      end;
end;

procedure TfCalving.FormActivate(Sender: TObject);
begin
   FormShowing := True;
   lNo.Caption := NoLabel;
   if CalfAddingOrAmending = Amending then
      begin
         OriginalCalvDate := CalfDOB.Date;
         SetFields(FALSE);
      end
   else if ( CalfAddingOrAmending in [Add,AddAtSetup] ) then
      begin
         SetFields(TRUE);
      end;
   // disable fields until values are entered
   if rxcMortality.Text = '' then
      begin
         rxcMortality.Enabled := False;
         lMortality.Enabled   := False;
      end;
   bNewCalf.Enabled    := False;
   bCancelCalf.Enabled := False;
   bRemoveCalf.Enabled := False;

   if ( CalfAddingOrAmending = Add ) and ( DefaultCountry in [Ireland, NIreland] ) then
      begin
         HyperLinkEdit.Visible := True;
         Label1.Visible := True
      end
   else
      begin
         HyperLinkEdit.Visible := False;
         Label1.Visible := False;
      end;

   dbcbComplianceCert.Enabled := ( CalfAddingOrAmending = Add ) and ( DefaultCountry = Ireland );

   //   22/05/13 [V5.1 R6.6] /MK Change - Only show compliance cert labels and checkbox if AIM does not exist.
   if ( DefaultCountry = Ireland ) then
      begin
         dbcbComplianceCert.Visible := ( not(AIMClient.ClientExists) );
         Label4.Visible := dbcbComplianceCert.Visible;
         Label11.Visible := dbcbComplianceCert.Visible;
         lComplianceCertInstruction.Visible := dbcbComplianceCert.Visible;
      end;

   // set still birth boolean to false
   StillBirth          := False;
   // setfocus to date
   //CalfDoB.SetFocus;

   rbFullTerm.Visible := False;
   rbAbortion.Visible := False;

   if (DefaultCountry =Ireland) then
      //   09/05/13 [V5.1 R7.1] /MK Change - Change caption from ICBF Survey to Calving Ease for new ICBF Beef Data Program.
      lBirthType.Caption := 'Calving Ease'
   else
      lBirthType.Caption := 'Birth Type';
   inherited FormActivate(Sender);

end;

procedure TfCalving.GetAnimalInfo;
begin
    // Set the LastBull to 0 to stop the record from the previous record being
    // displayed
    if not WinData.ActivePDAEvents then
       WinData.LastBull := 0;
    // Check the Calving Date against the projected calving date
    CheckCalvingDateDiff;

 //   if not ( WinData.ActivePDAEvents ) then // only set mask if natid is manually entered.
 //      WinData.TempCalvingNatID.EditMask := WinData.DefaultNatIDMask;


    if not ( WinData.ActivePDAEvents ) then // only set mask if natid is manually entered.
       begin
          if (HerdLookup.HerdOwnerData.InputNatIDStyle <> cInputNatIDStyle_ListInput) then
             begin
                if (DefaultCountry <> Ireland ) then
                   WinData.TempCalvingNatID.EditMask := WinData.DefaultNatIDMask
                else
                   begin
                      WinData.TempCalvingNatID.EditMask := WinData.DefaultNatIDMaskFromHerdIdentifierMask;
                      CalfNatId.SelStart := 12;
                   end;
             end;
       end;

    bSet.Font.Color := WinData.SetButtonColour;

    // Get the parent herd Name for the Calves
    if WinData.OwnerFile.Locate('ID',WinData.AnimalFileByIdHerdId.Value,[]) then
       WinData.HerdPreFix := WinData.OwnerFile.FieldByName('HerdPreFix').AsString
    else
       WinData.HerdPreFix := '';
end;

procedure TfCalving.SetFields(TrueOrFalse : Boolean);
var
   ETCalvingEvent : Boolean;
begin

{   if TrueOrFalse = TRUE then
      bSet.Show
   else                 // MK 08.05.07 - Program should know IE Prefix of Herd
      bSet.Hide;}

   // Do Not allow the Animal Search if adding from SetUp screen
   if WinData.EventStatus = EAddingAtSetUp then
      SearchForAnimal.Enabled := FALSE
   else
      SearchForAnimal.Enabled := TrueOrFalse;
   BullUsed.Enabled    := TrueOrFalse;
   bNewCalf.Enabled    := TrueOrFalse;
   bCancelCalf.Enabled := TrueOrFalse;
   bRemoveCalf.Enabled := TrueOrFalse;
   CalfNo.Enabled      := TrueOrFalse;
   CalfNatId.Enabled   := TrueOrFalse;
   cmboNatIDNum.Enabled   := TrueOrFalse;
   CalfName.Enabled    := TrueOrFalse;
   CalfSex.Enabled     := TrueOrFalse;
   CalfBreed.Enabled   := TrueOrFalse;
   CalfColour.Enabled  := TrueOrFalse;
   dbcGenDam.Enabled   := TrueOrFalse;
   teDamName.Enabled     := TrueOrFalse;
   sbPedName.Enabled   := TrueOrFalse;
//   SireName.Enabled    := TrueOrFalse;  // removed 11/4/00 - kr
   BirthWeight.Enabled := TrueOrFalse;
   Customer.Enabled := TrueOrFalse;
   CalfDead.Enabled := TrueOrFalse;
   CalfMortality.Enabled := TrueOrFalse;
   dblkcmboCalfGroupListing.Enabled := TrueOrFalse;
   dblkcomboDamGroupListing.Enabled := TrueOrFalse;
   BirthType.Enabled := TrueOrFalse;

   // 06/07/11 [V4.1 R2.2] /MK Bug Fix - If EventStatus = Amending Then ETCalving Event Is Based On AnimalLactNo - 1 Else CurrentLactNo.
   // SP recommended by GL / RY 26/03/2008
   if WinData.EventStatus in [EAdding,EAddingAtSetup] then
      ETCalvingEvent := WinData.ETCalving(WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByIDLactNo.AsInteger)
   else if WinData.EventStatus = EAmending then
      ETCalvingEvent := WinData.ETCalving(WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByIDLactNo.AsInteger-1);

   if (ETCalvingEvent) then
      begin
         lGenDam.Visible := ETCalvingEvent;
         dbcGenDam.Visible := ETCalvingEvent;
         lDonorDam.Visible := ETCalvingEvent;
         //lBirthType.Top := 66;
        // BirthType.Top := 64;
         //lAssignGrp.Top := 90;
         //dblkcomboDamGroupListing.Top := 88;
         //lComment.Top := 114;
         //dbComment.Top := 112;
      end
   else
      begin
         lGenDam.Visible := ETCalvingEvent;
         dbcGenDam.Visible := ETCalvingEvent;
         lDonorDam.Visible := ETCalvingEvent;
         //lBirthType.Top := 42;
         //BirthType.Top := 40;
         //lAssignGrp.Top := 66;
         //dblkcomboDamGroupListing.Top := 64;
         //lComment.Top := 90;
         //dbComment.Top := 88;
      end;
end;

procedure TfCalving.CalfDOBExit(Sender: TObject);
begin
   // check difference vs. projected date
   CheckCalvingDateDiff;
   // check calving interval
   CheckBreedInterval;
   GetDamDetails;
end;

procedure TfCalving.CalfBreed1CloseUp(Sender: TObject);
begin
//   if ( CalfBreed.Value = '0' ) then
  //    SetUpBreeds.ShowTheForm(TRUE);
end;

procedure TfCalving.CalfColourCloseUp(Sender: TObject);
begin
   If CalfColour.Value = '0' Then
      begin
         GenLookUpType := TAnimalColour;
         uGenLookSetUp.ShowTheForm(TRUE);                      // blank record on open
      end;
end;

procedure TfCalving.CalfBreedExit(Sender: TObject);
begin
   //WinData.DefaultBreed := CalfBreed.Field.AsInteger;
end;

procedure TfCalving.CalfColourExit(Sender: TObject);
begin
   WinData.DefaultColour := CalfColour.Field.AsInteger;
end;

procedure TfCalving.bRemoveCalfClick(Sender: TObject);
begin
   SetModifiedFlag;
   if WinData.TempCalving.State = dsInsert then
      WinData.TempCalving.Post
   else
      WinData.TempCalving.Cancel;

   if WinData.TempCalving.RecordCount > 0 then
      WinData.TempCalving.Delete;
      if CalfNo.Field.DataSet.Active then
         case CalfNo.Field.DataSet.RecordCount of
            1 : begin
                   bNewCalf.Caption := 'Twin Calf'; // dataset in insert/edit mode by default.
                end;
            2 : begin
                   bNewCalf.Caption := 'Triplet Calf';
                end;
            3 : begin
                   bNewCalf.Caption := 'Quad. Calf';
                end;
         else
            bNewCalf.Caption := 'Add Calf';
         end;
   if WinData.Events.State = dsInsert then
      begin
         if WinData.TempCalving.RecordCount = 1 then
            WinData.EventsEventDesc.AsString := 'Calving'
         else if WinData.TempCalving.RecordCount = 2 then
            WinData.EventsEventDesc.AsString := 'Calving / Twin'
         else if WinData.TempCalving.RecordCount = 3 then
             WinData.EventsEventDesc.AsString := 'Calving / Triplet'
         else if WinData.TempCalving.RecordCount = 4 then
            WinData.EventsEventDesc.AsString := 'Calving / Quad. Calf'
      end;
end;

procedure TfCalving.bSetClick(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfDefaults);
   bSet.Font.Color := WinData.SetButtonColour;
   if ( not (WinData.TempCalving.State in dsEditModes) ) and  ( WinData.TempCalving.RecordCount > 0 )  then
      WinData.TempCalving.Edit;
   WinData.TempCalvingNatID.Clear;
   if (HerdLookup.HerdOwnerData.InputNatIDStyle <> cInputNatIDStyle_ListInput) then
      WinData.TempCalvingNatID.EditMask := WinData.DefaultNatIDMask;
end;

procedure TfCalving.BirthTypeCloseUp(Sender: TObject);
begin
   WinData.CalvingBirthType := BirthType.LookupSource.DataSet.FieldByName('ID').Value;
end;

procedure TfCalving.bCancelCalfClick(Sender: TObject);
begin
   SetModifiedFlag;
   WinData.TempCalving.Cancel;
   if CalfNo.Field.DataSet.Active then

      if CalfNo.Field.DataSet.Active then
         case CalfNo.Field.DataSet.RecordCount of
            1 : begin
                   bNewCalf.Caption := 'Twin Calf'; // dataset in insert/edit mode by default.
                end;
            2 : begin
                   bNewCalf.Caption := 'Triplet Calf';
                end;
            3 : begin
                   bNewCalf.Caption := 'Quad. Calf';
                end;
         else
            bNewCalf.Caption := 'Add Calf';
         end;

   if WinData.Events.State = dsInsert then
      begin
         if WinData.TempCalving.RecordCount = 1 then
            WinData.EventsEventDesc.AsString := 'Calving'
         else if WinData.TempCalving.RecordCount = 2 then
            WinData.EventsEventDesc.AsString := 'Calving / Twin'
         else if WinData.TempCalving.RecordCount = 3 then
             WinData.EventsEventDesc.AsString := 'Calving / Triplet'
         else if WinData.TempCalving.RecordCount = 4 then
            WinData.EventsEventDesc.AsString := 'Calving / Quad. Calf'
      end;

end;

procedure TfCalving.sbSaveCalvings1Click(Sender: TObject);
var
   AgeDiff : Double;
   MessageText : String;
   DamID : Integer;
   DamTagNo : String;
   HerdType : THerdType;
   GroupData : Variant;
   LactNo : Integer;
   TempAnimals : TTable;
begin

   if ( CalfAddingOrAmending = Amending ) then
      begin
         CheckBreedingEvents(MessageText);
         if ( MessageText <> '' ) then
            begin
               MessageDlg(MessageText,mtInformation,[mbok],0);
               Abort;
            end;
      end;

   if ( CalfAddingOrAmending = Add ) then
      begin
         if BullUsed.Value = '0' then
            begin
               if MessageDlg('No Sire has been selected, continue anyway? ',mtWarning,[mbYes,mbNo],0) = idNo then
                  begin
                     BullUsed.DropDown;
                     Exit;
                  end;
            end;

         if DefaultCountry = Ireland then
            begin
               if BirthType.Value = '0' then
                  begin
                     if MessageDlg('No ICBF Survey has been selected, continue anyway? ',mtWarning,[mbYes,mbNo],0) = idNo then
                        begin
                           BirthType.DropDown;
                           Exit;
                        end;
                  end;
            end;

      end;


   CheckReplacement;
   // check calving interval
   CheckBreedInterval;
   // check dam d.o.b. vs. calf d.o.b.

   if WinData.HerdSpecies = cSpecies_Goats then
      begin
         { Check GOAT under 9 months }
         if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(WinData.EventsEventDate.AsDateTime, -9)) then
            begin
               CalfDOB.SetFocus;
               raise errormsg.CreateFmt(cCalvingAnimalUnder9Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 9, FormatDate(WinData.EventsEventDate.AsDateTime,dsIrish)]);
            end
         else if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(WinData.EventsEventDate.AsDateTime, -18)) then
            begin
               if MessageDlg(Format(cCalvingAnimalUnder18Mths,[WinData.AnimalFileByIDNatIDNum.AsString,18,FormatDate(WinData.EventsEventDate.AsDateTime,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                  Abort;
            end;
      end
   else
      begin
         if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(WinData.EventsEventDate.AsDateTime, -12)) then
            begin
               CalfDOB.SetFocus;
               raise errormsg.CreateFmt(cCalvingAnimalUnder12Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 12, FormatDate(WinData.EventsEventDate.AsDateTime,dsIrish)]);
            end
         else if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(WinData.EventsEventDate.AsDateTime, -18)) then
            begin
               if MessageDlg(Format(cCalvingAnimalUnder18Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 18, FormatDate(WinData.EventsEventDate.AsDateTime,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                  Abort;
            end
         else if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(WinData.EventsEventDate.AsDateTime, -22)) then
            begin
               if MessageDlg(Format(cCalvingAnimalUnder22Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 22, FormatDate(WinData.EventsEventDate.AsDateTime,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                  begin
                     CalfDOB.SetFocus;
                     Abort;
                  end;
            end
         else if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(WinData.EventsEventDate.AsDateTime, -24)) then // GL 26/02/08 on EL recommendation!
            begin
               if MessageDlg(Format(cCalvingAnimalUnder24Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 24, FormatDate(WinData.EventsEventDate.AsDateTime,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                  begin
                     CalfDOB.SetFocus;
                     Abort;
                  end;
            end;
      end;

   //   05/02/14 /MK Change - Removed "cannot be deleted" from the warning when saving the calvings.
   if ( MessageDlg('Are all the details correct?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
      begin
         // assign component values to variables (windata - public) NOT tables!
         Update;
         try
            WinData.DeadCalves := 0;
            //if rxcMortality.Value <> '0' then
            //   WinData.Mortality := StrToInt(rxcMortality.Value);
         except
            //
         end;

         if not WinData.InsertCalving then
            begin
               // if new record is being added
               if ( CalfAddingOrAmending in [Add,AddAtSetup] ) then
                  begin
                     // exit the Animal No or National ID if they are in Focus
                     ExitOk := TRUE;
                     if ExitOK then
                        begin
                           // Find First Record
                           if WinData.TempCalving.State in dsEditModes then
                              try
                                 WinData.TempCalving.Post;
                              except
                                 //WinData.TempCalving.Cancel;
                                 raise;
                              end;

                           WinData.TempCalving.First;
                           while NOT WinData.TempCalving.EOF do
                              begin
                                 WinData.TempCalving.Edit;
                                 // Save the Event date to the Animals DOB
                                 WinData.TempCalving.FieldByName('DOB').AsDateTime := WinData.EventsEventDate.AsDateTime;
                                 WinData.TempCalving.Post;
                                 WinData.TempCalving.Next;
                              end;

                           // do validation of all required calf fields.
                           if WinData.ActivePDAEvents then
                              begin
                                 // Ensure validation is complete if event is a PDA event.
                                 DoRequiredFieldValidation(WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger ));
                              end;

                           if WinData.TempCalving.RecordCount = 0 then
                              begin
                                 MessageDlg('There must be a least one calf recorded',mtError,[mbOK],0);
                                 Exit;
                              end;
{                           if WinData.TempCalving.RecordCount = 0 then
                              begin
                                 // if they say YES to all dead save the calving
                                 if MessageDLG('Are all Calves ABORTED/DEAD ?',mtConfirmation,[mbYes,mbNo],0 ) = mrYes then
                                    begin
                                       WinData.Events.Post;
                                       WinData.TempCalving.Close;
                                       WinData.TempCalving.EmptyTable;
                                       Close;
                                    end;
                              end
                           else
                              begin}

                              DamID := WinData.AnimalFileByIDID.AsInteger;
                              DamTagNo := WinData.AnimalFileByIDNatIDNum.AsString;
                              LactNo := WinData.AnimalFileByIDLactNo.AsInteger;


                              if (rbAbortion.Visible) and (rbAbortion.Checked) then
                                  WinData.RollbackTagAutoGenNumber;

                              WinData.Events.Post;

                              // AnimalFileByID Record has now shifted from calved dam, use stored vars to ID the animal.
                              if ( LookupComboValue( dblkcomboDamGroupListing ) > 0 ) and ( LookupComboValue( dblkcomboDamGroupListing ) <> DamFeedGroup ) then
                                 WinData.GroupManager.AddToGroup(DamID, dblkcomboDamGroupListing.KeyValue, TRUE, Date, DamTagNo )
                              else if ( dblkcomboDamGroupListing.Text = sRemoveFromGroup ) then
                                 begin
                                    GroupData := WinData.GroupManager.GetGroupData(DamFeedGroup,'ID,Description');
                                    if MessageDlg(Format('Do you want to remove "%s" from feed group "%s"?',[WinData.AnimalFileByIDNatIDNum.AsString, GroupData[1]]),mtConfirmation,[mbYes,mbNo],0) = idYes then
                                       begin
                                          WinData.GroupManager.RemoveAnimalFromGrp(DamID,GroupData[0],False);
                                          WinData.RemoveFromEventLookupData(DamID, cFeedingEvent); // Remove old feed grp to update grid display
                                       end;
                                 end;

                              WinData.TempCalving.Close;
                              WinData.TempCalving.EmptyTable;
                              Close;
                              //end;
                        end;
                        // Suckler Premium Replacement
                        if WinData.UnderRentention then
                           begin
                              WinData.IncDecAnimalsApplied(cIncCows);
                              WinData.IncDecAnimalsApplied(cDecHefs);
                           end;
                        // End Suckler Premium Replacement

                        if CalfAddingOrAmending = Add then
                           begin
                              MenuForm.CheckCalfReg := True;

                              {
                              // SP 07/01/11 - Removed by SP - Replaced by Calving Survey.

                              // 17/02/2009 /SP
                              if Preferences.ValueAsBoolean[cGSCalving_RecordCScore] then
                                 begin
                                    fmConditionScoreEvent.ClassDefaultAssociatedEventType := cCalvingEvent;
                                    fmConditionScoreEvent.ClassDefaultAssociatedEventID := WinData.EventID.AsInteger;
                                    TfmConditionScoreEvent.LoadEvent(WinData.AnimalFileByIDID.AsInteger,0,LactNo+1,
                                    WinData.EventsEventDate.AsDateTime,False,TfmConditionScoreEvent);
                                 end;


                              // 17/02/2009 /SP
                              if Preferences.ValueAsBoolean[cGSCalving_RecordHealth] then
                                 begin
                                    TfmHealthEvent.LoadEvent(WinData.AnimalFileByIDID.AsInteger,0,LactNo+1,
                                      WinData.EventsEventDate.AsDateTime,False,TfmHealthEvent);
                                 end;
                               }
                           end;

                  end
               else
                  // if existing record is being amended
                  begin
                     if ( FCalfNewDOB > 0 ) then
                        begin
                           MessageDlg('A change in the calves date of birth has been detected.'+cCRLF+
                                      'The program will now update the calves record with the new date of birth.',mtWarning,[mbOK],0);
                           WinData.FCalvingDOBChanged := ( FCalfNewDOB > 0 );
                           TempAnimals := TTable.Create(nil);
                           TempAnimals.DatabaseName := AliasName;
                           TempAnimals.TableName := 'Animals';
                           if ( not(TempAnimals.Active) ) then
                              TempAnimals.Open;
                           with WinData.TempCalving do
                              begin
                                 First;
                                 while not(Eof) do
                                    begin
                                       if ( TempAnimals.Locate('NatIDNum',FieldByName('NatID').AsString,[]) ) then
                                          try
                                             TempAnimals.Edit;
                                             TempAnimals.FieldByName('DateOfBirth').AsDateTime := FCalfNewDOB;
                                             TempAnimals.Post;
                                          except
                                             on e : Exception do
                                                ShowMessage(e.Message);
                                          end;
                                       Next;
                                    end;
                              end;
                           TempAnimals.Free;
                        end;
                     if ( WinData.Events.State in dsEditModes ) then
                        WinData.Events.Post;
                     if WinData.Calvings.Locate('EventID',CalvingID,[] ) then
                        begin
                           WinData.Calvings.Edit;
                           // assign values into table from variables
                           if ( WinData.CalvingBirthType > 0 ) then
                              WinData.Calvings.FieldByName('BirthType').AsInteger := WinData.CalvingBirthType;
                           if ( WinData.Mortality > 0 ) then
                              WinData.Calvings.FieldByName('Mortality').AsInteger := WinData.Mortality;
                           if ( WinData.DeadCalves > 0 ) then
                              WinData.Calvings.FieldByName('DeadCalves').AsInteger := WinData.DeadCalves;
                           WinData.Calvings.Post;
                           WinData.KingData.ApplyUpdates([WinData.Calvings]);
                        end;
                  end;
            end
{ this will only work if CALF's DoB is Changed in the animals table
               // recalculate eligibility
               WinData.KingData.Close;
               if WinData.CheckPremiumEligibility then
                  MessageDLG('Premium Eligibility Date ReCalculated',mtInformation,[mbOK],0)
               else
                  MessageDLG('Premium Eligibility Date ReCalculation FAILED',mtInformation,[mbOK],0);
               WinData.OpenAndCheckTables;
}
         else if WinData.InsertCalving then
            begin
               // if new record is being added
               if ( CalfAddingOrAmending in [Add,AddAtSetup] ) then
                  begin
                     // exit the Animal No or National ID if they are in Focus
                     ExitOk := TRUE;
                     if ExitOK then
                        begin
                           // Find First Record
                           WinData.TempCalving.First;
                           if WinData.TempCalving.RecordCount = 0 then
                              begin
                                 WinData.Events.Post;
                                 Close;
                              end;
                              //end;
                        end;
                  end;
            end;
         close;
      end;
end;

procedure TfCalving.SearchForAnimalButtonClick(Sender: TObject);
begin
   SearchButtonClick(Sender, lNo);
   SetSearchField(SearchForAnimal);
end;

procedure TfCalving.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
   SearchAnimalChange(Sender);
   GetAnimalInfo;
   AssignCalfBreed();
end;

procedure TfCalving.BullUsedChange(Sender: TObject);
begin
   SetModifiedFlag;
   GetSireDetails;
   AssignCalfBreed();
end;

procedure TfCalving.CheckAnimal;
begin

    // Test the Animal has a Drying Off Record for this Lactation or
    // the Animal is in Lactation 0
 {  if ( Windata.Events.Locate('AnimalID;AnimalLactNo;EventType',
                      VarArrayOf([WinData.AnimalFileByIDID.Value,
                              WinData.AnimalFileByIDLactNo.Value,
                                           CDryOffEvent]),[])) Or
                    ( UpperCase ( WinData.UserTypeOfHerd ) = 'SUCKLER' ) Or
                    ( WinData.AnimalFileByIDLactNo.Value = 0 ) then
       sbSaveCalvings.Enabled := TRUE
    else if ( CalfAddingOrAmending = Add ) then
       begin
          if ( WinData.GlobalSettings.ICBFRegistered ) and ( WinData.AnimalFileByIDLactNo.Value > 0 )  then
             Messagedlg('This Cow has no Drying Off Record',mtinformation,[mbok],0)
          else
             sbSaveCalvings.Enabled := TRUE;
       end;      }
   // Test the Animal has a Drying Off Record for this Lactation or
   // the Animal is in Lactation 0

   if not ( CalfAddingOrAmending in [Amending, AddAtSetUp] ) then
      begin
         sbSaveCalvings.Enabled := TRUE;
         //   if Animal is "COW" and User is "ICBF Registered" ensure animal has Dry Off Event
         if ( WinData.AnimalFileByIDLactNo.Value > 0 ) then
            begin
               if ( WinData.GlobalSettings.MandatoryBreedingEvents ) or ( WinData.GlobalSettings.MandatoryDryOffEvent ) then
                  if not (WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CDryOffEvent)) then
                     {
                     //   22/11/11 [V5.0 R2.2] /MK Change - Changed This Error To A Yes/No Warning.
                     begin
                        sbSaveCalvings.Enabled := FALSE;
                        Messagedlg ('This Cow has no Drying Off Record',mtinformation,[mbok],0);
                     end;
                     }
                     //   11/12/12 [V5.1 R3.5] /MK Change - Removed this message as message already in MenuForm and uPhoneLinkEventsReview.
                     {
                     if ( Messagedlg('This Cow has no Drying Off record. '+
                                     'Do you want to continue with this Calving?',mtWarning,[mbYes,mbNo],0) = mrNo ) then
                        sbSaveCalvings.Enabled := FALSE;
                     }
            end
      end;
end;

procedure TfCalving.SearchForAnimalExit(Sender: TObject);
begin
   CheckAnimal;
end;
{
Changed HTML from calving.htm to ccalving.htm - MK - 27/05/08
procedure TfCalving.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('ccalving.htm');
end;
}

// Changed Help button to include help pages for GB & NI users - MK - 27/05/08
procedure TfCalving.sbHelpClick(Sender: TObject);
begin
   if ( DefaultCountry = Ireland ) then
      begin
         WinData.HTMLHelp('ccalving.htm');
      end
   else if ( DefaultCountry = NIreland ) then
      begin
         WinData.HTMLHelp('ccalvingni.htm');
      end
   else if ( DefaultCountry = England ) then
      begin
         WinData.HTMLHelp('ccalvinggb.htm');
      end;
end;

procedure TfCalving.seDeadCalvesEnter(Sender: TObject);
begin
   if seDeadCalves.AsInteger > 0 then
      begin
         rxcMortality.Enabled := True;
         lMortality.Enabled   := True;
      end
   else
      begin
         rxcMortality.Enabled := False;
         lMortality.Enabled   := False;
         rxcMortality.ResetField;
      end;
end;

procedure TfCalving.seDeadCalvesExit(Sender: TObject);
begin
   if seDeadCalves.AsInteger > 0 then
      begin
         rxcMortality.Enabled := True;
         lMortality.Enabled   := True;
      end
   else
      begin
         rxcMortality.Enabled := False;
         lMortality.Enabled   := False;
         rxcMortality.ResetField;
      end;
   WinData.DeadCalves := seDeadCalves.AsInteger;
end;

procedure TfCalving.rxcMortalityExit(Sender: TObject);
begin
   WinData.Mortality := StrToInt(rxcMortality.Value);
end;

procedure TfCalving.CalfComponentsOnExit(Sender: TObject);
begin
   // activate calf buttons if values entered
   if (Sender as TDBEdit).Text <> '' then
      begin
         EnableMultipleCalves;
         // Check if Calf has ID assigned.
         // This will happen where calving was deleted and calf details retrieved from animals table.
         if ( WinData.TempCalving.FieldByName('CalfID').AsInteger > 0 ) then
            begin
               if WinData.LastBull > 0 then
                  BullUsed.KeyValue := WinData.LastBull;
            end;
      end;
end;

procedure TfCalving.CheckBreedInterval;
begin
   // check if still birth being recorded
   if stillbirth = False then
      // check difference between last calving date and this one
      // fix for amending calvings only - kr/sp 20/9/00
      if CalfAddingOrAmending = Amending then
         begin
            With GenQuery do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT MAX(E.EventDate)');
                  SQL.Add('FROM Events E');
                  SQL.Add('WHERE E.AnimalID = '+IntToStr(WinData.AnimalFileByIDID.AsInteger)+'');
                  SQL.Add('AND   E.EventDate < "'+FormatDateTime('mm/dd/yyyy',OriginalCalvDate)+'"');
                  SQL.Add('AND   E.EventType = '+IntToStr(cCalvingEvent));
                  Open;
               end;
            LastCalvDate := GenQuery.FieldByName('MAX OF EventDate').AsDateTime;
         end
      else
         begin
            qLastCalf.Close;
            qLastCalf.ParamByName('AID').AsInteger := WinData.AnimalFileByIDID.AsInteger;
            qLastCalf.Open;
            LastCalvDate := qLastCalf.FieldByName('MAX Of EventDate').AsDateTime;
         end;

      if (CalfDOB.Field.AsDateTime - LastCalvDate) < 300 then
         begin
            //raise errormsg.CreateFmt('It is less than 8 months since the last calving!',[nil]);
           { if} messagedlg(Format('It is less than 300 days (%d days), since the last calving!',[Trunc(CalfDOB.Field.AsDateTime - LastCalvDate)]),
//                          'Would you like to record as still birth/abortion?',
                            mtwarning,[mbOK],0); // = mryes then
{               begin
                  WinData.TempCalving.Cancel;
                  // option to save as calving with no live calves
                  CalfNo.Enabled      := False;
                  CalfNatId.Enabled   := False;
                  CalfName.Enabled    := False;
                  CalfSex.Enabled     := False;
                  CalfBreed.Enabled   := False;
                  CalfColour.Enabled  := False;
                  BirthWeight.Enabled := False;
                  bSet.Enabled        := False;
                  Label5.Enabled      := False;
                  Label6.Enabled      := False;
                  Label7.Enabled      := False;
                  Label8.Enabled      := False;
                  Label9.Enabled      := False;
                  Label10.Enabled     := False;
                  Label13.Enabled     := False;
                  Label14.Enabled     := False;
                  damname.enabled     := False;
                  ldamname.enabled    := False;
                  StillBirth := True;
                  calfgrid.SelectedRows.Delete;
               end
            else
               begin
                  // return user to date of birth component
                  CalfDOB.SetFocus;
                  CalfDOB.Refresh;
                  CalfNo.Enabled      := True;
                  CalfNatId.Enabled   := True;
                  CalfName.Enabled    := True;
                  CalfSex.Enabled     := True;
                  CalfBreed.Enabled   := True;
                  CalfColour.Enabled  := True;
                  BirthWeight.Enabled := True;
                  bSet.Enabled        := True;
                  Label5.Enabled      := True;
                  Label6.Enabled      := True;
                  Label7.Enabled      := True;
                  Label8.Enabled      := True;
                  Label9.Enabled      := True;
                  Label10.Enabled     := True;
                  Label13.Enabled     := True;
                  Label14.Enabled     := True;
                  damname.enabled     := True;
                  ldamname.enabled    := True;
                  StillBirth := False;
               end;}
         end
      else
         if (CalfDOB.Field.AsDateTime - qLastCalf.FieldByName('MAX Of EventDate').AsDateTime) < 335 then
            messagedlg(Format('It is less than 11 months (%d days), since the last calving!',[Trunc(CalfDOB.Field.AsDateTime - qLastCalf.FieldByName('MAX Of EventDate').AsDateTime) ]),mtWarning,[mbOk],0);
end;

procedure TfCalving.sbPedNameClick(Sender: TObject);
begin
   if WinData.SystemRegisteredCountry = NIreland then
      TfmHUKINameSerialNoViewer.ShowForm(HUKLogInRequired)
   else
      begin
         // open pedigree name search
          TfPedName.ShowForm(CalfName.Text);
      end;
end;

procedure TfCalving.dbcGenDamChange(Sender: TObject);
begin
   SetModifiedFlag;
   if FormShowing then
      begin
         WinData.DonorDamID := 0;
         if dbcGenDam.Value <> '0' then
            begin
               if MessageDlg('This is only relevant if you''re using Embryo Transfer.'+cCRLF+cCRLF+
                             'Do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idYes then
                  begin
                     // ensure 'dam name' is refreshed
                     if (dbcGenDam.Text <> '') and (dbcGenDam.Text <> '<None>') then
                     //      DamName.Caption := dbcGenDam.Text
                        teDamName.Text := (qGenDam.FieldByName('Name').AsString)//joanne tighe bug fix 6/02/2004
                     else
                        teDamName.Text := WinData.AnimalFileByIDName.AsString;


                     if (dbcGenDam.Text <> '<None>') then
                        WinData.DonorDamID := qGenDam.LookUp('AnimalNo',dbcGenDam.Text,'ID');
                  end
               else
                  begin
                     dbcGenDam.Value := '0';
                  end;
            end;
      end;
   AssignCalfBreed();
end;

procedure TfCalving.CheckReplacement;
begin
   // Suckler Premium Replacement
   // Animal must be a heifer
{
   SP '04 Calvings are no longer used for substitute events.
   WinData.UnderRentention := False;
   if WinData.AnimalFileByIDLactNo.AsInteger = 0 then
      if WinData.IsAnimalUnderRetension(WinData.AnimalFileByIDID.AsInteger,CalfDOB.Date) then
         begin
            // If under retention and the event is saved then decrement the HeifersApplied and Increment the Cows Applied.
            // This is done under the "sbSaveCalvings1Click"
            WinData.UnderRentention := True;
            if WinData.CheckRetentionMsg then // Only stop and show message if Heifers applied is <= to MinHefiers.
               if MessageDlg('You are calving a heifer that is still within retention,'+#13+
                             'You are required to maintain a minimum number of heifers.'+#13+
                             'Do you wish to replace her in the Suckler Cow Application '+DateToStr(WinData.dSuckApplicDate)+' with another heifer?',mtWarning,[mbYes,mbNo],0) = IdYes then
                              uSuckSubstitute.ShowForm(WinData.AnimalFileByIDID.AsInteger,'Calving');
         end;
}
end;

procedure TfCalving.CalfSexChange(Sender: TObject);
begin
   SetModifiedFlag;
   if WinData.TempCalving.State = dsInsert then
      begin
         if CalfSex.Text = 'Female' then
            WinData.TempCalving.FieldByName('Breeding').AsBoolean := True
         else
            begin
               // change suggested by Gerry/P. Cosgrave 29/08/06
               WinData.TempCalving.FieldByName('Breeding').AsBoolean := WinData.GlobalSettings.DefaultMaleBreedingStatus;
               // WinData.TempCalving.FieldByName('Breeding').AsBoolean := False;
            end;
         //WinData.TempCalving.FieldByName('CalfDead').AsBoolean := False;
         EnableMultipleCalves;
         if Def.Definition.dUsePedigree then
            WinData.TempCalving.FieldByName('Pedigree').AsBoolean := True
         else
            WinData.TempCalving.FieldByName('Pedigree').AsBoolean := False;
      end;
end;

procedure TfCalving.BreedingClick(Sender: TObject);
begin
   if WinData.TempCalving.State = dsInsert then
      if (Sender as TDBCheckBox).Checked then
         begin
            if WinData.TempCalving.FieldByName('Sex').AsString = 'Steer' then
               WinData.TempCalving.FieldByName('Breeding').AsBoolean := False
            else
               WinData.TempCalving.FieldByName('Breeding').AsBoolean := True;
         end
      else
         WinData.TempCalving.FieldByName('Breeding').AsBoolean := False;
end;

procedure TfCalving.CalfMortalityCloseUp(Sender: TObject);
begin
//   if WinData.TempCalving.State <> dsInsert then
  //    CalfMortality.KeyValue := CalfMortValue;
end;

procedure TfCalving.CalfMortalityEnter(Sender: TObject);
begin
//   if CalfMortality.KeyValue > 0 then
  //    CalfMortValue := CalfMortality.KeyValue;
end;

procedure TfCalving.CalfSexExit(Sender: TObject);
begin
   CalfSexChange(sender);
end;

procedure TfCalving.CheckBreedingEvents(var MsgStr : String);
var
   i : Byte;
begin
   i := 0;
   MsgStr := '';
   try
      StrToDate(CalfDOB.Text);
   except
      raise Exception.Create('Invalid calving date entered');
   end;

   while ( MsgStr = '' ) and ( I <= 1 ) do
      try
         {SP 04/10/2004}
         qBreedEvents.Close;

         qBreedEvents.SQL.Clear;
         qBreedEvents.SQL.Add('select count(id) CID from events where eventtype in (5, 4, 3, 2, 1) ');
         qBreedEvents.SQL.Add('and ((animalid = :aid) and (animallactno = :elactno)) ');
         qBreedEvents.ParamByName('aid').AsInteger := WinData.AnimalFileByIDID.AsInteger;
         if ( i = 0 ) then
            begin
               // Check Calving Date is after all breeding events in last lactation
               qBreedEvents.SQL.Add('and (eventdate >= :eDate) and (ID <> :EID) ');
               qBreedEvents.ParamByName('eLactNo').AsInteger := WinData.AnimalFileByIDLactNo.AsInteger-1
            end
         else
            // Check Calving Date is before all breeding events in this lactation
            begin
               qBreedEvents.SQL.Add('and (eventdate <= :eDate) and (ID <> :EID) ');
               qBreedEvents.ParamByName('eLactNo').AsInteger := WinData.AnimalFileByIDLactNo.AsInteger;
            end;
         qBreedEvents.ParamByName('eDate').AsDateTime := CalfDOB.Date;
         qBreedEvents.ParamByName('eid').AsInteger := CalfDOB.DataSource.DataSet.FieldByName('ID').AsInteger;
         qBreedEvents.Open;
         try
            qBreedEvents.First;
            if qBreedEvents.FieldByName('CID').AsInteger > 0 then
               begin
                  if ( i = 0 ) then
                     MsgStr := 'Calving Date cannot be before any breeding events in last lactation.'+^j+
                               'Please check calving date is correct'
                  else
                     MsgStr := 'Calving Date cannot be after any breeding events in current lactation'+^j+
                               'Please check calving date is correct';
               end;
         finally
            qBreedEvents.Close;
         end;
         inc(i);
      except
      end;
end;

procedure TfCalving.FormCreate(Sender: TObject);
var
   HerdType : THerdType;
begin
   HUKLogInRequired := True;
   FormShowing := False;
   DefaultCountry := WinData.DefCountry( WinData.AnimalFileByIDHerdID.AsInteger);

   HerdLookup.HerdOwnerData.HerdID := WinData.AnimalFileByIDHerdID.AsInteger;
   HerdLookup.OpenTagStore(WinData.AnimalFileByIDHerdID.AsInteger);

   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbSaveCalvings.Glyph, cBtnImgSave);
   WinData.LoadBtnImage(WinData.Images,sbDeleteCalving.Glyph, cBtnImgDelete);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph, cBtnImgHelp);
   HerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger);
   pMovementCert.Visible := (DefaultCountry = Ireland);

   //   MK 08.05.07 - Program should know IE Prefix of Herd // shane 13/08/07
   //   03/10/11 [V5.0 R1.0] /MK Change - bSet.Visible If Country Is England And Adding.
   bSet.Visible := ( DefaultCountry = England ) and ( CalfAddingOrAmending = Add );

   FAbortedTagGenerated := False;

   CheckAutoGenNatIDNo;

   Pedigree.Visible := Def.Definition.dUsePedigree;

   if (DefaultCountry = Ireland) and (HerdType=htSuckler) then
      begin
         CalfSex.Items.Clear;
         CalfSex.Items.Add('Bull');
         CalfSex.Items.Add('Female');
      end;

   if ( WinData.InsertCalving ) and (CalfAddingOrAmending = AddAtSetup) then
      begin
         Height := 186;
         Width  := 325;
         HorzScrollBar.Visible := False;
         VertScrollBar.Visible := False;
         GroupBox2.Visible := False;
         borderStyle := bsDialog;
         Label15.Visible := False;
         BullUsed.Visible := False;
         Label2.Visible := False;
         Label5.Visible := False;
         ProjCalvingDate.Visible := False;
         ProjCalfType.Visible := False;
         lGenDam.Visible := False;
         dbcGenDam.Visible := False;
         sbHelp.Visible := False;
//         StatusBar.Visible := False;
      end
   else
      begin
         Height := 547;
         Width  := 688;
      end;
   WinData.TempCalvingCalfDead.OnChange := TempCalvingCalfDeadChange;
   WinData.TempCalving.AfterScroll := TempCalvingAfterScroll;

   qGroups.Active := True;
   DamFeedGroup := 0;
   with TQuery.Create(nil) do
     try
        DatabaseName := AliasName;
        SQL.Add('SELECT GroupID');
        SQL.Add('FROM grps, grplinks');
        SQL.Add('WHERE (AnimalID=' + IntToStr(WinData.AnimalFileByIDID.AsInteger) + ')');
        SQL.Add('AND   (GroupType="' + cFeedGroup + '")');
        SQL.Add('AND   (ID=GroupID)');
        Open;
        try
           First;
           DamFeedGroup := FieldByName('GroupID').AsInteger;
           if ( DamFeedGroup > 0 ) then
              begin
                 dblkcomboDamGroupListing.KeyValue := DamFeedGroup;
                 dblkcomboDamGroupListing.DisplayEmpty := sRemoveFromGroup;
              end
           else
              dblkcomboDamGroupListing.DisplayEmpty := '<None>';
        finally
           Close;
        end;
     finally
       Free;
     end;

   // do not allow tab into CalfNo edit if the program
   // auto generates the calf number value.
   CalfNo.TabStop := not Windata.GlobalSettings.NatIDToAnimalNo;

   FCalfNewDOB := 0;
end;

procedure TfCalving.sbDeleteCalvingClick(Sender: TObject);

   { 11/03/2009 [Dev V3.9 R6.6] /SP Program Change - in allowing the Deletion of calving event, check for NewID Events, if they exist shift them down a lactation. }
   procedure ShiftNewIDEvents;
   var
      bFound : Boolean;
      NewIDs : TIntegerArray;
      sNewIDs : string;
   begin
      WinData.CheckEvents.Filter := '';
      WinData.CheckEvents.Filtered := False;
      try
         WinData.CheckEvents.Filter := Format('AnimalID = %d And AnimalLactNo = %d And EventType = %d',[WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByIDLactNo.AsInteger,CNewIDEvent]);
         WinData.CheckEvents.Filtered := True;
         bFound := WinData.CheckEvents.FindFirst;
         while bFound do
            begin
               SetLength(NewIDs, Length(NewIDs)+1);
               NewIDs[Length(NewIDs)-1] := WinData.CheckEvents.FieldByName('ID').AsInteger;
               bFound := WinData.CheckEvents.FindNext;
            end;

         if ( Length(NewIDs)>0 ) then
            begin
               sNewIDs := IntArrayToSQLInString(NewIDs);
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add( InsertUPDATE('Events', ['AnimalLactNo'], ['AnimalLactNo-1']));
                     SQL.Add( InsertWHERE(['ID'], [sNewIDs], opIN));
                     ExecSQL;
                  finally
                     Free;
                  end;
            end;
      finally
         WinData.CheckEvents.Filter := '';
         WinData.CheckEvents.Filtered := False;
      end;
   end;

   procedure FindCalfWeighingEvent ( ACalfID : Integer );
   var
      CalfBirthDate : TDateTime;
      WeighingID : Integer;
      qWeighing : TQuery;
   begin
      if ACalfID <= 0 then Exit;

      qWeighing := TQuery.Create(nil);
      with qWeighing do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT DateOfBirth, BirthWeight FROM Animals');
            SQL.Add('WHERE (ID = :ACalfID)');
            Params[0].AsInteger := ACalfID;
            Open;
            try
               First;
               if ( Fields[0].AsDateTime <= 0 ) or ( Fields[1].AsFloat <=0 ) then Exit;
               CalfBirthDate := Fields[0].AsDateTime;

               SQL.Clear;
               SQL.Add('SELECT ID FROM Events');
               SQL.Add('WHERE (AnimalID = :ACalfID)');
               SQL.Add('AND (EventType = :WeighingEvent)');
               SQL.Add('AND (EventDate = :WeighingDate)');
               Params[0].AsInteger := ACalfID;
               Params[1].AsInteger := CWeightEvent;
               Params[2].AsDateTime := CalfBirthDate;
               Open;
               if ( Fields[0].AsInteger <=0 ) then Exit;
               WeighingID := Fields[0].AsInteger;

               SQL.Clear;
               SQL.Add('DELETE FROM Weights');
               SQL.Add('WHERE EventID = :WeighingID');
               Params[0].AsInteger := WeighingID;
               ExecSQL;

               SQL.Clear;
               SQL.Add('DELETE FROM Events');
               SQL.Add('WHERE ID = :WeighingID');
               Params[0].AsInteger := WeighingID;
               ExecSQL;

            finally
               Close;
            end;
         finally
            Free;
         end;

   end;

var
   DamID : Integer;
   DamLactNo : Integer;
   CalvingsID : Integer;
   CalfArray : Array [1..4] of Integer;
   DeadCalfArray : Array [1..4] of Boolean;
   CalfIDs : string;
   i : Integer;
   FlagEventWarning : Boolean;
begin


   if MessageDlg('You are about to delete this calving event and all associated calves'+cCRLF+
                 'All calf details will be stored for future use.'+cCRLF+cCRLF+
                 'Are you sure you want to continue?', mtConfirmation,[mbYes,mbNo],0) = idNo then Exit;

   WinData.DeletedCalvings.Active := True;

   try
      if not WinData.Events.FieldByName('EventType').AsInteger = cCalvingEvent then
         begin
            MessageDlg('This is not a calving event',mtInformation,[mbOK],0);
            Exit;
         end;

      DamID := WinData.Events.FieldByName('AnimalID').AsInteger;
      if ( DamID <= 0 ) or ( DamID <> WinData.AnimalFileByIDID.AsInteger )  then
         begin
            MessageDlg('Event data is not valid - contact Kingswood',mtError,[mbOK],0);
            Exit;
         end;

      DamLactNo := WinData.AnimalFileByIDLactNo.AsInteger;

      CalvingsID := WinData.Events.FieldByName('ID').AsInteger;
      if ( CalvingsID <= 0 ) then
         begin
            MessageDlg('Invalid EventID - contact Kingswood',mtError,[mbOK],0);
            Exit;
         end;

      if WinData.Calvings.Locate('EventID',WinData.EventID.AsInteger,[] ) then
         begin

            for i := 1 to cMaxCalves do
               if (( WinData.Calvings.FieldByName(Format('ID%d',[i])).AsInteger > 0 ) and ( WinData.Calvings.FieldByName(Format('ID%dNotified',[i])).AsBoolean )) then
                  begin
                     MessageDlg('Unable to delete calving event.'+cCRLF +
                                'The calves cards have already been applied for.',mtWarning,[mbOK],0);
                     Exit;
                  end;

            FillChar(CalfArray, SizeOf(CalfArray), 0);

            CalfArray[1] := WinData.Calvings.FieldByName('ID1').AsInteger;
            CalfArray[2] := WinData.Calvings.FieldByName('ID2').AsInteger;
            CalfArray[3] := WinData.Calvings.FieldByName('ID3').AsInteger;
            CalfArray[4] := WinData.Calvings.FieldByName('ID4').AsInteger;

            for i := Low(CalfArray) to High(CalfArray) do
               if ( CalfArray[i] > 0 ) then
                  begin
                     if CalfIDs <> '' then
                        CalfIDs := CalfIDs + ',' + IntToStr( CalfArray[i] )
                     else
                        CalfIDs := IntToStr( CalfArray[i] );
                  end
               else
                  Break; // no further calves found.

            if ( Length( CalfIDs ) <= 0 ) then
               begin
                  MessageDlg('No calves associated with calving event have been found',mtWarning,[mbOK],0);
                  Exit;
               end;

            with TQuery.Create(nil) do
               try
                  // Update Dam Lactation Info
                  DatabaseName := AliasName;

                  SQL.Clear;
                  SQL.Add('Select Count(ID) CountOfID from Events Where (AnimalID = :AnimalID) And (AnimalLactNo = :ELactNo)');
                  SQL.Add('And (ID <> :EID )'); // dont include the calving event itself
                  SQL.Add('And (EventType <> :NewIDEvent )'); // dont include the calving event itself
                  Params.ParamByName('AnimalID').AsInteger := DamID;
                  Params.ParamByName('ELactNo').AsInteger := DamLactNo;
                  Params.ParamByName('EID').AsInteger := CalvingsID;
                  Params.ParamByName('NewIDEvent').AsInteger := CNewIDEvent;
                  Active := True;
                  try
                     First;
                     FlagEventWarning := ( FieldByName('CountOfID').AsInteger > 0);
                  finally
                     Active := False;
                  end;

                  if FlagEventWarning then
                     begin
                        MessageDlg('All events subsequent to this calving event'+cCRLF+
                                   'must be deleted before continuing.',mtWarning,[mbOK],0);
                        Exit;
                     end;

                  { Clear off any NewID Events Associated with the calf record, these NewID Events
                    are created when animal record is created as part of calving event for
                    ICBF purposes.
                  }

                  SQL.Clear;
                  SQL.Add('Delete From Events Where ( AnimalID = :AnimalID ) And ( EventType = :NewIDEvents ) ');
                  for i := Low(CalfArray) to High(CalfArray) do
                     if ( CalfArray[i] > 0 ) then
                        begin
                           Params.ParamByName('AnimalID').AsInteger := CalfArray[i];
                           Params.ParamByName('NewIDEvents').AsInteger := CNewIDEvent;
                           ExecSQL;
                        end;

                  //    22/03/12 [V5.0 R4.5] /MK Change - New SubProcedure To Delete Weighing Event If Weighing Event Date Is DateOfBirth Date.
                  for i := Low(CalfArray) to High(CalfArray) do
                     if ( CalfArray[i] > 0 ) then
                        begin
                           FindCalfWeighingEvent(CalfArray[i]);
                        end;

                  SQL.Clear;
                  SQL.Add('Select Count(ID) CID from Events Where (AnimalID = :AnimalID) ');
                  for i := Low(CalfArray) to High(CalfArray) do
                     if ( CalfArray[i] > 0 ) then
                        begin
                           Params.ParamByName('AnimalID').AsInteger := CalfArray[i];
                           Active := True;
                           try
                              First;
                              FlagEventWarning := ( FieldByName('CID').AsInteger > 0 );
                           finally
                              Active := False;
                           end;

                      if ( FlagEventWarning ) then
                         begin
                            MessageDlg('All events associated with calve(s) must be deleted before continuing.',mtWarning,[mbOK],0);
                            Exit;
                         end;
                    end;

               if not WinData.KingData.InTransaction then
                  try
                     WinData.Calvings.Close;
                     WinData.Events.Close;
                     try

                        WinData.KingData.StartTransaction;

                        { 11/03/2009 [Dev V3.9 R6.6] /SP Program Change - in allowing the Deletion of calving event, check for NewID Events, if they exist shift them down a lactation. }
                        ShiftNewIDEvents;

                        // Checks are complete, update database
                        SQL.Clear;
                        SQL.Add('Update Animals Set LactNo = LactNo -1 Where ( ID = :DamID ) and ( LactNo > 0 )');
                        Params[0].AsInteger := DamID;
                        ExecSQL;

                        // Delete From Calvings Table
                        SQL.Clear;
                        SQL.Add('Delete From Calvings Where ( EventID = :EID )');
                        Params[0].AsInteger := CalvingsID;
                        ExecSQL;

                        // Delete From Events Table
                        SQL.Clear;
                        SQL.Add('Delete From Events Where ( ID = :EID )');
                        Params[0].AsInteger := CalvingsID;
                        ExecSQL;

                        CalfIDs := '(' + CalfIDs + ')';

                        // Update calves record
                        SQL.Clear;
                        SQL.Add('Update Animals Set DamID = Null, AnimalDeleted="TRUE", HerdID = null');
                        SQL.Add('Where ( ID in ' + CalfIDs + ')  ');
                        ExecSQL;

                        // Create a record in deletedcalvings table!
                        WinData.DeletedCalvings.Append;
                        WinData.DeletedCalvings.FieldByName('EventID').AsInteger := CalvingsID;
                        WinData.DeletedCalvings.FieldByName('DamID').AsInteger := DamID;
                        WinData.DeletedCalvings.FieldByName('DamLactNo').AsInteger := DamLactNo;
                        WinData.DeletedCalvings.FieldByName('CalfID1').AsInteger := CalfArray[1];
                        WinData.DeletedCalvings.FieldByName('CalfID2').AsInteger := CalfArray[2];
                        WinData.DeletedCalvings.FieldByName('CalfID3').AsInteger := CalfArray[3];
                        WinData.DeletedCalvings.FieldByName('CalfID4').AsInteger := CalfArray[4];
                        WinData.DeletedCalvings.FieldByName('DeleteDate').AsDateTime := Date;
                        WinData.DeletedCalvings.Post;

                        WinData.KingData.Commit;
                     except
                       on E : Exception do
                          begin
                             WinData.KingData.Rollback;
                             MessageDlg(E.Message + ' - Deleted has failed',mtError,[mbOK],0);
                          end;
                     end;
                  finally
                     WinData.Calvings.Open;
                     WinData.Events.Open;
                  end;
            finally
               Free;
            end;
      end;
      DeletingCalvingRecord := True;
   finally
     WinData.DeletedCalvings.Active := False;
     Close;
   end
end;

procedure TfCalving.CalfDOBChange(Sender: TObject);
begin
   SetModifiedFlag;
   if ( CalfAddingOrAmending = Amending ) then
      if ( WinData.EventsEventDate.OldValue <> WinData.EventsEventDate.NewValue ) then
         FCalfNewDOB := WinData.EventsEventDate.NewValue;
         {
         MessageDlg('You must change the Date of Birth for the ' + cCRLF +
                    'calves associated with this calving event',mtWarning,[mbOK],0);
         }

end;

procedure TfCalving.FormDestroy(Sender: TObject);
begin
   qGroups.Active := False;
   HerdLookup.OpenTagStore(0);//closes the tag store
   WinData.TempCalvingCalfDead.OnChange := nil;
   WinData.TempCalving.AfterScroll := nil;
   qBullUsed.Close;
   qHistBullsUsed.Close;
end;

procedure TfCalving.TempCalvingCalfDeadChange(Sender: TField);
begin
   //   18/10/11 [V5.0 R1.5] /MK Bug Fix - WinData.RollBackTag Set So For Irish Herds Dead Calf Checked Does Not Roll Back Only On Foetus.
   if ( DefaultCountry = Ireland ) and ( Sender.AsBoolean ) then
      WinData.RollBackTag := True;

   WinData.TempCalvingCalfDeadChange(Sender);
   if Sender.DataSet.State = dsInsert then
      if ( Sender is TBooleanField ) then
          TempCalvingAfterScroll( Sender.Dataset );
end;

procedure TfCalving.TempCalvingAfterScroll(DataSet: TDataSet);
begin
   WinData.TempCalvingAfterScroll(DataSet);
   ToggleCalfLiveDeadControls(DataSet.FieldByName('CalfDead').AsBoolean);
end;

procedure TfCalving.Action1Execute(Sender: TObject);
begin
   SetModifiedFlag;

   if WinData.TempCalving.State in dsEditModes then
      WinData.TempCalving.Post;

   WinData.TempCalving.Append;

   if WinData.Events.State = dsInsert then
      begin
         if WinData.TempCalving.RecordCount = 1 then
            WinData.EventsEventDesc.AsString := 'Calving / Twin'
         else if WinData.TempCalving.RecordCount = 2 then
             WinData.EventsEventDesc.AsString := 'Calving / Triplet'
         else if WinData.TempCalving.RecordCount = 3 then
            WinData.EventsEventDesc.AsString := 'Calving / Quad. Calf'
      end;

      if CalfNo.Field.DataSet.Active then
         case CalfNo.Field.DataSet.RecordCount of
            0 : begin
                   bNewCalf.Caption := 'Twin Calf'; // dataset in insert/edit mode by default.
                end;
            1 : begin
                   bNewCalf.Caption := 'Triplet Calf';
                end;
            2 : begin
                   bNewCalf.Caption := 'Quad. Calf';
                end;
         else
            bNewCalf.Caption := 'Add Calf';
         end;
end;

procedure TfCalving.DoRequiredFieldValidation(const ACountry: TCountry);
var
   TempStr : string;
begin
   WinData.TempCalving.DisableControls;
   try
   WinData.TempCalving.First;
   while NOT WinData.TempCalving.EOF do
      begin
         if ACountry = NIreland then
            begin
               if not ( WinData.TempCalvingCalfDead.AsBoolean ) and ( not WinData.CheckNINatID(WinData.TempCalvingNatID.AsString, TempStr) ) then
                  begin
                     raise ErrorMsg.CreateFmt('Invalid National ID',[WinData.TempCalvingNatID.AsString]);
                  end
               else if WinData.TempCalvingCalfDead.AsBoolean then
                  begin
                     WinData.TempCalving.Edit;
                     WinData.TempCalvingNatID.Clear;
                     WinData.TempCalving.Post;
                  end
            end
         else if ACountry = Ireland then
            begin
               if not CheckNatID(WinData.TempCalvingNatID.AsString, TempStr, False) then
                  begin
                     raise ErrorMsg.CreateFmt('Invalid National ID',[WinData.TempCalvingNatID.AsString]);
                  end;
            end;

         TempStr := WinData.TempCalvingCalfNo.AsString;
         if Length(TempStr) > 0 then
            if ( WinData.LookUpDamSire.Locate('AnimalNo;HerdID', VarArrayOf([TempStr,WinData.TempCalvingHerdID.AsVariant]), [] )) or
              (( WinData.LookUpTempCalving.Locate('CalfNo', TempStr, [] )) And
               ( WinData.TempCalvingID.AsInteger <> WinData.LookUpTempCalving.FieldByName('ID').AsInteger )) then
                raise ErrorMsg.CreateFmt('Animal No. already entered',[nil]);

         if (WinData.TempCalvingBreed.IsNull) or (WinData.TempCalving.FieldByName('Breed').AsInteger = 0) then
            raise ErrorMsg.CreateFmt('You must enter a breed for this animal',[nil]);

         if ACountry = NIreland then
            if WinData.TempCalving.FieldByName('Colour').AsInteger <= 0 then
               raise ErrorMsg.Create('You must enter a colour for this animal');

         WinData.TempCalving.Next;
      end;
   finally
      WinData.TempCalving.First;
      WinData.TempCalving.EnableControls;
   end;
end;

procedure TfCalving.BirthTypeChange(Sender: TObject);
begin
   WinData.CalvingBirthType := BirthType.LookupSource.DataSet.FieldByName('ID').Value;
   SetModifiedFlag;
end;

procedure TfCalving.dblkcomboDamGroupListingChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfCalving.dbCommentChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfCalving.CalfNoChange(Sender: TObject);
begin
   if (Trim(WinData.TempCalvingCalfNo.Value) <> '') then
      EnableMultipleCalves;
   SetModifiedFlag;
end;

procedure TfCalving.CalfNatIdChange(Sender: TObject);
begin
   if (Trim(WinData.TempCalvingNatID.Value) <> '') then
      EnableMultipleCalves;
   SetModifiedFlag;

end;

procedure TfCalving.CalfNameChange(Sender: TObject);
begin
   SetModifiedFlag;
   EnableMultipleCalves;
end;

procedure TfCalving.CalfBreed1Change(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfCalving.CalfColourChange(Sender: TObject);
begin
   SetModifiedFlag;
   EnableMultipleCalves;
end;

procedure TfCalving.dblkcmboCalfGroupListingChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfCalving.CustomerChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfCalving.CalfMortalityChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfCalving.CalfBreedChange(Sender: TObject);
begin
   SetModifiedFlag;
   EnableMultipleCalves;
end;

procedure TfCalving.CalfNatIdEnter(Sender: TObject);
begin
   if (HerdLookup.HerdOwnerData.InputNatIDStyle <> cInputNatIDStyle_ListInput) then
      begin
         if WinData.TempCalvingNatID.EditMask = WinData.DefaultNatIDMaskFromHerdIdentifierMask then
            CalfNatId.SelStart := 12;
      end;
end;

procedure TfCalving.CalfNatIdMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if not( Length(CalfNatID.Text) = 12 ) then
      begin
         if (HerdLookup.HerdOwnerData.InputNatIDStyle <> cInputNatIDStyle_ListInput) then
            begin
               if WinData.TempCalvingNatID.EditMask = WinData.DefaultNatIDMaskFromHerdIdentifierMask then
                  CalfNatId.SelStart := 12;
            end;
      end;
end;

procedure TfCalving.CMDialogKey(var msg: TWMKey);
begin
  If (msg.CharCode = VK_TAB) Then
     begin
        // process event
     end;
  inherited;
end;

procedure TfCalving.btnAutoGenerateNatIDNoClick(Sender: TObject);
//var
  // bTurnedOff : Boolean;
begin
   {bTurnedOff := (HerdLookup.HerdOwnerData.InputNatIDStyle<>cInputNatIDStyle_AutoGenInput);
   TfmGlobalSettings.ShowPreferences(ListEntryED, 'Calving');
   CheckAutoGenNatIDNo;
   if ((bTurnedOff) and (HerdLookup.HerdOwnerData.InputNatIDStyle=cInputNatIDStyle_AutoGenInput)) then
      begin
         MessageDlg('The calf National Id. No. will be generated at next calving event.'+cCRLF+
                    'If you want to use this facility immediately please exit '+cCRLF+
                    'without saving and re-enter the calving screen.',mtInformation,[mbOK],0);
      end;}
end;

procedure TfCalving.CheckAutoGenNatIDNo;
begin
   HerdLookup.HerdOwnerData.HerdID := WinData.AnimalFileByIDHerdID.AsInteger;
   if HerdLookup.HerdOwnerData.InputNatIDStyle <> 0 then
      HyperLinkEdit.Text := HerdLookup.InputStyleAsString(HerdLookup.HerdOwnerData.InputNatIDStyle)
   else
      HyperLinkEdit.Text := 'Manual Input'

{
   if (HerdLookup.HerdOwnerData.InputNatIDStyle=cInputNatIDStyle_AutoGenInput) then
      begin
         btnAutoGenerateNatIDNo.Caption := 'Turn Off';
      //   btnAutoGenerateNatIDNo.Font.Color := clRed;
      end
   else
      begin
         btnAutoGenerateNatIDNo.Caption := 'Turn On';
     //    btnAutoGenerateNatIDNo.Font.Color := clBlack;
      end;
   }
end;

procedure TfCalving.cxDBLookupComboBox1PropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfCalving.CalfDeadPropertiesChange(Sender: TObject);
var
   id : INTEGER;
begin

   SetModifiedFlag;
   ToggleCalfLiveDeadControls(CalfDead.Checked);
{
   if ( WinData.TempCalving.State in dsEditModes ) then
      begin
         if ( DefaultCountry = NIreland ) then
            begin
               WinData.DeadCalfNatIDValue := WinData.AnimalFileByIDNatIDNum.AsString;
               WinData.DeadCalfNatIDValue := StripAllNomNumAlpha(WinData.DeadCalfNatIDValue);
               if Copy(WinData.DeadCalfNatIDValue, 1,3) = 'UK9' then
                  Delete(WinData.DeadCalfNatIDValue,1,3)
               else if Copy(WinData.DeadCalfNatIDValue, 1,2) = 'IE' then
                  Delete(WinData.DeadCalfNatIDValue,1,2);

               WinData.DeadCalfNatIDValue := WinData.DeadCalfNatIDValue + FormatDateTime('mm',Date) + FormatDateTime('yy',Date) + IntToStr(WinData.TempCalving.RecordCount+1);
               if Length(WinData.DeadCalfNatIDValue) > 16 then
                  begin
                     // Truncate the string to length 16
                     WinData.DeadCalfNatIDValue := Copy(WinData.DeadCalfNatIDValue, Length(WinData.DeadCalfNatIDValue)-15, Length(WinData.DeadCalfNatIDValue));
                  end;

               WinData.DeadCalfNatIDValue := 'DEAD'+WinData.DeadCalfNatIDValue;

               if not(VarIsNull(CalfDead.EditValue)) then
                  begin
                     if CalfDead.EditValue = True then
                        begin
                           //if (Trim(WinData.TempCalvingNatID.AsString) = '') then
                           try
                              WinData.TempCalvingNatID.AsString := WinData.DeadCalfNatIDValue;
                              if WinData.TempCalvingCalfNo.AsString <> '' then
                                 WinData.TempCalvingCalfNo.AsString := '';
                           except
                              on e : exception do
                                 begin
                                    if e.Message <> 'National ID already entered' then
                                       raise Exception.Create(E.Message)
                                    else
                                       begin
                                          MessageDlg(Format('The auto generated Calf National Id. No. "%s" is already in use.'+cCRLFx2+
                                                            'You must enter a value for the Calf National Id. No.',[WinData.DeadCalfNatIDValue]),mtWarning,[mbOK],0);
                                          WinData.TempCalvingNatID.AsString := '';
                                       end;
                                 end;
                           end;
                        end
                     else
                        begin
                           if (WinData.TempCalvingNatID.AsString = WinData.DeadCalfNatIDValue) then
                              WinData.TempCalvingNatID.Clear;
                        end;
                  end;
            end

         else
}
            //   19/02/15 [V5.4 R2.6] /MK Bug Fix - Only move to rbFullTerm if Inserting record - rbFullTermClick is also inserting a record.
            if ( WinData.TempCalving.State = dsInsert ) then
               //   30/01/12 [V5.0 R3.6] /MK Bug Fix - Do Not Set rbFullTerm Or rbAbortion On CalfDeadChange If PDAEvent Calving.
               if ( DefaultCountry = Ireland ) and ( not(WinData.ActivePDAEvents) ) then
                  rbFullTerm.Checked := (CalfDead.EditValue = True);
{
         if CalfDead.Checked then
            begin
               case WinData.TempCalving.RecordCount of
                  0 : if ( WinData.CalfDeathCustomers^.ID1 <= 0 ) then GetCustomer(WinData.CalfDeathCustomers^.ID1);
                  1 : if ( WinData.CalfDeathCustomers^.ID2 <= 0 ) then GetCustomer(WinData.CalfDeathCustomers^.ID2);
                  2 : if ( WinData.CalfDeathCustomers^.ID3 <= 0 ) then GetCustomer(WinData.CalfDeathCustomers^.ID3);
                  3 : if ( WinData.CalfDeathCustomers^.ID4 <= 0 ) then GetCustomer(WinData.CalfDeathCustomers^.ID4);
               end;
               CalfMortality.Enabled := (Sender as TDBCheckBox).Checked; //SP
               try
                  CalfMortality.SetFocus;
               except

               end;
            end
         else
            begin
               case WinData.TempCalving.RecordCount of
                  0 : WinData.CalfDeathCustomers^.ID1 := 0;
                  1 : WinData.CalfDeathCustomers^.ID2 := 0;
                  2 : WinData.CalfDeathCustomers^.ID3 := 0;
                  3 : WinData.CalfDeathCustomers^.ID4 := 0;
               end;
               CalfMortality.Enabled := (Sender as TDBCheckBox).Checked; //SP
               try
                  Breeding.SetFocus;
               except

               end;
            end;

      end;
}

end;

procedure TfCalving.EnableMultipleCalves;
begin
   if CalfAddingOrAmending = Add then
      begin
         bNewCalf.Enabled    := True;
         bCancelCalf.Enabled := True;
         bRemoveCalf.Enabled := True;
      end
   else
      begin
         bNewCalf.Enabled    := False;
         bCancelCalf.Enabled := False;
         bRemoveCalf.Enabled := False;
      end;
end;

procedure TfCalving.cmboNatIDNumPropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
   HerdLookup.HerdOwnerData.HerdID := WinData.AnimalFileByIDHerdID.AsInteger;
   if (HerdLookup.HerdOwnerData.InputNatIDStyle = cInputNatIDStyle_ListInput) then
      begin
         if ( (Trim(cmboNatIDNum.Text)='') and ( WinData.TempCalving.State in dsEditModes ) and (not (WinData.TempCalvingCalfDead.AsBoolean) )) then
            begin
               WinData.TempCalvingNatID.AsString := WinData.GetNatIDNumHerdIdentifier(WinData.AnimalFileByIDHerdID.AsInteger) + ' ';
               cmboNatIDNum.SelStart := Length(WinData.TempCalvingNatID.AsString) + 1;
            end;
      end;
end;

procedure TfCalving.cmboNatIDNumPropertiesEditValueChanged(
  Sender: TObject);
begin
   if not (VarIsNull(cmboNatIDNum.EditValue)) then
      EnableMultipleCalves;
end;

procedure TfCalving.HyperLinkEditClick(Sender: TObject);
var
   OldInputStyle : Integer;
begin
   HerdLookup.HerdOwnerData.HerdID := WinData.AnimalFileByIDHerdID.AsInteger;
   OldInputStyle := (HerdLookup.HerdOwnerData.InputNatIDStyle);
   TfmGlobalSettings.ShowPreferences(ListEntryED, 'Calving');
   CheckAutoGenNatIDNo;
   if ((OldInputStyle=cInputNatIDStyle_ManualInput) and (HerdLookup.HerdOwnerData.InputNatIDStyle<>cInputNatIDStyle_AutoGenInput)) then
      begin
         MessageDlg('The calf National Id. No. option will take effect at next calving event.'+cCRLF+
                    'If you want to use this facility immediately please exit '+cCRLF+
                    'without saving and re-enter the calving screen.',mtInformation,[mbOK],0);
      end;
end;

procedure TfCalving.Label4Click(Sender: TObject);
begin
  // dbcbComplianceCert.Checked := not (dbcbComplianceCert.Checked);
end;

procedure TfCalving.ToggleCalfLiveDeadControls(const ACalfDead: Boolean);
begin
   Label7.Visible := True;

   pLiveCalfDetails.Visible := not ACalfDead;
   pDeadCalfDetails.Visible := ACalfDead;


   cmboNatIDNum.Visible := ( ( HerdLookup.HerdOwnerData.InputNatIDStyle = cInputNatIDStyle_ListInput) and
                             ( ( not ACalfDead ) or ( WinData.FullTermCalving ) )
                            );

   CalfNatId.Visible := not cmboNatIDNum.Visible;

//   CalfNatId.Visible := (ACalfDead) or (HerdLookup.HerdOwnerData.InputNatIDStyle <> cInputNatIDStyle_ListInput) and (WinData.FullTermCalving);
   if ( WinData.Events.State = dsInsert ) then
      begin
         rbFullTerm.Visible := ( ACalfDead ) and (DefaultCountry = Ireland);
         rbAbortion.Visible := rbFullTerm.Visible;
      end;
end;

procedure TfCalving.rbAbortionClick(Sender: TObject);
begin
   if ( WinData.Events.State = dsInsert ) and ( rbAbortion.Visible ) then
      begin
         FAbortedTagGenerated := True;
         rbFullTerm.Checked := False;
         WinData.FullTermCalving := False;
         //WinData.RollbackTagAutoGenNumber;
         WinData.TempCalvingNatID.EditMask := '';
         WinData.TempCalvingNatID.AsString := WinData.CreateAbortedTag(WinData.AnimalFileByIDNatIDNum.AsString);
         ShowCalfEntryFields();
      end;
end;

procedure TfCalving.rbFullTermClick(Sender: TObject);
var
   CalfBreed : Integer;
begin
   if ( WinData.Events.State = dsInsert ) and ( rbFullTerm.Visible ) then
      begin
         rbAbortion.Checked := False;
         WinData.FullTermCalving := True;

         if ( FAbortedTagGenerated ) then
            begin
               FAbortedTagGenerated := False;
               CalfBreed := WinData.TempCalvingBreed.AsInteger;
               WinData.TempCalving.Cancel;
               WinData.TempCalving.Append;
               WinData.TempCalvingCalfDead.AsBoolean := True;
               WinData.TempCalvingBreed.AsInteger := CalfBreed;
            end;

         ShowCalfEntryFields(True);
//         if WinData.TempCalvingNatID.EditMask = WinData.DefaultNatIDMaskFromHerdIdentifierMask then
         CalfNatId.SetFocus;
      end;
end;
    {
procedure TfCalving.HideAllAbortionFields;
begin
      Label7.Visible := False;
      CalfNatId.Visible := False;
      cmboNatIDNum.Visible := False;
      lFBJumboNo.Visible := False;
      CalfNo.Visible := False;
      Label10.Visible := False;
      CalfSex.Visible := False;
      WinData.TempCalvingSex.AsString := 'Female';
      Label9.Visible := False;
      CalfBreed.Visible := False;
      Label6.Visible := False;
      CalfColour.Visible := False;
      Label8.Visible := False;
      CalfName.Visible := False;
      sbPedName.Visible := False;
      Label4.Visible := False;
      Label11.Visible := False;
      lComplianceCertInstruction.Visible := False;
      pMovementCert.Visible := False;
      Label1.Visible := False;
      HyperLinkEdit.Visible := False;
      bNewCalf.Visible := False;
      bCancelCalf.Visible := False;
      bRemoveCalf.Visible := False;
      CalfGrid.Visible := False;
end;

procedure TfCalving.ShowAllFullTermFields;
begin
      Label7.Visible := True;
      CalfNatId.Visible := True;
      cmboNatIDNum.Visible := True;
      lFBJumboNo.Visible := True;
      CalfNo.Visible := True;
      Label10.Visible := True;
      CalfSex.Visible := True;
      Label9.Visible := True;
      CalfBreed.Visible := True;
      Label6.Visible := True;
      CalfColour.Visible := True;
      Label8.Visible := True;
      CalfName.Visible := True;
      sbPedName.Visible := True;
      Label4.Visible := True;
      Label11.Visible := True;
      lComplianceCertInstruction.Visible := True;
      pMovementCert.Visible := True;
      Label1.Visible := True;
      HyperLinkEdit.Visible := True;
      bNewCalf.Visible := True;
      bCancelCalf.Visible := True;
      bRemoveCalf.Visible := True;
      CalfGrid.Visible := True;
end;
    }
procedure TfCalving.ShowCalfEntryFields(const AShow: Boolean);
begin
   Label7.Visible := AShow;
   CalfNatId.Visible := AShow;

   if AShow then
      cmboNatIDNum.Visible := ((HerdLookup.HerdOwnerData.InputNatIDStyle = cInputNatIDStyle_ListInput) and ( not rbAbortion.Checked ))

   else
      cmboNatIDNum.Visible := False;

   lFBJumboNo.Visible := AShow;
   CalfNo.Visible := AShow;
   Label10.Visible := AShow;
   CalfSex.Visible := AShow;
   Label9.Visible := AShow;
   CalfBreed.Visible := AShow;
   Label6.Visible := AShow;
   CalfColour.Visible := AShow;
   Label8.Visible := AShow;
   CalfName.Visible := AShow;
   sbPedName.Visible := AShow;
   Label4.Visible := AShow;
   Label11.Visible := AShow;
   lComplianceCertInstruction.Visible := AShow;
   pMovementCert.Visible := AShow;
   Label1.Visible := AShow;
   HyperLinkEdit.Visible := AShow;
   bNewCalf.Visible := AShow;
   bCancelCalf.Visible := AShow;
   bRemoveCalf.Visible := AShow;
   CalfGrid.Visible := AShow;
   {if AShow then
      begin
         if ( WinData.TempCalving.State in dsEditModes ) then
            WinData.TempCalvingSex.AsString := 'Female';

         if ( WinData.TempCalving.State in dsEditModes ) then
            WinData.TempCalvingBreed.AsInteger := WinData.AnimalFileByIDPrimaryBreed.AsInteger;
      end;}
end;

procedure TfCalving.sbCalvingOptionsClick(Sender: TObject);
begin
   TfmGlobalSettings.ShowPreferences(ListEntryED, 'Calving');
end;

procedure TfCalving.PedigreeClick(Sender: TObject);
begin
   if WinData.TempCalving.State = dsInsert then
      if (Sender as TDBCheckBox).Checked then
         begin
            WinData.TempCalving.FieldByName('Pedigree').AsBoolean := True;
         end
      else
         WinData.TempCalving.FieldByName('Pedigree').AsBoolean := False;
end;

//   09/02/12 [V5.0 R3.7] /MK Additional Feature - New Button To Query Calving Survey Events To Allow An Edit. 
procedure TfCalving.btnCalvingSurveyClick(Sender: TObject);
var
  CalvingSurvey : TCalvingSurvey;
  AnimalID,
  LactNo,
  EventID : Integer;
begin
   AnimalID := WinData.AnimalFileByIDID.AsInteger;
   LactNo := WinData.AnimalFileByIDLactNo.AsInteger;
   EventID := WinData.Calvings.FieldByName('EventID').AsInteger;

   CalvingSurvey := WinData.GetCalvingSurvey(AnimalID,LactNo,EventID);
   TfmCalvingSurveyForm.ShowSurvey(CalvingSurvey);
   WinData.SaveCalvingSurvey(CalvingSurvey);
end;

procedure TfCalving.AssignCalfBreed;
var
   DamBreedId : Integer;
   CalfBreedId : Integer;
begin
   if not (Windata.TempCalving.State in dsEditModes) then Exit;

   // 02/08/2013 - SP - Assign calf breed.
   if (WinData.CalvingSireBreedId <= 0) then
      WinData.TempCalving.FieldByName('Breed').Clear
   else
      begin
         DamBreedId := WinData.AnimalFileByIDPrimaryBreed.AsInteger;
         if (WinData.DonorDamId>0) then
            try
               DamBreedId := kDbRoutines.GetAnimalInfo(WinData.DonorDamId, 'PrimaryBreed');
            except
               DamBreedId := 0;
            end;

         CalfBreedId := WinData.CalcAnimalBreed(WinData.CalvingSireBreedId, DamBreedId);
         if (CalfBreedId>0) then
            WinData.TempCalving.FieldByName('Breed').AsInteger := CalfBreedId
         else
            WinData.TempCalving.FieldByName('Breed').Clear;
      end;

   // 02/08/2013 - At this point we should iterate calves in tempCalvings and assign the new breed.
   // But it has been decided by GL/SP to leave other calves breed as is because of possible complications
   // updating the other records in the TempCalving table.
end;

end.
