unit uSyncWarning;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxCheckBox, db, dbTables;

type
  TfmSyncWarning = class(TForm)
    AnimalGrid: TcxGrid;
    AnimalGridTableView: TcxGridTableView;
    AnimalGridTableViewNatIdNo: TcxGridColumn;
    AnimalGridLevel: TcxGridLevel;
    btnClose: TcxButton;
    cxLabel1: TcxLabel;
    AnimalGridTableViewWarning: TcxGridColumn;
    AnimalGridTableViewIsCurrent: TcxGridColumn;
    cbShowAllWarnings: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbShowAllWarningsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
     FOnlyLoadCurrent : Boolean;
     FFormShowing : Boolean;
     procedure SetIsCurrentFlag();
     procedure LoadWarnings(AOnlyLoadCurrent : Boolean);
  public
    { Public declarations }
    class function HasWarnings : Boolean;
    class procedure ShowWarnings(AOnlyLoadCurrent : Boolean);
  end;

var
  fmSyncWarning: TfmSyncWarning;

implementation
uses
   GenTypesConst;

{$R *.DFM}

procedure TfmSyncWarning.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SetIsCurrentFlag();
end;

procedure TfmSyncWarning.LoadWarnings(AOnlyLoadCurrent : Boolean);
var
   Index : Integer;
begin
   Index := 0;

   Screen.Cursor := crHourGlass;
   AnimalGrid.Enabled := false;
   try
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT  * FROM SyncWarnings');
            if AOnlyLoadCurrent then
               SQL.Add('WHERE IsCurrent = True');
            SQL.Add('Order By RecordTimeStamp Desc');
            Open;

            AnimalGridTableView.DataController.RecordCount := RecordCount;
            if (RecordCount>0) then
               begin
                  while not eof do
                     begin
                        AnimalGridTableView.DataController.Values[Index,AnimalGridTableViewNatIdNo.Index] := FieldByName('NatIdNo').AsString;
                        AnimalGridTableView.DataController.Values[Index,AnimalGridTableViewWarning.Index] := FieldByName('Warning').AsString;
                        AnimalGridTableView.DataController.Values[Index,AnimalGridTableViewIsCurrent.Index] := FieldByName('IsCurrent').AsBoolean;
                        Inc(Index);

                        Next;
                     end;
                  AnimalGridTableView.DataController.FocusedRecordIndex := 0;
               end;
         finally
            Free;
         end;
   finally
      AnimalGrid.Enabled := True;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmSyncWarning.SetIsCurrentFlag;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE SyncWarnings SET IsCurrent = False');
         ExecSQL;
      finally
         Free;
      end;
end;

procedure TfmSyncWarning.cbShowAllWarningsClick(Sender: TObject);
begin
   cbShowAllWarnings.Enabled := False;
   try
      LoadWarnings(not cbShowAllWarnings.checked);
   finally
      cbShowAllWarnings.Enabled := True;
   end;
end;

class function TfmSyncWarning.HasWarnings: Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(Id) FROM SyncWarnings Where IsCurrent = True');
         Open;
         First;
         try
            Result := (Fields[0].AsInteger>0);
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

class procedure TfmSyncWarning.ShowWarnings(AOnlyLoadCurrent : Boolean);
begin
   with TfmSyncWarning.Create(nil) do
      try
         FOnlyLoadCurrent := AOnlyLoadCurrent;
         cbShowAllWarnings.OnClick := nil;

         cbShowAllWarnings.Checked := not FOnlyLoadCurrent;
         cbShowAllWarnings.OnClick := cbShowAllWarningsClick;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmSyncWarning.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
   LoadWarnings(FOnlyLoadCurrent);
end;

end.
