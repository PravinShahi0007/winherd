�
 TCOWREPFILTER 0'E  TPF0TCowRepFilterCowRepFilterLeftTop� Width�Height�HorzScrollBar.VisibleVertScrollBar.VisibleCaptionBovine Herd RegisterColor	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style OldCreateOrder	PositionpoScreenCenterScaled
OnActivateFormActivateOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelpBovineHerdRegLeft TopSWidth�Height@
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrder  TLabel	LFromDateLeftTopWidthDHeightCaption	Date From  TLabelLToDateLeftTopWidthHeightCaptionTo  TRadioGrouprgSortbyLeftTop� Width� HeightiCaptionSort by	ItemIndex Items.StringsNo &Sort&National Identity NumberDate Of &BirthS&ex TabOrder  TRadioGrouprgSexLeftTop� Width�Height)Caption
Choose SexColumns	ItemIndex Items.Strings&All&Male&Female TabOrder  	TDateEditFromDateLeft`TopWidthqHeight
ButtonHintClick Here For CalenderCheckOnExit		NumGlyphs
PopupColorclWindow
YearDigitsdyFourTabOrder   	TDateEditToDateLeft.TopWidthqHeight
ButtonHintClick Here For CalenderCheckOnExit		NumGlyphs
PopupColorclWindow
YearDigitsdyFourTabOrder  TRadioGrouprgSortOrderLeft� Top� Width� HeightiCaption
Sort Order	ItemIndex Items.Strings
As&cending&Descending TabOrder  	TGroupBoxrgReportTypesLeftTop.Width�HeightiCaptionReportTabOrder TRadioButton
cbRegisterLeftTopWidth}HeightCaptionBovine &RegisterChecked	TabOrder TabStop	OnClickcbRegisterClick  TRadioButtoncbAuditItemsLeftTop@Width� HeightCaptionAudit Items &OnlyTabOrderOnClickcbAuditItemsClick  TRadioButton	cbInvalidLeftTopTWidthyHeightCaptionInvalid &RecordsTabOrderOnClickcbInvalidClick  	TCheckBoxcbShowAuditLeftTop%Width� HeightCaptionIncl&ude ChangesTabOrderOnClickcbShowAuditClick  TRxCheckListBoxclbAuditFieldsLeftTop	Width� Height^HintFEither have 'Include All Remarks' checked
or click on required remark	CheckKindckRadioButtonsCheckedIndex Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ItemHeight
ParentFontStylelbOwnerDrawFixedTabOrderVisibleOnClickCheckclbAuditFieldsClickCheckInternalVersion� StringsInclude All Remarks	National ID 	Date Of Birth 	Colour 	Breed 	Sex 		Sale Date 	
Sale Place 	Purchase Date 	Purchase Place 	Temporary Re-Tag 	
Re-Tagging 	Animal Deletion 	General 	Sale Deletion 	Purchase Deletion 	Un-Delete Animal 	Herd ID 	     TPanelpInvalidLeft&Top� Width�Height� 
BevelOuterbvNoneTabOrderVisible TLabelLabel1Left
TopWidth�Height>AutoSizeCaption�This report is used to identify animals by herd that will NOT appear on the bovine herd register. These animals
have incorrect National Identities entered and you should correct them inorder to have an up-to-date register.Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontWordWrap	  TRadioGroup	rgSortBy2Left
TopBWidth� HeightUCaptionSort By	ItemIndex Items.Strings&Animal Number&National Identity NumberDate Of &Birth TabOrder   TRadioGrouprgSortOrder2Left� TopBWidth� HeightUCaption
Sort Order	ItemIndex Items.Strings
As&cending&Descending TabOrder   TToolBarToolBar1Left Top WidthlHeight5ButtonHeight-ButtonWidthVEdgeBordersebLeftebTopebRightebBottom TabOrder TToolButtonToolButton2Left TopWidthCaptionToolButton2
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbExitLeftTopWidth:Height-HintClick Here To ExitCaptionE&xitFlat		NumGlyphsTransparent	OnClickExitBtnClick  TToolButtonToolButton1LeftBTopWidthCaptionToolButton1
ImageIndex Style
tbsDivider  TRxSpeedButtonsbViewLeftJTopWidthVHeight-Hint"Click Here To View Standard ReportCaption&ViewFlat	Font.CharsetANSI_CHARSET
Font.Color�5 Font.Height�	Font.NameVerdana
Font.StylefsBold 	NumGlyphs
ParentFontOnMouseLeavesbViewMouseLeaveOnClickViewBtnClick  TRxSpeedButtonsbPrintLeft� TopWidthVHeight-HintClick Here To Print This ReportCaption&PrintFlat		NumGlyphsTransparent	OnClickViewBtnClick  TToolButtonToolButton3Left� TopWidthCaptionToolButton3
ImageIndexStyle
tbsDivider  TRxSpeedButtonsbHelpLeft� TopWidth:Height-HintClick Here For HelpCaption&HelpFlat	Transparent	OnClicksbHelpClick  TToolButtonToolButton5Left8TopWidthCaptionToolButton5
ImageIndexStyle
tbsDivider  TPanelPanel1Left@TopWidth� Height-
BevelOuterbvNoneParentColor	TabOrder  TLabelLabel7LeftTopWidthWHeightCaptionHerd I&dentityFocusControlHerdNum  TRxDBLookupComboHerdNumLeftTopWidthxHeightDropDownCount
EmptyValue0LookupFieldIDLookupDisplayHerdIdentityLookupSourceWinData.dsHerdDefaultsTabOrder 	OnCloseUpHerdNumCloseUp    	TQuickRepExAnimalsScrLeftRTopWidthHeightcFrame.ColorclBlackFrame.DrawTop	Frame.DrawBottom	Frame.DrawLeftFrame.DrawRightFrame.WidthDataSet
qExAnimalsFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeA4Page.Values       �@      ��
@       �@      @�
@       �@       �@           PrinterSettings.CopiesPrinterSettings.OutputBinFirstPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage "PrinterSettings.UseStandardprinter PrinterSettings.UseCustomBinCodePrinterSettings.CustomBinCode PrinterSettings.ExtendedDuplex "PrinterSettings.UseCustomPaperCodePrinterSettings.CustomPaperCode PrinterSettings.PrintMetaFilePrintIfEmptyReportTitleExcluded AnimalsReport
SnapToGrid	UnitsMMZoomdPrevFormStylefsNormalPreviewInitialStatewsMaximized TQRBandColumnHeaderBand3Left&Top&Width�HeightxFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightFrame.WidthAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      ��@������v�	@ BandTyperbColumnHeader 
TQRSysData
QRSysData5Left6TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@aUUUU1�	@��������@�������@ 	AlignmenttaRightJustifyAlignToBandAutoSizeColorclWhiteDataqrsDateTimeTextDate : TransparentFontSize
  
TQRSysData
QRSysData6LeftdTopWidthfHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      h�	@k�����J�@      ��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeColorclWhiteDataqrsPageNumberTextPage : TransparentFontSize
  TQRLabelRptTitleLeftTopWidthHeight#Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU5�@UUUUUUU� @       �@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionInvalid Records ReportColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameTimes New Roman
Font.StylefsItalicfsUnderline 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel1LeftTopLWidth7Height!Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@VXUUUUU�@�KUUUU�@�KUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionAnimal NumberColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel12Left@TopLWidthKHeight%Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Valuesk�������@�KUUUUU�@�KUUUU�@      p�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionNational ID NumberColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRShapeQRShape3LeftTop>Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@VXUUUUU�@�����
�@aUUUU��	@ Shape
qrsHorLine
VertAdjust   TQRLabel	SortLabelLeft{TopWidth8HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@       �@������*�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption	SortLabelColorclWhiteTransparentWordWrap	FontSize
  TQRLabel
OrderLabelLeft{Top(Width@HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@��������@UUUUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
OrderLabelColorclWhiteTransparentWordWrap	FontSize
  TQRLabel	QRLabel15LeftTopWidth\HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      ��@       �@������j�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionReport Options:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel37Left8TopaWidth!HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@	    `�@�����R�@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionLactColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel40Left� TopaWidth7HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@      ��@�����R�@�KUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionSexColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel	QRLabel41Left� TopMWidth?Height&Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValueshUUUU�@�����b�@�������@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionDate Of BirthColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabelQRLabel2Left^TopaWidthCHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�������@�����R�@�KUUUUE�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionProblemColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRLabel
ReportHerdLeft{TopWidthBHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@       �@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
ReportHerdColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize
   TQRBandDetailLeft&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomBeforePrintDetailBeforePrintColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.Values������J�@������v�	@ BandTyperbDetail 	TQRDBText	QRDBText5LeftTopWidth9HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUU� @UUUUUUU�@      Ж@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet
qExAnimals	DataFieldAnimalNoTransparentWordWrap	FontSize
  	TQRDBText	QRDBText8Left@TopWidth:HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUU�@UUUUUUU�@UUUUUUu�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet
qExAnimals	DataFieldNatIDnumTransparentWordWrap	FontSize
  	TQRDBText
QRDBText11Left� TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      ��@UUUUUUU�@VUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet
qExAnimals	DataFieldsexTransparentWordWrap	FontSize
  	TQRDBText
QRDBText13Left8TopWidth!HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@	    `�@       �@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet
qExAnimals	DataFieldLactnoTransparentWordWrap	FontSize
  	TQRDBTextLDOBLeft� TopWidth?HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�������@       �@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet
qExAnimals	DataFieldDateOfBirthTransparentWordWrap	FontSize
  TQRLabelLReasonLeft^TopWidth4HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@��������@UUUUUUU�@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionLReasonColorclWhiteTransparentWordWrap	FontSize
   TQRBandPageFooterBand3Left&Top� Width�Height$Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      ��@������v�	@ BandTyperbPageFooter TQRLabel	QRLabel44LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUU� @UUUUUUU� @��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionKingswood Computing Ltd.ColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTransparentWordWrap	FontSize
  TQRLabelInvalidVerLabelLeftITopWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@�������@TOUUUUU� @      ��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchCaptionHerd ManagementColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTransparentWordWrap	FontSize
   TQRBandSummaryBand3Left&Top� Width�Height:Frame.ColorclBlackFrame.DrawTop	Frame.DrawBottom	Frame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.ValuesUUUUUUu�@������v�	@ BandType	rbSummary TQRLabel	QRLabel39LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@       �@      @�@      @�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTotal Animals in this Herd:ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize
  TQRExprQRExpr5Left� TopWidth-HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      0�@      @�@       �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteMasterExAnimalsScrResetAfterPrintTransparentWordWrap	
ExpressionCOUNTFontSize
    	TCheckBoxcbGuidanceNotesLeftTop>Width� Height	AlignmenttaLeftJustifyCaptionPrint Notes for GuidanceChecked	State	cbCheckedTabOrder  TcxCheckBoxcbFavouriteLeft Top:AutoSizeCaptionAdd Report As FavouriteProperties.OnChangecbFavouritePropertiesChangeTabOrderHeightWidth�   TQuery	TempQueryAutoCalcFieldsDatabaseNameKingswdLeftTop>  TTableTempIntHerdAutoCalcFieldsDatabaseNameKingswdLeftTop  TQuery
qExAnimalsDatabaseNameKingswdLeftTopZ  TTableAllSalesDatabaseNameKingswdLeftTopx  TTableAllPurchasesDatabaseNameKingswdLeftTop�   TTabletBovineDatabaseNameKingswdLeftTop�   TQRTextFilterQRTextFilter1Left�Top�   TQRCSVFilterQRCSVFilter1	Separator,Left�Top�   TQRHTMLFilterQRHTMLFilter1Left�Top�   TQRExcelFilterQRExcelFilter1Left�Top  TQRRTFFilterQRRTFFilter1Left�Top(  TQRWMFFilterQRWMFFilter1EnhancedLeft�TopH   