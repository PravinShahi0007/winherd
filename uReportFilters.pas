{
   17/09/12 [V5.0 R9.9] /MK Change - TfmFertilityTreatmentsReport - Added check for ReportType.

   03/04/18 [V5.7 R8.6] /MK Additional Feature - Added uSireAnalysis to this unit.

   04/04/18 [V5.7 R8.6] /MK Bug Fix - LoadGrid - Most Used list should be ordered by AmountUsed in desceding order - most used report first.

   02/11/20 [V5.9 R7.1] /MK Change - LoadGrid - Order favourites by the order in which it was added not the AmountUsed - GL request.

   04/11/20 [V5.9 R7.2] /MK Change - LoadGrid - Build the KeyReports from new string array const.

   03/08/21 [V6.0 R1.7] /MK Bug Fix - LoadGrid - Report Generators report type was not loading data into the grid.
}

unit uReportFilters;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, DairyData, GenTypesConst, db, dbTables,
  cxHyperLinkEdit, uHerdLookup, Def;

type
  TFilterType = ( ftNone, ftKeyReports, ftFavourites, ftMostUsed, ftReportGenerators );
  TfmReportFilters = class(TfmBaseForm)
    cxReportGrid: TcxGrid;
    cxReportGridLevel: TcxGridLevel;
    cxReportGridView: TcxGridTableView;
    cxReportGridViewReportName: TcxGridColumn;
    procedure FormDestroy(Sender: TObject);
    procedure cxReportGridViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    qReports : TQuery;
    FHerdID : Integer;
    FHerdType : THerdType;
    FCountry : TCountry;
    procedure LoadGrid;
    { Private declarations }
  public
    class procedure ShowTheForm ( FilterType : TFilterType ) ;
    { Public declarations }
  end;

var
  fmReportFilters: TfmReportFilters;
  ReportFilterType : TFilterType;

implementation

uses
  CowRepFilt, StockInHerdFilt, uHerdRec,
  uTagReplacementForm, uLivestockSum, uFertIndicesRpt,
  uFertilityBenchmarking, uReproductiveSummaryInterface, SaleEligibility,
  uRestrictAnimals, uTBTestDtRep, LiveStkClass,
  uNutrientProductionProjectionRptScr,
  uNINutrientProductionProjectionRptScr, HealthFilterU,
  SCCAnalysis,
  AnimalWaste, uMedicineSetUp, uFertilityTreatmentsReport,
  ActionReminderFilt, uDueToBeCulled, uCAFREFertListData, uActiv,
  uDairyHerdHealthCert, BullReportsFilt, uWeighingFilt, MenuUnit,
  BreedingAnalysisFilt, uMilkDiskReview, uMilkRecSysScr, uDailyYieldGraph,
  uRationPerformMonitor, uHeatServiceFilt, uSalesReport, uStockValuations,
  uPurchGrpRep, uQuotaMan, uHerdBrochureFlt, uSalesCatalogueFlt,
  // 15/04/12 - From These Units On The Favourite CheckBox Needs To Be Added To The Unit.
  uFertTreatmentsReview, FertAnalysisRpt, uAccsReps, uPedUpgradeReport,
  uHFSCalfReg, BrowseRegisterU, uUKSireRegister, uBeefProfitMonitor,
  uBeefAISireRegister, uConformationGradeAnalysis, uBeefSalesCatalogue,
  uFertilityCheckReport, uSireAnalysis, uSireAnalysisFilter;

{$R *.DFM}

{ TfmReportFilters }

class procedure TfmReportFilters.ShowTheForm(FilterType: TFilterType);

   procedure AddAsDefaultReportType ( AReportFilterType : String ) ;
   var
      qAddDefaultReportFilterType : TQuery;
   begin
      qAddDefaultReportFilterType := TQuery.Create(nil);
      with qAddDefaultReportFilterType do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE Defaults');
            SQL.Add('SET DefaultReportFilter = :AReportFilterType');
            Params[0].AsString := AReportFilterType;
            Prepare;
            ExecSQL;
         finally
            Free;
         end;
   end;

begin
   Application.CreateForm( TfmReportFilters, fmReportFilters );
   with fmReportFilters do
      try
         ReportFilterType := FilterType;

         if ( ReportFilterType = ftKeyReports ) then
            begin
               AddAsDefaultReportType(cKeyReports);
            end
         else if ( ReportFilterType = ftFavourites ) then
            begin
               if WinData.RepFavouritesOrMostUsedExist(cFavourites) then
                  AddAsDefaultReportType(cFavourites)
               else
                  begin
                     AddAsDefaultReportType('<None>');
                     Exit;
                  end
            end
         else if ( ReportFilterType = ftMostUsed ) then
            begin
               if WinData.RepFavouritesOrMostUsedExist(cMostUsed) then
                  AddAsDefaultReportType(cMostUsed)
               else
                  begin
                     AddAsDefaultReportType('<None>');
                     Exit;
                  end
            end
         //   16/05/12 [V5.0 R5.7] /MK Additional Feature - Set ReportGen ReportType.
         else if ( ReportFilterType = ftReportGenerators ) then
            begin
               AddAsDefaultReportType(cReportGenerators);
            end;

         if ( ReportFilterType in [ftKeyReports,ftFavourites,ftMostUsed,ftReportGenerators] ) then
            ShowModal;

      finally
         //   06/06/12 [V5.0 R7.0] /MK Additional Feature - Using Free And Nil Instead Of Just Free.

         FreeAndNil(fmReportFilters);
      end;
end;

procedure TfmReportFilters.LoadGrid;
var
  i : Integer;
  saReportGens : array of String;
begin
   qReports := TQuery.Create(nil);
   with qReports do
      begin
         DatabaseName := AliasName;
         Close;
         SQL.Clear;
         SQL.Add('SELECT R.ID, R.ReportName, R.AmountUsed, R.SortID');
         SQL.Add('FROM Reports R');

         if ( ReportFilterType = ftKeyReports ) then
            begin
               SQL.Add('WHERE R.KeyReport = True');
               SQL.Add('ORDER BY R.SortID');
            end
         else if ( ReportFilterType = ftFavourites ) then
            begin
               SQL.Add('WHERE R.Favourite = True');
               //   02/11/20 [V5.9 R7.1] /MK Change - Order favourites by the order in which it was added not the AmountUsed - GL request.
               SQL.Add('ORDER BY R.ID');
            end
         else if ( ReportFilterType = ftReportGenerators ) then
            begin
               SQL.Add('WHERE R.ReportGenerator = True');
               SQL.Add('ORDER BY R.SortID');
            end
         else if ( ReportFilterType = ftMostUsed ) then
            begin
               SQL.Add('WHERE R.AmountUsed > 0');
               //   04/04/18 [V5.7 R8.6] /MK Bug Fix - Most Used list should be ordered by AmountUsed in desceding order - most used report first.
               SQL.Add('ORDER BY R.AmountUsed DESC');
            end;

         Open;
      end;

   qReports.First;
   if ( ReportFilterType = ftMostUsed ) then
      begin
         cxReportGridView.DataController.RecordCount := 0;
         cxReportGridView.DataController.RecordCount := 10;
         if qReports.RecordCount <= 10  then
            begin
               for i := 0 to qReports.RecordCount -1 do
                  begin
                     cxReportGridView.DataController.Values[i,0] := qReports.FieldByName('ReportName').AsString;
                     qReports.Next;
                  end;
            end
         else
            begin
               for i := 0 to 9 do
                  begin
                     cxReportGridView.DataController.Values[i,0] := qReports.FieldByName('ReportName').AsString;
                     qReports.Next;
                  end;
            end;
      end
   //   03/08/21 [V6.0 R1.7] /MK Bug Fix - Report Generators report type was not loading data into the grid.
   else if ( ReportFilterType in [ftFavourites, ftReportGenerators] ) then
      begin
         if ( qReports.RecordCount > 0 ) then
            begin
               cxReportGridView.DataController.RecordCount := 0;
               cxReportGridView.DataController.RecordCount := qReports.RecordCount;
               for i := 0 to qReports.RecordCount -1 do
                  begin
                     cxReportGridView.DataController.Values[i,0] := qReports.FieldByName('ReportName').AsString;
                     qReports.Next;
                  end;
            end;
      end
   //   04/11/20 [V5.9 R7.2] /MK Change - Build the KeyReports from new string array const.
   else if ( ReportFilterType = ftKeyReports ) then
      begin
         cxReportGridView.DataController.RecordCount := 0;
         cxReportGridView.DataController.RecordCount := Length(KeyReportsArray);
         for i := 0 to Length(KeyReportsArray)-1 do
            begin
               if ( FHerdType = htBeef ) then
                  begin
                     if ( KeyReportsArray[i] = 'Breeding Chart' ) or
                        ( KeyReportsArray[i] = 'Herd Fertility (Seasonal Calving)' ) or
                        ( KeyReportsArray[i] = 'Best Cows In Herd' ) or
                        ( KeyReportsArray[i] = 'Monthly Milk Recordings' ) then Continue;
                  end;
               cxReportGridView.DataController.Values[i,0] := KeyReportsArray[i];
               qReports.Next;
            end;
      end;
end;

procedure TfmReportFilters.FormDestroy(Sender: TObject);
begin
   inherited;
   if (qReports <> nil) then
      begin
         qReports.Close;
         FreeAndNil(qReports);
      end;

   WinData.Reports.Active := False;
end;

procedure TfmReportFilters.cxReportGridViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   CallSetupQuery : Boolean;
   ReportName : Variant;
   iSireAnalysisStartYear : Integer;
begin
  inherited;

   // Check For What Report To Preview Based On Report Name Const.
   ReportName := cxReportGridView.DataController.Values[cxReportGridView.DataController.FocusedRecordIndex,0];
   if VarIsNull(ReportName) then Exit;

   if ( ReportName = cBovineHerdRegRep ) then
      WinData.CreateAndShowForm(TCowRepfilter)
   else if ( ReportName = cStockOnHandRep ) then
      StockInHerdFilt.ShowForm( StockOnHand )
   else if ( ReportName = cCMMSRecRep ) then
      //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
      uHerdRec.CreateAndShow(FHerdID, False, False)
   else if ( ReportName = cPurchSalesAnalysisRep ) then
      StockInHerdFilt.ShowForm( PurchSales )
   else if ( ReportName = cTagReplaceRep ) then
      //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
      TfmTagReplacementForm.Execute(False)
   else if ( ReportName = cConfGradAnalysisRep ) then
      TfmConformationGradeAnalysis.Show
   else if ( ReportName = cLivestockInvRep ) then
      uLivestockSum.ShowTheForm(rtLSInventory, nil, cLivestockInvRep )
   else if ( ReportName = cRepsRep ) then
      uLivestockSum.ShowTheForm(rtREPS, nil, cRepsRep )
   else if ( ReportName = cProfitMonSumRep ) then
      begin
         if FHerdType = htDairy then
            LiveStkClass.RunReport(FHerdID)
         else
            TfmBeefProfitMonitor.Execute(FHerdID);
      end
   else if ( ReportName = cNutrientProdRep ) then
      begin
         if FCountry = Ireland then
            TfmNutrientProductionProjectionRptScr.ShowForm
         else
            TfmNINutrientProductionProjectionRptScr.ShowForm;
      end
   else if ( ReportName = cVetRegisterRep ) then
      begin
         try
            HealthFilterU.ReportType := rtMediTreat;
            Application.CreateForm(THeatlthFilter, HeatlthFilter);
            HeatlthFilter.ShowModal;
         finally
            HeatlthFilter.Free;
         end;
      end
   else if ( ReportName = cVetFeedPurchRep ) then
      begin
         try
            HealthFilterU.ReportType := rtMediFeedPurch;
            Application.CreateForm(THeatlthFilter, HeatlthFilter);
            HeatlthFilter.ShowModal;
         finally
            HeatlthFilter.Free;
         end;
      end
   else if ( ReportName = cSCCCurLactAnalysisRep ) then
      SCCAnalysis.ShowForm
   else if ( ReportName = cSalesPlannerRep ) then
      SaleEligibility.CreateAndShow(rtSalesPlanner)
   else if ( ReportName = cRestrictAnimalRep ) then
      WinData.CreateAndShowForm(TfRestrictAnimals)
   else if ( ReportName = cDiseaseTestRep ) then
      uTBTestDtRep.ShowTheForm
   else if ( ReportName = cVetDueToListRep ) then
      TfmFertilityTreatmentsReport.ShowReportScreen(retHealth)
   else if ( ReportName = cMedStockRep ) then
      uMedicineSetUp.ShowTheForm(0, True)
   else if ( ReportName = cVetRepGenRep ) then
      WinData.CallProg.ReportGenerator(rgmHealth)
   else if ( ReportName = cProfMonRepsRep ) then
      WinData.CreateAndShowForm(TfmAccsReps)
   else if ( ReportName = cBreedingChartRep ) then
      uHeatServiceFilt.ShowTheForm
   else if ( ReportName = cActWarnRemRep ) then
      WinData.CreateAndShowForm( TfmCAFREFertListData )
   else if ( ReportName = cBullRep ) then
      BullReportsFilt.ShowForm(2)
   else if ( ReportName = cSireAnalysis ) then
      begin
         iSireAnalysisStartYear := TfmSireAnalysisFilter.GetWeightGainCalcYear;
         if ( iSireAnalysisStartYear > 0 ) then
            TfmSireAnalysis.ShowTheForm(iSireAnalysisStartYear);
      end
   else if ( ReportName = cDairyHerdHealthCertRep ) then
      WinData.CreateAndShowForm(TDairyHerdHealthCert)
   else if ( ReportName = cWeighRep ) then
      uWeighingFilt.ShowTheForm(wrtWeightGain)
   else if ( ReportName = cRecentActListRep ) then
      uActiv.ShowForm
   else if ( ReportName = cHerdRepGenRep ) then
      WinData.CallProg.ReportGenerator(rgmHerd)
   else if ( ReportName = cCalfPerfGenRep ) then
      WinData.CallProg.ReportGenerator(rgmCalfPerformance)
   else if ( ReportName = cCattleMargRep ) then
      uSalesReport.ShowTheForm
   else if ( ReportName = cLivestockValRep ) then
      TfmStockValuationReport.ShowStockValuationReport
   else if ( ReportName = cBeefPurchGrpRep ) then
      TfPurchGrpRep.ShowTheForm
   else if ( ReportName = cBrowseSireRegRep ) then
      begin
         CallSetupQuery := False;
         if WinData.SystemRegisteredCountry = Ireland then
            begin
               if HerdLookup.GetHerdTypeAsString(FHerdID) = cDairyHerd then
                  begin
                     CallSetupQuery := True;
                     WinData.CreateAndShowForm(TBrowseSireRegister)
                  end
               else
                  TfmBeefAISireRegister.execute(TfmBeefAISireRegister,CallSetupQuery);
            end
         else
            TfmUKSireRegister.execute(TfmUKSireRegister,CallSetupQuery);
      end
   else if ( ReportName = cSireSelectRep ) then
      BullReportsFilt.ShowForm(1)
   else if ( ReportName = cIndCowFertRep ) then
      FertAnalysisRpt.ShowTheForm
   else if ( ReportName = cMilkQuotaPlanRep ) then
      uQuotaMan.ShowForm
   else if ( ReportName = cFertCheckRep ) then
      TfmFertilityCheckReport.ShowReport
   else if ( ReportName = cFertRepGenRep ) then
      WinData.CallProg.ReportGenerator(rgmCowFertility)
   else if ( ReportName = cBestCowsInHerdRep ) then
      BreedingAnalysisFilt.ShowForm
   else if ( ReportName = cMonthRecReviewRep ) then
      uMilkDiskReview.CreateAndShow
   else if ( ReportName = cMonthSumAnalysisRep ) then
      WinData.CreateAndShowForm(TfMilkRecSysScr)
   else if ( ReportName = cMilkProdGraphRep ) then
      uDailyYieldGraph.ShowForm
   else if ( ReportName = cDairyBenchRep ) then
      begin
         with TRationPerformMonitor.Create(nil) do
            try
               ShowModal;
            finally
               Free;
            end;
      end
   else if ( ReportName = cMilkPerfGenRep ) then
      WinData.CallProg.ReportGenerator(rgmMilkPerformance)
   else if ( ReportName = cHUKIRegRep ) then
      uHFSCalfReg.ShowForm
   else if ( ReportName = cHerdBrochRep ) then
      uHerdBrochureFlt.ShowForm
   else if ( ReportName = cSalesCatRep ) then
      begin
         if FHerdType = htDairy then
            uSalesCatalogueFlt.ShowForm
         else
            TfmBeefSalesCatalogue.execute(TfmBeefSalesCatalogue);
      end
   else if ( ReportName = cPedRepGenRep ) then
      WinData.CallProg.ReportGenerator(rgmPedigree)
   else if ( ReportName = cDueToCalveRep ) then
      begin
         ActionReminderFilter := TActionReminderFilter.Create(nil);
         try
            ActionReminderFilter.pDueForDryingOff.Hide;
            ActionReminderFilter.pDueFirstService.Hide;
            ActionReminderFilter.pDueToPD.Hide;
            ActionReminderFilter.pDueToCalve.Show;
            ActionReminderFilter.Caption := 'Due To Calve';
            ActionReminderFilter.ShowModal;
         finally
            ActionReminderFilter.Free;
         end;
      end
   else if ( ReportName = cDueToDryRep ) then
      begin
         ActionReminderFilter := TActionReminderFilter.Create(nil);
         try
            ActionReminderFilter.pDueForDryingOff.Show;
            ActionReminderFilter.pDueFirstService.Hide;
            ActionReminderFilter.pDueToPD.Hide;
            ActionReminderFilter.pDueToCalve.Hide;
            ActionReminderFilter.Caption := 'Due For Drying Off';
            ActionReminderFilter.ShowModal;
         finally
            ActionReminderFilter.Free;
         end;
      end
   else if ( ReportName = cDueToServeRep ) then
      begin
         ActionReminderFilter := TActionReminderFilter.Create(nil);
         try
            ActionReminderFilter.pDueForDryingOff.Hide;
            ActionReminderFilter.pDueFirstService.Show;
            ActionReminderFilter.pDueToPD.Hide;
            ActionReminderFilter.pDueToCalve.Hide;
            ActionReminderFilter.Caption := 'Due Service';
            ActionReminderFilter.ShowModal;
         finally
            ActionReminderFilter.Free;
         end;
      end
   else if ( ReportName = cDueToPDRep ) then
      begin
         ActionReminderFilter := TActionReminderFilter.Create(nil);
         try
            ActionReminderFilter.pDueForDryingOff.Hide;
            ActionReminderFilter.pDueFirstService.Hide;
            ActionReminderFilter.pDueToPD.Show;
            ActionReminderFilter.pDueToCalve.Hide;
            ActionReminderFilter.Caption := 'Due Pregnancy Diagnosis';
            ActionReminderFilter.ShowModal;
         finally
            ActionReminderFilter.Free;
         end;
      end
   else if ( ReportName = cDueToBeCullRep ) then
      uDueToBeCulled.ShowForm
   else if ( ReportName = cFQASRep ) then
      SaleEligibility.CreateAndShow(rtFQAS)
   else if ( ReportName = cNonFQASRep ) then
      SaleEligibility.CreateAndShow(rtNonFQAS)
   else if ( ReportName = c30Month10DayRep ) then
      SaleEligibility.CreateAndShow(rt30mth10Day)
   else if ( ReportName = c30Month30DayRep ) then
      SaleEligibility.CreateAndShow(rt30mth30Day)
   else if ( ReportName = cSeasonCalvHerdRep ) then
      TfFertIndicesRpt.ShowTheForm
   else if ( ReportName = cSpreadCalvHerdRep ) then
      // No Favourite For This Report As Only QuickReport Shows OnClick.
      PreviewReproductiveSummary
   else if ( ReportName = cDARDDairyFertBenchRep ) then
      TfmFertilityBenchmarking.Show
   else if ( ReportName = cIHFAUpgRep ) then
      begin
         Application.CreateForm(TfmPedUpgradeReport, fmPedUpgradeReport);
         try
            fmPedUpgradeReport.ShowModal;
         finally
            if fmPedUpgradeReport <> nil then
               FreeAndNil(fmPedUpgradeReport);
         end
      end
   else if ( ReportName = cFertTreatChartRep ) then
      TfmFertTreatmentsReview.Execute
   else if ( ReportName = cLatestWeighingRep ) then
      uWeighingFilt.ShowTheForm(wrtLatest)
   else if ( ReportName = cWeightGainRep ) then
      uWeighingFilt.ShowTheForm(wrtWeightGain)
   else if ( ReportName = cMultipleWeighingRep ) then
      uWeighingFilt.ShowTheForm(wrtMultipleWeighings);

   cxReportGridView.OnFocusedRecordChanged := nil;
   LoadGrid;
   cxReportGridView.OnFocusedRecordChanged := cxReportGridViewFocusedRecordChanged;
end;

procedure TfmReportFilters.FormShow(Sender: TObject);
begin
  inherited;
  FHerdID := WinData.UserDefaultHerdID;
  FHerdType := HerdLookup.GetHerdType(FHerdID);
  FCountry  := WinData.DefCountry(FHerdID);

  if ( ReportFilterType = ftKeyReports ) then
     fmReportFilters.Caption := cKeyReports
  else if ( ReportFilterType = ftFavourites ) then
     fmReportFilters.Caption := cFavourites
  else if ( ReportFilterType = ftMostUsed ) then
     fmReportFilters.Caption := cMostUsed
  else if ( ReportFilterType = ftReportGenerators ) then
     fmReportFilters.Caption := cReportGenerators;

  LoadGrid;
end;

procedure TfmReportFilters.FormCreate(Sender: TObject);
begin
  inherited;
  WinData.Reports.Active := True;
end;

end.
