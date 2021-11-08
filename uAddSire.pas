{
   09/01/20 [V5.9 R1.6] /MK Change - Added a Bull Name (Short) where the country is not Ireland - TGM request.
                                   - Had to modify the screen height, width and control positions for this change.

   01/04/21 [V6.0 R0.1] /MK Change - Added NatIDNum box for NonHerdSire SireType so tag number can be added.
                                   - Added validation for new NatIDNum box.
                                   - Added CheckBox to show/hide new NatIDnum box.
                                   - Only show explanatory text regarding ICBF for Irish herds. 

   27/09/21 [V6.0 R2.5] /MK Bug Fix - btnSaveClick - No need to add the IE or 372 if its already in the FormattedNatId.
}

unit uAddSire;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, EventRecording,
  db, dbTables, StdCtrls, cxButtons, uHerdLookup, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, SQLHelper, GenTypesConst,
  cxGroupBox, cxCheckBox, KRoutines, uAnimal;

type
  TSireType = (stAISire, stNonHerdSire);
  TfmAddSire = class(TForm)
    btnSave: TcxButton;
    btnCancel: TcxButton;
    teSireCode: TcxTextEdit;
    lSireCode: TcxLabel;
    cmboBreed: TcxLookupComboBox;
    lBreed: TcxLabel;
    lName: TcxLabel;
    teName: TcxTextEdit;
    lShortName: TcxLabel;
    teShortName: TcxTextEdit;
    gbAddSireNatId: TcxGroupBox;
    lNatIDNum: TcxLabel;
    teNatIDNum: TcxTextEdit;
    lSireNatIdInfoText: TcxLabel;
    cbAddSireNatId: TcxCheckBox;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmboBreedPropertiesChange(Sender: TObject);
    procedure teSireCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbAddSireNatIdPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FCountry : TCountry;
    FSireType : TSireType;
    procedure ClearDetails;
  public
    { Public declarations }
    class procedure ShowTheForm (ASireType : TSireType);
  end;

var
  fmAddSire: TfmAddSire;

const
  cPedFormHeight = 252;

implementation

{$R *.DFM}

class procedure TfmAddSire.ShowTheForm(ASireType: TSireType);
begin
   with TfmAddSire.Create(nil) do
      try
         FSireType := ASireType;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAddSire.FormCreate(Sender: TObject);
begin
   HerdLookup.CreateMDPureBredBreedData;
   FCountry := HerdLookup.CountryByHerdID(HerdLookup.DefaultHerdID);
end;

procedure TfmAddSire.FormActivate(Sender: TObject);
var
   i : Integer;
begin
   Height := 238;

   lName.Visible := ( FSireType = stAISire ) and ( Length(HerdLookup.PedigreePrefixByHerdId(HerdLookup.DefaultHerdID)) > 1 );
   teName.Visible := lName.Visible;
   lShortName.Visible := ( FSireType = stAISire ) and ( FCountry <> Ireland );
   teShortName.Visible := lShortName.Visible;
   cbAddSireNatId.Visible := ( FSireType = stNonHerdSire );
   gbAddSireNatId.Visible := False;
   lSireNatIdInfoText.Visible := ( FCountry = Ireland );

   case FSireType of
      stAISire : begin
                    lSireCode.Caption := 'AI Code : ';
                    lSireCode.Enabled := True;
                    if ( FCountry = Ireland ) then
                       begin
                          if ( lName.Visible ) then
                             teSireCode.Left := teSireCode.Left-50
                          else
                             teSireCode.Left := teSireCode.Left-20;
                          lSireCode.Top := 20;
                          teSireCode.Top := 20;
                          lBreed.Top := 66;
                          cmboBreed.Top := 66;
                          cmboBreed.Left := teSireCode.Left;
                          lName.Top := 112;
                          teName.Top := 112;
                          teName.Left := teSireCode.Left;
                       end
                    else
                       begin
                          lShortName.Top := 20;
                          teShortName.Top := 20;
                          lSireCode.Top := 66;
                          teSireCode.Top := 66;
                          lBreed.Top := 112;
                          cmboBreed.Top := 112;
                          lName.Top := 156;
                          teName.Top := 156;
                       end;
                    teSireCode.Enabled := True;
                    teSireCode.Width := 140;
                    Caption := 'AI Sire Manual Entry';
                 end;
      stNonHerdSire : begin
                         lBreed.Top := 28;
                         lBreed.Width := lSireCode.Width;
                         cmboBreed.Top := 28;
                         cmboBreed.Left := cmboBreed.Left-50;
                         lSireCode.Top := 74;
                         teSireCode.Top := 74;
                         teSireCode.Left := cmboBreed.Left;
                         cbAddSireNatId.Top := 118;
                         cbAddSireNatId.Left := lSireCode.Left+24;
                         gbAddSireNatId.Top := cbAddSireNatId.Top;
                         gbAddSireNatId.Left := cbAddSireNatId.Left;
                         lSireCode.Caption := 'Code : ';
                         lSireCode.Enabled := True;
                         teSireCode.Enabled := True;
                         teSireCode.Width := cmboBreed.Width;
                         gbAddSireNatId.Top := 120;
                         Caption := 'Other Sires';
                      end;
   end;

   if lName.Visible then
      begin
         if ( FCountry = Ireland ) then
            Height := cPedFormHeight
         else
            Height := 284;
      end
   else
      begin
         if ( FCountry = Ireland ) then
            begin
               if ( FSireType = stAISire ) then
                  Height := 200
               else
                  Height := 240;
            end
         else
            begin
               if ( FSireType = stAISire ) then
                  Height := 236
               else
                  Height := 240;
            end;
      end;

   if ( FSireType = stAISire ) then
      begin
         if ( FCountry = Ireland ) then
            begin
               if ( lName.Visible ) then
                  Width := 348
               else
                  Width := 328;
            end
         else
            Width := 400;
      end
   else
      begin
         if ( gbAddSireNatId.Visible ) then
            Width := 400
         else
            Width := 260;
      end;

end;

procedure TfmAddSire.btnSaveClick(Sender: TObject);
var
   AnimalID : Integer;
   AISire : TAnimalRecord;
   FormattedNatID : String;
   aCurrentAnimal : TAnimal;

   function AnimalInUse(const AAICode : String): Integer;
   begin
      Result := 0;
      if ( Length(AAICode) = 0 ) then Exit;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add( InsertSELECT(['ID']));
            SQL.Add( InsertFROM(['Animals']));
            SQL.Add( InsertWHERE(['AnimalNo'],[':AnimalNo']));
            Params[0].AsString := AAICode;
            Open;
            try
               First;
               Result := Fields[0].AsInteger;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

   function SireExtRecCreated ( ABullID : Integer ) : Boolean;
   begin
      Result := False;
      if ( ABullID = 0 ) then Exit;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('INSERT INTO BullExt (AnimalID)');
            SQL.Add('VALUES (:AnimalID)');
            Params[0].AsInteger := ABullID;
            ExecSQL;
            Result := True;
         finally
            Free;
         end;
   end;

begin
   inherited;
   teSireCode.PostEditValue;
   if ( Length(teSireCode.Text) = 0 ) and ( FSireType = stAISire ) then
      begin
         MessageDlg('You must enter an AI Code.',mtError,[mbOK],0);
         Abort;
      end;

   if ( FSireType = stAISire ) then
      if ( FCountry = Ireland ) then
         if ( not(HerdLookup.IsValidAICode(teSireCode.Text)) ) then
            begin
               MessageDlg('Invalid AI Code Entered',mtError,[mbOK],0);
               Abort;
            end;

   AnimalID := AnimalInUse(teSireCode.Text);
   if ( AnimalID > 0 ) then
      begin
         MessageDlg(Format('Sire "%s" already exists.',[teSireCode.Text]),mtError,[mbOK],0);
         Abort;
      end;

   cmboBreed.PostEditValue;
   if ( Length(cmboBreed.Text) = 0 ) then
      begin
         MessageDlg('You must enter a breed.',mtError,[mbOK],0);
         Abort;
      end;

   teName.PostEditValue;

   teNatIDNum.PostEditValue;
   if ( cbAddSireNatId.Checked ) then
      begin
         if  ( Length(teNatIDNum.Text) = 0 ) then
            begin
               MessageDlg('Add Sire Nat. ID selected but Nat. ID Num is not entered.',mtError,[mbOK],0);
               Abort;
            end
         else
            begin
               if ( not(CheckNatID(teNatIDNum.Text, FormattedNatID, True)) ) then
                  begin
                     MessageDlg(Format('Invalid National ID',[FormattedNatID]),mtError,[mbOK],0);
                     Abort;
                  end
               else if ( IsNINatID(teNatIDNum.Text)) and ( not(CheckNINatID(teNatIDNum.Text, FormattedNatID)) ) then
                  begin
                     MessageDlg(Format('Invalid National ID',[FormattedNatID]),mtError,[mbOK],0);
                     Abort;
                  end;
            end;
         aCurrentAnimal := GetAnimal(FormattedNatID);
         if ( aCurrentAnimal <> nil ) then
            begin
               MessageDlg(Format('National ID "%s" already in use',[FormattedNatID]),mtError,[mbOK],0);
               Abort;
            end;
         //   27/09/21 [V6.0 R2.5] /MK Bug Fix - No need to add the IE or 372 if its already in the FormattedNatId.
         if ( IsIETag(FormattedNatID) ) and ( not(Copy(UpperCase(FormattedNatID),0,2) = 'IE') ) then
            FormattedNatID := 'IE '+FormattedNatID
         else if ( Is372Tag(FormattedNatID) ) and ( not(Copy(UpperCase(FormattedNatID),0,3) = '372') ) then
            FormattedNatID := '372 '+FormattedNatID;
         teNatIDNum.Text := FormattedNatID;
      end;
   if ( AnimalID <= 0 ) then
      begin
         // Add animal to database
         AISire := TAnimalRecord.Create;
         AISire.CreateBullSemenStkRecord := True;
         try
            AISire.RaiseExceptions := False;

            AISire.AddToNoneHerd;
            if ( FCountry = Ireland ) then
               AISire.AnimalNo := teSireCode.Text
            else
               AISire.AnimalNo := teShortName.Text;

            if ( (cbAddSireNatId.Checked) and (Length(teNatIDNum.Text) > 0) ) then
               begin
                  AISire.ValidateIdTags := True;
                  AISire.NatIDNum := teNatIDNum.Text;
               end;

            AISire.Sex := cSex_Bull;
            AISire.Name := teName.Text;
            AISire.LactNo := 0;
            AISire.InHerd := True;
            AISire.Breeding := True;
            AISire.DamID  := 0;
            AISire.SireID := 0;
            AISire.AnimalDeleted := False;

            if ( FCountry <> Ireland ) then
               AISire.UKAISireCode := teSireCode.Text;

            AISire.Pedigree := True;

            AISire.PrimaryBreed := cmboBreed.EditValue;
            if not AISire.Save then
               AISire.Cancel
            else
               begin
                  // Add BullSemenStk Record
                  if ( not(SireExtRecCreated(AISire.ID)) ) then
                     MessageDlg('Unable to create the sires extension table record. Contact Kingswood',mtInformation,[mbOK],0)
                  else
                     begin
                        if ( MessageDlg(Format('Sire "%s" has been added to the database.'+cCRLF+
                                       'Do you want to add another sire?',[teSireCode.Text]),mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                           ClearDetails
                        else
                           Close;
                     end;
               end;
         finally
            FreeAndNil(AISire);
         end;
      end
end;

procedure TfmAddSire.btnCancelClick(Sender: TObject);
begin
   teSireCode.PostEditValue;
   cmboBreed.PostEditValue;
   teName.PostEditValue;
   if ( ((FSireType = stAISire) and ((Length(teSireCode.Text) > 0) or (Length(teName.Text) > 0))) or
        (cmboBreed.EditValue <> Null) ) then
      begin
         if ( MessageDlg('Unsaved changes, exit anyway?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            Close;
      end
   else
      Close;
end;

procedure TfmAddSire.ClearDetails;
begin
   teSireCode.Text := '';
   teSireCode.PostEditValue;
   cmboBreed.EditValue := Null;
   cmboBreed.PostEditValue;
end;

procedure TfmAddSire.cmboBreedPropertiesChange(Sender: TObject);
begin
   if ( FSireType = stNonHerdSire ) then
      teSireCode.Text := cmboBreed.Text;
end;

procedure TfmAddSire.teSireCodeKeyPress(Sender: TObject; var Key: Char);
begin
   if ( not(Key in [#8, '0'..'9']) ) and ( not(Key in ['a'..'z'] + ['A'..'Z']) ) then
      Key := #0;
end;

procedure TfmAddSire.FormDestroy(Sender: TObject);
begin
   HerdLookup.mdPureBredBreeds.Close;
end;

procedure TfmAddSire.cbAddSireNatIdPropertiesChange(Sender: TObject);
begin
   gbAddSireNatId.Visible := cbAddSireNatId.Checked;
   gbAddSireNatId.Width := 342;
   Height := 240;
   Width := 260;
   if ( cbAddSireNatId.Checked ) then
      begin
         if ( lSireNatIdInfoText.Visible ) then
            begin
               lNatIDNum.Top := 60;
               teNatIDNum.Top := 62;
               gbAddSireNatId.Height := 110;
               gbAddSireNatId.Width := 344;
               Width := 428;
               Height := 330;
            end
         else
            begin
               lNatIDNum.Top := 28;
               teNatIDNum.Top := 30;
               gbAddSireNatId.Height := 74;
               gbAddSireNatId.Width := 296;
               Width := 382;
               Height := 296;
            end;
      end;
end;

end.
