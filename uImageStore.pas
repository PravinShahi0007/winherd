{
   18/01/12 [V5.0 R3.5] /MK Change - New Image 32 Added For New actHerdStats In MenuUnit.

   13/08/13 [V5.1 R9.1] /MK Change - Added Printer image to ImageList16x16.   

   12/05/21 [V6.0 R1.1] /MK Change - Added Calculator image to ImageList16x16.   
}

unit uImageStore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList;

type
  TImageStore = class(TForm)
    ImageList16x16: TImageList;
    DisabledImageList16x16: TImageList;
    HotImageList16x16: TImageList;
    ImageList28x28: TImageList;
    HotImageList28x28: TImageList;
    DisabledImageList28x28: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImageStore: TImageStore;

implementation

{$R *.DFM}

initialization
   ImageStore:= TImageStore.Create(nil);

finalization
   if Assigned(ImageStore) then
      FreeAndNil(ImageStore);

end.
