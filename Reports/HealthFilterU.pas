{*

  ----------------------------------------------------------------------------
  ****************************************************************************
  ----------------------------------------------------------------------------
  SP 15/11/2002:-

  New to reports:
     MilkWD = Milk Withdrawal Date,
     OtherWD = Other Withdrawal Date,
     Existing Withdrawal Date in Database is to be taken
     as the Meat WithDrawal.

     withdrawal dates in Med. Treatments Report and Vet. Purchases Report.

  SP 15/11/2002.
  ----------------------------------------------------------------------------
  ****************************************************************************
  ----------------------------------------------------------------------------
  SP 19/11/2002:-

  New routine to locate Batch Number and Expiry Date of Drug Used.
  These fields are located by using the DrugPurchID. DrugPurchID is
  set in the Health event when user selects the Batch Number.

  SP 19/11/2002.
  ----------------------------------------------------------------------------
  ****************************************************************************
  ----------------------------------------------------------------------------
  NN / SP 21/11/2002:-

  New Variable : WhichReg : TCountry
  Indicates what Country the Herd is registered in.

  New Procedure PrintReport(WhatScreen : TQuickRep; Sender: TObject);

  WhatSc
  reen can be either Rep. of Ire. or N. Ire. version of the
  Veterinary Treatment Report.

  NN / SP 21/11/2002.
  ----------------------------------------------------------------------------
  ****************************************************************************
  ----------------------------------------------------------------------------

  SP 29/04/2003:-

  Include NoDays and NoTimes for Health Treatmeant Report.

  Calc Drug Cost based NoTimes x NoDays x DrugCost.

  SP 29/04/2003:-

  ----------------------------------------------------------------------------
  ****************************************************************************
  ----------------------------------------------------------------------------
  SP 08/07/2003:- V3.6 R6.7

  Add new Filters to Screen.

  Health code, using ICBF or Farm codes.
  Also Filter by Lact No.

  SP 08/07/2003:- V3.6 R6.7

  ----------------------------------------------------------------------------
  ****************************************************************************
  ----------------------------------------------------------------------------

  10/11/10 [V4.0 R5.6] /MK Change - Removed Saving and Loading of Lactation Range.

  11/05/11 [V4.1 R1.1] /MK Additional Feature - Added New Radio Group For Health, DryOff Or Both Events.

  26/01/12 [V5.0 R3.6] /MK Bug Fix - Only SaveScreenDefaults & LoadScreenDefaults If Veterinary Register.

  10/02/12 [V5.0 R3.7] /MK Additional Feature - Set BatchNo To New BatchNo Field From Health.db.

  02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

  01/06/12 [V5.0 R6.0] /MK Bug Fix - If UK Country And VetTreatments.ReportOn = 0 Then VetTreatmentsDefs.ReportOn := 2.

  17/09/12 [V5.0 R9.9] /MK Change - ViewBtnClick - Check for HerdVaccination event when checking for Health.

  11/01/13 [V5.1 R3.8] /MK Additional Feature - Added PrescribedBy fields.

  16/08/13 [V5.2 R0.0] /MK Change - New ShowTheForm procedure added. Used in uBordBiaPrint.
                                  - New TPurchType added to differ between to purchase reports. Used in uBordBiaPrint.
                                  - New SetupForm procedure added to store all changes to form size and other details.

  20/08/13 [V5.2 R0.0] /MK Change - Added cbIndividualReport to allow for report to show all animals dosed with the same drug on the same date
                                    to be combined into one line or an Individual Treatment report.

  22/08/13 [V5.2 R0.2] /MK Bug Fix - Moved check for FPurchType to after SetupForm.

  17/09/13 [V5.2 R1.4] /MK Additional Feature - sbView.Click - Show animals that were dosed with an antibiotic drug as separate animals
                                                               on the Block (non-individual treatment report).
                                              - Added Apply Animal Grid Filter CheckBox to view only animals in filter on report.
                                              - Only show Apply Animal Grid Filter for Veterinary Register.

   18/09/13 [V5.2 R1.4] /MK Additional Feature - PrintAdminBy_PrescrBy_Code_Name -
                                                 Added Prescribed By and Admin By Code and Name to bottom of report.

   19/09/13 [V5.2 R1.4] /MK Change - Default EventDate filter on for BordBia.

   30/09/13 [V5.2 R3.0] /MK Bug Fix - TotDrugCost calculatation differed to WinData.CalcCostAndQtyUsed calculatation used in single/block health event.
                            Additional Feature - Calculate total drug cost if EventCount > 1.

   16/10/13 [V5.2 R3.5] /MK Bug Fix - ViewBtnClick - No need to check for HerdID if viewing purchase reports.

   16/10/13 [V5.2 R3.6] /MK Bug Fix - PDateFrom and PDateTo was not allowing blank dates - changed to cxDate.

   17/10/13 [V5.2 R3.7] /MK Bug Fix - tmpReportTable error if trying to view the report after no records found on first run.
                            Additional Feature - Added DateFrom and DateTo to Irish Vet Register and Irish Vet Purchase Report.

   18/10/13 [V5.2 R3.7] /MK Bug Fix - HFromDate and HToDate was not allowing blank dates - changed to cxDate.

   22/10/13 [V5.2 R3.8] /MK Bug Fix - Added routine to go through single animal records and add correct animal no/natidnum.
                                      Was adding same animal no/natidnum for each singe animal record found of drug.

   31/10/13 [V5.2 R5.0] /MK Change - Removed Withdrawal information in ReportTable GroupBy query as there is no need because DrugID
                                     carries this information. Also removed from GetAnimalRecordDetails routine - tested on L.Clerkin and L.Murphy Data.

   18/11/13 [V5.2 R5.6] /MK Bug Fix - PrintNIVetPurchases - Date labels only apply to Irish Report - Access Violation on NI Report.

   06/01/14 [V5.2 R6.3] /MK Bug Fix - Withdrawal information left out of group report by mistake.

   05/03/14 [V5.2 R8.8] /MK Bug Fix - ShowTheForm - PurchType was part of WinData.FBordBiaBlockPrint but it should be separate from this.

   13/05/14 [V5.3 R0.2] /MK Bug Fix - Program was going through table finding first antibiotic drug
                                      adding individual records for this drug but when it tried to move
                                      to the next record in the ReportTable it was already at the end of
                                      of the table because of the insert of new records.
                                      Logic changed to that of uAnimalRemedy query to group all treatments
                                      that are not antibiotic drugs and insert them into the ReportTable.
                                      Then insert individual animals for antibiotic drugs without grouping.

   15/05/14 [V5.3 R0.3] /MK Additional Feature - Added Milk and Meat N/A booleans to report tables.

   17/07/14 [V5.3 R3.1] /MK Additional Feature - Added new temp table for health events from the event table to make the report quicker.

   07/10/14 [V5.3 R7.4] /MK Change - Highlight cbIndividualReport in bold and red and increase font size - Agent Meeting/GL Request.

   20/01/15 [V5.4 R0.7] /MK Bug Fix - sbViewClick - If user entered in BatchNo manually but BatchNo was purchased in the database already
                                                    search for this BatchNo and allocate the ExpiryDate for this BatchNo.

   20/01/15 [V5.4 R0.8] /MK Bug Fix - sbViewClick - If user deletes a DrugPurchID from the MediPur table the deleted ID still exists in the
                                                    health table. If the user then enters in a new record for this batchno in the MediPur table
                                                    the program should be able to allocate this new purchase to the existing batchno in the Health table.

   22/01/15 [V5.4 R1.0] /MK Bug Fix - sbViewClick - Make sure that ExpiryDate is not Null. Null ExpiryDate caused "Invalid Variant Type" error.

   30/04/15 [V5.4 R5.3] /MK Additional Feature - sbViewClick - Show warning screen before VetRegister is printed for Irish herds if drugs that were treated do no have type specified.

   14/08/15 [V5.4 R7.4] /MK Additional Feature - Added Filters for Medicine and Admin By - John Buckley/Imy Breen/Mary Whyte request.

   27/08/15 [V5.4 R7.4] /MK Change - DrawHealthList - Only show health and farm codes within the date range selected like medicine and admin code are.

   15/02/16 [V5.5 R3.8] /MK Additional Feature - If Crush User (IAD) then switch the EventComment to PenFrom i.e. name of batch group used in Health event.

   18/02/16 [V5.5 R3.9] /MK Bug Fix - SQL for Country <> Ireland or Individual Treatment Report has a type of a field name "ul' - Tilly Dale Farming reported.

   29/09/17 [V5.7 R3.4] /MK Bug Fix - LoadScreenDefaults - If, after hFromDate.Date is assigned from default, the date is less than zero then set hFromDate to blank.
                            Additional Feature - Added progress bar to veterinary register report.
                                               - Set cursor to crHourGlass at start and crDefault before preview/print of report.

   03/10/17 [V5.7 R3.5] /MK Change - ShowTheForm - Disable change to Group Treatments from Individual Treatments if Filter is applied - SP request.
                                   - Don't change caption of favourites button just tick it and change the colour to blue like Apply Filter check box - SP request.

   03/07/18 [V5.8 R0.6] /MK Change - Only Load/StoreScreenDefaults if country is not Ireland - GL/SP/Jim Tobin
                                     If Ireland then default From Date of 1 year ago, set Report On to both and set filter to No Filter - GL/SP/Jim Tobin

   25/07/18 [V5.8 R1.3] /MK Bug Fix - ViewBtnClick - Vet Purchases - Removed Distinct from SQL as it was causing identitical batch numbers bought
                                                                     on the same day with identical cost and quantity to appear once on the report - TOK/GL.

   08/10/18 [V5.8 R3.0] /MK Change - If Dealer user then don't show feed purchase report option and change caption of report accordingly.

   28/03/19 [V5.8 R8.4] /MK Change - SetupForm - Change the "Farm Code" item to "Reason" for non-irish herds.

   19/06/19 [V5.8 R9.4] /MK Additional Feature - Show new mastitis and lameness events in the treatment report.
                                               - Changed Treatment Type radio group to drop-down-list to select between the 5 different types.   

   08/07/21 [V6.0 R1.6] /MK Change - ViewBtnClick - I created a query like WinData.qDrugBatchNo that looks for all purchased drugs with batch numbers.
                                                  - Changed all references of WinData.qDrugBatchNo to new query.
                                                  - If the program can only find the BatchNumber in qDrugBatchNo then get the Supplier name from there also - Chris Throne.
}

unit HealthFilterU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXSpin, Mask, ToolEdit, Buttons, DBTables, Grids,
  DBGrids, RXDBCtrl, RXLookup, RXCtrls, ComCtrls, ToolWin, Db, GenTypesConst,
  Quickrpt, CheckLst, ImgList, ReportDefaults, cxControls, cxContainer,
  cxEdit, cxGroupBox, cxRadioGroup, cxCheckBox, DateUtil, QRCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, KDBRoutines,
  uAnimalRemedyData, KRoutines, cxButtons, cxLabel,
  uMedNullGroupVetRegWarning, Groups, Def, cxProgressBar;

type

  THealthCodes = class
    public
    FID : Integer;
    constructor Create(ID : Integer);
    destructor Destroy; override;
  end;

  type
     TAnimalRecord = Record
     AnimalNo,
     NatIDNum,
     SortAnimalNo,
     SortNatID : String;
  end;

  TFilterType = (ftHealthCode, ftMedicine, ftAdminBy);
  TPurchType = (ptFeed, ptVeterinary);
  TReportType = (rtMediFeedPurch, rtMediTreat);
  THeatlthFilter = class(TForm)
    pMedicalHealth: TPanel;
    CalfLabel: TLabel;
    LactLabel: TLabel;
    MonthToLabel: TLabel;
    CalfToLabel: TLabel;
    FromMed: TRxSpinEdit;
    FromAdmin: TRxSpinEdit;
    ToMed: TRxSpinEdit;
    ToAdmin: TRxSpinEdit;
    BatchMove: TBatchMove;
    pMedPurch: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    pHerdID: TPanel;
    Label10: TLabel;
    HerdCombo: TRxDBLookupCombo;
    TempQuery: TQuery;
    rgReportType: TRadioGroup;
    OrderRadio: TRadioGroup;
    SortByRadio: TRadioGroup;
    qMedPurch: TQuery;
    qMed: TQuery;
    Label4: TLabel;
    Label5: TLabel;
    rgInclude: TRadioGroup;
    clHealthList: TCheckListBox;
    sbClear: TButton;
    Bevel1: TBevel;
    rgHealthCodes: TRadioGroup;
    gbLactFilter: TGroupBox;
    FromLact: TRxSpinEdit;
    ToLact: TRxSpinEdit;
    Label3: TLabel;
    Label6: TLabel;
    cbFavourite: TcxCheckBox;
    cbApplyAnimalGridFilter: TcxCheckBox;
    PDateFrom: TcxDateEdit;
    PDateTo: TcxDateEdit;
    HFromDate: TcxDateEdit;
    HToDate: TcxDateEdit;
    pbVetRegisterData: TcxProgressBar;
    rgIndividGroupTreats: TcxRadioGroup;
    gbReportOn: TcxGroupBox;
    cmboTreatmentTypes: TcxComboBox;
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure rgReportTypeClick(Sender: TObject);
    procedure HerdComboChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgHealthCodesClick(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure HToDatePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    WhichReg : TCountry;
    HealthList : TQuery;
    SlHealthList : TStringList;
    VetTreatmentsDefs : TVetTreatmentsDefaults;
    FFromBordBia : Boolean;
    FPurchType : TPurchType;
    FAnimalRemedyData : TAnimalRemedyData;
    procedure DrawHealthList(ICBF : Boolean);
    procedure PrintVetTreatReport(WhatScreen : TQuickRep; Sender: TObject);
    procedure PrintMedPurchReport(Sender: TObject);
    procedure CreateTempTable;
    procedure SelectAllCodes;
    procedure DeSelectAllCodes;
    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
    procedure SetupForm;
    procedure DrawMedicineList;
    procedure CreateFilterString(out AFilter : String; AFilterType : TFilterType);
    procedure DrawAdminCodeFilters;
  public
    class procedure ShowTheForm(AReportType : TReportType;
       APurchType : TPurchType; const AFromBordBia : Boolean = False);
     { Public declarations }
  end;

var
   HeatlthFilter: THeatlthFilter;
   ReportType : TReportType;

const
   cICBFCodeFilter = 0;
   cFarmCodeFilter = 1;
   cMedicineFilter = 2;
   cAdminByFilter = 3;
   cNoFilter = 4;

implementation
uses
    DairyData,
    FeedPurchaseRep,
    MedicalPurchases,
    MedicalTreatments,
    uNIVetTreatments,
    uNIMedicinePurchase,
    Printers, uHerdLookup;

{$R *.DFM}

class procedure THeatlthFilter.ShowTheForm(AReportType : TReportType;
   APurchType : TPurchType; const AFromBordBia : Boolean = False);
begin
   HeatlthFilter := THeatlthFilter.Create(nil);
   with HeatlthFilter do
      try
         HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
         ReportType := AReportType;

         cbApplyAnimalGridFilter.Visible := ( (ReportType = rtMediTreat) and (WinData.ActiveFilter) );

         FFromBordBia := AFromBordBia;
         FPurchType := APurchType;

         if ( ReportType = rtMediFeedPurch ) then
            begin
               pMedPurch.Visible := True;
               pMedicalHealth.Visible := False;
               pDateFrom.Date := IncYear(Now,-1);
               pDateTo.Date := Now;
            end
         else if ( ReportType = rtMediTreat ) then
            begin
               pMedPurch.Visible := False;
               pMedicalHealth.Visible := True;
               hFromDate.Date := IncYear(Now,-1);
               hToDate.Date := Now;
               if ( FFromBordBia ) and ( WhichReg = Ireland ) then
                  begin
                     rgHealthCodes.ItemIndex := cNoFilter;
                     FromLact.Value := 0;
                     ToLact.Value := 30;
                     cmboTreatmentTypes.ItemIndex := 0;
                  end;
            end;

         cbApplyAnimalGridFilter.Checked := WinData.ActiveFilter;
         if ( cbApplyAnimalGridFilter.Checked ) then
            cbApplyAnimalGridFilter.Style.Font.Color := clBlue;

         //   03/10/17 [V5.7 R3.5] /MK Change - Disable change to Group Treatments from Individual Treatments if Filter is applied - SP request.
         if ( rgIndividGroupTreats.Visible ) then
            rgIndividGroupTreats.Enabled := ( not(cbApplyAnimalGridFilter.Checked) );

         //   05/03/14 [V5.2 R8.8] /MK Bug Fix - PurchType was part of WinData.FBordBiaBlockPrint but it should be separate from this.
         if ( FPurchType = ptVeterinary ) then
            rgReportType.ItemIndex := 0
         else if ( FPurchType = ptFeed ) then
            rgReportType.ItemIndex := 1;

         rgReportType.Items[1] := 'Feed Purchases Report';
         rgReportType.Enabled := True;
         Caption := 'Veterinary/Feed Purchases Report';
         if ( WinData.ShowDealerControls ) then
            begin
               rgReportType.Items[1] := ' ';
               rgReportType.Enabled := False;
               Caption := 'Veterinary Purchases Report';
            end;

         if ( WinData.FBordBiaBlockPrint ) then
            sbView.Click
         else
            ShowModal;
      finally
         Free;
      end;
end;

procedure THeatlthFilter.FormCreate(Sender: TObject);
begin
   Height := 532;
   pbVetRegisterData.Visible := False;
   Application.ProcessMessages;
   Update;

   WinData.CanShowStandardReportHint := True;

   HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
   // Find out what country is currently
   WhichReg := WinData.DefCountry(WinData.UserDefaultHerdID); { NN / SP 21/11/2002:- }

   rgInclude.Visible := False;
end;

procedure THeatlthFilter.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;
end;

procedure THeatlthFilter.FormShow(Sender: TObject);
begin
   SetupForm;
   if ( pMedicalHealth.Visible ) then
      begin
         pHerdID.Show;
         hToDate.Date := Date;
         hFromDate.Date := IncMonth(Date, -12);
         HFromDate.Properties.OnEditValueChanged := HToDatePropertiesEditValueChanged;
         HToDate.Properties.OnEditValueChanged := HToDatePropertiesEditValueChanged;
         SortByRadio.Visible := True;
         OrderRadio.Visible := True;
         OrderRadio.ItemIndex := 0;
         SortByRadio.ItemIndex := 0;
         //   26/01/12 [V5.0 R3.6] /MK Bug Fix - Only LoadScreenDefaults If Veterinary Register.
         //   03/07/18 [V5.8 R0.6] /MK Change - Only LoadScreenDefaults if country is not Ireland, if Ireland then
         //                                     default From Date of 1 year ago, set Report On to both and set filter to No Filter.
         if ( WhichReg <> Ireland ) then
            LoadScreenDefaults;
         if ( WhichReg = Ireland ) then
            begin
               rgHealthCodes.ItemIndex := cNoFilter;
               FromLact.Value := 0;
               ToLact.Value := 30;
               cmboTreatmentTypes.ItemIndex := 0;
               //   19/09/13 [V5.2 R1.4] /MK Change - Default EventDate filter on for BordBia.
               SortByRadio.ItemIndex := 2;
            end;
         rgIndividGroupTreats.ItemIndex := 0;
      end
   else
      begin
         //   22/08/13 [V5.2 R0.2] /MK Bug Fix - Moved check for FPurchType to after SetupForm.
         if ( FFromBordBia ) then
            begin
               if ( FPurchType = ptVeterinary ) then
                  begin
                     rgReportType.ItemIndex := 0;
                     Caption := 'Veterinary Purchase Report';
                  end
               else if ( FPurchType = ptFeed ) then
                  begin
                     rgReportType.ItemIndex := 1;
                     Caption := 'Feed Purchase Report'
                  end;
               rgReportType.Visible := False;
            end;
         //else
            //rgReportType.ItemIndex := 0;
         pHerdID.Hide;
         pDateTo.Date := Date;
         pDateFrom.Date := IncMonth(Date, -12);
         rgReportTypeClick(Sender);
      end;
end;

procedure THeatlthFilter.SetupForm;
begin
   if ( ReportType = rtMediFeedPurch ) then
      begin
         Height := 417;
         pMedicalHealth.Visible := False;

         rgReportType.Visible := True;
         pMedPurch.Visible := True;

         SortByRadio.Parent := pMedPurch;
         OrderRadio.Parent := pMedPurch;
         SortByRadio.Visible := False;
         OrderRadio.Visible := False;

         SortByRadio.Items.Clear;
         SortByRadio.Items.Add('&Purchase Date');
         SortByRadio.Items.Add('&Invoice/Batch No.');
         SortByRadio.Items.Add('&Feed Category');
         SortByRadio.Items.Add('Feed &Supplier');

         SortByRadio.ItemIndex := 0;
         OrderRadio.ItemIndex := 0;

         //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
         cbFavourite.Checked := WinData.IsReportFavourite(cVetFeedPurchRep);
         WinData.UpdateRecentReportUsage(cVetFeedPurchRep);
      end
   else
      begin
         Caption := 'Veterinary Treatments Register';
         SlHealthList := TStringList.Create;

         HealthList := TQuery.Create(nil);
         HealthList.DataBaseName := WinData.KingData.DatabaseName;

         pMedicalHealth.Top := 80;
         pMedicalHealth.Visible := True;

         rgIndividGroupTreats.Visible := ( WhichReg = Ireland );
         if ( rgIndividGroupTreats.Visible ) then
            begin
               Height := 466;
               pMedicalHealth.Height := 346;
               rgHealthCodes.Top := 138;
               clHealthList.Top := 234;
               sbClear.Top := 205;
               gbLactFilter.Top := 138;
               SortByRadio.Top := 196;
               OrderRadio.Top := 290;
            end
         else
            begin
               Height := 430;
               pMedicalHealth.Height := 304;
               rgHealthCodes.Top := 96;
               clHealthList.Top := 190;
               sbClear.Top := 163;
               gbLactFilter.Top := 96;
               SortByRadio.Top := 154;
               OrderRadio.Top := 248;
            end;

         pMedPurch.Visible := False;
         rgReportType.Visible := False;

         SortByRadio.Parent := pMedicalHealth;
         OrderRadio.Parent  := pMedicalHealth;

         SortByRadio.Visible := True;
         OrderRadio.Visible := True;

         cmboTreatmentTypes.ItemIndex := 0;

         SortByRadio.Items.Clear;
         SortByRadio.Items.Add('&National ID');
         SortByRadio.Items.Add('&Animal Code');
         SortByRadio.Items.Add('&Event Date');
         SortByRadio.Items.Add('Me&dicine');
         SortByRadio.Items.Add('Ad&ministrator');

         SortByRadio.ItemIndex := 0;
         OrderRadio.ItemIndex := 0;

         rgHealthCodes.ItemIndex := cNoFilter;
         if WhichReg <> Ireland then
            begin
               (rgHealthCodes.Controls[0] as TRadioButton).Enabled := False;
               //   28/03/19 [V5.8 R8.3] /MK Change - Change the "Farm Code" item to "Reason" for non-irish herds.
               (rgHealthCodes.Controls[1] as TRadioButton).Caption := 'Reason';
            end;

         rgHealthCodesClick(nil);

         //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
         cbFavourite.Checked := WinData.IsReportFavourite(cVetRegisterRep);
         WinData.UpdateRecentReportUsage(cVetRegisterRep);
      end;
end;

procedure THeatlthFilter.CreateTempTable;
begin
   try
      with WinData.TempTable do
         begin
            Close;
            TableType := ttParadox;
            TableName := 'TempHealth';
            DataBaseName := WinData.Health.DatabaseName;
            with FieldDefs do
               begin
                  Clear;
                  Add('AID',ftInteger);
                  Add('RateApplic',ftfloat);
                  Add('EventDate',ftDate);
                  Add('EventDesc',ftString,40);
                  Add('DrugID',ftInteger);
                  Add('DrugName',ftString,40);
                  Add('MediGroupID',ftInteger);
                  Add('SortAnimalNo',ftString,10);
                  Add('SortNatID',ftString,20);
                  Add('AnimalNo',ftString,10);
                  Add('NatIDNum',ftString,20);
                  Add('WithDrawalDate',ftDate,);
                  Add('TotDrugCost',ftfloat,);
                  Add('AdMinByID',ftInteger);
                  Add('ApplicMethod',ftInteger);
                  Add('AdMinBy',ftString,40);
                  Add('MilkN_A_Drug',ftBoolean);
                  Add('MeatN_A_Drug',ftBoolean);

                  //   11/01/13 [V5.1 R3.8] /MK Additional Feature - Added PrescribedBy fields.
                  Add('PrescribedByID',ftInteger);
                  Add('PrescribedBy',ftString,40);

                  Add('MilkWD',ftDate);
                  Add('OtherWD',ftDate);
                  Add('OrganicMeatWD',ftDate);
                  Add('OrganicMilkWD',ftDate);
                  Add('OrganicOtherWD',ftDate);
                  Add('DrugPurchID',ftInteger);
                  Add('BatchNo',ftString,30);
                  Add('ExpiryDate',ftDate);
                  Add('DoseUnitUsed',ftfloat);
                  Add('MeatDays',ftFloat); // This is actually a number field in "Health.db"
                  Add('MilkDays',ftInteger);
                  Add('OtherDays',ftInteger);
                  Add('OrganicMeatDays',ftInteger); // This is actually a number field in "Health.db"
                  Add('OrganicMilkDays',ftInteger);
                  Add('OrganicOtherDays',ftInteger);

                  { NN / SP 21/11/2002:- }
                  Add('MedPurchSupplier',ftString,30);
                  Add('NoDays',ftInteger);
                  Add('NoTimes',ftInteger);
                  Add('EndDate',ftDate);
                  Add('ReportID',ftInteger);
                  Add('DoseUnit',ftString,6);
                  Add('FarmCode',ftInteger);
                  Add('FarmCodeDesc',ftString,30);

                  Add('HealthEventID',ftInteger);

                  Add('PenFrom',ftString,30);
               end;

               IndexDefs.Clear;
               CreateTable;
               Open;
            end;
     except
        Messagedlg('Cannot Create Table',mtInformation,[mbOK],0);
     end;
end;

procedure THeatlthFilter.ViewBtnClick(Sender: TObject);
var
   FilterItems : String;
   i : Integer;
   ReportTable : TTable;
   Value : Variant;
   AnimalRecord : TAnimalRecord;
   ReportTableID : Integer;
   TempHealthEvents : TTable;
   GroupDetailsArray : TVarArray;
   iaAnimalGroupArray : PIntegerArray;
   sMsgText : String;
   qDrugBatchNo : TQuery;

const
   cGroup_NonAnitibioic_TreatsSQL = 'SELECT COUNT(HealthEventID) EventCount ,EventDate, DrugID, DrugName, RateApplic, '+cCRLF+
                                    '       ApplicMethod, AdminByID, AdminBy, DoseUnit, '+cCRLF+
                                    '       MilkDays, MeatDays, OrganicMeatDays, OrganicMilkDays, OrganicOtherDays, '+cCRLF+
                                    '       WithdrawalDate, MilkWD, OrganicMeatWD, OrganicMilkWD, OrganicOtherWD, '+cCRLF+
                                    '       BatchNo, NoTimes, NoDays, ExpiryDate, G.Description, FarmCodeDesc, PrescribedByID, PrescribedBy, '+cCRLF+
                                    '       EventDesc, TotDrugCost, '+cCRLF+
                                    '       MilkN_A_Drug, MeatN_A_Drug, '+cCRLF+
                                    '       PenFrom '+cCRLF+
                                    'FROM TempHealth '+cCRLF+
                                    'LEFT JOIN GenLook G ON (G.ID=ReportID) '+cCRLF+
                                    'WHERE MediGroupID <> :AntibioticTypeID '+cCRLF+
                                    'GROUP BY EventDate, DrugID, DrugName, RateApplic, '+cCRLF+
                                    '         ApplicMethod, AdminByID, AdminBy, DoseUnit, '+cCRLF+
                                    '         MilkDays, MeatDays, OrganicMeatDays, OrganicMilkDays, OrganicOtherDays, '+cCRLF+
                                    '         WithdrawalDate, MilkWD, OrganicMeatWD, OrganicMilkWD, OrganicOtherWD, '+cCRLF+
                                    '         BatchNo, NoTimes, NoDays, ExpiryDate, G.Description, '+cCRLF+
                                    '         FarmCodeDesc, PrescribedByID, PrescribedBy, EventDesc, TotDrugCost, '+cCRLF+
                                    '         MilkN_A_Drug, MeatN_A_Drug, '+cCRLF+
                                    '         PenFrom';

   procedure PrintAdminBy_PrescrBy_Code_Name;
   var
      qAdminBy_PrescrBy : TQuery;
      sAdminByLabel,
      sPrescrByLabel : String;
      i : Integer;
   begin
      qAdminBy_PrescrBy := TQuery.Create(nil);
      with qAdminBy_PrescrBy do
         try
            MedicalTreatmentsScr.qrlAdminByCode_Name.Caption := '';
            MedicalTreatmentsScr.qrlPrescByCode_Name.Caption := '';

            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AdminCode, Name');
            SQL.Add('FROM MedAdmin');
            SQL.Add('WHERE ID IN (SELECT Distinct(AdminByID)');
            SQL.Add('             FROM '+WinData.TempTable.TableName+')');
            Open;
            try
               First;
               if ( RecordCount > 0 ) then
                  while ( not(Eof) ) do
                     begin
                        sAdminByLabel := sAdminByLabel+'    '+Fields[0].AsString+'    '+Fields[1].AsString+';';
                        Next;
                     end;
               if ( sAdminByLabel <> '' ) then
                  MedicalTreatmentsScr.qrlAdminByCode_Name.Caption := sAdminByLabel;

               SQL.Clear;
               SQL.Add('SELECT AdminCode, Name');
               SQL.Add('FROM MedAdmin');
               SQL.Add('WHERE ID IN (SELECT Distinct(PrescribedByID)');
               SQL.Add('             FROM '+WinData.TempTable.TableName+')');
               Open;
               First;
               if ( RecordCount > 0 ) then
                  while ( not(Eof) ) do
                     begin
                        sPrescrByLabel := sPrescrByLabel+'    '+Fields[0].AsString+'    '+Fields[1].AsString+';';
                        Next;
                     end;
               if ( sPrescrByLabel <> '' ) then
                  MedicalTreatmentsScr.qrlPrescByCode_Name.Caption := sPrescrByLabel;

            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

   procedure GetAnimalRecordDetails;
   var
      qSingleHealth : TQuery;
   begin
      AnimalRecord.AnimalNo := '';
      AnimalRecord.SortAnimalNo := '';
      AnimalRecord.NatIDNum := '';
      AnimalRecord.SortNatID := '';
      qSingleHealth := TQuery.Create(nil);
      with qSingleHealth do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AnimalNo, SortAnimalNo, NatIDNum, SortNatID');
            SQL.Add('FROM '+WinData.TempTable.TableName+'');
            SQL.Add('WHERE EventDate = '''+FormatDateTime(cUSDateStyle,ReportTable.FieldByName('EventDate').AsDateTime)+'''');
            SQL.Add('AND   DrugID = '+IntToStr(ReportTable.FieldByName('DrugID').AsInteger)+'');
            SQL.Add('AND   DrugName = "'+ReportTable.FieldByName('DrugName').AsString+'"');
            if ( ReportTable.FieldByName('RateApplic').AsFloat > 0 ) then
               SQL.Add('AND   RateApplic = '+FormatFloat('0.00',ReportTable.FieldByName('RateApplic').AsFloat)+'');
            if ( ReportTable.FieldByName('ApplicMethod').AsInteger > 0 ) then
               SQL.Add('AND   ApplicMethod = '+IntToStr(ReportTable.FieldByName('ApplicMethod').AsInteger)+'');
            if ( ReportTable.FieldByName('AdminByID').AsInteger > 0 ) then
               SQL.Add('AND   AdminByID = '+IntToStr(ReportTable.FieldByName('AdminByID').AsInteger)+'');
            SQL.Add('AND   AdminBy = "'+ReportTable.FieldByName('AdminBy').AsString+'"');
            SQL.Add('AND   DoseUnit = "'+ReportTable.FieldByName('DoseUnit').AsString+'"');
            SQL.Add('AND   BatchNo = "'+ReportTable.FieldByName('BatchNo').AsString+'"');
            if ( ReportTable.FieldByName('NoTimes').AsInteger > 0 ) then
               SQL.Add('AND   NoTimes = '+IntToStr(ReportTable.FieldByName('NoTimes').AsInteger)+'');
            if ( ReportTable.FieldByName('NoDays').AsInteger > 0 ) then
               SQL.Add('AND   NoDays = '+IntToStr(ReportTable.FieldByName('NoDays').AsInteger)+'');
            if ( ReportTable.FieldByName('ExpiryDate').AsDateTime > 0 ) then
               SQL.Add('AND   ExpiryDate = '''+FormatDateTime(cUSDateStyle,ReportTable.FieldByName('ExpiryDate').AsDateTime)+'''');
            SQL.Add('AND   FarmCodeDesc = "'+ReportTable.FieldByName('FarmCodeDesc').AsString+'"');
            if ( ReportTable.FieldByName('PrescribedByID').AsInteger > 0 ) then
               SQL.Add('AND   PrescribedByID = '+IntToStr(ReportTable.FieldByName('PrescribedByID').AsInteger)+'');
            SQL.Add('AND   PrescribedBy = "'+ReportTable.FieldByName('PrescribedBy').AsString+'"');
            SQL.Add('AND   EventDesc = "'+ReportTable.FieldByName('EventDesc').AsString+'"');
            Open;
            try
               First;
               if RecordCount > 0 then
                  begin
                     AnimalRecord.AnimalNo := Fields[0].AsString;
                     AnimalRecord.SortAnimalNo := Fields[1].AsString;
                     AnimalRecord.NatIDNum := Fields[2].AsString;
                     AnimalRecord.SortNatID := Fields[3].AsString;
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

   //   17/07/14 [V5.3 R3.1] /MK Additional Feature - Created TempTable of just health events within the designated date range.
   procedure CreateTempHealthEvents;
   var
      EventArray : TIntegerArray;
      qHealthEvents : TQuery;
   begin
      TempHealthEvents := TTable.Create(nil);
      TempHealthEvents.DatabaseName := AliasName;
      TempHealthEvents.TableName := 'tmpHealthEvents';
      TempHealthEvents.FieldDefs.Add('ID',ftInteger);
      TempHealthEvents.FieldDefs.Add('EventDate',ftDate);
      TempHealthEvents.FieldDefs.Add('EventDesc',ftString,30);
      TempHealthEvents.FieldDefs.Add('AnimalID',ftInteger);
      TempHealthEvents.FieldDefs.Add('EventType',ftInteger);
      TempHealthEvents.CreateTable;
      TempHealthEvents.Open;

      SetLength(EventArray,0);
      SetLength(EventArray,5);
      EventArray[0] := CHealthEvent;
      EventArray[1] := CDryOffEvent;
      EventArray[2] := CHerdVaccination;
      EventArray[3] := CNewMastitisEvent;
      EventArray[4] := CLamenessEvent;

      qHealthEvents := TQuery.Create(nil);
      with qHealthEvents do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('INSERT INTO '+TempHealthEvents.TableName+' (ID, EventDate, EventDesc, AnimalID, EventType )');
            SQL.Add('SELECT ID, EventDate, EventDesc, AnimalID, EventType');
            SQl.Add('FROM Events');
            SQL.Add('WHERE (EventType IN '+IntArrayToSQLInString(EventArray)+')');
            if (hFromDate.Date > 0) and (hToDate.Date > 0) then
               SQL.Add('AND (EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')')
            else if (hFromDate.Date > 0) and (hToDate.Date = 0) then
               SQL.Add('AND (EventDate >= ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + ''')')
            else if (hFromDate.Date = 0) and (hToDate.Date > 0) then
               SQL.Add('AND (EventDate <= ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + ''')');
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

begin
   { NN / SP 21/11/2002:- }
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;

   sbView.Enabled := False;
   sbPrint.Enabled := False;

   //   08/07/21 [V6.0 R1.6] /MK Change - I created a query like WinData.qDrugBatchNo that looks for all purchased drugs with batch numbers.
   qDrugBatchNo := TQuery.Create(nil);
   try
      qDrugBatchNo.DatabaseName := AliasName;
      qDrugBatchNo.SQL.Clear;
      qDrugBatchNo.SQL.Add('SELECT MP.ID, MP.DrugID, MP.BatchNo, MP.ExpiryDate, M.Name, MP.QtyRemaining, MP.SuppId');
      qDrugBatchNo.SQL.Add('FROM MediPur MP');
      qDrugBatchNo.SQL.Add('LEFT JOIN Medicine M ON (M.ID=MP.DrugID)');
      qDrugBatchNo.SQL.Add('WHERE TRIM(MP.BatchNo) <> ""');
      qDrugBatchNo.SQL.Add('ORDER BY MP.ID DESC');
      qDrugBatchNo.Open;

      //   16/10/13 [V5.2 R3.5] /MK Bug Fix - No need to check for HerdID if viewing purchase reports.
      if ( ReportType = rtMediTreat ) then
         if HerdCombo.Value = '0' then
            begin
               MessageDlg('Please select a herd',mtInformation,[mbOK],0);
               Exit;
            end;

      if pMedPurch.Visible then
         begin
            PDateFrom.PostEditValue;
            PDateTo.PostEditValue;
            if rgReportType.ItemIndex = 0 then
               begin
                  try
                     if WhichReg = Ireland then
                        begin
                           MedicalPurchasesScr := TMedicalPurchasesScr.Create(nil);
                           MedicalPurchasesScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo;
                           MedicalPurchasesScr.qrlHerdIdentity.Caption := HerdCombo.Text;
                        end
                     else
                        begin
                           NIMedicinePurchaseScr := TNIMedicinePurchaseScr.Create(nil);
                           NIMedicinePurchaseScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo;
                        end;


                     qMedPurch.Close;
                     qMedPurch.SQL.Clear;

                     //   25/07/18 [V5.8 R1.3] /MK Bug Fix - Removed Distinct from SQL as it was causing identitical batch numbers bought
                     //                                      on the same day with identical cost and quantity to appear once on the report - TOK/GL.
                     //qMedPurch.SQL.Add('SELECT DISTINCT D.Name, D.Withdrawal, D.MilkWithDrawal, D.OtherWithDrawal, ');

                     qMedPurch.SQL.Add('SELECT D.Name, D.Withdrawal, D.MilkWithDrawal, D.OtherWithDrawal, ');
                     qMedPurch.SQL.Add('D1.PurchDate, D1.Quantity, ');
                     if WinData.UseEuro AND NOT(WinData.ReportInEuro) then
                        begin
                           qMedPurch.SQL.Add('(D1.CostUnit*'+FloatToStr(cEuro)+') CostUnit,');
                           qMedPurch.SQL.Add('(D1.Quantity * ((D1.CostUnit*'+FloatToStr(cEuro)+'))) TotalCost,')
                        end
                     else
                        begin
                           qMedPurch.SQL.Add(' D1.CostUnit,');
                           qMedPurch.SQL.Add('(D1.Quantity * D1.CostUnit ) TotalCost,');
                        end;

                     if WhichReg = Ireland then
                        qMedPurch.SQL.Add('S.name SName , D1.BatchNo, D1.ExpiryDate, U.UnitCode')
                     else
                        qMedPurch.SQL.Add('S.name + '', '' + S."Address 1" + '', '' + S."Address 2" SName, D1.BatchNo, D1.ExpiryDate, U.UnitCode');
                     qMedPurch.SQL.Add('FROM MediPur D1');
                     qMedPurch.SQL.Add('LEFT JOIN Medicine D ON (D.ID=D1.DrugID)');
                     qMedPurch.SQL.Add('LEFT JOIN SuppliersBreeders S ON (S.ID=D1.SuppID)');
                     qMedPurch.SQL.Add('LEFT JOIN Units U ON (D.PurchUnit=U.ID)');
                     qMedPurch.SQL.Add('WHERE (D1.DrugID = D.ID)');
                     if ( pDateFrom.Date > 0 ) And ( pDateTo.Date > 0 ) then
                        qMedPurch.SQL.Add('And (D1.PurchDate Between ' + '''' + FormatDateTime('mm/dd/yyyy',pDateFrom.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',pDateTo.Date) + '''' + ')');

                     qMedPurch.SQL.Add('ORDER BY D1.PurchDate, D.Name');
                     qMedPurch.Open;

                     if ( qMedPurch.RecordCount <= 0 ) then
                        MessageDlg('No medicine purchases records found for selected date period',mtInformation,[mbOk],0)
                     else
                        begin
                           //   18/11/13 [V5.2 R5.6] /MK Bug Fix - Date labels only apply to Irish Report - Access Violation on NI Report.
                           if WhichReg = Ireland then
                              begin
                                 MedicalPurchasesScr.qrlDateFromDate.Caption := DateToStr(PDateFrom.Date);
                                 MedicalPurchasesScr.qrlDateToDate.Caption := DateToStr(PDateTo.Date);
                              end;
                           PrintMedPurchReport(Sender);
                        end;

                  finally
                    qMedPurch.Close;
                    { NN / SP 21/11/2002:- }
                    if WhichReg = Ireland then
                       MedicalPurchasesScr.Free
                    else
                       NIMedicinePurchaseScr.Free;
                  end
               end
            else
               //Try
                  with TfmFeedPurch.Create(nil) do
                     try
                        if ( WinData.FBordBiaBlockPrint ) then
                           RunReport(roQualityAss,otPrint)
                        else if ( rgInclude.ItemIndex = 0 ) then
                           begin
                              if ( (Sender as TRxSpeedButton).Name = 'sbView' ) then
                                 RunReport(roQualityAss,otView)
                              else
                                 RunReport(roQualityAss,otPrint);
                           end
                        else
                           begin
                              if ( (Sender as TRxSpeedButton).Name = 'sbView' ) then
                                 RunReport(roFeedCost,otView)
                              else
                                 RunReport(roFeedCost,otPrint);
                           end
                     finally
                        Free;
                     end
         end
      else if pMedicalHealth.Visible then
         begin
            Screen.Cursor := crHourGlass;

            CreateTempTable;
            CreateTempHealthEvents;
            FilterItems := '';
            if ( rgHealthCodes.ItemIndex in [cICBFCodeFilter, cFarmCodeFilter] ) then
               CreateFilterString(FilterItems,ftHealthCode)
            else if ( rgHealthCodes.ItemIndex = cMedicineFilter ) then
               CreateFilterString(FilterItems,ftMedicine)
            else if ( rgHealthCodes.ItemIndex = cAdminByFilter ) then
               CreateFilterString(FilterItems,ftAdminBy);
                 
            with TempQuery.SQL do
               try
                  Clear;
                  // Fixed by SP 19 June 2001
                  Add('INSERT INTO '+WinData.TempTable.TableName+' (AID, AnimalNo, SortAnimalNo, NatIDNum, SortNatID,');
                  Add('EventDate, EventDesc, RateApplic, DoseUnitUsed, DrugID, DrugName, MediGroupID, TotDrugCost, AdMinByID, ApplicMethod, DrugPurchID,');
                  Add('NoDays, NoTimes, MeatDays, MilkDays, OtherDays, OrganicMeatDays, OrganicMilkDays, OrganicOtherDays, ReportID,');
                  Add('DoseUnit, FarmCode,');

                  //   10/02/12 [V5.0 R3.7] /MK Additional Feature - Set BatchNo To New BatchNo Field From Health.db.
                  Add('BatchNo, PrescribedByID,');
                  Add('HealthEventID,');
                  Add('MilkN_A_Drug, MeatN_A_Drug)');
                  Add('SELECT DISTINCT (A.ID), A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID,');
                  Add('E.EventDate, E.EventDesc, H.RateApplic, ((H.DoseUnitUsed/H.PurchUnitUsed) * H.RateApplic) DoseUnitUsed, M.ID, M.Name, M.MediGroup,');

                  //   30/09/13 [V5.2 R3.0] /MK Bug Fix - TotDrugCost calculatation differed to WinData.CalcCostAndQtyUsed calculatation used in single/block health event.
                  //Add('( (H.DoseUnitUsed * H.RateApplic) * (H.PurchUnitCost / H.PurchUnitUsed) ) TotDrugCost,');
                  Add('( (H.RateApplic * (H.DoseUnitUsed / H.PurchUnitUsed )) * H.PurchUnitCost ) TotDrugCost,');

                  Add('H.AdMinBy, H.ApplicMethod, H.DrugPurchID, H.NoDays, H.NoTimes, M.WithDrawal, M.MilkWithDrawal, M.OtherWithDrawal,');
                  Add('M.OrganicMeatWithdrawal, M.OrganicMilkWithdrawal, M.OrganicOtherWithdrawal, H.ReportID, U.UnitCode, H.FarmCode,');

                  //   10/02/12 [V5.0 R3.7] /MK Additional Feature - Select New BatchNo Field From Health.db.
                  //   11/01/13 [V5.1 R3.8] /MK Additional Feature - Added VetPresc field.
                  Add('H.DrugBatchNo, H.VetPresc,');

                  Add('H.EventID HealthEventID,');
                  Add('M.MilkN_A_Drug, M.MeatN_A_Drug');
                  Add('FROM Animals A');

                  //   17/07/14 [V5.3 R3.1] /MK Additional Feature - Look at new temp events table of just health events.
                  //Add('LEFT JOIN Events E on (E.AnimalID = A.ID)');
                  Add('LEFT JOIN '+TempHealthEvents.TableName+' E on (E.AnimalID = A.ID)');

                  Add('LEFT JOIN Health H on (H.EventID = E.ID)');
                  Add('LEFT JOIN Medicine M on (M.ID = H.DrugUsed)');
                  Add('LEFT JOIN Units U on (M.DoseUnit = U.ID)');
                  if ( rgHealthCodes.ItemIndex in [cICBFCodeFilter, cFarmCodeFilter] ) then
                     begin
                        if ( FilterItems <> '()' ) then
                           begin
                              if ( rgHealthCodes.ItemIndex = cICBFCodeFilter ) then /// or ( WhichReg <> Ireland ) then
                                 Add('LEFT JOIN GenLook G on (G.ID=H.HealthCode)')
                              else
                                 Add('LEFT JOIN GenLook G on (G.ID=H.FarmCode)');
                           end
                     end;
                  Add('WHERE ( A.LactNo Between '+IntToStr(FromLact.AsInteger)+' AND '+IntToStr(ToLact.AsInteger)+')');
                  Add('AND   ( NOT (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                  Add('AND   ( A.AnimalDeleted = FALSE)');

                  if (Length(HerdCombo.Value) > 0 ) then
                     Add('AND ( A.HerdID = "' + HerdCombo.Value + '" )');
                  if (hFromDate.Date > 0) and (hToDate.Date > 0) then
                     Add('AND (E.EventDate Between ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')')
                  else if (hFromDate.Date > 0) and (hToDate.Date = 0) then
                     Add('AND (E.EventDate Between ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',Now) + '''' + ')')
                  else if (hFromDate.Date = 0) and (hToDate.Date > 0) then
                     Add('AND (E.EventDate Between ''12/31/1899'' And ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')');

                  if ( rgHealthCodes.ItemIndex <> cNoFilter ) then
                     begin
                         if ( FilterItems <> '()' ) then
                            begin
                               if ( rgHealthCodes.ItemIndex = cICBFCodeFilter ) then
                                  Add('AND (H.HealthCode IN '+ FilterItems +')')
                               else if ( rgHealthCodes.ItemIndex = cFarmCodeFilter ) then
                                  Add('AND (H.FarmCode IN '+ FilterItems +')')
                               else if ( rgHealthCodes.ItemIndex = cMedicineFilter ) then
                                  Add('AND (H.DrugUsed IN '+ FilterItems +')')
                               else if ( rgHealthCodes.ItemIndex = cAdminByFilter ) then
                                  Add('AND (H.AdminBy IN '+ FilterItems +')');
                            end
                         else
                            begin
                               if ( rgHealthCodes.ItemIndex = cICBFCodeFilter ) then
                                  Add('AND (H.HealthCode > 0)')
                               else if ( rgHealthCodes.ItemIndex = cFarmCodeFilter ) then
                                  Add('AND (H.FarmCode > 0)')
                               else if ( rgHealthCodes.ItemIndex = cMedicineFilter ) then
                                  Add('AND ((H.DrugUsed > 0) OR (H.DrugUsed IS NOT NULL) )')
                               else if ( rgHealthCodes.ItemIndex = cAdminByFilter ) then
                                  Add('AND ((H.AdminBy > 0) OR (H.AdminBy IS NOT NULL) )');
                            end;
                     end;

                  //   17/09/12 [V5.0 R9.9] /MK Change - Check for HerdVaccination event when checking for Health.
                  {
                  if ( cmbo.ItemIndex = 0 ) then
                     begin
                        Add('AND ( E.EventType = '+ IntToStr(cHealthEvent) +' ');
                        Add('      OR ( E.EventType = '+ IntToStr(CHerdVaccination) +' ) ');
                        Add('      OR ( E.EventType = '+ IntToStr(CNewMastitisEvent) +' ) ');
                        Add('      OR ( E.EventType = '+ IntToStr(CLamenessEvent) +' ) ) ');
                     end
                  else if ( cxrgReportOn.ItemIndex = 1 ) then
                     begin
                        Add('AND ( E.EventType = '+ IntToStr(CDryOffEvent) +') ');
                        Add('AND ( H.DrugUsed > 0 )'); // This is the cause of "i" loop. If DryOff then make sure it has drug assigned!
                     end
                  else if ( cxrgReportOn.ItemIndex = 2 ) then
                     begin
                        Add('AND ( ( E.EventType = '+ IntToStr(cHealthEvent) +')');
                        Add('OR    ( E.EventType = '+ IntToStr(CHerdVaccination) +')');
                        Add('OR    ( E.EventType = '+ IntToStr(CDryOffEvent) +') ');
                        Add('OR    ( E.EventType = '+ IntToStr(CNewMastitisEvent)+') ');
                        Add('OR    ( E.EventType = '+ IntToStr(CLamenessEvent) +') )');
                     end;
                  }
                  case cmboTreatmentTypes.ItemIndex of
                     1 : Add('AND ( E.EventType = '+ IntToStr(cHealthEvent) +') ');
                     2 : begin
                            Add('AND ( E.EventType = '+ IntToStr(CDryOffEvent) +') ');
                            Add('AND ( H.DrugUsed > 0 )'); // This is the cause of "i" loop. If DryOff then make sure it has drug assigned!
                         end;
                     3 : Add('AND ( E.EventType = '+ IntToStr(CHerdVaccination) +') ');
                     4 : Add('AND ( E.EventType = '+ IntToStr(CNewMastitisEvent) +') ');
                     5 : Add('AND ( E.EventType = '+ IntToStr(CLamenessEvent) +') ');
                  end;

                  if ( WinData.ActiveFilter ) then
                     Add('AND A.ID In (SELECT AF.AID FROM AFilters AF)');

                  try
                     TempQuery.ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
                    
               finally
                  if TempHealthEvents <> nil then
                     begin
                        if TempHealthEvents.Active then
                           TempHealthEvents.Active := False;
                        TempHealthEvents.DeleteTable;
                        FreeAndNil(TempHealthEvents);
                     end;
               end;

            TempQuery.SQL.Clear;
            TempQuery.SQL.Add('UPDATE ' + WinData.TempTable.TableName + ' TT SET TT.AdMinBy=(SELECT AdminCode FROM MedAdMin WHERE (MedAdmin.ID=TT.AdMinByID))');
            TempQuery.ExecSQL;

            //   11/01/13 [V5.1 R3.8] /MK Additional Feature - Update new Prescribed By field.
            TempQuery.SQL.Clear;
            TempQuery.SQL.Add('UPDATE ' + WinData.TempTable.TableName + ' TT SET TT.PrescribedBy=(SELECT AdminCode FROM MedAdMin WHERE (MedAdmin.ID=TT.PrescribedByID))');
            TempQuery.ExecSQL;

            pbVetRegisterData.Visible := ( WinData.TempTable.RecordCount > 0 );
            if ( pbVetRegisterData.Visible ) then
               begin
                  if ( rgIndividGroupTreats.Visible ) then
                     begin
                        Height := 494;
                        pbVetRegisterData.Top := 432;
                     end
                  else
                     begin
                        Height := 458;
                        pbVetRegisterData.Top := 392;
                     end;
                  pbVetRegisterData.Properties.Min := 1;
                  pbVetRegisterData.Properties.Max := WinData.TempTable.RecordCount;
                  pbVetRegisterData.Position := 1;
                  Application.ProcessMessages;
                  Update;
               end;

            with WinData.TempTable do
               begin
                  Active := True;
                  First;
                  while not Eof do
                     begin
                        Edit;
                        if ( FieldByName('DrugPurchID').AsInteger > 0 ) then
                           begin
                              if ( WinData.MediPurch.Locate('ID', FieldByName('DrugPurchID').AsInteger, [loCaseInsensitive]) ) then
                                 begin
                                    FieldByName('BatchNo').AsString := WinData.MediPurch.FieldByName('BatchNo').AsString;
                                    FieldByName('ExpiryDate').AsDateTime := WinData.MediPurch.FieldByName('ExpiryDate').AsDateTime;
                                    // NN / SP 21/11/2002:-
                                    if WinData.Suppliers.Locate('ID', WinData.MediPurch.FieldByName('SuppID').AsInteger, []) then
                                       FieldByName('MedPurchSupplier').AsString := WinData.Suppliers.FieldByName('Name').AsString;
                                 end
                              //   20/01/15 [V5.4 R0.8] /MK Bug Fix - If user deletes a DrugPurchID from the MediPur table the deleted ID still exists in the
                              //                                      health table. If the user then enters in a new record for this batchno in the MediPur table
                              //                                      the program should be able to allocate this new purchase to the existing batchno in the Health table.
                              else if ( qDrugBatchNo.Locate('BatchNo',FieldByName('BatchNo').AsString,[loCaseInsensitive]) ) then
                                 begin
                                    if ( qDrugBatchNo.FieldByName('ExpiryDate').AsDateTime > 0 ) then
                                       FieldByName('ExpiryDate').AsDateTime := qDrugBatchNo.FieldByName('ExpiryDate').AsDateTime;
                                    //   08/07/21 [V6.0 R1.6] /MK Change - If the program can only find the BatchNumber in qDrugBatchNo then get the Supplier name from there also - Chris Throne.
                                    if ( WinData.Suppliers.Locate('ID', qDrugBatchNo.FieldByName('SuppID').AsInteger, []) ) then
                                       if ( Length(WinData.Suppliers.FieldByName('Name').AsString) > 0 ) then
                                       FieldByName('MedPurchSupplier').AsString := WinData.Suppliers.FieldByName('Name').AsString;
                                 end;
                           end
                        //   20/01/15 [V5.4 R0.7] /MK Bug Fix - If user entered in BatchNo manually but BatchNo was purchased in the database already
                        //                                      search for this BatchNo and allocate the ExpiryDate for this BatchNo.
                        else if ( ((FieldByName('DrugPurchID').AsInteger = 0) or (FieldByName('DrugPurchID').AsVariant = Null)) and (FieldByName('BatchNo').AsString <> '') ) then
                           ///   22/01/15 [V5.4 R1.0] /MK Bug Fix - Make sure that ExpiryDate is not Null. Null ExpiryDate caused "Invalid Variant Type" error.
                           if ( qDrugBatchNo.Locate('BatchNo',FieldByName('BatchNo').AsString,[loCaseInsensitive]) ) then
                              begin
                                 if ( qDrugBatchNo.FieldByName('ExpiryDate').AsDateTime > 0 ) then
                                    FieldByName('ExpiryDate').AsDateTime := qDrugBatchNo.FieldByName('ExpiryDate').AsDateTime;
                                 //   08/07/21 [V6.0 R1.6] /MK Change - If the program can only find the BatchNumber in qDrugBatchNo then get the Supplier name from there also - Chris Throne.
                                 if ( WinData.Suppliers.Locate('ID', qDrugBatchNo.FieldByName('SuppID').AsInteger, []) ) then
                                    if ( Length(WinData.Suppliers.FieldByName('Name').AsString) > 0 ) then
                                       FieldByName('MedPurchSupplier').AsString := WinData.Suppliers.FieldByName('Name').AsString;
                              end;

                        if FieldByName('MeatDays').AsInteger > 0 then
                           if FieldByName('NoDays').AsInteger > 0 then
                              FieldByName('WithDrawalDate').AsDateTime := (FieldByName('EventDate').AsDateTime + FieldByName('NoDays').AsInteger + FieldByName('MeatDays').AsInteger ) -1
                           else
                              FieldByName('WithDrawalDate').AsDateTime := (FieldByName('EventDate').AsDateTime + (FieldByName('MeatDays').AsInteger)) ;

                        if FieldByName('MilkDays').AsInteger > 0 then
                           if FieldByName('NoDays').AsInteger > 0 then
                              FieldByName('MilkWD').AsDateTime  := (FieldByName('EventDate').AsDateTime + FieldByName('NoDays').AsInteger + FieldByName('MilkDays').AsInteger) -1
                           else
                              FieldByName('MilkWD').AsDateTime := (FieldByName('EventDate').AsDateTime + (FieldByName('MilkDays').AsInteger)) ;

                        if FieldByName('OtherDays').AsInteger > 0 then
                           if FieldByName('NoDays').AsInteger > 0 then
                              FieldByName('OtherWD').AsDateTime := (FieldByName('EventDate').AsDateTime + FieldByName('NoDays').AsInteger + FieldByName('OtherDays').AsInteger) -1
                           else
                              FieldByName('OtherWD').AsDateTime := (FieldByName('EventDate').AsDateTime + (FieldByName('OtherDays').AsInteger));

                        // Organic where required.
                        HerdLookup.HerdOwnerData.HerdID := HerdCombo.KeyValue;
                        if HerdLookup.HerdOwnerData.OrganicHerd then
                           begin
                              if FieldByName('OrganicMeatDays').AsInteger > 0 then
                                 if FieldByName('NoDays').AsInteger > 0 then
                                    FieldByName('OrganicMeatWD').AsDateTime := (FieldByName('EventDate').AsDateTime + FieldByName('NoDays').AsInteger + FieldByName('OrganicMeatDays').AsInteger ) -1
                                 else
                                    FieldByName('OrganicMeatWD').AsDateTime := (FieldByName('EventDate').AsDateTime + (FieldByName('OrganicMeatDays').AsInteger)) ;

                              if FieldByName('OrganicMilkDays').AsInteger > 0 then
                                 if FieldByName('NoDays').AsInteger > 0 then
                                    FieldByName('OrganicMilkWD').AsDateTime  := (FieldByName('EventDate').AsDateTime + FieldByName('NoDays').AsInteger + FieldByName('OrganicMilkDays').AsInteger) -1
                                 else
                                    FieldByName('OrganicMilkWD').AsDateTime := (FieldByName('EventDate').AsDateTime + (FieldByName('OrganicMilkDays').AsInteger)) ;

                              if FieldByName('OrganicOtherDays').AsInteger > 0 then
                                 if FieldByName('NoDays').AsInteger > 0 then
                                    FieldByName('OrganicOtherWD').AsDateTime := (FieldByName('EventDate').AsDateTime + FieldByName('NoDays').AsInteger + FieldByName('OrganicOtherDays').AsInteger) -1
                                 else
                                    FieldByName('OrganicOtherWD').AsDateTime := (FieldByName('EventDate').AsDateTime + (FieldByName('OrganicOtherDays').AsInteger));
                           end;

                        if FieldByName('NoDays').AsInteger > 0 then
                           begin
                              if WhichReg <> Ireland then
                                 begin
                                    if FieldByName('NoTimes').AsInteger > 0 then
                                       FieldByName('DoseUnitUsed').AsFloat := (FieldByName('RateApplic').AsFloat * ((FieldByName('NoTimes').AsInteger) * (FieldByName('NoDays').AsInteger)))
                                    else
                                       FieldByName('DoseUnitUsed').AsFloat := (FieldByName('RateApplic').AsFloat * (FieldByName('NoDays').AsInteger));
                                 end;
                              WinData.TempTable.FieldByName('EndDate').AsDateTime := (WinData.TempTable.FieldByName('EventDate').AsDateTime + (WinData.TempTable.FieldByName('NoDays').AsInteger-1));
                           end
                        else
                           FieldByName('EndDate').AsDateTime := FieldByName('EventDate').AsDateTime;

                        if ( FieldByName('FarmCode').AsInteger > 0 ) then
                           FieldByName('FarmCodeDesc').Value := WinData.GenLookUp.Lookup('ID', FieldByName('FarmCode').AsInteger, 'Description');

                        if ( Def.Definition.dUseCrush ) then
                           begin
                              SetLength(iaAnimalGroupArray,0);
                              iaAnimalGroupArray := WinData.GroupManager.GetAnimalsExistGroupIDs(WinData.TempTable.FieldByName('AID').AsInteger,gtBatch);
                              if ( Length(iaAnimalGroupArray) > 0 ) then
                                 for i := 0 to Length(iaAnimalGroupArray)-1 do
                                    if ( WinData.GroupManager.GetGroupIDGroupType(iaAnimalGroupArray[i]) = gtBatch ) then
                                       begin
                                          SetLength(GroupDetailsArray,0);
                                          GroupDetailsArray := WinData.GroupManager.GetGroupData(iaAnimalGroupArray[i],'Description');
                                          FieldByName('PenFrom').AsString := GroupDetailsArray[0];
                                       end;
                           end;
                        Post;

                        pbVetRegisterData.Position := pbVetRegisterData.Position+1; 
                        Application.ProcessMessages;
                        Update;
                        Next;
                     end;
                  Active := False;
               end;

               with qMed do
                  begin
                     if ( WhichReg <> Ireland ) or ( rgIndividGroupTreats.ItemIndex = 0 ) then
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT SortAnimalNo, SortNatID, AnimalNo, NatIDNum, EventDate, EventDesc,');
                           SQL.Add('       DrugName, RateApplic, ApplicMethod, AdminBy, DoseUnit,');
                           SQL.Add('       MilkDays, MeatDays, OrganicMeatDays, OrganicMilkDays,');
                           // check that euro is currency, then check if euro is selected for report.
                           if WinData.UseEuro AND NOT(WinData.ReportInEuro) then
                              SQL.Add('       ((TotDrugCost*'+FloatToStr(cEuro)+') * NoTimes * NoDays) TotDrugCost , (NoDays * NoTimes) NoDoses, ') // SP 29/04/2003
                           else
                              SQL.Add('       (TotDrugCost * NoTimes * NoDays) TotDrugCost , (NoDays * NoTimes) NoDoses, '); // SP 29/04/2003

                           SQL.Add('       WithdrawalDate, MilkWD, OtherWD, OrganicMeatWD, OrganicMilkWD, OrganicOtherWD,');
                           //   11/01/13 [V5.1 R3.8] /MK Additional Feature - Added Prescribed By field to report.
                           SQL.Add('       BatchNo, NoTimes, NoDays, ExpiryDate, G.Description, FarmCodeDesc, PrescribedBy,');
                           // NN / SP 21/11/2002:-
                           SQL.Add('       EndDate, MedPurchSupplier, DoseUnitUsed,');
                           SQL.Add('       MilkN_A_Drug, MeatN_A_Drug,');
                           SQL.Add('       PenFrom');
                           SQL.Add('FROM ' + WinData.TempTable.TableName);
                           SQL.Add('LEFT JOIN GenLook G ON (G.ID=ReportID)');

                           case SortByRadio.ItemIndex of
                              0 : SQL.Add('ORDER BY SortNatID');
                              1 : SQL.Add('ORDER BY SortAnimalNo');
                              2 : SQL.Add('ORDER BY EventDate');
                              3 : SQL.Add('ORDER BY DrugName');
                              4 : SQL.Add('ORDER BY AdminBy');
                           end;

                           case OrderRadio.ItemIndex of
                              0 : SQL.Add('ASC'); // Ascending
                              1 : SQL.Add('DESC'); // Descending
                           end;

                           qMed.Open;
                        end
                     else
                        begin
                           ReportTable := TTable.Create(nil);
                           ReportTable.DatabaseName := AliasName;
                           ReportTable.TableName := 'tmpReportTable';
                           ReportTable.FieldDefs.Clear;
                           ReportTable.FieldDefs.Add('ID',ftAutoInc);
                           ReportTable.FieldDefs.Add('EventCount',ftInteger);
                           ReportTable.FieldDefs.Add('EventDate',ftDate);
                           ReportTable.FieldDefs.Add('DrugID',ftInteger);
                           ReportTable.FieldDefs.Add('DrugName',ftString,40);
                           ReportTable.FieldDefs.Add('RateApplic',ftFloat);
                           ReportTable.FieldDefs.Add('ApplicMethod',ftInteger);
                           ReportTable.FieldDefs.Add('AdminByID',ftInteger);
                           ReportTable.FieldDefs.Add('AdminBy',ftString,40);
                           ReportTable.FieldDefs.Add('DoseUnit',ftString,6);
                           ReportTable.FieldDefs.Add('MilkDays',ftInteger);
                           ReportTable.FieldDefs.Add('MeatDays',ftFloat);
                           ReportTable.FieldDefs.Add('OrganicMeatDays',ftInteger);
                           ReportTable.FieldDefs.Add('OrganicMilkDays',ftInteger);
                           ReportTable.FieldDefs.Add('OrganicOtherDays',ftInteger);
                           ReportTable.FieldDefs.Add('MilkN_A_Drug',ftBoolean);
                           ReportTable.FieldDefs.Add('MeatN_A_Drug',ftBoolean);
                           ReportTable.FieldDefs.Add('WithdrawalDate',ftDate);
                           ReportTable.FieldDefs.Add('MilkWD',ftDate);
                           ReportTable.FieldDefs.Add('OtherWD',ftDate);
                           ReportTable.FieldDefs.Add('OrganicMeatWD',ftDate);
                           ReportTable.FieldDefs.Add('OrganicMilkWD',ftDate);
                           ReportTable.FieldDefs.Add('OrganicOtherWD',ftDate);
                           ReportTable.FieldDefs.Add('BatchNo',ftString,30);
                           ReportTable.FieldDefs.Add('NoTimes',ftInteger);
                           ReportTable.FieldDefs.Add('NoDays',ftInteger);
                           ReportTable.FieldDefs.Add('ExpiryDate',ftDate);
                           ReportTable.FieldDefs.Add('Description',ftString,60);
                           ReportTable.FieldDefs.Add('FarmCodeDesc',ftString,30);
                           ReportTable.FieldDefs.Add('PrescribedByID',ftInteger);
                           ReportTable.FieldDefs.Add('PrescribedBy',ftString,40);
                           ReportTable.FieldDefs.Add('EventDesc',ftString,40);
                           ReportTable.FieldDefs.Add('TotDrugCost',ftFloat);
                           ReportTable.FieldDefs.Add('NoDoses',ftInteger);
                           ReportTable.FieldDefs.Add('AnimalNo',ftString,10);
                           ReportTable.FieldDefs.Add('NatIDNum',ftString,20);
                           ReportTable.FieldDefs.Add('SortAnimalNo',ftString,10);
                           ReportTable.FieldDefs.Add('SortNatID',ftString,20);
                           ReportTable.FieldDefs.Add('PenFrom',ftString,30);
                           ReportTable.CreateTable;
                           ReportTable.Open;

                           SQL.Clear;
                           SQL.Text := cGroup_NonAnitibioic_TreatsSQL;
                           Params[0].AsInteger := FAnimalRemedyData.GetMediGroupIDByMediType(mtAntibiotic);
                           try
                              Open;
                              // If no non antibiotic group treatmens found record count will return 1 because SQL is using group.
                              // So only add group treatments if record count > 1
                              First;
                              if ( FieldByName('EventCount').AsInteger > 0 ) then
                                 begin
                                    SQL.Clear;
                                    SQL.Add('INSERT INTO tmpReportTable (EventCount ,EventDate, DrugID, DrugName, RateApplic,');
                                    SQL.Add('                            ApplicMethod, AdminByID, AdminBy, DoseUnit,');
                                    SQL.Add('                            MilkDays, MeatDays, OrganicMeatDays, OrganicMilkDays, OrganicOtherDays,');
                                    SQL.Add('                            WithdrawalDate, MilkWD, OrganicMeatWD, OrganicMilkWD, OrganicOtherWD,');
                                    SQL.Add('                            BatchNo, NoTimes, NoDays, ExpiryDate, Description,');
                                    SQL.Add('                            FarmCodeDesc, PrescribedByID, PrescribedBy, EventDesc, TotDrugCost,');
                                    SQL.Add('                            MilkN_A_Drug, MeatN_A_Drug, PenFrom)');
                                    SQL.Text := SQL.Text + cGroup_NonAnitibioic_TreatsSQL;
                                    Params[0].AsInteger := FAnimalRemedyData.GetMediGroupIDByMediType(mtAntibiotic);
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

                           //   06/01/14 [V5.2 R6.3] /MK Bug Fix - Withdrawal information left out of group report by mistake.
                           ReportTable.Open;
                           pbVetRegisterData.Visible := ( ReportTable.RecordCount > 0 );
                           if ( pbVetRegisterData.Visible ) then
                              begin
                                 if ( rgIndividGroupTreats.Visible ) then
                                    begin
                                       Height := 512;
                                       pbVetRegisterData.Top := 448;
                                    end
                                 else
                                    begin
                                       Height := 494;
                                       pbVetRegisterData.Top := 428;
                                    end;
                                 pbVetRegisterData.Properties.Min := 1;
                                 pbVetRegisterData.Properties.Max := ReportTable.RecordCount;
                                 pbVetRegisterData.Position := 1;
                                 Application.ProcessMessages;
                                 Update;
                              end;

                           ReportTable.First;
                           while ( not(ReportTable.Eof) ) do
                              begin
                                 ReportTable.Edit;
                                 if ( ReportTable.FieldByName('TotDrugCost').AsFloat > 0 ) then
                                    begin
                                       if WinData.UseEuro AND NOT(WinData.ReportInEuro) then
                                          ReportTable.FieldByName('TotDrugCost').AsFloat := ( ReportTable.FieldByName('TotDrugCost').AsFloat*cEuro ) *
                                                                                            ReportTable.FieldByName('NoTimes').AsInteger *
                                                                                            ReportTable.FieldByName('NoDays').AsInteger
                                       else
                                          ReportTable.FieldByName('TotDrugCost').AsFloat := ReportTable.FieldByName('TotDrugCost').AsFloat *
                                                                                            ReportTable.FieldByName('NoTimes').AsInteger *
                                                                                            ReportTable.FieldByName('NoDays').AsInteger;
                                    end;
                                 ReportTable.FieldByName('NoDoses').AsInteger := ReportTable.FieldByName('NoTimes').AsInteger *
                                                                                 ReportTable.FieldByName('NoDays').AsInteger;

                                 if ( ReportTable.FieldByName('EventCount').AsInteger = 1 ) and ( ReportTable.FieldByName('DrugID').AsInteger > 0 ) then
                                    begin
                                       WinData.TempTable.Open;
                                       //   22/10/13 [V5.2 R3.8] /MK Bug Fix - Added routine to go through single animal records and add correct animal no/natidnum.
                                       //                                      Was adding same animal no/natidnum for each singe animal record found of drug.
                                       GetAnimalRecordDetails;
                                       if ( (AnimalRecord.AnimalNo <> '') or (AnimalRecord.NatIDNum <> '') ) then
                                          begin
                                             ReportTable.FieldByName('AnimalNo').AsString := AnimalRecord.AnimalNo;
                                             ReportTable.FieldByName('SortAnimalNo').AsString := AnimalRecord.SortAnimalNo;
                                             ReportTable.FieldByName('NatIDNum').AsString := AnimalRecord.NatIDNum;
                                             ReportTable.FieldByName('SortNatID').AsString := AnimalRecord.SortNatID;
                                          end;
                                       WinData.TempTable.Close;
                                    end;

                                 ReportTable.Post;

                                 pbVetRegisterData.Position := pbVetRegisterData.Position+1;
                                 Application.ProcessMessages;
                                 Update;
                                 ReportTable.Next;
                              end;

                           // Now insert single antibiotic treatments on top of grouped non-antibiotic treatments.
                           SQL.Clear;
                           SQL.Add('INSERT INTO tmpReportTable (AnimalNo, SortAnimalNo, NatIDNum, SortNatID, EventDate, DrugID, DrugName, RateApplic,');
                           SQL.Add('                            ApplicMethod, AdminByID, AdminBy, DoseUnit,');
                           SQL.Add('                            MilkDays, MeatDays, OrganicMeatDays, OrganicMilkDays, OrganicOtherDays,');
                           SQL.Add('                            WithdrawalDate, MilkWD, OrganicMeatWD, OrganicMilkWD, OrganicOtherWD,');
                           SQL.Add('                            BatchNo, NoTimes, NoDays, ExpiryDate, Description,');
                           SQL.Add('                            FarmCodeDesc, PrescribedByID, PrescribedBy, EventDesc, TotDrugCost,');
                           SQL.Add('                            MilkN_A_Drug, MeatN_A_Drug,');
                           SQL.Add('                            PenFrom)');
                           SQL.Add('SELECT AnimalNo, SortAnimalNo, NatIDNum, SortNatID, EventDate, DrugID, DrugName, RateApplic,');
                           SQL.Add('       ApplicMethod, AdminByID, AdminBy, DoseUnit,');
                           SQL.Add('       MilkDays, MeatDays, OrganicMeatDays, OrganicMilkDays, OrganicOtherDays,');
                           SQL.Add('       WithdrawalDate, MilkWD, OrganicMeatWD, OrganicMilkWD, OrganicOtherWD,');
                           SQL.Add('       BatchNo, NoTimes, NoDays, ExpiryDate, G.Description, FarmCodeDesc, PrescribedByID, PrescribedBy,');
                           SQL.Add('       EventDesc, TotDrugCost,');
                           SQL.Add('       MilkN_A_Drug, MeatN_A_Drug,');
                           SQL.Add('       PenFrom');
                           SQL.Add('FROM TempHealth');
                           SQL.Add('LEFT JOIN GenLook G ON (G.ID=ReportID)');
                           SQL.Add('WHERE MediGroupID = :AntibioticTypeID');
                           Params[0].AsInteger := FAnimalRemedyData.GetMediGroupIDByMediType(mtAntibiotic);
                           try
                              ExecSQL;
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;

                           // Single antibiotic treatments will always have an EventCount of 0 after insert
                           // so set this event count to 1 so the animals tag number appears on the report instead of number of animals.
                           SQL.Clear;
                           SQl.Add('UPDATE tmpReportTable');
                           SQl.Add('SET EventCount = 1');
                           SQL.Add('WHERE ( EventCount = 0 Or EventCount Is Null )');
                           try
                              ExecSQL;
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;

                           //   13/05/14 [V5.3 R0.2] /MK Bug Fix - Program was going through table finding first antibiotic drug
                           //                                      adding individual records for this drug but when it tried to move
                           //                                      to the next record in the ReportTable it was already at the end of
                           //                                      of the table because of the insert of new records.
                           //                                      Logic changed to that of uAnimalRemedy query to group all treatments
                           //                                      that are not antibiotic drugs and insert them into the ReportTable.
                           //                                      Then insert individual animals for antibiotic drugs without grouping.

                           // Go through WinData.TempTable to see if there are drugs that are antibiotics.
                           // If antibiotic drugs exist then add a new record for each animal that was dosed with that antibiotic drug.
                           {
                           ReportTable.First;
                           ReportTableID := 0;
                           while ( not(ReportTable.Eof) ) do
                              try
                                 if ( ReportTable.FieldByName('DrugID').AsInteger > 0 ) then
                                    if ( WinData.IsAntibioticDrug(ReportTable.FieldByName('DrugID').AsInteger) ) and ( ReportTable.FieldByName('EventCount').AsInteger > 1 ) then
                                       begin
                                          ReportTableID := ReportTable.FieldByName('ID').AsInteger;
                                          WinData.TempTable.Close;
                                          WinData.TempTable.Filtered := False;
                                          WinData.TempTable.Filter := '';
                                          WinData.TempTable.Filter := 'DrugID = '+IntToStr(ReportTable.FieldByName('DrugID').AsInteger)+'';
                                          WinData.TempTable.Filtered := True;
                                          WinData.TempTable.Open;

                                          WinData.TempTable.First;
                                          while ( not(WinData.TempTable.Eof) ) do
                                             begin
                                                try
                                                   ReportTable.Append;
                                                   ReportTable.FieldByName('EventCount').AsInteger := 1;
                                                   ReportTable.FieldByName('AnimalNo').AsString := WinData.TempTable.FieldByName('AnimalNo').AsString;
                                                   ReportTable.FieldByName('NatIDNum').AsString := WinData.TempTable.FieldByName('NatIDNum').AsString;
                                                   ReportTable.FieldByName('SortAnimalNo').AsString := WinData.TempTable.FieldByName('SortAnimalNo').AsString;
                                                   ReportTable.FieldByName('SortNatID').AsString := WinData.TempTable.FieldByName('SortNatID').AsString;
                                                   ReportTable.FieldByName('EventDate').AsDateTime := WinData.TempTable.FieldByName('EventDate').AsDateTime;
                                                   ReportTable.FieldByName('DrugName').AsString := WinData.TempTable.FieldByName('DrugName').AsString;
                                                   ReportTable.FieldByName('RateApplic').AsFloat := WinData.TempTable.FieldByName('RateApplic').AsFloat;
                                                   ReportTable.FieldByName('ApplicMethod').AsInteger := WinData.TempTable.FieldByName('ApplicMethod').AsInteger;
                                                   ReportTable.FieldByName('AdminByID').AsInteger := WinData.TempTable.FieldByName('AdminByID').AsInteger;
                                                   ReportTable.FieldByName('AdminBy').AsString := WinData.TempTable.FieldByName('AdminBy').AsString;
                                                   ReportTable.FieldByName('DoseUnit').AsString := WinData.TempTable.FieldByName('DoseUnit').AsString;
                                                   ReportTable.FieldByName('MilkDays').AsInteger := WinData.TempTable.FieldByName('MilkDays').AsInteger;
                                                   ReportTable.FieldByName('MeatDays').AsFloat := WinData.TempTable.FieldByName('MeatDays').AsFloat;
                                                   ReportTable.FieldByName('OrganicMeatDays').AsInteger := WinData.TempTable.FieldByName('OrganicMeatDays').AsInteger;
                                                   ReportTable.FieldByName('OrganicMilkDays').AsInteger := WinData.TempTable.FieldByName('OrganicMilkDays').AsInteger;
                                                   ReportTable.FieldByName('WithdrawalDate').AsDateTime := WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime;
                                                   ReportTable.FieldByName('MilkWD').AsDateTime := WinData.TempTable.FieldByName('MilkWD').AsDateTime;
                                                   ReportTable.FieldByName('OtherWD').AsDateTime := WinData.TempTable.FieldByName('OtherWD').AsDateTime;
                                                   ReportTable.FieldByName('OrganicMeatWD').AsDateTime := WinData.TempTable.FieldByName('OrganicMeatWD').AsDateTime;
                                                   ReportTable.FieldByName('OrganicMilkWD').AsDateTime := WinData.TempTable.FieldByName('OrganicMilkWD').AsDateTime;
                                                   ReportTable.FieldByName('OrganicOtherWD').AsDateTime := WinData.TempTable.FieldByName('OrganicOtherWD').AsDateTime;
                                                   ReportTable.FieldByName('BatchNo').AsString := WinData.TempTable.FieldByName('BatchNo').AsString;
                                                   ReportTable.FieldByName('NoTimes').AsInteger := WinData.TempTable.FieldByName('NoTimes').AsInteger;
                                                   ReportTable.FieldByName('NoDays').AsInteger := WinData.TempTable.FieldByName('NoDays').AsInteger;
                                                   ReportTable.FieldByName('ExpiryDate').AsDateTime := WinData.TempTable.FieldByName('ExpiryDate').AsDateTime;
                                                   ReportTable.FieldByName('FarmCodeDesc').AsString := WinData.TempTable.FieldByName('FarmCodeDesc').AsString;
                                                   ReportTable.FieldByName('PrescribedByID').AsInteger := WinData.TempTable.FieldByName('PrescribedByID').AsInteger;
                                                   ReportTable.FieldByName('PrescribedBy').AsString := WinData.TempTable.FieldByName('PrescribedBy').AsString;
                                                   ReportTable.FieldByName('EventDesc').AsString := WinData.TempTable.FieldByName('EventDesc').AsString;
                                                   ReportTable.FieldByName('TotDrugCost').AsFloat := WinData.TempTable.FieldByName('TotDrugCost').AsFloat;
                                                   ReportTable.Post;
                                                except
                                                   ReportTable.Cancel;
                                                end;
                                                WinData.TempTable.Next;
                                             end;
                                          WinData.TempTable.Filtered := False;
                                          WinData.TempTable.Filter := '';
                                          WinData.TempTable.Close;
                                       end;
                                 ReportTable.Next;
                              except

                              end;

                           // Go through ReportTable and delete first record of antibiotic drug that contains the count of animals
                           // as individual animals are shown on the report.
                           ReportTable.First;
                           while ( not(ReportTable.Eof) ) do
                              try
                                 if ( (WinData.IsAntibioticDrug(ReportTable.FieldByName('DrugID').AsInteger)) and (ReportTable.FieldByName('EventCount').AsInteger > 1) ) or
                                    ( ReportTable.FieldByName('EventCount').AsInteger = 0 ) then
                                    ReportTable.Delete;
                                 ReportTable.Next;
                              except

                              end;
                           }

                           pbVetRegisterData.Visible := ( ReportTable.RecordCount > 0 );
                           if ( pbVetRegisterData.Visible ) then
                              begin
                                 if ( rgIndividGroupTreats.Visible ) then
                                    begin
                                       Height := 512;
                                       pbVetRegisterData.Top := 448;
                                    end
                                 else
                                    begin
                                       Height := 494;
                                       pbVetRegisterData.Top := 428;
                                    end;
                                 pbVetRegisterData.Properties.Min := 1;
                                 pbVetRegisterData.Properties.Max := ReportTable.RecordCount;
                                 pbVetRegisterData.Position := 1;
                                 Application.ProcessMessages;
                                 Update;
                              end;
                           //   30/09/13 [V5.2 R3.0] /MK Additional Feature - Calculate total drug cost if EventCount > 1
                           ReportTable.First;
                           while ( not(ReportTable.Eof) ) do
                              try
                                 if ( ReportTable.FieldByName('TotDrugCost').AsFloat > 0 ) and ( ReportTable.FieldByName('EventCount').AsInteger > 1 ) then
                                    try
                                       ReportTable.Edit;
                                       ReportTable.FieldByName('TotDrugCost').AsFloat := ( ReportTable.FieldByName('TotDrugCost').AsFloat *
                                                                                           ReportTable.FieldByName('EventCount').AsInteger );
                                       ReportTable.Post;
                                    except
                                       ReportTable.Cancel;
                                    end;
                                 pbVetRegisterData.Position := pbVetRegisterData.Position+1;
                                 Application.ProcessMessages;
                                 Update;
                                 ReportTable.Next;
                              except

                              end;

                           qMed.Close;
                           qMed.SQL.Clear;
                           qMed.SQl.Add('SELECT * FROM '+ReportTable.TableName+'');

                           case SortByRadio.ItemIndex of
                              0 : SQL.Add('ORDER BY SortNatID');
                              1 : SQL.Add('ORDER BY SortAnimalNo');
                              2 : SQL.Add('ORDER BY EventDate');
                              3 : SQL.Add('ORDER BY DrugName');
                              4 : SQL.Add('ORDER BY AdminBy');
                           end;

                           case OrderRadio.ItemIndex of
                              0 : SQL.Add('ASC'); // Ascending
                              1 : SQL.Add('DESC'); // Descending
                           end;

                           qMed.Open;
                        end;

                      Screen.Cursor := crDefault;

                      if ( qMed.RecordCount <= 0 ) then
                         begin
                            if not(WinData.ExportToPDA) then
                               begin
                                  {
                                  if cxrgReportOn.ItemIndex = 0 then
                                     MessageDlg('No health events found for selected date period',mtInformation,[mbOk],0)
                                  else if cxrgReportOn.ItemIndex = 1 then
                                     MessageDlg('No drying off events found for selected date period',mtInformation,[mbOk],0)
                                  else if cxrgReportOn.ItemIndex = 2 then
                                     MessageDlg('No health or drying off events found for selected date period',mtInformation,[mbOk],0)
                                  }
                                  sMsgText := '';
                                  case cmboTreatmentTypes.ItemIndex of
                                     1 : sMsgText := 'health';
                                     2 : sMsgText := 'drying off';
                                     3 : sMsgText := 'vaccination';
                                     4 : sMsgText := 'mastitis';
                                     5 : sMsgText := 'lameness';
                                  end;
                                  if ( Length(sMsgText) > 0 ) then
                                     MessageDlg(Format('No %s events found for selected date period',[sMsgText]),mtInformation,[mbOk],0);
                               end;
                         end
                      else
                         try
                            if WhichReg <> Ireland then
                                begin
                                   NIVetTreatmentsScr := TNIVetTreatmentsScr.Create(nil);
                                   NIVetTreatmentsScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo;
                                   PrintVetTreatReport(NIVetTreatmentsScr.qrNIVetTreatmentsScr, Sender);
                                end
                             else
                                begin
                                   MedicalTreatmentsScr := TMedicalTreatmentsScr.Create(nil);
                                   MedicalTreatmentsScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo;
                                   MedicalTreatmentsScr.qrlDateFromDate.Caption := DateToStr(hFromDate.Date);
                                   MedicalTreatmentsScr.qrlDateToDate.Caption := DateToStr(hToDate.Date);
                                   MedicalTreatmentsScr.qrlHerdIdentity.Caption := HerdCombo.Text;
                                   if ( rgIndividGroupTreats.ItemIndex = 0 ) then
                                      MedicalTreatmentsScr.FReportType := rtIndividual
                                   else
                                      MedicalTreatmentsScr.FReportType := rtBlock;

                                   // Add AdminBy Code and Name plus PrescribedBy Code and Name to MedicalTreatmentsScr labels.
                                   PrintAdminBy_PrescrBy_Code_Name;

                                   PrintVetTreatReport(MedicalTreatmentsScr, Sender)
                                end;
                         finally
                            // NN / SP 21/11/2002 :-
                            if WhichReg <> Ireland then
                               NIVetTreatmentsScr.Free
                            else
                               MedicalTreatmentsScr.Free;

                         end;
                  end;

            pbVetRegisterData.Visible := False;
            if ( rgIndividGroupTreats.Visible ) then
               Height := 502
            else
               Height := 430;
            Application.ProcessMessages;
            Update;
         end;
   finally
      if ( ReportTable <> nil ) then
         begin
            ReportTable.Close;
            ReportTable.DeleteTable;
            FreeAndNil(ReportTable);
         end;

      if ( qDrugBatchNo <> nil ) then
         FreeAndNil(qDrugBatchNo);

      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
end;

procedure THeatlthFilter.rgReportTypeClick(Sender: TObject);
begin
   case rgReportType.ItemIndex of
      0 : begin
             SortByRadio.Visible := False;
             OrderRadio.Visible := False;
             SortByRadio.Visible := False;
             rgInclude.Visible := False;
          end;
      1 : begin
             SortByRadio.Parent := pMedPurch;
             OrderRadio.Parent  := pMedPurch;
             rgInclude.Visible := True;
             rgInclude.Top := 35;
             SortByRadio.Columns := 2;
             SortByRadio.Top := 80;
             SortByRadio.Left := 10;
             SortByRadio.Width := 433;
             SortByRadio.Height := 72;
             OrderRadio.Top := 151;
             OrderRadio.Left := 10;
             OrderRadio.Width := 433;
             SortByRadio.Visible := True;
             OrderRadio.Visible := True;
             SortByRadio.Visible := True;
             rgInclude.ItemIndex := 0;
             SortByRadio.ItemIndex := 0;
             OrderRadio.ItemIndex := 0;
          end;
   end;
end;

procedure THeatlthFilter.PrintVetTreatReport(WhatScreen: TQuickRep;
  Sender: TObject);
begin
  { NN / SP 21/11/2002:- }

   WhatScreen.Page.Orientation := poLandscape;
   if ( WinData.FBordBiaBlockPrint ) then
      begin
         TMedicalTreatmentsScr(WhatScreen).RptTitle.Font.Color := ClRed;
         TMedicalTreatmentsScr(WhatScreen).Detail.Font.Color := ClNavy;
         //WhatScreen.Preview;
         WhatScreen.Print;
      end
   else if ( WinData.ExportToPDA ) then
      begin
         if WhichReg = Ireland then
            WinData.PDALinkExport.ExportReport( WhatScreen )
         else
            WinData.PDALinkExport.ExportReport( NIVetTreatmentsScr.qrNIVetTreatmentsScr );
      end
   else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
      begin
         if WhichReg <> Ireland then
            begin
               NIVetTreatmentsScr.RptTitle.Font.Color := ClRed;
               NIVetTreatmentsScr.Detail.Font.Color := ClNavy;
            end
         else
            begin
               TMedicalTreatmentsScr(WhatScreen).RptTitle.Font.Color := ClRed;
               TMedicalTreatmentsScr(WhatScreen).Detail.Font.Color := ClNavy;
            end;
         WhatScreen.Preview;
      end
   else
      begin
         if WhichReg <> Ireland then
            begin
               NIVetTreatmentsScr.RptTitle.Font.Color := ClBlack;
               NIVetTreatmentsScr.Detail.Font.Color := ClBlack;
            end
         else
            begin
               TMedicalTreatmentsScr(WhatScreen).RptTitle.Font.Color := ClBlack;
               TMedicalTreatmentsScr(WhatScreen).Detail.Font.Color := ClBlack;
            end;
          WinData.CallPrintDialog(WhatScreen);
      end;
end;

procedure THeatlthFilter.HerdComboChange(Sender: TObject);
begin
   { NN / SP 21/11/2002:- }
   if HerdCombo.Value <> '0' then
      WhichReg := WinData.DefCountry(HerdCombo.KeyValue);
end;

procedure THeatlthFilter.PrintMedPurchReport(Sender: TObject);
begin
   if ( WinData.FBordBiaBlockPrint ) then
      begin
         MedicalPurchasesScr.RptTitle.Font.Color := ClRed;
         MedicalPurchasesScr.Detail.Font.Color := ClNavy;
         //MedicalPurchasesScr.qrMedicalPurchases.Preview;
         MedicalPurchasesScr.qrMedicalPurchases.Print;
      end
   { NN / SP 21/11/2002:- }
   else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
      begin
         if WhichReg = Ireland then
            begin
               MedicalPurchasesScr.RptTitle.Font.Color := ClRed;
               MedicalPurchasesScr.Detail.Font.Color := ClNavy;
               MedicalPurchasesScr.qrMedicalPurchases.Preview;
            end
         else
            begin
               NIMedicinePurchaseScr.RptTitle.Font.Color := ClRed;
               NIMedicinePurchaseScr.Detail.Font.Color := ClNavy;
               NIMedicinePurchaseScr.qrNIMedicinePurchase.Preview;
            end
      end
   else if ( Sender as TRxSpeedButton ).Name = 'sbPrint' then
      begin
         if WhichReg = Ireland then
            begin
               MedicalPurchasesScr.RptTitle.Font.Color := ClBlack;
               MedicalPurchasesScr.Detail.Font.Color := ClBlack;
               WinData.CallPrintDialog(MedicalPurchasesScr.qrMedicalPurchases);
            end
         else
            begin
               NIMedicinePurchaseScr.RptTitle.Font.Color := ClBlack;
               NIMedicinePurchaseScr.Detail.Font.Color := ClBlack;
               WinData.CallPrintDialog(NIMedicinePurchaseScr.qrNIMedicinePurchase);
            end;
      end;
end;

procedure THeatlthFilter.DrawHealthList(ICBF : Boolean);
var
   i : Integer;
begin
   try
      clHealthList.Color := clWindow;
      clHealthList.Enabled := True;
      clHealthList.Items.Clear;
      with HealthList do
         try
            //   27/08/15 [V5.4 R7.4] /MK Change - Only show health and farm codes within the date range selected like medicine and admin code are.
            HealthList.SQL.Clear;
            HealthList.SQL.Add('SELECT DISTINCT(G.ID), G.Description');
            HealthList.SQL.Add('FROM GenLook G');
            if ( ICBF ) then
               HealthList.SQL.Add('LEFT JOIN Health H ON (G.ID = H.HealthCode)')
            else
               HealthList.SQL.Add('LEFT JOIN Health H ON (G.ID = H.FarmCode)');
            HealthList.SQL.Add('LEFT JOIN Events E ON (H.EventID = E.ID)');
            if ( ICBF ) then
                HealthList.SQL.Add('WHERE (UPPER(Description) Like "ICBF%")')
            else
                HealthList.SQL.Add('WHERE NOT(UPPER(Description) Like "ICBF%")');
            if (hFromDate.Date > 0) and (hToDate.Date > 0) then
               HealthList.SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')')
            else if (hFromDate.Date > 0) and (hToDate.Date = 0) then
               HealthList.SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('mm/dd/yyyy',Now) + '''' + ')')
            else if (hFromDate.Date = 0) and (hToDate.Date > 0) then
               HealthList.SQL.Add('AND (E.EventDate BETWEEN ''12/31/1899'' AND ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')');
            HealthList.Open;

            if HealthList.RecordCount > 0 then
               begin
                  First;
                  SlHealthList.Clear;
                  SlHealthList.BeginUpdate;

                  while not eof do
                     begin
                        SLHealthList.AddObject(FieldByName('Description').AsString, THealthCodes.Create(FieldByName('ID').AsInteger));
                        Next;
                     end;

                  SlHealthList.EndUpdate;
                  SlHealthList.Sort;

                  for i := 0 to SlHealthList.Count-1 do
                     begin
                        clHealthList.Items.AddObject(SlHealthList.Strings[i], SlHealthList.Objects[i]);
                        clHealthList.Checked[i] := False;
                     end;
               end;
         finally
            Close;
         end;
         //SelectAllCodes;  // is redundant ?? need to check!
   except
     MessageDlg('Cannot obtain health code listings, contact Kingswood',mtError,[mbOK],0);
   end;
end;

{ THealthCodes }

constructor THealthCodes.Create(ID: Integer);
begin
   FID := ID;
end;

destructor THealthCodes.Destroy;
begin
  inherited Destroy;

end;

procedure THeatlthFilter.rgHealthCodesClick(Sender: TObject);
begin
   if ( rgHealthCodes.ItemIndex = cICBFCodeFilter ) then
      DrawHealthList(True)
   else if ( rgHealthCodes.ItemIndex = cFarmCodeFilter ) then
      DrawHealthList(False)
   else if ( rgHealthCodes.ItemIndex = cMedicineFilter ) then
      DrawMedicineList
   else if ( rgHealthCodes.ItemIndex = cAdminByFilter ) then
      DrawAdminCodeFilters;

   if ( rgHealthCodes.ItemIndex <> cNoFilter ) then
      begin
         rgHealthCodes.Width := 102;
         clHealthList.Show;
         sbClear.Show;
      end
   else
      begin
         rgHealthCodes.Width := 169;
         clHealthList.Hide;
         sbClear.Hide;
      end;
   DeSelectAllCodes;
   Update;
end;

procedure THeatlthFilter.SelectAllCodes;
var
   x : Integer;
begin
   for x := 0 to clHealthList.Items.Count-1 do clHealthList.Checked[x] := True;
end;

procedure THeatlthFilter.sbClearClick(Sender: TObject);
begin
   DeSelectAllCodes;
end;

procedure THeatlthFilter.DeSelectAllCodes;
var
   x : Integer;
begin
   for x := 0 to clHealthList.Items.Count-1 do clHealthList.Checked[x] := False;
end;

procedure THeatlthFilter.LoadScreenDefaults;
begin
   VetTreatmentsDefs := TVetTreatmentsDefaults.Create(cRD_VetTreatments);
   try
      SortByRadio.ItemIndex := VetTreatmentsDefs.SortField;
      OrderRadio.ItemIndex := VetTreatmentsDefs.SortOrder;
      hFromDate.Date := Trunc(Date - VetTreatmentsDefs.DateInterval);
      //   29/09/17 [V5.7 R3.4] /MK Bug Fix - If, after hFromDate.Date is assigned from default, the date is less than zero then set hFromDate to blank.
      if ( hFromDate.Date < 0 ) then
         hFromDate.Clear;
      hToDate.Date := Date;
      //   01/06/12 [V5.0 R6.0] /MK Bug Fix - If UK Country And VetTreatments.ReportOn = 0 Then VetTreatmentsDefs.ReportOn := 2.
      if ( (WhichReg <> Ireland) and (VetTreatmentsDefs.ReportOn = 0) ) then
         VetTreatmentsDefs.ReportOn := 2;
      rgHealthCodes.ItemIndex := VetTreatmentsDefs.ReportOn;
   finally
      FreeAndNil(VetTreatmentsDefs);
   end;
end;

procedure THeatlthFilter.SaveScreenDefaults;
begin
   VetTreatmentsDefs := TVetTreatmentsDefaults.Create(cRD_VetTreatments);
   try
      VetTreatmentsDefs.SortField := SortByRadio.ItemIndex;
      VetTreatmentsDefs.SortOrder := OrderRadio.ItemIndex;
      VetTreatmentsDefs.DateInterval := Trunc(Date - hFromDate.Date);
      VetTreatmentsDefs.ReportOn := rgHealthCodes.ItemIndex;
   finally
      FreeAndNil(VetTreatmentsDefs);
   end;
end;

procedure THeatlthFilter.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure THeatlthFilter.cbFavouritePropertiesChange(Sender: TObject);

   procedure AddRemoveFavourite ( AAddRemove : Boolean; AReportConst : String );
   begin
      if AAddRemove then
         begin
            WinData.SetReportAsFavourite(AReportConst,True);
            cbFavourite.Style.TextColor := clBlue;
            cbFavourite.StyleHot.TextColor := clBlue;
         end
      else
         begin
            WinData.SetReportAsFavourite(AReportConst,False);
            cbFavourite.Style.TextColor := clBlack;
            cbFavourite.StyleHot.TextColor := clBlack;
         end;
      Application.ProcessMessages;
      Update;
   end;

begin
   if ( ReportType = rtMediFeedPurch ) then
      AddRemoveFavourite(cbFavourite.Checked, cVetFeedPurchRep)
   else if ( ReportType = rtMediTreat ) then
      AddRemoveFavourite(cbFavourite.Checked, cVetRegisterRep);
end;

procedure THeatlthFilter.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure THeatlthFilter.FormDestroy(Sender: TObject);
var
   X : Integer;
begin
   WinData.cxHint.HideHint;

   if ( ReportType = rtMediTreat ) then
      begin
         if ( HealthList <> nil ) then
            begin
               if HealthList.Active then
                  HealthList.Active := False;
               HealthList.Free;
            end;

         if ( SlHealthList <> nil )then
            begin
               for x := 0 to SlHealthList.Count-1 do
                  SlHealthList.Objects[x].Free;
               SlHealthList.Clear;
               SlHealthList.Free;
            end;

         //   03/07/18 [V5.8 R0.6] /MK Change - Only store defaults if country is NOT Ireland.
         if ( WhichReg <> Ireland ) then
            SaveScreenDefaults;
      end;
end;

procedure THeatlthFilter.sbViewClick(Sender: TObject);
var
   bCloseWarning : Boolean;
begin
   //   30/04/15 [V5.4 R5.3] /MK Additional Feature - Show warning screen before VetRegister is printed for Irish herds
   //                                                 if drugs that were treated do no have type specified.
   if ( pMedicalHealth.Visible ) then
      begin
         if ( WhichReg = Ireland ) then
            begin
               if ( FAnimalRemedyData.GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal > 0 ) then
                  begin
                     TfmMedNullGroupVetRegWarning.ShowTheForm(bCloseWarning);
                     if ( bCloseWarning ) then
                        ViewBtnClick(sbView);
                  end
               else
                  ViewBtnClick(sbView);
            end
         else
            ViewBtnClick(sbView);
      end
   else
      ViewBtnClick(sbView);
end;

procedure THeatlthFilter.DrawMedicineList;
begin
   if ( rgHealthCodes.ItemIndex <> cMedicineFilter ) then Exit;
   clHealthList.Items.Clear;
   with HealthList do
      try
         try
            SQL.Clear;
            SQL.Add('SELECT DISTINCT(M.ID), M.Name');
            SQL.Add('FROM Medicine M');
            SQL.Add('LEFT JOIN Health H ON (M.ID = H.DrugUsed)');
            SQL.Add('LEFT JOIN Events E ON (H.EventID = E.ID)');
            SQL.Add('WHERE ( (H.DrugUsed > 0) OR (H.DrugUsed IS NOT NULL) )');
            if (hFromDate.Date > 0) and (hToDate.Date > 0) then
               SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')')
            else if (hFromDate.Date > 0) and (hToDate.Date = 0) then
               SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('mm/dd/yyyy',Now) + '''' + ')')
            else if (hFromDate.Date = 0) and (hToDate.Date > 0) then
               SQL.Add('AND (E.EventDate BETWEEN ''12/31/1899'' AND ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')');
            SQL.Add('ORDER BY M.Name');
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  clHealthList.Items.AddObject(Fields[1].AsString,Pointer(Fields[0].AsInteger));
                  Next;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Close;
      end;
end;

procedure THeatlthFilter.DrawAdminCodeFilters;
begin
   if ( rgHealthCodes.ItemIndex <> cAdminByFilter ) then Exit;
   clHealthList.Items.Clear;
   with HealthList do
      try
         try
            SQL.Clear;
            SQL.Add('SELECT DISTINCT(MA.ID), MA.Name');
            SQL.Add('FROM MedAdmin MA');
            SQL.Add('LEFT JOIN Health H ON (MA.ID = H.AdminBy)');
            SQL.Add('LEFT JOIN Events E ON (H.EventID = E.ID)');
            SQL.Add('WHERE ( (H.AdminBy > 0) OR (H.AdminBy IS NOT NULL) )');
            if (hFromDate.Date > 0) and (hToDate.Date > 0) then
               SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')')
            else if (hFromDate.Date > 0) and (hToDate.Date = 0) then
               SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',hFromDate.Date) + '''' + ' AND ' + '''' + FormatDateTime('mm/dd/yyyy',Now) + '''' + ')')
            else if (hFromDate.Date = 0) and (hToDate.Date > 0) then
               SQL.Add('AND (E.EventDate BETWEEN ''12/31/1899'' AND ' + '''' + FormatDateTime('mm/dd/yyyy',hToDate.Date) + '''' + ')');
            SQL.Add('ORDER BY MA.Name');
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  clHealthList.Items.AddObject(Fields[1].AsString,Pointer(Fields[0].AsInteger));
                  Next;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Close;
      end;
end;

procedure THeatlthFilter.CreateFilterString(out AFilter: String;  AFilterType: TFilterType);
var
  FirstItem : Boolean;
  x : Integer;
begin
   AFilter := '(';
   FirstItem := True;
   for x := 0 to clHealthList.Items.Count-1 do
      begin
         if ( clHealthList.Checked[x] ) then
            begin
               if ( FirstItem ) then
                  begin
                     FirstItem := False;
                     if ( AFilterType = ftHealthCode ) then
                        AFilter := AFilter + IntToStr(THealthCodes(clHealthList.Items.Objects[x]).FID)
                     else
                        AFilter := AFilter + IntToStr(Integer(clHealthList.Items.Objects[x]));
                  end
               else
                  if ( AFilterType = ftHealthCode ) then
                     AFilter := AFilter + ',' + IntToStr(THealthCodes(clHealthList.Items.Objects[x]).FID)
                  else
                     AFilter := AFilter + ',' + IntToStr(Integer(clHealthList.Items.Objects[x]));
            end;
      end;
   AFilter := AFilter + ')';
end;

procedure THeatlthFilter.HToDatePropertiesEditValueChanged(
  Sender: TObject);
begin
   if ( Sender is TcxDateEdit ) then
      if ( (Sender as TcxDateEdit).Date > 0 ) then
         begin
            DrawHealthList(True);
            DrawHealthList(False);
            DrawMedicineList;
            DrawAdminCodeFilters;
         end;
end;

end.
