inherited fmHerdStatistics: TfmHerdStatistics
  Left = 548
  Top = 203
  Width = 679
  Height = 588
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Herd Statistics'
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  Scaled = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label55: TLabel [0]
    Left = 10
    Top = 38
    Width = 98
    Height = 13
    Caption = 'Current Herd Index'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label56: TLabel [1]
    Left = 222
    Top = 38
    Width = 6
    Height = 13
    Alignment = taRightJustify
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object PageControl: TcxPageControl [2]
    Left = 0
    Top = 51
    Width = 671
    Height = 495
    ActivePage = tsA1A2Results
    Align = alClient
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    Style = 9
    TabHeight = 28
    TabOrder = 5
    TabWidth = 140
    OnPageChanging = PageControlPageChanging
    ClientRectBottom = 495
    ClientRectRight = 671
    ClientRectTop = 29
    object tsHerdStats: TcxTabSheet
      Caption = 'Herd Statistics'
      ImageIndex = 0
      object gbDairy: TcxGroupBox
        Left = 17
        Top = 8
        Caption = 'Cows'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 203
        Width = 250
        object Label20: TLabel
          Left = 132
          Top = 10
          Width = 24
          Height = 13
          Caption = 'Nos.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label37: TLabel
          Left = 197
          Top = 10
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object lTotCowsInHerd: TLabel
          Left = 153
          Top = 31
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotPdCon: TLabel
          Left = 153
          Top = 145
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotServNotPd: TLabel
          Left = 153
          Top = 125
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotNotServ: TLabel
          Left = 153
          Top = 105
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotInMilk: TLabel
          Left = 153
          Top = 58
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotDry: TLabel
          Left = 153
          Top = 78
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercCowsInHerd: TLabel
          Left = 205
          Top = 31
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercPdCon: TLabel
          Left = 205
          Top = 145
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercServNotPd: TLabel
          Left = 205
          Top = 125
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercNotServ: TLabel
          Left = 205
          Top = 105
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercInMilk: TLabel
          Left = 205
          Top = 58
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercDry: TLabel
          Left = 205
          Top = 78
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 18
          Top = 31
          Width = 72
          Height = 13
          Caption = 'Cows in Herd:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 18
          Top = 105
          Width = 59
          Height = 13
          Caption = 'Not Served:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 18
          Top = 125
          Width = 75
          Height = 13
          Caption = 'Served not PD:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Lable2: TLabel
          Left = 18
          Top = 145
          Width = 47
          Height = 13
          Caption = 'Pregnant'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label5: TLabel
          Left = 18
          Top = 58
          Width = 38
          Height = 13
          Caption = 'In Milk:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label6: TLabel
          Left = 18
          Top = 78
          Width = 20
          Height = 13
          Caption = 'Dry:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel1: TBevel
          Left = 18
          Top = 51
          Width = 198
          Height = 2
          Shape = bsBottomLine
        end
        object Bevel4: TBevel
          Left = 18
          Top = 98
          Width = 198
          Height = 2
          Shape = bsBottomLine
        end
        object Label16: TLabel
          Left = 18
          Top = 165
          Width = 69
          Height = 13
          Caption = 'Not Pregnant'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lTotNotPreg: TLabel
          Left = 153
          Top = 165
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lPerclNotPreg: TLabel
          Left = 205
          Top = 165
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
      object gbCattle: TcxGroupBox
        Left = 281
        Top = 8
        Caption = 'Cattle'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Height = 203
        Width = 250
        object Label2: TLabel
          Left = 132
          Top = 10
          Width = 22
          Height = 13
          Caption = 'No'#39's'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label13: TLabel
          Left = 197
          Top = 10
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 9
          Top = 29
          Width = 97
          Height = 13
          Caption = '* Breeding Heifers:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label8: TLabel
          Left = 18
          Top = 49
          Width = 65
          Height = 13
          Caption = 'Beef Heifers:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label9: TLabel
          Left = 18
          Top = 80
          Width = 78
          Height = 13
          Caption = 'Breeding Bulls:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label10: TLabel
          Left = 18
          Top = 100
          Width = 54
          Height = 13
          Caption = 'Beef Bulls:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 18
          Top = 130
          Width = 34
          Height = 13
          Caption = 'Steers:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotDairyHeif: TLabel
          Left = 153
          Top = 29
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotBeefHeif: TLabel
          Left = 153
          Top = 49
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotDairyBull: TLabel
          Left = 153
          Top = 80
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotBeefBull: TLabel
          Left = 153
          Top = 100
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotSteers: TLabel
          Left = 153
          Top = 130
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercDairyHeif: TLabel
          Left = 205
          Top = 29
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercBeefHeif: TLabel
          Left = 205
          Top = 49
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercDairyBull: TLabel
          Left = 205
          Top = 80
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercSteers: TLabel
          Left = 205
          Top = 130
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercBeefBull: TLabel
          Left = 205
          Top = 100
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel5: TBevel
          Left = 18
          Top = 122
          Width = 199
          Height = 2
          Shape = bsBottomLine
        end
        object Bevel6: TBevel
          Left = 18
          Top = 71
          Width = 199
          Height = 2
          Shape = bsBottomLine
        end
        object Label46: TLabel
          Left = 9
          Top = 185
          Width = 105
          Height = 13
          Caption = '* Includes All Breeds'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
      object cxProgressBar: TcxProgressBar
        Left = 17
        Top = 299
        Properties.BeginColor = clBlue
        Properties.EndColor = clBlue
        Properties.Max = 12
        Properties.OverloadValue = 10
        Properties.PeakValue = 5
        Properties.ShowText = False
        Properties.ShowTextStyle = cxtsPosition
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 516
      end
    end
    object tsBreedingStats: TcxTabSheet
      Caption = 'Breeding Statistics'
      ImageIndex = 2
      object gbCalvingIntervals: TcxGroupBox
        Left = 281
        Top = 316
        Caption = 'Current Herd Calving Indices'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Height = 92
        Width = 250
        object Label27: TLabel
          Left = 10
          Top = 32
          Width = 108
          Height = 13
          Caption = 'Current Herd Interval'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label32: TLabel
          Left = 10
          Top = 52
          Width = 117
          Height = 13
          Caption = 'Projected Herd Interval'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lActCalfInterval: TLabel
          Left = 222
          Top = 32
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lProjCalfInterval: TLabel
          Left = 222
          Top = 52
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
      object cxGroupBox3: TcxGroupBox
        Left = 17
        Top = 70
        Caption = 'Services'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 184
        Width = 250
        object Label59: TLabel
          Left = 168
          Top = 10
          Width = 28
          Height = 13
          Caption = 'Nos.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label60: TLabel
          Left = 214
          Top = 10
          Width = 14
          Height = 13
          Caption = '%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label21: TLabel
          Left = 10
          Top = 25
          Width = 68
          Height = 13
          Caption = 'Total Services'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label22: TLabel
          Left = 18
          Top = 65
          Width = 64
          Height = 13
          Caption = 'Served Once'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label23: TLabel
          Left = 18
          Top = 85
          Width = 65
          Height = 13
          Caption = 'Served Twice'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label24: TLabel
          Left = 18
          Top = 105
          Width = 74
          Height = 13
          Caption = 'Served 3 Times'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label25: TLabel
          Left = 18
          Top = 125
          Width = 86
          Height = 13
          Caption = 'Served 4 or more'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercFourthServ: TLabel
          Left = 222
          Top = 125
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercAllServ: TLabel
          Left = 210
          Top = 25
          Width = 18
          Height = 13
          Alignment = taRightJustify
          Caption = '100'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object LTotFirstServ: TLabel
          Left = 190
          Top = 65
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercFirstServ: TLabel
          Left = 222
          Top = 65
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotSecondServ: TLabel
          Left = 190
          Top = 85
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercSecondServ: TLabel
          Left = 222
          Top = 85
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotThirdServ: TLabel
          Left = 190
          Top = 105
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercThirdServ: TLabel
          Left = 222
          Top = 105
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotFourthServ: TLabel
          Left = 190
          Top = 125
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotAllServ: TLabel
          Left = 190
          Top = 25
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lAvgServe: TLabel
          Left = 190
          Top = 145
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label38: TLabel
          Left = 10
          Top = 145
          Width = 92
          Height = 13
          Caption = 'Avg. Services/Cow'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label39: TLabel
          Left = 10
          Top = 45
          Width = 86
          Height = 13
          Caption = 'No. Cows Served'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lNoAnimalsServiced: TLabel
          Left = 190
          Top = 45
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lHAvgServPerCowSexedSemen: TLabel
          Left = 10
          Top = 165
          Width = 168
          Height = 13
          Caption = 'Avg. Services/Cow (Sexed Semen)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lAveServeCowSexSemen: TLabel
          Left = 190
          Top = 165
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
      object cxGroupBox4: TcxGroupBox
        Left = 281
        Top = 70
        Caption = 'Calvings'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Height = 246
        Width = 250
        object Label80: TLabel
          Left = 130
          Top = 10
          Width = 28
          Height = 13
          Caption = 'Nos.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label81: TLabel
          Left = 197
          Top = 10
          Width = 14
          Height = 13
          Caption = '%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label26: TLabel
          Left = 18
          Top = 57
          Width = 4
          Height = 14
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label28: TLabel
          Left = 10
          Top = 25
          Width = 71
          Height = 13
          Caption = 'Total Calvings'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label29: TLabel
          Left = 15
          Top = 54
          Width = 60
          Height = 13
          Caption = 'No Live Calf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label30: TLabel
          Left = 15
          Top = 74
          Width = 55
          Height = 13
          Caption = 'Single Calf'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label31: TLabel
          Left = 15
          Top = 94
          Width = 100
          Height = 13
          Caption = 'Two or More Calves'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lTotAllCalvings: TLabel
          Left = 153
          Top = 25
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotStillBirth: TLabel
          Left = 153
          Top = 53
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lTotSingleBirths: TLabel
          Left = 153
          Top = 74
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lTotTwinBirths: TLabel
          Left = 153
          Top = 94
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lPercAllCalvings: TLabel
          Left = 205
          Top = 25
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object LPercStillBirth: TLabel
          Left = 205
          Top = 53
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lPercSingleBirths: TLabel
          Left = 205
          Top = 74
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lPercTwinBirths: TLabel
          Left = 205
          Top = 94
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label33: TLabel
          Left = 15
          Top = 160
          Width = 54
          Height = 13
          Caption = 'Live Calves'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotLiveCalves: TLabel
          Left = 153
          Top = 160
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercLiveCalves: TLabel
          Left = 205
          Top = 160
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotDeadCalves: TLabel
          Left = 153
          Top = 180
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label34: TLabel
          Left = 15
          Top = 180
          Width = 62
          Height = 13
          Caption = 'Dead Calves'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercDeadCalves: TLabel
          Left = 205
          Top = 180
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label35: TLabel
          Left = 15
          Top = 200
          Width = 66
          Height = 13
          Caption = 'Heifer Calves'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotHeiferCalves: TLabel
          Left = 153
          Top = 200
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercHeiferCalves: TLabel
          Left = 205
          Top = 200
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotBullCalves: TLabel
          Left = 153
          Top = 220
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object TLabel
          Left = 15
          Top = 220
          Width = 55
          Height = 13
          Caption = 'Bull Calves'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercBullCalves: TLabel
          Left = 205
          Top = 220
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label36: TLabel
          Tag = 319
          Left = 10
          Top = 135
          Width = 60
          Height = 13
          Caption = 'Total Calves'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LTotAllCalves: TLabel
          Tag = 319
          Left = 153
          Top = 135
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercAllCalves: TLabel
          Tag = 319
          Left = 205
          Top = 135
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Bevel8: TBevel
          Left = 10
          Top = 114
          Width = 227
          Height = 8
          Shape = bsBottomLine
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 17
        Top = 8
        Caption = 'Period Selection'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Height = 63
        Width = 514
        object Label17: TLabel
          Left = 12
          Top = 35
          Width = 29
          Height = 13
          Caption = 'From'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label18: TLabel
          Left = 200
          Top = 35
          Width = 14
          Height = 13
          Caption = 'To'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object FromBreedingDate: TDateEdit
          Left = 59
          Top = 32
          Width = 110
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          YearDigits = dyFour
          TabOrder = 0
          OnChange = FromBreedingDateChange
        end
        object ToBreedingDate: TDateEdit
          Left = 226
          Top = 32
          Width = 110
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          YearDigits = dyFour
          TabOrder = 1
          OnChange = FromBreedingDateChange
        end
        object cbUseActiveFilter: TcxCheckBox
          Left = 9
          Top = 12
          Caption = 'Apply Animal Grid Filter'
          Properties.ImmediatePost = True
          Properties.OnChange = cbUseActiveFilterPropertiesChange
          TabOrder = 2
          Width = 151
        end
      end
      object cxGroupBox8: TcxGroupBox
        Left = 17
        Top = 254
        Caption = 'Conception Rates'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 4
        Height = 155
        Width = 250
        object lNonReturnRateCaption: TLabel
          Left = 10
          Top = 21
          Width = 86
          Height = 13
          Caption = 'Non Return Rate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercNonReturnRateCows: TLabel
          Left = 222
          Top = 21
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label54: TLabel
          Left = 115
          Top = 21
          Width = 35
          Height = 13
          Caption = '- Cows'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label57: TLabel
          Left = 115
          Top = 41
          Width = 43
          Height = 13
          Caption = '- Heifers'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label58: TLabel
          Left = 115
          Top = 61
          Width = 57
          Height = 13
          Caption = '- All Served'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercNonReturnRateHeifs: TLabel
          Left = 222
          Top = 41
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LPercNonReturnRateAll: TLabel
          Left = 222
          Top = 61
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label63: TLabel
          Left = 10
          Top = 41
          Width = 94
          Height = 12
          Caption = 'Based on                      day'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label64: TLabel
          Left = 48
          Top = 58
          Width = 41
          Height = 12
          Alignment = taCenter
          Caption = 'non return'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lInseminator1: TLabel
          Left = 10
          Top = 95
          Width = 70
          Height = 13
          Caption = 'lInseminator1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lInseminatorRate1: TLabel
          Left = 222
          Top = 94
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lInseminator2: TLabel
          Left = 10
          Top = 113
          Width = 70
          Height = 13
          Caption = 'lInseminator2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lInseminatorRate2: TLabel
          Left = 222
          Top = 112
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lInseminator3: TLabel
          Left = 10
          Top = 132
          Width = 70
          Height = 13
          Caption = 'lInseminator3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lInseminatorRate3: TLabel
          Left = 222
          Top = 132
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object seNonReturnDays: TcxSpinEdit
          Left = 48
          Top = 40
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 365
          Properties.OnChange = seNonReturnDaysPropertiesChange
          Style.TextStyle = []
          TabOrder = 0
          Width = 41
        end
        object lByInseminator: TcxLabel
          Left = 6
          Top = 73
          Caption = 'By Inseminator'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
      end
    end
    object tsBeefHerdStats: TcxTabSheet
      Caption = 'Herd Statisitics'
      ImageIndex = 2
      OnShow = tsBeefHerdStatsShow
      object cxGroupBox1: TcxGroupBox
        Left = 10
        Top = 114
        Caption = 'In Herd Period'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 87
        Width = 515
        object deFromDate: TcxDateEdit
          Left = 48
          Top = 54
          EditValue = 39600d
          Properties.OnChange = deFromDatePropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 87
        end
        object deToDate: TcxDateEdit
          Left = 167
          Top = 54
          EditValue = 39627d
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 87
        end
        object cxLabel1: TcxLabel
          Left = 12
          Top = 54
          Caption = 'From '
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 144
          Top = 54
          Caption = 'To'
          Transparent = True
        end
        object cxLabel7: TcxLabel
          Left = 10
          Top = 15
          AutoSize = False
          Caption = 
            'Produce results for animals in your herd between the selected pe' +
            'riod'
          Properties.WordWrap = True
          Transparent = True
          Height = 30
          Width = 249
        end
        object cxLabel3: TcxLabel
          Left = 272
          Top = 54
          Caption = 'Sex '
          Transparent = True
        end
        object cmboSex: TcxComboBox
          Left = 302
          Top = 54
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            'All'
            'Bull'
            'Female'
            'Steer')
          Properties.OnChange = cmboSexPropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 6
          Text = 'All'
          Width = 85
        end
        object btnViewResults: TcxButton
          Left = 422
          Top = 53
          Width = 77
          Height = 24
          Caption = 'View Results'
          TabOrder = 7
          OnClick = btnViewResultsClick
          LookAndFeel.NativeStyle = True
        end
      end
      object gbResults: TcxGroupBox
        Left = 10
        Top = 212
        Caption = 'Results'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Height = 81
        Width = 515
        object cxLabel4: TcxLabel
          Left = 8
          Top = 18
          Caption = 'Total Animal Days'
          Transparent = True
        end
        object teTotalAnimalDays: TcxTextEdit
          Left = 100
          Top = 18
          Style.Color = clBtnFace
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 55
        end
        object cxLabel5: TcxLabel
          Left = 186
          Top = 18
          Caption = 'Total Animals'
          Transparent = True
        end
        object teTotalAnimals: TcxTextEdit
          Left = 256
          Top = 18
          Style.Color = clBtnFace
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Width = 55
        end
        object cxLabel6: TcxLabel
          Left = 343
          Top = 20
          Caption = 'Average Days'
          Transparent = True
        end
        object teAvgDays: TcxTextEdit
          Left = 419
          Top = 18
          Style.Color = clBtnFace
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 5
          Width = 55
        end
        object cxLabel8: TcxLabel
          Left = 8
          Top = 47
          Caption = 'Average DLWG'
          Transparent = True
        end
        object teAvgDLWG: TcxTextEdit
          Left = 100
          Top = 45
          Style.Color = clBtnFace
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 7
          Width = 55
        end
      end
      object cxGroupBox7: TcxGroupBox
        Left = 10
        Top = 2
        Caption = 'Cattle In Herd'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Height = 110
        Width = 515
        object Label14: TLabel
          Left = 131
          Top = 10
          Width = 28
          Height = 13
          Caption = 'Nos.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label19: TLabel
          Left = 231
          Top = 10
          Width = 18
          Height = 13
          Caption = '% '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = True
        end
        object Label41: TLabel
          Left = 18
          Top = 29
          Width = 45
          Height = 13
          Caption = 'Heifers:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label43: TLabel
          Left = 18
          Top = 47
          Width = 32
          Height = 13
          Caption = 'Bulls:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label44: TLabel
          Left = 18
          Top = 65
          Width = 42
          Height = 13
          Caption = 'Steers:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lBeefFemales: TLabel
          Left = 152
          Top = 29
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lBeefBulls: TLabel
          Left = 152
          Top = 47
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lBeefSteers: TLabel
          Left = 152
          Top = 65
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lBeefFemalesPerc: TLabel
          Left = 237
          Top = 29
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lBeefSteersPerc: TLabel
          Left = 237
          Top = 65
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lBeefBullsPerc: TLabel
          Left = 237
          Top = 47
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label40: TLabel
          Left = 18
          Top = 88
          Width = 52
          Height = 13
          Caption = 'All Cattle'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lAllCattle: TLabel
          Left = 152
          Top = 88
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lAllCattlePerc: TLabel
          Left = 237
          Top = 88
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel2: TBevel
          Left = 18
          Top = 83
          Width = 227
          Height = 5
          Shape = bsTopLine
        end
      end
    end
    object tsCSHerdSummary: TcxTabSheet
      Caption = 'Condition Scores'
      ImageIndex = 3
      OnShow = tsCSHerdSummaryShow
      object cxGroupBox2: TcxGroupBox
        Left = 10
        Top = 2
        Caption = 'Herd Summary'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 335
        Width = 520
        object Label45: TLabel
          Left = 14
          Top = 284
          Width = 355
          Height = 13
          Caption = 
            'No. of animals with condition score recorded during selected per' +
            'iod '
        end
        object CSGrid: TcxGrid
          Left = 14
          Top = 59
          Width = 485
          Height = 207
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object CSGridDBTableView: TcxGridTableView
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.First.Visible = True
            NavigatorButtons.PriorPage.Visible = True
            NavigatorButtons.Prior.Visible = True
            NavigatorButtons.Next.Visible = True
            NavigatorButtons.NextPage.Visible = True
            NavigatorButtons.Last.Visible = True
            NavigatorButtons.Insert.Visible = True
            NavigatorButtons.Delete.Visible = True
            NavigatorButtons.Edit.Visible = True
            NavigatorButtons.Post.Visible = True
            NavigatorButtons.Cancel.Visible = True
            NavigatorButtons.Refresh.Visible = True
            NavigatorButtons.SaveBookmark.Visible = True
            NavigatorButtons.GotoBookmark.Visible = True
            NavigatorButtons.Filter.Visible = True
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.DataRowHeight = 26
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 28
            object CSGridDBTableViewScoreRange: TcxGridColumn
              Caption = 'Score'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              Styles.Content = ScoreStyle
              Width = 137
            end
            object CSGridDBTableViewNoOfAnimals: TcxGridColumn
              Caption = 'No. of Animals'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Options.Focusing = False
              Width = 103
            end
            object CSGridDBTableViewPercOfTotal: TcxGridColumn
              Caption = '% of Total'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '#.#0'
              Properties.EditFormat = '#.#0'
              Properties.UseDisplayFormatWhenEditing = True
              Properties.ValueType = vtFloat
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              Width = 73
            end
          end
          object CSGridLevel: TcxGridLevel
            GridView = CSGridDBTableView
          end
        end
        object teCSTotalAnimals: TcxTextEdit
          Left = 376
          Top = 280
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Properties.ReadOnly = True
          TabOrder = 1
          Width = 69
        end
        object cmboCSPeriod: TcxComboBox
          Left = 147
          Top = 26
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 4
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.ItemHeight = 21
          Properties.Items.Strings = (
            'Last Month'
            'Last 3 Months'
            'Last 6 Months'
            'Last Year')
          Properties.OnChange = cmboCSPeriodPropertiesChange
          TabOrder = 2
          Text = 'Last Month'
          Width = 154
        end
        object cxLabel9: TcxLabel
          Left = 14
          Top = 28
          Caption = 'Condition Score within  '
        end
      end
    end
    object tsA1A2Results: TcxTabSheet
      Caption = 'A1 A2 Results'
      ImageIndex = 4
      object gbA1A2HerdSummary: TcxGroupBox
        Left = 10
        Top = 7
        Caption = 'Herd Summary'
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 275
        Width = 648
        object A1A2ResultGrid: TcxGrid
          Left = 2
          Top = 16
          Width = 644
          Height = 257
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object A1A2ResultGridTableView: TcxGridTableView
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.First.Visible = True
            NavigatorButtons.PriorPage.Visible = True
            NavigatorButtons.Prior.Visible = True
            NavigatorButtons.Next.Visible = True
            NavigatorButtons.NextPage.Visible = True
            NavigatorButtons.Last.Visible = True
            NavigatorButtons.Insert.Visible = True
            NavigatorButtons.Delete.Visible = True
            NavigatorButtons.Edit.Visible = True
            NavigatorButtons.Post.Visible = True
            NavigatorButtons.Cancel.Visible = True
            NavigatorButtons.Refresh.Visible = True
            NavigatorButtons.SaveBookmark.Visible = True
            NavigatorButtons.GotoBookmark.Visible = True
            NavigatorButtons.Filter.Visible = True
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnHorzSizing = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.DataRowHeight = 26
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 28
            object A1A2ResultGridTableViewCategory: TcxGridColumn
              Caption = 'Category'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              Styles.Content = ScoreStyle
              Styles.Header = HeaderStyle
              Width = 110
            end
            object A1A2ResultGridTableViewCategoryTotal: TcxGridColumn
              Caption = 'Total'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Styles.Header = HeaderStyle
              Width = 58
            end
            object A1A2ResultGridTableViewA2A2Total: TcxGridColumn
              Caption = 'A2A2'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0'
              Properties.EditFormat = '0'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Styles.Header = HeaderStyle
              Width = 58
            end
            object A1A2ResultGridTableViewA2A2Perc: TcxGridColumn
              Caption = 'A2A2%'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0.##'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Styles.Header = HeaderStyle
              Width = 58
            end
            object A1A2ResultGridTableViewA1A2Total: TcxGridColumn
              Caption = 'A1A2'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0'
              Properties.EditFormat = '0'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Styles.Header = HeaderStyle
              Width = 58
            end
            object A1A2ResultGridTableViewA1A2Perc: TcxGridColumn
              Caption = 'A1/A2%'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0.##'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Styles.Header = HeaderStyle
              Width = 58
            end
            object A1A2ResultGridTableViewA1A1Total: TcxGridColumn
              Caption = 'A1A1'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0'
              Properties.EditFormat = '0'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Styles.Header = HeaderStyle
              Width = 58
            end
            object A1A2ResultGridTableViewA1A1Perc: TcxGridColumn
              Caption = 'A1A1%'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0.##'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.FilteringMRUItemsList = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Styles.Header = HeaderStyle
              Width = 58
            end
            object A1A2ResultGridTableViewBlanksTotal: TcxGridColumn
              Caption = 'Blanks'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0'
              Properties.EditFormat = '0'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Styles.Header = HeaderStyle
              Width = 58
            end
            object A1A2ResultGridTableViewBlanksPerc: TcxGridColumn
              Caption = 'Blanks%'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = '0.##'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Styles.Header = HeaderStyle
              Width = 58
            end
          end
          object A1A2ResultGridLevel: TcxGridLevel
            GridView = A1A2ResultGridTableView
          end
        end
      end
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 546
    Width = 671
  end
  object gbHerdID: TcxGroupBox [4]
    Left = 219
    Top = 3
    Style.Edges = []
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 6
    Height = 44
    Width = 148
    object Label15: TLabel
      Left = 7
      Top = -1
      Width = 75
      Height = 13
      Caption = 'Herd Identity'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object HerdCombo: TRxDBLookupCombo
      Left = 7
      Top = 13
      Width = 135
      Height = 23
      DropDownCount = 8
      DropDownWidth = 200
      EmptyValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'HerdIdentity'
      LookupSource = WinData.dsHerdDefaults
      ParentFont = False
      TabOrder = 0
      OnCloseUp = HerdComboCloseUp
    end
  end
  object pRunStats: TPanel [5]
    Left = 9
    Top = 499
    Width = 65
    Height = 47
    Color = 43520
    TabOrder = 7
    object btnRunStats: TRxSpeedButton
      Left = 0
      Top = 1
      Width = 65
      Height = 45
      Caption = 'Run'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000430B0000430B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF41879BFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E8541
        879BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF1D6E8591C3D241879BFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E8591
        C3D21D6E85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF1D6E8591C3D21D6E85FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E8591
        C3D241879B1D6E85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF1D6E8591C3D25799AC468DA13A85991D6E85FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1D6E8591C3D261A0B254
        97AA468DA13A85992A778C1D6E85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF1D6E8591C3D276AFC05998AB3F81943A80943A85992C7B902173891D6E
        85FF00FFFF00FFFF00FFFF00FFFF00FF1D6E8597C7D575ABBA3B778947869C6F
        B1CD117B9C2266791E63761E6B811E6E841D6E85FF00FFFF00FFFF00FFFF00FF
        1F6D8326738946A5BCA4FFFF45D0FD8AD7FD45A8E30022AC1725AC3970922B6E
        82185C70FF00FFFF00FFFF00FFFF00FF6BA7B926738932A5CDA4EBFB8AF5FD45
        C5F60022BF0000BE0000CC1725AC5D8E9C6BA7B9FF00FFFF00FFFF00FFFF00FF
        FF00FFAA521058695740778767C5F61E4DD2191ECA0000D90000DE0000C58D8D
        D3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC07331AC4100B74C007E604C41
        2E997084E8191ECA0000CF7171CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF744747DCA372ECA544AF68109F71533838C43838C48D8DDDFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB99E98976554CBBABAFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Transparent = True
      OnClick = btnRunStatsClick
    end
  end
  inherited ActionList: TActionList
    Left = 561
    Top = 10
    object actPrint: TAction
      Caption = 'Print'
      ImageIndex = 19
      OnExecute = actPrintExecute
    end
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Main'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 353
        FloatTop = 250
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bClose
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem2
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem1
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bHelp
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Main'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 472
    Top = 10
    DockControlHeights = (
      0
      0
      51
      0)
    inherited bClose: TdxBarLargeButton
      Height = 44
    end
    inherited bHelp: TdxBarLargeButton
      Height = 44
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actPrint
      Category = 0
      Height = 44
      Width = 55
    end
    object dxBarControlContainerItem2: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pRunStats
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 502
    Top = 10
  end
  object GenQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 532
    Top = 10
  end
  object Query1: TQuery
    DatabaseName = 'Kingswd'
    Left = 442
    Top = 10
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 590
    Top = 10
    object ScoreStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWindowText
    end
    object HeaderStyle: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object GridPrinter: TdxComponentPrinter
    CurrentLink = A1A2ResultGridPrinterLink
    Version = 0
    Left = 622
    Top = 11
    object A1A2ResultGridPrinterLink: TdxGridReportLink
      Active = True
      Component = A1A2ResultGrid
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 44442.7210373727
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.Footers = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
