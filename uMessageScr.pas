{
   02/12/16 [V5.6 R3.7] /MK Change - cVetLinkMessage - Changed caption - requested by GL.

   12/09/17 [V5.7 R3.0] /MK Change - Change lInfo.Caption depending on TMessageType.
                                   - On set lInfoExtra.Caption if TMessageType = mtVetLink.

   03/03/20 [V5.9 R3.0] /MK Change - Added TMessageType for mtUpdateBulls for use with Update Bull List utility.

   24/03/20 [V5.9 R3.0] /MK Additional Feature - Added TMessageTypes for mtICBFAppWarning and mtICBFNoAppWarning for use with the ICBF Event Rec screen.
}

unit uMessageScr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, ActnList, StdCtrls, cxButtons,
  ExtCtrls, GenTypesConst, cxTextEdit, cxHyperLinkEdit, ShellAPI;

type
  TMessageType = (mtVetLink, mtEventDiary, mtFeedEventDiary, mtDoseByKgSelect, mtDoseByKgConfirm,
                  mtUpdateBulls, mtICBFAppWarning, mtICBFNoAppWarning);
  TfmMessageScr = class(TForm)
    pInfo: TPanel;
    ActionList: TActionList;
    lInfo: TcxLabel;
    lInfoExtra: TcxLabel;
    pButton: TPanel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    hlKingswoodWesbite: TcxHyperLinkEdit;
    procedure hlKingswoodWesbiteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm(AMessageType : TMessageType);
    class function ConfirmMessage(AMessageType : TMessageType) : Integer;
  end;

var
  fmMessageScr: TfmMessageScr;

const
   cVetLinkFormCaption = 'VetLink';
   cVetLinkInfoExtraTxt = 'Click Save to proceed with the import of these purchases.';
   cVetLinkTxt = 'Drugs with the amber triangle cannot be found in your existing drugs list.'+cCRLF+
                 'VetLink will allow you to add these drugs to your existing drug list.'+cCRLFx2+
                 'Alternatively if you would like to do a major review of medicines,'+cCRLF+
                 'suppliers etc click on Review Medicines.';

   cBasicEventDiaryFormCaption = 'Event Diary';
   cBasicEventDiaryTxt = 'Only events for animals that are in the herd are displayed.'+cCRLFx2+
                         'If you would like to show events for sold animals exit the Event Diary,'+cCRLF+
                         'tick Show All Animals above the grid of animals on the main screen'+cCRLF+
                         'and then click the Event Diary button again.';

   cBasicFeedEventDiaryFormCaption = 'Feed Event Diary';
   cBasicFeedEventDiaryTxt = 'Only feed events for animals that are in the herd are showing.'+cCRLFx2+
                             'If you would like to show feed events for sold animals exit the Feed Event Diary,'+cCRLF+
                             'tick Show All Animals above the grid of animals on the main screen'+cCRLF+
                             'and then click the Feed Diary button again.';

   cDoseByKgSelectFormCaption = 'Application Rate Per Kilo';
   cDoseByKgSelectTxt = 'You have chosen to dose the selected animals based on their last weight.'+cCRLF+
                        'Animals that don''t have a last weight will be skipped and will not have'+cCRLF+
                        'a health event recorded.';
                        {
                        'For example if the application rate is 2ml and animals last weight is 50kg'+cCRLF+
                        'then the total application rate for this animal is 100ml.';
                        }

   cDoseByKgConfirmFormCaption = 'Confirm Application Rate Per Kilo';
   cDoseByKgConfirmTxt = 'You are about to save a Vet/Dosing event with the application rate'+cCRLF+
                         'being saved as the Total Amount i.e. application rate by last weight.'+cCRLF+
                         'Do you wish to continue with saving this Vet/Dosing event?';

   cUpdateBullsFormCaption = 'Update Active Bulls List';
   cUpdateBullsConfirmTxt = 'You are about to update your Active Bulls List.'+cCRLF+
                            'This utility will clear your Active Bull List. It will then take bulls '+cCRLF+
                            'from current services, from sires of calves in the last year and.'+cCRLF+
                            'any Planned Bull events and mark them as active bulls.'+cCRLFx2+
                            'Do you wish to continue?';

   cICBFAppWarningFormCaption = 'Email of ICBF Events';
   cICBFAppWarningTxt = 'Since you have the Kingswood Herd App installed, all non BDP Welfare events '+cCRLF+
                        'from 1st January 2020 are being sent automatically to ICBF.'+cCRLF+
                        'To benefit from this facility please ensure that Kingswood Herd on your PC'+cCRLF+
                        'is syncing correctly with our server i.e. the "Sync in Progress" screen'+cCRLF+
                        'appears when you open this program.'+cCRLFx2+
                        'Call us at 01-4596677 if you have any queries.';


   cICBFNoAppWarningFormCaption = 'Email of ICBF Events';
   cICBFNoAppWarningTxt = 'There is now an automated transfer of Animal Events from the Kingswood server'+cCRLF+
                          'to the ICBF. This means not having to click on this Gmail link anymore.'+cCRLF+
                          'To avail of this new convenient facility you need to get the Kingswood Herd App.'+cCRLFx2+
                          cCRLF+
                          'Click on the above link or call us at 01-4596677';

implementation

{$R *.DFM}

class procedure TfmMessageScr.ShowTheForm(AMessageType : TMessageType);
begin
   with TfmMessageScr.Create(nil) do
      try
         btnOK.ModalResult := mrOK;
         btnOK.Left := 206;
         btnOK.Caption := 'OK';
         btnCancel.Visible := False;
         hlKingswoodWesbite.Visible := False;
         case AMessageType of
            mtVetLink : begin
                           Caption := cVetLinkFormCaption;
                           lInfoExtra.Caption := cVetLinkInfoExtraTxt;
                           lInfo.Caption := cVetLinkTxt;
                        end;
            mtEventDiary : begin
                              Caption := cBasicEventDiaryFormCaption;
                              lInfoExtra.Caption := '';
                              lInfo.Caption := cBasicEventDiaryTxt;
                           end;
            mtFeedEventDiary : begin
                                  Caption := cBasicFeedEventDiaryFormCaption;
                                  lInfoExtra.Caption := '';
                                  lInfo.Caption := cBasicFeedEventDiaryTxt;
                               end;
            mtDoseByKgSelect : begin
                                  Caption := cDoseByKgSelectFormCaption;
                                  lInfoExtra.Caption := '';
                                  lInfo.Caption := cDoseByKgSelectTxt;
                               end;
            mtICBFAppWarning : begin
                                  Caption := cICBFAppWarningFormCaption;
                                  lInfoExtra.Caption := '';
                                  lInfo.Caption := cICBFAppWarningTxt;
                               end;
            mtICBFNoAppWarning : begin
                                    Caption := cICBFNoAppWarningFormCaption;
                                    lInfoExtra.Caption := '';
                                    lInfo.Caption := cICBFNoAppWarningTxt;
                                 end;
         end;

         if ( Length(lInfoExtra.Caption) > 0 ) then
            lInfoExtra.Height := 33
         else
            lInfoExtra.Height := 0;

         if ( AMessageType in [mtICBFAppWarning, mtICBFNoAppWarning] ) then
            begin
               if ( AMessageType = mtICBFAppWarning ) then
                  Height := 270
               else
                  begin
                     hlKingswoodWesbite.Visible := True;
                     hlKingswoodWesbite.Top := 78;
                     Height := 236;
                  end;
               Width := 582;
               btnOK.Left := 162;
            end
         else
            begin
               Height := 214;
               Width := 518;
               btnOK.Left := 206;
            end;
         ShowModal;
      finally
         Free;
      end;
end;

class function TfmMessageScr.ConfirmMessage(AMessageType: TMessageType): Integer;
begin
   with TfmMessageScr.Create(nil) do
      try
         btnOK.Left := 146;
         btnCancel.Left := 258;
         btnCancel.Visible := False;
         hlKingswoodWesbite.Visible := False;
         case AMessageType of
            mtDoseByKgConfirm : begin
                                   btnOK.Caption := 'Yes';
                                   btnCancel.Caption := 'No';
                                   btnCancel.Visible := True;
                                   lInfoExtra.Caption := '';
                                   Caption := cDoseByKgConfirmFormCaption;
                                   lInfo.Caption := cDoseByKgConfirmTxt;
                                end;
            mtUpdateBulls : begin
                               btnOK.Caption := 'Yes';
                               btnCancel.Caption := 'No';
                               btnCancel.Visible := True;
                               Caption := cUpdateBullsFormCaption;
                               lInfoExtra.Caption := '';
                               lInfo.Caption := cUpdateBullsConfirmTxt;
                            end;
         end;
         if ( Length(lInfoExtra.Caption) > 0 ) then
            lInfoExtra.Height := 33
         else
            lInfoExtra.Height := 0;
         Result := ShowModal;
      finally
         Free;
      end;
end;

procedure TfmMessageScr.hlKingswoodWesbiteClick(Sender: TObject);
begin
   hlKingswoodWesbite.Properties.Alignment.Horz := taCenter;
   ShellExecute(0,'open','https://kingswoodcomputing.com/',nil,nil,SW_SHOWNORMAL);
   Close;
end;

end.
