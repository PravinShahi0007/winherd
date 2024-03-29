unit uImportFileMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo;

type
  TfmImportFileMemo = class(TForm)
    ImportMemo: TcxMemo;
    bBottomBar: TPanel;
    btnClose: TcxButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm ( ACaption : String; AMemoList : TStringList);
  end;

var
  fmImportFileMemo: TfmImportFileMemo;

implementation

{$R *.DFM}

{ TfmImportFileMemo }

class procedure TfmImportFileMemo.ShowTheForm(ACaption: String; AMemoList: TStringList);
var
   i : Integer;
begin
   with TfmImportFileMemo.Create(nil) do
      try
         Caption := ACaption;
         for i := 0 to AMemoList.Count-1 do
            ImportMemo.Lines[i] := AMemoList.Strings[i];
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmImportFileMemo.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfmImportFileMemo.FormShow(Sender: TObject);
begin
   btnClose.SetFocus;
end;

end.
