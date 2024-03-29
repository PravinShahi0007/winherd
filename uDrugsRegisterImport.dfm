inherited fmDrugsRegisterImport: TfmDrugsRegisterImport
  Left = 291
  Top = 177
  Width = 1426
  Height = 647
  Caption = 'VetLink'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 596
    Width = 1418
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end>
  end
  object pDrugsRegister: TPanel [1]
    Left = 0
    Top = 329
    Width = 1418
    Height = 267
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
    OnMouseMove = PanelMouseMove
    object gDrugRegister: TcxGrid
      Left = 0
      Top = 0
      Width = 1418
      Height = 267
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      OnMouseEnter = gDrugRegisterMouseEnter
      object DrugRegisterDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnEditKeyDown = DrugRegisterDBTableViewEditKeyDown
        OnEditKeyPress = DrugRegisterDBTableViewEditKeyPress
        OnFocusedRecordChanged = DrugRegisterDBTableViewFocusedRecordChanged
        OnInitEdit = DrugRegisterDBTableViewInitEdit
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
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.DataRowHeight = 30
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 30
        OptionsView.Indicator = True
        object DrugRegisterDBTableViewSelected: TcxGridDBColumn
          DataBinding.FieldName = 'Selected'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 24
          IsCaptionAssigned = True
        end
        object DrugRegisterDBTableViewDrugVPAIndicator: TcxGridDBColumn
          DataBinding.FieldName = 'VPAIndicator'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          OnGetProperties = DrugRegisterDBTableViewDrugVPAIndicatorGetProperties
          MinWidth = 30
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.ShowEditButtons = isebAlways
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 30
          IsCaptionAssigned = True
        end
        object DrugRegisterDBTableViewEventDate: TcxGridDBColumn
          Caption = 'Purchase Date'
          DataBinding.FieldName = 'PurchDate'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 120
        end
        object DrugRegisterDBTableViewDrugName: TcxGridDBColumn
          Caption = 'Drug Name'
          DataBinding.FieldName = 'DrugDesc'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 260
        end
        object DrugRegisterDBTableViewVPANo: TcxGridDBColumn
          Caption = 'VPA No.'
          DataBinding.FieldName = 'VPANumber'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.Buttons = <
            item
              Default = True
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FBFFF
                FFFFF000000033333333FBBFFFFBF00000003333333FBFFFFBFFFE0000003333
                333FBFFFFBFBF600000033333333FBBFFFFFF70000003333333444FBFFFBF600
                000033333344834FBFFFF1000000333334847F84BFFFF6000000333334484F84
                FBBFB00000003333348F74483FF3F6000000333344FFF7433333300000003344
                8F8444333333300000003448F7433333333330000000348F7733333333333000
                000034F77433333333333F000000344443333333333330000000333333333333
                333337000000}
              Kind = bkGlyph
            end>
          Properties.OnButtonClick = DrugRegisterDBTableViewVPANoPropertiesButtonClick
          OnGetProperties = DrugRegisterDBTableViewVPANoGetProperties
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Filtering = False
          Options.ShowEditButtons = isebAlways
          Width = 160
        end
        object DrugRegisterDBTableViewDrugQuantity: TcxGridDBColumn
          Caption = 'Quantity'
          DataBinding.FieldName = 'DrugQuantity'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Moving = False
          Width = 70
        end
        object DrugRegisterDBTableViewPurchUnitUsed: TcxGridDBColumn
          Caption = 'Unit'
          DataBinding.FieldName = 'DrugPurchUnit'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'UnitCode'
            end>
          Properties.ListSource = WinData.dsUnits
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object DrugRegisterDBTableViewTagDesc: TcxGridDBColumn
          Caption = 'Treated Animals'
          DataBinding.FieldName = 'TagDesc'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = DrugRegisterDBTableViewTagDescPropertiesButtonClick
          Visible = False
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Filtering = False
          Options.ShowEditButtons = isebNever
          Width = 200
        end
        object DrugRegisterDBTableViewPurchDoseRate: TcxGridDBColumn
          Caption = 'Dose Rate'
          DataBinding.FieldName = 'PurchDoseRate'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Moving = False
          Width = 120
        end
        object DrugRegisterDBTableViewApplicRate: TcxGridDBColumn
          Caption = 'Applic. Rate'
          DataBinding.FieldName = 'ApplicRate'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.DisplayFormat = '0.00'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Styles.Content = sDefaultEntry
          Width = 80
        end
        object DrugRegisterDBTableViewNoDays: TcxGridDBColumn
          Caption = 'No. Days'
          DataBinding.FieldName = 'NoDays'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.AssignedValues.DisplayFormat = True
          Properties.DecimalPlaces = 0
          Visible = False
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 66
        end
        object DrugRegisterDBTableViewNoTimes: TcxGridDBColumn
          Caption = 'Times/Day'
          DataBinding.FieldName = 'NoTimes'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.AssignedValues.DisplayFormat = True
          Properties.DecimalPlaces = 0
          Visible = False
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 72
        end
        object DrugRegisterDBTableViewBatchNo: TcxGridDBColumn
          Caption = 'Batch No.'
          DataBinding.FieldName = 'BatchNo'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.CharCase = ecUpperCase
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 120
        end
        object DrugRegisterDBTableViewExpiryDate: TcxGridDBColumn
          Caption = 'Expiry'
          DataBinding.FieldName = 'ExpiryDate'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 110
        end
        object DrugRegisterDBTableViewWithdrawal: TcxGridDBColumn
          Caption = 'Withdrawal'
          DataBinding.FieldName = 'WithdrawalStr'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 280
        end
        object DrugRegisterDBTableViewSupplier: TcxGridDBColumn
          Caption = 'Supplier'
          DataBinding.FieldName = 'SupplierName'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 180
        end
        object DrugRegisterDBTableViewDrugID: TcxGridDBColumn
          DataBinding.FieldName = 'DrugID'
          Visible = False
          Width = 20
        end
        object DrugRegisterDBTableViewVPAIndicator: TcxGridDBColumn
          DataBinding.FieldName = 'VPAIndicator'
          Visible = False
          IsCaptionAssigned = True
        end
      end
      object DrugRegisterLevel: TcxGridLevel
        GridView = DrugRegisterDBTableView
      end
    end
  end
  object btnReviewMedicines: TcxButton [2]
    Left = 311
    Top = 10
    Width = 117
    Height = 45
    Caption = 'Review '#13#10'Medicines'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnReviewMedicinesClick
    DropDownMenu = pmAddMedicine
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFF2F1F1D8CBB4E1D9D3EADABFE8D7B7E5D3AEDEC7A0CFB9A5D5C5ADF2F1
      F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECECEBE6D6BDFCFBF8F6F3EAF3E8D5F3
      E9CEECE1B5DFCC99D0B590E5BCA5E4CDB1ECEBEBFFFFFFFFFFFFFFFFFFFFFFFF
      D8D5D4FEFDFCF6F1E9F3EEE1F1E5D1F0E6CBEADEB6DECC9CD0B693E1B69CF7E5
      DDD7D3D1FFFFFFFFFFFFFFFFFFFFFFFFD8D5D4FDFDFCFBFAF3F8F5E8EADFD3DF
      D5CAE7DBB6DFCEA2D6C0A1E8C3ADF8E9E0D7D4D1FFFFFFFFFFFFFFFFFFFFFFFF
      D8D5D4FDFDFCFCFBF4FCFBEE433DED2D28E7D5CDC8E5D9B3DCCAAEE9C7B3F8E8
      E0D7D4D1FFFFFFFFFFFFFFFFFFFFFFFFD8D5D4FDFDFCE5E5F7B3B3F3302BF125
      20EB817BD4A79CBFDECEB5EACBB8F7E7DED8D4D2FFFFFFFFFFFFFFFFFFFFFFFF
      D8D5D4FDFCFBA0A0FE3B3BFD1C18F41C19F01E1AE44B43CFE0D2BAEBCEBBF7E7
      DDD8D4D2FFFFFFFFFFFFFFFFFFFFFFFFD8D5D4FCFCFBBDBCFD8F8FFB3F3DF917
      14F47974E09189CEE2D4BFEBD0BFF6E5DCD8D4D2FFFFFFFFFFFFFFFFFFFFFFFF
      D8D5D4FCFCFBFDFDF9FEFEF56D6CFC403EF9D8D4DCEBE3CBE4D7C3ECD2C0F6E5
      DAD8D4D2FFFFFFFFFFFFFFFFFFFFFFFFD8D5D4FCFCFBFEFEFBFFFEF8D2D1F8C6
      C5F5EDEAE6EDE7D2E4D8C4ECD2C1F5E3D9D8D4D2FFFFFFFFFFFFFFFFFFFFFFFF
      D8D5D4FDFDFBFFFFFDFFFFFBFEFDF5FBF9EFF5F2E3EFE8D5E8DDCCEDD6C6F4E2
      D6D8D4D2FFFFFFFFFFFFFFFFFFFFFFFFD9D6D5FCFBFAFFFFFEFFFFFBFBF9ECF7
      F4E3F1ECD7EAE2C8E3D6C1EED7C6F4DFD3D8D5D3FFFFFFFFFFFFFFFFFFFFFFFF
      F9F9F9E4D3C8EAE1D6E5D7C0DECCABD7B090D09A7ACC9978CA9F85D7B29CE3C1
      AFF7F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF937BE08A46F0D184F2DE8BEA
      B96AE49650DD7638D75C23D14915C4816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC29276E0954CE5BF72E1BC72D99C5BD28146CD6833C85321B5350EAB73
      6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCB8B0C36746C44B24BC3B11B8
      3409B73309B83A11BC4923BB6343C7B2ACFFFFFFFFFFFFFFFFFF}
    Kind = cxbkDropDownButton
    LookAndFeel.Kind = lfFlat
  end
  object pLegend: TPanel [3]
    Left = 0
    Top = 49
    Width = 1418
    Height = 168
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 7
    object pFoundDrug: TPanel
      Left = 0
      Top = 129
      Width = 1418
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object imgDrugFound: TImage
        Left = 12
        Top = 2
        Width = 36
        Height = 36
        Hint = 
          'No problems found here. All these drugs from your vet have VPA n' +
          'umbers that match VPA numbers in Kingswood'#39's online/offline drug' +
          ' database'#39's.'
        Picture.Data = {
          07544269746D6170F6060000424DF60600000000000036000000280000001800
          0000180000000100180000000000C0060000630B0000630B0000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4040404040404040404040404040404040404040404040404040404040
          40404040404040404040404040404040404040404040404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF404040169416169416138313138313138313138313
          1383131383131383131383131383131383131383131383131383131383134040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404016941613A3130AA00A0B
          AB0B0AA00A0BB40B0AA00A0BB80B0AA00A0BB90B0AA00A0BBA0B0AA00A0DAC0D
          0AA00A138313404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404017A7
          170BA00B0BAD0B0AB60A0ABC0A0ABF0A0AC10A0AC20A0AC30A0AC40A0AC40A0A
          C40A0BC00B0CB70C0DAB0D138313404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF404040109E100BA70B0AA00A09BC090AA00A09C5090AA00A09C8090AA0
          0A09CA090AA00A0ACB0A0AA00A0BBD0B0AA00A138313404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF4040400C9A0C0AAC0A0AB90A0BC10B0DC70D0ECA0E
          0DCB0D0CCC0C0CCC0C0BCD0B0BCE0B0ACE0A0ACA0A0BC10B0CB60C1383134040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040400C9A0C0AAC0A0AA00A10
          C2100AA00A28CE280AA00A1ECD1E0AA00A19CD190AA00A10CD100AA00A0AC20A
          0AA00A138313404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040400B99
          0B0AAB0A0BB80B11C21124CB2433D0332FCF2F27CE2722CD2220CE201BCD1B13
          CC130AC90A0AC00A0BB50B138313404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4040400B980B0AAA0A0AA00A12C1120AA00A38D0380AA00A2BCE2B0AA0
          0A24CD240AA00A15CB150AA00A09BF090AA00A138313404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF4040400B970B0AA90A0BB60B14C0142FCC2F46D346
          43D24337D03730CF302DCF2D26CE2619CB190BC70B09BE090AB30A1383134040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040400C960C0AA70A0AA00A1C
          C11C0AA00A6CDB6C0AA00A56D6560AA00A47D4470AA00A26CD260AA00A09BC09
          0AA00A138313404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040400E94
          0E0CA50C12B4122FC42F77DB77AEEBAEA4E9A488E28879DF7971DD7161DA613F
          D23F0FC40F09BA090AAF0A138313404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF40404013931313A4130AA00A50CB500AA00ACBF1CB0AA00A93E4930AA0
          0A7DDF7D0AA00A4DD44D0AA00A09B6090AA00A138313404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF404040259D2525A5253AB83A69CF6991DE918ADD8A
          6ED66E59D15951CF514ECF4E47CE4738CA3813BC1309B0090AA40A1383134040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF404040259D254BAE4B0AA00A66
          C8660AA00A44C3440AA00A29BD290AA00A26BD260AA00A20BC200AA00A0AA70A
          0A9B0A138313404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404021A6
          214BAE4B5ABE5A5EBC5E41B5412CAF2C21AD211CAC1C1BAD1B1BAD1B1AAE1A19
          AD1913A6130E9B0E139D13169416404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF40404021A62148AA4848AA4848AA4848AA4832A232289F28239E23229E
          22229F22229F22219F211F9F1F21A621169416169416404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF404040404040404040404040404040404040404040
          4040404040404040404040404040404040404040404040404040404040404040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Stretch = True
        Transparent = True
      end
      object lFoundLegendLabel: TcxLabel
        Left = 48
        Top = 8
        AutoSize = False
        Caption = 'lFoundLegendLabel'
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Color = clHighlightText
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.TextColor = clBlue
        Style.TextStyle = []
        Style.IsFontAssigned = True
        OnMouseEnter = lFoundLegendLabelMouseEnter
        OnMouseLeave = LegendLabelMouseLeave
        Height = 26
        Width = 620
      end
    end
    object pNotFound: TPanel
      Left = 0
      Top = 85
      Width = 1418
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object imgVPANotFound: TImage
        Left = 12
        Top = 2
        Width = 36
        Height = 36
        Hint = 
          'These purchases contain medicines with VPA numbers that cannot b' +
          'e found in the Kingswood online/offline drug database'#39's.'#13#10'VetLin' +
          'k will add these as new drugs in Kingswood.'
        Picture.Data = {
          07544269746D6170F6060000424DF60600000000000036000000280000001800
          0000180000000100180000000000C0060000530B0000530B0000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040404040404040
          4040404040404040404040404040404040404040404040404040404040404040
          4040404040404040404040404040404040404040FF00FFFF00FFFF00FFFF00FF
          40404004A4A301A7A600ACAB00B3B200B9B700BEBC00C0BF00C2C000C4C200C5
          C300C4C200C3C100C2C000BEBD00BAB800B3B200ADAC00A8A7404040FF00FFFF
          00FFFF00FFFF00FF6464640BA8A707ADAB02B7B500C1BF00C8C600CDCB00D1CF
          00D4D200D6D400D6D400D6D300D4D200D2D000CDCB00C7C500BEBC00B3B100AA
          A9646464FF00FFFF00FFFF00FFFF00FFFF00FF40404016B4B30BBFBE0C9B9B01
          D1CF0C9B9B00DCDA0C9B9B00E1DF0C9B9B00E1DF0C9B9B00DCDA0C9B9B00CFCD
          0C9B9B00B6B4404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6464642ABA
          B81DC5C310CECC07D6D402DDDB01E3E000E6E400E8E600E9E600E8E500E5E300
          E1DF00DBD900D2D000C5C300B5B3646464FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF40404029C5C40C9B9B18DAD80C9B9B09E6E40C9B9B02ECE90C9B
          9B00EBE90C9B9B00E3E10C9B9B00D1CF00C2C0404040FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF64646431C2C129CFCE2ADBD92FE4E234EAE9
          2EEEEC1DEEEC0DEEEB04ECEA01E8E600E2E000D9D700CDCB00BBBA646464FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404029C9C72A
          D6D40C9B9B59ECEB0C9B9B5BF2F00C9B9B08EAE80C9B9B00DFDC0C9B9B00C5C3
          404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF64646429C1C026D0CF36DFDD66ECEBADF7F6A2F7F63EEEEC0AE8E601E2E000
          DAD800CDCB00BCBA646464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF4040402BC9C80C9B9B6DE9E80C9B9BD4FAFA0C9B
          9B0BE3E10C9B9B00D3D000C4C2404040FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF64646433C3C13DD3D26EE5E4
          ADF7F6DBFAFA50E9E70BDDDB01D5D300CAC800B9B7646464FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40
          40400C9B9B72E1E00C9B9BDBF9F90C9B9B0BD6D40C9B9B00C0BE404040FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF64646454CAC97CDEDDADF7F6D9F8F852DFDD0DCECC02C3C101
          B4B2646464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404087DCDB0C9B9BD8F6F60C9B
          9B0EC5C302B8B6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF64646495DBDA
          ADF7F6D6F4F456D3D210BCBA03ADAB646464FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF4040400C9B9BD2F1F10C9B9B13B2B0404040FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF6464647CD6D6D0EEEE5CC6C515AAA8646464FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040407CD6D652BF
          BF404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          64646456D3D244BCBB646464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF404040404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Stretch = True
        Transparent = True
      end
      object lNotFoundLegendLabel: TcxLabel
        Left = 48
        Top = 8
        AutoSize = False
        Caption = 'lNotFoundLegendLabel'
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Color = clHighlightText
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.TextColor = clBlue
        Style.TextStyle = []
        Style.IsFontAssigned = True
        OnMouseEnter = lNotFoundLegendLabelMouseEnter
        OnMouseLeave = LegendLabelMouseLeave
        Height = 26
        Width = 620
      end
    end
    object pNoVPA: TPanel
      Left = 0
      Top = 41
      Width = 1418
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object imgNoVPANumber: TImage
        Left = 12
        Top = 2
        Width = 36
        Height = 36
        Hint = 
          'No VPA or an Invalid VPA number was provided by the Vet.'#13#10'Click ' +
          'button in the VPA Number box for this medicine and click Search ' +
          'For VPA No With Drug Name or click Manual Enter VPA No.'#13#10'The pro' +
          'gram will then search on our online database for this drug.'#13#10'If ' +
          'no VPA number is selected this drug purchase will not be importe' +
          'd.'
        Picture.Data = {
          07544269746D6170F6060000424DF60600000000000036000000280000001800
          0000180000000100180000000000C0060000530B0000530B0000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4040404040404040404040404040404040404040404040404040404040
          40404040404040404040404040404040404040404040404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF4040403838CC3A3AB63A3AB63A3AB63A3AB63A3AB6
          3A3AB63A3AB63A3AB63A3AB63A3AB63A3AB63A3AB63A3AB63A3AB63A3AB64040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403838C43B3BC13F3FC943
          43D54646D64747E14646D64848E64646D64949E74646D64848E64646D64141D3
          3D3DCA3A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403A3A
          C03F3FC74545D84848E44B4BEC4C4CF14D4DF34D4DF54E4EF64E4EF74E4EF74D
          4DF54A4AED4747E34646D33A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4040403C3CBE4242D14646D64C4CEE4646D64F4FFA4646D65151FE4646
          D65151FF4646D65050FE4646D64A4AED4646D63A3AB6404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF4040403E3EBF4646D74B4BE95050F45353FB5656FF
          5555FF5555FF5555FF5555FF5555FF5353FF5050FD4C4CF34646D33A3AB64040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3FC04747D94646D655
          55F54646D66969FE4646D66262FF4646D65F5FFF4646D65555FF4646D64D4DF4
          4646D63A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3F
          BF4646D84D4DE95656F46565FB7070FD6E6EFE6868FF6565FF6464FF6161FF55
          55FF5050FD4D4DF34646D33A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4040403F3FBD4646D64646D65656F34646D67474FC4646D66B6BFD4646
          D66666FF4646D65656FF4646D64D4DF24646D63A3AB6404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF4040403E3EBC4646D54D4DE65757F26C6CF97E7EFB
          7C7CFC7373FC6F6FFD6D6DFE6868FE5757FF5050FA4D4DF04646D33A3AB64040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403E3EBA4646D34646D65D
          5DF04646D69898FB4646D68989FC4646D67E7EFD4646D65A5AFD4646D64C4CEE
          4646D63A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3F
          B84747D05151E26A6AEF9E9EF8C6C6FCBFBFFCACACFCA1A1FC9C9CFC9090FD7C
          7CF54F4FF54B4BEB4646D33A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4040404242B54A4ACC4646D68181EE4646D6DADAFC4646D6B3B3FB4646
          D6A3A3FB4646D67C7CF54646D64A4AE64646D33A3AB6404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF4040403F3FBD5656C96B6BDC9191EBAFAFF4ABABF5
          9797F48888F48282F48080F47C7CF57C7CF54C4CE84747DD4242CD3A3AB64040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3FBD7070C94646D68C
          8CE34646D67676E74646D66363E74646D66060E84646D65454E44646D64444D1
          4646D63A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3F
          BD7070CA8282D78282D66D6DD55F5FD45757D45454D55353D55353D65252D74D
          4DD34646CB4040C03B3BBA3A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4040405454BF5C5CC05C5CC05454BF5454BF5454BF5454BF5151BF5050
          C05050C05050C14D4DBE4747BC4141BD3D3DC23B3BCB404040FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF404040404040404040404040404040404040404040
          4040404040404040404040404040404040404040404040404040404040404040
          40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Stretch = True
        Transparent = True
      end
      object lNoVPALegendLabel: TcxLabel
        Left = 48
        Top = 8
        AutoSize = False
        Caption = 'lNoVPALegendLabel'
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Color = clHighlightText
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.TextColor = clBlue
        Style.TextStyle = []
        Style.IsFontAssigned = True
        OnMouseEnter = lNoVPALegendLabelMouseEnter
        OnMouseLeave = LegendLabelMouseLeave
        Height = 26
        Width = 620
      end
    end
    object pGeneralLegendInfo: TPanel
      Left = 0
      Top = 0
      Width = 1418
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      OnMouseMove = PanelMouseMove
      object Image1: TImage
        Left = 21
        Top = 10
        Width = 25
        Height = 18
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          000010000000010018000000000000030000E30E0000E30E0000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB896F
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFBD9C7BAB896FFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD9C7BE1BC99B18F75
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD8C0
          A6BD9C7BBD9C7BECCBA9EBC8A6D9B797BD9C7BCFAD8EFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFD8C0A6F7D9B9F7D9B9DCAD8EE2A882E1A780DCAB88
          EBC9A6E3BF9BBD9C7BFF00FFFF00FFFF00FFFF00FFFF00FFD9C0A7F2D5B7F8DD
          BFF8DDBFDEB499BC6238B75E38E2B594F2D1AFEBC9A6DAB795BD9C7BFF00FFFF
          00FFFF00FFEED7BEFAE0C3FBE1C6FBE2C6FBE2C6FCE4CABC6D46B16346FADFC3
          F6D7B7F3D3B1E9C6A4DFBA97CFAD8EFF00FFFF00FFE4CDB4FCE3C9FDE5CEFDE6
          D0FDE6D0FDE7D1BC6D46B26446FAE0C6F7D9BAF6D7B6EFCEABE5C29ECDAE92FF
          00FFFF00FFEED7BEFDE9D4FEECDAFEEEDFFEEEDFFEE9D5BC6D46B26446FBE2C9
          F9DCBEF7D9B9F3D3B1EBC9A6CCA98BFF00FFFF00FFEFDAC3FEEDDDFEF2E5FEF4
          E9FEEEDED4A284A03D17AB5E46FCE4CBF9DEC1F8DABBF5D5B4EECCAACFAD8EFF
          00FFFF00FFEFDCC7FEF2E5FEF5ECFEF8F2F6EFE5BC9F8DAD856DBD987FFCE5CD
          FAE0C3F8DCBDF6D7B6F0CFADD2B090FF00FFFF00FFE6D6C4FEF3E7FEF7EFFEFB
          F7FEFBF7F3E6DDC88C6FF2BD9BFCE5CDFAE0C3F8DCBDF6D7B6F0CFADCAB19CFF
          00FFFF00FFEED7BEF4E7D8FEF6EDFEF9F4FEF9F4CBB4AD812B109F563DEDD3BC
          FAE0C3F8DCBDF6D7B6CCA98BFF00FFFF00FFFF00FFFF00FFEED7BEF4E8DAFEF6
          EDFEF6EDEBE0D8AD9089C3A89DF8E0C8F9DFC2F8DBBCF0CFADE0BFA0FF00FFFF
          00FFFF00FFFF00FFFF00FFEED7BEEFE0CFF9EBDBFEEEDDFDEAD7FCE5CCFBE1C6
          F0D4B7CCA98BE0BFA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEED7
          BEE6D6C4E1CCB4E1CBB2E0C9AFE0C8AED6BEA6FF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Transparent = True
      end
      object lGeneralLegendInfo: TcxLabel
        Left = 48
        Top = 1
        AutoSize = False
        Caption = 
          'Click the Save button to begin the import of the medicine purcha' +
          'ses to Kingswood.'
        ParentColor = False
        Style.BorderColor = clWhite
        Style.Color = clWhite
        Height = 21
        Width = 620
      end
      object lLegendSymbolInfo: TcxLabel
        Left = 48
        Top = 18
        AutoSize = False
        Caption = 
          'You can hover your mouse pointer over the import result(s) to re' +
          'veal more information.'
        ParentColor = False
        Style.BorderColor = clWhite
        Style.Color = clWhite
        Height = 21
        Width = 620
      end
    end
  end
  object pInformation: TPanel [4]
    Left = 0
    Top = 217
    Width = 1418
    Height = 112
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 8
    OnMouseMove = PanelMouseMove
    object lInformation: TcxLabel
      Left = 0
      Top = 32
      Align = alBottom
      AutoSize = False
      Caption = 
        '1. Replace Purchase Date with correct Treatment Date (if differe' +
        'nt).'#13#10'2. Insert or correct Animal Nos where needed. The numbers ' +
        'must be seperated by a comma or space.'#13#10'   Alternatively you can' +
        ' select either a category or group of animals from drop-down-lis' +
        't provided.'#13#10'3. Enter Application Rate and correct No of Days an' +
        'd Times/Day values.'
      Properties.Alignment.Vert = taBottomJustify
      Height = 80
      Width = 1418
    end
    object lUntickAnimals: TcxLabel
      Left = 5
      Top = 5
      Caption = 
        'Untick box at start of line, if you do not wish to save the even' +
        't.'
      Style.TextColor = clRed
      Style.TextStyle = [fsBold]
    end
  end
  inherited ActionList: TActionList
    Left = 688
    Top = 12
    object actImportFile: TAction
      Caption = 'Import File'
      ImageIndex = 3
      OnExecute = actImportFileExecute
    end
    object actRun: TAction
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actRunExecute
    end
    object actSaveHealthsManually: TAction
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveHealthsManuallyExecute
    end
    object actPrint: TAction
      Caption = 'Print'
      ImageIndex = 19
      OnExecute = actPrintExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
    object actSelectAll: TAction
      Caption = 'Select All'
      ImageIndex = 39
      OnExecute = actSelectAllExecute
    end
    object actDeselectAll: TAction
      Caption = 'Deselect All'
      ImageIndex = 40
      OnExecute = actDeselectAllExecute
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
        Color = clMenu
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 960
        FloatTop = 176
        FloatClientWidth = 65
        FloatClientHeight = 198
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
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
            Item = dxlbRun
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbSelectDeselectAll
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
        UseOwnFont = True
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeButtonArrowWidth = 10
    UseSystemFont = False
    Left = 658
    Top = 12
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actImportFile
      Category = 0
      Height = 45
      Width = 80
      SyncImageIndex = False
      ImageIndex = 4
    end
    object dxlbRun: TdxBarLargeButton
      Action = actRun
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actPrint
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Height = 45
      Width = 65
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = btnReviewMedicines
    end
    object blbSelectDeselectAll: TdxBarLargeButton
      Action = actDeselectAll
      Category = 0
      Height = 45
      Width = 85
    end
  end
  object OpenDialog: TOpenDialog
    Left = 718
    Top = 12
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = dxComponentPrinterLink
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 627
    Top = 12
    object dxComponentPrinterLink: TdxGridReportLink
      Active = True
      Component = gDrugRegister
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
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
      ReportDocument.Caption = 'Outstanding Treatments'
      ReportDocument.CreationDate = 44141.4637358333
      OptionsView.Headers = False
      OptionsView.Caption = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
  object pmAnimalSelect: TPopupMenu
    Left = 748
    Top = 12
    object pmiSelectAnimals: TMenuItem
      Caption = 'Select Animals'
      OnClick = pmiSelectAnimalsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pmiCurrentHerd: TMenuItem
      Caption = 'Current Herd'
      OnClick = pmiAnimalCategoryClick
    end
    object Categories1: TMenuItem
      Caption = 'Categories'
      object pmiCows: TMenuItem
        Caption = 'Cows'
        object pmiAllCows: TMenuItem
          Caption = 'All Cows'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiInMilk: TMenuItem
          Caption = 'In Milk'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiDry: TMenuItem
          Caption = 'Dry'
          OnClick = pmiAnimalCategoryClick
        end
      end
      object pmiReplacements: TMenuItem
        Caption = 'Replacements'
        Enabled = False
        Visible = False
      end
      object pmiBeefCattle: TMenuItem
        Caption = 'Beef Cattle'
        Enabled = False
        Visible = False
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object pmiAllCalves: TMenuItem
        Caption = 'All Calves'
        object pmiAllCalvesThisYear: TMenuItem
          Tag = 1
          Caption = 'This Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiAllCalvesLastYear: TMenuItem
          Tag = 2
          Caption = 'Last Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiAllCalvesBothYears: TMenuItem
          Caption = 'Both Years'
        end
      end
      object pmiHeiferCalves: TMenuItem
        Caption = 'Heifer Calves'
        object pmiHCalvesThisYear: TMenuItem
          Tag = 3
          Caption = 'This Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiHCalvesLastYear: TMenuItem
          Tag = 4
          Caption = 'Last Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiHCalvesBothYears: TMenuItem
          Caption = 'Both Years'
          OnClick = pmiAnimalCategoryClick
        end
      end
      object pmiDairyHeiferCalves: TMenuItem
        Caption = 'Dairy Heifer Calves'
        object pmiDHCalvesThisYear: TMenuItem
          Tag = 5
          Caption = 'This Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiDHCalvesLastYear: TMenuItem
          Tag = 6
          Caption = 'Last Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiDHCalvesBothYears: TMenuItem
          Caption = 'Both Years'
          OnClick = pmiAnimalCategoryClick
        end
      end
      object pmiBeefHeiferCalves: TMenuItem
        Caption = 'Beef Heifer Calves'
        object pmiBHCalvesThisYear: TMenuItem
          Tag = 7
          Caption = 'This Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiBHCalvesLastYear: TMenuItem
          Tag = 8
          Caption = 'Last Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiBHCalvesBothYears: TMenuItem
          Caption = 'Both Years'
          OnClick = pmiAnimalCategoryClick
        end
      end
      object pmiMaleCalves: TMenuItem
        Caption = 'Male Calves'
        object pmiMaleCalvesThisYear: TMenuItem
          Tag = 9
          Caption = 'This Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiMaleCalvesLastYear: TMenuItem
          Tag = 10
          Caption = 'Last Year'
          OnClick = pmiAnimalCategoryClick
        end
        object pmiMaleCalvesBothYears: TMenuItem
          Caption = 'Both Years'
          OnClick = pmiAnimalCategoryClick
        end
      end
    end
    object Groups1: TMenuItem
      Caption = 'Groups'
      OnClick = Groups1Click
    end
  end
  object pmAddMedicine: TPopupMenu
    Left = 777
    Top = 12
    object pmiAddMedicine: TMenuItem
      Caption = 'Add Medicine'
      OnClick = pmiAddMedicineClick
    end
    object pmiAddMedSupplier: TMenuItem
      Caption = 'Add Supplier'
      OnClick = pmiAddMedSupplierClick
    end
    object pmiAddMedAdminBy: TMenuItem
      Caption = 'Admin By (Add)'
      OnClick = pmiAddMedAdminByClick
    end
    object pmiMedPrescribedBy: TMenuItem
      Caption = 'Prescribing By (Add)'
      OnClick = pmiMedPrescribedByClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 838
    Top = 12
    object MenuItem1: TMenuItem
      Caption = 'Add Medicine'
    end
    object MenuItem2: TMenuItem
      Caption = 'Add Supplier'
    end
    object MenuItem3: TMenuItem
      Caption = 'Admin By (Add)'
    end
    object MenuItem4: TMenuItem
      Caption = 'Prescribing By (Add)'
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 807
    Top = 12
    object stDrugNotInDatabase: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 2386943
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = 2386943
    end
    object stDrugFoundInDatabase: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 41984
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = 41984
    end
    object stNoVPA: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object sDefaultEntry: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object GridButtonRepository: TcxEditRepository
    Left = 868
    Top = 12
    object VPANotFoundButton: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000530B0000530B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF40404040404040404040404040404040
            4040404040404040404040404040404040404040404040404040404040404040
            404040404040404040404040FF00FFFF00FFFF00FFFF00FF40404004A4A301A7
            A600ACAB00B3B200B9B700BEBC00C0BF00C2C000C4C200C5C300C4C200C3C100
            C2C000BEBD00BAB800B3B200ADAC00A8A7404040FF00FFFF00FFFF00FFFF00FF
            6464640BA8A707ADAB02B7B500C1BF00C8C600CDCB00D1CF00D4D200D6D400D6
            D400D6D300D4D200D2D000CDCB00C7C500BEBC00B3B100AAA9646464FF00FFFF
            00FFFF00FFFF00FFFF00FF40404016B4B30BBFBE0C9B9B01D1CF0C9B9B00DCDA
            0C9B9B00E1DF0C9B9B00E1DF0C9B9B00DCDA0C9B9B00CFCD0C9B9B00B6B44040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6464642ABAB81DC5C310CECC07
            D6D402DDDB01E3E000E6E400E8E600E9E600E8E500E5E300E1DF00DBD900D2D0
            00C5C300B5B3646464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040
            4029C5C40C9B9B18DAD80C9B9B09E6E40C9B9B02ECE90C9B9B00EBE90C9B9B00
            E3E10C9B9B00D1CF00C2C0404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF64646431C2C129CFCE2ADBD92FE4E234EAE92EEEEC1DEEEC0DEE
            EB04ECEA01E8E600E2E000D9D700CDCB00BBBA646464FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404029C9C72AD6D40C9B9B59ECEB
            0C9B9B5BF2F00C9B9B08EAE80C9B9B00DFDC0C9B9B00C5C3404040FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF64646429C1C026
            D0CF36DFDD66ECEBADF7F6A2F7F63EEEEC0AE8E601E2E000DAD800CDCB00BCBA
            646464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF4040402BC9C80C9B9B6DE9E80C9B9BD4FAFA0C9B9B0BE3E10C9B9B00
            D3D000C4C2404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF64646433C3C13DD3D26EE5E4ADF7F6DBFAFA50E9
            E70BDDDB01D5D300CAC800B9B7646464FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040400C9B9B72E1E0
            0C9B9BDBF9F90C9B9B0BD6D40C9B9B00C0BE404040FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF64
            646454CAC97CDEDDADF7F6D9F8F852DFDD0DCECC02C3C101B4B2646464FF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF40404087DCDB0C9B9BD8F6F60C9B9B0EC5C302B8B640
            4040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF64646495DBDAADF7F6D6F4F456D3
            D210BCBA03ADAB646464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF404040
            0C9B9BD2F1F10C9B9B13B2B0404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF6464647CD6D6D0EEEE5CC6C515AAA8646464FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF4040407CD6D652BFBF404040FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF64646456D3D244BC
            BB646464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF404040404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Kind = bkGlyph
        end>
    end
    object NoVPAButton: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000530B0000530B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040404040
            4040404040404040404040404040404040404040404040404040404040404040
            4040404040404040404040404040404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040403838CC3A3AB63A3AB63A3AB63A3AB63A3AB63A3AB63A3AB63A3A
            B63A3AB63A3AB63A3AB63A3AB63A3AB63A3AB63A3AB6404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF4040403838C43B3BC13F3FC94343D54646D64747E1
            4646D64848E64646D64949E74646D64848E64646D64141D33D3DCA3A3AB64040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403A3AC03F3FC74545D848
            48E44B4BEC4C4CF14D4DF34D4DF54E4EF64E4EF74E4EF74D4DF54A4AED4747E3
            4646D33A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403C3C
            BE4242D14646D64C4CEE4646D64F4FFA4646D65151FE4646D65151FF4646D650
            50FE4646D64A4AED4646D63A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040403E3EBF4646D74B4BE95050F45353FB5656FF5555FF5555FF5555
            FF5555FF5555FF5353FF5050FD4C4CF34646D33A3AB6404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF4040403F3FC04747D94646D65555F54646D66969FE
            4646D66262FF4646D65F5FFF4646D65555FF4646D64D4DF44646D63A3AB64040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3FBF4646D84D4DE956
            56F46565FB7070FD6E6EFE6868FF6565FF6464FF6161FF5555FF5050FD4D4DF3
            4646D33A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3F
            BD4646D64646D65656F34646D67474FC4646D66B6BFD4646D66666FF4646D656
            56FF4646D64D4DF24646D63A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040403E3EBC4646D54D4DE65757F26C6CF97E7EFB7C7CFC7373FC6F6F
            FD6D6DFE6868FE5757FF5050FA4D4DF04646D33A3AB6404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF4040403E3EBA4646D34646D65D5DF04646D69898FB
            4646D68989FC4646D67E7EFD4646D65A5AFD4646D64C4CEE4646D63A3AB64040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3FB84747D05151E26A
            6AEF9E9EF8C6C6FCBFBFFCACACFCA1A1FC9C9CFC9090FD7C7CF54F4FF54B4BEB
            4646D33A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040404242
            B54A4ACC4646D68181EE4646D6DADAFC4646D6B3B3FB4646D6A3A3FB4646D67C
            7CF54646D64A4AE64646D33A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040403F3FBD5656C96B6BDC9191EBAFAFF4ABABF59797F48888F48282
            F48080F47C7CF57C7CF54C4CE84747DD4242CD3A3AB6404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF4040403F3FBD7070C94646D68C8CE34646D67676E7
            4646D66363E74646D66060E84646D65454E44646D64444D14646D63A3AB64040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040403F3FBD7070CA8282D782
            82D66D6DD55F5FD45757D45454D55353D55353D65252D74D4DD34646CB4040C0
            3B3BBA3A3AB6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040405454
            BF5C5CC05C5CC05454BF5454BF5454BF5454BF5151BF5050C05050C05050C14D
            4DBE4747BC4141BD3D3DC23B3BCB404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040404040404040404040404040404040404040404040404040404040
            40404040404040404040404040404040404040404040404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Kind = bkGlyph
        end>
    end
    object DrugFoundButton: TcxEditRepositoryButtonItem
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.Buttons = <
        item
          Default = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000630B0000630B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040404040
            4040404040404040404040404040404040404040404040404040404040404040
            4040404040404040404040404040404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040401694161694161383131383131383131383131383131383131383
            13138313138313138313138313138313138313138313404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF40404016941613A3130AA00A0BAB0B0AA00A0BB40B
            0AA00A0BB80B0AA00A0BB90B0AA00A0BBA0B0AA00A0DAC0D0AA00A1383134040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404017A7170BA00B0BAD0B0A
            B60A0ABC0A0ABF0A0AC10A0AC20A0AC30A0AC40A0AC40A0AC40A0BC00B0CB70C
            0DAB0D138313404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF404040109E
            100BA70B0AA00A09BC090AA00A09C5090AA00A09C8090AA00A09CA090AA00A0A
            CB0A0AA00A0BBD0B0AA00A138313404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040400C9A0C0AAC0A0AB90A0BC10B0DC70D0ECA0E0DCB0D0CCC0C0CCC
            0C0BCD0B0BCE0B0ACE0A0ACA0A0BC10B0CB60C138313404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF4040400C9A0C0AAC0A0AA00A10C2100AA00A28CE28
            0AA00A1ECD1E0AA00A19CD190AA00A10CD100AA00A0AC20A0AA00A1383134040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040400B990B0AAB0A0BB80B11
            C21124CB2433D0332FCF2F27CE2722CD2220CE201BCD1B13CC130AC90A0AC00A
            0BB50B138313404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040400B98
            0B0AAA0A0AA00A12C1120AA00A38D0380AA00A2BCE2B0AA00A24CD240AA00A15
            CB150AA00A09BF090AA00A138313404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040400B970B0AA90A0BB60B14C0142FCC2F46D34643D24337D03730CF
            302DCF2D26CE2619CB190BC70B09BE090AB30A138313404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF4040400C960C0AA70A0AA00A1CC11C0AA00A6CDB6C
            0AA00A56D6560AA00A47D4470AA00A26CD260AA00A09BC090AA00A1383134040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040400E940E0CA50C12B4122F
            C42F77DB77AEEBAEA4E9A488E28879DF7971DD7161DA613FD23F0FC40F09BA09
            0AAF0A138313404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4040401393
            1313A4130AA00A50CB500AA00ACBF1CB0AA00A93E4930AA00A7DDF7D0AA00A4D
            D44D0AA00A09B6090AA00A138313404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF404040259D2525A5253AB83A69CF6991DE918ADD8A6ED66E59D15951CF
            514ECF4E47CE4738CA3813BC1309B0090AA40A138313404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF404040259D254BAE4B0AA00A66C8660AA00A44C344
            0AA00A29BD290AA00A26BD260AA00A20BC200AA00A0AA70A0A9B0A1383134040
            40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404021A6214BAE4B5ABE5A5E
            BC5E41B5412CAF2C21AD211CAC1C1BAD1B1BAD1B1AAE1A19AD1913A6130E9B0E
            139D13169416404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404021A6
            2148AA4848AA4848AA4848AA4832A232289F28239E23229E22229F22229F2221
            9F211F9F1F21A621169416169416404040FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF4040404040404040404040404040404040404040404040404040404040
            40404040404040404040404040404040404040404040404040FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Kind = bkGlyph
        end>
    end
    object EnterVPANo: TcxEditRepositoryTextItem
    end
  end
  object pmEnterVPA: TPopupMenu
    Left = 900
    Top = 12
    object ManualEnterVPANo1: TMenuItem
      Caption = 'Manual Enter VPA No'
      OnClick = ManualEnterVPANo1Click
    end
    object EditVPANo1: TMenuItem
      Caption = 'Search For VPA No With Drug Name'
      OnClick = EditVPANo1Click
    end
  end
end
