{
   06/01/20 [V5.9 R1.6] /MK Additional Feature - Added Total Value, Total Deductions and Cheque Amount summary items before Remittance End - Una Carter request.

   11/02/21 [V5.9 R8.4] /MK Change - Convert - Country code was never added to the converter.

   12/02/21 [V5.9 R8.4] /MK Change - Added consts for GB file parameters.
                                   - New type created for TBeefRemitCountry for either Ireland or GB.
                                   - Convert - If TBeefRemitCountry is GB then set fields in field depending on GB consts.

   03/03/21 [V5.9 R9.2] /MK Change - Convert - If a null date is found as the Event Date give error and don't covert the file - Grace (C&J Meats).

   06/07/21 [V6.0 R1.6] /MK Additional Feature - Added Total Dead Weight to summary items before Remittance End - Una Carter request.   
}

unit ElectronicRemittanceConverter;

interface
uses
  Windows, Messages, SysUtils, Classes, Dialogs, uSPParser;

type
  TBeefRemitCountry = (brcIreland, brcGB);
  TElectronicRemittanceConverter = class
  private
    FParser: TSPParser;
    FRemittanceFile : TStringList;
    FElectronicRemittanceFile : TStringList;
    FCSVFileName: string;
    FLine : string;
    FBeefRemitCountry : TBeefRemitCountry;
    procedure SetCSVFileName(const Value: string);
  protected
    procedure AddToLine(const SubString : String);
  public
    constructor create;
    destructor destroy;override;
    procedure Convert;
    procedure SaveToFile(AFileName : string);
    function ElectronicRemittanceAsString : WideString;
    property CSVFileName : string read FCSVFileName write SetCSVFileName;
  end;

const
  cCountryID = 2;
  cFactoryName = 3;
  cFactoryAddress1 = 4;
  cFactoryAddress2 = 5;
  cFactoryAddress3 = 6;
  cFactoryAddress4 = 7;
  cOwnerHerdNo = 8;
  cSlaughterDate = 9;
  cLotNo = 10;

  JustifyLeft  = 0;
  JustifyRight = 1;

  cFileFieldSep = ' ';

  idNATIONAL  : array[0..2] of integer = (1,14,JustifyLeft);
  idCARCASE   : array[0..2] of integer = (16,8,JustifyLeft);
  idSEX       : array[0..2] of integer = (26,5,JustifyLeft);
  idGRADE     : array[0..2] of integer = (32,4,JustifyLeft);
  idLWEIGHT   : array[0..2] of integer = (39,7,JustifyRight);
  idRWEIGHT   : array[0..2] of integer = (48,8,JustifyRight);
  idCONDEMNED : array[0..2] of integer = (57,10,JustifyLeft);
  idCWEIGHT   : array[0..2] of integer = (68,8,JustifyRight);
  idPRICEPER  : array[0..2] of integer = (77,9,JustifyRight);
  idVALUE     : array[0..2] of integer = (87,14,JustifyRight);
  idLIVEWEIGHT : array[0..2] of integer = (102,15,JustifyRight);
  idTOTALDEDUCTIONS : array[0..2] of integer = (118,15,JustifyRight);

  idGBDNATIONAL  : array[0..2] of integer = (1,24,JustifyLeft);
  idGBDCARCASE   : array[0..2] of integer = (26,8,JustifyLeft);
  idGBDSEX       : array[0..2] of integer = (36,5,JustifyLeft);
  idGBDGRADE     : array[0..2] of integer = (42,4,JustifyLeft);
  idGBDLWEIGHT   : array[0..2] of integer = (49,7,JustifyRight);
  idGBDRWEIGHT   : array[0..2] of integer = (58,8,JustifyRight);
  idGBDCONDEMNED : array[0..2] of integer = (67,10,JustifyLeft);
  idGBDCWEIGHT   : array[0..2] of integer = (78,8,JustifyRight);
  idGBDPRICEPER  : array[0..2] of integer = (87,9,JustifyRight);
  idGBDVALUE     : array[0..2] of integer = (97,14,JustifyRight);
  idGBDLIVEWEIGHT : array[0..2] of integer = (112,15,JustifyRight);
  idGBDTOTALDEDUCTIONS : array[0..2] of integer = (128,15,JustifyRight);

implementation

uses
   KRoutines;

{ TElectronicRemittanceConverter }

constructor TElectronicRemittanceConverter.create;
begin
  inherited;
  FRemittanceFile := TStringList.Create;
  FElectronicRemittanceFile := TStringList.Create;
  FParser := TSPParser.Create(nil);
  FParser.Sepchar := ',';
end;

destructor TElectronicRemittanceConverter.destroy;
begin
  FreeAndNil(FRemittanceFile);
  FreeAndNil(FElectronicRemittanceFile);
  FreeAndNil(FParser);
end;

procedure TElectronicRemittanceConverter.Convert;
var
   i : Integer;
   TempStr : string;
   fSumValue : Double;
   fSumDeducts : Double;
   fSumDeadWeight : Double;
begin
   FElectronicRemittanceFile.Clear;

   if Copy(FRemittanceFile.Strings[0], 1, 3) <> 'HDR' then
      begin
         raise Exception.Create('File does not contain a valid header declaration.');
         Exit;
      end;

   FParser.Parse( FRemittanceFile.Strings[0] );
   // Create header part

   //   03/03/21 [V5.9 R9.2] /MK Change - If a null date is found as the Event Date give error and don't covert the file - Grace (C&J Meats).
   if ( FParser.Fields[cSlaughterDate] = '31/12/1899' ) then
      begin
         MessageDlg('Unable to convert file as invalid date found'+#13#10+
                    'Please contact the factory that supplied the file.',mtError,[mbOK],0);
         Exit;
      end;


   FElectronicRemittanceFile.Add('[FILE START]');
   // Date
   FLine := '';
   AddToLine( PadRight('FILE DATE', ' ',20));
   AddToLine(FormatDateTime('dd-mm-yyyy hh:mm:ss', now));
   FElectronicRemittanceFile.Add(FLine);

   // File Type
   FLine := '';
   AddToLine(PadRight('FILE TYPE', ' ',20));
   AddToLine('BEEF REMITTANCE');
   FElectronicRemittanceFile.Add(FLine);

   // File Version
   FLine := '';
   AddToLine(PadRight('FILE VERSION', ' ',20));
   AddToLine('00001');
   FElectronicRemittanceFile.Add(FLine);

   // Created By
   FLine := '';
   AddToLine(PadRight('CREATED BY', ' ',20));
   AddToLine('KINGSWOOD');
   FElectronicRemittanceFile.Add(FLine);

   // Country
   //   11/02/21 [V5.9 R8.4] /MK Change - Country code was never added to the converter.
   FLine := '';
   AddToLine(PadRight('COUNTRY', ' ',20));
   AddToLine(FParser.Fields[cCountryID]);
   FElectronicRemittanceFile.Add(FLine);
   if ( FParser.Fields[cCountryID] = 'GB' ) or ( FParser.Fields[cCountryID] = 'NI' ) then
      FBeefRemitCountry := brcGB
   else
      FBeefRemitCountry := brcIreland;

   // Remittance
   FLine := '';
   AddToLine(PadRight('REMITTANCE COUNT', ' ',20));
   AddToLine('00001');
   FElectronicRemittanceFile.Add(FLine);

   FElectronicRemittanceFile.Add('');

   // Remittance Start
   FLine := '';
   AddToLine('[REMITTANCE 00001 START]');
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Remittance Number', ' ',20));
   AddToLine('000000');
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Remittance Date', ' ',20));
   AddToLine(FParser.Fields[cSlaughterDate]);
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Slaughter Date', ' ',20));
   AddToLine(FParser.Fields[cSlaughterDate]);
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Lot Reference', ' ',20));
   if ( Length(FParser.Fields[cLotNo]) > 0 ) then
      AddToLine(PadLeft(FParser.Fields[cLotNo],' ',6))
   else
      AddToLine('000000');
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Producer Reference', ' ',20));
   AddToLine('000000');
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Producer Name', ' ',20));
   AddToLine(FParser.Fields[cFactoryName]);
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Producer Address 1', ' ',20));
   AddToLine(FParser.Fields[cFactoryAddress1]);
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Producer Address 2', ' ',20));
   AddToLine(FParser.Fields[cFactoryAddress2]);
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Producer Address 3', ' ',20));
   AddToLine(FParser.Fields[cFactoryAddress3]);
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Producer Address 4', ' ',20));
   AddToLine(FParser.Fields[cFactoryAddress4]);
   FElectronicRemittanceFile.Add(FLine);

   FLine := '';
   AddToLine(PadRight('Carcase Count', ' ',20));
   AddToLine(PadLeft( IntToStr(FRemittanceFile.Count-1), '0', 4));
   FElectronicRemittanceFile.Add(FLine);

   FElectronicRemittanceFile.Add('');

   FLine := '';

   AddToLine('                    Ear Tag Number Carc No.  Sex   Grad   Left Wt  Right Wt  Condemned Cold Wt. Price /Kg          Value      LiveWeight TotalDeductions');
   FElectronicRemittanceFile.Add(FLine);

   for i := 1 to FRemittanceFile.Count-1 do
      begin
         FLine := '';
        // SetLength(FLine, 300);
         if UpperCase(Copy(FRemittanceFile.Strings[i], 1, 3)) = 'CAR' then
            begin
               FParser.Parse( FRemittanceFile.Strings[i] );

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadRight(FParser.Fields[2], ' ', idGBDNATIONAL[1])
               else
                  TempStr := PadRight(FParser.Fields[2], ' ', idNATIONAL[1]);
               AddToLine(TempStr);

               TempStr := ' ';
               AddToLine(TempStr);

               TempStr := PadLeft(FParser.Fields[3], ' ', 8);
               AddToLine(TempStr);

               TempStr := '  ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadRight(FParser.Fields[4], ' ', idGBDSEX[1])
               else
                  TempStr := PadRight(FParser.Fields[4], ' ', idSEX[1]);
               AddToLine(TempStr);

               TempStr := ' ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadRight(FParser.Fields[5], ' ', idGBDGRADE[1])
               else
                  TempStr := PadRight(FParser.Fields[5], ' ', idGRADE[1]);
               AddToLine(TempStr);

               TempStr := '   ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadLeft(FParser.Fields[6], ' ', idGBDLWEIGHT[1])
               else
                  TempStr := PadLeft(FParser.Fields[6], ' ', idLWEIGHT[1]);
               AddToLine(TempStr);

               TempStr := '  ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadLeft(FParser.Fields[7], ' ', idGBDRWEIGHT[1])
               else
                  TempStr := PadLeft(FParser.Fields[7], ' ', idRWEIGHT[1]);
               AddToLine(TempStr);

               TempStr := ' ';
               AddToLine(TempStr);

               TempStr := PadRight(FParser.Fields[8], ' ', 9);
               AddToLine(TempStr);

               TempStr := ' ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadLeft(FParser.Fields[9], ' ', idGBDCWEIGHT[1])
               else
                  TempStr := PadLeft(FParser.Fields[9], ' ', idCWEIGHT[1]);
               AddToLine(TempStr);
               if ( Length(TempStr) > 0 ) then
                  fSumDeadWeight := fSumDeadWeight + StrToFloat(TempStr);

               TempStr := ' ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadLeft(FParser.Fields[10], ' ', idGBDPRICEPER[1])
               else
                  TempStr := PadLeft(FParser.Fields[10], ' ', idPRICEPER[1]);
               AddToLine(TempStr);

               TempStr := ' ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadLeft(FParser.Fields[11], ' ', idGBDVALUE[1])
               else
                  TempStr := PadLeft(FParser.Fields[11], ' ', idVALUE[1]);
               AddToLine(TempStr);
               if ( Length(Trim(TempStr)) > 0 ) then
                  fSumValue := fSumValue + StrToFloat(TempStr);

               TempStr := ' ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadLeft(FParser.Fields[12], ' ', idGBDLIVEWEIGHT[1])
               else
                  TempStr := PadLeft(FParser.Fields[12], ' ', idLIVEWEIGHT[1]);
               AddToLine(TempStr);

               TempStr := ' ';
               AddToLine(TempStr);

               if ( FBeefRemitCountry = brcGB ) then
                  TempStr := PadLeft(FParser.Fields[13], ' ', idGBDTOTALDEDUCTIONS[1])
               else
                  TempStr := PadLeft(FParser.Fields[13], ' ', idTOTALDEDUCTIONS[1]);
               AddToLine(TempStr);
               if ( Length(Trim(TempStr)) > 0 ) then
                  fSumDeducts := fSumDeducts + StrToFloat(TempStr);

               TempStr := PadRight('CARCASE '+ PadLeft( IntToStr(i), '0', 3),' ',20);
               FLine := TempStr + FLine;

               FElectronicRemittanceFile.Add(FLine);
            end;
      end;

  FElectronicRemittanceFile.Add('');
  FElectronicRemittanceFile.Add('');

  if ( fSumValue > 0 ) then
     begin
        FLine := '';
        AddToLine(PadRight('Total Value', ' ',20));
        AddToLine(FloatToStr(fSumValue));
        FElectronicRemittanceFile.Add(FLine);
     end;

  if ( fSumDeadWeight > 0 ) then
     begin
        FLine := '';
        AddToLine(PadRight('Total Dead Weight', ' ',20));
        AddToLine(FloatToStr(fSumDeadWeight));
        FElectronicRemittanceFile.Add(FLine);
     end;

  if ( fSumDeducts > 0 ) then
     begin
        FLine := '';
        AddToLine(PadRight('Total Deductions', ' ',20));
        AddToLine(FloatToStr(fSumDeducts));
        FElectronicRemittanceFile.Add(FLine);
     end;

  if ( fSumValue > 0 ) or ( fSumDeducts > 0 ) then
     begin
        FLine := '';
        AddToLine(PadRight('Cheque Amount', ' ',20));
        AddToLine(FloatToStr(fSumValue - fSumDeducts));
        FElectronicRemittanceFile.Add(FLine);
     end;

  FElectronicRemittanceFile.Add('');
  FElectronicRemittanceFile.Add('[REMITTANCE 00001 END]');
  FElectronicRemittanceFile.Add('[FILE END]');
end;

procedure TElectronicRemittanceConverter.SaveToFile(AFileName: string);
begin
   if FElectronicRemittanceFile <> nil then
      begin
         FElectronicRemittanceFile.SaveToFile( AFileName );
      end;
end;

procedure TElectronicRemittanceConverter.SetCSVFileName(
  const Value: string);
begin
   FCSVFileName := Value;
   FRemittanceFile.Clear;
   FRemittanceFile.LoadFromFile( FCSVFileName );
end;

procedure TElectronicRemittanceConverter.AddToLine(
  const SubString: String);
begin
   FLine := FLine + UPPERCASE(SubString);
end;

function TElectronicRemittanceConverter.ElectronicRemittanceAsString: WideString;
begin
   Result := FElectronicRemittanceFile.Text;
end;

end.
