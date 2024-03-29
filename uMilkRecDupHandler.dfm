object fmMilkRecDupHandler: TfmMilkRecDupHandler
  Left = 424
  Top = 311
  Width = 429
  Height = 257
  Caption = 'Duplicate Animal Record(s) found  '
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 28
    Top = 172
    Width = 245
    Height = 41
    AutoSize = False
    Caption = 'Please select the animal to be included for this milk recording'
    WordWrap = True
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 24
    Width = 377
    Height = 137
    ColCount = 4
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentFont = False
    TabOrder = 0
    ColWidths = (
      111
      162
      64
      64)
  end
  object btnSelect: TButton
    Left = 280
    Top = 176
    Width = 121
    Height = 35
    Caption = 'Select'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btnSelectClick
  end
  object QAnimal: TQuery
    DatabaseName = 'Kingswd'
    Top = 168
  end
  object qDeleteDup: TQuery
    DatabaseName = 'Kingswd'
    Left = 8
    Top = 136
  end
end
