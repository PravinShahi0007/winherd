{
   06/04/11 [V4.0 R9.4] /MK Bug Fix - Check To See If Herd Type Is Beef Before Prompting For Herd Identifier on Send Email.

   21/04/15 [V5.4 R4.9] /MK Additional Feature - Added facility to save email addresses entered by user to TTable
                                                 and load these into MDataSet after Form is created.

   03/08/18 [V5.8 R2.2] /MK Change - As the WinData.mdMarts table was cleared in this version, add the names and codes from the uDeptMarts.
                                   - If has existing marts with email addresses in the MartEmailSuppliers table then add the saved email address from this table.
                                   - If the user adds an email address for a mart then add this record to the MartEmailSuppliers table if it doesn't exist already
                                     or update the email address of the mart with the new email address.

   07/08/18 [V5.8 R2.2] /MK Change - Added ActionList with items for Close, Send Email and Select Mart.
                                   - Pass AShowEmail into Execute form procedure to allow either email of mart or select mart.
                                   - If Select Mart then add name and number to new HerdLookup.SelectedDeptMartInfo record.
                            Additional Feature - Added search box to the form to allow the user to quickly search for a mart. This will filter the grid by the text
                                                 entered in the box so that only marts of the text entered appear.
}

unit uMartEmailRequest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, LMDWebBase, LMDMapi, db, dbTables, uDeptMarts, ActnList,
  GenTypesConst, uHerdLookup, cxTextEdit, cxContainer, cxEdit, cxLabel, cxFilter,
  dxPSCore, dxPScxCommon, dxPScxGridLnk;

type
  TfmMartEmailRequest = class(TForm)
    MartEmailRequestGridDBTableView: TcxGridDBTableView;
    MartEmailRequestGridLevel: TcxGridLevel;
    MartEmailRequestGrid: TcxGrid;
    MartEmailRequestGridDBTableViewMartName: TcxGridDBColumn;
    MartEmailRequestGridDBTableViewAddress1: TcxGridDBColumn;
    MartEmailRequestGridDBTableViewAddress2: TcxGridDBColumn;
    MartEmailRequestGridDBTableViewAddress3: TcxGridDBColumn;
    MartEmailRequestGridDBTableViewAddress4: TcxGridDBColumn;
    MartEmailRequestGridDBTableViewEmail: TcxGridDBColumn;
    btnSendEmail: TcxButton;
    btnClose: TcxButton;
    MAPIMail: TLMDMapiSendMail;
    MartEmailRequestGridDBTableViewMartNo: TcxGridDBColumn;
    ActionList: TActionList;
    actSendEmail: TAction;
    actSelectMart: TAction;
    actClose: TAction;
    lSearchForMart: TcxLabel;
    teSearchForMart: TcxTextEdit;
    btnClearSearch: TcxButton;
    procedure FormActivate(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actSendEmailExecute(Sender: TObject);
    procedure actSelectMartExecute(Sender: TObject);
    procedure teSearchForMartPropertiesChange(Sender: TObject);
    procedure btnClearSearchClick(Sender: TObject);
  private
    { Private declarations }
    FMartEmailSuppliersQuery : TQuery;
    FShowEmailBtn : Boolean;
    procedure MartSendEmail;
    procedure AddEmailAddressesFromTTable;
    procedure SaveNewEmailAddressesToTTable;
    procedure AddMartNamesAndNumbersFromDeptArray;
  public
    { Public declarations }
    class procedure Execute(AShowEmail : Boolean);
  end;

var
  fmMartEmailRequest: TfmMartEmailRequest;

implementation

uses DairyData, uHerdSetUp;

{$R *.DFM}

{ TfmMartEmailRequest }

class procedure TfmMartEmailRequest.Execute(AShowEmail : Boolean);
begin
   with TfmMartEmailRequest.Create(nil) do
      try
         WinData.mdMarts.Close;
         WinData.mdMarts.Open;
         FShowEmailBtn := AShowEmail;

         AddMartNamesAndNumbersFromDeptArray;

         //   21/04/15 [V5.4 R4.9] /MK Additional Feature - Take email addresses from TTable and add to WinData.mdMarts.
         AddEmailAddressesFromTTable;

         WinData.mdMarts.First;

         ShowModal;
      finally
         //   21/04/15 [V5.4 R4.9] /MK Additional Feature - Take any new email addresses entered by user and save to TTable.
         SaveNewEmailAddressesToTTable;
         WinData.mdMarts.Active := False;
         Free;
      end;
end;

procedure TfmMartEmailRequest.MartSendEmail;
const
   LineBreak = #13#10;
   DoubleLineBreak = LineBreak + LineBreak;
var
   HerdIdentity,
   EmailName,
   EmailAddress,
   PostalAddress,
   HerdIdentifier,
   TypeOfHerd : String;
   iAddress : packed array [1..4] of string;
   i : Integer;
   Result : Boolean;
   SlaughterPlant : string;
   MyQuery : TQuery;
   ToAddress, CCAddress, MessageSubject, MessageBody : String;
begin
   Result := false;
   ToAddress := '';
   CCAddress := '';
   MessageSubject := '';
   MessageBody := '';

   MyQuery := TQuery.Create(nil);
   try
      MyQuery.DatabaseName := AliasName;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('SELECT O.Name, O.HerdIdentity, O.HerdIdentifier, G.Description, O.Address1, O.Address2, O.Address3, O.Address4,');
      MyQuery.SQL.Add('       O."E-Mail" FROM Owners O ');
      MyQuery.SQL.Add('LEFT JOIN Genlook G On (G.ID=O.TypeOfHerd)');
      MyQuery.SQL.Add('Where (ID = ' + IntToStr(WinData.UserDefaultHerdID)+ ')' );
      MyQuery.Open;
      MyQuery.First;

      EmailName := (MyQuery.Fields[0].AsString);
      HerdIdentity:= (MyQuery.Fields[1].AsString);
      HerdIdentifier := (MyQuery.Fields[2].AsString);
      TypeOfHerd :=  UpperCase((MyQuery.Fields[3].AsString));
      iAddress[1] := (Trim(MyQuery.Fields[4].AsString));
      iAddress[2] := (Trim(MyQuery.Fields[5].AsString));
      iAddress[3] := (Trim(MyQuery.Fields[6].AsString));
      iAddress[4] := (Trim(MyQuery.Fields[7].AsString));
      EmailAddress:= (MyQuery.Fields[8].AsString);

      while Pos(',', iAddress[1]) > 0 do
         Delete( iAddress[1], Pos(',', iAddress[1]), 1);
      while Pos(',', iAddress[2]) > 0 do
         Delete( iAddress[2], Pos(',', iAddress[2]), 1);
      while Pos(',', iAddress[3]) > 0 do
         Delete( iAddress[3], Pos(',', iAddress[3]), 1);
      while Pos(',', iAddress[4]) > 0 do
         Delete( iAddress[4], Pos(',', iAddress[4]), 1);

   finally
      MyQuery.Close;
   end;

   if ( TypeOfHerd <> cBeefHerd ) and ( Length(HerdIdentifier) <> 7 ) then
         begin
            MessageDlg('Your Herd Identifier '+HerdIdentifier+' is not valid. '+#13+
                       'Please use a 7 digit number without spaces or separators',mtError,[mbOK],0);
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
                        uHerdSetUp.ShowTheForm( False, '' );
                     end;
               end;
         end;

   if Result then
      begin

         if iAddress[4] <> '' then
            PostalAddress := iAddress[1] + ', ' + iAddress[2]  + ', ' + iAddress[3]  + ', ' + iAddress[4] + DoubleLineBreak
         else if iAddress[3] <> '' then
            PostalAddress := iAddress[1] + ', ' + iAddress[2]  + ', ' + iAddress[3] + DoubleLineBreak
         else if iAddress[2] <> '' then
            PostalAddress := iAddress[1] + ', ' + iAddress[2] + DoubleLineBreak
         else if iAddress[1] <> '' then
            PostalAddress := iAddress[1] + DoubleLineBreak
         else
            begin
               MessageDlg('No postal address has been found.'+cCRLF+cCRLF+
                          'Please save the postal address in Herd Setup before continuing',mtWarning,[mbOK],0);
               uHerdSetUp.ShowTheForm( False, '');
               Exit;
            end;

         ToAddress := Trim(WinData.mdMartsEmail.AsString);
         CCAddress := KingswoodEmailAddress;
         MessageSubject := 'Request Mart Movement Files';
         MessageBody := 'Name: ' + EmailName + LineBreak + LineBreak +
                        'Herd Number (BTE): ' + HerdIdentity + DoubleLineBreak +
                        'Address: ' + PostalAddress +
                        'E-Mail Address: ' + EmailAddress + DoubleLineBreak;

         if Trim(ToAddress) = '' then
            begin
               InputQuery('Email Address:', 'Enter email address of Mart', ToAddress);
               try
                  //   21/04/15 [V5.4 R4.9] /MK Additional Feature - Save email address entered by user WinData.mdMarts.
                  WinData.mdMarts.Edit;
                  WinData.mdMarts.FieldByName('Email').AsString := ToAddress;
                  WinData.mdMarts.Post;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;
         WinData.SendSimpleEmail(ToAddress, CCAddress, MessageSubject, MessageBody);
      end;
end;

procedure TfmMartEmailRequest.AddEmailAddressesFromTTable;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM MartEmailSuppliers');
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  First;
                  while ( not(Eof) ) do
                     begin
                        if ( WinData.mdMarts.Locate('MartName',FieldByName('MartName').AsString,[loCaseInsensitive]) ) then
                           if ( Length(FieldByName('Email').AsString) > 0 ) then
                              if ( WinData.mdMarts.FieldByName('Email').AsString <> FieldByName('Email').AsString ) then
                                 try
                                    WinData.mdMarts.Edit;
                                    WinData.mdMarts.FieldByName('Email').AsString := FieldByName('Email').AsString;
                                    WinData.mdMarts.Post;
                                 except
                                    on e : Exception do
                                       ShowMessage(e.Message);
                                 end;
                        Next;
                     end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Close;
         Free;
      end;
end;

procedure TfmMartEmailRequest.SaveNewEmailAddressesToTTable;
var
   MartEmailSuppliersTable : TTable;
begin
   MartEmailSuppliersTable := TTable.Create(nil);
   with MartEmailSuppliersTable do
      try
         DatabaseName := AliasName;
         TableName := 'MartEmailSuppliers';
         Open;
         if ( not(WinData.mdMarts.Active) ) then
            WinData.mdMarts.Active := True;

         WinData.mdMarts.First;
         while ( not(WinData.mdMarts.Eof) ) do
            begin
               if ( Length(WinData.mdMarts.FieldByName('Email').AsString) > 0 ) then
                  if ( MartEmailSuppliersTable.Locate('MartName',WinData.mdMarts.FieldByName('MartName').AsString,[loCaseInsensitive]) ) then
                     begin
                        if ( MartEmailSuppliersTable.FieldByName('Email').AsString <> WinData.mdMarts.FieldByName('Email').AsString ) then
                           try
                              MartEmailSuppliersTable.Edit;
                              MartEmailSuppliersTable.FieldByName('Email').AsString := WinData.mdMarts.FieldByName('Email').AsString;
                              MartEmailSuppliersTable.Post;
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;
                     end
                  else
                     try
                        MartEmailSuppliersTable.Append;
                        MartEmailSuppliersTable.FieldByName('MartName').AsString := WinData.mdMarts.FieldByName('MartName').AsString;
                        MartEmailSuppliersTable.FieldByName('Email').AsString := WinData.mdMarts.FieldByName('Email').AsString;
                        MartEmailSuppliersTable.Post;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
               WinData.mdMarts.Next;
            end;

      finally
         Close;
         Free;
      end;
end;

procedure TfmMartEmailRequest.AddMartNamesAndNumbersFromDeptArray;
var
   i, Index : Integer;
begin
   if ( WinData.mdMarts.RecordCount > 0 ) then Exit;
   for i := 0 to Length(saDeptMartCodes)-1 do
      try
         WinData.mdMarts.Append;
         WinData.mdMarts.FieldByName('MartNo').AsString := saDeptMartCodes[i];
         WinData.mdMarts.FieldByName('MartName').AsString := saDeptMartNames[i];
         WinData.mdMarts.Post;
      except
      end;
end;

procedure TfmMartEmailRequest.FormActivate(Sender: TObject);
begin
   btnSendEmail.Glyph := nil;
   btnSendEmail.Action := actSendEmail;
   Caption := 'Mart File - Email Request';
   if ( not(FShowEmailBtn) ) then
      begin
         btnSendEmail.Action := actSelectMart;
         Caption := 'Select Marts';
      end;
   btnClearSearch.Visible := False;
end;

procedure TfmMartEmailRequest.actCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmMartEmailRequest.actSendEmailExecute(Sender: TObject);
begin
   MartSendEmail;
end;

procedure TfmMartEmailRequest.actSelectMartExecute(Sender: TObject);
begin
   HerdLookup.SelectedDeptMartInfo.Name := WinData.mdMarts.FieldByName('MartName').AsString;
   HerdLookup.SelectedDeptMartInfo.Number := WinData.mdMarts.FieldByName('MartNo').AsString;
   Close;
end;

procedure TfmMartEmailRequest.teSearchForMartPropertiesChange(
  Sender: TObject);
begin
   with MartEmailRequestGridDBTableView.DataController.Filter do
      begin
         Active := False;
         if ( Length(teSearchForMart.Text) > 0 ) then
            begin
               Root.AddItem(MartEmailRequestGridDBTableViewMartName, foLike, '%'+teSearchForMart.Text+'%', '');
               Active := True;
            end
         else
            MartEmailRequestGridDBTableView.DataController.Filter.Clear;
      end;
   btnClearSearch.Visible := ( Length(Trim(teSearchForMart.Text)) > 0 );
end;

procedure TfmMartEmailRequest.btnClearSearchClick(Sender: TObject);
begin
   teSearchForMart.Text := '';
   teSearchForMart.SetFocus;
end;

end.
