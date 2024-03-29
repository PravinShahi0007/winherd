object ReportFrame: TReportFrame
  Left = 0
  Top = 0
  Width = 490
  Height = 300
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 490
    Height = 53
    ButtonHeight = 45
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 58
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'E&xit'
      Flat = True
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03D00000000000000000000000000000000000000000000
        E03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DFF7FEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003CE07F003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DEF3DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DFF7FFF7FFF7FFF7FFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DEF3DEF3DEF3DEF3DFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DFF7FFF7FFF7FEF3DFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DEF3DEF3DEF3DEF3DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3D
        FF7FE03DE03DE03DE03D00000000000000000000000000000000000000000000
        E03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        E03DE03DE03D}
      NumGlyphs = 2
      Transparent = True
      OnClick = sbExitClick
    end
    object ToolButton1: TToolButton
      Left = 66
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbView: TRxSpeedButton
      Left = 74
      Top = 2
      Width = 86
      Height = 45
      Hint = 'Click Here To View This Report On Screen'
      Caption = '&View'
      Flat = True
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03D000000000000000000000000000000000000000000000000
        0000E03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DFF7FE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        0000E03DE03DE03DEF3DE03DFF7FE03DFF7FE03DFF7FE03DFF7FE03DFF7FE03D
        EF3DE03DE03DE03DE03D0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000
        E03DE03DE03DE03DFF7FEF3DFF7FEF3DE03DEF3DE03DEF3DE03DEF3DE03DEF3D
        FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
        00000000E03DEF3DEF3DEF3DEF3DE03DFF7FFF7FFF7FFF7FFF7FFF7FEF3DEF3D
        EF3DEF3DFF7F0000FF7FFF7FF75E0000000000000000000000000000F75EFF7F
        FF7F0000E03DEF3DFF7FE03DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03DFF7F
        FF7FEF3DFF7F0000FF7F007CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
        00000000E03DEF3DFF7FEF3DE03DE03DE03DE03DE03DE03DE03DE03DEF3DEF3D
        EF3DEF3DFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F0000E03DEF3DE03DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FEF3DE03DE03D000000000000000000000000000000000000000000000000
        0000E03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DE03DE03DE03DE03DE03D000000000000000000000000000000000000E03D
        E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FE03DFF7FFF7FFF7FFF7FFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00000000000000000000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DEF3DEF3DEF3DEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F0000E003E003FF030000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DFF7FE03DE03DEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00001F7CE0031F7C0000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DFF7FFF7FFF7FEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00000000000000000000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DEF3DEF3DEF3DEF3DE03DEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D000000000000000000000000000000000000E03D
        E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03D
        E03DE03DE03D}
      NumGlyphs = 2
      Transparent = True
      OnClick = sbViewClick
    end
    object sbPrint: TRxSpeedButton
      Tag = 1
      Left = 160
      Top = 2
      Width = 86
      Height = 45
      Hint = 'Click Here To Print This Report'
      Caption = '&Print'
      Flat = True
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F0000000F3C0F3C0F3C0F3C0F3C0F3C0000000000000000000000000000
        0000000000000F3C0F3C0F3C0F3C0F3CFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DEF3DEF3D0F3C0F3C0F3C0F3C000000000000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F00000F3C0F3C0F3CFF7FEF3DEF3DEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        0F3C0F3CEF3D0F3C0F3C000000000000FF7F0000FF7F0000000000000000FF7F
        FF7FFF7F00000F3CFF7FEF3DEF3DEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3D0F3C
        0F3C0F3CEF3D000000000000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DEF3DEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000000000000000
        0000FF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3D
        EF3D0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000000000000000
        0000FF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3D
        EF3D0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7F0F3C
        0F3C0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7F000000000000FF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3D0F3C0F3C
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F0000
        000000000000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7F0F3CEF3D
        EF3DEF3DEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000FF7FFF7F0000
        FF7F00000F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3D0F3C0F3CEF3D
        FF7FEF3D0F3C0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F0000
        00000F3C0F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FFF7FFF7FFF7FFF7FEF3D
        EF3D0F3C0F3C0000FF7F0000FF7F0000FF7F0000000000000000000000000000
        0F3C0F3C0F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        0F3C0F3C0F3C0000FF7F0000FF7F00000000000000000000000000000F3C0F3C
        0F3C0F3C0F3CEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C
        0F3C0F3C0F3C0000FF7F00000000000000000000000000000F3C0F3C0F3C0F3C
        0F3C0F3C0F3CEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C00000000000000000000000000000F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3CEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C}
      NumGlyphs = 2
      Transparent = True
      OnClick = sbViewClick
    end
    object ToolButton3: TToolButton
      Left = 246
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 254
      Top = 2
      Width = 58
      Height = 45
      Hint = 'Click Here For Help'
      Caption = '&Help'
      Flat = True
      Glyph.Data = {
        DE030000424DDE03000000000000420000002800000016000000150000000100
        1000030000009C03000000000000000000000000000000000000007C0000E003
        00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD775A6B5A6B5B6B9C73
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A6B
        11422D258C00CC000F003121554A9C73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7F955207000B000F009008CB094F091300110050255A67FF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734E06006D0090087208B2082C0A
        8D121412B9101500CF147B6FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A6B0700
        4C00900892087300EF09AD0E1113981BBE1ABD101300D135FE7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7F31460A008F0892085308F308AC0EED0E52133B1B3F1E3F15
        D60868015967FF7FFF7FFF7FFF7FFF7FFF7FDE7B0C210F005108720813091209
        6F0ED00E55121E0DFF00BE00B700A901934EFF7FFF7FFF7FFF7FFF7FFF7FBD77
        AC1010002E09AE09D00D5611381119115B08F724D24932562F5608464F3EFF7F
        FF7FFF7FFF7FFF7FFF7FDD7BAE106D018A0E2F0E57111A26FE2D9F21FD106B41
        806A407F407F8366F039FF7FFF7FFF7FFF7FBD77396718630D194B02CB0E0C13
        94239D43DF4A3F363E194F3D485E08770777465A3242FF7FFF7FFF7FFF7F7B6F
        9C73BD7734424902CC0A2D0FB423FE439F4B5F363E19F528913DD149CE492B2D
        185FFF7FFF7FFF7FFF7F9C73FF7FFF7F7B6B6A12CB0A0C0F0F17B627F9333727
        B4118845806A237B207BCC66DE7BFF7FFF7FFF7FFF7F9C73DE7B7B6F7B6F903A
        8A02EC0AAF0E530E30132E134E0A8A49826A237F207F0A77DE7BFF7FFF7FFF7F
        FF7F9C73FF7F9C739C739C739136AA02CF01B3084D0A0E0A9300AE396066037B
        237F007F3473FF7FFF7FFF7FFF7F9C73DE7B7B6F7B6F7B6F7B6BF6522E2A8C01
        AB018D01B0000A124856A072247F227F04777A73FF7FFF7FFF7F9C73DE7B7B6F
        7B6F7B6F7B6F5A6B9C73D552B5529552524AD55A9C736B66E272237F207F0673
        BC7BFF7FFF7F9C73FF7F9C739C739C739C739C73DE7B39671767915A295A4362
        136B176B00620277207B207F5577FF7FFF7F9C73FF7F9C739C739C739C737B6F
        3967F75EB1624066207F427FE8720F46023DA372237B207F7577FF7FFF7F9C73
        FF7FFF7FFF7FFF7FFF7FDE7B5A6B3967BC776A62007F237F227F8066445A237B
        237B007B787BFF7FFF7F9C739C739C739C739C739C737B6F1867FF7FFF7F9C77
        EC72207F207F247F247F207F207B0F73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FDE7F54770B77247F247F0A775477DE7FFF7FFF7F
        FF7F}
      Transparent = True
    end
    object ToolButton5: TToolButton
      Left = 312
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsDivider
    end
    object Panel1: TPanel
      Left = 320
      Top = 2
      Width = 129
      Height = 45
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Label7: TLabel
        Left = 4
        Top = 2
        Width = 87
        Height = 16
        Caption = 'Herd I&dentity'
        FocusControl = HerdCombo
      end
      object HerdCombo: TRxDBLookupCombo
        Left = 2
        Top = 20
        Width = 120
        Height = 23
        DropDownCount = 8
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity'
        TabOrder = 0
        OnChange = HerdComboChange
      end
    end
  end
end
