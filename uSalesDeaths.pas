{
   15/11/10 [V4.0 R5.6] /MK Additional Feature - On Customer.Change Then dbComment.Text := Customer.Text

   29/11/10 [V4.0 R6.0] /MK Change - Moved Check For Brucellosis and No. Of Days To DairyData From uSalesDeaths.

   18/04/11 [V4.0 R9.7] /MK Change - New Button To Look At WinData.KillOutPercs.db.

   25/05/11 [V4.1 R1.6] /MK Additional Feature - Changed Tab Order - GL.

   15/11/12 [V5.1 R1.0] /MK Additional Feature - Added functionality for CrushXMLExport.

   09/01/13 [V5.1 R3.7] /MK Change - Deaths - show the Deductions field and change label caption to "Knackery Costs'.
                                   - Removed StatusBar.Panels[7].Caption as its not visible in the current form size and
                                     its too big to be resizing the form.

   28/03/13 [V5.1 R5.4] /MK Change - Changed Customers combo LookupSource to new WinData.QueryCustomers.

   15/07/13 [V5.1 R8.5] /MK Bug Fix - CustomersChange - No locate of Customers.Value. Always set to first customer deduction + transport.

   22/10/13 [V5.2 R3.8] /MK Bug Fix - Accounts Link icon going into KillOut Percs.

   06/12/16 [V5.5 R2.1] /MK Bug Fix - Don't disable the SearchForAnimal control if editing the sale event as the disabled look of the control
                                      does not show the text of the animal number/tag number. Instead remove events from the control
                                      and remove the image from the control if editing the sale event. Also in OnFormShow set the focus to the
                                      SearchForAnimal control if adding and set the focus to the DateOfSaleDeath if editing - Dermot Gillespie reported.

   23/09/16 [V5.5 R9.6] /MK Bug Fix - ShowSalesDeaths - SearchForAnimal.OnChange was defaulting to SearchForAnimalButtonClick instead of SearchForAnimalChange like the properties indicate.

   24/04/17 [V5.6 R8.0] /MK Change - PriceExit, PricePerKgExit & ColdDeadWtExit - Made changes so that no matter what field the user enters a value into
                                     it will re-calculate the other fields as well.
                                   - WeightExit, PriceExit & PricePerKgExit - Changes made to allow for user to enter a live weight and let the program
                                                                              calculate the price/kg based on LiveWeight - requested by Michael Lyons.
                                   - * NOTE * - We are not calculating the Dead Weight from the Live Weight if the Kill Out % is entered - GL request.

  18/09/17 [V5.7 R3.0] /MK Change - SaleDeathNavBeforeAction - One procedure in Groups deletes the animal from group and ends the feed.

  22/09/17 [V5.7 R3.0] /MK Change - SaleDeathNavBeforeAction - Added check for feed events after the sales date.

  12/12/17 [V5.7 R6.3] /MK Change - lCosts - Changed label caption to Deduct./Transp. from Other Costs.
                                  - lDeductions - Changed label caption to Other Costs from Deductions

  24/01/18 [V5.7 R7.5] /MK Bug Fix - PricePerKgExit - If user has price per kg and dead weight then change price to calculated value.

  07/06/18 [V5.8 R0.6] /MK Change - AddAnimalToXMLFile - Add NationalID number to CrushXML file.

  27/09/18 [V5.8 R3.0] /MK Additional Feature - Added new TAddOrAmendSaleDeath type for AddDeath.
                           Change - Changed TAddOrAmendSaleDeath AddSaleDeath to AddSale.
                                  - Changed all if FAddOrAmend checks to look at both AddSale and AddDeath.
                                  - If FAddOrAmend is AddDeath then default AnimalStatus to Died.

  17/10/18 [V5.8 R4.0] /MK Bug Fix - CustomersChange - Only set the comment to the customer name if (adding or (editing and customer name has changed)).

  06/11/18 [V5.8 R3.5] /MK Bug Fix - SaleDeathNavBeforeAction - Only remove animal from group if its in a feed group.

  26/03/19 [V5.8 R8.3] /MK Additional Feature - If editing a sale/death event then open then change Customers.LookupSource to new WinData.dsQueryAllCustomers and
                                                also close/open new WinData.QueryAllCustomers when user clicks the Add button in the Customers drop-down-list - Una Carter.

  09/07/21 [V6.0 R1.6] /MK Change - bDeleteClick - When deleting the sale event check if there is already an animal in the herd
                                                   with this tag number and don't allow the event to be deleted.
}

unit uSalesDeaths;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, RXLookup, ToolEdit,
  RXDBCtrl, Buttons, DBTables, RXCtrls, uListAnimals, CurrEdit,
  ComCtrls, ToolWin, kwDBNavigator,GenTypesConst, cxControls, dxStatusBar,
  cxStyles, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, uCrushXML, uAnimal;

type
  TAddOrAmendSaleDeath = (AddSale, AddDeath, AmendSaleDeath);
  TfSalesDeaths = class(TkwEventForm)
    KillDied: TPanel;
    MyQuery: TQuery;
    lCustomer: TLabel;
    lSaleDeathDate: TLabel;
    lNo: TLabel;
    AnimalStatusLabel: TLabel;
    qNumAnimals: TQuery;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbDelete: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    SaleDeathNav: TkwDBNavigator;
    ToolButton4: TToolButton;
    lCosts: TLabel;
    CommentLabel: TLabel;
    NatIDNumLabel: TLabel;
    lCulling: TLabel;
    Customers: TRxDBLookupCombo;
    DateOfSaleDeath: TDBDateEdit;
    dbComment: TDBEdit;
    SearchForAnimal: TComboEdit;
    AnimalStatus: TDBRadioGroup;
    rxcCulling: TRxDBLookupCombo;
    ceCosts: TCurrencyEdit;
    NatIDNum: TDBText;
    sbKillOutPercs: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbDefaults: TRxSpeedButton;
    lDefault: TLabel;
    CustCosts: TDBEdit;
    pSalesControls: TPanel;
    PriceLabel: TLabel;
    GradeLabel: TLabel;
    KillOutLabel: TLabel;
    SaleWtLabel: TLabel;
    PricePerKgLabel: TLabel;
    ColdDeadWtLabel: TLabel;
    KillNumberLabel: TLabel;
    lWgtDate: TLabel;
    lSalesGrp: TLabel;
    Weight: TDBEdit;
    Price: TDBEdit;
    ColdDeadWt: TDBEdit;
    Grade: TDBEdit;
    PricePerKg: TCurrencyEdit;
    KillNumber: TDBEdit;
    cbSalesGrp: TComboBox;
    dbeWgtDate: TDBDateEdit;
    KillOut: TDBEdit;
    lDisposalType: TLabel;
    dbcmbDisposalType1: TRxDBLookupCombo;
    StatusBar: TdxStatusBar;
    lbFallenStkNo: TLabel;
    dbeFallenStkNo: TDBEdit;
    lDeductions: TLabel;
    TotalDeductions: TDBEdit;
    dbcmbDisposalType: TcxDBLookupComboBox;
    cxStyleRepository1: TcxStyleRepository;
    RxSpeedButton2: TRxSpeedButton;
    ToolButton6: TToolButton;
    procedure CustomersCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SaleDeathNavBeforeAction(Sender: TObject; Button: TKNavigateBtn);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure CustomersChange(Sender: TObject);
    procedure WeightExit(Sender: TObject);
    procedure PriceExit(Sender: TObject);
    procedure PricePerKgExit(Sender: TObject);
    procedure ColdDeadWtExit(Sender: TObject);
    procedure SearchForAnimalExit(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnimalStatusExit(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure SaleDeathNavClick(Sender: TObject; Button: TKNavigateBtn);
    procedure sbHelpClick(Sender: TObject);
    procedure SearchForAnimalEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DateOfSaleDeathChange(Sender: TObject);
    procedure sbKillOutPercsClick(Sender: TObject);
    procedure AnimalStatusClick(Sender: TObject);
    procedure sbDefaultsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AnimalStatusChange(Sender: TObject);
    procedure PriceChange(Sender: TObject);
    procedure KillOutChange(Sender: TObject);
    procedure GradeChange(Sender: TObject);
    procedure rxcCullingChange(Sender: TObject);
    procedure dbCommentChange(Sender: TObject);
    procedure dbcmbDisposalType1Change(Sender: TObject);
    procedure ColdDeadWtChange(Sender: TObject);
    procedure WeightChange(Sender: TObject);
    procedure KillNumberChange(Sender: TObject);
    procedure PricePerKgChange(Sender: TObject);
    procedure dbeWgtDateChange(Sender: TObject);
    procedure cbSalesGrpChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AnimalStatusEnter(Sender: TObject);
    procedure dbcmbDisposalTypePropertiesInitPopup(Sender: TObject);
    procedure dbcmbDisposalTypePropertiesCloseUp(Sender: TObject);
    procedure dbcmbDisposalTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButton2Click(Sender: TObject);
  private
    { private declarations }
    WeightTop : Integer;
    WeightLeft : Integer;
    WeightTabOrder : Integer;
    SaleWtLabelTop : Integer;
    SaleWtLabelLeft : Integer;
    OldAnimalID : Integer;
    CurrentAnimalID : Integer;
    nOriginalGroupID : Integer;
    CustID : integer;
    SaleDeathSaved : Boolean;
    StatusInfo : TStatusInfo;
    fCountry : TCountry;
    FAddOrAmend : TAddOrAmendSaleDeath;
    procedure CalcNumAnimals;
    procedure CheckSalesEvent;
    procedure CheckSaleDate;
    function CustomerEligSlght : Boolean;
    procedure ShowHideSaleControls;
    procedure SetupScreen(ACountry : TCountry);
    procedure GetStatusInfo;
    procedure AddToCrushXML;
    procedure AllocatePricePerKg;
  public
    { public declarations }
  end;

function ShowSalesDeaths(AddorAmend : TAddOrAmendSaleDeath; PreSalesInd : Boolean ) : Boolean;
var
   fSalesDeaths : TfSalesDeaths;

implementation
Uses
    Dialogs,
    uCustomers,
    uSalePurchDelete,
    Def,
    DairyData,
    KRoutines, uHerdLookup, uCrush, uCrushHelper, KDBRoutines,
    uSalesKillOutPercs;

{$R *.DFM}

function ShowSalesDeaths(AddorAmend : TAddOrAmendSaleDeath; PreSalesInd : Boolean ) : Boolean;
var
   EventBookmark : TBookmark;
begin
   with TfSalesDeaths.Create(nil) do
      try
         // var passed to ShowSalesDeaths Result is used to
         // indicate if a refresh of animal grid is required.
         FAddOrAmend := AddorAmend;

         SaleDeathSaved := False;
         lbFallenStkNo.Visible := False;
         dbeFallenStkNo.Visible := False;

         //Need to set the global IsItPreSale boolean.
         WinData.IsItPreSale := PreSalesInd;
         //Need to record Current and Old Animal ID's for comparison later

         OldAnimalID := 0;  //No Old Animal ID
         CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;

         WinData.EventType := TSaleDeath;
         ThisCombo := SearchForAnimal;
         ThisNav := SaleDeathNav;
         ThisComment := dbComment;
         pSexToList := '';

         SaleDeathNav.VisibleButtons := [kwnbPost,kwnbCancel];
         // Set the Animal Number to the one on the Grid
         SetSearchField(SearchForAnimal);
         CheckSalesEvent;

         if ( FAddOrAmend = AmendSaleDeath ) then
            begin
               WinData.QueryAllCustomers.Close;
               WinData.QueryAllCustomers.Open;
            end
         else
            begin
               WinData.QueryCustomers.Close;
               WinData.QueryCustomers.Open;
            end;

         // set add/amend boolean
         if ( AddorAmend in [AddSale, AddDeath] ) then
            begin
               WinData.ModifyingEvent := False;
               SearchForAnimal.OnButtonClick := SearchForAnimalButtonClick;
               //   23/09/16 [V5.5 R9.6] /MK Bug Fix - SearchForAnimal.OnChange was defaulting to SearchForAnimalButtonClick instead of SearchForAnimalChange like the properties indicate.
               SearchForAnimal.OnChange := SearchForAnimalChange;
               SearchForAnimal.OnEnter := SearchForAnimalEnter;
               SearchForAnimal.OnExit := SearchForAnimalExit;
               SearchForAnimal.ReadOnly := False;
               WinData.LoadBtnImage(WinData.ImageList16x16,SearchForAnimal.Glyph,0);

               { SP 16/10/2002 Load Defaults }
               if WinData.sDefNOTHeld = False then
                  begin
                     lDefault.Visible := True;
                     if Price.Field.IsNull then
                        begin
                           Price.Field.Value := WinData.sPriceDef;
                           Price.Refresh;
                        end;

                     if Weight.Field.IsNull then
                        begin
                           Weight.Text := FloatToStr(WinData.sWeightDef);
                           Weight.Refresh;
                        end;

                     if dbComment.Text = '' then
                        begin
                           WinData.Events.FieldByName('EventDesc').Value := WinData.sCommentDef;
                           dbComment.Text := WinData.sCommentDef;
                           dbComment.Refresh;
                        end;

                     if cbSalesGrp.Text = '' then
                        begin
                           cbSalesGrp.ItemIndex := cbSalesGrp.Items.IndexOf(WinData.sGroupDef);
                           cbSalesGrp.Refresh;
                        end;
                  end
               else
                  lDefault.Visible := False;

               if ( FAddOrAmend = AddDeath ) then
                  begin
                     AnimalStatus.ItemIndex := 1;
                     WinData.Events.FieldByName('EventDesc').AsString := 'Death';
                  end;
            end
         else
            begin
               SearchForAnimal.OnButtonClick := nil;
               SearchForAnimal.OnChange := nil;
               SearchForAnimal.OnEnter := nil;
               SearchForAnimal.OnExit := nil;
               SearchForAnimal.ReadOnly := True;
               SearchForAnimal.Glyph := nil;

               WinData.ModifyingEvent := True;
            end;

         SetupScreen(WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger));
         try
            if Customers.Text <> '<Add>' then
               CustomersChange(nil);
         except
         end;
         ShowModal;
      finally
         Result := SaleDeathSaved;
         Free;
      end;
end;

procedure TfSalesDeaths.CustomersCloseUp(Sender: TObject);
var
   ID : Integer;
begin
    {
    do not allow user to add customer to offical dard customer listing.
    do not allow user to add to customers if Nireland Herd and death event recorded.
    The reason for this being, the customer list should only contain NI offical customers,
    a list populated by uupdateTables unit.
    }
   if ( ( FCountry = NIreland ) and ( AnimalStatus.ItemIndex = 1 ) ) then Exit;

   if (Customers.Value = '0') then
      begin // SP
         uCustomers.ShowTheForm(TRUE, ID);                            // blank record on open
         if ( FAddOrAmend = AmendSaleDeath ) then
            begin
               WinData.QueryAllCustomers.Close;
               WinData.QueryAllCustomers.Open;
            end
         else
            begin
               WinData.QueryCustomers.Close;
               WinData.QueryCustomers.Open;
            end;
         Customers.KeyValue := ID;
         CustomersChange(nil);
      end;
end;

procedure TfSalesDeaths.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified );
end;

procedure TfSalesDeaths.SaleDeathNavBeforeAction(Sender: TObject; Button: TKNavigateBtn);
var
   RecordOk : Boolean;
   GroupType : TGroupType;
   iaAnimalExistGroupIDs : PIntegerArray;
   i : Integer;
begin
   if ( Button = kwnbPost ) then
      begin
         SearchForAnimalExit(SearchForAnimal);
         SaleDeathSaved := True;
         If ( WinData.AnimalFileByIDNatIDNum.IsNull ) then
            begin
               MessageDLG('National Identity Number must be entered '+#13#10+'before Sale Event can be saved',mtError,[mbOK],0);
               Abort;
            end;

         If ( WinData.AnimalFileByIDPrimaryBreed.AsInteger <= 0 ) then
            begin
               MessageDLG('Animal Breed must be entered before Sale Event can be saved',mtWarning,[mbOK],0);
               Abort;
            end;

         if ( WinData.SaleDeath.FieldByName('Sold').AsBoolean ) then
            CheckSaleDate;

         //   18/09/17 [V5.7 R3.0] /MK Change - One procedure in Groups deletes the animal from group and ends the feed.
         SetLength(iaAnimalExistGroupIDs,0);
         iaAnimalExistGroupIDs := WinData.GroupManager.GetAnimalsExistGroupIDs(WinData.AnimalFileByIDID.AsVariant);
         if ( Length(iaAnimalExistGroupIDs) > 0 ) then
            for i := 0 to Length(iaAnimalExistGroupIDs)-1 do
               begin
                  GroupType := WinData.GroupManager.GetGroupIDGroupType(iaAnimalExistGroupIDs[i]);
                  // Set the "EndDate" of the FeedRegime for this animal to the Sale/Death date
                  if ( GroupType = gtFeed ) then
                     begin
                        //   22/09/17 [V5.7 R3.0] /MK Change - Added check for feed events after the sales date.
                        if ( WinData.FeedManager.GroupHasActiveFeedRegime(iaAnimalExistGroupIDs[i]) ) then
                           if ( WinData.FeedManager.FeedEndDateIsBeforeStartDate(WinData.AnimalFileByIDID.AsVariant,DateOfSaleDeath.Date) ) then
                              begin
                                 MessageDlg(Format('This animal has active feed event(s) on or after %s.'+cCRLF+
                                                   'Feeds cannot be ended before this date.'+cCRLF+
                                                   'Please change the date of movement to after this date.',
                                                   [FormatDateTime(cIrishDateStyle,
                                                                   WinData.FeedManager.GetAnimalFeedStartDateOfEndDate(WinData.AnimalFileByIDID.AsVariant,
                                                                                                                       DateOfSaleDeath.Date))]),mtError,[mbOK],0);
                                 SysUtils.Abort;
                              end
                           else
                              WinData.FeedManager.EndFeedEventsForAnimal(WinData.AnimalFileByIDID.AsVariant,StrToDateTime(DateOfSaleDeath.EditText));
                        //   06/11/18 [V5.8 R3.5] /MK Bug Fix - Only remove animal from group if its in a feed group. 
                        WinData.GroupManager.RemoveAnimalFromGrp(WinData.AnimalFileByIDID.AsVariant,iaAnimalExistGroupIDs[i],True);
                     end;
               end;

      end
   else if Button = kwnbCancel then
      Close;
end;

procedure TfSalesDeaths.SearchForAnimalButtonClick(Sender: TObject);
begin
   SearchButtonClick(Sender, lNo);
   { Assigns current Store CurrentID as OldAnimalID }

   // Ok only if the SeachDlg returns an animal in the system should we try locate it.
   // if not, stay on current animal.

   if CurrentID > 0 then
      begin
         OldAnimalID := CurrentAnimalID;  { Ensures that Sales Event is located - grid has lost focus }
         CurrentAnimalID :=  CurrentID;

         if not WinData.AnimalFileByID.Locate('ID', CurrentAnimalID, []) then
            begin
               SaleDeathNav.Enabled := False;
               raise ErrorMsg.Create('Animal does not exist on main grid, contact Kingswood');
            end
         else
            SaleDeathNav.Enabled := True;
      end;

   if SaleDeathNav.Enabled = True then
      NatIDNum.Font.Color := clWindowText
   else
      if SearchForAnimal.Text = '' then
         NatIDNum.Font.Color := NatIDNum.Color;

   CheckSalesEvent;
   FormShow(Sender);
   CustomersChange(nil);
end;

procedure TfSalesDeaths.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
   OldAnimalID := 0;
   SearchAnimalChange(Sender);
   // Now to erase NatID Num until entire Animal Number is input
   if SearchForAnimal.Text = '' then
      NatIDNum.Font.Color := NatIDNum.Color;
end;

procedure TfSalesDeaths.CustomersChange(Sender: TObject);
begin
   SetModifiedFlag;
   if Customers.Value <> '0' then
      begin
         //   17/10/18 [V5.8 R4.0] /MK Bug Fix - Only set the comment to the customer name if (adding or (editing and customer name has changed)).
         if ( WinData.SaleDeath.State = dsInsert ) or
            ( (WinData.SaleDeath.State = dsEdit) and (WinData.SaleDeathCustomer.NewValue <> WinData.SaleDeathCustomer.OldValue) ) then
            dbComment.Text := Customers.Text;

         GetStatusInfo;
         // save value to table
         if WinData.SaleDeath.State = dsInsert then
            begin
               //   15/07/13 [V5.1 R8.5] /MK Bug Fix - No locate of Customers.Value. Always set to first customer deduction + transport.
               if ( WinData.Customers.Locate('ID',Customers.Value,[]) ) then
                  WinData.SaleDeath.FieldByName('CustomerCosts').AsFloat :=  WinData.Customers.FieldByName('Deductions').AsFloat +
                                                                             WinData.Customers.FieldByName('Transport').AsFloat;
            end;
         // display field
         ceCosts.Value := WinData.SaleDeath.FieldByName('CustomerCosts').AsFloat;
      end;
end;

procedure TfSalesDeaths.PriceExit(Sender: TObject);
begin
   if ( WinData.Events.State in dsEditModes ) then  // Added by MC 3/9/99
     try
        if ( ColdDeadWt.Modified ) or ( Weight.Modified ) or ( Price.Modified ) then
           begin
              if ( PricePerKg.Value > 0 ) and ( WinData.SaleDeath.FieldByName('Price').AsFloat > 0 ) then
                 if ( WinData.SaleDeath.FieldByName('Weight').AsFloat = 0 ) then
                    WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat := ( WinData.SaleDeath.FieldByName('Price').AsFloat / PricePerKg.Value );
              AllocatePricePerKg;
           end;
     except
        //
     end;
End;

procedure TfSalesDeaths.ColdDeadWtExit(Sender: TObject);
begin
   if ( WinData.Events.State in dsEditmodes ) then  // Added by MC 3/9/99
      try
         if ( PricePerKg.Modified ) and ( ColdDeadWt.Modified ) then
            WinData.SaleDeath.FieldByName('Price').AsFloat := ( PricePerKg.Value *
                                                                WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat );
         if ( ColdDeadWt.Modified ) or ( Price.Modified ) then
            AllocatePricePerKg;
      except
         //
      end;
end;

procedure TfSalesDeaths.WeightExit(Sender: TObject);
begin
   if ( WinData.Events.State in dsEditmodes ) then
      try
         if ( PricePerKg.Modified ) and ( Weight.Modified ) then
            if ( WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat = 0 ) then
               WinData.SaleDeath.FieldByName('Price').AsFloat := ( PricePerKg.Value *
                                                                   WinData.SaleDeath.FieldByName('Weight').AsFloat );
         if ( Weight.Modified ) or ( Price.Modified ) then
            AllocatePricePerKg;
      except
         //
      end;
end;

procedure TfSalesDeaths.PricePerKgExit(Sender: TObject);
var
   bUseDeadWeight,
   bUseLiveWeight : Boolean;
begin
   bUseDeadWeight := False;
   bUseLiveWeight := False;
   if ( WinData.Events.State in dsEditModes ) then  // added by MC 3/9/99
      try
         // Calculates Price on Sales or Death Screen after input of PricePerKg
         if ( PricePerKg.Modified ) and ( Price.Modified ) then
            begin
               AllocatePricePerKg;
               if ( (PricePerKg.Value > 0) and (WinData.SaleDeath.FieldByName('Price').AsFloat > 0) ) then
                  WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat := ( WinData.SaleDeath.FieldByName('Price').AsFloat / PricePerKg.Value );

               //   24/01/18 [V5.7 R7.5] /MK Bug Fix - If user has price per kg and dead weight then change price to calculated value.
               if ( (PricePerKg.Value > 0) and (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat > 0) ) then
                  WinData.SaleDeath.FieldByName('Price').AsFloat := ( PricePerKg.Value * (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat) );
            end;
      except
         //
      end;
end;

procedure TfSalesDeaths.SearchForAnimalExit(Sender: TObject);
begin
   // If the User presses the Exit Button don't set the Dataset into Edit Mode
   if not ( Screen.ActiveControl is TBitBtn ) then
      begin
         //Update CurrentAnimalID to compare against OldAnimalID
         CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;
         if ((WinData.IsItPreSale = True) and (WinData.AnimalFileByIDInHerd.AsBoolean = False)) then
            begin     // Can not process a non InHerd animal in the PreSale Screen
               MessageDlg('This animal is not in Herd, use Sale/Death Screen', mtInformation, [mbOK], 0);
               SearchForAnimal.SetFocus;
               SaleDeathNav.Enabled := FALSE;
            end
         else
            begin
               if SaleDeathNav.Enabled = True then
                  NatIDNum.Font.Color := clWindowText
               else if SearchForAnimal.Text = '' then
                  NatIDNum.Font.Color := NatIDNum.Color;
               CheckSalesEvent;
            end;
      end;
end;

procedure TfSalesDeaths.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfSalesDeaths.CheckSalesEvent;
begin
   // Need to check whether a PreSales or a Sales event
   if ((WinData.IsItPreSale = True) and (WinData.AnimalFileByIDInHerd.AsBoolean = False)) then
      begin     // Currently, can only select a Non-InHerd animal from front screen
         messagedlg('This animal is not in Herd, use Sale/Death Screen', mtInformation, [mbOK], 0);
         Abort;
      end
   else    //PreSale or Sale Event - animal in herd
      if (WinData.IsItPreSale = True) then
         begin
            // Need to adjust form for PreSale input
            Caption := 'Pre-Sale';
            AnimalStatusLabel.Visible := False;
            AnimalStatus.Visible := False;
            ColdDeadWtLabel.Visible := False;
            ColdDeadWt.Visible := False;
            PriceLabel.Visible := False;
            Price.Visible := False;
            PricePerKgLabel.Visible := False;
            PricePerKg.Visible := False;
            GradeLabel.Visible := False;
            Grade.Visible := False;
            KillOutLabel.Visible := False;
            KillOut.Visible := False;
            KillNumberLabel.Visible := False;
            KillNumber.Visible := False;

            NatIDNum.Top         := rxcCulling.Top;
            NatIDNum.Left        := AnimalStatus.Left;
            NatIDNumLabel.Top    := AnimalStatusLabel.Top;
            NatIDNumLabel.Left   := AnimalStatusLabel.Left;

            lSalesGrp.Top        := KillOutLabel.Top;
            lSalesGrp.Left       := KillOutLabel.Left;
            cbSalesGrp.Top       := KillOut.Top;
            cbSalesGrp.Left      := KillOut.Left;
            cbSalesGrp.TabOrder  := KillOut.TabOrder;

            WeightTop         := Weight.Top;
            WeightLeft        := Weight.Left;
            WeightTabOrder    := Weight.TabOrder;
            SaleWtLabelTop    := SaleWtLabel.Top;
            SaleWtLabelLeft   := SaleWtLabel.Left;

            // changes 27/03/00 to take account of new layout
            SaleWtLabel.Top   := PriceLabel.Top;
            SaleWtLabel.Left  := PriceLabel.Left;

            Weight.Top        := Price.Top;
            Weight.Left       := Price.Left;
            Weight.TabOrder   := Price.TabOrder;

            lWgtDate.Top      := ColdDeadWtLabel.Top;
            lWgtDate.Left     := ColdDeadWtLabel.Left;
            dbeWgtDate.Top    := ColdDeadWt.Top;
            dbeWgtDate.Left   := ColdDeadWt.Left;
            dbeWgtDate.TabOrder := ColdDeadWt.TabOrder;

            KillDied.Width := 678;
            Width := 700;

            // changed 27/3/00 - kr
            dbComment.Top        := 185;
            dbComment.Left       := 128;
            CommentLabel.Top     := 191;
            CommentLabel.Left    := 11;

            if WinData.CheckEvents.Locate('AnimalId;EventType',VarArrayOf([CurrentAnimalID,cSaleDeathEvent]),[] ) then
               WinData.Events.Edit      //Existing event
            else
               begin   //New event

                  if WinData.Events.State <> dsInsert then   { SP 04/02/2003 }
                     WinData.Events.Append
                  else
                     WinData.Events.Edit;                   { SP 04/02/2003 }
                  WinData.SaleDeath.Edit;
                  WinData.Events.FieldByName('EventDesc').AsString := 'Pre-Sale';
                  WinData.SaleDeath.FieldByName('PreSale').Value := True;
                  WinData.SaleDeath.FieldByName('Sold').Value := True;
               end;
            // added 20/3/00 - kr
            rxcCulling.Show;
            lCulling.Show;
            sbDefaults.Hide;
            lDefault.Hide;
            // Beef Management only components
            if NOT (def.definition.dUseBeefMan) then
               begin
                  cbSalesGrp.Hide;
                  lSalesGrp.Hide;
               end;
         end
      Else
         Begin
            Caption := 'Sale or Death';
            //cbSlaughter.Visible := True;
            lCulling.Visible := True;
            rxcCulling.Visible := True;
            AnimalStatusLabel.Visible := True;
            AnimalStatus.Visible := True;
            ColdDeadWtLabel.Visible := True;
            ColdDeadWt.Visible := True;
            PriceLabel.Visible := True;
            Price.Visible := True;
            PricePerKgLabel.Visible := True;
            PricePerKg.Visible := True;
            GradeLabel.Visible := True;
            Grade.Visible := True;
            KillOutLabel.Visible := True;
            KillOut.Visible := True;
            KillNumberLabel.Visible := True;
            KillNumber.Visible := True;
            if WinData.CheckEvents.Locate('AnimalId;EventType',VarArrayOf([CurrentAnimalID,cSaleDeathEvent]),[] ) then
               Begin
                  WinData.Events.Edit;
                  If WinData.Events.FieldByName('EventDesc').AsString = 'Pre-Sale' then
                     WinData.Events.FieldByName('EventDesc').AsString := 'Sale';
                  WinData.SaleDeath.FieldByName('PreSale').Value := False;
               end
            else
               begin
                  if WinData.Events.State <> dsInsert then { SP 04/02/2003 }
                     WinData.Events.Append
                  else
                     WinData.Events.Edit;                 { SP 04/02/2003 }

                  if ( WinData.SaleDeath.State <> dsInsert ) then
                     WinData.SaleDeath.Edit;

                  WinData.SaleDeath.FieldByName('PreSale').Value := False;
               end;
         end;
end;

procedure TfSalesDeaths.FormShow(Sender: TObject);
var
   nIndex :integer;
begin
   // only use if beef management module present
   if (def.definition.dUseBeefMan) then
      begin
         // get animal sales user group
         cbSalesGrp.Items.Clear;
         with tquery.create(self) do
            // get list of available sales groups
            try
               databasename:='Kingswd';
               sql.text:='select g.id, g.description from grps g '+
                         'where g.grouptype = :grouptype '+
                         'order by description';
               params[0].asString:=cSalesGroup;
               open;
               // create list
               while not eof do
                  begin
                     cbSalesGrp.Items.AddObject(fields[1].asString,pointer(fields[0].asInteger));
                     Next;
                  end;
               close;
               // find animal's Sales group - if it exists
               sql.text:='select g.id from grps g, grplinks gl '+
                         'where (g.id = gl.groupid) and (gl.animalid = :animalid) and '+
                         '      (g.grouptype = :grouptype)';
               params[0].asInteger:=WinData.AnimalFileByIDID.AsInteger;
               params[1].asString:=cSalesGroup;
               open;
               // compare SQL to combo list
               if not (eof and bof) then
                  // if found
                  begin
                     nIndex:=cbSalesGrp.Items.IndexOfObject(pointer(fields[0].asInteger));
                     if nIndex<>-1 then
                        begin
                           // if match, assign as display/index
                           cbSalesGrp.ItemIndex:=nIndex;
                           nOriginalGroupID:=fields[0].asInteger;
                        end;
                  end
               else
                  nOriginalGroupID:=-1;
               close;
            finally
               free;
            end;
      end
   else
      begin
         cbSalesGrp.Hide;
         lSalesGrp.Hide;
      end;

   //   20/04/11 [V4.0 R9.8] /MK Additional Feature - Program Checks To See If PricePerKg Exists, If So Then PricePerKg.Value Is PricePerKg
   //                                                 From SalesDeath, Else Calculate From Price and ColdDeadWt In SalesDeath Table.
   try
      if WinData.SaleDeath.FieldByName('Price').AsFloat = 0 then
         PricePerKg.Value := 0.00
      else
         if WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat = 0 then
            PricePerKg.Value := 0.00
         else
            PricePerKg.Value := ((WinData.SaleDeath.FieldByName('Price').AsFloat)/
                                 (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat));
   except
   end;

   //Calculate the number of animals
   CalcNumAnimals;
   GetStatusInfo;
end;

procedure TfSalesDeaths.AnimalStatusExit(Sender: TObject);
begin
   // Only try to Assign if the Table is in Edit Mode MC 3/9/99
   if ( WinData.Events.State in dsEditModes ) then
      begin
         if WinData.SaleDeath.FieldByName('Sold').AsBoolean = True then
            begin
               if ( WinData.Events.FieldByName('EventDesc').AsString = 'Sale' ) or
                  ( WinData.Events.FieldByName('EventDesc').AsString = 'Death' ) then
                  WinData.Events.FieldByName('EventDesc').AsString := 'Sale';
            end
         else
            begin
               if ( WinData.Events.FieldByName('EventDesc').AsString = 'Sale' ) or
                  ( WinData.Events.FieldByName('EventDesc').AsString = 'Death' ) then
                  WinData.Events.FieldByName('EventDesc').AsString := 'Death';
            end;
      end;
end;

procedure TfSalesDeaths.CalcNumAnimals;
begin
   Try
      // If the all herds option is selected on the main screen, then the following calculates
      // the number of animals in all herds. Otherwise, it calculates the number of animals
      // in the herd as determined by the animal selected in the Sales screen.
      If WinData.UserDefaultHerdID = 0 then       //User selected all Herds
         Begin
            qNumAnimals.SQL.Clear;     //Clears Query
            qNumAnimals.SQL.Add('SELECT COUNT(ID) AnimalCount');  // changed 20/3/00 - kr
            qNumAnimals.SQL.Add('FROM Animals.DB');
            qNumAnimals.SQL.Add('WHERE (InHerd=True)');
            qNumAnimals.SQL.Add('AND   (AnimalDeleted=FALSE)');
            qNumAnimals.Open;          //Activates query
         End
      Else      //User has selected a specific herd - use herd from animal onscreen.
         Begin
            qNumAnimals.SQL.Clear;     //Clears Query
            qNumAnimals.SQL.Add('SELECT COUNT(ID) AnimalCount');  // changed 20/3/00 - kr
            qNumAnimals.SQL.Add('FROM Animals.DB');
            qNumAnimals.SQL.Add('WHERE (InHerd=True) AND (HerdID = "' + WinData.AnimalFileByIDHerdID.AsString + '") ');
            qNumAnimals.SQL.Add('AND   (AnimalDeleted=FALSE)');
            qNumAnimals.Open;          //Activates query
         End;
   Finally
      qNumAnimals.Close;
   End;
End;

procedure TfSalesDeaths.bDeleteClick(Sender: TObject);
begin
   //   09/07/21 [V6.0 R1.6] /MK Change - When deleting the sale event check if there is already an animal in the herd
   //                                     with this tag number and don't allow the event to be deleted.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE NatIDNum = :NatIdNo');
         SQL.Add('AND (InHerd = True)');
         SQL.Add('AND (AnimalDeleted = False)');
         SQL.Add('AND (HerdId In (SELECT DefaultHerdId FROM Defaults))');
         Params[0].AsString := WinData.AnimalFileByIDNatIDNum.AsString;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  MessageDlg('There is already an animal in the herd with this tag number.'+cCRLF+
                             'The sale event cannot be deleted for this animal.',mtError,[mbOK],0);
                  Exit;
               end;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;

   // User want to delete the Sales Record for this animal check they are sure
   uSalePurchDelete.ShowSalePurchaseDeleteScreen ( SaleDelete );
   SaleDeathSaved := True;
   sbExit.Click;
end;

procedure TfSalesDeaths.SaleDeathNavClick(Sender: TObject; Button: TKNavigateBtn);
var
   nCurrentGroupId : Integer;
   i : Integer;
   AnimalNo : String;
   AnimalAlreadySold : Boolean;
begin
   AnimalAlreadySold := False;
   if WinData.UnderRentention then
      if WinData.AnimalFileByIDLactNo.AsInteger = 0 then
         WinData.IncDecAnimalsApplied(cDecHefs)
      else
         WinData.IncDecAnimalsApplied(cDecCows);

   PricePerKg.Value := 0;
   CalcNumAnimals;

   // check if nat id or animal no used
   if (WinData.OwnerFile.FieldByName('SearchField').AsString = 'AnimalNo') then
      SearchForAnimal.Text := WinData.AnimalFileByIDAnimalNo.AsString
   else
      SearchForAnimal.Text := WinData.AnimalFileByIDNatIDNum.AsString;
   Update;

   // Reset Old & New Animal Numbers to ensure that Sales event is found, grid loses focus
   OldAnimalID := 0;
   CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;

   if ( FAddorAmend in [AddSale, AddDeath] ) then
      SearchForAnimal.SetFocus;

   // save sales group details
   if (Button = kwnbPost) then
      begin
         OldAnimalID := CurrentAnimalID;
         // only use if beef management module present
         if (def.definition.dUseBeefMan) then
            // check if empty
            if cbSalesGrp.ItemIndex <> -1 then
               begin

                  // assign group chosen to variable
                  nCurrentGroupId:=Integer(cbSalesGrp.Items.Objects[cbSalesGrp.ItemIndex]);

                  // check new value is different from old
                  if nCurrentGroupID<>nOriginalGroupID then
                     begin
                        with tquery.create(self) do
                           try
                              databasename:='Kingswd';
                              // create new record
                              if nOriginalGroupID = -1 then
                                 begin
                                    sql.text:='insert into grplinks (animalid, groupid, datejoined) '+
                                              'values (:animalid, :groupid, :datejoined);';
                                    params[0].asInteger:=WinData.AnimalFileByIDID.AsInteger;
                                    params[1].asInteger:=nCurrentGroupId;
                                    params[2].asDateTime:=now;
                                 end
                              // alter existing record
                              else
                                 begin
                                    sql.text:='update grplinks '+
                                              'set animalid   = :animalid,'+
                                              '    groupid    = :groupid,'+
                                              '    datejoined = :datejoined '+
                                              'where animalid = :animalid '+
                                              '   and groupid = :originalgroupid';
                                    params[0].asInteger  := WinData.AnimalFileByIDID.AsInteger;
                                    params[1].asInteger  := integer(cbSalesGrp.Items.Objects[cbSalesGrp.ItemIndex]);
                                    params[2].asDateTime := now;
                                    params[3].asInteger  := params[0].asInteger;
                                    params[4].asInteger  := nOriginalGroupID;
                                 end;
                              execsql;
                           finally
                              free;
                           end;
                     end;
               end;

         if ( Def.Definition.dUseCrush ) then
           if ( FAddorAmend in [AddSale, AddDeath] ) or
              ( (FAddOrAmend = AmendSaleDeath) and (WinData.AnimalFileByIDInHerd.AsBoolean) ) then
                  AddToCrushXML;

         // only allow for repeat event if NOT amending
         if ( FAddorAmend in [AddSale, AddDeath] ) then
            begin
               // allow for repeat sale/death events - 3/8/00 - kr/sp
               if WinData.ActivePDAEvents(False) then
                  begin
                     Close;
                     Exit;
                  end;

               WinData.AnimalFileByID.Next;
               if ( not WinData.GlobalSettings.DefaultExitAfterSale ) and ( not WinData.AnimalFileByID.Eof ) then
                  begin
                     if MessageDLG('Event Saved - Record Another',mtInformation,[mbYes,mbNo],0) = mrYes then
                        begin
                           CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;
                           repeat
                              AnimalAlreadySold := WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([CurrentAnimalID, cSaleDeathEvent]),[]);
                              if AnimalAlreadySold = True then
                                 begin
                                    WinData.AnimalFileByID.Next;
                                    CurrentAnimalID := WinData.AnimalFileByIDID.AsInteger;
                                    AnimalAlreadySold := WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([CurrentAnimalID, cSaleDeathEvent]),[]);
                                 end
                           until
                               AnimalAlreadySold = False;

                           GetStatusInfo;

                           WinData.Events.Append;
                           WinData.SaleDeath.Edit;

                           WinData.SaleDeath.FieldByName('Sold').Value := True;
                           WinData.SaleDeath.FieldByName('PreSale').Value := False;

                           { SP 16/10/2002 Load Defaults }
                           if WinData.sDefNOTHeld = False then
                              begin
                                 if Price.Field.IsNull then
                                    begin
                                       Price.Field.Value := WinData.sPriceDef;
                                       Price.Refresh;
                                    end;

                                 if Weight.Field.IsNull then
                                    begin
                                       Weight.Text := FloatToStr(WinData.sWeightDef);
                                       Weight.Refresh;
                                    end;

                                 if dbComment.Text = '' then
                                    begin
                                       WinData.Events.FieldByName('EventDesc').Value := WinData.sCommentDef;
                                       dbComment.Text := WinData.sCommentDef;
                                       dbComment.Refresh;
                                    end;

                                 if cbSalesGrp.Text = '' then
                                    begin
                                       cbSalesGrp.ItemIndex := cbSalesGrp.Items.IndexOf(WinData.sGroupDef);
                                       cbSalesGrp.Refresh;
                                    end;
                              end;

                           // Check if nat id or animal no used
                           if (WinData.OwnerFile.FieldByName('SearchField').AsString = 'AnimalNo') then
                              SearchForAnimal.Text := WinData.AnimalFileByIDAnimalNo.AsString
                           else
                              SearchForAnimal.Text := WinData.AnimalFileByIDNatIDNum.AsString;

                           SearchForAnimal.SetFocus;

                           Customers.SetFocus;
                           try
                              CustomersChange(nil);
                           except
                           end;

                           SetupScreen(WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger));
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
end;

procedure TfSalesDeaths.sbHelpClick(Sender: TObject);
begin
   If Caption = 'Pre-Sale' Then
      WinData.HTMLHelp('presale.htm')
   Else
      WinData.HTMLHelp('salesdeaths.htm');
end;

procedure TfSalesDeaths.SearchForAnimalEnter(Sender: TObject);
begin
   if NOT ( WinData.Events.State in dsEditModes ) then
      dbComment.Text := '';
end;

procedure TfSalesDeaths.FormActivate(Sender: TObject);
begin
   lNo.Caption := NoLabel;
   if ( FAddOrAmend = AmendSaleDeath ) then
      Customers.LookupSource := WinData.dsQueryAllCustomers
   else
      Customers.LookupSource := WinData.dsQueryCustomers;
   Inherited FormActivate(Sender);
end;

procedure TfSalesDeaths.DateOfSaleDeathChange(Sender: TObject);
begin
   SetModifiedFlag;

   if DateOfSaleDeath.Date > 0 then
      begin
         if dbeWgtDate.Date <= 0 then
            dbeWgtDate.Date := DateOfSaleDeath.Date;

      end;
    GetStatusInfo;
end;

procedure TfSalesDeaths.CheckSaleDate;
begin
   if DateOfSaleDeath.Date < WinData.AnimalFileByIDDateOfBirth.AsDateTime then
      begin
         MessageDlg(Format('Sale Date cannot be before Date of Birth %s',[FormatDateTime(cIrishDateStyle,WinData.AnimalFileByIDDateOfBirth.AsDateTime)]),mtError,[mbOK],0);
         Abort;
      end;
end;

procedure TfSalesDeaths.sbKillOutPercsClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfmSalesKillOutPercs,fmSalesKillOutPercs);
      fmSalesKillOutPercs.ShowModal;
   finally
   end;
end;

function TfSalesDeaths.CustomerEligSlght : Boolean;
begin
   result := false;
   if ( Customers.Value = '0') or ( Customers.Value = '') then Exit;
   if WinData.Customers.Locate('ID', StrToInt(Customers.KeyValue), []) then
      Result := WinData.Customers.FieldByName('Slaughter').AsBoolean;
end;

procedure TfSalesDeaths.AnimalStatusClick(Sender: TObject);
begin
   SetupScreen(WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger));
end;

procedure TfSalesDeaths.sbDefaultsClick(Sender: TObject);
begin
   case MessageDlg(cSaveDefaultsMessage,mtInformation,[mbYes, mbNo, mbCancel],0) of
      mrYes : begin
                 if NOT (Price.Field.IsNull) then
                    WinData.sPriceDef   := Price.Field.Value;
                 if NOT (Weight.Field.IsNull) then
                    WinData.sWeightDef  := Weight.Field.Value;
                 if dbComment.Text <> '' then
                    WinData.sCommentDef := dbComment.Text;
                 if cbSalesGrp.Text <> '' then
                    WinData.sGroupDef   := cbSalesGrp.Text;
                 WinData.sDefNOTHeld := False;
                 lDefault.Visible := True;
              end;
      mrNo :  begin
                 WinData.sDefNOTHeld := True;
                 lDefault.Visible := False;
              end;
   end;
end;

procedure TfSalesDeaths.ShowHideSaleControls;
begin
   lCustomer.Caption := 'Customer';
   if ( AnimalStatus.ItemIndex = 1 ) then
      begin
         pSalesControls.Hide;

         if fCountry = Ireland then
            begin
              lDisposalType.Hide;
              dbcmbDisposalType.Hide;
              lCustomer.Top := 75;
              Customers.Top := 72;
              lSaleDeathDate.Top := 104;
              DateOfSaleDeath.Top := 100;
            end
         else
            begin
              lDisposalType.Left := 11;
              lDisposalType.Top := 75;
              lDisposalType.Show;
              dbcmbDisposalType.Left := 128;
              dbcmbDisposalType.Top := 72;
              dbcmbDisposalType.Show;

              lCustomer.Top := 104;
              Customers.Top := 100;
              lSaleDeathDate.Top := 132;
              DateOfSaleDeath.Top := 128;
            end;

         lbFallenStkNo.Visible := fCountry <> Ireland;
         dbeFallenStkNo.Visible := fCountry <> Ireland;
         if not dbeFallenStkNo.Visible then
            dbeFallenStkNo.Clear;

         lDeductions.Show;
         lDeductions.Caption := 'Knackery Costs';
         TotalDeductions.Show;

         if fCountry = NIreland then
            lCustomer.Caption := 'Disposal Place';
      end
   else
      begin
         pSalesControls.Show;
         lDisposalType.Hide;
         dbcmbDisposalType.Hide;
         lCustomer.Top := 75;
         Customers.Top := 72;
         lSaleDeathDate.Top := 104;
         DateOfSaleDeath.Top := 100;
         lCosts.Top := 220;
         CustCosts.Top := 214;
         lbFallenStkNo.Visible := False;
         dbeFallenStkNo.Visible :=False;
         dbeFallenStkNo.Clear;
         lDeductions.Show;
         lDeductions.Caption := 'Deductions';
         TotalDeductions.Show;
      end;
end;

procedure TfSalesDeaths.SetupScreen(ACountry: TCountry);
begin
   fCountry := aCountry;
   HerdLookup.GenLookByListType(LNIDisposalManner);
   ShowHideSaleControls;
   Customers.DisplayEmpty := '<Add>';
   if ( WinData.Events.State = dsInsert ) and ( ACountry = NIreland ) and ( AnimalStatus.ItemIndex = 1 ) then
      begin
         HerdLookup.QueryCustomers([qcAuthorisedDisposalPlace]);
         Customers.LookupSource := HerdLookup.dsCustomerQuery;
         Customers.DisplayEmpty := '';
         HerdLookup.FilterDisposalMannerList(True); //  only display disposal manners currently in use
      end
   else
      begin
         if ( FAddOrAmend = AmendSaleDeath ) then
            Customers.LookupSource := WinData.dsQueryAllCustomers
         else
            Customers.LookupSource := WinData.dsQueryCustomers;
      end;

   if ( WinData.Events.State in [dsEdit,dsBrowse] ) and ( ACountry = NIreland ) and ( WinData.SaleDeathSold.AsBoolean = False ) then
      HerdLookup.FilterDisposalMannerList(False); // display all disposal manners , in/out of use.
end;

procedure TfSalesDeaths.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HerdLookup.GenLookByListType();
end;

procedure TfSalesDeaths.AnimalStatusChange(Sender: TObject);
begin
   SetModifiedFlag;
   if (WinData.Events.State in dsEditModes) then
      SetupScreen(WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger));
end;

procedure TfSalesDeaths.PriceChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.KillOutChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.GradeChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.rxcCullingChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.dbCommentChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.dbcmbDisposalType1Change(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.ColdDeadWtChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.WeightChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.KillNumberChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.PricePerKgChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.dbeWgtDateChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.cbSalesGrpChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSalesDeaths.FormDestroy(Sender: TObject);
begin
   HerdLookup.QueryCustomers();
end;

procedure TfSalesDeaths.GetStatusInfo;
begin
   if ( Customers.Value = '' ) or ( DateOfSaleDeath.Date <= 0 ) then Exit;

   WinData.EventDataHelper.GetPreSaleStatusInfo( WinData.AnimalFileByIDID.AsInteger, DateOfSaleDeath.Date, StatusInfo, StrToInt(Customers.Value),
                                                 WinData.GlobalSettings.DisplayBruceTestDateWarningBeforeSale,
                                                 WinData.GlobalSettings.DisplayTBTestDateWarningBeforeSale,
                                                 WinData.GlobalSettings.DisplayMinimumDaysOnFarmWarningBeforeSale);

   StatusBar.Panels[0].Text := 'Days On Farm:';
   // Update the Status bar.
   if (StatusInfo.CheckMinimumDaysOnFarm) and (StatusInfo.NoDaysOnFarm < WinData.GlobalSettings.MinimumDaysToBeKeptOnFarmBeforeSale) then
      StatusBar.Panels[1].PanelStyle.Font.Color := clRed
   else
      StatusBar.Panels[1].PanelStyle.Font.Color := clGreen;
   StatusBar.Panels[1].Text := IntToStr(StatusInfo.NoDaysOnFarm);

   StatusBar.Panels[2].Text := 'TB Test Date:';
   if ( StatusInfo.CheckTBTest) and ( StatusInfo.TBTestDate <= IncMonth(DateOfSaleDeath.Date, -12) ) then
      StatusBar.Panels[3].PanelStyle.Font.Color := clRed
   else
      StatusBar.Panels[3].PanelStyle.Font.Color := clGreen;
   StatusBar.Panels[3].Text := FormatDate(StatusInfo.TBTestDate, dsIrish);

   if StatusInfo.CheckBrucellosis then
      begin
         StatusBar.Panels[4].Text := 'Brucellosis Test Date:';
         StatusBar.Panels[4].Visible := True;
         StatusBar.Panels[5].Visible := True;
         if ( StatusInfo.BruceDate < ( DateOfSaleDeath.Date - MinimumBrucellosisTestDays ) ) then
            StatusBar.Panels[5].PanelStyle.Font.Color := clRed
         else
            StatusBar.Panels[5].PanelStyle.Font.Color := clGreen;
         StatusBar.Panels[5].Text := FormatDate(StatusInfo.BruceDate, dsIrish);
      end
   else
      begin
         StatusBar.Panels[4].Text := '';
         StatusBar.Panels[5].Text := '';
      end;

   StatusBar.Panels[6].Text := '';
   if ( StatusInfo.WithinDrugWithdrawalPeriod ) then
      StatusBar.Panels[6].Text := 'WARNING: Within Drug Withdrawal Period';
end;

procedure TfSalesDeaths.AnimalStatusEnter(Sender: TObject);
begin
   { Added Feature, set focus to Controls[AnimalStatus.ItemIndex]
     Allows the sequence of tab order to work properly, when tabbing from
     control.taborder -1  }
   if AnimalStatus.Focused then
     (AnimalStatus.Controls[AnimalStatus.ItemIndex] as TRadioButton).SetFocus;
end;

procedure TfSalesDeaths.dbcmbDisposalTypePropertiesInitPopup(
  Sender: TObject);
begin
   if ( WinData.Events.State in [dsEdit,dsBrowse] ) and ( fCountry = NIreland ) and ( WinData.SaleDeathSold.AsBoolean = False ) then
      HerdLookup.FilterDisposalMannerList(True);
end;

procedure TfSalesDeaths.dbcmbDisposalTypePropertiesCloseUp(
  Sender: TObject);
begin
   if ( WinData.Events.State in [dsEdit,dsBrowse] ) and ( fCountry = NIreland ) and ( WinData.SaleDeathSold.AsBoolean = False ) then
      HerdLookup.FilterDisposalMannerList(False); // display all disposal manners, in/out of use.
end;

procedure TfSalesDeaths.dbcmbDisposalTypeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      dbcmbDisposalType.EditValue := Null;
end;

procedure TfSalesDeaths.AddToCrushXML;
var
   Animal : TAnimal;
begin
   //   12/11/12 [V5.1 R0.9] /MK Additional Feature - Added CrushXMLExport function.
   if ( not(WinData.SaleDeathPreSale.AsBoolean) ) then
      with TCrushXMLExport.Create do
         try
            with FSaleAnimal do
               begin
                  AnimalID := WinData.AnimalFileByIDID.AsInteger;
                  Animal := GetAnimal(WinData.AnimalFileByIDID.AsInteger);
                  if ( Animal <> nil ) then
                     begin
                        NatIDNum := Animal.NatIdNum;
                        AnimalLactNo := Animal.LactNo;
                     end
                  else
                     AnimalLactNo := WinData.AnimalFileByIDLactNo.AsInteger;
                  EventID := WinData.Events.FieldByName('ID').AsInteger;
                  EventDate := WinData.EventsEventDate.AsDateTime;
                  TBTestDate := WinData.AnimalFileByIDTBTestDate.AsDateTime;
                  BruTestDate := WinData.AnimalFileByIDBrucellosis.AsDateTime;
                  CustomerID := WinData.SaleDeathCustomer.AsInteger;
                  AnimalPrice := WinData.SaleDeathPrice.AsFloat;
                  AnimalWeight := WinData.SaleDeathWeight.AsFloat;
                  Grade := WinData.SaleDeathGrade.AsString;
                  ColdDeadWt := WinData.SaleDeathColdDeadWt.AsFloat;
                  KillOut := WinData.SaleDeathKillOut.AsFloat;
                  PreSale := WinData.SaleDeathPreSale.AsBoolean;
                  SoldStatus := WinData.SaleDeathSold.AsBoolean;
                  KillNumber := WinData.SaleDeathKillNumber.AsString;
                  CustomerCosts := WinData.SaleDeathCustomerCosts.AsFloat;
                  FeedEndDate := WinData.SaleDeathFeedEndDate.AsDateTime;
                  WeighingDate := WinData.SaleDeathWeighingDate.AsDateTime;
                  CarcassSex := WinData.SaleDeathCarcassSex.AsString;
                  LeftWt := WinData.SaleDeathLeftWt.AsFloat;
                  RightWt := WinData.SaleDeathRightWt.AsFloat;
                  PricePerKg := WinData.SaleDeathPricePerKg.AsFloat;
                  SalesGroupID := WinData.SaleDeathSaleGrps_Id.AsInteger;
               end;
            if ( IsValidEvent(etSale) ) then
               begin
                  CreateorOpenXMLFile(etSale);
                  AddAnimalToXMLFile(etSale);
               end;
         finally
            Free
         end;
end;

procedure TfSalesDeaths.RxSpeedButton2Click(Sender: TObject);
begin
   if Definition.dUseKingsAccs then
      WinData.CallProg.Accounts(' S ' + RegistrySerialNum, WinData.UserDefaultHerdID)
   else
      WinData.CallProg.Accounts(' S ', WinData.UserDefaultHerdID);
end;

procedure TfSalesDeaths.AllocatePricePerKg;
begin
   PricePerKgLabel.Left := 508;
   PricePerKgLabel.Width := 58;
   PricePerKgLabel.Caption := 'Price/kg';

   if ( ColdDeadWt.Modified ) or ( Weight.Modified ) or ( Price.Modified ) then
      begin
         if ( (WinData.SaleDeath.FieldByName('Price').AsFloat > 0) and
              (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat > 0) ) then
            begin
               PricePerKg.Value := ( WinData.SaleDeath.FieldByName('Price').AsFloat /
                                     WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat );
               PricePerKgLabel.Left := 490;
               PricePerKgLabel.Width := 88;
               PricePerKgLabel.Caption := 'Price/kg (DW)'
            end
         else if ( (WinData.SaleDeath.FieldByName('Price').AsFloat > 0) and
                   (WinData.SaleDeath.FieldByName('Weight').AsFloat > 0) and
                   (WinData.SaleDeath.FieldByName('ColdDeadWt').AsFloat = 0) ) then
            begin
               PricePerKg.Value := ( WinData.SaleDeath.FieldByName('Price').AsFloat /
                                     WinData.SaleDeath.FieldByName('Weight').AsFloat );
               PricePerKgLabel.Left := 490;
               PricePerKgLabel.Width := 88;
               PricePerKgLabel.Caption := 'Price/kg (LW)'
            end;
      end;
end;

end.


