{
  05/01/2009 [V3.8 R 5.6] /SP Bug Fix - OnlineBackup not assigning date (today) to WinData.LastBackupDate

  22/06/11 [V4.1 R2.1] /MK Additional Feature - Add Warning To Backup To Floppy Disk.

  19/01/12 [V5.0 R3.6] /MK Change - btnFloppyDiskBackupRestore.Click - If Restore Then No Need To Show Second ConfirmRestore Message.

  17/05/12 [V5.0 R5.7] /MK Bug Fix - FormDestroy - Delete And Rebuild Indexes.

  31/03/14 [V5.2 R9.3] /SP Bug Fix - ZipDataExecuteAction - Delete file to stop DynaZip appending to zip file.

  01/10/14 [V5.3 R7.4] /MK Change - BackupToServer - Copy Farmgate.def into backup file for use with reinstall.

  10/09/15 [V5.4 R8.5] /MK Additional Feature - FormActivate - Disable Restore if Sync enabled - SP/GL request.
                                              - FormKeyDown - Allow keyboard ctrl + r to bring up restore tabe if its disabled.

  28/09/15 [V5.4 R9.1] /MK Change - Disable Restore if FarmSync is set up - SP/GL request.
                                  - Don't allow the override, CTRL + R, for anyone - GL request.

  20/04/16 [V5.5 R5.0] /MK Change - Move the Sires.db and UKSires.db files into a temporary directory before the zip file is created
                                    and then move these files back again. This makes the backup file size smaller.

  28/04/16 [V5.5 R5.2] /MK Bug Fix - If Web Directory does exist in Kingswood Herd Management then create it before moving the
                                     Sires.db and UKSires.db files into the Web/TempBackup directory.

  28/11/17 [V5.7 R5.7] /MK Change - CanBackupAccounts - Use WinData.IsBlacklistedIP function here.

  30/04/19 [V5.8 R9.0] /MK Change - Enabled the ExcludeFollowingFlag and added Sires.db, Sires.px, UKSires.db, *.xml and *.txt files to an ExcludeFollowing list.

  04/06/21 [V6.0 R1.3] /MK Bug Fix - RestoreData - Some backup files from the server can come down as 0MB, give error to choose another file.
}

unit uDataBackup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, StdCtrls, cxButtons,
  cxPC, Menus, dxStatusBar, DynaLibU, DynaZip, DynaLibZ, cxProgressBar,
  cxLookAndFeels, FileCtrl, dxBar, dxBarExtItems, LMDWebBase, LMDWebConfig,
  LMDWebHTTPGet, LMDDownload, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, uIndexes, KDBRoutines,
  uFarmSyncSettings, uApplicationLog, uFileSize;

type
  TZipDestType = (zdFloppy, zdCDR, zdExternalDevice, zdOnlineServer);
  TZipOperation = (zoZip, zoUnzip);
  TDataAction = (daBackup, daRestore);
  TfmDataBackup = class(TForm)
    PopupMenu1: TPopupMenu;
    miFormatDisk: TMenuItem;
    StatusBar: TdxStatusBar;
    Zip: TZipFile;
    Unzip: TUnzipFile;
    dxStatusBar1Container2: TdxStatusBarContainerControl;
    miSpanDisks: TMenuItem;
    dxBarManager1: TdxBarManager;
    blbClose: TdxBarLargeButton;
    DataActionPageControl: TcxPageControl;
    tsBackup: TcxTabSheet;
    lFloppyDiskStorageDescription: TcxLabel;
    lCDStorageDescription: TcxLabel;
    lExternalStorageDescription: TcxLabel;
    lOnlineStorageDescription: TcxLabel;
    btnFloppyDiskBackupRestore: TcxButton;
    btnCDBackupRestore: TcxButton;
    btnExternalDeviceBackupRestore: TcxButton;
    btnOnlineBackupRestore: TcxButton;
    tsRestore: TcxTabSheet;
    lLastBackupDate: TcxLabel;
    dxBarStatic1: TdxBarStatic;
    lOnlineStorage: TcxLabel;
    lExternalStorage: TcxLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    lCDStorage: TcxLabel;
    lFloppyDiskStorage: TcxLabel;
    OpenDialog: TOpenDialog;
    LDatabaseName: TcxLabel;
    LDate: TcxLabel;
    GetOBClient: TLMDWebHTTPGet;
    GetSerNo: TLMDWebHTTPGet;
    procedure DataActionPageControlDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure DataActionPageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure miFormatDiskClick(Sender: TObject);
    procedure btnFloppyDiskBackupRestoreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZipMajorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
    procedure UnzipMajorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
    procedure miSpanDisksClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnExternalDeviceBackupRestoreClick(Sender: TObject);
    procedure blbCloseClick(Sender: TObject);
    procedure btnCDBackupRestoreClick(Sender: TObject);
    procedure DataActionPageControlChange(Sender: TObject);
    procedure btnOnlineBackupRestoreClick(Sender: TObject);
    procedure GetSerNoProcessed(Sender: TObject);
    procedure GetOBClientProgress(Sender: TLMDWebHTTPGet;
      Item: TLMDDownloadItem);
    procedure GetOBClientProcessed(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FDataAction : TDataAction;
    FProgressBar : TcxProgressBar;
    DatabaseName : String;
    DataDirectory : String;
    ZipArray   : array[0..70] of char;
    UnZipArray : array[0..70] of char;
    ExitNow : Boolean;
    AccCompanies : TStringList;
    FArchiveDirectory : string;
    FResult : Boolean;
    FAutoBackup : Boolean;
    procedure SetupStatusBar;
    function ZipDataExecuteAction(SourcePath, DestPath : string; const CloseDB,
                     SetBackupDate : Boolean;
                     ZipOp : TZipOperation = zoZip) : Boolean;
    procedure CloseDatabase;
    function ArchiveData : Boolean;
    function BackupToCD : Boolean;
    function BackupToRemovable : Integer;
    function BackupToFloppy : Boolean;
    function BackupToServer : Boolean;
    procedure UpdateStatus( Text : string);
    function TestBackup(const AFileName : string) : Boolean;
    procedure RestoreData(const AFileName : string);
    function RestoreFromServer : Boolean;
    procedure DefaultHandler(var Message); override;
    procedure DeleteData(ADirectory : string);

    procedure Download_obclientDll;
    function CanBackupAccounts : Boolean;
    procedure MoveFilesBefore_After_Backup(ABefore: Boolean);
  public
    { Public declarations }
    class function Execute(const ADataAction : TDataAction = daBackup) : Boolean;
    class function BackupData() : Boolean;
  end;

var
  fmDataBackup: TfmDataBackup;
  WM_KingswoodData_BackupUpdateScreen : Dword;

const

   TempDir = 'C:\Kingswood Herd Management\Archive\Temp';
   OldTestDir = 'C:\Kingswood Herd Management\hTest';
   cBackupComplete = 'Backup successfully created with no problems found.';
   cCreatingBackupFile = 'Creating backup file, please wait...';
   cBackupFailed = 'Backup has failed. Please note any errors and contact Kingswood.';
   cNoValidDriveSelected = 'Unable to proceed with backup, no valid drive has been selected.';

   cselectoption = 'Select this option to ';

   cZipExt = '.zip';


   {cZE_OK = 'Successful operation';
   cZE_BUSY = '';}


implementation

uses KRoutines, DairyData, GenTypesConst, Def, uWinOS, uBackupDevice,
     uOnlineBackupHelper, uDownloadValidation, UserMsgConst,
     uDataRestoreConfirm, ChkDebug;

{$R *.DFM}

{ TfmDataBackup }

class function TfmDataBackup.execute(const ADataAction : TDataAction) : Boolean;
begin

   Result := False;
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;

   with TfmDataBackup.create(nil) do
      try
         FDataAction := ADataAction;
         if FDataAction = daBackup then
            DataActionPageControl.ActivePage := tsBackup
         else
            DataActionPageControl.ActivePage := tsRestore;
         ShowModal;
      finally
         Result := FResult;
         Free;
      end;
end;

procedure TfmDataBackup.DataActionPageControlDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if ( ATab.Index = DataActionPageControl.ActivePageIndex) then
      begin
         Font.Size := 11;
         Font.Style := [fsBold];
      end
   else
      begin
         Font.Size := 10;
         Font.Style := [];
      end;
end;

procedure TfmDataBackup.DataActionPageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   if NewPage = tsRestore then
      begin
         if not TfmDataRestoreConfirm.ConfirmRestore then
            begin
               AllowChange := False;
               MessageDlg('Restore has been cancelled.',mtWarning,[mbOK],0);
               Exit;
            end;
      end;

   DataActionPageControl.Tabs.BeginUpdate;
   try
      btnFloppyDiskBackupRestore.Parent := NewPage;
      btnCDBackupRestore.Parent := NewPage;
      btnExternalDeviceBackupRestore.Parent := NewPage;
      btnOnlineBackupRestore.Parent := NewPage;
      lOnlineStorage.Parent := NewPage;
      lExternalStorage.Parent := NewPage;
      lCDStorage.Parent := NewPage;
      lFloppyDiskStorage.Parent := NewPage;
      lOnlineStorageDescription.Parent := NewPage;
      lExternalStorageDescription.Parent := NewPage;
      lCDStorageDescription.Parent := NewPage;
      lFloppyDiskStorageDescription.Parent := NewPage;
      Bevel2.Parent := NewPage;
      Bevel3.Parent := NewPage;
      Bevel4.Parent := NewPage;

      if NewPage = tsBackup then
         begin
            //btnCDBackupRestore.Enabled := (uWinOS.WindowsOS = winXP) and (NewPage=tsBackup);
            //lCDStorage.Enabled := btnCDBackupRestore.Enabled;
            //lCDStorageDescription.Enabled := btnCDBackupRestore.Enabled;
            lLastBackupDate.Caption := 'Last Backup:  '+FormatDate(WinData.LastBackupDate, dsIrish);
            btnFloppyDiskBackupRestore.Kind :=  cxbkDropDownButton;
            lOnlineStorageDescription.Caption := cselectoption +'save the backup files onto a secure Kingswood server. ';{+ cCRLF + 'Note: This requires a current maintenance contract by Standing Order.';}
            lExternalStorageDescription.Caption := cselectoption +'save the backup files onto an external device ( e.g USB Flash Disk/Memory Key)';
            lCDStorageDescription.Caption := cselectoption +'save the backup files onto a CD. Please note: CD Backup only available with Windows XP Home/Professional.';
            lFloppyDiskStorageDescription.Caption := cselectoption +'save the backup files onto a floppy disk';

            lOnlineStorage.Caption := 'Online Backup ';
            lExternalStorage.Caption := 'External Backup ';
            lCDStorage.Caption := 'CD Backup ';
            lFloppyDiskStorage.Caption := 'Floppy Disk Backup ';
         end
      else if NewPage = tsRestore then
         begin
            //btnCDBackupRestore.Enabled := True;
            //lCDStorage.Enabled := btnCDBackupRestore.Enabled;
            //lCDStorageDescription.Enabled := btnCDBackupRestore.Enabled;
            lLastBackupDate.Caption := 'Last Restore:  '+FormatDate(WinData.LastRestoreDate, dsIrish);
            btnFloppyDiskBackupRestore.Kind :=  cxbkStandard;
            lOnlineStorageDescription.Caption := cselectoption +'restore a backup currently stored on the secure Kingswood server.';
            lExternalStorageDescription.Caption := cselectoption +'restore a backup file from an external device.';
            lCDStorageDescription.Caption := cselectoption +'restore a backup file from a CD.';
            lFloppyDiskStorageDescription.Caption := cselectoption +'restore a backup file from a floppy disk.' +cCRLF+
                                                                    'This option is no longer recommended as it can be very difficult to restore data from floppy disks.';

            lOnlineStorage.Caption := 'Online Restore ';
            lExternalStorage.Caption := 'External Restore ';
            lCDStorage.Caption := 'CD Restore ';
            lFloppyDiskStorage.Caption := 'Floppy Disk Restore ';
         end;
      lLastBackupDate.Parent := NewPage;
      LDate.Parent := NewPage;
      LDatabaseName.Parent := NewPage;
   finally
      DataActionPageControl.Tabs.EndUpdate;
      Update;
   end;

end;

procedure TfmDataBackup.miFormatDiskClick(Sender: TObject);
begin
   if CheckFloppyDisk then
      begin
         FormatFloppyDisk;
      end;
end;

procedure TfmDataBackup.btnFloppyDiskBackupRestoreClick(Sender: TObject);
var
   FileName : String;
   UpdateString : string;
begin

   btnFloppyDiskBackupRestore.Enabled := False;
   try
      {
      //   19/01/12 [V5.0 R3.6] /MK Change - If Restore Then No Need To Show Second ConfirmRestore Message.
      if FDataAction = daRestore then
         begin
            if not TfmDataRestoreConfirm.ConfirmRestore then Exit;
         end;
      }
      if CheckFloppyDisk then
         begin
            // Store back to floppy.
            Cursor := crHourGlass;
            Enabled := False;
            FProgressBar.Position := 0;
            FProgressBar.Visible := True;
            try
               if FDataAction = daBackup then
                  begin
                     //   22/06/11 [V4.1 R2.1] /MK Additional Feature - Add Warning To Backup To Floppy Disk.
                     MessageDlg('WARNING: Floppy disks are NOT a reliable method of backing up data.'+#13#10+
                                'If possible, use Online Backup or External Backup',mtWarning,[mbOK],0);

                     if BackupToFloppy then
                        begin
                           MessageDlg('Backup has been taken onto the floppy disk. '+#13#10+#13#10+
                                      'Please click OK to proceed with backup testing',mtInformation,[mbOK],0);

                           Application.ProcessMessages;
                           if TestBackup(Format('A:\%s%s',[DatabaseName, cZipExt])) then
                              begin
                                 FResult := True;
                                 UpdateString := 'Backup testing successfully completed.';
                                 lLastBackupDate.Caption := 'Last Backup Taken:  '+FormatDate(WinData.LastBackUpDate, dsIrish);
                                 Update;
                                 UpdateStatus(UpdateString);
                                 MessageDLG(UpdateString,mtInformation,[mbOK],0);
                                 Update;
                              end
                           else
                              begin
                                 UpdateString := 'ERROR: Backup testing has uncovered a problem';
                                 UpdateStatus(UpdateString);
                                 MessageDLG(UpdateString,mtError,[mbOK],0);
                                 MessageDLG('A FORMAT of the Floppy Disk is advised, please ensure that there are no '+#13+
                                            'bad sectors on disk before proceeding with backup. If the disk format reports '+#13+
                                            'errors a NEW formatted floppy disk should be used for the backup procedure. ',mtWarning,[mbOK],0);

                                 if MessageDlg('Do you want to format disk now?',mtConfirmation,[mbyes,mbNo],0) = idYes then
                                    miFormatDisk.Click;
                                 Update;
                              end;
                        end
                     else
                        begin
                           MessageDLG(cBackupFailed,mtError,[mbOK],0);
                           UpdateStatus(cBackupFailed);
                        end;
                  end
               else if FDataAction = daRestore then
                  begin
//                     if TfmDataRestoreConfirm.ConfirmRestore then
//                        begin
                           FileName := 'A:\'+DatabaseName+cZipExt;
                           RestoreData(FileName);
//                        end;
                  end;
            finally
               Application.ProcessMessages;
               FProgressBar.Visible := False;
               Cursor := crHourGlass;
               Enabled := True;
            end;
         end;
   finally
      btnFloppyDiskBackupRestore.Enabled := True;
   end;
end;

function TfmDataBackup.BackupToCD : Boolean;
var
   RunCmd, DestinationPath : string;
   i : Integer;
begin
   Result := False;
   DestinationPath := TempDir + '\' + DatabaseName + cZipExt;
   Cursor := crHourGlass;
   Enabled := False;
   FProgressBar.Position := 0;
   FProgressBar.Visible := True;
   // if previous temp backup exists delete.
   if FileExists(DestinationPath) then
      DeleteFile(DestinationPath);
   try
      UpdateStatus(cCreatingBackupFile);
      // Zip Data
      if ZipDataExecuteAction( DataDirectory, DestinationPath, TRUE, TRUE ) then
         begin
            Result := True;
            RunCmd := cCDBackupExeName + ' ' + '"' + DestinationPath + '"';
            if CanBackupAccounts then
               begin
                  AccCompanies := TStringList.Create;
                  GetAccsDatabasesInUse(AccCompanies);
                  try
                     if ( AccCompanies.Count > 0 ) then
                        begin
                           for i := 0 to AccCompanies.Count-1 do
                              begin
                                 DestinationPath := TempDir + '\' + AccCompanies.Strings[i] + cZipExt;
                                 // if previous temp backup exists delete.
                                 if FileExists(DestinationPath) then
                                    DeleteFile(DestinationPath);
                                 if ZipDataExecuteAction( WinAccsFolder+AccCompanies.Strings[i], DestinationPath, FALSE, FALSE ) then
                                    begin
                                       RunCmd := RunCmd + ' ' + '"' + DestinationPath + '"'
                                    end
                                 else
                                    begin
                                       Result := False;
                                       Break;
                                    end;

                              end;
                        end;

                  finally
                     FreeAndNil(AccCompanies);
                  end;
               end;
            if Result then
               begin
                  lLastBackupDate.Caption := 'Last Backup Taken:  '+FormatDate(WinData.LastBackUpDate, dsIrish);
                  Update;
                  WinExec(PChar(RunCmd), SW_SHOWNORMAL);
               end;
         end;
   finally
      Application.ProcessMessages;
      FProgressBar.Visible := False;
      Cursor := crHourGlass;
      Enabled := True;
   end;
end;

function TfmDataBackup.BackupToFloppy : Boolean;
begin

   Result := False;

   if FileExists('A:\'+ DatabaseName + cZipExt) then
      begin
         if (messagedlg('A Backup already exists, continuing will replace it,'+#13+
                        'do you wish to continue?.',mtWarning,[mbNo,mbYes],0)=mrNo) then
            SysUtils.Abort
         else
            begin
               Update;
               DeleteFile('A:\'+ DatabaseName + cZipExt);
            end;
      end;

   try
      CloseFile(Def.DefFile);
      DefOpenOK := False;
   except
      ShowMessage('Error occured Closing definition - ReStart Program and try again' +
               #13#13 + 'BACKUP/RESTORE has failed Contact Kingwood');
      exit;
   end;

   if DirectoryExists(OldTestDir) then  { SP 04/10/2002 }
      try
         ZipDataExecuteAction('C:\Kingswood Herd Management\hTest', FArchiveDirectory +'HTest'+cZipExt, FALSE, FALSE);
      except
      end;

   UpdateStatus('Attempting Backup of Data, please wait...');

   ArchiveData;

   Zip.wMultiVolControl := [];

   if (miSpanDisks.Checked) then
      Zip.wMultiVolControl := Zip.wMultiVolControl + [MV_UseMulti];

   if ZipDataExecuteAction(DataDirectory, Format('A:\%s%s',[DatabaseName,cZipExt]), TRUE, TRUE) then
      begin
         Result := True;
         FResult := True;
      end
   else
      begin
         Result := False;
      end;
end;

function TfmDataBackup.BackupToRemovable : Integer;
var
   Drive : string;
   AccCompanies : TStringList;
   i : Integer;
   DestinationPath : string;

   function GetFileName(ABackupFile : string) : String;
   var
      CurrBackupNum : Integer;
      tFileName : string;
   begin
      // close database
      CurrBackupNum := 1;

      tFileName := Drive + ABackupFile + ' ' + FormatDateTime('ddmmyy', Date) + ' '+ '#'+IntToStr(CurrBackupNum)+cZipExt;
      while FileExists(tFileName) do
         begin
            Inc(CurrBackupNum);
            tFileName := Drive + ABackupFile + ' ' + FormatDateTime('ddmmyy', Date) + ' '+ '#'+IntToStr(CurrBackupNum)+cZipExt;
         end;

      Result := tFileName;
   end;


begin
   Result := 1;
   if RemovableDriveCount > 1 then
      begin
         Drive := uBackupDevice.Execute;
         Update;
      end
   else
      Drive := RemovableDrive;

   if (Drive <> '') then
      try
         Cursor := crHourGlass;
         Enabled := False;
         FProgressBar.Position := 0;
         FProgressBar.Visible := True;
         DestinationPath := GetFileName(DatabaseName);

         ArchiveData;
         UpdateStatus(cCreatingBackupFile);
         if ZipDataExecuteAction(DataDirectory, DestinationPath, TRUE, TRUE) then
            begin
               if TestBackup(DestinationPath) then
                  begin
                     Result := 0;
                     if CanBackupAccounts then
                        begin
                           AccCompanies := TStringList.Create;
                           GetAccsDatabasesInUse(AccCompanies);
                           try
                              if ( AccCompanies.Count > 0 ) then
                                 begin
                                    for i := 0 to AccCompanies.Count-1 do
                                       begin
                                          DestinationPath := GetFileName(AccCompanies.Strings[i]);
                                          UpdateStatus(cCreatingBackupFile);
                                          if ZipDataExecuteAction( WinAccsFolder+AccCompanies.Strings[i], DestinationPath, FALSE, FALSE ) then
                                             begin
                                                if not TestBackup(DestinationPath) then
                                                   begin
                                                      Result := 1;
                                                      Break
                                                   end;
                                             end
                                          else
                                             Result := 1;
                                       end;
                                 end;
                           finally
                              FreeAndNil(AccCompanies);
                           end;
                        end;
                  end
               else
                  Result := 1;
            if Result = 0 then
               begin
                  FResult := True;
                  lLastBackupDate.Caption := 'Last Backup Taken:  '+FormatDate(WinData.LastBackUpDate, dsIrish);
                  Update;
               end;
            end;
      finally
         FProgressBar.Visible := False;
         Enabled := True;
         Cursor := crDefault;
      end
   else
      Result := 2;
end;

procedure TfmDataBackup.CloseDatabase;
begin
   try
      WinData.KingData.CloseDataSets; // Close the Dataset
      WinData.KingData.Close;         // Close the Database
   except
      on E : Exception do
         raise Exception.Create('BACKUP/RESTORE Failed: Error occured while disconnecting from database.' + cCRLF +
                                'Restart program and try again. If problem persists contact Kingwood');
   end;
end;

function TfmDataBackup.ArchiveData : Boolean;
var
   ArchiveDestFile : String;
begin
   Result := False;
   UpdateStatus('Archiving Data, please wait...');
   if WinData.UpdatingToEuro then
      ArchiveDestFile := FArchiveDirectory +'EConvert\HerdBackUp'+cZipExt
   else
      begin
         if (FDataAction = daBackup) then
            ArchiveDestFile := FArchiveDirectory + DatabaseName +'\'+DatabaseName+cZipExt
         else if (FDataAction = daRestore) then
            begin
               // create restore point if user mistakenly restores a backup! really...it does happen:)
               ArchiveDestFile := FArchiveDirectory + DatabaseName +'\'+DatabaseName+ ' ' +FormatDateTime('ddmmyy',Date)+cZipExt;
            end;
      end;

   CleanDataFolder(DatabaseName);

   //   20/04/16 [V5.5 R5.0] /MK Change - Move the Sires.db and UKSires.db files into a temporary directory before the zip file is created
   //                                     and then move these files back again. This makes the backup file size smaller.
   if ( not(DirectoryExists(ApplicationPath+'Web')) ) then
      CreateDirectory(ApplicationPath+'Web');

   //MoveFilesBefore_After_Backup(True);
   if ZipDataExecuteAction(DataDirectory, ArchiveDestFile, TRUE, FALSE) then
      Result := True
      // After backup move the sires and uksires table and indexes back to DataDirectory
   else
      MessageDlg('Data Archive failed - contact Kingswood',mtError,[mbOK],0);
   //MoveFilesBefore_After_Backup(False);

   Update;
end;

function TfmDataBackup.ZipDataExecuteAction(SourcePath, DestPath: string; const CloseDB,
  SetBackupDate: Boolean; ZipOp: TZipOperation): Boolean;
begin
   Result := False;
   try
      try
         if ( ZipOp = zoZip ) then
            begin
               if FileExists(DestPath) then
                  DeleteFile(DestPath);

               FillChar( ZipArray, SizeOf(ZipArray), NullTerminator); // Set Array contents to null
               SourcePath := IncludeTrailingBackSlash(SourcePath); // include back slash in source path
               //Zip.lpszExcludeFollowing.SetText(PChar('"Sires.db"'+#13#+'"Sires.px"' + NullTerminator));
               StrPCopy(ZipArray, PChar('"'+ SourcePath +'*.*"' + NullTerminator));
               Zip.lpszZipFile.SetText(PChar('"'+ DestPath + '"' + NullTerminator));
               Zip.lpszItemList.SetText(ZipArray);
               Result := Zip.Execute(ZIP_ADD);
            end
         else
            begin
               FillChar( UnZipArray, SizeOf(UnZipArray), NullTerminator); // Set Array contents to null
               StrPCopy( UnZipArray, DestPath  + NullTerminator);
               Unzip.lpszDestination.SetText(UnZipArray);
               Unzip.lpszZipFile.SetText(PChar(SourcePath + NullTerminator));
               Unzip.lpszFileSpec.SetText('*.*' + NullTerminator);
               Result := Unzip.Execute(UNZIP_EXTRACT);
            end;
      except
         raise Exception.Create('An Error has occured in backup/restore process. Close program and retry.' + cCRLF +
                                cErrorContact);
      end;
   finally
      if ( ZipOp = zoZip ) and ( SetBackupDate ) and ( Result ) then
         WinData.LastBackupDate := Date;
   end;
end;

procedure TfmDataBackup.UpdateStatus(Text: string);
begin
   StatusBar.Panels[0].Text := Text;
   StatusBar.Refresh;
end;

procedure TfmDataBackup.SetupStatusBar;
var
   APanel: TdxStatusBarPanel;
   APanelStyle: TdxStatusBarContainerPanelStyle;
begin
   APanel := StatusBar.Panels[1];
   APanel.PanelStyleClass := TdxStatusBarContainerPanelStyle;
   APanelStyle := TdxStatusBarContainerPanelStyle(APanel.PanelStyle);
   APanelStyle.AlignControl := True;

   FProgressBar := TcxProgressBar.Create(nil);
   FProgressBar.Properties.Max := 100;
   FProgressBar.Parent := APanelStyle.Container;
   FProgressBar.Style.LookAndFeel.NativeStyle := True;
   FProgressBar.Visible := False;
end;

procedure TfmDataBackup.FormCreate(Sender: TObject);
begin
   CloseDatabase;
   DataActionPageControl.ActivePage := nil;
   ExitNow := False;
   SetupStatusBar;
   miSpanDisks.Checked := WinData.GlobalSettings.BackupSpanDisks;
   WinData.SavePreferences;

   DatabaseName := '';
   DataDirectory := '';
   FArchiveDirectory := ApplicationPath + 'Archive\';
//   btnExternalDeviceBackupRestore.Enabled := ( RemovableDriveCount > 0 );

   DataDirectory := WinData.KingData.Directory;
   SetLength(DataDirectory, Length(DataDirectory));

   DatabaseName := ExtractDirFromPath(ExcludeTrailingBackslash(WinData.KingData.Directory));
   SetLength(DatabaseName, Length(DatabaseName));

   LDate.Caption := 'Date:  '+FormatDateTime('d of mmmm yyyy', Date);
   LDatabaseName.Caption := 'Database Name:  '+DatabaseName;

   FResult := False;

end;

procedure TfmDataBackup.ZipMajorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   FProgressBar.Position := Percent;
   Application.ProcessMessages;
end;

procedure TfmDataBackup.UnzipMajorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   FProgressBar.Position := Percent;
   Application.ProcessMessages;
end;

function TfmDataBackup.TestBackup(const AFileName: string): Boolean;

   function DeleteDirectory : Boolean;
   var
     DirInfo: TSearchRec;
     i : SmallInt;
   begin
      Result := True;
      try
         i := FindFirst(TempDir+'\*.*', FaAnyfile, DirInfo);
         while i = 0 do
            begin
               if ((DirInfo.Attr and FaDirectory <> FaDirectory) and
                   (DirInfo.Attr and FaVolumeId <> FaVolumeID)) then
                   DeleteFile(pChar(TempDir+'\'+DirInfo.Name));
              i := FindNext(DirInfo);
            end;
         SysUtils.FindClose(DirInfo);
         RemoveDirectory(TempDir);
      except
         Result := False;
      end;

   end;
begin
   Result := False;
   try
      UpdateStatus(Format('Testing %s file for problems, please wait...',[ExtractFileName(AFileName)]));
      CreateDirectory(TempDir);
      if ZipDataExecuteAction(AFileName, TempDir, FALSE, FALSE, zoUnzip) then
         Result := True;
      RemoveDir(TempDir);
   finally
      DeleteDirectory;
   end;

end;

procedure TfmDataBackup.miSpanDisksClick(Sender: TObject);
begin
   miSpanDisks.Checked := not miSpanDisks.Checked;
end;

procedure TfmDataBackup.FormDestroy(Sender: TObject);
begin
   WinData.GlobalSettings.BackupSpanDisks := miSpanDisks.Checked;

   if (not FAutoBackup) then
      begin
         Screen.cursor := crHourGlass;
         try
            //   17/05/12 [V5.0 R5.7] /MK Bug Fix - Delete And Rebuild Indexes.
            ForceIndicesRemoval(DataDirectory);
            ReIndexAll(True);
            WinData.OpenAndCheckTables;
            WinData.MoveIDsToAFilter;
         finally
            Screen.cursor := crDefault;
         end;
      end;
end;

procedure TfmDataBackup.FormShow(Sender: TObject);
begin
   if not CheckBackupFileName(DatabaseName) then
      begin
         MessageDlg(Format('Unable to continue with backup.'+#13#10+
                           'The current data folder "%s"'+#13#10+
                           'contains illegal characters, contact Kingswood',[DatabaseName]),mtError,[mbOK],0);
         ExitNow := True;
         Abort;
      end;
end;

procedure TfmDataBackup.FormPaint(Sender: TObject);
begin
   // calls close if cancelled
   if ExitNow then blbClose.Click;
end;

procedure TfmDataBackup.btnExternalDeviceBackupRestoreClick(
  Sender: TObject);
var
   Result : Integer;
   StatusString : string;
begin
   btnExternalDeviceBackupRestore.Enabled := False;
   try
      if FDataAction = daBackup then
         begin
            if ( RemovableDriveCount <= 0 ) then
               begin
                  MessageDlg('No removable device has been detected.'+#13#10+
                             'Please insert a removable device such as USB Flash Disk/Memory Key or External Hard Drive.',mtInformation,[mbOK],0);
                  Exit;
               end;

            Result := BackupToRemovable;
            if Result=0 then
               begin
                  FResult := True;
                  UpdateStatus(cBackupComplete);
                  MessageDLG(cBackupComplete,mtInformation,[mbOK],0)
               end
            else if result = 1 then
               begin
                  UpdateStatus(cBackupFailed);
                  MessageDLG(cBackupFailed, mtWarning,[mbOK],0)
               end
            else if result = 2 then
               begin
                  UpdateStatus(cNoValidDriveSelected);
                  MessageDlg(cNoValidDriveSelected,mtWarning,[mbOK],0);
               end;
         end
      else
         begin
            OpenDialog.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
            if OpenDialog.Execute then
               RestoreData(OpenDialog.FileName);
         end;
   finally
      btnExternalDeviceBackupRestore.Enabled := True;
   end;
end;

procedure TfmDataBackup.blbCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfmDataBackup.btnCDBackupRestoreClick(Sender: TObject);
var
   RunCmd, DestinationPath : string;
   AccCompanies : TStringList;
   i : Integer;
begin
   btnCDBackupRestore.Enabled := False;
   try
      if FDataAction = dabackup then
         begin
            if not FileExists(ApplicationPath + cCDBackupExeName) then
               begin
                  MessageDlg('The Kingswood CDBackup program cannot be found, contact Kingswood',mtError,[mbOK],0);
                  Exit;
               end;

            ArchiveData;
            FResult := BackupToCD;

            if not FResult then
               MessageDLG(cBackupFailed,mtError,[mbOK],0);
         end
      else
         begin
            OpenDialog.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
            if OpenDialog.Execute then
               RestoreData(OpenDialog.FileName);
         end;

      {if Result then
         MessageDLG('Backup sent to Windows XP CD Wizard for finalizing.',mtInformation,[mbOK],0)
      else
         MessageDLG(cBackupFailed,mtWarning,[mbOK],0);}
   finally
      btnCDBackupRestore.Enabled := True;
   end;
end;

procedure TfmDataBackup.DataActionPageControlChange(Sender: TObject);
begin
   if DataActionPageControl.ActivePage = tsBackup then
      FDataAction := daBackup
   else
      FDataAction := daRestore;
end;

procedure TfmDataBackup.RestoreData(const AFileName : string);
begin
   Cursor := crHourGlass;
   Enabled := False;
   FProgressBar.Position := 0;
   FProgressBar.Visible := True;
   try
      if not FileExists(AFileName) then
         begin
            UpdateStatus('Unable to restore backup.');
            MessageDlg(Format('Unable to proceed with data restore.'+#13#10+
                              'File : "%s" does not exist',[AFileName]),mtWarning,[mbOK],0);
            Application.ProcessMessages;
         end
      //   04/06/21 [V6.0 R1.3] /MK Bug Fix - Some backup files from the server can come down as 0MB, give error to choose another file.
      else if ( DPGetFileSize(AFileName) = 0 ) then
         begin
            UpdateStatus('Unable to restore backup.');
            MessageDlg(Format('Unable to proceed with data restore.'+#13#10+
                              'File : "%s" has no contents, try another backup file.',[AFileName]),mtWarning,[mbOK],0);
            Application.ProcessMessages;
         end
      else if ( ForceTopMostMessageDlg('This restore will replace all existing data.'+cCRLFx2+'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
         begin
            if ArchiveData then
               begin
                  UpdateStatus('Attempting Restore of Data, please wait...');
                  // Remove all data files, which eliminates conflicts with index files
                  DeleteData(DataDirectory);
                  if ZipDataExecuteAction(AFileName, DataDirectory, TRUE, FALSE, zoUnzip) then
                     begin
                        WinData.LastRestoreDate := Date;
                        lLastBackupDate.Caption := 'Last Restore Date:  '+FormatDate(WinData.LastRestoreDate, dsIrish);
                        Update;
                        UpdateStatus('Backup successfully restored.');
                        MessageDLG(StatusBar.Panels[0].Text,mtInformation,[mbOK],0)
                     end
                  else
                     begin
                        UpdateStatus('Backup restore has failed - contact Kingswood');
                        ForceTopMostMessageDlg('Backup restore has failed - Please note any error messages and contact Kingswood Computing',mtWarning,[mbOK],0);
                     end;
               end
            else
               begin
                  UpdateStatus('Cannot proceed with data restore. Data archive has failed!');
                  ForceTopMostMessageDlg(StatusBar.Panels[0].Text,mtError,[mbOK],0);
               end;
         end
      else
         begin
            UpdateStatus('Restore cancelled.');
            Application.ProcessMessages;
         end;
   finally
      Cursor := crHourGlass;
      Enabled := True;
      FProgressBar.Visible := False;
   end;

end;

procedure TfmDataBackup.btnOnlineBackupRestoreClick(Sender: TObject);
begin
   btnOnlineBackupRestore.Enabled := False;
   try
      if FDataAction = daBackup then
         FResult := BackupToServer
      else
         RestoreFromServer;
   finally
      btnOnlineBackupRestore.Enabled := True;
   end;
end;

function TfmDataBackup.BackupToServer : Boolean;
var
   UploadFile : TUploadFile;
   UserName, FilePath, DestinationPath : string;
   i : Integer;
begin
   Result := False;
   if not FileExists( IncludeTrailingBackslash(ApplicationPath)+cOnlineBackupDLLName) then
      begin
         UpdateStatus('Program file "obclient.dll" has not been found, attempting download.');
         MessageDlg(cOnlineBackupDLLNotFound,mtError,[mbOk],0);
         Update;
         Download_obclientDll;
      end;

   Screen.Cursor := crHourGlass;
   Update;
   try
      if not ArchiveData then
         Exit; // some error has occurred during Archiving, exit BackupToServer.

      // file created during archive
      FilePath := ApplicationPath + 'Archive\'+ DatabaseName +'\'+DatabaseName+cZipExt;

      if (not FAutoBackup) and (not TestBackup(FilePath)) then Exit;

      SetCurrentDir(ApplicationPath);
      DLLHandle := LoadLibrary(cOnlineBackupDLLName);
      if DLLHandle = 0 then
         begin
            UpdateStatus(cOnlineBackupDLLUnableToLoad);
            MessageDlg(cOnlineBackupDLLUnableToLoad,mtError,[mbOk],0);
            Exit;
         end;

      UpdateStatus('Sending backup file(s) to server...');
      try
        UserName := IntToStr(Def.Definition.dSerialNo);

        @UploadFile := GetProcAddress(DLLHandle, cFuncName_UploadFile);
        if @UploadFile <> nil then
           begin
              Result := UploadFile(PChar(UserName),PChar(FilePath));
              if ( Result ) then
                 begin
                    if ( CanBackupAccounts ) then
                       begin
                          AccCompanies := TStringList.Create;
                          GetAccsDatabasesInUse(AccCompanies);
                          try
                             if ( AccCompanies.Count > 0 ) then
                                begin
                                   for i := 0 to AccCompanies.Count-1 do
                                      begin
                                         if Result then
                                            begin
                                               DestinationPath := ApplicationPath + 'Archive\'+ AccCompanies.Strings[i] +'\'+AccCompanies.Strings[i]+cZipExt;
                                               UpdateStatus(cCreatingBackupFile);
                                               //   01/10/14 [V5.3 R7.4] /MK Change - Copy Farmgate.def into backup file for use with reinstall.
                                               if ( not(FileExists(WinAccsFolder+AccCompanies.Strings[i]+'\Farmgate.def')) ) then
                                                  begin
                                                     if FileExists(WinAccsFolder+'\Farmgate.def') then
                                                        CopyFile(PChar(WinAccsFolder+'\Farmgate.def'),PChar(WinAccsFolder+AccCompanies.Strings[i]+'\Farmgate.def'),False);
                                                  end;
                                               if ZipDataExecuteAction( WinAccsFolder+AccCompanies.Strings[i], DestinationPath, FALSE, FALSE ) then
                                                  begin
                                                     if not TestBackup(DestinationPath) then
                                                        Exit
                                                  end;
                                               Result := UploadFile(PChar(UserName), PChar(DestinationPath));
                                            end;
                                      end;
                                end;
                          finally
                             FreeAndNil(AccCompanies);
                          end;
                       end;
                 end;

              Update;
              if Result then
                 begin
                    WinData.LastBackupDate := Date;
                    UpdateStatus('Your backup file(s) has been successfully uploaded to the Kingswood server.');
                    if (not FAutoBackup) then
                       ForceTopMostMessageDlg(StatusBar.Panels[0].Text,mtInformation,[mbOk],0);
                    Close;
                 end
              else
                 begin
                    UpdateStatus(cBackupFailed);
                    ForceTopMostMessageDlg(StatusBar.Panels[0].Text,mtError,[mbOk],0);
                 end;
           end
        else
           begin
              UpdateStatus(Format(cOnlineBackupDLLCallToFunctionFailed,[cFuncName_UploadFile]));
              ForceTopMostMessageDlg(Format(cOnlineBackupDLLCallToFunctionFailed,[cFuncName_UploadFile]),mtError,[mbOk],0);
           end;
      finally
         FreeLibrary(DLLHandle);
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

function TfmDataBackup.RestoreFromServer: Boolean;
var
   RestoreFile : TRestoreFile;
   UserName, DataStore : string;
   PResult : PChar;
   SFile : string;
begin
   if ArchiveData then
      begin
         UpdateStatus('Retrieving files from server...');
         SetCurrentDir(ApplicationPath);
         if FileExists( IncludeTrailingBackslash(ApplicationPath)+cOnlineBackupDLLName) then
            begin
                DLLHandle := LoadLibrary(cOnlineBackupDLLName);
                if DLLHandle <> 0 then
                   begin
                      try
                        UserName := IntToStr(Def.Definition.dSerialNo);
                        DataStore := DatabaseName;
                        @RestoreFile := GetProcAddress(DLLHandle, cFuncName_RestoreFile);
                        if @RestoreFile <> nil then
                           begin
                              ApplicationLog.LogDebugMessage('RestoreFile has data');
                              PResult := RestoreFile(PChar(UserName),PChar(DataStore));
                              if ( PResult <> nil ) then
                                 ApplicationLog.LogDebugMessage('PResult has data');
                              SFile := StrPas(PResult);
                              if ( Length(SFile) > 0 ) then
                                 ApplicationLog.LogDebugMessage('SFile has data');
                              Update;
                              if FileExists(SFile) then
                                 begin
                                    RestoreData(SFile);
                                 end
                              else if (SFile = '') then
                                 begin
                                    UpdateStatus('Restore has been cancelled.');
                                    ForceTopMostMessageDlg(StatusBar.Panels[0].Text,mtError,[mbOk],0);
                                 end
                              else if (SFile <> '') then
                                 begin
                                    UpdateStatus('Restore has failed!');
                                    ForceTopMostMessageDlg(StatusBar.Panels[0].Text,mtError,[mbOk],0);
                                 end;
                           end
                        else
                           MessageDlg(Format(cOnlineBackupDLLCallToFunctionFailed,[cFuncName_UploadFile]),mtError,[mbOk],0);
                      finally
                         FreeLibrary(DLLHandle);
                      end;
                   end
                else
                   begin
                      UpdateStatus(cOnlineBackupDLLUnableToLoad);
                      MessageDlg(cOnlineBackupDLLUnableToLoad,mtError,[mbOk],0);
                   end;
             end
         else
            begin
               MessageDlg(cOnlineBackupDLLNotFound,mtError,[mbOk],0);
               Download_obclientDll;
             end;
      end;
end;

procedure TfmDataBackup.DefaultHandler(var Message);
begin
  with TMessage(Message) do
  begin
    if (Msg = WM_KingswoodData_BackupUpdateScreen) then
       begin
          Update;
       end
    else
       inherited DefaultHandler(Message);
  end;
end;

procedure TfmDataBackup.DeleteData(ADirectory: string);

var
   i : Integer;
   SearchRec : TSearchRec;
   ScanDir : String;
begin
   ScanDir := IncludeTrailingBackslash(ADirectory);

   if Pos('Kingswood Herd Management', ADirectory) > -1 then // make sure it is a Kingswood Herd Management SubDirectory
      begin
         i := FindFirst( ScanDir + '*.*' , faAnyFile , SearchRec ) ;
         if i = 0 then
           begin
              if ( SearchRec.Name <> '.' ) and ( SearchRec.Name <> '..' ) then
                 begin
                    SysUtils.DeleteFile(ScanDir + SearchRec.Name);
                 end;

              while FindNext( SearchRec ) = 0 do
                 if ( SearchRec.Name <> '.' ) and ( SearchRec.Name <> '..' ) then
                    begin
                       SysUtils.DeleteFile(ScanDir + SearchRec.Name);
                    end;
              SysUtils.FindClose(SearchRec) ;
           end;
      end;
end;

procedure TfmDataBackup.Download_obclientDll;
begin
   if IsNetConnected then
      begin
         Screen.Cursor := crHourGlass;
         Update;
         try
            GetSerNo.Process(False, False);
            if AllowDownload then
               begin
                  Application.ProcessMessages;
                  FProgressBar.Position := 0;
                  FProgressBar.Visible := True;
                  GetOBClient.Process(False, True);
               end;
         finally
            Screen.Cursor := crDefault;
            Update;
         end;
      end
   else
      MessageDlg(cINTERNET_CONNECTION_NOT_ESTABLISHED,mtError,[mbOK],0);
end;

procedure TfmDataBackup.GetSerNoProcessed(Sender: TObject);
var
   FileName : string;
begin
   FileName := IncludeTrailingBackslash(GetSerNo.DownloadDir) + GetSerNo.DestinationName;
   AllowDownload := OkToDownload(FileName, Def.Definition.dSerialNo);
   if not AllowDownload then
      MessageDlg(cSupportExpired,mtError,[mbOK],0);
end;

procedure TfmDataBackup.GetOBClientProgress(Sender: TLMDWebHTTPGet;
  Item: TLMDDownloadItem);
begin
  FProgressBar.Position := Item.Progress;
  if FProgressBar.Position >= 100 then
     begin
        FProgressBar.Visible := False;
        FProgressBar.Position := 0;
     end;
  Update;
end;

procedure TfmDataBackup.GetOBClientProcessed(Sender: TObject);
var
   MsgText, FileName : string;
begin
   FileName := IncludeTrailingBackslash(GetOBClient.DownloadDir) + GetOBClient.DestinationName;
   if FileExists(FileName) then
      begin
         MsgText := 'File was successfully downloaded and installed.';
         MessageDlg(MsgText,mtInformation,[mbOK],0);
         BackupToServer;
      end
   else
      begin
         MsgText := 'File download has failed.';
         MessageDlg(MsgText,mtError,[mbOK],0);
      end;
   UpdateStatus(MsgText);
end;

function TfmDataBackup.CanBackupAccounts: Boolean;
begin
   Result := Definition.dUseKingsAccs;
   if Result then
      Result := ( not(WinData.IsBlacklistedIP) );
   if ( Result ) then
      begin
         Update;
         Result := not FAutoBackup;
         if ( not(Result) ) then
            Result := Def.Definition.dSerialNo = 10001;
      end;
end;

procedure TfmDataBackup.FormActivate(Sender: TObject);
begin
   //   28/09/15 [V5.4 R9.1] /MK Additional Feature - Disable Restore if FarmSync is set up - SP/GL request.
   tsRestore.Enabled := ( not(TfmFarmSyncSettings.SyncConfigured(DataDir, WinData.GetSyncingHerd(), stHerd)) );
end;

procedure TfmDataBackup.MoveFilesBefore_After_Backup(ABefore : Boolean);
var
   slTXTFileList,
   slXMLFileList,
   slFileList : TStringList;
   i : Integer;
   BackupDir : String;
begin
   BackupDir := '';
   BackupDir := ApplicationPath+'Web\TempBackup';
   if ( not(DirectoryExists(BackupDir)) ) then
      CreateDirectory(BackupDir);

   slTXTFileList := TStringList.Create();
   slXMLFileList := TStringList.Create();
   slFileList := TStringList.Create();
   try
      GetDirectoryFiles(WinData.KingData.Directory, slXMLFileList, '*.xml');
      GetDirectoryFiles(WinData.KingData.Directory, slTXTFileList, '*.txt');
      for i := 0 to slXMLFileList.Count-1 do
         slFileList.Add(slXMLFileList.Strings[i]);
      for i := 0 to slTXTFileList.Count-1 do
         slFileList.Add(slTXTFileList.Strings[i]);
      slFileList.Add('Sires.db');
      slFileList.Add('Sires.px');
      slFileList.Add('UKSires.db');
      for i := 0 to slFileList.Count-1 do
         begin
            if ABefore then
               CopyFile(PChar(IncludeTrailingBackslash(WinData.KingData.Directory)+slFileList.Strings[i]),PChar(IncludeTrailingBackslash(BackupDir)+slFileList.Strings[i]),False)
            else
               CopyFile(PChar(IncludeTrailingBackslash(BackupDir)+slFileList.Strings[i]),PChar(IncludeTrailingBackslash(WinData.KingData.Directory)+slFileList.Strings[i]),False);
         end;
   finally
      FreeAndNil(slTXTFileList);
      FreeAndNil(slXMLFileList);
      FreeAndNil(slFileList);
   end;
end;

class function TfmDataBackup.BackupData: Boolean;
var
  IPAdddress : string;
begin
   Result := False;
   if ( WinData.IsBlacklistedIP ) or ( WinData.AdvisoryRoleActive ) or ( not(IsNetConnected) ) then Exit;

   with TfmDataBackup.create(nil) do
      try
         FDataAction := daBackup;
         FAutoBackup := True;
         Result := BackupToServer();
      finally
         Free;
      end;
end;

initialization
  WM_KingswoodData_BackupUpdateScreen := RegisterWindowMessage('WM_KingswoodDataBackupUpdateScreen');

end.
