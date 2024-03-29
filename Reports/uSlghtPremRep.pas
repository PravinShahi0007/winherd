unit uSlghtPremRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, ComCtrls, RXCtrls, ToolWin,
  Db, DBTables, QuickRpt, Qrctrls, QRExport;

type
  TfSlghtPremRep = class(TForm)
    ToolBar1: TToolBar;
    sbExit: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    Panel1: TPanel;
    HerdCombo: TRxDBLookupCombo;
    ToolButton3: TToolButton;
    Label1: TLabel;
    DateFrom: TDateEdit;
    DateTo: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rgSortOptions: TRadioGroup;
    rgSortOrder: TRadioGroup;
    Bevel1: TBevel;
    MyTable: TTable;
    MyQuery: TQuery;
    ToolButton4: TToolButton;
    rgSex: TRadioGroup;
    qrSlghtPremRep: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    lSortOptions: TQRLabel;
    lSortOrder: TQRLabel;
    QRLabel13: TQRLabel;
    lSex: TQRLabel;
    QRLabel14: TQRLabel;
    lHerd: TQRLabel;
    lDateFrom: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lDateTo: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    PageFooterBand1: TQRBand;
    VerNo: TQRLabel;
    QRLabel12: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    pb: TProgressBar;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure FormShow(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadOtherData;
    function  HeiferCalc: Boolean;
    function CheckSlaughter: Boolean;
  public
    { Public declarations }
  end;

  procedure ShowTheForm;

var
  fSlghtPremRep: TfSlghtPremRep;

implementation
uses
   DairyData,
   GenTypesConst;

{$R *.DFM}

   procedure ShowTheForm;
   begin
      try
         try
            Application.CreateForm(TfSlghtPremRep, fSlghtPremRep);
            fSlghtPremRep.ShowModal;
         except
            MessageDlg('Cannot create form, close program and reboot',mtError,[mbOK],0);
         end;
      finally
         with fSlghtPremRep do
            begin
               with MyTable do
                  begin
                     Close;
                     DeleteTable;
                     Free;
                  end;
               Free;
            end
      end
   end;

procedure TfSlghtPremRep.FormShow(Sender: TObject);
begin
   pb.Hide;
   qrSlghtPremRep.Hide;
   with MyTable.Create(nil) do
      begin
         TableType := ttParadox;
         TableName := 'TmpSlghtRep.db';
         DatabaseName := WinData.KingData.DatabaseName;

         FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
         FieldDefs.Add('AnimalNo',ftString,10,FALSE);
         FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
         FieldDefs.Add('NatIDNum',ftString,20,FALSE);
         FieldDefs.Add('SortNatIDNum',ftString,20,FALSE);
         FieldDefs.Add('DOB',ftDate,0,FALSE);
         FieldDefs.Add('Sex',ftString,10,FALSE);
         FieldDefs.Add('Breed',ftString,40,FALSE);
         FieldDefs.Add('LactNo',ftInteger,0,FALSE);
         FieldDefs.Add('SaleDate',ftDate,0,FALSE);
         FieldDefs.Add('Amount',ftFloat,0,FALSE);
         FieldDefs.Add('Include',ftBoolean,0,FALSE);

         CreateTable;
         Open;
      end;

   HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
//   DateFrom.Date := Date;
   DateTo.Date := Date
end;

procedure TfSlghtPremRep.sbViewClick(Sender: TObject);
var
   Over8mths : tDateTime;
begin
   Over8mths := IncMonth(Date,-8);
   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('Delete from TmpSlghtRep ');
         ExecSQL;

         SQL.Clear;
         SQL.Add('INSERT INTO TmpSlghtRep ( AnimalID, AnimalNo,   SortAnimalNo,   NatIDNum,   SortNatIDNum, ');
         SQL.Add('                          DOB, Sex, Breed, LactNo, SaleDate )');
         SQL.Add('SELECT DISTINCT           A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, ');
         SQL.Add('                          A.DateOfBirth, A.Sex, B.Name, A.LactNo, E.EventDate');
         SQL.Add('FROM Animals A ');
         SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
         SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)');
         SQL.Add('LEFT JOIN SalesDeaths S ON (E.ID=S.EventID)');
         SQL.Add('LEFT JOIN Customers C ON (C.ID=S.Customer)');
         if Length(HerdCombo.Value) > 0 then
            SQL.Add('WHERE (A.HerdID= "'+HerdCombo.Value+'")')
         else
            SQL.Add('WHERE (A.HerdID<> "'+IntToStr(WinData.NONEHerdID)+'")');
         case rgSex.ItemIndex of
            1 : begin
                   SQL.Add('AND A.Sex="Female" ');
                   lSex.Caption := 'Female';
                end;
            2 : begin
                   SQL.Add('AND A.Sex<>"Female"   ');
                   lSex.Caption := 'Male';
                end;
            3 : begin
                   SQL.Add('AND A.Sex="Bull"   ');
                   lSex.Caption := 'Bull';
                end;
            4 : begin
                   SQL.Add('AND A.Sex="Steer"  ');
                   lSex.Caption := 'Steer';
                end;
         else
            lSex.Caption := 'All';
         end;
         SQL.Add('AND (A.DateOfBirth IS NOT NULL) ');
//         SQL.Add('AND (A.DateOfBirth < "'+FormatDateTime('mm/dd/yyyy',Over8mths)+'")');
         SQL.Add('AND (A.AnimalDeleted=FALSE)');
         SQL.Add('AND (A.InHerd=False)');
         SQL.Add('AND (E.EventType = ' + IntToStr(CSaleDeathEvent) + ')');
         SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',StrToDate(DateFrom.Text)) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',StrToDate(DateTo.Text)) + '''' + ')');
         SQL.Add('AND (S.Slaughter = TRUE)');   // Licensed Meat Exporters only
         SQL.Add('AND (C.Slaughter = TRUE)');   // Licensed Meat Exporters only
         ExecSQL;
       end;
       LoadOtherData;

       // Euro/pound facility
       if WinData.UseEuro AND NOT(WinData.ReportInEuro) then
             with MyQuery do
                begin
                   SQL.Clear;
                   SQL.Add('UPDATE TmpSlghtRep SET Amount = (Amount*'+FloatToStr(cEuro)+') ');
                   ExecSQL;
                end;

       with MyQuery do
          begin
             VerNo.Caption := 'Herd Management '+ HerdVerNo;
             SQL.Clear;
             SQL.Add('Select * From TmpSlghtRep ');
             SQL.Add('Where Include="True" ');
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
   lDateFrom.Caption := DateFrom.Text;
   lDateTo.Caption := DateTo.Text;
   lHerd.Caption := HerdCombo.Text;
   if (Sender as TRxSpeedButton).Hint = 'view' then
      qrSlghtPremRep.Preview
   else
      begin
         qrSlghtPremRep.Print;
         qrSlghtPremRep.Font.Color := clBlack;
      end;
   pb.Hide;
end;

procedure TfSlghtPremRep.LoadOtherData;
var
   TwoMonthCutOff : TDateTime;
   S : String;
   i : integer;
begin

   i := 0;
   pb.Max := MyTable.RecordCount div 2;
   if pb.Max > 0 then
      pb.Show;
   pb.Min := 0;
   with MyTable do
      begin
         First;
         while NOT Eof do
            begin
               Edit;
               if NOT(CheckSlaughter) then
                  MyTable.FieldByName('Include').AsBoolean := FALSE
               else
                  MyTable.FieldByName('Include').AsBoolean := TRUE;
               Post;
               Next;
               inc(i);
               pb.position := i;
            end;
      end;

   with MyTable do
      begin
         First;
         while NOT Eof do
            begin
               Edit;
               if MyTable.FieldByName('Include').AsBoolean then
                  if ((Uppercase(MyTable.FieldByName('Sex').AsString)='FEMALE') and (MyTable.FieldByName('LactNo').AsInteger = 0)) then
                     begin
                        if HeiferCalc then
                           MyTable.FieldByName('Amount').AsFloat := WinData.SlghtAmount + WinData.SlghtTopupAmount
                        else
                           MyTable.FieldByName('Amount').AsFloat := WinData.SlghtAmount;
                     end
                  else
                     MyTable.FieldByName('Amount').AsFloat := WinData.SlghtAmount;
               Post;
               Next;
               inc(i);
               pb.position := i;
            end;
      end;
end;

procedure TfSlghtPremRep.sbExitClick(Sender: TObject);
begin
   Close;
end;

function TfSlghtPremRep.HeiferCalc: Boolean;
var
   CalcYear,
   CalcMonth,
   CalcDay,
   ThirtyMonth : string;
   dThirty,
   dThirtyDate : TDateTime;
begin
   RESULT := False;

   CalcDay   := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),1,2);
   CalcMonth := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),4,2);
   CalcYear  := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),7,4);
   if (CalcMonth = '01') or (CalcMonth = '02') then
      ThirtyMonth := (CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2))
   else if (CalcMonth = '04') or (CalcMonth = '06') then
      ThirtyMonth := (CalcDay+'/'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2))
   else if (CalcMonth = '03') then
      begin
         if (StrToInt(CalcDay)>30) then
            ThirtyMonth := ('30/0'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2))
         else
            ThirtyMonth := (CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2));
      end
   else if (CalcMonth = '05') then
      begin
         if (StrToInt(CalcDay)>30) then
            ThirtyMonth := ('30/'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2))
         else
            ThirtyMonth := (CalcDay+'/'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2));
      end
   else if (CalcMonth = '07') or (CalcMonth = '09') or (CalcMonth = '11') then
      ThirtyMonth := (CalcDay+'/'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3))
   else if (CalcMonth = '08') and (StrToInt(CalcDay)>28) then
      begin
         if (((StrToInt(CalcYear)-1) MOD 4)=0) then
            ThirtyMonth := ('29/0'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3))
         else
            ThirtyMonth := ('28/0'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3));
      end
   else
      begin
         if (StrToInt(CalcDay)>30) then
            ThirtyMonth := ('30/0'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3))
         else
            ThirtyMonth := (CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3));
      end;
   // check if eligible
   if (MyTable.FieldByName('SaleDate').AsDateTime > 0) then
      if (StrToDate(ThirtyMonth) >= MyTable.FieldByName('SaleDate').AsDateTime) then
         RESULT := True;
end;


function TfSlghtPremRep.CheckSlaughter: Boolean;
var
   CalcDay,
   CalcMonth,
   CalcYear : String;
   CalcDay2,
   CalcMonth2,
   CalcYear2 : String;
   EligibleDate : TDateTime;
begin
   RESULT := False;
   // calculate from birth date
   CalcDay   := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),1,2);
   CalcMonth := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),4,2);
   CalcYear  := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),7,4);
   // adjust up eight months from dob
   case StrToInt(CalcMonth) of
      01:begin
            if StrToInt(CalcDay) > 30 then
               EligibleDate := StrToDate('30/0'+IntToStr(StrToInt(CalcMonth)+8)+'/'+CalcYear)
            else
               EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)+8)+'/'+CalcYear);
         end;
      02:begin
            EligibleDate := StrToDate(CalcDay+'/'+IntToStr(StrToInt(CalcMonth)+8)+'/'+CalcYear);
         end;
      03:begin
            if StrToInt(CalcDay) > 30 then
               EligibleDate := StrToDate('30/0'+IntToStr(StrToInt(CalcMonth)+8)+'/'+CalcYear)
            else
               EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)+8)+'/'+CalcYear);
         end;
      04:begin
            EligibleDate := StrToDate(CalcDay+'/'+IntToStr(StrToInt(CalcMonth)+8)+'/'+CalcYear);
         end;
      05:begin
            EligibleDate := StrToDate(CalcDay+'/'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
         end;
      06:begin
            if StrToInt(CalcDay) > 28 then
               begin
                  // check for leap year
                  if (((StrToInt(CalcYear)+1) mod 4)=0) then
                     EligibleDate := StrToDate('29/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1))
                  else
                     EligibleDate := StrToDate('28/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
               end
            else
               EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
         end;
      07:begin
            EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
         end;
      08:begin
            if StrToInt(CalcDay) > 30 then
               EligibleDate := StrToDate('30/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1))
            else
               EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
         end;
      09:begin
            EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
         end;
      10:begin
            if StrToInt(CalcDay) > 30 then
               EligibleDate := StrToDate('30/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1))
            else
               EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
         end;
      11:begin
            EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
         end;
      12:begin
            EligibleDate := StrToDate(CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-4)+'/'+IntToStr(StrToInt(CalcYear)+1));
         end;
   end;
   // check > 8 months from dob
   if (MyTable.FieldByName('SaleDate').AsDateTime)<(EligibleDate) then
      Exit;
   // if purchased calculate from event date
   if WinData.CheckEvents.Locate('AnimalID;EventType',
                            VarArrayOf([MyTable.FieldByName('AnimalID').AsInteger,cPurchaseEvent]),[]) then
      begin
         CalcDay   := Copy(FormatDateTime('dd/mm/yyyy',WinData.CheckEvents.FieldByName('EventDate').AsDateTime),1,2);
         CalcMonth := Copy(FormatDateTime('dd/mm/yyyy',WinData.CheckEvents.FieldByName('EventDate').AsDateTime),4,2);
         CalcYear  := Copy(FormatDateTime('dd/mm/yyyy',WinData.CheckEvents.FieldByName('EventDate').AsDateTime),7,4);
      end
   else
      begin
         // calculate from birth date
         CalcDay   := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),1,2);
         CalcMonth := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),4,2);
         CalcYear  := Copy(FormatDateTime('dd/mm/yyyy',MyTable.FieldByName('DOB').AsDateTime),7,4);
      end;
   // calculate two month date
   if (CalcMonth = '07') and (CalcDay = '31') then
      begin
         CalcDay2   := '30';
         CalcMonth2 := IntToStr(StrToInt(CalcMonth)+2);
         CalcYear2  := CalcYear;
      end
   else if (CalcMonth = '12') and (StrToInt(CalcDay)>28) then
      begin
         if (((StrToInt(CalcYear)+1) MOD 4)=0) then
            CalcDay2 := '29'
         else
            CalcDay2 := '28';
         CalcMonth2  := IntToStr(StrToInt(CalcMonth)-10);
         CalcYear2   := IntToStr(StrToInt(CalcYear)+1);
      end
   else if (CalcMonth = '11') or (CalcMonth = '12') then
      begin
         CalcDay2   := CalcDay;
         CalcYear2  := IntToStr(StrToInt(CalcYear)+1);
         CalcMonth2 := IntToStr(StrToInt(CalcMonth)-10);
      end
   else
      begin
         CalcDay2   := CalcDay;
         CalcMonth2 := IntToStr(StrToInt(CalcMonth)+2);
         CalcYear2  := CalcYear;
      end;
   // convert back to date time
   EligibleDate := StrToDate(CalcDay2+'/'+CalcMonth2+'/'+CalcYear2);
   // check eligibility
   if MyTable.FieldByName('SaleDate').AsDateTime <> 0 then
      begin
         if (MyTable.FieldByName('SaleDate').AsDateTime)>=(EligibleDate) then
            RESULT := True;
      end;
end;

procedure TfSlghtPremRep.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if MyQuery.RecordCount <= 0 then
      PrintBand := False;
end;

procedure TfSlghtPremRep.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(sbView.Glyph, cBtnImgPreview);
   WinData.LoadBtnImage(sbPrint.Glyph, cBtnImgPrint);
   WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
end;

end.
