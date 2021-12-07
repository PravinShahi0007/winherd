{
   06/01/09 [V3.9 R5.6] /SP Bug Fix - PrepareNatIDSearch - Stripping spaces from LocateNatID value if UK9Tag,
                                                           spaces should remain when tag type is UK9

   07/12/10 [V4.0 R7.0] /MK Bug Fix - New Field, ColdDeadWt, created for Cold Dead Weight to be saved from Grid.
                                      Calculate ColdDeadWt as Total Weight.

   03/11/11 [V5.0 R1.7] /MK Additional Feature - Add VatCalculation On Price From Sales And Purchase Files.

   30/05/12 [V5.0 R6.0] /MK Bug Fix - ImportFromNIMovementsIn - Parsers Not In The Right Order.

   11/09/12 [V5.0 R9.9] /MK Change - PostPurchases - Logic changed so purchase can be added if animal exists without a purchase.

   12/11/12 [V5.1 R0.9] /MK Additional Feature - Added Sale and Purchase CrushXML options.

   27/02/13 [V5.1 R4.7] /MK Bug Fix - PostPurchases - BuyerID was not being set by FMartTable if BuyerID exists in FMartTable.

   08/05/13 [V5.1 R7.1] /MK Additional Feature - PostFileDetails - Check whether GlobalSettings.ReviewMartFiles for mftXML File Types.
                                                                 - New sub-procedure to add CustomerSupplierID to FMartTable from XML file
                                                                   for Review purposes.
                                               - PostPurchases - Check if any buyers were entered in the FMartTable from uMartImportByFileReview.

  11/06/13 [V5.1 R7.3] /MK Bug Fix - PostPurchases - FMartTable not in Edit Mode to store price change after vat calc.

  20/06/13 [V5.1 R7.5] /MK Additional Feature - Check if GlobalSettings.MartSaveCommentAsSourceName then change Event Comment to Supplier/Customer Name.

  03/12/13 [V5.2 R6.6] /MK Additional Feature - Added PurchGrpID and BatchGrpID fields to MartTable.
                                              - Allow animal to be saved to Purchase and/or Batch Group if group selected.

  16/12/13 [V5.2 R7.0] /MK Additional Feature - Removed FQASDays save from Purchase event.
                                              - Added QADate to FMartTable and save this date to AnimalRecord.

  21/05/14 [V5.3 R1.4] /MK Bug - GetCarnarossMartFromMovedTo - Strip FSourceName to search for HerdIdentity.
                                 Error appearing because locate was searching by whole FSourcName.

  18/06/14 [V5.3 R2.8] /MK Change - PostPurchases - Brought back FQAS Days - Request by TGM/GL.
                                                  - Save QADate to animals table & animals.QualityAssured if ( FQASDate <= Date ).

  07/08/14 [V5.3 R4.4] /MK Additional Feature - Import - Add new update routine for Crush users - IAD request.

  25/09/14 [V5.3 R6.4] /MK Bug Fix - PostPurchaseAndHealth - If Crush user then don't recalculate Vat again - IAD reported.

  04/02/15 [V5.4 R2.6] /MK Additional Feature - FMartTable - New boolean field for StillOffFarm added.
                                              - PostSales - Check to see if animals have active tempoary movements and don't sell them.

  11/05/15 [V5.4 R5.6] /MK Bug Fix - ImportFromXML - Check if file contains strings with '&' (ampersand symbol) and fix the string to contain '&amp:' string instead.
                                                   - Set new string variable to source name first as "Access Violation" appears if "_" symbol found in XMLDOMNode.Text.

  12/05/15 [V5.4 R5.6] /MK Additional Feature - ImportFromXML - If the file is a sale file then allow for blank sex, breed and dob on the file.
                                                              - If the file is a purchase file then show the appropriate field error and exit sequence.

  05/04/16 [V5.5 R4.8] /MK Bug Fix - PostPurchasesAndHealth - Quantity was used here instead of RateApplic.

  10/11/16 [V5.6 R3.0] /MK Change - PostPurchases - Logic changed so existing purchase can be updated if file read in again - Ann Alexander request.
                                  - ImportNIMovementsIn/Out - Always show mart review screen which allows for the customer/supplier to be selected.
                                                            - Removed the link to TfmMartCustomerSupplierLookup screen as its no longer required.

  15/11/16 [V5.6 R3.2] /MK Change - ImportNIMovementsIn/Out - Add Customer/Supplier to table if it does exists without use TfmMartCustomerSupplierLookup.

  21/11/16 [V5.6 R3.3] /MK Bug Fix - ImportNIMovementsIn - Code for purchases was not finished to assign CustomerSupplier as GetSupplierID.

  22/11/16 [V5.6 R3.4] /MK Bug Fix - ImportNIMovementsIn/Out - Had to bring back the link to TfmMartCustomerSupplierLookup as TGM say its the better option than just adding the customer/supplier.
                           Change - Had to implement the update of a sale file from mart or NIMovementsOut files.

  10/03/17 [V5.6 R6.7] /MK Additional Feature - PostPurchases - If the event exists in the events table but doesn't exist in the purchase table
                                                                then insert a record into the purchase table with the details - John Milliken.
                                                              - Store some of the records from the FMartTable into a file that can be
                                                                read in again if the program fails to save the data - John Milliken.
                                                              - If the event does exist in the detail table then go through PostPurchaseAndHealth
                                                                and this code will update the purchase record if it already exists.
                           Change - ImportFromNIMovementsIn - Have to determine whether file contains a header line or not.

  12/04/17 [V5.6 R6.8] /MK Change - PostSales - If the event exists in the events table but doesn't exist in the purchase table
                                                then insert a record into the purchase table with the details - John Milliken.
                                  - PostSales, PostPurchases - Refactored the code so that the purchase/sale event is saved, the EventRecording class is free'd
                                                               and then whatever happens after the event is saved is done last.

  10/05/17 [V5.6 R8.0] /MK Change - ImportFromXML - NewLine (Mart Software Supplier) emailed enquiring about whether they can pass in the
                                                    tag number without the IE or 372 because when they scan a barcode it doesn't contain IE or 372.
                                                    The change below checks to see whether the number without the IE or 372 (12 digits) is a valid
                                                    IE or 372 based on the formula that Tony (Dept. of Ag) gave us to check what the tag type is.
                                  ** NOTE ** - The change above only has to be applied to PostPurchases because PostSales already searches by the tag without IE or 372.

   18/09/17 [V5.7 R2.5] /MK Bug Fix - PostPurchase - TCrushXMLExport.Create using BruceTest instead of BruceTestDate field name.

   19/09/17 [V5.7 R2.6] /MK Bug Fix - ImportFromXML - TagNo field was never set back to formatted tag i.e. IE or 372, after NewLine change 10/05/17.

   22/09/17 [V5.7 R3.0] /MK Change - Added the required changes for new Feeds unit.

   27/09/17 [V5.7 R3.1] /MK Change - ImportFromXML - Changes made to allow NI tags to be brought in.

   17/10/17 [V5.7 R3.9] /MK Change - ImportFromXML - Some issues found with introduction of NatIDKind, no need for else if ThisNatIDKind <> nkUnknown.
                            Additional Feature - ImportFromXML - Added check for new IE Quality Assurance field from NewLine.
                                                               - Set animal QA to true if this QA value coming from file is Y.

   29/11/17 [V5.7 R5.7] /MK Change - ImportFromXML - SearchTagNo was not being assigned for UK9 tags.
                                                   - Format tag number for UK (non UK9) tags.

   11/12/17 [V5.7 R6.1] /MK Change - ImportFromNIMovementsIn, ImportFromNIMovementsOut -
                                     - Had to make a change to the import of APHIS files because new website changes on APHIS have reversed the breed and sex fields.
                                       I also had to remove the quotation marks in front of the fields on the file as well.

   30/01/18 [V5.7 R7.6] /MK Change - PostPurchases - If an animal is in the herd already but doesn't have a colour then update the colour from APHIS file - John Milliken.
                            Bug Fix - PostPurchases/AddAnimalRecord - Only create a colour if the ColourCode is on the file, don't create blank colours - John Milliken.
                                    - PostPurchase/PostPurchaseAndHealth - Only update purchase details where price and weight is on the mart file or entered by the user (APHIS).

   06/02/18 [V5.7 R7.9] /MK Change - AddAnimalRecord - Only validate colour if the colour exists - colour is not on Mart File but is on APHIS file - John Milliken.

   04/04/18 [V5.7 R8.6] /MK Change - ImportFromXML - NewLine made a change in 2017 that is only affecting files exporting from the mart recently.
                                                     Gerry (Kingswood) agreed with Simon Jones (NewLine) that would check for node name Tag if the node name TagNo does not exist.

   18/05/18 [V5.8 R0.1] /MK Change - PostPurchaseAndHealth - Changed FSourceID to FMartTable.FieldByName('CustomerSupplier').AsInteger as user is allowed to change
                                                             the supplier from the top combo box at the top of the Mart Review screen (for Purchases only).

   07/06/18 [V5.8 R0.6] /MK Change - AddAnimalToXMLFile - Add NationalID number to CrushXML file.

   18/07/18 [V5.8 R1.1] /MK Change - PostPurchaseAndHealth - If Crush user and the animal is sold but does not have a purchase event then create purchase event - Bellingham.

   30/07/18 [V5.8 R2.1] /MK Change - ImportFromXML - Removed this check as program now will force the review of the mart file if there are blank breeds.
                                                     The review screen will not close unless the breeds are filled in.

   31/07/18 [V5.8 R2.1] /MK Change - Review screen will appear if (preference is ticked) or (there are blank breeds and its a purchase file).
                                   - If (purchase file) and (there are blank breeds) then don't prompt to review the file, just review the file.

   04/02/19 [V5.8 R6.6] /MK Additional Feature - UpdateFMartTableSourceID - Store the Commission/Deductions and Transport from Customer/Supplier in relevant fields of FMartTable.
                                               - PostPurchaseAndHealth - Take the buyers costs from the buyers table and store in relevant Purchase table field.
                                                                       - When adding a missing detail purchase record, add the buyer costs.
                                                                       - When updating a purchase record add buyercosts.
                                               - PostSales - Add CustomerCosts from Deductions(Commission) and Transport(Haulage) from Customer table.
                                                           - When adding a missing detail sale record, add the customer costs.
                                                           - When updating a sale record add customer costs.
                            Change - PostFileDetails - As in Purchase file, always MartTableSourceID field, not just if reviewing mart file.

   09/10/19 [V5.9 R0.8] /MK Change - When importing the price from the mart file change the price then to exclusive of VAT if VatRegistered and VatRate exists.
                                   - Removed further changing of price to Vat Exclusive.
                                   - Added back in change of price to Vat Exclusive for Crush users.

   14/10/19 [V5.9 R0.9] /MK Additional Feature - PostSales - Remove Transponder No if Parlour and RemoveTransponderAfterSale preference.

   03/12/19 [V5.9 R1.4] /MK Additional Feature - Added QADays field to FMartTable.
                                               - Added import of QADays node to new QADays field.
                                               - AddAnimalRecord - Assign TAnimalRecord.QANoMovements file value from new QADays field.

   13/12/19 [V5.9 R1.5] /MK Change - ImportFromNIMovementsIn - If the animal already exists in the herd then bypass it - John Milliken.
                                                             - Show prompt if there are no animals to import because they have already been imported - John Milliken.
                                   - Import - Pass in Var AAnimalCount so the review screen doesn't appear if there are no animals to import.
                                   - PostFileDetails - Exit if there are no animals in FMartTable.
                                   - New procedure, AddBreedToTable, created to add breed code from Mart/APHIS File to Breeds table if it does not exist already.

   16/12/19 [V5.9 R1.5] /MK Change - ImportFromNIMovementsIn - If a user is reimporting a file then the field count will be more than 9.
                                                               APHIS made a change to export a 9th field called "Res" which means residency.
                                                               This field was being imported into the price field - John Milliken.
                                   - ImportFromXML - Only copy 40 characters of the Source Name as FarmSync only allows for 40 characters - SP request.

   18/03/21 [V5.9 R9.5] /MK Change - ImportFromXML - Default the QualityAssured field to False so that if the QA field is not found at least the box is unticked.

   07/12/21 [V6.0 R3.0] /MK Additional Feature - Added a grade column for purchases and sales - C & J Meats.                                                   
}

unit uMartImportByFile;

interface

uses
   Classes, Forms, db, dbTables, sysutils, MSXML2_TLB, OleServer, ComObj, dialogs,
   uSPParser, Messages, Windows, uMartImportByFileReview, uMartImportTypes, DairyData,
   uNationalID, uSelectBuyer, Controls, uCrushXML, Def, KDBRoutines, uMovementInHealthBatchNo,
   KRoutines, FileCtrl, GenTypesConst, uAnimal, uApplicationLog;

type

   MartImport = class
   private
      FFileName : string;
      FMartTable, FAnimalTable,
      FSourceDetails, FBreedTable,
      FHealthTable : TTable;
      FMartImportType : TMartImportType;
      FSourceName : string;
      FNoRecorded,
      FSourceID : Integer;
      FHerdID: Integer;
      FFileStatistics : TStatistics;
      FErrorList : TStringList;
      FAllowDuplicateTags: Boolean;
      FParser : TSPParser;
      FFileType: TMartFileType;
      Value, VATRate, PriceLessVAT : Double;
      VATRegistered : Boolean;
      FAnimalSaved : Boolean;

      procedure PostFileDetails;
      function ImportFromXML : TMartImportType;
      procedure ImportFromNIMovementsIn;
      procedure ImportFromNIMovementsOut;
      procedure SetVars;
      procedure PostSales;
      procedure PostPurchases;
      procedure PrepareNatIDSearch;
      procedure SetFileType(const Value: TMartFileType);
      function GetCarnarossMartFromMovedTo : Integer;
      procedure DSBeforePost(Sender: TDataset);
      procedure DSAnimalNoValidate(Sender: TField);
      function CountOfPurchaseEvents : Integer;
      procedure GetVatInformation(AHerdId : Integer);
      procedure SaveMartTableDetail;
      procedure AddBreedToTable(ABreedCode : String);
   public
      CreateTempMovementOnZeroSalePrice : Boolean;
      constructor Create(AHerdID : Integer);
      destructor Destroy;override;

      procedure Import(AFileName : string; var AAnimalCount : Integer);
      property NoRecorded : Integer read FNoRecorded;
      property OutputResult : TStatistics read FFileStatistics;
      property OutputErrors : TStringList read FErrorList;
      property AllowDuplicateTags : Boolean read FAllowDuplicateTags write FAllowDuplicateTags;
      property FileType : TMartFileType read FFileType write SetFileType;
      property MartImportType : TMartImportType read FMartImportType;
   end;

const
    iMartNames : array [0..0] of string = ('Carnaross Mart');


implementation
uses
   uMartImport, EventRecording, uMartCustomerSupplierLookup,
   Groups, uHerdLookup, uSelectDamID;

const
   MovementReviewConfirmMsg = 'Do you want to review movement event before saving to register?';
{ MartImport }

procedure MartImport.DSBeforePost(Sender: TDataset);
begin
   Sender.FieldByName('tAnimalNo').AsString := StripAllSpaces(Sender.FieldByName('AnimalNo').AsString);
end;

procedure MartImport.DSAnimalNoValidate(Sender: TField);
begin
   if (Sender as TField).AsString <> '' then
      begin
         if DuplicateAnimalNo((Sender as TField).AsString) then
            raise ErrorMsg.CreateFmt('Animal No. already in use',[nil])
         else
            begin
               // Check Dataset For Duplicate AnimalNos.
            end;
      end;
end;

constructor MartImport.Create(AHerdID : Integer);
begin
   FFileType := mftNone;
   FMartImportType := mitUnknown;
   FAllowDuplicateTags := False;
   FillChar(FFileStatistics, 0, SizeOf(TStatistics));
   FErrorList := TStringList.Create;
   FHerdID := AHerdID;
   SetVars;
   FMartTable := TTable.Create(nil);
   FMartTable.DatabaseName := 'kingswd';
   FMartTable.TableName := 'tMart';

   FHealthTable := TTable.Create(nil);
   FHealthTable.DatabaseName := 'kingswd';
   FHealthTable.TableName := 'tMartHealth';

   FAnimalTable := TTable.Create(nil);
   FAnimalTable.DatabaseName := 'kingswd';
   FAnimalTable.TableName := 'animals';
   FAnimalTable.Active := True;

   FBreedTable := TTable.Create(nil);
   FBreedTable.DatabaseName := 'kingswd';
   FBreedTable.TableName := 'breeds';
   FBreedTable.Active := True;

   FParser := TSPParser.Create(nil);

   PrepareNatIDSearch;

   FSourceDetails := TTable.Create(nil);
   FSourceDetails.DatabaseName := 'kingswd';

   if FMartTable.Exists then FMartTable.DeleteTable;

   FMartTable.FieldDefs.Clear;
   FMartTable.FieldDefs.Add('ID',ftAutoInc);
   FMartTable.FieldDefs.Add('AnimalNo',ftString,10);
   FMartTable.FieldDefs.Add('tAnimalNo',ftString,10);
   FMartTable.FieldDefs.Add('TagNo',ftString,20);
   FMartTable.FieldDefs.Add('SearchTagNo',ftString,20);
   FMartTable.FieldDefs.Add('SortTagNo',ftString,20);
   FMartTable.FieldDefs.Add('Sex',ftString,6);
   FMartTable.FieldDefs.Add('BreedCode',ftString,6);
   FMartTable.FieldDefs.Add('ColourCode',ftString,6);
   FMartTable.FieldDefs.Add('DOB',ftDateTime);
   FMartTable.FieldDefs.Add('TBTestDate',ftDateTime);
   FMartTable.FieldDefs.Add('BruceTestDate',ftDateTime);
   FMartTable.FieldDefs.Add('EventDate',ftDateTime);
   FMartTable.FieldDefs.Add('LotNo',ftstring,10);
   FMartTable.FieldDefs.Add('Weight',ftFloat);
   FMartTable.FieldDefs.Add('ColdDeadWt',ftFloat);
   FMartTable.FieldDefs.Add('Price',ftFloat);
   FMartTable.FieldDefs.Add('Commission',ftFloat);
   FMartTable.FieldDefs.Add('Haulage',ftFloat);
   FMartTable.FieldDefs.Add('CustomerSupplier',ftInteger);
   FMartTable.FieldDefs.Add('Death',ftBoolean);
   FMartTable.FieldDefs.Add('CustomerSupplierRefCode',ftstring,20);
   FMartTable.FieldDefs.Add('FeedGrpId',ftInteger);
   FMartTable.FieldDefs.Add('BatchGrpId',ftInteger);
   FMartTable.FieldDefs.Add('PurchGrpId',ftInteger);
   FMartTable.FieldDefs.Add('FQAS',ftBoolean);
   FMartTable.FieldDefs.Add('NoDaysOnPrevHolding',ftInteger);
   FMartTable.FieldDefs.Add('Comment',ftString, 30);
   FMartTable.FieldDefs.Add('HerdID',ftInteger);
   FMartTable.FieldDefs.Add('BuyerID',ftInteger);
   FMartTable.FieldDefs.Add('IsBirth',ftBoolean);
   FMartTable.FieldDefs.Add('DamID',ftInteger);
   FMartTable.FieldDefs.Add('FQASDate',ftDateTime);
   FMartTable.FieldDefs.Add('StillOffFarm',ftBoolean);
   FMartTable.FieldDefs.Add('QualityAssured',ftBoolean);
   FMartTable.FieldDefs.Add('QADays',ftString,10);
   FMartTable.FieldDefs.Add('Grade',ftString,15);

   FMartTable.IndexDefs.Clear;
   FMartTable.IndexDefs.Add('iID', 'ID', [ixPrimary,ixUnique]);
   FMartTable.IndexDefs.Add('iEventDate', 'EventDate', [ixCaseInsensitive]);

   FMartTable.CreateTable;

   if FHealthTable.Exists then FHealthTable.DeleteTable;

   FHealthTable.FieldDefs.Clear;
   FHealthTable.FieldDefs.Add('ID',ftAutoInc);
   FHealthTable.FieldDefs.Add('SearchTagNo',ftString,20);
   FHealthTable.FieldDefs.Add('EventDate',ftDate);
   FHealthTable.FieldDefs.Add('DrugID',ftInteger);
   FHealthTable.FieldDefs.Add('ApplicRate',ftFloat);
   FHealthTable.FieldDefs.Add('DefaultApplicRate',ftFloat);
   FHealthTable.FieldDefs.Add('ApplicRatePerKgs',ftFloat);
   FHealthTable.FieldDefs.Add('Comment',ftString, 30);
   FHealthTable.FieldDefs.Add('UseDrugNameForComment',ftBoolean);
   FHealthTable.FieldDefs.Add('DrugPurchID',ftInteger);
   FHealthTable.FieldDefs.Add('DrugBatchNo',ftString,30);

   FHealthTable.IndexDefs.Clear;
   FHealthTable.IndexDefs.Add('iID', 'ID', [ixPrimary,ixUnique]);
   FHealthTable.IndexDefs.Add('iEventDate', 'EventDate', [ixCaseInsensitive]);
   FHealthTable.IndexDefs.Add('iSearchTagNo', 'SearchTagNo', [ixCaseInsensitive]);

   FHealthTable.CreateTable;
   FHealthTable.Active := True;

   FMartTable.Active := True;

   GetVatInformation(AHerdID);
end;

destructor MartImport.Destroy;
begin
   inherited;

   FMartTable.Close;
   FMartTable.DeleteTable;
   FreeAndNil(FMartTable);

   FHealthTable.Close;
   FHealthTable.DeleteTable;
   FreeAndNil(FHealthTable);

   FAnimalTable.Active := False;
   FreeAndNil(FAnimalTable);

   FSourceDetails.Close;

   FreeAndNil(FSourceDetails);

   FBreedTable.Active := False;
   FreeAndNil(FBreedTable);

   FreeAndNil(FErrorList);
   FreeAndNil(FParser);

    if WinData.Customers.Filtered then // ensure filter is cleared. maybe inuse .
       begin
          WinData.Customers.Filter := '';
          WinData.Customers.Filtered := False;
       end;

end;

function MartImport.GetCarnarossMartFromMovedTo: Integer;
var
   tMovedTo : TTable;
   HerdIdentity : String;
begin
   //   21/05/14 [V5.3 R1.4] /MK Bug - Strip FSourceName to search for HerdIdentity.
   //                                  Error appearing because locate was searching by whole FSourcName.
   HerdIdentity := Copy(FSourceName, 1, 15);
   tMovedTo := TTable.Create(nil);
   with tMovedTo do
      try
         DatabaseName := AliasName;
         TableName := 'MovedTo';
         Open;
         try
            begin
              if ( not(Locate('HerdIdentity',HerdIdentity,[])) ) then
                 try
                    tMovedTo.Append;
                    tMovedTo.Fields[1].Value := HerdIdentity;
                    tMovedTo.Fields[2].Value := FSourceName;
                    tMovedTo.Post;
                    Result := tMovedTo.FieldByName('ID').AsInteger;
                 except
                    on e : Exception do
                       ShowMessage(e.Message);
                 end
              else
                 Result := FieldByName('ID').AsInteger;
            end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure MartImport.Import(AFileName: String; var AAnimalCount : Integer);

   procedure UpdateMartWeightAndCostWithCrushWeight;
   var
      WeighingRecord : PWeighingRecord;
      qLotNos,
      qTotalMartCost_Weight : TQuery;
      TotMartLotCost, TotalCrushWeight : Double;
   begin
      if ( not(FMartTable.Active) ) then
         FMartTable.Active := True;
      if ( not(FAnimalTable.Active) ) then
         FAnimalTable.Active := True;

      // Look through each record in the table to locate the animals crush weight and update
      // weight in the table with the Crush Weight.
      FMartTable.First;
      while ( not(FMartTable.Eof) ) do
         begin
            GetMem(WeighingRecord, SizeOf(TWeighingRecord));
            WeighingRecord.Date := 0;
            WeighingRecord.Weight := 0;
            if ( FAnimalTable.Locate('SearchNatID;InHerd',VarArrayOf([StripAllSpaces(FMartTable.FieldByName('SearchTagNo').AsString),True]),[]) ) then
               WinData.GetWeighingEventDetails(FAnimalTable.FieldByName('ID').AsInteger,FAnimalTable.FieldByName('LactNo').AsInteger,'First',WeighingRecord);
            if ( WeighingRecord.Date > 0 ) and ( WeighingRecord.Weight > 0 ) then
               try
                  FMartTable.Edit;
                  FMartTable.FieldByName('Weight').AsFloat := WeighingRecord.Weight;
                  FMartTable.Post;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            FMartTable.Next;
         end;

      // Now that the mart weight of the animal being purchased has been overwritten by the Crush Weight for the animal
      // calculate the price of the animal based on the TotalMartCost per lot, individual crush weight for the animal and TotalCrushWeight for the lot like uBBPPurchScr does.
      qLotNos := TQuery.Create(nil);
      with qLotNos do
         begin
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Distinct(LotNo)');
            SQL.Add('FROM '+FMartTable.TableName+'');
            try
               Open;
               First;
               while ( not(Eof) ) do
                  begin
                     TotMartLotCost := 0;
                     TotalCrushWeight := 0;
                     qTotalMartCost_Weight := TQuery.Create(nil);
                     with qTotalMartCost_Weight do
                        try
                           DatabaseName := AliasName;
                           SQL.Clear;
                           SQL.Add('SELECT SUM(Weight), SUM(Price)');
                           SQL.Add('FROM '+FMartTable.TableName+'');
                           SQL.Add('WHERE LotNo = "'+qLotNos.FieldByName('LotNo').AsString+'"');
                           try
                              // For each LotNo get the TotalCrushWeight from weights imported from Crush
                              // and get the TotMartLotCost from the Mart file.
                              Open;
                              TotalCrushWeight := qTotalMartCost_Weight.Fields[0].AsFloat;
                              TotMartLotCost := qTotalMartCost_Weight.Fields[1].AsFloat;
                              if VatRegistered then
                                 TotMartLotCost := (Round(( TotMartLotCost * 10000 )/( 100 + VatRate )) / 100 );
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;

                           FMartTable.First;
                           while ( not(FMartTable.Eof) ) do
                              begin
                                 if ( FMartTable.FieldByName('LotNo').AsString = qLotNos.FieldByName('LotNo').AsString ) then
                                    try
                                       FMartTable.Edit;
                                       // Calculate the new price of the animal based on the TotMartLotCost, individual crush weight and TotalCrushWeight like uBBPPurchScr does.
                                       //   09/10/19 [V5.9 R0.8] /MK Change - Don't recalculate the price as ExVat here as price is calculated ExVat before this procedure.
                                       FMartTable.FieldByName('Price').AsFloat := (Round(( TotMartLotCost * FMartTable.FieldByName('Weight').AsFloat * 100 )/( TotalCrushWeight )) / 100 );
                                       FMartTable.Post;
                                    except
                                       on e : Exception do
                                          ShowMessage(e.Message);
                                    end;
                                 FMartTable.Next;
                              end;

                        finally
                           Free;
                        end;
                     Next;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         end;

      qLotNos.Close;
      FreeAndNil(qLotNos);
   end;

begin
   CreateTempMovementOnZeroSalePrice := False;
   if FFileType = mftNone then
      begin
         MessageDlg('Unknown file format ',mtError,[mbOK],0);
         Abort;
      end;

   FErrorList.Clear;
   FErrorList.Add(Format('Filename: %s ',[AFileName]));
   FErrorList.Add(Format('Read Date: %s',[FormatDateTime(cIrishDateStyle, Date)]));
   FErrorList.Add('');

   SetVars;
   FFileName := AFileName;
   case FFileType of
      mftNone : begin end;
      mftXML : begin
                  CreateTempMovementOnZeroSalePrice := True;
                  FMartImportType := ImportFromXML;
               end;
      mftNIMovementIn
      : begin
           FMartImportType := mitPurchase;
           ImportFromNIMovementsIn;
        end;
      mftNIMovementOut
      : begin
           FMartImportType := mitSale;
           ImportFromNIMovementsOut;
        end;
   end;

   //   07/08/14 [V5.3 R4.4] /MK Additional Feature - Add new update routine for Crush users - IAD request.
   if ( Def.Definition.dUseCrush ) and ( WinData.GlobalSettings.UpdateMartWeightWithCrushWeight ) then
      UpdateMartWeightAndCostWithCrushWeight;

   if ( FMartImportType in [mitPurchase, mitSale] ) then
      PostFileDetails
   else
      // After this message the mart file is marked as read in the mail attachments folder so that the user doesn't select an invalid file again.
      MessageDlg('No valid mart file detected. Please select a valid file issued by a recognized mart.',mtInformation,[mbOK],0);

    AAnimalCount := FMartTable.RecordCount;
end;

procedure MartImport.ImportFromNIMovementsIn;
var
   i,
   iStartPos : Integer;
   fNIMovementsIn : TStringList;
   TempStr : string;
   tNatIDNum, Sex : string;
   DefaultBuyer : Integer;
   IsBirth : Boolean;
   sFirstLine : String;
   Animal : TAnimal;
begin
   FParser.Sepchar := ',';

   fNIMovementsIn := TStringList.Create;
   try
      fNIMovementsIn.LoadFromFile(FFileName);
      DefaultBuyer := HerdLookup.DefaultBuyer;

      //   10/03/17 [V5.6 R6.7] /MK Change - Have to determine whether file contains a header line or not.
      sFirstLine := '';
      sFirstLine := UpperCase(fNIMovementsIn.Strings[0]);
      if ( Pos('ANIMAL N',sFirstLine) > 0 ) then
         iStartPos := 1
      else
         iStartPos := 0;
      for i := iStartPos to fNIMovementsIn.Count-1 do
         begin
            if TRIM(fNIMovementsIn.Strings[i]) = '' then Continue;

            IsBirth := false;
            FParser.Parse( fNIMovementsIn.Strings[i] );

            TempStr := RemoveQuotationMarks(FParser.Fields[8]);
            if UPPERCASE(TempStr) = 'BIRTH' then
               begin
                  //FErrorList.Add('Animal Birth: '+FParser.Fields[1]);
                  //Continue;
                  IsBirth := True; // introduced 3.9 3.5 10/09/08
               end;

            FMartTable.Append;

            TempStr := RemoveQuotationMarks(FParser.Fields[1]);
            if TempStr <> '' then
               begin
                  FMartTable.FieldByName('TagNo').AsString := TempStr;
                  if FMartTable.FieldByName('TagNo').AsString <> '' then
                     begin
                        if NatIDKind(FMartTable.FieldByName('TagNo').asString) = nkUK9 then
                           tNatIDNum := UK9NatIDNumber.CreateLocateNatID(FMartTable.FieldByName('TagNo').asString)
                        else
                           begin
                              tNatIDNum := UPPERCASE(StripAllNomNumAlpha(FMartTable.FieldByName('TagNo').asString));
                              StripIrishCountryPrefixFromNatID(tNatIDNum);
                           end;
                        FMartTable.FieldByName('SearchTagNo').AsString := tNatIDNum;
                        FMartTable.FieldByName('SortTagNo').AsString := CreateSortNatIDString(FMartTable.FieldByName('TagNo').asString,0,NIreland);
                     end;
               end;

            //   13/12/19 [V5.9 R1.5] /MK Change - If the animal already exists in the herd then bypass it - John Milliken.
            Animal := GetAnimal(tNatIDNum,True,FHerdID);
            if ( Animal <> nil ) then
               begin
                  FMartTable.Cancel;
                  Continue;
               end;

            FMartTable.FieldByName('IsBirth').AsBoolean := IsBirth;

            TempStr := RemoveQuotationMarks(FParser.Fields[2]);
            if TempStr <> '' then
               begin
                  FMartTable.FieldByName('ColourCode').AsString := TempStr;
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[3]);
            if TempStr <> '' then
               begin
                  FMartTable.FieldByName('BreedCode').AsString := TempStr;
                  AddBreedToTable(TempStr);
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[4]);
            if TempStr <> '' then
               begin
                  Sex := UPPERCASE(Copy(TempStr,1,1))[1];
                  if Sex = 'F' then
                     FMartTable.FieldByName('Sex').AsString := 'Female'
                  else if Sex = 'B' then
                     FMartTable.FieldByName('Sex').AsString := 'Bull'
                  else // 'S' or 'M'
                     FMartTable.FieldByName('Sex').AsString := 'Steer';
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[5]);
            if TempStr <> '' then
               try
                  FMartTable.FieldByName('DOB').AsDateTime := StrToDate(TempStr);
               except
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[6]);
            if TempStr <> '' then
               try
                  FMartTable.FieldByName('EventDate').AsDateTime := StrToDate(TempStr);
               except
               end;

            if ( not FMartTable.FieldByName('IsBirth').AsBoolean ) then
               begin
                  FFileStatistics.NoOfPurchased := FFileStatistics.NoOfPurchased+1;
                  TempStr := RemoveQuotationMarks(FParser.Fields[8]);
                  if TempStr <> '' then
                     try
                        FMartTable.FieldByName('CustomerSupplier').AsInteger :=
                           TfmMartCustomerSupplierLookup.GetID(lkSupplier, TempStr, FMartTable.FieldByName('TagNo').AsString,
                           FMartTable.FieldByName('EventDate').AsDateTime, False);
                        FMartTable.FieldByName('CustomerSupplierRefCode').AsString := TempStr;
                        if fmMartImport <> nil then
                           SendMessage(fmMartImport.Handle, WM_UpdateMartImportScreen, 0, 0);
                     except
                     end;
               end
            else
               FFileStatistics.NoOfCalves := FFileStatistics.NoOfCalves+1;

            // The below fields will only exist in a file that is created by the program when the user hits save
            // after typing these values in the uMartImportByFileReview screen.

            //   16/12/19 [V5.9 R1.5] /MK Change - If a user is reimporting a file then the field count will be more than 9.
            //                                     APHIS made a change to export a 9th field called "Res" which means residency.
            //                                     This field was being imported into the price field - John Milliken.
            // Price
            if ( FParser.Count > 9 ) then
               begin
                  TempStr := RemoveQuotationMarks(FParser.Fields[9]);
                  if TempStr <> '' then
                     try
                        FMartTable.FieldByName('Price').AsFloat := StrToFloat(TempStr);
                     except
                     end;

                  // Weight
                  TempStr := RemoveQuotationMarks(FParser.Fields[10]);
                  if TempStr <> '' then
                     try
                        FMartTable.FieldByName('Weight').AsFloat := StrToFloat(TempStr);
                     except
                     end;

                  // Lot Number
                  TempStr := RemoveQuotationMarks(FParser.Fields[11]);
                  if TempStr <> '' then
                     try
                        FMartTable.FieldByName('LotNo').AsString := TempStr;
                     except
                     end;
               end;

            FMartTable.FieldByName('Haulage').AsFloat := 0;
            FMartTable.FieldByName('Commission').AsFloat := 0;
            FMartTable.FieldByName('HerdID').AsInteger := FHerdID;
            FMartTable.FieldByName('BuyerID').AsInteger := DefaultBuyer;

            // check if animal was born into the herd, if so prompt user for
            // dam national id.

            if FMartTable.FieldByName('IsBirth').AsBoolean then
               begin
                   // introduced 3.9 3.5 10/09/08
                  FMartTable.FieldByName('DamID').AsInteger := TfmSelectDamID.GetDamID(FMartTable.FieldByName('TagNo').AsString);
               end;

            FMartTable.Post;
            Inc(FNoRecorded);
         end;
   finally
      FMartTable.IndexName := 'iEventDate';
      //   13/12/19 [V5.9 R1.5] /MK Change - Show prompt if there are no animals to import because they have already been imported - John Milliken.
      FMartTable.Close;
      FMartTable.Open;
      if ( FMartTable.RecordCount = 0 ) then
         MessageDlg('All animals on the APHIS file have been found in Kingswood.',mtInformation,[mbOK],0)
      else if ( not(TfmMartImportByFileReview.ReviewData(mitPurchase, FHerdID, 'Movements In - Review')) ) then
         Abort;
      FMartTable.Refresh;
      FMartTable.IndexName := 'iEventDate';
      FreeAndNil(fNIMovementsIn);
   end;
end;

procedure MartImport.ImportFromNIMovementsOut;
var
   i : Integer;
   fNIMovementsOut : TStringList;
   TempStr : string;
   tNatIDNum, Sex : string;
begin

   FParser.Sepchar := ',';

   fNIMovementsOut := TStringList.Create;
   try
      fNIMovementsOut.LoadFromFile(FFileName);

      for i := 1 to fNIMovementsOut.Count-1 do // Do not read first line!
         begin

            if TRIM(fNIMovementsOut.Strings[i]) = '' then Continue;

            FParser.Parse( fNIMovementsOut.Strings[i] );

            FMartTable.Append;

            TempStr := RemoveQuotationMarks(FParser.Fields[1]);
            if TempStr <> '' then
               begin
                  FMartTable.FieldByName('TagNo').AsString := TempStr;
                  if FMartTable.FieldByName('TagNo').AsString <> '' then
                     begin
                        if ( NatIDKind(FMartTable.FieldByName('TagNo').asString) = nkUK9 ) then
                           tNatIDNum := UK9NatIDNumber.CreateLocateNatID(FMartTable.FieldByName('TagNo').asString)
                        else
                           begin
                              tNatIDNum := UPPERCASE(StripAllNomNumAlpha(FMartTable.FieldByName('TagNo').asString));
                              StripIrishCountryPrefixFromNatID(tNatIDNum);
                           end;
                        FMartTable.FieldByName('SearchTagNo').AsString := tNatIDNum;
                        FMartTable.FieldByName('SortTagNo').AsString := CreateSortNatIDString(FMartTable.FieldByName('TagNo').asString,0,NIreland);
                     end;
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[2]);
            if TempStr <> '' then
               begin
                  FMartTable.FieldByName('ColourCode').AsString := TempStr;
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[3]);
            if TempStr <> '' then
               begin
                  FMartTable.FieldByName('BreedCode').AsString := TempStr;
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[4]);
            if TempStr <> '' then
               begin
                  Sex := UPPERCASE(Copy(TempStr,1,1))[1];
                  if Sex = 'F' then
                     FMartTable.FieldByName('Sex').AsString := 'Female'
                  else if Sex = 'S' then
                     FMartTable.FieldByName('Sex').AsString := 'Steer'
                  else // 'M' or 'B'
                     FMartTable.FieldByName('Sex').AsString := 'Bull'
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[5]);
            if TempStr <> '' then
               try
                  FMartTable.FieldByName('DOB').AsDateTime := StrToDate(TempStr);
               except
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[6]);
            if TempStr <> '' then
               try
                  FMartTable.FieldByName('EventDate').AsDateTime := StrToDate(TempStr);
               except
               end;

            TempStr := RemoveQuotationMarks(FParser.Fields[8]);
            if TempStr <> '' then
               try
                  FMartTable.FieldByName('Death').AsBoolean := UPPERCASE(TempStr) = 'DEAD';
                  FMartTable.FieldByName('CustomerSupplier').AsInteger :=
                     TfmMartCustomerSupplierLookup.GetID(lkCustomer, TempStr, FMartTable.FieldByName('TagNo').AsString,
                     FMartTable.FieldByName('EventDate').AsDateTime, FMartTable.FieldByName('Death').AsBoolean);
                  FMartTable.FieldByName('CustomerSupplierRefCode').AsString := TempStr;
                  if fmMartImport <> nil then
                     SendMessage(fmMartImport.Handle, WM_UpdateMartImportScreen, 0, 0);
               except
               end;

            if FMartTable.FieldByName('Death').AsBoolean then
               FFileStatistics.NoOfDeaths := FFileStatistics.NoOfDeaths+1
            else
               FFileStatistics.NoOfSales := FFileStatistics.NoOfSales+1;
            FMartTable.Post;
            Inc(FNoRecorded);
         end;
   finally
      FMartTable.IndexName := 'iEventDate';
      if ( not(TfmMartImportByFileReview.ReviewData(mitSale, FHerdID, 'Movements Out - Review')) ) then
         Abort;
      FMartTable.Refresh;
      FMartTable.IndexName := 'iEventDate';
      FreeAndNil(fNIMovementsOut);
   end;
end;

function MartImport.ImportFromXML : TMartImportType;
var
   i : Integer;
   FDOMDocument : IXMLDOMDocument;
   XMLDOMNode : IXMLDOMNode;
   tNatIDNum,
   sSourceName : string;
   Sex : Char;
   ThisNatIDKind : TNatIDKind;

type
   TPurchaseErrorType = (etSex, etDateOfBirth, etBreed);

   procedure CheckXMLFile ( AFileName : String );
   var
      slFile : TStringList;
      i,
      iAmpersandPos : Integer;
      sLine,
      sNewLine : String;
   begin
      slFile := TStringList.Create();
      slFile.LoadFromFile(AFileName);
      for i := 0 to slFile.Count-1 do
         begin
            sLine := slFile.Strings[i];
            iAmpersandPos := Pos('&',sLine);
            if ( iAmpersandPos > 0 ) and ( Copy(sLine,iAmpersandPos,5) <> '&amp;' ) then
               begin
                  sNewLine := Copy(sline,0,iAmpersandPos);
                  sNewLine := sNewLine + 'amp;' + Copy(sLine,iAmpersandPos+1,Length(SLine));
                  slFile.Strings[i] := sNewLine;
               end;
         end;
      slFile.SaveToFile(AFileName);
   end;

   function GetReportPurchaseError (AErrorType : TPurchaseErrorType) : String;
   var
      sErrorField : String;
   begin
      Result := '';
      if ( AErrorType = etSex ) then
         sErrorField := 'Sex'
      else if ( AErrorType = etDateOfBirth ) then
         sErrorField := 'Date of Birth'
      else if ( AErrorType = etBreed ) then
         sErrorField := 'Breed';
      if ( Length(sErrorField) > 0 ) then
         Result := sErrorField+' field on mart file is empty.'+cCRLF+
                   sErrorField+' is required to record the purchase of the animal.';

   end;

begin
   Result := mitUnknown;

   //   11/05/15 [V5.4 R5.6] /MK Bug Fix - Check if file contains strings with '&' (ampersand symbol) and fix the string to contain '&amp:' string instead.
   CheckXMLFile(FFileName);

   FDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   FDOMDocument.async := False;
   FDOMDocument.load(FFileName);

   if ( FDOMDocument.documentElement.childNodes.Get_length > 0 ) then
      begin
         for i := 0 to FDOMDocument.documentElement.childNodes.Get_length-1 do
            begin
               if FDOMDocument.documentElement.childNodes[i].Get_nodeName = 'SourceName' then
                  begin
                     XMLDOMNode := FDOMDocument.documentElement.selectSingleNode('SourceName');
                     if XMLDOMNode = nil then Continue;
                        //   11/05/15 [V5.4 R5.6] /MK Bug Fix - Set new string variable to source name first as "Access Violation" appears if "_" symbol found in XMLDOMNode.Text.
                        sSourceName := XMLDOMNode.text;
                        if sSourceName <> '' then
                           begin
                              //   16/12/19 [V5.9 R1.5] /MK Change - Only copy 40 characters of the Source Name as FarmSync only allows for 40 characters - SP request.
                              FSourceName := Copy( XMLDOMNode.Text, 1, 40);
                           end;
                  end;

               if FDOMDocument.documentElement.childNodes[i].Get_nodeName = 'MovementType' then
                  begin
                     XMLDOMNode := FDOMDocument.documentElement.selectSingleNode('MovementType');
                     if XMLDOMNode = nil then Continue;
                        if XMLDOMNode.text <> '' then
                           begin
                              if XMLDOMNode.Text = '1' then
                                 Result := mitPurchase
                              else if XMLDOMNode.Text = '2' then
                                 Result := mitSale
                           end;
                  end;

               if FDOMDocument.documentElement.childNodes[i].Get_nodeName = 'Animal' then
                  begin
                     if Result = mitPurchase then
                        FFileStatistics.NoOfPurchased := FFileStatistics.NoOfPurchased+1
                     else
                        FFileStatistics.NoOfSales := FFileStatistics.NoOfSales+1;

                     XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('TagNo');
                     //   04/04/18 [V5.7 R8.6] /MK Change - NewLine made a change in 2017 that is only affecting files exporting from the mart recently.
                     //                                     Gerry (Kingswood) agreed with Simon Jones (NewLine) that would check for node name Tag if the node name TagNo does not exist.
                     if XMLDOMNode = nil then
                        XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('Tag');
                     if XMLDOMNode = nil then Continue;
                     if XMLDOMNode.text <> '' then
                        begin
                           FMartTable.Append;
                           FMartTable.FieldByName('TagNo').AsString := XMLDOMNode.text;
                           if FMartTable.FieldByName('TagNo').AsString <> '' then
                              begin
                                 tNatIDNum := UPPERCASE(StripAllNomNumAlpha(FMartTable.FieldByName('TagNo').asString));
                                 //   27/09/17 [V5.7 R3.1] /MK Change - Changes made to allow NI tags to be brought in.
                                 //   17/10/17 [V5.7 R3.9] /MK Change - Some issues found with introduction of NatIDKind, no need for else if ThisNatIDKind <> nkUnknown.
                                 ThisNatIDKind := NatIDKind(FMartTable.FieldByName('TagNo').asString);
                                 //   29/11/17 [V5.7 R5.7] /MK Change - SearchTagNo was not being assigned for UK9 tags.
                                 if ( ThisNatIDKind = nkUK9 ) then
                                    begin
                                       tNatIDNum := UK9NatIDNumber.CreateLocateNatID(FMartTable.FieldByName('TagNo').asString);
                                       FMartTable.FieldByName('SearchTagNo').AsString := tNatIDNum;
                                    end
                                 //   29/11/17 [V5.7 R5.7] /MK Change - Format tag number for UK (non UK9) tags.
                                 else if ( ThisNatIDKind = nkUK ) then
                                    begin
                                       FMartTable.FieldByName('SearchTagNo').AsString := tNatIDNum;
                                       tNatIDNum := Copy(tNatIDNum,3,Length(tNatIDNum)-2);
                                       if ( Length(tNatIDNum) = 12 ) and ( IsNumeric(tNatIDNum) ) then
                                          tNatIDNum := 'UK '+Copy(tNatIDNum,0,6)+' '+Copy(tNatIDNum,7,1)+' '+Copy(tNatIDNum,8,5);
                                       FMartTable.FieldByName('TagNo').AsString := tNatIDNum;
                                    end
                                 else
                                    begin
                                       //   10/05/17 [V5.6 R8.0] /MK Change - NewLine (Mart Software Supplier) emailed enquiring about whether they can pass in the
                                       //                                     tag number without the IE or 372 because when they scan a barcode it doesn't contain IE or 372.
                                       //                                     The change below checks to see whether the number without the IE or 372 (12 digits) is a valid
                                       //                                     IE or 372 based on the formula that Tony (Dept. of Ag) gave us to check what the tag type is.
                                       if ( IsNewIrishNatID(tNatIDNum) ) then
                                          tNatIDNum := StripIrishCountryPrefixFromNatID(tNatIDNum);
                                       if ( Length(tNatIDNum) = 12 ) then
                                          begin
                                             if ( IsIETag(tNatIDNum) ) then
                                                FMartTable.FieldByName('SearchTagNo').AsString := 'IE'+tNatIDNum
                                             else if ( Is372Tag(tNatIDNum) ) then
                                                FMartTable.FieldByName('SearchTagNo').AsString := '372'+tNatIDNum
                                             else
                                                FMartTable.FieldByName('SearchTagNo').AsString := tNatIDNum;
                                          end
                                       else
                                          FMartTable.FieldByName('SearchTagNo').AsString := tNatIDNum;

                                       //   19/09/17 [V5.7 R2.6] /MK Bug Fix - TagNo field was never set back to formatted tag i.e. IE or 372, after NewLine change 10/05/17.
                                       FMartTable.FieldByName('TagNo').AsString := FMartTable.FieldByName('SearchTagNo').AsString;
                                    end;
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('Sex');
                           if XMLDOMNode <> nil then
                              begin
                                 //   12/05/15 [V5.4 R5.6] /MK Additional Feature - If the file is a sale file then allow for blank sex, breed and dob on the file.
                                 //                                               - If the file is a purchase file then show the appropriate field error and exit sequence.
                                 if ( Length(XMLDOMNode.text) > 0 ) then
                                    begin
                                       Sex := UPPERCASE(Copy(XMLDOMNode.text,1,1))[1];
                                       if Sex = 'F' then
                                          FMartTable.FieldByName('Sex').AsString := 'Female'
                                       else if Sex = 'S' then
                                          FMartTable.FieldByName('Sex').AsString := 'Steer'
                                       else // 'M' or 'B'
                                          FMartTable.FieldByName('Sex').AsString := 'Bull'
                                    end
                                 else
                                    begin
                                       if ( Result = mitPurchase ) then
                                          begin
                                             Result := mitUnknown;
                                             MessageDlg(GetReportPurchaseError(etSex),mtError,[mbOK],0);
                                             Exit;
                                          end;
                                    end;
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('BreedCode');
                           if XMLDOMNode <> nil then
                              begin
                                 //   12/05/15 [V5.4 R5.6] /MK Additional Feature - If the file is a sale file then allow for blank sex, breed and dob on the file.
                                 //                                               - If the file is a purchase file then show the appropriate field error and exit sequence.
                                 if ( Length(XMLDOMNode.text) > 0 ) then
                                    begin
                                       FMartTable.FieldByName('BreedCode').AsString := XMLDOMNode.text;
                                       AddBreedToTable(XMLDOMNode.text);
                                    end;
                                 //   30/07/18 [V5.8 R2.1] /MK Change - Removed this check as program now will force the review of the mart file if there are blank breeds.
                                 //                                     The review screen will not close unless the breeds are filled in.
                                 {
                                 else
                                    begin
                                       if ( Result = mitPurchase ) then
                                          begin
                                             Result := mitUnknown;
                                             MessageDlg(GetReportPurchaseError(etBreed),mtError,[mbOK],0);
                                             Break;
                                          end;
                                    end;
                                 }
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('DOB');
                           if XMLDOMNode <> nil then
                              begin
                                 //   12/05/15 [V5.4 R5.6] /MK Additional Feature - If the file is a sale file then allow for blank sex, breed and dob on the file.
                                 //                                               - If the file is a purchase file then show the appropriate field error and exit sequence.
                                 if ( Length(XMLDOMNode.text) > 0 ) then
                                    FMartTable.FieldByName('DOB').AsDateTime := StrToDate(XMLDOMNode.text)
                                 else
                                    begin
                                       if ( Result = mitPurchase ) then
                                          begin
                                             Result := mitUnknown;
                                             MessageDlg(GetReportPurchaseError(etDateOfBirth),mtError,[mbOK],0);
                                             Break;
                                          end;
                                    end;
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('TBTestDate');
                           if XMLDOMNode <> nil then
                              begin
                                 if XMLDOMNode.text <> '' then
                                    try
                                       FMartTable.FieldByName('TBTestDate').AsDateTime := StrToDate(XMLDOMNode.text);
                                    except
                                    end;
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('BruceTestDate');
                           if XMLDOMNode <> nil then
                              begin
                                 if XMLDOMNode.text <> '' then
                                    try
                                       FMartTable.FieldByName('BruceTestDate').AsDateTime := StrToDate(XMLDOMNode.text);
                                    except
                                    end;
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('EventDate');
                           if XMLDOMNode <> nil then
                              begin
                                 if XMLDOMNode.text <> '' then
                                    try
                                       FMartTable.FieldByName('EventDate').AsDateTime := StrToDate(XMLDOMNode.text);
                                    except
                                    end;
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('lotNumber');
                           if XMLDOMNode <> nil then
                              begin
                                 FMartTable.FieldByName('LotNo').AsString := XMLDOMNode.text
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('Weight');
                           if XMLDOMNode <> nil then
                              begin
                                 try
                                    FMartTable.FieldByName('Weight').AsFloat := StrToFloat(XMLDOMNode.text);
                                 except
                                 end;
                                 FFileStatistics.TotalWeightRead := FFileStatistics.TotalWeightRead+FMartTable.FieldByName('Weight').AsFloat;
                              end;

                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('Price');
                           if XMLDOMNode <> nil then
                              begin
                                 try
                                    // Don't recalc price as ExVat here if "Crush user and UpdateMartWeight pref" is on as ExVat calc then has to be on TotalMartCost of Lot.
                                    if ( Def.Definition.dUseCrush ) and ( WinData.GlobalSettings.UpdateMartWeightWithCrushWeight ) then
                                       FMartTable.FieldByName('Price').AsFloat := StrToFloat(XMLDOMNode.text)
                                    else
                                       begin
                                          if ( VATRegistered ) and ( VATRate > 0 ) then
                                             begin
                                                Value := StrToFloat(XMLDOMNode.text);
                                                PriceLessVAT := (Round((Value*10000)/(100+VATRate)))/100;
                                                FMartTable.FieldByName('Price').AsFloat := PriceLessVAT;
                                             end
                                          else
                                             FMartTable.FieldByName('Price').AsFloat := StrToFloat(XMLDOMNode.text);
                                       end;
                                 except
                                 end;
                                 FFileStatistics.TotalPriceRead := FFileStatistics.TotalPriceRead+FMartTable.FieldByName('Price').AsFloat;
                              end;

                           //   18/03/21 [V5.9 R9.5] /MK Change - Default the QualityAssured field to False so that if the QA field is not found at least the box is unticked.
                           FMartTable.FieldByName('QualityAssured').AsBoolean := False;
                           //   17/10/17 [V5.7 R3.9] /MK Additional Feature - Added check for new IE Quality Assurance field from NewLine.
                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('QA');
                           if XMLDOMNode <> nil then
                              begin
                                 try
                                    FMartTable.FieldByName('QualityAssured').AsBoolean := ( UpperCase(XMLDOMNode.text) = 'Y' );
                                 except
                                 end;
                              end;

                           //   03/12/19 [V5.9 R1.4] /MK Additional Feature - Added import of QADays node to new QADays field.
                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('QADays');
                           if XMLDOMNode <> nil then
                              begin
                                 try
                                    FMartTable.FieldByName('QADays').AsString := XMLDOMNode.text;
                                 except
                                 end;
                              end;

                           FMartTable.Post;
                           Inc(FNoRecorded);
                        end
                     else
                        begin

                        end;
                  end;
            end;
      end;
end;

procedure MartImport.PostFileDetails;
var
   i : Integer;
   DrugArray : TIntegerArray;
   bBlankBreeds : Boolean;

   procedure UpdateFMartTableSourceID;
   var
      fCommission,
      fTransport : Double;
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            fCommission := 0;
            fTransport := 0;

            //   04/02/19 [V5.8 R6.6] /MK Additional Feature - Store the Commission/Deductions and Transport from Customer/Supplier in relevant fields of FMartTable.
            if ( FMartImportType = mitPurchase ) then
               begin
                  if ( WinData.Suppliers.Locate('ID',FSourceID,[]) ) then
                     begin
                        fCommission := WinData.Suppliers.FieldByName('Commission').AsFloat;
                        fTransport := WinData.Suppliers.FieldByName('Transport').AsFloat;
                     end;
               end
            else if ( FMartImportType = mitSale ) then
               begin
                  if ( WinData.Customers.Locate('ID',FSourceID,[]) ) then
                     begin
                        fCommission := WinData.Customers.FieldByName('Deductions').AsFloat;
                        fTransport := WinData.Customers.FieldByName('Transport').AsFloat;
                     end;
               end;

            SQL.Clear;
            SQL.Add('UPDATE '+FMartTable.TableName+'');
            SQL.Add('SET CustomerSupplier = :FSourceID,');
            SQL.Add('    Commission = :Commission,');
            SQL.Add('    Haulage = :Transport');
            Params[0].AsInteger := FSourceID;
            Params[1].AsFloat := fCommission;
            Params[2].AsFloat := fTransport;
            try
               ExecSQL;
            except
            end;
         finally
            Close;
            Free;
         end;
   end;

begin
   //   13/12/19 [V5.9 R1.5] /MK Change - Exit if there are no animals in FMartTable.
   if ( FMartTable.RecordCount = 0 ) then Exit;

   if FFileType = mftXML then
      begin
         if FSourceName = '' then
            begin
               MessageDlg('Source name not defined.',mtError,[mbOK],0);
               Exit;
            end;

         if ( FMartImportType = mitPurchase ) then
            begin
               FSourceDetails.TableName := 'SuppliersBreeders';
               FSourceDetails.Active := True;
               try
                  if not FSourceDetails.Locate('Name', FSourceName,[]) then
                     begin
                        FSourceDetails.Append;
                        FSourceDetails.FieldByName('Name').AsString := FSourceName;
                        FSourceDetails.FieldByName('AnimalSupplier').AsBoolean := True;
                        FSourceDetails.Post;
                     end;
                  FSourceID := FSourceDetails.FieldByName('ID').AsInteger;
               finally
                  FSourceDetails.Active := False;
               end;

               UpdateFMartTableSourceID;
               bBlankBreeds := WinData.MartFileHasBlankBreeds;
               //   31/07/18 [V5.8 R2.1] /MK Change - Review screen will appear if (preference is ticked) or (there are blank breeds and its a purchase file).
               if ( WinData.GlobalSettings.ReviewMartFiles ) or ( bBlankBreeds ) then
                  begin
                     FMartTable.IndexName := 'iEventDate';
                     //   31/07/18 [V5.8 R2.1] /MK Change - If (purchase file) and (there are blank breeds) then don't prompt to review the file, just review the file.
                     if ( bBlankBreeds ) or ( MessageDlg(MovementReviewConfirmMsg,mtConfirmation,[mbYes,mbNo],0) = idYes ) then
                        begin
                           if ( not(TfmMartImportByFileReview.ReviewData(mitPurchase, FHerdID, 'Movements In - Review')) ) then
                              begin
                                 MessageDlg('Import cancelled.'+cCRLF+
                                            'Click cancel again to import another file.',mtInformation,[mbOK],0);
                                 Abort;
                              end;
                           FMartTable.Refresh;
                        end;
                     FMartTable.IndexName := 'iEventDate';
                  end;

               with GetQuery do
                  try
                     SQL.Add('SELECT Distinct(DrugID)');
                     SQL.Add('FROM '+FHealthTable.TableName+'');
                     SQL.Add('WHERE DrugID > 0');
                     try
                        Open;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                     First;
                     SetLength(DrugArray,0);
                     if ( RecordCount > 0 ) then
                        while ( not(Eof) ) do
                           begin
                              SetLength(DrugArray, Length(DrugArray)+1);
                              DrugArray[Length(DrugArray)-1] := Fields[0].AsInteger;
                              Next;
                           end;

                     if ( Length(DrugArray) > 0 ) then
                        begin
                           for i := 0 to Length(DrugArray)-1 do
                              begin
                                 Close;
                                 SQL.Clear;
                                 SQL.Add('SELECT Name');
                                 SQL.Add('FROM Medicine');
                                 SQL.Add('WHERE ID = '+IntToStr(DrugArray[i])+'');
                                 try
                                    Open;
                                 except
                                    on e : Exception do
                                       ShowMessage(e.Message);
                                 end;
                                 First;
                                 if ( MessageDlg(Format('Do you want to enter batch number for drug %s ?',[Fields[0].AsString]),mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                                    TfmMovementInHealthBatchNo.SaveBatchNo(DrugArray[i]);
                              end;
                        end;
                  finally
                     Free;
                  end;

               PostPurchases;
            end
         else
            begin
               FSourceDetails.TableName := 'Customers';
               FSourceDetails.Active := True;
               try
                  if ( not(FSourceDetails.Locate('Name', FSourceName,[])) ) then
                     begin
                        FSourceDetails.Append;
                        FSourceDetails.FieldByName('Name').AsString := FSourceName;
                        FSourceDetails.Post;
                     end;
                  FSourceID := FSourceDetails.FieldByName('ID').AsInteger;
               finally
                  FSourceDetails.Active := False;
               end;

               //   04/02/19 [V5.8 R6.6] /MK Change - As in Purchase file, always MartTableSourceID field, not just if reviewing mart file.
               UpdateFMartTableSourceID;
               if ( WinData.GlobalSettings.ReviewMartFiles ) then
                  begin
                     FMartTable.IndexName := 'iEventDate';
                     if ( MessageDlg(MovementReviewConfirmMsg,mtConfirmation,[mbYes,mbNo],0) = idYes ) then
                        begin
                           if ( not(TfmMartImportByFileReview.ReviewData(mitSale, FHerdID, 'Movements Out - Review')) ) then
                              begin
                                 MessageDlg('Import cancelled.'+cCRLF+
                                            'Click cancel again to import another file.',mtInformation,[mbOK],0);
                                 Abort;
                              end;
                           FMartTable.Refresh;
                        end;
                     FMartTable.IndexName := 'iEventDate';
                  end;
               PostSales;
            end;
      end
   else if FFileType = mftNIMovementIn then
      begin
         PostPurchases;
      end
   else if FFileType = mftNIMovementOut then
      begin
         PostSales;
      end;
end;

procedure MartImport.PostPurchases;
var
   LookupColours, LookupBreeds : TTable;
   BuyerID : Integer;
   sAnimalRecNatID,
   HealthFilter : String;
   iAnimalRecID,
   iAnimalRecHerdId,
   iAnimalRecLactNo,
   ExistPurchID : Integer;
   Animal : TAnimal;
   dAnimalSaleDate : TDateTime;

   function BuyersExistInFMartTable : Boolean;
   begin
      Result := False;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Count(ID)');
            SQL.Add('FROM '+FMartTable.TableName+'');
            SQL.Add('WHERE BuyerID > 0');
            Open;
            try
               First;
               Result := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

   //   11/09/12 [V5.0 R9.9] /MK Change - Added to allow re-use of Add Animal code.
   procedure AddAnimalRecord;
   var
      AnimalRecord : TAnimalRecord;
      sNatID : String;
   begin
      sAnimalRecNatID := '';
      iAnimalRecID := 0;
      iAnimalRecHerdId := 0;
      iAnimalRecLactNo := 0;
      try
         AnimalRecord := TAnimalRecord.Create;
         AnimalRecord.AllowDuplicateTags := FAllowDuplicateTags;
         AnimalRecord.RaiseExceptions := False;
         AnimalRecord.Add;
         with FMartTable do
            try
               AnimalRecord.HerdID := FHerdID;
               AnimalRecord.AnimalNo := FieldByName('AnimalNo').AsString;
               AnimalRecord.NatIDNum := FieldByName('TagNo').AsString;
               AnimalRecord.DateOfBirth := FieldByName('DOB').AsDateTime;
               AnimalRecord.Sex := FieldByName('Sex').AsString;
               AnimalRecord.LactNo := 0;
               AnimalRecord.InHerd := True;
               AnimalRecord.Breeding := False;
               if FMartTable.FieldByName('DamID').AsInteger > 0 then
                  AnimalRecord.DamID  := FMartTable.FieldByName('DamID').AsInteger
               else
                  AnimalRecord.DamID  := 0;
               AnimalRecord.SireID := 0;
               if FieldByName('TBTestDate').AsDateTime > 0 then
                  AnimalRecord.TBTestDate := FieldByName('TBTestDate').AsDateTime;
               if FieldByName('BruceTestDate').AsDateTime > 0 then
                  AnimalRecord.Brucellosis := FieldByName('BruceTestDate').AsDateTime;
               AnimalRecord.AnimalDeleted := False;

               if LookupBreeds.Locate('Code', FieldByName('BreedCode').AsString,[loCaseInsensitive]) then
                  AnimalRecord.PrimaryBreed := LookupBreeds.FieldByName('ID').AsInteger;

               //   06/02/18 [V5.7 R7.9] /MK Change - Only validate colour if the colour exists - colour is not on Mart File but is on APHIS file - John Milliken.
               AnimalRecord.ValidateColour := ( Length(FieldByName('ColourCode').AsString) > 0 );
               //   30/01/18 [V5.7 R7.6] /MK Bug Fix - Only create a colour if the ColourCode is on the file, don't create blank colours - John Milliken. 
               if ( Length(FieldByName('ColourCode').AsString) > 0 ) then
                  begin
                     if LookupColours.Locate('LookupCode', FieldByName('ColourCode').AsString,[loCaseInsensitive]) then
                        AnimalRecord.Colour := LookupColours.FieldByName('ID').AsInteger
                     else
                        begin
                           LookupColours.Append;
                           try
                              LookupColours.FieldByName('ListType').AsInteger := LAnimalColour;
                              LookupColours.FieldByName('UserCanDelete').AsBoolean := True;
                              LookupColours.FieldByName('LookupCode').AsString := FieldByName('ColourCode').AsString;
                              LookupColours.FieldByName('Description').AsString := FieldByName('ColourCode').AsString;
                              LookupColours.Post;
                              AnimalRecord.Colour := LookupColours.FieldByName('ID').AsInteger;
                           except
                              LookupColours.Cancel;
                              AnimalRecord.Colour := 0;
                           end;
                        end;
                  end;

               if FieldByName('FQASDate').AsDateTime > 0 then
                  AnimalRecord.QADate := FieldByName('FQASDate').AsDateTime;

               AnimalRecord.BordBiaQAStatus := FieldByName('QualityAssured').AsBoolean;

               //   03/12/19 [V5.9 R1.4] /MK Additional Feature - Assign TAnimalRecord.QANoMovements file value from new QADays field.
               AnimalRecord.QANoMovements := FieldByName('QADays').AsString;

               FAnimalSaved := AnimalRecord.Save;

               iAnimalRecID := AnimalRecord.ID;
               iAnimalRecLactNo := AnimalRecord.LactNo;
               iAnimalRecHerdId := AnimalRecord.HerdID;
               sAnimalRecNatID := AnimalRecord.NatIDNum;

               if FieldByName('IsBirth').AsBoolean then
                  FFileStatistics.NoOfCalvesSaved := FFileStatistics.NoOfCalvesSaved+1
            except
               on E : Exception do
                  begin
                     AnimalRecord.Cancel;
                     if E is NatIDException then
                        FErrorList.Add(FieldByName('TagNo').AsString + ' - National ID already in use');
                  end;
            end;
      finally
         FreeAndNil(AnimalRecord);
      end;
   end;

   //   11/09/12 [V5.0 R9.9] /MK Change - Added to allow re-use of Add Purchase/Health code.
   procedure PostPurchaseAndHealth(AAnimalID, ALactNo, AHerdID, ABuyerID : Integer; ANatIDNum : String;
      const APurchaseEventID : Integer = 0);
   var
      FQASDate : TDate;
      PurchaseEvent : TPurchaseEvent;
      HealthEvent : THealthEvent;
   begin
      if ( not(FMartTable.FieldByName('IsBirth').AsBoolean) ) and ( FAnimalSaved ) then
         begin
            if ( APurchaseEventID = 0 ) then
               begin
                  PurchaseEvent := TPurchaseEvent.Create('MartPurch');
                  try
                     PurchaseEvent.Append;
                     PurchaseEvent.EventType := TPurchase;
                     PurchaseEvent.AnimalID := AAnimalID;
                     PurchaseEvent.EventDate := FMartTable.FieldByName('EventDate').AsDateTime;
                     PurchaseEvent.AnimalLactNo := ALactNo;
                     PurchaseEvent.AnimalHerdID := AHerdID;

                     if (TRIM(FMartTable.FieldByName('Comment').AsString) <> '') then
                        PurchaseEvent.EventComment := FMartTable.FieldByName('Comment').AsString
                     //   20/06/13 [V5.1 R7.5] /MK Additional Feature - Check if GlobalSettings.MartSaveCommentAsSourceName then
                     //                                                 change Event Comment to Supplier Name.
                     else if ( WinData.GlobalSettings.MartSaveCommentAsSourceName ) then
                        begin
                           if ( WinData.Suppliers.Locate('ID',FSourceID,[]) ) then
                              PurchaseEvent.EventComment := WinData.SuppliersName.AsString
                           else
                              PurchaseEvent.EventComment := 'Purchase';
                        end
                     else
                        PurchaseEvent.EventComment := 'Purchase';

                     PurchaseEvent.Grade := FMartTable.FieldByName('Grade').AsString;

                     PurchaseEvent.EventSource := sMART;

                     if FFileType in ([mftNIMovementIn,mftNIMovementOut]) then
                        begin
                           if FMartTable.FieldByName('CustomerSupplier').AsInteger > 0 then
                              PurchaseEvent.Supplier := FMartTable.FieldByName('CustomerSupplier').AsInteger
                           else
                              begin
                                 FErrorList.Add(Format('%s - Missing Customer "%s" in Purchase Event on %s',
                                                       [FMartTable.FieldByName('TagNo').AsString,
                                                        FMartTable.FieldByName('CustomerSupplierRefCode').AsString,
                                                        FormatDateTime(cIrishDateStyle,FMartTable.FieldByName('EventDate').AsDateTime)]));
                              end;
                        end
                     else
                        PurchaseEvent.Supplier := FMartTable.FieldByName('CustomerSupplier').AsInteger;

                     if ABuyerID > 0 then
                        begin
                           PurchaseEvent.Buyer := ABuyerID;
                           //   04/02/19 [V5.8 R6.6] /MK Additional Feature - Take the buyers costs from the buyers table and store in relevant Purchase table field.
                           if ( WinData.Buyers.Locate('ID',ABuyerID,[]) ) then
                              if ( WinData.Buyers.FieldByName('Commission').AsFloat > 0 ) then
                                 PurchaseEvent.BuyerCosts := WinData.Buyers.FieldByName('Commission').AsFloat;
                        end;

                     //   11/06/13 [V5.1 R7.3] /MK Bug Fix - FMartTable not in Edit Mode to store price change.
                     //   03/11/11 [V5.0 R1.7] /MK Additional Feature - Add VatCalculation On Price From Purchase File.
                     //   25/09/14 [V5.3 R6.4] /MK Bug Fix - If Crush user then don't recalculate Vat again.
                     //if ( (VATRegistered) and (VATRate > 0) and (not(Def.Definition.dUseCrush)) ) then
                     PurchaseEvent.Price := FMartTable.FieldByName('Price').AsFloat;

                     PurchaseEvent.Weight := FMartTable.FieldByName('Weight').AsFloat;
                     PurchaseEvent.LotNumber := FMartTable.FieldByName('LotNo').AsString;

                     //   16/12/13 [V5.2 R7.0] /MK Additional Feature - FQAS Days replaced by AnimalFQAS date.
                     //   18/06/14 [V5.3 R2.8] /MK Change - Brought back FQAS Days - Request by TGM/GL.
                     PurchaseEvent.FQASDays := FMartTable.FieldByName('NoDaysOnPrevHolding').AsInteger;

                     PurchaseEvent.Commission := FMartTable.FieldByName('Commission').AsFloat;
                     PurchaseEvent.Haulage := FMartTable.FieldByName('Haulage').AsFloat;
                     PurchaseEvent.SupplierCosts := FMartTable.FieldByName('Commission').AsFloat+FMartTable.FieldByName('Haulage').AsFloat;
                     PurchaseEvent.Buyer := ABuyerID;
                     try
                        PurchaseEvent.Post;
                     except
                        PurchaseEvent.Cancel;
                     end;
                  finally
                     FreeAndNil(PurchaseEvent);
                     //   18/06/14 [V5.3 R2.8] /MK Change - Save QADate to animals table & animals.QualityAssured if ( FQASDate <= Date ).
                     FQASDate := 0;
                     if ( FMartTable.FieldByName('NoDaysOnPrevHolding').AsInteger > 0 ) then
                        begin
                           FQASDate := Trunc(FMartTable.FieldByName('EventDate').AsDateTime + FMartTable.FieldByName('NoDaysOnPrevHolding').AsInteger);
                           with GetQuery do
                              try
                                 if ( GetQuery.Active ) then
                                    GetQuery.Close;
                                 SQL.Clear;
                                 SQL.Add('UPDATE Animals');
                                 SQL.Add('SET QADate = :QADate,');
                                 SQL.Add('    QualityAssured = :QualityAssured');
                                 SQl.Add('WHERE ID = :AnimalID');
                                 Params[0].AsDate := FQASDate;
                                 Params[1].AsBoolean := ( FQASDate <= Date );
                                 Params[2].AsInteger := AAnimalID;
                                 try
                                    ExecSQL;
                                 except
                                    on e : Exception do
                                       ShowMessage(e.Message);
                                 end;
                              finally
                                 Free;
                              end;
                        end;
                  end;

                  FFileStatistics.NoOfPurchasedSaved := FFileStatistics.NoOfPurchasedSaved+1;

                  // update EventLookupData;
                  WinData.AddToEventLookupData( AAnimalID, cPurchaseEvent);

                  if ( Def.Definition.dUseCrush ) then
                     begin
                        with TCrushXMLExport.Create do
                           try
                              with FPurchaseAnimal do
                                 begin
                                    AnimalID := AAnimalID;
                                    Animal := GetAnimal(AAnimalID);
                                    if ( Animal <> nil ) then
                                       NatIDNum := Animal.NatIdNum;
                                    SupplierID := FMartTable.FieldByName('CustomerSupplier').AsInteger;
                                    PurBuyer := ABuyerID;
                                    EventDate := FMartTable.FieldByName('EventDate').AsDateTime;
                                    AnimalWeight := FMartTable.FieldByName('Weight').AsFloat;
                                    AnimalPrice := FMartTable.FieldByName('Price').AsFloat;
                                    TBTestDate := FMartTable.FieldByName('TBTestDate').AsDateTime;
                                    BruTestDate := FMartTable.FieldByName('BruceTestDate').AsDateTime;
                                 end;
                              if ( IsValidEvent(etPurchase) ) then
                                 begin
                                    CreateorOpenXMLFile(etPurchase);
                                    AddAnimalToXMLFile(etPurchase);
                                 end;
                           finally
                              Free
                           end;
                     end;

                  FFileStatistics.TotalWeightSaved := FFileStatistics.TotalWeightSaved+FMartTable.FieldByName('Weight').AsFloat;
                  FFileStatistics.TotalPriceSaved := FFileStatistics.TotalPriceSaved+FMartTable.FieldByName('Price').AsFloat;

                  // Setup Feed Group
                  if ( FMartTable.FieldByName('FeedGrpID').AsInteger > 0 ) then
                     begin
                        WinData.GroupManager.AddToGroup(AAnimalID, FMartTable.FieldByName('FeedGrpID').AsInteger, False, FMartTable.FieldByName('EventDate').AsDateTime, ANatIDNum);
                        WinData.FeedManager.CreateFeedsForAnimal(AAnimalID, FMartTable.FieldByName('FeedGrpID').AsInteger, FMartTable.FieldByName('EventDate').AsDateTime);
                        WinData.AddToEventLookupData( AAnimalID, cFeedingEvent);
                     end;
                  // Setup Batch Group
                  if ( FMartTable.FieldByName('BatchGrpID').AsInteger > 0 ) then
                     WinData.GroupManager.AddToGroup(AAnimalID, FMartTable.FieldByName('BatchGrpID').AsInteger, False, FMartTable.FieldByName('EventDate').AsDateTime, ANatIDNum);
                  // Setup Purchase Group
                  if ( FMartTable.FieldByName('PurchGrpID').AsInteger > 0 ) then
                     WinData.GroupManager.AddToGroup(AAnimalID, FMartTable.FieldByName('PurchGrpID').AsInteger, False, FMartTable.FieldByName('EventDate').AsDateTime, ANatIDNum);

                  // Setup Health Events.
                  HealthFilter := FMartTable.FieldByName('SearchTagNo').AsString;
                  FHealthTable.Filter := 'SearchTagNo = ''' +HealthFilter+'''' ;
                  FHealthTable.Filtered := True;
                  try
                     if FHealthTable.RecordCount > 0 then
                        begin
                           if FHealthTable.FindFirst then
                              repeat
                                  HealthEvent := THealthEvent.Create('MartHealth');
                                  try
                                     HealthEvent.Append;
                                     HealthEvent.AnimalID     := AAnimalID;
                                     HealthEvent.AnimalLactNo := ALactNo;
                                     HealthEvent.AnimalHerdID := AHerdID;
                                     HealthEvent.EventDate    := FHealthTable.FieldByName('EventDate').AsDateTime;
                                     HealthEvent.EventComment := FHealthTable.FieldByName('Comment').AsString;
                                     { Sub details }
                                     HealthEvent.DrugUsed    := FHealthTable.FieldByName('DrugID').AsInteger;
                                     HealthEvent.DryOffEvent := False;
                                     HealthEvent.NoDays      := 1;
                                     HealthEvent.NoTimes     := 1;
                                     //   05/04/16 [V5.5 R4.8] /MK Bug Fix - Quantity was used here instead of RateApplic.
                                     HealthEvent.RateApplic  := FHealthTable.FieldByName('ApplicRate').AsFloat;
                                     HealthEvent.DrugCost := WinData.CalcDrugCost(FHealthTable.FieldByName('DrugID').AsInteger,FHealthTable.FieldByName('ApplicRate').AsFloat);
                                     //   28/08/13 [V5.2 R0.2] /MK Change - Added Manual Comment Boolean.
                                     HealthEvent.ManualComment := False;
                                     HealthEvent.DrugPurchID := FHealthTable.FieldByName('DrugPurchID').AsInteger;
                                     HealthEvent.DrugBatchNo := FHealthTable.FieldByName('DrugBatchNo').AsString;
                                     try
                                        HealthEvent.Post;
                                     except
                                        HealthEvent.Cancel;
                                     end;
                                  finally
                                     FreeAndNil(HealthEvent);
                                  end;

                              until
                                 not FHealthTable.FindNext;
                        end;
                  finally
                     FHealthTable.Filter := '';
                     FHealthTable.Filtered := False;
                  end;
               end
            else
               begin
                   //   30/01/18 [V5.7 R7.6] /MK Bug Fix - Only update purchase details where price and weight is on the mart file or entered by the user (APHIS).
                   if ( FMartTable.FieldByName('Price').AsFloat > 0 ) and ( FMartTable.FieldByName('Weight').AsFloat > 0 ) then
                      with GetQuery do
                         try
                            if ( GetQuery.Active ) then
                               GetQuery.Close;
                            SQL.Clear;
                            SQL.Add('UPDATE Purchases');
                            SQL.Add('SET Supplier = :PurchaseSupplier,');
                            SQL.Add('    Price = :PurchasePrice,');
                            SQL.Add('    Weight = :PurchaseWeight,');
                            SQL.Add('    LotNumber = :PurchaseLotNo,');
                            SQL.Add('    FQASDays = :PurchaseFQASDays,');
                            SQL.Add('    Commission = :PurchaseCommission,');
                            SQL.Add('    Haulage = :PurchaseHaulage,');
                            SQL.Add('    SupplierCosts = :PurchaseSupplierCosts,');
                            SQL.Add('    Buyer = :PurchaseBuyer,');
                            //   04/02/19 [V5.8 R6.6] /MK Additional Feature - When updating a purchase record add buyercosts.
                            SQL.Add('    BuyerCosts = :BuyerCosts');
                            SQL.Add('WHERE EventID = :AEventID');
                            Params[0].AsInteger := FMartTable.FieldByName('CustomerSupplier').AsInteger;
                            Params[1].AsFloat := FMartTable.FieldByName('Price').AsFloat;
                            Params[2].AsFloat := FMartTable.FieldByName('Weight').AsFloat;
                            Params[3].AsString := FMartTable.FieldByName('LotNo').AsString;
                            Params[4].AsInteger := FMartTable.FieldByName('NoDaysOnPrevHolding').AsInteger;
                            Params[5].AsFloat := FMartTable.FieldByName('Commission').AsFloat;
                            Params[6].AsFloat := FMartTable.FieldByName('Haulage').AsFloat;
                            Params[7].AsFloat := FMartTable.FieldByName('Commission').AsFloat+FMartTable.FieldByName('Haulage').AsFloat;
                            Params[8].AsInteger := ABuyerID;
                            if ( WinData.Buyers.Locate('ID',ABuyerID,[]) ) then
                               Params[9].AsFloat := WinData.Buyers.FieldByName('Commission').AsFloat
                            else
                               Params[9].AsFloat := 0;
                            Params[10].AsInteger := APurchaseEventID;
                            ExecSQL;
                            FFileStatistics.NoOfPurchasedSaved := FFileStatistics.NoOfPurchasedSaved+1;
                            FFileStatistics.TotalWeightSaved := FFileStatistics.TotalWeightSaved+FMartTable.FieldByName('Weight').AsFloat;
                            FFileStatistics.TotalPriceSaved := FFileStatistics.TotalPriceSaved+FMartTable.FieldByName('Price').AsFloat;
                         finally
                            Free;
                         end;
               end;
         end;
   end;

   procedure UpdateAnimalColour ( AAnimalID, AColour : Integer );
   begin
      if ( AAnimalID = 0 ) or ( AColour = 0 ) then Exit;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE Animals');
            SQL.Add('SET Colour = :AColour,');
            SQL.Add('    IsSynchronized = False');
            SQL.Add('WHERE ID = :AAnimalID');
            Params[0].AsInteger := AColour;
            Params[1].AsInteger := AAnimalID;
            ExecSQL;
         finally
            Free;
         end;
   end;

begin
   try
      //   10/03/17 [V5.6 R6.7] /MK Additional Feature - Store some of the records from the FMartTable into a file that can be read in again if the program fails to save the data.
      SaveMartTableDetail;

      BuyerID := 0;

      if FFileType = mftXML then
         begin
            // Check if any buyers were entered in the FMartTable from uMartImportByFileReview.
            if ( not(BuyersExistInFMartTable) ) then
               begin
                  WinData.Buyers.Active := True;
                  // If 1 or more buyers found then see if buyer is default.
                  if ( WinData.Buyers.RecordCount >= 1 ) then
                     begin
                        WinData.Buyers.First;
                        while not WinData.Buyers.Eof do
                           begin
                              if ( WinData.Buyers.FieldByName('DefaultBuyer').AsBoolean ) then
                                 BuyerID := WinData.Buyers.FieldByName('ID').AsInteger;
                              WinData.Buyers.Next;
                           end;

                        // if more than one buyer is found and none of these are default buyers then show buyer select screen.
                        if ( BuyerID = 0 ) and ( WinData.Buyers.RecordCount > 1 ) then
                           if ( MessageDlg('No default buyer specified.'+cCrlf+
                                           'Do you want to select a buyer for this mart file.',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                              BuyerID := TfmSelectBuyer.SelectBuyer;
                     end;
               end;
         end;

      try
         LookupBreeds := TTable.Create(nil);
         LookupBreeds.DatabaseName := AliasName;
         LookupBreeds.TableName := 'Breeds';
         LookupBreeds.Active := True;

         LookupColours := TTable.Create(nil);
         LookupColours.DatabaseName := AliasName;
         LookupColours.TableName := 'GenLook';
         LookupColours.Active := True;
         LookupColours.Filter := 'ListType = '+IntToStr(LAnimalColour);
         LookupColours.Filtered := True;

         with FMartTable do
            begin
               First;
               while not eof do
                  begin
                     FAnimalSaved := False;
                     if FMartTable.FieldByName('SearchTagNo').AsString <> '' then
                        begin
                           //   27/02/13 [V5.1 R4.7] /MK Bug Fix - BuyerID was not being set by FMartTable if BuyerID exists in FMartTable.
                           if FMartTable.FieldByName('BuyerID').AsInteger > 0 then
                              BuyerID := FMartTable.FieldByName('BuyerID').AsInteger;

                           if ( FAnimalTable.Locate('SearchNatID;InHerd',VarArrayOf([StripAllSpaces(FieldByName('SearchTagNo').AsString),True]),[]) ) then
                              begin
                                 // If animal does exist, its in herd add or update purchase record.
                                 FAnimalSaved := True;
                                 ExistPurchID := 0;
                                 if ( WinData.CheckEventExists(FAnimalTable.FieldByName('ID').AsInteger,CPurchaseEvent,FMartTable.FieldByName('EventDate').AsDateTime) ) then
                                    begin
                                       ExistPurchID := WinData.CheckEvents.FieldByName('ID').AsInteger;
                                       //   10/03/17 [V5.6 R6.7] /MK Additional Feature - If the event exists in the events table but doesn't exist in the purchase table
                                       //                                                 then insert a record into the purchase table with the details - John Milliken.
                                       if ( not(WinData.EventDataHelper.EventDetailRecordExists(ExistPurchID,CPurchaseEvent)) ) then
                                          begin
                                             with TQuery.Create(nil) do
                                                try
                                                   DatabaseName := AliasName;
                                                   SQL.Clear;
                                                   SQL.Add('INSERT INTO Purchases (EventID, Supplier, Price, Weight, LotNumber, FQASDays,');
                                                   SQL.Add('                       Commission, Haulage, SupplierCosts, Buyer, BuyerCosts)'); 
                                                   SQL.Add('VALUES ('+IntToStr(ExistPurchID)+',:PurchaseSupplier,:PurchasePrice,:PurchaseWeight,:PurchaseLotNo,:PurchaseFQASDays,');
                                                   SQL.Add('        :PurchaseCommission,:PurchaseHaulage,:PurchaseSupplierCosts,:PurchaseBuyer, :BuyerCosts)');
                                                   Params[0].AsInteger := FMartTable.FieldByName('CustomerSupplier').AsInteger;
                                                   Params[1].AsFloat := FMartTable.FieldByName('Price').AsFloat;
                                                   Params[2].AsFloat := FMartTable.FieldByName('Weight').AsFloat;
                                                   Params[3].AsString := FMartTable.FieldByName('LotNo').AsString;
                                                   Params[4].AsInteger := FMartTable.FieldByName('NoDaysOnPrevHolding').AsInteger;
                                                   Params[5].AsFloat := FMartTable.FieldByName('Commission').AsFloat;
                                                   Params[6].AsFloat := FMartTable.FieldByName('Haulage').AsFloat;
                                                   Params[7].AsFloat := FMartTable.FieldByName('Commission').AsFloat+FMartTable.FieldByName('Haulage').AsFloat;
                                                   Params[8].AsInteger := BuyerID;
                                                   //   04/02/19 [V5.8 R6.6] /MK Additional Feature - When adding a missing detail purchase record, add the buyer costs.
                                                   if ( WinData.Buyers.Locate('ID',BuyerID,[]) ) then
                                                      Params[9].AsFloat := WinData.Buyers.FieldByName('Commission').AsFloat
                                                   else
                                                      Params[9].AsFloat := 0;
                                                   ExecSQL;
                                                   FFileStatistics.NoOfPurchasedSaved := FFileStatistics.NoOfPurchasedSaved+1;
                                                   FFileStatistics.TotalWeightSaved := FFileStatistics.TotalWeightSaved+FMartTable.FieldByName('Weight').AsFloat;
                                                   FFileStatistics.TotalPriceSaved := FFileStatistics.TotalPriceSaved+FMartTable.FieldByName('Price').AsFloat;
                                                finally
                                                   Free;
                                                end;
                                          end
                                       //   10/03/17 [V5.6 R6.7] /MK Additional Feature - If the event does exist in the detail table then go through PostPurchaseAndHealth
                                       //                                                 and this code will update the purchase record if it already exists. 
                                       else
                                          PostPurchaseAndHealth(FAnimalTable.FieldByName('ID').AsInteger,
                                                                FAnimalTable.FieldByName('LactNo').AsInteger,
                                                                FAnimalTable.FieldByName('HerdID').AsInteger,
                                                                BuyerID,
                                                                FAnimalTable.FieldByName('NatIDNum').AsString,
                                                                ExistPurchID);
                                    end
                                 else
                                    PostPurchaseAndHealth(FAnimalTable.FieldByName('ID').AsInteger,
                                                          FAnimalTable.FieldByName('LactNo').AsInteger,
                                                          FAnimalTable.FieldByName('HerdID').AsInteger,
                                                          BuyerID,
                                                          FAnimalTable.FieldByName('NatIDNum').AsString);

                                 //   30/01/18 [V5.7 R7.6] /MK Change - If an animal is in the herd already but doesn't have a colour then update the colour from APHIS file - John Milliken.
                                 if ( FAnimalTable.FieldByName('Colour').AsInteger = 0 ) and ( Length(FMartTable.FieldByName('ColourCode').AsString) > 0 ) then
                                    begin
                                       if LookupColours.Locate('LookupCode', FMartTable.FieldByName('ColourCode').AsString, [loCaseInsensitive]) then
                                          UpdateAnimalColour(FAnimalTable.FieldByName('ID').AsInteger,LookupColours.FieldByName('ID').AsInteger)
                                       else
                                          begin
                                             LookupColours.Append;
                                             try
                                                LookupColours.FieldByName('ListType').AsInteger := LAnimalColour;
                                                LookupColours.FieldByName('UserCanDelete').AsBoolean := True;
                                                LookupColours.FieldByName('LookupCode').AsString := FieldByName('ColourCode').AsString;
                                                LookupColours.FieldByName('Description').AsString := FieldByName('ColourCode').AsString;
                                                LookupColours.Post;
                                                UpdateAnimalColour(FAnimalTable.FieldByName('ID').AsInteger,LookupColours.FieldByName('ID').AsInteger)
                                             except
                                                LookupColours.Cancel;
                                             end;
                                          end;
                                    end;
                              end
                           else if ( FAnimalTable.Locate('SearchNatID;InHerd',VarArrayOf([StripAllSpaces(FieldByName('SearchTagNo').AsString),False]),[]) ) and
                                   ( not(WinData.CheckEventExists(FAnimalTable.FieldByName('ID').AsInteger,CPurchaseEvent,FieldByName('EventDate').AsDateTime)) ) then
                              begin
                                 //   18/07/18 [V5.8 R1.1] /MK Change - If the animal has a sale date and the sale date is greater than purchase date and
                                 //                                     the animal currently does not have a purchase event then add purchase event only - Bellingham.
                                 dAnimalSaleDate := WinData.FEventDataHelper.GetAnimalSaleEventDate(FAnimalTable.FieldByName('ID').AsInteger);
                                 if ( (dAnimalSaleDate > 0) and (dAnimalSaleDate > FieldByName('EventDate').AsDateTime) and
                                      (not(WinData.CheckEventExists(FAnimalTable.FieldByName('ID').AsInteger,FAnimalTable.FieldByName('LactNo').AsInteger,CPurchaseEvent))) ) then
                                    begin
                                       FAnimalSaved := True;
                                       PostPurchaseAndHealth(FAnimalTable.FieldByName('ID').AsInteger,
                                                             FAnimalTable.FieldByName('LactNo').AsInteger,
                                                             FAnimalTable.FieldByName('HerdID').AsInteger,
                                                             BuyerID,
                                                             FAnimalTable.FieldByName('NatIDNum').AsString)
                                    end
                                 else
                                    begin
                                       // If animal does exist, its not in herd and the new purchase date is not the same as the existing purchase event
                                       // then add a new animal to the database with new purchase details
                                       AddAnimalRecord;
                                       PostPurchaseAndHealth(iAnimalRecID,iAnimalRecLactNo,iAnimalRecHerdId,BuyerID,sAnimalRecNatID);
                                    end;
                              end
                           else if ( not(FAnimalTable.Locate('SearchNatID',StripAllSpaces(FieldByName('SearchTagNo').AsString),[])) ) then
                              begin
                                 // If animals does not exist.
                                 AddAnimalRecord;
                                 PostPurchaseAndHealth(iAnimalRecID,iAnimalRecLactNo,iAnimalRecHerdId,BuyerID,sAnimalRecNatID);
                              end;
                        end;
                     Next;
                  end;
            end;
      finally
         if ( LookupColours <> nil ) then
            begin
               if ( LookupColours.Active ) then
                  LookupColours.Close;
               FreeAndNil(LookupColours);
            end;
         if ( LookupBreeds <> nil ) then
            begin
               if ( LookupBreeds.Active ) then
                  LookupBreeds.Close;
               FreeAndNil(LookupBreeds);
            end;
      end;
   except
      AddToDebugLogFile(WinData.KingData.Directory,'Error posting Purchase');
   end;
end;

procedure MartImport.PostSales;
var
   SaleDeathEvent : TSaleDeathEvent;
   TemporaryMovement : TTemporaryMovement;
   UpdateQuery : TQuery;
   iExistSaleEventID,
   iSaleEventID : Integer;
   Animal : TAnimal;

   function ActiveTempMovements : Boolean;
   var
      qActiveTempMoves : TQuery;
      iActiveTempMoveCount : Integer;
   begin
      Result := False;
      qActiveTempMoves := TQuery.Create(nil);
      with qActiveTempMoves do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT A.LocateNatID, TM.EventID, TM.StillOffFarm');
            SQL.Add('FROM Movements TM');
            SQL.Add('LEFT JOIN Animals A On (A.ID = TM.AID)');
            SQL.Add('WHERE (TM.StillOffFarm = True)');
            try
               iActiveTempMoveCount := 0;
               Open;
               First;
               while ( not(Eof) ) do
                  begin
                     if ( FMartTable.Locate('SearchTagNo',qActiveTempMoves.FieldByName('LocateNatID').AsString,[]) ) then
                        begin
                           Inc(iActiveTempMoveCount);
                           try
                              FMartTable.Edit;
                              FMartTable.FieldByName('StillOffFarm').AsBoolean := qActiveTempMoves.FieldByName('StillOffFarm').AsBoolean;
                              FMartTable.Post;
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;
                        end;
                     Next;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
            Result := ( iActiveTempMoveCount > 0 );
         end;
   end;

   procedure IncreaseTotals;
   begin
      if FMartTable.FieldByName('Death').AsBoolean then
         FFileStatistics.NoOfDeathsSaved := FFileStatistics.NoOfDeathsSaved+1
      else
         FFileStatistics.NoOfSalesSaved := FFileStatistics.NoOfSalesSaved+1;

      if ( FMartTable.FieldByName('Weight').AsFloat > 0 ) and ( FMartTable.FieldByName('ColdDeadWt').AsFloat = 0 ) then
         FFileStatistics.TotalWeightSaved := FFileStatistics.TotalWeightSaved+FMartTable.FieldByName('Weight').AsFloat
      else if ( FMartTable.FieldByName('Weight').AsFloat = 0 ) and ( FMartTable.FieldByName('ColdDeadWt').AsFloat > 0 ) then
         FFileStatistics.TotalWeightSaved := FFileStatistics.TotalWeightSaved+FMartTable.FieldByName('ColdDeadWt').AsFloat;
      FFileStatistics.TotalPriceSaved := FFileStatistics.TotalPriceSaved+FMartTable.FieldByName('Price').AsFloat;
   end;

begin
   //   29/01/15 [V5.4 R1.6] /MK Change - Check if are animals to be sold that have active temp movements and skip these animals
   //                                     from being sold.
   iExistSaleEventID := 0;
   if ( ActiveTempMovements ) then
      MessageDlg('Some animals on this mart file have active temporary movements i.e. still off farm.'+cCRLF+
                 'These animals will not be sold.',mtInformation,[mbOK],0);

   with FMartTable do
      begin
         First;
         while ( not(Eof) ) do
            begin
               if ( Length(FMartTable.FieldByName('SearchTagNo').AsString) > 0 ) then
                  begin
                     if ( FAnimalTable.Locate('SearchNatID;InHerd',VarArrayOf([StripAllSpaces(FMartTable.FieldByName('SearchTagNo').AsString),True]),[]) ) then
                        begin
                           if ( not(FMartTable.FieldByName('StillOffFarm').AsBoolean) ) then
                              if ( CreateTempMovementOnZeroSalePrice ) and ( FieldByName('Price').AsFloat <= 0 ) then
                                 begin
                                    Inc(FFileStatistics.NoReturned);
                                    // Create temporary movement event, and move to next sale event.
                                    if ( not(WinData.CheckEventExists(FAnimalTable.FieldByName('ID').AsInteger, CMovementEvent, FieldByName('EventDate').AsDateTime)) ) then
                                       try
                                          TemporaryMovement := TTemporaryMovement.Create('MartTMoves');
                                          TemporaryMovement.Append;
                                          try
                                             TemporaryMovement.AnimalID := FAnimalTable.FieldByName('ID').AsInteger;
                                             TemporaryMovement.EventDate := FieldByName('EventDate').AsDateTime;
                                             TemporaryMovement.AnimalLactNo := FAnimalTable.FieldByName('LactNo').AsInteger;
                                             TemporaryMovement.AnimalHerdID := FHerdID;
                                             TemporaryMovement.EventComment := 'Temporary Movement';
                                             TemporaryMovement.AID := FAnimalTable.FieldByName('ID').AsInteger;
                                             TemporaryMovement.MovedTo := GetCarnarossMartFromMovedTo;
                                             TemporaryMovement.DateMovedBack := FieldByName('EventDate').AsDateTime;
                                             TemporaryMovement.StillOffFarm := False;
                                             TemporaryMovement.Remark := TemporaryMovement.EventComment;
                                             TemporaryMovement.Post;
                                          except
                                             on e : exception do
                                                begin
                                                   TemporaryMovement.Cancel;
                                                   MessageDlg('Failed to create Temporary Movement record.'+cCRLFx2+E.Message,mtError,[mbOK],0);
                                                end;
                                          end;
                                       finally
                                          FreeAndNil(TemporaryMovement);
                                       end;
                                 end
                              else
                                 begin
                                    try
                                       iSaleEventID := 0;
                                       SaleDeathEvent := TSaleDeathEvent.Create('MartSales');
                                       // do not allow user to cancel sale if suckler events have not been recorded prior to sale date.
                                       // when this file has been sent to the farmer, the animal would have been already sold.
                                       SaleDeathEvent.AllowCancel := False;

                                       SaleDeathEvent.Append;
                                       try
                                          SaleDeathEvent.EventType := TSaleDeath;
                                          SaleDeathEvent.AnimalID := FAnimalTable.FieldByName('ID').AsInteger;
                                          SaleDeathEvent.EventDate := FieldByName('EventDate').AsDateTime;
                                          SaleDeathEvent.AnimalLactNo := FAnimalTable.FieldByName('LactNo').AsInteger;
                                          SaleDeathEvent.AnimalHerdID := FHerdID;

                                          //   20/06/13 [V5.1 R7.5] /MK Additional Feature - Check if GlobalSettings.MartSaveCommentAsSourceName then
                                          //                                                 change Event Comment to Supplier Name.
                                          if ( WinData.GlobalSettings.MartSaveCommentAsSourceName ) then
                                             begin
                                                if ( WinData.Customers.Locate('ID',FSourceID,[]) ) then
                                                   SaleDeathEvent.EventComment := WinData.CustomersName.AsString
                                                else
                                                   SaleDeathEvent.EventComment := 'Sale';
                                             end
                                          else
                                             SaleDeathEvent.EventComment := 'Sale';

                                          SaleDeathEvent.Grade := FieldByName('Grade').AsString;
                                          SaleDeathEvent.EventSource := sMART;
                                          SaleDeathEvent.PreSale := False;

                                          if FFileType in ([mftNIMovementIn,mftNIMovementOut]) then
                                             begin
                                                if FieldByName('CustomerSupplier').AsInteger > 0 then
                                                   SaleDeathEvent.Customer := FieldByName('CustomerSupplier').AsInteger
                                                else
                                                   FErrorList.Add(Format('%s - Missing Supplier "%s" in Sale Event on %s',[FieldByName('TagNo').AsString, FieldByName('CustomerSupplierRefCode').AsString, FormatDateTime(cIrishDateStyle, FieldByName('EventDate').AsDateTime )]));
                                             end
                                          else
                                             SaleDeathEvent.Customer := FSourceID;

                                          //   03/11/11 [V5.0 R1.7] /MK Additional Feature - Add VatCalculation On Price From Sales File.
                                          {
                                          if ( VATRegistered ) then
                                             begin
                                                Value := FieldByName('Price').AsFloat;
                                                PriceLessVAT := (Round((Value*10000)/(100+VATRate)))/100;
                                                SaleDeathEvent.Price := PriceLessVAT;
                                             end
                                          else
                                             SaleDeathEvent.Price := FieldByName('Price').AsFloat;
                                          }

                                          SaleDeathEvent.Price := FieldByName('Price').AsFloat;

                                          SaleDeathEvent.Weight := FieldByName('Weight').AsFloat;
                                          SaleDeathEvent.ColdDeadWt := FieldByName('ColdDeadWt').AsFloat;
                                          SaleDeathEvent.Sold := not(FMartTable.FieldByName('Death').AsBoolean);
                                          SaleDeathEvent.Notified := False;
                                          SaleDeathEvent.Slaughter := False;

                                          if WinData.GlobalSettings.RenumAnimalNo then
                                             begin
                                                SaleDeathEvent.RenumberAfterPost := True;
                                                SaleDeathEvent.RenumberFormat := WinData.GlobalSettings.ReNumFormat;
                                             end;

                                          //   14/10/19 [V5.9 R0.9] /MK Additional Feature - Remove Transponder No if Parlour and RemoveTransponderAfterSale preference.
                                          SaleDeathEvent.RemoveTransponderNo := ( (Def.Definition.dUseParlour) and (WinData.GlobalSettings.RemoveTransponderAfterSale) );

                                          //   04/02/19 [V5.8 R6.6] /MK Additional Feature - Add CustomerCosts from Deductions(Commission) and Transport(Haulage) from Customer table.
                                          SaleDeathEvent.CustomerCosts := FMartTable.FieldByName('Commission').AsFloat + FMartTable.FieldByName('Haulage').AsFloat;

                                          SaleDeathEvent.Post;
                                          iSaleEventID := SaleDeathEvent.EventID;
                                       except
                                          SaleDeathEvent.Cancel;
                                       end;
                                    finally
                                       FreeAndNil(SaleDeathEvent);
                                    end;

                                    WinData.AddToEventLookupData(FAnimalTable.FieldByName('ID').AsInteger, CSaleDeathEvent);

                                    //   12/11/12 [V5.1 R0.9] /MK Additional Feature - Added function for CrushXMLExport.
                                    if ( Def.Definition.dUseCrush ) then
                                       with TCrushXMLExport.Create do
                                          try
                                             with FSaleAnimal do
                                                begin
                                                   AnimalID := FAnimalTable.FieldByName('ID').AsInteger;
                                                   Animal := GetAnimal(FAnimalTable.FieldByName('ID').AsInteger);
                                                   if ( Animal <> nil ) then
                                                      NatIDNum := Animal.NatIdNum;
                                                   EventID := iSaleEventID;
                                                   EventDate := FMartTable.FieldByName('EventDate').AsDateTime;
                                                   CustomerID := FSourceID;
                                                   AnimalWeight := FMartTable.FieldByName('Weight').AsFloat;
                                                   AnimalPrice := FMartTable.FieldByName('Price').AsFloat;
                                                   ColdDeadWt := FMartTable.FieldByName('ColdDeadWt').AsFloat;
                                                   TBTestDate := FMartTable.FieldByName('TBTestDate').AsDateTime;
                                                   BruTestDate := FMartTable.FieldByName('BruceTestDate').AsDateTime;
                                                   PreSale := False;
                                                   SoldStatus := True;
                                                end;
                                             if ( IsValidEvent(etSale) ) then
                                                begin
                                                   CreateorOpenXMLFile(etSale);
                                                   AddAnimalToXMLFile(etSale);
                                                end;
                                          finally
                                             Free
                                          end;
                                 end;
                              IncreaseTotals;
                           end
                     else
                        begin
                           if ( FAnimalTable.Locate('SearchNatID;InHerd',VarArrayOf([StripAllSpaces(FMartTable.FieldByName('SearchTagNo').AsString),False]),[]) ) then
                              if ( WinData.CheckEventExists(FAnimalTable.FieldByName('ID').AsInteger,CSaleDeathEvent,FMartTable.FieldByName('EventDate').AsDateTime) ) then
                                 iExistSaleEventID := WinData.CheckEvents.FieldByName('ID').AsInteger;
                           if ( iExistSaleEventID > 0 ) then
                              begin
                                 if ( not(WinData.EventDataHelper.EventDetailRecordExists(iExistSaleEventID, CSaleDeathEvent)) ) then
                                    begin
                                       with TQuery.Create(nil) do
                                          try
                                             DatabaseName := AliasName;
                                             SQL.Clear;
                                             SQL.Add('INSERT INTO SalesDeaths (EventID, Sold, Customer, Price, Weight, ColdDeadWt, CustomerCosts)');
                                             SQL.Add('VALUES (:ExistSaleEventID, True, :SaleCustomer, :SalePrice, :SaleWeight, :ColdDeadWt, :CustomerCosts)');
                                             Params[0].AsInteger := iExistSaleEventID;

                                             if ( FFileType = mftNIMovementIn ) then
                                                begin
                                                   if ( FMartTable.FieldByName('CustomerSupplier').AsInteger > 0 ) then
                                                      Params[1].AsInteger := FMartTable.FieldByName('CustomerSupplier').AsInteger
                                                   else
                                                      FErrorList.Add(Format('%s - Missing Supplier "%s" in Sale Event on %s',[FieldByName('TagNo').AsString, FieldByName('CustomerSupplierRefCode').AsString, FormatDateTime(cIrishDateStyle, FieldByName('EventDate').AsDateTime )]));
                                                end
                                             else
                                                Params[1].AsInteger := FSourceID;

                                             {
                                             if ( VATRegistered ) then
                                                begin
                                                   Value := FMartTable.FieldByName('Price').AsFloat;
                                                   PriceLessVAT := (Round((Value*10000)/(100+VATRate)))/100;
                                                   Params[2].AsFloat := PriceLessVAT;
                                                end
                                             else
                                                Params[2].AsFloat := FMartTable.FieldByName('Price').AsFloat;
                                             }

                                             Params[2].AsFloat := FMartTable.FieldByName('Price').AsFloat;
                                             Params[3].AsFloat := FMartTable.FieldByName('Weight').AsFloat;
                                             Params[4].AsFloat := FMartTable.FieldByName('ColdDeadWt').AsFloat;

                                             //   04/02/19 [V5.8 R6.6] /MK Additional Feature - When adding a missing detail sale record, add the customer costs.
                                             Params[5].AsFloat := FMartTable.FieldByName('Commission').AsFloat + FMartTable.FieldByName('Haulage').AsFloat;

                                             ExecSQL;
                                             IncreaseTotals;
                                          finally
                                             Free;
                                          end;
                                    end
                                 else
                                    begin
                                        // Update Existing Sale Event with details from FMartTable.
                                        with GetQuery do
                                           try
                                              if ( GetQuery.Active ) then
                                                 GetQuery.Close;
                                              SQL.Clear;
                                              SQL.Add('UPDATE SalesDeaths');
                                              SQL.Add('SET Customer = :SaleCustomer,');
                                              SQL.Add('    Sold = True,');
                                              SQL.Add('    Price = :SalePrice,');
                                              SQL.Add('    Weight = :SaleWeight,');
                                              SQL.Add('    ColdDeadWt = :ColdDeadWt,');
                                              SQL.Add('    CustomerCosts = :CustomerCosts');
                                              SQL.Add('WHERE EventID = :AEventID');
                                              if ( FFileType = mftNIMovementOut ) then
                                                 begin
                                                    if ( FMartTable.FieldByName('CustomerSupplier').AsInteger > 0 ) then
                                                       Params[0].AsInteger := FMartTable.FieldByName('CustomerSupplier').AsInteger
                                                    else
                                                       FErrorList.Add(Format('%s - Missing Supplier "%s" in Sale Event on %s',[FieldByName('TagNo').AsString, FieldByName('CustomerSupplierRefCode').AsString, FormatDateTime(cIrishDateStyle, FieldByName('EventDate').AsDateTime )]));
                                                 end
                                              else
                                                 Params[0].AsInteger := FSourceID;

                                              {
                                              if ( VATRegistered ) then
                                                 begin
                                                    Value := FMartTable.FieldByName('Price').AsFloat;
                                                    PriceLessVAT := (Round((Value*10000)/(100+VATRate)))/100;
                                                    Params[1].AsFloat := PriceLessVAT;
                                                 end
                                              else
                                                 Params[1].AsFloat := FMartTable.FieldByName('Price').AsFloat;
                                              }

                                              Params[1].AsFloat := FMartTable.FieldByName('Price').AsFloat;
                                              Params[2].AsFloat := FMartTable.FieldByName('Weight').AsFloat;
                                              Params[3].AsFloat := FMartTable.FieldByName('ColdDeadWt').AsFloat;
                                              //   04/02/19 [V5.8 R6.6] /MK Additional Feature - When updating a sale record add customer costs.
                                              Params[4].AsFloat := FMartTable.FieldByName('Commission').AsFloat + FMartTable.FieldByName('Haulage').AsFloat;
                                              Params[5].AsInteger := iExistSaleEventID;
                                              try
                                                 ExecSQL;
                                                 IncreaseTotals;
                                              except
                                                 on e : Exception do
                                                    ShowMessage(e.Message);
                                              end;
                                           finally
                                              Free;
                                           end;
                                    end;
                              end
                           else
                              FErrorList.Add(Format('%s - Animal not found in herd',[FieldByName('TagNo').AsString]));
                        end;
                  end;
               Next;
            end;
      end;
end;

procedure MartImport.PrepareNatIDSearch;
var
   tNatIDNum : string;
begin
   FAnimalTable.First;
   while not FAnimalTable.eof do
      begin
         if (FAnimalTable.FieldByName('HerdID').asInteger=FHerdID) and (FAnimalTable.FieldByName('NatIDNum').asString <> '') then
            begin
               tNatIDNum := UPPERCASE(TRIM(FAnimalTable.FieldByName('NatIDNum').asString));
               if ( IsNewIrishNatID(tNatIDNum) ) then
                  StripIrishCountryPrefixFromNatID(tNatIDNum)
               else if NatIDKind(tNatIDNum) = nkUK9 then
                  tNatIDNum := UK9NatIDNumber.CreateLocateNatID(tNatIDNum)
               else
                  tNatIDNum := StripAllNomNumAlpha(tNatIDNum);
               FAnimalTable.Edit;
               FAnimalTable.FieldByName('LocateNatID').asString := tNatIDNum;
               FAnimalTable.Post;
            end;
         FAnimalTable.Next;
      end;
   FAnimalTable.First;
end;

procedure MartImport.SetFileType(const Value: TMartFileType);
begin
   FFileType := Value;
end;

procedure MartImport.SetVars;
begin
   FMartImportType := mitUnknown;
   FSourceName := '';
   FFileName := '';
   FNoRecorded := 0;
end;

function MartImport.CountOfPurchaseEvents: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Count(ID) CID From ' + FMartTable.TableName);
         SQL.Add('Where IsBirth = False');
         Open;
         try
            First;
             Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure MartImport.GetVatInformation(AHerdId : Integer);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT VATRegistered, VATRate');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE ID = '+IntToStr(AHerdId)+' ');
         Open;
         try
            First;
            VATRegistered := Fields[0].AsBoolean;
            VATRate := Fields[1].AsFloat;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure MartImport.SaveMartTableDetail;
var
   slImportFile : TStringList;
   sIsBirth : String;
begin
   try
      if ( FMartTable.RecordCount = 0 ) then Exit;
      if ( FFileType <> mftNIMovementIn ) then Exit;
      try
         slImportFile := TStringList.Create();
         FMartTable.First;
         while ( not(FMartTable.Eof) ) do
            begin
               sIsBirth := '';
               if ( FMartTable.FieldByName('IsBirth').AsBoolean ) then
                  begin
                     sIsBirth := 'Birth';
                     slImportFile.Add(FMartTable.FieldByName('TagNo').AsString+','+
                                      FMartTable.FieldByName('ColourCode').AsString+','+
                                      FMartTable.FieldByName('Sex').AsString+','+
                                      FMartTable.FieldByName('BreedCode').AsString+','+
                                      DateToStr(FMartTable.FieldByName('DOB').AsDateTime)+','+
                                      DateToStr(FMartTable.FieldByName('EventDate').AsDateTime)+','+
                                      sIsBirth+','+
                                      FMartTable.FieldByName('CustomerSupplierRefCode').AsString+','+
                                      FloatToStr(FMartTable.FieldByName('Price').AsFloat)+','+
                                      FloatToStr(FMartTable.FieldByName('Weight').AsFloat)+','+
                                      FMartTable.FieldByName('LotNo').AsString);
                  end;
               FMartTable.Next;
            end;
         if ( slImportFile.Count > 0 ) then
            begin
               ForceDirectories(APHISMovementsDir);
               slImportFile.SaveToFile(APHISMovementsDir+'ImportedFile'+FormatDateTime('dd_mm_yyyy_hh_mm_ss',Now)+'.txt')
            end;
      finally
         if ( slImportFile <> nil ) then
            FreeAndNil(slImportFile);
      end;
   except
      AddToDebugLogFile(WinData.KingData.Directory,'Error creating ImportedFile.txt');
   end;
end;

procedure MartImport.AddBreedToTable(ABreedCode : String);
begin
   if ( Length(ABreedCode) = 0 ) then Exit;
   if ( not(FBreedTable.Active) ) then
      FBreedTable.Open;
   if ( FBreedTable.Locate('Code',ABreedCode,[loCaseInsensitive]) ) then Exit;
   try
      FBreedTable.Append;
      FBreedTable.FieldByName('Code').AsString := ABreedCode;
      FBreedTable.FieldByName('Name').AsString := ABreedCode;
      FBreedTable.FieldByName('GestationPeriod').AsInteger := cGestationPeriod;
      FBreedTable.FieldByName('EligibleforPremium').AsBoolean := False;
      FBreedTable.FieldByName('Selected').AsBoolean := False;
      FBreedTable.FieldByName('InUse').AsBoolean := True;
      FBreedTable.Post;
   except
      on e : Exception do
         begin
            FBreedTable.Cancel;
            ApplicationLog.LogException(e);
            ApplicationLog.LogError(e.Message);
         end;
   end;
end;

end.

