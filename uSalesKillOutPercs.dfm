object fmSalesKillOutPercs: TfmSalesKillOutPercs
  Left = 465
  Top = 291
  Width = 434
  Height = 384
  Caption = 'Sales Kill Outs'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object KillOutPersGrid: TcxGrid
    Left = 0
    Top = 44
    Width = 426
    Height = 306
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
    object KillOutPercsGridTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnEditKeyDown = KillOutPercsGridTableViewEditKeyDown
      DataController.DataSource = WinData.dsKillOutPercs
      DataController.DetailKeyFieldNames = 'ID'
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object KillOutPercsGridTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object KillOutPercsGridTableViewCategory: TcxGridDBColumn
        DataBinding.FieldName = 'Category'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Styles.Content = cxStyle1
        Width = 204
      end
      object KillOutPercsGridTableViewPercentage: TcxGridDBColumn
        DataBinding.FieldName = 'Percentage'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = '#.##%'
        Width = 209
      end
    end
    object KillOutPersGridLevel1: TcxGridLevel
      GridView = KillOutPercsGridTableView
    end
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Toolbar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 484
        FloatTop = 279
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxblbExit
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            Visible = True
          end>
        Name = 'Toolbar'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsStandard
    UseSystemFont = True
    Left = 248
    Top = 8
    DockControlHeights = (
      0
      0
      44
      0)
    object dxblbExit: TdxBarLargeButton
      Action = actExit
      Category = 0
      Height = 40
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000420B0000420B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF4A5E8642557C313F5BFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A5E8642557C38619038
        6190313F5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        4A5E8642557C3F67973C6594396291386190313F5B394A6B394A6B394A6B394A
        6B394A6B394A6BFF00FFFF00FFFF00FF4A5E86446D9C416A993F67973C65943A
        6392313F5B3A577A42638C42638C42638C42638C394A6BFF00FFFF00FFFF00FF
        4A5E86476F9F446D9C416A993F67973D6695313F5B0F49340F47320F46320F45
        31104531394A6BFF00FFFF00FFFF00FF4A5E864A72A2476F9F446D9C416A9940
        6998313F5B164D38164A36154935164633154431394A6BFF00FFFF00FFFF00FF
        4A5E864D75A54A72A2476F9F446D9C436B9B313F5B1C7A5B1C7C5E1D7D601E78
        5B1E7257394A6BFF00FFFF00FFFF00FF4A5E864F77A74D75A56188B96188B946
        6E9E313F5B1F83601E79581E6E4F1D6245205E43394A6BFF00FFFF00FFFF00FF
        4A5E86527AAA4F77A76188B9FFFFFF4871A0313F5B5A7662798370959484AF9C
        8ABB9887394A6BFF00FFFF00FFFF00FF4A5E86567EAE527AAA4F77A74E76A64B
        73A3313F5BF0BAA4F0B297F1BFA8F0BFA8F1BFA9394A6BFF00FFFF00FFFF00FF
        4A5E865A81B2567EAE527AAA5179A94E76A6313F5BF0B79EF2BFA9F4E0D7F2C6
        AEF1A581394A6BFF00FFFF00FFFF00FF4A5E865D85B55A81B2567EAE547CAC51
        79A9313F5BEE7B45F0A27DF1A986EF7D45F08956394A6BFF00FFFF00FFFF00FF
        4A5E866188B95D85B55A81B2587FB0547CAC313F5BED733BEC6F34EB6F33EC6E
        32EE8655394A6BFF00FFFF00FFFF00FF42557C4A5E866188B95D85B55B83B358
        7FB0313F5BE96F3CE65F24E76731EE9D7BED946D394A6BFF00FFFF00FFFF00FF
        FF00FFFF00FF4A5E8642557C5F86B75B83B3313F5B394A6B394A6B394A6B394A
        6B394A6B394A6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A5E8642
        557C313F5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Width = 55
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 40
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF1B74AF1B74AF1B74AF1B74AF1B74AF1B
        74AF1B74AF1B74AF1B74AF1B74AF1B74AF1B74AFFF00FFFF00FFFF00FF1B74AF
        F4FAFCF0F8FCECF6FBE8F4FAE4F2FAE1F0F9DDEEF8D9ECF8D5EAF7D1E8F6CEE6
        F6CEE6F61B74AFFF00FFFF00FF1B74AFF8FCFD3BA2D835A0D6309DD52A9BD425
        99D31F96D21A94D01491CF0F8FCE098DCDCEE6F61B74AFFF00FFFF00FF1B74AF
        FBFEFE40A4D93BA2D835A0D68DC5EB2A9BD42498D31F96D21994D01491CF0F8F
        CED1E8F61B74AFFF00FFFF00FF1B74AFFFFFFF45A7DA40A4D98DC5EBFFFFFF8D
        C5EB2A9BD42599D31F96D21994D01491CFD5EAF71B74AFFF00FFFF00FF1B74AF
        FFFFFF4BAADC8DC5EBFFFFFF8DC5EBFFFFFF8DC5EB2B9CD42699D32096D21B94
        D1D9ECF81B74AFFF00FFFF00FF1B74AFFFFFFF8DC5EBFFFFFF8DC5EB42A5D98D
        C5EBFFFFFF8DC5EB2C9CD42699D32197D2DDEEF81B74AFFF00FFFF00FF1B74AF
        FFFFFF5CB1DF8DC5EB4CAADC48A8DA43A6D98DC5EBFFFFFF8DC5EB2C9CD4279A
        D3E3F1F91B74AFFF00FFFF00FF1B74AFFFFFFF65B5E15CB1DF52ADDD4CAADC48
        A8DA42A5D98DC5EBFFFFFF8DC5EB2C9CD4E6F3FA1B74AFFF00FFFF00FF1B74AF
        FFFFFF6EB9E365B5E15BB1DF52ADDD4CAADC47A8DA42A5D98DC5EBFFFFFF8DC5
        EBEAF5FB1B74AFFF00FFFF00FF1B74AFFFFFFF79BEE671BAE467B6E15DB2DF55
        AEDE4DAADC48A8DB43A6D98DC5EB38A1D7EEF7FB1B74AFFF00FFFF00FF1B74AF
        FFFFFF84C2E87CBFE671BAE468B6E260B2E055AEDD4EABDC49A9DB44A6DA3FA4
        D9F2F9FC1B74AFFF00FFFF00FF1B74AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDFFFEFAFDFEF6FBFD1B74AFFF00FFFF00FFFF00FF
        1B74AF1B74AF1B74AF1B74AF1B74AF1B74AF1B74AF1B74AF1B74AF1B74AF1B74
        AF1B74AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Width = 55
    end
  end
  object ActionList1: TActionList
    Images = WinData.Images
    Left = 218
    Top = 8
    object actExit: TAction
      Caption = 'Exit'
      ImageIndex = 0
      OnExecute = actExitExecute
    end
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 4
      OnExecute = actSaveExecute
    end
    object actCancel: TAction
      Caption = 'Cancel'
      ImageIndex = 7
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 188
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
  end
end
