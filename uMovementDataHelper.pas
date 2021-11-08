//   14/05/20 [V5.9 R4.6] /MK Change - Added the HerdId field.

unit uMovementDataHelper;

interface
uses
   uEventDataHelper, db, dbTables, SysUtils, Dialogs;

type
   TMovementDataHelper = class(TEventDataHelper)
      private
        procedure AddFieldsAndDefsToTable(ATable: TTable);
      public
         TempSaleEvents,
         TempPurchEvents : TTable;
         constructor Create;
         destructor Destroy; override;
         procedure CreateTempMovementEventTables;
   end;

const
   AliasName = 'Kingswd';
   CSaleEvent = 11;
   CPurchEvent = 12;

implementation

{ TMovementDataHelper }

constructor TMovementDataHelper.Create;
begin
   TempSaleEvents := TTable.Create(nil);
   TempSaleEvents.DatabaseName := AliasName;
   TempSaleEvents.TableName := 'tmpSaleEvents';
   AddFieldsAndDefsToTable(TempSaleEvents);
   TempSaleEvents.CreateTable;

   TempPurchEvents := TTable.Create(nil);
   TempPurchEvents.DatabaseName := AliasName;
   TempPurchEvents.TableName := 'tmpPurchEvents';
   AddFieldsAndDefsToTable(TempPurchEvents);
   TempPurchEvents.CreateTable;
end;

procedure TMovementDataHelper.CreateTempMovementEventTables;
var
   qCreateTables : TQuery;
begin
   qCreateTables := TQuery.Create(nil);
   with qCreateTables do
      try
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('DELETE FROM '+TempPurchEvents.TableName+'');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         SQL.Clear;
         SQL.Add('INSERT INTO '+TempPurchEvents.TableName+' (EventID, AnimalID, AnimalLactNo, HerdId, EventDate, EventDesc)');
         SQL.Add('SELECT ID, AnimalID, AnimalLactNo, HerdId, EventDate, EventDesc');
         SQL.Add('FROM Events');
         SQL.Add('WHERE EventType = '+IntToStr(CPurchEvent)+'');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         SQL.Clear;
         SQL.Add('DELETE FROM '+TempSaleEvents.TableName+'');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         SQL.Clear;
         SQL.Add('INSERT INTO '+TempSaleEvents.TableName+' (EventID, AnimalID, AnimalLactNo, HerdId, EventDate, EventDesc)');
         SQL.Add('SELECT ID, AnimalID, AnimalLactNo, HerdId, EventDate, EventDesc');
         SQL.Add('FROM Events');
         SQL.Add('WHERE EventType = '+IntToStr(CSaleEvent)+'');
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

procedure TMovementDataHelper.AddFieldsAndDefsToTable(ATable : TTable);
begin
   with ATable do
      begin
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('EventID',ftInteger);
         FieldDefs.Add('AnimalID',ftInteger);
         FieldDefs.Add('AnimalLactNo',ftInteger);
         FieldDefs.Add('HerdID',ftInteger);
         FieldDefs.Add('EventDate',ftDate);
         FieldDefs.Add('EventDesc',ftString,30);
         IndexDefs.Add('','ID',[ixPrimary]);
         IndexDefs.Add('iEventDate','EventDate',[ixCaseInsensitive]);
         IndexName := 'iEventDate';
      end;
end;

destructor TMovementDataHelper.Destroy;
begin
  inherited;
  if ( TempPurchEvents <> nil ) then
     begin
        if ( TempPurchEvents.Active ) then
           TempPurchEvents.Active := False;
        TempPurchEvents.DeleteTable;
        FreeAndNil(TempPurchEvents);
     end;

  if ( TempSaleEvents <> nil ) then
     begin
        if ( TempSaleEvents.Active ) then
           TempSaleEvents.Active := False;
        TempSaleEvents.DeleteTable;
        FreeAndNil(TempSaleEvents);
     end;
end;

end.
