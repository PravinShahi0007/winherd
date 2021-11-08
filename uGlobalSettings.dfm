object fmGlobalSettings: TfmGlobalSettings
  Left = 717
  Top = 270
  BorderStyle = bsDialog
  Caption = 'Kingswood Herd - Preferences'
  ClientHeight = 413
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = o
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 160
    Top = 7
    Width = 400
    Height = 330
    Caption = 'General Preferences '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    object cxPageControl1: TcxPageControl
      Left = 2
      Top = 15
      Width = 396
      Height = 313
      ActivePage = tsSystem
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LookAndFeel.NativeStyle = True
      ParentFont = False
      TabOrder = 0
      ClientRectBottom = 309
      ClientRectLeft = 4
      ClientRectRight = 392
      ClientRectTop = 24
      object cxTabSheet1: TcxTabSheet
        Caption = 'General'
        ImageIndex = 0
        object cbCalfReg: TcxCheckBox
          Left = 8
          Top = 6
          Hint = 
            'Show reminder to register calves after completing calf registrat' +
            'ion'
          Caption = 'Calf Registration Reminder'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 270
        end
        object cbSaveAnother: TcxCheckBox
          Left = 8
          Top = 26
          Hint = 'Prompts users to save another event'
          Caption = 'Save Another Event'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 270
        end
        object cbBlade: TcxCheckBox
          Left = 272
          Top = 199
          Caption = 'Notify Blade '
          Enabled = False
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 5
          Visible = False
          Width = 31
        end
        object cbMandatoryEvents: TcxCheckBox
          Left = 8
          Top = 66
          Caption = 'Mandatory Breeding Events'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 270
        end
        object cbEnforceDryOff: TcxCheckBox
          Left = 8
          Top = 86
          Caption = 'Mandatory Dry Off Event'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 270
        end
        object cbAllowDuplicateTags: TcxCheckBox
          Left = 8
          Top = 46
          Hint = 
            'Show reminder to register calves after completing calf registrat' +
            'ion'
          Caption = 'Allow Duplicate National Identity Numbers'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 270
        end
        object cbBullsBreeding: TcxCheckBox
          Left = 8
          Top = 106
          Caption = 'Default Bulls To Breeding'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 6
          Width = 270
        end
        object cbUseIEPrefixForNatIDSearch: TcxCheckBox
          Left = 8
          Top = 126
          Caption = 'Use "IE" prefix when searching National Id. No.'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 7
          Width = 270
        end
        object cbDisplayAnimalComments: TcxCheckBox
          Left = 8
          Top = 146
          Caption = 'Display Animal Comments on main screen'
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.OnChange = cbDisplayAnimalCommentsPropertiesChange
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 8
          Width = 270
        end
        object cbBulkTankMaualEdit: TcxCheckBox
          Left = 8
          Top = 166
          Hint = 'Allow Bulk Tank Manual Entry'
          Caption = 'Allow Bulk Tank Manual Entry'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clBlack
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 9
          Width = 168
        end
      end
      object tsSystem: TcxTabSheet
        Caption = 'System'
        ImageIndex = 2
        object Label4: TLabel
          Left = 12
          Top = 10
          Width = 81
          Height = 13
          Caption = 'Default Male Sex'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cbUseBarCodeScanner: TcxCheckBox
          Left = 8
          Top = 54
          Caption = 'Use Barcode Scanner'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 125
        end
        object cbDisplayGettingStarted: TcxCheckBox
          Left = 8
          Top = 34
          Caption = 'Display Getting Started screen on program startup'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 271
        end
        object cmbDefaultMaleSex: TcxComboBox
          Left = 111
          Top = 6
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            'Bull'
            'Steer')
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 158
        end
        object cbCrush: TcxCheckBox
          Left = 8
          Top = 74
          Caption = 'Crush'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 121
        end
        object cbEnableBeefGroupPurchases: TcxCheckBox
          Left = 8
          Top = 94
          Caption = 'Enable Beef Group Purchases'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 167
        end
        object cbDealer: TcxCheckBox
          Left = 8
          Top = 114
          Caption = 'Dealer'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 167
        end
      end
    end
  end
  object gbAnimalGridSettings: TGroupBox
    Tag = 7
    Left = 160
    Top = 7
    Width = 400
    Height = 330
    Caption = 'Animal Grid Display'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Visible = False
    object cxLabel2: TcxLabel
      Left = 13
      Top = 24
      Caption = 'Sire Column'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cmboAnimalGridSireField: TcxComboBox
      Left = 160
      Top = 20
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Animal No.'
        'Herd Book No.'
        'Name')
      Properties.OnChange = cmboAnimalGridSireFieldPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 137
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 116
      Width = 135
      Height = 27
      Caption = 'Grid Colour Settings'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cxButton1Click
      LookAndFeel.NativeStyle = True
    end
    object cbDisplayMovementFeedColsinGridView: TcxCheckBox
      Left = 8
      Top = 47
      Caption = 'Display Movement columns in grid view'
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.OnChange = cbDisplayMovementFeedColsinGridViewPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 271
    end
    object cbAnimalGridHideSearchBar: TcxCheckBox
      Left = 8
      Top = 69
      Caption = 'Hide Animal Grid Search Bar'
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      Width = 271
    end
  end
  object GroupBox8: TGroupBox
    Tag = 8
    Left = 162
    Top = 7
    Width = 400
    Height = 330
    Caption = 'Email Settings'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    Visible = False
    object btnDefaultEmailClient: TcxButton
      Left = 10
      Top = 22
      Width = 131
      Height = 25
      Caption = 'Default Email Client'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnDefaultEmailClientClick
      LookAndFeel.NativeStyle = True
    end
  end
  object GroupBox7: TGroupBox
    Tag = 5
    Left = 160
    Top = 7
    Width = 400
    Height = 355
    Caption = 'Event Defaults'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object pcEventDefaults: TcxPageControl
      Left = 2
      Top = 15
      Width = 396
      Height = 338
      ActivePage = tsCalving
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      LookAndFeel.NativeStyle = False
      MultiLine = True
      ParentFont = False
      Style = 9
      TabOrder = 0
      TabSlants.Positions = []
      ClientRectBottom = 338
      ClientRectRight = 396
      ClientRectTop = 36
      object tsBulling: TcxTabSheet
        Caption = 'Bulling'
        ImageIndex = 0
      end
      object tsService: TcxTabSheet
        Caption = 'Service'
        ImageIndex = 1
        object cbRecordCDAfterService: TcxCheckBox
          Left = 10
          Top = 15
          Caption = 'Enter a Condition Score after saving Service Event'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 301
        end
        object cbRecordHealthAfterService: TcxCheckBox
          Left = 10
          Top = 40
          Caption = 'Enter Health Code after saving Service Event'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Visible = False
          Width = 301
        end
      end
      object tsPregDiag: TcxTabSheet
        Caption = 'Preg. Diag.'
        ImageIndex = 2
      end
      object tsDryOff: TcxTabSheet
        Caption = 'Dry Off/Weaning'
        ImageIndex = 3
      end
      object tsCalving: TcxTabSheet
        Caption = 'Calving'
        ImageIndex = 4
        object lDefaultHealthCode: TLabel
          Left = 42
          Top = 110
          Width = 151
          Height = 13
          Caption = 'Default Health Code to be used'
          Visible = False
        end
        object cbRecordCDAfterCalving: TcxCheckBox
          Left = 10
          Top = 62
          Caption = 'Enter a Condition Score after saving Calving Event'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 316
        end
        object gbCalfNatIDEntry: TcxGroupBox
          Left = 0
          Top = 231
          Align = alBottom
          Caption = 'Calf National Identity Generation '
          Style.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.Kind = lfFlat
          TabOrder = 2
          Height = 71
          Width = 396
          object NatIDEntryStyleGrid: TcxGrid
            Left = 2
            Top = 16
            Width = 392
            Height = 53
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object NatIDEntryStyleGridDBTableView: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              OnEditValueChanged = NatIDEntryStyleGridDBTableViewEditValueChanged
              DataController.DataSource = WinData.OwnerSource
              DataController.KeyFieldNames = 'ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              object NatIDEntryStyleGridDBTableViewHerdIdentity: TcxGridDBColumn
                Caption = 'Herd Identity'
                DataBinding.FieldName = 'HerdIdentity'
                Options.Editing = False
                Width = 85
              end
              object NatIDEntryStyleGridDBTableViewNatIDNumEntryStyle: TcxGridDBColumn
                Caption = 'Nat. Id. No. Input'
                DataBinding.FieldName = 'NatIDNumInputStyle'
                RepositoryItem = HerdLookup.erNatIdNoEntryStyleLookup
                Width = 115
              end
              object NatIDEntryStyleGridDBTableViewNatIDLeadZero: TcxGridDBColumn
                Caption = 'Use Leading Zero'
                DataBinding.FieldName = 'NatIDLeadZero'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.DisplayChecked = 'Yes'
                Properties.DisplayUnchecked = 'No'
                Properties.DisplayGrayed = 'No'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.ValueGrayed = 'False'
              end
              object NatIDEntryStyleGridDBTableViewNextNatID: TcxGridDBColumn
                Caption = 'Next Nat Id. No.'
                DataBinding.FieldName = 'NextNatID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.MaxLength = 4
                Width = 86
              end
            end
            object NatIDEntryStyleGridLevel: TcxGridLevel
              GridView = NatIDEntryStyleGridDBTableView
            end
          end
        end
        object cbRecordHealthAfterCalving: TcxCheckBox
          Left = 10
          Top = 86
          Caption = 'Complete Calving Survey After Calving Has Been Saved'
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.OnChange = cbRecordHealthAfterCalvingPropertiesChange
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 316
        end
        object cmboICBFHealthCode: TcxLookupComboBox
          Left = 198
          Top = 106
          RepositoryItem = HerdLookup.ICBFHealthCodeLookup
          Properties.ListColumns = <>
          Style.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.Kind = lfFlat
          TabOrder = 3
          Visible = False
          Width = 97
        end
        object cbAutoCompletePDACalving: TcxCheckBox
          Left = 10
          Top = 38
          Caption = 'Auto complete calving event when imported from PDA '
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.OnEditValueChanged = cbAutoCompletePDACalvingPropertiesEditValueChanged
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 316
        end
        object cbUseNatIDAnimalNo: TcxCheckBox
          Left = 10
          Top = 14
          Hint = 
            'When calving an animal, if a new Irish Plastic Tag is being used' +
            ' the program will use'#13#10'the last four digits of the tag number fo' +
            'r the animal number.'#13#10#13#10'This will only occurr if the animal numb' +
            'er is blank at time of entering '#13#10'the National ID Number.'
          Caption = 'Use Part Nat ID as Animal No.'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 316
        end
        object cbShowCalvingGroupControls: TcxCheckBox
          Left = 10
          Top = 134
          Caption = 'Show Dam && Calf Group'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 6
          Width = 316
        end
        object cbShowCalvingCommentControl: TcxCheckBox
          Left = 10
          Top = 158
          Caption = 'Show Comment'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 7
          Width = 316
        end
        object cbShowCalvingBirthWeightControls: TcxCheckBox
          Left = 172
          Top = 134
          Caption = 'Show Birth Weight'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 8
          Width = 180
        end
        object cbShowCalfColour: TcxCheckBox
          Left = 172
          Top = 158
          Caption = 'Show Calf Colour'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 9
          Width = 180
        end
        object cbDisplayTagIdentifierSelector: TcxCheckBox
          Left = 10
          Top = 182
          Caption = 'Display Tag Identifier Selector Before Calving'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 10
          Width = 240
        end
        object cbDefaultSexOfCalf: TcxCheckBox
          Left = 11
          Top = 206
          Caption = 'Default Sex of Calf To'
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.OnChange = cbDefaultSexOfCalfPropertiesChange
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 11
          Width = 132
        end
        object cmboDefaultCalfSex: TcxComboBox
          Left = 141
          Top = 206
          Properties.DropDownListStyle = lsFixedList
          TabOrder = 12
          Width = 93
        end
      end
      object tsHealth: TcxTabSheet
        Caption = 'Health'
        ImageIndex = 5
        object Label8: TLabel
          Left = 16
          Top = 17
          Width = 83
          Height = 13
          Caption = 'Default Comment'
        end
        object cmbDefaultHealthComment: TcxComboBox
          Left = 124
          Top = 13
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 163
        end
      end
      object tsSaleDeaths: TcxTabSheet
        Caption = 'Sales/Deaths'
        ImageIndex = 6
        object Label7: TLabel
          Left = 254
          Top = 18
          Width = 34
          Height = 13
          Caption = 'Format'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbExitAfterSale: TcxCheckBox
          Left = 10
          Top = 40
          Caption = 'Exit Sale/Death screen after completion of event.'
          Properties.ImmediatePost = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 283
        end
        object cbReNumAnimal: TcxCheckBox
          Left = 10
          Top = 15
          Caption = 'Re-number Animal after Sales/Deaths'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnClick = cbReNumAnimalClick
          Width = 209
        end
        object cbReNumFormat: TComboBox
          Left = 294
          Top = 16
          Width = 89
          Height = 21
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
          Items.Strings = (
            '/yy'
            '(yy)')
        end
        object cbDaysKeptOnFarmWarning: TcxCheckBox
          Left = 10
          Top = 150
          Caption = 
            'Display warning when selling an animal under minimum number of d' +
            'ays permitted to be kept on farm'
          Properties.ImmediatePost = True
          Properties.MultiLine = True
          Properties.OnChange = cbDaysKeptOnFarmWarningPropertiesChange
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 371
        end
        object cbTBTestDateWarning: TcxCheckBox
          Left = 10
          Top = 90
          Caption = 
            'Warn me when selling animals that have no TB Test within the pas' +
            't year'
          Properties.ImmediatePost = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 373
        end
        object cbBruceTestDateWarning: TcxCheckBox
          Left = 10
          Top = 115
          Caption = 
            'Warn me when selling animals that have no Brucellosis Test Date ' +
            'within 30 days of sale'
          Properties.ImmediatePost = True
          Properties.MultiLine = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 371
        end
        object cxLabel3: TcxLabel
          Left = 14
          Top = 185
          Caption = 'Minimum days to be kept on farm before moving'
        end
        object seMinimumDaysKeptOnFarm: TcxSpinEdit
          Left = 250
          Top = 184
          Properties.ImmediatePost = True
          Style.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.Kind = lfStandard
          TabOrder = 6
          Width = 55
        end
        object cbUseLastWeighingAsLiveWeight: TcxCheckBox
          Left = 10
          Top = 65
          Caption = 'Use last recorded weight as live weight for Kill Out %'
          Properties.ImmediatePost = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 8
          Width = 283
        end
        object cbRemoveTransponderAfterSale: TcxCheckBox
          Left = 11
          Top = 237
          Caption = 'Remove Transponder Number After Sale'
          Properties.ImmediatePost = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 9
          Width = 231
        end
        object cbUsePurchaseWeightAsLiveWeight: TcxCheckBox
          Left = 11
          Top = 212
          Caption = 'Use purchase weight as live weight for Kill Out %'
          Properties.ImmediatePost = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 10
          Width = 283
        end
      end
      object tsWeighings: TcxTabSheet
        Caption = 'Weighing'
        ImageIndex = 7
        object cbWeighingMoveAnimalFocus: TcxCheckBox
          Left = 10
          Top = 15
          Caption = 'On save of event, move to next animal on main grid'
          Properties.ImmediatePost = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 283
        end
      end
      object tsMartFiles: TcxTabSheet
        Caption = 'Mart Files'
        ImageIndex = 8
        object cbReviewMartFiles: TcxCheckBox
          Left = 10
          Top = 15
          Caption = 'Review Mart Files'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 271
        end
        object cbSaveCommentAsSourceName: TcxCheckBox
          Left = 10
          Top = 40
          Caption = 'Save Comment As Customer/Supplier Name'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 271
        end
        object cbUpdateMartWeightWithCrushWeight: TcxCheckBox
          Left = 10
          Top = 65
          Caption = 'Update Mart Weight And Price With Crush Weight'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 265
        end
      end
      object tsTempMove: TcxTabSheet
        Caption = 'Temp Move.'
        ImageIndex = 9
        object cbBlockTempMovements: TcxCheckBox
          Left = 10
          Top = 15
          Caption = 'Show Temp Movements (Block Events)'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 271
        end
      end
    end
  end
  object GroupBox4: TGroupBox
    Tag = 2
    Left = 160
    Top = 7
    Width = 400
    Height = 330
    Caption = 'Backup Preferences '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Visible = False
    object cbBackupTest: TcxCheckBox
      Left = 16
      Top = 46
      Hint = 'Tests the floppy disk backup for disk corruption. '
      Caption = 'Test backup after completion'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 193
    end
    object cbArchive: TcxCheckBox
      Left = 16
      Top = 22
      Hint = 'Stores the last backup taken to the hard disk (C Drive)'
      Caption = 'Archive Backup to hard disk'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 233
    end
    object cbSpanDisks: TcxCheckBox
      Left = 16
      Top = 70
      Hint = '(When more than 1 floppy disk is needed for backup)'
      Caption = 'Use Spanned Disks '
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Width = 184
    end
    object cbBackupStoreRegFiles: TcxCheckBox
      Left = 16
      Top = 94
      Hint = '(When more than 1 floppy disk is needed for backup)'
      Caption = 'Store Calf/ICBF Registration Files'
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 233
    end
    object cbBackupStorePedigreeImages: TcxCheckBox
      Left = 16
      Top = 118
      Hint = '(When more than 1 floppy disk is needed for backup)'
      Caption = 'Store Pedigree Image Files'
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      Width = 233
    end
  end
  object GroupBox3: TGroupBox
    Tag = 100
    Left = 160
    Top = 9
    Width = 400
    Height = 330
    Caption = 'PhoneLink Preferences '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
    object Label5: TLabel
      Left = 16
      Top = 51
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'COM Port'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 79
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Connection Via'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbPhoneLinkAtStartup: TcxCheckBox
      Left = 16
      Top = 22
      Caption = 'Check PhoneLink on startup'
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 225
    end
    object ConnectMode: TComboBox
      Left = 108
      Top = 74
      Width = 93
      Height = 21
      DropDownCount = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        'DAU-9P'
        'DLR-3'
        'InfraRed')
    end
    object COM: TComboBox
      Left = 108
      Top = 46
      Width = 75
      Height = 21
      DropDownCount = 5
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      Sorted = True
      TabOrder = 2
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
  end
  object GroupBox5: TGroupBox
    Tag = 3
    Left = 160
    Top = 7
    Width = 400
    Height = 330
    Caption = 'Security Preferences '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Visible = False
    object GroupBox6: TGroupBox
      Left = 44
      Top = 39
      Width = 325
      Height = 245
      Caption = 'Herd Password '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 32
        Top = 92
        Width = 75
        Height = 13
        Caption = 'Enter Password'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 125
        Width = 86
        Height = 13
        Caption = 'Confirm Password'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 32
        Top = 26
        Width = 219
        Height = 43
        AutoSize = False
        Caption = 
          'Enter a password to protect your data from unwanted viewing. Pas' +
          'sword must be 6-10 characters in length.'
        WordWrap = True
      end
      object Pass: TEdit
        Left = 150
        Top = 90
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 0
        OnChange = ConfirmPassChange
      end
      object ConfirmPass: TEdit
        Left = 150
        Top = 119
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        OnChange = ConfirmPassChange
      end
      object Save: TButton
        Left = 200
        Top = 194
        Width = 75
        Height = 25
        Caption = '&Save'
        Default = True
        Enabled = False
        TabOrder = 2
        OnClick = SaveClick
      end
      object Disable: TButton
        Left = 116
        Top = 194
        Width = 75
        Height = 25
        Caption = 'Clear'
        Enabled = False
        TabOrder = 3
        OnClick = DisableClick
      end
    end
  end
  object GroupBox2: TGroupBox
    Tag = 1
    Left = 160
    Top = 7
    Width = 400
    Height = 330
    Caption = 'Startup Reminders'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    object cbNewVersionReminder: TcxCheckBox
      Left = 16
      Top = 46
      Caption = 'New Version'
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 234
    end
    object cbNewVersionFieldsReps: TcxCheckBox
      Left = 16
      Top = 265
      Caption = 'Check latest Fields/REPS version'
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Visible = False
      Width = 233
    end
    object cbNewVersionStartup: TcxCheckBox
      Left = 16
      Top = 241
      Caption = 'Check for new version on startup'
      Enabled = False
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Visible = False
      Width = 233
    end
    object cbBackup: TcxCheckBox
      Left = 16
      Top = 22
      Hint = 'To show backup reminder when opening Herd program'
      Caption = 'Backup'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 234
    end
    object cbProActiveActionList: TcxCheckBox
      Left = 16
      Top = 118
      Hint = 'To show backup reminder when opening Herd program'
      Caption = 'Pro-Active Action Reminder Reports'
      ParentFont = False
      Properties.OnChange = cbProActiveActionListPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      Width = 234
    end
    object cbActionWarningReminders: TcxCheckBox
      Left = 16
      Top = 142
      Hint = 'To show backup reminder when opening Herd program'
      Caption = 'Action/Warning/Reminders'
      ParentFont = False
      Properties.OnChange = cbActionWarningRemindersPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 5
      Width = 234
    end
    object cbHerdVaccination: TcxCheckBox
      Left = 16
      Top = 70
      Hint = 'To show backup reminder when opening Herd program'
      Caption = 'Herd Vaccination'
      ParentFont = False
      Properties.OnChange = cbHerdVaccinationPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 6
      Width = 234
    end
    object cbGmailEmailDownloadReminder: TcxCheckBox
      Left = 16
      Top = 94
      Hint = 'To show reminder to check Gmail Inbox in Startup Reminders'
      Caption = 'Gmail Inbox Download'
      ParentFont = False
      Properties.OnChange = cbGmailEmailDownloadReminderPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 7
      Width = 234
    end
    object cbICBFRegReminder: TcxCheckBox
      Left = 16
      Top = 166
      Hint = 'To show backup reminder when opening Herd program'
      Caption = 'Register Events With ICBF'
      ParentFont = False
      Properties.OnChange = cbActionWarningRemindersPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 8
      Width = 234
    end
    object cbAIMHerdRecReminder: TcxCheckBox
      Left = 16
      Top = 190
      Hint = 'To show backup reminder when opening Herd program'
      Caption = 'Sync With AIM'
      ParentFont = False
      Properties.OnChange = cbActionWarningRemindersPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 9
      Width = 234
    end
  end
  object Button1: TButton
    Left = 397
    Top = 374
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 483
    Top = 374
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Default = True
    ModalResult = 2
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 8
    Top = 9
    Width = 147
    Height = 351
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    Style = lbOwnerDrawFixed
    TabOrder = 3
    OnClick = ListBox1Click
    OnMeasureItem = ListBox1MeasureItem
  end
end
