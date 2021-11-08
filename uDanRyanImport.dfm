inherited fmDanRyanImport: TfmDanRyanImport
  Left = 331
  Top = 174
  Width = 1096
  Height = 566
  Caption = 'Cows365 Data Import'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 515
    Width = 1088
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
  end
  object pcEvents: TcxPageControl [1]
    Left = 0
    Top = 49
    Width = 1088
    Height = 466
    ActivePage = cxDNB
    Align = alClient
    LookAndFeel.Kind = lfStandard
    Style = 9
    TabHeight = 30
    TabOrder = 5
    TabWidth = 120
    OnChange = pcEventsChange
    ClientRectBottom = 466
    ClientRectRight = 1088
    ClientRectTop = 31
    object tsFit: TcxTabSheet
      Caption = 'Fit'
      ImageIndex = 0
      object EventGrid: TcxGrid
        Left = 8
        Top = 13
        Width = 619
        Height = 409
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object EventGridDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.KeyFieldNames = 'ID'
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
          OptionsView.GroupByBox = False
          object EventGridDBTableViewAnimalNo: TcxGridDBColumn
            DataBinding.FieldName = 'AnimalNo'
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object EventGridDBTableViewNatIDNum: TcxGridDBColumn
            Caption = 'National ID'
            DataBinding.FieldName = 'NatIDNum'
            HeaderAlignmentVert = vaCenter
            Width = 146
          end
          object EventGridDBTableViewEventDate: TcxGridDBColumn
            DataBinding.FieldName = 'EventDate'
            HeaderAlignmentVert = vaCenter
            Width = 85
          end
          object EventGridDBTableViewCode: TcxGridDBColumn
            Caption = 'Event Code'
            DataBinding.FieldName = 'EventCode'
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object EventGridDBTableViewEventDesc: TcxGridDBColumn
            Caption = 'Classification'
            DataBinding.FieldName = 'EventDesc'
            HeaderAlignmentVert = vaCenter
            Width = 200
          end
        end
        object EventGridLevel: TcxGridLevel
          GridView = EventGridDBTableView
        end
      end
    end
    object tsFreshTime: TcxTabSheet
      Caption = 'Fresh/Time'
      ImageIndex = 1
    end
    object tsAttention: TcxTabSheet
      Caption = 'Attention'
      ImageIndex = 2
    end
    object tsServed: TcxTabSheet
      Caption = 'Served'
      ImageIndex = 3
    end
    object tsPregnant: TcxTabSheet
      Caption = 'Pregnant'
      ImageIndex = 4
    end
    object tsUnfit: TcxTabSheet
      Caption = 'Unfit'
      ImageIndex = 5
    end
    object tsCycling: TcxTabSheet
      Caption = 'Cycling'
      ImageIndex = 7
    end
    object tsRescanAdvised: TcxTabSheet
      Caption = 'Rescan Advised'
      ImageIndex = 8
    end
    object cxDNB: TcxTabSheet
      Caption = 'Do Not Breed'
      ImageIndex = 9
    end
    object tsLog: TcxTabSheet
      Caption = 'Log'
      ImageIndex = 6
      object cxmLog: TcxMemo
        Left = 0
        Top = 0
        Align = alClient
        Lines.Strings = (
          '')
        Properties.ReadOnly = True
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        Height = 435
        Width = 1088
      end
    end
  end
  inherited ActionList: TActionList
    Left = 527
    Top = 10
    object actSaveEvents: TAction
      Caption = 'Save'
      Hint = 'Click here to save all fertility events'
      ImageIndex = 8
      OnExecute = actSaveEventsExecute
    end
    object actEnableBillyCurtinFormat: TAction
      Caption = 'Enable Billy Curtin Format'
      OnExecute = actEnableBillyCurtinFormatExecute
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
            Item = lbOpenFile
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = lbSave
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbOptions
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
    Left = 497
    Top = 10
    DockControlHeights = (
      0
      0
      49
      0)
    object lbOpenFile: TdxBarLargeButton
      Caption = 'Open File'
      Category = 0
      Hint = 'Click here to open the file'
      Visible = ivAlways
      OnClick = lbOpenFileClick
      Height = 45
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000530F0000530F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        238FBB218BB72187B22187B22187B22187B22187B22187B226983E2187B22C8B
        B32F8CB4FF00FFFF00FFFF00FF248CB8259DCA2CACDB31AEDC35B0DC41B5DF4B
        B9E04BB9E021AD394BCD6A1E783183CFEA83CFEA39A5CEFF00FFFF00FF248CB8
        30A5D04AB8E05BC0E36AC6E67BCDE886D1EA21AD394BCD6A32A7492DA0411E78
        31ADE0F139A5CEFF00FFFF00FF248CB837A8D164C3E580CEE98CD3EB96D7ED21
        AD3921AD3921AD3921AD3921AD3921AD3926983E39A5CEFF00FFFF00FF248CB8
        39A5CE7ECEE99DDAEEA2DCEFA8DEF0B7E4F3B7E4F321AD394BCD6A228835B7E4
        F3B7E4F339A5CEFF00FFFF00FF248CB839A5CE9DDAEEA9DFF0AEE1F1B4E3F2B8
        E5F3BEE7F421AD394BCD6A26983ED4F0F8DAF2FA39A5CEFF00FFFF00FF248CB8
        39A5CECFEEF8E6F8FCE6F8FCCEEEF7CDEDF7CDECD321AD3926983EB6DABDE7F8
        FCECFAFD39A5CEFF00FFFF00FF248CB839A5CE39A5CE39A5CE39A5CE29ADD6CD
        ECD321AD3926983E9ED1A9F0FBFEF5FDFEF7FEFE39A5CEFF00FFFF00FF248CB8
        2BADD836B1DD54BDE36EC7E769C5E521AD3926983E39A5CE39A5CE39A5CE39A5
        CE39A5CE39A5CEFF00FFFF00FF248CB843B7DC80CEEA92D5ED9EDAEEA8DEF08D
        D4EA8DD4EA8DD4EA8CD3EA8CD3EA8CD3EA54BDE3FF00FFFF00FFFF00FF248CB8
        4EB8DBAADFF0C0E8F4E6F8FCE6F8FCCBECF639A5CEFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF39A5CE39A5CE39A5CE39A5CE39A5CE39
        A5CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Width = 65
    end
    object lbSave: TdxBarLargeButton
      Action = actSaveEvents
      Category = 0
      Height = 45
      Width = 65
    end
    object blbOptions: TdxBarLargeButton
      Caption = 'Options'
      Category = 0
      Hint = 'Options'
      Visible = ivAlways
      OnClick = blbOptionsClick
      Height = 45
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000FFFFFF00000000000000000000000000000000000075737173
        716F757371000000000000000000000000000000000000FFFFFF000000000000
        6D6B696C6A69000000000000716F6DEEECEB716F6D0000000000007472706C6A
        69000000000000FFFFFF0000006F6D6BA19F9D9E9C9A706E6C716F6D898785E1
        DFDE898785716F6D72706E9F9D9BA19F9D716F6D000000FFFFFF0000007A7876
        9F9D9BDFDDDBB8B6B4DBD9D7D8D6D4D6D4D2D8D6D4DBD9D7B8B6B4DFDDDB9F9D
        9B7A7876000000FFFFFF000000000000767572B7B3B3D2D0CFD1CFCFD3D1D0D3
        D1D0D3D1D0D1CFCFD2D0CFB7B3B3757371000000000000FFFFFF000000000000
        787674D2D0CECECCCABEBCBA92908E8D8B8992908EBEBCBACECCCAD2D0CE7876
        74000000000000FFFFFF817F7D7C7A789D9B99CCC9C8CCC9C893918F7A78767E
        7C7A7A787693918FCCC9C8CCC9C89D9B997C7A78817F7DFFFFFF817F7DE3E1DF
        DCDAD8C6C5C2C8C6C48F8D8B4847460000004847468F8D8BC8C6C4C6C5C2DCDA
        D8E3E1DF817F7DFFFFFF848280807E7C949492D0CECCC3C0BF93918F72716F3A
        393872716F939290C3C0BFD0CECC949492807E7C848280FFFFFF000000000000
        807E7CDAD9D8BEBBB9BCB9B794918E928F8D94918FB3B2B0BEBBB9DBD9D8807E
        7C000000000000FFFFFF000000000000827F7DACAAA8C7C5C3BBB8B7BAB7B6BB
        B8B7BBB8B7BBB8B7C7C5C3ACAAA8817F7D000000000000FFFFFF00000082807E
        A4A2A0DAD8D7C6C4C2E4E3E1DBD9D7C2BFBED7D5D4E4E3E1C5C4C2DAD8D7A4A2
        A082807E000000FFFFFF0000008B8987B2B1AFAFAEAC8583818684829A9897BC
        BAB79A9897868482858381AFAEACB2B1AF8B8987000000FFFFFF000000000000
        8D8B898D8B890000000000008B8987E9E7E78B89870000000000008C8A888D8B
        89000000000000FFFFFF000000000000000000000000000000000000908E8C8F
        8D8B908E8C000000000000000000000000000000000000FFFFFF}
      Width = 65
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'CSV|*.csv'
    Left = 557
    Top = 10
  end
  object Parser: TSPParser
    Sepchar = ','
    CharSearch = True
    Left = 587
    Top = 10
  end
  object pmOptions: TPopupMenu
    Left = 468
    Top = 10
    object miBillyCurtinFormat: TMenuItem
      Action = actEnableBillyCurtinFormat
    end
  end
end
