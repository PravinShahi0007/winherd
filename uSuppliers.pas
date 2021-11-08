{
   25/04/13 [V5.1 R7.0] /MK Additional Feature - Added BTEHerdNo field.

   10/09/14 [V5.3 R6.1] /MK Additional Feature - Changed grid to cxGrid, added print button and added print component to allow printing.

   12/09/14 [V5.3 R6.2] /MK Bug Fix - FormCreate - WinData.SystemRegisteredCountry was not working for more than one herd in two different countries.

   09/11/15 [V5.5 R0.5] /MK Additional Feature - Added InUse dbCheckbox for the new InUse field.

   27/11/15 [V5.5 R1.4] /MK Change - eSearchOnKeyPress - Added partial search i.e. the program will search for text in whole of name not just the start of the name - GL request.

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

   19/09/19 [V5.9 R0.5] /MK Bug Fix - ComponentPrinterLink had lost its Component so I have hard coded it, Print Suppliers not showing data - Adrian Walsh.

   06/07/21 [V6.0 R1.6] /MK Change - Removed search from eSearch.OnKeyPress.
                                   - Added search using GridView.DataController.Filter to eSearch.OnChange to allow for partial search - Geraldine Murray.

   07/07/21 [V6.0 R1.6] /MK Change - Allow the user to search by either column on the grid by checking to see which column is sorted.
}

unit uSuppliers;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, RXCtrls, ComCtrls, ToolWin, kwDBNavigator, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDBEdit, uCrushXML, Def,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxPSCore, dxPScxCommon,
  dxPScxGridLnk, cxButtons, uHerdLookup, cxCheckBox, cxLabel, cxDBLabel,
  Menus, uMartEmailRequest, GenTypesConst, KRoutines, cxFilter;

type
  TfSuppliers = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    EditName: TDBEdit;
    EditAddress: TDBEdit;
    EditAddress2: TDBEdit;
    EditAddress3: TDBEdit;
    EditAddress4: TDBEdit;
    EditAddress5: TDBEdit;
    EditPhone: TDBEdit;
    EditFax: TDBEdit;
    EditEmail: TDBEdit;
    EditCommission: TDBEdit;
    EditTransport: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    DBNavigator: TkwDBNavigator;
    lBladeSupplierID: TLabel;
    BladeSupplierID: TDBEdit;
    pSupplierType: TPanel;
    dbcbAnimalSupplier: TDBCheckBox;
    dbcbMedicineSupplier: TDBCheckBox;
    dbFeedSupplier: TDBCheckBox;
    pLocationID: TPanel;
    Label35: TLabel;
    Loc: TcxDBMaskEdit;
    Label36: TLabel;
    SLoc: TcxDBMaskEdit;
    Label31: TLabel;
    MHSLoc: TcxDBTextEdit;
    Label5: TLabel;
    DBHerdID: TDBEdit;
    ComponentPrinter: TdxComponentPrinter;
    ComponentPrinterLink: TdxGridReportLink;
    dbInUse: TcxDBCheckBox;
    pEditSupplier: TPanel;
    pSearchSupplier: TPanel;
    Label3: TLabel;
    eSearch: TEdit;
    pPrintSupplierGrid: TPanel;
    btnPrintSuppliers: TcxButton;
    SupplierGrid: TcxGrid;
    SupplierGridDBTableView: TcxGridDBTableView;
    SupplierGridDBTableViewName: TcxGridDBColumn;
    SupplierGridDBTableViewAddress1: TcxGridDBColumn;
    SupplierGridLevel: TcxGridLevel;
    bAddSupplier: TBevel;
    pDBInfo: TPanel;
    DBInfo: TcxDBLabel;
    ToolButton4: TToolButton;
    btnOptions: TRxSpeedButton;
    pmOptions: TPopupMenu;
    pmiLookupMarts: TMenuItem;
    lSearchNote: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
    procedure sbHelpClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eSearchChange(Sender: TObject);
    procedure eSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintSuppliersClick(Sender: TObject);
    procedure SupplierGridExit(Sender: TObject);
    procedure pmiLookupMartsClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
  private
    { private declarations }
    PreviousIndexName : String;
    procedure CheckForReadOnly;
  public
    { public declarations }
  end;


procedure ShowTheForm ( AddingRecord : Boolean);overload;
procedure ShowTheForm ( AddingRecord : Boolean; var SuppID : Integer );overload;

//var                                                                // changed 1/00
//  fSuppliers: TfSuppliers;

implementation
uses
    DairyData, Dialogs;

var                                                                  // added 1/00
  ID : Integer;
  fSuppliers: TfSuppliers;

{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean);overload;
begin
    Application.CreateForm(TfSuppliers, fSuppliers);           //
    try // SP
       try
          fSuppliers.PreviousIndexName := WinData.Suppliers.IndexName;
          WinData.Suppliers.Close;
          WinData.Suppliers.IndexName := 'iName';
          WinData.Suppliers.Open;
          if AddingRecord then                                          // show blank
             WinData.Suppliers.Append;                                  //
          fSuppliers.CheckForReadOnly;
          fSuppliers.ShowModal;                                         // record upon
       except                                                           //
          ShowMessage('Cannot create form - close program and re-boot');// opening
       end;                                                             //
    finally
       FreeAndNil(  fSuppliers );
    end;
end;

procedure ShowTheForm ( AddingRecord : Boolean; var SuppID : Integer );
begin
   try
      ShowTheForm( AddingRecord );
   finally
       SuppID := ID;
   end;
end;

procedure TfSuppliers.CheckForReadOnly;
begin
    if WinData.Suppliers.Active then
       begin
          if WinData.Suppliers.State = dsInsert then
             EditName.ReadOnly := FALSE
          else
             EditName.ReadOnly := TRUE;
       end;
end;

procedure TfSuppliers.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   // Make sure to cancel any pending record
   CanClose := ( not(WinData.Suppliers.State in dsEditModes) );
   if ( not(CanClose) ) then
      CanClose := ( Length(EditName.Text) = 0 );
   if ( not(CanClose) ) then
      CanClose := ( MessageDlg('Unsaved changes, exit anyway?',mtConfirmation,[mbYes,mbNo],0) = mrYes ); 
   if ( CanClose ) and ( WinData.Suppliers.Active ) then
      WinData.Suppliers.Cancel;
end;

procedure TfSuppliers.DBNavigatorClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
    CheckForReadOnly;

   if ( Button = kwnbPost ) then
      begin
         if Def.Definition.dUseCrush then
            begin
               with TCrushXMLExport.Create do
                  try
                     FSupplier.Name := WinData.SuppliersName.AsString;
                     FSupplier.Address1 := WinData.SuppliersAddress1.AsString;
                     FSupplier.Address2 := WinData.SuppliersAddress2.AsString;
                     FSupplier.Address3 := WinData.SuppliersAddress3.AsString;
                     FSupplier.Address4 := WinData.SuppliersAddress4.AsString;
                     FSupplier.Address5 := WinData.SuppliersAddress5.AsString;
                     FSupplier.Phone := WinData.SuppliersPhone.AsString;
                     FSupplier.Fax := WinData.SuppliersFax.AsString;
                     FSupplier.Email := WinData.SuppliersEmail.AsString;
                     FSupplier.Commission := WinData.SuppliersCommission.AsFloat;
                     FSupplier.Transport := WinData.SuppliersTransport.AsFloat;
                     CreateorOpenXMLFile(etPurchase);
                     AddLookupItemToXML;
                  finally
                     Free;
                  end;
            end;
      end;
end;

procedure TfSuppliers.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('suppliersetup');
end;

procedure TfSuppliers.Panel2Click(Sender: TObject);
begin
   { BLADE SP 27/02/04 }
   lBladeSupplierID.Visible := ( WinData.GlobalSettings.BladeRegistered );
   BladeSupplierID.Visible := lBladeSupplierID.Visible;
   if ( lBladeSupplierID.Visible ) then
     begin
         lBladeSupplierID.Top := 363;
         BladeSupplierID.Top := 360;
         dbInUse.Top := 416;
         pSupplierType.Top := 442;
      end
   else
      begin
         dbInUse.Top := 388;
         pSupplierType.Top := 412;
      end;
end;

procedure TfSuppliers.FormShow(Sender: TObject);
begin
   eSearch.Text := '';
end;

procedure TfSuppliers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ID := WinData.Suppliers.FieldByName('ID').AsInteger;

   WinData.Suppliers.Close;
   WinData.Suppliers.IndexName := PreviousIndexName;
   WinData.Suppliers.Open;
end;

procedure TfSuppliers.eSearchChange(Sender: TObject);
var
   SortedColumn : TObject;
   i : Integer;
begin
   if ( eSearch.Text = '' ) then
      SupplierGridDBTableView.DataController.FocusedRecordIndex := 0;

   for i := 0 to SupplierGridDBTableView.ColumnCount-1 do
      if ( SupplierGridDBTableView.Columns[i].SortIndex > -1 ) then
         begin
            SortedColumn := SupplierGridDBTableView.Columns[i];
            Break;
         end;

   SupplierGridDBTableView.DataController.Filter.Clear;
   SupplierGridDBTableView.DataController.Filter.Active := False;
   if ( Length(eSearch.Text) > 0 ) then
      begin
         SupplierGridDBTableView.DataController.Filter.Options := [fcoCaseInsensitive];
         SupplierGridDBTableView.DataController.Filter.AddItem(nil, SortedColumn, foLike, '%'+eSearch.Text+'%', '%'+eSearch.Text+'%');
         SupplierGridDBTableView.DataController.Filter.Active := True;
      end;
end;

procedure TfSuppliers.eSearchKeyPress(Sender: TObject; var Key: Char);
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
   with SupplierGridDBTableView do
      begin
         DataController.BeginLocate;
         Success := False;
         try
            SearchText := Trim(eSearch.Text+key);
            if ( SearchText <> '' ) then
               begin
                  SearchText := UPPERCASE(eSearch.Text+key);
                  StartIndex := 0;
                  with SupplierGridDBTableView.ViewData do
                     begin
                        Success := False;
                        for i := StartIndex to SupplierGridDBTableView.ViewData.RowCount - 1 do
                           begin
                              FieldValue := VarToStr(Rows[i].Values[SupplierGridDBTableViewName.Index]);
                              if ( not(VarIsNull(FieldValue)) ) then
                                 begin
                                    FieldValue := UPPERCASE(FieldValue);
                                    if ( Pos(SearchText, FieldValue) > 0 ) then
                                       begin
                                          SupplierGridDBTableView.DataController.FocusedRecordIndex := Rows[i].RecordIndex;;
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

procedure TfSuppliers.FormCreate(Sender: TObject);
var
   HerdCountry : TCountry;
begin
   //pLocationID.Visible := ( not(WinData.SystemRegisteredCountry = Ireland) );
   //   12/09/14 [V5.3 R6.2] /MK Bug Fix - WinData.SystemRegisteredCountry was not working for more than one herd in two different countries.
   HerdCountry := HerdLookup.CountryByHerdID(WinData.UserDefaultHerdID);
   pLocationID.Visible := ( not(HerdCountry = Ireland) );
   pEditSupplier.Height := 471;
   if ( HerdCountry = England ) then
      pEditSupplier.Height := 430;
   ToolButton1.Visible := ( HerdCountry = Ireland );
   ToolButton1.Width := 8;
   ToolButton1.Style := tbsDivider;
   btnOptions.Visible := ToolButton1.Visible;
   btnOptions.Width := 68;
   if ( not(ToolButton1.Visible) ) then
      begin
        ToolButton1.Width := 0;
        ToolButton1.Style := tbsSeparator;
        btnOptions.Width := 0;
      end;
end;

procedure TfSuppliers.btnPrintSuppliersClick(Sender: TObject);
begin
   ComponentPrinterLink.Component := SupplierGrid;
   if Length(ComponentPrinter.PrintTitle) = 0 then
      ComponentPrinter.PrintTitle := 'Supplier Listing';
   ComponentPrinterLink.Preview;
end;

procedure TfSuppliers.SupplierGridExit(Sender: TObject);
begin
   CheckForReadOnly;
end;

procedure TfSuppliers.pmiLookupMartsClick(Sender: TObject);
begin
   TfmMartEmailRequest.Execute(False);
   if ( Length(HerdLookup.SelectedDeptMartInfo.Name) > 0 ) then
      begin
         if ( not(WinData.Suppliers.State in dsEditModes) ) then
            WinData.Suppliers.Append;
         WinData.Suppliers.FieldByName('Name').AsString := HerdLookup.SelectedDeptMartInfo.Name;
         WinData.Suppliers.FieldByName('BTEHerdNo').AsString := HerdLookup.SelectedDeptMartInfo.Number;
      end;
end;

procedure TfSuppliers.btnOptionsClick(Sender: TObject);
var
   pt : tPoint;
begin
   GetCursorPos(pt);
   pmOptions.Popup(pt.x,pt.y);
end;

procedure TfSuppliers.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfSuppliers.DBNavigatorBeforeAction(Sender: TObject; Button: TKNavigateBtn);
begin
   if ( Button = kwnbPost ) then
      if ( Length(EditAddress.Text) = 0 ) then
         begin
            MessageDlg('Address must be entered.',mtError,[mbOK],0);
            SysUtils.Abort;
         end;
end;

end.

