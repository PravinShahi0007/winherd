{
   01/08/12 [V5.0 R8.3] /MK Change - LoadAnimals - GetWeighingEventDetails - Purchase Weight should always be the last weighing event found.
}
unit uGroupReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, ComCtrls, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup,
  RXCtrls, ToolWin, QRCtrls, QuickRpt, Db, DBTables, QRExport;

type
  TGroupReport = class(TReportsBaseForm)
    GroupTable: TTable;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape4: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape5: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    lGrpName: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel39: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    lFQAStatus: TQRLabel;
    qrdbFQAS: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrlCustomer: TQRLabel;
    qrlSaleDate: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure QRDateLabelHandler(sender: TObject; var Value: String);
    procedure cbUseFilterClick(Sender: TObject);
    procedure SubDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private
    { Private declarations }
     GroupLoaded : Boolean;
     FCustomerName : string;
     FSaleDate : TDateTime;
     FList : TList;
     procedure LoadAnimals;
     procedure CreateTable;
  public
    { Public declarations }
  end;

  procedure Preview(const GrpName, IDField : String; Alist : TList;
      ACustomerName : string; ASaleDate : TDateTime );

const
   DescIndexIdent = 'd';

var
  GroupReport: TGroupReport;

implementation
uses
   GenTypesConst, DairyData, KRoutines, KDBRoutines, HealthData, uHerdOwner,
  uHerdLookup;

{$R *.DFM}

  procedure Preview(const GrpName, IDField : String; Alist : TList;
      ACustomerName : string; ASaleDate : TDateTime );
  var
     i : Integer;
  begin
     Application.CreateForm(TGroupReport, GroupReport);
     try

        GroupReport.FCustomerName := ACustomerName;
        GroupReport.FSaleDate := ASaleDate;
        GroupReport.FList := TList.Create;
        for i := 0 to ( AList.Count-1 ) do
           begin
              if ( AList.Items[i] <> nil ) then
                 begin
                    try
                       GroupReport.FList.Add(AList.Items[i]);
                    except
                    end;
                 end;
           end;
        GroupReport.lGrpName.Caption := UPPERCASE(GrpName);
        GroupReport.ShowModal;
     finally
      //  GroupReport.GroupTable.Close;
      //  GroupReport.GroupTable.DeleteTable;
        if GroupReport.FList <> nil then
           GroupReport.FList.Free;
        FreeAndNil(GroupReport.GroupTable);
        FreeAndNil(GroupReport);
     end;
  end;

{ TReportsBaseForm1 }

procedure TGroupReport.LoadAnimals;
var
   PurchRec : PPurchaseRecord;
   WeighRec : PWeighingRecord;
   NoDaysOnFarm : Integer;
   OnDate, OffDate : TDateTime;
   i, HerdID : Integer;
begin
   GetMem(PurchRec, SizeOf(TPurchaseRecord));
   GetMem(WeighRec, SizeOf(TWeighingRecord));

   WinData.LookupTablesActive(TRUE, [WinData.LookupPurchases, WinData.LookupWeighings]);

   if cbHerdIdentity.Value<>'' then
      HerdID := StrToInt(cbHerdIdentity.Value);

{   for i := 0 to ( FList.Count-1 ) do
      begin
         if ( FList.Items[i] <> nil ) then
            begin
               GroupTable.Append;
               try
                  GroupTable.FieldByName('AID').AsInteger := integer(FList.Items[i]);
                  GroupTable.Post;
               except
                  GroupTable.Cancel;
               end;
            end;
      end; }


   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'animals';
         Active := True;

         InitProgress(1, FList.Count, 1, 'Please wait...');
         for i := 0 to ( FList.Count-1 ) do
         if ( FList.Items[i] <> nil ) then
            begin

               if Locate('ID', integer(FList.Items[i]), []) then
                  begin

                     if (HerdID>0) then
                        begin
                           if (FieldByName('HerdID').AsInteger <> HerdID) then
                              begin
                                 Continue;
                              end;
                        end;
                     // only include InHerd animals
                     if FieldByName('InHerd').AsBoolean then
                        begin

                           GroupTable.Append;
                           GroupTable.FieldByName('AID').AsInteger := integer(FList.Items[i]);
                           GroupTable.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                           GroupTable.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                           GroupTable.FieldByName('SortNatID').AsString := FieldByName('SortNatID').AsString;
                           GroupTable.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                           GroupTable.FieldByName('DOB').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                           if WinData.Breeds.Locate('ID', FieldByName('PrimaryBreed').AsInteger, []) then
                              GroupTable.FieldByName('BreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString;

                           GroupTable.FieldByName('TBTestDate').AsDateTime := FieldByName('TBTestDate').AsDateTime;
                           GroupTable.FieldByName('BruceTestDate').AsDateTime := FieldByName('Brucellosis').AsDateTime;

                           //Get Colour name
                           If (FieldByName('Colour').AsInteger>0) then
                              GroupTable.FieldByName('ColourCode').AsString := HerdLookup.ColourDetailsByID( FieldByName('Colour').AsInteger, 'LookupCode');

                           GroupTable.FieldByName('MaxDrugWithdrawal').AsDateTime := THealthData.GetMaxWithDrawalDate(FieldByName('ID').AsInteger);


                           WinData.GetPurchaseEventDetails(GroupTable.Fields[1].AsInteger, PurchRec);
                           if ( PurchRec^.Date > 0 ) then
                              begin
                                 OnDate := PurchRec^.Date;
                                 GroupTable.FieldByName('PurchDate').AsDateTime := PurchRec^.Date;
                                 //GroupTable.FieldByName('PurchSupplier').AsString := PurchRec^.sSupplier;
                                 //GroupTable.FieldByName('PurchBuyer').AsString := PurchRec^.sBuyer;
                                 if ( PurchRec^.Price ) > 0 then
                                    GroupTable.FieldByName('PurchPrice').AsFloat  := PurchRec^.Price;
                                 if ( PurchRec^.Weight ) > 0 then
                                    GroupTable.FieldByName('PurchWeight').AsFloat := PurchRec^.Weight;
                              end
                           else
                              OnDate := GroupTable.FieldByName('DOB').AsDateTime;

                           //SaleDate := GetLastEventDate(GroupTable.Fields[1].AsInteger, -1, cSaleDeathEvent);

                           if ( FSaleDate > 0 ) then
                              OffDate := FSaleDate
                           else
                              OffDate := Date;

                           NoDaysOnFarm := Trunc( OffDate - OnDate );
                           if ( NoDaysOnFarm > 0 ) then
                              begin
                                 GroupTable.FieldByName('DaysOnFarm').AsInteger := NoDaysOnFarm;
                                 if (GroupTable.FieldByName('DaysOnFarm').AsInteger > 90) then
                                    GroupTable.FieldByName('FQAStatus').AsString := 'Yes'
                                 else
                                    GroupTable.FieldByName('FQAStatus').AsString := 'No';
                              end;

                           //  01/08/12 [V5.0 R8.3] /MK Change - Purchase Weight should always be the last weighing event found.
                           WinData.GetWeighingEventDetails(GroupTable.Fields[1].AsInteger, -1, 'Last', WeighRec);

                           if ( WeighRec^.Date > 0 ) then
                              begin
                                 GroupTable.FieldByName('LastWeighingDate').AsDateTime := WeighRec^.Date;
                                 GroupTable.FieldByName('OnFarmWeight').AsFloat := WeighRec^.Weight;
                              end;

                           GroupTable.FieldByName('AnimalComments').Value := HerdLookup.GetAnimalComments(GroupTable.FieldByName('AID').AsInteger);

                           GroupTable.Post;
                        end;
                  end;
               StepProgress();
            end;
      finally
         Free;
         FreeMem(PurchRec);
         FreeMem(WeighRec);
         WinData.LookupTablesActive(FALSE, [WinData.LookupPurchases, WinData.LookupWeighings]);
         ResetProgress;
      end;
end;

procedure TGroupReport.FormCreate(Sender: TObject);
begin
  inherited;
  ShowAllHerds := True;
  GroupBox1.Caption := 'Select sort options';
  LFromDate.Hide;
  FromDate.Hide;
  LToDate.Hide;
  ToDate.Hide;
  ToolButton5.Hide;
  rgSortBy.Items.Clear;
  rgSortBy.Items.Add('&National ID Number');
  rgSortBy.Items.Add('&Sex');
  rgSortBy.Items.Add('&Breed Code');
  rgSortBy.Items.Add('&Date Of Birth');
  rgSortBy.Items.Add('&Purchase Date');
  rgSortBy.Items.Add('Purc&hase Price');
  rgSortBy.Items.Add('Purchase &Weight');
  rgSortBy.Items.Add('Days On &Farm');
  rgSortBy.Items.Add('&Last Weighing Date');
  rgSortBy.Items.Add('&On Farm Weight');
  rgSortBy.Columns   := 2;
  rgSortBy.ItemIndex := 0;
  sbHelp.Visible  := False;
  pHerdID.Visible := True;
  cbHerdIdentity.Value := IntToStr(WinData.UserDefaultHerdID);
end;

procedure TGroupReport.sbViewClick(Sender: TObject);
var
   IndexSortField : string;
begin
  inherited;
  try
//     if ( not GroupLoaded ) then
     CreateTable;
     GroupReport.LoadAnimals;

     if ( GroupTable.RecordCount > 0 ) then
        begin
           case rgSortBy.ItemIndex of
              0 : IndexSortField := 'iSortNatID';
              1 : IndexSortField := 'iSex';
              2 : IndexSortField := 'iBreedCode';
              3 : IndexSortField := 'iDOB';
              4 : IndexSortField := 'iPurchDate';
              5 : IndexSortField := 'iPurchPrice';
              6 : IndexSortField := 'iPurchWeight';
              7 : IndexSortField := 'iDaysOnFarm';
              8 : IndexSortField := 'iLastWeighingDate';
              9 : IndexSortField := 'iOnFarmWeight';
           else
              MessageDlg('Invalid sort selection',mtError,[mbOK],0);
           end;

           if ( rgSortOrder.ItemIndex = 1 ) then
              Insert(DescIndexIdent, IndexSortField, 2);

           if ( GroupTable.IndexDefs.Find(IndexSortField) <> nil ) then
              GroupTable.IndexName := IndexSortField
           else
              MessageDlg('Invalid sort index',mtError,[mbOK],0);

           qrlSortBy.Caption := SortByField;
           qrlSortOrder.Caption := SortByOrder;
           qrlCustomer.Caption := FCustomerName;
           if FSaleDate > 0 then
              qrlSaleDate.Caption := FormatDate(FSaleDate, dsIrish);


           qrdbFQAS.DataField := '';
           lFQAStatus.Caption := '';


           try
              if (cbHerdIdentity.Value<>'0') then
                 begin
                    HerdLookup.HerdOwnerData.HerdID := StrToInt(cbHerdIdentity.Value);
                    qrlHerdIdentity.Caption := HerdLookup.HerdOwnerData.HerdIdentity;
                 end
              else
                 qrlHerdIdentity.Caption := 'All Herds';
           except
                 qrlHerdIdentity.Caption := '';
           end;


           if ((HerdOwnerData.RegisteredCountry = NIreland) and (HerdOwnerData.FQAS)) or (System_Registered_Country = NIreland) then
              begin
                 qrdbFQAS.DataField := 'FQAStatus';
                 lFQAStatus.Caption := 'FQA Status';
              end
           else
              begin
                 qrdbFQAS.DataField := '';
                 lFQAStatus.Caption := '';
              end;

           BaseReport.Preview;
        end
     else
        MessageDlg('No animals found in group',mtInformation,[mbOK],0);
  finally
     GroupTable.Active := False;
     GroupTable.DeleteTable;
     EnableViewPrintButtons(True);
  end;
end;


procedure TGroupReport.QRDateLabelHandler(sender: TObject;
  var Value: String);
begin
  inherited;
//
end;

procedure TGroupReport.cbUseFilterClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TGroupReport.SubDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

  if (GroupTable.FieldByName('DOB').AsDateTime < IncMonth(Date, -30)) then
     SubDetailBand.Font.Color := clRed
  else
     SubDetailBand.Font.Color := clNavy;

end;

procedure TGroupReport.QRDBText5Print(sender: TObject; var Value: String);
begin
  inherited;
  if GroupTable.FieldByName('MaxDrugWithdrawal').AsDateTime <= 0 then
     Value := ''
  else if (GroupTable.FieldByName('MaxDrugWithdrawal').AsDateTime > FSaleDate) then
     Value := '**'+ Value +'**';

end;

procedure TGroupReport.QRDBText12Print(sender: TObject; var Value: String);
begin
  inherited;
  if UPPERCASE(Value) = UPPERCASE(cSex_Female) then
     Value := 'F'
  else if UPPERCASE(Value) = UPPERCASE(cSex_Bull) then
     Value := 'B'
  else if UPPERCASE(Value) = UPPERCASE(cSex_Steer) then
     Value := 'S';

end;

procedure TGroupReport.CreateTable;
begin
        with GroupReport.GroupTable do
           begin
              DatabaseName := AliasName;
              TableName := 'tGrpAnimals';
              if Exists then
                 DeleteTable;

              FieldDefs.Clear;
              FieldDefs.Add('ID', ftAutoInc);
              FieldDefs.Add('AID', ftInteger);
              FieldDefs.Add('AnimalNo', ftString,10);
              FieldDefs.Add('NatIDNum', ftString,20);
              FieldDefs.Add('SortNatID', ftString,20);
              FieldDefs.Add('Sex', ftString,6);
              FieldDefs.Add('BreedCode', ftString,6);
              FieldDefs.Add('DOB', ftDate);
              { Purch Info }
              FieldDefs.Add('PurchDate', ftDate);
              //FieldDefs.Add('PurchSupplier', ftstring,30);
              //FieldDefs.Add('PurchBuyer', ftstring,30);
              FieldDefs.Add('PurchPrice', ftFloat);
              FieldDefs.Add('PurchWeight', ftFloat);
              { On-Farm Info }
              FieldDefs.Add('DaysOnFarm', ftFloat);
              FieldDefs.Add('LastWeighingDate', ftDate);
              FieldDefs.Add('OnFarmWeight', ftFloat);
              FieldDefs.Add('FQAStatus', ftString, 3);
              FieldDefs.Add('ColourCode', ftString, 6);
              FieldDefs.Add('TBTestDate', ftDateTime);
              FieldDefs.Add('BruceTestDate', ftDateTime);
              FieldDefs.Add('MaxDrugWithdrawal', ftDateTime);
              FieldDefs.Add('AnimalComments', ftMemo);

              { Sale Info }

              IndexDefs.Clear;

              { Primary }
              IndexDefs.Add('iID', 'ID', [ixUnique,ixPrimary]);
              //IndexDefs.Add('iAID', 'AID', [ixUnique]);
              { Ascending }
              IndexDefs.Add('iNatIDNum', 'NatIDNum', [ixCaseInsensitive]);
              IndexDefs.Add('iSortNatID', 'SortNatID', [ixCaseInsensitive]);
              IndexDefs.Add('iSex', 'Sex', [ixCaseInsensitive]);
              IndexDefs.Add('iBreedCode', 'BreedCode', [ixCaseInsensitive]);
              IndexDefs.Add('iDOB', 'DOB', [ixCaseInsensitive]);
              IndexDefs.Add('iPurchDate', 'PurchDate', [ixCaseInsensitive]);
              //IndexDefs.Add('iPurchSupplier', 'PurchSupplier', [ixCaseInsensitive]);
             // IndexDefs.Add('iPurchBuyer', 'PurchBuyer', [ixCaseInsensitive]);
              IndexDefs.Add('iPurchPrice', 'PurchPrice', [ixCaseInsensitive]);
              IndexDefs.Add('iPurchWeight', 'PurchWeight', [ixCaseInsensitive]);
              IndexDefs.Add('iDaysOnFarm', 'DaysOnFarm', [ixCaseInsensitive]);
              IndexDefs.Add('iLastWeighingDate', 'LastWeighingDate', [ixCaseInsensitive]);
              IndexDefs.Add('iOnFarmWeight', 'OnFarmWeight', [ixCaseInsensitive]);

              { Descending }
              IndexDefs.Add('idNatIDNum', 'NatIDNum', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idSortNatID', 'SortNatID', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idSex', 'Sex', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idBreedCode', 'BreedCode', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idDOB', 'DOB', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idPurchDate', 'PurchDate', [ixCaseInsensitive, ixDescending]);
              //IndexDefs.Add('idPurchSupplier', 'PurchSupplier', [ixCaseInsensitive, ixDescending]);
              //IndexDefs.Add('idPurchBuyer', 'PurchBuyer', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idPurchPrice', 'PurchPrice', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idPurchWeight', 'PurchWeight', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idDaysOnFarm', 'DaysOnFarm', [ixCaseInsensitive, ixDescending]);
              IndexDefs.Add('idLastWeighingDate', 'LastWeighingDate', [ixCaseInsensitive,ixDescending]);
              IndexDefs.Add('idOnFarmWeight', 'OnFarmWeight', [ixCaseInsensitive, ixDescending]);

              GroupReport.GroupTable.CreateTable;
              GroupReport.GroupTable.Active := True;
       end;

end;

end.
