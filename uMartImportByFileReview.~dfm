inherited fmMartImportByFileReview: TfmMartImportByFileReview
  Left = 282
  Top = 162
  Width = 1529
  Height = 737
  Caption = ''
  OldCreateOrder = True
  Position = poDesigned
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 686
    Width = 1521
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Tahoma'
  end
  object pgDefaultTreatments: TcxPageControl [1]
    Left = 0
    Top = 507
    Width = 1521
    Height = 149
    ActivePage = tsHealth
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.Kind = lfFlat
    ParentFont = False
    TabHeight = 26
    TabOrder = 1
    TabWidth = 120
    OnDrawTabEx = pgDefaultTreatmentsDrawTabEx
    ClientRectBottom = 148
    ClientRectLeft = 1
    ClientRectRight = 1520
    ClientRectTop = 29
    object tsHealth: TcxTabSheet
      Caption = 'Health Events'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      ParentFont = False
      object HealthGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 1519
        Height = 119
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object HealthGridDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = HealthGridDBTableViewCellDblClick
          DataController.DataSource = dsHealthTable
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.DataRowHeight = 21
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 26
          OptionsView.Indicator = True
          object HealthGridDBTableViewEventDate: TcxGridDBColumn
            Caption = 'Event Date'
            DataBinding.FieldName = 'EventDate'
            PropertiesClassName = 'TcxDateEditProperties'
            HeaderAlignmentVert = vaCenter
            Width = 99
          end
          object HealthGridDBTableViewDrugID: TcxGridDBColumn
            DataBinding.FieldName = 'DrugID'
            RepositoryItem = HerdLookup.erMedicineLookup
            HeaderAlignmentVert = vaCenter
            Width = 182
          end
          object HealthGridDBTableViewApplicRate: TcxGridDBColumn
            DataBinding.FieldName = 'ApplicRate'
            HeaderAlignmentVert = vaCenter
            Width = 76
          end
          object HealthGridDBTableViewDrugBatchNo: TcxGridDBColumn
            DataBinding.FieldName = 'DrugBatchNo'
            HeaderAlignmentVert = vaCenter
            Width = 120
          end
          object HealthGridDBTableViewComment: TcxGridDBColumn
            DataBinding.FieldName = 'Comment'
            HeaderAlignmentVert = vaCenter
            Width = 274
          end
        end
        object HealthGridLevel: TcxGridLevel
          GridView = HealthGridDBTableView
        end
      end
    end
  end
  object bcDefaultTreatments: TdxBarDockControl [2]
    Left = 0
    Top = 656
    Width = 1521
    Height = 30
    Align = dalBottom
    BarManager = BarManager
  end
  object AnimalGridPanel: TPanel [3]
    Left = 0
    Top = 127
    Width = 1521
    Height = 380
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object AnimalGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 1521
      Height = 380
      Align = alClient
      BorderStyle = cxcbsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object MartDataGridDBTableView: TcxGridDBTableView
        OnKeyDown = MartDataGridDBTableViewKeyDown
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dstMart
        DataController.KeyFieldNames = 'ID'
        DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'Price'
            Column = MartDataGridDBTableViewPrice
          end
          item
            Format = '#.## Kgs'
            Kind = skSum
            FieldName = 'Weight'
            Column = MartDataGridDBTableViewWeight
          end
          item
            Format = 'Total: #'
            Kind = skCount
            FieldName = 'ID'
            Column = MartDataGridDBTableViewSortTagNo
          end
          item
            Format = '#.## Kgs'
            Kind = skSum
            Column = MartDataGridDBTableViewDeadWeight
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.DataRowHeight = 21
        OptionsView.Footer = True
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 26
        OptionsView.Indicator = True
        object MartDataGridDBTableViewID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
        end
        object MartDataGridDBTableViewSortTagNo: TcxGridDBColumn
          Caption = 'Nat. Id. No.'
          DataBinding.FieldName = 'SortTagNo'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ListColumns = <>
          OnGetDisplayText = MartDataGridDBTableViewSortTagNoGetDisplayText
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          SortIndex = 0
          SortOrder = soAscending
        end
        object MartDataGridDBTableViewTagNo: TcxGridDBColumn
          Caption = 'Nat. Id. No.'
          DataBinding.FieldName = 'TagNo'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
          Options.Editing = False
          Options.Focusing = False
          Width = 133
        end
        object MartDataGridDBTableViewSearchTagNo: TcxGridDBColumn
          DataBinding.FieldName = 'SearchTagNo'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
        end
        object MartDataGridDBTableViewSex: TcxGridDBColumn
          DataBinding.FieldName = 'Sex'
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 72
        end
        object MartDataGridDBTableViewDOB: TcxGridDBColumn
          DataBinding.FieldName = 'DOB'
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 72
        end
        object MartDataGridDBTableViewBreedCode: TcxGridDBColumn
          Caption = 'Breed'
          DataBinding.FieldName = 'BreedCode'
          HeaderAlignmentVert = vaCenter
          Options.Grouping = False
          Width = 46
        end
        object MartDataGridDBTableViewColourCode: TcxGridDBColumn
          Caption = 'Colour'
          DataBinding.FieldName = 'ColourCode'
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 50
        end
        object MartDataGridDBTableViewEventDate: TcxGridDBColumn
          Caption = 'Event Date'
          DataBinding.FieldName = 'EventDate'
          HeaderAlignmentVert = vaCenter
          Width = 74
        end
        object MartDataGridDBTableViewCustomerSupplier: TcxGridDBColumn
          Caption = 'Supplier'
          DataBinding.FieldName = 'CustomerSupplier'
          HeaderAlignmentVert = vaCenter
          Width = 140
        end
        object MartDataGridDBTableViewBuyerID: TcxGridDBColumn
          Tag = 1
          Caption = 'Buyer'
          DataBinding.FieldName = 'BuyerID'
          RepositoryItem = HerdLookup.erLookupBuyers
          HeaderAlignmentVert = vaCenter
          Width = 140
        end
        object MartDataGridDBTableViewAnimalNo: TcxGridDBColumn
          Tag = 1
          Caption = 'Animal No.'
          DataBinding.FieldName = 'AnimalNo'
          HeaderAlignmentVert = vaCenter
          Width = 70
        end
        object MartDataGridDBTableViewWeight: TcxGridDBColumn
          Tag = 1
          Caption = 'Live Weight'
          DataBinding.FieldName = 'Weight'
          HeaderAlignmentVert = vaCenter
          Options.Moving = False
          Width = 78
        end
        object MartDataGridDBTableViewDeadWeight: TcxGridDBColumn
          Tag = 1
          Caption = 'Dead Weight'
          DataBinding.FieldName = 'ColdDeadWt'
          HeaderAlignmentVert = vaCenter
          Options.Moving = False
          Width = 81
        end
        object MartDataGridDBTableViewPrice: TcxGridDBColumn
          Tag = 1
          DataBinding.FieldName = 'Price'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00'
          HeaderAlignmentVert = vaCenter
          Width = 75
        end
        object MartDataGridDBTableViewGrade: TcxGridDBColumn
          DataBinding.FieldName = 'Grade'
          HeaderAlignmentVert = vaCenter
          Width = 75
        end
        object MartDataGridDBTableViewHaulage: TcxGridDBColumn
          Tag = 1
          Caption = 'Transport'
          DataBinding.FieldName = 'Haulage'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00'
          HeaderAlignmentVert = vaCenter
        end
        object MartDataGridDBTableViewCommission: TcxGridDBColumn
          Tag = 1
          DataBinding.FieldName = 'Commission'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00'
          HeaderAlignmentVert = vaCenter
        end
        object MartDataGridDBTableViewLotNo: TcxGridDBColumn
          Tag = 1
          Caption = 'Lot No.'
          DataBinding.FieldName = 'LotNo'
          HeaderAlignmentVert = vaCenter
          Width = 70
        end
        object MartDataGridDBTableViewQualityAssured: TcxGridDBColumn
          Caption = 'Q.A'
          DataBinding.FieldName = 'QualityAssured'
          PropertiesClassName = 'TcxCheckBoxProperties'
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.IncSearch = False
          Options.Grouping = False
        end
        object MartDataGridDBTableViewQADays: TcxGridDBColumn
          Caption = 'No. Movements'
          DataBinding.FieldName = 'QADays'
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.IncSearch = False
          Options.Grouping = False
          Width = 100
        end
        object MartDataGridDBTableViewDaysOnPrevHolding: TcxGridDBColumn
          Tag = 1
          Caption = 'FQAS Days'
          DataBinding.FieldName = 'NoDaysOnPrevHolding'
          HeaderAlignmentVert = vaCenter
          Width = 69
        end
        object MartDataGridDBTableViewFQASDate: TcxGridDBColumn
          Caption = 'FQAS Date'
          DataBinding.FieldName = 'FQASDate'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentVert = vaCenter
          Styles.Content = sHiddenFieldData
          Width = 74
        end
        object MartDataGridDBTableViewPurchGrpID: TcxGridDBColumn
          Caption = 'Purchase Group'
          DataBinding.FieldName = 'PurchGrpID'
          RepositoryItem = HerdLookup.erPurchaseGroupLookup
          HeaderAlignmentVert = vaCenter
          Width = 120
        end
        object MartDataGridDBTableViewFeedGrpID: TcxGridDBColumn
          Tag = 1
          Caption = 'Feed Group '
          DataBinding.FieldName = 'FeedGrpID'
          RepositoryItem = HerdLookup.erFeedGroupLookup
          HeaderAlignmentVert = vaCenter
          Width = 120
        end
        object MartDataGridDBTableViewBatchGrpID: TcxGridDBColumn
          Caption = 'Batch Group'
          DataBinding.FieldName = 'BatchGrpID'
          RepositoryItem = HerdLookup.erBatchGroupLookup
          HeaderAlignmentVert = vaCenter
          Width = 120
        end
        object MartDataGridDBTableViewComment: TcxGridDBColumn
          Tag = 1
          DataBinding.FieldName = 'Comment'
          HeaderAlignmentVert = vaCenter
          Width = 233
        end
      end
      object AnimalGridLevel: TcxGridLevel
        GridView = MartDataGridDBTableView
      end
    end
  end
  object pTop: TPanel [4]
    Left = 0
    Top = 49
    Width = 1521
    Height = 78
    Align = alTop
    TabOrder = 8
    object lBuyer: TcxLabel
      Left = 10
      Top = 47
      Caption = 'Buyer'
    end
    object lPurchaseGroup: TcxLabel
      Left = 249
      Top = 16
      Caption = 'Purchase Group'
    end
    object lFeedGroup: TcxLabel
      Left = 249
      Top = 47
      Caption = 'Feed Group'
    end
    object lBatchGroup: TcxLabel
      Left = 530
      Top = 16
      Caption = 'Batch Group'
    end
    object lcmboBuyers: TcxLookupComboBox
      Left = 82
      Top = 45
      RepositoryItem = HerdLookup.erLookupBuyers
      Properties.DropDownListStyle = lsFixedList
      Properties.ListColumns = <>
      Properties.OnChange = PostHeaderComboChange
      Style.BorderStyle = ebsFlat
      TabOrder = 4
      Width = 145
    end
    object lcmboPurchGroup: TcxLookupComboBox
      Left = 361
      Top = 12
      RepositoryItem = HerdLookup.erPurchaseGroupLookup
      Properties.DropDownListStyle = lsFixedList
      Properties.ListColumns = <>
      Properties.OnChange = PostHeaderComboChange
      Style.BorderStyle = ebsFlat
      TabOrder = 5
      Width = 145
    end
    object lcmboFeedGroup: TcxLookupComboBox
      Left = 361
      Top = 45
      RepositoryItem = HerdLookup.erFeedGroupLookup
      Properties.DropDownListStyle = lsFixedList
      Properties.ListColumns = <>
      Properties.OnChange = PostHeaderComboChange
      Style.BorderStyle = ebsFlat
      TabOrder = 6
      Width = 145
    end
    object lcmboBatchGroup: TcxLookupComboBox
      Left = 628
      Top = 12
      RepositoryItem = HerdLookup.erBatchGroupLookup
      Properties.DropDownListStyle = lsFixedList
      Properties.ListColumns = <>
      Properties.OnChange = PostHeaderComboChange
      Style.BorderStyle = ebsFlat
      TabOrder = 7
      Width = 145
    end
    object lSupplier: TcxLabel
      Left = 10
      Top = 16
      Caption = 'Supplier'
    end
    object lcmboSuppliers: TcxLookupComboBox
      Left = 82
      Top = 12
      RepositoryItem = HerdLookup.erLookupBuyers
      Properties.DropDownListStyle = lsFixedList
      Properties.ListColumns = <>
      Properties.OnChange = PostHeaderComboChange
      Style.BorderStyle = ebsFlat
      TabOrder = 9
      Width = 145
    end
  end
  inherited ActionList: TActionList
    Left = 607
    object actDelete: TAction
      Caption = 'Delete'
      ImageIndex = 21
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object actDefaultVetTreatments: TAction
      Caption = 'Default Treatment Templates'
      ImageIndex = 25
      OnExecute = actDefaultVetTreatmentsExecute
    end
    object actAddHealth: TAction
      Caption = 'Add'
      ImageIndex = 9
      OnExecute = actAddHealthExecute
      OnUpdate = actAddHealthUpdate
    end
    object actDeleteHealth: TAction
      Caption = 'Delete'
      ImageIndex = 10
      OnExecute = actDeleteHealthExecute
      OnUpdate = actDeleteHealthUpdate
    end
    object actEditHealth: TAction
      Caption = 'Edit'
      ImageIndex = 12
      OnExecute = actEditHealthExecute
      OnUpdate = actEditHealthUpdate
    end
    object actCancelImport: TAction
      Caption = 'Cancel Import'
      ImageIndex = 29
      OnExecute = actCancelImportExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
    object actPrintAnimalGrid: TAction
      Caption = 'Print Animal Grid'
      ImageIndex = 33
      OnExecute = actPrintAnimalGridExecute
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
            Item = blbCancelImport
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bblbDelete
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbPrintAnimalGrid
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
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'EventToolBar'
        DockControl = bcDefaultTreatments
        DockedDockControl = bcDefaultTreatments
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 604
        FloatTop = 357
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = blbAdd
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbDelete
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbEdit
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbDefaults
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'EventToolbar'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = nil
    Left = 637
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      Caption = 'Complete Import'
      HotImageIndex = 0
      Width = 105
      SyncImageIndex = False
      ImageIndex = 0
    end
    inherited bHelp: TdxBarLargeButton
      Visible = ivNever
      HotImageIndex = 7
    end
    object bblbDelete: TdxBarLargeButton
      Action = actDelete
      Category = 0
      HotImageIndex = 21
      Width = 55
    end
    object blbAdd: TdxBarLargeButton
      Action = actAddHealth
      Category = 0
      GlyphLayout = glLeft
      Height = 26
      HotImageIndex = 9
      Width = 65
    end
    object blbDelete: TdxBarLargeButton
      Action = actDeleteHealth
      Category = 0
      GlyphLayout = glLeft
      Height = 26
      HotImageIndex = 10
      Width = 65
    end
    object blbEdit: TdxBarLargeButton
      Action = actEditHealth
      Category = 0
      GlyphLayout = glLeft
      Height = 26
      HotImageIndex = 12
      Width = 65
    end
    object blbDefaults: TdxBarLargeButton
      Action = actDefaultVetTreatments
      Caption = 'Default Treatments Templates'
      Category = 0
      GlyphLayout = glLeft
      Height = 26
      HotImageIndex = 25
    end
    object blbCancelImport: TdxBarLargeButton
      Action = actCancelImport
      Category = 0
      HotImageIndex = 29
      SyncImageIndex = False
      ImageIndex = 29
    end
    object blbPrintAnimalGrid: TdxBarLargeButton
      Action = actPrintAnimalGrid
      Category = 0
      Height = 45
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000830F0000830F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF737373696969656563929391FFFFFFAF
        AFAFAFAFAFAFAFAFFFFFFF7B7B754F4F4F545454545454FF00FFFF00FF737373
        93979793979775777590918EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B755B5C
        5C787B7B606161545454FF00FF737373939797ADB5B56667665F5F5F77777777
        77777777777777777171715A5A586869697F8282707171545454FF00FF737373
        ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5A2A8A86AA4
        7708B518767878565757FF00FF737373D2D2D2988D91997C809A797BAA8186AA
        7F86AA7E86AD828AA77F859D7C7F8B7D7A5E9063787A7A575858FF00FF737373
        D2D2D2855A62956B6D8A6969896D6D876B6B866A6A886E6D8A706F8D6A699363
        6A9C6C819397975C5D5DFF00FF737373D2D2D26F4952583F415F4C4C74696972
        67677166667166667166665E424254393C8A72749397976C6D6DFF00FF737373
        ADB5B57E686A757272A6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9B6E5F
        61988989ADB5B56C6D6DFF00FFFF00FF7373738E81818F8485A6A8A9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9B9B9B8473748F85856C6D6DFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFA6A8A99B9B9B9B9B9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A9FFFFFFFF
        FFFFFFFFFFA6A8A9FFFFFF9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFCFCFCFFFFFFA6A8A99B9B9BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
        9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Width = 100
    end
  end
  object tMart: TTable
    DatabaseName = 'Kingswd'
    TableName = 'tMart'
    Left = 668
    Top = 9
    object tMartID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tMartAnimalNo: TStringField
      FieldName = 'AnimalNo'
      OnValidate = tMartAnimalNoValidate
      Size = 10
    end
    object tMarttAnimalNo: TStringField
      FieldName = 'tAnimalNo'
      Size = 10
    end
    object tMartTagNo: TStringField
      FieldName = 'TagNo'
    end
    object tMartSearchTagNo: TStringField
      FieldName = 'SearchTagNo'
    end
    object tMartSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object tMartBreedCode: TStringField
      FieldName = 'BreedCode'
      Size = 6
    end
    object tMartColourCode: TStringField
      FieldName = 'ColourCode'
      Size = 6
    end
    object tMartDOB: TDateTimeField
      FieldName = 'DOB'
    end
    object tMartTBTestDate: TDateTimeField
      FieldName = 'TBTestDate'
    end
    object tMartBruceTestDate: TDateTimeField
      FieldName = 'BruceTestDate'
    end
    object tMartEventDate: TDateTimeField
      FieldName = 'EventDate'
    end
    object tMartLotNo: TStringField
      FieldName = 'LotNo'
      Size = 10
    end
    object tMartWeight: TFloatField
      FieldName = 'Weight'
      OnChange = tMartWeightChange
      DisplayFormat = '#.##Kgs'
    end
    object tMartColdDeadWt: TFloatField
      FieldName = 'ColdDeadWt'
      DisplayFormat = '#.##Kgs'
    end
    object tMartPrice: TFloatField
      FieldName = 'Price'
      currency = True
    end
    object tMartCustomerSupplier: TIntegerField
      FieldName = 'CustomerSupplier'
    end
    object tMartDeath: TBooleanField
      FieldName = 'Death'
    end
    object tMartCustomerSupplierRefCode: TStringField
      FieldName = 'CustomerSupplierRefCode'
    end
    object tMartFeedGrpId: TIntegerField
      FieldName = 'FeedGrpId'
    end
    object tMartFQAS: TBooleanField
      FieldName = 'FQAS'
    end
    object tMartNoDaysOnPrevHolding: TIntegerField
      FieldName = 'NoDaysOnPrevHolding'
      OnChange = tMartNoDaysOnPrevHoldingChange
    end
    object tMartComment: TStringField
      FieldName = 'Comment'
      Size = 30
    end
    object tMartHerdID: TIntegerField
      FieldName = 'HerdID'
    end
    object tMartBuyerID: TIntegerField
      FieldName = 'BuyerID'
    end
    object tMartSortTagNo: TStringField
      FieldName = 'SortTagNo'
    end
    object tMartCommission: TFloatField
      FieldName = 'Commission'
      currency = True
    end
    object tMartHaulage: TFloatField
      FieldName = 'Haulage'
      currency = True
    end
    object tMartBatchGrpID: TIntegerField
      FieldName = 'BatchGrpID'
    end
    object tMartPurchGrpID: TIntegerField
      FieldName = 'PurchGrpID'
    end
    object tMartFQASDate: TDateField
      FieldName = 'FQASDate'
    end
    object tMartQualityAssured: TBooleanField
      FieldName = 'QualityAssured'
    end
    object tMartQADays: TStringField
      FieldName = 'QADays'
      Size = 10
    end
    object tMartGrade: TStringField
      FieldName = 'Grade'
      Size = 15
    end
  end
  object dstMart: TDataSource
    DataSet = tMart
    Left = 697
    Top = 9
  end
  object dsHealthTable: TDataSource
    DataSet = HealthTable
    Left = 757
    Top = 9
  end
  object HealthTable: TTable
    OnNewRecord = HealthTableNewRecord
    DatabaseName = 'Kingswd'
    IndexName = 'iSearchTagNo'
    MasterFields = 'SearchTagNo'
    MasterSource = dstMart
    TableName = 'tMartHealth'
    Left = 727
    Top = 9
    object HealthTableID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object HealthTableSearchTagNo: TStringField
      FieldName = 'SearchTagNo'
    end
    object HealthTableEventDate: TDateField
      FieldName = 'EventDate'
    end
    object HealthTableDrugID: TIntegerField
      DisplayLabel = 'Drug Name'
      FieldName = 'DrugID'
    end
    object HealthTableApplicRate: TFloatField
      DisplayLabel = 'Applic. Rate'
      FieldName = 'ApplicRate'
      DisplayFormat = '#.##'
    end
    object HealthTableComment: TStringField
      FieldName = 'Comment'
      Size = 30
    end
    object HealthTableApplicRatePerKgs: TFloatField
      FieldName = 'ApplicRatePerKgs'
      DisplayFormat = '#.##'
    end
    object HealthTableUseDrugNameForComment: TBooleanField
      FieldName = 'UseDrugNameForComment'
    end
    object HealthTableDefaultApplicRate: TFloatField
      FieldName = 'DefaultApplicRate'
    end
    object HealthTableDrugPurchID: TIntegerField
      FieldName = 'DrugPurchID'
    end
    object HealthTableDrugBatchNo: TStringField
      FieldName = 'DrugBatchNo'
      Size = 30
    end
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 786
    Top = 9
    object sHiddenFieldData: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 12639424
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object AnimalGridPrint: TdxComponentPrinter
    CurrentLink = AnimalGridPrintLink
    Version = 0
    Left = 816
    Top = 9
    object AnimalGridPrintLink: TdxGridReportLink
      Active = True
      Component = AnimalGrid
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Animal Grid'
      ReportDocument.CreationDate = 44537.7359898032
      OptionsFormatting.LookAndFeelKind = lfFlat
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
