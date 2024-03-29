unit KActionList;

interface

uses
   Classes, Sysutils, IniFiles, GenTypesConst;

type
   TKActionList = class
   private
     FFileName : String;
     FIniFile : TIniFile;
     FIniBackup : TStringList;
     FActionListUpdated: Boolean;
     function GetServiceEnabled: Boolean;
     procedure SetServiceEnabled(const Value: Boolean);
     function GetServiceInterval: Integer;
     procedure SetServiceInterval(const Value: Integer);
     function GetPregDiagEnabled: Boolean;
     function GetPregDiagInterval: Integer;
     procedure SetPregDiagEnabled(const Value: Boolean);
     procedure SetPregDiagInterval(const Value: Integer);
     function GetDryOffEnabled: Boolean;
     function GetDryOffInterval: Integer;
     procedure SetDryOffEnabled(const Value: Boolean);
     procedure SetDryOffInterval(const Value: Integer);
     function GetCalveEnabled: Boolean;
     function GetCalveInterval: Integer;
     procedure SetCalveEnabled(const Value: Boolean);
     procedure SetCalveInterval(const Value: Integer);
     function GetEnabled: Boolean;
     procedure SetEnabled(const Value: Boolean);
     function GetReportsToRun: TActionReminderReports;
     function GetServiceEndDate: TDateTime;
     function GetPregDiagEndDate: TDateTime;
     function GetDryOffEndDate: TDateTime;
     function GetCalveEndDate: TDateTime;
     procedure Check;
   public
     constructor Create;
     destructor Destroy;override;
     procedure CancelUpdates;
     property Enabled : Boolean read GetEnabled write SetEnabled;
     property ServiceEnabled : Boolean read GetServiceEnabled write SetServiceEnabled;
     property ServiceInterval : Integer read GetServiceInterval write SetServiceInterval;
     property PregDiagEnabled : Boolean read GetPregDiagEnabled write SetPregDiagEnabled;
     property PregDiagInterval : Integer read GetPregDiagInterval write SetPregDiagInterval;
     property DryOffEnabled : Boolean read GetDryOffEnabled write SetDryOffEnabled;
     property DryOffInterval : Integer read GetDryOffInterval write SetDryOffInterval;
     property CalveEnabled : Boolean read GetCalveEnabled write SetCalveEnabled;
     property CalveInterval : Integer read GetCalveInterval write SetCalveInterval;
     property ServiceEndDate : TDateTime read GetServiceEndDate;
     property PregDiagEndDate : TDateTime read GetPregDiagEndDate;
     property DryOffEndDate : TDateTime read GetDryOffEndDate;
     property CalveEndDate : TDateTime read GetCalveEndDate;
     property ReportsToRun : TActionReminderReports read GetReportsToRun;
     property Updated : Boolean read FActionListUpdated;
   end;

const
   IniFileNamePath = 'Ini\actrmd.ini';
   cALSection = 'ActionList';
   cALServSect = 'Service';
   cALPDSection = 'PD';
   cALDryOffSect = 'DryOff';
   cALCalveSect = 'Calve';
   cALEnabled = 'Enabled';
   cALIntervalDays = 'IntervalDays';

implementation

{ TActionList }

procedure TKActionList.CancelUpdates;
begin
   if Updated then
      FIniBackup.SaveToFile(ExtractFilePath(ParamStr(0)) + IniFileNamePath);
end;

procedure TKActionList.Check;
begin
   if FIniFile = nil then
      raise Exception.Create('Inifile is not assigned');
end;

constructor TKActionList.Create;
begin
  FFileName := ExtractFilePath(ParamStr(0)) + IniFileNamePath;
  FIniFile := TIniFile.Create(FFileName);
  if not FileExists(FFileName) then
     begin
        FIniFile.WriteBool(cALSection, cALEnabled, False);


        FIniFile.WriteBool(cALServSect, cALEnabled, False);
        FIniFile.WriteInteger(cALServSect, cALIntervalDays, 7); // Default 7 days

        FIniFile.WriteBool(cALPDSection, cALEnabled, False);
        FIniFile.WriteInteger(cALPDSection, cALIntervalDays, 7);

        FIniFile.WriteBool(cALDryOffSect, cALEnabled, False);
        FIniFile.WriteInteger(cALDryOffSect, cALIntervalDays, 7);

        FIniFile.WriteBool(cALCalveSect, cALEnabled, False);
        FIniFile.WriteInteger(cALCalveSect, cALIntervalDays, 7);

     end;
  FIniBackup := TStringList.Create;
  FIniBackup.LoadFromFile(FIniFile.FileName);
  FActionListUpdated := False;
end;

destructor TKActionList.Destroy;
begin
   if FIniFile <> nil then
      FreeAndNil(FIniFile);
   if FIniBackup <> nil then
      FreeAndNil(FIniBackup);
end;

function TKActionList.GetCalveEnabled: Boolean;
begin
   Result := FIniFile.ReadBool(cALCalveSect, cALEnabled, False);
end;

function TKActionList.GetCalveEndDate: TDateTime;
begin
   Result := Date;
   if ( CalveInterval > 0 ) then
      Result := Date + CalveInterval;
end;

function TKActionList.GetCalveInterval: Integer;
begin
   Result := FIniFile.ReadInteger(cALCalveSect, cALIntervalDays, 7);
end;

function TKActionList.GetDryOffEnabled: Boolean;
begin
   Result := FIniFile.ReadBool(cALDryOffSect, cALEnabled, False);
end;

function TKActionList.GetDryOffEndDate: TDateTime;
begin
   Result := Date;
   if ( DryOffInterval > 0 ) then
      Result := Date + DryOffInterval;
end;

function TKActionList.GetDryOffInterval: Integer;
begin
   Result := FIniFile.ReadInteger(cALDryOffSect, cALIntervalDays, 7);
end;

function TKActionList.GetEnabled: Boolean;
begin
   Result := FIniFile.ReadBool(cALSection, cALEnabled, False);
end;

function TKActionList.GetPregDiagEnabled: Boolean;
begin
   Result := FIniFile.ReadBool(cALPDSection, cALEnabled, False);
end;

function TKActionList.GetPregDiagEndDate: TDateTime;
begin
   Result := Date;
   if ( PregDiagInterval > 0 ) then
      Result := Date + PregDiagInterval;
end;

function TKActionList.GetPregDiagInterval: Integer;
begin
   Result := FIniFile.ReadInteger(cALPDSection, cALIntervalDays, 7);
end;

function TKActionList.GetReportsToRun: TActionReminderReports;
begin
   Result := [];
   if ServiceEnabled then
      Include(Result, arDueService);
   if PregDiagEnabled then
      Include(Result, arDuePD);
   if DryOffEnabled then
      Include(Result, arDueDryOff);
   if CalveEnabled then
      Include(Result, arDueCalve);
end;

function TKActionList.GetServiceEnabled: Boolean;
begin
   Result := FIniFile.ReadBool(cALServSect, cALEnabled, False);
end;

function TKActionList.GetServiceEndDate: TDateTime;
begin
   Result := Date;
   if ( ServiceInterval > 0 ) then
      Result := Date + ServiceInterval;
end;

function TKActionList.GetServiceInterval: Integer;
begin
   Result := FIniFile.ReadInteger(cALServSect, cALIntervalDays, 7);
end;

procedure TKActionList.SetCalveEnabled(const Value: Boolean);
begin
   FIniFile.WriteBool(cALCalveSect, cALEnabled, Value);
   FActionListUpdated := True;
end;

procedure TKActionList.SetCalveInterval(const Value: Integer);
begin
   FIniFile.WriteInteger(cALCalveSect, cALIntervalDays, Value);
   FActionListUpdated := True;
end;

procedure TKActionList.SetDryOffEnabled(const Value: Boolean);
begin
   FIniFile.WriteBool(cALDryOffSect, cALEnabled, Value);
   FActionListUpdated := True;
end;

procedure TKActionList.SetDryOffInterval(const Value: Integer);
begin
   FIniFile.WriteInteger(cALDryOffSect, cALIntervalDays, Value);
   FActionListUpdated := True;
end;

procedure TKActionList.SetEnabled(const Value: Boolean);
begin
   FIniFile.WriteBool(cALSection, cALEnabled, Value);
   FActionListUpdated := True;
   ServiceEnabled := Value;
   PregDiagEnabled := Value;
   DryOffEnabled := Value;
   CalveEnabled := Value;
end;

procedure TKActionList.SetPregDiagEnabled(const Value: Boolean);
begin
   FIniFile.WriteBool(cALPDSection, cALEnabled, Value);
   FActionListUpdated := True;
end;

procedure TKActionList.SetPregDiagInterval(const Value: Integer);
begin
   FIniFile.WriteInteger(cALPDSection, cALIntervalDays, Value);
   FActionListUpdated := True;
end;

procedure TKActionList.SetServiceEnabled(const Value: Boolean);
begin
   FIniFile.WriteBool(cALServSect, cALEnabled, Value);
   FActionListUpdated := True;
end;

procedure TKActionList.SetServiceInterval(const Value: Integer);
begin
   FIniFile.WriteInteger(cALServSect, cALIntervalDays, Value);
   FActionListUpdated := True;
end;

end.
