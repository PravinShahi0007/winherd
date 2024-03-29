unit uPedName;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, RXCtrls, ComCtrls, ToolWin, Db, DBTables,
  StdCtrls, ExtCtrls, cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TfPedName = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    SearchGrid: TRxDBGrid;
    pColours: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ToolButton4: TToolButton;
    sbHelp: TRxSpeedButton;
    RxSpeedButton1: TRxSpeedButton;
    GenQuery: TQuery;
    Query1: TQuery;
    Panel1: TPanel;
    Label1: TLabel;
    eSearchField: TEdit;
    bSearch: TButton;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    ToolButton5: TToolButton;
    Panel3: TPanel;
    ToolButton1: TToolButton;
    cbInHerd: TcxCheckBox;
    procedure FindString;
    procedure ClearTable;
    procedure bSearchClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure SearchGridGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure eSearchFieldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FName : string;
  public
    MyTable : TTable;
    MyDataSource : TDataSource;


    { Public declarations }
    class procedure ShowForm(AName : string);
  end;

var
  fPedName: TfPedName;

procedure ShowForm;

implementation

uses DairyData, uPedNamePrint;

{$R *.DFM}


procedure ShowForm;
begin
   TfPedName.ShowForm('');
end;

class procedure TfPedName.ShowForm(AName: string);
begin
   with TfPedName.Create(nil) do
      try
         // Build Temporary table
         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := WinData.KingData.DatabaseName;
         MyTable.TableType := ttParadox;
         MyTable.TableName := 'tPedName';
         MyTable.FieldDefs.Clear;

         MyTable.FieldDefs.Add('ID',ftAutoInc,0,FALSE);
         MyTable.FieldDefs.Add('AnimalNo',ftString,10,FALSE);
         MyTable.FieldDefs.Add('HerdBookNo',ftString,20,FALSE);
         MyTable.FieldDefs.Add('Name',ftString,40,FALSE);
         MyTable.FieldDefs.Add('Sex',ftString,10,FALSE);
         MyTable.FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);
         MyTable.FieldDefs.Add('LactNo',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('Sire',ftString,10,FALSE);
         MyTable.FieldDefs.Add('Dam',ftString,10,FALSE);

         MyTable.IndexDefs.Clear;
         MyTable.IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
         MyTable.IndexDefs.Add('iDateOfBirth','DateOfBirth',[ixCaseInsensitive,ixDescending]);
         MyTable.IndexName := 'iDateOfBirth';

         MyTable.CreateTable;
         MyTable.Open;

         MyDataSource := TDataSource.Create(nil);

         MyDataSource.DataSet := MyTable;
         SearchGrid.DataSource := MyDataSource;
         FName := AName;
         ShowModal;

      finally
         MyTable.Close;
         MyTable.DeleteTable;
         MyTable.Free;

         MyDataSource.Free;
         Free;
      end;

end;

procedure TfPedName.FindString;
begin
   ProgressBar1.Position:= 0;
   ProgressBar1.Max:= WinData.LookUpDamSire.RecordCount;
   Panel2.Show;

   SearchGrid.DataSource.DataSet.DisableControls;
   with WinData.LookUpDamSire do
      begin
         First;
         while NOT EOF do
            begin
               // check for matching name in table
               //showmessage(FieldByName('Name').AsString);



               if (Pos(UpperCase(eSearchField.Text),UpperCase(FieldByName('Name').AsString)) > 0) then
                  begin
                     // if found, add to temporary table
                     if ( cbInHerd.Checked ) and ( FieldByName('InHerd').AsBoolean ) or
                        ( not cbInHerd.Checked ) then
                        begin
                           MyTable.append;
                           MyTable.FieldByName('AnimalNo').AsString    := FieldByName('AnimalNo').AsString;
                           MyTable.FieldByName('HerdBookNo').AsString  := FieldByName('HerdBookNo').AsString;
                           MyTable.FieldByName('Name').AsString        := FieldByName('Name').AsString;
                           MyTable.FieldByName('Sex').AsString         := FieldByName('Sex').AsString;
                           MyTable.FieldByName('DateOfBirth').AsString := FieldByName('DateOfBirth').AsString;
                           MyTable.FieldByName('LactNo').AsInteger := FieldByName('LactNo').AsInteger;
                           if ((FieldByName('DamID').AsInteger > 0) OR (FieldByName('SireID').AsInteger  > 0)) then
                           With GenQuery do
                              Begin
                                 SQL.Clear;
                                 SQL.Add('SELECT D.AnimalNo DAnimalNo');// S.AnimalNo SAnimalNo');
                                 SQL.Add('FROM Animals D'); //, Animals S');
                                 SQL.Add('WHERE (D.ID = '+IntToStr(WinData.LookUpDamSire.FieldByName('DamID').AsInteger)+')');
      //                           SQL.Add('OR (S.ID = '+IntToStr(WinData.LookUpDamSire.FieldByName('SireID').AsInteger)+')');
                                 Open;
      //                           MyTable.FieldByName('Sire').AsString := GenQuery.FieldByName('SAnimalNo').AsString;
                                 MyTable.FieldByName('Dam').AsString := GenQuery.FieldByName('DAnimalNo').AsString;

                                 SQL.Clear;
                                 SQL.Add('SELECT S.AnimalNo SAnimalNo');// S.AnimalNo SAnimalNo');
                                 SQL.Add('FROM Animals S'); //, Animals S');
                                 SQL.Add('WHERE (S.ID = '+IntToStr(WinData.LookUpDamSire.FieldByName('SireID').AsInteger)+')');
                                 Open;
                                 MyTable.FieldByName('Sire').AsString := GenQuery.FieldByName('SAnimalNo').AsString;
                              end;
                            MyTable.Post;
                        end;
                  end;
               Next;
               ProgressBar1.Position:= WinData.LookUpDamSire.RecNo;
            end;
      end;
   GenQuery.Close;

   Panel2.Hide;
   SearchGrid.DataSource.DataSet.EnableControls;
   SearchGrid.Refresh;
end;

procedure TfPedName.ClearTable;
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM ' + MyTable.TableName);
         ExecSQL;
      end;
end;

procedure TfPedName.bSearchClick(Sender: TObject);
begin
   // empty table
   ClearTable;
   // fill table
   FindString;
end;

procedure TfPedName.sbExitClick(Sender: TObject);
begin
   close;
end;

procedure TfPedName.sbHelpClick(Sender: TObject);
begin
//
end;

procedure TfPedName.SearchGridGetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
     if UPPERCASE(MyTable.FieldByName('Sex').AsString) = 'FEMALE' then
        AFont.Color := clRed
     else
        AFont.Color := clBlue;
end;

procedure TfPedName.eSearchFieldKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = vk_return) then
      bSearchClick(Sender);
end;

procedure TfPedName.FormShow(Sender: TObject);
begin
   Panel2.hide;
end;

procedure TfPedName.RxSpeedButton1Click(Sender: TObject);
begin
   try
      if MyTable.RecordCount <= 0 then
         exit;

      Application.CreateForm(TPedNamePrintRep, PedNamePrintRep);
      PedNamePrintRep.QuickRep1.Print;
   finally
   PedNamePrintRep.Free;
   end;
end;

procedure TfPedName.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
   if (FName <> '') then
      begin
         eSearchField.Text := FName;
         bSearchClick(nil);
      end;
end;

end.
