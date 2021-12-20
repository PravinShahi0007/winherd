{
  06/01/2009 [Dev V3.9 R5.6, Rel V3.9 R4.8] /SP - Procedure CalcCostAndQtyUsed, Check Medicine.Value > '0'

  27/09/10 [V4.0 R4.8] /MK Additional Feature - Change "Batch In Use" to "Batch No. In Use" -  GL.

  24/05/11 [V4.1 R1.5] /MK Additional Feature - Change "Batch No. In Use" to "Batch In Use" -  GL.
                                              - Moved Batch In Use Heading To End Of Grid Columns.

  08/06/11 [V4.1 R1.8] /MK Additional Feature - Changed Caption To Unit Name As It Does Not Appear Right On Most DataSets.
                                              - If AFocusedRecord.Level = 0 Then AGroupedRowsCount := 1.
                                              - Add DisplayMedicinePurchUnit On GridFocusRecordChange.

  12/07/13 [V5.1 R8.3] /MK Change - Added VetLink button to Toolbar to open uDrugsRegisterImport.

  30/08/13 [V5.2 R1.0] /MK Change - Execute - If AddRecord then change Height of form to hide grid.
                                            - Allow MedicineID to be passed to allow purchase of medicine from Health event.

  03/09/13 [V5.2 R1.0] /MK Additional Feature - Added QtyRemaining field to store QtyRemaining.

  05/09/13 [V5.2 R1.0] /MK Additional Feature - QuantityPropertiesChange - If user edits the purchase and changes quantity to less than
                                                                           quanity remaining then show a warning.

  11/10/13 [V5.2 R3.4] /MK Change - Changed BorderStyle to Dialog if TAddOrEditType = aeAddRecord.
                                  - Change to Sizeable if Editing.

  04/12/13 [V5.2 R6.6] /MK Change - Changed VetLink button to cxButton to allow for Drop-Down-Menu ButtonKind.
                                  - If Preference/AutoDownloadMailAttachments then VetLink/ButtonKind = DropDownMenuButton else Standard.
                                  - Show Mailbox if Preference/AutoDownloadMailAttachments on ButtonClick.

  09/12/13 [V5.2 R6.8] /MK Bug Fix - I made the grid invisible if in Add mode.

  19/12/13 [V5.2 R7.4] /MK Change - Changed colour of BatchNo and Expiry Date to required/important field colour.
                                  - Changed colour of Qty. Remaining to WinHerd read only colour.
                                  - Default the Expiry Date to null.

  18/09/14 [V5.3 R6.3] /MK Change - btnVetLinkClick - Check WinData.FAttachmentsDownloaded to see whether attachments were downloaded
                                    by the user and if they were then just show attachment screen. If they were not then
                                    just download the attachments withouth any question to user - request by GL/Agents meeting 11/09/14.

  09/02/15 [V5.4 R2.6] /MK Bug Fix - Execute - No need to enable/disable AutoSize as this was causing the screen not to maximise - TOK/GL.

  04/03/15 [V5.4 R1.7] /MK Bug Fix - dbnMediPurchaseBeforeAction - Only update medicine quantity if inserting new record not editing.

  23/03/15 [V5.4 R3.4] /MK Change - FormActivate - Switch HerdLookup.dsDrugList to new historical drugs i.e. active/non active drugs - GL/TOK request.

  27/03/15 [V5.4 R3.5] /MK Bug Fix - Constant added to Execute to allow Medicine Setup button not to be shown if coming from Medicine Setup screen - TOK request.

  04/12/16 [V5.5 R2.1] /MK Bug Fix - btnVetLinkClick - HerdIdentity was only assigned if not(WinData.FAttachmentsDownloaded). Therefore the directory was being
                                                       defaulted to the directory within the Mail Attachments folder not the directory within the Herd Number folder.

  09/05/17 [V5.6 R8.0] /MK Additional Feature - Added Print button to the form and removed the Accounts button - Anne Ryan request.
                                              - Default title of print out to Medicine Purchase List and todays date - Anne Ryan request.

  05/10/17 [V5.7 R3.5] /MK Additional Feature - Added links to new uMedBatchNoTreatments screen i.e. button beside batch no at the top of the screen
                                                or double-click on on the batch number on the grid.
                                              - If user moves the mouse near the button beside the batch number at the top of the screen then show a hint explaining
                                                what the button actually does.   

  06/11/17 [V5.7 R4.3] /MK Change - Excute - Close and ReOpen WinData.Suppliers just in case new suppliers were added.

  27/03/19 [V5.8 R8.3] /MK Change - Added the Quantity Remaining column as the last column on the grid - Una Carter.
                                    ** Discussed with GL that a customer can print this grid off for Bord Bia for Veterinary Purchases if the customer
                                       avoids the Veterinary Purchase Report in the Reports and Bord Bia area's of the program **
                                  - Made Column Header height bigger so that the grid is more presentable and doesn't spam over two pages when printed.

  30/05/19 [V5.8 R9.3] /MK Additional Feature - Added Disposal button to the right of Quantity Remaining which brings up new uMediDisposal screen.

  07/04/20 [V5.9 R3.1] /MK Change - FormActivate - As there are sometimes issues with MediPurch QtyRemaining not being updated the system now recalcs this figure when the form is opened - Una Carter.

  08/06/20 [V5.9 R4.8] /MK Change - I moved CalcMediPurchQtyRemaining from OnActivate to its own button on the Toolbar - UCD.

  17/08/20 [V5.9 R5.4] /MK Change - QueryBatchTreatments - Pass in the DrugId to get the exact treatments of this purchase record.

  05/07/21 [V6.0 R1.5] /MK Change - CalcMediPurchQtyRemaining - Show the prompt to the user to only include batches marked in use - Alec (Fletchers).
}

unit uMediPurch;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, ToolEdit, RXDBCtrl, Mask, ExtCtrls,
  RXLookup, Buttons, RXCtrls, ComCtrls, ToolWin, DBTables, kwDBNavigator,
  DBCtrlsEh, DBLookupEh, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxStyles, dxStatusBar, uMedicineSetUp, uDrugsRegisterImport,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxDBEdit, uFileAttachmentImport,
  Menus, uMailBoxHelper, cxButtons, cxMemo, dxPSCore, dxPScxCommon,
  dxPScxGridLnk, GenTypesConst, uMedBatchNoTreatments, cxHint, cxLabel,
  uMediDisposal, uApplicationLog, uProgressIndicator;

type
  TAddOrEditType = (aeAddRecord, aeEditRecord);
  TfMediPurch = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    QuantityOld: TDBEdit;
    CostUnit: TDBEdit;
    Date: TDBDateEdit;
    SupplierID: TRxDBLookupCombo;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    dbnMediPurchase: TkwDBNavigator;
    qSuppliers: TQuery;
    dsSuppliers: TDataSource;
    Label6: TLabel;
    BatchNo: TDBEdit;
    ToolButton4: TToolButton;
    ExpiryDate: TDBDateEdit;
    Label7: TLabel;
    Medicine: TRxDBLookupCombo;
    lPurchUnit: TLabel;
    DBCheckBox1: TDBCheckBox;
    lPurchUnit2: TLabel;
    cxGridMediPurchDBTableView: TcxGridDBTableView;
    cxGridMediPurchLevel: TcxGridLevel;
    cxGridMediPurch: TcxGrid;
    cxGridMediPurchDBTableViewDrugID: TcxGridDBColumn;
    cxGridMediPurchDBTableViewPurchDate: TcxGridDBColumn;
    cxGridMediPurchDBTableViewQuantity: TcxGridDBColumn;
    cxGridMediPurchDBTableViewCostUnit: TcxGridDBColumn;
    cxGridMediPurchDBTableViewSuppID: TcxGridDBColumn;
    cxGridMediPurchDBTableViewBatchNo: TcxGridDBColumn;
    cxGridMediPurchDBTableViewExpiryDate: TcxGridDBColumn;
    cxGridMediPurchDBTableViewInUse: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    StatusBar: TdxStatusBar;
    sbMedicineSetup: TRxSpeedButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Label8: TLabel;
    Quantity: TcxDBCurrencyEdit;
    QtyRemaining: TcxDBCurrencyEdit;
    pmVetLinkScreen: TPopupMenu;
    pmiVetLinkScreen: TMenuItem;
    btnVetLink: TcxButton;
    lComment: TLabel;
    dbmComment: TcxDBMemo;
    btnPrintGrid: TRxSpeedButton;
    PrintGrid: TdxComponentPrinter;
    PrintGridLink: TdxGridReportLink;
    pmQueryBatchTreatments: TPopupMenu;
    pmiQueryBatchTreatments: TMenuItem;
    cxGridMediPurchDBTableViewDrugPurchID: TcxGridDBColumn;
    btnQueryBatchTreats: TcxButton;
    lHintLocation: TcxLabel;
    cxGridMediPurchDBTableViewQtyRem: TcxGridDBColumn;
    btnDisposeBatchNo: TcxButton;
    rxRecalcQtyRemain: TRxSpeedButton;
    ToolButton7: TToolButton;
    procedure bExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SupplierIDCloseUp(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SupplierIDDropDown(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure MedicineChange(Sender: TObject);
    procedure MedicineExit(Sender: TObject);
    procedure MedicineCloseUp(Sender: TObject);
    procedure ExpiryDateChange(Sender: TObject);
    procedure DateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbnMediPurchaseClick(Sender: TObject; Button: TKNavigateBtn);
    procedure FormActivate(Sender: TObject);
    procedure SupplierIDChange(Sender: TObject);
    procedure BatchNoChange(Sender: TObject);
    procedure CostUnitChange(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure cxGridMediPurchDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dbnMediPurchaseBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure sbMedicineSetupClick(Sender: TObject);
    procedure btnVetLinkClick(Sender: TObject);
    procedure QuantityPropertiesChange(Sender: TObject);
    procedure QuantityPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure pmiVetLinkScreenClick(Sender: TObject);
    procedure btnPrintGridClick(Sender: TObject);
    procedure pmiQueryBatchTreatmentsClick(Sender: TObject);
    procedure cxGridMediPurchDBTableViewDblClick(Sender: TObject);
    procedure btnQueryBatchTreatsClick(Sender: TObject);
    procedure lHintLocationMouseEnter(Sender: TObject);
    procedure lHintLocationMouseLeave(Sender: TObject);
    procedure btnDisposeBatchNoClick(Sender: TObject);
    procedure rxRecalcQtyRemainClick(Sender: TObject);
  private
    { private declarations }
    bLookupMediActive : Boolean;
    FModified : Boolean;
    FFormShowing : Boolean;
    FAddOrEditRecord : TAddOrEditType;
    FDrugPurchID : Integer;
    procedure SetModifiedFlag;
    procedure CalcCostAndQtyUsed;
    procedure SuppliersDropDownList;
    procedure CheckExpiryDate;
    procedure DisplayMedicinePurchUnit;
    procedure QueryBatchTreatments(ADrugPurchID, ADrugID : Integer);
    procedure ShowLegendHints(APoint: TPoint; const AHintTitle, AHintText: string; APos: TcxCallOutPosition);
    procedure ShowHideDisposalBtn;
    procedure CalcMediPurchQtyRemaining;
  public
    { public declarations }
    class function Execute(const AAddRecord : Boolean = True; const AMedicineID : Integer = 0;
       const ACalledFromMediSetup : Boolean = False; const ADrugPurchID : Integer = 0) : Integer;
  end;

var
  fMediPurch: TfMediPurch;

implementation
uses
   uSuppliers,
   DairyData,
   Dialogs, Def, KRoutines, uHerdLookup;

{$R *.DFM}

class function TfMediPurch.Execute(const AAddRecord : Boolean = True; const AMedicineID : Integer = 0;
   const ACalledFromMediSetup : Boolean = False; const ADrugPurchID : Integer = 0) : Integer;
begin
   with TfMediPurch.Create(nil) do
      try
         //   09/02/15 [V5.4 R2.6] /MK Bug Fix - No need to enable/disable AutoSize as this was causing the screen not to maximise - TOK/GL.
         if ( AAddRecord ) then
            begin
               //GridViewGroupedByMedicine(False);
               Height := 264;
               WinData.MediPurch.Append;
               BorderStyle := bsDialog;
               cxGridMediPurch.Visible := False;
               if ( AMedicineID > 0 ) then
                  begin
                     Medicine.KeyValue := AMedicineID;
                  end;
               StatusBar.Panels[0].Text := '';
               FAddOrEditRecord := aeAddRecord;
            end
         else
            begin
               Height := 589;
               BorderStyle := bsSizeable;
               cxGridMediPurch.Visible := True;
               FAddOrEditRecord := aeEditRecord;
               FDrugPurchID := ADrugPurchID;
            end;

         //   06/11/17 [V5.7 R4.3] /MK Change - Close and ReOpen WinData.Suppliers just in case new suppliers were added.
         WinData.Suppliers.Close;
         WinData.Suppliers.Open;
         qSuppliers.Open;

         sbMedicineSetup.Visible := ( not(ACalledFromMediSetup) );
         ToolButton6.Visible := sbMedicineSetup.Visible;
         //else
            //GridViewGroupedByMedicine(True);
         ShowModal;
      finally
         Free;
      end;
end;


procedure TfMediPurch.CalcCostAndQtyUsed;
var
   UnitUsed   : Double;
begin
   //Get the DoseUnit from Medicine using the Drug Used
   if Medicine.Value > '0' then    // 06/01/2009 [V3.9 R5.6] /SP - Procedure CalcCostAndQtyUsed, Check Medicine.Value > '0'
      begin
         if HerdLookup.dsDrugList.DataSet.Locate('ID', Medicine.Value,[]) then
            if WinData.Units.Locate('ID',HerdLookup.dsDrugList.DataSet.FieldByName('PurchUnit').Value,[]) then
               begin
                  WinData.DrugUsed := StrToInt(Medicine.Value);
                  UnitUsed := WinData.Units.FieldByName('Multiplier').AsFloat;
                  WinData.DrugQtyUsed := ( UnitUsed * Quantity.DataBinding.Field.AsFloat );
                  WinData.PurchUnitUsed := UnitUsed;
               end;
      end;
end;

procedure TfMediPurch.bExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfMediPurch.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//   CanClose := WinData.DataSetApplyUpdates(Windata.MediPurch, ModalResult = mrOK, FModified );
end;

procedure TfMediPurch.SupplierIDCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if SupplierID.Value = '0' then
      begin
         uSuppliers.ShowTheForm(TRUE, ID);                        // blank record on open
         SupplierID.KeyValue := ID;
      end;
end;

procedure TfMediPurch.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('vetpurch.htm');
end;

procedure TfMediPurch.SuppliersDropDownList;
begin
   //Need to refresh the qSuppliers in the drop down list
   qSuppliers.Close;
   qSuppliers.Open;
end;

procedure TfMediPurch.FormShow(Sender: TObject);
begin
   //Need to refresh the qSuppliers query in the drop down list
   SuppliersDropDownList;
   DisplayMedicinePurchUnit;
   ShowHideDisposalBtn;
   if ( FDrugPurchID > 0 ) then
      WinData.MediPurch.Locate('ID',FDrugPurchID,[]);
end;

procedure TfMediPurch.SupplierIDDropDown(Sender: TObject);
begin
   //Need to refresh the qSuppliers in the drop down list
   SuppliersDropDownList;
end;

procedure TfMediPurch.RxSpeedButton2Click(Sender: TObject);
begin
   if Definition.dUseKingsAccs then
      WinData.CallProg.Accounts(' P ' + RegistrySerialNum, Windata.UserDefaultHerdID)
   else
      WinData.CallProg.Accounts(' P ', Windata.UserDefaultHerdID)
end;

procedure TfMediPurch.MedicineChange(Sender: TObject);
begin
   SetModifiedFlag;
   CalcCostAndQtyUsed();
   DisplayMedicinePurchUnit;
end;

procedure TfMediPurch.MedicineExit(Sender: TObject);
begin
   CalcCostAndQtyUsed;
   DisplayMedicinePurchUnit;
end;

procedure TfMediPurch.MedicineCloseUp(Sender: TObject);
begin
   If Medicine.Value = '0' Then
     begin
        uMedicineSetUp.ShowTheForm(0);

        HerdLookup.dsDrugList.DataSet.Close;
        HerdLookup.dsDrugList.DataSet.Open;

        try
           if ( WinData.MedicineID.AsInteger > 0 ) then
              begin
                 Medicine.KeyValue := WinData.MedicineID.AsInteger;
                 SupplierID.SetFocus;
              end;
        except
        end;
     end;
   DisplayMedicinePurchUnit;
end;

procedure TfMediPurch.CheckExpiryDate;
begin
   if WinData.MediPurchExpiryDate.AsDateTime > 0 then
      if WinData.MediPurchExpiryDate.AsDateTime < WinData.MediPurchPurchDate.AsDateTime then
         MessageDlg('WARNING: Medicine expiry date is before purchase date',mtWarning,[mbOK],0);
end;

procedure TfMediPurch.ExpiryDateChange(Sender: TObject);
begin
   if WinData.MediPurch.State in dsEditModes then
      begin
         SetModifiedFlag;
         CheckExpiryDate;
      end;
end;

procedure TfMediPurch.DateChange(Sender: TObject);
begin
   if WinData.MediPurch.State in dsEditModes then
      begin
         SetModifiedFlag;
         CheckExpiryDate;
      end;
end;

procedure TfMediPurch.FormCreate(Sender: TObject);
begin
   if WinData.GlobalSettings.DownloadMailAttachments then
      btnVetLink.Kind := cxbkDropDownButton
   else
      btnVetLink.Kind := cxbkStandard;
   bLookupMediActive := HerdLookup.dsDrugList.DataSet.Active;
   if not bLookupMediActive then
      HerdLookup.dsDrugList.DataSet.Active := True;
   Medicine.LookupSource := HerdLookup.dsDrugList;
   cxGridMediPurchDBTableViewDrugID.RepositoryItem := HerdLookup.erMedicineLookup;
   cxGridMediPurchDBTableViewSuppID.RepositoryItem := HerdLookup.erSupplierLookup;
   WinData.CallHintStyle;
   WinData.cxHint.HideHint;
   WinData.cxHint.HintStyle.CaptionFont.Name := 'Segoe UI';
   WinData.cxHint.HintStyle.CaptionFont.Size := 12;
   WinData.cxHint.HintStyle.CaptionFont.Style := [fsBold];
   WinData.cxHint.HintStyle.Font.Name := 'Segoe UI';
   WinData.cxHint.HintStyle.Font.Size := 12;
   WinData.cxHint.HintStyle.Font.Style := [];
   ShowHint := True;
end;

procedure TfMediPurch.FormDestroy(Sender: TObject);
begin
   //   24/04/15 [V5.4 R4.0] /MK Bug Fix - If MediPurch state is in Insert/Edit then MediPurch.Cancel
   //                                      as an error was appearing in another screen to select a Supplier.
   if ( WinData.MediPurch.State in [dsInsert,dsEdit] ) then
      WinData.MediPurch.Cancel;
   if not bLookupMediActive then
      HerdLookup.dsDrugList.DataSet.Active := False;
   WinData.cxHint.HideHint;
   WinData.cxHint.HintStyle.CaptionFont.Name := 'Segoe UI';
   WinData.cxHint.HintStyle.CaptionFont.Size := 8;
   WinData.cxHint.HintStyle.CaptionFont.Style := [fsBold];
   WinData.cxHint.HintStyle.Font.Name := 'Segoe UI';
   WinData.cxHint.HintStyle.Font.Size := 8;
   WinData.cxHint.HintStyle.Font.Style := [fsBold];
   WinData.cxHint.HintStyle.CallOutPosition := cxbpTopLeft;
end;

procedure TfMediPurch.DisplayMedicinePurchUnit;
begin
   lPurchUnit.Caption := '';
   lPurchUnit2.Caption := '';
   if Medicine.Value > '0' then
      begin
         if HerdLookup.dsDrugList.DataSet.Locate('ID', StrToInt(Medicine.Value), []) then
            if WinData.Units.Locate('ID', HerdLookup.dsDrugList.DataSet.FieldByName('PurchUnit').Value,[]) then
               begin
                  //lPurchUnit.Caption := 'x ' + WinData.Units.FieldByName('UnitCode').AsString;
                  //   08/06/11 [V4.1 R1.8] /MK Additional Feature - Changed Caption To Unit Name As It Does Not Appear Right On Most DataSets.
                  lPurchUnit.Caption := WinData.Units.FieldByName('Name').AsString;
                  lPurchUnit2.Caption := 'Per ' +WinData.Units.FieldByName('Name').AsString;
               end;
      end;
end;

procedure TfMediPurch.dbnMediPurchaseClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   DisplayMedicinePurchUnit;

   if ( Button = kwnbPost ) then
      begin
         MessageDlg('Medicine Purchase saved.',mtInformation,[mbOK],0);
         dbnMediPurchase.DataSource.DataSet.Append;
         Medicine.SetFocus;
      end
   else if ( Button = kwnbInsert ) then
      begin
         FAddOrEditRecord := aeAddRecord;
         Medicine.SetFocus;
      end;
end;

procedure TfMediPurch.SetModifiedFlag;
begin

end;

procedure TfMediPurch.FormActivate(Sender: TObject);
begin
   FModified := False;
   FFormShowing := True;
   //   23/03/15 [V5.4 R3.4] /MK Change - Switch HerdLookup.dsDrugList to new historical drugs i.e. active/non active drugs - GL/TOK request.
   Medicine.LookupSource := nil;
   if WinData.MediPurch.State = dsInsert then
      begin
         if not(HerdLookup.qDrugList.Active) then
            HerdLookup.qDrugList.Active := True;
         HerdLookup.dsDrugList.DataSet := HerdLookup.qDrugList;
      end
   else
      begin
         if not(HerdLookup.qHistDrugList.Active) then
            HerdLookup.qHistDrugList.Active := True;
         HerdLookup.dsDrugList.DataSet := HerdLookup.qHistDrugList;
      end;
   Medicine.LookupSource := HerdLookup.dsDrugList;

   OnActivate := nil;
end;

procedure TfMediPurch.SupplierIDChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMediPurch.BatchNoChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMediPurch.QuantityPropertiesChange(Sender: TObject);
begin
   if ( Sender is TcxDBCurrencyEdit ) then
      if ( (Sender as TcxDBCurrencyEdit).EditingValue > 0 ) then
         begin
           if ( FAddOrEditRecord = aeAddRecord ) and ( WinData.MediPurch.State = dsInsert ) then
              WinData.MediPurchQtyRemaining.Value := (Sender as TcxDBCurrencyEdit).EditingValue;
         end;
   SetModifiedFlag;
end;

procedure TfMediPurch.CostUnitChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMediPurch.DBCheckBox1Click(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMediPurch.cxGridMediPurchDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   I, AInternalRowIndex, AGroupedRowsCount, ARecordsCount: integer;
   AList: TList;
begin
   if ( AFocusedRecord <> nil ) and ( AFocusedRecord.IsData ) then
      begin
         SetModifiedFlag;
         DisplayMedicinePurchUnit;
         ShowHideDisposalBtn;
      end;

   ARecordsCount := cxGridMediPurchDBTableView.DataController.RecordCount;
   btnQueryBatchTreats.Visible := ( WinData.MediPurch.State <> dsInsert );
   if ( FAddOrEditRecord = aeEditRecord ) then
      StatusBar.Panels[0].Text := Format('Total Medicine Purchases : %d',[ARecordsCount]);
end;

procedure TfMediPurch.dbnMediPurchaseBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
begin
   case Button of
      kwnbFirst : begin
                     cxGridMediPurchDBTableView.DataController.FocusedRowIndex := 0;
                     Abort;
                  end;
      kwnbPrior : begin
                     cxGridMediPurchDBTableView.DataController.FocusedRowIndex := cxGridMediPurchDBTableView.DataController.FocusedRowIndex-1;
                     Abort;
                  end;
      kwnbNext  : begin
                     if cxGridMediPurchDBTableView.DataController.FocusedRowIndex < cxGridMediPurchDBTableView.DataController.DataSet.RecordCount then
                        cxGridMediPurchDBTableView.DataController.FocusedRowIndex := cxGridMediPurchDBTableView.DataController.FocusedRowIndex+1;
                     Abort;
                  end;
      kwnbLast  : begin
                     if cxGridMediPurchDBTableView.DataController.FocusedRowIndex < cxGridMediPurchDBTableView.DataController.DataSet.RecordCount then
                        cxGridMediPurchDBTableView.DataController.FocusedRowIndex := cxGridMediPurchDBTableView.DataController.DataSet.RecordCount;
                     Abort;
                  end;
      kwnbInsert : begin
                      Medicine.SetFocus;
                      //GridViewGroupedByMedicine(False);
                   end;
      kwnbPost   : begin
                      //   04/03/15 [V5.4 R1.7] /MK Bug Fix - Only update medicine quantity if inserting new record not editing.
                      if ( WinData.MediPurch.State = dsInsert ) then
                         WinData.UpdateMedicine(WinData.MediPurchDrugID.AsInteger,WinData.MediPurchQuantity.AsFloat,WinData.MediPurchCostUnit.Value);
                   end;
   end;
end;

{
procedure TfMediPurch.GridViewGroupedByMedicine(AGrouped: Boolean);
begin
   if AGrouped then
      begin
         cxGridMediPurchDBTableViewDrugID.GroupIndex := 0;
         cxGridMediPurchDBTableViewDrugID.Visible := False;
      end
   else
      begin
         cxGridMediPurchDBTableViewDrugID.GroupIndex := -1;
         cxGridMediPurchDBTableViewDrugID.Visible := True;
      end;
end;
}

procedure TfMediPurch.sbMedicineSetupClick(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm(WinData.MediPurchDrugID.AsInteger,False,True);
   HerdLookup.dsDrugList.DataSet.Close;
   HerdLookup.dsDrugList.DataSet.Open;
end;

procedure TfMediPurch.btnVetLinkClick(Sender: TObject);
var
   HerdIdentity, FileName: String;
   FileCount : Integer;
begin
   if ( cxGridMediPurchDBTableView.DataController.DataSource.DataSet.State in [dsInsert, dsEdit] ) then
      cxGridMediPurchDBTableView.DataController.DataSource.DataSet.Cancel;

   {
   18/09/14 [V5.3R6.3] /MK Change - Check WinData.FAttachmentsDownloaded to see whether attachments were downloaded
                                    by the user and if they were then just show attachment screen. If they were not then
                                    just download the attachments withouth any question to user - request by GL/Agents meeting 11/09/14.
   }
   if WinData.GlobalSettings.DownloadMailAttachments then
      begin
         FileCount := 0;
         //   04/12/16 [V5.5 R2.1] /MK Bug Fix - HerdIdentity was only assigned if not(WinData.FAttachmentsDownloaded). Therefore the directory was being
         //                                      defaulted to the directory within the Mail Attachments folder not the directory within the Herd Number folder.
         HerdIdentity := HerdLookup.HerdNumberByHerdId(Windata.UserDefaultHerdID);
         if ( not(WinData.FAttachmentsDownloaded) ) then
            begin
               if ( not(WinData.DownloadEmailAttachments(HerdIdentity) > 0 ) ) then
                  MessageDlg(cEmail_NoNewAttachments,mtInformation,[mbOk],0);
               WinData.FAttachmentsDownloaded := True;
            end;

         //  21/03/14 [V5.2 R9.0] /MK Additional Feature - Had to add FileCount variable as required for MenuUnit.LinksMenu.
         FileName := TfmFileAttachmentImport.execute(itVetLink, HerdIdentity, FileCount);
         if (FileExists(FileName)) then
            TfmDrugsRegisterImport.ShowForm(FileName);
      end
   else
      TfmDrugsRegisterImport.ShowForm;

   HerdLookup.dsDrugList.DataSet.Open;

   WinData.Suppliers.Close;
   WinData.Suppliers.Open;

   cxGridMediPurchDBTableView.DataController.BeginFullUpdate;
   cxGridMediPurchDBTableView.DataController.DataSource.DataSet.Refresh;
   cxGridMediPurchDBTableView.DataController.EndFullUpdate;
end;

procedure TfMediPurch.QuantityPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
   //   05/09/13 [V5.2 R1.0] /MK Additional Feature - If user edits the purchase and changes quantity to less than quanity remaining
   //                                                 then show a warning.
   if ( DisplayValue <> '' ) then
      if ( DisplayValue < WinData.MediPurchQtyRemaining.Value ) then
         begin
            if ( MessageDlg('New quantity is less than quantity remaining.'+#13#10+
                            'Are you sure you want to update the quantity?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
               WinData.MediPurchQtyRemaining.Value := DisplayValue
            else
               SysUtils.Abort;
         end
      else
         WinData.MediPurchQtyRemaining.Value := DisplayValue;
end;

procedure TfMediPurch.pmiVetLinkScreenClick(Sender: TObject);
begin
   TfmDrugsRegisterImport.ShowForm;
end;

procedure TfMediPurch.btnPrintGridClick(Sender: TObject);
begin
   PrintGridLink.ReportTitle.Text := 'Medicine Purchase List '+FormatDateTime(cIrishDateStyle,Now);
   PrintGridLink.Preview;
end;

procedure TfMediPurch.pmiQueryBatchTreatmentsClick(Sender: TObject);
var
   vDrugPurchID,
   vDrugId : Variant;
   iFocusedRecord : Integer;
begin
   inherited;
   iFocusedRecord := cxGridMediPurchDBTableView.DataController.FocusedRecordIndex;
   if ( iFocusedRecord < 0 ) then Exit;

   with cxGridMediPurchDBTableView.DataController do
      begin
         vDrugPurchID := Values[iFocusedRecord, GetItemByFieldName('ID').Index];
         vDrugId := Values[iFocusedRecord, GetItemByFieldName('DrugID').Index];
         QueryBatchTreatments(vDrugPurchID, vDrugId);
      end;
end;

procedure TfMediPurch.cxGridMediPurchDBTableViewDblClick(Sender: TObject);
var
   AView: TcxGridDBTableView;
begin
   inherited;
   AView := TcxGridDBTableView(TcxGridSite(Sender).GridView);
   with AView.Controller do
      if ( FocusedItem.Tag = 1 ) then
         pmiQueryBatchTreatmentsClick(Sender);
end;

procedure TfMediPurch.QueryBatchTreatments(ADrugPurchID, ADrugID : Integer);
begin
   if ( ADrugPurchID = 0 ) or ( ADrugID = 0 ) then Exit;
   HerdLookup.qMedBatchNoTreats.Close;
   HerdLookup.qMedBatchNoTreats.Params[0].AsInteger := ADrugPurchID;
   HerdLookup.qMedBatchNoTreats.Params[1].AsInteger := ADrugID;
   HerdLookup.qMedBatchNoTreats.Open;
   if ( HerdLookup.qMedBatchNoTreats.RecordCount = 0 ) then
      MessageDlg('No treatments have been found for this purchase.',mtInformation,[mbOK],0)
   else
      TfmMedBatchNoTreatments.ShowTheForm(ADrugPurchID);
end;

procedure TfMediPurch.btnQueryBatchTreatsClick(Sender: TObject);
begin
   QueryBatchTreatments(WinData.MediPurch.FieldByName('ID').AsInteger, WinData.MediPurch.FieldByName('DrugId').AsInteger);
end;

procedure TfMediPurch.ShowLegendHints(APoint: TPoint; const AHintTitle, AHintText: string; APos: TcxCallOutPosition);
begin
   Application.ProcessMessages;
   Update;
   WinData.cxHint.HideHint;
   WinData.cxHint.HintStyle.CallOutPosition := APos;
   WinData.cxHint.ShowHint(APoint.x , APoint.y , AHintTitle, AHintText);
   Application.ProcessMessages;
   Update;
end;

procedure TfMediPurch.lHintLocationMouseEnter(Sender: TObject);
var
   HintPoint : TPoint;
begin
   HintPoint := lHintLocation.ClientToScreen(lHintLocation.ClientRect.TopLeft);
   ShowLegendHints(HintPoint,'VPA IS in Kingswood',btnQueryBatchTreats.Hint,cxbpBottomLeft);
end;

procedure TfMediPurch.lHintLocationMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   Application.ProcessMessages;
   Update;
end;

procedure TfMediPurch.btnDisposeBatchNoClick(Sender: TObject);
var
   MediPurchBookMark : TBookMark;
begin
   MediPurchBookMark := cxGridMediPurchDBTableView.DataController.DataSource.DataSet.GetBookmark;
   TfmMediDiposal.ShowTheForm(WinData.MediPurch.FieldByName('DrugID').AsInteger,
                              WinData.MediPurch.FieldByName('ID').AsInteger,
                              WinData.MediPurch.FieldByName('QtyRemaining').AsFloat);
   WinData.MediPurch.Close;
   WinData.MediPurch.Open;
   if ( cxGridMediPurchDBTableView.DataController.DataSource.DataSet.BookmarkValid(MediPurchBookMark) ) then
      begin
         cxGridMediPurchDBTableView.DataController.DataSource.DataSet.GotoBookmark(MediPurchBookMark);
         cxGridMediPurchDBTableView.DataController.DataSource.DataSet.FreeBookmark(MediPurchBookMark);
      end;
end;

procedure TfMediPurch.ShowHideDisposalBtn;
begin
   btnDisposeBatchNo.Visible := ( (FAddOrEditRecord = aeEditRecord) and
                                  (WinData.MediPurch.FieldByName('InUse').AsBoolean) and
                                  (WinData.MediPurch.FieldByName('QtyRemaining').AsFloat > 0) and
                                  (Length(WinData.MediPurch.FieldByName('BatchNo').AsString) > 0) );
end;

procedure TfMediPurch.CalcMediPurchQtyRemaining;
var
   fCurrQtyRemaining,
   fQtyPurchased,
   fDoseMultiplier,
   fPurchMultipler : Double;
   iDrugId,
   iDrugPurchId,
   iDoseUnitId : Integer;
   vCurrQtyRemaining : Variant;
   qMediPurch,
   qUpdate : TQuery;
   bIncludeInUse : Boolean;

   function DrugPurchIdQtyTreated : Double;
   var
      qQtyTreated : TQuery;
   begin
      Result := fCurrQtyRemaining;
      qQtyTreated := TQuery.Create(nil);
      with qQtyTreated do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT SUM(H.RateApplic * H.NoDays * H.NoTimes)');
            SQL.Add('FROM Health H');
            SQL.Add('WHERE H.DrugUsed = :DrugId');
            SQL.Add('AND   H.DrugPurchId = :PurchId');
            Params[0].AsInteger := iDrugId;
            Params[1].AsInteger := iDrugPurchId;
            try
               Open;
               Result := Fields[0].AsFloat;
               if ( Result = 0 ) then Exit;
               Close;
               SQL.Clear;
               SQL.Add('SELECT UD.Multiplier DoseMult, UP.Multiplier PurchMult');
               SQL.Add('FROM Units UD, Units UP');
               SQL.Add('LEFT JOIN Medicine MD ON (MD.DoseUnit = UD.ID)');
               SQL.Add('LEFT JOIN Medicine MP ON (MP.PurchUnit = UP.ID)');
               SQL.Add('WHERE MD.ID = :MDDrugId');
               SQL.Add('AND   MP.ID = :MPDrugId');
               Params[0].AsInteger := iDrugId;
               Params[1].AsInteger := iDrugId;
               Open;
               fDoseMultiplier := Fields[0].AsFloat;
               fPurchMultipler := Fields[1].AsFloat;
               if( fDoseMultiplier > 0 ) or ( fPurchMultipler > 0 ) then
                  Result := ( Result * (fDoseMultiplier/fPurchMultipler) );
            except
               on e : Exception do
                  begin
                     ApplicationLog.LogException(e);
                     ApplicationLog.LogError('Error running query for MediPurch Treatments' + e.Message);
                  end;
            end;
         finally
            Free;
         end;
   end;

   function QtyDeducted : Double;
   var
      qQtyDeducted : TQuery;
   begin
      Result := 0;
      qQtyDeducted := TQuery.Create(nil);
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT QtyDeducted');
            SQL.Add('FROM MedicineDisposal');
            SQL.Add('WHERE DrugId = :DrugId');
            SQL.Add('AND   DrugPurchID = :DrugPurchId');
            Params[0].AsInteger := iDrugId;
            Params[1].AsInteger := iDrugPurchId;
            try
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                  Result := Fields[0].AsFloat;
            except
               on e : Exception do
                  begin
                     ApplicationLog.LogException(e);
                     ApplicationLog.LogError('Error running query for Medicine Disposal in CalcMediPurchQtyRemaining' + e.Message);
                  end;
            end;
         finally
            Free;
         end;
   end;

begin
   //   05/07/21 [V6.0 R1.5] /MK Change - Show the prompt to the user to only include batches marked in use.
   bIncludeInUse := ( MessageDlg('Do you want to ONLY include batches that are marked in use?'+cCRLF+
                                 'NOTE: Click No if you want to include all drugs.',mtConfirmation,[mbYes,mbNo],0) = mrYes );

   Screen.Cursor := crHourGlass;
   cxGridMediPurchDBTableView.DataController.BeginFullUpdate;

   qMediPurch := TQuery.Create(nil);
   qUpdate := TQuery.Create(nil);
   try
      qMediPurch.DatabaseName := AliasName;
      qMediPurch.SQL.Clear;
      qMediPurch.SQL.Add('SELECT *');
      qMediPurch.SQL.Add('FROM MediPur');
      if ( bIncludeInUse ) then
         qMediPurch.SQL.Add('WHERE InUse = True');

      qMediPurch.Open;

      if ( qMediPurch.RecordCount = 0 ) then Exit;

      ShowProgressIndicator('Calculating Quantity Remaining',0,qMediPurch.RecordCount,1);
      ProgressIndicator.Max := qMediPurch.RecordCount;
      Application.ProcessMessages;
      Update;

      qUpdate.DatabaseName := AliasName;
      qUpdate.SQL.Clear;
      qUpdate.SQL.Add('UPDATE MediPur');
      qUpdate.SQL.Add('SET QtyRemaining = :NewQtyRemain');
      qUpdate.SQL.Add('WHERE ID = :PurchId');

      qMediPurch.First;
      while ( not(qMediPurch.Eof) ) do
         begin
            fCurrQtyRemaining := 0;
            fQtyPurchased := 0;
            fDoseMultiplier := 0;
            fPurchMultipler := 0;
            iDrugId := 0;
            iDrugPurchId := 0;
            iDoseUnitId := 0;

            fQtyPurchased := qMediPurch.FieldByName('Quantity').AsFloat;
            iDrugId := qMediPurch.FieldByName('DrugId').AsInteger;
            iDrugPurchId := qMediPurch.FieldByName('Id').AsInteger;

            vCurrQtyRemaining := qMediPurch.FieldByName('QtyRemaining').AsVariant;
            if ( not(IsNumeric(VarToStr(vCurrQtyRemaining))) ) then
               fCurrQtyRemaining := 0
            else
               fCurrQtyRemaining := qMediPurch.FieldByName('QtyRemaining').AsFloat;

            qUpdate.Close;
            qUpdate.Params[0].AsFloat := ( (fQtyPurchased - DrugPurchIdQtyTreated) - QtyDeducted );
            qUpdate.Params[1].AsInteger := iDrugPurchId;
            try
               qUpdate.ExecSQL;
            except
               on e : Exception do
                  begin
                     ApplicationLog.LogException(e);
                     ApplicationLog.LogError(Format('Error when updating MediPurc records during CalcMediPurchQtyRemaining with DrugPurchId : %d',[iDrugPurchID])+cCRLF+
                                             e.Message);
                  end;
            end;
            ProgressIndicator.Position := ProgressIndicator.Position + 1;
            qMediPurch.Next;
         end;
   finally
      qMediPurch.Free;
      ProgressIndicator.Close;
      Application.ProcessMessages;
      Update;
   end;

   WinData.MediPurch.Close;
   WinData.MediPurch.Open;

   cxGridMediPurchDBTableView.DataController.EndFullUpdate;
   cxGridMediPurchDBTableView.DataController.FocusedRowIndex := 0;
   Screen.Cursor := crDefault;
end;

procedure TfMediPurch.rxRecalcQtyRemainClick(Sender: TObject);
begin
   CalcMediPurchQtyRemaining;
end;

end.
