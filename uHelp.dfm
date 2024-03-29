object fmHelp: TfmHelp
  Left = 757
  Top = 365
  BorderStyle = bsDialog
  Caption = 'Help'
  ClientHeight = 159
  ClientWidth = 732
  Color = clInfoBk
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 17
  object pcHelp: TcxPageControl
    Left = 0
    Top = 0
    Width = 732
    Height = 159
    ActivePage = tsStockValuation
    Align = alClient
    HideTabs = True
    TabOrder = 0
    ClientRectBottom = 159
    ClientRectRight = 732
    ClientRectTop = 0
    object tsStockValuation: TcxTabSheet
      Caption = 'Livestock Valuation'
      ImageIndex = 0
      object lStockValHelp: TcxLabel
        Left = 0
        Top = 0
        Align = alClient
        Caption = 
          'Livestock Valuation - Calculation of Key Parameters'#13#10#13#10'1. Formul' +
          'a for calculating Net Realisable Value is [Purchase Weight + (Da' +
          'ys on Farm x DLWG)] x Kill Out % x Sale Price/Kg.'#13#10'2. Where Purc' +
          'hase Weight is not available this formula becomes [Age(Days) x D' +
          'LWG] x Kill Out % x Sale Price/Kg.'#13#10'3. Animal details in red (co' +
          'mplete line) indicates that no Purchase Event details are availa' +
          'ble.'#13#10'4. Net Realisable Value in red indicates that no Purchase ' +
          'Weight is available.'#13#10'5. DLWG ( (Sale Weight - Purchase Weight (' +
          'if available) / Days on Farm) is estimated from sales in the las' +
          't 30 days.'#13#10'6. Sale Price/Kg (Sale Price / Cold Dead Weight) val' +
          'ue is estimated from sales in the last 30 days.'
      end
    end
  end
end
