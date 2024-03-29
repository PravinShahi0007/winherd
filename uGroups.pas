unit uGroups;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  cxMaskEdit, cxDropDownEdit, cxLabel, cxTextEdit, StdCtrls, cxButtons,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxEdit,
  cxGroupBox, cxPC, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxDBEdit, Groups, Db, dxmdaset, ExtCtrls, cxDBLabel,
  dbTables, uAnimalCart, cxCustomData, GenTypesConst;

type
  TfmGroups = class(TfmBaseForm)
    PageControl: TcxPageControl;
    tsGroupSelection: TcxTabSheet;
    tsGroupAnimals: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    btnAddNewGroup: TcxButton;
    actAdd: TAction;
    actSave: TAction;
    btnSaveGroup: TcxButton;
    btnCancelGroup: TcxButton;
    actCancel: TAction;
    teCode: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    teDescription: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    GroupGrid: TcxGrid;
    GroupGridDBTableView: TcxGridDBTableView;
    GroupGridLevel: TcxGridLevel;
    cxLabel6: TcxLabel;
    teCountOfAnimalsInGroup: TcxTextEdit;
    cxButton1: TcxButton;
    cxGroupBox3: TcxGroupBox;
    gbSourcePanel: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    SourceGridDBTableView: TcxGridDBTableView;
    SourceGridLevel: TcxGridLevel;
    SourceGrid: TcxGrid;
    teSourceSearchText: TcxTextEdit;
    cxButton5: TcxButton;
    teTargetSearchText: TcxTextEdit;
    cxButton6: TcxButton;
    dxBarLargeButton1: TdxBarLargeButton;
    actOptions: TAction;
    SourceData: TdxMemData;
    SourceDataId: TIntegerField;
    SourceDataAnimalNo: TStringField;
    SourceDataNatIdNum: TStringField;
    SourceDataSortAnimalNo: TStringField;
    SourceDataSortNatIdNum: TStringField;
    SourceDataDateOfBirth: TDateTimeField;
    SourceDataSex: TStringField;
    SourceDataBreedCode: TStringField;
    SourceDataLactNo: TIntegerField;
    TargetData: TdxMemData;
    TargetDataId: TIntegerField;
    TargetDataAnimalNo: TStringField;
    TargetDataNatIdNum: TStringField;
    TargetDataSortAnimalNo: TStringField;
    TargetDataSortNatIdNum: TStringField;
    DateTimeField1: TDateTimeField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField2: TIntegerField;
    dsSourceData: TDataSource;
    actAddToGroup: TAction;
    actRemoveFromGroup: TAction;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    deMoveDate: TcxDBDateEdit;
    GroupGridDBTableViewID: TcxGridDBColumn;
    GroupGridDBTableViewCode: TcxGridDBColumn;
    GroupGridDBTableViewGroupType: TcxGridDBColumn;
    GroupGridDBTableViewDescription: TcxGridDBColumn;
    GroupGridDBTableViewSelected: TcxGridDBColumn;
    GroupGridDBTableViewEventDate: TcxGridDBColumn;
    GroupGridDBTableViewDestSource: TcxGridDBColumn;
    GroupGridDBTableViewCrushLoadComplete: TcxGridDBColumn;
    Image1: TImage;
    Image2: TImage;
    SourceGridDBTableViewRecId: TcxGridDBColumn;
    SourceGridDBTableViewId: TcxGridDBColumn;
    SourceGridDBTableViewAnimalNo: TcxGridDBColumn;
    SourceGridDBTableViewNatIdNum: TcxGridDBColumn;
    SourceGridDBTableViewSortAnimalNo: TcxGridDBColumn;
    SourceGridDBTableViewSortNatIdNum: TcxGridDBColumn;
    SourceGridDBTableViewDateOfBirth: TcxGridDBColumn;
    SourceGridDBTableViewSex: TcxGridDBColumn;
    SourceGridDBTableViewBreedCode: TcxGridDBColumn;
    SourceGridDBTableViewLactNo: TcxGridDBColumn;
    TargetGrid: TcxGrid;
    TargetGridDBTableView: TcxGridDBTableView;
    TargetGridLevel: TcxGridLevel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    SourceCountLabel: TcxLabel;
    TargetCountLabel: TcxLabel;
    Image3: TImage;
    cxTextEdit1: TcxTextEdit;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    dsTargetData: TDataSource;
    TargetGridDBTableViewRecId: TcxGridDBColumn;
    TargetGridDBTableViewId: TcxGridDBColumn;
    TargetGridDBTableViewAnimalNo: TcxGridDBColumn;
    TargetGridDBTableViewNatIdNum: TcxGridDBColumn;
    TargetGridDBTableViewSortAnimalNo: TcxGridDBColumn;
    TargetGridDBTableViewSortNatIdNum: TcxGridDBColumn;
    TargetGridDBTableViewDateOfBirth: TcxGridDBColumn;
    TargetGridDBTableViewSex: TcxGridDBColumn;
    TargetGridDBTableViewBreedCode: TcxGridDBColumn;
    TargetGridDBTableViewLactNo: TcxGridDBColumn;
    btnSearchSource: TcxButton;
    btnSearchTarget: TcxButton;
    actExecuteSourceSearch: TAction;
    actExecuteTargetSearch: TAction;
    cmboGroupType: TcxDBComboBox;
    cxButton2: TcxButton;
    act: TAction;
    procedure PageControlDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure SourceGridDBTableViewSelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure TargetGridDBTableViewSelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure FormCreate(Sender: TObject);
    procedure PageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TargetGridDBTableViewDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TargetGridDBTableViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure actExecuteSourceSearchExecute(Sender: TObject);
    procedure actExecuteTargetSearchExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure GroupGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure teSourceSearchTextMouseLeave(Sender: TObject);
    procedure teSourceSearchTextExit(Sender: TObject);
    procedure TargetDataAfterOpen(DataSet: TDataSet);
    procedure TargetDataAfterDelete(DataSet: TDataSet);
    procedure actRemoveFromGroupExecute(Sender: TObject);
    procedure actRemoveFromGroupUpdate(Sender: TObject);
  private
    { Private declarations }
    FQuery : TQuery;
    FSearchOnAnimalNoField : Boolean;
    procedure SetupGroupSelectionTabPage();
    procedure SetupAnimalSelectionTabPage();
    procedure LoadSourceData();
    procedure LoadTargetData();
    function CopyToTargetData(AAnimalId : Integer) : Boolean;
    procedure ProcessSelectedSourceRow(ARowIndex: Integer; ARowInfo: TcxRowInfo);
    procedure RemoveSelectedTargetRow(ARowIndex: Integer; ARowInfo: TcxRowInfo);

    function SearchForAnimal(const ASearchText : string; AGridView : TcxGridDBTableView;
       const AIsSearchOnAnimalNoField : Boolean;
       const AStartIndex : Integer = 0) : Integer;
    procedure ExecuteSearch(ATextEdit : TcxTextEdit;
        AButton : TcxButton; AGridView : TcxGridDBTableView);

    function IsGroupsSelected : Boolean;
    procedure OnGroupRecordChanged();

    procedure UpdateGroup(AGroup: TGroup);
    procedure UpdateSourceInfo();
    procedure UpdateTargetInfo();

    procedure RemoveSelectedFromTarget();
    procedure Compare(ASource, ATarget : TDataset);

  public
    { Public declarations }
    class procedure ShowGroups(ADefaultGroupType : TGroupType);overload;
    class procedure ShowGroups(ADefaultGroupType : TGroupType; var AGroupId : Integer);overload;
    class procedure ShowGroupsWithBeefControls(ADefaultGroupType : TGroupType);overload;
    class procedure ShowGroupsWithBeefControls(ADefaultGroupType : TGroupType; var AGroupId : Integer);overload;
  end;

var
  fmGroups: TfmGroups;

implementation

uses uImageStore, DairyData, KRoutines;

{$R *.DFM}

procedure TfmGroups.PageControlDrawTabEx(AControl: TcxCustomTabControl;
  ATab: TcxTab; Font: TFont);
begin
  inherited;
   Font.Style := [fsBold];
   if ( ATab.Index = PageControl.ActivePageIndex) then
      begin
         ATab.Color := clWhite;
         Font.Color := clBlack;
      end
   else
      begin
         ATab.Color := 536870912;
         Font.Color := clBlack;
      end;
end;

class procedure TfmGroups.ShowGroups(ADefaultGroupType: TGroupType);
begin
   with TfmGroups.Create(nil) do
      try

         ShowModal;
      finally
         Free;
      end;
end;

class procedure TfmGroups.ShowGroups(ADefaultGroupType: TGroupType;
  var AGroupId: Integer);
begin

end;

class procedure TfmGroups.ShowGroupsWithBeefControls(
  ADefaultGroupType: TGroupType);
begin

end;

class procedure TfmGroups.ShowGroupsWithBeefControls(
  ADefaultGroupType: TGroupType; var AGroupId: Integer);
begin

end;

procedure TfmGroups.UpdateGroup(AGroup: TGroup);
begin
   gbSourcePanel.Caption := Format('%d animals that can be moved into %s',[AGroup.Description]);

end;

procedure TfmGroups.SourceGridDBTableViewSelectionChanged(
  Sender: TcxCustomGridTableView);
var
  Count : Integer;
begin
  inherited;
  Count := SourceGridDBTableView.DataController.GetSelectedCount;
  SourceCountLabel.Caption := Format('%d',[Count]);
end;

procedure TfmGroups.TargetGridDBTableViewSelectionChanged(
  Sender: TcxCustomGridTableView);
var
  Count : Integer;
begin
  inherited;
  Count := TargetGridDBTableView.DataController.GetSelectedCount;
  TargetCountLabel.Caption := Format('%d',[Count]);
end;

procedure TfmGroups.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  PageControl.ActivePage := nil;

  FQuery := TQuery.Create(nil);
  FQuery.DatabaseName := AliasName;

  FSearchOnAnimalNoField := (WinData.SearchField = 'AnimalNo');

  cmboGroupType.RepositoryItem := WinData.eriGroupTypes;

  teCountOfAnimalsInGroup.Style.StyleController := WinData.ReadOnlyEditStyleController;
end;

procedure TfmGroups.PageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
   if (NewPage = tsGroupSelection) then
      begin
         SetupGroupSelectionTabPage();
      end
   else if (NewPage = tsGroupAnimals) then
      begin
         if not IsGroupsSelected then
            begin
               AllowChange := False;
               MessageDLG('Before you can add/remove animals to/from a group you need to setup a group. '+ cCRLF +
                          'Click the '+ actAdd.Caption +' button to add a new group.',mtinformation,[mbOK],0);
               Exit;
            end;

         SetupAnimalSelectionTabPage();
      end;
end;

procedure TfmGroups.SetupAnimalSelectionTabPage;
begin
   Screen.Cursor := crHourGlass;
   try
      // Target data must be loaded first, so we can
      // exclude animals from source that also exist
      // in target.
      LoadTargetData();

      LoadSourceData();

      Compare(SourceData,TargetData);

      UpdateTargetInfo();

      UpdateTargetInfo;
   finally
      Screen.Cursor := crDefault;
   end;

end;

procedure TfmGroups.SetupGroupSelectionTabPage;
begin
   WinData.Groups.First;
   OnGroupRecordChanged();
end;

procedure TfmGroups.FormShow(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := tsGroupSelection;
end;

procedure TfmGroups.TargetGridDBTableViewDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := True;
end;

procedure TfmGroups.TargetGridDBTableViewDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  ControlObject : TcxDragControlObject;
  GridSite : TcxGridSite;
begin
  inherited;
  if (Source is TcxDragControlObject) then
     begin
        ControlObject := Source as TcxDragControlObject;
        if (ControlObject.Control is TcxGridSite) then
           begin
               GridSite := (ControlObject.Control as TcxGridSite);
               if (GridSite <> nil) then
                  GridSite.GridView.DataController.ForEachRow(True, ProcessSelectedSourceRow);
           end;
     end;
end;

// Load all animals into source, but exclude animals if exist in target data.
// If cart is active and not empty load animals from cart, otherwise
// load animals from default filter.
procedure TfmGroups.LoadSourceData;
begin
   if (not(TargetData.Active)) then
      begin
         MessageDlg('TargetData must be active before loading source data.',mtError,[mbOK],0);
         Exit;
      end;

   SourceData.Active := False;
   SourceData.Active := True;

   with FQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.Id, A.AnimalNo, A.SortAnimalNo, A.NatIdNum,');
         SQL.Add('                A.SortNatId, A.DateOfBirth, A.Sex, A.LactNo,');
         SQL.Add('                B.Code');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');

         if ( not(AnimalCart.IsEmpty) ) then
            SQL.Add(Format('Where Id IN %s',[AnimalCart.AnimalCartDataAsWideString]))
         else
            SQL.Add('WHERE A.ID IN (SELECT DISTINCT F.AID FROM afilters F )');

         if (WinData.SearchField = 'AnimalNo') then
            SQL.Add('ORDER BY SortAnimalNo')
         else
            SQL.Add('ORDER BY SortNatId');

         Active := True;
         try
            SourceData.LoadFromDataSet(FQuery);
         finally
            Active := False;
         end;
      except
         on e : exception do
            begin
               MessageDlg('Failed to load source data - ' + e.Message,mtError,[mbOK],0);
            end;
      end;
end;

procedure TfmGroups.LoadTargetData;
var
   AnimalArray : TIntegerArray;
begin
   TargetData.Active := False;
   TargetData.Active := True;

   AnimalArray := WinData.GroupManager.GetAnimalsInGroup(WinData.GroupsID.AsInteger);
   if Length(AnimalArray) <= 0 then Exit;

   with FQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.Id, A.AnimalNo, A.SortAnimalNo, A.NatIdNum,');
         SQL.Add('                A.SortNatId, A.DateOfBirth, A.Sex, A.LactNo,');
         SQL.Add('                B.Code');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
         SQL.Add(Format('WHERE A.ID IN %s',[KRoutines.IntArrayToSQLInString(AnimalArray)]));
         if (WinData.SearchField = 'AnimalNo') then
            SQL.Add('ORDER BY SortAnimalNo')
         else
            SQL.Add('ORDER BY SortNatId');
         Active := True;
         try
            TargetData.LoadFromDataSet(FQuery);
         finally
            Active := False;
         end;
      except
         on e : exception do
            begin
               MessageDlg('Failed to load target data - ' + e.Message,mtError,[mbOK],0);
            end;
      end;
end;

procedure TfmGroups.FormDestroy(Sender: TObject);
begin
  inherited;

  SourceData.Close;
  TargetData.Close;

  if (FQuery <> nil) then
     begin
        FQuery.Close;
        FreeAndNil(FQuery);
     end;
end;

procedure TfmGroups.ProcessSelectedSourceRow(ARowIndex: Integer;
  ARowInfo: TcxRowInfo);
var
   AnimalId : Variant;
   GroupId : Integer;
   Added : Boolean;
begin
   AnimalId := SourceGridDBTableView.DataController.Values[ARowInfo.RecordIndex, SourceGridDBTableViewId.Index];
   if (VarIsNull(AnimalId)) then Exit;

   GroupId := WinData.GroupsID.AsInteger;

   if (WinData.GroupsGroupType.AsString = 'Batch') then
      begin
         Added := WinData.GroupManager.AddToBatchGroup(GroupId, AnimalId);

         if (Added) then
            CopyToTargetData(AnimalId)
         else
            MessageDlg('Copying animal to target destination failed.',mtError,[mbOK],0);
      end;
   // else if ...
end;


function TfmGroups.CopyToTargetData(AAnimalId: Integer): Boolean;
var
   i : Integer;
   Field : TField;
begin
   Result := False;
   if SourceData.Locate('Id', AAnimalId,[]) then
      begin

         // Check animal isn't already in target table.
         if TargetData.Locate('Id', AAnimalId,[]) then
            begin
               Exit;
            end;

         // Add animal from source to target
         TargetData.Append;
         try
            for i := 1 to SourceData.FieldCount-1 do
               begin
                  Field := TargetData.FindField(SourceData.Fields[i].FieldName);
                  if (Field <> nil) then
                     Field.Value := SourceData.Fields[i].Value;
               end;
            TargetData.Post;
         except
            TargetData.Cancel;
            MessageDlg('Copying animal to target destination failed.',mtError,[mbOK],0);
         end;
      end;
end;

function TfmGroups.SearchForAnimal(const ASearchText : string;
   AGridView : TcxGridDBTableView;
   const AIsSearchOnAnimalNoField : Boolean;
   const AStartIndex : Integer) : Integer;
var
  SearchText : string;
  StartIndex : Integer;
  FieldValue : Variant;
  i : Integer;
  SearchColumn : TcxGridDBColumn;
begin
  inherited;
  Result := -1;

  SearchText := UPPERCASE(ASearchText);

  if not AIsSearchOnAnimalNoField then
     // allow setting of StartIndex
     begin
        if (AStartIndex >= 0) then
            StartIndex := AStartIndex
        else
            StartIndex := 0;
     end
  else
     StartIndex := 0;

  SearchColumn := AGridView.GetColumnByFieldName(WinData.SearchField);
  if SearchColumn = nil then Exit;

  with AGridView do
     begin
        Screen.Cursor := crHourGlass;
        DataController.BeginLocate;
        try
           if Trim(ASearchText) = '' then
              begin
                 DataController.DataSet.First;
                 Exit;
              end;

           with ViewData do
              begin
                 for i := StartIndex to RowCount - 1 do
                    begin
                       FieldValue := VarToStr(Rows[i].Values[SearchColumn.Index]);

                       if VarIsNull(FieldValue) then Continue;

                       FieldValue := UPPERCASE(FieldValue);
                       if (AIsSearchOnAnimalNoField) then
                          begin
                             if (SearchText = Copy(FieldValue, 1, Length(SearchText))) then
                                begin
                                   DataController.FocusedRecordIndex := Rows[i].RecordIndex;
                                   Result := DataController.FocusedRecordIndex;
                                   Break;
                                end;
                          end
                       else if Pos(SearchText, FieldValue) > 0 then
                          begin
                             DataController.FocusedRecordIndex := Rows[i].RecordIndex;
                             Result := DataController.FocusedRecordIndex;
                             Break;
                          end;
                    end;
              end;
        finally
           DataController.EndLocate;
           Screen.Cursor := crDefault;
        end;
     end;
end;

function TfmGroups.IsGroupsSelected: Boolean;
begin
   Result := WinData.Groups.Active and not(WinData.Groups.IsEmpty);
end;

procedure TfmGroups.ExecuteSearch(ATextEdit: TcxTextEdit;
  AButton: TcxButton; AGridView: TcxGridDBTableView);
var
   SearchResult : Integer;
   StartIndex : Integer;
   MessageSubText : string;
   Action : TAction;
begin
  inherited;
  Action := nil;

  if (AButton = nil) or (AButton.Action = nil ) then
     begin
        Exit;
     end;

  if (AButton.Action is TAction) then
     begin
        Action := AButton.Action as TAction;
     end;

  if (Action = nil) then Exit;

  StartIndex := -1;

  if (not FSearchOnAnimalNoField) then
     StartIndex := AGridView.Controller.FocusedRowIndex+1;

  if StartIndex < 0 then StartIndex := 0;


  SearchResult := SearchForAnimal(ATextEdit.Text, AGridView, FSearchOnAnimalNoField, StartIndex);
  if (SearchResult = -1) then // didn't find any animals matching criteria
     begin
        if StartIndex > 0 then
           MessageSubText := 'further '
        else
           MessageSubText := '';
        AGridView.DataController.FocusedRowIndex := 0;
        MessageDlg(Format('The search for "%s" did not return any %sresults.',[teSourceSearchText.Text, MessageSubText]),mtInformation,[mbOK],0);

        if not (FSearchOnAnimalNoField) then
           begin
              Action.Caption := 'Search';
              AButton.SetFocus;
           end;
     end
  else // animal found..
     begin
        if (not FSearchOnAnimalNoField) then
           begin
              // Need to update action caption to indicate start of or continued search.
              if Action.Caption = 'Search' then
                 Action.Caption := 'Continue';
              AButton.SetFocus;
           end;
     end;
end;

procedure TfmGroups.actExecuteSourceSearchExecute(Sender: TObject);
begin
  inherited;
  ExecuteSearch(teSourceSearchText,btnSearchSource,SourceGridDBTableView);
end;

procedure TfmGroups.actExecuteTargetSearchExecute(Sender: TObject);
begin
  inherited;
  ExecuteSearch(teTargetSearchText,btnSearchTarget,TargetGridDBTableView);
end;

procedure TfmGroups.actAddExecute(Sender: TObject);
begin
  inherited;
  if ( WinData.Groups.Active ) and not (WinData.Groups.State in dsEditModes) then
     begin
        WinData.Groups.Append;
        try
           teCode.SetFocus;
        except
        end;
     end;
end;

procedure TfmGroups.actAddUpdate(Sender: TObject);
begin
  inherited;
  actAdd.Enabled := ( WinData.Groups.Active ) and not (WinData.Groups.State in dsEditModes);
end;

procedure TfmGroups.actSaveExecute(Sender: TObject);
begin
  inherited;
  if (WinData.Groups.State in dsEditModes) then
     try
        WinData.Groups.Post;
     except
        on e : exception do
           begin
              WinData.Groups.Cancel;
              MessageDlg('Error posting record - '+ e.Message,mtError,[mbOK],0);
           end;
     end;
end;

procedure TfmGroups.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := (WinData.Groups.State in dsEditModes);
end;

procedure TfmGroups.actCancelExecute(Sender: TObject);
begin
  inherited;
  if (WinData.Groups.State in dsEditModes) then
     try
        WinData.Groups.Cancel;
     except
        on e : exception do
           begin
              MessageDlg('Error cancelling record - '+ e.Message,mtError,[mbOK],0);
           end;
     end;
end;

procedure TfmGroups.actCancelUpdate(Sender: TObject);
begin
  inherited;
  actCancel.Enabled := (WinData.Groups.State in dsEditModes);
end;

procedure TfmGroups.GroupGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  OnGroupRecordChanged();
end;

procedure TfmGroups.OnGroupRecordChanged;
begin
   teCountOfAnimalsInGroup.Text := IntToStr(Windata.GroupManager.GetNumberOfAnimalsInGroup(WinData.GroupsID.AsInteger));
end;

procedure TfmGroups.teSourceSearchTextMouseLeave(Sender: TObject);
begin
  inherited;
  if (Trim(teSourceSearchText.Text) = '') then
     teSourceSearchText.Text := 'Search by Nat. Id. No.';
end;

procedure TfmGroups.teSourceSearchTextExit(Sender: TObject);
begin
  inherited;
  if (teSourceSearchText.Text = 'Search by Nat. Id. No.') then
     teSourceSearchText.Text := '';
end;

procedure TfmGroups.TargetDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  UpdateTargetInfo();
end;

procedure TfmGroups.TargetDataAfterDelete(DataSet: TDataSet);
begin
  inherited;
  UpdateTargetInfo();
end;

procedure TfmGroups.UpdateSourceInfo;
begin
end;

procedure TfmGroups.UpdateTargetInfo;
begin
end;

procedure TfmGroups.RemoveSelectedFromTarget;
begin
   with TargetGridDBTableView.Controller do
      begin
         if (SelectedRowCount <= 0 ) then
            begin
               Exit;
            end;

         TargetGridDBTableView.DataController.ForEachRow(True, RemoveSelectedTargetRow);
      end;
end;

procedure TfmGroups.RemoveSelectedTargetRow(ARowIndex: Integer;
  ARowInfo: TcxRowInfo);
var
   AnimalId : Variant;
   GroupId : Integer;
begin
   AnimalId := TargetGridDBTableView.DataController.Values[ARowInfo.RecordIndex, TargetGridDBTableViewId.Index];
   if (VarIsNull(AnimalId)) then Exit;

   GroupId := WinData.GroupsID.AsInteger;

   if ( WinData.GroupManager.RemoveAnimalFromGrp(AnimalId,GroupId) ) then
      begin
         TargetData.DisableControls;
         try
            if (TargetData.Locate('Id', AnimalId,[])) then
               TargetData.Delete;
         finally
            TargetData.EnableControls;
         end;
     end;

   // else if ...

end;

procedure TfmGroups.actRemoveFromGroupExecute(Sender: TObject);
begin
  inherited;
  RemoveSelectedFromTarget();
end;

procedure TfmGroups.actRemoveFromGroupUpdate(Sender: TObject);
begin
  inherited;
  actRemoveFromGroup.Enabled := (TargetData.Active) and (TargetData.RecordCount>0);
end;

procedure TfmGroups.Compare(ASource, ATarget: TDataset);
begin
   // Remove any animals from source that are also in the target.
   ASource.First;
   ATarget.First;
end;

end.
