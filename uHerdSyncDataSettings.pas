{
   24/10/17 [V5.7 R4.0] /MK Change - Changed max value of seNoBulls to 100 - GL / Martina Neville request.

   03/08/21 [V6.0 R1.7] /MK Change - Default seNoBulls to 60 - GL/SP/Adrian Thackleberry request.
}

unit uHerdSyncDataSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, cxContainer, cxEdit,
  cxGroupBox, cxPC, cxControls, StdCtrls, cxButtons;

type
  TfmHerdSyncDataSettings = class(TForm)
    DataActionPageControl: TcxPageControl;
    tsDataSettings: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    lInfo: TcxLabel;
    seNoBulls: TcxSpinEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    seAnimalRemedyNumberOfYears: TcxSpinEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    tsMisc: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxLabel5: TcxLabel;
    LastSyncDateValue: TcxLabel;
    AdvancedSettingsButton: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AdvancedSettingsButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveControlValues();
    procedure LoadControlValues();
  public
    { Public declarations }
    class procedure Show();
  end;

var
  fmHerdSyncDataSettings: TfmHerdSyncDataSettings;

implementation
uses
   DairyData, uFarmSyncSettings, KRoutines;

{$R *.DFM}

procedure TfmHerdSyncDataSettings.FormCreate(Sender: TObject);
var
   LastSyncDate : TDateTime;
begin
   if (WinData.SyncDefaults.Exists) then
      WinData.SyncDefaults.Active := True;

   LastSyncDate := TfmFarmSyncSettings.GetLastSyncDate(DataDir, stHerd, WinData.DefaultHerdID);
   if ( LastSyncDate > 0 ) then
      LastSyncDateValue.Caption := FormatDateTime('dd/mm/yyyy', LastSyncDate)
   else
      LastSyncDateValue.Caption := 'Unknown';
end;

procedure TfmHerdSyncDataSettings.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
   if not WinData.SyncDefaults.Active then // if some db error occurs or table doesnt exist or cannot be opened
      Close;
   Update;
   Application.ProcessMessages;
end;

procedure TfmHerdSyncDataSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   WinData.SyncDefaults.Active := False;
end;

procedure TfmHerdSyncDataSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if (ModalResult = mrOK) then
      begin
         SaveControlValues();
      end;
end;

procedure TfmHerdSyncDataSettings.SaveControlValues();
begin
   if not (WinData.SyncDefaults.Active) then Exit;

   WinData.SyncDefaults.Edit;
   WinData.SyncDefaults.FieldByName('MaxInUseBullCount').AsInteger := seNoBulls.Value;
   WinData.SyncDefaults.FieldByName('NoOfYearsHealthHistory').AsInteger := seAnimalRemedyNumberOfYears.Value;
   WinData.SyncDefaults.Post;
end;

procedure TfmHerdSyncDataSettings.LoadControlValues();
begin
   if not (WinData.SyncDefaults.Active) then Exit;

   WinData.SyncDefaults.First;

   seNoBulls.Value := WinData.SyncDefaults.FieldByName('MaxInUseBullCount').AsInteger;
   seAnimalRemedyNumberOfYears.Value := WinData.SyncDefaults.FieldByName('NoOfYearsHealthHistory').AsInteger;
end;

class procedure TfmHerdSyncDataSettings.Show();
begin
   with TfmHerdSyncDataSettings.Create(nil) do
      try
         LoadControlValues();
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmHerdSyncDataSettings.AdvancedSettingsButtonClick(Sender: TObject);
begin
   if (WinData.SyncServiceIsAvailable) then
      WinData.CallProg.FarmSync(handle, '-v -h "'+ DataDir +'" '+ WinData.GetSyncingHerd)
   else
      MessageDlg('Farm Sync program is not installed or could not be opened',mtError,[mbOK],0);
end;

end.
