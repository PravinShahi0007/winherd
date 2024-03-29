{
   08/09/17 [V5.7 R2.3] /MK Additional Feature - Screen created to allow user to delete all events for a single animal.
                                                 This screen has not been finished yet as it was replaced by filtering event/feed diary - GL/SP.
}

unit uDeleteBlockSingleAnimalEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  GenTypesConst, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxContainer, cxEdit, cxLabel, uAnimal;

type
  TfmDeleteBlockSingleAnimalEvents = class(TfmBaseForm)
    pAnimalTagInfo: TPanel;
    bDeleteEvents: TdxBarLargeButton;
    actDeleteEvents: TAction;
    actFindEvents: TAction;
    bFindEvents: TdxBarLargeButton;
    pDateFilter: TPanel;
    EventGrid: TcxGrid;
    EventGridAnimalEventsView: TcxGridDBTableView;
    EventGridAnimalEventsViewEventType: TcxGridDBColumn;
    EventGridAnimalEventsViewEventDate: TcxGridDBColumn;
    EventGridAnimalEventsViewEventDesc: TcxGridDBColumn;
    EventGridFeedEventsView: TcxGridDBTableView;
    EventGridFeedEventsViewAllocDate: TcxGridDBColumn;
    EventGridFeedEventsViewQuantDay: TcxGridDBColumn;
    EventGridFeedEventsViewCostDay: TcxGridDBColumn;
    EventGridFeedEventsViewFeedName: TcxGridDBColumn;
    EventGridFeedEventsViewEndDate: TcxGridDBColumn;
    EventGridFeedEventsViewNoDays: TcxGridDBColumn;
    EventGridLevel: TcxGridLevel;
    lAnimalInfo: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm ( Animal : TAnimal );
  end;

var
  fmDeleteBlockSingleAnimalEvents: TfmDeleteBlockSingleAnimalEvents;

implementation

{$R *.DFM}

{ TfmDeleteBlockSingleAnimalEvents }

class procedure TfmDeleteBlockSingleAnimalEvents.ShowTheForm(
  Animal: TAnimal);
begin
   with TfmDeleteBlockSingleAnimalEvents.Create(nil) do
      try
         if ( Animal <> nil ) then
            ShowModal;
      finally
         Free;
      end;
end;

end.
