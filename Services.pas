{
   17/02/2009 [Dev V3.9 R6.2] /SP Program Change - Allow user to enter condition score event after saving calving event.
                                                   Allow user to enter health event after saving calving event.

   07/07/10 [V4.0 R4.0] /MK Bug Fix - Changed qBullUsed to show only bulls that have an AnimalNo.

   12/11/10 [V4.0 R5.6] /MK Change - Added BullCode to Comment in PlanedBull.OnChange.

   28/03/11 [V4.0 R8.7] /MK Change - Changed qBullUsed To Show Only Bulls That Are Breeding and InUse.

   12/04/11 [V4.0 R9.5] /MK Change - New Query qHistBullUsed (Just Breeding). Assign DataSource1.DateSet this query if WinData.Events.State = Edit Mode.
                                   - If WinData.Events.State = Insert Mode then DataSource1.DateSet = qBullUsed (InUse And Breeding)

   11/05/12 [V5.0 R5.5] /MK Bug Fix - BullUsedChange - If User Changes Their Mind On The Bull The Comment Saves Both Bulls.

   02/10/12 [V5.1 R0.1] /MK Additional Feature - FormShow - If PlannedBull Event Exists then Default Service Bull to Planned Bull.

   17/01/13 [V5.1 R3.8] /MK Additional Feature - Added dbLookupComboBox for Genetic Dam.

   28/01/14 [V5.2 R7.8] /MK Change - Changed Calving Index to Calving Interval - GL Request.

   20/02/14 [V5.2 R8.4] /MK Additional Feature - Added Sexed Semen drop-down-menu as per ICBF request.

   21/02/14 [V5.2 R8.4] /MK Change - Only show SexedSemen if Bull is AI Bull or if Editing and Sexed has a value.

   06/03/14 [V5.2 R8.8] /MK Additional Feature - Stored Technician/Inseminator as part of ServiceDefaults.

   27/08/15 [V5.4 R7.4] /MK Change - Colour SearchForAnimal, DateOfService, PlannedBull clTeal / font white to show these are required fields - GL request.
                                   - Move DateOfService after SearchForAnimal - GL request.
                                   - Always show Sexed Semen - GL request.
                                   - NavBeforeAction - Don't allow service to be saved without a bull being selected - GL request.

   21/03/16 [V5.5 R5.4] /MK Bug Fix - Removed the option to save the comment in a service event as it was causing problems where the program was changing
                                      the comment to the amount of services the cow had - Emer Howard reported.
                                    - Added check to see if the user has change the donor dam of the service and show
                                      an information message explaining to the user that the donor dam of the calf
                                      should also be changed - Shane Lawlor.

   08/04/16 [V5.5 R5.7] /MK Change - Added similar option from Group Service screen for change of service type depending on
                                     what type of bull is selected i.e. AI Bull = AI service type, Stock Bull = Natural Service.

   11/04/17 [V5.6 R5.7] /MK Bug Fix - When screen opens and date changes then check to see if there is a planned bull before the event date.

   13/04/17 [V5.6 R5.7] /MK Bug Fix - PlannedBullCloseUp - Check if PlannedBull.KeyValue is not null first before other checks on PlannedBull.KeyValue - GL reported.

   24/04/17 [V5.6 R5.8] /MK Bug Fix - ServiceTypeChange - Removed the assigning of planned bull after service type is changed.
                                    - FormActivate - Only check for planned bull on form open - Milo Murphy.

   28/09/18 [V5.8 R3.0] /MK Change - qBullUsed/qHistBullsUsed queries changed to be like the Service, Planned Bull and Stock Bull queries in HerdLookup i.e. check for null breed.
                                   - Removed the qBullUsed and qHistBullUsed components and replaced them with HerdLookup.qServiceBullUsed and HerdLookup.qServiceHistBullUsed.

   08/03/19 [V5.8 R8.0] /MK Change - For new services for cows with planned bull events, previous versions would only default Service Bull to top Planned Bull.
                                     Added new table, FBullList, that has all planned bulls at the top of the list and other bulls below it - GL request.

   12/04/19 [V5.8 R8.8] /MK Bug Fix - FormDestroy - Need to free the WinData.FBreedingDataHelper if I'm using it - Brian Kerr.
                                    - ShowService - If there is no default bull then the EventDesc never mentioned the service count.
}

unit Services;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, ToolEdit, RXDBCtrl,
  Db, DBTables, RXLookup, uListAnimals, RXCtrls, ToolWin, kwDBNavigator,
  Menus, eventDefaults, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, uBreedingDataHelper, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, uHerdLookup, GenTypesConst,
  KRoutines, uAnimal;

type
  TAddOrAmendService = (AddService, AmendService);
  TfServices = class(TkwEventForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbComment: TDBEdit;
    Label4: TLabel;
    PlannedBull: TRxDBLookupCombo;
    DataSource1: TDataSource;
    ServiceType: TRxDBLookupCombo;
    DateOfService: TDBDateEdit;
    Panel3: TPanel;
    ProjCalvingDate: TEdit;
    Label5: TLabel;
    ProjCalvingInterval: TEdit;
    Label6: TLabel;
    lNo: TLabel;
    SearchForAnimal: TComboEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton1: TToolButton;
    Nav: TkwDBNavigator;
    NoOfStraws: TDBEdit;
    Label7: TLabel;
    dsGenDam: TDataSource;
    qGenDam: TQuery;
    dbcGenDam: TRxDBLookupCombo;
    lGenDam: TLabel;
    lDonor: TLabel;
    sbNewBull: TRxSpeedButton;
    dbDefaults: TRxSpeedButton;
    ToolButton4: TToolButton;
    PopupMenu1: TPopupMenu;
    BullUsed1: TMenuItem;
    ServiceType1: TMenuItem;
    NoOfStraws1: TMenuItem;
    EventDate1: TMenuItem;
    N1: TMenuItem;
    SelectAll1: TMenuItem;
    DeselectAll1: TMenuItem;
    N2: TMenuItem;
    DefaultTo1: TMenuItem;
    AnimalNo1: TMenuItem;
    BullUsed2: TMenuItem;
    BullSep: TToolButton;
    Label8: TLabel;
    cbTechnician: TRxDBLookupCombo;
    lET1No: TLabel;
    dbeET1No: TDBEdit;
    Timer1: TTimer;
    dbGenenticDam: TcxDBLookupComboBox;
    lSexedSemen: TLabel;
    cbSexedSemen: TRxDBLookupCombo;
    Inseminator1: TMenuItem;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure PlannedBullChange(Sender: TObject);
    procedure ServiceTypeChange(Sender: TObject);
    procedure DateOfServiceExit(Sender: TObject);
    procedure ServiceTypeCloseUp(Sender: TObject);
    procedure dbCommentExit(Sender: TObject);
    procedure NavClick(Sender: TObject; Button: TKNavigateBtn);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure NavBeforeAction(Sender: TObject; Button: TKNavigateBtn);
    procedure sbNewBullClick(Sender: TObject);
    procedure DateOfServiceChange(Sender: TObject);
    procedure ServiceTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BullUsed1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeselectAll1Click(Sender: TObject);
    procedure NoOfStrawsChange(Sender: TObject);
    procedure dbCommentChange(Sender: TObject);
    procedure dbcGenDamChange(Sender: TObject);
    procedure cbTechnicianChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PlannedBullCloseUp(Sender: TObject);
    procedure cbSexedSemenChange(Sender: TObject);
    procedure dbGenenticDamPropertiesEditValueChanged(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ServiceDateDef : TDateTime;
    PlanBullDef : Variant;
    FServiceCount : string;
    FCountry : TCountry;
    FAddOrAmend : TAddOrAmendService;
    FBullList : TTable;
    procedure CalcCalvingDate;
    function GetServiceCount: string;
    procedure LoadDefaults;
    procedure AssignPlannedBull;
    property ServiceCount : string read GetServiceCount;
    procedure BuildAddServiceBullList;
  public
    { Public declarations }
  end;

  procedure ShowService(AddorAmend : TAddOrAmendService );


implementation
uses
    uGenLookSetUp,
    DairyData,
    uSrchdlg,
    BrowseRegisterU,
    MenuUnit, uPreferences, uConditionScoreEventForm, uHealthEventForm;

{$R *.DFM}

procedure ShowService(AddorAmend : TAddOrAmendService );
begin
   with TfServices.Create(nil) do
      try
         LoadDefaults;
         WinData.EventType := TService;
         ThisCombo := SearchForAnimal;
         ThisNav := Nav;
         ThisComment := dbComment;
         pSexToList := 'Female';
         FAddOrAmend := AddorAmend;
         if (FAddOrAmend = AddService) then
            begin
               WinData.ModifyingEvent := False;
               sbNewBull.Visible := True;
               Nav.VisibleButtons := [kwnbPost,kwnbCancel];
               AddEvent;

               FServiceCount := WinData.FBreedingDataHelper.GetServiceCount(WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByIDLactNo.AsInteger);

               if FServiceCount <> '0' then
                  if ( WinData.Events.State = dsInsert ) then
                     begin
                        //   12/04/19 [V5.8 R8.8] /MK Bug Fix - If there is no default bull then the EventDesc never mentioned the service count.
                        WinData.EventsEventDesc.Value := Format(dbComment.Text + ' %s', [FServiceCount]);
                        if ( (PlannedBull.Text = '<None>') and (VarIsNull(PlannedBull.KeyValue)) ) then
                           WinData.EventsEventDesc.Value := WinData.EventsEventDesc.Value + PlannedBull.Text;
                     end;
            end
         else
            begin
               sbNewBull.Visible := False;
               Nav.VisibleButtons := [kwnbDelete,kwnbPost,kwnbCancel];
               WinData.ModifyingEvent := True;
            end;
         BullSep.Visible := sbNewBull.Visible;
         // Set the Animal Number to the one on the Grid
         SetSearchField ( SearchForAnimal );

         FCountry := HerdLookup.CountryByHerdID(WinData.AnimalFileByIDHerdID.AsInteger);

         ShowModal;
      finally
         Free;
      end;
end;


procedure TfServices.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfServices.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ( HerdLookup.qICBFSexedSemenType.Active ) then
      HerdLookup.qICBFSexedSemenType.Active := False;
   CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified );
end;

procedure TfServices.FormActivate(Sender: TObject);
begin
   // Do a check to see how services have been recorded for this lactation, use the number for the comment eg Service 3
   lNo.Caption := NoLabel;

   if ( FAddOrAmend = AddService ) then
      begin
         FBullList := TTable.Create(nil);
         FBullList.DatabaseName := AliasName;
         FBullList.TableName := 'tmpServiceBulls';
         FBullList.FieldDefs.Add('ID',ftAutoInc);
         FBullList.FieldDefs.Add('AnimalID',ftInteger);
         FBullList.FieldDefs.Add('AnimalNo',ftString,10);
         FBullList.FieldDefs.Add('Name',ftString,30);
         FBullList.IndexDefs.Add('iID','ID',[ixUnique, ixPrimary]);
         FBullList.IndexDefs.Add('iAnimalID','AnimalID',[ixUnique, ixCaseInsensitive]);
         FBullList.CreateTable;
         FBullList.Open;
         BuildAddServiceBullList;
      end;

   if WinData.Events.State = dsInsert then
      begin
         DataSource1.DataSet := FBullList;
         PlannedBull.LookupField := 'AnimalID';
      end
   else if WinData.Events.State = dsEdit then
      begin
         DataSource1.DataSet := HerdLookup.qServiceHistBullUsed;
         PlannedBull.LookupField := 'ID';
      end;

   DataSource1.DataSet.Close;
   qGenDam.Close;
   DataSource1.DataSet.Open;
   qGenDam.Open;
   if ( not(HerdLookup.qStockBulls.Active) ) then
      HerdLookup.qStockBulls.Open;
   WinData.qServiceType.Open;
   CalcCalvingDate;

   //   24/04/17 [V5.6 R5.8] /MK Bug Fix - Only check for planned bull on form open - Milo Murphy.
   if ( WinData.Events.State = dsInsert ) then
      AssignPlannedBull;

   if ( not(HerdLookup.qICBFSexedSemenType.Active) ) then
      HerdLookup.qICBFSexedSemenType.Active := True;

   inherited FormActivate(Sender);
   Timer1.enabled := True;
end;

procedure TfServices.PlannedBullChange(Sender: TObject);
begin
   SetModifiedFlag;
   WinData.SetEventsToEdit;
   CalcCalvingDate;
end;

procedure TfServices.ServiceTypeChange(Sender: TObject);
begin
   SetModifiedFlag;
   if ServiceType.Text = '<New>' then
      //dbServiceType.Clear
   else
       WinData.SetEventsToEdit;

   //   21/04/17 [V5.6 R5.8] /MK Bug Fix - Removed the assigning of planned bull after service type is changed.

   // allow entry of genetic dam if embryo transfer service type
   if (ServiceType.Text = 'Embryo Transfer') or (ServiceType.Text = 'ET') or
                                                (ServiceType.Text = 'E.T.') then
      begin
         lGenDam.Visible := True;
         lDonor.Visible:= True;
         //dbcGenDam.Visible := True;
         dbGenenticDam.Visible := True;
         lET1No.Visible := True;
         dbeET1No.Visible := True;
      end
   else
      begin
         lGenDam.Visible := False;
         lDonor.Visible:= False;
         //dbcGenDam.Visible := False;
         dbGenenticDam.Visible := False;
         lET1No.Visible := False;
         dbeET1No.Visible := False;
         dbeET1No.Clear;
      end;
end;

procedure TfServices.CalcCalvingDate;
var
   ProjDate   : TDateTime;
   CalvIndex : Integer;
   BullID : Integer;
begin
   ProjCalvingDate.Text := '';
   ProjCalvingInterval.Text := '0';

   if ( PlannedBull.Value <> '' ) and ( PlannedBull.Value <> '0' ) then
      begin
         try
            BullID := StrToInt( PlannedBull.Value );
         except
            BullID := 0;
         end;

         if ( BullID = 0 ) then Exit;

         WinData.CalcCalvingDate(WinData.AnimalFileByIDID.AsInteger,
                                 WinData.AnimalFileByIDLactNo.AsInteger,
                                 BullID, DateOfService.Field.AsDateTime,
                                 ProjDate, CalvIndex);

         if ( ProjDate > 0 ) then
            ProjCalvingDate.Text := FormatDateTime('dd/mm/yyyy',ProjDate);
         if ( CalvIndex > 0 ) then
            ProjCalvingInterval.Text := IntToStr(CalvIndex);
      end;
end;

procedure TfServices.DateOfServiceExit(Sender: TObject);
begin
   CalcCalvingDate;
end;

procedure TfServices.ServiceTypeCloseUp(Sender: TObject);
begin
   If ServiceType.Value = '0' Then
      begin
         GenLookUpType := TServiceType;
//           WinData.CreateAndShowForm(TfGenLookSetUp);          // changed 12.99 to show
         uGenLookSetUp.ShowTheForm(TRUE);                      // blank record on open
      end;
   CalcCalvingDate;
end;

procedure TfServices.dbCommentExit(Sender: TObject);
begin
   CalcCalvingDate;
end;

procedure TfServices.NavClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if (Button = kwnbPost) then
      begin
         // 17/02/2009 /SP
         if Preferences.ValueAsBoolean[cGSService_RecordCScore] then
            begin
               fmConditionScoreEvent.ClassDefaultAssociatedEventType := CServiceEvent;
               fmConditionScoreEvent.ClassDefaultAssociatedEventID := WinData.EventID.AsInteger;
               TfmConditionScoreEvent.LoadEvent(WinData.AnimalFileByIDID.AsInteger,0,0,
                 WinData.EventsEventDate.AsDateTime,False,TfmConditionScoreEvent);
            end;

         {// 17/02/2009 /SP
         if Preferences.ValueAsBoolean[cGSService_RecordHealth] then
            begin
               TfmHealthEvent.LoadEvent(WinData.AnimalFileByIDID.AsInteger,0,
                 WinData.EventsEventDate.AsDateTime,False,TfmHealthEvent);
            end;
         }

         WinData.Events.DisableControls;
         if MessageDLG('Service Saved - Record Another',mtInformation,[mbYes,mbNo],0) = mrYes then
            begin
               Windata.Events.Append;
               WinData.Events.EnableControls;
               //DateOfService.Date := ServiceDateDef;
               //PlannedBull.Value :=  PlanBullDef;
               if ServiceDefaults <> nil then
                  begin
                     if ServiceDefaults.ServiceTabDefault = stdAnimalNo then
                        SearchForAnimal.SetFocus
                     else
                        PlannedBull.SetFocus
                  end;
               if FServiceCount <> '0' then
                  if ( WinData.Events.State = dsInsert ) then
                      WinData.EventsEventDesc.Value := Format(dbComment.Text + ' %s', [FServiceCount]);
            end
         else
            begin

               WinData.Events.EnableControls;
               Close;
            end;
      end
   else
      Close;
end;

procedure TfServices.SearchForAnimalButtonClick(Sender: TObject);
begin
   SearchButtonClick(Sender,lNo);
   SetSearchField(SearchForAnimal);
end;

procedure TfServices.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
   SearchAnimalChange(Sender);
end;

procedure TfServices.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('service.htm');
end;

procedure TfServices.NavBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
var
   Msg : string;
begin
   if (Button = kwnbPost) then
      // Save defaults
      begin
         //   27/08/15 [V5.4 R7.4] /MK Change - Don't allow service to be saved without a bull being selected - GL request.
         if ( (PlannedBull.Text = '<None>') and (VarIsNull(PlannedBull.KeyValue)) ) then
            begin
               MessageDlg('Bull Used must be selected before saving.',mtError,[mbOK],0);
               SysUtils.Abort;
            end;

         WinData.LookUpDamSire.Close;
         WinData.LookUpDamSire.Open;
         if ((PlannedBull.Text <> '<None>') and not(VarIsNull(PlannedBull.KeyValue))) then
            begin
               WinData.CheckInBreeding(SearchForAnimal.Text,PlannedBull.KeyValue,WinData.AnimalFileByIDDamID.AsInteger,WinData.AnimalFileByIDSireID.AsInteger);

               {
               if WinData.AnimalFileByID.FieldByName('SireID').AsInteger > 0 then
                  begin
                     if WinData.AnimalFileByID.FieldByName('SireID').AsInteger = PlannedBull.KeyValue then
                        MessageDlg('WARNING: Service Sire is sire of this cow',mtWarning,[mbOK],0)
                     else
                        begin
                           if WinData.LookUpDamSire.Locate('ID', WinData.AnimalFileByIDSireID.AsInteger,[] ) then
                              begin
                                 SSIRE := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                                 if SSIRE = PlannedBull.KeyValue then
                                    MessageDlg('WARNING: Service Sire, is the Sires Sire of this cow',mtWarning,[mbOK],0)
                                 else
                                    begin
                                       if WinData.LookUpDamSire.Locate('ID',SSIRE,[] ) then
                                          begin
                                             SSSIRE := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                                             if SSSIRE = PlannedBull.KeyValue then
                                                MessageDlg('WARNING: Service Sire, is the Sires Sire Sire of this cow',mtWarning,[mbOK],0);
                                          end;
                                    end;
                              end;
                        end;
                  end;

               if WinData.AnimalFileByIDDamID.AsInteger > 0 then
                  begin
                     if WinData.LookUpDamSire.Locate('ID', WinData.AnimalFileByIDDamID.AsInteger,[] ) then
                        begin
                           DSIRE := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                           if DSIRE = PlannedBull.KeyValue then
                              MessageDlg('WARNING: Service Sire, is the Dams Sire of this cow',mtWarning,[mbOK],0)
                           else
                              begin
                                 if WinData.LookUpDamSire.Locate('ID', DSIRE,[] ) then
                                    begin
                                       DSSIRE := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                                       if DSSIRE = PlannedBull.KeyValue then
                                          MessageDlg('WARNING: Service Sire, is the Dams Sire Sire of this cow',mtWarning,[mbOK],0)
                                    end;
                              end;
                        end;
                  end;
               }
            end;

         if servicetype.Text <> 'Embryo Transfer' then
            //dbcGenDam.Value := '';
            dbGenenticDam.EditValue := '';
         ServiceDateDef := DateOfService.Date;
         PlanBullDef := PlannedBull.Value;

      end;
end;

procedure TfServices.sbNewBullClick(Sender: TObject);
var
   dsState : TDataSetState;
begin

   WinData.Events.DisableControls;
   try
      dsState := WinData.Events.State;
      if ( dsState = dsInsert ) then
         WinData.Events.Cancel;
      try
         MenuForm.BrowseSireRegister1Click(MenuForm.BrowseSireRegister1);
         Screen.Cursor := crHourGlass;
         DataSource1.DataSet.Close;
         DataSource1.DataSet.Open; // Open bull listing with added bull
         WinData.EventType := TService; // set the event type
         if ( dsState = dsInsert ) then
            AddEvent; // insert new event
      finally
         Screen.Cursor := crDefault;
         //WinData.AnimalFileByID.FreeBookMark(bk); // free the current bookmark.
      end;
   finally
      WinData.Events.EnableControls;
   end;
end;

procedure TfServices.DateOfServiceChange(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCalvingDate;
end;

procedure TfServices.ServiceTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_Tab then
      Key := VK_RETURN;
end;

procedure TfServices.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,dbDefaults.Glyph, cBtnImgDefault);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph, cBtnImgHelp);
   lET1No.Visible := False;
   dbeET1No.Visible := False;
end;

procedure TfServices.BullUsed1Click(Sender: TObject);
begin
   if ServiceDefaults <> nil then
      begin
         if ( Sender is TMenuItem ) then
            begin
               if TMenuItem(Sender).Checked then
                  TMenuItem(Sender).Checked := False
               else
                  TMenuItem(Sender).Checked := True;

               if ( Sender as TMenuItem ).GroupIndex = 0 then
                  case TMenuItem(Sender).Tag of
                     0 : ServiceDefaults.StoreBullUsed := TMenuItem(Sender).Checked;
                     1 : ServiceDefaults.StoreServiceType := TMenuItem(Sender).Checked;
                     2 : ServiceDefaults.StoreNumOfStraws := TMenuItem(Sender).Checked;
                     3 : ServiceDefaults.StoreEventDate := TMenuItem(Sender).Checked;
                     4 : ServiceDefaults.StoreInseminator := TMenuItem(Sender).Checked;
                     5 : ServiceDefaults.StoreComment := TMenuItem(Sender).Checked;
                  end
               else if ( Sender as TMenuItem ).GroupIndex = 1 then
                  begin
                     if TMenuItem(Sender).Tag = 0 then
                        ServiceDefaults.ServiceTabDefault := stdAnimalNo
                     else
                        ServiceDefaults.ServiceTabDefault := stdBullUsed;
                  end;
            end;
      end;
end;

procedure TfServices.SelectAll1Click(Sender: TObject);
var
  i : Byte;
begin
   if ServiceDefaults <> nil then
      ServiceDefaults.StoreAll;
   for i := 0 to 5 do
      begin
         if PopupMenu1.Items[i].GroupIndex = 0 then
            PopupMenu1.Items[i].Checked := TRUE;
      end;
end;

procedure TfServices.DeselectAll1Click(Sender: TObject);
var
  i : Byte;
begin
   if ServiceDefaults <> nil then
      ServiceDefaults.StoreNone;
   for i := 0 to 5 do
      begin
         if PopupMenu1.Items[i].GroupIndex = 0 then
            PopupMenu1.Items[i].Checked := FALSE;
      end;
end;

function TfServices.GetServiceCount: string;
begin
   Result := '0';
   with TQuery.Create(nil) do
      try
         DataBaseName := WinData.KingData.DatabaseName;
         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) ServCount FROM Events ');
         SQL.Add('WHERE ((AnimalID = "'+IntToStr(WinData.AnimalFileByIDID.AsInteger)+'") ');
         SQL.Add('   AND (AnimalLactNo = "'+IntToStr(WinData.AnimalFileByIDLactNo.AsInteger)+'")) ');
         SQL.Add('AND (EventType = '+IntToStr(cServiceEvent)+')');
         Open;
         try
            if NOT IsEmpty then
               begin
                  First;
                  Result := IntToStr(StrToInt(FieldByName('ServCount').AsString) + 1)
               end
            else
               Result := '1';
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfServices.LoadDefaults;
begin
   if ServiceDefaults <> nil then
      begin
         BullUsed1.Checked := ServiceDefaults.StoreBullUsed;
         ServiceType1.Checked := ServiceDefaults.StoreServiceType;
         NoOfStraws1.Checked := ServiceDefaults.StoreNumOfStraws;
         EventDate1.Checked := ServiceDefaults.StoreEventDate;
         Inseminator1.Checked := ServiceDefaults.StoreInseminator;
         AnimalNo1.Checked := ServiceDefaults.ServiceTabDefault = stdAnimalNo;
         BullUsed2.Checked := not (AnimalNo1.Checked );
      end;
end;

procedure TfServices.NoOfStrawsChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfServices.dbCommentChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfServices.dbcGenDamChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfServices.cbTechnicianChange(Sender: TObject);
begin
   SetModifiedFlag;

   If cbTechnician.Value = '0' Then
      begin
         GenLookUpType := TObservedBy;
         uGenLookSetUp.ShowTheForm(TRUE);               // blank entry on dbl-clk
      end
   else
      WinData.SetEventsToEdit;

end;

procedure TfServices.Timer1Timer(Sender: TObject);
begin
   Timer1.enabled := False;

   if (WinData.Events.State = dsInsert) then
      begin
         if not WinData.ClearPostivePregDiag(WinData.EventsAnimalID.AsInteger, WinData.EventsAnimalLactNo.AsInteger, WinData.EventsEventDate.AsDateTime) then
            begin
               WinData.events.Cancel;
               sbExit.Click;
            end;
      end;
end;

//   11/05/12 [V5.0 R5.5] /MK Bug Fix - If User Changes Their Mind On The Bull The Comment Saves Both Bulls.
procedure TfServices.PlannedBullCloseUp(Sender: TObject);
var
   GenLookID : Integer;
begin
   SetModifiedFlag;
   GenLookID := 0;
   //   13/04/17 [V5.6 R5.7] /MK Bug Fix - Check if PlannedBull.KeyValue is not null first before other checks on PlannedBull.KeyValue - GL reported.
   if ( PlannedBull.KeyValue <> Null ) and ( Length(PlannedBull.KeyValue) > 0 ) and ( PlannedBull.KeyValue <> '0' ) then
      begin
         if ( WinData.IsActiveAIBull(StrToInt(PlannedBull.Value)) ) then
            begin
               if ( WinData.GenLookUp.Locate('LookupCode', 'AI', []) ) then
                  begin
                     GenlookID := WinData.GenLookUp.Lookup('LookupCode', 'AI', 'ID');
                     if ( GenlookID > 0 ) then
                        ServiceType.KeyValue := GenlookID;
                  end;
            end
         else if ( HerdLookup.qStockBulls.Locate('ID',StrToInt(PlannedBull.Value),[]) ) then
            begin
               if WinData.GenLookUp.Locate('Description', cServiceType_Naturual, [loCaseInsensitive]) then
                  begin
                     GenlookID := WinData.GenLookUp.FieldByName('ID').AsInteger;
                     if ( GenlookID > 0 ) then
                        ServiceType.KeyValue := GenlookID;
                  end;
            end;
      end;
   if dbComment.Text <> '' then
      begin
         if ( PlannedBull.Text <> '' ) then
            begin
               if FServiceCount <> '0' then
                  begin
                     dbComment.Text := 'Service';
                     if PlannedBull.Text <> '' then
                        WinData.EventsEventDesc.Value := Format(dbComment.Text + ' %s', [FServiceCount]) + ' / ' + PlannedBull.Text ;
                  end;
            end;
      end;
end;

procedure TfServices.cbSexedSemenChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfServices.dbGenenticDamPropertiesEditValueChanged(Sender: TObject);
begin
   //   21/03/16 [V5.5 R5.4] /MK Bug Fix - Added check to see if the user has change the donor dam of the service and show
   //                                      an information message explaining to the user that the donor dam of the calf
   //                                      should also be changed - Shane Lawlor. 
   if ( not(dbGenenticDam.Visible) ) then Exit;
   if ( FAddOrAmend = AmendService ) then
      if ( dbGenenticDam.EditValue <> WinData.Services.FieldByName('GeneticDam').AsVariant ) then
          MessageDlg('If this cow has had a calving event after this service was recorded'+cCRLF+
                     'then the genetic dam of the calf must also be changed.'+cCRLF+
                     'Double-click the calf on the main grid and change the ET Dam.',mtInformation,[mbOK],0);
end;

procedure TfServices.FormDestroy(Sender: TObject);
begin
   if ( HerdLookup.qStockBulls.Active ) then
      HerdLookup.qStockBulls.Close;
   //   12/04/19 [V5.8 R8.8] /MK Bug Fix - Need to free the WinData.FBreedingDataHelper if I'm using it.
   if ( WinData.FBreedingDataHelper <> nil ) then
      FreeAndNil(WinData.FBreedingDataHelper);
   if ( FAddOrAmend = AddService ) then
      if ( FBullList <> nil ) then
         begin
            FBullList.Close;
            FBullList.DeleteTable;
            FreeAndNil(FBullList);
         end;
end;

procedure TfServices.AssignPlannedBull;
var
   iPlannedBull : Integer;
begin
   // 01/08/2013 - SP - Attempt to recall the planned bull ONLY if the event is being created. (not edited)
   // 02/10/12 [V5.1 R0.1] /MK Additional Feature - If PlannedBull Event Exists then Default Service Bull to Planned Bull.
   iPlannedBull := WinData.FEventDataHelper.GetPlannedBull(WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByIDLactNo.AsInteger,DateOfService.Date);
   if ( not(DataSource1.DataSet.Active) ) then
      DataSource1.DataSet.Open;
   if ( iPlannedBull > 0 ) then
      if ( DataSource1.DataSet.Locate('AnimalID',iPlannedBull,[]) ) or ( iPlannedBull = 0 ) then
         begin
            WinData.Services.Edit;
            WinData.Services.FieldByName('ServiceBull').AsInteger := iPlannedBull;
            WinData.Services.Post;
            if ( FServiceCount <> '0' ) then
               if ( WinData.Events.State = dsInsert ) then
                  if ( Length(PlannedBull.Text) > 0 ) then
                     WinData.EventsEventDesc.Value := Format('Service %s', [FServiceCount]) + ' / ' + PlannedBull.Text ;
         end;
end;

procedure TfServices.BuildAddServiceBullList;
var
   BullInfo : TAnimal;
   qPlannedBulls : TQuery;

   procedure AddBullToFBullList ( ABullInfo : TAnimal );
   begin
      if ( ABullInfo = nil ) then Exit;
      if ( not(FBullList.Locate('AnimalID',ABullInfo.Id,[])) ) then
         try
            FBullList.Append;
            FBullList.FieldByName('AnimalID').AsInteger := ABullInfo.Id;
            FBullList.FieldByName('AnimalNo').AsString := ABullInfo.AnimalNo;
            FBullList.FieldByName('Name').AsString := ABullInfo.Name;
            FBullList.Post;
         except
            on e : Exception do
               begin
                  ShowMessage(e.Message);
                  FBullList.Cancel;
               end;
         end;
   end;

begin
   if ( WinData.FBreedingDataHelper = nil ) then
      WinData.FBreedingDataHelper := WinData.BreedingDataHelper;
   if ( not(WinData.FBreedingDataHelper.TempPlannedBulls.Active) ) then
      WinData.FBreedingDataHelper.TempPlannedBulls.Open;
   if ( WinData.FBreedingDataHelper.TempPlannedBulls.RecordCount = 0 ) then
      WinData.FBreedingDataHelper.CreateTempTable(CPlannedBull);

   qPlannedBulls := TQuery.Create(nil);
   with qPlannedBulls do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.EventID, E.AnimalID, E.AnimalLactNo, B.PlannedBull, B.RcmdBullInd');
         SQL.Add('FROM '+WinData.FBreedingDataHelper.TempPlannedBulls.TableName+' E');
         SQL.Add('LEFT JOIN Bullings B ON (B.EventID = E.EventID)');
         SQL.Add('WHERE E.AnimalID = :AnimalID');
         SQL.Add('AND   E.AnimalLactNo = :LactNo');
         SQL.Add('AND   B.RcmdBullInd IS NOT NULL');
         SQl.Add('ORDER BY B.RcmdBullInd');
         Params[0].AsInteger := WinData.AnimalFileByIDID.AsInteger;
         Params[1].AsInteger := WinData.AnimalFileByIDLactNo.AsInteger;
         Open;
         if ( RecordCount > 0 ) then
            begin
               First;
               while ( not(Eof) ) do
                  begin
                     BullInfo := GetAnimal(FieldByName('PlannedBull').AsInteger);
                     AddBullToFBullList(BullInfo);
                     qPlannedBulls.Next;
                  end;
            end;
      finally
         if ( qPlannedBulls <> nil ) then
            FreeAndNil(qPlannedBulls);
      end;

   HerdLookup.qServiceBullUsed.Close;
   HerdLookup.qServiceBullUsed.Open;
   HerdLookup.qServiceBullUsed.First;
   while ( not(HerdLookup.qServiceBullUsed.Eof) ) do
      begin
         BullInfo := GetAnimal(HerdLookup.qServiceBullUsed.FieldByName('ID').AsInteger);
         AddBullToFBullList(BullInfo);
         HerdLookup.qServiceBullUsed.Next;
      end;

   FBullList.Close;
   FBullList.Open;

   DataSource1.DataSet := FBullList;
end;

end.
