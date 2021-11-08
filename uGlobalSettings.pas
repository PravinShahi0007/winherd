{
  03/02/2009 [Dev V3.8 R 5.9 ] /SP : Program Change - Create new preference "Use New Report Layout Style"

  10/08/11 [V5.0 R0.0] /MK Additional Feature - Added New IAD Crush Tick Box To General/System.

  05/09/11 [V5.0 R0.5] /MK Additional Feature - Default New Report Screen Layout For Everybody.
                                              - Remove Option For Enabling New Report Screen.

  25/10/11 [V5.0 R1.6] /MK Change - New Function To GetHerdType.
                                  - If GetHerdType = htDairy Then cbCrush.Caption = Parlour Events.
                                  - If GetHerdType = htBeef Then cbCrush.Caption = Crush.
                                  - cbCrush.Visible := GetHerdType In [htDairy, htBeef].

  01/11/11 [V5.0 R1.7] /MK Change - If Def.Defintion.dUseCrush Then cbCrush.Visible.

  25/05/12 [V5.0 R7.0] /MK Additional Feature - New Preference To Show Beef Purchase Option On Main Grid.

  30/10/12 [V5.1 R3.1] /MK Change - Changed caption New Version ListItem to Startup Reminders.
                                  - Added StartupReminder checkboxes to NewVersion GroupBox.

  06/03/13 [V5.1 R4.9] /MK Change - Moved cbUseNatIDAnimalNo from General table to Event Defaults/Calvings.

  08/05/13 [V5.1 R7.1] /MK Additional Feature - New TabSheets added to Event Defaults - Mart Files & Temp Move.
                                              - WinData.GlobalSettings saved by ReviewMartFile and BlockTempMovement check boxes.

  20/06/13 [V5.1 R7.5] /MK Additional Feature - New checkbox in Mart Files to store whether Mart Supplier is saved as Purchase Comment.

  23/07/14 [V5.3 R4.0] /MK Change - Removed PhoneLink from ListBox1 and changed tags appropriately for remaining items.  

  05/08/14 [V5.3 R4.2] /MK Bug Fix - cbDisplayAnimalCommentsPropertiesChange - No need for restart message as changes apply with restart - GL request.

  02/06/15 [V5.4 R7.0] /MK Additional Feature - Added preferences for showing the group, comment and birth weight controls in the new Calvings screen - GL request.

  15/12/15 [V5.5 R1.9] /MK Additional Feature - New checkbox in Startup Reminders panel to store whether to show the Gmail Inbox reminder in uStartupReminders.

  08/09/16 [V5.6 R0.0] /MK Additional Feature - Add changes for ShowCalfColour which allows Irish herds to show the calf colour box.

  24/04/17 [V5.6 R8.0] /MK Change - Don't show Calf National ID Generation Grid if screen opens from within the Calving event screen.
                                    This also applies to Use Part NatID as Animal No and Default Sex To - GL/SP both suggested this after GL's request for
                                    the Next Calf Nat ID in the Calf National ID Generation Grid should be the calf that your on would take too long to do.

  25/09/17 [V5.7 R3.1] /MK Additional Feature - Made Email Settings ListBox1 item available for NIreland herds.

  15/12/17 [V5.7 R6.3] /MK Additional Feature - Added changes for cGSUseLastRecordWeightAsLiveWeightForKillOut preference.

  27/09/18 [V5.8 R3.0] /MK Additional Feature - New CheckBox in General Preferences/System screen for Dealer.
                                              - This is based on the registry entry cGSDisplayDealerMainScr which is defaulted from Def.Definition.dUseDealer.

  08/10/18 [V5.8 R3.0] /MK Bug Fix - Only show cbEnableBeefGroupPurchases if user has Crush module.

  09/10/18 [V5.8 R3.0] /MK Additional Feature - New CheckBox in Events/Mart Files for Update Mart Weight With Crush Weight.
                                              - This is based on the registry entry cGSUpdateMartWeightWithCrushWeight which is defaulted from Def.Defintion.dUseCrush.                                              

  04/12/18 [V5.8 R5.7] /MK Change - Changed cbDisplayMovementFeedColsinGridView from "Display Movement/Feed Group columns in grid view" to
                                    "Display Movement columns in grid view" as Feed and Batch groups are always showing now - Shane Maxwell request for filtering.

  03/01/19 [V5.8 R5.9] /MK Change - Removed the "Auto download mail attachments" preference - Links menu now based on existence of mailbox.config file - GL/SP request.

  06/03/19 [V5.8 R8.0] /MK Change - CheckValidNationalIDPart - Changed message text to indicate to the user that the number they are entering is less
                                                               then the expected NextNatID number - Hugh Collender.

  21/03/19 [V5.8 R8.3] /MK Change - NatIDEntryStyleGridDBTableViewEditValueChanged - Only change to Edit mode if not in edit mode, don't stop the clear of the NextNatID field.
                                                                                   - If country is Ireland then autoset NextNatID to the NextNatID without user having to think of it.
                                                                                     For NI users do as we have always done because NextNatID for NI check is more intricate.

  14/10/19 [V5.9 R0.9] /MK Additional Feature - Created a new preference under Events/Sales/Deaths for Remove Transponder Number After Sale only for Parlour users - John Wynne.

  21/08/20 [V5.9 R5.5] /MK Additional Feature - Added new preference "Use purchase weight as live weight for Kill out".

  08/07/21 [V6.0 R1.6] /MK Additional Feature - Added new Startup Reminder check boxes for ICBFRegReminder and AIMHerdRecReminder.
                                              - FormCreate - Set new ICBFRegReminder and AIMHerdRecReminder checkboxes by their GlobalSetting variables.
                                                           - New ICBFRegReminder and AIMHerdRecReminder checkboxes only visible for Irish customers.
                                              - o - Set new GlobalSetting ICBFRegReminder and AIMHerdRecReminder variables by their checkboxes.             
}

unit uGlobalSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrlsEh, ComCtrls, ExtCtrls, cxPC, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, cxCheckBox,
  GenTypesConst, kRoutines, cxMemo, cxHyperLinkEdit, cxRichEdit, cxButtons,
  cxSpinEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, db, cxGroupBox, cxHint,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, uHerdLookup, DBTables,
  KActionList;

const
   ListEntryGEN  = 'General';
   ListEntrySR   = 'Startup Reminders';
   //ListEntryPL   = 'PhoneLink';
   ListEntryBAK  = 'Backup';
   ListEntrySEC  = 'Security';
   ListEntryPAAL = 'Pro-Active Action Lists';
   ListEntryED   = 'Event Defaults';
   ListEntryAWR  = 'Action\Warnings\Reminders';
   ListEntryGRD  = 'Animal Grid Display';
   ListEntryEML  = 'Email Settings';

type
  TfmGlobalSettings = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    cbNewVersionReminder: TcxCheckBox;
    cbNewVersionFieldsReps: TcxCheckBox;
    GroupBox3: TGroupBox;
    cbPhoneLinkAtStartup: TcxCheckBox;
    GroupBox4: TGroupBox;
    cbBackupTest: TcxCheckBox;
    cbArchive: TcxCheckBox;
    cbSpanDisks: TcxCheckBox;
    cbNewVersionStartup: TcxCheckBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Pass: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ConfirmPass: TEdit;
    Label3: TLabel;
    Save: TButton;
    Disable: TButton;
    Label5: TLabel;
    Label6: TLabel;
    ConnectMode: TComboBox;
    COM: TComboBox;
    cbBackupStoreRegFiles: TcxCheckBox;
    cbBackupStorePedigreeImages: TcxCheckBox;
    GroupBox7: TGroupBox;
    pcEventDefaults: TcxPageControl;
    tsBulling: TcxTabSheet;
    tsService: TcxTabSheet;
    tsPregDiag: TcxTabSheet;
    tsDryOff: TcxTabSheet;
    tsCalving: TcxTabSheet;
    tsHealth: TcxTabSheet;
    cmbDefaultHealthComment: TcxComboBox;
    Label8: TLabel;
    tsSaleDeaths: TcxTabSheet;
    cbExitAfterSale: TcxCheckBox;
    Label7: TLabel;
    cbReNumAnimal: TcxCheckBox;
    cbReNumFormat: TComboBox;
    tsWeighings: TcxTabSheet;
    cbWeighingMoveAnimalFocus: TcxCheckBox;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cbCalfReg: TcxCheckBox;
    cbSaveAnother: TcxCheckBox;
    cbBlade: TcxCheckBox;
    cbMandatoryEvents: TcxCheckBox;
    cbEnforceDryOff: TcxCheckBox;
    cbAllowDuplicateTags: TcxCheckBox;
    cbBullsBreeding: TcxCheckBox;
    cbUseIEPrefixForNatIDSearch: TcxCheckBox;
    cbDaysKeptOnFarmWarning: TcxCheckBox;
    cbTBTestDateWarning: TcxCheckBox;
    cbBruceTestDateWarning: TcxCheckBox;
    cxLabel3: TcxLabel;
    seMinimumDaysKeptOnFarm: TcxSpinEdit;
    tsSystem: TcxTabSheet;
    cbUseBarCodeScanner: TcxCheckBox;
    cbDisplayGettingStarted: TcxCheckBox;
    cbDisplayAnimalComments: TcxCheckBox;
    gbAnimalGridSettings: TGroupBox;
    cxLabel2: TcxLabel;
    cmboAnimalGridSireField: TcxComboBox;
    cxButton1: TcxButton;
    Label4: TLabel;
    cmbDefaultMaleSex: TcxComboBox;
    cbDisplayMovementFeedColsinGridView: TcxCheckBox;
    GroupBox8: TGroupBox;
    btnDefaultEmailClient: TcxButton;
    cbAnimalGridHideSearchBar: TcxCheckBox;
    cbRecordCDAfterService: TcxCheckBox;
    cbRecordCDAfterCalving: TcxCheckBox;
    gbCalfNatIDEntry: TcxGroupBox;
    NatIDEntryStyleGrid: TcxGrid;
    NatIDEntryStyleGridDBTableView: TcxGridDBTableView;
    NatIDEntryStyleGridDBTableViewHerdIdentity: TcxGridDBColumn;
    NatIDEntryStyleGridDBTableViewNatIDNumEntryStyle: TcxGridDBColumn;
    NatIDEntryStyleGridDBTableViewNatIDLeadZero: TcxGridDBColumn;
    NatIDEntryStyleGridDBTableViewNextNatID: TcxGridDBColumn;
    NatIDEntryStyleGridLevel: TcxGridLevel;
    cbRecordHealthAfterService: TcxCheckBox;
    cbRecordHealthAfterCalving: TcxCheckBox;
    lDefaultHealthCode: TLabel;
    cmboICBFHealthCode: TcxLookupComboBox;
    cbAutoCompletePDACalving: TcxCheckBox;
    cbBulkTankMaualEdit: TcxCheckBox;
    cbCrush: TcxCheckBox;
    cbEnableBeefGroupPurchases: TcxCheckBox;
    cbBackup: TcxCheckBox;
    cbProActiveActionList: TcxCheckBox;
    cbActionWarningReminders: TcxCheckBox;
    cbHerdVaccination: TcxCheckBox;
    cbUseNatIDAnimalNo: TcxCheckBox;
    tsMartFiles: TcxTabSheet;
    cbReviewMartFiles: TcxCheckBox;
    tsTempMove: TcxTabSheet;
    cbBlockTempMovements: TcxCheckBox;
    cbSaveCommentAsSourceName: TcxCheckBox;
    cbShowCalvingGroupControls: TcxCheckBox;
    cbShowCalvingCommentControl: TcxCheckBox;
    cbShowCalvingBirthWeightControls: TcxCheckBox;
    cbGmailEmailDownloadReminder: TcxCheckBox;
    cbShowCalfColour: TcxCheckBox;
    cbDisplayTagIdentifierSelector: TcxCheckBox;
    cbDefaultSexOfCalf: TcxCheckBox;
    cmboDefaultCalfSex: TcxComboBox;
    cbUseLastWeighingAsLiveWeight: TcxCheckBox;
    cbDealer: TcxCheckBox;
    cbUpdateMartWeightWithCrushWeight: TcxCheckBox;
    cbRemoveTransponderAfterSale: TcxCheckBox;
    cbUsePurchaseWeightAsLiveWeight: TcxCheckBox;
    cbICBFRegReminder: TcxCheckBox;
    cbAIMHerdRecReminder: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure o(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1Click(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure ConfirmPassChange(Sender: TObject);
    procedure DisableClick(Sender: TObject);
    procedure cbReNumAnimalClick(Sender: TObject);
    procedure cmboAnimalGridSireFieldPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cbDaysKeptOnFarmWarningPropertiesChange(Sender: TObject);
    procedure NatIDEntryStyleGridDBTableViewEditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure cbDisplayAnimalCommentsPropertiesChange(Sender: TObject);
    procedure cbDisplayMovementFeedColsinGridViewPropertiesChange(
      Sender: TObject);
    procedure btnDefaultEmailClientClick(Sender: TObject);
    procedure ListBox1MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure cbRecordHealthAfterCalvingPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbAutoCompletePDACalvingPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbActionWarningRemindersPropertiesChange(Sender: TObject);
    procedure cbHerdVaccinationPropertiesChange(Sender: TObject);
    procedure cbProActiveActionListPropertiesChange(Sender: TObject);
    procedure cbGmailEmailDownloadReminderPropertiesChange(
      Sender: TObject);
    procedure cbDefaultSexOfCalfPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    RegCountry : TCountry;
    FormShowing : Boolean;
    ActionList : TKActionList;
    FFromCalving : Boolean;
    procedure SetGroupBox(pTag : Integer);
    function CurrentPageControl(AScreen : string) : TcxPageControl;
    procedure CheckValidNationalIDPart;
    function GetHerdType : THerdType;
    procedure LoadStartupReminders;
  public
    { Public declarations }
    class procedure ShowPreferences(AScreen : string; ATab : string = ''; const AFromCalving : Boolean = False);
  end;

const
   cChangeAfterRestart = 'This change will take effect when the program restarts.';

var
  fmGlobalSettings: TfmGlobalSettings;


implementation
uses
   DairyData, MenuUnit, Def, uActionReminderDefaults,
   ClearHerdPassword, uActionWarningReminderParams, uHerdSetUp,
   uGridColourSelection, uMailBoxHelper, uEmailClient,
   uPreferences;

{$R *.DFM}

procedure TfmGlobalSettings.FormCreate(Sender: TObject);
var
   nComNum, nConnectMode : Byte;
   sDefaultCalfSex,
   ReNumberFormat : String;
   i : SmallInt;
begin
   ActionList := TKActionList.Create;

   FormShowing := False;
   ListBox1.Clear;
   ListBox1.Items.Add(ListEntryGEN);
   ListBox1.Items.Add(ListEntrySR);
   ListBox1.Items.Add(ListEntryBAK);
   ListBox1.Items.Add(ListEntrySEC);
   ListBox1.Items.Add(ListEntryPAAL);
   ListBox1.Items.Add(ListEntryED);
   ListBox1.Items.Add(ListEntryAWR);
   ListBox1.Items.Add(ListEntryGRD);
   if ( WinData.SystemRegisteredCountry in [Ireland, NIreland] ) then
      ListBox1.Items.Add(ListEntryEML);

   HerdLookup.qICBFHealthCodes.Active := True;
   HerdLookup.ICBFHealthCodeLookup.Properties.ListFieldIndex := 1;

   ListBox1.ItemIndex := 0;
   SetGroupBox(ListBox1.ItemIndex);

   RegCountry := RegisteredCountry;

   with WinData.GlobalSettings do
      begin
         cbCalfReg.Checked := ShowCalfReg;
         cbSaveAnother.Checked := SaveAnother;
         cbPhoneLinkAtStartup.Checked := PhoneLinkOnStartup;
         WinData.SearchPhoneLink := PhoneLinkOnStartup;
         cbNewVersionStartup.Checked := NewVersionAtStartup;
         cbNewVersionReminder.Checked := NewVersionReminder;
         cbBackup.Checked := BackupReminder;
         cbBackupTest.Checked := BackupTestFile;
         cbSpanDisks.Checked := BackupSpanDisks;
         cbArchive.Checked := BackupArchiveFile;
         Pass.Text := WinData.HerdDBPassword;
         cbUseNatIDAnimalNo.Checked := NatIDToAnimalNo;
         if Pass.Text <> '' then
            begin
               Disable.Enabled := True;
            end;
         cbBlade.Checked := BladeRegistered;
         cbReNumAnimal.Checked := RenumAnimalNo;
         cbMandatoryEvents.Checked := MandatoryBreedingEvents;
         cbEnforceDryOff.Checked := MandatoryDryOffEvent;
         for i := 0 to 3 do
            if ( ReNumFormat[i] <> #0 ) then
               ReNumberFormat := ReNumberFormat + ReNumFormat[i];
         SetLength(ReNumberFormat, Length(ReNumberFormat));
         if cbReNumFormat.Items.IndexOf(ReNumberFormat) > -1 then
            cbReNumFormat.ItemIndex := cbReNumFormat.Items.IndexOf(ReNumberFormat);
         cbReNumFormat.Enabled := RenumAnimalNo;
         cbBackupStoreRegFiles.Checked := BackupStoreRegFiles;
         cbBackupStorePedigreeImages.Checked := BackupStorePedigreeImages;
         cbUseBarCodeScanner.Checked := UseBarcodeScanner;
         if DefaultMaleSex <> '' then
            cmbDefaultMaleSex.ItemIndex := cmbDefaultMaleSex.Properties.Items.IndexOf(DefaultMaleSex)
         else
            cmbDefaultMaleSex.ItemIndex := cmbDefaultMaleSex.Properties.Items.IndexOf(cSex_Steer);

         cbAllowDuplicateTags.Checked := AllowDuplicateTags;
         cbExitAfterSale.Checked := DefaultExitAfterSale;
         cbBullsBreeding.Checked := DefaultMaleBreedingStatus;
         cbWeighingMoveAnimalFocus.Checked := WeighingEventChangeAnimalFocusAfterSave;
         cbUseIEPrefixForNatIDSearch.Checked := UseIEPrefixForNatIDSearch;
         cbBulkTankMaualEdit.Checked := Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] = True;

         if RegCountry = Ireland then
            cbDisplayGettingStarted.Checked := DisplayGettingStarted;

         if cmboAnimalGridSireField.Properties.Items.IndexOf(AnimalGridSireField) > -1 then
            cmboAnimalGridSireField.ItemIndex := cmboAnimalGridSireField.Properties.Items.IndexOf(AnimalGridSireField)
         else
            cmboAnimalGridSireField.ItemIndex := 0;

         cbTBTestDateWarning.Checked := DisplayTBTestDateWarningBeforeSale;
         cbBruceTestDateWarning.Checked := DisplayBruceTestDateWarningBeforeSale;
         cbDaysKeptOnFarmWarning.Checked := DisplayMinimumDaysOnFarmWarningBeforeSale;
         seMinimumDaysKeptOnFarm.Value := MinimumDaysToBeKeptOnFarmBeforeSale;
         seMinimumDaysKeptOnFarm.Enabled := cbDaysKeptOnFarmWarning.Checked;
         cbDisplayAnimalComments.Checked := DisplayAnimalComments;

         cbDisplayMovementFeedColsInGridView.Checked := DisplayMovementFeedColsInGridView;

         cbShowCalvingGroupControls.Checked := CalvingShowGroupControls;
         cbShowCalvingCommentControl.Checked := CalvingShowCommentControl;
         cbShowCalvingBirthWeightControls.Checked := CalvingShowBirthWeightControls;
         cbShowCalfColour.Checked := CalvingShowCalfColour;

         cbAnimalGridHideSearchBar.Checked := AnimalGridHideSearchBar;

         cbReviewMartFiles.Checked := ReviewMartFiles;
         cbSaveCommentAsSourceName.Checked := MartSaveCommentAsSourceName;

         cbBlockTempMovements.Checked := ShowBlockTempMovements;

         cbRecordCDAfterService.Checked := Preferences.ValueAsBoolean[cGSService_RecordCScore];
         cbRecordCDAfterCalving.Checked := Preferences.ValueAsBoolean[cGSCalving_RecordCScore];

         cbRecordHealthAfterService.Checked := Preferences.ValueAsBoolean[cGSService_RecordHealth];
         cbRecordHealthAfterCalving.Checked := Preferences.ValueAsBoolean[cGSCalving_RecordHealth];

         cbShowCalvingGroupControls.Checked := Preferences.ValueAsBoolean[cGSCalvingShowGroupControls];
         cbShowCalvingCommentControl.Checked := Preferences.ValueAsBoolean[cGSCalvingShowCommentControl];
         cbShowCalvingBirthWeightControls.Checked := Preferences.ValueAsBoolean[cGSCalvingShowBirthWeightControls];
         cbShowCalfColour.Checked := Preferences.ValueAsBoolean[cGSCalvingShowCalfColour];

         if (Trim(Preferences.ValueAsString[cGSCalving_RecordHealthCode]) <> '') then
            cmboICBFHealthCode.EditValue := HerdLookup.ICBFHealthCodeLookup.Properties.ListSource.DataSet.Lookup('LookupCode',Trim(Preferences.ValueAsString[cGSCalving_RecordHealthCode]),'ID');
         cmboICBFHealthCode.Enabled := cbRecordHealthAfterCalving.Checked;

         cbAutoCompletePDACalving.Checked := Preferences.ValueAsBoolean[cGSCalving_AutoCompletePDA];

         cbCrush.Checked := DisplayCrushScreen;

         //   25/05/12 [V5.0 R7.0] /MK Additional Feature - New Preference To Show Beef Purchase Option On Main Grid.
         cbEnableBeefGroupPurchases.Checked := Preferences.ValueAsBoolean[cGSEnableBeefGroupPurchases];

         cbHerdVaccination.Checked := Preferences.ValueAsBoolean[cGSShowVaccineRemindersOnStartup];

         cbGmailEmailDownloadReminder.Checked := Preferences.ValueAsBoolean[cGSGmailEmailDownloadReminder];

         cbDisplayTagIdentifierSelector.Checked := Preferences.ValueAsBoolean[cGSDisplayTagIdentifierSelector];

         cbDefaultSexOfCalf.Checked := Preferences.ValueAsBoolean[cGSDefaultCalfSex];

         cmboDefaultCalfSex.Enabled := cbDefaultSexOfCalf.Checked;

         cbUseLastWeighingAsLiveWeight.Checked := Preferences.ValueAsBoolean[cGSUseLastRecordWeightAsLiveWeightForKillOut];

         cbUsePurchaseWeightAsLiveWeight.Checked := Preferences.ValueAsBoolean[cGSUsePurchaseWeightAsLiveWeightForKillOut];

         cbDealer.Checked := DisplayDealerMainScr;

         cbUpdateMartWeightWithCrushWeight.Checked := UpdateMartWeightWithCrushWeight;

         cbRemoveTransponderAfterSale.Checked := RemoveTransponderAfterSale;

         //   08/07/21 [V6.0 R1.6] /MK Additional Feature - Set new ICBFRegReminder and AIMHerdRecReminder checkboxes by their GlobalSetting variables.
         cbICBFRegReminder.Checked := ICBFRegReminder;
         cbAIMHerdRecReminder.Checked := AIMHerdRecReminder;

         LoadStartupReminders;
      end;

   cbCrush.Visible := ( (GetHerdType = htBeef) and (Def.Definition.dUseCrush) ) or ( GetHerdType = htDairy );

   cbCrush.Caption := '';
   if ( (GetHerdType = htBeef) and (Def.Definition.dUseCrush) ) then
      cbCrush.Caption := 'Crush'
   else if ( GetHerdType = htDairy ) then
      cbCrush.Caption := 'Parlour Events';

   //   25/05/12 [V5.0 R7.0] /MK Additional Feature - New Preference To Show Beef Purchase Option On Main Grid.
   cbEnableBeefGroupPurchases.Visible := ( Def.Definition.dUseBeefMan ) and ( GetHerdType = htBeef ) and ( Def.Definition.dUseCrush );
   cbUpdateMartWeightWithCrushWeight.Visible := cbEnableBeefGroupPurchases.Visible;

   cbDealer.Visible := ( Def.Definition.dUseDealer ) and ( not(Def.Definition.dUseManCal) ) and ( not(Def.Definition.dUseBeefMan) );
   if ( cbDealer.Visible ) then
      begin
         cbDealer.Top := 74;
         if ( cbCrush.Visible ) then
            cbDealer.Top := 114;
      end;

   tsBulling.TabVisible := False;
   tsService.TabVisible := True;
   tsPregDiag.TabVisible := False;
   tsDryOff.TabVisible := False;
   tsCalving.TabVisible := True;
   tsHealth.TabVisible := True;
   tsSaleDeaths.TabVisible := True;
   tsWeighings.TabVisible := True;
   tsMartFiles.TabVisible := True;
   tsTempMove.TabVisible := True;

   cbShowCalfColour.Visible := ( WinData.SystemRegisteredCountry = Ireland );

   cmbDefaultHealthComment.Properties.Items.Clear;
   cmbDefaultHealthComment.Properties.Items.Add('Drug Description');
   cmbDefaultHealthComment.Properties.Items.Add('Health Code (Farm) Description');

   if ( WinData.GlobalSettings.HealthCodeDefaultCommentIndex > -1 ) and
      ( WinData.GlobalSettings.HealthCodeDefaultCommentIndex <= cmbDefaultHealthComment.Properties.Items.Count-1 ) then
         begin
            cmbDefaultHealthComment.ItemIndex := WinData.GlobalSettings.HealthCodeDefaultCommentIndex;
         end;
   pcEventDefaults.ActivePageIndex := 1;

   cxPageControl1.ActivePage := cxTabSheet1;

   // Prevent NONE herd from display on natid setting grid.
   WinData.OwnerFile.Filter := 'HerdIdentity <>''NONE''';
   WinData.OwnerFile.Filtered := True;

   NatIDEntryStyleGridDBTableViewNatIDLeadZero.Visible := (WinData.SystemRegisteredCountry=NIreland);

   cmboDefaultCalfSex.Properties.Items.Clear;
   cmboDefaultCalfSex.Properties.Items.Add(cSex_Female);
   cmboDefaultCalfSex.Properties.Items.Add(cSex_Bull);
   if ( (not(GetHerdType = htSuckler)) or (RegCountry <> Ireland) ) then
      cmboDefaultCalfSex.Properties.Items.Add(cSex_Steer);

   sDefaultCalfSex := WinData.GlobalSettings.DefaultCalfSexType;
   if ( Length(sDefaultCalfSex) > 0 ) then
      begin
         if ( (GetHerdType = htSuckler) or (RegCountry = Ireland) and (UpperCase(sDefaultCalfSex) = 'STEER') ) then
            cmboDefaultCalfSex.Text := 'Bull'
         else
            cmboDefaultCalfSex.Text := WinData.GlobalSettings.DefaultCalfSexType;
      end;

   FFromCalving := False;

   cbRemoveTransponderAfterSale.Visible := Def.Definition.dUseParlour;

   //   08/07/21 [V6.0 R1.6] /MK Additional Feature - New ICBFRegReminder and AIMHerdRecReminder checkboxes only visible for Irish customers
   cbICBFRegReminder.Visible := ( RegCountry = Ireland );
   cbAIMHerdRecReminder.Visible := ( RegCountry = Ireland );
end;

procedure TfmGlobalSettings.o(Sender: TObject; var Action: TCloseAction);
var
  i : smallint;
begin
   if ModalResult <> mrok then Exit;

   with WinData.GlobalSettings do
      begin
         ShowCalfReg := cbCalfReg.Checked;
         SaveAnother := cbSaveAnother.Checked;
         PhoneLinkOnStartup := cbPhoneLinkAtStartup.Checked;
         NewVersionAtStartup := cbNewVersionStartup.Checked;
         NewVersionReminder := cbNewVersionReminder.Checked;
         BackupReminder := cbBackup.Checked;
         BackupTestFile := cbBackupTest.Checked;
         BackupSpanDisks := cbSpanDisks.Checked;
         BackupArchiveFile := cbArchive.Checked;
         NatIDToAnimalNo := cbUseNatIDAnimalNo.Checked;
         BladeRegistered := cbBlade.Checked;
         RenumAnimalNo := cbReNumAnimal.Checked;
         cbReNumFormat.Enabled := RenumAnimalNo;
         MandatoryBreedingEvents := cbMandatoryEvents.Checked;
         MandatoryDryOffEvent := cbEnforceDryOff.Checked;

         FillChar(ReNumFormat, 4, #0 );
         for i := 0 to length(cbReNumFormat.Text)-1 do
            ReNumFormat[i] := cbReNumFormat.Text[i+1];
         BackupStoreRegFiles := cbBackupStoreRegFiles.Checked;
         BackupStorePedigreeImages := cbBackupStorePedigreeImages.Checked;
         UseBarcodeScanner := cbUseBarCodeScanner.Checked;
         DefaultMaleSex := cmbDefaultMaleSex.Properties.Items[cmbDefaultMaleSex.ItemIndex];
         if cmbDefaultHealthComment.ItemIndex > -1 then
            WinData.GlobalSettings.HealthCodeDefaultCommentIndex := cmbDefaultHealthComment.ItemIndex;

         { Save settings }
         AllowDuplicateTags := cbAllowDuplicateTags.Checked;
         DefaultExitAfterSale := cbExitAfterSale.Checked;
         DefaultMaleBreedingStatus := cbBullsBreeding.Checked;
         WeighingEventChangeAnimalFocusAfterSave := cbWeighingMoveAnimalFocus.Checked;
         UseIEPrefixForNatIDSearch := cbUseIEPrefixForNatIDSearch.Checked;
         DisplayGettingStarted := cbDisplayGettingStarted.Checked;

         AnimalGridSireField := cmboAnimalGridSireField.Properties.Items[cmboAnimalGridSireField.ItemIndex];

         DisplayTBTestDateWarningBeforeSale := cbTBTestDateWarning.Checked;
         DisplayBruceTestDateWarningBeforeSale := cbBruceTestDateWarning.Checked;
         DisplayMinimumDaysOnFarmWarningBeforeSale := cbDaysKeptOnFarmWarning.Checked;
         MinimumDaysToBeKeptOnFarmBeforeSale := seMinimumDaysKeptOnFarm.Value;
         DisplayAnimalComments := cbDisplayAnimalComments.Checked;
         DisplayMovementFeedColsInGridView := cbDisplayMovementFeedColsInGridView.Checked;
         DownloadMailAttachments := WinData.MailboxConfigFileExists;
         ReviewMartFiles := cbReviewMartFiles.Checked;
         MartSaveCommentAsSourceName := cbSaveCommentAsSourceName.Checked;
         ShowBlockTempMovements := cbBlockTempMovements.Checked;
         AnimalGridHideSearchBar := cbAnimalGridHideSearchBar.Checked;

         CalvingShowGroupControls := cbShowCalvingGroupControls.Checked;
         CalvingShowCommentControl := cbShowCalvingCommentControl.Checked;
         CalvingShowBirthWeightControls:= cbShowCalvingBirthWeightControls.Checked;
         CalvingShowCalfColour := cbShowCalfColour.Checked;

         DisplayTagIdentifierSelector := cbDisplayTagIdentifierSelector.Checked;

         DefaultCalfSex := cbDefaultSexOfCalf.Checked;
         DefaultCalfSexType := cmboDefaultCalfSex.Text;

         UseLastRecordWeightAsLiveWeightForKillOut := cbUseLastWeighingAsLiveWeight.Checked;
         UsePurchaseWeightAsLiveWeightForKillOut := cbUsePurchaseWeightAsLiveWeight.Checked;

         //   05/09/11 [V5.0 R0.5] /MK Additional Feature - Default New Report Screen Layout For Everybody.
         Preferences.ValueAsString[cGSReportLayoutStyle] := 'NEWLAYOUT';

         Preferences.ValueAsBoolean[cGSService_RecordCScore] := cbRecordCDAfterService.Checked;
         Preferences.ValueAsBoolean[cGSCalving_RecordCScore] := cbRecordCDAfterCalving.Checked;

         Preferences.ValueAsBoolean[cGSService_RecordHealth] := cbRecordHealthAfterService.Checked;
         Preferences.ValueAsBoolean[cGSCalving_RecordHealth] := cbRecordHealthAfterCalving.Checked;
         Preferences.ValueAsString[cGSCalving_RecordHealthCode] := cmboICBFHealthCode.Text;

         Preferences.ValueAsBoolean[cGSCalving_AutoCompletePDA] := cbAutoCompletePDACalving.Checked;

         Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] := cbBulkTankMaualEdit.Checked;

         //   25/05/12 [V5.0 R7.0] /MK Additional Feature - New Preference To Show Beef Purchase Option On Main Grid.
         Preferences.ValueAsBoolean[cGSEnableBeefGroupPurchases]:= cbEnableBeefGroupPurchases.Checked;

         Preferences.ValueAsBoolean[cGSCalvingShowGroupControls] := cbShowCalvingGroupControls.Checked;
         Preferences.ValueAsBoolean[cGSCalvingShowCommentControl] := cbShowCalvingCommentControl.Checked;
         Preferences.ValueAsBoolean[cGSCalvingShowBirthWeightControls]:= cbShowCalvingBirthWeightControls.Checked;
         Preferences.ValueAsBoolean[cGSCalvingShowCalfColour]:= cbShowCalfColour.Checked;

         Preferences.ValueAsBoolean[cGSGmailEmailDownloadReminder] := cbGmailEmailDownloadReminder.Checked;
         GmailEmailDownloadReminder := cbGmailEmailDownloadReminder.Checked;

         DisplayCrushScreen := cbCrush.Checked;

         Preferences.ValueAsBoolean[cGSDisplayTagIdentifierSelector] := cbDisplayTagIdentifierSelector.Checked;

         Preferences.ValueAsBoolean[cGSDefaultCalfSex] := cbDefaultSexOfCalf.Checked;
         Preferences.ValueAsString[cGSDefaultCalfSexType] := cmboDefaultCalfSex.Text;

         Preferences.ValueAsBoolean[cGSUseLastRecordWeightAsLiveWeightForKillOut] := cbUseLastWeighingAsLiveWeight.Checked;
         Preferences.ValueAsBoolean[cGSUsePurchaseWeightAsLiveWeightForKillOut] := cbUsePurchaseWeightAsLiveWeight.Checked;

         DisplayDealerMainScr := cbDealer.Checked;

         UpdateMartWeightWithCrushWeight := cbUpdateMartWeightWithCrushWeight.Checked;

         RemoveTransponderAfterSale := cbRemoveTransponderAfterSale.Checked;

         //   08/07/21 [V6.0 R1.6] /MK Additional Feature - Set new GlobalSetting ICBFRegReminder and AIMHerdRecReminder variables by their checkboxes. 
         ICBFRegReminder := cbICBFRegReminder.Checked;
         AIMHerdRecReminder := cbAIMHerdRecReminder.Checked;

         WinData.SavePreferences;
      end;

   try
      if (WinData.OwnerFile.State in dsEditModes) then
         try
            WinData.OwnerFile.Post;
         except
            on e :Exception do
               begin
                  WinData.OwnerFile.Cancel;
                  MessageDlg(cErrorContact_2 + cCRLFx2 + e.Message, mtError,[mbOK],0);
               end;
         end;
   finally
      WinData.OwnerFile.Filter := '';
      WinData.OwnerFile.Filtered := False;
   end;
end;

procedure TfmGlobalSettings.ListBox1Click(Sender: TObject);
begin
   if ListBox1.Items[ListBox1.ItemIndex] = 'Pro-Active Action Lists' then
      begin
         TActionReminderDefaults.Create(nil).ShowModal;
         ListBox1.ItemIndex := 0;
         GroupBox1.Visible := True;
      end
   else if ListBox1.Items[ListBox1.ItemIndex] = ListEntryAWR then
      begin
         TfmActionWarningReminderParams.ShowParams(True);
         ListBox1.ItemIndex := 0;
         GroupBox1.Visible := True;
      end
   else
      SetGroupBox(ListBox1.ItemIndex);

   LoadStartupReminders;
end;

procedure TfmGlobalSettings.SetGroupBox(pTag: Integer);
var
   i : Integer;
   j : Integer;
begin
   for i := 0 to ControlCount-1 do
      if Controls[i] is TGroupBox then
         if (Controls[i] as TGroupBox).Tag = pTag then
            begin
               (Controls[i] as TGroupBox).Visible := True;
               {
               if pTag = 2 then
                  begin
                     (Controls[i] as TGroupBox).Enabled := False;
                     MessageDlg('To view PhoneLink settings, click PhoneLink|Settings menu option on main screen.',mtInformation,[mbOK],0);
                  end
               else
               }
               if pTag = 9 then
                  begin
                     if (WinData.SystemRegisteredCountry=Ireland) then
                        begin
                           if ( FileExists(IncludeTrailingBackslash( ApplicationPath ) + KingswoodMailBoxDLL)) then
                              begin
                                (Controls[i] as TGroupBox).Enabled := True;
                                 btnDefaultEmailClient.Enabled := True;
                              end
                           else
                              begin
                                (Controls[i] as TGroupBox).Enabled := True;
                                 btnDefaultEmailClient.Enabled := False;
                                 MessageDlg('Please contact Kingswood Computing if would like to use the Mail service.',mtInformation,[mbOK],0);
                              end;
                        end
                     else
                        begin
                           btnDefaultEmailClient.Enabled := False;
                           (Controls[i] as TGroupBox).Enabled := False;
                        end;
                  end;
            end
         else
            (Controls[i] as TGroupBox).Visible := False;
end;

procedure TfmGlobalSettings.SaveClick(Sender: TObject);
begin
   if ( Length(Pass.Text) < 6 ) or ( Length(ConfirmPass.Text) < 6 ) then
      raise Exception.Create('Password must be at least 6 characters in length');

   if (Pass.Text) <> (ConfirmPass.Text) then
      begin
         MessageDlg('Passwords entered does not match', mtError, [mbOK], 0);
         Pass.Text := '';
         ConfirmPass.Text  := '';
         Exit;
      end;

   if MessageDlg('Are you sure you want to create new password', mtConfirmation, [mbYes, mbNo],0) = idYes then
      WinData.HerdDBPassword := Pass.Text;
   Disable.Enabled := True;
   ConfirmPass.Text := '';

   { Save settings }
   WinData.SavePreferences;
   MessageDlg('Password saved', mtInformation, [mbOk],0);
end;

procedure TfmGlobalSettings.ConfirmPassChange(Sender: TObject);
begin
   if Length((Sender as TEdit).Text) > 0 then
     if not Save.Enabled then
        Save.Enabled := True;
end;

procedure TfmGlobalSettings.DisableClick(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to clear password', mtConfirmation, [mbYes, mbNo],0) = idYes then
      begin
         if TfmClearHerdPassword.ClearPassword(WinData.HerdDBPassword) then
            begin
               WinData.HerdDBPassword := '';
               Pass.Text := '';
               ConfirmPass.Text := '';
               Save.Enabled := False;
               Disable.Enabled := False;
               { Save settings }
               WinData.SavePreferences;
               MessageDlg('Password cleared', mtInformation, [mbOk],0);
            end
         else
            MessageDlg('Password not cleared!', mtError, [mbOk],0);
      end;
end;

procedure TfmGlobalSettings.cbReNumAnimalClick(Sender: TObject);
begin
   cbReNumFormat.Enabled := cbReNumAnimal.Checked;
   if cbReNumAnimal.Checked then
      begin
         cbReNumFormat.ItemIndex := 0;
      end;
end;

class procedure TfmGlobalSettings.ShowPreferences(AScreen : string; ATab : string = ''; const AFromCalving : Boolean = False);
var
  pc : TcxPageControl;
begin
   with TfmGlobalSettings.Create(nil) do
      try
        gbCalfNatIDEntry.Visible := ( not(AFromCalving) );
        cbDefaultSexOfCalf.Visible := ( not(AFromCalving) );
        cmboDefaultCalfSex.Visible := cbDefaultSexOfCalf.Visible;
        cbUseNatIDAnimalNo.Visible := ( not(AFromCalving) );
        ListBox1.ItemIndex := ListBox1.Items.IndexOf(AScreen);
        if (ATab <> '') then
           begin
              pc := CurrentPageControl(AScreen);
              if pc <> nil then
                 begin
                    pc.ActivePageIndex := pc.TabS.IndexOf(ATab);
                 end;
           end;
        ListBox1Click(ListBox1);
        ShowModal;
      finally
         Free;
      end;
end;

function TfmGlobalSettings.CurrentPageControl(
  AScreen: string): TcxPageControl;
begin
   if AScreen = ListEntryED then
      Result := pcEventDefaults
   else
      Result := nil
end;

procedure TfmGlobalSettings.CheckValidNationalIDPart;
var
   HerdIdentifier : string;
   i : Integer;
   iNextNatIDNumber : Integer;
   RegCountry : TCountry;
   InputNextNatID : Integer;
   sLabel : string;
begin
   with WinData.OwnerFile do
      try
         if WinData.OwnerFile.State in dsEditModes then
            WinData.OwnerFile.Post;

         DisableControls;

         if WinData.OwnerFileNatIDNumInputStyle.AsInteger <> cInputNatIDStyle_ManualInput then
            begin
               InputNextNatID := WinData.OwnerFileNextNatID.AsInteger;
               RegCountry := WinData.DefCountry(WinData.OwnerFileId.AsInteger);
               if InputNextNatID <= 0 then
                  begin
                     MessageDlg('Next Nat. Id. No. must have a value.',mtError,[mbOK],0);
                     Abort;
                  end;
               HerdIdentifier := WinData.OwnerFileHerdIdentifier.AsString;

               if Trim(HerdIdentifier) = '' then
                  begin
                     if RegCountry = NIreland then
                        sLabel := 'BTE Number'
                     else
                        sLabel := 'Designator';
                     MessageDlg(Format('The auto-generate Nat Id No. service cannot be used because your Herd %s has not been setup.',[sLabel]),mtInformation,[mbOK],0);
                     uHerdSetUp.ShowTheForm(False,'HerdIdentifier');
                     Abort;
                  end;

               if RegCountry = Ireland then
                  begin
                     if Length(HerdIdentifier) <> 7 then
                        begin
                           MessageDlg('Your Herd Identifier '+HerdIdentifier+' is not valid. '+#13+
                                      'Please use a 7 digit number without spaces or separators',mtError,[mbOK],0);
                           uHerdSetUp.ShowTheForm(False,'HerdIdentifier');
                           Abort;
                        end
                  end;

               for i := 1 to Length(HerdIdentifier) do
                  begin
                     if NOT (HerdIdentifier[i] IN (['0'..'9'])) then
                        begin
                           sLabel := 'Your Herd Identifier '+HerdIdentifier+' is not valid.';
                           if RegCountry = Ireland then
                              sLabel := sLabel + cCRLF+'Please use a 7 digit number without spaces or separators';
                           MessageDlg(sLabel,mtError,[mbOK],0);
                           uHerdSetUp.ShowTheForm(False,'HerdIdentifier');
                           Abort;
                        end;
                  end;

                  if ( RegCountry = Ireland ) then
                     iNextNatIDNumber := NextIrishNatIDNumber(HerdIdentifier)
                  else if RegCountry = NIreland then
                     iNextNatIDNumber := NextUK9NatIDNumber(HerdIdentifier);

                  if iNextNatIDNumber > 0 then
                     begin
                        if (InputNextNatID < iNextNatIDNumber ) then
                           begin
                              //   06/03/19 [V5.8 R8.0] /MK Change - Changed message text to indicate to the user that the number they are entering is less
                              //                                     then the expected NextNatID number - Hugh Collender.
                              MessageDlg(Format('Next National Id. No. entered, "%d", is less than Next Available National Id, "%d", in the database.'+cCRLF+
                                                'If you wish to use %d then change the Nat. Id. No. Input to Manual Input'+cCRLF+
                                                'until you reach the Next Available National ID, then you can change back to Auto Generate.',
                                                [InputNextNatID, iNextNatIDNumber, InputNextNatID]),mtError,[mbOK],0);
                              WinData.OwnerFile.Edit;
                              WinData.OwnerFileNextNatID.Clear;
                              WinData.OwnerFile.Post;
                              Abort;
                           end
                        else
                           begin
                              if WinData.OwnerFileNatIDNumInputStyle.AsInteger = cInputNatIDStyle_ListInput then
                                 begin
                                    // now populate the TagStore with next 10 tag numbers.
                                    try
                                       HerdLookup.CreateTagStore(WinData.OwnerFileId.AsInteger);
                                       MessageDlg('The tag list has been successfully created and the'+cCRLF+
                                                  'Next Nat. Id. value has been updated accordingly.'+cCRLF+cCRLF+
                                                  'At the next calving of an animal, you can select the calf tag'+cCRLF+
                                                  'number directly from a list within the calving screen.',mtInformation,[mbOK],0);
                                    except
                                       MessageDlg(cErrorContact_2,mtError,[mbOK],0);
                                    end;
                                 end;
                           end;
                     end
                  else
                     begin
                        if RegCountry = NIreland then
                           sLabel := 'BTE Number'
                        else
                           sLabel := 'Designator';
                        MessageDlg(Format('Auto-generate National Id. No. cannot be used. You must setup a valid Herd %s.',[sLabel]),mtError,[mbOK],0);
                        WinData.OwnerFile.Edit;
                        WinData.OwnerFileNextNatID.Clear;
                        WinData.OwnerFile.Post;
                     end;
            end
         else
            begin
               WinData.OwnerFile.Edit;
               WinData.OwnerFileNextNatID.Clear;
               WinData.OwnerFile.Post;
            end;
      finally
         EnableControls;
      end;
end;

procedure TfmGlobalSettings.cmboAnimalGridSireFieldPropertiesChange(
  Sender: TObject);
begin
   if FormShowing then
      MessageDlg(cChangeAfterRestart,mtInformation,[mbOK],0);
end;

procedure TfmGlobalSettings.FormActivate(Sender: TObject);
begin
   FormShowing := True;
end;

procedure TfmGlobalSettings.cxButton1Click(Sender: TObject);
begin
   with TfmGridColourSelection.Create(nil) do
      begin
         ShowModal;
         Free;
         MenuForm.cxAnimalGridView.LayoutChanged(True); // refresh the grid style contents
      end;
end;

procedure TfmGlobalSettings.cbDaysKeptOnFarmWarningPropertiesChange(
  Sender: TObject);
begin
   seMinimumDaysKeptOnFarm.Enabled := cbDaysKeptOnFarmWarning.Checked;
end;

procedure TfmGlobalSettings.NatIDEntryStyleGridDBTableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
   if AItem = NatIDEntryStyleGridDBTableViewNextNatID then
      begin
         CheckValidNationalIDPart;
      end
   else if AItem = NatIDEntryStyleGridDBTableViewNatIDNumEntryStyle then
      begin
         if ( Windata.OwnerFileNatIDNumInputStyle.AsInteger = cInputNatIDStyle_ManualInput ) then
            begin
               //   21/03/19 [V5.8 R8.3] /MK Change - Only change to Edit mode if not in edit mode, don't stop the clear of the NextNatID field.
               if not (WinData.OwnerFile.State = dsEdit) then
                  WinData.OwnerFile.Edit;
               WinData.OwnerFileNextNatID.Clear;
               WinData.OwnerFile.Post
            end
         else if ( WinData.OwnerFileNatIDNumInputStyle.AsInteger <> cInputNatIDStyle_ManualInput ) then
            // re-build the tag store, but only if the NextNatID has a value.
            begin
               //   21/03/19 [V5.8 R8.3] /MK Change - If country is Ireland then autoset NextNatID to the NextNatID without user having to think of it.
               //                                     For NI users do as we have always done because NextNatID for NI check is more intricate.
               if ( WinData.OwnerFileNatIDNumInputStyle.NewValue = cInputNatIDStyle_AutoGenInput ) and
                  ( RegCountry = Ireland ) then
                  begin
                     WinData.OwnerFile.Edit;
                     WinData.OwnerFileNextNatID.AsInteger := NextIrishNatIDNumber();
                     WinData.OwnerFile.Post
                  end
               else
                  CheckValidNationalIDPart;
            end;
      end
   else if AItem = NatIDEntryStyleGridDBTableViewNatIDLeadZero then
      begin
         // re-build the tag store, with/without leading zero
         if WinData.OwnerFileNextNatID.AsInteger > 0 then
            CheckValidNationalIDPart;
      end;
end;

procedure TfmGlobalSettings.cbDisplayAnimalCommentsPropertiesChange(
  Sender: TObject);
begin
//   05/08/14 [V5.3 R4.2] /MK Bug Fix - No need for restart message as changes apply with restart - GL request.
//   if FormShowing then
//      MessageDlg(cChangeAfterRestart,mtInformation,[mbOK],0);
end;

procedure TfmGlobalSettings.cbDisplayMovementFeedColsinGridViewPropertiesChange(
  Sender: TObject);
begin
   if FormShowing then
      begin
         if cbDisplayMovementFeedColsinGridView.Checked then
            SetRegValue(Reg_DefaultPath + 'Misc\' + DataDir + '\' + 'ResetBeefGridCols', 'Reset', True );
         MessageDlg(cChangeAfterRestart,mtInformation,[mbOK],0);
      end;
end;

procedure TfmGlobalSettings.btnDefaultEmailClientClick(Sender: TObject);
begin
   TfmEmailClient.Execute;
end;

procedure TfmGlobalSettings.ListBox1MeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
   Height := 20;
end;

procedure TfmGlobalSettings.cbRecordHealthAfterCalvingPropertiesChange(
  Sender: TObject);
begin
   ///   lDefaultHealthCode.Enabled := cbRecordHealthAfterCalving.Checked;
   cmboICBFHealthCode.Enabled := cbRecordHealthAfterCalving.Checked;
end;

procedure TfmGlobalSettings.FormDestroy(Sender: TObject);
begin
   HerdLookup.qICBFHealthCodes.Active := False;
   HerdLookup.ICBFHealthCodeLookup.Properties.ListFieldIndex := 0;
   FreeAndNil(ActionList);
end;

procedure TfmGlobalSettings.cbAutoCompletePDACalvingPropertiesEditValueChanged(
  Sender: TObject);
begin
   if FormShowing then
      begin

         if cbAutoCompletePDACalving.Checked then
            begin
               if MessageDlg('If you turn on the "Auto complete PDA calvings" option, PDA calving events will not be checked'+#13#10+
                             'using the normal dam/calf validation rules. These validation rules ensure events/actions/entries are'+#13#10+
                             'present and correct before recording a calving event for the dam.' +#13#10+#13#10+
                             'Are you sure you want to bypass this checking?',mtWarning,[mbYes,mbNo],0) = idNo then

                  cbAutoCompletePDACalving.Checked := False;
               cbAutoCompletePDACalving.invalidate;
            end;
      end;
end;

function TfmGlobalSettings.GetHerdType: THerdType;
begin
   Result := htNone;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT G.Description');
         SQL.Add('FROM Genlook G');
         SQL.Add('WHERE G.ID IN (SELECT O.TypeOfHerd FROM Owners O');
         SQL.Add('               WHERE O.ID = :HerdID)');
         Params[0].AsInteger := WinData.OwnerFileID.AsInteger;
         Open;
         try
            First;
            if ( UpperCase(Fields[0].AsString) = 'DAIRY' ) then
               Result := htDairy
            else if ( UpperCase(Fields[0].AsString) = 'SUCKLER' ) then
               Result := htSuckler
            else if ( UpperCase(Fields[0].AsString) = 'BEEF' ) then
               Result := htBeef;
            Next;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmGlobalSettings.cbActionWarningRemindersPropertiesChange(
  Sender: TObject);
begin
   Preferences.ValueAsBoolean[cGSShowActionWarningRemindersOnStartup] := cbActionWarningReminders.Checked;
end;

procedure TfmGlobalSettings.LoadStartupReminders;
begin
   cbProActiveActionList.Checked := ActionList.Enabled;
   cbActionWarningReminders.Checked := Preferences.ValueAsBoolean[cGSShowActionWarningRemindersOnStartup];
end;

procedure TfmGlobalSettings.cbHerdVaccinationPropertiesChange(
  Sender: TObject);
begin
   Preferences.ValueAsBoolean[cGSShowVaccineRemindersOnStartup] := cbHerdVaccination.Checked;
end;

procedure TfmGlobalSettings.cbProActiveActionListPropertiesChange(
  Sender: TObject);
begin
   ActionList.Enabled := cbProActiveActionList.Checked;
end;

procedure TfmGlobalSettings.cbGmailEmailDownloadReminderPropertiesChange(
   Sender: TObject);
begin
   Preferences.ValueAsBoolean[cGSGmailEmailDownloadReminder] := cbGmailEmailDownloadReminder.Checked;
end;

procedure TfmGlobalSettings.cbDefaultSexOfCalfPropertiesChange(
   Sender: TObject);
begin
   cmboDefaultCalfSex.Enabled := cbDefaultSexOfCalf.Checked;
end;

end.
