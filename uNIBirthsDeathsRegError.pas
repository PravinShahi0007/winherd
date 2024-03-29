unit uNIBirthsDeathsRegError;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, DBCtrls, ExtCtrls;

type
  TNIBirthsDeathsRegError = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    BatchRegAnimals: TTable;
    Label1: TLabel;
    dsBatchRegAnimals: TDataSource;
    dbNatIDNum: TDBText;
    DBNavigator1: TDBNavigator;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NIBirthsDeathsRegError: TNIBirthsDeathsRegError;

implementation
uses
   uNIBirthsDeathsReg;

{$R *.DFM}

procedure TNIBirthsDeathsRegError.FormCreate(Sender: TObject);
begin
   BatchRegAnimals.MasterSource := ThisDataSource;
   dbNatIDNum.DataSource := ThisDataSource;
   dbNatIDNum.DataField := 'NatIDNum';
   BatchRegAnimals.Active := True;
end;

procedure TNIBirthsDeathsRegError.FormDestroy(Sender: TObject);
begin
   BatchRegAnimals.Active := False;
end;

end.
