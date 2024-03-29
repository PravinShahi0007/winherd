{
   24/06/19 [V5.8 R9.5] /MK Change - uAIMHeifTempTransfers - New look to the screen as suggested by SP/GL for better understanding of result of screen.

   06/08/19 [V5.8 R9.8] /MK Additional Feature - Added new GridView which groups heifers into their herds instead of user selecting individual animals - Donal Kiely.
                                               - New GridView now allows user to select whether the herd is Contract Herd or not and whether the heifer
                                                 is to be retained in Kingswood, if the heifer is retained then create Temp Movement event, otherwise
                                                 sell the heifer off. If the herd is not selected as Contract Herd then sell the animal off.

   16/03/20 [V5.9 R2.9] /MK Additional Feature - Show information box explaining choices when user clicks the information image - GL request.                                                 
}

unit uAIMHeifTempTransfers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, db, dbTables, GenTypesConst,
  dxPSCore, dxPScxCommon, dxPScxGridLnk, cxGroupBox, cxRadioGroup, ActnList,
  cxStyles, cxTextEdit, cxMaskEdit, cxDropDownEdit, KRoutines, cxImage,
  ExtCtrls;

type
  TAIMHeiferInfo = class
  public
     FAIMHeiferTable : TTable;
     constructor Create;
     destructor Destroy;override;
  end;

  TfmAIMHeifTempTransfers = class(TForm)
    AIMContractHerdsGridDBTableView: TcxGridDBTableView;
    AIMContractHerdsGridLevel: TcxGridLevel;
    AIMContractHerdsGrid: TcxGrid;
    AIMContractHerdsGridDBTableViewSelected: TcxGridDBColumn;
    AIMContractHerdsGridDBTableViewNatIDNo: TcxGridDBColumn;
    AIMContractHerdsGridDBTableViewNewHerdID: TcxGridDBColumn;
    AIMContractHerdsGridDBTableViewMoveDate: TcxGridDBColumn;
    btnSaveMovements: TcxButton;
    AIMContractHerdsGridDBTableViewSortNatID: TcxGridDBColumn;
    AIMContractHerdsGridDBTableViewDateOfBirth: TcxGridDBColumn;
    lHeader: TcxLabel;
    ActionList1: TActionList;
    actSave: TAction;
    AIMContractHerdsGridView: TcxGridTableView;
    AIMContractHerdsGridViewHerdNumber: TcxGridColumn;
    AIMContractHerdsGridViewHeiferCount: TcxGridColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    AIMContractHerdsGridViewMovementType: TcxGridColumn;
    imgInfo: TcxImage;
    pInformation: TPanel;
    lHeader1: TcxLabel;
    lHeader2: TcxLabel;
    lText1: TcxLabel;
    lText2: TcxLabel;
    procedure AIMContractHerdsGridDBTableViewSortNatIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imgInfoClick(Sender: TObject);
  private
    function GetTransGridCell(Index: Integer): Variant;
    procedure SetTransGridCell(Index: Integer; const Value: Variant);
  private
    FAnimalTable : TTable;
    FAnimalDataSource : TDataSource;
    FSelectedHerds : Integer;
    procedure SetSelectedAnimalsByHerdNumber;
    procedure InsertDataIntoGrid;
    property TransGridCell[Index : Integer] : Variant read GetTransGridCell write SetTransGridCell;
    { Private declarations }
  public
    { Public declarations }
    class procedure SaveTempTransfers;
  end;

var
  fmAIMHeifTempTransfers: TfmAIMHeifTempTransfers;

const
  cDefHeight = 404;
  cInfoHeight = 518;

implementation

{$R *.DFM}

{ TfmAIMHeifTempTransfers }

procedure TfmAIMHeifTempTransfers.FormCreate(Sender: TObject);
begin
    FAnimalTable := TTable.Create(nil);
    FAnimalTable.DatabaseName := AliasName;
    FAnimalTable.TableName := 'tmpHeiferInfo';
    FAnimalTable.Open;
    FAnimalDataSource := TDataSource.Create(nil);
    FAnimalDataSource.DataSet := FAnimalTable;
end;

class procedure TfmAIMHeifTempTransfers.SaveTempTransfers;
begin
   with TfmAIMHeifTempTransfers.Create(nil) do
      try
         AIMContractHerdsGridDBTableView.DataController.DataSource := FAnimalDataSource;
         AIMContractHerdsGridLevel.GridView := AIMContractHerdsGridView;
         InsertDataIntoGrid;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAIMHeifTempTransfers.AIMContractHerdsGridDBTableViewSortNatIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[AIMContractHerdsGridDBTableViewNatIDNo.Index]
   else
      AText := '';
end;

procedure TfmAIMHeifTempTransfers.InsertDataIntoGrid;
var
   qHerdAnimalCount : TQuery;
begin
   qHerdAnimalCount := TQuery.Create(nil);
   try
      AIMContractHerdsGridView.DataController.BeginFullUpdate;
      qHerdAnimalCount.DatabaseName := AliasName;
      qHerdAnimalCount.SQL.Clear;
      qHerdAnimalCount.SQL.Add('SELECT DISTINCT(NewHerdID), COUNT(AnimalID)');
      qHerdAnimalCount.SQL.Add('FROM '+FAnimalTable.TableName);
      qHerdAnimalCount.SQL.Add('GROUP BY NewHerdID');
      qHerdAnimalCount.Open;
      qHerdAnimalCount.First;
      while ( not(qHerdAnimalCount.Eof) ) do
         begin
            AIMContractHerdsGridView.DataController.Append;
            AIMContractHerdsGridViewMovementType.EditValue := '';
            AIMContractHerdsGridViewHerdNumber.EditValue := qHerdAnimalCount.Fields[0].AsString;
            AIMContractHerdsGridViewHeiferCount.EditValue := qHerdAnimalCount.Fields[1].AsInteger;
            AIMContractHerdsGridView.DataController.Post;
            qHerdAnimalCount.Next;
         end;
      qHerdAnimalCount.Close;
      qHerdAnimalCount.SQL.Clear;
      qHerdAnimalCount.SQL.Add('SELECT COUNT(AnimalID)');
      qHerdAnimalCount.SQL.Add('FROM '+FAnimalTable.TableName);
      qHerdAnimalCount.Open;
      if ( qHerdAnimalCount.RecordCount > 0 ) then
         begin
            if ( qHerdAnimalCount.Fields[0].AsInteger > 1 ) then
               lHeader.Caption := Format(lHeader.Caption,[IntToStr(qHerdAnimalCount.Fields[0].AsInteger) + ' heifers' ])
            else
               lHeader.Caption := Format(lHeader.Caption,[IntToStr(qHerdAnimalCount.Fields[0].AsInteger) + ' heifer' ]);
         end
   finally
      FSelectedHerds := AIMContractHerdsGridView.DataController.RecordCount;
      FreeAndNil(qHerdAnimalCount);
      AIMContractHerdsGridView.DataController.EndFullUpdate;
   end;
end;

procedure TfmAIMHeifTempTransfers.SetSelectedAnimalsByHerdNumber;
var
   i : Integer;
   qUpdate : TQuery;
   bAddToXML : Boolean;
   sNewHerdID : String;
   vMoveType : Variant;
   sSQLSetText : String;
   bAborted : Boolean;
const
   cTempMove = 'Contract Rearing (Retain On Kingswood Profile)';
   cTransfer = 'Contract Rearing (Move off Kingswood Profile)';
   cSellAnimal = 'Normal Farm to Farm Movement (Create Sale Record)';
begin
   qUpdate := TQuery.Create(nil);
   try
      qUpdate.DatabaseName := AliasName;
      AIMContractHerdsGridView.DataController.BeginFullUpdate;
      for i := 0 to AIMContractHerdsGridView.DataController.RecordCount-1 do
         begin
            vMoveType := AIMContractHerdsGridView.DataController.Values[i, AIMContractHerdsGridViewMovementType.Index];
            sNewHerdID := AIMContractHerdsGridView.DataController.Values[i, AIMContractHerdsGridViewHerdNumber.Index];
            if ( VarIsNull(vMoveType) ) or ( VarIsEmpty(vMoveType) ) then
               begin
                  MessageDlg(Format('No Movement Type selected for %s.',[sNewHerdID]),mtError,[mbOK],0);
                  bAborted := True;
                  AIMContractHerdsGridView.DataController.FocusedRecordIndex := i;
                  AIMContractHerdsGrid.SetFocus;
                  if bAborted then Break;
               end;
            qUpdate.SQL.Clear;
            qUpdate.SQL.Add('UPDATE '+FAnimalTable.TableName);
            qUpdate.SQL.Add('%s');
            qUpdate.SQL.Add('WHERE Upper(NewHerdID) = "%s"');
            if ( vMoveType = cTempMove ) then
               sSQLSetText := 'SET Selected = True, AddToXMLFile = False'
            else if ( vMoveType = cTransfer ) then
               sSQLSetText := 'SET Selected = True, AddToXMLFile = True'
            else if ( vMoveType = cSellAnimal ) then
               sSQLSetText := 'SET Selected = False, AddToXMLFile = False';
            qUpdate.SQL.Text := Format(qUpdate.SQL.Text,[sSQLSetText,sNewHerdID]);
            qUpdate.ExecSQL;
         end;
      AIMContractHerdsGridView.DataController.EndFullUpdate;

      if ( bAborted ) then Abort;

   finally
      FreeAndNil(qUpdate);
   end;
end;

function TfmAIMHeifTempTransfers.GetTransGridCell(Index: Integer): Variant;
begin
   Result := varNull;
   if Index > -1 then
      Result := AIMContractHerdsGridView.DataController.Values[AIMContractHerdsGridView.DataController.FocusedRecordIndex, Index];
end;

procedure TfmAIMHeifTempTransfers.SetTransGridCell(Index: Integer; const Value: Variant);
begin
   AIMContractHerdsGridView.DataController
      .Values[AIMContractHerdsGridView.DataController.FocusedRecordIndex, Index]
         := Value;
end;

procedure TfmAIMHeifTempTransfers.actSaveExecute(Sender: TObject);
begin
   if ( FAnimalTable.State in dsEditModes ) then
      FAnimalTable.Post;
   SetSelectedAnimalsByHerdNumber;
   Close;
end;

procedure TfmAIMHeifTempTransfers.FormDestroy(Sender: TObject);
begin
   if ( FAnimalTable <> nil ) then
      FreeAndNil(FAnimalTable);
   if ( FAnimalDataSource <> nil ) then
      FreeAndNil(FAnimalDataSource);
end;

{ TAIMHeiferInfo }

constructor TAIMHeiferInfo.Create;
begin
   FAIMHeiferTable := TTable.Create(nil);
   FAIMHeiferTable.DatabaseName := AliasName;
   FAIMHeiferTable.TableName := 'tmpHeiferInfo';
   FAIMHeiferTable.FieldDefs.Clear;
   FAIMHeiferTable.FieldDefs.Add('ID',ftAutoInc);
   FAIMHeiferTable.FieldDefs.Add('Selected',ftBoolean);
   FAIMHeiferTable.FieldDefs.Add('AnimalID',ftInteger);
   FAIMHeiferTable.FieldDefs.Add('LactNo',ftInteger);
   FAIMHeiferTable.FieldDefs.Add('HerdID',ftInteger);
   FAIMHeiferTable.FieldDefs.Add('NatIDNo',ftString,20);
   FAIMHeiferTable.FieldDefs.Add('SortNatID',ftString,20);
   FAIMHeiferTable.FieldDefs.Add('DateOfBirth',ftDateTime);
   FAIMHeiferTable.FieldDefs.Add('NewHerdID',ftString,20);
   FAIMHeiferTable.FieldDefs.Add('MoveDate',ftDateTime);
   FAIMHeiferTable.FieldDefs.Add('AddToXMLFile',ftBoolean);
   FAIMHeiferTable.IndexDefs.Clear;
   FAIMHeiferTable.IndexDefs.Add('iID','ID',[ixPrimary,ixUnique]);
   FAIMHeiferTable.CreateTable;
   FAIMHeiferTable.Open;
end;

destructor TAIMHeiferInfo.Destroy;
begin
   if ( FAIMHeiferTable <> nil ) then
      begin
         FAIMHeiferTable.Close;
         FAIMHeiferTable.DeleteTable;
         FreeAndNil(FAIMHeiferTable);
      end;
end;

procedure TfmAIMHeifTempTransfers.FormActivate(Sender: TObject);
begin
   Height := cDefHeight;
   pInformation.Visible := False;
end;

procedure TfmAIMHeifTempTransfers.imgInfoClick(Sender: TObject);
begin
   pInformation.Visible := ( not(pInformation.Visible) );
   Height := cDefHeight;
   if ( pInformation.Visible ) then
      Height := cInfoHeight;
   Application.ProcessMessages;
   Update;
end;

end.
