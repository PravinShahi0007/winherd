{
   24/07/14 [V5.3 R4.0] /MK Change - Changed reminder for Bandon to AIM.

   02/04/15 [V5.4 R2.4] /MK Bug Fix - ShowReminder - Only check for SireBreedDifferToCalfBreed for Irish herds as APHIS/CTS send calf breed.

   22/04/15 [V5.4 R3.9] /MK Bug Fix - ShowReminder - Only check for SireBreedDifferToCalfBreed should be after CalvesWithNoSires.

   02/12/15 [V5.5 R1.4] /MK Additional Feature - Add reminders for check for medicines with null groups or withdrawals,
                                                 downloading of ICBF replies and version changes - GL/SP request.

   15/12/15 [V5.5 R1.9] /MK Additional Feature - Allow user to click the "X" the reminder to check Gmail Inbox Emails - GL/Declan O'Meara.

   17/07/17 [V5.6 R9.2] /MK Bug Fix - New Version History reminder was always appearing even if the user clicked the X to remove it.
                                    - If the user had removed all reminders the screen stayed open instead of closing automatically.
                            Change - Only show Incomplete Medicines Reminder if Ireland, BordBiaRegistered and there are Incomplete Medicines.

   16/10/18 [V5.8 R3.1] /MK Additional Feature - A new reminder created to sync with AIM after 30 days based on HerdRecLastSyncDate field in Owners table

   08/07/21 [V6.0 R1.6] /MK Additional Feature - Allow ICBF Reg Reminder and AIM Herd Sync reminders to be removed - John Joe Murphy.   
}

unit uStartupReminders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DairyData, GenTypesConst,
  Db, dbTables, dxmdaset, cxGridCardView, cxGridBandedTableView, cxGridChartView,
  uAimClient, uCTSBirthReg, uAimAnimalRegistration, uCalfRegFlt, cxGraphics,
  uICBFEventExport, MenuUnit, KActionList, ActionReminderFilt, uPreferences,
  uVaccineDueOn, uCTSMovementReg, uDataBackup, cxStyles, ExtCtrls, uCalvesWithNoSires,
  uSireBreedDifferToCalfBreed, uVersionHistory, uMailboxHelper, uHerdLookup,
  uAnimalRemedyData, uMedicinesNullGroup;

const
  WM_REMOVE_REMINDER = WM_USER + 1;

type
  TfmStartupReminders = class(TForm)
    StartupReminderLevel: TcxGridLevel;
    gStartupReminder: TcxGrid;
    StartupReminderTableView: TcxGridTableView;
    StartupReminderTableViewDescription: TcxGridColumn;
    StartupReminderTableViewGoTo: TcxGridColumn;
    StartupReminderTableViewRemove: TcxGridColumn;
    StartupReminderTableViewReminderType: TcxGridColumn;
    Panel1: TPanel;
    btnClose: TcxButton;
    Panel2: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    GridStyleOdd: TcxStyle;
    GridStyleEven: TcxStyle;
    BackGround: TcxStyle;
    SelectedStyle: TcxStyle;
    procedure gStartupReminderTableViewGoToPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure gStartupReminderTableViewRemovePropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure StartupReminderTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure StartupReminderTableViewEditing(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure StartupReminderTableViewCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StartupReminderTableViewRemoveCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    FGridStyleContentEvenOdd: Boolean;
    FHerdType : THerdType;
    FAnimalRemedyData : TAnimalRemedyData;
    FFormToShow: Boolean;
    procedure CreateReminders;
    procedure AddReminder ( AReminderType : Integer; ADescription : String);
    procedure ShowReminder(AReminderType: Integer);
    procedure RemoveReminder(var msg: TMessage); message WM_REMOVE_REMINDER;
    function PadDescription(const ADescription : string) : string;
    { Private declarations }
  public
    class procedure ShowTheForm;
    { Public declarations }
  end;

var
  fmStartupReminders: TfmStartupReminders;

const
   cCalfRegReminder = 1;
   cMoveRegReminder = 2;
   cICBFRegReminder = 3;
   cNewVersionReminder = 4;
   cBackupReminder = 5;
   cActionWarningsReminder = 6;
   cProActiveActionListReminder = 7;
   cVaccineReminder = 8;
   cVersionHistoryReminder = 9;
   cDownloadEmailsReminder = 10;
   cMedicinesNullGroup_NullWithdrawals = 11;
   cAIMHerdRecReminder = 12;

implementation

uses
   uCAFREFertListData,
   kRoutines;

{$R *.DFM}

class procedure TfmStartupReminders.ShowTheForm;
begin
   with TfmStartupReminders.Create(nil) do
      try
         if ( FFormToShow ) then
            ShowModal;
      finally
         Free;
      end;
end;

procedure TfmStartupReminders.FormCreate(Sender: TObject);
begin
   FFormToShow := False;
   FHerdType := HerdLookup.GetHerdType(WinData.UserDefaultHerdID);
   CreateReminders;
end;

procedure TfmStartupReminders.CreateReminders;
var
   CalfCount,
   iDateDiff : Integer;
   b : Boolean;
begin
   CalfCount := 0;
   WinData.QueryBandonRegistrations(b);
   WinData.QueryICBFRegistrations;

   with StartupReminderTableView.DataController do
      begin
         BeginFullUpdate;
         RecordCount := 0;
         if ( WinData.SystemRegisteredCountry = Ireland ) then
            CalfCount := WinData.FBandonCalvesToRegister
         else if ( WinData.SystemRegisteredCountry = England ) then
            CalfCount := WinData.CTSBirthRegCount;

         if ( CalfCount > 0 ) then
            begin
               if ( WinData.SystemRegisteredCountry = Ireland ) then
                  AddReminder(cCalfRegReminder,PadDescription(Format('There are %d calve(s) to register with AIM.',[CalfCount])))
               else if ( WinData.SystemRegisteredCountry = England ) then
                  AddReminder(cCalfRegReminder,PadDescription(Format('There are %d calve(s) to register with CTS.',[CalfCount])));
            end;

         if ( WinData.SystemRegisteredCountry = England ) and ( WinData.CTSMovementRegCount > 0 ) then
            AddReminder(cMoveRegReminder, PadDescription(Format('There are %d movements to register with CTS.',[WinData.CTSMovementRegCount])));

         if ( WinData.GlobalSettings.ICBFRegReminder ) and ( WinData.FICBFEventsToRegister > 0 ) then
            AddReminder(cICBFRegReminder,PadDescription('There are ICBF events to register'));

         if ( WinData.GlobalSettings.BackupReminder ) then
            if (( WinData.LastBackUpDate + 30) < Date ) and ( WinData.LastBackUpDate > 0 ) then
               AddReminder(cBackupReminder, PadDescription('It is ' + FloatToStrF(Date() - WinData.LastBackUpDate, ffFixed, 4 , 0 ) + ' days since you took a Backup.'));

         if ( WinData.SystemRegisteredCountry = Ireland ) and
            ( FAnimalRemedyData.GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal > 0 ) and ( WinData.IsBordBiaRegistered ) then
            AddReminder(cMedicinesNullGroup_NullWithdrawals, PadDescription('There are incomplete medicines that MAY affect your Bord Bia compliancy.'));
         FreeAndNil(FAnimalRemedyData);

         if ( WinData.GlobalSettings.NewVersionReminder and (WinData.LastVersionUpdate <= IncMonth(Date, -3)) ) then
            begin
               WinData.LastVersionUpdate := Date; // Now update database.
               AddReminder(cNewVersionReminder, PadDescription('A new version of Kingswood Herd is available to download'));
            end;

         if ( WinData.VaccinationRemindersAvailable ) then
            if ( Preferences.ValueAsBoolean[cGSShowVaccineRemindersOnStartup] ) then
               AddReminder(cVaccineReminder, PadDescription('View Vaccine reminders.'));

         if ( WinData.DisplayNews ) then
            AddReminder(cVersionHistoryReminder, PadDescription('View changes in new version.'));

         if ( (WinData.SystemRegisteredCountry = Ireland) and (WinData.DefaultEmailClient <> cEmailClient_MS) and
              (FHerdType <> htBeef) ) and ( WinData.GlobalSettings.GmailEmailDownloadReminder ) then
                AddReminder(cDownloadEmailsReminder, PadDescription('Check your Gmail Inbox (ICBF emails & Link files)?'));

         if ( ActionReminderList.Enabled ) and ( not(ActionReminderList.ReportsToRun = [] ) )  then
            AddReminder(cProActiveActionListReminder, PadDescription('Run Pro-Active Breeding Due-To Reports.'));

         if ( Preferences.ValueAsBoolean[cGSShowActionWarningRemindersOnStartup] = True ) then
            AddReminder(cActionWarningsReminder, PadDescription('Run Action/Warning/Reminder Reports.'));

         if ( WinData.SystemRegisteredCountry = Ireland ) and ( WinData.GlobalSettings.AIMHerdRecReminder ) then
            begin
               iDateDiff := 0;
               if ( Date > WinData.UserDefaultHerdRecSyncDate ) then
                  iDateDiff := Trunc(Date - WinData.UserDefaultHerdRecSyncDate);
               if ( iDateDiff >= 30 ) then
                  AddReminder(cAIMHerdRecReminder, PadDescription(Format('Its been %d days since your last sync with AIM. Click the arrow to sync now.',[iDateDiff])));
            end;

         EndFullUpdate;

         FFormToShow := ( RecordCount > 0 );

         if ( FFormToShow ) then
            GotoFirst;
      end;
end;

procedure TfmStartupReminders.AddReminder(AReminderType: Integer;
  ADescription: String);
begin
   try
      StartupReminderTableView.DataController.Append;
      StartupReminderTableViewReminderType.EditValue := AReminderType;
      StartupReminderTableViewDescription.EditValue := ADescription;
      StartupReminderTableView.DataController.Post;
   except
   end;
end;

procedure TfmStartupReminders.gStartupReminderTableViewGoToPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   Value : Variant;
   i : Integer;
begin
   with StartupReminderTableView.DataController do
      begin
         Value := Values[FocusedRecordIndex, StartupReminderTableViewReminderType.Index];
         if ( not(VarIsNull(Value)) ) then
            try
               Screen.Cursor := crHourGlass;
               ShowReminder(Value);
               Screen.Cursor := crDefault;
            except
            end;
      end;
end;

procedure TfmStartupReminders.ShowReminder(AReminderType : Integer);
var
   AimAnimalRegistration : TAimAnimalRegistration;
begin
   Enabled := False;
   try
      if ( AReminderType = cCalfRegReminder ) then
         begin
             //   02/04/15 [V5.4 R2.4] /MK Bug Fix - Only check for SireBreedDifferToCalfBreed for Irish herds as APHIS/CTS send calf breed.
             if ( WinData.SystemRegisteredCountry = Ireland ) then
               begin
                  if ( TfmCalvesNoSires.GetCalvesWithNoSires = 0 ) then
                     if ( TfmSireBreedDifferToCalfBreed.GetCalves = 0 ) then
                         begin
                            if ( AIMClient.ClientExists ) then
                               begin
                                  AimAnimalRegistration := TAimAnimalRegistration.Create(Menuform.Handle, WinData.UserDefaultHerdID);
                                  try
                                     AimAnimalRegistration.GoToAimAnimalRegistration();
                                  finally
                                     FreeAndNil(AimAnimalRegistration);
                                  end;
                               end
                            else
                               uCalfRegFlt.ShowForm;
                         end;
               end
             else if ( WinData.SystemRegisteredCountry = England ) then
                begin
                   if ( TfmCalvesNoSires.GetCalvesWithNoSires = 0 ) then
                      TfmCTSWSBirthReg.Execute;
                end;
         end
      else if ( AReminderType = cICBFRegReminder ) then
         uICBFEventExport.ShowTheForm
      else if ( AReminderType = cMoveRegReminder ) then
         TfmCTSWSMovementReg.Execute
      else if ( AReminderType = cProActiveActionListReminder ) then
         ActionReminderFilt.RunReport(rmProAction, ActionReminderList.ReportsToRun)
      else if ( AReminderType = cActionWarningsReminder ) then
         begin
            Application.CreateForm(TfmCAFREFertListData, fmCAFREFertListData);
            fmCAFREFertListData.PreviewListData(True);
         end
      else if ( AReminderType = cNewVersionReminder ) then
         begin
            if Menuform <> nil then
               begin
                  Close;
                  MenuForm.StartDownload;
               end;
         end
      else if ( AReminderType = cVaccineReminder ) then
         TfmVaccineDueOn.ShowForm(THerdVaccination)
      else if ( AReminderType = cBackupReminder ) then
         TfmDataBackup.execute
      else if ( AReminderType = cVersionHistoryReminder ) then
         ShowVersionHistory([Ireland])
      else if ( AReminderType = cDownloadEmailsReminder ) then
         begin
            WinData.ViewMailBox(HerdLookup.HerdNumberByHerdId(WinData.UserDefaultHerdID));
            WinData.FAttachmentsDownloaded := True;
         end
      else if ( AReminderType = cMedicinesNullGroup_NullWithdrawals ) then
         begin
            TfmMedicinesNullGroup.ShowTheForm(False);
            if ( FAnimalRemedyData.GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal = 0 ) or ( not(WinData.IsBordBiaRegistered) ) then
               PostMessage(Handle, WM_REMOVE_REMINDER,0,0);
            FreeAndNil(FAnimalRemedyData);
         end
      else if ( AReminderType = cAIMHerdRecReminder ) then
         begin
            WinData.GoToHerdProfile(WinData.UserDefaultHerdId);
            PostMessage(Handle, WM_REMOVE_REMINDER,0,0);
         end;
   finally
      Enabled := True;
   end;
end;

procedure TfmStartupReminders.gStartupReminderTableViewRemovePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   Value : Variant;
begin
   with StartupReminderTableView.DataController do
      begin
         Value := Values[FocusedRecordIndex, StartupReminderTableViewReminderType.Index];
         if ( not(VarIsNull(Value)) ) then
            begin
               if ( MessageDlg('Do you wish to remove this reminder?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then Exit;
               if ( Value = cNewVersionReminder ) then
                  WinData.GlobalSettings.NewVersionReminder := False
               else if ( Value = cProActiveActionListReminder ) then
                  ActionReminderList.Enabled := False
               else if ( Value = cActionWarningsReminder ) then
                  Preferences.ValueAsBoolean[cGSShowActionWarningRemindersOnStartup] := False
               else if ( Value = cVaccineReminder ) then
                  Preferences.ValueAsBoolean[cGSShowVaccineRemindersOnStartup] := False
               else if ( Value = cBackupReminder ) then
                  WinData.GlobalSettings.BackupReminder := False
               else if ( Value = cDownloadEmailsReminder ) then
                  WinData.GlobalSettings.GmailEmailDownloadReminder := False
               else if ( Value = cVersionHistoryReminder ) then
                  WinData.DisplayNews := False
               else if ( Value = cICBFRegReminder ) then
                  WinData.GlobalSettings.ICBFRegReminder := False
               else if ( Value = cAIMHerdRecReminder ) then
                  WinData.GlobalSettings.AIMHerdRecReminder := False;
               WinData.SavePreferences;
            end;
      end;

   PostMessage(Handle, WM_REMOVE_REMINDER,0,0);
end;

procedure TfmStartupReminders.RemoveReminder(var msg: TMessage);
begin
   if ( msg.Msg = WM_REMOVE_REMINDER ) then
      begin
         StartupReminderTableView.DataController.DeleteRecord(StartupReminderTableView.DataController.FocusedRecordIndex);
         if ( StartupReminderTableView.DataController.RecordCount = 0 ) then
            Close;
      end;
end;

procedure TfmStartupReminders.StartupReminderTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
   Value : Variant;
   i,
   iValue : Integer;
   Rect : TRect;
begin
   {
   if (AViewInfo.Item.Index = 4) then
      begin
         Value := AViewInfo.GridRecord.Values[2];
         iValue := Value;
         if ( not(iValue = 0) and (iValue in [cCalfRegReminder, cMoveRegReminder,
                                              cICBFRegReminder, cMedicinesNullGroup_NullWithdrawals,
                                              cSyncWithDept]) ) then
            begin
               Rect := AViewInfo.Bounds;
               ACanvas.Pen.Color := clWindow;
               ACanvas.Pen.Style := psSolid;
               ACanvas.FillRect(Rect);
               ADone := True;
            end;
      end;
   }
end;

procedure TfmStartupReminders.StartupReminderTableViewEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
var
   Value : Variant;
   iValue : Integer;
begin
   if ( AItem = StartupReminderTableViewRemove ) then
      begin
         with StartupReminderTableView.DataController do
            begin
               Value := Values[FocusedRecordIndex, StartupReminderTableViewReminderType.Index];
               iValue := Value;
            end;
            AAllow := ( not(iValue in [cCalfRegReminder, cMoveRegReminder,
                                       cMedicinesNullGroup_NullWithdrawals]) );
      end;
end;

procedure TfmStartupReminders.StartupReminderTableViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   i : Integer;
begin
   with Sender.DataController do
      begin
         for i := 0 to Sender.Controller.GridView.ItemCount-1 do
            begin
               if ( not((i = StartupReminderTableViewGoTo.Index) or (i = StartupReminderTableViewRemove.Index)) ) then
                  Sender.Controller.GridView.Items[i].Editing := False
               else
                  Sender.Controller.GridView.Items[i].Editing := True;
            end;
         AHandled := True;
      end;
end;

procedure TfmStartupReminders.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfmStartupReminders.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then
      Close;
end;

function TfmStartupReminders.PadDescription(
  const ADescription: string): string;
begin
   Result := PadLeft(ADescription, ' ', Length(ADescription)+4);
end;

procedure TfmStartupReminders.StartupReminderTableViewRemoveCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
   Value : Variant;
   i,
   iValue : Integer;
   Rect : TRect;
begin
   Value := AViewInfo.GridRecord.Values[2];
   if ( Value = Null ) then Exit;
   iValue := Value;
   if ( not(iValue = 0) and (iValue in [cCalfRegReminder, cMoveRegReminder,
                                        cMedicinesNullGroup_NullWithdrawals]) ) then
      begin
         Rect := AViewInfo.Bounds;
         ACanvas.Pen.Color := clWindow;
         ACanvas.Pen.Style := psSolid;
         ACanvas.FillRect(Rect);
         ADone := True;
      end;
end;

end.
