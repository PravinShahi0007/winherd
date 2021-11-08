{
   15/11/10 [V4.0 R5.6] /MK Additional Feature - On Supplier.Change Then Comment.Text := Supplier.Text

   07/10/11 [V5.0 R1.2] /MK Change - Changed Bevel To Panel. Added All Components To Panel.

   13/12/11 [V5.0 R2.8] /MK Additional Feature - Added CheckBox To Change Default Costs.
                                               - Fixed Tab Order.

   15/11/12 [V5.1 R3.1] /MK Additional Feature - Added type for AddorModify.
                                               - If AddOrModify type = Add and Defintion.Crush then Add to XML File.

   28/03/13 [V5.1 R5.4] /MK Change - Changed Supplier Combo.LookupSource to look at new WinData.QuerySuppliers.
                                   - Changed Buyers Combo.LookupSource to look at new WinData.QueryBuyers.

   01/12/13 [V5.2 R6.5] /MK Additional Feature - uPurchase - Added ComboBox for Feed and Batch Groups.

   12/12/13 [V5.2 R6.9] /MK Additional Feature - FormCreate - Removed FQAS Days from Purchase screen.

   13/06/14 [V5.3 R2.8] /MK Change - FormCreate - Brought back FQAS Days - TGM/GL Request.
                                                - Show new FQAS Date label - TGM/GL Request.
                                   - NavPurchaseClick - Save QADate to animals table & animals.QualityAssured if ( FQASDate <= Date ).

   11/09/14 [V5.3 R6.1] /MK Bug Fix - NavPurchaseClick - Check for '' was not catching zero or null FQAS days.

   05/11/15 [V5.5 R0.2] /MK Bug Fix - If modifying the event then show the purchase costs as the saved purchase costs in the Purchase table - IAD reported.
                                    - If the user changes the Buyer or the Supplier then set the purchase costs to those in the Buyer/Supplier tables.

   27/10/16 [V5.6 R2.7] /MK Bug Fix - FormActivate/FormShow - Moved code as cost was coming from Supplier in not SupplierCosts in Purchase table - IAD.

   28/10/16 [V5.6 R2.8] /MK Bug Fix - CalcCosts only required if adding the event as costs should be taken from saved values in database - IAD.

   01/11/16 [V5.6 R2.9] /MK Bug Fix - CalcCosts only required if adding the event or editing the event and the supplier/buyer has changed.

   14/09/17 [V5.7 R3.0] /MK Change - Changed WinData.AddToGroup to WinData.GroupManager.AddToGroup for more accurate calculation of FeedAllocation date based on purchase/birth date.

   22/09/17 [V5.7 R3.0] /MK Change - Added the required changes for new Feeds unit.

   07/06/18 [V5.8 R0.6] /MK Change - AddAnimalToXMLFile - Add NationalID number to CrushXML file.

   23/05/19 [V5.8 R9.3] /MK Bug Fix - Got errors in "Stop On Delphi Exception" for qSuppliers not being active.

   09/07/21 [V6.0 R1.6] /MK Change - Changed DateOfPurchase TDBDateEdit to dePurchaseDate TcxDBDateTime so that user can enter 4 date year - Geraldine Carroll.    
}

unit uPurchases;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, RXLookup, ToolEdit,
  RXDBCtrl, Buttons, CurrEdit, DBTables, RXCtrls, ComCtrls, ToolWin,
  kwDBNavigator, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, cxDBEdit, cxLabel, cxGroupBox, cxCheckBox,
  uCrushXML, KDBRoutines, uAnimal, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TAddorModify = (amAdd, amModify);
  TfPurchases = class(TForm)
    Panel2: TPanel;
    ToolBar1: TToolBar;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbDelete: TRxSpeedButton;
    ToolButton4: TToolButton;
    NavPurchase: TkwDBNavigator;
    qSuppliers: TQuery;
    dsSuppliers: TDataSource;
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    sbDefaults: TRxSpeedButton;
    lDefault: TLabel;
    ToolButton1: TToolButton;
    RxSpeedButton3: TRxSpeedButton;
    ToolButton3: TToolButton;
    StatusBar1: TStatusBar;
    pPurchases: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    lComment: TLabel;
    lPrice: TLabel;
    lWeight: TLabel;
    Label7: TLabel;
    lPPKg: TLabel;
    lOtherCosts: TLabel;
    lFarmWeight: TLabel;
    lFarmWgtDate: TLabel;
    lPurchGrp: TLabel;
    Label12: TLabel;
    lFQAS: TLabel;
    lTransport: TLabel;
    lCommission: TLabel;
    lFQASDays: TLabel;
    Supplier: TRxDBLookupCombo;
    Price: TDBEdit;
    Weight: TDBEdit;
    Buyers: TRxDBLookupCombo;
    PricePerKg: TCurrencyEdit;
    dbeFarmWgt: TDBEdit;
    dbcPurchGrp: TComboBox;
    DBEdit1: TDBEdit;
    dbFarmWgtDate: TDBDateEdit;
    Comment: TDBEdit;
    eFQASDays: TDBEdit;
    dbeHaulage: TDBEdit;
    dbeCommission: TDBEdit;
    dbceOtherCosts: TcxDBCurrencyEdit;
    gbPurchaseCosts: TcxGroupBox;
    cxLabel1: TcxLabel;
    ceSuppCom: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    ceSuppTrans: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    ceBuyerCom: TcxCurrencyEdit;
    cbChangeCosts: TcxCheckBox;
    pOtherPurchaseOptions: TPanel;
    Label9: TLabel;
    Label6: TLabel;
    Group: TDBEdit;
    Grade: TDBEdit;
    FQAS: TDBCheckBox;
    dbcFeedGroup: TComboBox;
    lFeedGroup: TLabel;
    lBatchGroup: TLabel;
    dbcBatchGroup: TComboBox;
    lFQASDate: TLabel;
    lFQASDateDate: TcxLabel;
    DateOfPurchase: TDBDateEdit;
    dePurchaseDate: TcxDBDateEdit;
    procedure ExitButtonClick(Sender: TObject);
    procedure SupplierCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DateOfPurchaseExit(Sender: TObject);
    procedure SupplierEnter(Sender: TObject);
    procedure NavPurchaseClick(Sender: TObject; Button: TKNavigateBtn);
    procedure BuyersCloseUp(Sender: TObject);
    procedure BuyersEnter(Sender: TObject);
    procedure PriceExit(Sender: TObject);
    procedure WeightExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure NavPurchaseBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure sbHelpClick(Sender: TObject);
    procedure SupplierDropDown(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure sbDefaultsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButton3Click(Sender: TObject);
    procedure SupplierChange(Sender: TObject);
    procedure BuyersChange(Sender: TObject);
    procedure DateOfPurchaseChange(Sender: TObject);
    procedure PriceChange(Sender: TObject);
    procedure WeightChange(Sender: TObject);
    procedure dbeFarmWgtChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure dbcPurchGrpChange(Sender: TObject);
    procedure CommentChange(Sender: TObject);
    procedure dbFarmWgtDateChange(Sender: TObject);
    procedure FQASClick(Sender: TObject);
    procedure cbChangeCostsClick(Sender: TObject);
    procedure eFQASDaysChange(Sender: TObject);
    procedure BuyersDropDown(Sender: TObject);

  private
    nOriginalBatchGroupID,
    nOriginalFeedGroupID,
    nOriginalPurchGroupID : integer;
    FModified : Boolean;
    FFormShowing : Boolean;
    FAddOrModify : TAddorModify;
    FOldLotNumber : String;
    FOldSupplier,
    FOldBuyer : Integer;
    procedure SetModifiedFlag;
    { private declarations }
    procedure CalcNumAnimals;
    procedure SupplierDropDownList;
    procedure CalcCosts;
    procedure EnableChangeOfCosts(AEnable : Boolean);
    procedure AddToCrushXML;
    procedure CalcFQASDate;
  public
    { public declarations }
  end;

Procedure ShowForm;

implementation
Uses
    Dialogs,
    Def,
    uGroupSetUp,
    uSuppliers,
    uBuyers,
    GenTypesConst,
    uSalePurchDelete,
    DairyData, KRoutines, uGroupUpdate;

{$R *.DFM}

Procedure ShowForm;
begin
   with TfPurchases.Create(nil) do
      try
         WinData.EventType := TPurchase;
         WinData.Events.MasterFields := 'ID';
         // Try and locate a Purchase Record for the Current Animal
         if WinData.Events.Locate('AnimalId;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsVariant, cPurchaseEvent]),[] ) then
            begin
               FAddOrModify := amModify;
               WinData.Events.Edit;
               NavPurchase.VisibleButtons := [kwnbPost,kwnbCancel];
               sbDefaults.Visible := False;
               ToolButton5.Visible := False;
            end
         else
            begin
               FAddOrModify := amAdd;
               WinData.Events.Append;
               WinData.Purchases.Edit;
               NavPurchase.VisibleButtons := [kwnbPost,kwnbCancel];
               sbDefaults.Visible := True;
               ToolButton5.Visible := True;
            end;

         ShowModal;
      finally
         Free;
         WinData.Events.MasterFields := 'ID;LactNo';
      end;
end;

procedure TfPurchases.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfPurchases.SupplierCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if Supplier.Value = '0' then
      begin
         uSuppliers.ShowTheForm(TRUE, ID);
         WinData.QuerySuppliers.Close;
         WinData.QuerySuppliers.Open;
         Supplier.KeyValue := ID;
      end;
end;

procedure TfPurchases.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified );
end;

procedure TfPurchases.DateOfPurchaseExit(Sender: TObject);
begin
   if (dePurchaseDate.Date>0) and (dePurchaseDate.Date < WinData.AnimalFileByIdDateOfBirth.Value) then
      begin
          MessageDLG('Purchase Date cannot be before Date of Birth',mtinformation,[mbOK],0);
          dePurchaseDate.SetFocus;
          Abort;
      end;
end;

procedure TfPurchases.SupplierEnter(Sender: TObject);
begin
   // Check the State of the Events File
   if WinData.Events.State = dsBrowse then
      WinData.Events.Edit;
end;

procedure TfPurchases.NavPurchaseClick(Sender: TObject;
  Button: TKNavigateBtn);
var
   nCurrentGroupId : integer;

   procedure AddToGroupByCombo ( AComboBox : TComboBox; AOrigGroupID : Integer );
   var
      qGroups : TQuery;
   begin
      if ( AComboBox.ItemIndex <> -1 ) then
         begin
            // assign group chosen to variable
            nCurrentGroupId := Integer(AComboBox.Items.Objects[AComboBox.ItemIndex]);
            // check new value is different from old
            if ( nCurrentGroupID <> AOrigGroupID ) then
               begin
                  qGroups := TQuery.Create(nil);
                  with qGroups do
                     try
                        DatabaseName := AliasName;
                        // create new record
                        if ( AComboBox.Name = 'dbcPurchGrp' ) or ( AComboBox.Name = 'dbcBatchGroup' ) then
                           begin
                              if ( AOrigGroupID = -1 ) then
                                 begin
                                    SQL.Text :='INSERT INTO GrpLinks (AnimalId, GroupId, DateJoined) '+cCRLF+
                                               'VALUES (:AnimalId, :GroupId, :DateJoined);';
                                    Params[0].AsInteger  := WinData.AnimalFileByIDID.AsInteger;
                                    Params[1].AsInteger  := nCurrentGroupId;
                                    //Params[2].AsDateTime := Now;
                                    Params[2].AsDateTime := dePurchaseDate.Date;
                                 end
                              // alter existing record
                              else
                                 begin
                                    SQL.Text := 'UPDATE GrpLinks '+cCRLF+
                                                'SET AnimalId   = :AnimalId,'+cCRLF+
                                                '    Groupid    = :GroupId,'+cCRLF+
                                                '    DateJoined = :DateJoined '+cCRLF+
                                                'WHERE (AnimalId = :animalid) '+cCRLF+
                                                'AND   (GroupId = :originalgroupid)';
                                    Params[0].AsInteger  := WinData.AnimalFileByIDID.AsInteger;
                                    Params[1].AsInteger  := Integer(AComboBox.Items.Objects[AComboBox.ItemIndex]);
                                    //Params[2].AsDateTime := Now;
                                    Params[2].AsDateTime := dePurchaseDate.Date;
                                    Params[3].AsInteger  := Params[0].AsInteger;
                                    Params[4].AsInteger  := AOrigGroupID;
                                 end;
                              ExecSQL;
                           end
                        else if ( AComboBox.Name = 'dbcFeedGroup' ) then
                           begin
                              if ( AOrigGroupID > 0 ) then
                                 begin
                                    WinData.GroupManager.RemoveAnimalFromGrp(WinData.AnimalFileByIDID.AsInteger,AOrigGroupID);
                                    WinData.FeedManager.EndFeedEventsForAnimal(WinData.AnimalFileByIDID.AsInteger,dePurchaseDate.Date)
                                 end
                              else
                                 begin
                                    WinData.GroupManager.AddToGroup(WinData.AnimalFileByIDID.AsInteger,nCurrentGroupId,True,dePurchaseDate.Date,WinData.AnimalFileByIDNatIDNum.AsString);
                                    WinData.FeedManager.CreateFeedsForAnimal(WinData.AnimalFileByIDID.AsInteger,nCurrentGroupId,dePurchaseDate.Date);
                                 end;
                           end;
                     finally
                        Free;
                     end;
               end;
         end;
   end;

begin
   // save purchase group details
   if ( Button = kwnbPost ) then
      begin
         // only use if beef management module present
         if ( def.definition.dUseBeefMan ) then
            // check if empty
            begin
               AddToGroupByCombo(dbcPurchGrp,nOriginalPurchGroupID);
               AddToGroupByCombo(dbcFeedGroup,nOriginalFeedGroupID);
               AddToGroupByCombo(dbcBatchGroup,nOriginalBatchGroupID);
            end;

         if ( FAddOrModify = amAdd ) and ( Def.Definition.dUseCrush ) then
            AddToCrushXML;

         //   11/09/14 [V5.3 R6.1] /MK Bug Fix - Check for '' was not catching zero or null FQAS days.
         if ( eFQASDays.Visible ) then
            if ( not(eFQASDays.Text = '') ) and ( not(eFQASDays.Text = '0') )then
               with GetQuery do
                  try
                     SQL.Add('UPDATE Animals');
                     SQL.Add('SET QADate = :QADate,');
                     SQL.Add('    QualityAssured = :QualityAssured');
                     SQl.Add('WHERE ID = :AnimalID');
                     Params[0].AsDate := StrToDate(lFQASDateDate.Caption);
                     Params[1].AsBoolean := ( StrToDate(lFQASDateDate.Caption) <= Date );
                     Params[2].AsInteger := WinData.AnimalFileByIDID.AsInteger;
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  finally
                     Free;
                  end;
      end;

   Close;
   // save defaults if checked
{   if cbDefaults.Checked then
      begin
         if NOT (Price.Field.IsNull) then
            WinData.pPriceDef   := Price.Field.Value;
         if NOT (Weight.Field.IsNull) then
            WinData.pWeightDef  := Weight.Field.Value;
         if Comment.Text <> '' then
            WinData.pCommentDef := Comment.Text;
         if dbcPurchGrp.Text <> '' then
            WinData.pGroupDef   := dbcPurchGrp.Text;
         WinData.pDefNOTHeld := False;
      end;
}
end;

procedure TfPurchases.BuyersCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if Buyers.Value = '0' then
      begin
         uBuyers.ShowTheForm(TRUE, ID);
         WinData.QueryBuyers.Close;
         WinData.QueryBuyers.Open;
         Buyers.KeyValue := ID;
      end;
end;

procedure TfPurchases.BuyersEnter(Sender: TObject);
begin
   // Check the State of the Events File
   if WinData.Events.State = dsBrowse then
      WinData.Events.Edit;
end;

procedure TfPurchases.PriceExit(Sender: TObject);
begin
   try
      //   Calculates PricePerKg on Purchases Screen
      if WinData.Purchases.FieldByName('Price').AsFloat = 0 then
         PricePerKg.Value := 0.00
      else
         if WinData.Purchases.FieldByName('Weight').AsFloat = 0 then
            PricePerKg.Value := 0.00
         else
             PricePerKg.Value := ((WinData.Purchases.FieldByName('Price').AsFloat)/
                                 (WinData.Purchases.FieldByName('Weight').AsFloat));
   except
      //
   end;
end;

procedure TfPurchases.WeightExit(Sender: TObject);
begin
   try
      //   Calculates PricePerKg on Purchases Screen
      if WinData.Purchases.FieldByName('Price').AsFloat = 0 then
         PricePerKg.Value := 0.00
      else
         if WinData.Purchases.FieldByName('Weight').AsFloat = 0 then
            PricePerKg.Value := 0.00
         else
             PricePerKg.Value := ((WinData.Purchases.FieldByName('Price').AsFloat)/
                                  (WinData.Purchases.FieldByName('Weight').AsFloat));
   except
      //
   end;
End;


procedure TfPurchases.FormShow(Sender: TObject);
var
   nIndex : Integer;

   procedure AddGroupsToCombo ( AComboBox : TComboBox );
   var
      qGroups : TQuery;
   begin
      AComboBox.Items.Clear;
      qGroups := TQuery.Create(nil);
      with qGroups do
         // get list of available purchase groups
         try
            DatabaseName := AliasName;
            SQL.Text := 'SELECT G.Id, G.Description '+cCRLF+
                        'FROM Grps G'+cCRLF+
                        'WHERE G.GroupType = :grouptype '+cCRLF+
                        'ORDER By description';
            if ( AComboBox.Name = 'dbcPurchGrp' ) then
               Params[0].asString := cPurchaseGroup
            else if ( AComboBox.Name = 'dbcFeedGroup' ) then
               Params[0].asString := cFeedGroup
            else if ( AComboBox.Name = 'dbcBatchGroup' ) then
               Params[0].asString := cBatchGroup;
            Open;
            // create list
            while ( not(qGroups.Eof) ) do
               begin
                  AComboBox.Items.AddObject(qGroups.Fields[1].AsString,pointer(qGroups.Fields[0].AsInteger));
                  Next;
               end;
            qGroups.Close;

            // find animal's purchase group - if it exists
            qGroups.SQL.Text:= 'SELECT G.id'+cCRLF+
                               'FROM Grps G, GrpLinks GL '+cCRLF+
                               'WHERE (G.Id = GL.GroupId)'+cCRLF+
                               'AND   (GL.Animalid = :AnimalId)'+cCRLF+
                               'AND   (G.GroupType = :GroupType)';
            qGroups.Params[0].AsInteger := WinData.AnimalFileByIDID.AsInteger;
            if ( AComboBox.Name = 'dbcPurchGrp' ) then
               Params[1].asString := cPurchaseGroup
            else if ( AComboBox.Name = 'dbcFeedGroup' ) then
               Params[1].asString := cFeedGroup
            else if ( AComboBox.Name = 'dbcBatchGroup' ) then
               Params[1].asString := cBatchGroup;
            qGroups.Open;
            // compare SQL to combo list
            if not ( qGroups.eof and qGroups.bof ) then
               // if found
               begin
                  nIndex := AComboBox.Items.IndexOfObject(pointer(qGroups.Fields[0].AsInteger));
                  if nIndex <> -1 then
                     begin
                        // if match, assign as display/index
                        AComboBox.ItemIndex := nIndex;
                        if ( AComboBox.Name = 'dbcPurchGrp' ) then
                          nOriginalPurchGroupID := qGroups.Fields[0].AsInteger
                        else if ( AComboBox.Name = 'dbcFeedGroup' ) then
                          nOriginalFeedGroupID := qGroups.Fields[0].AsInteger
                        else if ( AComboBox.Name = 'dbcBatchGroup' ) then
                          nOriginalBatchGroupID := qGroups.Fields[0].AsInteger;
                     end;
               end
            else
               begin
                  if ( AComboBox.Name = 'dbcPurchGrp' ) then
                    nOriginalPurchGroupID := -1
                  else if ( AComboBox.Name = 'dbcFeedGroup' ) then
                    nOriginalFeedGroupID := -1
                  else if ( AComboBox.Name = 'dbcBatchGroup' ) then
                    nOriginalBatchGroupID := -1;
               end;

         finally
            qGroups.Close;
            qGroups.Free;
         end;
   end;

begin
   if WinData.Events.State = dsInsert then
      Weight.Text := '.00';
      // Don't remove line above, this is here because the Purchase event was only being saved
      // to the events table, and not in the purchase table, this default should help to create
      // the purchase record in full. 30/07/01

   lFeedGroup.Visible := Def.Definition.dUseBeefMan;
   dbcFeedGroup.Visible := lFeedGroup.Visible;
   lBatchGroup.Visible := Def.Definition.dUseBeefMan;
   dbcBatchGroup.Visible := lBatchGroup.Visible;

   // only use if beef management module present
   if ( def.definition.dUseBeefMan ) then
      begin
         // get animal purchase user group
         AddGroupsToCombo(dbcPurchGrp);
         AddGroupsToCombo(dbcFeedGroup);
         AddGroupsToCombo(dbcBatchGroup);
      end
   else
      begin
         lFarmWeight.Hide;
         dbeFarmWgt.Hide;
         lFarmWgtDate.Hide;
         dbFarmWgtDate.Hide;
         dbcPurchGrp.Hide;
         lPurchGrp.Hide;
      end;
   // check if animal has purchase event
   // check if defaults are null
   // check if fields are null
   // insert defaults
   if NOT WinData.pDefNOTHeld then
      begin
         lDefault.Visible := True;
         if Price.Field.IsNull then
            begin
               Price.Field.Value := WinData.pPriceDef;
               Price.Refresh;
            end;
         if Weight.Field.IsNull then
            begin
               Weight.Field.Value := WinData.pWeightDef;
               Weight.Refresh;
            end;
         if Comment.Text = '' then
            begin
               Comment.Text := WinData.pCommentDef;
               Comment.Refresh;
            end;
         if dbcPurchGrp.Text = '' then
            begin
               dbcPurchGrp.ItemIndex:=dbcPurchGrp.Items.IndexOf(WinData.pGroupDef);
               dbcPurchGrp.Refresh;
            end;
      end
   else
      lDefault.Visible := False;

   PriceExit(Sender);
   //SupplierExit(Sender);

   //   28/10/16 [V5.6 R2.8] /MK Bug Fix - Moved this to FormShow as cost was coming from Supplier in FormActivate not SupplierCosts in Purchase table - IAD.
   gbPurchaseCosts.Visible := ( not(FAddOrModify = amModify) );
   if ( FAddOrModify = amModify ) then
      dbceOtherCosts.DataBinding.DataField := 'SupplierCosts';
   CalcCosts;

   //Procedure to Calculate the number of animals
   CalcNumAnimals;
   //refresh Suppliers Drop down list in case Suppliers modified
   SupplierDropDownList;
end;


procedure TfPurchases.CalcNumAnimals;
var
   NoOfAnimals : Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) AnimalCount');  // changed 20/3/00 - kr
         SQL.Add('FROM Animals.DB');
         if WinData.UserDefaultHerdID = 0 then       //User selected all Herds
            SQL.Add('WHERE (InHerd=True)')
         else
            SQL.Add('WHERE (InHerd=True) AND (HerdID = "' + WinData.AnimalFileByIDHerdID.AsString + '") ');
         Open;
         try
            First;
            NoOfAnimals := FieldByName('AnimalCount').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;

   StatusBar1.Panels[0].Text := 'Number Animals ';
   if WinData.UserDefaultHerdID = 0 then       //User selected all Herds
      StatusBar1.Panels[0].Text := Format(StatusBar1.Panels[0].Text +'All Herds: %d',[NoOfAnimals])
   else
      StatusBar1.Panels[0].Text := Format(StatusBar1.Panels[0].Text +'This Herd: %d',[NoOfAnimals]);
end;

procedure TfPurchases.bDeleteClick(Sender: TObject);
begin
   // User want to delete the Sales Record for this animal
   // check they are sure
   uSalePurchDelete.ShowSalePurchaseDeleteScreen ( PurchaseDelete );
   sbExit.Click;
end;

procedure TfPurchases.NavPurchaseBeforeAction(Sender: TObject; Button: TKNavigateBtn);
begin
   if ( Button = kwnbPost ) then
      begin
         if ( Supplier.Field.AsInteger = 0 ) then
            begin
               MessageDLG('You must enter a Supplier',mtWarning,[mbOK],0);
               Abort;
            end;

         if ( dePurchaseDate.Date <= 0 ) then
            begin
               MessageDlg('You must enter a Purchase date',mtWarning,[mbOk],0);
               Abort;
            end
         else
            DateOfPurchaseExit(Sender);
      end;
end;

procedure TfPurchases.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('purchases.htm');
end;

procedure TfPurchases.SupplierDropDown(Sender: TObject);
begin
   //Need to refresh the drop down list
   SupplierDropDownList;
   if ( FAddOrModify = amModify ) and ( Supplier.Value <> Null ) then
      FOldSupplier := StrToInt(Supplier.Value);
end;

procedure TfPurchases.SupplierDropDownList;
begin
   //Need to refresh the drop down list
   qSuppliers.Close;
   qSuppliers.Open;
end;

procedure TfPurchases.FormActivate(Sender: TObject);
begin
   CalcCosts;
   FFormShowing := True;
end;

procedure TfPurchases.RxSpeedButton2Click(Sender: TObject);
begin
   if Definition.dUseKingsAccs then
      WinData.CallProg.Accounts(' P ' + RegistrySerialNum, WinData.UserDefaultHerdID )
   else
      WinData.CallProg.Accounts(' P ', WinData.UserDefaultHerdID );
end;

procedure TfPurchases.sbDefaultsClick(Sender: TObject);
begin
   case MessageDlg(cSaveDefaultsMessage,mtInformation,[mbYes, mbNo, mbCancel],0) of
   mrYes : begin
             if NOT (Price.Field.IsNull) then
                WinData.pPriceDef   := Price.Field.Value;
             if NOT (Weight.Field.IsNull) then
                WinData.pWeightDef  := Weight.Field.Value;
             if not (Comment.Field.IsNull) then
                WinData.pCommentDef := Comment.Text;
             if dbcPurchGrp.Text <> '' then
                WinData.pGroupDef   := dbcPurchGrp.Text;
             WinData.pDefNOTHeld := False;
             lDefault.Visible := True;
          end;
   mrNo : begin
             WinData.pDefNOTHeld := True;
             lDefault.Visible := False;
          end;
   end;
end;

procedure TfPurchases.FormCreate(Sender: TObject);
begin
   FModified := False;
   FFormShowing := False;

   WinData.QuerySuppliers.Close;
   WinData.QuerySuppliers.Open;

   WinData.QueryBuyers.Close;
   WinData.QueryBuyers.Open;

   //   13/06/14 [V5.3 R2.8] /MK Additional Feature - Brought back FQAS Days - TGM/GL Request.
   lFQAS.Visible := ( WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) <> Ireland );;
   eFQASDays.Visible := lFQAS.Visible;
   lFQASDays.Visible := lFQAS.Visible;
   lFQASDate.Visible := ( (lFQAS.Visible) and (not(eFQASDays.Text = '')) ); 
   lFQASDateDate.Visible := lFQASDate.Visible;
   CalcFQASDate;

   {
   lPrice.Top := 157;
   Price.Top := 152;
   lWeight.Top := 185;
   Weight.Top := 129;
   lComment.Top := 162;
   Comment.Top := 159;
   lPPKg.Top := 192;
   PricePerKg.Top := 189;
   lOtherCosts.Top := 192;
   dbceOtherCosts.Top := PricePerKg.Top-2;
   }

   cbChangeCosts.Checked := False;

   //gbPurchaseCosts.Top := gbPurchaseCosts.Top-10; 
   //OtherCosts.Top := 213;
   //DBEdit2.Top := 245;

   if ( lFQAS.Visible ) then
      Height := 462
   else
      Height := 437;
      //end;

   EnableChangeOfCosts(False);

end;

procedure TfPurchases.RxSpeedButton3Click(Sender: TObject);
begin
   Update;
   TfmGroupUpdate.ShowForm(WinData.AnimalFileByIDID.AsInteger, dePurchaseDate.Date);
end;

procedure TfPurchases.SupplierChange(Sender: TObject);
begin
   SetModifiedFlag;
   if ( FAddOrModify = amModify ) and ( Supplier.Value <> Null ) then
      gbPurchaseCosts.Visible := ( StrToInt(Supplier.Value) <> FOldSupplier );
   CalcCosts;
   Comment.Text := Supplier.Text;
end;

procedure TfPurchases.BuyersChange(Sender: TObject);
begin
   if ( FAddOrModify = amModify ) and ( Buyers.Value <> Null ) then
      gbPurchaseCosts.Visible := ( StrToInt(Buyers.Value) <> FOldBuyer );
   CalcCosts;
   SetModifiedFlag;
end;

procedure TfPurchases.DateOfPurchaseChange(Sender: TObject);
begin
   CalcFQASDate;
   SetModifiedFlag;
end;

procedure TfPurchases.PriceChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfPurchases.WeightChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfPurchases.dbeFarmWgtChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfPurchases.DBEdit1Change(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCosts;
end;

procedure TfPurchases.dbcPurchGrpChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfPurchases.CommentChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfPurchases.dbFarmWgtDateChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfPurchases.FQASClick(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfPurchases.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TfPurchases.CalcCosts;
var
   Result : Double;
begin
   Result := 0;
   try
      //   27/10/16 [V5.6 R2.8] /MK Bug Fix - CalcCosts only required if adding the event as costs should be taken from saved values in database - IAD.
      //   01/11/16 [V5.6 R2.9] /MK Bug Fix - CalcCosts only required if adding the event or editing the event and the supplier/buyer has changed.
      if ( FAddOrModify = amAdd ) or ( FOldSupplier > 0 ) or ( FOldBuyer > 0 ) then
         begin
            if ( WinData.PurchasesHaulage.AsFloat <= 0 ) and ( WinData.PurchasesCommission.AsFloat <= 0 ) then
               begin
                  if ( Supplier.Value <> Null ) then
                     if ( qSuppliers.Active ) then
                        if ( qSuppliers.Locate('ID', strToInt(Supplier.Value),[]) ) then
                           Result := qSuppliers.FieldByName('Commission').AsFloat + qSuppliers.FieldByName('Transport').AsFloat;
                  if ( Buyers.Value <> Null ) then
                     if ( WinData.Buyers.Locate('ID', StrToInt(Buyers.Value),[]) ) then
                        Result := Result + WinData.Buyers.FieldByName('Commission').AsFloat;
                  if ( WinData.Purchases.State in dsEditModes ) then
                     WinData.Purchases.FieldByName('SupplierCosts').AsFloat := Result;
               end;

             if ( Supplier.Value <> Null ) then
                if ( qSuppliers.Active ) then
                   if ( qSuppliers.Locate('ID', strToInt(Supplier.Value),[]) ) then
                      begin
                         ceSuppCom.Text := FloatToStr(qSuppliers.FieldByName('Commission').AsFloat);
                         ceSuppTrans.Text := FloatToStr(qSuppliers.FieldByName('Transport').AsFloat);
                      end;

             if ( Buyers.Value <> Null ) then
                if ( WinData.Buyers.Locate('ID', StrToInt(Buyers.Value),[]) ) then
                   ceBuyerCom.Text := FloatToStr(WinData.Buyers.FieldByName('Commission').AsFloat);
         end;
   except
   end;
end;

procedure TfPurchases.EnableChangeOfCosts(AEnable: Boolean);
begin
   lCommission.Enabled := AEnable;
   dbeCommission.Enabled := AEnable;
   lTransport.Enabled := AEnable;
   dbeHaulage.Enabled := AEnable;
end;

procedure TfPurchases.cbChangeCostsClick(Sender: TObject);
begin
   if (Sender is TcxCheckBox) then
      begin
         if ( (Sender as TcxCheckBox).Checked ) then
            EnableChangeOfCosts(True)
         else
            EnableChangeOfCosts(False);
      end;
end;

procedure TfPurchases.AddToCrushXML;
var
   Animal : TAnimal;
begin
   //   12/11/12 [V5.1 R0.9] /MK Additional Feature - Added CrushXMLExport function.
   if ( WinData.PurchasesSupplier.AsInteger > 0 ) and ( WinData.PurchasesPrice.AsFloat > 0 ) then
      with TCrushXMLExport.Create do
         try
            with FPurchaseAnimal do
               begin
                  AnimalID := WinData.AnimalFileByIDID.AsInteger;
                  Animal := GetAnimal(WinData.AnimalFileByIDID.AsInteger);
                  if ( Animal <> nil ) then
                     NatIDNum := Animal.NatIdNum;
                  SupplierID := WinData.PurchasesSupplier.AsInteger;
                  PurBuyer := WinData.PurchasesBuyer.AsInteger;
                  EventDate := WinData.EventsEventDate.AsDateTime;
                  AnimalWeight := WinData.PurchasesWeight.AsFloat;
                  AnimalPrice := WinData.PurchasesPrice.AsFloat;
                  SupplierCosts := WinData.PurchasesSupplierCosts.AsFloat;
                  BuyerCosts := WinData.PurchasesBuyerCosts.AsFloat;
                  Grade := WinData.PurchasesGrade.AsString;
                  TBTestDate := WinData.AnimalFileByIDTBTestDate.AsDateTime;
               end;
            if ( IsValidEvent(etPurchase) ) then
               begin
                  CreateorOpenXMLFile(etPurchase);
                  AddAnimalToXMLFile(etPurchase);
               end;
         finally
            Free
         end;
end;

procedure TfPurchases.eFQASDaysChange(Sender: TObject);
begin
   CalcFQASDate;
   SetModifiedFlag;
end;

procedure TfPurchases.CalcFQASDate;
begin
   lFQASDate.Visible := ( (lFQAS.Visible) and (not(eFQASDays.Text = '')) );
   lFQASDateDate.Visible := lFQASDate.Visible;
   if ( lFQASDateDate.Visible ) then
      if ( dePurchaseDate.Date > 0 ) and ( (eFQASDays.Text <> '') or (eFQASDays.Text <> Null) ) then
         lFQASDateDate.Caption := DateToStr(dePurchaseDate.Date+StrToInt(eFQASDays.Text));
end;

procedure TfPurchases.BuyersDropDown(Sender: TObject);
begin
   if ( FAddOrModify = amModify ) and ( Buyers.Value <> Null ) then
      FOldBuyer := StrToInt(Buyers.Value);
end;

end.
