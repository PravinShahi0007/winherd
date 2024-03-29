{
   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   23/08/19 [V5.9 R0.1] /MK Change - Default From Date to 01/01/ of the current year - GL request.
                                   - Change Form Caption and Report Title to "Milk / Feed Performance" - GL request.
                                   - Hide Filter button as its not relevant to this report - GL request.
}

unit uRationPerformMonitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, RXCtrls,
  ComCtrls, ToolWin, QuickRpt, db, dbtables, QRCtrls, QRExport, cxControls,
  cxContainer, cxEdit, cxCheckBox, DateUtil;

type
  TRationPerformMonitor = class(TReportsBaseForm)
    lAvgDailyYieldCpt: TQRLabel;
    lAvgDailyProteinCpt: TQRLabel;
    lTotalCowsCpt: TQRLabel;
    lTotalCows: TQRLabel;
    lAvgDailyYield: TQRLabel;
    lAvgDailyProtein: TQRLabel;
    lAvgDailyBFatCpt: TQRLabel;
    lAvgDailyBFat: TQRLabel;
    lAvgCumYieldCpt: TQRLabel;
    lCumProtPercCpt: TQRLabel;
    lAvgCumYield: TQRLabel;
    lAvgCumProtPerc: TQRLabel;
    lAvgCumBfatPercCpt: TQRLabel;
    lAvgCumBfatPerc: TQRLabel;
    lPregRateToFirstServiceCpt: TQRLabel;
    lPregRateToFirstService: TQRLabel;
    QRLabel2: TQRLabel;
    lCowsCulledForInfertCpt: TQRLabel;
    lCowsCulledForInfert: TQRLabel;
    lTotalCowsCulledCpt: TQRLabel;
    lTotalCowsCulled: TQRLabel;
    lHomeGrownFeedPercCpt: TQRLabel;
    lHomeGrownFeedPerc: TQRLabel;
    lCowsInMilkCpt: TQRLabel;
    lCowsInMilk: TQRLabel;
    lAvgLactDaysCpt: TQRLabel;
    lAvgLactDays: TQRLabel;
    lAvgFeedCostPerTonneCpt: TQRLabel;
    lAvgFeedCostPerTonne: TQRLabel;
    lTotalFeedCostPerKgCpt: TQRLabel;
    lTotalFeedCostPerKg: TQRLabel;
    lConcentrateFedPerLactCpt: TQRLabel;
    lConcentrateFedPerLact: TQRLabel;
    lConcentrateFedAnimalDayCpt: TQRLabel;
    lConcentrateFedAnimalDay: TQRLabel;
    lConcentrateFedDryCowCpt: TQRLabel;
    lConcentrateFedDryCow: TQRLabel;
    cbFavourite: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lAvgDailyYieldPrint(sender: TObject; var Value: String);
    procedure lAvgDailyBFatPrint(sender: TObject; var Value: String);
    procedure lAvgFeedCostPerTonnePrint(sender: TObject;
      var Value: String);
    procedure lConcentrateFedPerLactPrint(sender: TObject;
      var Value: String);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SetCowCount(const Value: Integer);
    function GetCowCount: Integer;
    procedure GetMilkDetails;
  private
    { Private declarations }
    CowTable : TTable;
    GenQuery : TQuery;
    AvgDailyYield,
    AvgDailyBFatPerc,
    AvgDailyProtPerc,
    AvgCumYield,
    AvgCumBFatPerc,
    AvgCumProtPerc,
    PregRateToFirstPreg,
    CulledCowsInfert,
    CulledCowsPerc,
    HomeGrownFeedPerc : Double;
    CowsInMilk : Integer;
    AvgLactDays : Integer;
    AvgFeedCostPerTonne : Double;
    TotalFeedCostPerKg : Double;
    CowFedKgDay : Double;
    DryCowFedKgDay : Double;
    TotalCowQuantityKg : Double;
    TotalDryCowQuantityKg : Double;
    TotalFedPerLact : Double;

    procedure getCows;
    procedure InitializeDB;
    procedure ResetReportVariables;
    procedure OutputReportVariables;
    procedure CalcMilk;
    procedure CalcFertility;
    procedure CalcCulled;
    procedure CalcFeeds;
    procedure CalcCowsInMilk;
    property CowCount : Integer read GetCowCount write SetCowCount;
  public
    { Public declarations }
  end;

var
  RationPerformMonitor: TRationPerformMonitor;

implementation

uses DairyData, GenTypesConst, KRoutines, KDBRoutines;

{$R *.DFM}

procedure TRationPerformMonitor.FormCreate(Sender: TObject);
begin
  inherited;
  BaseReport.Hide;
  InitializeDB;
  WinData.CanShowStandardReportHint := True;
end;

procedure TRationPerformMonitor.sbViewClick(Sender: TObject);
begin
  inherited;
  WinData.cxHint.HideHint;
  WinData.CanShowStandardReportHint := False;

  EnableViewPrintButtons(False);
  InitProgress(0, 140, 10, 'Please wait...');
  try
     ResetReportVariables;
     getCows;
     GetMilkDetails;
     CalcFertility;
     CalcCulled;
     CalcFeeds;
     CalcCowsInMilk;
     OutputReportVariables;
     if ( Sender as TRxSpeedButton ).Name = 'sbView' then
       BaseReport.preview
     else
       BaseReport.print;
   finally
      ResetProgress;
      inherited;
      EnableViewPrintButtons(True);
   end;
end;

procedure TRationPerformMonitor.InitializeDB;
begin
   CowTable := TTable.Create(nil);
   with CowTable do
      begin
         DatabaseName := cDatabaseName;
         TableName := 'rpmaids';
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Add('ID', ftAutoInc);
               Add('AnimalID', ftInteger);
               Add('LactNo', ftInteger);
               Add('DryCow', ftBoolean);
               Add('LastCalvingDate', ftDate);
               Add('LastDryDate', ftDate);
            end;

         with IndexDefs do
            begin
               Add('iID', 'ID', [ixPrimary, ixUnique]);
               Add('iAnimalID', 'AnimalID', [ixUnique]);
               Add('iLactNo', 'LactNo', [ixCaseInSensitive]);
               Add('iDryCow', 'DryCow', [ixCaseInSensitive]);
               Add('iCalvingDate', 'LastCalvingDate', [ixCaseInSensitive]);
               Add('iDryDate', 'LastDryDate', [ixCaseInSensitive]);
            end;
         CreateTable;
         Open;
      end;

   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName := cDatabaseName;
end;

procedure TRationPerformMonitor.SetCowCount(const Value: Integer);
begin
   CowCount := Value;
end;

function TRationPerformMonitor.GetCowCount: Integer;
begin
   Result := 0;
   if ( CowTable <> nil ) and ( CowTable.active ) then
      begin
         CowTable.Refresh;
         Result := CowTable.RecordCount;
      end;
end;

procedure TRationPerformMonitor.FormDestroy(Sender: TObject);
begin
  inherited;
  WinData.cxHint.HideHint;
  if CowTable <> nil then
     begin
        CowTable.Close;
        if CowTable.Exists then
           CowTable.DeleteTable;
        FreeAndNil(CowTable);
     end;

  if GenQuery <> nil then
     begin
        if GenQuery.Active then
           GenQuery.Active := False;
        FreeAndNil(GenQuery);
     end;
  WinData.CheckEvents.Filter := '';
  WinData.CheckEvents.Filtered := False;
end;

procedure TRationPerformMonitor.getCows;
begin
   with GenQuery do
      begin
         // Clear CowTable first.
         SQL.Clear;
         SQL.Add('DELETE FROM '+CowTable.TableName);
         ExecSQL;

         // Insert all cows in the database or those that are in the filter.
         SQL.Clear;
         SQL.Add('INSERT INTO ' + CowTable.TableName + ' (AnimalID, LactNo, DryCow) ');
         SQL.Add('SELECT DISTINCT (A.ID), A.LactNo, FALSE  FROM Animals A ');
         SQL.Add('WHERE (UPPER(A.Sex) = "FEMALE")');
         SQL.Add('AND (A.LactNo > 0)');
         SQL.Add('AND (A.AnimalDeleted=FALSE)');
         SQL.Add('AND (A.HerdID=:AHerdID)');
         SQL.Add('AND (A.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle, ToDate.Date) + '''' + ')');
         Params[0].AsInteger := HerdID;
         ExecSQL;

         StepProgress(10);

         // Exclude based on Purchases
         SQL.Clear;
         SQL.Add('DELETE FROM ' + CowTable.TableName + ' ');
         SQL.Add('WHERE AnimalID IN (');
         SQL.Add(' SELECT E.AnimalID FROM Events E ');
         SQL.Add(' WHERE ( E.EventType = 12 )      ');
         SQL.Add(' AND ( E.EventDate > ' + '''' + FormatDateTime(cUSDateStyle, ToDate.Date) + '''' + '))');
         ExecSQL;
         StepProgress(10);

         // Exclude based on Sales/Deaths
         SQL.Clear;
         SQL.Add('DELETE FROM ' + CowTable.TableName + ' ');
         SQL.Add('WHERE AnimalID IN (');
         SQL.Add(' SELECT E.AnimalID FROM Events E ');
         SQL.Add(' WHERE ( E.EventType = 11 )      ');
         SQL.Add(' AND ( E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle, FromDate.Date) + '''' + '))');
         ExecSQL;
         StepProgress(10);
      end;

   with Cowtable do
      begin
         Refresh;
         try
            First;
            while not(eof) do
              begin
                 Application.ProcessMessages;
                 Edit;
                 FieldByName('LastCalvingDate').AsDateTime := WinData.EventDataHelper.GetLastEventDate(FieldByName('AnimalID').AsInteger, FieldByName('LactNo').AsInteger, cCalvingEvent);
                 FieldByName('LastDryDate').AsDateTime := WinData.EventDataHelper.GetLastEventDate(FieldByName('AnimalID').AsInteger, FieldByName('LactNo').AsInteger, cDryOffEvent);
                 Post;
                 Next;
              end;
         finally
            Refresh;
         end;
      end;
   StepProgress(10);
   Application.ProcessMessages;
end;

procedure TRationPerformMonitor.ResetReportVariables;
begin
   AvgDailyYield := 0;
   AvgDailyBFatPerc := 0;
   AvgDailyProtPerc := 0;
   AvgCumYield := 0;
   AvgCumBFatPerc := 0;
   AvgCumProtPerc := 0;
   PregRateToFirstPreg := 0;
   CulledCowsInfert := 0;
   CulledCowsPerc := 0;
   HomeGrownFeedPerc := 0;
   CowsInMilk := 0;
   AvgLactDays := 0;
   AvgFeedCostPerTonne := 0;
   TotalFeedCostPerKg := 0;
   TotalCowQuantityKg := 0;
   TotalDryCowQuantityKg := 0;
   TotalFedPerLact := 0;
end;

procedure TRationPerformMonitor.OutputReportVariables;
begin
   lTotalCows.Caption := IntToStr(CowCount);
   lAvgDailyYield.Caption := FloatToStrF(AvgDailyYield, ffFixed, 8, 2);
   lAvgDailyBFat.Caption := FloatToStrF(AvgDailyBFatPerc, ffFixed, 8, 2);
   lAvgDailyProtein.Caption := FloatToStrF(AvgDailyProtPerc, ffFixed, 8, 2);
   lAvgCumYield.Caption := FloatToStrF(AvgCumYield, ffFixed, 8, 2);
   lAvgCumBfatPerc.Caption := FloatToStrF(AvgCumBFatPerc, ffFixed, 8, 2);
   lAvgCumProtPerc.Caption := FloatToStrF(AvgCumProtPerc, ffFixed, 8, 2);
   lPregRateToFirstService.Caption := FloatToStrF(PregRateToFirstPreg, ffFixed, 8, 2);
   lCowsCulledForInfert.Caption := FloatToStrF(CulledCowsInfert, ffFixed, 8, 2);
   lTotalCowsCulled.Caption := FloatToStrF(CulledCowsPerc, ffFixed, 8, 2);
   lHomeGrownFeedPerc.Caption := FloatToStrF(HomeGrownFeedPerc, ffFixed, 8, 2);
   lCowsInMilk.Caption := IntToStr( CowsInMilk );
   lAvgLactDays.Caption := IntToStr ( AvgLactDays );
   lAvgFeedCostPerTonne.Caption :=  FloatToStrF(AvgFeedCostPerTonne, ffFixed, 8, 2);
   lTotalFeedCostPerKg.Caption := FloatToStr(TotalFeedCostPerKg);
   try
      lConcentrateFedPerLact.Caption := FloatToStrF( TotalFedPerLact / 1000, ffFixed, 8, 2);
   except
      lConcentrateFedPerLact.Caption := '';
   end;
   lConcentrateFedAnimalDay.Caption := FloatToStr( TotalCowQuantityKg );
   lConcentrateFedDryCow.Caption := FloatToStr( TotalDryCowQuantityKg );
   qrlHerdIdentity.Caption := HerdIdentity;
end;

procedure TRationPerformMonitor.GetMilkDetails;
const
   MilkDataSQL = 'SELECT DISTINCT AVG(%s) %s FROM MilkDiskTrans M '+
                 'WHERE M.AnimalID IN (SELECT AnimalID FROM rpmaids ) ' +
                 'AND M.DateOfRecording BETWEEN :AFromDate AND :AToDate ' +
                 'AND ( %s > 0 ) ';
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add(Format(MilkDataSQL, [ 'DailyYield', 'AvgDY', 'DailyYield']));
         Params[0].AsDateTime := FromDate.Date;
         Params[1].AsDateTime := ToDate.Date;
         Open;
         try
            First;
            AvgDailyYield := FieldByName('AvgDY').AsFloat;
         finally
            Close;
         end;
      end;
   StepProgress(10);

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add(Format(MilkDataSQL, ['CumYield', 'AvgCumYield', 'CumYield']));
         Params[0].AsDateTime := FromDate.Date;
         Params[1].AsDateTime := ToDate.Date;
         Open;
         try
            First;
            AvgCumYield := FieldByName('AvgCumYield').AsFloat;
         finally
            Close;
         end;
      end;
   StepProgress(10);

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add(Format(MilkDataSQL, ['DailyBFatPerc', 'AvgDailyBFatPerc', 'DailyBFatPerc']));
         Params[0].AsDateTime := FromDate.Date;
         Params[1].AsDateTime := ToDate.Date;
         Open;
         try
            First;
            AvgDailyBFatPerc := FieldByName('AvgDailyBFatPerc').AsFloat;
         finally
            Close;
         end;
      end;
   StepProgress(10);

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add(Format(MilkDataSQL, [ 'CumBFatPerc', 'AvgCumBFatPerc', 'CumBFatPerc']));
         Params[0].AsDateTime := FromDate.Date;
         Params[1].AsDateTime := ToDate.Date;
         Open;
         try
            First;
            AvgCumBFatPerc := FieldByName('AvgCumBFatPerc').AsFloat;
         finally
            Close;
         end;
      end;
   StepProgress(10);

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add(Format(MilkDataSQL, [ 'DailyProtPerc', 'AvgProtPerc', 'DailyProtPerc']));
         Params[0].AsDateTime := FromDate.Date;
         Params[1].AsDateTime := ToDate.Date;
         Open;
         try
            First;
            AvgDailyProtPerc := FieldByName('AvgProtPerc').AsFloat;
         finally
            Close;
         end;
      end;
   StepProgress(10);

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add(Format(MilkDataSQL, [ 'CumProtPerc', 'AvgCumProtPerc', 'CumProtPerc']));
         Params[0].AsDateTime := FromDate.Date;
         Params[1].AsDateTime := ToDate.Date;
         Open;
         try
            First;
            AvgCumProtPerc := FieldByName('AvgCumProtPerc').AsFloat;
         finally
            Close;
         end;
      end;
   StepProgress(10);
end;

procedure TRationPerformMonitor.lAvgDailyYieldPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Trim(Value) <> '' then
     Value := Value + ' Kg';
end;

procedure TRationPerformMonitor.lAvgDailyBFatPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Trim(Value) <> '' then
     Value := Value + '%';
end;

procedure TRationPerformMonitor.CalcFertility;
const
   sEventFilter = '(AnimalID = %d) And (AnimalLactNo = %d) And (EventType = %d)';
var
   NoServedCows: Integer;
   NoCowsPregFirst : integer;
   LactDays : Integer;
   LactCows : Integer;
begin
   WinData.ClearEventFilter;

   with GenQuery do
      begin

         { Calc Num cows served. this total is taken from all cows served
           in current lactation stored in CowTable. then all services between today - 12 months }
         SQL.Clear;
         SQL.Add('SELECT COUNT(DISTINCT C.AnimalID) NoCowsServed FROM ' + CowTable.TableName + ' C, Events E');
         SQL.Add('WHERE (C.AnimalID=E.AnimalID)');
         SQL.Add('AND   (C.LactNo=E.AnimalLactNo)');
         SQL.Add('AND   (E.EventType = ' + IntToStr(cServiceEvent) + ')');
         SQL.Add('AND   (E.EventDate BETWEEN :AFromDate AND :AToDate ) ');
         ParamByName('AFromDate').AsDateTime := IncMonth(Date, -12);
         ParamByName('AToDate').AsDateTime := Date;
         Open;
         try
            First;
            if IsEmpty then
               NoServedCows := 0
            else
               NoServedCows := FieldByName('NoCowsServed').AsInteger;
         finally
            Close;
         end;

         NoCowsPregFirst := 0;

         { Calc num of cows PD'd after first service }
{         SQL.Clear;
         SQL.Add('SELECT E.AnimalID, E.EventDate, E.AnimalLactNo FROM Events E, ' + CowTable.TableName + ' C');
         SQL.Add('WHERE (C.AnimalID=E.AnimalID)');
         SQL.Add('AND (C.LactNo=E.AnimalLactNo) ');
         SQL.Add('AND   (E.EventType = ' + IntToStr(cServiceEvent) + ')');
         SQL.Add('AND   (E.EventDate BETWEEN :AFromDate AND :AToDate ) ');
         SQL.Add('GROUP BY E.AnimalID, E.AnimalLactNo, E.EventDate');
         ParamByName('AFromDate').AsDateTime := IncMonth(Date, -12);
         ParamByName('AToDate').AsDateTime := Date;
         Open;
}

         { Calc Preg/First service, these are all animals served only once, and
          have had a successfully PD thereafter. }
         SQL.Clear;
         SQL.Add('SELECT E.AnimalID, E.AnimalLactNo, Count(E.EventType) From Events E, ' + CowTable.TableName + ' C');
         SQL.Add('WHERE (C.AnimalID=E.AnimalID) ');
         SQL.Add('AND (C.LactNo=E.AnimalLactNo) ');
         SQL.Add('AND (E.EventType = ' + IntToStr( cServiceEvent ) + ')');
         SQL.Add('AND (E.EventDate BETWEEN :AFromDate AND :AToDate ) ');
         SQL.Add('GROUP BY E.AnimalID, AnimalLactNo ');
         SQL.Add('HAVING Count(E.EventType) = 1 ');
         ParamByName('AFromDate').AsDateTime := IncMonth(Date, -12);
         ParamByName('AToDate').AsDateTime := Date;
         Open;

         try
            First;
            while not eof do
               begin
{                  WinData.CheckEvents.Filter :=
                               Format(sEventFilter, [ FieldByName('AnimalID').AsInteger, FieldByName('AnimalLactNo').AsInteger, cServiceEvent]);
                  WinData.CheckEvents.Filtered := True;
}
//                  if (NOT WinData.CheckEvents.EOF) And (WinData.CheckEvents.RecordCount = 1) then
  //                   begin
                        try
//                           WinData.ClearEventFilter;

                           WinData.CheckEvents.Filter := Format(sEventFilter, [FieldByName('AnimalID').AsInteger, FieldByName('AnimalLactNo').AsInteger, cPregDiagEvent]);
                           WinData.CheckEvents.Filtered := True;

                           if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                              if ( WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean ) or (WinData.LookUpPDs.FieldByName('NoCalves').AsInteger > 0 ) then
                                 Inc(NoCowsPregFirst);
                        finally
                           WinData.ClearEventFilter;
                        end;
    //                 end;
                  Next;
               end;
       finally
           Close;
       end;

       StepProgress(10);

       if NoServedCows > 0 then
          PregRateToFirstPreg := Perc(NoCowsPregFirst, NoServedCows );


       LactDays := 0;

       { Stage of Lactation (days) }
       SQL.Clear;
       SQL.Add('SELECT Distinct(E.AnimalID), E.EventDate, E.AnimalLactNo FROM Events E, ' + CowTable.TableName + ' C');
       SQL.Add('WHERE (C.AnimalID=E.AnimalID)');
       SQL.Add('AND (C.LactNo > 0 ) ');
       SQL.Add('AND (C.LactNo=E.AnimalLactNo) ');
       SQL.Add('AND (E.EventType = ' + inttostr( CCalvingEvent ) + ') ');
       Open;
       try
          First;
          LactCows := RecordCount;
          while not eof do
             begin
                LactDays := LactDays + Trunc( Date - FieldByName('EventDate').AsDateTime );
                Next;
             end;
          try
             AvgLactDays := (LactDays DIV LactCows);
          except
          end;
       finally
          Close;
       end;
       StepProgress(10);
    end;
end;

procedure TRationPerformMonitor.CalcMilk;
begin
   //
end;

procedure TRationPerformMonitor.CalcCulled;
var
   TotalCulledCows : Integer;
   InfertCulledCows : Integer;
   AlreadyActive : Boolean;
begin

   TotalCulledCows := 0;
   InfertCulledCows := 0;

   WinData.LookUpSaleDeath.Filter := '';
   WinData.LookUpSaleDeath.Filtered := False;

   AlreadyActive := WinData.LookUpSaleDeath.Active;
   if not AlreadyActive then
      WinData.LookUpSaleDeath.Active := True;

   try

      with GenQuery do
         begin

            SQL.Clear;
            SQL.Add('SELECT DISTINCT A.ID, E.ID EventID FROM Animals A, Events E ');
            SQL.Add('WHERE (A.ID = E.AnimalID)');
            SQL.Add('AND   (A.Inherd=False)');
            SQL.Add('AND   (A.AnimalDeleted=False)');
            SQL.Add('AND   (A.HerdID = :AHerdID)');
            SQL.Add('AND   (UPPER(A.Sex)="FEMALE")');
            SQL.Add('AND   (E.EventType = ' + IntToStr(cSaleDeathEvent) + ')');
            SQL.Add('AND   (E.EventDate BETWEEN :AFromDate AND :AToDate ) ');
            ParamByName('AHerdID').AsInteger  := HerdID;
            ParamByName('AFromDate').AsDateTime := IncMonth(Date, -12);
            ParamByName('AToDate').AsDateTime := Date;
            Open;

            try
               First;

               TotalCulledCows := RecordCount;

               while not eof do
                  begin

                     if WinData.LookUpSaleDeath.Locate('EventID', FieldByName('EventID').AsInteger, []) then
                        begin
                           if ( WinData.LookUpSaleDeath.FieldByName('Culled').AsInteger > 0 ) then
                              if WinData.GenLookUp.Locate('ID', WinData.LookUpSaleDeath.FieldByName('Culled').AsInteger, [] ) then
                                 if UPPERCASE(WinData.GenLookUp.FieldByName('Description').AsString) = 'ICBF-INFERTILITY' then
                                    Inc(InfertCulledCows);
                        end;
                     Next;
                  end;

               if ( InfertCulledCows > 0 ) then
                  CulledCowsInfert := Perc(InfertCulledCows, TotalCulledCows);

               CulledCowsPerc := Perc(TotalCulledCows, CowCount);
            finally
               Close;
            end;
         end;
   finally
      WinData.LookUpSaleDeath.Active := AlreadyActive;
   end;
   StepProgress(10);
end;

procedure TRationPerformMonitor.CalcFeeds;
var
   TotalFeedTypes,
   NoHomeGrownFeedTypes : Integer;
   HomeGrownFeedID : integer;
   DaysFed : Integer;
   AllocDate,
   EndDate : TDateTime;
   QuantDay, CostDay : Double;
   TotalQuantDay, TotalCostDay : Double;
   AllCows, DryCows : Integer;
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT COUNT(DISTINCT F.ID) CountOfFeeds FROM FeedTypes F ');
         SQL.Add('WHERE ( F.ID > 0 ) ');
         Open;
         try
            First;
            TotalFeedTypes := FieldByName('CountOfFeeds').AsInteger; // Total Feed Types in Table.
         finally
            Close;
         end;


         if WinData.GenLookUp.Locate('ListType;Description', VarArrayOf([LFeedCategory, 'HOMEGROWN']), [loCaseInsensitive]) then
            begin
               HomeGrownFeedID := WinData.GenLookUp.FieldByName('ID').AsInteger; // HomeGrown Feed ID.

               // Query FeedEvent Table, get homegrown feeds currently
               // in ration EndDate = Null or Greater than today.
               // Determined by Category = HomeGrownFeedID
               SQL.Clear;
               SQL.Add('SELECT COUNT(DISTINCT F.FeedType) CountOfHGFeeds FROM FeedEvents F ');
               SQL.Add('LEFT JOIN FeedTypes FT ON (FT.ID = F.FeedType) ');
               SQL.Add('WHERE ( F.EndDate IS NULL ) OR ( EndDate > :ADate )');
               SQL.Add('AND ( FT.Category = :FeedCatID ) ');
               Params[0].AsDateTime := Date;
               Params[1].AsInteger := HomeGrownFeedID;
               Open;

               try
                  First;
                  NoHomeGrownFeedTypes := FieldByName('CountOfHGFeeds').AsInteger; // No of HomeGrown Feeds currently in ration
               finally
                  Close;
               end;

               HomeGrownFeedPerc := Perc(NoHomeGrownFeedTypes, TotalFeedTypes); // Calc Percentage of Homegrown Feeds
            end;
      end;
   StepProgress(10);

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT AVG( DefCostTon) AvgCostPerTonne FROM FeedTypes F ');
         Open;
         try
            First;
            AvgFeedCostPerTonne := FieldByName('AvgCostPerTonne').AsFloat;
         finally
            Close;
         end;
      end;
   StepProgress(10);

   Application.ProcessMessages;


   TotalQuantDay := 0;
   TotalCostDay := 0;

   with TTable.Create(nil) do
      begin
         Databasename := AliasName;
         TableName := 'FeedEvents';
         Active := True;

         try
            First;
            while not eof do
               begin

                  // Check if this cow is in main cow table, if so do feed calcs
                  if CowTable.Locate('AnimalID', FieldByName('AnimalID').AsInteger, []) then
                     begin
                        DaysFed  := 0;
                        EndDate  := 0;
                        QuantDay := 0;
                        CostDay  := 0;

                        AllocDate := FieldByName('AllocDate').AsDateTime;
                        EndDate := FieldByName('EndDate').AsDateTime;

                        // Set Alloc date = to FromDate if allocation is before FromDate.
                        if ( AllocDate < FromDate.Date ) then AllocDate := FromDate.Date;
                        // Set End Date = TODate if End Date > ToDate.
                        if ( EndDate > ToDate.Date ) then EndDate := ToDate.Date;

                        { Concentrate Fed Per Lactation }
                        if ( CowTable.FieldByName('LastCalvingDate').AsDateTime > 0 ) then
                           begin
                              if ( EndDate > CowTable.FieldByName('LastCalvingDate').AsDateTime ) then // Animal was fed in dry period.
                                 begin
                                    // Change AllocDate to calving date if allocation began before Calvingdate.
                                    // we only want days fed during dry period.
                                    if ( AllocDate < CowTable.FieldByName('LastCalvingDate').AsDateTime ) then
                                       AllocDate := CowTable.FieldByName('LastCalvingDate').AsDateTime;
                                     DaysFed := Trunc( EndDate - AllocDate );
                                     QuantDay := FieldByName('QuantDay').AsFloat;
                                     TotalFedPerLact := TotalFedPerLact + ( QuantDay * DaysFed );
                                  end;
                           end;

                        { Concentrate Fed Per Dry Cow }
                        { Ensure cow was dry }
                        if ( CowTable.FieldByName('LastDryDate').AsDateTime > CowTable.FieldByName('LastCalvingDate').AsDateTime ) then
                           begin
                              if ( EndDate > CowTable.FieldByName('LastDryDate').AsDateTime ) then // Animal was fed in dry period.
                                 begin
                                    // Change AllocDate to dry date if Allocation began before drydate.
                                    // we only want days fed during dry period.
                                    if ( AllocDate < CowTable.FieldByName('LastDryDate').AsDateTime ) then
                                       AllocDate := CowTable.FieldByName('LastDryDate').AsDateTime;
                                    DaysFed := Trunc( EndDate - AllocDate);
                                    QuantDay := FieldByName('QuantDay').AsFloat;
                                    TotalDryCowQuantityKg := TotalDryCowQuantityKg + ( QuantDay * DaysFed );
                                    Inc(DryCows);
                                 end;
                           end;

                        TotalCowQuantityKg := TotalCowQuantityKg + FieldByName('QuantDay').AsFloat;
                        Inc(AllCows);

                        TotalQuantDay := TotalQuantDay + FieldByName('QuantDay').AsFloat;;
                        TotalCostDay := TotalCostDay + FieldByName('CostDay').AsFloat;;
                     end;
                  Next;
               end;

             if ( TotalQuantDay > 0 ) then  TotalFeedCostPerKg := ( TotalCostDay / TotalQuantDay );

             if ( DryCows > 0 ) then TotalDryCowQuantityKg := ( TotalDryCowQuantityKg / DryCows );

             if ( AllCows > 0 ) then TotalCowQuantityKg := ( TotalCowQuantityKg / AllCows );
         finally
            Active := False;
            Free;
         end;
      end;
   StepProgress(10);
end;

procedure TRationPerformMonitor.CalcCowsInMilk;
begin
   with CowTable do
      begin
         First;
         while not eof do
            begin
               // if lastcalving date > lastdrydate then animal is milking.
               if ( CowTable.FieldByName('LastCalvingDate').AsDateTime > CowTable.FieldByName('LastDryDate').AsDateTime ) then
                  Inc(CowsInMilk);
               Next;
            end

      end;
   StepProgress(10);
end;

procedure TRationPerformMonitor.lAvgFeedCostPerTonnePrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Value <> '' then
     Value :=  CurrToStrF(StrToCurr(Value), ffCurrency, 2);
end;

procedure TRationPerformMonitor.lConcentrateFedPerLactPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  if Value <> '' then
     Value := Value + ' (Metric Tonne)';
end;

procedure TRationPerformMonitor.cbUseFilterClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TRationPerformMonitor.FormActivate(Sender: TObject);
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

procedure TRationPerformMonitor.sbViewMouseLeave(Sender: TObject);
begin
  WinData.cxHint.HideHint;
end;

procedure TRationPerformMonitor.sbExitClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TRationPerformMonitor.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cDairyBenchRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cDairyBenchRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TRationPerformMonitor.FormShow(Sender: TObject);
begin
   inherited;
   cbFavourite.Checked := WinData.IsReportFavourite(cMilkProdGraphRep);
   WinData.UpdateRecentReportUsage(cMilkProdGraphRep);
   cbDichromatic.Visible := False;
   cbUseFilter.Visible := False;
   FromDate.Date := StrToDate('01/01/'+IntToStr(ExtractYear(Date)));
   ToDate.Date := Date;
end;

end.
