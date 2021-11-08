{
   23/07/14 [V5.3 R4.0] /MK Additional Feature - If herd is irish then show warning if BTE Herd Number has spaces.

   10/09/14 [V5.3 R6.1] /MK Additional Feature - Changed grid to cxGrid, added print button and added print component to allow printing.

   12/09/14 [V5.3 R6.2] /MK Bug Fix - FormCreate - WinData.SystemRegisteredCountry was not working for more than one herd in two different countries.

   09/11/15 [V5.5 R0.5] /MK Additional Feature - Added InUse dbCheckbox for the new InUse field.

   27/11/15 [V5.5 R1.4] /MK Change - eSearchOnKeyPress - Added partial search i.e. the program will search for text in whole of name not just the start of the name.

   03/08/18 [V5.8 R2.2] /MK Change - Added panel around search/edit area to seperate it from the add area so user doesn't get confused.
                                   - Added bevel around add area to seperate it from the new search/edit panel.
                                   - Changed DBMemo to panel and cxDBLabel as it wasn't centered properly.

   07/08/18 [V5.8 R2.2] /MK Additional Feature - Added Options button and a drop-down-menu from the Options button to allow user to Lookup Mart from uMartEmailRequest screen.
                                               - If user has selected a mart from uMartEmailRequest then add the name and number for this mart as a new mart.
                                               - Options button is only available for Irish herds as its a listing of Dept. Of Ag marts.
                            Change - OnFormCloseQuery - CanClose checks if WinData.Suppliers is in Add/Edit mode, then checks to see if the name field has data in it.
                                                        If this criteria is met then the user is prompted with an "Unsaved changes, exit anyway?" prompt.

   08/08/18 [V5.8 R2.2] /MK Change - DBNavigatorBeforeAction - Check to make sure that an address is entered.

   27/03/19 [V5.8 R8.3] /MK Bug Fix - Tab Order was wrong.    

   19/09/19 [V5.9 R0.5] /MK Bug Fix - ComponentPrinterLink had lost its Component so I have hard coded it, Print Customers not showing data - Adrian Walsh.

   06/07/21 [V6.0 R1.6] /MK Change - Removed search from eSearch.OnKeyPress.
                                   - Added search using GridView.DataController.Filter to eSearch.OnChange to allow for partial search - Geraldine Murray.

   07/07/21 [V6.0 R1.6] /MK Change - Allow the user to search by either column on the grid by checking to see which column is sorted.
}

unit uCustomers;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, RXCtrls, ComCtrls, ToolWin, kwDBNavigator, cxDBEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, uCrushXML, Def,
  KRoutines, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxButtons, dxPSCore,
  dxPScxCommon, dxPScxGridLnk, uHerdLookup, cxCheckBox, cxLabel, cxDBLabel,
  Menus, uMartEmailRequest, cxFilter;

type
  TfCustomers = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditName: TDBEdit;
    EditAddress: TDBEdit;
    EditAddress2: TDBEdit;
    EditAddress3: TDBEdit;
    EditAddress4: TDBEdit;
    EditAddress5: TDBEdit;
    EditPhone: TDBEdit;
    EditFax: TDBEdit;
    EditEmail: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    DBNavigator: TkwDBNavigator;
    dbcbMeatX: TDBCheckBox;
    Label4: TLabel;
    Label10: TLabel;
    EditDeductions: TDBEdit;
    EditTransport: TDBEdit;
    dbcbMovement: TDBCheckBox;
    cbSlaughter: TDBCheckBox;
    Label3: TLabel;
    BTEHerdNo: TDBEdit;
    pLocationID: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Label31: TLabel;
    Loc: TcxDBMaskEdit;
    SLoc: TcxDBMaskEdit;
    MHSId: TcxDBTextEdit;
    ComponentPrinter: TdxComponentPrinter;
    dbInUse: TcxDBCheckBox;
    bAddSeperator: TBevel;
    pEditCustomer: TPanel;
    pSearchCustomer: TPanel;
    Label5: TLabel;
    eSearch: TEdit;
    CustomerGrid: TcxGrid;
    CustomerGridDBTableView: TcxGridDBTableView;
    CustomerGridDBTableViewName: TcxGridDBColumn;
    CustomerGridDBTableViewBTEHerdNo: TcxGridDBColumn;
    CustomerGridLevel: TcxGridLevel;
    pPrintCustomers: TPanel;
    btnPrintCustomers: TcxButton;
    pDBInfo: TPanel;
    DBInfo: TcxDBLabel;
    btnOptions: TRxSpeedButton;
    ToolButton4: TToolButton;
    pmOptions: TPopupMenu;
    pmiLookupMart: TMenuItem;
    ComponentPrinterLink: TdxGridReportLink;
    lSearchNote: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure eSearchChange(Sender: TObject);
    procedure eSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BTEHerdNoExit(Sender: TObject);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure CustomerGridExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPrintCustomersClick(Sender: TObject);
    procedure pmiLookupMartClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { private declarations }
    PreviousIndexName : String;
    procedure CheckForReadOnly;
  public
    { public declarations }
  end;

procedure ShowTheForm (AddingRecord : Boolean);overload;
procedure ShowTheForm (AddingRecord : Boolean; var CustID : Integer );overload;

implementation
uses
   DairyData,
   Dialogs,
   GenTypesConst;

var
  fCustomers: TfCustomers;
  ID : Integer;
{$R *.DFM}

procedure ShowTheForm (AddingRecord : Boolean);
begin
    Application.CreateForm(TfCustomers, fCustomers);
    try
       try
          fCustomers.PreviousIndexName := WinData.Customers.IndexName;
          WinData.Customers.Close;
          WinData.Customers.IndexName := 'iName';
          WinData.Customers.Open;
          if AddingRecord then WinData.Customers.Append;
          fCustomers.CheckForReadOnly;
          fCustomers.ShowModal;
       except
          ShowMessage('Cannot create form - close program and re-boot');
       end;
    finally
       FreeAndNil(fCustomers);
    end;
end;

procedure ShowTheForm ( AddingRecord : Boolean; var CustID : Integer );
begin
    try
       ShowTheForm(AddingRecord);
    finally
       CustID := ID;
    end;
end;

procedure TfCustomers.CheckForReadOnly;
begin
    if WinData.Customers.Active then
       begin
          if WinData.Customers.State = dsInsert then
             EditName.ReadOnly := FALSE
          else
             EditName.ReadOnly := TRUE;
       end;
end;

procedure TfCustomers.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfCustomers.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := ( not(WinData.Customers.State in dsEditModes) );
   if ( not(CanClose) ) then
      CanClose := ( Length(EditName.Text) = 0 );
   if ( not(CanClose) ) then
      CanClose := ( MessageDlg('Unsaved changes, exit anyway?',mtConfirmation,[mbYes,mbNo],0) = mrYes );
   if ( CanClose ) and ( WinData.Customers.Active ) then
      WinData.Customers.Cancel;
end;

procedure TfCustomers.DBNavigatorClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   CheckForReadOnly;

   if ( Button = kwnbPost ) then
      begin
         if Def.Definition.dUseCrush then
            begin
               with TCrushXMLExport.Create do
                  try
                     FCustomer.Name := WinData.CustomersName.AsString;
                     FCustomer.Address1 := WinData.CustomersAddress1.AsString;
                     FCustomer.Address2 := WinData.CustomersAddress2.AsString;
                     FCustomer.Address3 := WinData.CustomersAddress3.AsString;
                     FCustomer.Address4 := WinData.CustomersAddress4.AsString;
                     FCustomer.Address5 := WinData.CustomersAddress5.AsString;
                     FCustomer.Phone := WinData.CustomersPhone.AsString;
                     FCustomer.Fax := WinData.CustomersFax.AsString;
                     FCustomer.Email := WinData.CustomersEmail.AsString;
                     FCustomer.BTEHerdNo := WinData.CustomersBTEHerdNo.AsString;
                     FCustomer.Deductions := WinData.CustomersDeductions.AsFloat;
                     FCustomer.Transport := WinData.CustomersTransport.AsFloat;
                     CreateorOpenXMLFile(etSale);
                     AddLookupItemToXML;
                  finally
                     Free;
                  end;
            end;
      end;
end;

procedure TfCustomers.RxDBGrid1Exit(Sender: TObject);
begin
   CheckForReadOnly;
end;

procedure TfCustomers.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('customers');
end;

procedure TfCustomers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ID := WinData.Customers.FieldByName('ID').AsInteger;
   WinData.Customers.Close;
   WinData.Customers.IndexName := PreviousIndexName;
   WinData.Customers.Open;
end;

procedure TfCustomers.FormShow(Sender: TObject);
begin
   eSearch.Text := '';
end;

procedure TfCustomers.eSearchChange(Sender: TObject);
var
   SortedColumn : TObject;
   i : Integer;
begin
   if ( eSearch.Text = '' ) then
      CustomerGridDBTableView.DataController.FocusedRecordIndex := 0;

   for i := 0 to CustomerGridDBTableView.ColumnCount-1 do
      if ( CustomerGridDBTableView.Columns[i].SortIndex > -1 ) then
         begin
            SortedColumn := CustomerGridDBTableView.Columns[i];
            Break;
         end;

   CustomerGridDBTableView.DataController.Filter.Clear;
   CustomerGridDBTableView.DataController.Filter.Active := False;
   if ( Length(eSearch.Text) > 0 ) then
      begin
         CustomerGridDBTableView.DataController.Filter.Options := [fcoCaseInsensitive];
         CustomerGridDBTableView.DataController.Filter.AddItem(nil, SortedColumn, foLike, '%'+eSearch.Text+'%', '%'+eSearch.Text+'%');
         CustomerGridDBTableView.DataController.Filter.Active := True;
      end;
end;

procedure TfCustomers.eSearchKeyPress(Sender: TObject; var Key: Char);
var
   Success : Boolean;
   FieldValue,
   SearchText : String;
   i,
   StartIndex : Integer;
begin
   //   27/11/15 [V5.5 R1.4] /MK Change - Added partial search i.e. the program will search for text in whole of name not
   //                                     just the start of the name.
   {
   if ( key in iCharSearchSet ) then
      with CustomerGridDBTableView do
         begin
            Screen.Cursor := crHourGlass;
            DataController.BeginLocate;
            Success := False;
            try
               SearchText := Trim(eSearch.Text+key);
               if ( SearchText <> '' ) then
                  begin
                     SearchText := UPPERCASE(eSearch.Text+key);
                     StartIndex := 0;
                     with CustomerGridDBTableView.ViewData do
                        begin
                           Success := False;
                           for i := StartIndex to CustomerGridDBTableView.ViewData.RowCount - 1 do
                              begin
                                 FieldValue := VarToStr(Rows[i].Values[CustomerGridDBTableViewName.Index]);
                                 if ( not(VarIsNull(FieldValue)) ) then
                                    begin
                                       FieldValue := UPPERCASE(FieldValue);
                                       if ( Pos(SearchText, FieldValue) > 0 ) then
                                          begin
                                             CustomerGridDBTableView.DataController.FocusedRecordIndex := Rows[i].RecordIndex;;
                                             Success := True;
                                             Break;
                                          end;
                                    end;
                              end;
                        end;
                  end
               else
                  DataController.DataSet.First;
            finally
               DataController.EndLocate;
               Screen.Cursor := crDefault;
            end;
         end;
   }
end;

procedure TfCustomers.FormCreate(Sender: TObject);
var
   HerdCountry : TCountry;
begin
   //   12/09/14 [V5.3 R6.2] /MK Bug Fix - WinData.SystemRegisteredCountry was not working for more than one herd in two different countries.
   HerdCountry := HerdLookup.CountryByHerdID(WinData.UserDefaultHerdID);
   pLocationID.Visible := ( not(HerdCountry = Ireland) );
   pEditCustomer.Height := 490;
   if ( HerdCountry = England ) then
      pEditCustomer.Height := 444;
   ToolButton2.Visible := ( HerdCountry = Ireland );
   ToolButton2.Width := 8;
   ToolButton2.Style := tbsDivider;
   btnOptions.Visible := ToolButton2.Visible;
   btnOptions.Width := 68;
   if ( not(ToolButton2.Visible) ) then
      begin
        ToolButton2.Width := 0;
        ToolButton2.Style := tbsSeparator;
        btnOptions.Width := 0;
      end;
end;

procedure TfCustomers.BTEHerdNoExit(Sender: TObject);
begin
   //   23/07/14 [V5.3 R4.0] /MK Additional Feature - If herd is irish then show warning if BTE Herd Number has spaces.
   if ( WinData.SystemRegisteredCountry = Ireland ) and ( SpacesInHerdID(BTEHerdNo.Text) ) then
      begin
         MessageDlg(cSpacesInHerdID,mtError,[mbOK],0);
         SysUtils.Abort;
      end;
end;

procedure TfCustomers.DBNavigatorBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
begin
   //   23/07/14 [V5.3 R4.0] /MK Additional Feature - If herd is irish then show warning if BTE Herd Number has spaces.
   if ( Button = kwnbPost ) then
      begin
         if ( WinData.SystemRegisteredCountry = Ireland ) then
            begin
               if ( SpacesInHerdID(BTEHerdNo.Text) ) then
                  begin
                     MessageDlg(cSpacesInHerdID,mtError,[mbOK],0);
                     SysUtils.Abort;
                  end;

               //   08/05/15 [V5.4 R5.5] /MK Additional Feature - Check if customer BTENumber is valid irish herd number i.e length is 8 - GL/TOK request.
               if ( dbcbMovement.Checked ) then
                  if ( not(IsValidIrishHerdID(BTEHerdNo.Text)) ) then
                     begin
                        MessageDlg('The BTE Herd No is not valid.'+cCRLF+
                                   'Please correct the BTE Herd No.',mtError,[mbOK],0);
                        SysUtils.Abort;
                     end;
            end;

         //   08/08/18 [V5.8 R2.2] /MK Change - Check to make sure that an address is entered.
         if ( Length(EditAddress.Text) = 0 ) then
            begin
               MessageDlg('Address must be entered.',mtError,[mbOK],0);
               SysUtils.Abort;
            end;
      end;
end;

procedure TfCustomers.CustomerGridExit(Sender: TObject);
begin
   CheckForReadOnly;
end;

procedure TfCustomers.FormActivate(Sender: TObject);
begin
   btnPrintCustomers.Visible := WinData.dsCustomers.DataSet.RecordCount > 0;
end;

procedure TfCustomers.btnPrintCustomersClick(Sender: TObject);
begin
   ComponentPrinterLink.Component := CustomerGrid;
   if Length(ComponentPrinter.PrintTitle) = 0 then
      ComponentPrinter.PrintTitle := 'Customer Listing';
   ComponentPrinterLink.Preview;
end;

procedure TfCustomers.pmiLookupMartClick(Sender: TObject);
begin
   TfmMartEmailRequest.Execute(False);
   if ( Length(HerdLookup.SelectedDeptMartInfo.Name) > 0 ) then
      begin
         if ( not(WinData.Customers.State in dsEditModes) ) then
            WinData.Customers.Append;
         WinData.Customers.FieldByName('Name').AsString := HerdLookup.SelectedDeptMartInfo.Name;
         WinData.Customers.FieldByName('BTEHerdNo').AsString := HerdLookup.SelectedDeptMartInfo.Number;
      end;
end;

procedure TfCustomers.btnOptionsClick(Sender: TObject);
var
   pt : tPoint;
begin
   GetCursorPos(pt);
   pmOptions.Popup(pt.x,pt.y);
end;

end.
