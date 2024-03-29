inherited fmTempMovementsIn: TfmTempMovementsIn
  Left = 462
  Top = 188
  Width = 581
  Height = 472
  Caption = 'Temp Movements In'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 421
    Width = 573
  end
  object gbMovedOutDate: TcxGroupBox [1]
    Left = 0
    Top = 49
    Align = alTop
    Caption = 'Step 1 - Select Movement Out Date'
    ParentFont = False
    Style.Edges = [bTop]
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfFlat
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 5
    Height = 71
    Width = 573
    object lMovementDate: TcxLabel
      Left = 14
      Top = 30
      Caption = 'Select Out Date:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cmboMovedOff: TcxComboBox
      Left = 110
      Top = 26
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = cmboMovedOffPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.TextStyle = []
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 156
    end
  end
  object gbMovedInDate: TcxGroupBox [2]
    Left = 0
    Top = 120
    Align = alClient
    Caption = 'Step 2 - Review'
    Style.Edges = [bTop]
    Style.LookAndFeel.Kind = lfFlat
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 6
    Height = 230
    Width = 573
    object TempMoveGrid: TcxGrid
      Left = 2
      Top = 20
      Width = 569
      Height = 208
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object TempMoveGridDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnEditing = TempMoveGridDBTableViewEditing
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        object TempMoveGridDBTableViewSelected: TcxGridDBColumn
          DataBinding.FieldName = 'Selected'
          PropertiesClassName = 'TcxCheckBoxProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 25
          IsCaptionAssigned = True
        end
        object TempMoveGridDBTableViewAnimalNo: TcxGridDBColumn
          DataBinding.FieldName = 'AnimalNo'
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
        object TempMoveGridDBTableViewNatIDNum: TcxGridDBColumn
          Caption = 'National ID'
          DataBinding.FieldName = 'NatIDNum'
          HeaderAlignmentVert = vaCenter
          Width = 150
        end
        object TempMoveGridDBTableViewMovementDate: TcxGridDBColumn
          Caption = 'Moved Out'
          DataBinding.FieldName = 'EventDate'
          HeaderAlignmentVert = vaCenter
          Width = 106
        end
        object empMoveGridDBTableViewMovedTo: TcxGridDBColumn
          Caption = 'Moved To'
          DataBinding.FieldName = 'MovedTo'
          HeaderAlignmentVert = vaCenter
          Width = 170
        end
      end
      object TempMoveGridLevel: TcxGridLevel
        GridView = TempMoveGridDBTableView
      end
    end
  end
  object cxGroupBox1: TcxGroupBox [3]
    Left = 0
    Top = 350
    Align = alBottom
    Caption = 'Step 3 - Complete'
    Style.Edges = [bTop]
    Style.LookAndFeel.Kind = lfFlat
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 7
    Height = 71
    Width = 573
    object lMovedIn: TcxLabel
      Left = 14
      Top = 30
      Caption = 'Select In Date:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object deMovedInDate: TcxDateEdit
      Left = 110
      Top = 28
      Properties.AutoSelect = False
      Properties.DateOnError = deNull
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = deMovedInDatePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 156
    end
    object btnSave: TcxButton
      Left = 276
      Top = 28
      Width = 122
      Height = 25
      Action = actSaveEvents
      TabOrder = 2
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF002B934800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF002B93480031A648002B934800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00399B610031A6480031A6480031A648002B934800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002B93480031A6480037B7550033A1580031A648002B934800FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003F94
        660031A6480037B755002F8D58002F8D580037B7550043A1460037B75500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002B93
        480037B755002F8D5800FF00FF00FF00FF002F8D580037B755002B934800FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002F8D5800FF00FF00FF00FF00FF00FF00FF00FF002F8D580037B755002B93
        4800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D580037B7
        550037B75500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D
        580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D5800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfOffice11
    end
  end
  inherited ActionList: TActionList
    Left = 500
    Top = 6
    object actSaveEvents: TAction
      Caption = 'Save Events'
      ImageIndex = 8
      OnExecute = actSaveEventsExecute
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
    Left = 470
    Top = 6
    DockControlHeights = (
      0
      0
      49
      0)
  end
end
