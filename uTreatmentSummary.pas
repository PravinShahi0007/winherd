{
   15/05/14 [V5.3 R0.4] /MK Additional Feature - Added explanitory text from Bord Bia to help page - GL Request.

   19/06/14 [V5.3 R2.8] /MK Change - Added label to give explanation to dates to explain that the date
                                     range is the treatment start date.
                                   - Changed height of form to make it more readable.

   31/10/14 [V5.3 R8.8] /MK Change - Changed lInfo.Caption as requested by GL.
                                   - Removed Treatment Date Range label as requested by GL.

   29/01/15 [V5.4 R2.6] /MK Bug Fix - actApplyExecute - If user passed in a blank date from or date to the program was give a "Type Mismatch" error. 

   10/08/20 [V5.9 R5.3] /MK Change - Added the Herd Identity to the bottom of the screen so that it can be output to the report.   

   18/01/22 [V6.0 R3.8] /MK Bug Fix - actApplyExecute - Added new mastitis and lameness events to get summary of their data - Hugh Collender.
}

unit uTreatmentSummary;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  uAnimalRemedyData, cxContainer, cxEdit, cxLabel, GenTypesConst,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, ExtCtrls, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, dxPSContainerLnk,
  dxPSCore, dxPScxCommon, dxPScxGridLnk, uHerdLookup, DairyData;

type
  TfmTreatmentSummary = class(TfmBaseForm)
    InfoPanel: TPanel;
    lInfo: TcxLabel;
    btnApply: TcxButton;
    DateFrom: TcxDateEdit;
    DateTo: TcxDateEdit;
    lDateFrom: TcxLabel;
    lDateTo: TcxLabel;
    StyleRepository: TcxStyleRepository;
    HeaderStyle: TcxStyle;
    actPrint: TAction;
    actApply: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    ComponentPrinter: TdxComponentPrinter;
    DataPanel: TPanel;
    BordBiaGrid: TcxGrid;
    BordBiaGridTableView: TcxGridTableView;
    BordBiaGridTableViewAntibiotics: TcxGridColumn;
    BordBiaGridTableViewDoses: TcxGridColumn;
    BordBiaGridTableViewVaccines: TcxGridColumn;
    BordBiaGridTableViewTubes: TcxGridColumn;
    BordBiaGridTableViewOther: TcxGridColumn;
    BordBiaGridLevel: TcxGridLevel;
    lNoDryCowTreatHeader: TcxLabel;
    lNoDryCowTreats: TcxLabel;
    DataPanelPrinterLink: TdxCustomContainerReportLink;
    lHerdIdentity: TcxLabel;
    lHerdIdentityTxt: TcxLabel;
    procedure actApplyExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure DateFromPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FHerdType : THerdType;
    FHerdID : Integer;
    FHerdIdentity : String;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm ( AHerdID : Integer );
  end;

var
  fmTreatmentSummary: TfmTreatmentSummary;

implementation

{$R *.DFM}

{ TfmBordBiaSummary }

class procedure TfmTreatmentSummary.ShowTheForm ( AHerdID : Integer );
begin
   with TfmTreatmentSummary.Create(nil) do
      try
         DateFrom.Date := IncMonth(Date,-12);
         DateTo.Date := Date;
         lNoDryCowTreats.Caption := '';
         FHerdID := AHerdID;
         FHerdType := HerdLookup.GetHerdType(FHerdID);
         FHerdIdentity := HerdLookup.HerdNumberByHerdId(FHerdID);
         lHerdIdentityTxt.Caption := FHerdIdentity;
         lHerdIdentity.Visible := False;
         lHerdIdentityTxt.Visible := False;

         if ( FHerdType = htBeef ) then
            Height := 358
         else
            Height := 428;

         lNoDryCowTreatHeader.Visible := ( FHerdType <> htBeef );
         lNoDryCowTreats.Visible := ( FHerdType <> htBeef );

         actApply.Execute;

         if ( WinData.FBordBiaBlockPrint ) then
            DataPanelPrinterLink.PrintPages([1])
         else
            ShowModal;
      finally
         Free;
      end;
end;

procedure TfmTreatmentSummary.actApplyExecute(Sender: TObject);
var
   NoTreatmentsByMedicineType : TNoTreatmentsByMedicineType;
   EventTypes : TIncludeEventsArray;
   AnimalRemedyData : TAnimalRemedyData;
   i,
   NoDryCowTreatments : Integer;
   dDateFrom, dDateTo : TDateTime;
begin
   inherited;
   lNoDryCowTreats.Caption := '';

   Screen.Cursor := crHourGlass;

   if ( BordBiaGridTableView.DataController.RecordCount > 0 ) then
      begin
         BordBiaGridTableView.DataController.BeginFullUpdate;
         for i := 0 to BordBiaGridTableView.DataController.RecordCount-1 do
            begin
               BordBiaGridTableView.DataController.FocusedRecordIndex := i;
               BordBiaGridTableView.DataController.DeleteRecord(BordBiaGridTableView.DataController.FocusedRecordIndex);
            end;
         BordBiaGridTableView.DataController.EndFullUpdate;
      end;

   SetLength(EventTypes,4);
   EventTypes[0] := CHealthEvent;
   EventTypes[1] := CHerdVaccination;
   //   18/01/22 [V6.0 R3.8] /MK Bug Fix - Added new mastitis and lameness events to get summary of their data.
   EventTypes[2] := CNewMastitisEvent;
   EventTypes[3] := CLamenessEvent;

   //   29/01/15 [V5.4 R2.6] /MK Bug Fix - If user passed in a blank date from or date to the program was give a "Type Mismatch" error. 
   dDateFrom := 0;
   dDateTo := 0;
   if ( DateFrom.Date < 0 ) then
      dDateFrom := StrToDate('31/12/1899')
   else
      dDateFrom := DateFrom.Date;
   if ( DateTo.Date < 0 ) then
      dDateTo := Date
   else
      dDateTo := DateTo.Date;

   AnimalRemedyData := TAnimalRemedyData.Create(dDateFrom,dDateTo,EventTypes,FHerdID);
   with AnimalRemedyData do
      try
        NoTreatmentsByMedicineType := GetNoTreatmentsByMedicineType;

        BordBiaGridTableView.DataController.Append;
        BordBiaGridTableViewAntibiotics.EditValue := NoTreatmentsByMedicineType.NoAntibiotics;
        BordBiaGridTableViewDoses.EditValue := NoTreatmentsByMedicineType.NoDoses;
        BordBiaGridTableViewVaccines.EditValue := NoTreatmentsByMedicineType.NoVaccines;
        BordBiaGridTableViewTubes.EditValue := NoTreatmentsByMedicineType.NoTubes;
        BordBiaGridTableViewOther.EditValue := NoTreatmentsByMedicineType.NoOther;
        BordBiaGridTableView.DataController.Post;

      finally
         FreeAndNil(AnimalRemedyData);
      end;

   SetLength(EventTypes,1);
   EventTypes[0] := CDryOffEvent;

   if ( FHerdType <> htBeef ) then
      begin
         AnimalRemedyData := TAnimalRemedyData.Create(dDateFrom,dDateTo,EventTypes,FHerdID);
         with AnimalRemedyData do
            try
              NoTreatmentsByMedicineType := GetNoTreatmentsByMedicineType;

              NoDryCowTreatments :=  NoTreatmentsByMedicineType.NoAntibiotics +
                                     NoTreatmentsByMedicineType.NoDoses +
                                     NoTreatmentsByMedicineType.NoVaccines +
                                     NoTreatmentsByMedicineType.NoTubes +
                                     NoTreatmentsByMedicineType.NoOther;

             lNoDryCowTreats.Caption := IntToStr(NoDryCowTreatments);

            finally
               FreeAndNil(AnimalRemedyData);
            end;
      end;

   BordBiaGridTableView.DataController.FocusedRecordIndex := -1;

   Screen.Cursor := crDefault;
end;

procedure TfmTreatmentSummary.actPrintExecute(Sender: TObject);
begin
   inherited;
   lHerdIdentity.Visible := True;
   lHerdIdentityTxt.Visible := True;
   if Length(ComponentPrinter.PrintTitle) = 0 then
      ComponentPrinter.PrintTitle := 'Kingswood Grid Print';
   DataPanelPrinterLink.Preview;
   lHerdIdentity.Visible := False;
   lHerdIdentityTxt.Visible := False;
end;

procedure TfmTreatmentSummary.actHelpExecute(Sender: TObject);
begin
   inherited;
   WinData.HTMLHelp('bordbiareview.htm');
end;

procedure TfmTreatmentSummary.DateFromPropertiesChange(Sender: TObject);
begin
   inherited;
   btnApply.Visible := True;
end;

procedure TfmTreatmentSummary.FormShow(Sender: TObject);
begin
   inherited;
   btnApply.Visible := False;
end;

end.
