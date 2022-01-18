inherited fmTreatmentSummary: TfmTreatmentSummary
  Left = 712
  Top = 271
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Veterinary Treatment Summary'
  ClientHeight = 394
  ClientWidth = 536
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 374
    Width = 536
  end
  object InfoPanel: TPanel [1]
    Left = 0
    Top = 49
    Width = 536
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object lInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 
        'Below are the number of treatments by medicine type within the f' +
        'ollowing date range : '
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 55
      Width = 536
    end
    object btnApply: TcxButton
      Left = 406
      Top = 60
      Width = 75
      Height = 25
      Action = actApply
      TabOrder = 1
      Visible = False
      LookAndFeel.Kind = lfOffice11
    end
    object DateFrom: TcxDateEdit
      Left = 98
      Top = 61
      Properties.OnChange = DateFromPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Width = 121
    end
    object DateTo: TcxDateEdit
      Left = 277
      Top = 61
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 121
    end
    object lDateFrom: TcxLabel
      Left = 51
      Top = 62
      AutoSize = False
      Caption = 'From:'
      Style.TextStyle = [fsBold]
      Height = 21
      Width = 44
    end
    object lDateTo: TcxLabel
      Left = 248
      Top = 63
      Caption = 'To:'
      Style.TextStyle = [fsBold]
    end
  end
  object DataPanel: TPanel [2]
    Left = 0
    Top = 154
    Width = 536
    Height = 220
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 6
    object BordBiaGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 536
      Height = 155
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object BordBiaGridTableView: TcxGridTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
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
        OptionsView.FocusRect = False
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 70
        OptionsView.Indicator = True
        Styles.Header = HeaderStyle
        object BordBiaGridTableViewAntibiotics: TcxGridColumn
          Caption = 'Antibiotic'#13#10'Injections'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
        object BordBiaGridTableViewDoses: TcxGridColumn
          Caption = 'Dosing'#13#10'(Worm/Fluke)'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
        object BordBiaGridTableViewVaccines: TcxGridColumn
          Caption = 'Vaccines'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
        object BordBiaGridTableViewTubes: TcxGridColumn
          Caption = 'Mastitis /'#13#10'Intramammary'#13#10'milking cow'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
        object BordBiaGridTableViewOther: TcxGridColumn
          Caption = 'Other'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
      end
      object BordBiaGridLevel: TcxGridLevel
        GridView = BordBiaGridTableView
      end
    end
    object lNoDryCowTreatHeader: TcxLabel
      Left = 16
      Top = 165
      Anchors = [akLeft, akBottom]
      Caption = ' Number of dry cow'#13#10' treatments over last year'
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.TextStyle = [fsBold]
    end
    object lNoDryCowTreats: TcxLabel
      Left = 201
      Top = 172
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = 'NoDryCowTreats'
      ParentColor = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Color = clInfoBk
      Style.TextStyle = []
      Height = 22
      Width = 50
    end
    object lHerdIdentity: TcxLabel
      Left = 276
      Top = 165
      Anchors = [akLeft, akBottom]
      Caption = 'Herd Identity :'
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.TextStyle = [fsBold]
    end
    object lHerdIdentityTxt: TcxLabel
      Left = 377
      Top = 165
      Anchors = [akLeft, akBottom]
      Caption = 'lHerdIdentityTxt'
      ParentColor = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Color = clInfoBk
      Style.TextStyle = []
    end
  end
  inherited ActionList: TActionList
    Left = 256
    inherited actHelp: TAction
      OnExecute = actHelpExecute
    end
    object actApply: TAction
      Caption = 'Apply'
      OnExecute = actApplyExecute
    end
    object actPrint: TAction
      Caption = 'Print'
      ImageIndex = 33
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
            Item = dxBarLargeButton1
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
    Left = 226
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actPrint
      Category = 0
      Height = 45
      Width = 65
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 287
    Top = 9
    object HeaderStyle: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = DataPanelPrinterLink
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 318
    Top = 10
    object DataPanelPrinterLink: TdxCustomContainerReportLink
      Component = DataPanel
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
      BuiltInReportLink = True
      HiddenComponents = {}
      ExcludedComponents = {}
      AggregatedReportLinks = {}
    end
  end
end
