{

 ***********************************************************************************************************************
 Report : List of Restricted animals that should not be sold.
 This can be Animals that are a) Still within the Retention Period.
                              b) Haven't been tested for diseases, TB Test/Brucellosis
                              c) Animals recently taken Anitbiotics (HealthEvent) and haven't Withdrawan from the drug.
 ***********************************************************************************************************************

   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

   12/06/14 [V5.3 R2.7] /MK Change - Changes to the report as requested by GL.

   15/09/14 [V5.3 R6.2] /MK Change - If cbReplaceWithMilkWithdrawal.Checked then show max MilkWDDays - TGM/Raymond Quinn request.

   12/07/18 [V5.8 R0.9] /MK Additional Feature - Change 1 year to SpinEdit defaulting to 365 days for both TB and Brucellosis.
                                               - Change default description of Health to "(DrugName) - (Meat/Milk) w/drawal (withdrawal days) days.
                                                                               TB to "Last TB Test Date more than (SpinEdit) days".
                                                                               Brucellosis to "Last Bruc more than (SpinEdit) days".
                                               - Added additional columns for Last TB and Last Brucellosis date.
                                               - Made sure that the filters, columns and descriptions are in the same order, TB, Brucellosis and Withdrawal.
                                               - All changes instegated by Jackie in Quinn International's conversation with Declan O'Meara.
}

unit uRestrictAnimals;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, RxLookup, RXCtrls, ComCtrls, ToolWin,
  DBTables, Db, Qrctrls, QuickRpt, QRExport, ReportDefaults, cxControls,
  cxContainer, cxEdit, cxCheckBox, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxProgressBar;

type
  TfRestrictAnimals = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    ComboHerd: TRxDBLookupCombo;
    Bevel1: TBevel;
    CutOffDate: TDateEdit;
    Label2: TLabel;
    MyQuery: TQuery;
    MyTable: TTable;
    rgSortOptions: TRadioGroup;
    rgSortOrder: TRadioGroup;
    Health: TTable;
    Medicine: TTable;
    qrRestrictAnimals: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    lSortOptions: TQRLabel;
    lSortOrder: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbTBDesc: TQRDBText;
    qrdbBruceDesc: TQRDBText;
    qrdbHealthDesc: TQRDBText;
    QRBand2: TQRBand;
    VerNo: TQRLabel;
    QRLabel12: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    lMoveDate: TQRLabel;
    lHerdId: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    BeefSub: TTable;
    SAppliedFor: TTable;
    QRDBText9: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    cbUseFilter: TCheckBox;
    lUsingFilter: TQRLabel;
    cbFavourite: TcxCheckBox;
    gbFilterReport: TcxGroupBox;
    cbMeatWithdrawalPeriod: TcxCheckBox;
    cbTBTestDate: TcxCheckBox;
    cbBruceDate: TcxCheckBox;
    cbReplaceWithMilkWithdrawal: TcxCheckBox;
    seTBCheckDays: TcxSpinEdit;
    seBrucCheckDays: TcxSpinEdit;
    qrlCurTBTestDate: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    pbRestrictAnimals: TcxProgressBar;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure cbReplaceWithMilkWithdrawalPropertiesChange(Sender: TObject);
  private
    { Private declarations }
     RestrictAnimalsDefs : TRestrictedAnimalsDefaults;
     function CheckWithDrawlPeriod(var Days : Double) : Double;
     procedure GetAnimals;
     procedure Check1st2ndBullRentention;
     procedure CheckSucklerRentention;
     procedure CheckHealth;
     procedure CheckTB;
     procedure CheckBruce;
     procedure OutPutReport;
     procedure LoadScreenDefaults;
     procedure SaveScreenDefaults;
  public
    { Public declarations }
  end;

  procedure CreateAndShowForm;
var
  fRestrictAnimals: TfRestrictAnimals;

const
   RetensionMessage = 'Currently within Retention Period.';
   HealthMessage = '%s w/drawal %s days.';
   TBMessage = 'Last TB Test more than %s days';
   BruceMessage = 'Last Bruc Test more than %s days';
   cMeatWithDrawal = 0;
   cMilkWithDrawal = 1;

implementation
uses
   DairyData, GenTypesConst, kDBRoutines, uHerdLookup;

{$R *.DFM}
procedure CreateAndShowForm;
begin
   Application.CreateForm(TfRestrictAnimals, fRestrictAnimals);
   try
      if not WinData.ExportToPDA then
         fRestrictAnimals.ShowModal
      else
         begin
            fRestrictAnimals.sbView.Click;
         end;
   finally
      FreeAndNil(fRestrictAnimals);
   end;
end;

procedure TfRestrictAnimals.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfRestrictAnimals.GetAnimals;
begin
   MyTable.Close;
   With MyQuery do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM TmpMoveRestrict');
         ExecSQL;
         SQL.Clear;
         SQL.Add('INSERT INTO TmpMoveRestrict (AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatIDNum, DOB, Sex, TBTestDate, BrucDate, Include) ');
         SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.DateOfBirth, A.Sex, A.TBTestDate, A.Brucellosis, FALSE ');
         SQL.Add('FROM Animals A ');
         if cbUseFilter.Checked then
            SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
         SQL.Add('WHERE A.InHerd=TRUE');
         if Length(ComboHerd.Value) > 0 then
            SQL.Add('AND (A.HerdID='+ComboHerd.Value+')');

         SQL.Add('AND A.AnimalDeleted=FALSE');

         ExecSQL;
         MyTable.Open;
      end;
end;

procedure TfRestrictAnimals.Check1st2ndBullRentention;
begin
   // Check animal is not within retention period.
   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('UPDATE TmpMoveRestrict T ');
         SQL.Add('SET T.Include = True,');
         SQL.Add('    T.Retension = "'+RetensionMessage+'"');
         SQL.Add('WHERE (T.AnimalID IN       ');
         SQL.Add('                  (SELECT DISTINCT B.AnimalID ');
         SQL.Add('                   FROM BeefSub B             ');
         SQL.Add('                   WHERE (B.RetensionDate > "' + FormatDateTime(cUSDateStyle,CutOffDate.Date) + '")');
         SQL.Add('       )           )');
         ExecSQL;
         SQL.Clear;
         SQL.Add('Select AnimalID, RetensionDate from BeefSub where animalid in (select animalid  from TmpMoveRestrict where include = True )');
         Prepare;
         Open;
         First;
         while NOT eof do
            begin
               if MyTable.Locate('AnimalID', MyQuery.FieldByName('AnimalID').AsInteger,[]) then
                  begin
                     MyTable.Edit;
                     MyTable.FieldByName('RetensionEnd').AsDateTime := MyQuery.FieldByName('RetensionDate').AsDatetime;
                     MyTable.Post;
                  end;
            next;
           end;
     end;

end;

procedure TfRestrictAnimals.CheckSucklerRentention;
begin
   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('UPDATE TmpMoveRestrict T ');
         SQL.Add('SET T.Include = True,');
         SQL.Add('    T.Retension = "'+RetensionMessage+'"');
         SQL.Add('WHERE (T.AnimalID IN       ');
         SQL.Add('                  (SELECT DISTINCT SA.AnimalID ');
         SQL.Add('                   FROM SAppliedFor SA        ');
         SQL.Add('                   LEFT JOIN SApplic S ON (SA.ApplicationID=S.ID) ');
         SQL.Add('                   WHERE (S.RetensionDate > "' + FormatDateTime(cUSDateStyle,CutOffDate.Date) + '")');
         SQL.Add('       )           )');
         ExecSQL;

         SQL.Clear;
         SQL.Add('Select AnimalID, RetensionDate from SAppliedFor where animalid in(select animalid from TmpMoveRestrict where Include = True) ');
         Prepare;
         MyQuery.Open;
         MyQuery.First;
         while NOT MyQuery.Eof do
            begin
              if MyTable.Locate('AnimalID', MyQuery.FieldByName('AnimalID').AsInteger,[]) then
                 begin
                    MyTable.Edit;
                    MyTable.FieldByName('RetensionEnd').AsDateTime := MyQuery.FieldByName('RetensionDate').AsDatetime;
                    MyTable.Post;
                 end;
              next;
           end;
      end;

end;

procedure TfRestrictAnimals.CheckHealth;
var
   TestDate,
   DateToUse : TDateTime;
   EventID : Integer;
   WithDrawalDays : Double;
   AdminDays : Integer; // Stores the number of days animal is to be administered drug.
   MedName : String[30]; // Stores the medicine name to display in comment field.
   WorkingWDDate : TDateTime; // temp withdrawaldate.

  procedure PostRecord;
  begin
     MyTable.Edit;
     MyTable.FieldByName('Include').AsBoolean := TRUE;

     //   15/09/14 [V5.3 R6.2] /MK Change - If cbReplaceWithMilkWithdrawal.Checked then show max MilkWDDays - TGM/Raymond Quinn request.
     if ( cbMeatWithdrawalPeriod.Checked ) then
         begin
            if ( cbReplaceWithMilkWithdrawal.Checked ) then
               MyTable.FieldByName('Health').AsString := MedName + ' - ' + Format(HealthMessage,['Milk',FloatToStr(WithDrawalDays)])
            else
               MyTable.FieldByName('Health').AsString := MedName + ' - ' + Format(HealthMessage,['Meat',FloatToStr(WithDrawalDays)]);
         end;

     MyTable.FieldByName('MedWithWDDate').AsDateTime := WorkingWDDate;
     MyTable.Post;
  end;

begin
   with MyQuery do
      begin
         // Find the maxium withdrawal days in medicine.db
         // Exclude any health events before WithDrawalDays + DateToUse
         SQL.Clear;
         //   12/06/14 [V5.3 R1.7] /MK Change - Only include meat withdrawal in SQL - GL Request.
         SQL.Add('SELECT MAX(WithDrawal) MeatWDDays,');
         SQL.Add('       MAX(MilkWithDrawal) MilkWDDays, ');
         SQL.Add('       MAX(OrganicMeatWithDrawal) OrganicMeatWDDays,');
         SQL.Add('       MAX(OrganicMilkWithDrawal) OrganicMilkWDDays');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE ( (MeatN_A_Drug = False) OR (MeatN_A_Drug IS NULL) )');
         SQL.Add('AND   ( (MilkN_A_Drug = False) OR (MilkN_A_Drug IS NULL) )');
         Open;

         First;
         if ( not(FieldByName('MeatWDDays').AsInteger = 9999) ) then
            WithDrawalDays := FieldByName('MeatWDDays').AsFloat;

         //   15/09/14 [V5.3 R6.2] /MK Change - If cbReplaceWithMilkWithdrawal.Checked then show max MilkWDDays - TGM/Raymond Quinn request.
         if ( cbReplaceWithMilkWithdrawal.Checked ) then
            begin
               if ( not(FieldByName('MilkWDDays').AsInteger = 9999) ) then
                  if FieldByName('MilkWDDays').AsInteger > WithDrawalDays then
                     WithDrawalDays := FieldByName('MilkWDDays').AsInteger;
            end;

         if HerdLookup.HerdOwnerData.OrganicHerd then
            begin
               if ( not(FieldByName('OrganicMeatWDDays').AsInteger = 9999) ) then
                  if FieldByName('OrganicMeatWDDays').AsInteger > WithDrawalDays then
                     WithDrawalDays := FieldByName('OrganicMeatWDDays').AsInteger;
               if ( cbReplaceWithMilkWithdrawal.Checked ) then
                  begin
                     if ( not(FieldByName('OrganicMilkWDDays').AsInteger = 9999) ) then
                        if FieldByName('OrganicMilkWDDays').AsInteger > WithDrawalDays then
                           WithDrawalDays := FieldByName('OrganicMilkWDDays').AsInteger
                  end;
            end;
         Close;
      end;

   DateToUse := CutOffDate.Date - WithDrawalDays;

   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT E.AnimalID, E.ID, E.EventDate ');
         SQL.Add('FROM Events E');
         SQL.Add('WHERE (E.AnimalID IN (SELECT DISTINCT T.AnimalID ');
         SQL.Add('                      FROM TmpMoveRestrict T))');
         SQL.Add('AND E.EventType IN ('+IntToStr(CHealthEvent)+','+IntToStr(CDryOffEvent)+')');
         // Select all health/dry events after DateToUse ( CutOffDate - WithDrawalDays )
         // This will ensure only animals still in withdrawal period will be considered for report.
         SQL.Add('AND (E.EventDate > "'+FormatDateTime(cUSDateStyle,DateToUse)+'")');

         Open;

         pbRestrictAnimals.Properties.Min := 1;
         pbRestrictAnimals.Properties.Max := MyQuery.RecordCount;
         pbRestrictAnimals.Position := 1;
         Application.ProcessMessages;
         Update;

         if ( NOT(IsEmpty) ) then
            begin
               MyQuery.First;
               while NOT MyQuery.Eof do
                  begin

                     WithDrawalDays := 0;
                     MedName := '';
                     AdminDays := 0;
                     WorkingWDDate := 0;

                     EventID := MyQuery.FieldByName('ID').AsInteger;

                     HerdLookup.HerdOwnerData.HerdID := StrToInt(ComboHerd.Value);

                     if Health.Locate('EventID', EventID ,[]) then
                        begin
                           if Health.FieldByName('DrugUsed').AsInteger > 0 then
                              begin
                                 AdminDays := Health.FieldByName('NoDays').AsInteger;
                                 if Medicine.Locate('ID', Health.FieldByName('DrugUsed').AsInteger,[]) then
                                    begin
                                       MedName := Medicine.FieldByName('Name').AsString;
                                       if ( cbMeatWithdrawalPeriod.Checked ) then
                                          begin
                                             //   15/09/14 [V5.3 R6.2] /MK Change - If cbReplaceWithMilkWithdrawal.Checked then show max MilkWDDays - TGM/Raymond Quinn request.
                                             if ( cbReplaceWithMilkWithdrawal.Checked ) then
                                                begin
                                                   if ( not(Medicine.FieldByName('MilkN_A_Drug').AsBoolean) ) and ( not(Medicine.FieldByName('MilkWithDrawal').AsInteger = 9999) ) then
                                                      begin
                                                         WithDrawalDays := Medicine.FieldByName('MilkWithDrawal').AsFloat;
                                                         if HerdLookup.HerdOwnerData.OrganicHerd then
                                                            if Medicine.FieldByName('OrganicMilkWithDrawal').AsInteger > WithDrawalDays then
                                                               WithDrawalDays := Medicine.FieldByName('OrganicMilkWithDrawal').AsFloat;
                                                      end;
                                                end
                                             else
                                                begin
                                                   if ( not(Medicine.FieldByName('MeatN_A_Drug').AsBoolean) ) and ( not(Medicine.FieldByName('WithDrawal').AsInteger = 9999) ) then
                                                      begin
                                                         WithDrawalDays := Medicine.FieldByName('WithDrawal').AsFloat;
                                                         if HerdLookup.HerdOwnerData.OrganicHerd then
                                                            if Medicine.FieldByName('OrganicMeatWithDrawal').AsInteger > WithDrawalDays then
                                                               WithDrawalDays := Medicine.FieldByName('OrganicMeatWithDrawal').AsFloat;
                                                      end;
                                                end;
                                          end;
                                    end;
                              end;
                        end;

                     CheckWithDrawlPeriod(WithDrawalDays);

                     if ( WithDrawalDays > 0 ) then
                        begin
                           if ( AdminDays <= 0 ) then
                              AdminDays := 1; // set AdminDays to default "1 day" where AdminDays <= 0

                           WorkingWDDate := MyQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                           if ( WorkingWDDate > CutOffDate.Date ) then
                              if MyTable.Locate('AnimalID', MyQuery.FieldByName('AnimalID').AsInteger,[]) then
                                 begin
                                    if ( MyTable.FieldByName('MedWithWDDate').AsDateTime <= 0 ) then
                                       PostRecord
                                    else if ( WorkingWDDate > MyTable.FieldByName('MedWithWDDate').AsDateTime ) then
                                       begin
                                          // if animal is posted with previous withdrawal date be sure re-post WorkingWDDate
                                          // only if WorkingWDDate > MedWithWDDate
                                          PostRecord;
                                       end;
                                 end;
                        end;

                     pbRestrictAnimals.Position := pbRestrictAnimals.Position+1;
                     Application.ProcessMessages;
                     Update;

                     MyQuery.Next;
                  end;
            end;
      end;
end;

procedure TfRestrictAnimals.CheckBruce;
begin
   // Check if animal has been disease tested.
   // Males check for TB, Females check for TB and Brucellosis.
   MyTable.First;

   pbRestrictAnimals.Properties.Min := 1;
   pbRestrictAnimals.Properties.Max := MyTable.RecordCount;
   pbRestrictAnimals.Position := 1;
   Application.ProcessMessages;
   Update;

   while ( not(MyTable.Eof) ) do
         begin
            // steers do not have brucellosis tests
            if MyTable.FieldByName('Sex').AsString <> 'Steer' then
               begin
                  MyTable.Edit;
                  if MyTable.FieldByName('BrucDate').AsDateTime > 0 then
                     begin
                        if MyTable.FieldByName('BrucDate').AsDateTime < CutOffDate.Date-seBrucCheckDays.Value then
                           MyTable.FieldByName('Bruce').AsString := Format(BruceMessage,[VarToStr(seBrucCheckDays.Value)]);;
                        MyTable.FieldByName('Include').AsBoolean := True;
                     end;
                  MyTable.Post;
               end;

            pbRestrictAnimals.Position := pbRestrictAnimals.Position+1;
            Application.ProcessMessages;
            Update;

            MyTable.Next;
         end;
end;

procedure TfRestrictAnimals.CheckTB;
begin
   // Check if animal has been disease tested.
   // Males check for TB, Females check for TB and Brucellosis.

   pbRestrictAnimals.Properties.Min := 1;
   pbRestrictAnimals.Properties.Max := MyTable.RecordCount;
   pbRestrictAnimals.Position := 1;
   Application.ProcessMessages;
   Update;

   MyTable.First;
   While ( NOT(MyTable.Eof) ) do
      begin
         MyTable.Edit;
         if MyTable.FieldByName('TBTestDate').AsDateTime > 0 then
            begin
               //   11/07/18 [V5.8 R0.9] /MK Change - Added SpinEdit to allow the user
               if ( MyTable.FieldByName('TBTestDate').AsDateTime < (CutOffDate.Date-seTBCheckDays.Value) ) then
                  begin
                     MyTable.FieldByName('Include').AsBoolean := True;
                     MyTable.FieldByName('TB').AsString := Format(TBMessage,[VarToStr(seTBCheckDays.Value)]);
                  end;
            end;
         MyTable.Post;

         pbRestrictAnimals.Position := pbRestrictAnimals.Position+1;
         Application.ProcessMessages;
         Update;

         MyTable.Next;
      end;
end;


procedure TfRestrictAnimals.sbViewClick(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;

   SAppliedFor.Open;
   BeefSub.Open;
   Health.Open;
   Medicine.Open;
   sbView.Enabled := False;
   sbPrint.Enabled := False;
   try
      try
         Screen.Cursor := crHourGlass;
         GetAnimals;

         pbRestrictAnimals.Visible := True;
         Height := 432;
         Application.ProcessMessages;
         Update;

         lMoveDate.Caption := CutOffDate.Text;
         lHerdId.Caption := ComboHerd.Text;

         seTBCheckDays.PostEditValue;
         if ( seTBCheckDays.Value > 365 ) then
            seTBCheckDays.Value := 365;
         seBrucCheckDays.PostEditValue;
         if ( seBrucCheckDays.Value > 365 ) then
            seBrucCheckDays.Value := 365;

         if ( cbTBTestDate.Checked ) then
            CheckTB;
         if cbBruceDate.Checked then
            CheckBruce;
         if ( cbMeatWithdrawalPeriod.Checked ) then
            CheckHealth;

         OutPutReport;

         if ( MyQuery.RecordCount = 0 ) then
            begin
               MessageDlg('No data to print.',mtError,[mbOK],0);
               Exit;
            end;

      finally
         pbRestrictAnimals.Visible := False;
         Height := 404;
         Application.ProcessMessages;
         Update;
         Screen.Cursor := crDefault;
      end;

      if cbUseFilter.Checked then
         lUsingFilter.Caption := '(Applying '+ Copy(cbUseFilter.Caption, 7, Length(cbUseFilter.Caption)) +')'
      else
         lUsingFilter.Caption := '';

      if ( not(cbTBTestDate.Checked) ) and ( not(cbBruceDate.Checked) ) and ( not(cbMeatWithdrawalPeriod.Checked) ) then
         begin
            MessageDlg('No Filter Report option has been selected.',mtInformation,[mbOK],0);
            Exit;
         end
      else if not WinData.ExportToPDA then
         begin
            if (Sender as TRXSpeedButton).Hint = 'view' then
               qrRestrictAnimals.Preview
            else
               begin
                  TitleBand1.Font.Color := clBlack;
                  QrSubDetail1.Font.Color := clBlack;
                  Windata.CallPrintDialog(qrRestrictAnimals);
               end;
         end
      else
         begin
            WinData.PDALinkExport.ExportReport( qrRestrictAnimals );
         end;
   finally
      SAppliedFor.Close;
      BeefSub.Close;
      Health.Close;
      Medicine.Close;
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
end;

procedure TfRestrictAnimals.OutPutReport;
begin
   VerNo.Caption := 'Herd Management '+ HerdVerNo;
   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM TmpMoveRestrict');
         SQL.Add('Where Include = True');
         case rgSortOptions.ItemIndex of
            0 : begin
                   SQL.Add('ORDER BY SortNatIDNum');
                   lSortOptions.Caption := 'National ID Number';
                end;
            1 : begin
                   SQL.Add('ORDER BY SortAnimalNo');
                   lSortOptions.Caption := 'Animal Number';
                end;
            2 : begin
                   SQL.Add('ORDER BY DOB');
                   lSortOptions.Caption := 'Date Of Birth';
                end;
         end;
         case rgSortOrder.ItemIndex of
            0 : begin
                   SQL.Add('ASC');
                   lSortOrder.Caption := 'Ascending';
                end;
            1 : begin
                   SQL.Add('DESC');
                   lSortOrder.Caption := 'Decending';
                end;
         end;
         Open;
      end;
end;

procedure TfRestrictAnimals.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;

   try
      MyTable.Close;
      MyTable.DeleteTable;
      MyTable.Free;
   except
   end;
   SaveScreenDefaults;
   FreeAndNil(RestrictAnimalsDefs);
end;

function TfRestrictAnimals.CheckWithDrawlPeriod(var Days: Double): Double;
var
   Str : String;
begin
   Str := FloatToStr(Days);
   if Pos('.', Str) > 0 then
      Result := 1 + (Days)
   else
      Result := Days;
end;

procedure TfRestrictAnimals.FormCreate(Sender: TObject);
begin
   ComboHerd.LookupSource := WinData.dsHerdDefaults;

   RestrictAnimalsDefs := TRestrictedAnimalsDefaults.Create(cRD_RestrictedAnimals);

   WinData.CanShowStandardReportHint := True;

   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbView.Glyph,cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph,cBtnImgPrint);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);
   qrRestrictAnimals.Hide;

   with MyTable do
      begin
         MyTable := TTable.Create(nil);
         MyTable.TableType := ttParadox;
         MyTable.TableName := 'TmpMoveRestrict.db';
         MyTable.DatabaseName := WinData.KingData.DatabaseName;

         if not MyTable.Exists then
            begin
               MyTable.FieldDefs.Clear;
               MyTable.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
               MyTable.FieldDefs.Add('AnimalNo',ftString,10,FALSE);
               MyTable.FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
               MyTable.FieldDefs.Add('NatIDNum',ftString,20,FALSE);
               MyTable.FieldDefs.Add('SortNatIDNum',ftString,20,FALSE);
               MyTable.FieldDefs.Add('Sex',ftString,10,FALSE);
               MyTable.FieldDefs.Add('DOB',ftDate,0,FALSE);
               MyTable.FieldDefs.Add('TBTestDate',ftDate,0,FALSE);
               MyTable.FieldDefs.Add('BrucDate',ftDate,0,FALSE);
               MyTable.FieldDefs.Add('Include',ftBoolean,0,FALSE);
               MyTable.FieldDefs.Add('Retension',ftString,80,FALSE);
               MyTable.FieldDefs.Add('RetensionEnd',ftDate,0,FALSE);
               MyTable.FieldDefs.Add('TB',ftString,80,FALSE);
               MyTable.FieldDefs.Add('Bruce',ftString,80,FALSE);
               MyTable.FieldDefs.Add('Health',ftString,80,FALSE);
               MyTable.FieldDefs.Add('MedWithWDDate',ftDate,0,FALSE);
               MyTable.FieldDefs.Add('WithDrawalType',ftSmallint);
               MyTable.CreateTable;
            end
         else
            SQLEmptyTable(MyTable.TableName);
         MyTable.Open;
      end;

   CutOffDate.Date := Now();
   ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   rgSortOptions.ItemIndex := 0;
   rgSortOrder.ItemIndex := 0;
   LoadScreenDefaults;

   pbRestrictAnimals.Visible := False;
   Height := 404;
   Application.ProcessMessages;
   Update;
end;

procedure TfRestrictAnimals.LoadScreenDefaults;
begin
   if ( RestrictAnimalsDefs <> nil ) then
      try
         rgSortOptions.ItemIndex := RestrictAnimalsDefs.SortField;
         rgSortOrder.ItemIndex := RestrictAnimalsDefs.SortOrder;
         if ( RestrictAnimalsDefs.MovementDate > 0 ) then
            CutOffDate.Date := RestrictAnimalsDefs.MovementDate;
         cbMeatWithdrawalPeriod.Checked := RestrictAnimalsDefs.VetWithdrawalFlt;
         cbTBTestDate.Checked := RestrictAnimalsDefs.TBTestDateFlt;
         cbBruceDate.Checked := RestrictAnimalsDefs.BruceDateFlt;
      except
      end;
end;

procedure TfRestrictAnimals.SaveScreenDefaults;
begin
   if ( RestrictAnimalsDefs <> nil ) then
      try
         RestrictAnimalsDefs.SortField := rgSortOptions.ItemIndex;
         RestrictAnimalsDefs.SortOrder := rgSortOrder.ItemIndex;
         if ( CutOffDate.Date > 0 ) then
            RestrictAnimalsDefs.MovementDate := CutOffDate.Date;
         RestrictAnimalsDefs.VetWithdrawalFlt := cbMeatWithdrawalPeriod.Checked;
         RestrictAnimalsDefs.TBTestDateFlt := cbTBTestDate.Checked;
         RestrictAnimalsDefs.BruceDateFlt := cbBruceDate.Checked;
      except
      end;
end;

procedure TfRestrictAnimals.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRSubDetail1.Height := 21;
   qrdbTBDesc.Top := 3;
   qrdbBruceDesc.Top := 19;
   qrdbHealthDesc.Top := 35;

   if ( (Length(MyQuery.FieldByName('TB').AsString) > 0) and
        (Length(MyQuery.FieldByName('Bruce').AsString) > 0)and
        (Length(MyQuery.FieldByName('Health').AsString) = 0) ) or
      ( (Length(MyQuery.FieldByName('TB').AsString) = 0) and
        (Length(MyQuery.FieldByName('Bruce').AsString) > 0) and
        (Length(MyQuery.FieldByName('Health').AsString) > 0) ) or
      ( (Length(MyQuery.FieldByName('TB').AsString) > 0) and
        (Length(MyQuery.FieldByName('Bruce').AsString) = 0) and
        (Length(MyQuery.FieldByName('Health').AsString) > 0) ) then
      QRSubDetail1.Height := 38;

   if ( (Length(MyQuery.FieldByName('TB').AsString) > 0) and
        (Length(MyQuery.FieldByName('Bruce').AsString) > 0) and
        (Length(MyQuery.FieldByName('Health').AsString) > 0) ) then
      QRSubDetail1.Height := 53;

   if ( Length(MyQuery.FieldByName('TB').AsString) > 0 ) then
      begin
         if ( (Length(MyQuery.FieldByName('Bruce').AsString) > 0) and
              (Length(MyQuery.FieldByName('Health').AsString) = 0) ) then
            qrdbBruceDesc.Top := 19
         else if ( (Length(MyQuery.FieldByName('Bruce').AsString) = 0) and
                   (Length(MyQuery.FieldByName('Health').AsString) > 0) ) then
            qrdbHealthDesc.Top := 19;
      end
   else
      begin
         if ( (Length(MyQuery.FieldByName('Bruce').AsString) > 0) and
              (Length(MyQuery.FieldByName('Health').AsString) = 0) ) then
            qrdbBruceDesc.Top := 3
         else if ( (Length(MyQuery.FieldByName('Bruce').AsString) = 0) and
                   (Length(MyQuery.FieldByName('Health').AsString) > 0) ) then
            qrdbHealthDesc.Top := 3
         else if ( (Length(MyQuery.FieldByName('Bruce').AsString) > 0 ) and
                   (Length(MyQuery.FieldByName('Health').AsString) > 0) ) then
            begin
                qrdbBruceDesc.Top := 3;
                qrdbHealthDesc.Top := 19;
            end;
      end;
end;

procedure TfRestrictAnimals.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      begin
         if not WinData.ActiveFilter then
            begin
               cbUseFilter.State := cbUnchecked;
               MessageDlg(cNoFilterApplied,mtInformation,[mbOk],0);
            end
         else
            cbUseFilter.Font.Color := clBlue;
      end
   else
      cbUseFilter.Font.Color := clBlack;
end;

procedure TfRestrictAnimals.FormShow(Sender: TObject);
begin
   cbUseFilter.Checked := WinData.ActiveFilter;

   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cRestrictAnimalRep);
   WinData.UpdateRecentReportUsage(cRestrictAnimalRep);
end;

procedure TfRestrictAnimals.FormActivate(Sender: TObject);
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

procedure TfRestrictAnimals.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfRestrictAnimals.cbFavouritePropertiesChange(Sender: TObject);
begin
   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cRestrictAnimalRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cRestrictAnimalRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfRestrictAnimals.cbReplaceWithMilkWithdrawalPropertiesChange(
  Sender: TObject);
begin
   //   15/09/14 [V5.3 R6.2] /MK Change - If cbReplaceWithMilkWithdrawal.Checked then show max MilkWDDays - TGM/Raymond Quinn request.
   if ( cbReplaceWithMilkWithdrawal.Checked ) then
      cbMeatWithdrawalPeriod.Caption := 'Within Medicine Withdrawal Period (Milk)'
   else
      cbMeatWithdrawalPeriod.Caption := 'Within Medicine Withdrawal Period (Meat)';
end;

end.
