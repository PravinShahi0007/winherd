{
   04/12/13 [V5.2 R6.6] /MK Bug Fix - AddToGroup - Only show warning for animal in group if Feed Group.

   16/03/16 [V5.5 R5.4] /MK Change - GroupListQuery - Added order by Description - Anne Ryan request.

   06/04/17 [V5.6 R8.0] /MK Bug Fix - AddToGroup - If animal was moved to a new group it was deleted from old group but was not added to new group.

   14/09/17 [V5.7 R3.0] /MK Change - Removed prompt for ShowConfirmMsg on adding feed events for the animals as new uAllocteFeedToAnimal takes care of this.
                            Bug Fix - Assigning FeedRegimeID was missing from AddToGroup.
                                    - Check for accurate AllocationDate i.e based on purchase date or date of birth was missing from AddToGroup
                                      when comparing AddToGroup in uGroupSetup and DairyData.

   19/09/17 [V5.7 R3.0] /MK Change - AddToGroup - Removed the requirement of passing in GroupType string as we can get GroupType by GroupID that is passed in.
                                                - If feed group and group has active feed regime then proceed with feed events.
                                                - If the group is a feed group and it has an active feed regime and DateJoined is after the
                                                  AnimalLeftHerdDate then don't add the animal to the group which will in turn not feed the animal.
                                   - Changed AnimalInGrp to AnimalInThisGroup to be more descriptive.

   22/09/17 [V5.7 R3.0] /MK Change - Removed all feed related functions and procedures from GroupManager as they are moved to new Feeds unit.
                                   - Removed DeleteFromExistingGroup and RemoveAnimalFromGrp procedures as there was already a RemoveAnimalFromGrp procedure that was doing the same thing.

   11/06/19 [V5.8 R9.4] /MK Change - AddToGroup - Removed Weaning messages if Sale Group and Sale Date provided - Ivan Tanner.

   05/11/19 [V5.9 R1.1] /MK Bug Fix - AddToGroup - Even if not(AllowDeletion), if the new group is Feed then Remove Animal from CurrentGroupID.

   02/07/21 [V6.0 R1.5] /MK Change - AddToGroup/RemoveAnimalFromGrp - Update the Pen Name field in the animals table - only remove Pen Name if animal is removed from a group but not after sale.
}

unit Groups;

interface

uses
   Classes, Windows, SysUtils, db, dbtables, GenTypesConst, Dialogs,
   DateUtil, uEventDataHelper, uHerdSync, uAnimal, uApplicationLog;

type
   GroupTypes = set of TGroupType;
   TVarArray = array of Variant;

   TGroup = class
   private
    FGroupId: Integer;
    FDescription: string;
    FCode: string;
    FGroupType: TGroupType;
   public
      property GroupId : Integer read FGroupId write FGroupId;
      property Code : string read FCode write FCode;
      property Description : string read FDescription write FDescription;
      property GroupType : TGroupType read FGroupType write FGroupType;
   end;

   TGroupManager = class
   private
      FEventDataHelper : TEventDataHelper;
      GlobalSettings : TGlobalSettings;
      QueryGroup : TQuery;
      GroupListQuery : TQuery;
      function MinimumDaysOnFarm : Integer;
   public
      GroupListDatasource : TDataSource;
      constructor create;
      destructor destroy;override;
      function GetGroupData(AGroupID : Integer; AFieldName : string) : TVarArray;
      function GetAnimalsExistGroupIDs(const AnimalID : Integer; const AGroupType : TGroupType = gtNone;
         const AAnimalExistingGroupID : Integer = 0) : PIntegerArray;
      function GetGroupID(AGroupName, AGroupType : String ) : Integer; overload;
      procedure QueryGroupList( const AGroupTypes : GroupTypes = [] );
      procedure GetGroups(const AID : Integer; var PGroup, BGroup, FGroup, SGroup, DGroup : Integer );
      function GetNumberOfAnimalsInGroup(const GrpID : Integer) : Integer;
      function DateJoinedGroup(const AnimalID, GrpID : Integer) : TDateTime;
      function EarliestRegimeStartDate(const GrpID : Integer) : TDateTime;
      function AnimalInThisGroup(const AID, GrpID: Integer): Boolean;
      function GetGroupIDGroupType(const AGroupId : Integer ) : TGroupType;
      function GetGroupTypeFromGroupTypeStr(AGroupTypeStr : String) : TGroupType;
      function RemoveAnimalFromGrp(const AAnimalID : Integer; const AGroupID : Integer; const ASoldAnimal : Boolean = False) : Boolean;
      function AddToGroup(AID, GroupID: Integer; AllowDeletion: Boolean;
         const DateJoined: TDateTime; const ATagNo: String = '';
         const ShowConfirmMsg : Boolean = True;
         const CheckForPreviousFeedGroup : Boolean = True ): Boolean;
      function AddToBatchGroup(const AGroupID, AAnimalId: Integer; const ATagNo : string = '' ) : Boolean;
      function GetAnimalsInGroup(const AGroupId : Integer) : TIntegerArray;
      function GroupHasActiveFeedRegime(AGroupID : Integer) : Boolean;
      function CreateGroup (AGroupName : String; AGroupType : TGroupType) : Integer;
      function CreateNewGroupCode (AGroupType : TGroupType) : String;
      function GroupTypeStringFromType (AGroupType : TGroupType) : String;
   end;

const
  // Grps GroupTypes constants
  cPurchaseGroup = 'Purchase';
  cSalesGroup    = 'Sales';
  cFeedGroup     = 'Feed';
  cBatchGroup    = 'Batch';

implementation
uses
   KRoutines, KDBRoutines, uHerdLookup;

{ TGroups }

constructor TGroupManager.create;
begin
   GroupListQuery := TQuery.Create(nil);
   GroupListQuery.DatabaseName := AliasName;

   QueryGroup := TQuery.Create(nil);
   QueryGroup.DatabaseName := AliasName;

   GroupListDatasource := TDataSource.Create(nil);
   GroupListDatasource.DataSet := GroupListQuery;

   FEventDataHelper := TEventDataHelper.Create;
end;

destructor TGroupManager.destroy;
begin
  GroupListDatasource.DataSet := nil;
  FreeAndNil(GroupListDatasource);

  GroupListQuery.Close;
  FreeAndNil(GroupListQuery);
  FreeAndNil(QueryGroup);
  if FEventDataHelper <> nil then
     FreeAndNil(FEventDataHelper);
  inherited;
end;

procedure TGroupManager.QueryGroupList(const AGroupTypes : GroupTypes = []);
var
  sl : TStringList;
  SGroupTypes : string;
  i : Integer;
begin
   GroupListDatasource.Enabled := False;
   if AGroupTypes = [] then
      begin
         GroupListQuery.Close;
         Exit;
      end;

   sl := TStringList.Create;
   try
      if gtFeed in AGroupTypes then
         sl.Add(QuotedStr(GroupTypesArray[gtFeed]));
      if gtBatch in AGroupTypes then
         sl.Add(QuotedStr(GroupTypesArray[gtBatch]));
      if gtSales in AGroupTypes then
         sl.Add(QuotedStr(GroupTypesArray[gtSales]));
      if gtPurchase in AGroupTypes then
         sl.Add(QuotedStr(GroupTypesArray[gtPurchase]));
      if gtDrafting in AGroupTypes then
         sl.Add(QuotedStr(GroupTypesArray[gtDrafting]));

      if sl.Count > 1 then
         begin
            for i := 0 to sl.Count-1 do
               begin
                  if i = 0 then
                     SGroupTypes := '('+ sl.strings[i] + ','
                  else if i = sl.Count-1 then
                     SGroupTypes := SGroupTypes + sl.strings[i] + ')'
                  else
                     SGroupTypes := SGroupTypes + sl.strings[i] + ','
               end;
         end
      else
         SGroupTypes := '('+ sl.strings[0] +')';

      with GroupListQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT Distinct ID, Code, Description, GroupType');
            SQL.Add('FROM grps');
            SQL.Add('WHERE (GroupType IN '+SGroupTypes+')');
            SQL.Add('ORDER BY Description');
            Open;
         end;
   finally
     sl.Free;
     GroupListDatasource.Enabled := True;
   end;
end;

function TGroupManager.GetAnimalsExistGroupIDs(const AnimalID : Integer;
  const AGroupType : TGroupType = gtNone; const AAnimalExistingGroupID : Integer = 0 ) : PIntegerArray;
begin
   SetLength(Result,0);
   with QueryGroup do
      try
        SQL.Clear;
        SQL.Add('SELECT G.ID');
        SQL.Add('FROM Grps G');
        SQL.Add('LEFT JOIN Grplinks GL ON (GL.GroupID = G.ID)');
        SQL.Add('WHERE (GL.AnimalID = '+IntToStr(AnimalID)+')');
        if ( AGroupType <> gtNone ) then
           SQL.Add('AND   (UPPER(G.GroupType)= (' + UPPERCASE(QuotedStr(GroupTypesArray[AGroupType])) + '))');
        if ( AAnimalExistingGroupID > 0 ) then
           SQL.Add('AND   (G.ID <> '+IntToStr(AAnimalExistingGroupID)+')');
        Open;
        try
           First;
           while ( not(Eof) ) do
              begin
                 SetLength(Result,Length(Result)+1);
                 Result[Length(Result)-1] := Fields[0].AsInteger;
                 Next;
              end;
        finally
           Close;
        end;
     finally
     end;
end;

procedure TGroupManager.GetGroups(const AID: Integer; var PGroup, BGroup,
  FGroup, SGroup, DGroup: Integer);
begin
  PGroup := 0;
  BGroup := 0;
  FGroup := 0;
  SGroup := 0;
  DGroup := 0;
  with QueryGroup do
      try
        SQL.Clear;
        SQL.Add('SELECT gl.GroupID, G.GroupType FROM grplinks gl    ');
        SQL.Add('Left Join Grps G ON (gl.GroupID=G.ID) ');
        SQL.Add('WHERE (AnimalID=:AID)                 ');
        Params[0].AsInteger := AID;
        Open;
        try
           First;
           while not eof do
              begin
                 if FieldByName('GroupType').AsString = GroupTypesArray[gtFeed] then
                    FGroup := FieldByName('GroupID').AsInteger
                 else if FieldByName('GroupType').AsString = GroupTypesArray[gtBatch] then
                    BGroup := FieldByName('GroupID').AsInteger
                 else if FieldByName('GroupType').AsString = GroupTypesArray[gtSales] then
                    SGroup := FieldByName('GroupID').AsInteger
                 else if FieldByName('GroupType').AsString = GroupTypesArray[gtPurchase] then
                    PGroup := FieldByName('GroupID').AsInteger
                 else if FieldByName('GroupType').AsString = GroupTypesArray[gtDrafting] then
                    DGroup := FieldByName('GroupID').AsInteger;
                 Next;
              end

        finally
           Close;
        end;
     finally
     end;
end;

function TGroupManager.GetNumberOfAnimalsInGroup(const GrpID: Integer): Integer;
begin
   Result := 0;
   if GrpID <= 0 then Exit;
   with QueryGroup do
      try
         SQL.Clear;
         SQL.Add('Select Count(AnimalID) NoInGroup From GrpLinks Where GroupID =:GID');
         Params[0].AsInteger := GrpID;
         Open;
         try
            Result := FieldByName('NoInGroup').AsInteger;
         finally
            Close;
         end;
      finally
      end;
end;

function TGroupManager.DateJoinedGroup(const AnimalID,
  GrpID: Integer): TDateTime;
begin
   Result := 0;
   if ( AnimalID <= 0 ) or ( GrpID <= 0 ) then Exit;
   with QueryGroup do
      try
         SQL.Clear;
         SQL.Add('Select DateJoined From GrpLinks Where AnimalID = :AID AND GroupID =:GID');
         Params[0].AsInteger := AnimalID;
         Params[1].AsInteger := GrpID;
         Open;
         try
            Result := FieldByName('DateJoined').AsDateTime;
         finally
            Close;
         end;
      finally
      end;
end;

function TGroupManager.EarliestRegimeStartDate(const GrpID: Integer): TDateTime;
begin
   Result := 0;
   if ( GrpID <= 0 ) then Exit;
   with QueryGroup do
      try
         SQL.Clear;
         SQL.Add('SELECT Min(AllocDate) MinAllocDate');
         SQL.Add('FROM FeedRegime FR');
         SQL.Add('WHERE GroupID =:GID ');
         Params[0].AsInteger := GrpID;
         Open;
         try
            Result := FieldByName('MinAllocDate').AsDateTime;
         finally
            Close;
         end;
      finally
      end;
end;

function TGroupManager.AnimalInThisGroup(const AID, GrpID: Integer): Boolean;
begin
   Result := False;
   if ( AID <= 0 ) then Exit;
   with QueryGroup do
      try
         SQL.Clear;
         SQL.Add('SELECT AnimalID');
         SQL.Add('FROM GrpLinks');
         SQL.Add('WHERE AnimalID =:AID ');
         SQL.Add('AND   GroupID =:AGID ');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := GrpID;
         Open;
         try
            Result := RecordCount = 1;
         finally
            Close;
         end;
      except
      end;
end;

function TGroupManager.GetGroupIDGroupType(const AGroupId : Integer ) : TGroupType;
var
   Value : string;
begin
   Result := gtNone;
   with QueryGroup do
       try
         SQL.Clear;
         SQL.Add('SELECT G.GroupType');
         SQl.Add('FROM grps G');
         SQL.Add('WHERE (G.ID = :GrpID)');
         Params[0].AsInteger := AGroupId;
         Open;
         try
            First;
            Value := FieldByName('GroupType').AsString;
            Result := GetGroupTypeFromGroupTypeStr(Value);
         finally
            Close;
         end;
      finally
      end;
end;

function TGroupManager.RemoveAnimalFromGrp(const AAnimalID : Integer; const AGroupID : Integer; const ASoldAnimal : Boolean = False) : Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM GrpLinks');
         SQL.Add('WHERE GroupID = :AGroupID');
         SQL.Add('AND   AnimalID = :AAnimalID');
         Params[0].AsInteger := AGroupID;
         Params[1].AsInteger := AAnimalID;
         try
            ExecSQL;

            if ( GetGroupIDGroupType(AGroupId) = gtFeed ) and ( not(ASoldAnimal) ) then
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('UPDATE Animals');
                  SQL.Add('SET PenName = ""');
                  SQL.Add('WHERE ID = :AID');
                  Params[0].AsInteger := AAnimalID;
                  ExecSQL;
               end;

            uHerdSync.ResetSyncFlagForGroup(AGroupID);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TGroupManager.AddToGroup(AID, GroupID: Integer;
   AllowDeletion: Boolean; const DateJoined: TDateTime;
   const ATagNo: String = ''; const ShowConfirmMsg : Boolean = True;
   const CheckForPreviousFeedGroup : Boolean = True ): Boolean;
var
   qFeed : TQuery;

   StatusInfo : TStatusInfo;

   SaleDate,
   CustomerID,
   GroupData : Variant;

   HerdType : THerdType;

   CheckWeaning : Boolean;

   CurrentGroupID,
   LactNo : Integer;

   WeaningDate,
   DateOfBirth,
   AnimalPurchDate,
   AnimalLeftHerdDate : TDateTime;

   FeedEvents : TTable;

   gtNewGroupType : TGroupType;

   AnimalInfo : TAnimal;

   AnimalNo,
   sSelectedGroupName : String;

   iaAnimalsExistGroupIDs : PIntegerArray;
begin
   Result := False;

   if ( AID <= 0 ) then
      begin
         MessageDlg('AnimalId must be specified.',mtError,[mbOK],0);
         Exit;
      end;

   if ( GroupID <= 0 ) then
      begin
         MessageDlg('GroupId must be specified.',mtError,[mbOK],0);
         Exit;
      end;

   try
      qFeed := TQuery.Create(nil);
      qFeed.DatabaseName := AliasName;

      GroupData := GetGroupData(GroupID,'Description, EventDate, DestSource');
      sSelectedGroupName := GroupData[0];

      AnimalInfo := GetAnimal(AID);
      DateOfBirth := AnimalInfo.DateOfBirth;
      AnimalPurchDate := FEventDataHelper.GetAnimalPurchaseEventDate(AID);
      AnimalLeftHerdDate := FEventDataHelper.GetAnimalLeftHerdDate(AID);

      //   19/09/17 [V5.7 R3.0] /MK Change - Removed the requirement of passing in GroupType string as we can get GroupType by GroupID that is passed in.
      //Get TGroupType
      gtNewGroupType := GetGroupIDGroupType(GroupID);

      // if not already in group
      if ( not(AnimalInThisGroup(AID,GroupID)) ) then
         begin
            // check for animal record in another group
            SetLength(iaAnimalsExistGroupIDs,0);
            iaAnimalsExistGroupIDs := GetAnimalsExistGroupIDs(AID, gtNewGroupType);
            if ( Length(iaAnimalsExistGroupIDs) > 0 ) then
               CurrentGroupID := iaAnimalsExistGroupIDs[0]
            else
               CurrentGroupID := 0;

            //   19/09/17 [V5.7 R3.0] /MK Change - If the group is a feed group and it has an active feed regime and DateJoined is after the
            //                                     AnimalLeftHerdDate then don't add the animal to the group which will in turn not feed the animal.
            if ( gtNewGroupType = gtFeed ) and ( GroupHasActiveFeedRegime(GroupID) ) and ( (AnimalLeftHerdDate > 0) and (DateJoined > AnimalLeftHerdDate) ) then
               begin
                  MessageDlg(Format('Tag Number %s has left the herd before the start allocation date selected.'+cCRLF+
                                    'It will NOT be added to this feed group, %s, and will NOT be fed any'+cCRLF+
                                    'of the feeds from this groups current feed regime.',[AnimalInfo.NatIdNum,sSelectedGroupName]),mtError,[mbOK],0);
                  Exit;
               end;

            //   04/12/13 [V5.2 R6.6] /MK Bug Fix - Only show warning for animal in group if Feed Group.
            //   06/04/17 [V5.6 R8.0] /MK Bug Fix - If animal was moved to a new group it was deleted from old group but was not added to new group.
            //   05/11/19 [V5.9 R1.1] /MK Bug Fix - Even if not(AllowDeletion), if the new group is Feed then Remove Animal from CurrentGroupID.
            if ( CurrentGroupID > 0 ) and ( (AllowDeletion) or (gtNewGroupType = gtFeed) ) then
               begin
                  if ( gtNewGroupType = gtFeed ) and ( GroupHasActiveFeedRegime(CurrentGroupID) ) and ( CheckForPreviousFeedGroup ) then
                     if ( MessageDLG('This animal is already in a Feed Group - remove it from that Group',mtWarning,[mbYes,mbNo],0) = idNo ) then Exit;

                  // Delete references in grouplinks table. Im not sure if this is correct thing to
                  // do, the current WinData.AddToGroup deletes any references so for now just
                  // do as windata.AddToGroup

                  RemoveAnimalFromGrp(AID,CurrentGroupID);
               end
            else
               begin
                  // Transfer from the Group Grid to the table
                  if ( gtNewGroupType = gtSales ) then
                     begin
                        if ( not(VarIsNull(GroupData)) ) then
                           begin
                              SaleDate := GroupData[1];
                              CustomerID := GroupData[2];
                              //   11/06/19 [V5.8 R9.4] /MK Change - Removed Weaning messages if Sale Group and Sale Date provided  - Ivan Tanner.
                              {
                              if ( SaleDate > 0 ) then
                                 begin
                                    HerdType := HerdLookup.GetHerdType(HerdIDByAnimalID(AID));
                                    if ( HerdType <> htBeef)  then
                                       begin
                                          LactNo := GetAnimalInfo(AID, 'LactNo');
                                          if LactNo = 0 then
                                             begin
                                                CheckWeaning := False;
                                                DateOfBirth := GetAnimalInfo(AID, 'DateOfBirth');
                                                if ( DateOfBirth > 0 ) then
                                                   begin
                                                      if ( HerdType = htSuckler ) then
                                                         // CheckWeaning = True if animal is less than or equal to 12 months of age.
                                                         CheckWeaning := (DateOfBirth >= IncMonth(Date, -12))
                                                      else if (HerdType = htDairy) then
                                                         // CheckWeaning = True if animal is less than or equal to 12 months of age and greater than or equal to 10 weeks.
                                                         CheckWeaning := ((DateOfBirth >= IncMonth(Date, -12)) and (DateOfBirth <= IncDay(Date,-70)));

                                                      if CheckWeaning then
                                                         begin
                                                            WeaningDate := FEventDataHelper.GetLastEventDate(AID, CWeaningEvent);
                                                            if WeaningDate > 0 then
                                                               begin
                                                                  if ( SaleDate >= WeaningDate ) and ( SaleDate <= WeaningDate+14 ) then
                                                                     if MessageDlg(Format('This calf "%s" has a Weaning event recorded in the past 2 weeks.'+#13#10+
                                                                                          'Do you want to include the animal in the sales group?',[GetAnimalInfo(AID, 'NatIDNum')]),mtWarning,[mbYes,mbNo],0) = idNo then
                                                                        begin
                                                                           SysUtils.Abort;
                                                                        end;
                                                               end
                                                            else
                                                               begin
                                                                  if MessageDlg(Format('This calf "%s" does not have a Weaning event recorded.'+#13#10+
                                                                                       'Do you want to include the animal in the sales group?',[GetAnimalInfo(AID, 'NatIDNum')]),mtWarning,[mbYes,mbNo],0) = idNo then
                                                                     begin
                                                                        SysUtils.Abort;
                                                                     end;
                                                               end;
                                                         end;
                                                   end;
                                             end;
                                       end;
                                 end;
                              }

                              if ( not(VarIsNull(SaleDate)) ) and ( not(VarIsNull(CustomerID)) ) and
                                 ( SaleDate > 0 ) and ( CustomerID > 0 ) then
                                 begin
                                    FEventDataHelper.GetPreSaleStatusInfo( AID, SaleDate, StatusInfo, CustomerID,
                                                                           GlobalSettings.DisplayBruceTestDateWarningBeforeSale,
                                                                           GlobalSettings.DisplayTBTestDateWarningBeforeSale,
                                                                           GlobalSettings.DisplayMinimumDaysOnFarmWarningBeforeSale );

                                    AnimalPurchDate := FEventDataHelper.GetAnimalPurchaseEventDate(AID);
                                    if ( AnimalPurchDate > 0 ) then // MK - 29.03.07
                                       begin
                                          if (StatusInfo.CheckMinimumDaysOnFarm) and (StatusInfo.NoDaysOnFarm < MinimumDaysOnFarm) then
                                             if MessageDlg(Format('This animal has not been on the farm for a minimum of %d days.'+#13#10+'Do you want to continue?',[MinimumDaysOnFarm]),
                                                           mtWarning,[mbYes,mbNo],0) = idNo then
                                                SysUtils.Abort;

                                          if ( StatusInfo.CheckTBTest) and ( StatusInfo.TBTestDate <= IncMonth(Date, -12) ) then
                                             if MessageDlg('No TB Test Date has been found for this animal within a year from date of sale.'+#13#10+
                                                           'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                                SysUtils.Abort;

                                          if StatusInfo.CheckBrucellosis then
                                             if ( StatusInfo.BruceDate < ( Date - MinimumBrucellosisTestDays ) ) then
                                                if ( MessageDlg('No Brucellosis Test Date has been found for this animal within 30 days from date of sale.'+#13#10+
                                                                'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo ) then
                                                   SysUtils.Abort;
                                       end
                                    else
                                       begin
                                          if ( StatusInfo.NoDaysOnFarm >= MaxDaysForDiseaseTestCheck ) then
                                             begin
                                                if ( DateOfBirth > IncMonth(Date, -12) ) then
                                                   begin
                                                      if ( StatusInfo.CheckTBTest) and ( StatusInfo.TBTestDate <= IncMonth(Date, -12) ) then
                                                         if ( MessageDlg('No TB Test Date has been found for this animal'+#13#10+
                                                                         'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo ) then
                                                            SysUtils.Abort;
                                                   end
                                                else
                                                   begin
                                                      if ( StatusInfo.CheckTBTest) and ( StatusInfo.TBTestDate <= IncMonth(Date, -12) ) then
                                                         if ( MessageDlg('No TB Test Date has been found for this animal in the past year.'+#13#10+
                                                                         'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo ) then
                                                            SysUtils.Abort;
                                                    end;
                                             end;

                                          if StatusInfo.CheckBrucellosis then
                                             if ( StatusInfo.NoDaysOnFarm >= MaxDaysForDiseaseTestCheck ) and ( StatusInfo.BruceDate < ( Date - MinimumBrucellosisTestDays ) ) then
                                                if ( MessageDlg('No Brucellosis Test Date has been found for this animal within 30 days from date of sale.'+#13#10+
                                                                'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo ) then
                                                   SysUtils.Abort;
                                       end;
                                 end;
                           end;
                     end;
               end;

            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Add('INSERT INTO GrpLinks (AnimalID, GroupID, DateJoined)');
                  SQL.Add('VALUES (:AnimalID, :GroupID, :DateJoined)');
                  Params[0].AsInteger := AID ;
                  Params[1].AsInteger := GroupID ;
                  Params[2].AsDateTime := DateJoined;
                  ExecSQL;

                  if ( gtNewGroupType = gtFeed ) then
                     begin
                        Close;
                        SQL.Clear;
                        SQL.Add('UPDATE Animals');
                        SQL.Add('SET PenName = :PenName');
                        SQL.Add('WHERE ID = :AID');
                        Params[0].AsString := sSelectedGroupName;
                        Params[1].AsInteger := AID;
                        ExecSQL;
                     end;

                  Result := True;

                  uHerdSync.ResetSyncFlagForGroup(GroupID);
               finally
                  Free;
               end;

            //   19/09/17 [V5.7 R3.0] /MK Change - If feed group and group has active feed regime then proceed with feed events.
            {
            if ( GroupType = gtFeed ) and ( GroupHasActiveFeedRegime(GroupID) ) then
               begin
                  //   14/09/17 [V5.7 R3.0] /MK Change - Removed prompt for ShowConfirmMsg on adding feed events for the animals as new uAllocteFeedToAnimal takes care of this.
                  {
                  if ( ShowConfirmMsg ) then
                     if ( MessageDlg('Start animal "'+ATagNo+'" on new group''s current feed regime?',mtConfirmation,[mbYes,mbNo],0) = idNo ) then Exit;
                  }

                  // find current group feed events
                  {
                  with qFeed do
                     begin
                        SQL.Clear;
                        SQL.Add('SELECT *');
                        SQL.Add('FROM FeedRegime');
                        SQL.Add('WHERE GroupID = '+ IntToStr(GroupID));
                        SQL.Add('AND   AllocDate > "'+FormatDateTime(cUSDateStyle,DateJoined+'"');
                        // Check here if feed regime is active.
                        Open;
                        First;
                     end;

                  FeedEvents := TTable.Create(nil);
                  FeedEvents.DatabaseName := AliasName;
                  FeedEvents.TableName := 'FeedEvents';
                  FeedEvents.Active := True;
                  try
                     // allocate feed events to new animal
                     while ( not(qFeed.Eof) ) do
                        begin
                          FeedEvents.Append;
                          FeedEvents.FieldByName('AnimalID').AsInteger := AID;
                          FeedEvents.FieldByName('FeedType').AsInteger := qFeed.FieldByName('FeedType').AsInteger;

                          if ( DateJoined > qFeed.FieldByName('AllocDate').AsDateTime ) then
                             FeedEvents.FieldByName('AllocDate').AsDateTime := DateJoined
                          else
                             FeedEvents.FieldByName('AllocDate').AsDateTime := qFeed.FieldByName('AllocDate').AsDateTime;

                          //   14/09/17 [V5.7 R3.0] /MK Bug Fix - Assigning FeedRegimeID was missing from AddToGroup.
                          FeedEvents.FieldByName('FeedRegimeID').AsInteger := qFeed.FieldByName('ID').AsInteger;

                          FeedEvents.FieldByName('QuantDay').AsFloat := qFeed.FieldByName('QuantDay').AsFloat;
                          FeedEvents.FieldByName('CostDay').AsFloat := qFeed.FieldByName('CostDay').AsFloat;

                          if ( AnimalLeftHerdDate > 0 ) then
                             FeedEvents.FieldByName('EndDate').AsDateTime := AnimalLeftHerdDate;

                          FeedEvents.Post;

                          qFeed.Next;
                        end;
                  finally
                     DBIForceWrite(FeedEvents);
                     FeedEvents.Active := False;
                     FreeAndNil(FeedEvents);
                  end;
               end
            }
         end
      // YES
      else
         // Delete the Animal From the Group
         if AllowDeletion then
            begin
               RemoveAnimalFromGrp(AID,GroupID);
            end;
            {
            // search for existing animal feed event
            if gType = cFeedGroup then
               begin
                  with qFeed do
                     begin
                        SQL.Clear;
                        SQL.Add('SELECT *');
                        SQL.Add('FROM FeedEvents');
                        SQL.Add('WHERE AnimalID = '+IntToStr(AID));
                        SQL.Add('AND   EndDate IS NULL');
                        Open;
                     end;
                  qFeed.First;
                  if ( not(qFeed.EOF) ) then
                     begin
                        AnimalNo := GetAnimalInfo(AID, 'AnimalNo');
                        if ( not ShowConfirmMsg ) or
                          ( messagedlg('Animal ' + AnimalNo +
                                      ' is on a current feeding regime,'+#13+
                                      ' Do you want to continue (and end feed)?',
                                      mtWarning,[mbYes,mbNo],0) = idYes ) then
                           begin
                              with TQuery.Create(nil) do
                                 try
                                    DatabaseName := AliasName;
                                    SQL.Add('UPDATE FeedEvents SET EndDate=:EndDate WHERE ID=:ID');
                                    Params[0].AsInteger := qFeed.FieldByName('ID').AsInteger;
                                    Params[1].AsDateTime := DateJoined;
                                    ExecSQL;
                                 finally
                                    Free;
                                 end;
                           end;
                     end;
               end;
            uHerdSync.ResetSyncFlagForGroup(GroupID);
            }
   finally
      qFeed.Close;
      FreeAndNil(qFeed);
   end;
end;

function TGroupManager.GetGroupData(AGroupID : Integer; AFieldName : string): TVarArray;
var
  i : Integer;
begin
   with QueryGroup do
       try
         SQL.Clear;
         SQL.Add('SELECT '+AFieldName+'');
         SQL.Add('FROM grps'); 
         SQL.Add('WHERE (ID=:GrpID)');
         Params[0].AsInteger := AGroupID;
         Open;
         try
            First;
            Result := VarArrayCreate([0,FieldCount-1], varVariant);
            for i := 0 to FieldCount-1 do
               Result[i] := Fields[i].Value;
         finally
            Close;
         end;
      finally
      end;
end;

function TGroupManager.MinimumDaysOnFarm: Integer;
begin
   GetRegValue(cGSRegPathHerd+DataDir,cGSMinimumDaysToBeKeptOnFarmBeforeSale,Result);
   if Result <= 0 then
      Result := DefaultMinimumDaysOnFarm;
end;

function TGroupManager.AddToBatchGroup(const AGroupId, AAnimalId: Integer;
   const ATagNo : string = '' ) : Boolean;
begin
   Result := False;

   if ( AGroupID <= 0 ) then
      begin
         MessageDlg('GroupId must be specified.',mtError,[mbOK],0);
         Exit;
      end;

   if AnimalInThisGroup(AAnimalId, AGroupID) then
      begin
         Result := True;
         Exit;
      end;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('INSERT INTO GrpLinks (AnimalID, GroupID, DateJoined)');
         SQL.Add('VALUES (:AnimalID, :GroupID, :DateJoined)');
         Params[0].AsInteger := AAnimalId;
         Params[1].AsInteger := AGroupId;
         Params[2].AsDateTime := Now;
         try
            ExecSQL;
            Result := True;

            uHerdSync.ResetSyncFlagForGroup(AGroupId);
         except
         end;
      finally
         Free;
      end;

end;

function TGroupManager.GetAnimalsInGroup(const AGroupId: Integer): TIntegerArray;
var
   Index : Integer;
begin
   Index := 0;
   SetLength(Result, 0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT DISTINCT(AnimalId)');
         SQL.Add('FROM GrpLinks');
         SQL.Add('WHERE (GroupId = :AGroupId)');
         Params[0].AsInteger := AGroupId;
         Open;
         try
            First;
            SetLength(Result, RecordCount);
            while ( not(Eof) ) do
               begin
                  Result[Index] := Fields[0].AsInteger;
                  Inc(Index);
                  Next;
               end;
         finally
            Close;
         end
      finally
         Free;
      end;
end;

function TGroupManager.GetGroupID(AGroupName, AGroupType: String): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Grps');
         SQL.Add('WHERE Description = '+AGroupName+'');
         SQL.Add('AND GroupType = '+AGroupType+'');
         Open;
         try
            First;
            if RecordCount > 0 then
               Result := Fields[0].AsInteger
            else if ( RecordCount > 1  ) or ( RecordCount = 0 ) then
               Result := 0;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TGroupManager.GroupHasActiveFeedRegime(AGroupID: Integer): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM FeedRegime');
         SQL.Add('WHERE GroupID = '+IntToStr(AGroupID));
         try
            Open;
            Result := ( RecordCount > 0 );
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TGroupManager.GetGroupTypeFromGroupTypeStr(AGroupTypeStr: String): TGroupType;
begin
   Result := gtNone;
   if ( AGroupTypeStr = GroupTypesArray[gtFeed] ) then
      Result := gtFeed
   else if ( AGroupTypeStr = GroupTypesArray[gtBatch] ) then
      Result := gtBatch
   else if ( AGroupTypeStr = GroupTypesArray[gtSales] ) then
      Result := gtSales
   else if ( AGroupTypeStr = GroupTypesArray[gtPurchase] ) then
      Result := gtPurchase;
end;

function TGroupManager.CreateGroup(AGroupName: String; AGroupType : TGroupType): Integer;
var
   tGroups : TTable;
begin
   Result := 0;
   if ( Length(AGroupName) = 0 ) or ( AGroupType = gtNone ) then Exit;
   try
      tGroups := TTable.Create(nil);
      tGroups.DatabaseName := AliasName;
      tGroups.TableName := 'Grps';
      tGroups.Open;

      tGroups.Append;
      tGroups.FieldByName('GroupType').AsString := GroupTypeStringFromType(AGroupType);
      tGroups.FieldByName('Code').AsString := CreateNewGroupCode(AGroupType);
      tGroups.FieldByName('Description').AsString := AGroupName;
      tGroups.FieldByName('Selected').AsBoolean := False;
      tGroups.FieldByName('IsSynchronized').AsBoolean := False;
      tGroups.FieldByName('Source').AsInteger := sgHerd_Prog;
      tGroups.FieldByName('CreatedOn').AsDateTime := Now;
      try
         tGroups.Post;
         Result := tGroups.FieldByName('ID').AsInteger;
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               tGroups.Cancel;
            end;
      end;
   finally
      if ( tGroups <> nil ) then
         begin
            tGroups.Close;
            FreeAndNil(tGroups);
         end;
   end;
end;

function TGroupManager.CreateNewGroupCode(AGroupType: TGroupType): String;
var
   i : Integer;
   qGroup : TQuery;
   sGroupTypeIndic : String;
begin
   Result := '';
   if ( AGroupType = gtNone ) then Exit;
   sGroupTypeIndic := '';
   case AGroupType of
      gtFeed : sGroupTypeIndic := 'F';
      gtBatch : sGroupTypeIndic := 'B';
      gtSales : sGroupTypeIndic := 'Sales';
      gtPurchase : sGroupTypeIndic := 'P';
      gtDrafting : sGroupTypeIndic := 'D';
   end;
   try
      qGroup := TQuery.Create(nil);
      qGroup.DatabaseName := AliasName;
      for i := 1 to 100 do
         begin
            qGroup.Close;
            qGroup.SQL.Clear;
            qGroup.SQL.Add('SELECT *');
            qGroup.SQL.Add('FROM Grps');
            qGroup.SQL.Add('WHERE GroupType = "'+GroupTypeStringFromType(AGroupType)+'"');
            qGroup.SQL.Add('AND   Code = "KW'+sGroupTypeIndic+IntToStr(i)+'"');
            qGroup.Open;
            if ( qGroup.RecordCount = 0 ) then
               begin
                  Result := 'KW'+sGroupTypeIndic+IntToStr(i);
                  Break;
               end;
         end;
   finally
      qGroup.Close;
      FreeAndNil(qGroup);
   end;
end;

function TGroupManager.GroupTypeStringFromType(AGroupType: TGroupType): String;
begin
   Result := '';
   if ( AGroupType = gtNone ) then Exit;
   case AGroupType of
      gtFeed : Result := 'Feed';
      gtBatch : Result := 'Batch';
      gtSales : Result := 'Sales';
      gtPurchase : Result := 'Purchase';
      gtDrafting : Result := 'Draft';
   end;
end;

end.

