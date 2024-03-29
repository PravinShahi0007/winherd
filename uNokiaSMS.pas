unit uNokiaSMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Parser, ComObj, IniFiles, OleCtrls,
  SMSComp, Types, SMSEventGenerator;

type
  TfmNokiaSMS = class(TForm)
    Status: TLabel;
    ProgressBar: TProgressBar;
    CancelButton: TBitBtn;
    Timer: TTimer;
    Bevel1: TBevel;
    StatusBar1: TStatusBar;
    SMS: TOxygenSMS;
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    IniFile : TIniFile;
    Cancelled : Boolean;
    iInboxLocations : Array of Integer;
    SMSEventGen : TSMSEventGenerator;
    procedure SetInboxLocations(sSlots: WideString);
  public
    { Public declarations }
    ReceivingMsgs : Boolean;
    plComRecall : Boolean;
    procedure GetMessages(var EventList : TStringList; var Result : Byte);
    procedure ReadMessages;
  end;

var
  fmNokiaSMS: TfmNokiaSMS;
  WM_PLMessage : Word;

implementation
uses
   uNokiaSettings, GenTypesConst, KRoutines;

{$R *.DFM}

procedure TfmNokiaSMS.FormCreate(Sender: TObject);
begin
   if not FileExists(ExtractFilePath( ParamStr(0))+'\'+PhoneIniFile) then
      try
         Application.CreateForm(TfmNokiaSettings,fmNokiaSettings);
         fmNokiaSettings.ShowModal;
      finally
         fmNokiaSettings.Free;
      end;

   Cancelled := False;
   IniFile := TIniFile.Create(ExtractFilePath( ParamStr(0))+'\'+PhoneIniFile);
   SMS.ComNumber := IniFile.ReadInteger(IniNokia, IniComPort, 1);
   SMS.ConnectionMode := IniFile.ReadInteger(IniNokia, IniNokiaConnectionType, 78);
   IniFile.Free;

   case SMS.ConnectionMode of
      Nokia_DAU9P : StatusBar1.Panels[1].Text := sNokia_DAU9P;
      Nokia_DLR3  : StatusBar1.Panels[1].Text := sNokia_DLR3;
      Nokia_InfraRed : begin
                          StatusBar1.Panels[0].Text := 'Wireless';
                          StatusBar1.Panels[1].Text := sNokia_InfraRed;
                          StatusBar1.Panels[2].Text := 'Status: Searching';
                       end;
   end;

   SMSEventGen := TSMSEventGenerator.Create;

end;

procedure TfmNokiaSMS.FormShow(Sender: TObject);
begin
   Cursor := crHourGlass;
   ProgressBar.Position := 0;
   Timer.Enabled := True;
end;

procedure TfmNokiaSMS.CancelButtonClick(Sender: TObject);
begin
  Cancelled := True;
  ModalResult := mrCancel;
end;

procedure TfmNokiaSMS.TimerTimer(Sender: TObject);
begin

   if FindWindow(nil, 'Kingswood PhoneLink Communicator') <> 0 then
      begin
         Sendmessage(HWND_BROADCAST, WM_PLMessage, 0, -1);
         plComRecall := True;
         Sleep(2000);
      end;

  Timer.Enabled := false;
  Status.Caption := 'Searching phone device...';
  Application.ProcessMessages;
  Cursor := crHourGlass;
  CancelButton.Enabled := False;
   if SMS.Open then
      begin
         StatusBar1.Panels[2].Text := 'Status: Connected';
         CancelButton.Enabled := True;
         ReadMessages;
         // Read complete, return OK and close the form
         if not Cancelled then
            ModalResult := mrOk;
      end
   else
      begin
         SMS.Close;
         MessageDlg('Connection to nokia phone failed!',mtInformation,[mbOk],0);
         StatusBar1.Panels[2].Text := 'Status: Disconnected';
         CancelButton.Enabled := True;
         ModalResult := mrAbort;
      end;
end;

procedure TfmNokiaSMS.SetInboxLocations(sSlots: WideString);
var
   nIndex : Byte;
   nPos : SmallInt;
begin
   try
      SetLength(iInboxLocations, SMS.GetInboxBusy +1);
      nIndex := 0;
      nPos := Pos(Comma, sSlots);
      while nPos > 0 do
         begin
            iInboxLocations[nIndex] := StrToInt(Copy(sSlots, 1, nPos-1));
            System.Delete(sSlots, 1, nPos);
            nPos := Pos(Comma, sSlots);
            Inc(nIndex);
         end;
      ProgressBar.Max := SMS.GetInboxBusy -1;
   except
      MessageDlg('Error accessing message locations',mtError,[mbOK],0);
   end;
end;

procedure TfmNokiaSMS.ReadMessages;
var
   i : SmallInt;
   InboxSlots : WideString;
   IsMsg : WordBool;
   SMSDate : TDateTime;
   SMSText,
   SMSRecieveNum : string;
   SMSDeliv: integer;
   SMSPict : TBitmap;
begin
   ProgressBar.Visible := True;
   InboxSlots := SMS.GetInboxLocations;
   SetInboxLocations(InboxSlots+Comma);
   for i := Low(iInboxLocations) to Pred(High(iInboxLocations)) do
      begin
         Status.Caption := Format('Reading message [%d]', [i+1]);
         if Cancelled then Exit;
         Application.ProcessMessages;
         IsMsg := False;
         SMSDate := 0;
         SMSText := '';
         SMSRecieveNum := '';
         SMSDeliv := -1;
         SMSPict := nil;
         if SMS.ReadSMSMessage(iInboxLocations[i], IsMsg, SMSDate, SMSText, SMSRecieveNum, SMSDeliv, SMSPict) then
            if SMSEventGen.ValidateMsgContent(SMSText) then
               begin
                  SMSEventGen.CreateEvents(FormatDateTime('dd/mm/yyyy', SMSDate), SMSText, i, -1);
                  SMS.DeleteSMSMessage(iInboxLocations[i]);
               end;
         ProgressBar.StepIt;
      end;
   ProgressBar.Visible := False;
end;

procedure TfmNokiaSMS.FormDestroy(Sender: TObject);
begin
   SMSEventGen.Free;
   SMS.Close;
   if plComRecall then
      begin
         //Sendmessage(HWND_BROADCAST, WM_PLMessage, 0, 0);
         Sleep(500);
         WinExec(PChar('C:\Kingswood Herd Management\PhoneLink\plcom.exe'), SW_SHOWMINIMIZED);
      end;
end;

procedure TfmNokiaSMS.GetMessages(var EventList: TStringList;
  var Result: Byte);
begin
   Result := ShowModal;
   try
      EventList.Assign(SMSEventGen.SMSEventList);
      Free;
   except
   end;
end;

initialization
  WM_PLMessage := RegisterWindowmessage('Kingswood Phone Link');

end.

