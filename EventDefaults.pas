{
  06/03/14 [V5.2 R8.8] /MK Additional Feature - Stored Technician/Inseminator as part of TServiceRecordDefaults.
}

unit EventDefaults;

interface
uses
   Forms, SysUtils, IniFiles, kRoutines;

const
   cDefaultsFile = 'Ini\eventdefaults.ini';
   cServiceDefaultsSection = 'ServiceDefaults';
   cBullingDefaultsSection = 'BullingDefaults';

type
  TEventRecordDefaults = Class
  private
    FIniFile : TIniFile;
    FComment: ShortString;
    FEventDate: TDateTime;
    FStoreEventDate: Boolean;
    FStoreComment: Boolean;
    procedure SetComment(const Value: ShortString);
    procedure SetEventDate(const Value: TDateTime);
    procedure SetStoreComment(const Value: Boolean);
    procedure SetStoreEventDate(const Value: Boolean);
    function GetComment: ShortString;
    function GetEventDate: TDateTime;
    procedure SaveToFile(const FileName : string);virtual; abstract;
    procedure LoadFromFile(const FileName : string);virtual; abstract;
  public
    constructor create;
    destructor Destroy;override;
    procedure StoreAll; virtual;
    procedure StoreNone; virtual;
    property EventDate : TDateTime read GetEventDate write SetEventDate;
    property Comment : ShortString read GetComment write SetComment;
    property StoreEventDate : Boolean read FStoreEventDate write SetStoreEventDate;
    property StoreComment : Boolean read FStoreComment write SetStoreComment;
  end;

  TServiceTabDefault = (stdAnimalNo, stdBullUsed );
  TServiceRecordDefaults = class (TEventRecordDefaults)
  private
    FServiceType: Integer;
    FNumOfStraws: Integer;
    FBullUsed: Integer;
    FInseminator: Integer;
    FStoreNumOfStraws: Boolean;
    FStoreBullUsed: Boolean;
    FStoreServiceType: Boolean;
    FServiceTabDefault: TServiceTabDefault;
    FStoreInseminator: Boolean;
    procedure SetBullUsed(const Value: Integer);
    procedure SetNumOfStraws(const Value: Integer);
    procedure SetServiceType(const Value: Integer);
    procedure SetInseminator(const Value: Integer);
    procedure SetStoreBullUsed(const Value: Boolean);
    procedure SetStoreNumOfStraws(const Value: Boolean);
    procedure SetStoreServiceType(const Value: Boolean);
    procedure SetStoreInseminator(const Value: Boolean);
    function GetBullUsed: Integer;
    function GetNumOfStraws: Integer;
    function GetServiceType: Integer;
    function GetInseminator: Integer;
    procedure SetServiceTabDefault(const Value: TServiceTabDefault);
    procedure SaveToFile(const FileName : string);override;
    procedure LoadFromFile(const FileName : string);override;
  public
    constructor create;
    destructor Destroy;override;
    procedure StoreAll; override;
    procedure StoreNone; override;
    property NumOfStraws : Integer read GetNumOfStraws write SetNumOfStraws;
    property BullUsed : Integer read GetBullUsed write SetBullUsed;
    property ServiceType : Integer read GetServiceType write SetServiceType;
    property Inseminator : Integer read GetInseminator write SetInseminator;
    property StoreNumOfStraws : Boolean read FStoreNumOfStraws write SetStoreNumOfStraws;
    property StoreBullUsed : Boolean read FStoreBullUsed write SetStoreBullUsed;
    property StoreServiceType : Boolean read FStoreServiceType write SetStoreServiceType;
    property StoreInseminator : Boolean read FStoreInseminator write SetStoreInseminator;
    property ServiceTabDefault : TServiceTabDefault read FServiceTabDefault write SetServiceTabDefault;
  end;

  TBullingTabDefault = (btdAnimalNo, btdPlannedBull );
  TBullingRecordDefaults = class(TEventRecordDefaults)
  private
    FStorePlannedBull: Boolean;
    FBullingTabDefault: TBullingTabDefault;
    FPlannedBull: Integer;
    FStoreObservedBy: Boolean;
    FObservedBy: Integer;
    procedure SetBullingTabDefault(const Value: TBullingTabDefault);
    procedure SetStorePlannedBull(const Value: Boolean);
    procedure SetPlannedBull(const Value: Integer);
    procedure SetObservedBy(const Value: Integer);
    procedure SetStoreObservedBy(const Value: Boolean);
  protected
    procedure SaveToFile(const FileName : string);override;
    procedure LoadFromFile(const FileName : string);override;
  public
    procedure StoreAll; override;
    procedure StoreNone; override;
    property PlannedBull : Integer read FPlannedBull write SetPlannedBull;
    property StorePlannedBull : Boolean read FStorePlannedBull write SetStorePlannedBull;
    property ObservedBy : Integer read FObservedBy write SetObservedBy;
    property StoreObservedBy : Boolean read FStoreObservedBy write SetStoreObservedBy;
    property BullingTabDefault : TBullingTabDefault read FBullingTabDefault write SetBullingTabDefault;
  end;

  function ServiceDefaults : TServiceRecordDefaults;
  function BullingDefaults : TBullingRecordDefaults;


const
   IDOK = 1;

var
   ServiceDefs : TServiceRecordDefaults;
   BullingDefs : TBullingRecordDefaults;

implementation

  function ServiceDefaults : TServiceRecordDefaults;
  begin
     Result := nil;
     if Assigned(ServiceDefs) then
        Result := ServiceDefs;
  end;

  function BullingDefaults : TBullingRecordDefaults;
  begin
     Result := nil;
     if Assigned(BullingDefs) then
        Result := BullingDefs;
  end;

{ TEventRecordDefaults }

constructor TEventRecordDefaults.create;
begin
   LoadFromFile(ApplicationPath + cDefaultsFile);
end;

destructor TEventRecordDefaults.Destroy;
begin
  SaveToFile(ApplicationPath + cDefaultsFile);
  inherited;
end;

function TEventRecordDefaults.GetComment: ShortString;
begin
   Result := '';
   if ( FComment <> '' ) and ( StoreComment ) then
      Result := FComment;
end;

function TEventRecordDefaults.GetEventDate: TDateTime;
begin
   if ( FEventDate > 0 ) and ( FStoreEventDate ) then
      Result := FEventDate
   else
      Result := Date;
end;

procedure TEventRecordDefaults.SetComment(const Value: ShortString);
begin
  FComment := Value;
end;

procedure TEventRecordDefaults.SetEventDate(const Value: TDateTime);
begin
  FEventDate := Value;
end;

procedure TEventRecordDefaults.SetStoreComment(const Value: Boolean);
begin
  FStoreComment := Value;
end;

procedure TEventRecordDefaults.SetStoreEventDate(const Value: Boolean);
begin
  FStoreEventDate := Value;
end;

procedure TEventRecordDefaults.StoreAll;
begin
   FStoreEventDate := TRUE;
   FStoreComment := TRUE;
end;

procedure TEventRecordDefaults.StoreNone;
begin
   FStoreEventDate := FALSE;
   FStoreComment := FALSE;
end;

{ TServiceRecordDefaults }

constructor TServiceRecordDefaults.create;
begin
  inherited Create;
end;

destructor TServiceRecordDefaults.Destroy;
begin
  inherited Destroy;
end;

function TServiceRecordDefaults.GetBullUsed: Integer;
begin
   if ( FBullUsed > 0 ) and ( StoreBullUsed ) then
      Result := FBullUsed
   else
      Result := 0;
end;

function TServiceRecordDefaults.GetInseminator: Integer;
begin
   if ( FInseminator > 0 ) and ( StoreInseminator ) then
      Result := FInseminator
   else
      Result := 0;
end;

function TServiceRecordDefaults.GetNumOfStraws: Integer;
begin
   if ( FNumOfStraws > 0 ) and ( StoreNumOfStraws ) then
      Result := FNumOfStraws
   else
      Result := 1;
end;

function TServiceRecordDefaults.GetServiceType: Integer;
begin
   if ( FServiceType > 0 ) and ( StoreServiceType ) then
      Result := FServiceType
   else
      Result := 0;
end;

procedure TServiceRecordDefaults.LoadFromFile(const FileName: string);
begin
   FIniFile  := TIniFile.Create(FileName);
   try
      FComment := FIniFile.ReadString(cServiceDefaultsSection, 'Comment', '');
      FStoreComment := FIniFile.ReadBool(cServiceDefaultsSection, 'StoreComment', False);

      FEventDate := FIniFile.ReadDateTime(cServiceDefaultsSection, 'EventDate', 0);
      FStoreEventDate := FIniFile.ReadBool(cServiceDefaultsSection, 'StoreEventDate', False);

      FServiceType := FIniFile.ReadInteger(cServiceDefaultsSection, 'ServiceType', 1);
      FStoreServiceType := FIniFile.ReadBool(cServiceDefaultsSection, 'StoreServiceType', False);

      FInseminator := FIniFile.ReadInteger(cServiceDefaultsSection, 'Inseminator', 1);
      FStoreInseminator := FIniFile.ReadBool(cServiceDefaultsSection, 'StoreInseminator', False);

      FBullUsed := FIniFile.ReadInteger(cServiceDefaultsSection, 'BullUsed', 0);
      FStoreBullUsed := FIniFile.ReadBool(cServiceDefaultsSection, 'StoreBullUsed', False);

      FNumOfStraws := FIniFile.ReadInteger(cServiceDefaultsSection, 'NumOfStraws', 1);
      FStoreNumOfStraws := FIniFile.ReadBool(cServiceDefaultsSection, 'StoreNumOfStraws', False);

      FServiceTabDefault := TServiceTabDefault( FIniFile.ReadInteger(cServiceDefaultsSection, 'ServiceTabDefault', 0) );
   finally
      FIniFile.Free;
   end;
end;

procedure TServiceRecordDefaults.SaveToFile(const FileName: string);
begin
   FIniFile  := TIniFile.Create(FileName);
   try
      FIniFile.WriteString(cServiceDefaultsSection, 'Comment', FComment);
      FIniFile.WriteBool(cServiceDefaultsSection, 'StoreComment', FStoreComment);

      FIniFile.WriteDateTime(cServiceDefaultsSection, 'EventDate', FEventDate);
      FIniFile.WriteBool(cServiceDefaultsSection, 'StoreEventDate', FStoreEventDate);

      FIniFile.WriteInteger(cServiceDefaultsSection, 'ServiceType', FServiceType);
      FIniFile.WriteBool(cServiceDefaultsSection, 'StoreServiceType', FStoreServiceType);

      FIniFile.WriteInteger(cServiceDefaultsSection, 'Inseminator', FInseminator);
      FIniFile.WriteBool(cServiceDefaultsSection, 'StoreInseminator', FStoreInseminator);

      FIniFile.WriteInteger(cServiceDefaultsSection, 'BullUsed', FBullUsed);
      FIniFile.WriteBool(cServiceDefaultsSection, 'StoreBullUsed', FStoreBullUsed);

      FIniFile.WriteInteger(cServiceDefaultsSection, 'NumOfStraws', FNumOfStraws);
      FIniFile.WriteBool(cServiceDefaultsSection, 'StoreNumOfStraws', FStoreNumOfStraws);

      FIniFile.WriteInteger(cServiceDefaultsSection, 'ServiceTabDefault', Ord(FServiceTabDefault));
   finally
      FIniFile.Free;
   end;
end;

procedure TServiceRecordDefaults.SetBullUsed(const Value: Integer);
begin
   FBullUsed := Value;
end;

procedure TServiceRecordDefaults.SetInseminator(const Value: Integer);
begin
   FInseminator := Value;
end;

procedure TServiceRecordDefaults.SetNumOfStraws(const Value: Integer);
begin
   FNumOfStraws := Value;
end;

procedure TServiceRecordDefaults.SetServiceTabDefault(
  const Value: TServiceTabDefault);
begin
   FServiceTabDefault := Value;
end;

procedure TServiceRecordDefaults.SetServiceType(const Value: Integer);
begin
   FServiceType := Value;
end;

procedure TServiceRecordDefaults.SetStoreBullUsed(const Value: Boolean);
begin
   FStoreBullUsed := Value;
end;

procedure TServiceRecordDefaults.SetStoreInseminator(const Value: Boolean);
begin
   FStoreInseminator := Value;
end;

procedure TServiceRecordDefaults.SetStoreNumOfStraws(const Value: Boolean);
begin
   FStoreNumOfStraws := Value;
end;

procedure TServiceRecordDefaults.SetStoreServiceType(const Value: Boolean);
begin
   FStoreServiceType := Value;
end;

procedure TServiceRecordDefaults.StoreAll;
begin
   inherited;
   FStoreNumOfStraws := TRUE;
   FStoreBullUsed := TRUE;
   FStoreServiceType := TRUE;
   FStoreInseminator := TRUE;
end;

procedure TServiceRecordDefaults.StoreNone;
begin
   inherited;
   FStoreNumOfStraws := FALSE;
   FStoreBullUsed := FALSE;
   FStoreServiceType := FALSE;
   FStoreInseminator := FALSE;
end;

{ TBullingRecordDefaults }

procedure TBullingRecordDefaults.LoadFromFile(const FileName: string);
begin
   FIniFile  := TIniFile.Create(FileName);
   try
      FComment := FIniFile.ReadString(cBullingDefaultsSection, 'Comment', '');
      FStoreComment := FIniFile.ReadBool(cBullingDefaultsSection, 'StoreComment', False);

      FEventDate := FIniFile.ReadDateTime(cBullingDefaultsSection, 'EventDate', 0);
      FStoreEventDate := FIniFile.ReadBool(cBullingDefaultsSection, 'StoreEventDate', False);

      FPlannedBull := FIniFile.ReadInteger(cBullingDefaultsSection, 'PlannedBull', 0);
      FStorePlannedBull := FIniFile.ReadBool(cBullingDefaultsSection, 'StorePlannedBull', False);

      FObservedBy :=  FIniFile.ReadInteger(cBullingDefaultsSection, 'ObservedBy', 0);
      FStoreObservedBy := FIniFile.ReadBool(cBullingDefaultsSection, 'StoreObservedBy', False);

      FBullingTabDefault := TBullingTabDefault( FIniFile.ReadInteger(cBullingDefaultsSection, 'BullingTabDefault', 0) );
   finally
      FIniFile.Free;
   end;
end;

procedure TBullingRecordDefaults.SaveToFile(const FileName: string);
begin
   FIniFile  := TIniFile.Create(FileName);
   try
      FIniFile.WriteString(cBullingDefaultsSection, 'Comment', FComment);
      FIniFile.WriteBool(cBullingDefaultsSection, 'StoreComment', FStoreComment);

      FIniFile.WriteDateTime(cBullingDefaultsSection, 'EventDate', FEventDate);
      FIniFile.WriteBool(cBullingDefaultsSection, 'StoreEventDate', FStoreEventDate);

      FIniFile.WriteInteger(cBullingDefaultsSection, 'PlannedBull', FPlannedBull);
      FIniFile.WriteBool(cBullingDefaultsSection, 'StorePlannedBull', FStorePlannedBull);

      FIniFile.WriteInteger(cBullingDefaultsSection, 'ObservedBy', FObservedBy);
      FIniFile.ReadBool(cBullingDefaultsSection, 'StoreObservedBy', FStoreObservedBy);

      FIniFile.WriteInteger(cBullingDefaultsSection, 'BullingTabDefault', Ord(FBullingTabDefault));
   finally
      FIniFile.Free;
   end;
end;

procedure TBullingRecordDefaults.SetBullingTabDefault(
  const Value: TBullingTabDefault);
begin
  FBullingTabDefault := Value;
end;

procedure TBullingRecordDefaults.SetObservedBy(const Value: Integer);
begin
  FObservedBy := Value;
end;

procedure TBullingRecordDefaults.SetPlannedBull(const Value: Integer);
begin
  FPlannedBull := Value;
end;

procedure TBullingRecordDefaults.SetStoreObservedBy(const Value: Boolean);
begin
  FStoreObservedBy := Value;
end;

procedure TBullingRecordDefaults.SetStorePlannedBull(const Value: Boolean);
begin
  FStorePlannedBull := Value;
end;

procedure TBullingRecordDefaults.StoreAll;
begin
  inherited StoreAll;
  FStorePlannedBull := True;
  FStoreObservedBy  := True;
end;

procedure TBullingRecordDefaults.StoreNone;
begin
  inherited StoreNone;
  FStorePlannedBull := False;
  FStoreObservedBy  := False;
end;

initialization
   ServiceDefs := TServiceRecordDefaults.Create;
   BullingDefs := TBullingRecordDefaults.Create;

finalization
   if Assigned( ServiceDefs ) then
      ServiceDefs.Free;
   if Assigned( BullingDefs ) then
      BullingDefs.Free;

end.
