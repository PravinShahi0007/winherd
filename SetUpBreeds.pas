{
  07/01/09 [V3.9 R5.6] /SP Additional Feature - Allow Setup of New Breed using class function SetupBreedFromPedigreeCode(APedigreeCode : string) : Integer;

  27/03/17 [V5.6 R5.6] /MK Change - Changed old grid to new cxGrid to allow sorting on click of column header.
                                  - Defaulting sort to breed code.
}

unit SetUpBreeds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, db, ComCtrls, Buttons,
  RXCtrls, ToolWin, kwDBNavigator, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TfSetUpBreeds = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Code: TDBEdit;
    Name: TDBEdit;
    GestPeriod: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton1: TToolButton;
    DBNavigator1: TkwDBNavigator;
    DBMemo1: TDBMemo;
    DBCheckBox2: TDBCheckBox;
    Label2: TLabel;
    PedigreeBreed: TDBEdit;
    BreedsGridDBTableView: TcxGridDBTableView;
    BreedsGridLevel: TcxGridLevel;
    BreedsGrid: TcxGrid;
    BreedsGridDBTableViewCode: TcxGridDBColumn;
    BreedsGridDBTableViewName: TcxGridDBColumn;
    procedure FormActivate(Sender: TObject);
    procedure BreedGridDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TKNavigateBtn);
    procedure BreedGridExit(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure CodeChange(Sender: TObject);
    procedure NameChange(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFormShowing : Boolean;
    FModified : Boolean;
    PreviousIndex : String;
    FAddingRecord : Boolean;
    procedure SetModifiedFlag;
    procedure CheckForReadOnly;
  public
    { Public declarations }
    ReturnValue : String;
    class function SetupBreedFromPedigreeCode(APedigreeCode : string) : Integer;
  end;

procedure ShowTheForm ( AddingRecord : Boolean);

implementation
uses
    DairyData, kDbRoutines, GenTypesConst;

var
  fSetUpBreeds: TfSetUpBreeds;

{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean);
begin
   Application.CreateForm(TfSetUpBreeds, fSetUpBreeds);
   with fSetUpBreeds do
      try
          FAddingRecord := AddingRecord;
          if FAddingRecord then
             begin
                if System_Registered_Country = Ireland then
                   MessageDlg('WARNING: Please ensure all new breeds added to the system comply '+#13#10 +
                   'with the offical ICBF/Dept Of Agri. breed listings.',mtWarning,[mbOK],0);
             end;
          ShowModal;
      finally
          FreeAndNil(fSetUpBreeds);
      end;

end;

procedure TfSetUpBreeds.CheckForReadOnly;
begin
    if WinData.Breeds.Active then
       begin
          if WinData.Breeds.State = dsInsert then
             begin
                Code.ReadOnly := FALSE;
                PedigreeBreed.ReadOnly := FALSE;
                Name.ReadOnly := FALSE;
             end
          else
             begin
                Name.ReadOnly := TRUE;
                Code.ReadOnly := TRUE;
                PedigreeBreed.ReadOnly := TRUE;
             end;
       end;
end;

procedure TfSetUpBreeds.FormActivate(Sender: TObject);
begin
    { Initialise the Return Value }
    ReturnValue := '';
    FModified := False;
    FFormShowing := True;
end;

procedure TfSetUpBreeds.BreedGridDblClick(Sender: TObject);
begin
   ReturnValue := Code.Field.AsString;
   Close;
end;

procedure TfSetUpBreeds.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.Breeds, ModalResult = mrOK, FModified );
end;

procedure TfSetUpBreeds.bExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfSetUpBreeds.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   WinData.DefaultBreed := WinData.Breeds.FieldByName('ID').Value;
   WinData.Breeds.Close;
   WinData.Breeds.IndexName := PreviousIndex;
   WinData.Breeds.Open;
end;

procedure TfSetUpBreeds.DBNavigator1Click(Sender: TObject;
  Button: TKNavigateBtn);
begin
    CheckForReadOnly;
end;

procedure TfSetUpBreeds.BreedGridExit(Sender: TObject);
begin
    CheckForReadOnly;
end;

procedure TfSetUpBreeds.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('SetupBreeds.htm');
end;

procedure TfSetUpBreeds.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TfSetUpBreeds.CodeChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSetUpBreeds.NameChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpBreeds.DBCheckBox1Click(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfSetUpBreeds.DBCheckBox2Click(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfSetUpBreeds.FormShow(Sender: TObject);
begin
   PreviousIndex := WinData.Breeds.IndexName;
   WinData.Breeds.Close;
   WinData.Breeds.IndexName := 'iBreedName';
   WinData.Breeds.Open;

   if FAddingRecord then
      begin
         WinData.Breeds.Append;
      end
   else
      begin
         // do not allow modification to breed table!
         DBNavigator1.VisibleButtons := [  kwnbFirst,kwnbLast,kwnbNext,kwnbPrior ]
      end;

   CheckForReadOnly;
end;

//  07/01/2009 [V3.9 R5.6] /SP Additional Feature : Allow Setup of New Breed using class function SetupBreedFromPedigreeCode(APedigreeCode : string) : Integer;
class function TfSetUpBreeds.SetupBreedFromPedigreeCode(APedigreeCode: string): Integer;
var
   vResult : Variant;
begin
   Result := 0;
   with TfSetUpBreeds.Create(nil) do
      try
         OnShow := nil;
         WinData.Breeds.Append;
         WinData.BreedsCode.AsString := APedigreeCode;
         WinData.BreedsName.AsString := 'Special Breed';
         WinData.BreedsPedigreeBreed.AsString := APedigreeCode;
         WinData.BreedsGestationPeriod.AsInteger := 283;
         CheckForReadOnly;
         ShowModal;
      finally
         fSetUpBreeds.Free;

         vResult := WinData.Breeds.Lookup('PedigreeBreed', APedigreeCode, 'ID');
         if not VarIsNull(vResult) then
            Result := VResult;
      end;
end;

end.
