{
 SP 30/10/2002:-

 TDBEdit components changed to TDBEditEh
 TRxLookupCombo changed to TDBLookupComboboxEh
 TRxDBGrid changed to TDBGridEh

 Form re-designed.

 Withdrawal days Meat, Milk and Other

 SP 30/10/2002:-

 23/05/11 [V4.1 R1.5] /MK Change - Changed ShowTheForm To Look At DrugID and Not Boolean.

 05/12/11 [V5.0 R2.4] /MK Change - New Field For VPANo.

 01/02/12 [V5.0 R3.7] /MK Change - Changed CharCase Of EditDrugCode To UpperCase.

 18/05/12 [V5.0 R5.9] /MK Bug Fix - Cancel InsertMode On Start Of Search.

 05/03/13 [V5.1 R4.9] /MK Change - Set Properties.MaxLength to 3 of all Withdrawal Fields.

 02/09/13 [V5.2 R1.0] /MK Additional Feature - Show confirmation message and append after save of new medicine. 

 16/09/13 [V5.2 R1.3] /MK Bug Fix - FormCloseQuery - Cancel if state is dsInsert after post.

 18/09/13 [V5.2 R1.4] /MK Change - Changed Group to Type and changed name of cmboMedicineGroup to Type.

 26/09/13 [V5.2 R1.6] /MK Change - Removed Add buttons from Purchase and Dose Unit combos - GL.
                                 - On CloseUp of Purchase or Does Unit don't show Unit Setup screen - GL.
                                 - If no PurchUnit selected and DoseUnit selected then set PurchUnit to DoseUnit and vice versa.
                                 - Do not allow DrugCode, Name or VPANumber to be edit if not null - GL.

 27/09/13 [V5.2 R1.6] /MK Bug Fix - Default Milk or Meat dbTextEdit components to clTeal depending on HerdType.
                                  - Depending on HerdType show warning if either Milk or Meat Withdrawal is empty.

 02/10/13 [V5.2 R3.0] /MK Change - Added new column Band for Stock Control and moved QtyInStock & CostPerUnit into this band.
                                 - Moved InUse column into Detail Band.
                                 - Organised grid so that it has the same arrangement as top section.

 14/10/13 [V5.2 R3.4] /MK Additional Feature - Added N/A check box - Check WinData.IsN_A_Drug.
                                             - No need for Other Withdrawal fields - GL/NKearney.

 16/10/13 [V5.2 R3.5] /MK Change - dbteVPANoEnter - Allow VPA number to changed if not blank and give warning about Herd Sync problems.

 06/11/13 [V5.2 R5.2] /MK Change - Show Stock Level in Quantity in Stock as Quantity in Stock is DoseUnit quantity remaining where
                                   Stock Level is the Purchase Unit quantity remaining - SP/MK.

 22/01/14 [V5.2 R7.6] /MK Change - Do not allow a Medicine to be saved without a Dose or Purchase Unit.

 08/05/14 [V5.3 R0.0] /MK Change - Dose or Purchase Unit is optional not required.
                                 - Medicine Group is now required to save Medicine - GL request.
                                 - Added a panel, lTopPanel, to better size the form when in Add or View mode.
                                 - Switched Stock Control with Withdrawal Period for Groupboxes and Grid Bands - GL request.

 18/12/14 [V5.4 R0.4] /MK Bug Fix - MedicineGridDBTableViewFocusedRecordChanged - Start lUnitCode&lUnitCode2 at null so medicines with no units appear as blank.

 09/02/15 [V5.4 R2.6] /MK Change - Removed Navigator for Grid and changed to RXButton components with Actions to move through grid properly - TOK & GL request.

 23/03/15 [V5.4 R3.4] /MK Change - DBNavigatorBeforeAction - Only give below error messages if medicine is in use - GL/TOK request.

 24/03/15 [V5.4 R3.4] /MK Additional Feature - Added button to Add Vet Purchase - GL/TOK request.

 27/03/15 [V5.4 R3.5] /MK Bug Fix - Constant added to ShowTheForm to allow Vet Purchase button not to be shown if coming from Vet Purchase screen - TOK request.

 08/04/15 [V5.4 R3.6] /MK Additional Feature - Add drop-down-list to Print Medicine List button. List appears if no filter applied to grid already - TOK request.

 06/08/15 [V5.4 R7.2] /MK Change - Added a new type for FilterType to allow the reports screen to pass in what report to print i.e. All, InUse or NotInUse.
                          Bug Fix - ShowTheForm - take passed in FilterType and show ComponentPrinter report based on this filter - Mary Whyte.

 07/08/15 [V5.4 R7.2] /MK Change - Changed default width of Name, VPA, DoseUnit, PurchUnit & CurrentCost columns to fit on one page of print out.

 24/11/16 [V5.6 R3.5] /MK Change - Changed the Code and Name columns to TextEdit type properites and then set teh CharCase to UpperCase so the sort works.

 25/01/17 [V5.6 R4.2] /MK Bug Fix - DBNavigatorBeforeAction - Don't allow duplicate VPA Numbers to be saved - reported by GL/SP.

 17/02/17 [V5.6 R4.5] /MK Bug Fix - DBNavigatorBeforeAction - Duplicate VPA check was looking at all drugs without ignoring the one that was selected - James Hannon.

 08/05/17 [V5.6 R8.0] /MK Change - ShowTheForm - Check WinData.ActiveMedicineCount when changing the screen size.

 09/05/17 [V5.6 R8.0] /MK Change - MedicineGridPrintFilter - Default title of print out to whatever filter is applied (In Use or Not In use) and todays date - Anne Ryan request.
                                                           - If no filter is applied then set the report tile to Medicine List and todays date.

 17/07/17 [V5.6 R9.2] /SP Change - Changes to form font size.
                      /MK Change - Had to make code changes to positions of some buttons and group boxes because of form font size change.

 16/08/17 [V5.7 R2.0] /MK Change - DisplayMultiplier - Changed Multiplier decimal places to 4 - GL/SP request.
                          Additional Feature - Allow right click on grid if App user and there are drugs that were never used (treated or purchased)
                                               to allow the user to delete all drugs that were never used.

 17/08/17 [V5.7 R2.0] /MK Bug Fix - MedicineGridPrintFilter - Old item used in the filter did not filter out medicines that were in use properly - Clive Johnson (S/N 8820).
                          Additional Feature - If user clicks Add the program then sets focus to the name field.
                                             - If the name field is empty and in insert mode then show TfmDrugFinder.

 18/08/17 [V5.7 R2.0] /MK Change - dbteVPANoEnter - If VPA Number is valid and the user is editing then show warning for caution when changing/removing teh VPA Number.

 21/08/17 [V5.7 R2.0] /MK Change - When adding the VPA Number to the drug from uDrugFinder then add the medicine group and dose/purchase unit as well.

 22/08/17 [V5.7 R2.0] /MK Change - Only show DrugFinder screen if country is Ireland.

 23/08/17 [V5.7 R2.0] /MK Change - DBNavigatorBeforeAction - Show error if invalid or duplicate VPA Number on save regardless if drug is in use or not.
                                                           - Error on duplicate now shows the VPA Number that is duplicated.

 24/08/17 [V5.7 R2.1] /MK Change - Default VPANo CharCase to Upper.
                                 - Removed the Other Column from the grid.
                          Bug Fix - Fixed up the tab sequence in the Medicine Details group box and checked all other tab sequences.

 28/08/17 [V5.7 R2.1] /MK Additional Feature - When user exits out of the VPA Number or clicks the Search button to bring up DrugFinder and the VPA Number
                                               entered or selected is already in the database then prompt user to merge the two drugs keeping the drug selected.

 03/10/17 [V5.7 R3.4] /MK Change - Make search of VPA number available to all countries - GL request.
                                 - Only stop saving of drug without a VPA Number for Irish herds.
                                 - Only stop saving of drug without a Type for Irish herds.

 16/08/18 [V5.8 R2.4] /MK Change - CheckForDuplicateVPANumber - Changed this procedure to a function called DuplicateVPAUpdated so we know whether the duplicates were fixed.
                                                              - Always prompt the user to update existing drug if duplicates are found regardless of Medicine table db state.
                          Additional Feature - actSearchForVPA - When user selects a drug from DrugFinder then bring down the withdrawal details.
                                                               - If withdrawal details are brought down then set the new boolean/date&time in the Medicine table.
                                                               - If updating existing drug then post if DuplicateVPAUpdated.

 29/04/19 [V5.8 R9.0] /MK Change - DBNavigatorBeforeAction - No need to validate on VPA as field is read only so user has to find drug in DrugFinder.

 30/05/19 [V5.8 R9.3] /MK Additional Feature - Added new button for Disposal that brings up the new uMediDisposal screen for drugs that have a batch that has a quantity remaining.

 11/03/20 [V5.9 R2.8] /MK Change - MedicineGridPrintFilter - Only print the Stock Control if "Print All" is selected - GL/Ivan Allens.
                                                           - Don't print the Cost Per Unit column.
                                 - dxComponentPrinter1Link1 - Changed PrinterPage.Orientation to Landscape.

 27/09/21 [V6.0 R2.5] /MK Bug Fix - Added check for a new drug being added will update an existing drug even if there is only one instance of this drug -

 23/11/21 [V6.0 R2.9] /MK Additional Feature - actSearchForVPAExecute - Give warning message if the user clicks the Drug Finder button on the edit of a drug - Una Carter.

 25/11/21 [V6.0 R2.9] /MK Bug Fix - actSearchForVPAExecute - Changed Locate to Lookup as the record in the table was being moved so the
                                                             DuplicateVPAUpdated check for the selected medicine would never work.
}

unit uMedicineSetUp;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, RXLookup, Buttons,
  RXCtrls, ComCtrls, ToolWin, kwDBNavigator, Grids, DBGrids, RXDBCtrl,
  DBCtrlsEh, DBGridEh, DBLookupEh, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxTextEdit, cxContainer, cxEdit, cxGroupBox, cxDBEdit, cxButtons,
  dxPSCore, dxPScxCommon, dxPScxGridLnk, cxGridBandedTableView,
  cxGridDBBandedTableView, cxLabel, dxmdaset, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLookupDBGrid,
  GenTypesConst, uHerdLookup, cxCheckBox, cxCurrencyEdit, ActnList,
  Menus, cxFilter, KRoutines, cxStyles, uDrugFinder, uApplicationLog,
  uFarmSyncSettings, dxStatusBar, HerdPassword, uMedicineClearUp,
  uDrugFinderWithdMsg, uMediDisposal, dxPrnDev;

type
  TInUseFilter = (ftAll, ftInUse, ftNotInUse);

  TfMedicineSetUp = class(TForm)
    MedicineGridDBTableViewType: TcxGridDBBandedColumn;
    lTopPanel: TPanel;
    gbWithdrawal: TcxGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    eMeatOD: TcxDBTextEdit;
    eMilkWD: TcxDBTextEdit;
    eOtherWD: TcxDBTextEdit;
    dbcbN_A_Drug: TcxDBCheckBox;
    gbMedicineDesription: TcxGroupBox;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    EditName: TcxDBTextEdit;
    cbInUse: TDBCheckBox;
    cmboMedicineType: TcxDBLookupComboBox;
    dbteVPANo: TcxDBTextEdit;
    gbOrganicWithdrawal: TcxGroupBox;
    Label3: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    OrgMeatWD: TcxDBTextEdit;
    OrgMilkWD: TcxDBTextEdit;
    OrgOtherWD: TcxDBTextEdit;
    cbOrganicDrug_N_A: TcxCheckBox;
    gbStockControl: TcxGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    lUnitCode: TLabel;
    lUnitCode2: TLabel;
    EditCostPurchUnit: TcxDBTextEdit;
    EditStockLevel: TcxDBTextEdit;
    gbMedicineUnits: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DoseUnit: TRxDBLookupCombo;
    PurchUnit: TRxDBLookupCombo;
    lMultiplier: TcxLabel;
    btnFirst: TRxSpeedButton;
    btnNext: TRxSpeedButton;
    btnPrevious: TRxSpeedButton;
    btnLast: TRxSpeedButton;
    ActionList: TActionList;
    actFirst: TAction;
    actPrevious: TAction;
    actNext: TAction;
    actLast: TAction;
    btnVetPurch: TRxSpeedButton;
    ToolButton5: TToolButton;
    pmPrintMedicineList: TPopupMenu;
    pmiAllMedicines: TMenuItem;
    pmiPrintMedicinesInUse: TMenuItem;
    pmiPrintMedicinesNotInUse: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxGroupHeaderStyle: TcxStyle;
    btnSearchForVPA: TcxButton;
    actSearchForVPA: TAction;
    lN_A_Info: TcxLabel;
    pmMedicineGridUtility: TPopupMenu;
    actRemoveAllMedicinesNotUsed: TAction;
    pmiRemoveAllMedicinesNotUsed: TMenuItem;
    StatusBar: TdxStatusBar;
    pmiRemoveDuplicateDrugs: TMenuItem;
    actRemoveDuplicateMedicines: TAction;
    btnDisposeMedicine: TcxButton;
    procedure WithdrawalPropertiesChange(Sender: TObject);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure cbOrganicDrug_N_APropertiesChange(Sender: TObject);
    procedure dbcbN_A_DrugClick(Sender: TObject);
    procedure dbcbN_A_DrugPropertiesChange(Sender: TObject);
    procedure dbteVPANoEnter(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actPreviousExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure actFirstUpdate(Sender: TObject);
    procedure actPreviousUpdate(Sender: TObject);
    procedure actNextUpdate(Sender: TObject);
    procedure actLastUpdate(Sender: TObject);
    procedure btnVetPurchClick(Sender: TObject);
    procedure pmiAllMedicinesClick(Sender: TObject);
    procedure pmiPrintMedicinesInUseClick(Sender: TObject);
    procedure pmiPrintMedicinesNotInUseClick(Sender: TObject);
    procedure actSearchForVPAExecute(Sender: TObject);
    procedure actRemoveAllMedicinesNotUsedExecute(Sender: TObject);
    procedure EditNameEnter(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
    procedure pmPrintMedicineListPopup(Sender: TObject);
    procedure actRemoveDuplicateMedicinesExecute(Sender: TObject);
    procedure dbteVPANoExit(Sender: TObject);
    procedure btnDisposeMedicineClick(Sender: TObject);
  private
    procedure MedicineGridPrintFilter(AInUseFilter : TInUseFilter);
    procedure ShowHideDisposeMedicineBtn;
  published
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    sbHelp: TRxSpeedButton;
    DBNavigator: TKwDBNavigator;
    ToolButton1: TToolButton;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    gbSearch: TcxGroupBox;
    teSearchName: TcxTextEdit;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    btnPreview: TcxButton;
    MedicineGridDBTableView: TcxGridDBBandedTableView;
    MedicineGridDBTableViewID: TcxGridDBBandedColumn;
    MedicineGridDBTableViewDrugCode: TcxGridDBBandedColumn;
    MedicineGridDBTableViewName: TcxGridDBBandedColumn;
    MedicineGridDBTableViewWithdrawal: TcxGridDBBandedColumn;
    MedicineGridDBTableViewDoseUnit: TcxGridDBBandedColumn;
    MedicineGridDBTableViewPurchUnit: TcxGridDBBandedColumn;
    MedicineGridDBTableViewQuantityInStock: TcxGridDBBandedColumn;
    MedicineGridDBTableViewCostPurchUnit: TcxGridDBBandedColumn;
    MedicineGridDBTableViewMilkWithDrawal: TcxGridDBBandedColumn;
    MedicineGridDBTableViewInUse: TcxGridDBBandedColumn;
    MedicineGridDBTableViewStockLevel: TcxGridDBBandedColumn;
    MedicineGridDBTableViewVPANo: TcxGridDBBandedColumn;
    procedure DoseUnitCloseUp(Sender: TObject);
    procedure PurchUnitCloseUp(Sender: TObject);
    procedure bExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbHelpClick(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditDrugCodeChange(Sender: TObject);
    procedure EditNameChange(Sender: TObject);
    procedure EditWithdrawalChange(Sender: TObject);
    procedure DBEditEh1Change(Sender: TObject);
    procedure DBEditEh2Change(Sender: TObject);
    procedure DoseUnitChange(Sender: TObject);
    procedure PurchUnitChange(Sender: TObject);
    procedure EditQuantityInStockChange(Sender: TObject);
    procedure EditCostPurchUnitChange(Sender: TObject);
    procedure cbOrganicClick(Sender: TObject);
    procedure teSearchCodePropertiesChange(Sender: TObject);
    procedure teSearchNamePropertiesChange(Sender: TObject);
    procedure teSearchNameEnter(Sender: TObject);
    procedure teSearchCodeEnter(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MedicineGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cbInUseClick(Sender: TObject);
    procedure cmboMedicineTypeDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    FFormShowing : Boolean;
    FModified : Boolean;
    FShowDrugID : Integer;
    FHerdType : THerdType;
    FDisplayReportOnStartup : Boolean;
    FMedicinesUsedArray : PIntegerArray;
    FFocusedMedicine : Integer;
    FAddedMedicine : Boolean;
    procedure SetModifiedFlag;
    procedure Search(FieldName,FieldValue : string);
    procedure DisplayMultiplier;
    function NewEntry : Boolean;
    procedure CheckForUtilityDropDown;
    procedure RefreshGrid;
    function DuplicateVPAUpdated(AVPANo: String) : Boolean;
  public
    FFilterType : TInUseFilter;
    { public declarations }
  end;

procedure ShowTheForm ( const ADrugId : Integer = 0; const DisplayReport : Boolean = False;
   const CalledFromMediPurch : Boolean = False; const AInUseFilter : TInUseFilter = ftAll );                   // added 1/00

//var                                                               // changed 1/00
//  fMedicineSetUp: TfMedicineSetUp;                                // changed 1/00

implementation
uses
    uUnitsSetUp,
    DairyData,
    Dialogs,
    uGenLookSetUp,
    uMediPurch;

var                                                                 // changed 1/00
  fMedicineSetUp: TfMedicineSetUp;                                  // changed 1/00

{$R *.DFM}

procedure ShowTheForm (const ADrugId : Integer = 0; const DisplayReport : Boolean =False;
   const CalledFromMediPurch : Boolean = False; const AInUseFilter : TInUseFilter = ftAll);
begin
    with TfMedicineSetUp.Create(nil) do   //
       try
          FShowDrugID := ADrugID;
          HerdLookup.HerdOwnerData.HerdID := WinData.UserDefaultHerdID;
          FHerdType := HerdLookup.GetHerdType(HerdLookup.HerdOwnerData.HerdID);
          if ( FHerdType = htDairy ) then
             dbcbN_A_Drug.DataBinding.DataField := 'MilkN_A_Drug'
          else
             dbcbN_A_Drug.DataBinding.DataField := 'MeatN_A_Drug';

          lTopPanel.Height := 280;
          lN_A_Info.Top := 312;

          gbOrganicWithdrawal.Visible := HerdLookup.HerdOwnerData.OrganicHerd;
          if ( not(gbOrganicWithdrawal.Visible) ) then
             begin
                lN_A_Info.Top := 242;
                lTopPanel.Height := 228;
             end;

          btnVetPurch.Visible := ( not(CalledFromMediPurch) );
          ToolButton5.Visible := btnVetPurch.Visible;

          lN_A_Info.Visible := False;

          FDisplayReportOnStartup := DisplayReport;

          if ( not(FDisplayReportOnStartup) ) then
             begin
                Panel2.Visible := ( ADrugId > 0 ) or ( WinData.ActiveMedicineCount = 0 );

                if ( ADrugId <= 0 ) and ( WinData.ActiveMedicineCount > 0 ) then
                   begin
                      if ( gbOrganicWithdrawal.Visible ) then
                         Height := 362
                      else
                         Height := 305;
                      WinData.Medicine.Append;
                      BorderStyle := bsDialog;
                   end
                else
                   begin
                      if ( gbOrganicWithdrawal.Visible ) then
                         Height := 650
                      else
                         Height := 590;
                      MedicineGridDBTableView.Controller.FocusedRecordIndex := WinData.Medicine.FieldDefs.IndexOf('ID');
                      if ( ADrugID > 0 ) then
                         begin
                            WinData.Medicine.Locate('ID',ADrugId, []);
                         end;
                      BorderStyle := bsSizeable;
                   end;

                if ( FHerdType = htDairy ) then
                   begin
                      eMilkWD.Style.Color := clTeal;
                      eMilkWD.Style.Font.Color := clWhite;
                      OrgMilkWD.Style.Color := clTeal;
                      OrgMilkWD.Style.Font.Color := clWhite;
                   end
                else if ( FHerdType in [htSuckler, htBeef] ) then
                   begin
                      eMeatOD.Style.Color := clTeal;
                      eMeatOD.Style.Font.Color := clWhite;
                      OrgMeatWD.Style.Color := clTeal;
                      OrgMeatWD.Style.Font.Color := clWhite;
                   end;
                ShowModal;
             end
          else
              MedicineGridPrintFilter(AInUseFilter)
      finally
          Free;
      end;
end;

procedure TfMedicineSetUp.DoseUnitCloseUp(Sender: TObject);
begin
   {
   If DoseUnit.Value = '0' then
      uUnitsSetUp.ShowTheForm(TRUE);
   }
   //   26/09/13 [V5.2 R1.6] /MK Change - If no PurchUnit selected and DoseUnit selected then set PurchUnit to DoseUnit.
   if ( DoseUnit.Value <> '' ) or ( DoseUnit.Value <> '0' ) then
      if ( PurchUnit.Value = '' ) or ( PurchUnit.Value = '0' ) then
         PurchUnit.Value := DoseUnit.Value;

   DisplayMultiplier;
end;

procedure TfMedicineSetUp.PurchUnitCloseUp(Sender: TObject);
begin
   {
   If PurchUnit.Value = '0' then
      uUnitsSetUp.ShowTheForm(TRUE);
   }
   //   26/09/13 [V5.2 R1.6] /MK Change - If no DoseUnit selected and PurchUnit selected then set DoseUnit to PurchUnit.
   if ( PurchUnit.Value <> '' ) or ( PurchUnit.Value <> '0' ) then
      if ( DoseUnit.Value = '' ) or ( DoseUnit.Value = '0' ) then
         DoseUnit.Value := PurchUnit.Value;

   DisplayMultiplier;
end;

procedure TfMedicineSetUp.bExitClick(Sender: TObject);
begin
   //   20/12/12 [V5.1 R3.5] /MK Bug Fix - Check if screen in EditMode and Medicine Code and Name is not null then show warning
   //                                      on screen exit.
   if ( WinData.Medicine.State in dsEditModes ) and ( NewEntry ) then
      begin
         if ( MessageDlg('Unsaved changes, exit anyway?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            begin
                WinData.Medicine.Cancel;
                Close;
            end;
      end
   else
      Close;
end;

procedure TfMedicineSetUp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   //CanClose := WinData.DataSetApplyUpdates(Windata.Medicine, ModalResult = mrOK, FModified );
   //   16/09/13 [V5.2 R1.3] /MK Bug Fix - Cancel if state is dsInsert after post.
   if ( WinData.Medicine.State = dsInsert ) then
      WinData.Medicine.Cancel;
end;

procedure TfMedicineSetUp.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('medsetup.htm')
end;

procedure TfMedicineSetUp.RxSpeedButton2Click(Sender: TObject);
begin
end;

procedure TfMedicineSetUp.FormActivate(Sender: TObject);
begin
   FFormShowing := True;
   FModified := False;
   StatusBar.Panels[0].Text := '';
   CheckForUtilityDropDown;

   if ( MedicineGridDBTableView.DataController.DataSource.DataSet.RecordCount > 0 ) then
      StatusBar.Panels[0].Text := 'Records : '+IntToStr(MedicineGridDBTableView.DataController.DataSource.DataSet.RecordCount);

   OnActivate := nil;
end;

procedure TfMedicineSetUp.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TfMedicineSetUp.EditDrugCodeChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.EditNameChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.EditWithdrawalChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.DBEditEh1Change(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.DBEditEh2Change(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.DoseUnitChange(Sender: TObject);
begin
   SetModifiedFlag;
   DisplayMultiplier;
end;

procedure TfMedicineSetUp.PurchUnitChange(Sender: TObject);
begin
   SetModifiedFlag;
   DisplayMultiplier;
end;

procedure TfMedicineSetUp.EditQuantityInStockChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.EditCostPurchUnitChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.cbOrganicClick(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfMedicineSetUp.Search(FieldName, FieldValue : string);
var
   SearchStr : String;
   BK : TBookmark ;
begin
  inherited;
  SearchStr := Trim(FieldValue);
  if SearchStr = '' then Exit;
  Screen.Cursor := crHourGlass;
  try
     MedicineGridDBTableView.DataController.BeginUpdate;
     try
        BK := MedicineGridDBTableView.DataController.DataSet.GetBookmark;
        if not MedicineGridDBTableView.DataController.DataSet.Locate(FieldName, FieldValue, [loCaseInsensitive,loPartialKey]) then
           begin
              MedicineGridDBTableView.DataController.DataSet.GotoBookmark(BK);
              MessageDlg('No match has been found',mtinformation,[mbOk],0);
           end;
        MedicineGridDBTableView.DataController.DataSet.FreeBookmark(BK);
     finally
        MedicineGridDBTableView.DataController.EndUpdate;
     end;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfMedicineSetUp.teSearchCodePropertiesChange(Sender: TObject);
begin
   //Search('DrugCode',teSearchCode.Text);
end;

procedure TfMedicineSetUp.teSearchNamePropertiesChange(Sender: TObject);
begin
   Search('Name',teSearchName.Text);
end;

procedure TfMedicineSetUp.teSearchNameEnter(Sender: TObject);
begin
   // teSearchCode.Text := '';
end;

procedure TfMedicineSetUp.teSearchCodeEnter(Sender: TObject);
begin
   //   18/05/12 [V5.0 R5.9] /MK Bug Fix - Cancel InsertMode On Start Of Search.
   WinData.Medicine.Cancel;
   teSearchName.Text := '';
end;

procedure TfMedicineSetUp.btnPreviewClick(Sender: TObject);
var
   pt : tPoint;
begin
   GetCursorPos(pt);
   pmPrintMedicineList.Popup(pt.x,pt.y);
end;

procedure TfMedicineSetUp.FormCreate(Sender: TObject);
begin
   lUnitCode.Caption := '';
   lUnitCode2.Caption := '';
   lMultiplier.Caption := '';
end;

procedure TfMedicineSetUp.FormDestroy(Sender: TObject);
begin
   WinData.Medicine.AfterScroll := nil;
end;

procedure TfMedicineSetUp.MedicineGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   if ( AFocusedRecord = nil ) then Exit;

   //   26/09/13 [V5.2 R1.6] /MK Change - Do not allow DrugCode, Name or VPANumber to be edit if not null - GL.
   //EditDrugCode.Properties.ReadOnly := ( not(EditDrugCode.EditValue = Null) );
   EditName.Properties.ReadOnly := ( not(EditName.EditValue = Null) );
   //dbteVPANo.Properties.ReadOnly := ( not(dbteVPANo.EditValue = Null) );

   //   18/12/14 [V5.4 R0.4] /MK Bug Fix - Start lUnitCode&lUnitCode2 at null so medicines with no units appear as blank.
   lUnitCode2.Caption := '';
   lUnitCode.Caption := '';

   if ANewItemRecordFocusingChanged then
      begin
         dbcbN_A_Drug.Checked := WinData.IsN_A_Drug(WinData.MedicineID.AsInteger);
         cbOrganicDrug_N_A.Checked := WinData.IsN_A_Drug(WinData.MedicineID.AsInteger);
      end;

   DisplayMultiplier;

   ShowHideDisposeMedicineBtn;
end;

procedure TfMedicineSetUp.cbInUseClick(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.cmboMedicineTypeDblClick(Sender: TObject);
begin
   GenLookUpType := TMedicineGroup;
   uGenLookSetUp.ShowTheForm(TRUE);
end;

procedure TfMedicineSetUp.DisplayMultiplier;
var
   DoseUnitMultiplier, PurchUnitMultiplier : Double;
   V : Variant;
begin
  with MedicineGridDBTableView.DataController do
     begin
        if Dataset.FieldByName('PurchUnit').AsInteger > 0 then
            begin
               V := WinData.Units.Lookup('ID', Dataset.FieldByName('PurchUnit').AsInteger, 'UnitCode');
               if not VarIsNull(V) then
                  begin
                     lUnitCode.Caption := 'Per ' +VarToStr(V);
                     lUnitCode2.Caption := VarToStr(V);
                  end;

               V := WinData.Units.Lookup('ID', Dataset.FieldByName('PurchUnit').AsInteger, 'Multiplier');
               if not VarIsNull(V) then
                  begin
                     PurchUnitMultiplier := V;
                  end;
            end;

         if Dataset.FieldByName('DoseUnit').AsInteger > 0 then
            begin
               V := WinData.Units.Lookup('ID', Dataset.FieldByName('DoseUnit').AsInteger, 'Multiplier');
               if not VarIsNull(V) then
                  begin
                     DoseUnitMultiplier := V;
                  end;
            end;

         lMultiplier.Caption := '';
         if ( DoseUnitMultiplier > 0) and (PurchUnitMultiplier > 0) then
            try
              //   16/08/17 [V5.7 R2.0] /MK Change - Changed Multiplier decimal places to 4 - GL/SP request.
              lMultiplier.Caption := FloatToStrF( DoseUnitMultiplier / PurchUnitMultiplier, ffFixed, 8, 4);
            except
            end;
      end;
end;

procedure TfMedicineSetUp.FormShow(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cMedStockRep);
   ShowHideDisposeMedicineBtn;
end;

function TfMedicineSetUp.NewEntry: Boolean;
begin
   Result := ( (WinData.Medicine.FieldByName('DrugCode').AsString <> '') or
               (WinData.Medicine.FieldByName('Name').AsString <> '') );
end;

procedure TfMedicineSetUp.WithdrawalPropertiesChange(Sender: TObject);
begin
   if ( Sender is TcxDBTextEdit ) then
     (Sender as TcxDBTextEdit).PostEditValue;
end;

procedure TfMedicineSetUp.DBNavigatorBeforeAction(Sender: TObject; Button: TKNavigateBtn);
var
   qUpdateMediPur : TQuery;
   sVPANo : String;
begin
   sVPANo := '';
   FAddedMedicine := False;
   if ( Button = kwnbInsert ) then
      FAddedMedicine := True;
   if ( Button = kwnbPost ) then
      begin
         EditName.Text := Trim(EditName.Text);
         if ( Length(EditName.Text) = 0 ) then
            begin
               MessageDlg('A Name must be entered.',mtError,[mbOK],0);
               SysUtils.Abort;
            end;

         dbteVPANo.Text := Trim(dbteVPANo.Text);
         sVPANo := FormatVPANumber(dbteVPANo.Text);
         //   29/04/19 [V5.8 R9.0] /MK Change - No need to validate on VPA as field is read only so user has to find drug in DrugFinder.
         {
         if ( WinData.SystemRegisteredCountry = Ireland ) and ( Length(sVPANo) = 0 ) then
            begin
               MessageDlg('A VPA Number must be entered.',mtError,[mbOK],0);
               SysUtils.Abort;
            end
         }
         if ( Length(sVPANo) > 0 ) then
            try
               //   23/08/17 [V5.7 R2.0] /MK Change - If duplicate VPA Number found then format error to show what VPA Number it is.
               if ( HerdLookup.DuplicateVPAFound(sVPANo,DBNavigator.DataSource.DataSet.FieldByName('ID').AsInteger) ) then
                  begin
                     MessageDlg(Format('This VPA Number, %s, already exists.',[sVPANo]),mtError,[mbOK],0);
                     SysUtils.Abort;
                  end
               else
                  dbteVPANo.Text := sVPANo;
            finally
               HerdLookup.qExistingVPADrugs.Close;
            end;

         //   23/03/15 [V5.4 R3.4] /MK Change - Only give below error messages if medicine is in use - GL/TOK request.
         if ( cbInUse.Checked ) then
            begin
               //   08/05/14 [V5.3 R0.0] /MK Change - Medicine Group is now required to save Medicine.
               if ( WinData.SystemRegisteredCountry = Ireland ) and
                  ( DBNavigator.DataSource.DataSet.FieldByName('MediGroup').Value = Null ) then
                  begin
                     MessageDlg('A Drug Type must be selected.',mtError,[mbOK],0);
                     SysUtils.Abort;
                  end;

               //   25/01/17 [V5.6 R4.2] /MK Bug Fix - Don't allow duplicate VPA Numbers to be saved - reported by GL/SP.
               //   17/02/17 [V5.6 R4.5] /MK Bug Fix - Duplicate VPA check was looking at all drugs without ignoring the one that was selected - James Hannon.
               if ( not(HerdLookup.HerdOwnerData.OrganicHerd) ) then
                  begin
                     if ( FHerdType = htDairy ) then
                        begin
                           // If Dairy herd and Milk withdrawal is null then show error, regardless of whether Meat Withdrawal is <> 0 - GL.
                           if ( DBNavigator.DataSource.DataSet.FieldByName('MilkWithDrawal').AsVariant = Null ) then
                              begin
                                 MessageDlg('Milk Withdrawal Period must be specified'+cCRLF+
                                            'or "N/A" box must be ticked.',mtError,[mbOK],0);
                                 SysUtils.Abort;
                              end;
                        end
                     else if ( FHerdType in [htBeef, htSuckler] ) then
                        begin
                           // If Dairy herd and Meat withdrawal is null then show error, regardless of whether Milk Withdrawal is <> 0 - GL.
                           if ( DBNavigator.DataSource.DataSet.FieldByName('WithDrawal').AsVariant = Null ) then
                              begin
                                 MessageDlg('Meat Withdrawal Period must be specified'+cCRLF+
                                            'or "N/A" box must be ticked.',mtError,[mbOK],0);
                                 SysUtils.Abort;
                              end;
                        end;
                  end;

               //   18/12/14 [V5.4 R0.4] /MK Additional Feature - If user is editing the Medicine and sets the quantity to zero/null
               //                                                 and drug purchases exists for this medicine then zero/null drug purchase
               //                                                 quantity remaining - GL/Andrew Dineen request.
               if ( DBNavigator.DataSource.DataSet.State = dsEdit ) then
                  begin
                     qUpdateMediPur := TQuery.Create(nil);
                     with qUpdateMediPur do
                        try
                           DatabaseName := AliasName;
                           SQL.Clear;
                           SQL.Add('SELECT COUNT(ID)');
                           SQL.Add('FROM MediPur');
                           SQL.Add('WHERE DrugID = :DrugID');
                           Params[0].AsInteger := WinData.Medicine.FieldByName('ID').AsInteger;
                           try
                              Open;
                              if ( Fields[0].AsInteger > 0 ) then
                                 begin
                                    EditStockLevel.PostEditValue;
                                    if ( WinData.Medicine.FieldByName(EditStockLevel.DataBinding.DataField).AsFloat = 0 ) then
                                       begin
                                          MessageDlg('You have chosen to zero/clear this medicines quantity.'+cCRLF+
                                                     'This has also cleared the medicines purchase quantities.',mtInformation,[mbOK],0);
                                             begin
                                                DatabaseName := AliasName;
                                                SQL.Clear;
                                                SQL.Add('UPDATE MediPur');
                                                SQL.Add('SET QtyRemaining = NULL');
                                                SQL.Add('WHERE DrugID = :DrugID');
                                                Params[0].AsInteger := WinData.Medicine.FieldByName('ID').AsInteger;
                                                try
                                                   ExecSQL;
                                                except
                                                   on e : Exception do
                                                      ShowMessage(e.Message);
                                                end;
                                             end;
                                       end;
                                 end;
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;
                        finally
                           Free;
                        end;
                  end;

               {
               //   08/05/14 [V5.3 R0.0] /MK Change - Dose or Purchase Unit is optional not required.
               //   22/01/14 [V5.2 R6.5] /MK Change - Do not allow a Medicine to be saved without a Dose or Purchase Unit.
               if ( DBNavigator.DataSource.DataSet.FieldByName('DoseUnit').Value = Null ) and
                  ( DBNavigator.DataSource.DataSet.FieldByName('PurchUnit').Value = Null ) then
                  begin
                     MessageDlg('A Dose Unit or Purchase Unit must be selected.',mtError,[mbOK],0);
                     SysUtils.Abort;
                  end;
               }
            end;
      end;

   {
   if ( Button = kwnbFirst ) then
      MedicineGridDBTableView.DataController.FocusedRowIndex := 0
   else if ( Button = kwnbPrior ) then
      MedicineGridDBTableView.DataController.FocusedRowIndex := MedicineGridDBTableView.DataController.FocusedRowIndex-1
   else if ( Button = kwnbNext ) then
      MedicineGridDBTableView.DataController.FocusedRowIndex := MedicineGridDBTableView.DataController.FocusedRowIndex+1
   else if ( Button = kwnbLast ) then
      begin
         if MedicineGridDBTableView.DataController.FocusedRowIndex < MedicineGridDBTableView.DataController.DataSet.RecordCount then
            MedicineGridDBTableView.DataController.FocusedRowIndex := MedicineGridDBTableView.DataController.DataSet.RecordCount;
      end;
   }
end;

procedure TfMedicineSetUp.cbOrganicDrug_N_APropertiesChange(
  Sender: TObject);
begin
   OrgMeatWD.Properties.ReadOnly := cbOrganicDrug_N_A.Checked;
   OrgMeatWD.Enabled := ( not(OrgMeatWD.Properties.ReadOnly) );
   OrgMilkWD.Properties.ReadOnly := OrgMeatWD.Properties.ReadOnly;
   OrgMilkWD.Enabled := ( not(eMeatOD.Properties.ReadOnly) );
   lN_A_Info.Visible := OrgMeatWD.Properties.ReadOnly;
   if ( cbOrganicDrug_N_A.Checked ) then
      begin
         if ( FHerdType = htDairy ) then
            begin
               WinData.Medicine.Edit;
               WinData.Medicine.FieldByName('OrganicMilkWithdrawal').AsInteger := 9999;
            end
         else
            begin
               WinData.Medicine.Edit;
               WinData.Medicine.FieldByName('OrganicMeatWithdrawal').AsInteger := 9999;
            end;
      end
   else
      begin
         if ( (FHerdType = htDairy) and (eMilkWD.EditValue = 9999) ) then
            begin
               WinData.Medicine.Edit;
               OrgMilkWD.EditValue := Null;
               WinData.Medicine.FieldByName('OrganicMilkWithdrawal').Value := Null;
            end
         else if ( (FHerdType <> htDairy) and (eMeatOD.EditValue = 9999) ) then
            begin
               WinData.Medicine.Edit;
               OrgMeatWD.EditValue := Null;
               WinData.Medicine.FieldByName('OrganicMeatWithdrawal').Value := Null;
            end
      end;
end;

procedure TfMedicineSetUp.dbcbN_A_DrugClick(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMedicineSetUp.dbcbN_A_DrugPropertiesChange(Sender: TObject);
begin
   lN_A_Info.Visible := dbcbN_A_Drug.Checked;
   if ( FHerdType = htDairy ) then
      begin
         eMilkWD.Properties.ReadOnly := dbcbN_A_Drug.Checked;
         eMilkWD.Enabled := ( not(eMilkWD.Properties.ReadOnly) );
      end
   else
      begin
         eMeatOD.Properties.ReadOnly := dbcbN_A_Drug.Checked;
         eMeatOD.Enabled := ( not(eMeatOD.Properties.ReadOnly) );
      end;
   if ( dbcbN_A_Drug.Checked ) then
      begin
         if ( FHerdType = htDairy ) then
            eMilkWD.EditValue := 9999
         else
            eMeatOD.EditValue := 9999;
      end
   else
      begin
         if ( (FHerdType = htDairy) and (eMilkWD.EditValue = 9999) ) then
            eMilkWD.EditValue := Null
         else if ( (FHerdType <> htDairy) and (eMeatOD.EditValue = 9999) ) then
            eMeatOD.EditValue := Null;
      end;
end;

procedure TfMedicineSetUp.dbteVPANoEnter(Sender: TObject);
begin
   try
      if ( FFocusedMedicine = WinData.Medicine.FieldByName('ID').AsInteger ) then
         Exit
      else if ( WinData.Medicine.State = dsBrowse ) and ( IsValidVPANumber(dbteVPANo.Text) ) then
         begin
            MessageDlg('This is a valid VPA number and should be changed/removed with caution.',mtWarning,[mbOK],0);
            Grid.SetFocus;
         end;
   finally
      FFocusedMedicine := WinData.Medicine.FieldByName('ID').AsInteger;
   end;
end;

procedure TfMedicineSetUp.actFirstExecute(Sender: TObject);
begin
   MedicineGridDBTableView.Controller.FocusedRowIndex := 0;
end;

procedure TfMedicineSetUp.actPreviousExecute(Sender: TObject);
begin
   MedicineGridDBTableView.Controller.FocusedRowIndex := MedicineGridDBTableView.Controller.FocusedRowIndex-1;
end;

procedure TfMedicineSetUp.actNextExecute(Sender: TObject);
begin
   MedicineGridDBTableView.Controller.FocusedRowIndex := MedicineGridDBTableView.Controller.FocusedRowIndex+1;
end;

procedure TfMedicineSetUp.actLastExecute(Sender: TObject);
begin
   if ( MedicineGridDBTableView.DataController.FocusedRowIndex < MedicineGridDBTableView.DataController.DataSet.RecordCount ) then
      MedicineGridDBTableView.DataController.FocusedRowIndex := MedicineGridDBTableView.DataController.DataSet.RecordCount;
end;

procedure TfMedicineSetUp.actFirstUpdate(Sender: TObject);
begin
   actFirst.Enabled := MedicineGridDBTableView.DataController.FocusedRowIndex > 0;
end;

procedure TfMedicineSetUp.actPreviousUpdate(Sender: TObject);
begin
   actPrevious.Enabled := MedicineGridDBTableView.DataController.FocusedRowIndex > 0;
end;

procedure TfMedicineSetUp.actNextUpdate(Sender: TObject);
begin
   actNext.Enabled := not ( MedicineGridDBTableView.DataController.FocusedRowIndex + 1 =
                            MedicineGridDBTableView.DataController.RecordCount )
end;

procedure TfMedicineSetUp.actLastUpdate(Sender: TObject);
begin
   actLast.Enabled := not ( MedicineGridDBTableView.DataController.FocusedRowIndex + 1 =
                            MedicineGridDBTableView.DataController.RecordCount )
end;

procedure TfMedicineSetUp.btnVetPurchClick(Sender: TObject);
begin
   TfMediPurch.Execute(True,0,True);
end;

procedure TfMedicineSetUp.pmiAllMedicinesClick(Sender: TObject);
begin
   MedicineGridPrintFilter(ftAll);
end;

procedure TfMedicineSetUp.pmiPrintMedicinesInUseClick(Sender: TObject);
begin
   MedicineGridPrintFilter(ftInUse);
end;

procedure TfMedicineSetUp.pmiPrintMedicinesNotInUseClick(Sender: TObject);
begin
   MedicineGridPrintFilter(ftNotInUse);
end;

procedure TfMedicineSetup.MedicineGridPrintFilter (AInUseFilter : TInUseFilter);
begin
   //   11/03/20 [V5.9 R2.8] /MK Change - Don't print the Cost Per Unit column.
   MedicineGridDBTableViewCostPurchUnit.Visible := False;
   MedicineGridDBTableView.OptionsView.Footer := True;
   if ( AInUseFilter <> ftAll ) then
      begin
         //   11/03/20 [V5.9 R2.8] /MK Change - Only print the Stock Control if "Print All" is selected - GL/Ivan Allens.
         MedicineGridDBTableView.Bands[3].Visible := False;
         MedicineGridDBTableView.DataController.Filter.BeginUpdate;
         MedicineGridDBTableView.DataController.Filter.Root.Clear;
         MedicineGridDBTableView.DataController.Filter.Active := False;
         if ( AInUseFilter = ftInUse ) then
            begin
               dxComponentPrinter1Link1.ReportTitle.Text := 'In Use Medicine List '+FormatDateTime(cIrishDateStyle,Now);
               //   17/08/17 [V5.7 R2.0] /MK Bug Fix - Old item used in the filter did not filter out medicines that were in use properly.
               MedicineGridDBTableView.DataController.Filter.AddItem(nil, MedicineGridDBTableViewInUse, foEqual, 'True', '');
            end
         else if ( AInUseFilter = ftNotInUse ) then
            begin
               dxComponentPrinter1Link1.ReportTitle.Text := 'Not In Use Medicine List '+FormatDateTime(cIrishDateStyle,Now);
               MedicineGridDBTableView.DataController.Filter.AddItem(nil, MedicineGridDBTableViewInUse, foEqual, 'False', '');
            end;
         MedicineGridDBTableView.DataController.Filter.Active := True;
         MedicineGridDBTableView.DataController.Filter.EndUpdate;
         if ( not(dxComponentPrinter1Link1.PreviewExists) ) then
            dxComponentPrinter1Link1.Preview;
         MedicineGridDBTableView.DataController.Filter.BeginUpdate;
         MedicineGridDBTableView.DataController.Filter.Root.Clear;
         MedicineGridDBTableView.DataController.Filter.Active := False;
         MedicineGridDBTableView.DataController.Filter.EndUpdate;
      end
   else
      begin
         dxComponentPrinter1Link1.ReportTitle.Text := 'Medicine List '+FormatDateTime(cIrishDateStyle,Now);
         if ( not(dxComponentPrinter1Link1.PreviewExists) ) then
            dxComponentPrinter1Link1.Preview;
      end;
   MedicineGridDBTableView.OptionsView.Footer := False;
   MedicineGridDBTableView.Bands[3].Visible := True;
   MedicineGridDBTableViewCostPurchUnit.Visible := True;
end;

procedure TfMedicineSetUp.actSearchForVPAExecute(Sender: TObject);
var
   Item : TDrugItem;
   iUnitID : Integer;
   bDuplicateUpdated,
   bWithdrawalConfirmed : Boolean;
   iMedicineFound : Integer;
   sLookupName : String;
   vMedicineId : Variant;
begin
   //   23/11/21 [V6.0 R2.9] /MK Additional Feature - Give warning message if the user clicks the Drug Finder button on the edit of a drug - Una Carter.
   if ( WinData.Medicine.State in [dsBrowse, dsEdit] ) and ( WinData.MedicineID.AsInteger > 0 ) and
      ( Length(WinData.Medicine.FieldByName('Name').AsString) > 0 ) then
      if ( MessageDlg('This option will allow you to change the selected medicine to another from the Drug Finder screen.'+cCRLF+
                      'This will update all medicine treatments and purchases for the selected medicine to the new medicine.'+cCRLF+
                      'Do you wish to continue?',mtWarning,[mbYes, mbNo],0) = mrNo ) then Exit;

   sLookupName := WinData.Medicine.FieldByName('Name').AsString;
   WinData.Medicine.Cancel;
   Item := TfmDrugFinder.Find(sLookupName);
   if Item = nil then Exit;
   bWithdrawalConfirmed := TfmDrugFinderWithdMsg.WithdrawalConfirmed(Item);
   //   25/11/21 [V6.0 R2.9] /MK Bug Fix - Changed Locate to Lookup as the record in the table was being moved so the DuplicateVPAUpdated check for the selected medicine would never work.
   vMedicineId := WinData.Medicine.Lookup('VPANo',UpperCase(Item.VPANumber),'Id');
   if ( not(VarIsNull(vMedicineId)) ) then
      iMedicineFound := vMedicineId;
   try
      if ( not(WinData.Medicine.State in dsEditModes) ) then
         if ( FAddedMedicine ) and ( iMedicineFound = 0 ) then
            WinData.Medicine.Insert
         else
            WinData.Medicine.Edit;
      WinData.Medicine.FieldByName('Name').AsString := Item.DrugName;
      bDuplicateUpdated := DuplicateVPAUpdated(Item.VPANumber);
      WinData.Medicine.FieldByName('VPANo').AsString := Item.VPANumber;

      //   21/08/17 [V5.7 R2.0] /MK Change - When adding the VPA Number to the drug from uDrugFinder then add the medicine group and dose/purchase unit as well.
      WinData.Medicine.FieldByName('MediGroup').AsInteger := Item.MedicineGroup;
      WinData.Medicine.FieldByName('DoseUnit').AsInteger := Item.UnitUsed;
      WinData.Medicine.FieldByName('PurchUnit').AsInteger := Item.UnitUsed;

      if bWithdrawalConfirmed then
         begin
            WinData.Medicine.FieldByName('OldMeatWithdrawal').AsInteger := WinData.Medicine.FieldByName('Withdrawal').AsInteger;
            WinData.Medicine.FieldByName('OldMilkWithdrawal').AsInteger := WinData.Medicine.FieldByName('MilkWithdrawal').AsInteger;

            if ( Item.MeatWDDays > 0 ) or ( Item.MilkWDDays > 0 ) then
               begin
                  if ( Item.MeatWDDays > 0 ) then
                     begin
                        WinData.Medicine.FieldByName('Withdrawal').AsInteger := Item.MeatWDDays;
                        WinData.Medicine.FieldByName('MeatWithdBroughtDown').AsInteger := Item.MeatWDDays;
                     end;
                  if ( Item.MilkWDDays > 0 ) then
                     begin
                        WinData.Medicine.FieldByName('MilkWithDrawal').AsInteger := Item.MilkWDDays;
                        WinData.Medicine.FieldByName('MilkWithdBroughtDown').AsInteger := Item.MilkWDDays;
                     end;
               end
            else
              begin
                 WinData.Medicine.FieldByName('MilkN_A_Drug').AsBoolean := ( FHerdType = htDairy );
                 WinData.Medicine.FieldByName('MeatN_A_Drug').AsBoolean := ( FHerdType <> htDairy );
                 WinData.Medicine.FieldByName('MeatWithdBroughtDown').AsInteger := 0;
                 WinData.Medicine.FieldByName('MilkWithdBroughtDown').AsInteger := 0;
              end;

            WinData.Medicine.FieldByName('DrugFindWithdAccepted').AsBoolean := True;
            WinData.Medicine.FieldByName('DrugFindWithdAcceptDate').AsDateTime := Now;
         end;

      if bDuplicateUpdated then
         WinData.Medicine.Post;
   except
      WinData.Medicine.Cancel;
   end;
end;

procedure TfMedicineSetUp.actRemoveAllMedicinesNotUsedExecute(Sender: TObject);
var
   sMessage : String;
begin
   if ( WinData.MedicineIDsNotUsedCount = WinData.Medicine.RecordCount ) then
      sMessage := 'There are NO medicines treated or purchased in Kingswood.'+cCRLF+
                  'Do you want to delete all medicines in Kingswood?'
   else
      sMessage := Format('You are about to delete %d medicine(s) that were never used.'+cCRLF+
                         'Do you want to continue?',[WinData.MedicineIDsNotUsedCount]);

   if ( MessageDlg(sMessage,mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
      begin
         HerdPassword.CreateAndShow(paDeleteAllMedicinesNeverUsed);
         RefreshGrid;
      end;
end;

procedure TfMedicineSetUp.EditNameEnter(Sender: TObject);
begin
   if ( WinData.Medicine.State = dsInsert ) and ( Length(EditName.Text) = 0 ) then
      actSearchForVPA.Execute;
end;

procedure TfMedicineSetUp.DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
begin
   if ( Button = kwnbInsert ) then
      EditName.SetFocus
   else if ( Button = kwnbCancel ) then
      Grid.SetFocus;
   if ( WinData.Medicine.State = dsBrowse ) then
      RefreshGrid;
end;

procedure TfMedicineSetUp.pmPrintMedicineListPopup(Sender: TObject);
begin
   if ( WinData.Medicine.State in dsEditModes ) then
      WinData.Medicine.Cancel;
end;

procedure TfMedicineSetUp.actRemoveDuplicateMedicinesExecute(Sender: TObject);
begin
   if ( MessageDlg('You are about to run a fix that will remove duplicate medicines.'+cCRLF+
                   'This fix will remove medicines that have a duplicte name or VPA Number.'+cCRLF+
                   'After this fix has ran you should check and adjust your quantity in stock figures manually.'+cCRLF+
                   'Do you wish to continue?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
      begin
         HerdPassword.CreateAndShow(paFixDuplicateMedicines);
         RefreshGrid;
      end;
end;

procedure TfMedicineSetUp.CheckForUtilityDropDown;
begin
   Grid.PopupMenu := nil;
   pmiRemoveAllMedicinesNotUsed.Visible := ( (WinData.MedicineIDsNotUsedCount > 0) or (WinData.MedicineIDsNotUsedCount = WinData.Medicine.RecordCount) );
   pmiRemoveDuplicateDrugs.Visible := ( (Length(DuplicateVPAMedicineIDCount) > 0) or (Length(DuplicateNameMedicineIDCount) > 0) );
   if ( pmiRemoveAllMedicinesNotUsed.Visible ) or ( pmiRemoveDuplicateDrugs.Visible ) then
      Grid.PopupMenu := pmMedicineGridUtility;
end;

procedure TfMedicineSetup.RefreshGrid;
var
   bk : TBookmark;
begin
   bk := WinData.Medicine.GetBookmark;
   MedicineGridDBTableView.DataController.BeginFullUpdate;
   MedicineGridDBTableView.DataController.DataSource.DataSet.Close;
   MedicineGridDBTableView.DataController.DataSource.DataSet.Open;
   MedicineGridDBTableView.DataController.EndFullUpdate;
   if ( MedicineGridDBTableView.DataController.DataSource.DataSet.RecordCount > 0 ) then
      StatusBar.Panels[0].Text := 'Records : '+IntToStr(MedicineGridDBTableView.DataController.DataSource.DataSet.RecordCount);
   CheckForUtilityDropDown;
   WinData.Medicine.GotoBookmark(bk);
   WinData.Medicine.FreeBookmark(bk);
end;

function TfMedicineSetup.DuplicateVPAUpdated (AVPANo : String) : Boolean;
var
   iaDuplicateVPA : PIntegerArray;
   i, iSelectedMedicine : Integer;
begin
   Result := False;
   if ( Length(AVPANo) = 0 ) then Exit;
   iSelectedMedicine := WinData.Medicine.FieldByName('ID').AsInteger;
   if ( iSelectedMedicine = 0 ) then Exit;
   if ( HerdLookup.DuplicateVPAFound(AVPANo,iSelectedMedicine) ) then
      begin
         if ( MessageDlg(Format('This VPA number, %s, already exists in your database.'+cCRLF+
                                'Do you want to merge these records now?'+cCRLFx2+
                                'NOTE : After the merge you should check and adjust your quantity in stock figures manually.',
                                [AVPANo]),mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            begin
               iaDuplicateVPA := GetSingleVPADuplicateArray(AVPANo,iSelectedMedicine);
               for i := 0 to Length(iaDuplicateVPA)-1 do
                  Result := ( FixDuplicateDrugs(iSelectedMedicine,iaDuplicateVPA[i]) );
            end
         else
            SysUtils.Abort;
      end;
end;

procedure TfMedicineSetUp.dbteVPANoExit(Sender: TObject);
begin
   if ( Length(dbteVPANo.Text) = 0 ) then Exit;
   DuplicateVPAUpdated(dbteVPANo.Text);
   if ( WinData.Medicine.State in dsEditModes ) then
      WinData.Medicine.Post;
end;

procedure TfMedicineSetup.ShowHideDisposeMedicineBtn;
begin
   HerdLookup.qBatchNosWithQtyRem.Close;
   HerdLookup.qBatchNosWithQtyRem.Params[0].AsInteger := WinData.Medicine.FieldByName('ID').AsInteger;
   HerdLookup.qBatchNosWithQtyRem.Open;
   btnDisposeMedicine.Visible := ( (WinData.Medicine.State in [dsEdit, dsBrowse]) and
                                   (WinData.Medicine.FieldByName('InUse').AsBoolean) and
                                   (WinData.Medicine.FieldByName('StockLevel').AsFloat > 0) and
                                   (HerdLookup.qBatchNosWithQtyRem.RecordCount > 0) );
end;

procedure TfMedicineSetUp.btnDisposeMedicineClick(Sender: TObject);
var
   MediBookMark : TBookMark;
begin
   MediBookMark := MedicineGridDBTableView.DataController.DataSource.DataSet.GetBookmark;
   HerdLookup.qBatchNosWithQtyRem.Close;
   HerdLookup.qBatchNosWithQtyRem.Params[0].AsInteger := WinData.Medicine.FieldByName('ID').AsInteger;
   HerdLookup.qBatchNosWithQtyRem.Open;
   if ( HerdLookup.qBatchNosWithQtyRem.RecordCount > 0 ) then
      TfMediPurch.Execute(False,WinData.Medicine.FieldByName('ID').AsInteger,True,HerdLookup.qBatchNosWithQtyRem.FieldByName('ID').AsInteger)
   else
      begin
         MessageDlg('No purchases found with a quantity remaining for this medicine.'+cCRLF+
                    'To dispose of medicine, change Quantity in Stock to zero.',mtInformation,[mbOK],0);
         Exit;
      end;
   {
   TfmMediDiposal.ShowTheForm(WinData.Medicine.FieldByName('ID').AsInteger,
                              0,
                              WinData.Medicine.FieldByName('StockLevel').AsFloat);
   }

   WinData.Medicine.Close;
   WinData.Medicine.Open;

   if ( MedicineGridDBTableView.DataController.DataSource.DataSet.BookmarkValid(MediBookMark) ) then
      begin
         MedicineGridDBTableView.DataController.DataSource.DataSet.GotoBookmark(MediBookMark);
         MedicineGridDBTableView.DataController.DataSource.DataSet.FreeBookmark(MediBookMark);
      end;
end;

end.
