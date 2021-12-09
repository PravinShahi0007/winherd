{
  16/02/2009 [Dev V3.9 6.1] /SP Program Change - Addition of Breed (VO Vosgienne)

  ------------------------------------------------------------------------

  SP 15/11/2002:-

  Set new constants for phone link.

  SP 15/11/2002.

  ------------------------------------------------------------------------

  SP 09/12/2002:-

  tICBFBreeds modified to include changes from the Bandon.

  SP 09/12/2002:-

  22/01/16 [V5.5 R2.3] /MK Change - HUKI have a redirect problem with their URL so I need to change the URL to dairyfacts.co.uk.

  16/06/16 [V5.5 R6.8] /MK Additional Feature - New items added to HealthCodeArray and CullingCodeArray for new ICBF requirements.

  24/07/17 [V5.6 R9.4] /MK Change - sAIMHERDRECIMPORT - Made a new event source for AIMHerdRecImport and added it to Purchases, Sales and Calving events.

  21/08/17 [V5.7 R2.0] /MK Additional Feature - New consts and type created for medicine groups.

  22/09/17 [V5.7 R3.0] /MK Change - Moved TGroupType type here from Groups.
                                  - New default message for cAllocDateLessThanRegimeStartDateMsg.
                                  - Moved GroupTypesArray const here from Groups.

  17/04/18 [V5.7 R8.8] /MK Change - Created new event source for TEvent Factory Sales changes.

  07/08/18 [V5.8 R2.2] /MK Additional Feature - TSelectedDeptMartInfo - New record type to store the selected Dept. mart to add as a Customer/Supplier.

  13/08/18 [V5.8 R2.3] /MK Change - Moved Report Options record type to GenTypesConst for public use.

  27/09/18 [V5.8 R3.0] /MK Additional Feature - DisplayDealerMainScr - New GlobalSetting variable defaulted from Def.Defintion.dUseDealer.

  09/10/18 [V5.8 R3.0] /MK Additional Feature - UpdateMartWeightWithCrushWeight - New GlobalSetting variable defaulted from Def.Defintion.dUseCrush.

  15/10/18 [V5.8 R3.1] /MK Additional Feature - New GlobalSetting and RegistryEntry for new uHerdNewFeatures screen.

  24/01/19 [V5.8 R6.3] /MK Additional Feature - New Event Type to show the Mastitis event created by Block Events.

  31/01/19 [V5.8 R6.5] /MK Additional Feature - New ListType added for Treatment Used for Lamness event.

  31/01/19 [V5.8 R6.5] /MK Additional Feature - New EventType for Lameness.

  03/05/19 [V5.8 R9.2] /MK Bug Fix - F5 was being used instead of V5 for valdating the Calf Survey codes - Michael Denning.

  04/11/20 [V5.9 R7.2] /MK Change - Added a const string array for KeyReports.

  15/12/20 [V5.9 R7.8] /MK Change - Changed cUnitedDairiesURL URL as requested by George (TGM).

  08/07/21 [V6.0 R1.6] /MK Additional Feature - Added GlobalSettings for ICBFRegReminder and AIMHerdRecReminder for Startup Reminders.

  30/08/21 [V6.0 R2.1] /MK Additional Feature - Added Expected Calving Date const to CalcGridColumns screen.

  28/10/21 [V6.0 R2.7] /MK Additional Feature - Added a new ActiveFilterType for ShowAllAnimals so as not to upset WinData.GoToAimAnimalDetails from the main screen.
}

unit GenTypesConst;

interface

uses
   SysUtils, Messages, Graphics, Windows, FileCtrl;

const
   HerdVerNo = 'KHM V6.0 R3.1';
   iHerdVerNo = 6031;

   //*** All Herd Version Changes moved to Changes unit.***//

   KingswoodEmailAddress = 'info@kingswood.ie';
   TGMEmailAddress = 'george@tgmcs.com';

   c_WSOnlineBackupPassKey = 'ZvxM0TZRU/W5bwj4dWJPaHwPyW1zKBB9FmIiOHZtkRgRVsh89a3aIvlwz/ve2am2SIb6zVHdNCh+3w==';

   {c_WSOnlineBackupPassKey = 'ZvxM0TZRU/W5bwj4dWJPaHwPyW1zKBB9FmIiOHZtkRgRVsh89a3aIvlwz/ve2am2SIb6zVHdNCh+3w==' // Backup}
   cGmailAddress = 'www.gmail.com';
   cHotmailAddress = 'www.hotmail.com';

   { MooorePark File Version No.}
   MooreParkVerNo = 'MP1.0';

   { Set Up constants to control the Events - Used to set EventType }
   cFeedingEvent        = 0;
   CBullingEvent        = 1;
   CServiceEvent        = 2;
   CPregDiagEvent       = 3;
   CDryOffEvent         = 4;
   CCalvingEvent        = 5;
   CHealthEvent         = 6;
   CWeightEvent         = 7;
   CPremium10Event      = 8;
   CPremium22Event      = 9;
   CPremiumBullEvent    = 10;
   CSaleDeathEvent      = 11;
   CPurchaseEvent       = 12;
   CMovementEvent       = 13;
   CInterHerdEvent      = 14;
   CStockBullEvent      = 15;
   CNewIDEvent          = 16;

   // Suckler Substitution Event Implemented 14/12/2002. NOT IN USE YET!!!.
   CSucklerSubEvent     = 17;

   { *****MoorePark***** }
   CAbortionEvent       = 18;
   CCastrateEvent       = 19;
   CCondScoreEvent      = 20;
   CDiagProblemEvent    = 21;
   CEmbryoTransEvent    = 22;
   CMastitisEvent       = 23;
   CToBeCulledEvent     = 24;
   CWeaningEvent        = 25;
   CIntExamEvent        = 26;
   CStockBullIn         = 27;
   CStockBullOut        = 28;
   CChangeOfGroup       = 29;
   CHistoricPregDiag    = 30;

   //   06/01/12 [V5.0 R3.2] /MK Additional Feature - New EventType Constant.
   //   09/01/12 [V5.0 R3.2] /MK Change - Removed No Need For New EventType - Treat As Condition Score - GL.
   //   CTescoScoring = 38;
   { ***End MoorePark*** }

   CDisbuddingEvent     = 31;
   CMealFeedingEvent    = 32;
   CDisbuddingNAEvent   = 33;
   CCastrationNAEvent   = 34;
   CFertilityCheck      = 35;
   //   14/09/12 [V5.0 R9.9] /MK Additional Feature - New EventType Constant.
   CMilkTemperament     = 36;
   //   21/12/11 [V5.0 R2.9] /MK Additional Feature - New EventType Constant.
   CJohnesResult        = 37;

   //   28/09/12 [V5.1 R0.0] /MK Additional Feature - New Vaccination Event Type.
   CHerdVaccination     = 38;
   //   02/10/12 [V5.1 R0.1] /MK Additional Feature - New Planned Bull Event Type.
   CPlannedBull         = 39;

   //   09/05/13 [V5.1 R7.1] /MK Additional Feature - New Event Types for new ICBF Dam and Stock Events.
   CICBFDamEvent        = 40;
   CICBFStockBullEvent  = 41;
   CICBFCalfSurveyEvent = 42;

   //   24/01/19 [V5.8 R6.3] /MK Additional Feature - New Event Type to show the Mastitis event created by Block Events.
   CNewMastitisEvent    = 43;
   CLamenessEvent       = 44;

   cStrHeatBulling = 'Heat/Bulling';
   cStrService = 'Service';
   cStrPregDiagnosis = 'Scan/PD';
   cStrDryOff = 'Dry Off';
   cStrCalving = 'Calving';
   cStrVetTreatment = 'Vet. Treatment';
   cStrWeighing = 'Weighing';
   cStrDisbudding = 'Disbudding';
   cStrMealFeeding = 'Meal Feeding';
   cStrDisbuddingNA = 'Disbudding N/A';
   cStrCastrationNA = 'Castration N/A';
   cStrWeaning = 'Weaning';
   cStrCastration = 'Castration';
   cStrPurchase = 'Purchase';
   cStrPlannedBull = 'Planned Bull';

   cReviewAnimalWelfareEvents = 'Review Animal Welfare Events';

   { Set Up constants to control the Farm Diary Events - Used to set DiaryEventType }
   cSoilTest         = 1;
   cFertApplic       = 2;
   cSilageHarvest    = 3;
   cSlurryApplic     = 4;
   cReSeeding        = 5;
   cTopping          = 6;
   cSpraying         = 7;
   cPaddockRotation  = 8;

   { Set Up constants to control the General Listings }
   LServiceType  = 1;
   LServedBy     = 2;
   LPDType       = 4;
   LPDBy         = 5;
   LBirthType    = 6;
   LCalfType     = 7;
   LHerdType     = 8;
   LAnimalColour = 9;
   LObservedBy   = 10;
   LHeatType     = 11;
   LApplicMethod = 12;
   LHealthCode   = 13;
   LCulledCode   = 14;
   LMortality    = 15;
   LFeedCategory = 16;

   { ///// }
   LEmbryoType   = 17;
   LIntExamRes   = 18; // Exam Result
   LIntExamRea   = 19; // Exam Reason
   LIntExamMet   = 20; // Exam Method

   LICBFHealthCode = 21;
   LNIDisposalManner = 22; // NI Deaths Registration. Used to determine disposl manner.

   LHealthReportDesc = 23;

   LSpecies = 24;
   LMedicineGroup = 25;

   LFertilityCheck_Status = 26;
   LFertilityCheck_Action = 27;

   LUKMilkRecorder = 28;

   //   20/12/11 [V5.0 R2.9] /MK Additional Feature - New List Type For Tesco Johnes Event.
   LJohnes_Result = 29;

   LVaccination_DiseaseCode = 30;

   LFields_SprayOperator = 31;

   //   20/02/14 [V5.2 R8.4] /MK Additional Feature - New ListType added for Sexed Semen.
   LSexedSemen = 32;
   // MoorePark

   LSprayingReasonForUse = 33;
   LFields_SlurrySpreadMethod = 34;
   LFields_SeedDressing = 35;

   //   31/01/19 [V5.8 R6.5] /MK Additional Feature - New ListType added for Treatment Used for Lamness event.
   LTreatmentUsed = 36;

   LMediDiposalReasons = 37;

   LHerdTestResult = 38;

   { Phone Link / Create Events Constants }
   { TEventFileSource = (esNoLink, esNokiaLink, esSiemensLink, esParlourLink ); }

   plNOLINK  = 0;
   plNOKIA   = 1;
   plSIEMENS = 2;
   plPARLOURLINK = 3;

   { Phone Link Constants }

   { Event Source Constants }
   sINTERNAL    = 0;
   sPHONELINK   = 1;
   sPARLOURLINK = 2;
   sICBFSETUP   = 3;
   sEXTERNAL    = 4;
   sPDA         = 5;
   sMART        = 6;
   sKINGSWOOD   = 7;
   sELECWEIGHING = 8;
   sSMARTPHONE = 9;
   sCRUSHXMLIMPORT = 10;
   sAIM = 11;
   sINTERNAL_REGENERATION = 12;
   sICBF_GENERATION = 13;
   sNEW_CALVINGEVENTSCR = 14;
   sINTERNAL_BLOCKEVENT = 15;
   sEVENTLACTNOUTILITY = 16;
   sTAKENFROMCALVINGXMLFIX = 17;
   sAIMHERDRECIMPORT = 18;
   sNEWGRPEVENTHEALTHDRYSAVE = 19;
   sNEWFACTORYSALE = 20;
   sAIMTempTransfer = 21;
   sICBF_API = 22;
   sRepeatVaccination = 23;
   sKImport = 24;
   sCTSRecBlockSale = 53;

   { Event Source Constants }

   { Group Source Constants }

   sgHerd_Prog = 5;
   sgEID = 11;

   { Group Source Constants }

   cMaxCalves    = 4;

   cLUSCows    = 1.0;
   cLUSSuckler = 1.0;
   cLUSUnder24 = 0.6;
   cLUSOver24  = 1.0;
   cLUS10      = 0.6;
   cLUSEwes    = 0.15;
   cBullOver24 = 1.0; // SP  14/02/01

   { Paradox table level }
   MaxParadoxTableLevel = 7;

   // Grps GroupTypes constants
   cPurchaseGroup = 'Purchase';
   cSalesGroup    = 'Sales';
   cGroupGroup    = 'Group';
   cPenGroup      = 'Pen';
   cFeedGroup     = 'Feed';
   cBatchGroup    = 'Batch';

   // DEfault Units for Farm Diary
   cMetric       = 'Metric';
   cImperial     = 'Imperial';
   cConvertToAcres   = 2.471;
   cConvertFromAcres = 0.4047;
   cConvertToCWT     = 0.01968;
   cConvertFromCWT   = 50.80;
   cConvertToGallons = 0.2200;
   cConvertFromGallons = 4.546;

   // Euro Conversion Rate
   cEuro  = 0.787564;

   { Extensification Figures }
   MaxLUPH = '1.8';   // Maximum Livestock Units Per Hectare
   MinLUPH = '1.4';   // Minimum Livestock Units Per Hectare

   { Stocking Density }
   { StockDenLU = 1.9;  2002 }
   StockDenLU = 1.8;  { 2003 }

   { Premium Animal Claim Limit }
   MaxPremLimit = 180;

   { Max Number of Applications Per Herd }
   MaxNoApplicsPerHerd = 12;

   { NI Premium Applic Limitations}
   MaxBullApplicNI = 6;
   Max1stApplicNI  = 6;
   Max2ndApplicNI  = 18;

   cThisApplicationYear = 2004;

   { Suckler Premium Application Dates }
   SPOpeningDate = '02/01/2004';
   SPClosingDate = '30/06/2004';

   { SuckMilkQuotaLimit = '35470';  2002 Gallons }
   { SuckMilkQuotaLimit = '39594'; { 2003 Gallons}
   SuckMilkQuotaLimit = '200000'; { 43994 Gallons 2003 Changed to Litres }

   { Suckler Replacement const's }
   cIncCows = 0;
   cDecCows = 1;
   cIncHefs = 2;
   cDecHefs = 3;

   DefaultMinimumDaysOnFarm = 45;
   MinimumBrucellosisTestDays = 30;
   MaxDaysForDiseaseTestCheck = 28;

   { Premia Defaults }
   PremDefYear          = 2003;
   PremDefMonth10       = 150;
   PremDefMonth22       = 150;
   PremDefBull          = 210;
   PremDefSuckCowHeif   = 224.15;
   PremDefSuckHeifTopUp = 76;
   PremDefSlgth         = 80;
   PremDefSlgthTopUp    = 22.85;

   //Default Calf Weight 50KG
   cDefaultCalfWeight = 50;

   // Filenames for Darm Diary
   cFarms    = 'P1';
   cPlots    = 'P2';
   cFields   = 'P3';
   cAreaAids = 'P4';
   cPaddocks = 'P5';

   cPassword = 'CONFIG';
   cCRLF = #13#10;
   cCRLFx2 = #13#10+#13#10;

   WinAccsPath = 'C:\KingsAcc\Winaccs.exe'; // SP 16/09/02
   WinAccsFolder = 'C:\Kingsacc\';

   WestfaliaExportFileName = 'WExportedFile.ads';
   ParlourFilePath = 'parlour\Parlourevents.txt';
   cPhoneEventsIniFile = 'phoneevents.ini';
   cIniDirectory = 'Ini';

   {$IFDEF VER_PLATFORM_WIN32_NT}
   HerdUpdate = 'C:\Kingswood Herd Management\HerdUpdate.exe';
   {$ELSE}
   HerdUpdate = 'HerdUpdate.exe';
   {$ENDIF}

   MASTER_PASSWORD = 'copper';

   NullTerminator = #0;

   // Hints for the Main Grid
   cAnimalHint  = 'Click a header to sort the grid:' + #13 +
                  'eg. to sort by Animal Number, click on the "Number" Heading' + #13 +
                  '------------------------------------------------------------------------------------------------' + #13 +
                  'DOUBLE Click To View / Amend Details.';
   cPaddockHint = 'Click a header to sort the grid:' + #13 +
                  'eg. to sort by Paddock Name, click on the "Name" Heading' + #13 +
                  '------------------------------------------------------------------------------------------------' + #13 +
                  'DOUBLE Click To View / Amend Details.';


   iBreedCodes  : array [0..130] of string = ('AA', 'AAX', 'AN', 'ANX', 'AU', 'AUX', 'AY', 'AYX', 'BB', 'BBX',
                                              'BI', 'BIX', 'BA', 'BAX', 'BS', 'BSX', 'CH', 'CHX', 'CI', 'CIX',
                                              'RD', 'RDX', 'DX', 'DXX', 'GA', 'GAX', 'GU', 'GUX', 'HE', 'HEX',
                                              'FR', 'FRX', 'HI', 'HIX', 'IM', 'IMX', 'JE', 'JEX', 'KE', 'KEX',
                                              'LM', 'LMX', 'MA', 'MAX', 'MO', 'MOX', 'GS', 'GSX', 'MY', 'MYX',
                                              'NO', 'NOX', 'NR', 'NRX', 'PT', 'PTX', 'PI', 'PIX', 'RM', 'RMX',
                                              'RB', 'RBX', 'SA', 'SAX', 'SH', 'SHX', 'SI', 'SIX', 'SD', 'SDX',
                                              'SR', 'SRX', 'WB', 'WBX', 'WP', 'WPX', 'BW', 'BWX', 'GL', 'GLX',
                                              'LH', 'LHX', 'LR', 'LRX', 'LU', 'LUX', 'SL', 'SLX', 'RP', 'RPX',
                                              'ST', 'STX', 'BL', 'BLX', 'CL', 'CLX', 'DE', 'DEX', 'GC', 'GCX',
                                              'SU', 'SUX', 'VA', 'VAX', 'TY', 'TYX', 'CB', 'CBX', 'GV', 'GVX',
                                              'PZ', 'PZX', 'BF', 'BFX', 'VO', 'VOX', 'WA', 'WAX',
                                              //   11/02/13 [V5.1 R4.1] /MK Change - Changed Blue Galloway Breed Code to BY
                                              'BY', 'BYX',
                                              'BZ', 'BZX', 'SP', 'SPX',
                                              //   11/02/13 [V5.1 R4.1] /MK Additional Feature - Added new breeds.
                                              'WG', 'WGX', 'BG', 'BGX',
                                              'UN', 'DN', 'DNX' );

   iBreedNames  : array [0..130] of string = ('Angus', 'Angus Cross', 'Angler', 'Angler Cross', 'Aubrac', 'Aubrac Cross',
                                              'Ayrshire', 'Ayrshire Cross', 'Belgian Blue', 'Belgian Blue Cross', 'Bison',
                                              'Bison Cross', 'Blonde d''Aquitaine', 'Blonde d''Aquitaine Cross', 'Brown Swiss',
                                              'Brown Swiss Cross', 'Charolais', 'Charolais Cross', 'Chianina', 'Chianina Cross',
                                              'Danish Red', 'Danish Red Cross', 'Dexter', 'Dexter Cross', 'Galloway', 'Galloway Cross',
                                              'Guernsey', 'Guernsey Cross', 'Hereford', 'Hereford Cross','Holstein-Friesian',
                                              'Holstein-Friesian Cross', 'Highland', 'Highland Cross', 'Irish Maol', 'Irish Maol Cross',
                                              'Jersey', 'Jersey Cross', 'Kerry', 'Kerry Cross', 'Limousin', 'Limousin Cross', 'Maine Anjou',
                                              'Maine Anjou Cross', 'Montbeliarde', 'Montbeliarde Cross', 'Murray Grey', 'Murray Grey Cross',
                                              'MRI/MRY', 'MRI/MRY Cross', 'Normande', 'Normande Cross', 'Norwegian Red', 'Norwegian Red Cross',
                                              'Parthenaise', 'Parthenaise Cross', 'Piedmontaise', 'Piedmontaise Cross', 'Rogmanola', 'Rogmanola Cross',
                                              'Rotbunde', 'Rotbunde Cross', 'Salers', 'Salers Cross', 'Shorthorn', 'Shorthorn Cross', 'Simmental',
                                              'Simmental Cross', 'South Devon', 'South Devon Cross', 'Swedish Red', 'Swedish Red Cross',
                                              'Welsh Black','Welsh Black Cross','White Park','White Park Cross',
                                              'British White','British White Cross','Gloucester','Gloucester Cross',
                                              'Longhorn','Longhorn Cross','Lincoln Red','Lincoln Red Cross',
                                              'Luing','Luing Cross','Shetland','Shetland Cross','Red Poll','Red Poll Cross',
                                              'Stabiliser','Stabiliser Cross','Blue Albion','Blue Albion Cross',
                                              'Chillingham','Chillingham Cross','Devon','Devon Cross','Gasconne','Gasconne Cross',
                                              'Sussex','Sussex Cross','Vaynol','Vaynol Cross','Tyrone Black','Tyrone Black Cross',
                                              'Canadian Black','Canadian Black Cross','Gelbvieh','Gelbvieh Cross',
                                              'Pinzgauer','Pinzgauer Cross','Water Buffalo','Water Buffalo Cross', 'Vosgienne', 'Vosgienne Cross',
                                              'Wagyu','Wagyu Cross','Belted Galloway','Belted Galloway Cross','Bazadais','Bazadais Cross',
                                              'Speckle Park','Speckle Park Cross',
                                              //   11/02/13 [V5.1 R4.1] /MK Additional Feature - Added new breeds
                                              'White Galloway','White Galloway Cross','Blue Gray','Blue Gray Cross',
                                              'Unknown', 'Droimeann', 'Droimeann Cross');

   iNIValidColourCodes : array [0..11] of string = ('B', 'BL', 'BLW', 'BR', 'BW', 'DW', 'R', 'RN', 'RW', 'W', 'XX', 'D');


   HealthCodeArray : Array [0..101] of String =
   ('DS', 'GS', 'MF', 'CA', 'CO', 'LM', 'PI', 'AB', 'SB', 'SC', // CA = castration
    'PN', 'LW', 'JL', 'RW', 'DC', 'RP', 'EN', 'ME', 'PY', 'AN',
    'FC', 'LC', 'MF', 'DN', 'GT', 'KE', 'FL', 'LD', 'RD', 'BL',
    'AC', 'CL', 'MA', 'EC', 'CT', 'SM', 'LA', 'MR', 'FF', 'SH',
    'UL', 'DR', 'WL', 'DB', 'ML', 'WN', 'D1', 'D2', 'D3', 'D4',
    'D5', 'Q1', 'Q2', 'Q3', 'Q4', 'Q5', 'ND', 'NC',// DB = Disbudding, ML = Meal Feeding, WN Weaning, D1-5 Weaning-Docility, Q1-5 Weaning-Quality / 'ND' Disbudding not applicable, 'NC' castration not applicable
    'T1', 'T2', 'T3', 'T4', 'T5', //  08/09/11 [V5.0 R0.6] /MK Additional Feature - Added Milk Temperment Event Score 1-5.
    'C1', 'C2', 'C3', 'C4', 'C5',
    'M1', 'M2', 'M3', 'M4', 'M5', //   13/05/13 [V5.1 R7.1] /MK Additional Feature - Added ICBFDam Milk Ability and Docility scores.
    'F1', 'F2', 'F3', 'F4', 'F5',
    'B1', 'B2', 'B3', 'B4', 'B5', //   13/05/13 [V5.1 R7.1] /MK Additional Feature - Added ICBFStock Bull Functionality and Docility scores.

    'V1', 'V2', 'V3', 'V4', 'V5', //   15/06/16 [V5.5 R6.8] /MK Additional Feature - New traits for Calf Survey event.
    'SS', 'SA', 'SL', 'SX',
    'S0', 'S1', 'S2',
    'P0', 'P1', 'P2',

    'ICBFCE', 'ICBFSB', //   17/05/13 [V5.1 R7.1] /MK Additional Feature - Added ICBFCE & ICBFSB for ICBF Delete event purposes.
    'CD', 'NE'); //   20/02/14 [V5.2 R8.4] /MK Additional Feature - Added new ICBF Health Codes CD & NE.


   CullingCodeArray : Array [0..21] of String =
   ('AB','AG','BE','VD','CO','EB','HP','SC','IF','IJ',
    'IP','JD','LA','LM','MA','SR','FL','TY','PC','ZZ', //   20/02/14 [V5.2 R8.4] /MK Additional Feature - Added extra new ICBF Culling Codes FL, TY & PC.
    'PP', 'IB'); //   15/06/16 [V5.5 R6.8] /MK Additional Feature - Added extra new ICBF Culling Codes PP & IB.

   iMarts : array [0..1] of string = ('Carnaross Mart','Clare Marts');

   //   04/11/20 [V5.9 R7.2] /MK Change - Added a const string array for KeyReports.
   KeyReportsArray : array [0..8] of string = ('Stock On Hand', 'Purchase Sales Analysis', 'Annual Livestock Valuation',
                                               'Nutrient Production (N & P)', 'Veterinary Register', 'Breeding Chart',
                                               'Herd Fertility (Seasonal Calving)', 'Best Cows In Herd', 'Monthly Milk Recordings');

   aAutoArchiveSerialNos = 5636;

   cSaveDefaultsMessage = 'Save defaults?'+#13#10+#13#10+
                          'Click Yes to SAVE NEW defaults.'+#13#10+#13#10+
                          'Click No to STOP USING defaults.'+#13#10+#13#10+
                          'Click Cancel to return to screen WITHOUT ACTION';

   OpenCloseTableCount = 39;

   AliasName = 'Kingswd';
   DBPartitionAliasName = 'KingswdPartition';

   DBPartitionFromDir = 'C:\Kingswd\Data';
   DBPartitionToDir = 'C:\Kingswd\DataNew';

   Reg_DefaultPath = 'Software\Kingswood\Herd\';
   Reg_DefaultHerdID = '.DEFAULT\Software\Kingswood\HERD\DefaultHerdID'; // If changed, need to reflect changes in Paddocks pGenTypesConst.pas
   Reg_FieldsReps = 'Software\Kingswood\Paddocks'; // If changed, need to reflect changes in Paddocks pGenTypesConst.pas
   Reg_ExitProgTimer = '.DEFAULT\Software\Kingswood\HERD\ExitProgTime';
   Reg_DLLActiveXReg = '.DEFAULT\Software\Kingswood\HERD\DLLActiveXReg'; // If changed, need to reflect changes in Paddocks pGenTypesConst.pas
   Reg_ICBFMatchField = '.DEFAULT\Software\Kingswood\HERD\ICBFMatchField';

   Reg_BeefGrpPurchIdent = 'BeefGrpPurch';
   Reg_UseCrushFileIdent = 'UseCrushFile';
   Reg_BeefGrpSalesIdent = 'BeefGrpSales';

   xPixels = 800;  // All forms designed on this Screen size
   yPixels = 600;

   AllHerds = 0; // Zero represents the value of Herd drop downs, when All Herds is selected

   { PhoneLink Stored Directory }
   cPhoneLinkDirectory = 'PhoneLink';
   { PhoneLink Ini File }
   cPhoneLinkIniFile = 'phonelink.ini';
   { Phone ActiveX File }
   cPhoneLinkActiveXPath = 'C:\Windows\MobileControl_rt.ocx';
   { Phone Licence File}
   cPhoneLinkLicencePath = 'C:\Windows\MobileControl_rt.lic';

   IniNokia = 'Nokia';
   IniNokiaConnectionType = 'Connection Type';
   IniComPort = 'COM Port';
   IniSiemens = 'Siemens';

   { Nokia Data Connection Types }
   Nokia_DAU9P = 0;
   Nokia_DLR3  = 1;
   Nokia_InfraRed = 2;

   sNokia_DAU9P = 'Connection Type: DAU-9P';
   sNokia_DLR3  = 'Connection Type: DLR-3';
   sNokia_InfraRed = 'Connection Type: InfraRed';

   { Default Gestation Period (days) }
   cGestationPeriod = 283;

   sSettingsFile = 'settings.def';
   SettingsFileVersion = 10;

   PDAImportDir = 'C:\Kingswood Herd Management\PDA Import Files\';
   APHISMovementsDir = 'C:\Kingswood Herd Management\APHIS Movements\';

   AlphaNumSet = ['A'..'Z', 'a'..'z', '0'..'9'];
   iCharSearchSet = ['A'..'Z', 'a'..'z', '0'..'9', '''', '(', ')', '.',',', '>','<','{','}', ' ' ];

   { NATID MASK INDEX }
   MT_NEWEIDTAG  = 0;
   MT_NEWPLASTIC = 1;
   MT_OLDPLASTIC = 2;
   MT_BRASSTAG   = 3;
   MT_NITAG      = 4;
   MT_UKTAG      = 5;
   MT_FREEFORMAT = 6;
   { NATID MASK INDEX }

   { Internal Messages }
   WM_plActivate = WM_USER + 1;
   WM_plDeActivate = WM_USER + 2;
   WM_MainDisplayBreedCode = WM_USER + 3;
   WM_MainHideBreedCode = WM_USER + 4;
   WM_BladeRegistered = WM_USER + 5;
   WM_BladeNotRegistered = WM_USER + 6;
   WM_Locate = wm_user + 7;
   WM_RaiseAnimalNotFound = wm_user + 8;
   WM_UpdateMartImportScreen = WM_USER + 9;
   WM_ShowReportsScreen = WM_USER + 10;
   WM_ShowSucklerCowEvents = WM_USER + 11;
   WM_RefreshGridViewExternalData = WM_USER + 12;
   WM_ReadBarcodeOuput = WM_USER + 13;
   WM_INTERNAL_AIMCLIENT_CLOSED = WM_USER + 14;
   WM_CXDATE_ONENTER_MESSAGE = WM_USER + 15;

      { Used in conjuction with Windata.Images }
   cBtnImgExit     = 0;
   cBtnImgPrint    = 1;
   cBtnImgPreview  = 2;
   cBtnImgLoad     = 3;
   cBtnImgRecord   = 4;
   cBtnImgPrint2   = 5;
   cBtnImgSave     = 6;
   cBtnImgCancel   = 7;
   cBtnImgUpdate   = 8;
   cBtnImgFloppy   = 9;
   cBtnImgViewAnimal = 10;
   cBtnImgFloppy2  = 11;
   cBtnImgEdit     = 12;
   cBtnImgAdd      = 13;
   cBtnImgHelp     = 14;
   cBtnImgCDROM    = 15;
   cBtnImgFormat   = 16;
   cBtnImgDefault  = 17;
   cBtnImgOptions  = 18;
   cBtnImgExecute  = 19;
   cBtnImgMail     = 20;
   cBtnImgExternalDevice = 21;
   cBtnImgLargeHelp = 22;
   cBtnImgDelete = 23;

   cErrorContact = 'If problem persists contact Kingswood';
   cFormCreateError = 'Unable to create form, close program and reboot';
   cReportErrorMsgStr = 'Unable to create report, close program and reboot.'+#13+cErrorContact;
   cAllHerdsSelected = '''All Herds'' is currently selected, please select your herd';
   cErrorContact_2 = 'An error has occurred contact Kingswood';
   cMissingModulePayMsg = 'Please contact Kingswood Computing if you wish to acquire this facility.';

   cInvalid_NatIdNo = 'An invalid "Nat. Id. No." value has been entered.';
   cInvalid_NatIdNo2 = 'The National Identity Number you''ve entered is not valid.';
   cInvalid_BovineRange = 'The National Identity Number you''ve entered contains an invalid Bovine Range.'+#13#10+
                          'The correct range for bovine is between 21 and 23 inclusive.';

   cInvalid_Irish_HerdNumber = 'An invalid BTE Herd Number has been entered.'+#13#10+
                               'Please enter a valid BTE Herd Number.';
   cInvalid_Irish_BovineRange_HerdNo = 'The Herd Identifier entered contains an invalid Bovine Range.';
   cDuplicate_HerdNumber = 'A duplilcate Herd Number has been entered.';
   cErrorCalvingCreatingCalving = 'An error occurred while creating the calving event - contact Kingswood.';
   cErrorCalvingCreatingCalfSubEvents = 'An error occurred while creating sub events for calves.';
   cSpacesInHerdID = 'Spaces are not allowed in a BTE Herd No' + cCRLF +
                     'Please remove the space from the BTE Herd No';

   cDairyHerd = 'DAIRY';
   cSucklerHerd = 'SUCKLER';
   cBeefHerd = 'BEEF';

   cIDField = 'ID';

   cMAXSDTarget = 1.7999;
   cMINSDTarget = 1.3999;

   cSQL_SELECTALL = 'SELECT * FROM ';

   cGridColLayoutFile = 'gridcols.ini';

   cEventLactFilterStr = 'AnimalID = %d and AnimalLactNo = %d and EventType = %d ';
   cEventFilterStr = 'AnimalID = %d and EventType = %d ';

   { Northern Ireland Births/Deaths/Still Births Registration Consts }
   cRegFileDir = 'APHIS Registration';
   sDirCreateError = 'Cannot create directory %s';

   cRegTypeBirths = 0;
   cRegTypeDeaths = 1;
   cRegTypeStillBorn = 2;

   cRegType_Births = 'B';
   cRegType_Deaths = 'D';
   cRegType_StillBirths = 'S';

   { Tags used XML Generated files }
   cxml_FileNameTag = 'Filename';
   cxml_RegTypeTag = 'RegType';
   cxml_FileIdTag = 'FileId';
   cxml_NoOfAnimalsTag = 'NoOfAnimals';
   cxml_HerdNoTag = 'HerdNo';
   cxml_AnimalNoTag = 'AnimalNo';
   cxml_DOBTag = 'DOB';
   cxml_DamTag = 'DamNo';
   cxml_SireTag = 'SireNatIdNo';

   { Birth Rec XML Generated file }
   cxml_NewAnimalRegInfoTag = 'NewAnimalRegInfo';
   cxml_ColourTag = 'Colour';
   cxml_SexTag = 'Sex';
   cxml_BreedTag = 'Breed';

   { Death Rec XML Generated file }
   cxml_DeadAnimalInfoTag = 'DeadAnimalInfo';
   cxml_DateOfDeathTag = 'DateOfDeath';
   cxml_MannerDisposalTag = 'MannerDisposal';
   cxml_PlaceDisposalTag = 'PlaceDisposal';

   { StillBirth Rec XML Generated file }
   cxml_StillBornInfoTag = 'StillBornInfo';
   cxml_CommentTag = 'Comment';

   { **** END Northern Ireland Births/Deaths/Still Births Registration Consts }

   cDateFormat_IRE = 'dd/mm/yyyy';

   cSex_Female = 'Female';
   cSex_Bull = 'Bull';
   cSex_Steer = 'Steer';
   cSex_Male = 'Male';

   { File Parsing delimiter }
   cSpaceDelimiter = ' ';
   cCommaDelimiter = ',';

   { Event Codes }
   cServiceCode  = 'S';
   cBullingCode  = 'B';
   cHealthCode   = 'H';
   cDryOffCode   = 'D';
   cPregDiagCode = 'P';
   cCalvingCode  = 'C'; // 01/12/2004
   cSaleDeathsCode = 'M'; // 12/05/2005
   cWeighingCode = 'W'; // 12/05/2005

   { Palour Link ImportFile Path }
   cPLFilePath = 'C:\PalourF.dat';

   { Nokia Message Output File }
   cPLNokiaMsgFile = 'C:\Kingswood Herd Management\plmsgs';

   { CD Backup Program }
   cCDBackupExeName = 'CDBackup.exe';

   { Global Preference's Consts }
   cGSRegPathHerd = 'SOFTWARE\Kingswood\Herd\Preferences\';

   cGSAISireUpdateRegPath = 'SOFTWARE\Kingswood\Herd\AISireUpdate\';

   cGSPromptCalfReg = 'PromptCalfReg';
   cGSSaveAnotherEvent = 'SaveAnotherEvent';
   cGSPhoneLinkOnStartup = 'PhoneLinkOnStartup';
   cGSNewVersionReminder = 'NewVersionReminder';
   cGSBackupReminder = 'BackupReminder';
   cGSBackupTestFile = 'BackupTestFile';
   cGSBackupSpanDisks = 'BackupSpanDisks';
   cGSBackupArchiveFile = 'BackupArchiveFile';
   cGSHerdProtection = 'HerdProtection';
   cGSNatIDToAnimalNo = 'NatIDToAnimalNo';
   cGSBladeRegistered = 'BladeRegistered';
   cGSRenumberAnimalNo = 'RenumberAnimalNo';
   cGSMandatoryBreedingEvents = 'MandatoryBreedingEvents';
   cGSReNumFormat = 'ReNumFormat';
   cGSMandatoryDryOffEvent = 'MandatoryDryOffEvent';
   cGSBackupStoreRegFiles = 'BackupStoreRegFiles';
   cGSBackupStorePedigreeImages = 'BackupStorePedigreeImages';
   cGSUseBarcodeScanner = 'UseBarcodeScanner';
   cGSDefaultMaleSex = 'DefaultMaleSex';
   cGSDefaultHealthComment = 'DefaultHealthComment';
   cGSNationalIDAnimalNo = 'NatIDAnimalNo';
   cGSAllowDuplicateTagNos = 'AllowDuplicateTags';
   cGSDefaultExitAfterSale = 'DefaultExitAfterSale';
   cGSDefaultMaleBreedingStatus = 'DefaultMaleBreedingStatus';
   cGSWeighingEventChangeAnimalFocusAfterSave = 'WeighingEventChangeAnimalFocusAfterSave';
   cGSUseIEPrefixForNatIDSearch = 'UseIEPrefixForNatIDSearch';
   cGSDisplayGettingStarted = 'DisplayGettingStarted';
   cGSAnimalGridSireField = 'AnimalGridSireField';

   cGSBeefBullAttrNoMonthsFrom = 'BeefBullAttrNoMonthsFrom';
   cGSBeefBullAttrNoMonthsTo = 'BeefBullAttrNoMonthsTo';
   cGSBeefBullAttrNoMonthsOver = 'BeefBullAttrNoMonthsOver';
   cGSBeefBullAttrColourBetween = 'BeefBullAttrColour1';
   cGSBeefBullAttrBoldBetween = 'BeefBullAttrBold1';

   cGSBeefBullAttrColourOver = 'BeefBullAttrColour2';
   cGSBeefBullAttrBoldOver = 'BeefBullAttrBold2';

   cGSBeefFemaleAttrNoMonthsFrom = 'BeefFemaleAttrNoMonthsFrom';
   cGSBeefFemaleAttrNoMonthsTo = 'BeefFemaleAttrNoMonthsTo';
   cGSBeefFemaleAttrNoMonthsOver = 'BeefFemaleAttrNoMonthsOver';
   cGSBeefFemaleAttrColourBetween = 'BeefFemaleAttrColour1';
   cGSBeefFemaleAttrBoldBetween = 'BeefFemaleAttrBold1';

   cGSBeefFemaleAttrColourOver = 'BeefFemaleAttrColour2';
   cGSBeefFemaleAttrBoldOver = 'BeefFemaleAttrBold2';

   cGSSteerAttrNoMonthsFrom = 'SteerAttrNoMonthsFrom';
   cGSSteerAttrNoMonthsTo = 'SteerAttrNoMonthsTo';
   cGSSteerAttrNoMonthsOver = 'SteerAttrNoMonthsOver';

   cGSSteerAttrColourBetween = 'SteerAttrColour1';
   cGSSteerAttrBoldBetween = 'SteerAttrBold1';

   cGSSteerAttrColourOver = 'SteerAttrColour2';
   cGSSteerAttrBoldOver = 'SteerAttrBold2';

   cGSDisplayTBTestDateWarningBeforeSale = 'DisplayTBTestDateWarningBeforeSale';
   cGSDisplayBruceTestDateWarningBeforeSale = 'DisplayBruceTestDateWarningBeforeSale';
   cGSDisplayMinimumDaysOnFarmWarningBeforeSale = 'DisplayMinimumDaysOnFarmWarningBeforeSale';
   cGSMinimumDaysToBeKeptOnFarmBeforeSale = 'MinimumDaysToBeKeptOnFarmBeforeSale';
   cGSDisplayAnimalComments = 'DisplayAnimalComments';
   cGSAnimalWeighingGraphXAxisValue = 'AnimalWeighingGraphXAxisValue';
   cGSAnimalWeighingGraphXAxisVariable = 'AnimalWeighingGraphXAxisVariable';

   cGSDisplayMovementFeedColsInGridView = 'DisplayMovementFeedColsInGridView';
   cGSDownloadMailAttachments = 'DownloadGMailAttachments';

   cGSAnimalGridHideSearchBar = 'AnimalGridHideSearchBar';

   cGSReviewMartFiles = 'ReviewMartFiles';

   cGSShowBlockTempMovements = 'ShowBlockTempMovements';

   cGSMartSaveCommentAsSourceName = 'MartSaveCommentAsSourceName';

   cGSShowAIMSyncFeature = 'ShowAIMSyncFeature';
   cGSShowVetLinkFeature = 'ShowVetLinkFeature';

   cReg_ReadError = 'Failed to get %s Registry Data';

   cDefaultHealthCommentDrugUsed = 0;
   cDefaultHealthCommentFarmCode = 1;

   cBarCodeScannerOnCaption = 'Scan: On';
   cBarCodeScannerOffCaption = 'Scan: Off';

   cSpecies_Bovine = 'Bovine';
   cSpecies_Horses = 'Horses';
   cSpecies_Goats  = 'Goats';

   cMachineryDir = 'C:\Machinery';
   cMachineryExePath = 'C:\Machinery\Machinery.exe';

   NewFeatureHighlightControlColour = clRed;

   HUKILinmackTestServerIPAdd = '195.153.22.94';
   HUKILiveServerIPAdd = 'holstein-uk.org';
   HUKILiveDairyFactsIPAdd = 'dairyfacts.co.uk';

   CalfReg_Status_Emailed = 1;
   CalfReg_Status_Posted = 2;
   CalfReg_Status_Removed = 3;
   CalfReg_Status_AimRegistered = 4;
   CalfReg_Status_AimRegistration_Deleted = 5;

   CalfReg_Status_AIM_Accepted = 3;
   CalfReg_Status_AIM_Queried = 4;

   cGoToFertTreatmentChart = 1000;
   cGoToTagReplacementsMainScr = 1001;
   cGoToTagReplacementsRptScr = 1002;

   CTSWSDLL = 'ctsws.dll';

   cCalvingTableUpdateFailure = 'Cannot Update Calve(s) information, contact Kingswood';
   cNoFilterApplied = 'There is currently no Active Filter ( Animal Grid Filter ) to apply!';

   cFileOverwrite = 'File already exists, do you want to overwrite?';
   cFileCreated = 'File succesfully created - "%s"';
   cFileCreateError = 'Error creating file.';

   cCalvingAnimalWarning = 'The animal you are calving "%s" is under %d months of age as of "%s".';
   cContinueWithCalving = 'Do you want to continue with calving?';

   cCalvingAnimalUnder9Mths = cCalvingAnimalWarning;
   cCalvingAnimalUnder12Mths = cCalvingAnimalWarning;
   cCalvingAnimalUnder18Mths = cCalvingAnimalWarning+cCRLFx2+cContinueWithCalving;
   cCalvingAnimalUnder22Mths = cCalvingAnimalWarning+cCRLFx2+
                               'No Suckler Cow payment will be made.'+cCRLFx2+cContinueWithCalving;
   cCalvingAnimalUnder24Mths = cCalvingAnimalWarning+cCRLFx2+
                            'This may affect the average calving age of your herd.'+cCRLFx2+cContinueWithCalving;

   cSireAddedToDB = 'Sire has been added to the database.';
   cSireAlreadyExists = 'Sire has already been added, do you want to update the sire details?';

   cINTERNET_CONNECTION_NOT_ESTABLISHED = 'An internet connection could not be established.';

   cUSDateStyle = 'mm/dd/yyyy';
   cIrishDateStyle = 'dd/mm/yyyy';

   cDrugBatchQty_Remain_Warning = 'The quantity you are dosing has exceeded this batch quantity remaining.'+cCRLF+
                                  'Batch Number : %s'+cCRLF+
                                  'Do you wish to continue?';

   cDeleteAnimalMessage = 'WARNING! Are you sure you want to delete this record.' + #13 +
                          'If you delete it, you will not be able to re-use' + #13 +
                          'either the Animal No or the National ID No.' + #13 +
                          'Modifying/editing the record may be more appropriate';

   cAllocDateLessThanRegimeStartDateMsg = 'Animal feed allocation start date cannot be before the Feed Regime start date.';
   cAllocDateLessThanRegimeEndDateMsg = 'Animal feed allocation end date cannot be before the Feed Regime start date.';
   cEndDateIsAfterStartDate = 'Animal feed allocation end date is after new feeds start allocation date.';

   cIrishHerdHasTagsWithoutCountryCodeMsg = 'There are animals in this herd that do not have an Irish Country code in the tag number.'+cCRLF+
                                            'Before syncing run the utility for "Re-Generate Country Codes In Irish Tag" in HerdUtils program.';

   cHerdSyncHasMultiHerd = 'This database has more than one herd.'+cCRLF+
                           'The sync cannot proceed until with more than one herd in the database.';

   cHerdSyncHerdHasNullBreeds = 'There are animals in the current herd that do not have a breed code specified.'+cCRLF+
                                'Farm Sync cannot proceed until all animals have a breed code specified.';

   SQL_SELECT = 'SELECT';
   SQL_FROM = 'FROM';
   SQL_WHERE = 'WHERE';
   SQL_ORDERBY = 'ORDER BY';
   SQL_UPPER = 'UPPER';
   SQL_AND = 'AND';
   SQL_INNERJOIN = 'INNER JOIN';
   SQL_LEFTJOIN = 'LEFT JOIN';
   SQL_RIGHTJOIN = 'RIGHT JOIN';

   cMsg_FileNotFound = 'File "%s" could not be found';

   cKInstallerProgram = 'KInstaller.exe';
   cKInstallerUpdate = 'KInstaller.zip';

   cAdvisorDBName = 'ADVISORY';
   cAdvisoryAccessMsg = 'This action cannot be taken when accessed using the advisory database.';

   //   15/12/20 [V5.9 R7.8] /MK Change - Changed the URL as requested by George (TGM).
   cUnitedDairiesURL = 'http://www.thecis.co.uk/thecis/secure/UDF_Login.aspx?ReturnUrl=MainMenu.aspx';
   cNMRURL = 'http://www.nmr.co.uk/data-download/';

   // ************* ReportName Consts Start *************
   cBovineHerdRegRep = 'Bovine Herd Register';
   cStockOnHandRep = 'Stock On Hand';
   cCMMSRecRep = 'CMMS Reconciliation';
   cPurchSalesAnalysisRep = 'Purchase Sales Analysis';
   cTagReplaceRep = 'Tag Replacement Form';
   cConfGradAnalysisRep = 'Conformation Grade Analysis';
   cLivestockInvRep = 'Annual Livestock Valuation';
   cRepsRep = 'REPS Report';
   cProfitMonSumRep = 'Profit Monitor Summary';
   cNutrientProdRep = 'Nutrient Production (N & P)';
   cVetRegisterRep = 'Veterinary Register';
   cVetFeedPurchRep = 'Veterinary/Feed Purchases';
   cSCCCurLactAnalysisRep = 'SCC Current Lactation Analysis';
   cSalesPlannerRep = 'Sales Planner';
   cRestrictAnimalRep = 'Restricted Animals Report';
   cDiseaseTestRep = 'Disease Test Status';
   cVetDueToListRep = 'Veterinary "Due To" List';
   cMedStockRep = 'Medicine Stock Report';
   cVetRepGenRep = 'Veterinary Report Generator';
   cProfMonRepsRep = 'Profit Monitor Reports';
   cBreedingChartRep = 'Breeding Chart';
   cActWarnRemRep = 'Actions/Warnings/Reminders';
   cSireAnalysis = 'Sire Analysis';
   cBullRep = 'Bull Report';
   cDairyHerdHealthCertRep = 'Dairy Herd Health Cert';
   cWeighRep = 'Weighing Report';
   cRecentActListRep = 'Recent Activities List';
   cHerdRepGenRep = 'Herd Report Generator';

   //  13/03/14 [V5.2 R9.0] /MK Change - New Dam & Calf Report Generator replaces the old Calf Performance Generator.
   cCalfPerfGenRep = 'Dam && Calf Report Generator';

   cCattleMargRep = 'Cattle Margins';
   cLivestockValRep = 'Livestock Valuation';
   cBeefPurchGrpRep = 'Beef Purchase Groups';
   cBrowseSireRegRep = 'Browse Sire Register';
   cSireSelectRep = 'Sire Selection';
   cIndCowFertRep = 'Individual Cow Fertility';
   cMilkQuotaPlanRep = 'Milk Quota Planner';
   cFertCheckRep = 'Fertility Check';
   cFertRepGenRep = 'Fertility Report Generator';
   cBestCowsInHerdRep = 'Best Cows In Herd';
   cMonthRecReviewRep = 'Monthly Milk Recordings';
   cMonthSumAnalysisRep = 'Monthly Summary Analysis';
   cMilkProdGraphRep = 'Milk Productions Graphs';
   cDairyBenchRep = 'Dairy Benchmarks';
   cMilkPerfGenRep = 'Milk Perfomance Generator';
   cHUKIRegRep = 'HUKI Registrations';
   cHerdBrochRep = 'Herd Brochure';
   cSalesCatRep = 'Sales Catalogue';
   cPedRepGenRep = 'Pedigree Report Generator';
   cDueToCalveRep = 'Due Calving';
   cDueToDryRep = 'Due Drying Off';
   cDueToServeRep = 'Due Service';
   cDueToPDRep = 'Due Pregnancy';
   cDueToBeCullRep = 'Due To Be Culled';
   cFQASRep = 'FQAS Report';
   cNonFQASRep = 'Non-FQAS Report';
   c30Month10DayRep = '30 Month - 10 Day';
   c30Month30DayRep = '30 Month - 30 Day';
   cSeasonCalvHerdRep = 'Herd Fertility (Seasonal Calving)';
   cSpreadCalvHerdRep = 'Herd Fertility (Spread Calving)';
   cDARDDairyFertBenchRep = 'DARD Dairy Fertility Benchmarks';
   cIHFAUpgRep = 'IHFA Upgrade Report';
   cFertTreatChartRep = 'Fertility Treatment Chart';
   cLatestWeighingRep = 'Latest Weighing';
   cWeightGainRep = 'Weight Gain Analysis';
   cMultipleWeighingRep = 'Multiple Weighing Per Animal';
   // ************* ReportName Consts End *************

   cEnableReportAsFavourite = 'Add Report as Favourite';
   cDisableReportAsFavourite = 'Remove Report as Favourite';

   //   16/05/12 [V5.0 R5.7] /MK Additional Feature - Moved ReportFilter Type Consts To Here.
   // ************* Report Filter Consts Start *************
   cNone = '<None>';
   cKeyReports = 'Key Reports';
   cFavourites = 'Favourites';
   cMostUsed = 'Most Used';
   cReportGenerators = 'Report Generators';
   // ************* Report Filter Consts End *************

   //   03/08/21 [V6.0 R1.7] /MK Change - Default MaxInUseBullCount to 60 - GL/SP/Adrian Thackleberry request.
   cSync_MaxInUseBullCount = 60;

   cCrushPurchaseXMLFileName = 'PurchaseXMLFile.xml';
   cCrushSaleXMLFileName = 'SaleXMLFile.xml';
   cCrushXMLFileLocation = 'C:\Kingswood Herd Management\Crush Files\';
   cRenameFileError = 'Cannot rename file. File name already exists.'+cCRLF+
                      'Contact Kingswood at 01-4599491';

   // ************* RelinkCalvesToDams Month Consts Start *************
   cCheckCalvesForOneMonth = 1;
   cCheckCalvesForThreeMonth = 3;
   cCheckCalvesForTwelveMonth = 12;
   cCheckCalvesForTwoFourMonths = 24;
   // ************* RelinkCalvesToDams Month Consts End *************


   // ************* HerdConfigFile Const Start *************
   cHerdConfigFileName = 'C:\Kingswood Herd Management\Herd.config';
   // ************* HerdConfigFile Const End *************

   cGrpPurchGridLayoutFile = 'GrpPurchCols';

   cTeamViewerDownloadFileName = 'TeamViewer9Setup.exe';
   cDownloadDir = 'http://www.kingswoodcomputing.com/assets/media/downloads/';

   cCalvingXMLFileName = 'CalvingXMLFile.xml';
   cCalvingXMLFirstCalfTag = 'FirstCalf';
   cCalvingXMLSecondCalfTag = 'SecondCalf';
   cCalvingXMLThirdCalfTag = 'ThirdCalf';
   cCalvingXMLFourthCalfTag = 'FourthCalf';

   cTagPrefix_IE = 'IE';
   cIETagLength = 14;
   cTagPrefix_372 = '372';
   c372TagLength = 15;

   cServiceType_AI = 'Artificial Insemination';
   cServiceType_Naturual = 'Natural Service';

   // UKMilkRecorder Start
   cUKMilkRecorder_CIS = 'CIS';
   cUKMilkRecorder_NMR = 'NMR';
   cUKMilkRecorder_DIY = 'DIY';
   cUKMilkRecorder_QMMS = 'QMMS';
   // UKMilkRecorder End

   cShowMeEventInfo_VetFeeds = 'By Individual Animal';
   cShowMeEventInfo_BlockHealth = 'By Group Or Herd';
   cShowMeEventInfo_VetLink = 'Using Vet Link';
   cShowMeEventInfo_PhoneApp = 'Using Phone App';

   // Medicine Groups Start
   cAntibiotic = 'Antibiotic';
   cVaccine = 'Vaccine';
   cDose = 'Dose';
   cTube = 'Tube';
   cOther = 'Other';
   // Medicine Groups End

   // Johnes Start
   cJohnesHigh = 'HIGH';
   cJohnesMedium = 'MEDIUM';
   cJohnesLow = 'LOW';
   // Johnes End

   // ICBF Health API Event Code Const Start
   cICBFAPI_Mastitis = 'MA';
   // ICBF Health API Event Code Const End

   // Highest SCC Per Milk Rec Start
   cHighestSCC = 200;
   // Highest SCC Per Milk Rec End

   //   30/08/21 [V6.0 R2.1] /MK Additional Feature - Added Expected Calving Date const to CalcGridColumns screen.
   cDefaultMainGridCalcColumns : array [0..2] of String = ('Lifetime Gain/Day', 'Gross Margin', 'Projected Calving Date');
type
   ValidTimeDOBRange  = 7..21;
   ValidRetensionDays = 2..3;
   TPremType          = (F,S,B);
   TMonthsOrDays      = (M,D,C); // M = No Months After Birth they are eligible
                                 // D = Retension Days, C = Time Out In Months

   TAnimalCheck = (Entered,AllOk,Deleted);

   TIntegerArray = array of Integer;
   PIntegerArray = TIntegerArray;

   TStringArray = array of String;
   PStringArray = TStringArray;

   ErrorMsg = class(Exception);
   InvalidDate = class(ErrorMsg);
   InvalidPurchaseDate = class(InvalidDate);
   InvalidSaleDeathDate = class(InvalidDate);

   { Set Up Types to control the Paddock }
   TDiaryEventType = ( TSoilTest, TFertApplic, TSilageHarvest, TSlurryApplic,
                       TReSeeding, TTopping, TSpraying, TPaddockRotation, TNoDiaryEvent );

   TDiaryDeleteType = (dtNone, dtSelectedRows, dtFilteredRows);

   //   06/09/11 [V5.0 R0.5] /MK Additional Feature - New EventType MilkTemperament.
   //   20/12/11 [V5.0 R2.9] /MK Additional Feature - New EventType For Tesco Johnes Event.
   //   05/01/12 [V5.0 R3.0] /MK Additional Feature - New EventType For Tesco Scoring Event.
   //   13/03/12 [V5.0 R4.4] /MK Additional Feature - New EventType For BVDTest.
   //   31/01/19 [V5.8 R6.5] /MK Additional Feature - New EventType for Lameness.
   { Set Up Types to control the Events - Used in conjunction with the above constants }
   TEventType = ( TService, TWeight, TDryOff, THealth, TCalving, TBulling, TPregDiag,
                  TPremium10, TPremium22, TPremiumBull, TSaleDeath, TPurchase, TMovement,
                  TReTag, TGeneralRemark, TInterHerd, TTBTestDate, TNoEvent, TStockBull, TNewID,
                  TAbortion, TCastrate, TConditionScore, TDiagnoseProblem, TEmbryoTransfer,
                  TMastitis, TToBeCulled, TWean, TInternalExam, TRunBullIn, TRunBullOut, TBruceTest,
                  TPreSale, TDisbudding, TMealFeeding, TDisbuddingNA, TCastrationNA,
                  TFertilityCheck, TMilkTemperament, TJohnesResult, TBVDTest,
                  // New EventTypes added to differentiate between a herd disease test (BVD, BRU, TB) and a
                  // vaccination for these and other diseases.
                  THerdTest, THerdVaccination,
                  TPlannedBull,
                  TICBFDamEvent, TICBFStockBullEvent, TICBFCalfSurveyEvent,
                  TNullPregDiag, TLameness);
   //   09/01/12 [V5.0 R3.2] /MK Change - Removed No Need For New EventType - Treat As Condition Score - GL.
   //             TTescoScoring );

   { TGeneralRemark, TReTag DO NOT CREATE and event Record }

   { Set Up Types to control the General LookUp Query }
   TGenLookUpType = ( TNone, TServiceType, TServedBy, TPDType, TPDBy, TBirthType, TCalfType,
                      TAnimalColour, TObservedBy, THeatType, TApplicMethod, THealthCode,
                      TCulledCode, TMortality, TFeedCategory, TIntExamRes, TIntExamRea, TIntExamMet,
                      THealthReportDesc, TMedicineGroup );

   { Set Up Types to control the Events - Used in conjunction with the above constants }
   TCountry = ( Ireland, NIreland, Scotland, England, Wales, Poland, NewZeland, UAE, Other );

   TRemark = ( NatID, DOB, Colour, Breed, SaleDate, SalePlace,
               PurchDate, PurchPlace, Sex, Deletion, General,
               SaleDelete, PurchDelete, rHerdID, None );

   TFemaleStatus = (fsInMilk, fsDry, fsNotServed, fsServedNotPDd, fsPregnant, fsNotPregnant, fsNone); // SP 25/09/2002

   //   06/09/11 [V5.0 R0.6] /MK Additional Feature - Added New EventType For Milk Temperament Score.
   //   20/12/11 [V5.0 R2.9] /MK Additional Feature - Added New EventType For Tesco Johnes Event.
   //   04/01/12 [V5.0 R3.0] /MK Additional Feature - Added New EventType For Tesco Scoring Event.
   //   09/01/12 [V5.0 R3.2] /MK Change - Removed ETSC No Need For New EventType - Treat As Condition Score - GL.
   //   TAnimalWelfareType Animal welfare Event Type's
   TAnimalWelfareType = (
                         EABR, {Abortion}       // MoorePark
                         ECST, {Castrate}
                         ECON, {Condition Score}
                         EDNP, {Diagnose Problem}
                         EIMP, {Embryo Implant/Transfer}
                         EMST, {Mastitis}
                         ETBC, {To be Cull}
                         EWNC, {Wean}
                         EINT, {Internal Exam}
                         ERBI, {Run Bull In}
                         ERBO, {Run Bull Out}
                         EMLF, {Meal Feeding}
                         EDBU, {Disbudding }
                         EMTS, {Milk Temperament Score}
                         EJOH, {Tesco Johnes Event}
                         ECQU, {ICBF Calf Survey}
                         EDSU, {ICBF Dam Survey}
                         EBSU  {ICBF Stock Bull Survey}
                         );
                         //   09/01/12 [V5.0 R3.2] /MK Change - Removed ETSC No Need For New EventType - Treat As Condition Score - GL.
                         {
                         ETSC  {Tesco Scoring Event
                         );
                         }

   PPedigreeRec = ^TPedigreeRec;
   TPedigreeRec = record
      prAnimalIndex,
      prAnimalID,
      prDescAnimalID  : Integer;
      prAnimalNum : String[10];
      prAnimalHerdBookNum : String[20];
      prAnimalPedName : String[30];
      prAnimalCombo : String[4];
   end;

   THealthDryRecord = record
      EventType   : String[1];
      AnimalNo    : String[10];
      EventDate   : TDateTime;
      MedicineCode : String[10];
      HealthCode : String[10];
      DrugBatchNo : String[20];
      //   02/02/18 [V5.7 R7.8] /MK Additional Feature - CowManager parlour link requires a comment field for health alert.
      Comment : String[30];
   end;

   TServiceRecord = record
      EventType   : String[1];
      AnimalNo    : String[10];
      EventDate   : TDateTime;
      //   10/03/15 [V5.4 R3.2] /MK Change - Don't restrict ServiceBull to 10 characters instead strip BullNumber to 10 if greater than 10.
      ServiceBull : String;
   end;

   TPregDiagRecord = record
      EventType : String[1];
      AnimalNo  : String[10];
      EventDate : TDateTime;
      Pregnant  : Boolean;
   end;

   TBullingRecord = record
      EventType : String[1];
      AnimalNo : String[10];
      EventDate : TDateTime;
      BullUsed : String[10];
   end;

   PCalvingsRecord = ^TCalvingsRecord;
   TCalvingsRecord = record
      EventType : String[1];
      AnimalNo : String[10];
      EventDate : TDateTime;
      CalfNo : String[20];
      CalfAnimalNo : String[10];
      CalfSex, CalfBreed : String[6];
      CalfColour : String[6];
      CalfBreedID, CalfColourID : Integer;
      CalfWeight : Double;
      CalfDead : Boolean;
      CalfMortality : Integer;
      CalfBreeding : Boolean;
      CalfPedigree : Boolean;
      CalfDisposalPlace : Integer;
      CalfName : string[30];
      //   27/09/12 [V5.0 R8.9] /MK Change - Added ElectronicID field.
      CalfEID : string[20];
   end;

   PSaleDeathRecord = ^TSaleDeathRecord;
   TSaleDeathRecord = record
      AnimalID : Integer;
      EventDate : TDateTime;
      Price, Weight : Double;
      Grade : String[15];
      CustID : Integer;
      Comment : String;
      case Sold : Boolean of
         False : ( DisposalPlace : Integer; CauseOfDeath : Integer );
   end;

   THerdPassword = array[0..9] of Byte;
   TGlobalSettings = record
      ShowCalfReg,
      SaveAnother,
      PhoneLinkOnStartup,
      NewVersionAtStartup,
      NewVersionReminder,
      NewVersionFieldsReps,
      BackupReminder,
      BackupTestFile,
      BackupSpanDisks,
      BackupArchiveFile : Boolean;
      HerdPassword : THerdPassword;
      NatIDToAnimalNo : Boolean;
      MilkTankReadDir : Array [0..255] of Char;
      BladeRegistered : Boolean;
      DisplayBreedCode : Boolean;
      RenumAnimalNo : Boolean;
      MandatoryBreedingEvents : Boolean;
      ReNumFormat : Array [0..3] of char;
      MandatoryDryOffEvent : Boolean; // enforce all dryoff events before calving animal.
      BackupStoreRegFiles : Boolean; // Indication to store Bandon/ICBF Registration Files.
      BackupStorePedigreeImages : Boolean;
      UseBarcodeScanner : Boolean;
      DefaultMaleSex : String[6];
      HealthCodeDefaultCommentIndex : Integer;
      NationalIDAnimalNumber : Integer;
      AllowDuplicateTags : Boolean;
      DefaultExitAfterSale : Boolean;
      DefaultMaleBreedingStatus : Boolean;
      WeighingEventChangeAnimalFocusAfterSave : Boolean;
      UseIEPrefixForNatIDSearch : Boolean;
      DisplayGettingStarted : Boolean;
      AnimalGridSireField : string[20];

      BeefBullAttrNoMonthsFrom : Integer;
      BeefBullAttrNoMonthsTo : Integer;
      BeefBullAttrNoMonthsOver : Integer;
      BeefBullAttrColourBetween : Integer;
      BeefBullAttrColourOver : Integer;
      BeefBullAttrBoldBetween : Boolean;
      BeefBullAttrBoldOver : Boolean;

      BeefFemaleAttrNoMonthsFrom : Integer;
      BeefFemaleAttrNoMonthsTo : Integer;
      BeefFemaleAttrNoMonthsOver : Integer;
      BeefFemaleAttrColourBetween : Integer;
      BeefFemaleAttrColourOver : Integer;
      BeefFemaleAttrBoldBetween : Boolean;
      BeefFemaleAttrBoldOver : Boolean;

      SteerAttrNoMonthsFrom : Integer;
      SteerAttrNoMonthsTo : Integer;
      SteerAttrNoMonthsOver : Integer;
      SteerAttrColourBetween : Integer;
      SteerAttrColourOver : Integer;
      SteerAttrBoldBetween : Boolean;
      SteerAttrBoldOver : Boolean;

      DisplayTBTestDateWarningBeforeSale : Boolean;
      DisplayBruceTestDateWarningBeforeSale : Boolean;
      DisplayMinimumDaysOnFarmWarningBeforeSale : Boolean;
      MinimumDaysToBeKeptOnFarmBeforeSale : Integer;
      DisplayAnimalComments : Boolean;
      AnimalWeighingGraphXAxisValue : Integer;
      AnimalWeighingGraphXAxisVariable : Boolean;

      DisplayMovementFeedColsInGridView : Boolean;

      DownloadMailAttachments : Boolean;
      AnimalGridHideSearchBar : Boolean;

      ReviewMartFiles,
      MartSaveCommentAsSourceName : Boolean;

      CalvingShowGroupControls,
      CalvingShowCommentControl,
      CalvingShowBirthWeightControls,
      CalvingShowCalfColour : Boolean;

      ShowBlockTempMovements : Boolean;

      //   10/08/11 [V5.0 R0.0] /MK Additional Feature - New Const For cGSDisplayCrushSetupOnStartup To Save IAD Crush Tick Box.
      DisplayCrushScreen : Boolean;

      DisplayKingswoodAppInfoScreen : Boolean;

      //   15/12/15 [V5.5 R1.9] /MK Additional Feature - New GlobalSettings boolean to store whether to show the Gmail Inbox reminder in uStartupReminders.
      GmailEmailDownloadReminder : Boolean;

      DisplayTagIdentifierSelector : Boolean;

      DefaultCalfSex : Boolean;
      DefaultCalfSexType : String;

      UseLastRecordWeightAsLiveWeightForKillOut : Boolean;

      UsePurchaseWeightAsLiveWeightForKillOut : Boolean;

      DisplayDealerMainScr : Boolean;

      UpdateMartWeightWithCrushWeight : Boolean;

      ShowAIMSyncFeature,
      ShowVetLinkFeature : Boolean;

      RemoveTransponderAfterSale : Boolean;

      //   08/07/21 [V6.0 R1.6] /MK Additional Feature - Added GlobalSettings for ICBFRegReminder and AIMHerdRecReminder for Startup Reminders.
      ICBFRegReminder : Boolean;
      AIMHerdRecReminder : Boolean;
   end;

   TActionReminderReport = (arDueService, arDuePD, arDueDryOff, arDueCalve);
   TActionReminderReports = Set of TActionReminderReport;
   TReportGenModules = ( rgmHerd, rgmHealth, rgmCowFertility, rgmPedigree, rgmCalfPerformance, rgmMilkPerformance, rgmInvalid );

   PPurchaseRecord = ^TPurchaseRecord;
   TPurchaseRecord = record
     Date : TDateTime;
     Weight, Price : Double;
     Supplier, Buyer : Integer;
     sSupplier, sSupplierHerdIdent, sBuyer : string;
   end;

   PSupplierRecord = ^TSupplierRecord;
   TSupplierRecord = record
     ID : Integer;
     Name,
     Address1,
     Address2,
     Address3,
     Address4,
     Address5,
     Phone : String;
     Commission,
     Transport : Double;
   end;

   TWeighType = (wtNone, wtBirth, wtPurchase, wtWeighing, wtSale);

   PWeighingRecord = ^TWeighingRecord;
   TWeighingRecord = record
     Date : TDateTime;
     Weight : Double;
     WeighType : TWeighType;
   end;

   TNatIdStyle = (StyleEID,Style1999,Style1996,StylePre1996,StyleUnKnown);
   TPDStatus = (pdUndefined, pdPregnant, pdNotPregnant);
   THealthParamType = (hptMedicineCode, hptHealthCode, hptMedicineBatchNo, htpInvalid);

   TNBASPermits = (NBAS31A,NBAS31B,NBAS31G,NBASNone);

   TCheckNationalIDRecord = record
   HerdNo : ShortString;
   case Inherd : Boolean of
      False : ( case Sold : Boolean of True : ( OldAID : Integer ) ) ;
   end;

   TTransferEventsDataRecord = record
     TransferEvents : Boolean;
     NewId, OldId : Integer;
   end;

   TPregnancyStatus = (psNotPregnant, psPregnant, psUndefined);

   TCalvingInfo = record
       ProjCalvingDate : TDateTime;
       PregStatus : TPregnancyStatus;
       NoCalves : Integer;
    end;

   //   18/04/19 [V5.8 R8.9] /MK Additional Feature - Added new type, atNonHerdDam, to easy set up NonHerd Dam from MenuUnit.
   TAnimalType = ( atNone, atInHerd, atNonHerdAncestor, atAIBullProvenDairy, atAIBullTestBeef, atPurchasing, atNonHerdDam);

   TStatusInfo = record
       NoDaysOnFarm : Integer;
       TBTestDate, BruceDate : TDateTime;
       CheckBrucellosis : Boolean;
       CheckTBTest : Boolean;
       CheckMinimumDaysOnFarm : Boolean;
       WithinDrugWithdrawalPeriod : Boolean;
   end;

   // CTSWS DLL function/procedure calls
   TGet_Cattle_On_Holding_Request = function(pHoldingLoc, pHoldingSLoc : pChar ) : Boolean; stdcall;
   TRegister_Births_Request = function(CTSBatchID : Integer) : Boolean; stdcall;
   TRegister_Movements_Request = function(CTSBatchID : Integer) : Boolean; stdcall;
   TSetURLType = procedure(AURLTypeIndex : Integer); stdcall;

   TSaleGrade = (sgInvalid, sgBlank, sgEP, sgEE, sgEM, sgUP, sgUE, sgUM, sgRP, sgRE, sgRM, sgOP, sgOE, sgOM, sgPP);

   TPedigreeBreedCode = string[2];

   THeiferType = (htBeefHeifer, htDairyHeifer, htAllHeifers);
   THeiferTypes = set of THeiferType;

   //   12/03/12 [V5.0 R4.2] /MK Additional Feature - New QuickFilter Type For qfCow and qfDryCows.
   TQuickFilter = (qfNone,
                   qfAllAnimal,
                   qfLeftHerd,
                   qfBullsInUse,
                   qfCows,
                   qfReplacementCows,
                   qfBeefCattleFilter,
                   qfDairyHeifersThisYear,
                   qfDairyHeifersLastYear,
                   qfBeefHeifersThisYear,
                   qfBeefHeifersLastYear,
                   qfAllHeifersThisYear,
                   qfAllHeifersLastYear,
                   qfMaleCalvesThisYear,
                   qfMaleCalvesLastYear,
                   qfAllCalvesThisYear,
                   qfAllCalvesLastYear,
                   qfMilkingCows,
                   qfDryCows,
                   qfDeletedAnimals,
   //   25/10/17 [V5.7 R4.1] /MK Additional Feature - New QuickFilter's for Pregnant and Not Pregnant Cows and Replacements.
                   qfCowPDdPregnant,
                   qfCowPDdNotPregnant,
                   qfRepPDdPregnant,
                   qfRepPDdNotPregnant,
                   qfLeftHerdSold,
                   qfLeftHerdDied,
                   qfLeftHerdCulled,
                   qfCowNotServed,
                   qfCowServedNotPDd,
                   qfRepNotServed,
                   qfRepServedNotPDd,
                   qfCowNotPregnant,
                   qfRepNotPregnant,
                   qfStockBullInUse);

   TAimComplianceCertType = (CC31A, CC31B);

   //   28/10/21 [V6.0 R2.7] /MK Additional Feature - Added a new ActiveFilterType for ShowAllAnimals so as not to upset WinData.GoToAimAnimalDetails from the main screen.
   TActiveFilterType = (afNone, afCart, afCustom, afCrush, afShowAllAnimals);

   TEventFileSource = (esNoLink, esNokiaLink, esSiemensLink, esParlourLink, esPDA, esSmartPhone );

   TCrushXMLFileType = (etPurchase, etSale);

   TIntArray = array of Integer;

   TAimMovementActions = class
   public
     ProcessMovementsOn : Boolean;
     ProcessMovementsOff : Boolean;
     constructor create;
     procedure Reset();
   end;

   THealthWithDrawalInfo = record
     DryOff : Boolean;
     StartDate : TDateTime;
     NoDaysSinceStart : Integer;

     //   21/01/13 [V5.1 R3.8] /MK Change - Added separate dates for Meat, Milk, Other & Organic Meat, Milk, Other -
     //                                     as all dates might be after requested date and priority should be given to Milk.
     MilkWithDrawalDate,
     MeatWithDrawalDate,
     OrganicMilkWithDrawalDate,
     OrganicMeatWithDrawalDate,
     OtherWithDrawalDate,
     OrganicOtherWithDrawalDate : TDateTime;

     //   06/02/14 [V5.2 R8.1] /MK Bug Fix - Added variable NotApplicable to HealthWithdrawalInfo.
     NotApplicable : Boolean;
   end;

   TMainAnimalDetailsRec = record
      AnimalID,
      AnimalLactNo,
      AnimalHerdID,
      AnimalBreedID : Integer;
      AnimalDateOfBirth : TDateTime;
      AnimalNo,
      AnimalNatID,
      AnimalSex : String;
   end;

   TMedicineGroupType = (mgAntibiotic, mgDose, mgTube, mgVaccine, mgOther);

   TGroupType = (gtNone, gtFeed, gtBatch, gtSales, gtPurchase, gtDrafting);
   
   TSelectionType = (stNoSelection, stCart, stFilter);

   TCategoryType = ( ctCurrentHerdAnimals, ctAllCows, ctInMilkCows, ctDryCows,
                     ctAllCalvesThisYear, ctAllCalvesLastYear, ctAllCalvesBothYears,
                     ctHeiferCalvesThisYear, ctHeiferCalvesLastYear, ctHeiferCalvesBothYears,
                     ctDairyHeiferCalvesThisYear, ctDairyHeiferCalvesLastYear, ctDairyHeiferCalvesBothYears,
                     ctBeefHeiferCalvesThisYear, ctBeefHeiferCalvesLastYear, ctBeefHeiferCalvesBothYears,
                     ctMaleCalvesThisYear, ctMaleCalvesLastYear, ctMaleCalvesBothYears,
                     ctGroupSelected, ctNoSelection );

   TSelectedDeptMartInfo = record
      Name,
      Number : String;
   end;

   //   13/08/18 [V5.8 R2.3] /MK Change - Moved Report Options record type here for public use.
   TPurchSalesOptions = record
      IncludeLiveWeight : Boolean;
      IncludeDeadWeight : Boolean;
      IncludeLastPurchaseDetails : Boolean;
      IncludeAllPurchaseDetails : Boolean;
      ReportTitle : String;
   end;

   TWeighRepOptions = record
      SupplierID : Integer;
      ReportTitle : String;
      WeighGainShowDOB : Boolean;
      WeighGainShowAge : Boolean;
      BlockWeightStartDate : TDateTime;
      SummaryReportOnly : Boolean;
      IncludeTargetWeighing : Boolean;
   end;

   TAnimalRec = record
      AnimalID,
      LactNo,
      HerdID : Integer;
      AnimalNo,
      NatIDNum,
      BreedCode,
      Sex,
      ColourCode : String;
      DateOfBirth : TDateTime;
      InHerd : Boolean;
   end;

   TSelectType = (stSelected, stDeselected);

var
   RequestAccountsData : Boolean = False;
   HUKIServerIPAdd : String = HUKILiveServerIPAdd;
   HUKINewServerIPAdd : String = HUKILiveDairyFactsIPAdd;
   DLLHandle : THandle;
   bConnected : Boolean;
   SendMailResult : Integer;
   DebugMode : Boolean = False;

   WM_KINGSWOOD_AIMCLIENT_CLOSED : Dword;
   WM_KINGSWOOD_AIMCLIENT_ANIMALREGISTERED : Dword;
   WM_KINGSWOOD_AIMCLIENT_PROCESSDISASSOCIATEDTRANSACTIONS: DWORD;
   WM_KINGSWOOD_AIMCLIENT_PROCESSMOVEMENTSON: DWORD;
   WM_KINGSWOOD_AIMCLIENT_PROCESSMOVEMENTSOFF: DWORD;
   WM_KINGSWOOD_AIMCLIENT_RECONCILEHERD: DWORD;
   WM_KINGSWOOD_AIMCLIENT_PROCESS_PROCESSNEWCUSTOMER: DWORD;

   WM_KINGSWOOD_FARMSYNC_COMPLETED : DWORD;
   WM_KINGSWOOD_FARMSYNC_SETTINGSCHANGED : DWORD;
   WM_KINGSWOOD_FARMSYNC_OPTIONSCHANGED : DWORD;
   WM_KINGSWOOD_FARMSYNC_ERRORINSYNCPROCESS : DWORD;
   WM_KINGSWOOD_FARMSYNC_LOGINFAILED : DWORD;
   WM_KINGSWOOD_FARMSYNC_UPDATEREQUIRED : DWORD;
   WM_KINGSWOOD_FARMSYNC_MARKASSYNCHRONIZED : DWORD;
   WM_KINGSWOOD_INVALID_SYSTEM_DATE_FORMAT : DWORD;
   WM_KINGSWOOD_FARMSYNC_PROCESS_EVENTS : DWORD;
   WM_KINGSWOOD_FARMSYNC_ADJUST_MAX_ACTIVE_BULL_COUNT : DWORD;

   WM_KINGSWOOD_SHOW_MAX_ACTIVE_BULL_SCR : DWORD;

{
   HUKILinmackTestServerIPAdd = '195.153.22.94';
   HUKILiveServerIPAdd = '195.153.22.90';
}

const
   iEventDesc : array[TEventFileSource] of string = ('No Link', 'Nokia PhoneLink', 'Siemens PhoneLink', 'Parlour Events', 'PDALink Events', 'Smart Phone');
   GroupTypesArray : array[TGroupType] of string = ('None', 'Feed', 'Batch', 'Sales', 'Purchase', 'Drafting' );

implementation


{ TAimMovementActions }

constructor TAimMovementActions.create;
begin
   Reset();
end;

procedure TAimMovementActions.Reset;
begin
   ProcessMovementsOn := False;
   ProcessMovementsOff := False;
end;

initialization
   DebugMode := DirectoryExists('C:\Kingswood\Output\Winherd\Development\Compiled');

end.
