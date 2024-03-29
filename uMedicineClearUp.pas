{
   16/08/18 [V5.8 R2.4] /MK Change - FixDuplicateDrugs - Changed this procedure to a function so we know whether the SQL's excecuted without any errors.
}

unit uMedicineClearUp;

interface

uses
  db, dbTables, GenTypesConst, KRoutines, Dialogs, uApplicationLog, SysUtils;

  type
     TFixType = (ftVPA, ftName);

  function GetAllMedicineIDsUsedToArray : PIntegerArray;
  function GetAllMedicineIDsNotUsedCount (AMedicinesUsed : PIntegerArray) : Integer;
  function DuplicateVPAMedicineIDCount : PStringArray;
  function DuplicateNameMedicineIDCount : PStringArray;
  function GetSingleVPADuplicateArray (AVPANo : String; ANewDrugID : Integer) : PIntegerArray;
  procedure FixDuplicateVPANumbers_Names(AFixType : TFixType);
  function FixDuplicateDrugs(ANewID, AOldID : Integer) : Boolean;

implementation

function GetAllMedicineIDsUsedToArray : PIntegerArray;
begin
   SetLength(Result,0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(DrugUsed)');
         SQL.Add('FROM Health');
         try
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  if ( Fields[0].AsInteger > 0 ) then
                     begin
                        SetLength(Result,Length(Result)+1);
                        Result[Length(Result)-1] := Fields[0].AsInteger;
                     end;
                  Next;
               end;
            Close;
            SQL.Clear;
            SQL.Add('SELECT DISTINCT(DrugID)');
            SQL.Add('FROM MediPur');
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  if ( Fields[0].AsInteger > 0 ) and ( not(InArray(Fields[0].AsInteger,Result)) ) then
                     begin
                        SetLength(Result,Length(Result)+1);
                        Result[Length(Result)-1] := Fields[0].AsInteger;
                     end;
                  Next;
               end;
         except
            on e : Exception do
              ApplicationLog.LogException(e);
         end;
      finally
         Free;
      end;
end;

function GetAllMedicineIDsNotUsedCount (AMedicinesUsed : PIntegerArray) : Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Medicine');
         if ( Length(AMedicinesUsed) > 0 ) then
            SQL.Add('WHERE ID NOT IN '+IntArrayToSQLInString(AMedicinesUsed)+'');
         try
            Open;
            Result := RecordCount;
         except
         end;
      finally
         Close;
         Free;
      end;
end;

function DuplicateVPAMedicineIDCount : PStringArray;
begin
   SetLength(Result,0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT VPANo, Count(VPANo)');
         SQL.Add('FROM Medicine');
         SQL.Add('GROUP BY VPANo');
         SQL.Add('HAVING COUNT(VPANo) > 1');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            First;
            while ( not(Eof) ) do
               begin
                  SetLength(Result,Length(Result)+1);
                  Result[Length(Result)-1] := Fields[0].AsString;
                  Next;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function DuplicateNameMedicineIDCount : PStringArray;
begin
   SetLength(Result,0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Name, Count(Name)');
         SQL.Add('FROM Medicine');
         SQL.Add('GROUP BY Name');
         SQL.Add('HAVING COUNT(Name) > 1');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            First;
            while ( not(Eof) ) do
               begin
                  SetLength(Result,Length(Result)+1);
                  Result[Length(Result)-1] := Fields[0].AsString;
                  Next;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure FixDuplicateVPANumbers_Names(AFixType : TFixType);
var
   iaDuplicates : PStringArray;
   i,
   iFirstID : Integer;
   qLocateDrugs : TQuery;
   sFieldName : String;
begin
   if ( AFixType = ftVPA ) then
      begin
         iaDuplicates := DuplicateVPAMedicineIDCount;
         sFieldName := 'VPANo';
      end
   else
      begin
         iaDuplicates := DuplicateNameMedicineIDCount;
         sFieldName := 'Name';
      end;
   if ( Length(iaDuplicates) = 0 ) then Exit;
   try
      qLocateDrugs := TQuery.Create(nil);
      qLocateDrugs.DatabaseName := AliasName;
      for i := 0 to Length(iaDuplicates)-1 do
         begin
            qLocateDrugs.SQL.Clear;
            qLocateDrugs.SQL.Add('SELECT ID');
            qLocateDrugs.SQL.Add('FROM Medicine');
            qLocateDrugs.SQL.Add('WHERE '+sFieldName+' = "'+iaDuplicates[i]+'"');
            qLocateDrugs.SQL.Add('ORDER BY ID');
            try
               qLocateDrugs.Open;
               qLocateDrugs.First;
               iFirstID := qLocateDrugs.FieldByName('ID').AsInteger;
               while ( not(qLocateDrugs.Eof) ) do
                  begin
                     if ( qLocateDrugs.FieldByName('ID').AsInteger <> iFirstID ) then
                        FixDuplicateDrugs(iFirstID, qLocateDrugs.FieldByName('ID').AsInteger);
                     qLocateDrugs.Next;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         end;
   finally
      qLocateDrugs.Close;
      FreeAndNil(qLocateDrugs);
   end;
end;

function FixDuplicateDrugs(ANewID, AOldID : Integer) : Boolean;
begin
   Result := False;
   if ( ANewID = 0 ) or ( AOldID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         try
            Close;
            SQL.Clear;
            SQL.Add('UPDATE Health');
            SQL.Add('SET DrugUsed = '+IntToStr(ANewID)+'');
            SQL.Add('WHERE DrugUsed = '+IntToStr(AOldID)+'');
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE MediPur');
            SQL.Add('SET DrugID = '+IntToStr(ANewID)+'');
            SQL.Add('WHERE DrugID = '+IntToStr(AOldID)+'');
            ExecSQL;

            SQL.Clear;
            SQL.Add('DELETE FROM Medicine');
            SQL.Add('WHERE ID = '+IntToStr(AOldID)+'');
            ExecSQL;

            Result := True;
         except
            Result := False;
         end;
      finally
         Free;
      end;
end;

function GetSingleVPADuplicateArray (AVPANo : String; ANewDrugID : Integer) : PIntegerArray;
begin
   SetLength(Result,0);
   if ( Length(AVPANo) = 0 ) or ( ANewDrugID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE ID <> '+IntToStr(ANewDrugID)+'');
         SQL.Add('AND   Upper(VPANo) = "'+AVPANo+'"');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            First;
            while ( not(Eof) ) do
               begin
                  SetLength(Result,Length(Result)+1);
                  Result[Length(Result)-1] := Fields[0].AsInteger;
                  Next;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

end.
