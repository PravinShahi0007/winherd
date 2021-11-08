unit uCalfRegFlt;
{
 ==============================================================================
 13/09/02 SP -

 procedure sbEMailClick :-

 New Check for DonorDam Primary Breed. If missing breed, abort with message
 containing Calf Number of Donor Dam.

 13/09/02 SP -

 ==============================================================================

 04/12/2002 SP:-

 NI Birth/Death Form

 procedure qrSex1Print();

 if Sex = Steer then Caption = 'Male'
  else
    bull = Bull and Female = Female

 04/12/2002 SP.                                           
 ==============================================================================

 08/01/2003 SP:-

 New procedure RegisterAnimal(Sender : TDataset);

 If user deletes animal from grid, ask if they want to register animal. They
 may want to do this is cases of animals with incorrect information or the calf's
 Dam having a foreign tag

 08/01/2003 SP.

 ==============================================================================

 10/02/2003 SP:-

 Validate foreign national dam tags.
 To decide if tag is foreign, the first two chars must be Alpha
 and total string length must be minimum 11 AlphaNumeric chars

 10/02/2003 SP.  v3.6 r4.0

 ==============================================================================

 11/03/2003 SP:-

   1) Breed code validation
      a) Sire Breed Codes
      b) Dam Breed Codes
      c) Calf Breed Codes

   2) National ID Validation
      a) Calf Nat ID (Only New Type Tags)
      b) Dam National ID (Brass, Plastic, New and Foreign)

      Foreign Dam tag - Calf Reg definition:
      The first two chars must be Alpha and total string length must be minimum 11 AlphaNumeric chars.

 11/03/2003 SP.

 ==============================================================================


 04/02/2009 [Dev V3.9 R6.0] /SP Program Improvement - GetEmailCount, program should store the email count in the owners table as well as the registry
                                                    just in case the user changes PC/or PC crash. The owners table should then contain
                                                    the most recent email count (as of backup date) as well as the lost registry key.
                                                    If there is a difference between both "owners.emailcount" or "registry.emailcount" then
                                                    add 10 to which ever is the highest number and store back to the owners table and registry. GL

                                                    Scenario #1

                                                    User PC crashed, loss of HD re-install of OS
                                                    Owners.EmailCount = 12
                                                    Registry.EmailCount = 0

                                                    on run of CalfReg, emailcount is reset to 12 + 10, the email count becomes 22.

                                                    Owners.EmailCount = 22
                                                    Registry.EmailCount = 22

                                                    Scenario #2

                                                    Database crash/Program crash/Machine power loss etc...
                                                    Owners.EmailCount = 15
                                                    Registry.EmailCount = 16

                                                    on run of CalfReg, emailcount is reset to 16 + 10, the email count becomes 26.

                                                    Owners.EmailCount = 26
                                                    Registry.EmailCount = 26


   09/02/13 [V5.1 R4.1] /MK Additional Feature - BuildTable - Check to see if RelinkCalvesToDams needs to run.

   28/03/17 [V5.6 R8.0] /MK Additional Feature - Changed size of NatIDNum column to fix the new 372 tag.    

   18/04/17 [V5.6 R8.0] /MK Additional Feature - Added a remove all menu item to the Remove drop-down-list.

   18/04/17 [V5.6 R8.0] /MK Bug Fix - CheckValidNatIDs - Added 372 to this check.

   07/09/17 [V5.7 R2.3] /MK Bug Fix - Problems found with remove all or single animals since remove all code was added.    

   04/02/19 [V5.8 R6.6] /MK Change - RegisterCalf - Change warning to be more up-to-date with AIM registrations - GL request.

   18/05/21 [V6.0 R1.1] /MK Change - BuildTable - Remove animals that are in the Animals and AIMAnimalReg table as Registered or Queried as per uAimAnimalRegistration.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, RXSpin, dbTables, quickrpt, Qrctrls, Db,
  Grids, DBGrids, RXDBCtrl, DBCtrls, RXLookup, RXCtrls, ComCtrls, ToolWin,
  EanDBQr, Menus, EanQr, jpeg, Psock, NMsmtp, NMMSG, NMTime, ShellApi,
  Email, BDE, Mask, GenTypesConst, DateUtil, DBGridEh, QRExport,xml_generator;

type
  TfCalfRegFlt = class(TForm)
    MyQuery: TQuery;
    CalfGrid: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbPrint: TRxSpeedButton;
    sbRemove: TRxSpeedButton;
    Panel2: TPanel;
    Label7: TLabel;
    Herd: TRxDBLookupCombo;
    ToolButton4: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    View: TMenuItem;
    Print: TMenuItem;
    sbViewForms: TRxSpeedButton;
    HerdQuery: TQuery;
    dsHerdQuery: TDataSource;
    tNITempDeaths: TTable;
    qNIBirth: TQuery;
    qNIDeath: TQuery;
    qCounters: TQuery;
    dsCounters: TDataSource;
    PopupMenuEMail: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    qGeneticDam: TQuery;
    dsGeneticDam: TDataSource;
    qGeneticDamBreed: TQuery;
    dsGeneticDamBreed: TDataSource;
    pEMail: TPanel;
    sbSettings: TRxSpeedButton;
    sbCancel: TRxSpeedButton;
    EMailMemo: TMemo;
    ErrorMemo: TMemo;
    MailSender: TNMSMTP;
    qBreeds: TQuery;
    qDam: TQuery;
    PopupMenu2: TPopupMenu;
    View1: TMenuItem;
    Print1: TMenuItem;
    ToolButton6: TToolButton;
    qLinkCalvesToDam: TQuery;
    CalfRegMail: TEmail;
    N1: TMenuItem;
    ViewRegisteredCalves1: TMenuItem;
    Timer1: TTimer;
    ToolButton8: TToolButton;
    PopupMenu3: TPopupMenu;
    Removecalffromregistration1: TMenuItem;
    RemoveCalfpermanently1: TMenuItem;
    N2: TMenuItem;
    UpdateRegistered1: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton10: TToolButton;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    Panel3: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    NoCalves: TEdit;
    pemailcount: TPanel;
    lECount: TLabel;
    eECount: TEdit;
    sbEmail: TRxSpeedButton;
    sbPrintNBAS10: TRxSpeedButton;
    RemoveAllFromReg: TMenuItem;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure bRemoveClick(Sender: TObject);
    procedure HerdChange(Sender: TObject);
    procedure sbPrintFormsClick(Sender: TObject);
    procedure HerdCloseUp(Sender: TObject);
    procedure eECountExit(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure MailSenderHostResolved(Sender: TComponent);
    procedure MailSenderDisconnect(Sender: TObject);
    procedure MailSenderConnect(Sender: TObject);
    procedure MailSenderAuthenticationFailed(var Handled: Boolean);
    procedure MailSenderRecipientNotFound(Recipient: String);
    procedure MailSenderInvalidHost(var Handled: Boolean);
    procedure MailSenderSuccess(Sender: TObject);
    procedure MailSenderSendStart(Sender: TObject);
    procedure MailSenderFailure(Sender: TObject);
    procedure MailSenderConnectionFailed(Sender: TObject);
    procedure MailSenderAttachmentNotFound(Filename: String);
    procedure sbHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CalfGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrSex1Print(sender: TObject; var Value: String);
    procedure Timer1Timer(Sender: TObject);
    procedure Removecalffromregistration1Click(Sender: TObject);
    procedure RemoveCalfpermanently1Click(Sender: TObject);
    procedure UpdateRegistered1Click(Sender: TObject);
    procedure ViewRegisteredCalves1Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure sbEmailClick(Sender: TObject);
    procedure sbPrintNBAS10Click(Sender: TObject);
    procedure MyTableCalfDeadOnGetText(Sender: TField;
       var Text: String; DisplayText: Boolean);
    procedure RemoveAllFromRegClick(Sender: TObject);
  private
    { Private declarations }
    MyDataSource : TDataSource;
    MyTable : TTable;
    Year : Integer;
    EMailDir : String;
    CalfFile : String;
    MessageSent : Boolean;
    HerdCountNum : Integer;
    MAPIConnect : Boolean;
    TempRemove : Boolean;
    WhichReg : TCountry;
    NumBirthRecs : integer;
    FormLoaded : Boolean;
    procedure RegisterAnimal(Sender : TDataset);
    procedure PostUpdates(EmailCount : string);
    procedure BuildTable;
    Function PadRight(Var St : String; Len : Integer): String;
    Function StripPunctuation(StrToStrip: String ): String;
    Function CheckDigitCalc(Var St : String; LineNum : Integer): String;
    procedure SendEmail;
    procedure CheckDamSireBreeds;
    procedure CheckValidNatIDs;
    procedure BlankCaptions;
    procedure BuildLine(Sender : TQuery; NatID, Colour, Breed, Sex, DOBDeathDate, DamManner : String; LineCount : Integer);
    procedure ViewCalves(QuickReport : Boolean);
    // Fix for Email Count.
    procedure CheckNewEmailCount(const AHerdID, AYear : Integer);
    function GetEmailCount(const AHerdID : Integer) : Integer;
    procedure SetEmailCount(const AHerdID, AEmailCount : Integer);
    procedure ClearRegisteredCalves;
    procedure RegisterCalf(AEventID, ACalfID : Integer; const AShowWarning : Boolean = True);
    procedure SelectAllRows;
    procedure RemoveAllSelectedRows(AShowWarning : Boolean);
  public
    { Public declarations }
  end;

procedure ShowForm;

implementation

uses
    DairyData,
    Registry,
    uHerdSetup,
    KRoutines,
    uCalfRegView,
    uCalfRegReview,
    uNBAS10Print,
    uCalfRegCardPrint,
    uCalfRegNIBirthsDeaths, uConnect,
    uMailBoxHelper, uHerdLookup, ChkDebug,
    MSXML2_TLB, ComObj,
    uAIMClient, FileCtrl, uAimAnimalRegistration;

{$R *.DFM}

procedure ShowForm;
begin
   with TfCalfRegFlt.Create(nil) do
      try
         FormLoaded := False;

         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := WinData.KingData.DatabaseName;
         MyTable.TableType := ttParadox;
         MyTable.TableName := 'TempReg';

         MyTable.FieldDefs.Clear;
         MyTable.FieldDefs.Add('UID',ftAutoInc,0,FALSE);
         MyTable.FieldDefs.Add('CounterBirths',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('EventID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('HerdID',ftInteger,0,FALSE);

         MyTable.FieldDefs.Add('Notified',ftBoolean,0,FALSE);
         MyTable.FieldDefs.Add('AnimalNo',ftString,10,FALSE);
         MyTable.FieldDefs.Add('NatIDNum',ftString,20,FALSE);
         MyTable.FieldDefs.Add('SortNatID',ftString,20,FALSE);
         MyTable.FieldDefs.Add('Colour',ftString,30,FALSE);

         MyTable.FieldDefs.Add('ColourCode',ftString,6,FALSE);
         MyTable.FieldDefs.Add('CBreed',ftString,30,FALSE);
         MyTable.FieldDefs.Add('CBreedCode',ftString,6,FALSE);
         MyTable.FieldDefs.Add('Sex',ftString,10,FALSE);
         MyTable.FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);
         MyTable.FieldDefs.Add('CalfName',ftString,30,FALSE);

         MyTable.FieldDefs.Add('DamNatID',ftString,20,FALSE);
         MyTable.FieldDefs.Add('DBreed',ftString,20,FALSE);
         MyTable.FieldDefs.Add('DBreedCode',ftString,6,FALSE);
         MyTable.FieldDefs.Add('SCode',ftString,10,FALSE);
         MyTable.FieldDefs.Add('SireNatIdNo',ftString,30,FALSE);
         MyTable.FieldDefs.Add('SBreed',ftString,20,FALSE);
         MyTable.FieldDefs.Add('SBreedCode',ftString,6,FALSE);
         MyTable.FieldDefs.Add('SireInHerd',ftBoolean,0,FALSE); // added for calf form

         MyTable.FieldDefs.Add('ComplianceCert',ftBoolean,0,FALSE); // added for calf form
         MyTable.FieldDefs.Add('CalfDead',ftBoolean,0,FALSE);

         // CalfMortality possible lookup values
         // 1 = Abortion
         // 2 = Dead at birth
         MyTable.FieldDefs.Add('CalfMortality',ftString,60,FALSE);

         // ICBFCalvingSurvey possible values
         // 1 = Normal Calving
         // 2 = Some assistance
         // 3 = Considerable difficulty
         // 4 = Veterinary assistance
         MyTable.FieldDefs.Add('CalvingSurvey',ftString,60,FALSE);

         MyTable.IndexDefs.Clear;
         MyTable.IndexDefs.Add('','UID',[ixPrimary,ixUnique]);
         MyTable.IndexDefs.Add('iAnimalNo','AnimalNo',[ixCaseInsensitive]);
         MyTable.IndexDefs.Add('iNatId','SortNatID',[ixCaseInsensitive]);

         MyTable.CreateTable;
         MyTable.IndexName := 'iNatID';
         MyTable.Open;

         MyTable.FieldByName('CalfDead').OnGetText := MyTableCalfDeadOnGetText;

         MyDataSource := TDataSource.Create(nil);
         MyDataSource.DataSet := MyTable;
         MyTable.Beforedelete := RegisterAnimal;
         CalfGrid.DataSource := MyDataSource;
         with tNITempDeaths do
            begin
               Close;
               TableName := 'tNITempDeaths';
               with FieldDefs do
                  begin
                     Clear;
                     Add('HerdID',ftInteger,0,FALSE);
                     Add('CounterDeaths',ftInteger,0,FALSE);
                     Add('AnimalNo',ftString,10,FALSE);
                     Add('NatIDNum',ftString,20,FALSE);
                     Add('Colour',ftString,30,FALSE);
                     Add('CBreed',ftString,30,FALSE);
                     Add('Sex',ftString,10,FALSE);
                     Add('DateOfBirth',ftDate,0,FALSE);
                     Add('DeathManner',ftString,20,FALSE);
                     Add('DeathPlace',ftString,20,FALSE);
                  end;
               CreateTable;
               Open;
            end;
         MessageSent := FALSE;
         TempRemove := False;
         Herd.Value := IntToStr(WinData.UserDefaultHerdID);
         WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,Herd.Value);

         ShowModal;
      finally
         MyTable.Close;
         MyTable.DeleteTable;
         MyTable.Free;
         tNITempDeaths.Close;
         tNITempDeaths.DeleteTable;
         MyDataSource.Free;
         Free;
      end;
end;

procedure TfCalfRegFlt.ExitBtnClick(Sender: TObject);
begin
   Close;
end;

procedure TfCalfRegFlt.BuildTable;
Var
   i : Integer;
begin
   Screen.Cursor := crHourGlass;

   // SP 25/04/01 Relink Dams/Calves Missing Calving Records from Calvings.db
   // 09/02/13 [V5.1 R4.1] /MK Additional Feature - Check to see if RelinkCalvesToDams needs to run.
   WinData.CheckForRelinkCalvesToDams(cCheckCalvesForOneMonth);

   try
      MyTable.DisableControls;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('DELETE FROM TempReg');
      MyQuery.ExecSQL;
      MyQuery.Close;
      for i := 1 to 4 do
         begin
            // SP 18/11/11  -  SQL Updated for AIM Services
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('INSERT INTO TempReg ( EventID, AnimalID, ComplianceCert, CalfDead, CalfMortality, CalvingSurvey )');
            case i of
               1 : MyQuery.SQL.Add('SELECT EventID, ID1, ID1ComplianceCert, CalfDead1, G1.Description, G2.Description');
               2 : MyQuery.SQL.Add('SELECT EventID, ID2, ID2ComplianceCert, CalfDead2, G1.Description, G2.Description');
               3 : MyQuery.SQL.Add('SELECT EventID, ID3, ID3ComplianceCert, CalfDead3, G1.Description, G2.Description');
               4 : MyQuery.SQL.Add('SELECT EventID, ID4, ID4ComplianceCert, CalfDead4, G1.Description, G2.Description');
            end;
            MyQuery.SQL.Add('FROM "Calvings.DB" C');
            MyQuery.SQL.Add('LEFT JOIN GenLook G1 ON (G1.Id=C.BirthType)');
            case i of
               1 : begin
                      MyQuery.SQL.Add('LEFT JOIN GenLook G2 ON (G2.Id=C.CalfMortality1)');
                      MyQuery.SQL.Add('WHERE(ID1Notified=FALSE)');
                      MyQuery.SQL.Add('AND(ID1>0)');
                   end;
               2 : begin
                      MyQuery.SQL.Add('LEFT JOIN GenLook G2 ON (G2.Id=C.CalfMortality2)');
                      MyQuery.SQL.Add('WHERE(ID2Notified=FALSE)');
                      MyQuery.SQL.Add('AND(ID2>0)');
                   end;
               3 : begin
                      MyQuery.SQL.Add('LEFT JOIN GenLook G2 ON (G2.Id=C.CalfMortality3)');
                      MyQuery.SQL.Add('WHERE(ID3Notified=FALSE)');
                      MyQuery.SQL.Add('AND(ID3>0)');
                   end;
               4 : begin
                      MyQuery.SQL.Add('LEFT JOIN GenLook G2 ON (G2.Id=C.CalfMortality4)');
                      MyQuery.SQL.Add('WHERE(ID4Notified=FALSE)');
                      MyQuery.SQL.Add('AND(ID4>0)');
                   end;
            end;
            MyQuery.ExecSQL;
         end;

      with MyQuery do
         begin
            SQL.Clear;
            SQL.Add('DELETE FROM TempReg');
            SQL.Add('WHERE TempReg.AnimalID NOT In');
            SQL.Add('(SELECT ID FROM Animals)');
            ExecSQL;

            //   18/05/21 [V6.0 R1.1] /MK Change - Remove animals that are in the Animals and AIMAnimalReg table as Registered or Queried as per uAimAnimalRegistration.
            if ( WhichReg = Ireland ) then
               begin
                  MyQuery.SQL.Clear;
                  MyQuery.SQL.Add('DELETE FROM '+MyTable.TableName);
                  MyQuery.SQL.Add('WHERE AnimalId IN (SELECT Id FROM Animals WHERE AimRegStatus IN (3,4))');
                  MyQuery.ExecSQL;

                  MyQuery.SQL.Clear;
                  MyQuery.SQL.Add('DELETE FROM '+MyTable.TableName);
                  MyQuery.SQL.Add('WHERE AnimalId IN (SELECT AnimalId FROM AIMAnimalReg WHERE Status IN (3,4))');
                  MyQuery.ExecSQL;
               end;

            MyTable.Close;
            MyTable.Open;
            
            SQL.Clear;
            SQL.Add('SELECT ID, AnimalNo, NatIDNum, SortNatId, Colour, PrimaryBreed, Sex, DateOfBirth, DamID, SireID, HerdID, Name');
            SQL.Add('FROM Animals A, TempReg T');
            SQL.Add('WHERE (T.AnimalID=A.ID)');
            Open;
            First;
            while NOT EOF do
               begin
                  if MyTable.Locate('AnimalID',FieldByName('ID').Value,[] ) then
                     begin
                        MyTable.Edit;
                        MyTable.FieldByName('NatIdNum').AsString := FieldByName('NatIDNum').AsString;
                        MyTable.FieldByName('SortNatId').AsString := FieldByName('SortNatID').AsString;
                        MyTable.FieldByName('HerdID').AsInteger := FieldByName('HerdID').AsInteger;

                        // Now try locate the calf's colour and colour code
                        if WinData.GenLookUp.Locate('ID',FieldByName('Colour').Value,[] ) then
                           begin
                              MyTable.FieldByName('Colour').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                              MyTable.FieldByName('ColourCode').AsString := WinData.GenLookUp.FieldByName('LookUpCode').AsString;
                           end;

                        // Now try locate the calf's breed and breed code
                        if WinData.Breeds.Locate('ID',FieldByName('PrimaryBreed').Value,[] ) then
                           begin
                              MyTable.FieldByName('CBreed').AsString := WinData.Breeds.FieldByName('Name').AsString;
                              MyTable.FieldByName('CBreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString;
                           end;
                        MyTable.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                        MyTable.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                        MyTable.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;

                        // Get the DAM Info.
                        if WinData.LookUpDamSire.Locate('ID',FieldByName('DamID').Value, [] ) then
                           begin
                              MyTable.FieldByName('DamNatId').AsString := WinData.LookUpDamSire.FieldByName('NatIdNum').AsString;
                              if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').Value,[] ) then
                                 begin
                                    MyTable.FieldByName('DBreed').AsString := WinData.Breeds.FieldByName('Name').AsString;
                                    MyTable.FieldByName('DBreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString;
                                 end;
                           end;

                        // Sire Info
                        if WinData.LookUpDamSire.Locate('ID',FieldByName('SireID').Value, [] ) then
                           begin
                              if WinData.LookUpDamSire.FieldByName('HerdID').AsInteger = WinData.NONEHerdID then
                                 begin
                                    MyTable.FieldByName('SCode').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').Value,[] ) then
                                       begin
                                          MyTable.FieldByName('SBreed').AsString := WinData.Breeds.FieldByName('Name').AsString;
                                          MyTable.FieldByName('SBreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString;
                                       end;
                                  end
                              else
                                 begin
                                    if WinData.Breeds.Locate('ID',WinData.LookUpDamSire.FieldByName('PrimaryBreed').Value,[] ) then
                                       begin
                                          MyTable.FieldByName('SBreed').AsString := WinData.Breeds.FieldByName('Name').AsString;
                                          MyTable.FieldByName('SBreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString;
                                       end;
                                 end;
                              // If there's no breed/code found for the sire, take the breed code from the calf.
                              if MyTable.FieldByName('SBreedCode').IsNull then
                                 MyTable.FieldByName('SBreedCode').AsString := MyTable.FieldByName('CBreedCode').AsString;

                              // SP 18/11/11  -  SQL Updated for AIM Services
                              MyTable.FieldByName('SireNatIdNo').AsString := WinData.LookUpDamSire.FieldByName('NatIdNum').AsString;
                           end;


                        if ( MyTable.FieldByName('CalfDead').AsBoolean ) then // SP REL V4.0 R0.7 13/1/10
                           begin
                              if ( WinData.EventDataHelper.GetAnimalDeathEventDate(MyTable.FieldByName('AnimalID').AsInteger) <= 0 ) then
                                 MyTable.FieldByName('CalfDead').AsBoolean := False;
                           end
                        else if ( MyTable.FieldByName('CalfDead').IsNull ) then
                           MyTable.FieldByName('CalfDead').AsBoolean := False;

                        // SP 18/11/11  -  SQL Updated for AIM Services
                        MyTable.FieldByName('CalfName').AsString := FieldByName('Name').AsString;

                        MyTable.Post;
                     end;
                  Next;        // go to next animal
               end;
         end;

   if Herd.Value <> '0' then
      with MyQuery do
         begin
            SQL.Clear;
            SQL.Add('DELETE FROM TempReg');
            SQL.Add('WHERE HerdID <> ' + Herd.Value );
            ExecSQL;
         end;

   finally
      MyTable.EnableControls;
      MyTable.Refresh;
      CalfGrid.SelectedRows.Clear;
      NoCalves.Text := IntToStr( MyTable.RecordCount );
      Screen.Cursor := crDefault;
   end;

end;

procedure TfCalfRegFlt.ViewBtnClick(Sender: TObject);
var
   LookUpCalvings : TTable;
begin
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;

   // Reset the Query
   try
      Application.CreateForm(TfmCalfRegView, fmCalfRegView);
   except
      on E : EOutOfResources do raise Exception(E.Message);
      on E : EOutOfMemory do raise Exception(E.Message);
   end;

   with fmCalfRegView do
      try
         with MyQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT *');
               SQL.Add('FROM TempReg');
               SQL.Add('ORDER BY SortNatId, AnimalNo');
               Open;
            end;

         if ( Sender as TMenuItem).Name = 'View' then
            begin
               fmCalfRegView.RptTitle.Font.Color := clRed;
               bDetails.Font.Color := clNavy;
               rCalfReg.Preview;
            end
         else
            begin
               RptTitle.Font.Color := clblack;
               bDetails.Font.Color := clBlack;
               rCalfReg.Print;
               if WhichReg = NIreland then
               if MessageDLG('Mark the Animals as Registered',mtWarning,[mbYes,MbNo],0) = mrYes then
                  begin
                     WinData.CreateTTable(LookUpCalvings,nil,'',WinData.Calvings.TableName);
                     LookUpCalvings.Active := True;
                     try
                        with MyQuery do
                           begin
                              SQL.Clear;
                              SQL.Add('UPDATE TempReg');
                              SQL.Add('SET Notified=TRUE');
                              ExecSQL;
                              SQL.Clear;
                              SQL.Add('SELECT * FROM TempReg');
                              SQL.Add('WHERE Notified=TRUE');
                              Open;
                              First;
                              while NOT EOF do
                                 begin
                                    if LookUpCalvings.Locate('EventId',FieldByName('EventId').Value,[] ) then
                                       begin
                                          if ( LookUpCalvings.FieldByName('ID1').AsInteger = FieldByName('AnimalID').AsInteger ) then
                                             try
                                                LookUpCalvings.Edit;
                                                LookUpCalvings.FieldByName('ID1Notified').AsBoolean := TRUE;
                                                LookUpCalvings.FieldByName('ID1Status').AsInteger := CalfReg_Status_Posted;
                                                LookUpCalvings.FieldByName('ID1DATE').AsDateTime := Date;
                                                LookUpCalvings.Post;
                                                DbiSaveChanges(LookUpCalvings.Handle);
                                             except
                                                LookUpCalvings.Cancel;
                                                MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                                             end
                                          else if ( LookUpCalvings.FieldByName('ID2').AsInteger = FieldByName('AnimalID').AsInteger ) then
                                             try
                                                LookUpCalvings.Edit;
                                                LookUpCalvings.FieldByName('ID2Notified').AsBoolean := TRUE;
                                                LookUpCalvings.FieldByName('ID2Status').AsInteger := CalfReg_Status_Posted;
                                                LookUpCalvings.FieldByName('ID2DATE').AsDateTime := Date;
                                                LookUpCalvings.Post;
                                                DbiSaveChanges(LookUpCalvings.Handle);
                                             except
                                                LookUpCalvings.Cancel;
                                                MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                                             end
                                          else if ( LookUpCalvings.FieldByName('ID3').AsInteger = FieldByName('AnimalID').AsInteger ) then
                                             try
                                                LookUpCalvings.Edit;
                                                LookUpCalvings.FieldByName('ID3Notified').AsBoolean := TRUE;
                                                LookUpCalvings.FieldByName('ID3Status').AsInteger := CalfReg_Status_Posted;
                                                LookUpCalvings.FieldByName('ID3DATE').AsDateTime := Date;
                                                LookUpCalvings.Post;
                                                DbiSaveChanges(LookUpCalvings.Handle);
                                             except
                                                LookUpCalvings.Cancel;
                                                MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                                             end
                                          else if ( LookUpCalvings.FieldByName('ID4').AsInteger = FieldByName('AnimalID').AsInteger ) then
                                             try
                                                LookUpCalvings.Edit;
                                                LookUpCalvings.FieldByName('ID4Notified').AsBoolean := TRUE;
                                                LookUpCalvings.FieldByName('ID4Status').AsInteger := CalfReg_Status_Posted;
                                                LookUpCalvings.FieldByName('ID4DATE').AsDateTime := Date;
                                                LookUpCalvings.Post;
                                                DbiSaveChanges(LookUpCalvings.Handle);
                                             except
                                                LookUpCalvings.Cancel;
                                                MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                                             end;
                                       end;
                                    Next;
                                 end;
                           end;
                     finally
                        ClearRegisteredCalves;
                        LookUpCalvings.Active := False;
                        FreeAndNil(LookUpCalvings);
                     end;
                  end;
            end;

      finally
         fmCalfRegView.Free;
      end;

end;

procedure TfCalfRegFlt.bRemoveClick(Sender: TObject);
begin
   TempRemove := True;
   if MyTable.RecordCount > 0 then
      begin
         if CalfGrid.SelectedRows.Count > 1 then
            CalfGrid.SelectedRows.Delete
         else
            CalfGrid.DataSource.DataSet.Delete;
         NoCalves.Text := IntToStr( MyTable.RecordCount );
      end;
   TempRemove := False;
end;

procedure TfCalfRegFlt.HerdChange(Sender: TObject);
begin
   if FormLoaded then
      BuildTable;
end;

procedure TfCalfRegFlt.sbPrintFormsClick(Sender: TObject);

   procedure OutputNIReport;
   begin
      if (Sender as Tmenuitem).hint = 'view' then
         fmCalfRegNIBirthsDeaths.qrNIBirthDeath.Preview
      else
         fmCalfRegNIBirthsDeaths.qrNIBirthDeath.Print;

      BlankCaptions;
   end;

const
    Max_Rec = 12;
var
   RecCount,
   HerdID : Integer;
   FormattedNatID : string;
   FormattedDamNatID : string;
   LookUpCalvings : TTable;
begin
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;

   NumBirthRecs := 0;
   if WhichReg = NIreland then
      begin
         fmCalfRegNIBirthsDeaths := TfmCalfRegNIBirthsDeaths.Create(nil);
         try
         BlankCaptions;
         HerdID := StrToInt(Herd.Value);
         HerdQuery.Close;
         HerdQuery.ParamByName('HerdID').AsInteger := HerdID;
         HerdQuery.Open;
         with qNIBirth do
            begin
               SQL.Clear;
               SQL.Add('SELECT * FROM TempReg');
               SQL.Add('ORDER BY SortNatId, AnimalNo');
               Open;
            end;

         with qNIDeath do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM tNITempDeaths');
               ExecSQL;

               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID, E.ID EID, A.AnimalNo, A.NatIDNum, A.SortNatId, G.LookupCode ColourCode, B.Code CBreedCode, A.Sex, A.DateOfBirth,');
               SQL.Add('                E.EventDate DeathDate, C.Name ');
               SQL.Add('FROM Animals A');
               SQL.Add('LEFT JOIN Breeds      B ON (B.ID=A.PrimaryBreed)');
               SQL.Add('LEFT JOIN Genlook     G ON (G.ID=A.Colour)');
               SQL.Add('LEFT JOIN Events      E ON (A.ID=E.AnimalID)');
               SQL.Add('LEFT JOIN SalesDeaths S ON (E.ID=S.EventID)');
               SQL.Add('LEFT JOIN Customers   C ON (C.ID=S.Customer)');
               SQL.Add('WHERE (A.InHerd=False)');
               SQL.Add('AND   (A.AnimalDeleted=False)');
               SQL.Add('AND   (A.HerdID = '+Herd.Value+')');
               SQL.Add('AND   (S.Sold=FALSE)');
               SQL.Add('AND   (S.NIDeathNotify=False)');
               Open;
            end;

         if ((qNIDeath.RecordCount = 0) and (qNIBirth.RecordCount = 0)) then
            begin
               MessageDlg('Unable to proceed, no records to be registered!',mtInformation,[mbOK],0);
               SysUtils.Abort;
            end;

         qNIBirth.First;
         qNIDeath.First;

         if (qNIBirth.RecordCount > 0) and (qNIDeath.RecordCount > 0) then
            begin
               qNIBirth.First;
               qNIDeath.First;
               while not(qNIBirth.Eof) or not(qNIDeath.Eof) do
                  begin
                     RecCount := 1;

                     while not(qNIBirth.Eof) do
                        begin

                           if IsNINatID (qNIBirth.FieldByName('NatIDNum').AsString) then
                              begin
                                 WinData.CheckNINatID(qNIBirth.FieldByName('NatIDNum').AsString,FormattedNatID,True);
                              end
                           else
                              begin
                                 FormattedNatID := qNIBirth.FieldByName('NatIDNum').AsString;
                              end;

                           if IsNINatID (qNIBirth.FieldByName('DamNatID').AsString) then
                              begin
                                 WinData.CheckNINatID(qNIBirth.FieldByName('DamNatID').AsString,FormattedDamNatID,True);
                              end
                           else
                              begin
                                 FormattedDamNatID := qNIBirth.FieldByName('DamNatID').AsString;
                              end;

                           BuildLine(qNIBirth,
                                Trim(FormattedNatID),
                                Trim(qNIBirth.FieldByName('ColourCode').AsString),
                                Trim(qNIBirth.FieldByName('CBreedCode').AsString),
                                Trim(qNIBirth.FieldByName('Sex').AsString),
                           DateToStr(qNIBirth.FieldByName('DateOfBirth').AsDateTime),
                                Trim(FormattedDamNatID),
                                     RecCount);
                           qNIBirth.Next;
                           if ( RecCount = 12 ) or ((RecCount <= 12) and (qNIBirth.Eof = true)) then
                              begin
                                 RecCount := 1;
                                 Break;
                              end
                           else
                              Inc(RecCount)
                        end;

                     RecCount := 1;
                     while NOT(qNIDeath.Eof) do
                        begin
                           if IsNINatID (qNIDeath.FieldByName('NatIDNum').AsString) then
                              WinData.CheckNINatID(qNIDeath.FieldByName('NatIDNum').AsString,FormattedNatID,True)
                           else
                              FormattedNatID := qNIDeath.FieldByName('NatIDNum').AsString;
                           BuildLine(qNIDeath,
                                Trim(FormattedNatID),
                                Trim(qNIDeath.FieldByName('ColourCode').AsString),
                                Trim(qNIDeath.FieldByName('CBreedCode').AsString),
                                Trim(qNIDeath.FieldByName('Sex').AsString),
                           DateToStr(qNIDeath.FieldByName('DeathDate').AsDateTime),
                                     Trim(qNIDeath.FieldByName('Name').AsString),
                                     RecCount);
                           qNIDeath.Next;
                           if ( RecCount = 12 ) or ((RecCount <= 12) and (qNIDeath.Eof = true)) then
                              begin
                                 RecCount := 1;
                                 Break;
                              end
                           else
                              Inc(RecCount)
                        end;
                      OutputNIReport;

                     with qNIDeath do
                        begin
                           First;
                           WinData.LookUpSaleDeath.ReadOnly := False;
                           if NOT(WinData.LookUpSaleDeath.Active) then
                              WinData.LookUpSaleDeath.Active := True;
                           while NOT EOF do
                              begin
                                 if qNIDeath.FieldByName('EID').AsInteger > 0 then
                                    if WinData.LookUpSaleDeath.Locate('EventID', qNIDeath.FieldByName('EID').AsInteger, []) then
                                       begin
                                          WinData.LookUpSaleDeath.Edit;
                                          WinData.LookUpSaleDeath.FieldByName('NIDeathNotify').AsBoolean := True;
                                          WinData.LookUpSaleDeath.Post;
                                       end;
                                 Next;
                              end;
                           BDE.DbiSaveChanges(WinData.LookUpSaleDeath.Handle);
                           WinData.LookUpSaleDeath.Active := False;
                        end;

                  end;
            end
         else if (qNIBirth.RecordCount > 0) and (qNIDeath.RecordCount <= 0) then
            begin
               RecCount := 1;
               while not qNIBirth.Eof do
                  begin
                     if IsNINatID (qNIBirth.FieldByName('NatIDNum').AsString) then
                        WinData.CheckNINatID(qNIBirth.FieldByName('NatIDNum').AsString,FormattedNatID,True)
                     else
                        FormattedNatID := qNIBirth.FieldByName('NatIDNum').AsString;

                     if IsNINatID (qNIBirth.FieldByName('DamNatID').AsString) then
                        WinData.CheckNINatID(qNIBirth.FieldByName('DamNatID').AsString,FormattedDamNatID,True)
                     else
                        FormattedDamNatID := qNIBirth.FieldByName('DamNatID').AsString;

                     BuildLine(qNIBirth,
                          Trim(FormattedNatID),
                          Trim(qNIBirth.FieldByName('ColourCode').AsString),
                          Trim(qNIBirth.FieldByName('CBreedCode').AsString),
                          Trim(qNIBirth.FieldByName('Sex').AsString),
                     DateToStr(qNIBirth.FieldByName('DateOfBirth').AsDateTime),
                          Trim(FormattedDamNatID),
                               RecCount);
                     qNIBirth.Next;

                     if ( RecCount = 12 ) or ((RecCount <= 12) and (qNIBirth.Eof = true)) then
                        begin
                           OutputNIReport;
                           RecCount := 1;
                        end
                     else
                        Inc(RecCount);
                  end;
            end
         else if (qNIBirth.RecordCount <= 0) and (qNIDeath.RecordCount > 0) then
            begin
               RecCount := 1;
               while not qNIDeath.Eof do
                  begin
                     if IsNINatID (qNIDeath.FieldByName('NatIDNum').AsString) then
                        WinData.CheckNINatID(qNIDeath.FieldByName('NatIDNum').AsString,FormattedNatID,True)
                     else
                        FormattedNatID := qNIDeath.FieldByName('NatIDNum').AsString;

                     BuildLine(qNIDeath,
                          Trim(FormattedNatID),
                          Trim(qNIDeath.FieldByName('ColourCode').AsString),
                          Trim(qNIDeath.FieldByName('CBreedCode').AsString),
                          Trim(qNIDeath.FieldByName('Sex').AsString),
                     DateToStr(qNIDeath.FieldByName('DeathDate').AsDateTime),
                               Trim(qNIDeath.FieldByName('Name').AsString),
                               RecCount);
                     qNIDeath.Next;
                     if ( RecCount = 12 ) or ((RecCount <= 12) and (qNIDeath.Eof = true)) then
                        begin
                           OutputNIReport;
                           RecCount := 1;
                        end
                     else
                        Inc(RecCount);

                     with qNIDeath do
                        begin
                           First;
                           WinData.LookUpSaleDeath.ReadOnly := False;
                           if NOT(WinData.LookUpSaleDeath.Active) then
                              WinData.LookUpSaleDeath.Active := True;
                           while NOT EOF do
                              begin
                                 if qNIDeath.FieldByName('EID').AsInteger > 0 then
                                    if WinData.LookUpSaleDeath.Locate('EventID', qNIDeath.FieldByName('EID').AsInteger, []) then
                                       begin
                                          WinData.LookUpSaleDeath.Edit;
                                          WinData.LookUpSaleDeath.FieldByName('NIDeathNotify').AsBoolean := True;
                                          WinData.LookUpSaleDeath.Post;
                                       end;
                                 Next;
                              end;
                           BDE.DbiSaveChanges(WinData.LookUpSaleDeath.Handle);
                           WinData.LookUpSaleDeath.Active := False;
                        end;
                  end;
            end;

        finally
           FreeAndNil(fmCalfRegNIBirthsDeaths);
        end;
      end
   else
      begin

         // Check Sire and Dam breed codes exist.
         CheckDamSireBreeds;
         // Check Calf and Dam NatID's are valid.
         CheckValidNatIDs;
         with MyQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT *');
               SQL.Add('FROM TempReg');
               SQL.Add('ORDER BY SortNatId, AnimalNo');
               Open;
            end;
      end;

   if (sender as Tmenuitem).hint = 'view' then
      begin
         fmCalfRegCardPrint := TfmCalfRegCardPrint.Create(nil);
         fmCalfRegCardPrint.CalfCertScr.DataSet := MyQuery;
         try
             if WhichReg = Ireland then
                fmCalfRegCardPrint.CalfCertSCr.Preview;
         finally
            if fmCalfRegCardPrint <> nil then
               FreeAndNil(fmCalfRegCardPrint);
         end;
      end
   else
      begin
         fmCalfRegCardPrint := TfmCalfRegCardPrint.Create(nil);
         fmCalfRegCardPrint.CalfCertScr.DataSet := MyQuery;
         try
            if WhichReg = Ireland then
               Windata.CallPrintDialog(fmCalfRegCardPrint.CalfCertScr);
         finally
            if fmCalfRegCardPrint <> nil then
               FreeAndNil(fmCalfRegCardPrint);
         end;

         if fmCalfRegCardPrint <> nil then
            FreeAndNil(fmCalfRegCardPrint);

         if MessageDLG('Mark the Animals as Registered',mtWarning,[mbYes,MbNo],0) = mrYes then
            begin
               WinData.CreateTTable(LookupCalvings,nil,'','Calvings.db');
               LookupCalvings.Active := True;
               try
                  with MyQuery do
                     begin
                        SQL.Clear;
                        SQL.Add('UPDATE TempReg');
                        SQL.Add('SET Notified=TRUE');
                        ExecSQL;
                        SQL.Clear;
                        SQL.Add('SELECT * FROM TempReg');
                        SQL.Add('WHERE Notified=TRUE');
                        Open;
                        First;
                        while NOT EOF do
                           begin
                              if LookUpCalvings.Locate('EventId',FieldByName('EventId').Value,[] ) then
                                 begin
                                    if ( LookUpCalvings.FieldByName('ID1').AsInteger = FieldByName('AnimalID').AsInteger ) then
                                       try
                                          LookUpCalvings.Edit;
                                          LookUpCalvings.FieldByName('ID1Notified').AsBoolean := TRUE;
                                          LookUpCalvings.FieldByName('ID1Status').AsInteger := CalfReg_Status_Posted;
                                          LookUpCalvings.FieldByName('ID1DATE').AsDateTime := Date;
                                          LookUpCalvings.Post;
                                          DbiSaveChanges(LookUpCalvings.Handle);
                                       except
                                          LookUpCalvings.Cancel;
                                          MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                                       end
                                    else if ( LookUpCalvings.FieldByName('ID2').AsInteger = FieldByName('AnimalID').AsInteger ) then
                                       try
                                          LookUpCalvings.Edit;
                                          LookUpCalvings.FieldByName('ID2Notified').AsBoolean := TRUE;
                                          LookUpCalvings.FieldByName('ID2Status').AsInteger := CalfReg_Status_Posted;
                                          LookUpCalvings.FieldByName('ID2DATE').AsDateTime := Date;
                                          LookUpCalvings.Post;
                                          DbiSaveChanges(LookUpCalvings.Handle);
                                       except
                                          LookUpCalvings.Cancel;
                                          MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                                       end
                                    else if ( LookUpCalvings.FieldByName('ID3').AsInteger = FieldByName('AnimalID').AsInteger ) then
                                       try
                                          LookUpCalvings.Edit;
                                          LookUpCalvings.FieldByName('ID3Notified').AsBoolean := TRUE;
                                          LookUpCalvings.FieldByName('ID3Status').AsInteger := CalfReg_Status_Posted;
                                          LookUpCalvings.FieldByName('ID3DATE').AsDateTime := Date;
                                          LookUpCalvings.Post;
                                          DbiSaveChanges(LookUpCalvings.Handle);
                                       except
                                          LookUpCalvings.Cancel;
                                          MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                                       end
                                    else if ( LookUpCalvings.FieldByName('ID4').AsInteger = FieldByName('AnimalID').AsInteger ) then
                                       try
                                          LookUpCalvings.Edit;
                                          LookUpCalvings.FieldByName('ID4Notified').AsBoolean := TRUE;
                                          LookUpCalvings.FieldByName('ID4Status').AsInteger := CalfReg_Status_Posted;
                                          LookUpCalvings.FieldByName('ID4DATE').AsDateTime := Date;
                                          LookUpCalvings.Post;
                                          DbiSaveChanges(LookUpCalvings.Handle);
                                       except
                                          LookUpCalvings.Cancel;
                                          MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                                       end;
                                 end;
                              Next;
                           end;

                     end;
               finally
                  LookupCalvings.Active := False;
                  FreeAndNil(LookUpCalvings);
               end;
            end;
            ClearRegisteredCalves;
            MessageDlg('Discard the original registration form(s)' + #13 +
                       'received with the tag(s) in a secure manner' + #13#13 +
                       'Remember to check that all details are correct' + #13 +
                       'and to sign your calf registration forms.',mtInformation,[mbOK],0);
      end;
end;

procedure TfCalfRegFlt.BuildLine(Sender: TQuery; NatID, Colour, Breed, Sex,
  DOBDeathDate, DamManner: String; LineCount : Integer);
begin

   with fmCalfRegNIBirthsDeaths do
      begin
         if Sender = qNIBirth then
            begin
               case LineCount of
                  1 : Begin
                         qrNatID1.Caption := NatID;
                         qrColor1.Caption := Colour;
                         qrBreed1.Caption := Breed;
                         qrSex1.Caption   := Sex;
                         qrDOB1.Caption   := DOBDeathDate;
                         qrDam1.Caption   := DamManner;
                      end;
                  2 : Begin
                         qrNatID2.Caption := NatID;
                         qrColor2.Caption := Colour;
                         qrBreed2.Caption := Breed;
                         qrSex2.Caption   := Sex;
                         qrDOB2.Caption   := DOBDeathDate;
                         qrDam2.Caption   := DamManner;
                      end;
                  3 : Begin
                         qrNatID3.Caption := NatID;
                         qrColor3.Caption := Colour;
                         qrBreed3.Caption := Breed;
                         qrSex3.Caption   := Sex;
                         qrDOB3.Caption   := DOBDeathDate;
                         qrDam3.Caption   := DamManner;
                      end;
                  4 : Begin
                         qrNatID4.Caption := NatID;
                         qrColor4.Caption := Colour;
                         qrBreed4.Caption := Breed;
                         qrSex4.Caption   := Sex;
                         qrDOB4.Caption   := DOBDeathDate;
                         qrDam4.Caption   := DamManner;
                      end;
                  5 : Begin
                         qrNatID5.Caption := NatID;
                         qrColor5.Caption := Colour;
                         qrBreed5.Caption := Breed;
                         qrSex5.Caption   := Sex;
                         qrDOB5.Caption   := DOBDeathDate;
                         qrDam5.Caption   := DamManner;
                      end;
                  6 : Begin
                         qrNatID6.Caption := NatID;
                         qrColor6.Caption := Colour;
                         qrBreed6.Caption := Breed;
                         qrSex6.Caption   := Sex;
                         qrDOB6.Caption   := DOBDeathDate;
                         qrDam6.Caption   := DamManner;
                      end;
                  7 : Begin
                         qrNatID7.Caption := NatID;
                         qrColor7.Caption := Colour;
                         qrBreed7.Caption := Breed;
                         qrSex7.Caption   := Sex;
                         qrDOB7.Caption   := DOBDeathDate;
                         qrDam7.Caption   := DamManner;
                      end;
                  8 : Begin
                         qrNatID8.Caption := NatID;
                         qrColor8.Caption := Colour;
                         qrBreed8.Caption := Breed;
                         qrSex8.Caption   := Sex;
                         qrDOB8.Caption   := DOBDeathDate;
                         qrDam8.Caption   := DamManner;
                      end;
                  9 : Begin
                         qrNatID9.Caption := NatID;
                         qrColor9.Caption := Colour;
                         qrBreed9.Caption := Breed;
                         qrSex9.Caption   := Sex;
                         qrDOB9.Caption   := DOBDeathDate;
                         qrDam9.Caption   := DamManner;
                      end;
                  10 : Begin
                         qrNatID10.Caption := NatID;
                         qrColor10.Caption := Colour;
                         qrBreed10.Caption := Breed;
                         qrSex10.Caption   := Sex;
                         qrDOB10.Caption   := DOBDeathDate;
                         qrDam10.Caption   := DamManner;
                       end;
                  11 : Begin
                         qrNatID11.Caption := NatID;
                         qrColor11.Caption := Colour;
                         qrBreed11.Caption := Breed;
                         qrSex11.Caption   := Sex;
                         qrDOB11.Caption   := DOBDeathDate;
                         qrDam11.Caption   := DamManner;
                       end;
                  12 : Begin
                         qrNatID12.Caption := NatID;
                         qrColor12.Caption := Colour;
                         qrBreed12.Caption := Breed;
                         qrSex12.Caption   := Sex;
                         qrDOB12.Caption   := DOBDeathDate;
                         qrDam12.Caption   := DamManner;
                       end;
               end;
            end
         else
            begin
               case LineCount of
                  1 : Begin
                         qrdNatID1.Caption    := NatID;
                         qrdColor1.Caption    := Colour;
                         qrdBreed1.Caption    := Breed;
                         qrdSex1.Caption      := Sex;
                         qrDeathDate1.Caption := DOBDeathDate;
                         qrCustName1.Caption  := DamManner;
                      end;
                  2 : Begin
                         qrdNatID2.Caption    := NatID;
                         qrdColor2.Caption    := Colour;
                         qrdBreed2.Caption    := Breed;
                         qrdSex2.Caption      := Sex;
                         qrDeathDate2.Caption := DOBDeathDate;
                         qrCustName2.Caption  := DamManner;
                      end;
                  3 : Begin
                         qrdNatID3.Caption    := NatID;
                         qrdColor3.Caption    := Colour;
                         qrdBreed3.Caption    := Breed;
                         qrdSex3.Caption      := Sex;
                         qrDeathDate3.Caption := DOBDeathDate;
                         qrCustName3.Caption  := DamManner;
                      end;
                  4 : Begin
                         qrdNatID4.Caption    := NatID;
                         qrdColor4.Caption    := Colour;
                         qrdBreed4.Caption    := Breed;
                         qrdSex4.Caption      := Sex;
                         qrDeathDate4.Caption := DOBDeathDate;
                         qrCustName4.Caption  := DamManner;
                      end;
                  5 : Begin
                         qrdNatID5.Caption    := NatID;
                         qrdColor5.Caption    := Colour;
                         qrdBreed5.Caption    := Breed;
                         qrdSex5.Caption      := Sex;
                         qrDeathDate5.Caption := DOBDeathDate;
                         qrCustName5.Caption  := DamManner;
                      end;
                  6 : Begin
                         qrdNatID6.Caption    := NatID;
                         qrdColor6.Caption    := Colour;
                         qrdBreed6.Caption    := Breed;
                         qrdSex6.Caption      := Sex;
                         qrDeathDate6.Caption := DOBDeathDate;
                         qrCustName6.Caption  := DamManner;
                      end;
                  7 : Begin
                         qrdNatID7.Caption    := NatID;
                         qrdColor7.Caption    := Colour;
                         qrdBreed7.Caption    := Breed;
                         qrdSex7.Caption      := Sex;
                         qrDeathDate7.Caption := DOBDeathDate;
                         qrCustName7.Caption  := DamManner;
                      end;
                  8 : Begin
                         qrdNatID8.Caption    := NatID;
                         qrdColor8.Caption    := Colour;
                         qrdBreed8.Caption    := Breed;
                         qrdSex8.Caption      := Sex;
                         qrDeathDate8.Caption := DOBDeathDate;
                         qrCustName8.Caption  := DamManner;
                      end;
                  9 : Begin
                         qrdNatID9.Caption    := NatID;
                         qrdColor9.Caption    := Colour;
                         qrdBreed9.Caption    := Breed;
                         qrdSex9.Caption      := Sex;
                         qrDeathDate9.Caption := DOBDeathDate;
                         qrCustName9.Caption  := DamManner;
                      end;
                  10 : Begin
                         qrdNatID10.Caption    := NatID;
                         qrdColor10.Caption    := Colour;
                         qrdBreed10.Caption    := Breed;
                         qrdSex10.Caption      := Sex;
                         qrDeathDate10.Caption := DOBDeathDate;
                         qrCustName10.Caption  := DamManner;
                       end;
                  11 : Begin
                         qrdNatID11.Caption    := NatID;
                         qrdColor11.Caption    := Colour;
                         qrdBreed11.Caption    := Breed;
                         qrdSex11.Caption      := Sex;
                         qrDeathDate11.Caption := DOBDeathDate;
                         qrCustName11.Caption  := DamManner;
                       end;
                  12 : Begin
                         qrdNatID12.Caption    := NatID;
                         qrdColor12.Caption    := Colour;
                         qrdBreed12.Caption    := Breed;
                         qrdSex12.Caption      := Sex;
                         qrDeathDate12.Caption := DOBDeathDate;
                         qrCustName12.Caption  := DamManner;
                       end;
               end;
            end;
   end;
end;

procedure TfCalfRegFlt.HerdCloseUp(Sender: TObject);
begin
   WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,Herd.Value);
   If WhichReg <> Ireland then
      Begin
         sbEMail.Hide;
         sbPrintNBAS10.Hide;
         ToolButton4.Hide;
         lECount.Hide;
         eECount.Hide;
      End
   Else
      Begin
         // 08/08/2013 - V5.1 R9.0 /SP
         // Hide/Disable email related options if the AIM Client is installed and compatible with latest version of herd.
         sbEmail.Visible := ( not(AIMClient.IsAnimalRegistrationCompatible()) );
         ToolButton4.Visible := ( not(AIMClient.IsAnimalRegistrationCompatible()) );
         Removecalffromregistration1.Visible := ( not(AIMClient.IsAnimalRegistrationCompatible()) );

         //sbEMail.Show;
         sbPrintNBAS10.Show;
         //ToolButton4.Show;
         lECount.Show;
         eECount.Show;
         Year := StrToInt(FormatDateTime('yyyy', Date));
         CheckNewEmailCount(StrToInt( Herd.Value ), Year);
         eECount.Text := IntToStr( GetEmailCount(StrToInt( Herd.Value )));
      end;
end;

procedure TfCalfRegFlt.CheckDamSireBreeds;
const
   MsgHeader = 'Invalid Breed Code!';
   BreedErrStr_1 = 'Calf record %s: %s breed code is missing';
   BreedErrStr_2 = 'Calf record %s contains an invalid %s Breed Code %s';

   function EmptyBreedCode(Str : String) : Boolean;
   begin
      Result := Length(Trim(Str)) <= 0;
   end;

   function UnKnownCode(Code : String) : Boolean;
   var x : Byte;
   begin
       Result := False;
       Code := Trim(Code);
       for x := Low(iBreedCodes) to High(iBreedCodes) do
          if (Code = iBreedCodes[x]) then
             begin
                Result := True;
                Break;
             end;
   end;

   { SP 11/03/2003 }

begin
   with MyTable do
      begin
         First;
         while not eof do
            begin
               if EmptyBreedCode(MyTable.FieldByName('CBreedCode').AsString) then
                  begin
                     Application.MessageBox(PChar(Format(BreedErrStr_1, [MyTable.FieldByName('NatIDNum').AsString, 'Calf', MyTable.FieldByName('CBreedCode').AsString])),
                                            PChar(MsgHeader), MB_OK + MB_ICONSTOP);
                     SysUtils.Abort;
                  end
               else if EmptyBreedCode(MyTable.FieldByName('DBreedCode').AsString) then
                  begin
                     Application.MessageBox(PChar(Format(BreedErrStr_1, [MyTable.FieldByName('NatIDNum').AsString, 'Dam', MyTable.FieldByName('DBreedCode').AsString])),
                                            PChar(MsgHeader), MB_OK + MB_ICONSTOP);
                     SysUtils.Abort;
                  end
               else if EmptyBreedCode(MyTable.FieldByName('SBreedCode').AsString) then
                  begin
                     Application.MessageBox(PChar(Format(BreedErrStr_1, [MyTable.FieldByName('NatIDNum').AsString, 'Sire', MyTable.FieldByName('SBreedCode').AsString])),
                                            PChar(MsgHeader), MB_OK + MB_ICONSTOP);
                     SysUtils.Abort;
                  end
               else
                  begin
                     if UPPERCASE(Trim(MyTable.FieldByName('CBreedCode').AsString)) = 'HO' then
                        begin
                           MyTable.Edit;
                           MyTable.FieldByName('CBreedCode').AsString := 'FR';
                           MyTable.Post;
                        end
                     else if UPPERCASE(Trim(MyTable.FieldByName('CBreedCode').AsString)) = 'HOX' then
                        begin
                           MyTable.Edit;
                           MyTable.FieldByName('CBreedCode').AsString := 'FRX';
                           MyTable.Post;
                        end
                     else if not UnKnownCode(MyTable.FieldByName('CBreedCode').AsString) then
                        begin
                           Application.MessageBox(PChar(Format(BreedErrStr_2, [MyTable.FieldByName('NatIDNum').AsString, 'Calf', MyTable.FieldByName('CBreedCode').AsString])), PChar(MsgHeader), MB_OK + MB_ICONSTOP);
                           SysUtils.Abort;
                        end;

                     if UPPERCASE(Trim(MyTable.FieldByName('DBreedCode').AsString)) = 'HO' then
                        begin
                           MyTable.Edit;
                           MyTable.FieldByName('DBreedCode').AsString := 'FR';
                           MyTable.Post;
                        end
                     else if UPPERCASE(Trim(MyTable.FieldByName('DBreedCode').AsString)) = 'HOX' then
                        begin
                           MyTable.Edit;
                           MyTable.FieldByName('DBreedCode').AsString := 'FRX';
                           MyTable.Post;
                        end
                     else if not UnKnownCode(MyTable.FieldByName('DBreedCode').AsString) then
                        begin
                           Application.MessageBox( PChar(Format(BreedErrStr_2, [MyTable.FieldByName('NatIDNum').AsString, 'Dam', MyTable.FieldByName('DBreedCode').AsString])), PChar(MsgHeader), MB_OK + MB_ICONSTOP);
                           SysUtils.Abort;
                        end;

                     if UPPERCASE(Trim(MyTable.FieldByName('SBreedCode').AsString))  = 'HO' then
                        begin
                           MyTable.Edit;
                           MyTable.FieldByName('SBreedCode').AsString := 'FR';
                           MyTable.Post;
                        end
                     else if UPPERCASE(Trim(MyTable.FieldByName('SBreedCode').AsString))  = 'HOX' then
                        begin
                           MyTable.Edit;
                           MyTable.FieldByName('SBreedCode').AsString := 'FRX';
                           MyTable.Post;
                        end
                     else if not UnKnownCode(MyTable.FieldByName('SBreedCode').AsString) then
                        begin
                           Application.MessageBox( PChar(Format(BreedErrStr_2, [MyTable.FieldByName('NatIDNum').AsString, 'Sire', MyTable.FieldByName('SBreedCode').AsString])), PChar(MsgHeader), MB_OK + MB_ICONSTOP);
                           SysUtils.Abort;
                        end;
                  end;
               Next;
            end;
      end;
end;

procedure TfCalfRegFlt.CheckValidNatIDs;

   function ForeignDam(NatID : String) : Boolean; { SP 10/02/2003 }
   begin
      { OK to decide if tag is foreign, the first two chars must be Alpha }
      { and total string length must be minimum 11 AlphaNumeric chars }
      Result := False;
      if Length(NatID) <= 10 then
         Exit;
      Result := (((NatID[1] in ['a'..'z', 'A'..'Z'])  and
                  (NatID[2] in ['a'..'z', 'A'..'Z'])) and (Length(NatID) >= 11));
   end;

var
   tNatID : String;
begin
   with MyTable do
      try
         First;
         DisableControls;
         while ( not(Eof) ) do
            begin
               if ( WhatStyleNatID(MyTable.FieldByName('NatIDNum').AsString, False) = StyleEID ) then
                  begin
                     if ( UpperCase(Copy(MyTable.FieldByName('NatIDNum').AsString, 1, 3)) <> '372' ) then
                        begin
                           tNatID := Trim(MyTable.FieldByName('NatIDNum').AsString);
                           tNatID := '372 '+tNatID;
                           Edit;
                           MyTable.FieldByName('NatIDNum').AsString := tNatID;
                           Post;
                        end;
                  end
               else if ( WhatStyleNatID(MyTable.FieldByName('NatIDNum').AsString, False) = Style1999 ) then
                  begin
                     if ( UpperCase(Copy(MyTable.FieldByName('NatIDNum').AsString, 1, 2)) <> 'IE' ) then
                        begin
                           tNatID := Trim(MyTable.FieldByName('NatIDNum').AsString);
                           tNatID := 'IE '+tNatID;
                           Edit;
                           MyTable.FieldByName('NatIDNum').AsString := tNatID;
                           Post;
                        end;
                  end
               else
                  raise Exception.CreateFmt('Invalid national identity tag format. '+#13#10+#13#10+
                                            'Calf National ID Number %s is not correct national identity tag format.',[MyTable.FieldByName('NatIDNum').AsString]);

               if ( WhatStyleNatID(MyTable.FieldByName('DamNatID').AsString, False) in [Style1999, Style1996] ) then
                  begin
                     if ( UpperCase(Copy(MyTable.FieldByName('DamNatID').AsString, 1, 2)) <> 'IE' ) then
                        begin
                          tNatID := Trim(MyTable.FieldByName('DamNatID').AsString);
                          tNatID := 'IE '+tNatID;
                          Edit;
                          MyTable.FieldByName('DamNatID').AsString := tNatID;
                          Post;
                        end;
                  end
               else if ( WhatStyleNatID(MyTable.FieldByName('DamNatID').AsString, False ) <> StylePre1996 ) then
                  if not ForeignDam(MyTable.FieldByName('DamNatID').AsString) then
                     raise Exception.CreateFmt('Dam National ID Number %s is incorrect.'+#13#10+
                                               'You can correct the National ID Number of the Dam'+#13#10+
                                               'in the Setup Animal Screen or remove calf record from the registration.',
                                               [MyTable.FieldByName('DamNatID').AsString]);
               Next;
            end;
      finally
         EnableControls;
      end;
end;

procedure TfCalfRegFlt.PostUpdates(EmailCount : string);
var
   LookupCalvings : TTable;
begin
   WinData.CreateTTable(LookupCalvings,nil,'',WinData.Calvings.TableName);
   LookupCalvings.Active := True;
   try
      HerdCountNum := HerdCountNum + 1;
      SetEmailCount(StrToInt(Herd.Value), HerdCountNum);
      with MyQuery do
         begin
            SQL.Clear;
            SQL.Add('UPDATE TempReg');
            SQL.Add('SET Notified=TRUE');
            ExecSQL;

            SQL.Clear;
            SQL.Add('SELECT * FROM TempReg');
            SQL.Add('WHERE Notified=TRUE');
            Open;
            First;
            while NOT EOF do
               begin
                  if LookUpCalvings.Locate('EventId',FieldByName('EventId').Value,[] ) then
                     begin
                        if ( LookUpCalvings.FieldByName('ID1').AsInteger = FieldByName('AnimalID').AsInteger ) then
                           begin
                               LookUpCalvings.Edit;
                               try
                                  LookUpCalvings.FieldByName('ID1Notified').AsBoolean := TRUE;
                                  LookUpCalvings.FieldByName('ID1Status').AsInteger := CalfReg_Status_Emailed;
                                  LookUpCalvings.FieldByName('ID1DATE').AsDateTime := Date;
                                  LookUpCalvings.FieldByName('ID1EMAILCOUNT').AsString := EmailCount;
                                  LookUpCalvings.Post;
                                  DbiSaveChanges(LookUpCalvings.Handle);
                               except
                                  LookUpCalvings.Cancel;
                                  MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                               end;
                           end
                        else if ( LookUpCalvings.FieldByName('ID2').AsInteger = FieldByName('AnimalID').AsInteger ) then
                           begin
                               LookUpCalvings.Edit;
                               try
                                  LookUpCalvings.FieldByName('ID2Notified').AsBoolean := TRUE;
                                  LookUpCalvings.FieldByName('ID2Status').AsInteger := CalfReg_Status_Emailed;
                                  LookUpCalvings.FieldByName('ID2DATE').AsDateTime := Date;
                                  LookUpCalvings.FieldByName('ID2EMAILCOUNT').AsString := EmailCount;
                                  LookUpCalvings.Post;
                                  DbiSaveChanges(LookUpCalvings.Handle);
                               except
                                  LookUpCalvings.Cancel;
                                  MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                               end;
                           end
                        else if ( LookUpCalvings.FieldByName('ID3').AsInteger = FieldByName('AnimalID').AsInteger ) then
                           begin
                               LookUpCalvings.Edit;
                               try
                                  LookUpCalvings.FieldByName('ID3Notified').AsBoolean := TRUE;
                                  LookUpCalvings.FieldByName('ID3Status').AsInteger := CalfReg_Status_Emailed;
                                  LookUpCalvings.FieldByName('ID3DATE').AsDateTime := Date;
                                  LookUpCalvings.FieldByName('ID3EMAILCOUNT').AsString := EmailCount;
                                  LookUpCalvings.Post;
                                  DbiSaveChanges(LookUpCalvings.Handle);
                               except
                                  LookUpCalvings.Cancel;
                                  MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                               end;
                           end
                        else if ( LookUpCalvings.FieldByName('ID4').AsInteger = FieldByName('AnimalID').AsInteger ) then
                           begin
                               LookUpCalvings.Edit;
                               try
                                  LookUpCalvings.FieldByName('ID4Notified').AsBoolean := TRUE;
                                  LookUpCalvings.FieldByName('ID4Status').AsInteger := CalfReg_Status_Emailed;
                                  LookUpCalvings.FieldByName('ID4DATE').AsDateTime := Date;
                                  LookUpCalvings.FieldByName('ID4EMAILCOUNT').AsString := EmailCount;
                                  LookUpCalvings.Post;
                                  DbiSaveChanges(LookUpCalvings.Handle);
                               except
                                  LookUpCalvings.Cancel;
                                  MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                               end;
                           end;
                     end;
                  Next;
               end;

         end;
         ClearRegisteredCalves;
   finally
      LookupCalvings.Active := False;
      FreeAndNil(LookUpCalvings);
   end;
end;

Function TfCalfRegFlt.StripPunctuation(StrToStrip: String ): String;
var
   i,
   LenOfStr : Integer;
   TempStr  : String;
begin
   TempStr := StrToStrip;
   LenOfStr := Length(TempStr);
   if (LenOfStr > 0) then
      for i := 1 to LenOfStr do
         if NOT (TempStr[i] IN ['A'..'Z','a'..'z','0'..'9']) then  //*** this creates a range check error for some unknown reason. ***
     // if TempStr[i] = ' ' then
          Delete(TempStr,i,1);
   Result := TempStr;
end;

Function TfCalfRegFlt.PadRight(Var St : String; Len : Integer): String;
begin
   while Length(St) < Len Do
      St := St + ' ';
   Result := St;
end;

function TfCalfRegFlt.CheckDigitCalc(Var St : String; LineNum : Integer): String;
var
   i : Integer;
   Sum : Integer;
   Product : Integer;
   ProdMod : Integer;
   Remainder : Integer;

begin

   // First remove any 'IE' and the NatID Check Digit
   if Copy( St, 1, 2 ) = 'IE' then
      begin
         St := Copy( St, 3, 7) + Copy( St, 11, 4);
      end
   else
      begin
         St := Copy( St, 1, 7) + Copy( St, 9, 4);
      end;

   // Now Calc Check Digit  - St contains 11 numerals.
   Sum := 0;

   For i := 1 to Length(St) do
      Begin
         //Check that the String is all numeric
         If ( NOT (St[i] IN ['0'..'9'] )) then
            Begin
               MessageDlg('A Calf has a National ID Number of the wrong format for this E-Mail facility', mtWarning, [mbOK], 0);
               SysUtils.Abort;    //Terminate processing.
            End;

         //Now multiply each digit with 1 or 2 and sum result.
         If ( i IN [1,3,5,7,9,11] ) then
            Sum := Sum + ( StrToInt( St[i] ))
         Else
            Sum := Sum + ( StrToInt( St[i] ) * 2 );
      End;

   //THe ASCII equivalent of the letter 'K' is 75
   Product := Sum * LineNum * 75;
   ProdMod := Trunc( Product / 26 );
   Remainder := Product - ( ProdMod * 26 );
   //Return ASCII equivalent of the remainder.
   case Remainder of
      0  : Result := 'A';
      1  : Result := 'B';
      2  : Result := 'C';
      3  : Result := 'D';
      4  : Result := 'E';
      5  : Result := 'F';
      6  : Result := 'G';
      7  : Result := 'H';
      8  : Result := 'I';
      9  : Result := 'J';
      10 : Result := 'K';
      11 : Result := 'L';
      12 : Result := 'M';
      13 : Result := 'N';
      14 : Result := 'O';
      15 : Result := 'P';
      16 : Result := 'Q';
      17 : Result := 'R';
      18 : Result := 'S';
      19 : Result := 'T';
      20 : Result := 'U';
      21 : Result := 'V';
      22 : Result := 'W';
      23 : Result := 'X';
      24 : Result := 'Y';
      25 : Result := 'Z';
   end //EndCase Remainder
End;

procedure TfCalfRegFlt.eECountExit(Sender: TObject);
var
   nCurrentEmailCount : Integer;
   nNewEmailCount : Integer;
begin
   // Need to check if the value has been changed.
   try
      nCurrentEmailCount := GetEmailCount(StrToInt( Herd.Value ));
      nNewEmailCount := StrToInt( eECount.Text );
      if ( nNewEmailCount <> nCurrentEmailCount ) then
         begin
            if ( nNewEmailCount < nCurrentEmailCount ) then
               begin
                  MessageDlg('The E-Mail Count must be strictly increasing between 1 and 999 every year for each Herd.', mtInformation, [mbOK], 0);
                  eECount.Text := IntToStr(nCurrentEmailCount);
               end
            else
               begin
                  If ( MessageDlg('Please confirm that you wish to update the E-Mail Count for this Herd to the value input.', mtConfirmation, [mbOK, mbCancel], 0 ) = mrOK ) then
                     SetEmailCount(StrToInt( Herd.Value ), nNewEmailCount )
                  else
                     eECount.Text := IntToStr(nCurrentEmailCount);
               end;
         end;
   except
      eECount.Text := IntToStr(nCurrentEmailCount);
      MessageDlg('Update failed - resetting email count',mtError,[mbOK],0);
   end;
end;

procedure TfCalfRegFlt.SendEmail;
var
   SMTPHost,
   SMTPID,
   Account,
   UserName,
   UserAddress : String;
   Reg : TRegistry;
   MailAdd : String;
   SendMailResult : Integer;
   EmailClient : string;
   FileName : string;

begin
   try
      sbExit.Enabled  := False;
      sbRemove.Enabled := False;
      sbPrint.Enabled  := False;
      sbViewForms.Enabled := False;
      sbEMail.Enabled := False;

      EmailClient := WinData.DefaultEmailClient;
      if EmailClient = cEmailClient_MS then
         begin


            MailAdd := 'ereg@sws.ie';
            if MAPIConnect then
               begin
                  try
                     // Clear the message
                     CalfRegMail.Clear;
                     // Use default Profile
                     CalfRegMail.UseDefProfile := True;
                     // Logon to MAPI
                     CalfRegMail.Logon;
                     // Check Email Add.
                     CalfRegMail.CheckRecipient(MailAdd);

                     // Clear Recipient stringlist
                     CalfRegMail.Recipient.Clear;
                     // Add email add
                     CalfRegMail.Recipient.Add(MailAdd);

                     // Clear Attachments
                     CalfRegMail.Attachment.Clear;
                     // If the calffile exists, attach the file.
                     if FileExists(CalfFile) then
                        CalfRegMail.Attachment.Add(CalfFile);

                     // Add the subject
                     CalfRegMail.Subject       := 'Calf Registration file';
                     // Add the Body
                     CalfRegMail.Text          := 'Please find enclosed Calf Registration files.';

                     // Send mail, wait for response back.
                     SendMailResult := CalfRegMail.SendMail;
                     if (SendMailResult = EMAIL_OK) then
                        begin
                           MessageSent := True;
                           MessageDlg('Calf Reg File has been sent to your default mail program. '+#13+
                                      'You should receive an email message from Bandon acknowledging '+#13+
                                      'that your Registration File(s) have been received.'+#13+
                                      'Typically you should receive a reply from bandon within 24 hours.'+#13+#13+
                                      'Please check your Outbox if you have not received this email receipt and '+#13+
                                      're-send the latest Calf Reg file(s), if necessary.',mtInformation,[mbOK],0);
                        end
                     else
                        begin
                           MessageSent := False;
                           MessageDlg('Message failed to send. Contact Kingswood. Error Code: ('+IntToStr(SendMailResult)+')',mtWarning,[mbOK],0);
                        end;
                     // Log off MAPI
                     CalfRegMail.Logoff;
                     // Clear the message
                     CalfRegMail.Clear;
                  except
                     Raise
                  end;
               end
            else
               begin
                  // show status panel & disable buttons
                  EMailMemo.Lines.Clear;
                  EMailMemo.Lines.Add('Please Wait ....');
                  EMailMemo.Lines.Add('');
                  ErrorMemo.Lines.Clear;

                  pEMail.Show;
                   // check registry for mail account details
                  try
                     Reg := TRegistry.Create;
                     Reg.RootKey := HKEY_USERS;
                     // get Default Mail Account First
                     if (Reg.OpenKey('.DEFAULT\Software\Microsoft\Internet Account Manager',False)) then
                        Account := Reg.ReadString('Default Mail Account');
                     Reg.CloseKey;
                     // get Account Details
                     if (Reg.OpenKey(('.DEFAULT\Software\Microsoft\Internet Account Manager\Accounts\'+Account+''),False)) then
                        begin
                           SMTPHost    := Reg.ReadString('SMTP Server');
                           SMTPID      := Reg.ReadString('POP3 User Name');
                           UserName    := Reg.ReadString('SMTP Display Name');
                           UserAddress := Reg.ReadString('SMTP EMail Address');
                        end;
                     Reg.CloseKey;
                  except
                     ErrorMemo.Lines.Add('A Default E-Mail program is not installed or cannot be found.');
                     EMailMemo.Lines.Add('Operation cancelled.');
                     Exit;
                     //Abort;
                  end;

                  // Open e-mail and attach files
                  with MailSender do
                     try
                        Host   := SMTPHost;
                        UserID := SMTPID;
                        EMailMemo.Lines.Add('Connecting ....');
                        if (NOT Connected) then
                           try
                              Connect;
                           except
                              ErrorMemo.Lines.Add('A connection to the internet could not be established.');
                              EMailMemo.Lines.Add('Please check your Modem and telephone line and try again.');
                              EMailMemo.Lines.Add('Please ring Kingswood, or send the following files through your e-mail program');
                              EMailMemo.Lines.Add(CalfFile);
                              EMailMemo.Lines.Add('To: ereg@sws.ie');
                              Exit;
                              //Abort;
                           end;

                        if Connected then
                           begin
                              ClearParams := True;
                              SubType     := mtPlain;
                              with PostMessage do
                                 begin
                                    FromAddress := UserAddress;
                                    FromName    := UserName;
                                    ReplyTo     := UserAddress;
                                    Body.Text   := 'Please find enclosed Calf Registration files.';
                                    if (CalfFile <> '') then
                                       Attachments.Text := CalfFile;
                                    Subject     := 'Calf Registration file';
                                    Date        := FormatDateTime('dd/mm/yyyy',Now());
                                 end;
                              SendMail;
                           end;
                     finally
                        EMailMemo.Lines.Add('Disconnecting ...');
                        if MailSender.Connected then
                           Disconnect;
                     end;
               end;
         end
      else if EmailClient = cEmailClient_GMail then
         begin
            Update;
            bConnected := IsNetConnected;
            if not bConnected then
              ShowConnectForm(bConnected);

            if bConnected then
               begin
                 SetCurrentDir(ApplicationPath);
                 if FileExists( IncludeTrailingBackslash(ApplicationPath)+ KingswoodMailBoxDLL) then
                    begin
                       DLLHandle := LoadLibrary(KingswoodMailBoxDLL);
                       if DLLHandle <> 0 then
                          begin
                             FileName := ExtractFileName( CalfFile );
                             try
                               @SendMail := GetProcAddress(DLLHandle, 'SendMail');
                               if @SendMail <> nil then
                                  begin
                                     SendMailResult := SendMail(cCalfRegEmail, '', PChar(FileName),False);
                                     case SendMailResult of
                                       -1 : MessageDlg(cEMailSendError_1,mtError,[mbOK],0);
                                        0 : begin
                                               MessageSent := True;
                                               MessageDlg('Calf Registration email successfully sent.',mtInformation,[mbOK],0);
                                               MessageDlg('You should receive an email message from Bandon acknowledging'+#13+
                                                          'that your Registration File(s) have been received.'+cCRLF+
                                                          'You must check the Kingswood Mail Box for any receipts from Bandon.'+cCRLF+
                                                          'Typically you should receive a reply from bandon within 24 hours.',mtInformation,[mbOK],0);

                                            end;
                                        1 : MessageDlg(cEMailSendError_2,mtError,[mbOK],0);
                                        2,4 : MessageDlg(cEMailSendError_3,mtError,[mbOK],0);
                                        3 : MessageDlg(cEMailSendError_4,mtError,[mbOK],0);
                                     end;
                                  end
                               else
                                  MessageDlg(Format(cKingswoodMailBoxDLLCallToFunctionFailed,['SendMail']),mtError,[mbOk],0);

                             finally
                                FreeLibrary(DLLHandle);
                             end;
                          end
                       else
                          MessageDlg(cKingswoodMailBoxDLLUnableToLoad,mtError,[mbOk],0);
                    end
                 else
                    MessageDlg(cKingswoodMailBoxDLLNotFound,mtError,[mbOk],0);
               end
            else
               MessageDlg(cINTERNET_CONNECTION_NOT_ESTABLISHED,mtError,[mbOK],0);

         end;
   finally
      pEMail.Hide;
      sbExit.Enabled  := True;
      sbRemove.Enabled := True;
      sbPrint.Enabled  := True;
      sbViewForms.Enabled := True;
      sbEMail.Enabled := False;
   end;
end;

procedure TfCalfRegFlt.sbCancelClick(Sender: TObject);
begin
   // Cancel MailSender
   if MailSender.Connected then
      MailSender.Disconnect;
   pEMail.Hide;
   sbExit.Enabled  := True;
   sbRemove.Enabled := True;
   sbPrint.Enabled  := True;
   sbViewForms.Enabled := True;
   sbEMail.Enabled := False;
end;

procedure TfCalfRegFlt.MailSenderAttachmentNotFound(Filename: String);
begin
   ErrorMemo.Lines.Add('Attachment Not Found.');
   EMailMemo.Lines.Add('Operation cancelled.');
end;

procedure TfCalfRegFlt.MailSenderConnectionFailed(Sender: TObject);
begin
   ErrorMemo.Lines.Add('A connection to the internet could not be established.');
   EMailMemo.Lines.Add('Operation cancelled.');
end;

procedure TfCalfRegFlt.MailSenderFailure(Sender: TObject);
begin
   ErrorMemo.Lines.Add('Message sending failed.');
   EMailMemo.Lines.Add('Operation cancelled. Please Try Again.');
   EMailMemo.Lines.Add('If this persists, send the following files through your e-mail program');
   EMailMemo.Lines.Add(CalfFile);
   EMailMemo.Lines.Add('To: ereg@sws.ie');
end;

procedure TfCalfRegFlt.MailSenderSendStart(Sender: TObject);
begin
   EMailMemo.Lines.Add('Sending message ...');
end;

procedure TfCalfRegFlt.MailSenderSuccess(Sender: TObject);
begin
   EMailMemo.Lines.Add('Message Sent.');
   MessageSent := TRUE;
   MailSender.Disconnect;
end;

procedure TfCalfRegFlt.MailSenderInvalidHost(var Handled: Boolean);
begin
   ErrorMemo.Lines.Add('Invalid Host Server.');
   EMailMemo.Lines.Add('Operation cancelled. Check E-mail settings.');
end;

procedure TfCalfRegFlt.MailSenderRecipientNotFound(Recipient: String);
begin
   ErrorMemo.Lines.Add('Destination Address not found.');
   EMailMemo.Lines.Add('Operation cancelled. If this problem persists, contact Kingswood.');
end;

procedure TfCalfRegFlt.MailSenderAuthenticationFailed(var Handled: Boolean);
begin
   ErrorMemo.Lines.Add('Invalid User ID.');
   EMailMemo.Lines.Add('Operation cancelled. Check E-mail settings');
end;

procedure TfCalfRegFlt.MailSenderConnect(Sender: TObject);
begin
   EMailMemo.Lines.Add('Connection established.');
end;

procedure TfCalfRegFlt.MailSenderDisconnect(Sender: TObject);
begin
   //
end;

procedure TfCalfRegFlt.MailSenderHostResolved(Sender: TComponent);
begin
   EMailMemo.Lines.Add('Host Server found.');
end;

procedure TfCalfRegFlt.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('calfreg.htm');
end;

procedure TfCalfRegFlt.FormShow(Sender: TObject);
begin
   if CalfRegMail.MapiAvail then
      MAPIConnect := True
   else
      MAPIConnect := False;

   if WhichReg <> Ireland then
      begin
         sbEMail.Hide;
         sbPrintNBAS10.Hide;
         ToolButton4.Hide;
         lECount.Hide;
         eECount.Hide;
      end
   else
      begin
         // 08/08/2013 - V5.1 R9.0 /SP
         // Hide/Disable email related options if the AIM Client is installed and compatible with latest version of herd.
         if (AIMClient.IsAnimalRegistrationCompatible()) then
            begin
               sbEmail.Visible := False;
               ToolButton4.Visible := False;
               Removecalffromregistration1.Visible := False;
            end
         else
            begin
               sbEmail.Visible := True;
               ToolButton4.Visible := True;
               Removecalffromregistration1.Visible := True;
            end;

         //sbEMail.Show;
         sbPrintNBAS10.Show;
         //ToolButton4.Show;
         lECount.Show;
         eECount.Show;
         Year := StrToInt(FormatDateTime('yyyy', Date));
         CheckNewEmailCount(StrToInt( Herd.Value ), Year);
         eECount.Text := IntToStr( GetEmailCount(StrToInt( Herd.Value )));
      end;
   Application.ProcessMessages;




   FormLoaded := True;
   Timer1.Enabled := True; // This calls the build table procedure
end;

procedure TfCalfRegFlt.CalfGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F2 then
      if MAPIConnect then
         begin
            ShowMessage('SMTP Connect');
            MAPIConnect := False;
         end
      else
         begin
            ShowMessage('MAPI Connect');
            MAPIConnect := True;
         end;
end;

procedure TfCalfRegFlt.BlankCaptions;
begin
   with fmCalfRegNIBirthsDeaths do
      begin
    qrNatID1.Caption := '';
    qrNatID2.Caption := '';
    qrNatID3.Caption := '';
    qrNatID4.Caption := '';
    qrNatID5.Caption := '';
    qrNatID6.Caption := '';
    qrNatID7.Caption := '';
    qrNatID8.Caption := '';
    qrNatID9.Caption := '';
    qrNatID10.Caption := '';
    qrNatID11.Caption := '';
    qrNatID12.Caption := '';

    qrColor1.Caption := '';
    qrColor2.Caption := '';
    qrColor3.Caption := '';
    qrColor4.Caption := '';
    qrColor5.Caption := '';
    qrColor6.Caption := '';
    qrColor7.Caption := '';
    qrColor8.Caption := '';
    qrColor9.Caption := '';
    qrColor10.Caption := '';
    qrColor11.Caption := '';
    qrColor12.Caption := '';

    qrBreed1.Caption := '';
    qrBreed2.Caption := '';
    qrBreed3.Caption := '';
    qrBreed4.Caption := '';
    qrBreed5.Caption := '';
    qrBreed6.Caption := '';
    qrBreed7.Caption := '';
    qrBreed8.Caption := '';
    qrBreed9.Caption := '';
    qrBreed10.Caption := '';
    qrBreed11.Caption := '';
    qrBreed12.Caption := '';

    qrSex1.Caption := '';
    qrSex2.Caption := '';
    qrSex3.Caption := '';
    qrSex4.Caption := '';
    qrSex5.Caption := '';
    qrSex6.Caption := '';
    qrSex7.Caption := '';
    qrSex8.Caption := '';
    qrSex9.Caption := '';
    qrSex10.Caption := '';
    qrSex11.Caption := '';
    qrSex12.Caption := '';

    qrDOB1.Caption := '';
    qrDOB2.Caption := '';
    qrDOB3.Caption := '';
    qrDOB4.Caption := '';
    qrDOB5.Caption := '';
    qrDOB6.Caption := '';
    qrDOB7.Caption := '';
    qrDOB8.Caption := '';
    qrDOB9.Caption := '';
    qrDOB10.Caption := '';
    qrDOB11.Caption := '';
    qrDOB12.Caption := '';

    qrDam1.Caption := '';
    qrDam2.Caption := '';
    qrDam3.Caption := '';
    qrDam4.Caption := '';
    qrDam5.Caption := '';
    qrDam6.Caption := '';
    qrDam7.Caption := '';
    qrDam8.Caption := '';
    qrDam9.Caption := '';
    qrDam10.Caption := '';
    qrDam11.Caption := '';
    qrDam12.Caption := '';

    qrdNatID1.Caption := '';
    qrdNatID2.Caption := '';
    qrdNatID3.Caption := '';
    qrdNatID4.Caption := '';
    qrdNatID5.Caption := '';
    qrdNatID6.Caption := '';
    qrdNatID7.Caption := '';
    qrdNatID8.Caption := '';
    qrdNatID9.Caption := '';
    qrdNatID10.Caption := '';
    qrdNatID11.Caption := '';
    qrdNatID12.Caption := '';

    qrdColor1.Caption := '';
    qrdColor2.Caption := '';
    qrdColor3.Caption := '';
    qrdColor4.Caption := '';
    qrdColor5.Caption := '';
    qrdColor6.Caption := '';
    qrdColor7.Caption := '';
    qrdColor8.Caption := '';
    qrdColor9.Caption := '';
    qrdColor10.Caption := '';
    qrdColor11.Caption := '';
    qrdColor12.Caption := '';

    qrdBreed11.Caption := '';
    qrdBreed10.Caption := '';
    qrdBreed9.Caption := '';
    qrdBreed8.Caption := '';
    qrdBreed7.Caption := '';
    qrdBreed6.Caption := '';
    qrdBreed5.Caption := '';
    qrdBreed4.Caption := '';
    qrdBreed3.Caption := '';
    qrdBreed2.Caption := '';
    qrdBreed1.Caption := '';
    qrdBreed12.Caption := '';

    qrdSex1.Caption := '';
    qrdSex2.Caption := '';
    qrdSex3.Caption := '';
    qrdSex4.Caption := '';
    qrdSex5.Caption := '';
    qrdSex6.Caption := '';
    qrdSex7.Caption := '';
    qrdSex8.Caption := '';
    qrdSex9.Caption := '';
    qrdSex10.Caption := '';
    qrdSex11.Caption := '';
    qrdSex12.Caption := '';

    qrDeathDate1.Caption := '';
    qrDeathDate2.Caption := '';
    qrDeathDate3.Caption := '';
    qrDeathDate4.Caption := '';
    qrDeathDate5.Caption := '';
    qrDeathDate6.Caption := '';
    qrDeathDate7.Caption := '';
    qrDeathDate8.Caption := '';
    qrDeathDate9.Caption := '';
    qrDeathDate10.Caption := '';
    qrDeathDate11.Caption := '';
    qrDeathDate12.Caption := '';

    qrCustName1.Caption := '';
    qrCustName2.Caption := '';
    qrCustName3.Caption := '';
    qrCustName4.Caption := '';
    qrCustName5.Caption := '';
    qrCustName6.Caption := '';
    qrCustName7.Caption := '';
    qrCustName8.Caption := '';
    qrCustName9.Caption := '';
    qrCustName10.Caption := '';
    qrCustName11.Caption := '';
    qrCustName12.Caption := '';
    end;
end;


procedure TfCalfRegFlt.qrSex1Print(sender: TObject; var Value: String);
begin
   if UpperCase(Value) = 'STEER' then
      Value := 'Male'
   else if UpperCase(Value) <> 'FEMALE' then
      Value := 'Bull'
end;

procedure TfCalfRegFlt.RegisterAnimal(Sender : TDataset);
var
   i : Integer;
begin
   if TempRemove then
      begin
         NoCalves.Text := IntToStr( MyTable.RecordCount );
         Exit;
      end;
   try
      if ( CalfGrid.SelectedRows <> nil ) then
         RemoveAllSelectedRows(True);
   finally
      NoCalves.Text := IntToStr( MyTable.RecordCount );
   end;
end;

procedure TfCalfRegFlt.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := False;
   BuildTable;
end;

procedure TfCalfRegFlt.Removecalffromregistration1Click(Sender: TObject);
begin
   bRemoveClick(nil);
end;

procedure TfCalfRegFlt.RemoveCalfpermanently1Click(Sender: TObject);
begin
   RegisterAnimal(nil);
end;

procedure TfCalfRegFlt.UpdateRegistered1Click(Sender: TObject);
begin
   ViewCalves(False);
end;

procedure TfCalfRegFlt.ViewRegisteredCalves1Click(Sender: TObject);
begin
   ViewCalves(True);
end;

procedure TfCalfRegFlt.ViewCalves(QuickReport: Boolean);
begin
   WinData.CreateAndShowForm(TfmCalfRegReview);
end;

procedure TfCalfRegFlt.RxSpeedButton1Click(Sender: TObject);
begin
   ViewCalves(False);
   BuildTable;
end;

procedure TfCalfRegFlt.sbEmailClick(Sender: TObject);
Var
   ItemCount : Integer;
   LineCount : Integer;
   CalfReg : TextFile;
   HerdCount : String;
   CalfNatID : String;
   FileName : String;
   //EMailDir : String;
   Buffer : String;
   TempStr : String;
   FieldToFile : String;
   FarmCode  : String;
   HerdIdentifier : String;
   i : Integer;
   Result : Boolean;
begin
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;

   //Procedure to produce email file for Republic Of Ireland only.   KVB 18/04/2001

   //First check that only a single herd is selected.
   If (( Herd.Value = IntToStr(WinData.NONEHerdID) ) OR ( Herd.Value = '0' )) then
      Begin
         MessageDlg('Please select a Herd', mtInformation, [mbOK], 0 );
         Exit;
      End;

   //Now check that there is data to e processed
   If MyTable.IsEmpty then
      Begin
         raise errormsg.createfmt('There are no records to be processed',[nil]);
         exit;
      End;

   // Check Sire and Dam breed codes exist.
   CheckDamSireBreeds;
   // Check Calf and Dam NatID's are valid.
   CheckValidNatIDs;


   //Now check that all details are correct
   if application.messagebox('Are all the details correct?','Check',mb_yesno) <> IdYes then
      exit;

   //Now to get the HerdIdentifier
   MyQuery.SQL.Clear;
   MyQuery.SQL.Add('SELECT HerdIdentity, HerdIdentifier FROM Owners');
   MyQuery.SQL.Add('Where (ID = ' + Herd.Value + ')' );
   MyQuery.Open;
   MyQuery.First;

   HerdIdentifier := (MyQuery.FieldByName('HerdIdentifier').AsString);
   if Length(HerdIdentifier) <> 7 then
      begin
         MessageDlg('Your Herd Identifier '+HerdIdentifier+' is not valid. '+#13+
                    'Please use a 7 digit number without spaces or separators',mtError,[mbOK],0);
         if WinData.OwnerFile.Locate('ID',Herd.Value,[]) then
            uHerdSetUp.ShowTheForm(FALSE);
         SysUtils.Abort;
      end
   else
      begin
         Result := True;
         for i := 1 to Length(HerdIdentifier) do
            begin
               if NOT (HerdIdentifier[i] IN (['0'..'9'])) then
                  begin
                     Result := False;
                     MessageDlg('Your Herd Identifier '+HerdIdentifier+' is not valid. '+#13+
                                'Please use a 7 digit number without spaces or separators',mtError,[mbOK],0);
                     if WinData.OwnerFile.Locate('ID',Herd.Value,[]) then
                        uHerdSetUp.ShowTheForm(FALSE);
                     SysUtils.Abort;
                  end;
            end;
      end;
   if Result then
      FarmCode := HerdIdentifier
   else
      begin
         MessageDlg('Unable to create calf registration file, contact Kingswood',mtError,[mbOK],0);
         Exit;
      end;

   //Now get HerdCount and format to three digits
   HerdCountNum := GetEmailCount(StrToInt(Herd.Value)); //MyQuery.FieldByName('EMailCount').AsInteger;
   If HerdCountNum < 10 then
      HerdCount := '00' + IntToStr(HerdCountNum)
   Else If HerdCountNum < 100 then
      HerdCount := '0' + IntToStr(HerdCountNum)
   Else If HerdCountNum < 1000 then
      HerdCount := IntToStr(HerdCountNum)
   Else
      Begin
         MessageDlg('You have exceeded your 999 allocated E-Mail Calf Registrations for this Herd ', mtWarning, [mbOK], 0);
         Exit;
      End;

   //Now generate FileName of the Format 'K1410004025.ncr' where 1410004 is the Herd Identifier, 025 is the count and K is Kingswood's Package Provider.
   FileName := 'K' + FarmCode + HerdCount + '.ncr';

   //First ensure that directory exists
   try
      EMailDir := '';
      SetCurrentDir(ExtractFilePath(ParamStr(0)));
      EMailDir := ExtractFilePath(ParamStr(0)) + 'Calf Registration EMails';
      mkDir(EMailDir);
   except
      // Directory already exists
   end;

   Try

   //Now to create EMail file
   NumBirthRecs := 0;
   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT T.AnimalID, T.AnimalNo, T.NatIDNum, T.SortNatID, T.Sex, T.DateOfBirth, T.DamNatID, DamID, T.SCode, T.SBreedCode, A.DonorDamID, T.ComplianceCert, T.CalfDead '); // SP SireInHerd removed
         SQL.Add('FROM TempReg T, Animals A');
         SQL.Add('WHERE ( T.AnimalID = A.ID )');
         SQL.Add('ORDER BY SortNatId, AnimalNo');
         Open;
      end;

      try
         // Create File for sending
         CalfFile := (EMailDir + '\' + FileName);
         //CalfFile := EMailDir;
         AssignFile( CalfReg, CalfFile );
         ReWrite(CalfReg);

         //Now to fill EMail file
         MyQuery.First;
         LineCount := 1;
         While ( Not MyQuery.EOF ) do
            Begin
               ItemCount := 1;
               Buffer := '';
               // Use qGeneticDam/qGeneticDamBreed to get either the dams breed or the donor dams breed KB forgot about the Dam
               // and just got the donor dams breed.


               qDam.Sql.Clear;
               qDam.Sql.Add('SELECT * FROM Animals A');
               qDam.SQL.Add('WHERE (A.ID = ' + MyQuery.FieldByName('DamID').AsString + ')');
               qDam.Open;


               if MyQuery.FieldByName('DonorDamID').AsInteger > 0 then
                  begin
                     qGeneticDam.SQL.Clear;
                     qGeneticDam.SQL.Add('SELECT * FROM Animals A');
                     qGeneticDam.SQL.Add('WHERE (A.ID = ' + MyQuery.FieldByName('DonorDamID').AsString + ')');
                     qGeneticDam.Open;
                  end;

               qGeneticDamBreed.SQL.Clear;
               qGeneticDamBreed.SQL.Add('SELECT * FROM Breeds');    // Only get the gen dams breed from here, but use GenQuery for gen dams DamNatID
               if MyQuery.FieldByName('DonorDamID').AsInteger > 0 then
                  begin
                     if qGeneticDam.FieldByName('PrimaryBreed').AsInteger <= 0 then { 13/09/02 SP - }
                         ErrorMsg.CreateFmt('Cannot proceed, Donor Dam Breed is missing for calf %s',[MyQuery.FieldByName('AnimalNo').AsString])
                     else
                        qGeneticDamBreed.SQL.Add('WHERE ID = ' + qGeneticDam.FieldByName('PrimaryBreed').AsString + '')
                  end
               else
                  qGeneticDamBreed.SQL.Add('WHERE ID = ' + qDam.FieldByName('PrimaryBreed').AsString + '');
               qGeneticDamBreed.Open;

               while (ItemCount <= 12) do
                  begin
                     FieldToFile := '';
                     Case ItemCount of
                        1  :  Begin      //Calf National ID Num - 14 Chars
                                 CalfNatID := StripPunctuation( UpperCase(  MyQuery.FieldByName('NatIDNum').AsString ));
                                 FieldToFile := PadRight( CalfNatID, 14);
                              End;
                        2  :  Begin    //Calf Sex = M/F - 1 Char
                                 If ( UpperCase( MyQuery.FieldByName('Sex').AsString ) = 'FEMALE' ) then
                                    FieldToFile := 'F'
                                 Else
                                    FieldToFile := 'M';
                              End;
                        3  :  Begin    //Calf DOB - 8 Chars
                                 FieldToFile := FormatDateTime( 'yyymmdd', MyQuery.FieldByName('DateOfBirth').AsDateTime )
                              End;
                        4  :  Begin    // Dam's Breed Code Gen/Donor - 3 Chars
                                 TempStr := Copy( UpperCase( qGeneticDamBreed.FieldByName('Code').AsString ), 1, 3 );
                                 TempStr := Trim(TempStr);

                                 // SP 26/02/2004
                                 // For purposes of Bandon Reg, "HO" Holstein becomes "FR" Holstein Friesian
                                 // If Tempstr = "HO", replace with "FR"
                                 if TempStr = 'HO' then
                                    TempStr := 'FR'
                                 else if TempStr = 'HOX' then
                                    TempStr := 'FRX';
                                 // SP 26/02/2004

                                 FieldToFile :=  PadRight( TempStr, 3 );
                              End;
                        5  :  Begin    //Recipient Dam National ID Number
                                 if StrToInt(MyQuery.FieldByName('DamID').AsString) > 0 then
                                    begin
                                       TempStr := StripPunctuation( UpperCase(MyQuery.FieldByName('DamNatID').AsString));
                                       FieldToFile := PadRight( TempStr, 14);
                                    end;
                              End;
                        6  :  Begin    //Genetic Dam National ID Number  - 20 Chars
                                 If MyQuery.FieldByName('DonorDamID').AsInteger > 0 then
                                    begin
                                       TempStr := StripPunctuation( UpperCase(qGeneticDam.FieldByName('NatIDNum').AsString));
                                       FieldToFile := PadRight( TempStr, 20);
                                    end
                                 else
                                    FieldToFile := '                    '; // Pad 20 blank chars, only do this for non-mandatory fields
                              End;
                        7  :  Begin    //Sire Breed Code  - 3 Chars
                                 TempStr := Copy( UpperCase( MyQuery.FieldByName('SBreedCode').AsString ), 1, 3 );
                                 if TempStr = 'HO' then
                                    TempStr := 'FR'
                                 else if TempStr = 'HOX' then
                                    TempStr := 'FRX';
                                 FieldToFile :=  PadRight( TempStr, 3 );
                              End;
                        8  :  Begin    //Sire AI Code   - 4 Chars          // SP Inherd Boolean removed, just check the bull is in none herd, which is done on line 547
                                 if Length(MyQuery.FieldByName('SCode').AsString) > 0 then
                                    begin
                                       TempStr := Copy( UpperCase( MyQuery.FieldByName('SCode').AsString ), 1, 4 );
                                       FieldToFile := PadRight( TempStr, 4 );
                                    end
                                 else
                                    FieldToFile := '    ';  //Pad 4 blank chars only do this for non-mandatory fields
                              End;
                        9  :  Begin    //Check Digit   - 1 Char
                                 FieldToFile := CheckDigitCalc(CalfNatID, LineCount);
                              End;
                        10 :  Begin    //Package Provider  - 1 Char
                                 FieldToFile := 'K';
                              End;
                        11 : begin
                                 // SP REL V4.0 R0.7 13/1/10 Introduction of Dead Calf Notifier
                                 // If Value = 'Y' user will receive back a form to accompany the dead animal to the Knackery.
                                 // if Value = 'N' the user will receive back a passport card.

                                 if MyQuery.FieldByName('CalfDead').AsBoolean then
                                    FieldToFile := 'Y'
                                 else
                                    FieldToFile := 'N';
                              end;
                        12 :  begin
                                 if MyQuery.FieldByName('ComplianceCert').AsBoolean then
                                    FieldToFile := 'Y'
                                 else
                                    FieldToFile := 'N';
                              end;

                     End;  //EndCase ItemCount

                     // Add to buffer
                     Buffer := Buffer + FieldToFile;
                     Inc(ItemCount);

                  End;  //EndWhile (ItemCount <= 10)

               WriteLn(CalfReg,Buffer);
               MyQuery.Next;
               LineCount := LineCount + 1;
            End;  //EndWhile ( Not MyQuery.EOF )

            CloseFile(CalfReg);
            //Now to check whether to send the E-Mail
            If ( MessageDlg('Do you wish to E-Mail the created file now?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
               begin
                  SendEmail;
               end;

            if NOT(MessageSent) then
               begin
                  if MessageDlg('E-mail failed to send, do you wish to send it manually.',mtWarning,[mbYes,mbNo],0) = idYes then
                     begin
                        Cursor := crHourGlass;
                        PostUpdates(HerdCount);
                        Cursor := crDefault;
                        MessageDlg('Please do not forget to send the created file ' + FileName + ' located in ' + EMailDir + '\ to: ereg@sws.ie using your email programme.',mtWarning, [mbOK], 0 );
                     end
                  else
                     begin
                        DeleteFile(CalfFile);
                     end;
               end
            else
               begin
                  PostUpdates(HerdCount);
               end;
      except
         CloseFile(CalfReg);
      end;
   Finally
   End;
end;

procedure TfCalfRegFlt.sbPrintNBAS10Click(Sender: TObject);
begin
   if Herd.KeyValue > 0 then
      TNBAS10Print.PrintNBAS10(Herd.KeyValue);
end;

function TfCalfRegFlt.GetEmailCount(const AHerdID: Integer): Integer;
// 04/02/2009 [Dev V3.9 R6.0] /SP Program Improvement -
var
   OwnersEmailCount : Integer;
   RegistryEmailCount : Integer;
   DoUpdate : Boolean;
begin
   Result := 0;
   HerdLookup.HerdOwnerData.HerdID := AHerdID;
   OwnersEmailCount := HerdLookup.HerdOwnerData.EmailCount;
   GetRegValue(Reg_DefaultPath + 'Calf Reg\' + DataDir + '\' + HerdLookup.HerdOwnerData.HerdIdentity, 'EmailCount', RegistryEmailCount );

   DoUpdate := RegistryEmailCount<>OwnersEmailCount;
   if DoUpdate then
      begin
         if RegistryEmailCount > OwnersEmailCount then
            Result := RegistryEmailCount + 10
         else if OwnersEmailCount > RegistryEmailCount then
            Result := OwnersEmailCount + 10;

         SetEmailCount(AHerdID, Result);
         GetEmailCount(AHerdID);
      end
   else
      Result := RegistryEmailCount;

   if Result <= 0 then
      Result := 1
   else if ( Result > 750 ) and ( Result <= 999 ) then
      MessageDlg(Format('You have "%d" calf registration attempts remaining this year "%d".'+cCRLF+
                        'If you suspect the number of remaining attempts might be incorrect, '+cCRLF+
                        'please contact Kingswood Computing for assistance.',[1000-Result,Year]),mtWarning,[mbOK],0);
end;

procedure TfCalfRegFlt.SetEmailCount(const AHerdID, AEmailCount : Integer);
begin
   HerdLookup.HerdOwnerData.HerdID := AHerdID;
   SetRegValue(Reg_DefaultPath + 'Calf Reg\' + DataDir + '\' + HerdLookup.HerdOwnerData.HerdIdentity, 'EmailCount', AEmailCount);
   HerdLookup.HerdOwnerData.EmailCount := AEmailCount;
end;

procedure TfCalfRegFlt.CheckNewEmailCount(const AHerdID, AYear : Integer);
var
   nEmailCount, nStoredYear : Integer;
begin
   // 08/08/2013 - V5.1 R9.0 /SP
   // Hide/Disable email related options if the AIM Client is installed and compatible with latest version of herd.
   if (AIMClient.IsAnimalRegistrationCompatible()) then Exit;

   HerdLookup.HerdOwnerData.HerdID := AHerdID;
   GetRegValue(Reg_DefaultPath + 'Calf Reg\' + DataDir + '\' + HerdLookup.HerdOwnerData.HerdIdentity, 'EmailCount', nEmailCount);
   if (nEmailCount <= 0) then
      begin
         SetEmailCount(AHerdID, HerdLookup.HerdOwnerData.EmailCount);
      end;

   GetRegValue(Reg_DefaultPath + 'Calf Reg\' + DataDir + '\' + HerdLookup.HerdOwnerData.HerdIdentity, 'EmailYear', nStoredYear);
   if (nStoredYear <= 0) then
      begin
         nStoredYear := HerdLookup.HerdOwnerData.EmailYear;
         SetRegValue(Reg_DefaultPath + 'Calf Reg\' + DataDir + '\' + HerdLookup.HerdOwnerData.HerdIdentity, 'EmailYear', nStoredYear);
      end;

   if Year = nStoredYear then
      begin
         sbEMail.Enabled := True;
         eECount.Text := IntToStr(nEmailCount);
      end
   else
      begin
         // StoredYear is different for current year, a reset of the EmailCount and StoredYear will be done.
         SetRegValue(Reg_DefaultPath + 'Calf Reg\' + DataDir + '\' + HerdLookup.HerdOwnerData.HerdIdentity, 'EmailYear', Year);
         HerdLookup.HerdOwnerData.EmailYear := Year;
         SetEmailCount(AHerdID, 1);
         sbEMail.Enabled := True;
         eECount.Text := IntToStr(GetEmailCount(AHerdID));
         MessageDlg('Start of new calf registration email year. The email count has been reset.',mtInformation,[mbOK],0);
      end;
end;

procedure TfCalfRegFlt.ClearRegisteredCalves;
begin
   // Clear off registered calves.
   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM TempReg');
         ExecSQL;

         CalfGrid.DataSource.DataSet.Refresh;
      end;

end;

procedure TfCalfRegFlt.MyTableCalfDeadOnGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   if MyTable.FieldByName('CalfDead').AsBoolean then
      begin
         Text := 'Yes';
      end
   else
      begin
         Text := 'No';
      end;
end;

procedure TfCalfRegFlt.RemoveAllFromRegClick(Sender: TObject);
begin
   if ( CalfGrid.DataSource.DataSet.RecordCount = 0 ) then
      begin
         MessageDlg('No calves to remove.',mtError,[mbOK],0);
         Exit;
      end;

   if ( MessageDlg('Are you sure you want to remove these calves from the registration list.',mtConfirmation,[mbYes, mbNo],0) = idNo ) then Exit;

   try
      SelectAllRows;
      RemoveAllSelectedRows(False);
   finally
      NoCalves.Text := IntToStr( MyTable.RecordCount );
   end;
end;

procedure TfCalfRegFlt.RegisterCalf(AEventID, ACalfID : Integer; const AShowWarning : Boolean = True);
var
   bFound : Boolean;
   LookupCalvings : TTable;
   i : Integer;
begin
   WinData.CreateTTable(LookupCalvings, nil, '', WinData.Calvings.TableName);
   LookupCalvings.Active := True;
   try
      //   04/02/19 [V5.8 R6.6] /MK Change - Change warning to be more up-to-date with AIM registrations - GL request.
      if ( AShowWarning ) and
         ( MessageDlg('WARNING:-'+#13#10+
                      'You are about to permanently remove this calf "'+ MyTable.FieldByName('NatIDNum').AsString +'" from the'+#13#10+
                      'registration list. Do you wish to continue?',mtConfirmation,[mbYes, mbNo],0) = idNo ) then Exit;

      if ( LookUpCalvings.Locate('EventId',AEventID,[]) ) then
         for i := 1 to cMaxCalves do
            begin
               bFound := False;
               if ( LookUpCalvings.FieldByName('ID'+IntToStr(i)).AsInteger = ACalfID ) then
                  try
                     LookUpCalvings.Edit;
                     LookUpCalvings.FieldByName('ID'+IntToStr(i)+'Notified').AsBoolean := TRUE;
                     LookUpCalvings.FieldByName('ID'+IntToStr(i)+'Status').AsInteger := CalfReg_Status_Removed;
                     LookUpCalvings.FieldByName('ID'+IntToStr(i)+'Date').AsDateTime := Date;
                     LookUpCalvings.Post;
                     DbiSaveChanges(LookUpCalvings.Handle);
                     bFound := True;
                  except
                     LookUpCalvings.Cancel;
                     MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                  end;
               if bFound then
                  begin
                     MyTable.Beforedelete := nil;
                     CalfGrid.DataSource.Dataset.Delete;
                     MyTable.Beforedelete := RegisterAnimal;
                     Break;
                  end;
            end;
   finally
      LookupCalvings.Active := False;
      FreeAndNil(LookupCalvings);
   end;
end;

procedure TfCalfRegFlt.RemoveAllSelectedRows(AShowWarning : Boolean);
var
   i : Integer;
begin
   if ( CalfGrid.SelectedRows.Count = 0 ) then
      begin
         MessageDlg('No calves selected.',mtError,[mbOK],0);
         Exit;
      end;
   for i := 0 to CalfGrid.SelectedRows.Count -1 do
     if ( CalfGrid.SelectedRows[i] <> '' ) then
        if CalfGrid.DataSource.DataSet.BookmarkValid(pointer(CalfGrid.SelectedRows[i])) then
           begin
              CalfGrid.DataSource.DataSet.GotoBookmark(pointer(CalfGrid.SelectedRows[i]));
              RegisterCalf(CalfGrid.DataSource.DataSet.FieldByName('EventID').Value,
                           CalfGrid.DataSource.DataSet.FieldByName('AnimalID').AsInteger,AShowWarning);
           end;
end;

procedure TfCalfRegFlt.SelectAllRows;
var
   i : integer;
begin
   CalfGrid.SelectedRows.Clear;
   CalfGrid.DataSource.DataSet.First;
   for i := 0 to CalfGrid.DataSource.DataSet.RecordCount-1 do
      begin
         CalfGrid.SelectedRows.CurrentRowSelected := True;
         CalfGrid.DataSource.DataSet.Next;
      end;
   Application.ProcessMessages;
   Update;
end;

end.

