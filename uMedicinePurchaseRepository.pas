{
   21/08/13 [V5.2 R0.1] /MK Bug Fix - CreateMedicinePurchase - Saving ExpiryDate as PurchaseDate.

   21/08/13 [V5.2 R0.1] /MK Additional Feature - CreateMedicinePurchase - Added APurchDoseRate.

   12/11/15 [V5.5 R0.5] SP - Inclusion of comment in drug purchase table.

   01/04/19 [V5.8 R8.4] /MK Change - CreateMedicinePurchase - Some changes here to logic as requested by SP because Una Carter had some purchases from VetLink that didn't save.

   30/05/19 [V5.8 R9.3] /MK Additional Feature - Added new procedure UpdateMedPurchQtyRemaining which updates the quantity remaining of a purchase.

   25/06/19 [V5.8 R9.6] /MK Change - CreateMedicinePurchase - Added EventSource as a variable to be passed in.
                                                            - Default IsSynchronized to False.

   05/11/21 [V6.0 R2.8] /MK Change - GetMostRecentPurchaseId - Added consts for ATreatDate and APurchDate for
                                                               - If ATreatDate and not APurchDate then get purchases less than or equal to ATreatDate.
                                                               - If APurchDate and not ATreatDate then get purchases on the APurchDate. 
}

unit uMedicinePurchaseRepository;

interface
uses
   Classes, db, dbTables, uKingswoodRepository, SysUtils, Dialogs;

type
   TMedicinePurchaseRepository = class(TKingswoodRepository)
   public
      function CreateMedicinePurchase(ADrugId, ASupplierId : Integer;
         APurchaseDate, AExpiryDate : TDateTime; ABatchNumber, ATagDesc, APurchDoseRate : string;
         AQuantity, ACostPerUnit : Double; AComment :string; const AEventSource : Integer = 0) : Integer;
      function GetMostRecentPurchaseId(ADrugId : Integer; ABatchNumber : string; const APurchDate : TDateTime = 0; const ATreatDate : TDateTime = 0) : Integer;
      procedure UpdateMedPurchQtyRemaining (ADrugID, ADrugPurchID : Integer; AQtyUsed : Double; const ADisposalID : Integer = 0);
   end;

implementation

{ TMedicinePurchaseRepository }

function TMedicinePurchaseRepository.CreateMedicinePurchase(
  ADrugId, ASupplierId: Integer; APurchaseDate, AExpiryDate : TDateTime;
  ABatchNumber, ATagDesc, APurchDoseRate : string; AQuantity, ACostPerUnit : Double;
  AComment : string; const AEventSource : Integer = 0) : Integer;
begin
   Result := 0;

   // Check if drug already added to MediPur table.
   try
      FQuery.SQL.Clear;
      FQuery.SQL.Add('SELECT MP.ID, MP.DrugID, MP.PurchDate');
      FQuery.SQL.Add('FROM MediPur MP');
      FQuery.SQL.Add('WHERE MP.DrugID = :ADrugID');
      FQuery.SQL.Add('AND   MP.PurchDate = :APurchDate');
      FQuery.SQL.Add('AND   MP.BatchNo = :ABatchNumber');
      FQuery.SQL.Add('AND   MP.ExpiryDate = :AExpiryDate');
      FQuery.Params[0].AsInteger := ADrugId;
      FQuery.Params[1].AsDateTime := APurchaseDate;
      FQuery.Params[2].AsString := ABatchNumber;
      FQuery.Params[3].AsDateTime := AExpiryDate;
      FQuery.Open;

      //   01/04/19 [V5.8 R8.4] /MK Change - Some changes here to logic as requested by SP because Una Carter had some purchases from VetLink that didn't save.
      if ( FQuery.RecordCount > 0 ) then
         begin
            FQuery.First;
            Result := FQuery.Fields[0].AsInteger;
         end
      else
         begin
            FQuery.SQL.Clear;
            FQuery.SQL.Add('INSERT INTO MediPur (DrugId, PurchDate, SuppId, Quantity, BatchNo, ExpiryDate, PurchTagNoDesc, CostUnit, InUse, PurchDoseRate, QtyRemaining, Comment, IsSynchronized, EventSource) ');
            FQuery.SQL.Add('VALUES (:DrugId, :PurchDate, :SuppId, :Quantity, :BatchNo, :ExpiryDate, :TagDesc, :CostUnit, True, :PurchDoseRate, :Quantity, :Comment, :IsSynchronized, :EventSource) ');
            FQuery.Params[0].AsInteger := ADrugId;
            FQuery.Params[1].AsDateTime := APurchaseDate;
            FQuery.Params[2].AsInteger := ASupplierId;
            FQuery.Params[3].AsFloat := AQuantity;
            FQuery.Params[4].AsString := ABatchNumber;
            FQuery.Params[5].AsDateTime := AExpiryDate;
            FQuery.Params[6].AsString := ATagDesc;
            FQuery.Params[7].AsFloat := ACostPerUnit;
            FQuery.Params[8].AsString := APurchDoseRate;
            FQuery.Params[9].AsFloat := AQuantity;
            // 12/11/15 [V5.5 R0.5] SP - Inclusion of comment in drug purchase table.
            FQuery.Params[10].AsBlob := AComment;
            FQuery.Params[11].AsBoolean := False;
            FQuery.Params[12].AsInteger := AEventSource;
            FQuery.ExecSQL;
            Result := GetMostRecentPurchaseId(ADrugId,ABatchNumber,APurchaseDate,0);
         end;
   finally
      FQuery.Close;
   end;
end;

function TMedicinePurchaseRepository.GetMostRecentPurchaseId(ADrugId : Integer; ABatchNumber : string;
   const APurchDate : TDateTime = 0; const ATreatDate : TDateTime = 0) : Integer;
begin
   FQuery.SQL.Clear;
   FQuery.SQL.Add('SELECT M.Id, M.PurchDate FROM MediPur M');
   FQuery.SQL.Add('WHERE (M.DrugId = :DrugId) ');
   //   05/11/21 [V6.0 R2.8] /MK Bug Fix - This query was only looking for purchases on the ATreatPurchDate instead of less than or equal to.
   if ( ATreatDate > 0 ) then
      FQuery.SQL.Add('AND   (M.PurchDate <= "'+FormatDateTime('mm/dd/yyyy',ATreatDate)+'")')
   else if ( APurchDate > 0 ) then
      FQuery.SQL.Add('AND   (M.PurchDate = "'+FormatDateTime('mm/dd/yyyy',APurchDate)+'")');
   if ( Length(ABatchNumber) > 0 ) then
      FQuery.SQL.Add('AND   (UPPER(M.BatchNo) = :ABatchNumber)');
   FQuery.SQL.Add('AND   (M.InUse = True)');
   FQuery.SQL.Add('ORDER BY M.PurchDate DESC');
   FQuery.Params[0].AsInteger := ADrugId;
   if ( Length(ABatchNumber) > 0 ) then
      FQuery.Params[1].AsString := UPPERCASE(ABatchNumber);
   FQuery.Open;
   try
      FQuery.First;
      Result := FQuery.Fields[0].AsInteger;
   finally
      FQuery.Close;
   end;
end;

procedure TMedicinePurchaseRepository.UpdateMedPurchQtyRemaining(ADrugID,
  ADrugPurchID: Integer; AQtyUsed: Double; const ADisposalID: Integer);
begin
   if ( ADrugID = 0 ) or ( ADrugPurchID = 0 ) or ( AQtyUsed = 0 ) then Exit;
   FQuery.Close;
   FQuery.SQL.Clear;
   FQuery.SQL.Add('UPDATE MediPur');
   FQuery.SQL.Add('SET QtyRemaining = QtyRemaining - :AQtyUsed');
   if ( ADisposalID > 0 ) then
      begin
         FQuery.SQL.Add(', DisposalID = :ADisposalID');
         FQuery.SQL.Add(', InUse = False');
      end;
   FQuery.SQL.Add('WHERE ID = :DrugPurchID');
   FQuery.SQL.Add('AND   DrugID = :DrugID');
   FQuery.Params[0].AsFloat := AQtyUsed;
   if ( ADisposalID > 0 ) then
      begin
         FQuery.Params[1].AsInteger := ADisposalID;
         FQuery.Params[2].AsInteger := ADrugPurchID;
         FQuery.Params[3].AsInteger := ADrugID;
      end
   else
      begin
         FQuery.Params[1].AsInteger := ADrugPurchID;
         FQuery.Params[2].AsInteger := ADrugID;
      end;
   FQuery.ExecSQL;
end;

end.
