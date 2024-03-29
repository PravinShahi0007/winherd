{
  19/03/09 [V3.9 R6.7] /MK Bug Fix - Change to SQL and Params to show animals in herd for UK9

  06/07/11 [V4.1 R2.2] /MK Additional Feature - Added Slaney To iRemittanceMarts.

  06/02/15 [V5.4 R2.6] /MK Change - CarcaseExists - Added check to see if animal has an active temp movement.

  21/05/15 [V5.4 R7.0] /MK Additional Feature - Added Ashbourne to iRemittanceMarts.

  17/10/18 [V5.8 R4.0] /MK Additional Feature - CarcaseExists - Added const boolean for ReImportSale to allow the sale to be saved to again.

  04/12/20 [V5.9 R7.8] /MK Change - Added Jennings to the list of factories that a file can be requested from.
}

unit DaZMisc;

interface
uses
    sysutils, classes, db, dbtables, dialogs, uNationalID, KRoutines, GenTypesConst;

function GetWordCount(s : string) : integer;
function GetWordByIndex(s : string;nIndex : integer) : string;
//   17/10/18 [V5.8 R4.0] /MK Additional Feature - Added const boolean for ReImportSale to allow the sale to be saved to again.
function CarcaseExists(NatCareId : String; const AReImportSale : Boolean = False) : integer;

function  PadLeft(Source : String;PadChar : Char;Len : Integer) : String;
function  PadRight(Source : String;PadChar : Char;Len : Integer) : String;
function  PadString(Source : String;PadChar : Char;Len : Integer;Right : Boolean) : String;

function  RemitFileDateToDateTime(s : string) : tDateTime;
function  StrToFloatEx(s : string) : double;

var
  iRemittanceMarts : array [0..8] of string = ('Kepak','AIBP','Dawn Meats','Liffey Meats','Dunbia','Ballon','Slaney','Ashbourne','Jennings');

implementation
uses
    DairyData;

function    StrToFloatEx(s : string) : double;
var
   n : integer;
begin
 n:=pos(',',s);
 while n>0 do
  begin
   delete(s,n,1);
   n:=pos(',',s);
  end;
 try
  Result:=StrToFloat(s);
 except
  Result:=0;
 end;
end;

function RemitFileDateToDateTime(s : string) : tDateTime;
var
   nLoop : integer;
   nWordCount : integer;

   h,m,sec : word;
begin
 Result:=-1;
 // Remote all unwanted chars and replace with spaces.
 for nLoop:=1 to length(s) do
  if not (s[nLoop] in ['0'..'9']) then
   s[nLoop]:=#32;

 nWordCount:=GetWordCount(s);
 // get[date] component
 if nWordCount>2 then
  Result:=EncodeDate(strtoint(GetWordByIndex(s,3)),
                     strtoint(GetWordByIndex(s,2)),
                     strtoint(GetWordByIndex(s,1)));


 // get[time] component or part thereof ...
 if nWordCount>3 then
  begin
   try
    h:=strtoint(GetWordByIndex(s,4));
   except
    h:=0;
   end;
   try
    m:=strtoint(GetWordByIndex(s,5));
   except
    m:=0;
   end;
   try
    sec:=strtoint(GetWordByIndex(s,6));
   except
    sec:=0;
   end;
   Result:=Result+EncodeTime(h,m,sec,0);
  end;
end;


function  PadLeft(Source : String;PadChar : Char;Len : Integer) : String;
begin
 Delete(Source,Len+1,Length(Source));
 While Length(Source)<Len do
  Source:=PadChar+Source;
 Result:=Source;
end;

function  PadRight(Source : String;PadChar : Char;Len : Integer) : String;
begin
 Delete(Source,Len+1,Length(Source));
 While Length(Source)<Len do
  Source:=Source+PadChar;
 Result:=Source;
end;

function  PadString(Source : String;PadChar : Char;Len : Integer;Right : Boolean) : String;
begin
 if Right then
  Result:=PadRight(Source,PadChar,Len)
 else
  Result:=PadLeft(Source,PadChar,Len);
end;

function GetWordCount(s : string) : integer;
var
   n : integer;
begin
 Result:=0;
 s:=trim(s);
 n:=pos(#32,s);
 while n>0 do
  begin
   delete(s,1,n);
   s:=trim(s);
   n:=pos(#32,s);
   inc(Result);
  end;
 if s<>'' then
  inc(Result);
end;

function GetWordByIndex(s : string;nIndex : integer) : string;
var
   n : integer;
begin
 Result:='';
 with tStringList.Create do
  try
   s:=trim(s);
   n:=pos(#32,s);
   while n>0 do
    begin
     add(copy(s,1,n-1));
     system.delete(s,1,n);
     s:=trim(s);
     n:=pos(#32,s);
    end;

   if s<>'' then
    add(s);


   if nIndex<1 then
    nIndex:=0
   else
    dec(nIndex);

   if Count>nIndex then
    Result:=strings[nIndex];


  finally
   free;
  end;
end;

function CarcaseExists(NatCareId : String; const AReImportSale : Boolean = False) : integer;
var
   bNatIdFound : Boolean;
   sNatId,
   sNatIDStart : String;
begin
   Result := -1;
   NatCareId := UPPERCASE(Trim(NatCareId));
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         RequestLive := True;
         if ( NatIDKind(NatCareId) = nkUK9 ) then
            begin
               //   19/03/09 [V3.9 R6.6] /MK Bug Fix - Change to SQL and Params to show animals in herd for UK9
               NatCareId := UK9NatIDNumber.CreateLocateNatID(NatCareId);
               SQL.Add('SELECT ID');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE (LocateNatID = "'+NatCareID+'")');
               SQL.Add('AND   (InHerd = True)');
               SQL.Add('AND   (AnimalDeleted = False)');
               SQL.Add('AND   (HerdID = '+IntToStr(WinData.UserDefaultHerdID)+')');
            end
         else if ( Length(NatCareId) >= 12 ) then
            begin
               SQL.Add('SELECT ID');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE (SearchNatID LIKE "%'+StripAllSpaces(NatCareID)+'%")');
               if ( not(AReImportSale) ) then
                  SQL.Add('AND   (InHerd = True)');
               SQL.Add('AND   (AnimalDeleted = False)');
               SQL.Add('AND   (HerdID = '+IntToStr(WinData.UserDefaultHerdID)+')');
            end;
         Open;
         if ( RecordCount > 0 ) then
            begin
               Result := Fields[0].AsInteger;
               SQL.Clear;
               SQL.Add('SELECT AID');
               SQL.Add('FROM Movements');
               SQL.Add('WHERE (StillOffFarm = TRUE)');
               SQL.Add('AND   (AID IN (SELECT ID');
               SQL.Add('               FROM Animals');
               SQL.Add('               WHERE (LocateNatID LIKE "%'+StripAllSpaces(NatCareId)+'%")))');
               try
                  Open;
                  if ( RecordCount > 0 ) then
                     Result := -1;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;
      finally
         if ( Active ) then
            Close;
         Free;
      end;
end;

end.
