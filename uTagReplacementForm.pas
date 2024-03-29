{
   27/10/11 [V5.0 R1.6] /MK Additional Feature - Added Warning For Current Prices.

   21/03/12 [V5.0 R4.5] /MK Change - Disable btnNext On FormCreate & Enable btnNext OnNewRecord Event Of mdReplacementTagList.

   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

   21/11/12 [V5.1 R3.2] /MK Additional Feature - Added SortNatID field to sort by tag no.
                                               - CreateTagLookupList - Added new procedure to generate lookup list ordered by tag no.

   23/02/16 [V5.5 R4.1] /MK Change - QRLabel5 - The Vat Rate is now changed to 23% instead of 21% - Des Cunningham.
}

unit uTagReplacementForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, QRCtrls, Db, DBTables, QRExport, QuickRpt, StdCtrls,
  ComCtrls, ExtCtrls, Mask, ToolEdit, RxLookup, RXCtrls, ToolWin,
  cxTextEdit, cxCurrencyEdit, cxButtons, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, dxmdaset, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxLabel, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxLookupDBGrid, cxFilter, uTagReplacements,
  cxCheckBox;

type
  TfmTagReplacementForm = class(TReportsBaseForm)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrmAddress: TQRMemo;
    qrlName: TQRLabel;
    qrlTelephoneNo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    cmboTags: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    ReplacementTagsGridDBTableView: TcxGridDBTableView;
    ReplacementTagsGridLevel: TcxGridLevel;
    ReplacementTagsGrid: TcxGrid;
    mdReplacementTagList: TdxMemData;
    mdReplacementTagListTagNo: TStringField;
    mdReplacementTagListQty: TIntegerField;
    dsmdReplacementTagList: TDataSource;
    ReplacementTagsGridDBTableViewRecId: TcxGridDBColumn;
    ReplacementTagsGridDBTableViewTagNo: TcxGridDBColumn;
    ReplacementTagsGridDBTableViewQty: TcxGridDBColumn;
    btnAddTag: TcxButton;
    GroupBox2: TGroupBox;
    btnPreview: TcxButton;
    cePairCost: TcxCurrencyEdit;
    teNoOfSingles: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    teNoOfPairs: TcxTextEdit;
    ceSingleCost: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    ceTotalSingleTagsCost: TcxCurrencyEdit;
    ceTotalPairTagsCost: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    cePostageCost: TcxCurrencyEdit;
    cxLabel9: TcxLabel;
    ceTotalDue: TcxCurrencyEdit;
    btnBack: TcxButton;
    btnNext: TcxButton;
    QRDBText1: TQRDBText;
    mdReplacementTagListHerdID: TIntegerField;
    mdReplacementTagListReview: TdxMemData;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    btnRemoveTag: TcxButton;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape5: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlNoOfSingles: TQRLabel;
    qrlNoOfPairs: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    qrlSingleCost: TQRLabel;
    qrlPairCost: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    qrlSingleTotal: TQRLabel;
    qrlPairTotal: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qrlPostAndPackage: TQRLabel;
    qrlTotalDue: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    mdReplacementTagListOrderDate: TDateTimeField;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel5: TQRLabel;
    lWarning: TcxLabel;
    cbFavourite: TcxCheckBox;
    ReplacementTagsGridDBTableViewSortTagNo: TcxGridDBColumn;
    mdReplacementTagListSortNatID: TStringField;
    mdReplacementTagListReviewSortNatID: TStringField;
    procedure btnNextClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddTagClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure ceSingleCostPropertiesChange(Sender: TObject);
    procedure cmboTagsPropertiesInitPopup(Sender: TObject);
    procedure cbHerdIdentityChange(Sender: TObject);
    procedure btnRemoveTagClick(Sender: TObject);
    procedure BaseReportAfterPrint(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mdReplacementTagListNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure ReplacementTagsGridDBTableViewSortTagNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
  private
    { Private declarations }
    SaveToDataStore : Boolean;
    TagReplacements : TTagReplacements;
    FAutoLoadCart : Boolean;
    FLookupTagsQuery : TQuery;
    FLookupTagsSource : TDataSource;
    function NoOfPairs : Integer;
    function NoOfSingles : Integer;
    procedure GetActiveGroupBox(const Value: Integer);
    procedure DoCalcs;
    procedure CheckPairs;
    procedure ImportFromPDA;
    procedure ConfirmImportFromAnimalCart;
    procedure ImportFromAnimalCart;
    property ActiveGroupBox : Integer write GetActiveGroupBox;
    function GetSortNatID ( ANatIDNum : String ) : String;
    //   21/11/12 [V5.1 R3.2] /MK Additional Feature - Added new procedure to generate lookup list ordered by tag no.
    procedure CreateTagLookupList;
  public
    { Public declarations }
    class function Execute( AFromMainScreenClick : Boolean ; const AAutoLoadCart : Boolean=False) : Boolean;
  end;

var
  fmTagReplacementForm: TfmTagReplacementForm;
  FFromMainScreenClick : Boolean;

implementation

uses DairyData, GenTypesConst, uAnimalCart, FileCtrl;

{$R *.DFM}

function TfmTagReplacementForm.NoOfPairs: Integer;
begin
   Result := 0;
   with mdReplacementTagList do
      begin
         DisableControls;
         First;
         try
            while not eof do
               begin
                  if FieldByName('Qty').AsInteger = 2 then
                     Inc(Result);
                  Next;
               end;
         finally
            First;
            EnableControls;
         end;
      end;
end;

function TfmTagReplacementForm.NoOfSingles: Integer;
begin
   Result := 0;
   with mdReplacementTagList do
      begin
         DisableControls;
         First;
         try
            while not eof do
               begin
                  if FieldByName('Qty').AsInteger = 1 then
                     Inc(Result);
                  Next;
               end;
         finally
            First;
            EnableControls;
         end;
      end;
end;

procedure TfmTagReplacementForm.btnNextClick(Sender: TObject);
begin
  inherited;
  if mdReplacementTagList.State in dsEditModes then
     mdReplacementTagList.Post;

  teNoOfSingles.Text := IntToStr(NoOfSingles);
  teNoOfPairs.Text := IntToStr(NoOfPairs);
  DoCalcs;
  ActiveGroupBox := 1;
end;

procedure TfmTagReplacementForm.GetActiveGroupBox(const Value: Integer);
var
   i : Integer;
begin
   for i := 0 to ComponentCount-1 do
      if (Components[i] is TGroupBox) then
         begin
            (Components[i] as TGroupBox).Visible := ((Components[i] as TGroupBox).Tag = Value );
         end;
end;

procedure TfmTagReplacementForm.btnBackClick(Sender: TObject);
begin
  inherited;
  ActiveGroupBox := 0;
end;

procedure TfmTagReplacementForm.FormCreate(Sender: TObject);
begin
  inherited;
  SaveToDataStore := False;

  TagReplacements := TTagReplacements.Create;

  mdReplacementTagList.Active := True;
  ActiveGroupBox := 0;

  ceSingleCost.Value := TagReplacements.SingleTagPrice;
  cePairCost.Value := TagReplacements.PairTagPrice;
  cePostageCost.Value := TagReplacements.PostAndPackage;
  ShowAllHerds := WinData.UserDefaultHerdID<>WinData.NONEHerdID;

  //   21/03/12 [V5.0 R4.5] /MK Change - Disable btnNext On FormCreate.
  btnNext.Enabled := False;

  CreateTagLookupList;
end;

procedure TfmTagReplacementForm.FormDestroy(Sender: TObject);
begin
  inherited;
  TagReplacements.SingleTagPrice := ceSingleCost.Value;
  TagReplacements.PairTagPrice := cePairCost.Value;
  TagReplacements.PostAndPackage := cePostageCost.Value;
  FreeAndNil(TagReplacements);
  mdReplacementTagList.Active := False;

  if ( FLookupTagsQuery.Active ) then
     begin
        FLookupTagsQuery.Close;
        FLookupTagsQuery.Free;

        FreeAndNil(FLookupTagsSource);
     end;
end;

procedure TfmTagReplacementForm.btnAddTagClick(Sender: TObject);
begin
  inherited;
  if VarIsNull(cbHerdIdentity.KeyValue) then
     begin
        MessageDlg('You must select a herd before continuing.',mtInformation,[mbOK],0);
        cbHerdIdentity.DropDown;
        Exit;
     end;

  if not VarIsNull(cmboTags.EditValue) then
     begin
        if not mdReplacementTagList.Locate('TagNo', cmboTags.EditValue, [loCaseInsensitive]) then
           begin
              mdReplacementTagList.Append;
              mdReplacementTagList.FieldByName('TagNo').AsString := cmboTags.EditValue;
              mdReplacementTagList.FieldByName('SortNatID').AsString := GetSortNatID(cmboTags.EditValue);
              mdReplacementTagList.FieldByName('Qty').AsInteger := 1;
              mdReplacementTagList.FieldByName('HerdID').AsInteger := cbHerdIdentity.KeyValue;
              mdReplacementTagList.FieldByName('OrderDate').AsDateTime := Date;
              mdReplacementTagList.Post;
           end
        else
           MessageDlg('This tag no. is already listed!',mtInformation,[mbOK],0);
     end;
end;

class function TfmTagReplacementForm.Execute(AFromMainScreenClick : Boolean; const AAutoLoadCart : Boolean) : Boolean;
begin
   with TfmTagReplacementForm.Create(nil) do
      try
         FAutoLoadCart := AAutoLoadCart;
         FFromMainScreenClick := AFromMainScreenClick;
         if FAutoLoadCart then
            ImportFromAnimalCart;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmTagReplacementForm.btnPreviewClick(Sender: TObject);
var
  slAdd : TStringList;
begin
  inherited;
  mdReplacementTagListReview.LoadFromDataSet(mdReplacementTagList);
  mdReplacementTagListReview.Active := True;
  CheckPairs;

  slAdd := TStringList.Create;
  try
     if Windata.OwnerFile.Locate('ID', cbHerdIdentity.KeyValue,[]) then
        begin
           qrlName.Caption := WinData.OwnerFileName.AsString;
           qrlHerdIdentity.Caption := WinData.OwnerFileHerdIdentity.AsString;
           if Trim(WinData.OwnerFileAddress1.AsString) <> '' then
              slAdd.Add(WinData.OwnerFileAddress1.AsString);
           if Trim(WinData.OwnerFileAddress1.AsString) <> '' then
              slAdd.Add(WinData.OwnerFileAddress2.AsString);
           if Trim(WinData.OwnerFileAddress1.AsString) <> '' then
              slAdd.Add(WinData.OwnerFileAddress3.AsString);
           if Trim(WinData.OwnerFileAddress1.AsString) <> '' then
              slAdd.Add(WinData.OwnerFileAddress4.AsString);
           qrmAddress.Lines.Text := slAdd.Text;
           qrlTelephoneNo.Caption := WinData.OwnerFilePhone.AsString;
        end;
  finally
     FreeAndNil(slAdd);
  end;

  qrlNoOfSingles.Caption := teNoOfSingles.Text;
  qrlNoOfPairs.Caption := teNoOfPairs.Text;
  qrlSingleCost.Caption := FloatToStrF(ceSingleCost.Value, ffFixed, 8, 2);
  qrlPairCost.Caption := FloatToStrF(cePairCost.Value, ffFixed, 8, 2);
  qrlSingleTotal.Caption := FloatToStrF(ceTotalSingleTagsCost.Value, ffFixed, 8, 2);
  qrlPairTotal.Caption := FloatToStrF(ceTotalPairTagsCost.Value, ffFixed, 8, 2);
  qrlPostAndPackage.Caption := FloatToStrF(cePostageCost.Value, ffFixed, 8, 2);
  qrlTotalDue.Caption := FloatToStrF(ceTotalDue.Value, ffFixed, 8, 2);

  BaseReport.Preview;
  mdReplacementTagListReview.Active := False;

  if SaveToDataStore then
     TagReplacements.AddToDataStore(mdReplacementTagList);
end;

procedure TfmTagReplacementForm.DoCalcs;
begin
   ceTotalSingleTagsCost.Value := NoOfSingles*ceSingleCost.Value;
   ceTotalPairTagsCost.Value := NoOfPairs*cePairCost.Value;
   ceTotalDue.Value := ceTotalSingleTagsCost.Value+ceTotalPairTagsCost.Value+cePostageCost.Value;
end;

procedure TfmTagReplacementForm.ceSingleCostPropertiesChange(
  Sender: TObject);
begin
  inherited;
  DoCalcs;
end;

procedure TfmTagReplacementForm.CheckPairs;
var
   TagNo : string;
   BK : TBookmark;
begin
   with mdReplacementTagListReview do
      begin
         DisableControls;
         First;
         try
            while not eof do
               begin
                  if mdReplacementTagListReview.FieldByName('Qty').AsInteger = 2 then
                     begin
                        BK := GetBookmark;
                        try
                           TagNo := mdReplacementTagListReview.FieldByName('TagNo').AsString;
                           mdReplacementTagListReview.Append;
                           mdReplacementTagListReview.FieldByName('TagNo').AsString := TagNo;
                           mdReplacementTagListReview.Post;
                        finally
                           GotoBookmark(BK);
                           FreeBookmark(BK);

                        end;
                     end;
                  Next;
               end;
         finally
            First;
            EnableControls;
         end;
      end;
end;

procedure TfmTagReplacementForm.cmboTagsPropertiesInitPopup(
  Sender: TObject);
var
  LGrid: TcxCustomLookupDBGrid;
  colHerdID : TcxLookupDBGridColumn;
begin
   inherited;
   if (Sender is TcxDBLookupComboBox) or (Sender is TcxLookupComboBox) then
      begin
         LGrid := TcxLookupComboBox(Sender).Properties.Grid;
         colHerdID := LGrid.Columns.ColumnByFieldName('HerdID');

         if ( colHerdID <> nil ) then
            with LGrid.DataController.Filter do
               begin
                  Root.Clear;
                  Active := False;
                  if (cbHerdIdentity.KeyValue>0) then
                     begin
                        Root.AddItem(colHerdID, foEqual, cbHerdIdentity.KeyValue,'');
                        Active := True;
                     end;
               end;
      end;
end;

procedure TfmTagReplacementForm.cbHerdIdentityChange(Sender: TObject);
begin
  inherited;
   with mdReplacementTagList do
      begin

         if not Active then Exit;

         cmboTags.EditValue := Null;

         DisableControls;
         First;
         try
            while not eof do
               begin
                  if mdReplacementTagList.FieldByName('HerdID').AsInteger <> cbHerdIdentity.KeyValue then
                     mdReplacementTagList.Delete
                  else
                     mdReplacementTagList.Next;
               end;
         finally
            First;
            EnableControls;
         end;
      end;
end;

procedure TfmTagReplacementForm.btnRemoveTagClick(Sender: TObject);
begin
  inherited;
  if not mdReplacementTagList.IsEmpty then
     mdReplacementTagList.Delete;
end;

procedure TfmTagReplacementForm.BaseReportAfterPrint(Sender: TObject);
begin
  inherited;
  SaveToDataStore := True;
end;

procedure TfmTagReplacementForm.ImportFromPDA;
var
   b : boolean;
begin
   if not DirectoryExists(PDAImportDir) then Exit;

   with TTable.Create(nil) do
      try
         DatabaseName := PDAImportDir;
         TableName := 'PDAEvents';
         if exists then
            begin
               Active := True;

               Filter := 'Code=''Z'' And HerdIdentity = '''+cbHerdIdentity.Text+'''';
               Filtered := True;
               try
                  b := FindFirst;

                  if b then
                     begin
                        if MessageDlg('Lost tag numbers have been recorded in the PDA download.'+ cCRLF + cCRLF +
                                      'Do you want to import tag numbers?',mtConfirmation,[mbyes,mbNo],0) = idYes then
                         begin
                            while b do
                               begin
                                  mdReplacementTagList.Append;
                                  mdReplacementTagListTagNo.AsString := FieldByName('NationalID').AsString;
                                  mdReplacementTagListSortNatID.AsString := GetSortNatID(FieldByName('NationalID').AsString);
                                  if FieldByName('Quantity').AsInteger > 0 then
                                     mdReplacementTagListQty.AsInteger := FieldByName('Quantity').AsInteger
                                  else
                                     mdReplacementTagListQty.AsInteger := 1;
                                  mdReplacementTagList.Post;
                                  b := FindNext;
                               end;

                             with TQuery.Create(nil) do
                                try
                                   DatabaseName := PDAImportDir;
                                   SQL.Add('Delete From PDAEvents Where Code=''Z'' And HerdIdentity = "'+cbHerdIdentity.Text+'"');
                                   ExecSQL;
                                finally
                                   Free;
                                end;
                         end;
                     end;
               finally
                  Filter := '';
                  Filtered := False;
               end;
            end;
      finally
         if Active then
            Active := False;
         Free;
      end;

end;

procedure TfmTagReplacementForm.FormActivate(Sender: TObject);
begin
  inherited;
  ImportFromPDA;
  if not FAutoLoadCart then
     ConfirmImportFromAnimalCart;
  OnActivate := nil;
end;

procedure TfmTagReplacementForm.ConfirmImportFromAnimalCart;
begin
   if not AnimalCart.IsEmpty then
      if MessageDlg('Do you want to import tag number from animal cart?',mtConfirmation,[mbyes,mbNo],0) = idYes then
         ImportFromAnimalCart;
end;

procedure TfmTagReplacementForm.ImportFromAnimalCart;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select NatIDNum, SortNatID From Animals');
         SQL.Add(Format('Where ID IN %s',[AnimalCart.AnimalCartDataAsWideString]));
         Open;
         try
            First;
            while not eof do
               begin
                  mdReplacementTagList.Append;
                  mdReplacementTagListTagNo.AsString := FieldByName('NatIDNum').AsString;
                  mdReplacementTagListSortNatID.AsString := FieldByName('SortNatID').AsString;
                  mdReplacementTagListQty.AsInteger := 1;
                  mdReplacementTagList.Post;
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmTagReplacementForm.QRLabel5Print(sender: TObject;
  var Value: String);
begin
  inherited;

  if Windata.SystemRegisteredCountry <> Ireland then
     Value := '';

end;

procedure TfmTagReplacementForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if not(SaveToDataStore) then // the tag numbers have not been preview/printed by user.
     begin
        CanClose := Application.MessageBox(Pchar('The "Replacement Tag Order Form" has not been printed.'+#13#10+#13#10+'Are you sure you want to exit?'),'Warning',mb_yesno+MB_ICONEXCLAMATION+MB_DEFBUTTON2) =idYes;
     end;
end;

//   21/03/12 [V5.0 R4.5] /MK Change - New OnNewRecord Event Added To mdReplacementTagList To Enable btnNext.
procedure TfmTagReplacementForm.mdReplacementTagListNewRecord(
  DataSet: TDataSet);
begin
   inherited;
   if ( not(btnNext.Enabled) ) then
      btnNext.Enabled := True;
end;

procedure TfmTagReplacementForm.FormShow(Sender: TObject);
begin
  inherited;
  WinData.UpdateRecentReportUsage(cTagReplaceRep);
  if FFromMainScreenClick then
     cbFavourite.Visible := False
  else
     cbFavourite.Checked := WinData.IsReportFavourite(cTagReplaceRep);
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TfmTagReplacementForm.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cTagReplaceRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cTagReplaceRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

function TfmTagReplacementForm.GetSortNatID(ANatIDNum: String): String;
begin
   if ANatIDNum = '' then Exit;

   Result := '';
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT SortNatID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE NatIDNum = "'+ANatIDNum+'" ');
         Open;
         try
            First;
            if Fields[0].AsString <> '' then
               Result := Fields[0].AsString;
         finally
            Close;
         end;
      finally
         Free;
      end;

end;

procedure TfmTagReplacementForm.ReplacementTagsGridDBTableViewSortTagNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[ReplacementTagsGridDBTableViewTagNo.Index]
   else
      AText := '';
end;

procedure TfmTagReplacementForm.CreateTagLookupList;
begin
  FLookupTagsQuery := TQuery.Create(nil);
  with FLookupTagsQuery do
     begin
        DatabaseName := AliasName;
        SQL.Clear;
        SQL.Add('SELECT NatIDNum, HerdID, SortNatID');
        SQL.Add('FROM Animals');
        SQL.Add('WHERE (InHerd = True)');
        SQL.Add('AND   (AnimalDeleted = False)');
        SQL.Add('AND   (HerdID = '+IntToStr(cbHerdIdentity.KeyValue)+')');
        SQL.Add('ORDER BY SortNatID');
        Open;

        if RecordCount > 0 then
           begin
              FLookupTagsSource := TDataSource.Create(nil);
              FLookupTagsSource.DataSet := FLookupTagsQuery;

              cmboTags.Properties.ListSource := FLookupTagsSource;
           end;
     end;
end;

end.
