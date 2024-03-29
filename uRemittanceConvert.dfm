object fmRemittanceConvert: TfmRemittanceConvert
  Left = 361
  Top = 248
  Width = 791
  Height = 528
  Caption = 'fmRemittanceConvert'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object teConvertFile: TcxTextEdit
    Left = 18
    Top = 27
    Properties.ReadOnly = True
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Width = 453
  end
  object teConvertedFileName: TcxTextEdit
    Left = 18
    Top = 96
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Text = 'Remittance.rmt'
    Width = 121
  end
  object cxButton1: TcxButton
    Left = 20
    Top = 49
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 2
    OnClick = cxButton1Click
    LookAndFeel.NativeStyle = True
  end
  object cxButton2: TcxButton
    Left = 148
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Convert'
    TabOrder = 3
    OnClick = cxButton2Click
    LookAndFeel.NativeStyle = True
  end
  object cxMemo1: TcxMemo
    Left = 18
    Top = 152
    ParentFont = False
    Properties.ScrollBars = ssBoth
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    Height = 297
    Width = 741
  end
  object cxLabel1: TcxLabel
    Left = 18
    Top = 11
    Caption = 'Select the file to convert'
  end
  object cxLabel2: TcxLabel
    Left = 18
    Top = 78
    Caption = 'Enter the new filename'
  end
  object cxLabel3: TcxLabel
    Left = 18
    Top = 134
    Caption = 'File Output'
  end
  object btnSaveOutput: TcxButton
    Left = 646
    Top = 458
    Width = 113
    Height = 25
    Caption = 'Save Output'
    TabOrder = 8
    OnClick = btnSaveOutputClick
    LookAndFeel.NativeStyle = True
  end
  object OpenDialog: TOpenDialog
    Filter = 'CSV|*.CSV|All Files|*.*'
    InitialDir = 'C:\Kingswood Herd Management'
    Left = 480
    Top = 16
  end
  object Parser: TSPParser
    Sepchar = ','
    CharSearch = True
    Left = 512
    Top = 18
  end
end
