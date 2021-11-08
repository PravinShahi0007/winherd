unit uMartImportTypes;

interface
type
   TMartFileKind = (mftMART,mftAHPIS);
   TLookupType = (lkCustomer, lkSupplier);
   TMartFileType = (mftNone, mftXML, mftNIMovementIn, mftNIMovementOut );
   TMartImportType = (mitPurchase, mitSale, mitUnknown );

   TStatistics = record
      NoOfPurchased, NoOfCalves, NoOfSales, NoOfDeaths,
      NoOfPurchasedSaved, NoOfCalvesSaved, NoOfSalesSaved,
      NoOfDeathsSaved, NoReturned : SmallInt;
      TotalWeightSaved, TotalPriceSaved : Double;
      TotalWeightRead, TotalPriceRead : Double;
   end;
implementation

end.
