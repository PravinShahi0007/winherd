{
   13/09/12 [V5.0 R9.9] /MK Change - Get twins if event code shows two calf sex with space in the middle.
                                   - Get event date by parse.
   08/03/13 [V5.1 R5.1] /MK Bug Fix - Not working for multiple herds in the same database.

   04/04/13 [V5.1 R6.1] /MK Change - Allow update of PregDiag event if event already exists in current lactation.
                                   - Create PregDiag event for all EventGroups from DanRyan.

   18/03/14 [V5.2 R9.0] /MK Additional Feature - Added the capability of downloading mail attachments through Gmail.

   21/03/14 [V5.2 R9.0] /MK Additional Feature - Forgot to mark the Gmail attachment as read if file is saved.

   27/04/15 [V5.4 R4.0] /MK Change - DecipherEventCode - Allow for mistake by Dan Ryan recorder where animal is recorded twice with PD
                                                         First instance can have 0 days and the second instance has the correct amount of days - GL/D.Frawley.
                                                       - If FDaysInCalf = 0 then get DaysInCalf from last saved PD event - GL/D.Frawley.
                                                       - If no last saved PD event then get DaysInCalf from the difference between the new PDEvent and the last service date - GL/D.Frawley.

   30/10/15 [V5.4 R9.8] /MK Change - SavePregDiagEvent - Changes made to now update the EventType of the existing PregDiag events to a new EventType and then create a new PregDiag event.

   06/11/15 [V5.5 R0.3] /MK Change - Created a new type for Billy Curtin who supplied Jim Garry with a file.
                                   - This file only contains the PD events for the cows, no fertility or to be culled events.
                                   - The file structure is totally different to the Dan Ryan format.

   18/04/17 [V5.6 R6.9] /MK Change - Use uppercase of EventGroup to determine whether the event is Pregnant, Fit, Not Fit etc - Eddie Jordan/Lyons Research request.
                                   - Use same search for animal as Billy Curtin system i.e. search by AnimalNo first and then LocateNatID.
                                   - Only show events for animals that have been found when moving through tabs.
                                   - If not classification information then for PD events use Days In Calf for comment.

   28/08/17 [V5.7 R2.1] /MK Bug Fix - GetAnimalID - This search was only working for tag numbers not animal numbers.
                            Additional Feature - Added uProgressIndicator to show progress of reading the file and saving the events.

   16/12/20 [V5.9 R7.9] /MK Change - FilterGridTable - Default the ActivePageIndex to Pregnant as this event should always exist.

   05/07/21 [V6.0 R1.6] /MK Change - Added a check for the recheck code, RCK, in the event code field - Tom Craig.

   18/08/21 [V6.0 R1.9] /MK Additional Feature - Added a new page for Log - James O'Connor/Milo Murphy.
                                               - If the animal can't be found by animal number or tag number then add this to the log.
                                               - If the event type is unknown i.e. Cows365 added a new one and didn't tell us, add this with the animal identifier to the log.
                                               - If the event type is blank then add this with the animal ident to the log.

   19/08/21 [V6.0 R2.0] /MK Additional Feature - Added pages and import of 3 new event types, "Cycling", "RescanAdvised", and "DNB or DoNotBreed" - James O'Connor/Milo Murphy/Kevin Maguire.
}

unit uDanRyanImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  ExtCtrls, cxPC, db, dbTables, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  GenTypesConst, EventRecording, KRoutines, uSPParser, DairyData,
  uHerdLookup, uFileAttachmentImport, DateUtil, Menus, uApplicationLog,
  uProgressIndicator, cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TFileType = (ftDanRyan, ftBillyCurtin);
  TfmDanRyanImport = class(TfmBaseForm)
    lbOpenFile: TdxBarLargeButton;
    OpenDialog: TOpenDialog;
    Parser: TSPParser;
    pcEvents: TcxPageControl;
    tsFit: TcxTabSheet;
    tsFreshTime: TcxTabSheet;
    tsAttention: TcxTabSheet;
    tsServed: TcxTabSheet;
    tsPregnant: TcxTabSheet;
    tsUnfit: TcxTabSheet;
    EventGrid: TcxGrid;
    EventGridDBTableView: TcxGridDBTableView;
    EventGridLevel: TcxGridLevel;
    EventGridDBTableViewAnimalNo: TcxGridDBColumn;
    EventGridDBTableViewNatIDNum: TcxGridDBColumn;
    EventGridDBTableViewCode: TcxGridDBColumn;
    EventGridDBTableViewEventDesc: TcxGridDBColumn;
    lbSave: TdxBarLargeButton;
    actSaveEvents: TAction;
    EventGridDBTableViewEventDate: TcxGridDBColumn;
    blbOptions: TdxBarLargeButton;
    pmOptions: TPopupMenu;
    miBillyCurtinFormat: TMenuItem;
    actEnableBillyCurtinFormat: TAction;
    tsLog: TcxTabSheet;
    cxmLog: TcxMemo;
    tsCycling: TcxTabSheet;
    tsRescanAdvised: TcxTabSheet;
    cxDNB: TcxTabSheet;
    procedure lbOpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pcEventsChange(Sender: TObject);
    procedure actSaveEventsExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actEnableBillyCurtinFormatExecute(Sender: TObject);
    procedure blbOptionsClick(Sender: TObject);
  private
    dsEventTable : TDataSource;
    FEventTable,
    FAnimalTable,
    FSaveEvents : TTable;
    FSLEventFile : TStringList;
    FTotalEventsSaved,
    FDaysInCalf : Integer;
    FCalfType : String;
    FRecheck : Boolean;
    FFileName : String;
    FFileType : TFileType;
    procedure CreateTempTables;
    procedure ReadFile;
    procedure FilterGridTable;
    procedure DecipherEventCode(AEventCode: String);
    procedure AddToLog(AAnimalNo, ANatIdNum, AMessage : String);
    function SaveFertilityCheckEvent(AFertEventGroup: Integer) : Boolean;
    function SavePregDiagEvent(APregnant : Boolean) : Boolean;
    function SaveToBeCulledEvent : Boolean;
    function GetAnimalID(AAnimalNo, ANatIDNum : String) : Integer;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowForm  ( const AFileName : String = '' );
  end;

var
  fmDanRyanImport: TfmDanRyanImport;

const
  tmpFileName = 'tmpDanRyanFile.txt';
  egFit = 1;
  egFreshTime = 2;
  egAttention = 3;
  egServed = 4;
  egPregnant = 5;
  egUnfit = 6;
  egCycling = 7;
  egRescanAdvised = 8;
  egDoNotBreed = 9;
  csFit = 'FIT';
  csFreshTime = 'FRESH/TIME';
  csAttention = 'ATTENTION';
  csServed = 'SERVED';
  csPregnant = 'PREGNANT';
  csUnfit = 'UNFIT';
  csCycling = 'CYCLING';
  csRescanAdvised = 'RESCAN ADVISED';
  csDoNotBreed = 'DNB';

implementation

{$R *.DFM}

class procedure TfmDanRyanImport.ShowForm ( const AFileName : String = '' );
begin
   with TfmDanRyanImport.Create(nil) do
      try
        FFileType := ftDanRyan;
        FFileName := AFileName;
        ShowModal;
      finally
         Free;
      end;
end;

procedure TfmDanRyanImport.FormCreate(Sender: TObject);
begin
   CreateTempTables;

   FSLEventFile := TStringList.Create;
   OpenDialog.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);

   EventGrid.Parent := tsFit;
   EventGrid.Align := alClient;

   pcEvents.ActivePage := tsFit;

   lbSave.Enabled := False;
end;

procedure TfmDanRyanImport.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
   ReadFile;
   FilterGridTable;
   //   16/12/20 [V5.9 R7.9] /MK Change - Default the ActivePageIndex to Pregnant as this event should always exist.
   pcEvents.ActivePageIndex := tsPregnant.PageIndex;
end;

procedure TfmDanRyanImport.CreateTempTables;
var
   sNatID : String;
   qAnimals : TQuery;
begin
   FEventTable := TTable.Create(nil);
   with FEventTable do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpImportFertEvents';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('AnimalID',ftInteger);
         FieldDefs.Add('AnimalNo',ftString,10);
         FieldDefs.Add('NatIDNum',ftString,20);
         FieldDefs.Add('AnimalLactNo',ftInteger);
         FieldDefs.Add('EventDate',ftDate);
         FieldDefs.Add('EventGroup',ftInteger);
         FieldDefs.Add('EventCode',ftString,20);
         FieldDefs.Add('EventDesc',ftString,50);
         FieldDefs.Add('Pregnant',ftBoolean);
         FieldDefs.Add('DaysInCalf',ftInteger);
         FieldDefs.Add('NoCalves',ftInteger);
         CreateTable;
         Open;
      end;

   FAnimalTable := TTable.Create(nil);
   with FAnimalTable do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpImportFertAnimals';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('AnimalID',ftInteger);
         FieldDefs.Add('AnimalNo',ftString,10);
         FieldDefs.Add('NatIDNum',ftString,20);
         FieldDefs.Add('SearchNatID',ftString,20);
         FieldDefs.Add('LactNo',ftInteger);
         CreateTable;
      end;

   FSaveEvents := TTable.Create(nil);
   with FSaveEvents do
      begin
         DatabaseName := AliasName;
         TableName := 'Events';
         Open;
      end;

   qAnimals := TQuery.Create(nil);
   with qAnimals do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('INSERT INTO '+FAnimalTable.TableName+' (AnimalID, AnimalNo, NatIDNum, SearchNatID, LactNo)');
         SQL.Add('SELECT ID, AnimalNo, NatIDNum, SearchNatID, LactNo');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE (InHerd = True)');
         SQL.Add('AND   (AnimalDeleted = False)');
         SQL.Add('AND   (HerdId = '+IntToStr(WinData.UserDefaultHerdID)+')');
         ExecSQL;

         FAnimalTable.Close;
         FAnimalTable.Open;

         FAnimalTable.First;
         while not(FAnimalTable.Eof) do
            try
               FAnimalTable.Edit;
               sNatID := StripAllNomNumAlpha(FAnimalTable.FieldByName('NatIDNum').AsString);
               FAnimalTable.FieldByName('NatIDNum').AsString := Copy(sNatID,3,Length(sNatID));
               FAnimalTable.Post;
               FAnimalTable.Next;
            except
               on E : Exception do
                  ShowMessage(E.Message);
            end;

      finally
         Free;
      end;

   dsEventTable := TDataSource.Create(nil);
   dsEventTable.DataSet := FEventTable;
end;

procedure TfmDanRyanImport.lbOpenFileClick(Sender: TObject);
begin
   FFileName := '';
   ReadFile;
   FilterGridTable;
end;

procedure TfmDanRyanImport.ReadFile;
var
   sFileName,
   sLine,
   sNatIDNum,
   sDaysInCalf,
   sEventGroup : String;
   i, StartLine,
   iAnimalID : Integer;
   dEventDate : TDateTime;

   function GetEventDate (AParsedField : string ) : TDateTime;
   var
      TempString : String;
      AParser : TSPParser;
   begin
      AParser := TSPParser.Create(nil);
      AParser.Sepchar := ' ';
      AParser.CharSearch := True;
      try
         AParser.Parse(AParsedField);
         TempString := AParser.Fields[1];
         Result := StrToDate(TempString);
      finally
         FreeAndNil(AParser);
      end;
   end;

begin
   // 16/06/2017 SP
   try
      Screen.Cursor := crHourglass;

      cxmLog.Lines.Clear;

      if not(FileExists(FFileName)) then
         begin
            if OpenDialog.Execute then
               FFileName := OpenDialog.FileName
            else
               begin
                  Close;
                  Exit;
               end;
         end;

      if ( not(FileExists(FFileName)) ) then Exit;

      FSLEventFile.LoadFromFile(FFileName);
      if ( FSLEventFile.Count = 0 ) then
         begin
            MessageDlg('No records on the file.',mtError,[mbOK],0);
            Exit;
         end;

      FEventTable.Close;
      FEventTable.EmptyTable;
      FEventTable.Open;

      if ( FFileType = ftDanRyan ) then
         begin
            for i := 0 to FSLEventFile.Count-1 do
               begin
                  sLine := FSLEventFile.Strings[i];
                  Parser.Parse(sLine);
                  if ( UpperCase(Copy(sLine,0,12)) = 'DATE OF SCAN' ) then
                     begin
                        dEventDate := GetEventDate(Parser.Fields[2]);
                     end;
                  if ( UpperCase(Copy(sLine,0,6)) = 'COW ID' ) then
                     begin
                        StartLine := i+1;
                        Break;
                     end;
               end;
         end
      else
         StartLine := 1;

      ShowProgressIndicator('Importing File',0,FSLEventFile.Count,1);
      ProgressIndicator.Max := FSLEventFile.Count;
      Application.ProcessMessages;
      Update;
      for i := StartLine to FSLEventFile.Count-1 do
         begin
            sLine := FSLEventFile.Strings[i];
            sEventGroup := '';
            if Length(sLine) > 0 then
               begin
                  Parser.Parse(sLine);
                  if ( Parser.Count > 5 ) then
                     ApplicationLog.LogError('Dan Ryan Parser Line Length is not the expected 5');
                  FEventTable.Append;
                  if ( FFileType = ftDanRyan ) then
                     begin
                        FEventTable.FieldByName('AnimalNo').AsString := StripAllSpaces(Parser.Fields[1]);
                        sNatIDNum := StripAllNomNumAlpha(Parser.Fields[2]);
                        FEventTable.FieldByName('NatIDNum').AsString := Copy(sNatIDNum,3,Length(sNatIDNum));
                        FEventTable.FieldByName('EventCode').AsString := Parser.Fields[3];
                        FEventTable.FieldByName('EventDesc').AsString := RemoveQuotationMarks(Parser.Fields[4]);

                        sEventGroup := UpperCase(Parser.Fields[5]);
                        if ( sEventGroup = csFit ) then
                           FEventTable.FieldByName('EventGroup').AsInteger := egFit
                        else if ( sEventGroup = csFreshTime ) then
                           FEventTable.FieldByName('EventGroup').AsInteger := egFreshTime
                        else if ( sEventGroup = csAttention ) then
                           FEventTable.FieldByName('EventGroup').AsInteger := egAttention
                        else if ( sEventGroup = csServed ) then
                           FEventTable.FieldByName('EventGroup').AsInteger := egServed
                        else if ( sEventGroup = csPregnant ) then
                           FEventTable.FieldByName('EventGroup').AsInteger := egPregnant
                        else if ( sEventGroup = csUnfit ) then
                           FEventTable.FieldByName('EventGroup').AsInteger := egUnfit
                        else if ( sEventGroup = csCycling ) then
                           FEventTable.FieldByName('EventGroup').AsInteger := egCycling
                        else if ( sEventGroup = csRescanAdvised ) then
                           FEventTable.FieldByName('EventGroup').AsInteger := egRescanAdvised
                        else if ( sEventGroup = csDoNotBreed ) then
                           begin
                              FEventTable.FieldByName('EventGroup').AsInteger := egDoNotBreed;
                              AddToLog(FEventTable.FieldByName('AnimalNo').AsString,
                                       FEventTable.FieldByName('NatIDNum').AsString,
                                       'Animal marked as not for breeding.');
                           end
                        else
                           AddToLog(FEventTable.FieldByName('AnimalNo').AsString,
                                    FEventTable.FieldByName('NatIDNum').AsString,
                                    'Unknown event type '+sEventGroup+', cannot save this event.');

                        FEventTable.FieldByName('EventDate').AsDateTime := dEventDate;
                     end
                  else
                     begin
                        sNatIDNum := StripAllAlphaButNum(Parser.Fields[3]);
                        FEventTable.FieldByName('AnimalNo').AsString := '';
                        FEventTable.FieldByName('NatIDNum').AsString := '';
                        FEventTable.FieldByName('EventGroup').AsInteger := egPregnant;
                        if ( Length(sNatIDNum) > 0 ) then
                           FEventTable.FieldByName('NatIDNum').AsString := sNatIDNum;
                        if ( Length(sNatIDNum) < 10 ) then
                           FEventTable.FieldByName('AnimalNo').AsString := sNatIDNum;
                        FEventTable.FieldByName('EventDate').AsDateTime := StrToDate(Parser.Fields[8]);
                        FEventTable.FieldByName('Pregnant').AsBoolean := False;
                        FEventTable.FieldByName('NoCalves').AsInteger := 0;
                        if ( Length(Parser.Fields[10]) = 1 ) then
                           begin
                              FEventTable.FieldByName('Pregnant').AsBoolean := ( StrToInt(Parser.Fields[10]) > 0 );
                              FEventTable.FieldByName('NoCalves').AsInteger := StrToInt(Parser.Fields[10]);
                           end;
                        FEventTable.FieldByName('DaysInCalf').AsInteger := 0;
                        sDaysInCalf := Parser.Fields[11];
                        if ( Length(sDaysInCalf) > 0 ) then
                           if ( sDaysInCalf[1] in ['0'..'9'] ) then
                              FEventTable.FieldByName('DaysInCalf').AsInteger := StrToInt(Parser.Fields[11]);
                     end;
                  FEventTable.Post;
               end;

            ProgressIndicator.Position := ProgressIndicator.Position + 1;
            Application.ProcessMessages;
            Update;
         end;
      ProgressIndicator.Close;
      Application.ProcessMessages;
      Update;

      ShowProgressIndicator('Locating Animals',0,FSLEventFile.Count,1);
      ProgressIndicator.Max := FSLEventFile.Count;
      Application.ProcessMessages;
      Update;

      FEventTable.Filter := '';
      FEventTable.Filtered := False;
      FEventTable.Close;
      FEventTable.Open;
      FEventTable.First;
      for i := 1 to FEventTable.RecordCount do
         begin
            FEventTable.RecNo := i;
            FEventTable.Edit;
            iAnimalID := GetAnimalID(FEventTable.FieldByName('AnimalNo').AsString,
                                     FEventTable.FieldByName('NatIDNum').AsString);
            if ( iAnimalID > 0 ) then
               begin
                  if ( FAnimalTable.Locate('AnimalID',iAnimalID,[]) ) then
                     begin
                        FEventTable.FieldByName('AnimalID').AsInteger := FAnimalTable.FieldByName('AnimalID').AsInteger;
                        FEventTable.FieldByName('AnimalLactNo').AsInteger := FAnimalTable.FieldByName('LactNo').AsInteger;
                     end;
                  FEventTable.Post;
               end
            else
               AddToLog(FEventTable.FieldByName('AnimalNo').AsString,
                        FEventTable.FieldByName('NatIDNum').AsString,
                        'not found in the current herd');

            ProgressIndicator.Position := ProgressIndicator.Position + 1;
            Application.ProcessMessages;
            Update;
         end;
      ProgressIndicator.Close;
      Application.ProcessMessages;
      Update;

      FTotalEventsSaved := FEventTable.RecordCount;

      lbSave.Enabled := True;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmDanRyanImport.actSaveEventsExecute(Sender: TObject);
var
   iEventsSaved : Integer;
begin
   inherited;
   try
      FEventTable.Filtered := False;
      FEventTable.Filter := '';

      FEventTable.Close;
      FEventTable.Open;

      if ( FEventTable.RecordCount = 0 ) then
         begin
            MessageDlg('No events to save.',mtError,[mbOK],0);
            Exit;
         end;

      Screen.Cursor := crHourGlass;

      iEventsSaved := 0;

      HerdLookup.QueryFertilityCheckStatus.Close;
      HerdLookup.QueryFertilityCheckStatus.Open;

      ShowProgressIndicator('Saving Events',0,FEventTable.RecordCount,1);
      ProgressIndicator.Max := FEventTable.RecordCount;
      Application.ProcessMessages;
      Update;

      FEventTable.First;
      while ( not(FEventTable.Eof) ) do
         begin
            if ( FEventTable.FieldByName('AnimalID').AsInteger > 0 ) then
               if ( FFileType = ftDanRyan ) then
                  begin
                     case FEventTable.FieldByName('EventGroup').AsInteger of
                         egFit,
                         egFreshTime,
                         egServed,
                         egAttention,
                         egCycling,
                         egRescanAdvised : begin
                                              if ( SaveFertilityCheckEvent(FEventTable.FieldByName('EventGroup').AsInteger) ) and
                                                 ( SavePregDiagEvent(False) ) then
                                                 Inc(iEventsSaved);
                                           end;
                         egPregnant  : begin
                                          if ( SavePregDiagEvent(True) ) then
                                             Inc(iEventsSaved);
                                       end;
                         egUnfit : begin
                                      if ( SaveToBeCulledEvent ) and ( SavePregDiagEvent(False) ) then
                                         Inc(iEventsSaved);
                                   end;
                     end;
                  end
               else
                  begin
                     if ( FEventTable.FieldByName('Pregnant').AsBoolean ) then
                        SavePregDiagEvent(True)
                     else
                        SavePregDiagEvent(False);
                  end;
            ProgressIndicator.Position := ProgressIndicator.Position + 1;
            Application.ProcessMessages;
            Update;
            FEventTable.Next;
         end;
   finally
      ProgressIndicator.Close;
      Application.ProcessMessages;
      Update;
      Screen.Cursor := crDefault;
   end;

   FEventTable.Close;
   FEventTable.EmptyTable;
   FEventTable.Open;
   if ( FFileType = ftDanRyan ) then
      begin
         if ( iEventsSaved = 0 ) then
            MessageDlg(Format('%d fertility events saved.'+cCRLF+
                              '%d fertility events not recorded.',[iEventsSaved,FTotalEventsSaved]),mtConfirmation,[mbOK],0)
         else if ( iEventsSaved < FTotalEventsSaved ) then
            MessageDlg(Format('%d fertility events saved.'+cCRLF+
                              '%d fertility events not recorded.',[iEventsSaved,FTotalEventsSaved-iEventsSaved]),mtConfirmation,[mbOK],0)
         else if ( iEventsSaved = FTotalEventsSaved ) then
            MessageDlg(Format('%d fertility events saved',[iEventsSaved]),mtConfirmation,[mbOK],0);

         if ( cxmLog.Lines.Count > 0 ) then
            pcEvents.ActivePageIndex := tsLog.PageIndex;
      end
   else
      MessageDlg(Format('%d pregnancy diagnosis events saved.',[FTotalEventsSaved]),mtConfirmation,[mbOK],0);

   TfmFileAttachmentImport.MarkAttachmentAsRead(FFileName);

   lbSave.Enabled := False;
end;

procedure TfmDanRyanImport.pcEventsChange(Sender: TObject);
begin
   inherited;
   FilterGridTable;
end;

procedure TfmDanRyanImport.FilterGridTable;
begin
   StatusBar.Panels[0].Text := '';

   if ( pcEvents.ActivePageIndex = tsLog.PageIndex ) then Exit;

   EventGrid.Parent := pcEvents.ActivePage;

   EventGridDBTableView.DataController.DataSource := nil;
   FEventTable.Filtered := False;
   FEventTable.Filter := '';

   if pcEvents.ActivePage <> nil then
      begin
         if pcEvents.ActivePage = tsFit then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egFit)+' ';
            end
         else if pcEvents.ActivePage = tsFreshTime then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egFreshTime)+' ';
            end
         else if pcEvents.ActivePage = tsAttention then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egAttention)+' ';
            end
         else if pcEvents.ActivePage = tsServed then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egServed)+' ';
            end
         else if pcEvents.ActivePage = tsPregnant then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egPregnant)+' ';
            end
         else if pcEvents.ActivePage = tsUnfit then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egUnfit)+' ';
            end
         else if pcEvents.ActivePage = tsCycling then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egCycling)+' ';
            end
         else if pcEvents.ActivePage = tsRescanAdvised then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egRescanAdvised)+' ';
            end
         else if pcEvents.ActivePage = cxDNB then
            begin
               FEventTable.Filtered := True;
               FEventTable.Filter := 'EventGroup = '+IntToStr(egDoNotBreed)+' ';
            end;

         if ( Length(FEventTable.Filter) > 0 ) and ( FEventTable.Filtered ) then
            FEventTable.Filter := FEventTable.Filter + ' AND AnimalID > 0';

         if ( FEventTable.RecordCount > 0 ) then
            StatusBar.Panels[0].Text := 'Total Events:'+IntToStr(FEventTable.RecordCount)
      end;
   EventGridDBTableView.DataController.DataSource := dsEventTable;
end;

function TfmDanRyanImport.SavePregDiagEvent(APregnant: Boolean) : Boolean;
var
   PregDiagEvent : TPregDiagEvent;
   iNoCalves : Integer;

   procedure CreatPregDiagEvent;
   begin
      try
         PregDiagEvent := TPregDiagEvent.Create('PREG');
         PregDiagEvent.Append;
         try
            PregDiagEvent.EventType := TPregDiag;
            PregDiagEvent.AnimalID := FEventTable.FieldByName('AnimalID').AsInteger;
            PregDiagEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
            PregDiagEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
            PregDiagEvent.AnimalHerdID := WinData.UserDefaultHerdID;
            PregDiagEvent.PregnancyStatus := APregnant;
            if ( FFileType = ftDanRyan ) then
               begin
                  PregDiagEvent.NoCalves := iNoCalves;
                  if ( FDaysInCalf > 0 )  then
                     PregDiagEvent.DaysInCalf := FDaysInCalf;
                  if ( FCalfType <> '' ) then
                     PregDiagEvent.CalfType := FCalfType;
                  if ( Length(FEventTable.FieldByName('EventDesc').AsString) > 0 ) then
                     PregDiagEvent.EventComment := Copy(FEventTable.FieldByName('EventDesc').AsString,0,30)
                  else
                     begin
                        if ( FDaysInCalf > 0 ) then
                           PregDiagEvent.EventComment := 'Pregnant/'+IntToStr(FDaysInCalf)
                        else if ( FDaysInCalf <= 0 ) then
                           PregDiagEvent.EventComment := 'Not Pregnant';
                     end;
                  PregDiagEvent.IsRecheck := FRecheck;
               end
            else
               begin
                  PregDiagEvent.NoCalves := FEventTable.FieldByName('NoCalves').AsInteger;
                  PregDiagEvent.DaysInCalf := FEventTable.FieldByName('DaysInCalf').AsInteger;
                  if ( FEventTable.FieldByName('DaysInCalf').AsInteger > 0 ) then
                     PregDiagEvent.EventComment := 'Pregnant ' + IntToStr(FEventTable.FieldByName('DaysInCalf').AsInteger)
                  else if ( FEventTable.FieldByName('DaysInCalf').AsInteger <= 0 ) then
                     PregDiagEvent.EventComment := 'Not Pregnant';
               end;
            PregDiagEvent.Post;
            Result := True;
         except
            PregDiagEvent.Cancel;
            Result := False;
         end;
      finally
         FreeAndNil(PregDiagEvent);
      end
   end;

begin
   Result := False;
   if ( FFileType = ftDanRyan ) then
      begin
         DecipherEventCode(FEventTable.FieldByName('EventCode').AsString);
         if ( FCalfType <> '' ) then
            begin
               if ( Length(FCalfType) = 1 ) then
                  iNoCalves := 1
               else if ( Length(FCalfType) > 1 ) then
                  iNoCalves := 2;
            end
         else if ( APregnant ) then
            iNoCalves := 1
         else if ( not(APregnant) ) then
            iNoCalves := 0;
      end
   else
      iNoCalves := FEventTable.FieldByName('NoCalves').AsInteger;

   if not( WinData.CheckEventExists(FEventTable.FieldByName('AnimalID').AsInteger,
                                    FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                    CPregDiagEvent) ) then
      CreatPregDiagEvent
   else
      begin
         WinData.UpdatePregDiagEvent(FEventTable.FieldByName('AnimalID').AsInteger,
                                     FEventTable.FieldByName('AnimalLactNo').AsInteger);
         CreatPregDiagEvent;
      end;
end;

function TfmDanRyanImport.SaveFertilityCheckEvent (AFertEventGroup : Integer) : Boolean;
var
   FertCheckEvent : TFertilityCheckEvent;
begin
   Result := False;
   if ( FSaveEvents.Locate('AnimalID;AnimalLactNo;EventDate;EventType',
                           VarArrayOf([FEventTable.FieldByName('AnimalID').AsInteger,
                                       FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                       FEventTable.FieldByName('EventDate').AsDateTime,
                                       CFertilityCheck]),[]) ) then
      begin
         AddToLog(FEventTable.FieldByName('AnimalNo').AsString,
                  FEventTable.FieldByName('NatIDNum').AsString,
                  'Fertility Check event date already exists in current lactation.');
         Exit;
      end;

   try
      FertCheckEvent := TFertilityCheckEvent.Create('FERT');
      FertCheckEvent.Append;
      try
         FertCheckEvent.EventType := TFertilityCheck;
         FertCheckEvent.AnimalID := FEventTable.FieldByName('AnimalID').AsInteger;
         FertCheckEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
         FertCheckEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
         FertCheckEvent.AnimalHerdID := WinData.UserDefaultHerdID;
         if ( Length(FEventTable.FieldByName('EventDesc').AsString) > 0 ) then
            FertCheckEvent.EventComment := Copy(FEventTable.FieldByName('EventDesc').AsString,0,30);
         if ( AFertEventGroup in [egFit, egFreshTime, egServed, egCycling, egRescanAdvised] ) then
            begin
               if ( HerdLookup.QueryFertilityCheckStatus.Locate('Description','Clean',[]) ) then
                  FertCheckEvent.Status := HerdLookup.QueryFertilityCheckStatus.FieldByName('ID').AsInteger;
            end
         else if ( AFertEventGroup = egAttention ) then
            begin
               if ( HerdLookup.QueryFertilityCheckStatus.Locate('Description','Infected',[]) ) then
                  FertCheckEvent.Status := HerdLookup.QueryFertilityCheckStatus.FieldByName('ID').AsInteger;
            end;

         FertCheckEvent.Post;
         Result := True;
      except
         FertCheckEvent.Cancel;
         Result := False;
      end;
   finally
      FreeAndNil(FertCheckEvent);
   end;
end;

procedure TfmDanRyanImport.DecipherEventCode ( AEventCode : String );
var
   EParser : TSPParser;
   PDDate : TDateTime;
   i : Integer;

   function GetCalfSex ( ACalfSex : String ) : string;
   begin
      Result := '';
      if ( ACalfSex = 'H' ) or ( ACalfSex = 'F' ) or
         ( ACalfSex = 'M' ) or ( ACalfSex = 'B' ) then
         Result := ACalfSex;
   end;

   function GetDaysInCalfFromLastPDEvent ( AAnimalID, AAnimalLactNo : Integer) : Integer;
   begin
      Result := 0;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT PD.DaysInCalf');
            SQL.Add('FROM PregnancyDiag PD');
            SQL.Add('LEFT JOIN Events E On (E.ID = PD.EventID)');
            SQL.Add('WHERE E.EventType = '+IntToStr(CPregDiagEvent)+'');
            SQL.Add('AND E.AnimalLactNo = '+IntToStr(AAnimalLactNo)+'');
            SQL.Add('AND E.AnimalID = '+IntToStr(AAnimalID)+'');
            try
               Open;
               if Fields[0].Value <> Null then
                  Result := Fields[0].AsInteger;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

   function GetDaysInCalfFromLastService ( AAnimalID, AAnimalLactNo : Integer ) : Integer;
   var
      LastEventDate : TDateTime;
   begin
      Result := 0;
      LastEventDate := WinData.EventDataHelper.GetLastEventDate(AAnimalID,AAnimalLactNo,CServiceEvent);
      if ( LastEventDate > 0 ) and ( LastEventDate < FEventTable.FieldByName('EventDate').AsDateTime ) then
         Result := Trunc(FEventTable.FieldByName('EventDate').AsDateTime - LastEventDate);
      if ( Result < 0 ) then
         Result := 0;
   end;

begin
   try
      FDaysInCalf := 0;
      FCalfType := '';
      FRecheck := False;

      EParser := TSPParser.Create(nil);
      EParser.Sepchar := ' ';
      EParser.CharSearch := True;

      EParser.Parse(AEventCode);
      if ( FEventTable.FieldByName('EventGroup').AsInteger = egPregnant ) then
         begin
            //   27/04/15 [V5.4 R5.0] /MK Change - Allow for mistake by Dan Ryan recorder where animal is recorded twice with PD.
            //                                     First instance can have 0 days and the second instance has the correct amount of days - GL/D.Frawley.
            if ( Length(EParser.Fields[1]) > 1 ) then
               FDaysInCalf := StrToInt(Copy(StripAllNomNumAlpha(EParser.Fields[1]),2,Length(EParser.Fields[1])))
            else
               begin
                  //   27/04/15 [V5.4 R4.0] /MK Change - If FDaysInCalf = 0 then get DaysInCalf from last saved PD event - GL/D.Frawley.
                  PDDate := 0;
                  WinData.EventDataHelper.GetLastEventDate(FEventTable.FieldByName('AnimalID').AsInteger,
                                                           FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                                           CPregDiagEvent);
                  if ( PDDate > 0 ) and ( PDDate = FEventTable.FieldByName('EventDate').AsDateTime ) then
                      FDaysInCalf := GetDaysInCalfFromLastPDEvent(FEventTable.FieldByName('AnimalID').AsInteger,
                                                                  FEventTable.FieldByName('AnimalLactNo').AsInteger)
                  else
                     //   27/04/15 [V5.4 R4.0] /MK Change - If no last saved PD event then get DaysInCalf from the difference between the
                     //                                     new PDEvent and the last service date - GL/D.Frawley.
                     FDaysInCalf := GetDaysInCalfFromLastService(FEventTable.FieldByName('AnimalID').AsInteger,
                                                                 FEventTable.FieldByName('AnimalLactNo').AsInteger);
               end;

            FCalfType := GetCalfSex(UpperCase(EParser.Fields[2]));
            if ( EParser.Count > 2 ) and ( GetCalfSex(UpperCase(EParser.Fields[3])) <> '' ) then
               FCalfType := FCalfType + '/' + GetCalfSex(UpperCase(EParser.Fields[3]));

            for i := 1 to EParser.Count do
               if ( EParser.Fields[i] = 'RCK' ) then
                  begin
                     FRecheck := True;
                     Break;
                  end;
         end;

   finally
      FreeAndNil(EParser);
   end;
end;

function TfmDanRyanImport.SaveToBeCulledEvent : Boolean;
var
   ToBeCulledEvent : TToBeCulledEvent;
begin
   Result := False;
   if ( WinData.CheckEventExists(FEventTable.FieldByName('AnimalID').AsInteger,
                                 FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                 CToBeCulledEvent) ) then
      begin
         AddToLog(FEventTable.FieldByName('AnimalNo').AsString,
                  FEventTable.FieldByName('NatIDNum').AsString,
                  'To Be Culled event date already exists in current lactation.');
         Exit;
      end;

   try
      ToBeCulledEvent := TToBeCulledEvent.Create('CUL');
      ToBeCulledEvent.Append;
      try
         ToBeCulledEvent.AnimalID := FEventTable.FieldByName('AnimalID').AsInteger;
         ToBeCulledEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
         ToBeCulledEvent.AnimalHerdID := WinData.UserDefaultHerdID;
         ToBeCulledEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
         if ( Length(FEventTable.FieldByName('EventDesc').AsString) > 0 ) then
            ToBeCulledEvent.EventComment := Copy(FEventTable.FieldByName('EventDesc').AsString,0,30);
         ToBeCulledEvent.EventSource := sINTERNAL;
         ToBeCulledEvent.Post;
         Result := True;
      except
         ToBeCulledEvent.Cancel;
         Result := False;
      end;
   finally
      FreeAndNil(ToBeCulledEvent);
   end;
end;

procedure TfmDanRyanImport.actEnableBillyCurtinFormatExecute(
  Sender: TObject);
begin
   inherited;
   if ( actEnableBillyCurtinFormat.Caption = 'Enable Billy Curtin Format' ) then
      begin
         actEnableBillyCurtinFormat.Caption := 'Disable Billy Curtin Format';
         FFileType := ftBillyCurtin;
         pcEvents.ActivePageIndex := tsPregnant.PageIndex;
         FEventTable.Filter := '';
         FEventTable.Filtered := False;
      end
   else if ( actEnableBillyCurtinFormat.Caption = 'Disable Billy Curtin Format' ) then
      begin
         actEnableBillyCurtinFormat.Caption := 'Enable Billy Curtin Format';
         FFileType := ftDanRyan;
         pcEvents.ActivePageIndex := tsFit.PageIndex;
      end;
   tsFit.Enabled := ( FFileType = ftDanRyan );
   tsFreshTime.Enabled := ( FFileType = ftDanRyan );
   tsAttention.Enabled := ( FFileType = ftDanRyan );
   tsServed.Enabled := ( FFileType = ftDanRyan );
   tsUnfit.Enabled := ( FFileType = ftDanRyan );
   EventGridDBTableViewCode.Visible := ( FFileType = ftDanRyan );
   EventGridDBTableViewEventDesc.Visible := ( FFileType = ftDanRyan );
end;

procedure TfmDanRyanImport.actCloseExecute(Sender: TObject);
begin
   inherited;
   if FEventTable.RecordCount > 0 then
      if ( MessageDlg('Are you sure you want to exit without saving the event(s)?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
         Close;
end;

procedure TfmDanRyanImport.FormDestroy(Sender: TObject);
begin
   inherited;
   FreeAndNil(dsEventTable);

   FEventTable.Close;
   FEventTable.DeleteTable;
   FreeAndNil(FEventTable);

   FAnimalTable.Close;
   FAnimalTable.DeleteTable;
   FreeAndNil(FAnimalTable);

   FreeAndNil(FSaveEvents);

   FreeAndNil(FSLEventFile);
end;

procedure TfmDanRyanImport.blbOptionsClick(Sender: TObject);
var
   pt : TPoint;
begin
   inherited;
   GetCursorPos(pt);
   pmOptions.Popup(pt.x,pt.y);
end;

function TfmDanRyanImport.GetAnimalID(AAnimalNo, ANatIDNum: String): Integer;
const
   cDefaultSQLStr = 'SELECT ID '+cCRLF+
                    'FROM Animals '+cCRLF+
                    'WHERE (InHerd = True) '+cCRLF+
                    'AND   (AnimalDeleted = False) '+cCRLF+
                    'AND   (HerdId = :DefaultHerdID)';
begin
   Result := 0;
   if ( Length(AAnimalNo) = 0 ) and ( Length(ANatIDNum) = 0 ) then Exit;
   // 16/06/2017 SP
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Text := cDefaultSQLStr;
         if ( Length(AAnimalNo) > 0 ) then
            begin
               SQL.Add('AND AnimalNo = "'+AAnimalNo+'"');
               Params[0].AsInteger := WinData.UserDefaultHerdID;
               Open;
               if ( RecordCount = 1 ) then
                  begin
                     First;
                     if ( Fields[0].AsInteger > 0 ) then
                        Result := Fields[0].AsInteger;
                  end
            end;
         if ( Result = 0 ) then
            begin
               SQL.Clear;
               SQL.Text := cDefaultSQLStr;
               SQL.Add('AND SearchNatID LIKE "%'+StripAllSpaces(ANatIDNum)+'%"');
               Params[0].AsInteger := WinData.UserDefaultHerdID;
               Open;
               if ( RecordCount = 1 ) then
                  begin
                     First;
                     if ( Fields[0].AsInteger > 0 ) then
                        Result := Fields[0].AsInteger;
                  end
            end;

      finally
         Free;
      end;
end;

procedure TfmDanRyanImport.AddToLog(AAnimalNo, ANatIdNum, AMessage : String);
var
   sAnimalIdent,
   sAnimalIdentType : String;
begin
   if ( (Length(AAnimalNo) = 0) and (Length(ANatIdNum) = 0) ) then Exit;
   if ( Length(AAnimalNo) > 0 ) then
      begin
        sAnimalIdent := AAnimalNo;
        sAnimalIdentType := 'number (freeze brand/jumbo)';
      end
   else if ( Length(ANatIdNum) > 0 ) then
      begin
         sAnimalIdent := ANatIdNum;
         sAnimalIdentType := 'tag number';
      end;
   cxmLog.Lines.Add(Format('Animal %s "%s" - %s',[sAnimalIdentType,sAnimalIdent,AMessage]))
end;

end.
