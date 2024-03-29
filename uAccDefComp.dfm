object AccDefComp: TAccDefComp
  Left = 328
  Top = 251
  Width = 457
  Height = 224
  Caption = 'Default Accounts'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 441
    Height = 139
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Bevel1: TBevel
      Left = 283
      Top = 22
      Width = 138
      Height = 50
      Shape = bsFrame
    end
    object Label2: TLabel
      Left = 291
      Top = 11
      Width = 94
      Height = 16
      Caption = 'Select Default'
    end
    object AliasListing: TListBox
      Left = 283
      Top = 30
      Width = 147
      Height = 105
      Hint = 
        'Click to select default company. '#13#10'This allows Sales/Purchases t' +
        'o be entered in Kingswood Accounts'
      ItemHeight = 16
      TabOrder = 0
      OnClick = AliasListingClick
    end
    object RxDBGrid1: TRxDBGrid
      Left = 8
      Top = 14
      Width = 262
      Height = 121
      DataSource = dsOwners
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'HerdIdentity'
          Title.Caption = 'Herd Identity'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DefAccComp'
          Title.Caption = 'Default Accounts'
          Width = 136
          Visible = True
        end>
    end
  end
  object Dock971: TDock97
    Left = 0
    Top = 0
    Width = 441
    Height = 49
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object RxSpeedButton2: TRxSpeedButton
        Left = 0
        Top = 0
        Width = 61
        Height = 45
        Caption = '&Exit'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301111111110333337F333333337F33330111111111
          0333337F333333337F333301111111110333337F333333337F33330111111111
          0333337F333333337F333301111111110333337F333333337F33330111111111
          0333337F3333333F7F333301111111B10333337F333333737F33330111111111
          0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
          0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
          0333337F377777337F333301111111110333337F333333337F33330111111111
          0333337FFFFFFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        Transparent = True
        OnClick = RxSpeedButton2Click
      end
      object ToolbarSep971: TToolbarSep97
        Left = 61
        Top = 0
      end
      object ToolbarSep972: TToolbarSep97
        Left = 267
        Top = 0
      end
      object KwDBNavigator1: TKwDBNavigator
        Left = 67
        Top = 0
        Width = 200
        Height = 45
        DataSource = dsOwners
        VisibleButtons = [kwnbPost, kwnbCancel]
        Flat = True
        TabOrder = 0
        BeforeAction = KwDBNavigator1BeforeAction
      end
    end
  end
  object Owners: TTable
    AfterScroll = OwnersAfterScroll
    DatabaseName = 'Kingswd'
    TableName = 'Owners.DB'
    Left = 390
    Top = 11
  end
  object dsOwners: TDataSource
    DataSet = Owners
    Left = 356
    Top = 11
  end
end
