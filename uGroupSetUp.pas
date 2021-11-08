{
 major alterations and modifications - aug'00 - kr
 _____________________________________________________________________________

 SP 23/10/2002:-

 New Variable FormType
 Assigned value when form is created.
 Used On Form Activate to enter default group details if
 FromType = 1 <- Created from Beef Purchase Group Screen.

 New procedure ShowTheForm(Ind, GroupID);
 This returns the last used groupID to the calling component.

 SP 23/10/2002.
 _____________________________________________________________________________

 11/05/11 [V4.1 R1.1] /MK Additional Feature - Add Group Name To CheckIfInGroup Message

 18/04/12 [V5.0 R5.0] /MK Bug Fix - DBGAnimalsTitleClick - ColumnIndex Not Changed To Take In Account When FQAS Filed Was Added.
                                  - Program Was Not Taking Animals That Were In The Cart.

 19/04/12 [V5.0 R5.1] /MK Additional Feature - If ParlourType Is DairyMaster Then Allow Drafting Group Type.

 23/11/12 [V5.1 R1.2] /MK Bug Fix -  deMovedDateOnExit - Program allowed sale date to be entered in the future.

 28/03/13 [V5.1 R5.4] /MK Change - Changed Customers/Supplier Combo.LookupSource to look at new WinData.QueryCustomers/QuerySuppliers. 

 13/09/13 [V5.2 R1.2] /MK Additional Feature - FormActivate - Insert record at start of Group Grid so user can see grid ordered by
                                                              last entered record while adding a new record.
                                             - Take sort field and sort order from Menu Unit using WinData.FMainGridSortBy and WinData.FMainGridSortOrder.

 03/10/13 [V5.2 R3.0] /MK Bug Fix - FormActivate - Change state of table to insert after DBGGroups sort changes state to browse.

 30/11/13 [V5.2 R6.5] /MK Bug Fix - AddToGroup - If Feed Group then allocate feed with FeedRegimeID to FeedEvents table.
                          Additional Feature - Change lMoveFeedDate to AllocDate and when AddToGroup make sure that deMoveFeedDate has a date.
                                             - If Feed Event then on AddToGroup allocate feed based on deMoveFeedDate but check for purchase date
                                               after deMoveFeedDate or date of birth after deMoveFeedDate.

 06/02/14 [V5.2 R8.1] /MK Bug Fix - HerdSync was causing the WinData.Groups to be reset which caused GroupID in qAnimalsNotInGroup to
                                    go up by one which in turn was not adding animals to the group.
                                  - FUpdatedGroupArray - Added an integer array to store the GroupID's that were updated.
                                                         Pass these GroupID's through uHerdSync.ResetSyncFlagForGroup.

 07/02/14 [V5.2 R8.1] /MK Change - deMoveFeedDate - Only show warning if GroupType is Purchase or Feed.

 28/04/15 [V5.4 R5.2] /MK Change - NoInGroupAfterScroll - Changed GroupCount to TEdit instead DBEdit. Set Text of TEdit to WinData.NoInGroup - L.Clerkin.

 13/08/15 [V5.4 R7.4] /MK Additional Feature - Added OnKeyDown for AnimalNo field that will automatically select/deselect an animal - John Buckley request.

 18/07/16 [V5.5 R6.7] /MK Bug Fix - FormActivate - GenerateGroupCode_DescByDate - New procedure created to create the group code by date properly.
                                                   This procedure will allow for the automatic creation of sales and purchase group code and description
                                                   since the introduction of the ban on duplicate group codes and descriptions for the App.

 14/09/17 [V5.7 R3.0] /MK Bug Fix - PartialSearch - Now using LocateNatID to allow the user to search any amount of characters without using spaces.
                          Change - When the user presses the enter key in the Part Nat ID box the program now searchs by the Part Nat ID.

 18/09/17 [V5.7 R3.0] /MK Change - GroupClear - Used groups single procedure to remove the animal from the group and end its feed if FeedGroup.
                                              - Added progress bar to let the user know whats going on with the clear.
                                 - Removed AddToGroup and CheckIfInGroup as now use Groups unit for this.
                                 - Don't show MoveDate label and date select if feed group as new uAllocatedFeedToAnimal takes care of this.
                                 - AddRemove - Added checks for animals in group here as AddToGroup no longer used.
                                             - Get animal details for new uAllocateFeedToAnimal unit.
                                             - If the animal exists and the feed group has an active feed regime then bring up uAllocateFeedToAnimal unit.
                                             - The user must select an allocation date if it is in a feed group.
                                             - If the animals has an existing group then remove it from the group and end its feed on the allocation date selected from uAllocateFeedToAnimal unit.
                                             - If not a feed group then set the group start date to today.
                                             - Use Groups.GroupManager.AddToGroup here.
                                 - FormCloseQuery - Use InArray check here from KRoutines.
                                 - SelectAll - If feed group and group has active feed regime then user must select an allocation date from uAllocateFeedToAnimal.
                                             - Group start date if feed is allocation date, else, it is today.
                                             - Added progress bar to let the user know whats going on with the clear.
                                             - Use Groups.GroupManager.AddToGroup here.

   22/09/17 [V5.7 R3.0] /MK Change - New query and datasource for Groups which will allow the grid to show only created groups.
                                     This will then allow the user to click on group they want and it showing the detail instead
                                     of the grid shifting one line because the WinData.Groups.State went from Append to Browse.
                                   - AfterScroll of new FGroupsQuery then locate the ID in WinData.Groups.
                                   - FormActivate - Change position of the below code to better suit the different FormTypes.
                                   - Added the required changes for new Feeds unit.

   17/10/17 [V5.7 R3.9] /MK Bug Fix - SelectAll - If animals were in a previous feed group the animals feed was not ending on moved to new group date - Laurence Clerkin.

   21/11/17 [V5.7 R4.6] /MK Change - Allow user to specify a feed end date when removing animals from active feed group, or moving animals from one
                                     active feed group into another active feed group or clearing a group - Laurence Clerkin.

   22/11/17 [V5.7 R4.6] /MK Bug Fix - eSelect.Text was not showing the right amount of animals if both a filter and cart were used.
                            Change - If cart the grid of animals only shows the cart animals not the animals that are on the MAIN grid.
                                   - New function, GetAnimalsOnGridInCurrentGroupCount, created to check for filter or cart or both.
                                   - New function, GetAnimalSelectionToArrayWideString, created to return the animal ids of the animal selection (cart or filter or no selection).
                                   - Modified the qAnimalsNotInGroup SQL to look at the AnimalIDs in GetAnimalSelectionToArrayWideString (cart or filter or no selection).

   23/11/17 [V5.7 R5.7] /MK Change - When clicking Select All, if the animals are already in different feed groups then a prompt for the end date should pertain to that feed group.

   24/11/17 [V5.7 R5.7] /MK Additional Feature - Created a label to indicate to the user to know whether the group has an active feed regime or not.

   08/12/17 [V5.7 R6.1] /MK Bug Fix - If FSelectionType = stNoSelection then set FSelectionType depending on whether AnimalCart.IsEmpty or WinData.FilteredAnimals.RecordCount.
                                    - Changes to use of HerdLookup.GetAnimalSelectionToArrayWideString.

   29/01/18 [V5.7 R6.7] /MK Bug Fix - Passing in wrong group id when deselecting an animal that is in a feed group but not an active feed group - TGM.

   11/04/18 [V5.7 R8.7] /MK Change - Changed order of FormActivate so that if coming in from the Beef Purchase screen, the group is created.
                                   - If ShowTheFormID then only show minimal screen height.
                                   - FormActivate - If FormType is minimal screen height then no need to run query for AnimalsNotInGroup as grid is not shown.

   08/05/18 [V5.8 R0.1] /MK Change - FormActivate - If FormType = 1 then this was not assigned prior to today to any group type nor was it used in any other unit prior to today
                                                  - Using FormType 1 to allow the user to set up a Batch Group with just a code and description that the user can type i.e. not generated by the system.
                            Bug Fix - FormActivate - Check whether to show the lActiveFeedGroup label when the form opens.

   23/07/18 [V5.8 R1.2] /MK Bug Fix - SetupScanTable - Code to fix scanning of 372 tags was in release version but not test.

   18/09/18 [V5.8 R2.9] /MK Bug Fix - FormActivate - GenerateGroupCode_DescByDate - Include FormType zero (Sales Groups) in this array.

   28/11/18 [V5.8 R5.5] /MK Bug Fix - SelectAll - Passing in AllowDeletion as whatever length existing group array is as AllowDeletion will
                                                  delete animal from previous group selected group are being removed from that group - Michael Callan reported.

   01/02/19 [V5.8 R6.5] /MK Change - FormCreate - If ParlourType Is Nedap Then Allow Drafting Group Type.
}

unit uGroupSetUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, RXCtrls, ComCtrls, ToolWin, ExtCtrls, DBCtrls,
  DBTables, Db, StdCtrls, Mask, DBCGrids, kwDBNavigator, DBGridEh,
  cxControls, dxStatusBar, jpeg, cxContainer, cxEdit, cxImage, RxLookup,
  ToolEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, DateUtil, uAnimalCart,
  uCrushXML, cxDBData, cxCustomData, KRoutines, uAnimal,
  uAllocateFeedToAnimal, uProgressIndicator, GenTypesConst, cxLabel;

type
  TfGroupSetUp = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    qAnimalsNotInGroup: TQuery;
    dsAnimalsNotInGroup: TDataSource;
    NoInGroup: TQuery;
    dsNoInGroup: TDataSource;
    qAnimalsNotInGroupAnimalNo: TStringField;
    qAnimalsNotInGroupNatIdNum: TStringField;
    qAnimalsNotInGroupDateOfBirth: TDateField;
    qAnimalsNotInGroupName: TStringField;
    qAnimalsNotInGroupSex: TStringField;
    qAnimalsNotInGroupSelected: TBooleanField;
    qAnimalsNotInGroupID: TIntegerField;
    kwDBNavigator1: TkwDBNavigator;
    Panel2: TPanel;
    DBGGroups1: TDBGridEh;
    pAddToGroup: TPanel;
    qFeed: TQuery;
    Panel6: TPanel;
    Panel1: TPanel;
    Label5: TLabel;
    eNatIDNum: TEdit;
    eAnimalNo: TEdit;
    DBGAnimals: TDBGridEh;
    sbLocate: TRxSpeedButton;
    ePartialSearch: TEdit;
    lPartialSearch: TLabel;
    NatIDLabel: TLabel;
    Panel7: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eSelect: TEdit;
    eGridCount: TEdit;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lNoInGroup: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    cbGroupType: TDBComboBox;
    eGroupCount: TEdit;
    bClearGroup: TButton;
    pScanNatID: TPanel;
    sbGroupPreview: TRxSpeedButton;
    PreviewSep: TToolButton;
    StatusBar: TdxStatusBar;
    imgBarcode: TcxImage;
    Panel5: TPanel;
    lAddGroupLabel: TLabel;
    pSelectRemoveAnimals: TPanel;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    sbDone: TRxSpeedButton;
    ToolButton4: TToolButton;
    sbSelect: TRxSpeedButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    sbSelectAll: TRxSpeedButton;
    ToolButton8: TToolButton;
    sbRemoveAll: TRxSpeedButton;
    sbMovementPermits: TRxSpeedButton;
    GenQuery: TQuery;
    lMoveFeedDate: TLabel;
    deMoveFeedDate: TDBDateEdit;
    lDestSource: TLabel;
    cmboDestSource: TRxDBLookupCombo;
    DBGGroupsDBTableView1: TcxGridDBTableView;
    DBGGroupsLevel1: TcxGridLevel;
    DBGGroups: TcxGrid;
    DBGGroupsDBTableView1Code: TcxGridDBColumn;
    DBGGroupsDBTableView1GroupType: TcxGridDBColumn;
    DBGGroupsDBTableView1Description: TcxGridDBColumn;
    qAnimalsNotInGroupFQAS: TBooleanField;
    qAnimalsNotInGroupComment: TStringField;
    DBGGroupsDBTableView1ID: TcxGridDBColumn;
    lSelectGroupLabel: TLabel;
    qAnimalsNotInGroupLocateNatID: TStringField;
    lActiveFeedGroup: TcxLabel;
    procedure sbExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGAnimalsGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure bClearGroupClick(Sender: TObject);
    procedure eAnimalNoChange(Sender: TObject);
    procedure eNatIDNumChange(Sender: TObject);
    procedure qAnimalsNotInGroupCalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbHelpClick(Sender: TObject);
    procedure NoInGroupAfterScroll(DataSet: TDataSet);
    procedure DBGAnimalsEnter(Sender: TObject);
    procedure DBGAnimalsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGAnimalsGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGAnimalsTitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure sbLocateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbGroupPreviewClick(Sender: TObject);
    procedure ePartialSearchEnter(Sender: TObject);
    procedure pAddToGroupEnter(Sender: TObject);
    procedure pAddToGroupExit(Sender: TObject);
    procedure sbRemoveAllClick(Sender: TObject);
    procedure sbRemoveClick(Sender: TObject);
    procedure sbSelectClick(Sender: TObject);
    procedure sbSelectAllClick(Sender: TObject);
    procedure sbDoneMouseLeave(Sender: TObject);
    procedure sbDoneClick(Sender: TObject);
    procedure eAnimalNoClick(Sender: TObject);
    procedure DBGAnimalsDblClick(Sender: TObject);
    procedure DBGAnimalsCellClick(Column: TColumnEh);
    procedure sbMovementPermitsClick(Sender: TObject);
    procedure cbGroupTypeChange(Sender: TObject);
    procedure kwDBNavigator1Click(Sender: TObject; Button: TKNavigateBtn);
    procedure cmboDestSourceCloseUp(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGGroupsDBTableView1CanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure DBGGroupsDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DBGGroupsDBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure deMoveFeedDateExit(Sender: TObject);
    procedure DBGGroupsDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure eAnimalNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ePartialSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FGroupsQueryAfterScroll(DataSet: TDataSet);
  private
    function GetSortByField: String;
    procedure SetSortByField(const Value: String);
  private
    { Private declarations }
    SortColIndex : Integer;
    OrderBy,
    LastSortByField : String;
    MassAdd : Boolean;
    FormType : Integer;
    NotInGrpTable : TTable;

    UseScanner : Boolean;
    FShowBeefControls : Boolean;

    FAllowScrollCancel : Boolean;

    FUpdatedGroupArray : array of Integer;

    FGroupsQuery : TQuery;
    FGroupsDataSource : TDataSource;

    FSelectionType : TSelectionType;

    function GroupsOK : Boolean;
    //function CheckIfInGroup (AID: Integer; GType: String ) : Boolean;
    //procedure AddToGroup(AID: Integer; GroupID: Integer; AllowDeletion: Boolean);
    procedure AddRemove;
    procedure GroupClear(ClearAll: Boolean);
    function CheckNewGroup : Boolean;
    procedure PartialSearch;
    procedure SetupScanTable;
    procedure ProcessScanned;
    procedure Select;
    procedure Remove;
    procedure SelectAll;
    procedure RemoveAll;
    procedure EnableGroupSelection(AEnteringControl :Boolean);
    procedure ShowActiveFeedGroupLabel;
    function GetAnimalsOnGridInCurrentGroupCount : Integer;

    property SortByField : String read GetSortByField write SetSortByField;
  public
    { Public declarations }
  end;

  procedure ShowTheForm(Ind: Integer; ShowBeefControls : Boolean = False;
     const ASelectionType : TSelectionType = stNoSelection);
  procedure ShowTheFormID(Ind: Integer; var GroupID : SmallInt; const ShowBeefControls : Boolean = False;
     const ASelectionType : TSelectionType = stNoSelection);

implementation
uses
   uFilters,
   DairyData,
   uGroupReport,
   Def, uCMMSPermits, MenuUnit, uSuppliers, uCustomers, kDBRoutines,
   uHerdLookup, uHerdSync;

var
   fGroupSetUp: TfGroupSetUp;
{$R *.DFM}

  procedure ShowTheForm(Ind: Integer; ShowBeefControls : Boolean = False;
     const ASelectionType : TSelectionType = stNoSelection);
  begin
     try
        Application.CreateForm(TfGroupSetUp, fGroupSetUp );
        fGroupSetUp.bClearGroup.Visible := ( Ind = 0 );
        fGroupSetUp.pAddToGroup.Visible := ( Ind = 0 );
        fGroupSetUp.cbGroupType.Enabled := True; //Enables user modification

        if ( ASelectionType = stNoSelection ) then
           begin
              if ( not(AnimalCart.IsEmpty) ) then
                 fGroupSetUp.FSelectionType := stCart
              else if ( WinData.FilteredAnimals.RecordCount > 0 ) then
                 fGroupSetUp.FSelectionType := stFilter;
           end
        else
           fGroupSetUp.FSelectionType := ASelectionType;

        fGroupSetUp.sbGroupPreview.Visible := ShowBeefControls;
        fGroupSetUp.sbMovementPermits.Visible := ShowBeefControls;
        fGroupSetUp.PreviewSep.Visible := ShowBeefControls;
        fGroupSetUp.FShowBeefControls := ShowBeefControls;
        fGroupSetUp.DBGAnimals.Columns[7].Visible := False;
        fGroupSetUp.DBGAnimals.Columns[5].Visible := not(ShowBeefControls);
        fGroupSetUp.DBGAnimals.Columns[2].Visible := (WinData.SystemRegisteredCountry=NIreland);
        fGroupSetup.lActiveFeedGroup.Visible := False;

        if ShowBeefControls then
           begin
              WinData.Groups.Filter := 'GroupType  =''Sales''';
              WinData.Groups.Filtered := True;
           end
        else
           begin
              WinData.Groups.Filter := '';
              WinData.Groups.Filtered := False;
           end;

        fGroupSetUp.FGroupsQuery.Filter := WinData.Groups.Filter;
        fGroupSetUp.FGroupsQuery.Filtered := WinData.Groups.Filtered;

        fGroupSetUp.FormType := ind; { SP 23/10/2002:- }

        fGroupSetUp.ShowModal;
        Application.ProcessMessages;
        WinData.Groups.Filter := '';
        WinData.Groups.Filtered := False;
        fGroupSetUp.Free;
     except
        on e : Exception do
           ShowMessage(e.Message);
        on E : EOutOfResources do
           begin
              MessageDlg('There is not enough resources to open groups set-up,'+#13#10+
                         'close program and reboot',mtError,[mbOK],0);
           end;
        on E : EOutOfMemory do
           begin
              MessageDlg('There is not enough memory to open groups set-up,'+#13#10+
                         'close program and reboot',mtError,[mbOK],0);
           end;
     end;
  end;

  procedure ShowTheFormID(Ind: Integer; var GroupID : SmallInt; const ShowBeefControls : Boolean = False;
     const ASelectionType : TSelectionType = stNoSelection);
  begin
     try
        Application.CreateForm(TfGroupSetUp, fGroupSetUp );
        fGroupSetUp.Height := 262;
        fGroupSetUp.cbGroupType.Enabled := True;  //Prevents user modification

        fGroupSetUp.FSelectionType := ASelectionType;

        fGroupSetUp.sbGroupPreview.Visible := ShowBeefControls;
        fGroupSetUp.sbMovementPermits.Visible := ShowBeefControls;
        fGroupSetUp.PreviewSep.Visible := ShowBeefControls;
        fGroupSetUp.FShowBeefControls := ShowBeefControls;

        fGroupSetup.lNoInGroup.Visible := False;
        fGroupSetUp.eGroupCount.Visible := False;
        fGroupSetUp.bClearGroup.Visible := False;
        fGroupSetUp.pAddToGroup.Visible := False;
        fGroupSetUp.pSelectRemoveAnimals.Visible := False;
        fGroupSetUp.StatusBar.Visible := False;
        fGroupSetup.lActiveFeedGroup.Visible := False;

        if ShowBeefControls then
           begin
              WinData.Groups.Filter := 'GroupType  =''Sales''';
              WinData.Groups.Filtered := True;
           end
        else
           begin
              WinData.Groups.Filter := '';
              WinData.Groups.Filtered := False;
           end;

        fGroupSetUp.FGroupsQuery.Filter := WinData.Groups.Filter;
        fGroupSetUp.FGroupsQuery.Filtered := WinData.Groups.Filtered;
        fGroupSetUp.FormType := ind; { SP 23/10/2002:- }
        try
           GroupID := 0;
           fGroupSetUp.ShowModal;
           Application.ProcessMessages;
        finally
           if WinData.dsGroups.DataSet.RecordCount > 0 then
              GroupID := WinData.dsGroups.DataSet.FieldByName('ID').Value; // Sets the calling combo Index to last ID Used.
           WinData.Groups.Filter := '';
           WinData.Groups.Filtered := False;
           fGroupSetUp.Free;
        end;
     except
        on E : Exception do
           ShowMessage(e.Message);
        on E : EOutOfResources do
           begin
              MessageDlg('There is not enough resources to open groups set-up,'+#13#10+
                         'close program and reboot',mtError,[mbOK],0);
           end;
        on E : EOutOfMemory do
           begin
              MessageDlg('There is not enough memory to open groups set-up,'+#13#10+
                         'close program and reboot',mtError,[mbOK],0);
           end;
     end;
  end;

procedure TfGroupSetUp.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfGroupSetUp.FormActivate(Sender: TObject);
var
   GroupCodeInUse : Boolean;
   sFilterString,
   SortOrder,
   sGroupCode,
   sGroupDesc : String;

   procedure GenerateGroupCode_DescByDate;
   var
      i : Integer;

      // Had to create this function because when going into Sales Group screen WinData.Groups is filtered by GroupType
      // so a normal locate on the WinData.Groups will not work.
      function GroupIdentExists ( AGroupIdent, AFieldName : String ) : Boolean;
      begin
         Result := False;
         if ( Length(AGroupIdent) = 0 ) or ( Length(AFieldName) = 0 ) then Exit;

         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT *');
               SQL.Add('FROM '+WinData.Groups.TableName+'');
               SQL.Add('WHERE Upper('+AFieldName+') = "'+UpperCase(AGroupIdent)+'"');
               try
                  Open;
                  Result := ( RecordCount > 0 );
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Free;
            end;
      end;

   begin
      //   18/09/18 [V5.8 R2.9] /MK Bug Fix - Include FormType zero (Sales Groups) in this array.
      if ( not(FormType in [0, 2, 3]) ) then Exit;

      sGroupCode := '';
      if ( not(WinData.Groups.State = dsBrowse) ) then
         WinData.Groups.Cancel;
      sGroupCode := FormatDateTime('ddmmyy', Date);
      if ( GroupIdentExists(sGroupCode,'Code') ) then
         begin
            for i := 1 to 9 do
               begin
                  sGroupCode := Copy(FormatDateTime('ddmmyy', Date),0,4) + '#' + IntToStr(i);
                  if ( not(GroupIdentExists(sGroupCode,'Code')) ) then
                     Break;
               end;
         end;

      sGroupDesc := '';
      if ( FormType = 3 ) then
         sGroupDesc := 'Purchase: '+FormatDateTime('dd-mm-yyyy', Date)
      else
         sGroupDesc := 'Sales: '+FormatDateTime('dd-mm-yyyy', Date);

      if ( GroupIdentExists(sGroupDesc,'Description') ) then
         begin
            for i := 1 to 9 do
               begin
                  if ( FormType = 3 ) then
                     sGroupDesc := 'Purchase: '+FormatDateTime('dd-mm-yyyy', Date) + '#' + IntToStr(i)
                  else
                     sGroupDesc := 'Sales: '+FormatDateTime('dd-mm-yyyy', Date) + '#' + IntToStr(i);
                  if ( not(GroupIdentExists(sGroupDesc,'Description')) ) then
                     Break;
               end;
         end;
   end;

begin
   SortOrder := 'ASC';

   if ( WinData.FMainGridSortOrder <> soNone ) then
      begin
         // Only able to trap main grid before sort order changed. This means order by reverse of set order.
         if ( WinData.FMainGridSortOrder = soAscending ) then
            SortOrder := 'DESC'
         else if ( WinData.FMainGridSortOrder = soDescending ) then
            SortOrder := 'ASC'
      end;

   qAnimalsNOTInGroup.SQL.Clear;

   GenerateGroupCode_DescByDate;

    { SP 23/10/2002 enter default group details }
   if ( FormType = 3 ) then
      begin
         //   03/10/13 [V5.2 R3.0] /MK Bug Fix - Change state of table to insert after DBGGroups sort changes state to browse.
         if ( WinData.Groups.State = dsBrowse ) then
            WinData.Groups.Insert;
         WinData.Groups.FieldByName('GroupType').AsString := cbGroupType.Items[0];
         if ( Length(sGroupCode) > 0 ) then
            WinData.Groups.FieldByName('Code').AsString := sGroupCode
         else
            MessageDlg('Unable to generate default group code.',mtError,[mbOK],0);
         if ( Length(sGroupDesc) > 0 ) then
            WinData.Groups.FieldByName('Description').AsString := sGroupDesc
         else
            MessageDlg('Unable to generate default group description.',mtError,[mbOK],0);
      end
   else if FShowBeefControls then
      begin
         //   03/10/13 [V5.2 R3.0] /MK Bug Fix - Change state of table to insert after DBGGroups sort changes state to browse.
         if ( WinData.Groups.State = dsBrowse ) then
            WinData.Groups.Insert;
         WinData.Groups.FieldByName('GroupType').AsString := cbGroupType.Items[1];
         if ( Length(sGroupCode) > 0 ) then
            WinData.Groups.FieldByName('Code').AsString := sGroupCode
         else
            MessageDlg('Unable to generate default group code.',mtError,[mbOK],0);
         if ( Length(sGroupDesc) > 0 ) then
            WinData.Groups.FieldByName('Description').AsString := sGroupDesc
         else
            MessageDlg('Unable to generate default group description.',mtError,[mbOK],0);
      end
   //   08/05/18 [V5.8 R0.1] /MK Change - If FormType = 1 then this was not assigned prior to today to any group type nor was it used in any other unit prior to today
   //                                   - Using FormType 1 to allow the user to set up a Batch Group with just a code and description that the user can type i.e. not generated by the system.
   else if ( FormType = 1 ) then
      begin
         if ( WinData.Groups.State = dsBrowse ) then
            WinData.Groups.Insert;
         WinData.Groups.FieldByName('GroupType').AsString := cbGroupType.Items[2];
      end;

   if UseScanner then
      SetupScanTable;

   if ( FormType = 0 ) then
      begin
         sFilterString := HerdLookup.GetAnimalSelectionToArrayWideString(FSelectionType);
         // SP 30/09/2002 Use all animals that are currently on main grid.
         if ( Length(sFilterString) > 2 ) or ( FSelectionType <> stCart ) then
            with qAnimalsNOTInGroup do
               begin
                  SQL.Add('SELECT DISTINCT *');
                  SQL.Add('FROM Animals A');
                  if ( FSelectionType = stCart ) then
                     SQL.Add(Format('WHERE Id IN %s',[sFilterString]))
                  else
                     SQL.Add('WHERE Id IN (SELECT AID FROM AFilters)');

                  if ( WinData.FMainGridSortBy = mgsbAnimalNo ) then
                     begin
                        SQL.Add('ORDER BY SortAnimalNo '+SortOrder+'');
                        if SortOrder = 'ASC' then
                           DBGAnimals.Columns[1].Title.SortMarker := smUpEh
                        else
                           DBGAnimals.Columns[1].Title.SortMarker := smDownEh;
                     end
                  else if ( WinData.FMainGridSortBy = mgsbNatIDNum ) then
                     begin
                        SQL.Add('ORDER BY SortNatID '+SortOrder+'');
                        if SortOrder = 'ASC' then
                           DBGAnimals.Columns[3].Title.SortMarker := smUpEh
                        else
                           DBGAnimals.Columns[3].Title.SortMarker := smDownEh;
                     end
                  else if ( WinData.FMainGridSortBy = mgsbDateofBirth ) then
                     begin
                        SQL.Add('ORDER BY DateOfBirth '+SortOrder+'');
                        if SortOrder = 'ASC' then
                           DBGAnimals.Columns[4].Title.SortMarker := smUpEh
                        else
                           DBGAnimals.Columns[4].Title.SortMarker := smDownEh;
                     end
                  else if ( WinData.FMainGridSortBy = mgsbName ) then
                     begin
                        SQL.Add('ORDER BY Name '+SortOrder+'');
                        if SortOrder = 'ASC' then
                           DBGAnimals.Columns[5].Title.SortMarker := smUpEh
                        else
                           DBGAnimals.Columns[5].Title.SortMarker := smDownEh;
                     end
                  else if ( WinData.FMainGridSortBy = mgsbSex ) then
                     begin
                        SQL.Add('ORDER BY Sex, SortAnimalNo '+SortOrder+'');
                        if SortOrder = 'ASC' then
                           DBGAnimals.Columns[6].Title.SortMarker := smUpEh
                        else
                           DBGAnimals.Columns[6].Title.SortMarker := smDownEh;
                     end;
                  try
                     Open;
                     eGridCount.Text := IntToStr(qAnimalsNOTInGroup.RecordCount);
                     NoINGroup.Open;
                  except
                  end;
               end;
      end;

   cbGroupTypeChange(cbGroupType);

   //   13/09/13 [V5.2 R1.2] /MK Additional Feature - Insert record at start of Group Grid so user can see grid ordered by
   //                                                 last entered record while adding a new record.
   //   03/10/13 [V5.2 R3.0] /MK Bug Fix - Only add new record if record not already added by FormType = 3 or FShowBeefControls.
   if ( FormType = 0 ) and ( not(FShowBeefControls) ) then
      begin
         DBGGroupsDBTableView1.Controller.FocusedRowIndex := 0;
         DBGGroupsDBTableView1.Controller.CreateNewRecord(False);
      end;

   SetLength(FUpdatedGroupArray,0);

   lMoveFeedDate.Visible := ( cbGroupType.Text = 'Purchase' ) or ( cbGroupType.Text = 'Sales' ) ;
   deMoveFeedDate.Visible := lMoveFeedDate.Visible;
   lDestSource.Visible := lMoveFeedDate.Visible;
   cmboDestSource.Visible := lMoveFeedDate.Visible;

   ShowActiveFeedGroupLabel;

   OnActivate := Nil;
end;

function TfGroupSetUp.CheckNewGroup : Boolean;
begin
   Result := False;
   if (dbEdit1.Text = '') and (dbEdit2.Text = '') then
      begin
         messagedlg('A Code or Description is required before the group can be edited',mtError,[mbOK],0);
         dbEdit1.SetFocus;
      end
   else if (cbGroupType.Text = '') then
      begin
         messagedlg('A GroupType is required before the group can be edited',mtError,[mbOK],0);
         cbGroupType.SetFocus;
      end
   else
      Result := True;
end;

procedure TfGroupSetUp.DBGAnimalsGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
   // Shows if the Animal is on the Selected Group
   if qAnimalsNotInGroupSelected.AsBoolean then
      Background := cl3DLight
   else
      Background := clWhite;
end;

procedure TfGroupSetUp.bClearGroupClick(Sender: TObject);
begin
   GroupClear(True);
end;

procedure TfGroupSetUp.GroupClear(ClearAll: Boolean);
var
   i : Integer;
   WarnString : String;
   AnimalsInGroup : PIntegerArray;
   GroupType : TGroupType;
   dEndAllocDate : TDateTime;
begin
   if ClearAll then
      WarnString := Format('Clear ALL Animals from Group %s %s ?',
                           [WinData.Groups.FieldByName('Code').AsString,
                            WinData.Groups.FieldByName('Description').AsString])
   else
      WarnString := Format('Clear SELECTED Animals from Group %s %s ?',
                           [WinData.Groups.FieldByName('Code').AsString,
                            WinData.Groups.FieldByName('Description').AsString]);

   GroupType := WinData.GroupManager.GetGroupIDGroupType(WinData.Groups.FieldByName('ID').AsInteger);

   dsAnimalsNotInGroup.DataSet.DisableControls;

   if ( CheckNewGroup ) and ( GroupsOK ) then
      if ( MessageDlg(WarnString,mtWarning,[mbYes,mbNo],0) = mrNo ) then Exit;

   if ( GroupType = gtFeed ) then
      if ( WinData.FeedManager.GroupHasActiveFeedRegime(WinData.Groups.FieldByName('ID').AsInteger) ) then
         begin
            if ClearAll then
               WarnString := 'This will end the current feed for ALL animals in ths group.'
            else
               WarnString := 'This will end the current feed for SELECTED animals in this group.';
            if ( MessageDlg(WarnString+cCRLF+
                           'Do you wish to continue?',mtWarning,[mbYes,mbNo],0) = mrNo ) then Exit;
         end;

   //   18/09/17 [V5.7 R3.0] /MK Change - Used groups single procedure to remove the animal from the group and end its feed if FeedGroup.
   //                                   - Added progress bar to let the user know whats going on with the clear.
   if ClearAll then
      try
         // end feed regime
         AnimalsInGroup := WinData.GroupManager.GetAnimalsInGroup(WinData.Groups.FieldByName('ID').AsInteger);
         if ( Length(AnimalsInGroup) > 0 ) then
            begin
               if ( GroupType = gtFeed ) then
                  if ( WinData.FeedManager.GroupHasActiveFeedRegime(WinData.Groups.FieldByName('ID').AsInteger) ) then
                     begin
                        dEndAllocDate := TfmAllocateFeedToAnimal.GetStart_EndAllocationDate(WinData.Groups.FieldByName('ID').AsInteger,nil,True,False);
                        if ( dEndAllocDate = 0 ) then
                           SysUtils.Abort;
                     end;
               ShowProgressIndicator('Removing Animals From The Group',0,Length(AnimalsInGroup),1);
               ProgressIndicator.Max := Length(AnimalsInGroup);
               Application.ProcessMessages;
               Update;
               for i := 0 to Length(AnimalsInGroup)-1 do
                  begin
                     if ( GroupType = gtFeed ) and ( dEndAllocDate > 0 ) then
                        begin
                           WinData.GroupManager.RemoveAnimalFromGrp(AnimalsInGroup[i],WinData.Groups.FieldByName('ID').AsInteger);
                           WinData.FeedManager.EndFeedEventsForAnimal(AnimalsInGroup[i],dEndAllocDate);
                        end
                     else
                        WinData.GroupManager.RemoveAnimalFromGrp(AnimalsInGroup[i],WinData.Groups.FieldByName('ID').AsInteger);

                     ProgressIndicator.Position := ProgressIndicator.Position + 1;
                     Application.ProcessMessages;
                     Update;
                  end;
            end;
         ProgressIndicator.Close;
         Application.ProcessMessages;
         Update;
      finally
         DBGAnimals.DataSource.DataSet.Refresh;

         NoInGroup.Close;
         NoInGroup.Open;
      end
   else
      try
         qAnimalsNotInGroup.First;

         if ( GroupType = gtFeed ) then
            if ( WinData.FeedManager.GroupHasActiveFeedRegime(WinData.Groups.FieldByName('ID').AsInteger) ) then
               begin
                  dEndAllocDate := TfmAllocateFeedToAnimal.GetStart_EndAllocationDate(WinData.Groups.FieldByName('ID').AsInteger,nil,True,False);
                  if ( dEndAllocDate = 0 ) then
                     SysUtils.Abort;
               end;

         ShowProgressIndicator('Removing Animals From The Group',0,qAnimalsNotInGroup.RecordCount,1);
         ProgressIndicator.Max := qAnimalsNotInGroup.RecordCount;
         Application.ProcessMessages;

         while ( not(qAnimalsNotInGroup.Eof) ) do
            begin
               Update;
               if ( qAnimalsNotInGroup.FieldByName('Selected').AsBoolean ) then
                  begin
                     if ( GroupType = gtFeed ) and ( dEndAllocDate > 0 ) then
                        begin
                           WinData.GroupManager.RemoveAnimalFromGrp(qAnimalsNotInGroup.FieldByName('ID').AsInteger,WinData.Groups.FieldByName('ID').AsInteger);
                           WinData.FeedManager.EndFeedEventsForAnimal(qAnimalsNotInGroup.FieldByName('ID').AsInteger,dEndAllocDate);
                        end
                     else
                        WinData.GroupManager.RemoveAnimalFromGrp(qAnimalsNotInGroup.FieldByName('ID').AsInteger,WinData.Groups.FieldByName('ID').AsInteger);

                  end;
               ProgressIndicator.Position := ProgressIndicator.Position + 1;
               Application.ProcessMessages;
               Update;
               qAnimalsNotInGroup.Next;
            end;
         ProgressIndicator.Close;
         Application.ProcessMessages;
         Update;
      finally
         DBGAnimals.DataSource.DataSet.Refresh;

         NoInGroup.Close;
         NoInGroup.Open;
      end;
   dsAnimalsNotInGroup.DataSet.EnableControls;
end;

function TfGroupSetUp.GroupsOK : Boolean;
begin
   Result := FALSE;
   if WinData.Groups.Active then
      begin
         if WinData.Groups.IsEmpty then
            MessageDLG('You need to set up and select a Group',mtinformation,[mbOK],0)
         else
            Result := TRUE;
      end;
end;

procedure TfGroupSetUp.AddRemove;
var
   MyBookMark : TBookMark;
   Animal : TAnimal;
   dGroupStartDate,
   dStartAllocDate,
   dEndAllocDate,
   dNewFeedStartDate : TDateTime;
   iaAnimalsExistGroupIDs : PIntegerArray;

   i,iPreviousFeedGroup : Integer;
   GroupType : TGroupType;
begin
   try
      dGroupStartDate := 0;
      dStartAllocDate := 0;
      dEndAllocDate := 0;
      // set bookmark to current animal on grid
      MyBookMark := DBGAnimals.DataSource.DataSet.GetBookmark;
      // check if a group is active
      if GroupsOK then
         begin
            MassAdd := False;

            GroupType := WinData.GroupManager.GetGroupIDGroupType(WinData.Groups.FieldByName('ID').AsInteger);

            // ensure not Eof
            if ( not(DBGAnimals.DataSource.DataSet.Eof) ) then
               begin
                  // AddRemove is processed when the user double-clicks or presses enter on the grid.
                  // At this stage the selected field in the query behind the grid has not been updated
                  // so we have to use reverse logic.
                  if ( qAnimalsNotInGroupSelected.AsBoolean ) then
                     begin
                        if ( GroupType = gtFeed ) then
                           begin
                              Animal := GetAnimal(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger);
                              //   18/09/17 [V5.7 R3.0] /MK Change - If the animal exists and the feed group has an active feed regime then bring up uAllocateFeedToAnimal unit.
                              if ( Animal <> nil ) and ( WinData.FeedManager.GroupHasActiveFeedRegime(WinData.Groups.FieldByName('ID').AsInteger) ) then
                                 begin
                                    dEndAllocDate := TfmAllocateFeedToAnimal.GetStart_EndAllocationDate(WinData.Groups.FieldByName('ID').AsInteger,Animal,False,False);
                                    if ( dEndAllocDate = 0 ) then
                                       SysUtils.Abort;
                                    WinData.GroupManager.RemoveAnimalFromGrp(qAnimalsNotInGroup.FieldByName('ID').AsInteger,WinData.Groups.FieldByName('ID').AsInteger);
                                    WinData.FeedManager.EndFeedEventsForAnimal(qAnimalsNotInGroup.FieldByName('ID').AsInteger,dEndAllocDate);
                                 end
                              else
                                 //   29/01/18 [V5.7 R6.7] /MK Bug Fix - Passing in wrong group id.
                                 WinData.GroupManager.RemoveAnimalFromGrp(qAnimalsNotInGroup.FieldByName('ID').AsInteger, WinData.Groups.FieldByName('ID').AsInteger);
                           end
                        else
                           WinData.GroupManager.RemoveAnimalFromGrp(qAnimalsNotInGroup.FieldByName('ID').AsInteger, WinData.Groups.FieldByName('ID').AsInteger);
                     end
                  else
                     begin
                        //   18/09/17 [V5.7 R3.0] /MK Change - Added checks for animals in group here as AddToGroup no longer used.
                        SetLength(iaAnimalsExistGroupIDs,0);
                        iaAnimalsExistGroupIDs := WinData.GroupManager.GetAnimalsExistGroupIDs(qAnimalsNotInGroup.FieldByName('ID').AsInteger,
                                                                                               gtNone, WinData.Groups.FieldByName('ID').AsInteger);
                        iPreviousFeedGroup := 0;

                        if ( Length(iaAnimalsExistGroupIDs) > 0 ) then
                           if ( GroupType = gtFeed ) then
                              begin
                                 if ( Length(iaAnimalsExistGroupIDs) > 0 ) then
                                    for i := 0 to Length(iaAnimalsExistGroupIDs)-1 do
                                       if ( WinData.GroupManager.GetGroupIDGroupType(iaAnimalsExistGroupIDs[i]) = gtFeed ) then
                                          begin
                                             iPreviousFeedGroup := iaAnimalsExistGroupIDs[i];
                                             Break;
                                          end;
                              end;

                        //   18/09/17 [V5.7 R3.0] /MK Change - If the animals has an existing group then remove it from the group and
                        //                                     end its feed on the allocation date selected from uAllocateFeedToAnimal unit.
                        if ( iPreviousFeedGroup > 0 ) and ( WinData.FeedManager.GroupHasActiveFeedRegime(iPreviousFeedGroup) ) then
                           begin
                              MessageDlg('This animal is an existing feed group with a current feed regime.'+cCRLF+
                                         'The animal will now be removed from that feed group.'+cCRLF+
                                         'The previous feed regime will be ended for this animal.',mtInformation,[mbOK],0);

                              Animal := GetAnimal(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger);
                              //   18/09/17 [V5.7 R3.0] /MK Change - If the animal exists and the feed group has an active feed regime then bring up uAllocateFeedToAnimal unit.
                              if ( Animal <> nil ) then
                                 begin
                                    dEndAllocDate := TfmAllocateFeedToAnimal.GetStart_EndAllocationDate(iPreviousFeedGroup,Animal,False,False,Date);
                                    if ( dEndAllocDate = 0 ) then
                                       SysUtils.Abort;
                                    WinData.GroupManager.RemoveAnimalFromGrp(qAnimalsNotInGroup.FieldByName('ID').AsInteger,iPreviousFeedGroup);
                                    WinData.FeedManager.EndFeedEventsForAnimal(qAnimalsNotInGroup.FieldByName('ID').AsInteger,dEndAllocDate);
                                 end
                              else
                                 WinData.GroupManager.RemoveAnimalFromGrp(qAnimalsNotInGroup.FieldByName('ID').AsInteger,iPreviousFeedGroup);
                           end;

                        //   18/09/17 [V5.7 R3.0] /MK Change - Get animal details for new uAllocateFeedToAnimal unit.
                        Animal := GetAnimal(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger);
                        //   18/09/17 [V5.7 R3.0] /MK Change - If the animal exists and the feed group has an active feed regime then bring up uAllocateFeedToAnimal unit.
                        if ( Animal <> nil ) and ( WinData.FeedManager.GroupHasActiveFeedRegime(WinData.Groups.FieldByName('ID').AsInteger) ) then
                           begin
                              dStartAllocDate := TfmAllocateFeedToAnimal.GetStart_EndAllocationDate(WinData.Groups.FieldByName('ID').AsInteger,Animal,False,True,dEndAllocDate);
                              if ( dStartAllocDate = 0 ) then
                                 SysUtils.Abort;
                           end;

                        //   18/09/17 [V5.7 R3.0] /MK Change - If not a feed group then set the group start date to today.
                        // dStartAllocDate is associated by TfmAllocateFeedToAnimal if the group has an existing feed regime.
                        // If the feed does not have an existing feed regime then set dStartAllocDate to today's date.
                        if ( dStartAllocDate > 0 ) then
                           dGroupStartDate := dStartAllocDate
                        else
                           dGroupStartDate := Date;

                        //   18/09/17 [V5.7 R3.0] /MK Change - Use Groups.GroupManager.AddToGroup here.
                        WinData.GroupManager.AddToGroup(qAnimalsNotInGroup.FieldByName('ID').AsInteger,
                                                        WinData.Groups.FieldByName('ID').AsInteger,
                                                        TRUE, dGroupStartDate, '', (dStartAllocDate <= 0), (iPreviousFeedGroup = 0));

                        if ( GroupType = gtFeed ) and ( dStartAllocDate > 0 ) then
                           WinData.FeedManager.CreateFeedsForAnimal(qAnimalsNotInGroup.FieldByName('ID').AsInteger,
                                                                    WinData.Groups.FieldByName('ID').AsInteger,
                                                                    dStartAllocDate);

                     end;
               end;
            NoInGroup.Close;
            NoInGroup.Open;
         end;
   finally
      DBGAnimals.DataSource.DataSet.GoToBookmark(MyBookMark);
      DBGAnimals.DataSource.DataSet.FreeBookmark(MyBookMark);
   end;
end;

procedure TfGroupSetUp.eAnimalNoChange(Sender: TObject);
begin
   if CheckNewGroup then
      // Start to Search for this Animal
      if Length(eAnimalNo.Text) > 0 then
         begin
            eNatIDNum.Text := '';
            if NOT DBGAnimals.DataSource.DataSet.Locate('AnimalNo',eAnimalNo.Text,[loPartialKey] ) then
               ShowMessage('Cannot find Animal No ' + eAnimalNo.Text);
         end;
end;

procedure TfGroupSetUp.eNatIDNumChange(Sender: TObject);
begin
   if CheckNewGroup then
      begin
         //First check for UseScanner having been selected
         If not ( UseScanner ) then
            Begin
               // Start to Search for this Animals National ID
               if Length(eNatIDNum.Text) > 0 then
                  begin
                     eAnimalNo.Text := '';
                     if NOT DBGAnimals.DataSource.DataSet.Locate('NatIdNum',eNatIDNum.Text,[loPartialKey] ) then
                        ShowMessage('Cannot find Animal National ID ' + eNatIDNum.Text)
                  end
            end
         else
            begin
               if WhatStyleNatID( eNatIDNum.Text, TRUE) <> StyleUnKnown then
                  ProcessScanned;
            end;
      end;
end;

procedure TfGroupSetUp.qAnimalsNotInGroupCalcFields(DataSet: TDataSet);
begin
   if ( WinData.Groups.FieldByName('ID').AsInteger <> 0 ) and
      ( WinData.GroupLinks.Locate('AnimalID;GroupID',VarArrayOf(
                                  [qAnimalsNOTInGroup.FieldByName('ID').AsInteger,
                                  WinData.Groups.FieldByName('ID').AsInteger]),[]) ) then
      qAnimalsNotInGroupSelected.AsBoolean := TRUE
   else
      qAnimalsNotInGroupSelected.AsBoolean := FALSE;
   qAnimalsNotInGroupComment.AsString := HerdLookup.GetAnimalComments(qAnimalsNOTInGroup.FieldByName('ID').AsInteger);
end;

procedure TfGroupSetUp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   i, SelectedGroup : Integer;
begin
   if ( cbGroupType.Text = 'Purchase' ) then
      begin
         SelectedGroup := WinData.Groups.FieldByName('ID').AsInteger;
         if ( SelectedGroup > 0 ) then
            if ( not(WinData.GroupLinks.Locate('GroupID',WinData.Groups.FieldByName('ID').AsInteger,[])) ) then
               begin
                  //   18/09/17 [V5.7 R3.0] /MK Change - Use InArray check here from KRoutines.
                  if ( not(InArray(SelectedGroup,FUpdatedGroupArray)) ) then
                     begin
                        SetLength(FUpdatedGroupArray,Length(FUpdatedGroupArray)+1);
                        FUpdatedGroupArray[Length(FUpdatedGroupArray)-1] := SelectedGroup;
                     end;
               end;
      end;

   for i := 0 to Length(FUpdatedGroupArray)-1 do
      uHerdSync.ResetSyncFlagForGroup(FUpdatedGroupArray[i]);

   if ( WinData.Groups.State = dsBrowse ) then
      CanClose := TRUE
   else if ( WinData.Groups.State = dsInsert ) then
      begin
         WinData.Groups.Cancel;
         CanClose := TRUE;
      end
   else if ( MessageDlg('Unsaved changes, exit anyway?',mtConfirmation,[mbYes, mbCancel], 0) = mrYes ) then
      begin
         WinData.Groups.Cancel;
         CanClose := TRUE;
      end
   else
      CanClose := FALSE;
end;

procedure TfGroupSetUp.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('Groups.htm');
end;

procedure TfGroupSetUp.NoInGroupAfterScroll(DataSet: TDataSet);
begin
   eSelect.Text := IntToStr(GetAnimalsOnGridInCurrentGroupCount);
   //   28/04/15 [V5.4 R5.2] /MK Change - Changed GroupCount to TEdit instead DBEdit. Set Text of TEdit to WinData.NoInGroup.
   eGroupCount.Text := (IntToStr(WinData.NoInGroup));
end;

procedure TfGroupSetUp.DBGAnimalsEnter(Sender: TObject);
begin
//   CheckNewGroup;
end;

procedure TfGroupSetUp.DBGAnimalsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = vk_space) then
      AddRemove;
end;

procedure TfGroupSetUp.DBGAnimalsGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  // Shows if the Animal is on the Selected Group
   if qAnimalsNotInGroupSelected.AsBoolean then
      Background := cl3DLight
   else
      Background := clWhite;

end;

procedure TfGroupSetUp.DBGAnimalsTitleClick(Column: TColumnEh);
begin
   SortColIndex := Column.Index;
   //   18/04/12 [V5.0 R5.0] /MK Bug Fix -  ColumnIndex Not Changed To Take In Account When FQAS Filed Was Added.
   case SortColIndex of
      1 : begin
             SortByField := WinData.AnimalFileByIDSortAnimalNo.FieldName;
          end;
      3 : begin
             SortByField := WinData.AnimalFileByIDSortNatID.FieldName;
          end;
      4 : begin
             SortByField := WinData.AnimalFileByIDDateOfBirth.FieldName;
          end;
      5 : begin
             SortByField := WinData.AnimalFileByIDName.FieldName;
          end;
      6 : begin
             SortByField := WinData.AnimalFileByIDSex.FieldName;
          end;
      else
         Exit;
   end;


   with qAnimalsNOTInGroup do // SP 30/09/2002 Use all animals that are currently on main grid.
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT *');
         SQL.Add('FROM Animals A');
         SQL.Add('WHERE A.ID IN (SELECT DISTINCT F.AID FROM afilters F )');
         SQL.Add('ORDER BY '+SortByField+ ' ' + OrderBy + '');
         Open;
      end;

   if OrderBy = 'ASC' then
      Column.Title.SortMarker := smDownEh
   else
      Column.Title.SortMarker := smUpEh;

   eGridCount.Text := IntToStr(qAnimalsNOTInGroup.RecordCount);
   NoINGroup.Open;
end;

function TfGroupSetUp.GetSortByField: String;
begin
    RESULT := LastSortByField;
end;

procedure TfGroupSetUp.SetSortByField(const Value: String);
var
   i : Integer;
begin
    if Value <> LastSortByField then
       begin
          LastSortByField := Value;
       end;

    if OrderBy = 'ASC' then
       OrderBy := 'DESC'
    else
       OrderBy := 'ASC';
end;

procedure TfGroupSetUp.FormCreate(Sender: TObject);
begin
   FAllowScrollCancel := True;

   WinData.QueryCustomers.Close;
   WinData.QueryCustomers.Open;

   WinData.QuerySuppliers.Close;
   WinData.QuerySuppliers.Open;

   if WinData.Groups.State in dsEditModes then
      WinData.Groups.Cancel;

   if WinData.UseScanner then
      begin
         imgBarcode.Visible := True;
         StatusBar.Panels.Items[0].Text := cBarCodeScannerOnCaption
      end
   else
      begin
         imgBarcode.Visible := False;
         StatusBar.Panels.Items[0].Text := cBarCodeScannerOffCaption;
      end;
   UseScanner := WinData.UseScanner;
   OrderBy := 'ASC';

   //   18/04/12 [V5.0 R5.1] /MK Additional Feature - If ParlourType Is DairyMaster Then Allow Drafting Group Type.
   //   01/02/19 [V5.8 R6.5] /MK Change - If ParlourType Is Nedap Then Allow Drafting Group Type.
   if ( Def.Definition.dUseParlour ) then
      if ( FileExists(IncludeTrailingBackslash(WinData.KingData.Directory) + 'Parlourlink.db') ) then
         begin
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('SELECT ParlourType');
                  SQL.Add('FROM ParlourLink');
                  Open;
                  try
                     First;
                     if ( UpperCase(Fields[0].AsString) = 'DAIRYMASTER' ) or ( Fields[0].AsString = 'NEDAP' ) then
                        begin
                           cbGroupType.Items.BeginUpdate;
                           cbGroupType.Items.Add('Drafting');
                           cbGroupType.Items.EndUpdate;
                        end;
                  finally
                     Close;
                  end;
               finally
                  Free;
               end;
         end;

   DBGGroupsDBTableView1.DataController.DataSource := nil;

   FGroupsQuery := TQuery.Create(nil);
   FGroupsQuery.DatabaseName := AliasName;
   FGroupsQuery.SQL.Clear;
   FGroupsQuery.SQL.Add('SELECT *');
   FGroupsQuery.SQL.Add('FROM Grps');
   FGroupsQuery.Open;
   FGroupsQuery.AfterScroll := FGroupsQueryAfterScroll;

   FGroupsDataSource := TDataSource.Create(nil);
   FGroupsDataSource.DataSet := FGroupsQuery;

   DBGGroupsDBTableView1.DataController.DataSource := FGroupsDataSource;
end;

procedure TfGroupSetUp.sbLocateClick(Sender: TObject);
begin
   EnableGroupSelection(True);
   if Length(Trim(ePartialSearch.Text)) > 0 then
      begin
         qAnimalsNotInGroup.DisableControls;
         Screen.Cursor := crHourGlass;
         try
            if sbLocate.Caption = 'Start' then
               begin
                  qAnimalsNotInGroup.First;
                  PartialSearch;
                  sbLocate.Width := 57;
                  sbLocate.Caption := 'Continue';
               end
            else
               begin
                  if NOT qAnimalsNotInGroup.Eof then
                     qAnimalsNotInGroup.Next;
                  PartialSearch;
               end;
         finally
            qAnimalsNotInGroup.EnableControls;
            Screen.Cursor := crDefault;
         end;
      end;
end;

procedure TfGroupSetUp.PartialSearch;
begin
   // loop thro' table for match
   while ( not(qAnimalsNotInGroup.Eof) ) do
      begin
         if ( Pos(UpperCase(ePartialSearch.Text),UpperCase(qAnimalsNotInGroup.FieldByName('LocateNatID').AsString)) > 0 ) then Exit;
         qAnimalsNotInGroup.Next;
      end;

   // if not found
   if qAnimalsNotInGroup.Eof then
      begin
         Messagedlg('There has been no further match found for "'+ePartialSearch.Text+'"',mtInformation,[mbOK],0);
         qAnimalsNotInGroup.First;
         sbLocate.Caption := 'Start';
      end;
end;

procedure TfGroupSetUp.FormShow(Sender: TObject);
begin
   if UseScanner then
      begin
//         WinData.LoadBtnImage(sbGroupPreview.Glyph, cBtnImgPreview);
//         sbGroupPreview.Visible := True;
         PreviewSep.Visible := True;
         if WinData.CreateTTable(NotInGrpTable, nil, '', 'tNotInGrp.db') then
            begin
               if NotInGrpTable.Exists then
                  NotInGrpTable.DeleteTable;
               NotInGrpTable.FieldDefs.Clear;
               NotInGrpTable.FieldDefs.Add('ID', ftInteger);
               NotInGrpTable.FieldDefs.Add('SearchNatID', ftString,20);
               NotInGrpTable.IndexDefs.Clear;
               NotInGrpTable.IndexDefs.Add('iID', 'ID', [ixUnique,ixPrimary]);
               NotInGrpTable.IndexDefs.Add('iSearchNatID', 'SearchNatID', [ixCaseInsensitive]);
               NotInGrpTable.CreateTable;
               NotInGrpTable.Active := True;
               NotInGrpTable.IndexName := 'iSearchNatID';
            end;
         pScanNatID.Caption := '';
         pScanNatID.Left := 8;
         pScanNatID.Top := 2;
         pScanNatID.Width := 400;
         pScanNatID.Height := 39;
         NatIDLabel.parent := pScanNatID;
         NatIDLabel.Caption := 'Scan Nat. Id. No. barcode';
         NatIDLabel.Left := 5;
         NatIDLabel.Top := 2;
         imgBarcode.Left := NatIDLabel.Left + NatIDLabel.Width + 10;
         imgBarcode.Top := 1;
         eNatIDNum.parent := pScanNatID;
         eNatIDNum.Left := 5;
         eNatIDNum.Top := 17;
         eNatIDNum.Width := 200;
         pScanNatID.Visible := TRUE;
      end
   else
      begin
         NatIDLabel.Caption := 'Nat. Id. No.';
//         sbGroupPreview.Visible := False;
//         PreviewSep.Visible := False;
      end;
   cbGroupTypeChange(cbGroupType);
end;

procedure TfGroupSetUp.FormDestroy(Sender: TObject);
begin
   if ( NotInGrpTable <> nil ) then
      begin
         NotInGrpTable.Close;
         NotInGrpTable.DeleteTable;
         FreeAndNil(NotInGrpTable);
      end;
   if WinData.Groups.State in dsEditModes then
      WinData.Groups.Cancel;
   SendMessage(MenuForm.Handle, WM_RefreshGridViewExternalData, 0, 0);
end;

procedure TfGroupSetUp.SetupScanTable;
var
   NatID : string;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('INSERT INTO tNotInGrp ( ID, SearchNatID )');
         SQL.Add('SELECT DISTINCT(A.ID), A.NatIDNum ');
         SQL.Add('FROM Animals A');
         SQL.Add('WHERE A.ID IN (SELECT DISTINCT F.AID FROM afilters F )');
         ExecSQL;
      finally
         Free;
      end;

   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'tNotInGrp';
         Active := True;

         try
            First;
            while ( not(Eof) ) do
               begin
                  NatID := UPPERCASE(FieldByName('SearchNatID').AsString);
                  if ( Length(NatID) > 0 ) then
                     begin
                        if ( Copy(NatID, 1, 2) = cTagPreFix_IE) or ( Copy(NatID, 1, 2) = 'UK' ) then
                           System.Delete(NatID, 1, 2)
                        //   23/07/18 [V5.8 R1.2] /MK Bug Fix - Code to fix scanning of 372 tags was in release version but not test.
                        else if ( Copy(NatID, 1, 3) = cTagPreFix_372 ) then
                           System.Delete(NatID, 1, 3);
                        Edit;
                        try
                           FieldByName('SearchNatID').AsString := WinData.StripAllNomNumAlpha(NatID);
                           Post;
                        except
                           Cancel;
                        end;
                     end;
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfGroupSetUp.sbGroupPreviewClick(Sender: TObject);
var
   AnimalList : TList;
   SupplierName : string;
begin

   //if not WinData.GroupsGroupType.AsString = 'Sales' then

   if ( WinData.dsGroups.Dataset.RecordCount <= 0 ) or ( WinData.dsGroups.Dataset.State = dsInsert ) then
      begin
         MessageDlg('You must select a group before previewing',mtInformation,[mbOK],0);
         Abort;
      end
   else
      begin
         AnimalList := TList.Create;
         try
            WinData.GetGroupAnimals(WinData.dsGroups.DataSet.FieldByName('ID').AsInteger, AnimalList);
            if cmboDestSource.Value <> '0' then
               SupplierName := cmboDestSource.Text;
            if ( AnimalList.Count > 0 ) then
               uGroupReport.Preview(WinData.dsGroups.DataSet.FieldByName('Description').AsString, 'ID', AnimalList,SupplierName, deMoveFeedDate.Date)
            else
               MessageDlg(Format('No animals found in group %s', [WinData.dsGroups.DataSet.FieldByName('Description').AsString]),mtInformation,[mbOK],0);
         finally
            AnimalList.Free;
         end;
      end;
end;

procedure TfGroupSetUp.ProcessScanned;
const
   cNotFound = 'Cannot find Animal National ID %s';
Var
   NewNatID : String;
begin

   { NOTE : The barcode scanner handheld is configured to append a tabctrl key to
     the scanned string, thus will trigger the OnExit event of the edit control (eNatIDNum)
     When this happens focus shifts to the next control in the tab order. In this
     case ePartialSearch control receives the focus. To shift focus back to
     eNatIDNum control, created OnEnter event for the ePartial control. This will
     set focus back to eNatIDNum control, allowing the user to scan/read other barcodes.
   }

   if UseScanner then
      Begin
         if ( Length ( eNatIDNum.Text ) > 0 ) then
            Begin
               if NotInGrpTable.Locate('SearchNatID',Trim(eNatIDNum.Text),[loCaseInsensitive,loPartialKey] ) then
                  begin
                     if DBGAnimals.DataSource.DataSet.Locate('ID', NotInGrpTable.FieldByName('ID').AsInteger, []) then
                        begin
                           AddRemove;
                           eNatIDNum.Text := '';
                        end
                     else
                        ShowMessage(Format(cNotFound,[ eNatIDNum.Text]))
                  end
               else
                  ShowMessage(Format(cNotFound,[ eNatIDNum.Text]))
            end;
      end;
end;

procedure TfGroupSetUp.ePartialSearchEnter(Sender: TObject);
begin
   if UseScanner then
      eNatIDNum.SetFocus;
end;

procedure TfGroupSetUp.pAddToGroupEnter(Sender: TObject);
begin
//   EnableGroupSelection(True);
end;

procedure TfGroupSetUp.pAddToGroupExit(Sender: TObject);
begin
//   EnableGroupSelection(False);
end;

procedure TfGroupSetUp.Remove;
begin
   AddRemove;
end;

procedure TfGroupSetUp.RemoveAll;
begin
   GroupClear(False);
end;

procedure TfGroupSetUp.Select;
begin
   AddRemove;
end;

procedure TfGroupSetUp.SelectAll;
var
   bkSelectedAnimal,
   bkSelectedGroup : TBookMark;
   dStartGroupDate,
   dStartAllocDate,
   dNewFeedStartDate,
   dEndAllocDate : TDateTime;
   GroupType : TGroupType;
   i,
   iPreviousFeedGroup,
   iLastFeedGroupChecked : Integer;
   iaAnimalExistGroupIDs : PIntegerArray;
begin
   if ( MessageDlg('Are you sure you want to select all animals?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then Exit;

   dStartGroupDate := 0;
   dStartAllocDate := 0;

   GroupType := WinData.GroupManager.GetGroupIDGroupType(WinData.Groups.FieldByName('ID').AsInteger);
   if ( GroupType = gtNone ) then Exit;

   if CheckNewGroup then
      if GroupsOK then
         begin
            bkSelectedGroup := WinData.Groups.GetBookmark;
            // save group settings first
            NoInGroup.Close;
            NoInGroup.Open;
            dsAnimalsNotInGroup.DataSet.DisableControls;
            // Process All animals from the Grid
            bkSelectedAnimal := DBGAnimals.DataSource.DataSet.GetBookmark;
            DBGAnimals.DataSource.DataSet.First;
            MassAdd := True;

            dStartGroupDate := 0;
            dEndAllocDate := 0;

            //   18/09/17 [V5.7 R3.0] /MK Change - Added progress bar to let the user know whats going on with the clear.
            ShowProgressIndicator('Adding Animals To The Group',0,DBGAnimals.DataSource.DataSet.RecordCount,1);
            ProgressIndicator.Max := DBGAnimals.DataSource.DataSet.RecordCount;
            Application.ProcessMessages;
            Update;

            DBGAnimals.DataSource.DataSet.First;
            iLastFeedGroupChecked := 0;
            while ( not(DBGAnimals.DataSource.DataSet.Eof) ) do
               begin
                  iPreviousFeedGroup := 0;
                  SetLength(iaAnimalExistGroupIDs,0);
                  iaAnimalExistGroupIDs := WinData.GroupManager.GetAnimalsExistGroupIDs(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger,
                                                                                        gtNone,WinData.Groups.FieldByName('ID').AsInteger);

                  if ( Length(iaAnimalExistGroupIDs) > 0 ) then
                     if ( GroupType = gtFeed ) then
                        begin
                           if ( Length(iaAnimalExistGroupIDs) > 0 ) then
                              for i := 0 to Length(iaAnimalExistGroupIDs)-1 do
                                 if ( WinData.GroupManager.GetGroupIDGroupType(iaAnimalExistGroupIDs[i]) = gtFeed ) then
                                   iPreviousFeedGroup := iaAnimalExistGroupIDs[i];

                           if ( iPreviousFeedGroup > 0 ) and ( WinData.FeedManager.GroupHasActiveFeedRegime(iPreviousFeedGroup) ) then
                              begin
                                 if ( iLastFeedGroupChecked >= 0 ) and ( iLastFeedGroupChecked <> iPreviousFeedGroup ) then
                                    begin
                                       dEndAllocDate := TfmAllocateFeedToAnimal.GetStart_EndAllocationDate(iPreviousFeedGroup,nil,True,False,Date);
                                       iLastFeedGroupChecked := iPreviousFeedGroup;
                                    end;

                                 if ( dEndAllocDate = 0 ) then
                                    begin
                                       ProgressIndicator.Close;
                                       Application.ProcessMessages;
                                       Update;
                                       SysUtils.Abort;
                                    end;

                                 WinData.GroupManager.RemoveAnimalFromGrp(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger,iPreviousFeedGroup);
                                 WinData.FeedManager.EndFeedEventsForAnimal(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger,dEndAllocDate);
                              end
                           else
                              WinData.GroupManager.RemoveAnimalFromGrp(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger,iPreviousFeedGroup);
                        end
                     else
                        WinData.GroupManager.RemoveAnimalFromGrp(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger,iPreviousFeedGroup);

                  //   18/09/17 [V5.7 R3.0] /MK Change - If feed group and group has active feed regime then user must select an allocation date from uAllocateFeedToAnimal.
                  if ( GroupType = gtFeed ) and ( WinData.GroupManager.GroupHasActiveFeedRegime(WinData.Groups.FieldByName('ID').AsInteger) ) then
                     if ( dStartAllocDate = 0 ) then
                        dStartAllocDate := TfmAllocateFeedToAnimal.GetStart_EndAllocationDate(WinData.Groups.FieldByName('ID').AsInteger,nil,True,True,dEndAllocDate);

                  //   18/09/17 [V5.7 R3.0] /MK Change - Group start date if feed is allocation date, else, it is today.
                  if ( dStartAllocDate > 0 ) then
                     dStartGroupDate := dStartAllocDate
                  else
                     dStartGroupDate := Date;

                  //   18/09/17 [V5.7 R3.0] /MK Change - Use Groups.GroupManager.AddToGroup here.
                  //   28/11/18 [V5.8 R5.5] /MK Bug Fix - Passing in AllowDeletion as whatever length existing group array is as AllowDeletion will
                  //                                      delete animal from previous group selected group are being removed from that group - Michael Callan reported.
                  WinData.GroupManager.AddToGroup(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger,
                                                  WinData.Groups.FieldByName('ID').AsInteger,
                                                  Length(iaAnimalExistGroupIDs) > 0, dStartGroupDate, '', (dStartAllocDate <= 0), False);

                  if ( GroupType = gtFeed ) and ( dStartAllocDate > 0 ) then
                     WinData.FeedManager.CreateFeedsForAnimal(DBGAnimals.DataSource.DataSet.FieldByName('ID').AsInteger,
                                                              WinData.Groups.FieldByName('ID').AsInteger,
                                                              dStartAllocDate);

                  ProgressIndicator.Position := ProgressIndicator.Position + 1;
                  Application.ProcessMessages;
                  Update;

                  DBGAnimals.DataSource.DataSet.Next;
               end;
            ProgressIndicator.Close;
            Application.ProcessMessages;
            Update;

            WinData.Groups.GotoBookmark(bkSelectedGroup);
            WinData.Groups.FreeBookmark(bkSelectedGroup);

            DBGAnimals.DataSource.DataSet.GoToBookmark(bkSelectedAnimal);
            DBGAnimals.DataSource.DataSet.FreeBookmark(bkSelectedAnimal);
            DBGAnimals.DataSource.DataSet.Refresh;

            NoInGroup.Close;
            NoInGroup.Open;
            dsAnimalsNotInGroup.DataSet.EnableControls;
         end;
end;

procedure TfGroupSetUp.sbRemoveAllClick(Sender: TObject);
begin
   EnableGroupSelection(True);
   RemoveAll;
end;

procedure TfGroupSetUp.sbRemoveClick(Sender: TObject);
begin
   EnableGroupSelection(True);
   Remove;
end;

procedure TfGroupSetUp.sbSelectClick(Sender: TObject);
begin
   EnableGroupSelection(True);
   Select;
end;

procedure TfGroupSetUp.sbSelectAllClick(Sender: TObject);
begin
   EnableGroupSelection(True);
   SelectAll;
end;

procedure TfGroupSetUp.EnableGroupSelection(AEnteringControl: Boolean);
begin
   // Prevent user from adding animals from group until
   // group is saved.

   if AEnteringControl then
      begin
         if ( WinData.Groups.State = dsInsert ) then
            begin
               try
                  WinData.Groups.Post; // Added 31/07/07 - Automatically save group if animal is selected.
               except
                  on E : Exception do
                     begin
                        if E.message = 'Field ''Code'' must have a value' then
                           begin
                              MessageDlg('You must enter a Group Code before adding animals to the group.',mtInformation,[mbOK],0);
                              Abort;
                           end;
                     end;
               end;
               // Removed 31/07/07 - MessageDlg('You must select/setup a group before selecting animals.',mtInformation,[mbOK],0);
               // Removed 31/07/07 - Abort;
            end
      end
end;

procedure TfGroupSetUp.sbDoneMouseLeave(Sender: TObject);
begin
   //EnableGroupSelection(False);
end;

procedure TfGroupSetUp.sbDoneClick(Sender: TObject);
begin
   EnableGroupSelection(True);
   Close;
end;

procedure TfGroupSetUp.eAnimalNoClick(Sender: TObject);
begin
   EnableGroupSelection(True);

end;

procedure TfGroupSetUp.DBGAnimalsDblClick(Sender: TObject);
begin
   EnableGroupSelection(True);
   Select;
end;

procedure TfGroupSetUp.DBGAnimalsCellClick(Column: TColumnEh);
begin
   EnableGroupSelection(True);
end;

procedure TfGroupSetUp.sbMovementPermitsClick(Sender: TObject);
begin
   with GenQuery do
      begin
         Update;
         uCMMSPermits.ShowForm(WinData.UserDefaultHerdID,WinData.GroupsID.AsInteger,NBAS31G);
         Update;
      end;
end;

procedure TfGroupSetUp.cbGroupTypeChange(Sender: TObject);
begin
   if ( cbGroupType.Text = 'Sales' ) then
      begin
         lMoveFeedDate.Caption := 'Sales Date';
         lDestSource.Caption := 'Customer';
         cmboDestSource.LookupSource := WinData.dsQueryCustomers;
         cmboDestSource.LookupField := 'ID';
         cmboDestSource.LookupDisplay := 'Name';
         lMoveFeedDate.Visible := True;
         deMoveFeedDate.Visible := True;
         lDestSource.Visible := True;
         cmboDestSource.Visible := True;
      end
   else if ( cbGroupType.Text = 'Purchase' ) then
      begin
         lMoveFeedDate.Caption := 'Purch. Date';
         lDestSource.Caption := 'Supplier';
         cmboDestSource.LookupSource := WinData.dsQuerySuppliers;
         cmboDestSource.LookupField := 'ID';
         cmboDestSource.LookupDisplay := 'Name';
         lMoveFeedDate.Visible := True;
         deMoveFeedDate.Visible := True;
         lDestSource.Visible := True;
         cmboDestSource.Visible := True;
      end
   else if ( cbGroupType.Text = 'Feed' ) then
      begin
         lMoveFeedDate.Caption := 'Alloc. Date';
         lMoveFeedDate.Visible := False;
         deMoveFeedDate.Visible := False;
         lDestSource.Caption := '';
         cmboDestSource.LookupSource := nil;
         cmboDestSource.LookupField := '';
         cmboDestSource.LookupDisplay := '';
         lDestSource.Visible := False;
         cmboDestSource.Visible := False;
      end
   else if ( cbGroupType.Text = 'Batch' ) then
      begin
         lMoveFeedDate.Caption := '';
         lDestSource.Caption := '';
         cmboDestSource.LookupSource := nil;
         cmboDestSource.LookupField := '';
         cmboDestSource.LookupDisplay := '';
         lMoveFeedDate.Visible := False;
         deMoveFeedDate.Visible := False;
         lDestSource.Visible := False;
         cmboDestSource.Visible := False;
      end;
end;

procedure TfGroupSetUp.kwDBNavigator1Click(Sender: TObject;
  Button: TKNavigateBtn);
begin
   cbGroupTypeChange(cbGroupType);

   if ( Button = kwnbInsert ) then
      lActiveFeedGroup.Visible := False;

   if ( Button = kwnbPost ) and
     ( (not(VarIsNull(WinData.GroupsGroupType.AsString))) or
       (WinData.GroupsGroupType.AsString = 'Purchase') ) then
         begin
            if Def.Definition.dUseCrush then
               begin
                  with TCrushXMLExport.Create do
                     try
                        FCrushGroup.Code := WinData.GroupsCode.AsString;
                        FCrushGroup.Description := WinData.GroupsDescription.AsString;
                        FCrushGroup.GroupType := WinData.GroupsGroupType.AsString;
                        FCrushGroup.CrushLoadComplete := WinData.Groups.FieldByName('CrushLoadComplete').AsBoolean;
                        CreateorOpenXMLFile(etPurchase);
                        AddLookupItemToXML;
                     finally
                        Free;
                     end;
               end;
         end;

   if ( Button in [kwnbPost, kwnbDelete] ) then
      try
         Screen.Cursor := crHourGlass;
         try
            FGroupsQuery.AfterScroll := nil;
            FGroupsQuery.Close;
            FGroupsQuery.Open;
            if ( WinData.Groups.Filtered ) then
               begin
                  FGroupsQuery.Filter := WinData.Groups.Filter;
                  FGroupsQuery.Filtered := WinData.Groups.Filtered;
               end;
            FGroupsQuery.Last;
            FGroupsQuery.AfterScroll := FGroupsQueryAfterScroll;
            DBGGroupsDBTableView1.Controller.FocusedRowIndex := 0;
            Application.ProcessMessages;
            Update;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Screen.Cursor := crDefault;
      end;
end;

procedure TfGroupSetUp.cmboDestSourceCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   ID := 0;
   if cmboDestSource.Value = '0' then
      begin

         if cbGroupType.Text = 'Sales' then
            begin
               uCustomers.ShowTheForm(True, ID);
               WinData.QueryCustomers.Close;
               WinData.QueryCustomers.Open;
            end
         else if cbGroupType.Text = 'Purchase' then
            begin
               uSuppliers.ShowTheForm(True, ID);
               WinData.QuerySuppliers.Close;
               WinData.QuerySuppliers.Open;
            end;

         if (ID > 0) then
            cmboDestSource.Value := IntTostr(ID);
      end;
end;

procedure TfGroupSetUp.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key in AlphaNumSet then
      FAllowScrollCancel := False;
end;

procedure TfGroupSetUp.DBGGroupsDBTableView1CanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
   if ( FAllowScrollCancel ) and ( WinData.Groups.State = dsInsert ) then
      begin
         WinData.Groups.Cancel;
      end;
end;

procedure TfGroupSetUp.DBGGroupsDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   cbGroupTypeChange(cbGroupType);
end;

procedure TfGroupSetUp.DBGGroupsDBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if ( FAllowScrollCancel ) and ( WinData.Groups.State = dsInsert ) then
      begin
         WinData.Groups.Cancel;
      end;
end;

procedure TfGroupSetUp.deMoveFeedDateExit(Sender: TObject);
begin
   //   23/11/12 [V5.1 R1.2] /MK Bug Fix - Program allowed sale date to be entered in the future but
   //                                      this was causing an error in the MovementsOut/KImport screen.

   //   07/02/14 [V5.2 R8.1] /MK Change - Only show warning if GroupType is Purchase or Feed.
   if ( cbGroupType.Text <> 'Sale' ) then
      begin
         if deMoveFeedDate.Date > Date then
            begin
               if ( cbGroupType.Text = 'Purchase' ) then
                  begin
                     MessageDlg('Purchase Date must be on or before todays date.'+cCRLF+
                                'Resetting Purchase Date to todays date',mtError,[mbOK],0);

                     deMoveFeedDate.Date := Date;
                  end
               else if ( cbGroupType.Text = 'Feed' ) then
                  begin
                     MessageDlg('Feed Allocation Date must be on or before todays date.'+cCRLF+
                                'Resetting Feed Allocation Date to todays date',mtError,[mbOK],0);

                     deMoveFeedDate.Date := Date;
                  end;
            end;
      end;
end;

procedure TfGroupSetUp.DBGGroupsDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   if ( WinData.Groups.State in [dsEdit,dsBrowse] ) then
      lAddGroupLabel.Caption := 'Edit Group'
   else if ( WinData.Groups.State = dsInsert ) then
      lAddGroupLabel.Caption := 'Add Group';

   //   24/11/17 [V5.7 R5.7] /MK Change - Created a label to indicate to the user to know whether the group has an active feed regime or not.
   ShowActiveFeedGroupLabel;
end;

procedure TfGroupSetUp.eAnimalNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ( Key = VK_RETURN ) then
      begin
         AddRemove;
         eAnimalNo.SelectAll;
      end;
end;

procedure TfGroupSetUp.ePartialSearchKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if ( Key = VK_RETURN ) then
      sbLocateClick(Sender);
end;

procedure TfGroupSetUp.FGroupsQueryAfterScroll(DataSet: TDataSet);
begin
   WinData.Groups.Locate('ID',FGroupsQuery.FieldByName('ID').AsInteger,[]);
end;

function TfGroupSetUp.GetAnimalsOnGridInCurrentGroupCount : Integer;
var
   qSelected : TQuery;
   i : Integer;
   sAnimalSelection : String;
begin
   Result := 0;
   if ( WinData.Groups.FieldByName('ID').AsInteger = 0 ) then Exit;

   try
      qSelected := TQuery.Create(nil);
      qSelected.DatabaseName := AliasName;

      // If no default selection was passed into the form then check to see if there is a filter or cart.
      if ( FSelectionType = stNoSelection ) then
         begin
            // If there is a filtered applied to the main grid then selection type is filter.
            if ( WinData.FilteredAnimals.RecordCount > 0 ) then
               FSelectionType := stFilter;
            // If there are animals in the cart then selection type is cart.
            if ( not(AnimalCart.IsEmpty) ) then
               FSelectionType := stCart;
         end;

      sAnimalSelection := HerdLookup.GetAnimalSelectionToArrayWideString(FSelectionType);
      qSelected.SQL.Clear;
      qSelected.SQL.Add('SELECT COUNT(GL.AnimalID)');
      qSelected.SQL.Add('FROM GrpLinks GL');
      qSelected.SQL.Add('WHERE (GL.GroupID = '+IntToStr(WinData.Groups.FieldByName('ID').AsInteger)+')');

      if ( FSelectionType = stFilter ) then
         qSelected.SQL.Add('AND   (GL.AnimalID IN (SELECT AID FROM AFilters))')
      else
         qSelected.SQL.Add(Format('AND   (GL.AnimalID IN %s)',[sAnimalSelection]));

      qSelected.Open;
      if ( not(qSelected.IsEmpty) ) then
         Result := qSelected.Fields[0].AsInteger;
   finally
      if ( qSelected <> nil ) then
         begin
            qSelected.Close;
            FreeAndNil(qSelected);
         end;
   end;
end;

procedure TfGroupSetUp.ShowActiveFeedGroupLabel;
var
   iSelectedGroupID : Integer;
begin
   iSelectedGroupID := WinData.Groups.FieldByName('ID').AsInteger;
   lActiveFeedGroup.Visible := ( WinData.Groups.State <> dsInsert ) and
                               ( iSelectedGroupID > 0 ) and
                               ( WinData.GroupManager.GetGroupIDGroupType(iSelectedGroupID) = gtFeed ) and
                               ( WinData.FeedManager.GroupHasActiveFeedRegime(iSelectedGroupID) );
end;

end.
