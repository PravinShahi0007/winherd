{
   26/03/14 [V5.2 R9.1] /MK Change - Chnaged LogMeIn logo and URL to TeamViewer.

   10/02/19 [V5.8 R6.8] /MK Change - Changed TeamViewer to call program, same as MenuUnit TeamViewer objects.

   02/12/20 [V5.9 R7.7] /MK Change - Removed Emer Howard's phone number from Evening Support but leave Evening Support - GL request.   
}

unit uSystem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Gauges, Menus, ShellAPI, RXCtrls,
  ToolWin, ChkDebug, uModuleDefUpdate;

type
  TScrType = (Sys, Res, TOU);
  TfSystem = class(TForm)
    Timer1: TTimer;
    ResPanel: TGroupBox;
    Image3: TImage;
    ResGroup: TListBox;
    pAbout: TPanel;
    imgBack: TImage;
    LWeb: TLabel;
    Label17: TLabel;
    Label6: TLabel;
    LEmail: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RegOwner: TLabel;
    SerialNo: TLabel;
    VerNo: TLabel;
    Image1: TImage;
    Label4: TLabel;
    Label22: TLabel;
    PType: TLabel;
    Image2: TImage;
    Bevel1: TBevel;
    sbExit: TSpeedButton;
    sbReadMe: TSpeedButton;
    Label5: TLabel;
    ToolBar: TToolBar;
    ToolButton2: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbRes: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbRegister: TSpeedButton;
    Memo: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbReadMeClick(Sender: TObject);
    procedure LWebClick(Sender: TObject);
    procedure LEmailClick(Sender: TObject);
    procedure LEmailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgBackMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LWebMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbRegisterClick(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FScrType : TScrType;
  public
    { Public declarations }
  end;



procedure ShowForm(ScreenType :TScrType);
var

 fSystem : TfSystem;

implementation
uses
    GenTypesConst,
    DairyData,
    def,
    RegisterForm,
    uKingscc,
    kRoutines;

{$R *.DFM}

procedure ShowForm(ScreenType :TScrType);
begin
    with TfSystem.Create(nil) do
       try
          FScrType := ScreenType;
          Case ScreenType Of
               Res : Begin
                          Caption := 'Change Resolution';
                          pAbout.Hide;
                          Respanel.Top := 52;
                          Respanel.Left := imgback.Left;
                          Respanel.show;
                          ToolBar.Visible := True;
                     end;
               Sys : Begin
                          Caption := 'About Windows Herd Management';
                          pAbout.show;
                          Respanel.Hide;
                          ToolBar.Visible := False;
                     end;
               TOU : begin
                          Caption := 'Kingswood Herd Management - Read Me';
                          pAbout.show;
                          Respanel.Hide;
                          ToolBar.Visible := False;
                          sbReadMe.Down := True;
                          sbReadMeClick(nil);
                          sbReadMe.Visible := False;
                        end;
          End;
          ShowModal;
       finally
          Free;
       end;
end;

procedure TfSystem.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfSystem.FormShow(Sender: TObject);
{Const
     PlatNames : array[0..3] of string =
    ('Win32s', 'Windows 95', 'Windows NT', 'Windows 98');
Var
   OVI : TOsVERSIONINFO;
   SI  : TSystemInfo;
   TMS : TMemoryStatus;
   Ico : TIcon;
   St : ShortString;
   Doub : integer; }
begin
    sbRegister.Visible := verd = 96536;
   {
   if FScrType = TOU then
      begin
         Memo.Align := alTop;
         Memo.Height := 302;
         sbRegister.Visible := False;

      end
   else

     OVI.dwOSVersionInfoSize := Sizeof(OVI);
     GetVersionEx(OVI);
     If ( OVI.DwMajorVersion = 4 ) and ( OVI.dwMinorversion = 10 ) Then
        OSLabel.Caption := 'Windows 98 Version 4.10'
     Else
         OSLabel.Caption := Format('%s, Version %u.%.2u',
                       [PlatNames[OVI.dwPlatformID], OVI.DwMajorVersion,
                                  OVI.dwMinorversion]);
     GetSystemInfo(SI);
     Case SI.dwProcessorType OF
             386 : CPU.Caption := '386';
             486 : CPU.Caption := '486';
             586 : CPU.Caption := 'Pentium Processor';
        Else CPU.Caption := 'Unknown Processer Type' + IntToStr(SI.dwProcessortype);
     End;

     TMS.dwLength := SizeOf(TMS);
     GlobalMemoryStatus(TMS);
     Doub := (TMS.dwtotalphys) div 1024000;
     St := intToStr ( Doub );
     RamLabel.caption := st +' MB RAM';
     Timer1.Enabled := True;}
     {Try
        Ico := Ticon.Create;
        Ico.Handle := LoadIcon(0,IDI_WINLOGO);
        With Image2.Picture Do
             Begin
                  Ico.Height;
                  Ico.Width;
                  Image2.Picture.Graphic := Ico;
             End;
        Ico.Free;
     Except
           Image2.Hide;
     End;}
end;

procedure TfSystem.Timer1Timer(Sender: TObject);
Var TMS : TMemoryStatus;
begin
{     TMS.dwLength := SizeOf(TMS);
     GlobalMemoryStatus(TMS);
     Gauge2.Progress := (10000*TMS.dwAvailphys) DIV TMS.dwTotalPhys;
     Memory.Caption := FormatFloat('#',(TMS.dwAvailphys + TMS.dwAvailPagefile) DIV 1024);
}
end;

procedure TfSystem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Timer1.Enabled := False;
end;

procedure TfSystem.FormActivate(Sender: TObject);
begin
     VerNo.Caption := HerdVerNo;
     RegOwner.Caption := Def.Definition.dRegOwner;
     SerialNo.Caption := IntToStr (Def.Definition.dSerialNo);

     If ((Def.Definition.dUsePremiums)AND
              (Def.Definition.dUseManCal) AND
              (Def.Definition.dUseQuotaMan)AND
              (Def.Definition.dUseMilkRec) AND
              (Def.Definition.dUsePedigree))THEN
              PType.caption := 'Dairy (Pedigree/Recording) System'
     Else If ((Def.Definition.dUsePremiums)AND
              (Def.Definition.dUseManCal) AND
              (Def.Definition.dUseQuotaMan)AND
              (Def.Definition.dUsePedigree))THEN
              PType.caption := 'Dairy (Pedigree) System'
     Else If ((Def.Definition.dUsePremiums)AND
              (Def.Definition.dUseManCal) AND
              (Def.Definition.dUseQuotaMan)AND
              (Def.Definition.dUseMilkRec)) THEN
              PType.caption := 'Dairy (Recording) System'
     Else If ((Def.Definition.dUsePremiums) AND
              (Def.Definition.dUseManCal) AND
              (Def.Definition.dUseQuotaMan)) THEN
              PType.caption := 'Dairy (Standard) System'
     Else if ((def.Definition.dUsePremiums) AND
              (Def.Definition.dUseManCal) AND
              (Def.Definition.dUsePedigree)) THEN
              PType.caption := 'Suckler (Pedigree) System'
     Else if ((def.Definition.dUsePremiums)AND
              (Def.Definition.dUseManCal)) THEN
              PType.caption := 'Suckler System'
     Else If (def.Definition.dUsePremiums) THEN
              PType.caption := 'Beef System'
     Else PType.caption := 'Herd System';
end;

procedure TfSystem.FormCreate(Sender: TObject);
var
  i : Integer;
  DevMode : TDevMode;
begin
     i := 0;
     while EnumDisplaySettings(nil,i,Devmode) do
     begin
          with Devmode do
               ResGroup.Items.Add(Format('%dx%d %d Colors',[dmPelsWidth,dmPelsHeight,1 shl dmBitsperPel]));
               Inc(i);
     end;
     ResPanel.Hide;
end;

procedure TfSystem.ListBox1Click(Sender: TObject);
begin
     sbRes.Enabled := ResGroup.ItemIndex >= 0;
end;

procedure TfSystem.Button1Click(Sender: TObject);
var DevMode : TDevMode;
    WindowHandle : THandle;
    WindowClass : array[0..50] of Char;
begin
     EnumDisplaySettings(nil,ResGroup.ItemIndex,Devmode);
     ChangeDisplaySettings(DevMode,0);
     If Messagedlg('Your Settings have changed, do you wish to keep this new setting?',mtInformation,[mbYes,mbNo],0) = mrYes Then
        begin
             Application.Minimize;
             Application.Restore;
             Close;
        End;
end;

procedure TfSystem.sbExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfSystem.sbReadMeClick(Sender: TObject);
begin
     If sbReadMe.Down Then
         Memo.Visible := True
     Else
         Memo.Visible := False;
end;

procedure TfSystem.LWebClick(Sender: TObject);
begin
   OpenUrl('http://www.kingswood.ie/');
end;

procedure TfSystem.LEmailClick(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','mailto:info@kingswood.ie',nil,nil,SW_SHOWNORMAL);
end;

procedure TfSystem.LEmailMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     LWeb.Font.Color := clblue;
     LWeb.Font.Style := [];
     Cursor := crHandPoint;
     LEMail.Font.Color := clRed;
     LEmail.Font.Style := [fsUnderline];
end;

procedure TfSystem.imgBackMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     Cursor := crDefault;
     LEmail.Font.Color := clblue;
     LEmail.Font.Style := [];
     LWeb.Font.Color := clblue;
     LWeb.Font.Style := [];
     Label7.Font.Color := clblue;
     Label7.Font.Style := [];

end;

procedure TfSystem.LWebMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     Cursor := crHandPoint;
     LEmail.Font.Color := clblue;
     LEmail.Font.Style := [];
     Label7.Font.Color := clblue;
     Label7.Font.Style := [];
     LWeb.Font.Color := clRed;
     LWeb.Font.Style := [fsUnderline];
end;

procedure TfSystem.sbRegisterClick(Sender: TObject);
begin
   Application.CreateForm(TRegister, Register);
   Register.HerdRun := True;
   Register.Label4.Caption := IntToStr(Def.Definition.dSerialNo);
   Register.ShowModal;
   Register.Free;
end;

procedure TfSystem.Label7Click(Sender: TObject);
begin
   WinData.CallProg.CallTeamViewer();
end;

procedure TfSystem.Label7MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   Cursor := crHandPoint;
   LEmail.Font.Color := clblue;
   LEmail.Font.Style := [];
   LWeb.Font.Color := clblue;
   LWeb.Font.Style := [];
   Label7.Font.Color := clRed;
   Label7.Font.Style := [fsUnderline];
end;

procedure TfSystem.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( Shift = [ssCtrl,ssShift]) And (Key = VK_F7) then
      if DevMachine then
         TfmModuleDefUpdate.ShowTheForm;
end;

end.
