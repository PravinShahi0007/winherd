{
   03/05/13 [V5.1 R7.0] /MK Additional Feature - New unit created to import Drug Register to MediPur table.

   08/07/13 [V5.1 R8.1] /MK Change - Added code to save Health event for animal with TagNoDesc from file.

   11/07/13 [V5.1 R8.3] /MK Change - Changes made to either save purchase only or save both purchase and treaments automatically.
                                   - Changes made to allow treatment events to be modified before their saved.
                                         
   12/07/13 [V5.1 R8.3] /MK Change - Changed caption of the form to VetLink - GL.

   15/07/13 [V5.1 R8.3] /MK Bug Fix - Left out the saving of DrugPurchID and RateApplic to the Health table.

   07/08/13 [V5.1 R9.0] /MK Change - ImportFile - Add RemoveQuotationMarks to PurchDate, ExpiryDate and VPANum.
                                   - Only copy required field length for DrugName and VPANum.

   23/08/13 [V5.2 R0.2] /MK Additional Feature - Added DoseRate to import sequence.
                                               - Save this DoseRate to new field in MediPur table and add to uDrugPurchTagDetails screen.
                                               - Save DoseRate as part of comment of saved Health events.

   30/09/13 [V5.2 R3.0] /MK Change - actRunExecute - Always give review screen for saving of health events - GL.

   02/10/13 [V5.2 R3.0] /MK Additional Feature - Used new unit, uDrugRegImportWithdrawal, to save new medicine withdrawal days.
                                               - Do not auto save health events.

   07/10/13 [V5.2 R3.1] /MK Bug Fix - I accidentally left off the editing for EventDate and Selected grid fields.

   10/10/13 [V5.2 R3.3] /MK Bug Fix - Program was not saving DrugPurchId if drug purchase was found for existing medicines.

   04/12/13 [V5.2 R6.6] /MK Additional Feature - Mark Gmail VetLink file as read on FormCloseQuery if purchases and/or vet treatments are saved.

   19/12/13 [V5.2 R7.4] /MK Bug Fix - Default Variable strings in import sequence to blank to start with.
                                    - Allow Variant type date for Expiry and Purchase Date.
                                    - If Batch Number and Expiry Date are both null then this is seen as an invalid purchase record
                                      and will not be imported to the grid to start with.
                                    - Check to see if the file has a header line.

   11/02/14 [V5.2 R8.1] /MK Additional Feature - Added Drug Quantity as a column to the grid.
                                               - Added quantity of drug to medicine purchase record.
                                               - Update quantity of medicine in medicine table.

   08/05/14 [V5.3 R0.0] /MK Additional Feature - Add Medicine Group with new medicines.

   02/07/14 [V5.3 R3.0] /MK Bug Fix - actSaveHealthsManually - Posting Imported boolean moved to next record so no need for Next
                                      unless the Selected boolean is unticked - Michael & John Lynch.
                                    - UpdateMedicine - Unable to located PurchaseUnit as TempUnits.Tablename was incorrectly set to Medicines.

   07/08/14 [V5.3 R4.4] /MK Bug Fix - actSaveHealthsManually - Always move next regardless of whether the record is selected or not.

   27/08/14 [V5.3 R4.8] /MK Bug Fix - ImportFile - Add try/excepts around each field to bypass any errors found.
                                                 - Only post purchases to the table that have a BatchNo, ExpiryDate and PurchaseDate.

   19/09/14 [V5.3 R7.3] /MK Additional Feature - Capability added to store all records into new table DrugsRegImportDetail.
                                                 Also saved file that was saved to DrugsRegImportHeader which stores which headerid
                                                 belongs to what file was last saved.

   21/10/14 [V5.3 R7.8] /MK Bug Fix - actRunExecute - Don't ever match by name just VPA No - SP request.

   14/11/14 [V5.3 R8.9] /MK Change - Made screen maximised to start - SP request.
                                   - Added FullyImported field to header table that stores whether the whole file was saved.
                                     If the whole file is saved then mark the file as read otherwise don't.
                                   - If user clicks Resume Later in uDrugRegImportWithdrawal then show user what medicines have been purchase
                                     before resume was clicked. This will allow the user to save treatments for this list.
                            Bug Fix - Program was saving a new header for files that had already been imported. New function that is ran
                                      on ImportFile to delete these duplications and amend the DrugRegImportDetails table with the
                                      single HeaderID that remains in the header table.

   12/12/14 [V5.4 R0.4] /MK Additional Feature - Added drop-down-menu button to AnimalNo's grid line to allow user to select Current Herd,
                                                 a category or group of animals.

   17/12/14 [V5.4 R0.4] /MK Additional Feature - Added Review Medicine button and drop-down-options to toolbar - GL request.

   13/01/15 [V5.4 R1.5] /MK Additional Feature - After file is imported, before Run, highlight in blue medicines that don't already
                                                 exist in medicine table. Also show message to explain this to the user.

   21/01/15 [V5.4 R1.5] /MK Additional Feature - ImportFile - If customer selects an existing drug that does not have a VPA Number in the
                                                              medicine database but has a medicine name, update this existing drug with the
                                                              VPA Number and withdrawal information if entered by the user.
                            Change - btnReviewMedicines - Go through detail table and match the VPA Number with a VPA Number in the Medicine table.
                                                          Update the detail table with the ID from the Medicine table.

   20/03/15 [V5.4 R3.4] /MK Change - UpdateMedicineCost - Bit of refactoring here. Replaced code with new MedicineRepository.UpdateMedicineStock.

   24/09/15 [V5.4 R8.7] /MK Bug Fix - Selecting an existing drug, moved the VPA here so SET part of the SQL was always in the SQL.

   14/12/15 [V5.5 R1.7] /MK Bug Fix - GetNewDrugCode - Make sure that there is no drugocde with either upper case or lower case.

   04/03/16 [V5.5 R5.3] /MK Additional Feature - Pad VPA Number to include zero's - SP/GL/TD request.

   25/04/16 [V5.5 R5.7] /MK Change - AddHealthEvent - Check to see if the animal has a sale event.
                                                    - Check to see if the animal treatment date is not after the sale event.
                                                    - If the animal was sold then check to see if the sale was within the withdrawal period.
                                   - GetExistAnimalID - Allow animals that were sold or had died to be have treatment recorded.
                                   - Removed styling of font on grid to show drugs that cannot be matched, instead use the same logic as the
                                     on line VetLink where an icon indicates whether the VPA Number exists or doesn't exist or there is no VPA number.
                                   - Added legend to the top of the screen to give use information on the new icons and what they indicate.
                                   - Print button available now once the grid filled.
                                   - Import File button now available if not VetLink files are available from links.

   29/11/16 [V5.6 R3.6] /MK Bug Fix - AddHealthEvent - FDetailTable.FieldByName('DrugQuantity').AsFloat assigned to Health.ApplicRate.
                                    - DrugQuantityLessMinus - This function was removing the decimal point within the quantity if one existed.

   02/12/16 [V5.6 R3.7] /MK Change - Changed caption of actRun to Save - GL/SP request.

   24/01/17 [V5.6 R4.2] /MK Additional Feature - Added an extra field for ApplicRate that appears in the treatment section. The user can enter the
                                                 Application Rate for the new health event based on the vets guidlines that are in the Dose Rate field.
                                               - The Application Rate field is coloured as Teal do show its a required field.
                                               - If the user doesn't enter in the Application Rate for any of the treatments a prompt appears telling the
                                                 user that a default Application Rate of 1 will be applied to treatments that don't have an ApplicRate.
                                               - Changed approach for bringing in purchases to firstly save the purchases for the medicines that can be
                                                 matched by a VPA Number so if the user gets the prompt to resume later for a new drug at least there will
                                                 be a treatment for the drug that was already in the database.

   24/01/17 [V5.6 R4.2] /MK Change - Moved CreateLegendLabels to a private form procedure instead of procedure within another procedure.
                            Bug Fix - Added CreateLegendLabels to btnReviewMedicinesClick procedure so that legends are created if user edits medicines within this screen.

   09/05/17 [V5.6 R8.0] /MK Additional Feature - Added popup menu for Enter VPA number which appears when the user right-clicks on the grid if a record has not VPA Number.
                                               - When the user enters in the VPA Number in the InputBox that appears the newly entered VPA Number will be copied to
                                                 all records that have the same name as the record that selected.
                                               - The grid is then refreshed and the legend at the top is also refreshed.

   24/05/17 [V5.6 R8.4] /MK Bug Fix - ImportFile - When processing the file remove spaces from Date, ExpiryDate, VPANo, Quantity and DoseRate - reported by Kevin Quinn/Richard Stanley.

   12/07/17 [V5.6 R9.2] /MK Bug Fix - EditVPANo1Click - No need to query existing VPA numbers here as import will merge to existing VPANo.

   04/08/17 [V5.7 R1.1] /MK Change - Major changes to VetLink - File now goes through a rigorous verification procedure when its read and if it
                                                                fails the verification the program tells the user why and to contact ourselves for help.
                                                              - Legend now has hints to show what each legend item means.
                                                              - If abort of purchases then just close out of VetLink, don't allow treatments to be recorded.
                                                              - If purchases are complete the user is given the option to contine with treatments or close VetLink.

   04/08/17 [V5.7 R1.2] /MK Change - ImportFile - Check to see if the total VetLink file is invalid i.e. there are no valid records on the file - GL request.
                                                - If the total VetLink file is invalid then close out of VetLink.
                                                - As ImportFile is called from FormShow then post a message to close out of VetLink.
                                   - SaveHealthEvents - Check for duplicate treatments.             

   16/08/17 [V5.7 R1.2] /MK Change - New procedure, ShowHideColumns, created to show/hide columns based on whether the user is purchasing or treating.
                                   - Change the caption of DrugRegisterDBTableViewEventDate to Purchase Date of purchasing and Treatment Date if treating - SP/GL request.
                                   - If the user entered a valid tag desc with spaces or comma's and some of these were not treated then
                                     change the tag description to the animals that were not treated.
                                   - THealthEvent was created twice depending on whether the user was creating a treatment for a single animal or group/category of animals.
                                     Moved this into one function called HealthEventCreated.
                                   - New form variables, FTreatmentsSaved and FTreatmentsNotSaved, created to show the number of treatments that could or couldn't be saved.
                                     If the user selects a category or group of animals then these variables are increased, depending on if the treatment was saved, for each animal.
                                     If the user enters in a group of animals manually i.e. either by comma's or spaces between the animals these variables are also increased
                                     depending on whether the treatment was saved for each animal.
                                   - Show the uVetLinkFileImportSummary screen after the treatments.
                                   - Changed the way the system checks the tag desc for a single of multiple animals if not category or group are selected.
                                   - Code refactoring when the system was finding the animal id and then finding the animal record.

   18/08/17 [V5.7 R1.2] /MK Bug Fix - DrugRegisterDBTableViewVPANoGetProperties - Access Violation here when scrolling through the grid if null or invalid vpa number was found so I removed this code.
                                      Now the user has to right-click on the grid and click Enter VPA Number to bring up the TfmDrugFinder screen.

   21/08/17 [V5.7 R2.0] /MK Additional Feature - New fields added to the Detail table for MedicineGroup, Dose and Purchase Unit.
                                               - New field added to the Header record for DetailRecsCreated.
                                               - New private property created for HeaderDetailRecorded.
                            Change - ImportFile - If the vet link file was already saved into the detail table then no need to import it again
                                                  as it imports drugs that don't have a VPA Number or have an invalid VPA number again.
                                   - EditVPANo1Click - Assign the drugs group, dose and purchase unit from the drug the user selected in DrugFinder.
                                   - GetFileHeaderId - If header is being created then default DetailRecsCreated to False.
                            Bug Fix - CreateLegendLabels - Use VPA Number to count the amount of drugs matched not the amount of purchase records matched.

   22/08/17 [V5.7 R2.0] /MK Bug Fix - HealthEventCreated - Default the comment to name of the drug with application rate and unit code.

   23/08/17 [V5.7 R2.0] /MK Bug Fix - actRunExecute - If there was no VPA number the drug was still being imported.
                            Change - EditVPANo1Click - If VPA Number from DrugFinder exists in medicine table already then set FDetailTableDrugID to this ID.

   24/08/17 [V5.7 R2.1] /MK Change - actSaveHealthsManuallyExecute - Changed the way the order in which the program treats the animals.
                                                                   - First go through the grid and treat groups or categories of animals.
                                                                   - Secondly go through the remaining records and treat those that are manual treatments and show progress bar.

   25/09/17 [V5.7 R3.0] /MK Change - ManualEnterVPANo1 - Bring up VPA Number that is already in the VPANumber field in InputBox - GL request.
                                   - Always show edit button for VPANumber field to allow editing and search for existing VPA Numbers.
                                   - Commented out the following procedures as they are no longer required because edit button in VPA Number is always shown
                                     DrugRegisterDBTableViewFocusedRecordChanged, DrugRegisterDBTableViewVPANoGetProperties.
                                   - DrugRegisterDBTableViewInitEdit - Don't allow typing or clearing of VPA Number on KeyPress or KeyDown.

   26/09/17 [V5.7 R3.1] /MK Change - LocateAnimalByTagDesc - If this is an Irish herd then length of LocateNatID (tag without country prefix) will always be 12.
                                                             Get substring based on 12 minus the length of ATagDesc + 1.
                                                             Use + 1 to start search at right character.
                                                             Substring SQL should only find one instance of ATagDesc - Peter Farrell request.

   03/11/17 [V5.7 R4.3] /MK Change - actRunExecute - Get total number of records that have a VPA Number that exists in the Medicine table currently.
                                                     Now create a progress bar based on this total number of records.
                            Additional Feature - Added new field, VPAIndicator, to be used to sort the grid by the No/Invalid VPA's, then VPA Not In Kingswood and last
                                                 the VPA Numbers that are in Kingswood.
   06/11/17 [V5.7 R4.3] /MK Change - ImportFile - If drug is in online database then its found else its not found.
                                   - actRunExecute - Filter out detail table for purchases of this HeaderId that weren't imported.
                                                   - Just add the medicine, don't prompt for matching against users medicine table.
                                   - CreateLegendLabels - Changed SQL's to count records based on VPAIndicator field.
                                   - DrugQuantityLessMinus - Format float to 2 decimal places.
                            Bug Fix - GetSupplierID - Set supplier to be in use.

   05/12/17 [V5.7 R5.9] /MK Change - ImportFile - Co-Op files with drugs are being sent to farmers now. Allow for DDMMMYYYY date format in Purchase & Expiry Date.

   06/12/17 [V5.7 R5.9] /MK Additional Feature - New column added to display the unit of the drug. If drug is in PC database already then bring in the purch unit
                                                 from the medicine table. If the drug is on the online database then default unit depending on drug type on the server.
                                               - Allow the user to edit the quantity purchased before the drug purchase is saved.

   07/12/17 [V5.7 R6.0] /MK Bug Fix - Changed function SaleDateWithinWithdrawalPeriod to ThisTreatmentWithdrawalAfterSaleDate.
                            Change - actSaveHealthsManuallyExecute - Added extra reasons for not saving events if animal treated after sale date
                                                                     and animal treatment withdrawal date is after sale date.

   14/12/17 [V5.7 R6.3] /MK Bug Fix - actRunExecute - If a drug is in the VetLink file more than once and it wasn't in the database prior to VetLink import,
                                                      it then gets added by the DrugFinder code below so when we loop through to the next purchase of the medicine
                                                      we need to search for the DrugID in the Medicine table. Bug was that the drug was being added for every purchase - Tom Crosse.

   27/04/18 [V5.8 R0.3] /MK Additional Feature - Used new unit, uAnimalSelectByDate, to allow user to select animals in the herd on a certain treatment date.
                                               - If VetLink file has been read and the treatments were only half finished then don't mark the file as read but allow the user
                                                 to read the file in again to record the rest of the treatments.
                                               - Create a table of all animals selected in uAnimalSelectByDate and their treatment records in a seperate table in the database.

   14/05/18 [V5.8 R0.3] /MK Additional Feature - If user selects a category then pop up the uAnimalSelectByDate for the user to confirm the selection.

   23/05/18 [V5.8 R0.3] /MK Change - If user selects a group then pop up uAnimalSelectByDate for the user to confirm the animals in the group selected.

   05/06/18 [V5.8 R0.4] /MK Bug Fix - Treatments were saved against different drugs - Noel Keane.
                                    - If user deselects all treatments bar one and saves the treatment, all treatments that were unticked were still saved.
                                    - If user deselects all treatments bar one, saves the treatment, reopens the vetlink file after treatments are saved,
                                      all treatments that were not saved are still unticked.

   28/06/18 [V5.8 R0.6] /MK Change - CreateTempAnimalSelectTableData - Replaced SQL's to add animals on treatment date to temp table with new Public HerdLookup.AddAnimalsToTempTableOnStockDate procedure.

   27/07/18 [V5.8 R1.4] /MK Change - Changed all instances of While Not EOF after FDetailTable.Filter is set to While Step (based on FindFirst and FindNext).
                                     as this is the more appropriate approach to looping through a table after the table is filtered.
                                   - Changed some of the on e : Exception/ShowMessage to storing the error in the log file.
                                   - Changed all instances of FDetailTable.RecordCount to FDetailTable.IsEmpty.
                                   - Created new form private procedure GetRecordCountByFilterString that gets the count of animals in a filtered table from SQL based on filter.
                                   - If the drug is not valid then new procedure, MarkDetailRecordAsNotImported, sets it as imported/ignored via SQL.
                                   - OnFormDestory add checks for Out of Memory and Out of Resource errors as there is sometimes an Access Violation error closing VetLink.
                            Bug Fix - actRunExecute - Looping through found drugs - If the drug exists in the FDetailTable then use it don't go searching again for the VPA number.

   16/08/18 [V5.8 R2.4] /MK Additional Feature - When the user brings down a drug from DrugFinder then bring down withdrawal details also.
                                               - Added withdrawal fields, withdrawal confirmation and date to the FDetailTable.
                                               - If the drug is found by the user then the withdrawal will be added to the medicine table and boolean/date&time are set for this drug.

   08/11/18 [V5.8 R4.6] /MK Additional Feature - In the treatment part of VetLink allow the user the deselect/select all - Dan Norton.

   03/01/19 [V5.8 R5.9] /MK Change - StoreAnimalsInAnimalDetailTable - Added progress bar to indicate animals being matched - Kieran Savage/GL request.
                                                                     - Added BeginFullUpdate/EndFullUpdate so grid isn't scrolling when looping through records - SP request.

   25/02/19 [V5.8 R7.1] /MK Bug Fix - EditVPANo1Click - If Unit selected before clicking button in VPA field then assign selected unit to rest of records for this drug.
                                                      - Disable controls of grid while closing and opening to stop "List index out of bounds" error - Noel Keane.

   01/04/19 [V5.8 R8.4] /MK Change - ExistsInDetailTable - Added check for HeaderID as well if customer reads in a file, and for whatever reason, it fails on purchases.
                                                           Allow the rename of the file to bring in a second instance of the file but only those purchase
                                                           that were not saved should then appear - Una Carter.
                                   - ImportFile - Don't set HeaderDetailRecorded here as this will not allow for file to be read in again, with new name, if purchases fail - Una Carter.

   25/06/19 [V5.8 R9.4] /MK Bug Fix - actRunExcecute - Use global GetNewDrugCode that is used by WinData.MedicineNewRecord.

   06/11/20 [V5.9 R7.2] /MK Change - EditVPANo1Click, ManualEnterVPANo1Click - SP suggested that I don't set the FocusedRecordIndex but instead use a locate on the Id - John Roche.

   05/01/22 [V6.0 R3.5] /MK Bug Fix - ImportFile - Use the ConfirmedPurchases list to see if there were purchases saved but the treatments weren't allowing the user to re-import the treatments.
}

unit uDrugsRegisterImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar, KRoutines,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, db, dbTables, GenTypesConst,
  uSPParser, uMedicinePurchaseRepository, EventRecording, dxPSCore,
  dxPScxCommon, dxPScxGridLnk, cxContainer, cxEdit, cxLabel,
  uHerdLookup, uFileAttachmentImport, DairyData,
  Menus, DateUtil, uProgressIndicator, dxmdaset, uDrugRegImportGroupSelect,
  cxUtils, cxButtonEdit, uMedicineSetup, uSuppliers, uMediAdminSetUp,
  StdCtrls, cxButtons, cxStyles, uMedicineRepository,
  cxEditRepositoryItems, cxFilter, uApplicationLog, uVetLinkFileImport,
  Grids, DBGrids, uDrugFinder, cxTextEdit, cxHint,
  uVetLinkPurchaseCompleteMsg, uVetLinkFileImportSummary, cxCustomData,
  cxDBLookupComboBox, uAnimalSelectByDate, uAnimal, uDrugFinderWithdMsg;

type
   TLegendType = (ltVPAFound, ltVPANotFound, ltNo_InvalidVPA);

   TGridFilterType = ( gftAll, gftFound, gftNotFound, gftNoVPA );

   TAnimalRec = record
      AnimalID,
      LactNo,
      HerdID : Integer;
      InHerd : Boolean;
   end;

  TfmDrugsRegisterImport = class(TfmBaseForm)
    DrugRegisterDBTableViewSupplier: TcxGridDBColumn;
    DrugRegisterDBTableViewSelected: TcxGridDBColumn;
    actSaveHealthsManually: TAction;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink: TdxGridReportLink;
    dxBarLargeButton2: TdxBarLargeButton;
    actPrint: TAction;
    DrugRegisterDBTableViewPurchDoseRate: TcxGridDBColumn;
    DrugRegisterDBTableViewNoDays: TcxGridDBColumn;
    DrugRegisterDBTableViewNoTimes: TcxGridDBColumn;
    DrugRegisterDBTableViewWithdrawal: TcxGridDBColumn;
    DrugRegisterDBTableViewDrugQuantity: TcxGridDBColumn;
    pmAnimalSelect: TPopupMenu;
    pmiCurrentHerd: TMenuItem;
    Categories1: TMenuItem;
    Groups1: TMenuItem;
    pmiCows: TMenuItem;
    pmiReplacements: TMenuItem;
    pmiBeefCattle: TMenuItem;
    pmiAllCalves: TMenuItem;
    pmiHeiferCalves: TMenuItem;
    pmiDairyHeiferCalves: TMenuItem;
    pmiBeefHeiferCalves: TMenuItem;
    pmiMaleCalves: TMenuItem;
    N1: TMenuItem;
    pmiAllCows: TMenuItem;
    pmiInMilk: TMenuItem;
    pmiDry: TMenuItem;
    pmiAllCalvesThisYear: TMenuItem;
    pmiAllCalvesLastYear: TMenuItem;
    pmiAllCalvesBothYears: TMenuItem;
    pmiHCalvesThisYear: TMenuItem;
    pmiHCalvesLastYear: TMenuItem;
    pmiHCalvesBothYears: TMenuItem;
    pmiDHCalvesThisYear: TMenuItem;
    pmiDHCalvesLastYear: TMenuItem;
    pmiDHCalvesBothYears: TMenuItem;
    pmiBHCalvesThisYear: TMenuItem;
    pmiBHCalvesLastYear: TMenuItem;
    pmiMaleCalvesThisYear: TMenuItem;
    pmiMaleCalvesLastYear: TMenuItem;
    pmiMaleCalvesBothYears: TMenuItem;
    pmiBHCalvesBothYears: TMenuItem;
    pmiSelectAnimals: TMenuItem;
    N2: TMenuItem;
    pmAddMedicine: TPopupMenu;
    pmiAddMedicine: TMenuItem;
    pmiAddMedSupplier: TMenuItem;
    pmiAddMedAdminBy: TMenuItem;
    pmiMedPrescribedBy: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    cxStyleRepository2: TcxStyleRepository;
    stDrugNotInDatabase: TcxStyle;
    DrugRegisterDBTableViewDrugID: TcxGridDBColumn;
    stDrugFoundInDatabase: TcxStyle;
    stNoVPA: TcxStyle;
    btnReviewMedicines: TcxButton;
    pLegend: TPanel;
    DrugRegisterDBTableViewDrugVPAIndicator: TcxGridDBColumn;
    GridButtonRepository: TcxEditRepository;
    VPANotFoundButton: TcxEditRepositoryButtonItem;
    NoVPAButton: TcxEditRepositoryButtonItem;
    DrugFoundButton: TcxEditRepositoryButtonItem;
    pFoundDrug: TPanel;
    imgDrugFound: TImage;
    lFoundLegendLabel: TcxLabel;
    pNotFound: TPanel;
    imgVPANotFound: TImage;
    lNotFoundLegendLabel: TcxLabel;
    pNoVPA: TPanel;
    imgNoVPANumber: TImage;
    lNoVPALegendLabel: TcxLabel;
    DrugRegisterDBTableViewApplicRate: TcxGridDBColumn;
    sDefaultEntry: TcxStyle;
    pmEnterVPA: TPopupMenu;
    EditVPANo1: TMenuItem;
    pInformation: TPanel;
    lInformation: TcxLabel;
    lUntickAnimals: TcxLabel;
    pGeneralLegendInfo: TPanel;
    Image1: TImage;
    lGeneralLegendInfo: TcxLabel;
    lLegendSymbolInfo: TcxLabel;
    EnterVPANo: TcxEditRepositoryTextItem;
    ManualEnterVPANo1: TMenuItem;
    DrugRegisterDBTableViewPurchUnitUsed: TcxGridDBColumn;
    DrugRegisterDBTableViewVPAIndicator: TcxGridDBColumn;
    blbSelectDeselectAll: TdxBarLargeButton;
    Action1: TAction;
    actSelectAll: TAction;
    actDeselectAll: TAction;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actSaveHealthsManuallyExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DrugRegisterDBTableViewTagDescPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure pmiAnimalCategoryClick(Sender: TObject);
    procedure Groups1Click(Sender: TObject);
    procedure DrugRegisterDBTableViewInitEdit(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit);
    procedure DrugRegisterDBTableViewEditKeyPress(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Char);
    procedure DrugRegisterDBTableViewEditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure pmiSelectAnimalsClick(Sender: TObject);
    procedure btnReviewMedicinesClick(Sender: TObject);
    procedure pmiAddMedSupplierClick(Sender: TObject);
    procedure pmiAddMedicineClick(Sender: TObject);
    procedure pmiAddMedAdminByClick(Sender: TObject);
    procedure pmiMedPrescribedByClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DrugRegisterDBTableViewDrugVPAIndicatorGetProperties(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure EditVPANo1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DrugRegisterDBTableViewVPANoGetProperties(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure DrugRegisterDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure EnterVPANoPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDrugRegisterMouseEnter(Sender: TObject);
    procedure lNoVPALegendLabelMouseEnter(Sender: TObject);
    procedure LegendLabelMouseLeave(Sender: TObject);
    procedure PanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lFoundLegendLabelMouseEnter(Sender: TObject);
    procedure lNotFoundLegendLabelMouseEnter(Sender: TObject);
    procedure ManualEnterVPANo1Click(Sender: TObject);
    procedure DrugRegisterDBTableViewVPANoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actImportFileExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actDeselectAllExecute(Sender: TObject);
  private
    function GetHeaderDetailImportCount: Integer;
    function HealthEventCreated : Boolean;
    procedure ShowHideColumns(AShowForPurchases: Boolean);
    function GetHeaderDetailRecorded: Boolean;
    procedure SetHeaderDetailRecorded(const Value: Boolean);
    procedure CreateHealthEvents();
    function GetDetailTableCount: Integer;
    procedure AddAnimalSelectionToTable(AAnimalArray: PIntegerArray;
       ACategory_GroupSelected : Boolean; var ADetailTxt: String;
       ASelectedGroupID : Integer);
    function GetDetailAnimalSelectedCount: Integer;
    procedure DeleteFromDetailAnimalsTable;
    function GetRecordCountByFilterString(AFilterString: String): Integer;
  published
    dxBarLargeButton1: TdxBarLargeButton;
    actImportFile: TAction;
    OpenDialog: TOpenDialog;
    pDrugsRegister: TPanel;
    gDrugRegister: TcxGrid;
    DrugRegisterDBTableView: TcxGridDBTableView;
    DrugRegisterDBTableViewEventDate: TcxGridDBColumn;
    DrugRegisterDBTableViewDrugName: TcxGridDBColumn;
    DrugRegisterDBTableViewTagDesc: TcxGridDBColumn;
    DrugRegisterDBTableViewBatchNo: TcxGridDBColumn;
    DrugRegisterDBTableViewExpiryDate: TcxGridDBColumn;
    DrugRegisterDBTableViewVPANo: TcxGridDBColumn;
    DrugRegisterLevel: TcxGridLevel;
    dxlbRun: TdxBarLargeButton;
    actRun: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actRunExecute(Sender: TObject);
  private
    FDetailTable,
    FHeaderTable,
    FDetailAnimalsTable : TTable;
    FDSImportTable : TDataSource;
    FHeaderID,
    FTTableNo,
    FVPANotFoundCount : Integer;
    FAnimalRec : TAnimalRec;
    FMedicines : TTable;
    FRunAborted,
    FReviewPrinted,
    FManualHealthSaveCompleted : Boolean;
    FTreatmentsSaved,
    FTreatmentsNotSaved,
    FDefaultHerdID : Integer;
    FCountry : TCountry;
    FHerdType : THerdType;
    FFileName : String;
    FTagDescField : TField;
    FVLFileImport : TVetLinkFileImport;
    FExitWithoutTreating,
    FVetLinkFileCompletelyInvalid : Boolean;
    FTagStringArrayNotTreated : array of String;
    FPurchasesComplete : boolean;
    FAnimalSelectTable : TTable;
    FHealthEvent : THealthEvent;
    FSelectType : TSelectType;

    function GetSupplierID(ASupplierName: String): Integer;
    function DrugPurchaseExists(const ADrugID : Integer; const ABatchNo : String;
                                const APurchaseDate, AExpiryDate : TDateTime ): Boolean;
    function IsHeaderIDFullyImported : Boolean;
    function FHeaderTotalRec : Integer;
    // SP
    function GetFileHeaderId : Integer;
    function GetSelectedCategoryTypeBySelection (ASelection : String) : TCategoryType;

    procedure ImportFile(AFileName : String);
    procedure LocateAnimalByTagDesc(ATagDesc : String);
    procedure CreateFAnimalRecByID(AAnimalID : Integer);
    procedure UpdateMedicineCost(MedicineID: Integer; MedicineRate,NewCost: Double );
    procedure FixDuplicateHeaderLines;
    procedure PopupMenuItemClick(Sender: TObject);
    procedure GetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure UpdateExistDetailTableVPADrug(AExistVPANo: String; ADrugID : Integer);
    procedure MatchDrugIDToVPA;
    procedure CreateLegendLabels;
    procedure ShowLegendHints(APoint : TPoint; const AHintTitle, AHintText: string; APos : TcxCallOutPosition);
    procedure StoreAnimalsInAnimalDetailTable;
    procedure EnableTreatments(APurchaseCount : Integer);
    procedure CreateTempAnimalSelectTableData(ATreatmentDate : TDateTime);
    procedure SelectDeselectAll;

    property HeaderDetailRecorded : Boolean read GetHeaderDetailRecorded write SetHeaderDetailRecorded;
    property DetailAnimalSelectedCount : Integer read GetDetailAnimalSelectedCount;
    { Private declarations }
  public
    class procedure Browse();
    class procedure ShowForm ( const AFileName : String = '' );
    { Public declarations }
  end;

var
  fmDrugsRegisterImport: TfmDrugsRegisterImport;

const
   cPurchaseDate = 2;
   cDrugDescription = 4;
   cDrugQuantity = 5;
   cTagDescription = 10;
   cBatchNo = 11;
   cExpiryDate = 12;
   cDoseRate = 14;
   cWithdrawal = 16;
   cVPANumber = 17;
   cSupplierName = 18;

   cManualAnimalEntry = 1;
   cCurrentHerd = 2;
   cCategorySelected = 3;
   cGroupSelected = 4;

   cCurrentHerdAnimals = 'CURRENT HERD';
   cAllCowsCategory = 'ALL COWS';
   cInMilkCowCategory = 'IN MILK';
   cDryCowCategory = 'DRY';
   cReplacementsCategory = 'REPLACEMENTS';
   cBeefCattleCategory = 'BEEF CATTLE';
   cAllCalvesThisYear = 'ALL CALVES THIS YEAR';
   cAllCalvesLastYear = 'ALL CALVES LAST YEAR';
   cAllCalvesBothYears = 'ALL CALVES BOTH YEARS';
   cHeiferCalvesThisYear = 'HEIFER CALVES THIS YEAR';
   cHeiferCalvesLastYear = 'HEIFER CALVES LAST YEAR';
   cHeiferCalvesBothYears = 'HEIFER CALVES BOTH YEARS';
   cDairyHeiferCalvesThisYear = 'DAIRY HEIFER CALVES THIS YEAR';
   cDairyHeiferCalvesLastYear = 'DAIRY HEIFER CALVES LAST YEAR';
   cDairyHeiferCalvesBothYears = 'DAIRY HEIFER CALVES BOTH YEARS';
   cBeefHeiferCalvesThisYear = 'BEEF HEIFER CALVES THIS YEAR';
   cBeefHeiferCalvesLastYear = 'BEEF HEIFER CALVES LAST YEAR';
   cBeefHeiferCalvesBothYears = 'BEEF HEIFER CALVES BOTH YEARS';
   cMaleCalvesThisYear = 'MALE CALVES THIS YEAR';
   cMaleCalvesLastYear = 'MALE CALVES LAST YEAR';
   cMaleCalvesBothYears = 'MALE CALVES BOTH YEARS';

   CM_MOVEFOCUS = WM_USER + 2;

   cInvalidOrNoVPA = 1;
   cVPANotFound = 2;
   cVPAFound = 3;

implementation

{$R *.DFM}

class procedure TfmDrugsRegisterImport.ShowForm ( const AFileName : String = '' );
begin
   with TfmDrugsRegisterImport.Create(nil) do
      try
         FHerdType := HerdLookup.GetHerdType(FDefaultHerdID);
         FFileName := AFileName;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.FormCreate(Sender: TObject);
var
   qGroups : TQuery;
begin
   inherited;
   WinData.CallHintStyle;
   WinData.cxHint.HideHint;
   WinData.cxHint.HintStyle.CaptionFont.Name := 'Segoe UI';
   WinData.cxHint.HintStyle.CaptionFont.Size := 12;
   WinData.cxHint.HintStyle.CaptionFont.Style := [fsBold];
   WinData.cxHint.HintStyle.Font.Name := 'Segoe UI';
   WinData.cxHint.HintStyle.Font.Size := 12;
   WinData.cxHint.HintStyle.Font.Style := [];

   FVLFileImport := TVetLinkFileImport.Create;

   OpenDialog.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
   OpenDialog.DefaultExt := '.csv';
   OpenDialog.Filter := 'CSV | *.csv';

   FDetailTable := TTable.Create(nil);
   with FDetailTable do
      begin
         DatabaseName := AliasName;
         TableName := 'DrugsRegImportDetail';
         if ( not(Exists) ) then
            begin
               FieldDefs.Add('ID',ftAutoInc);
               FieldDefs.Add('PurchDate',ftDate);
               FieldDefs.Add('DrugDesc',ftString,30);
               FieldDefs.Add('DrugID',ftInteger);
               FieldDefs.Add('DrugPurchID',ftInteger);
               FieldDefs.Add('DrugQuantity',ftFloat);
               FieldDefs.Add('TagDesc',ftString,30);
               FieldDefs.Add('BatchNo',ftString,30);
               FieldDefs.Add('ExpiryDate',ftDate);
               FieldDefs.Add('VPANumber',ftString,20);
               FieldDefs.Add('SupplierName',ftString,50);
               FieldDefs.Add('Imported',ftBoolean);
               FieldDefs.Add('Selected',ftBoolean);
               FieldDefs.Add('PurchDoseRate',ftString,20);
               FieldDefs.Add('NoDays',ftInteger);
               FieldDefs.Add('NoTimes',ftInteger);
               FieldDefs.Add('ApplicRate',ftFloat);
               FieldDefs.Add('WithdrawalStr',ftString,30);
               FieldDefs.Add('HeaderID',ftInteger);
               FieldDefs.Add('TreatmentSaved',ftBoolean);
               FieldDefs.Add('AnimalGroupCategoryType',ftInteger);
               FieldDefs.Add('MedicineGroup',ftInteger);
               FieldDefs.Add('DrugDoseUnit',ftInteger);
               FieldDefs.Add('DrugPurchUnit',ftInteger);
               FieldDefs.Add('VPAIndicator',ftInteger);
               FieldDefs.Add('MilkWithdrawalDays',ftInteger);
               FieldDefs.Add('MeatWithdrawalDays',ftInteger);
               FieldDefs.Add('MilkN_A_Drug',ftBoolean);
               FieldDefs.Add('MeatN_A_Drug',ftBoolean);
               FieldDefs.Add('DrugFindWithdAccepted',ftBoolean);
               with IndexDefs do
                  begin
                     Clear;
                     Add('iID','ID',[ixUnique, ixPrimary]);
                     Add('iTagDesc','TagDesc',[ixCaseInsensitive]);
                     Add('iHeaderID','HeaderID',[ixCaseInsensitive]);
                  end;
               CreateTable;
            end
         else
            begin
               if ( not(FieldExists(FDetailTable,'ApplicRate')) ) then
                  with TQuery.Create(nil) do
                     try
                        DatabaseName := AliasName;
                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD ApplicRate FLOAT');
                        try
                           ExecSQL;
                        except
                        end;
                     finally
                        Free;
                     end;

               if ( not(FieldExists(FDetailTable,'MedicineGroup')) ) then
                  with TQuery.Create(nil) do
                     try
                        DatabaseName := AliasName;
                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD MedicineGroup INTEGER');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD DrugDoseUnit INTEGER');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD DrugPurchUnit INTEGER');
                        ExecSQL;
                     finally
                        Free;
                     end;

               if ( not(FieldExists(FDetailTable,'VPAIndicator')) ) then
                  with TQuery.Create(nil) do
                     try
                        DatabaseName := AliasName;
                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD VPAIndicator INTEGER');
                        ExecSQL;
                     finally
                        Free;
                     end;

               if ( not(FieldExists(FDetailTable,'MilkWithdrawalDays')) ) then
                  with TQuery.Create(nil) do
                     try
                        DatabaseName := AliasName;

                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD MilkWithdrawalDays INTEGER');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD MeatWithdrawalDays INTEGER');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD MilkN_A_Drug BOOLEAN');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD MeatN_A_Drug BOOLEAN');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FDetailTable.TableName+'');
                        SQL.Add('ADD DrugFindWithdAccepted BOOLEAN');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('UPDATE '+FDetailTable.TableName+'');
                        SQL.Add('SET DrugFindWithdAccepted = True');
                        SQL.Add('WHERE DrugID > 0');
                        ExecSQL;
                     finally
                        Free;
                     end;
            end;
         Open;
      end;

   FHeaderTable := TTable.Create(nil);
   with FHeaderTable do
      begin
         DatabaseName := AliasName;
         TableName := 'DrugsRegImportHeader';
         if ( not(Exists) ) then
            begin
               FieldDefs.Add('ID',ftAutoInc);
               FieldDefs.Add('FileName',ftString,200);
               FieldDefs.Add('DateAdded',ftDate);
               FieldDefs.Add('FullyImported',ftBoolean);
               FieldDefs.Add('DetailRecsCreated',ftBoolean);
               with IndexDefs do
                  begin
                     Clear;
                     Add('iID','ID',[ixUnique, ixPrimary]);
                  end;
               CreateTable;
            end
         else
            begin
               if ( not(FieldExists(FHeaderTable,'DetailRecsCreated')) ) then
                  with TQuery.Create(nil) do
                     try
                        DatabaseName := AliasName;
                        SQL.Clear;
                        SQL.Add('ALTER TABLE '+FHeaderTable.TableName+'');
                        SQL.Add('ADD DetailRecsCreated BOOLEAN');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('UPDATE '+FHeaderTable.TableName+'');
                        SQL.Add('SET DetailRecsCreated = :ADefaultValue');
                        Params[0].AsBoolean := True;
                        ExecSQL;
                     finally
                        Free;
                     end;
            end;
         Open;
      end;

   FDetailAnimalsTable := TTable.Create(nil);
   with FDetailAnimalsTable do
      begin
         DatabaseName := AliasName;
         TableName := 'DrugsRegImportAnimals';
         if ( not(Exists) ) then
            begin
               FieldDefs.Clear;
               FieldDefs.Add('ID',ftAutoInc);
               FieldDefs.Add('DetailID',ftInteger);
               FieldDefs.Add('AnimalID',ftInteger);
               FieldDefs.Add('AnimalTagDesc',ftString,20);
               FieldDefs.Add('HeaderID',ftInteger);
               FieldDefs.Add('GroupID',ftInteger);
               FieldDefs.Add('TreatmentSaved',ftBoolean);
               IndexDefs.Clear;
               IndexDefs.Add('iID','ID',[ixPrimary,ixUnique]);
               IndexDefs.Add('iDetailAnimal','HeaderID;DetailID;AnimalID',[ixUnique]);
               CreateTable;
            end;
         Open;
      end;

   FDSImportTable := TDataSource.Create(nil);
   FDSImportTable.DataSet := FDetailTable;

   actRun.Enabled := False;
   actPrint.Enabled := False;

   FMedicines := TTable.Create(nil);
   with FMedicines do
      begin
         DatabaseName := AliasName;
         TableName := 'Medicine';
         Open;
      end;

   FAnimalSelectTable := TTable.Create(nil);
   FAnimalSelectTable.DatabaseName := AliasName;
   FAnimalSelectTable.TableName := 'tmpAnimalsByDate';
   FAnimalSelectTable.FieldDefs.Clear;
   FAnimalSelectTable.FieldDefs.Add('ID',ftAutoInc);
   FAnimalSelectTable.FieldDefs.Add('Selected',ftBoolean);
   FAnimalSelectTable.FieldDefs.Add('AnimalID',ftInteger);
   FAnimalSelectTable.FieldDefs.Add('AnimalNo',ftString,10);
   FAnimalSelectTable.FieldDefs.Add('SortAnimalNo',ftString,10);
   FAnimalSelectTable.FieldDefs.Add('SearchNatID',ftString,20);
   FAnimalSelectTable.FieldDefs.Add('NatIDNum',ftString,20);
   FAnimalSelectTable.FieldDefs.Add('SortNatID',ftString,20);
   FAnimalSelectTable.FieldDefs.Add('DateOfBirth',ftDateTime);
   FAnimalSelectTable.FieldDefs.Add('Sex',ftString,10);
   FAnimalSelectTable.FieldDefs.Add('BreedID',ftInteger);
   FAnimalSelectTable.FieldDefs.Add('LactNo',ftInteger);
   FAnimalSelectTable.FieldDefs.Add('HerdID',ftInteger);
   FAnimalSelectTable.FieldDefs.Add('InHerd',ftBoolean);
   FAnimalSelectTable.FieldDefs.Add('LastCalvingDate',ftDateTime);
   FAnimalSelectTable.IndexDefs.Clear;
   FAnimalSelectTable.IndexDefs.Add('iID','ID',[ixPrimary,ixUnique]);
   FAnimalSelectTable.IndexDefs.Add('iAnimalID','ID',[ixUnique]);
   FAnimalSelectTable.CreateTable;
   FAnimalSelectTable.Open;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DefaultHerdID');
         SQL.Add('FROM Defaults');
         Open;
         try
            First;
            if ( Fields[0].AsInteger > 0 ) then
               FDefaultHerdID := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;

   if ( FDefaultHerdID > 0 ) then
      FCountry := HerdLookup.CountryByHerdID(FDefaultHerdID);

   FManualHealthSaveCompleted := False;

   FPurchasesComplete := False;

   FVetLinkFileCompletelyInvalid := False;

   FTTableNo := 1;

   pInformation.Visible := False;

   Categories1.Visible := ( HerdLookup.GetHerdType(FDefaultHerdID) <> htBeef );

   ShowHint := True;

   FExitWithoutTreating := False;

   pLegend.Visible := False;

   FTreatmentsSaved := 0;
   FTreatmentsNotSaved := 0;

   DrugRegisterDBTableViewPurchUnitUsed.PropertiesClass := TcxLookupComboBoxProperties;
   with DrugRegisterDBTableView do
      begin
         with GetColumnByFieldName('DrugPurchUnit') do
            begin
               Caption := 'Unit';
               Width := 64;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.dsUnits;
                     KeyFieldNames := 'ID';
                     ListFieldNames := 'UnitCode';
                  end;
            end;
      end;
end;

procedure TfmDrugsRegisterImport.actImportFileExecute(Sender: TObject);
begin
   inherited;
   WinData.cxHint.HideHint;
   OpenDialog.Execute;
   if ( OpenDialog.FileName = '' ) then
      begin
         MessageDlg('No file selected.',mtError,[mbOK],0);
         Exit;
      end;
   FFileName := OpenDialog.FileName;
   ImportFile(FFileName);
end;

procedure TfmDrugsRegisterImport.ImportFile ( AFileName : String );
var
   sTempStr, sMsgString : String;
   i, iDrugID,
   iExistDrugPurchUnit,
   iDetailCount : Integer;
   Item : TDrugItem;
   PurchDate, ExpDate : TDateTime;

   function DrugQuantityLessMinus ( AQuantity : String ) : Double;
   var
      i : Integer;
      NewQuantity : String;
   begin
      Result := 0;
      for i := 0 to Length(AQuantity) do
         begin
            //   29/11/16 [V5.6 R3.6] /MK Bug Fix - This function was removing the decimal point within the quantity if one existed.
            if ( AQuantity[i] in ['0'..'9'] ) or ( AQuantity[i] = '.' ) then
               NewQuantity := NewQuantity + AQuantity[i];
         end;
      //   06/11/17 [V5.7 R4.3] /MK Change - Format float to 2 decimal places.
      Result := StrToFloat(FormatFloat('0.##',StrToFloat(NewQuantity)));
   end;

   function ExistsInDetailTable ( ADrugDesc, ABatchNo, AVPANumber : String;
      APurchDate, AExpiryDate : TDateTime ) : Boolean;
   var
      qExisting : TQuery;
   begin
      Result := False;

      if ( FHeaderID = 0 ) then Exit;
      
      if ( ADrugDesc = '' ) and ( ABatchNo = '' ) and ( AVPANumber = '' ) and
         ( APurchDate = 0 ) and ( AExpiryDate = 0 ) then Exit;

      ADrugDesc := TrimRight(UpperCase(ADrugDesc));
      AVPANumber := TrimRight(AVPANumber);
      ABatchNo := TrimRight(ABatchNo);

      qExisting := TQuery.Create(nil);
      with qExisting do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM '+FDetailTable.TableName+'');
            SQL.Add('WHERE (HeaderID = '+IntToStr(FHeaderID)+')');
            SQL.Add('AND   (Upper(DrugDesc) = "'+ADrugDesc+'")');
            if ( Length(ABatchNo) > 0 ) then
               SQL.Add('AND   (BatchNo = "'+ABatchNo+'")');
            if ( Length(AVPANumber) > 0 ) then
               SQL.Add('AND   (VPANumber = "'+AVPANumber+'")');
            SQL.Add('AND   (PurchDate = "'+FormatDateTime(cUSDateStyle,APurchDate)+'")');
            SQL.Add('AND   (ExpiryDate = "'+FormatDateTime(cUSDateStyle,AExpiryDate)+'")');
            Open;
            Result := ( RecordCount > 0 );
         finally
            Free;
         end;
   end;

   //   06/11/17 [V5.7 R4.3] /MK Change - If drug is in online database then its found else its not found.
   procedure SetVPAIndicatorIfDrugIsInOnlineDatabse(AVPANumber : String);
   var
      Item : TDrugItem;
   begin
      if ( Length(AVPANumber) = 0 ) then Exit;
      Item := TfmDrugFinder.FindDrugItemByVPA(AVPANumber,False);
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE '+FDetailTable.TableName);
            SQL.Add('SET VPAIndicator = :Indicator');
            SQL.Add('WHERE (HeaderID = :HeaderID)');
            SQL.Add('AND   (Upper(VPANumber) = :DrugID)');
            if ( Item <> nil ) then
               Params[0].AsInteger := cVPAFound
            else
               Params[0].AsInteger := cVPANotFound;
            Params[1].AsInteger := FHeaderID;
            Params[2].AsString := UpperCase(AVPANumber);
            ExecSQL;
         finally
            Free;
         end;
   end;

var
   vlDataLine : TVetLinkDataLine;
   ConfirmedPurchases : TStringList;
   bRecordTreatmentsOnly : Boolean;
   bStep : Boolean;

begin
   try
      Caption := 'Loading file, please wait...';

      Screen.Cursor := crHourGlass;

      blbSelectDeselectAll.Visible := ivNever;

      bRecordTreatmentsOnly := False;
      
      DrugRegisterDBTableView.OptionsData.Editing := True;

      ConfirmedPurchases := TStringList.Create;

      //   11/11/14 [V5.3 R8.9] /MK Bug Fix - Added procedure to clear duplicate headers from header and detail tables.
      FixDuplicateHeaderLines;

      FHeaderID := GetFileHeaderId();
      if ( IsHeaderIDFullyImported ) then
         begin
            MessageDlg('File '+ExtractFileName(FFileName)+ ' already read.'+cCRLF+
                       'You may need to complete the treatments of this file in Block Events > On-Farm Events > Vet/Dosing > VetLink Drugs.',mtInformation,[mbOK],0);
            FManualHealthSaveCompleted := True;
            Exit;
         end;

      //   21/08/17 [V5.7 R2.0] /MK Change - If the vet link file was already saved into the detail table then no need to import it again
      //                                     as it imports drugs that don't have a VPA Number or have an invalid VPA number again.
      if ( not(HeaderDetailRecorded) ) then
         try
            FVLFileImport.Import(AFileName);

            for i := 0 to FVLFileImport.Count-1 do
               try
                  vlDataLine := FVLFileImport.DataLine[i];

                  if ( not(vlDataLine.IsValid) ) then Continue;

                  iDrugID := 0;
                  iExistDrugPurchUnit := 0;

                  HerdLookup.qExistingVPADrugs.Close;
                  HerdLookup.qExistingVPADrugs.Open;

                  // Go through Medicine table and see if VPANo exists.
                  if ( HerdLookup.qExistingVPADrugs.Locate('VPANo', vlDataLine.VPANumber,[]) ) then
                     begin
                        iDrugID := HerdLookup.qExistingVPADrugs.FieldByName('ID').AsInteger;
                        iExistDrugPurchUnit := HerdLookup.qExistingVPADrugs.FieldByName('PurchUnit').AsInteger;
                     end
                  // Go through Medicine table and see if just the drug name exists
                  else if ( FMedicines.Locate('Name',Copy(vlDataLine.DrugDescription,0,30),[]) ) then
                     begin
                        iDrugID := FMedicines.FieldByName('ID').AsInteger;
                        iExistDrugPurchUnit := FMedicines.FieldByName('PurchUnit').AsInteger;
                     end;

                  //   05/12/17 [V5.7 R5.9] /MK Change - Co-Op files with drugs are being sent to farmers now. Allow for DDMMMYYYY date format in Purchase Date.
                  try
                     PurchDate := StrToDate(vlDataLine.PurchaseDate);
                  except
                     PurchDate := AlphaStrToDate(vlDataLine.PurchaseDate);
                  end;

                  //   05/12/17 [V5.7 R5.9] /MK Change - Co-Op files with drugs are being sent to farmers now. Allow for DDMMMYYYY date format in Expiry Date.
                  try
                     ExpDate := StrToDate(vlDataLine.ExpiryDate);
                  except
                     ExpDate := AlphaStrToDate(vlDataLine.ExpiryDate);
                  end;

                  // Go through the MediPur table and see if there is a purchase on the same date with same expiry date and batch number.
                  if DrugPurchaseExists(iDrugID, vlDataLine.BatchNumber, PurchDate, ExpDate) then
                     begin
                        ConfirmedPurchases.Add(vlDataLine.RawData);
                        Continue;
                     end;

                  // Go through DrugsRegImportDetail table to see if record was previously imported
                  // through Vetlink **BUT** NOT imported
                  if not ExistsInDetailTable(vlDataLine.DrugDescription,vlDataLine.BatchNumber,vlDataLine.VPANumber,PurchDate,ExpDate) then
                     try
                        FDetailTable.Append;
                        FDetailTable.FieldByName('HeaderID').AsInteger := FHeaderID;

                        // Start - Line data
                        if ( iDrugID > 0 ) then
                           begin
                              FDetailTable.FieldByName('DrugID').AsInteger := iDrugID;
                              FDetailTable.FieldByName('VPAIndicator').AsInteger := cVPAFound;
                              if ( iExistDrugPurchUnit > 0 ) then
                                 FDetailTable.FieldByName('DrugPurchUnit').AsInteger := iExistDrugPurchUnit;
                           end;

                        FDetailTable.FieldByName('PurchDate').AsDateTime := PurchDate;
                        FDetailTable.FieldByName('DrugDesc').AsString := vlDataLine.DrugDescription;
                        FDetailTable.FieldByName('TagDesc').AsString := vlDataLine.AnimalTags;
                        FDetailTable.FieldByName('DrugQuantity').AsFloat := DrugQuantityLessMinus(vlDataLine.Quantity);
                        FDetailTable.FieldByName('BatchNo').AsString := vlDataLine.BatchNumber;
                        FDetailTable.FieldByName('ExpiryDate').AsVariant := ExpDate;
                        FDetailTable.FieldByName('PurchDoseRate').AsString := vlDataLine.DoseRate;
                        FDetailTable.FieldByName('VPANumber').AsString := vlDataLine.VPANumber;
                        if ( iDrugID = 0 ) then
                           begin
                              if ( not(IsValidVPANumber(vlDataLine.VPANumber)) ) then
                                 FDetailTable.FieldByName('VPAIndicator').AsInteger := cInvalidOrNoVPA
                              else
                                 begin
                                    //   06/11/17 [V5.7 R4.3] /MK Change - If drug is in online database then its found else its not found.
                                    Item := TfmDrugFinder.FindDrugItemByVPA(vlDataLine.VPANumber);
                                    if ( Item <> nil ) then
                                       begin
                                          FDetailTable.FieldByName('VPAIndicator').AsInteger := cVPAFound;
                                          FDetailTable.FieldByName('DrugPurchUnit').AsInteger := Item.UnitUsed;
                                       end
                                    else
                                       FDetailTable.FieldByName('VPAIndicator').AsInteger := cVPANotFound;
                                 end;
                           end;

                        FDetailTable.FieldByName('DrugFindWithdAccepted').AsBoolean := False;
                        FDetailTable.FieldByName('SupplierName').AsString := vlDataLine.VetName;
                        FDetailTable.FieldByName('WithdrawalStr').AsString := vlDataLine.Withdrawal;
                        // End - Line data

                        FDetailTable.FieldByName('Imported').AsBoolean := False;
                        FDetailTable.FieldByName('Selected').AsBoolean := True;
                        FDetailTable.FieldByName('TreatmentSaved').AsBoolean := False;
                        FDetailTable.FieldByName('ApplicRate').AsFloat := 0;
                        FDetailTable.FieldByName('NoDays').AsInteger := 1;
                        FDetailTable.FieldByName('NoTimes').AsInteger := 1;
                        FDetailTable.FieldByName('AnimalGroupCategoryType').AsInteger := cManualAnimalEntry;
                        FDetailTable.Post;
                     except
                        FDetailTable.Cancel;
                     end
                  else if ( iDrugID > 0 ) then
                     UpdateExistDetailTableVPADrug(vlDataLine.VPANumber,iDrugID)
                  else
                     SetVPAIndicatorIfDrugIsInOnlineDatabse(vlDataLine.VPANumber);
               except
                  on e : Exception do
                     begin
                        ApplicationLog.LogException(e);
                        ApplicationLog.LogError('VetLink Import Error - Error posting record to DrugsRegImportDetail table.');
                     end;
               end;

            //   04/08/17 [V5.7 R1.2] /MK Change - Check to see if the total VetLink file is invalid i.e. there are no valid records on the file.
            FVetLinkFileCompletelyInvalid := ( FVLFileImport.Count = 0 );
            if ( FVLFileImport.InvalidDataLineCount > 0 ) then
               begin
                  MessageDlg(Format('The imported VetLink file appears to contain %d invalid record(s).' +cCRLF+
                                    'Invalid records are usually caused by incorrect formatting in the file supplied by your vets software package.'+cCRLF+
                                    'Kingswood Herd is unable to import these records at this time.'+cCRLFx2+
                                    'If you wish, you can contact Kingswood at 01-4599491 to try fix these invalid records.',[FVLFileImport.InvalidDataLineCount]),mtWarning,[mbOK],0);
                  TfmVetLinkFileImportSummary.ShowSummary(FVLFileImport.Errors,ConfirmedPurchases,nil,nil,FVetLinkFileCompletelyInvalid);
               end;

            //   21/08/17 [V5.7 R2.0] /MK Change - Set this header record to show that the detail records have already been imported for it.
            //   01/04/19 [V5.8 R8.4] /MK Change - Don't set HeaderDetailRecorded here as this will not allow for file to be read in again, with new name, if purchases fail - Una Carter.
            //HeaderDetailRecorded := True;

            //   04/08/17 [V5.7 R1.2] /MK Change - If the total VetLink file is invalid then close out of VetLink.
            if ( FVetLinkFileCompletelyInvalid ) then
               Exit;
         except
            HeaderDetailRecorded := False;
         end;

      DrugRegisterDBTableView.DataController.DataSource := nil;

      // Get record count by looping through table as a filter on a table will not return the correct record count of filtered records.
      iDetailCount := 0;
      FDetailTable.Filter := 'HeaderID = '+IntToStr(FHeaderID)+' AND Imported = FALSE AND TreatmentSaved = False';
      FDetailTable.Filtered := True;
      bStep := FDetailTable.FindFirst;
      while bStep do
         begin
            Inc(iDetailCount);
            bStep := FDetailTable.FindNext;
         end;

      //   05/01/22 [V6.0 R3.5] /MK Bug Fix - Use the ConfirmedPurchases list to see if there were purchases saved but the treatments weren't allowing the user to re-import the treatments.
      if ( ConfirmedPurchases.Count > 0 ) and ( iDetailCount = 0 ) then
         begin
            FDetailTable.Filter := 'HeaderID = '+IntToStr(FHeaderID)+' AND Imported = TRUE AND TreatmentSaved = False';
            FDetailTable.Filtered := True;
            bStep := FDetailTable.FindFirst;
            while ( bStep ) do
               begin
                  Inc(iDetailCount);
                  bStep := FDetailTable.FindNext;
               end;
            bRecordTreatmentsOnly := ( iDetailCount > 0 );
         end;

      if bRecordTreatmentsOnly then
         EnableTreatments(0)
      else
         begin
            // Show only columns that are associated with purchases.
            ShowHideColumns(True);

            DrugRegisterDBTableView.DataController.DataSource := FDSImportTable;

            DrugRegisterDBTableView.Styles.OnGetContentStyle := GetContentStyle;

            CreateLegendLabels;

            actRun.Enabled := ( iDetailCount > 0 );
            actSaveHealthsManually.Enabled := ( not(actRun.Enabled) );
            actPrint.Enabled := actRun.Enabled;

            if ( actRun.Enabled ) then
               DrugRegisterDBTableView.DataController.FocusedRowIndex := 0
            else
               begin
                  MessageDlg('File '+ExtractFileName(FFileName)+ ' already read.'+cCRLF+
                             'You may need to complete the treatments of this file in Block Events > On-Farm Events > Vet/Dosing > VetLink Drugs.',mtInformation,[mbOK],0);
                  FManualHealthSaveCompleted := True;
                  Exit;
               end;

            Caption := 'VetLink - Drug purchases imported from your vet.';

            DrugRegisterDBTableViewDrugVPAIndicator.SortIndex := 0;
            DrugRegisterDBTableViewDrugVPAIndicator.SortOrder := soAscending;

            DrugRegisterDBTableView.DataController.FocusedRowIndex := 0;

            DrugRegisterDBTableViewDrugQuantity.Options.Editing := True;
         end;

   finally
      if ( ConfirmedPurchases <> nil ) then
         FreeAndNil(ConfirmedPurchases);
      Screen.Cursor := crDefault;
      //   04/08/17 [V5.7 R1.2] /MK Change - As ImportFile is called from FormShow then post a message to close out of VetLink.
      if ( FVetLinkFileCompletelyInvalid ) or ( IsHeaderIDFullyImported ) then
         PostMessage(Self.Handle, WM_CLOSE, 0, 0);
   end;
end;

procedure TfmDrugsRegisterImport.actRunExecute(Sender: TObject);
var
   i,
   iSupplierID,
   iMediPurchID,
   iDefNAWithDrawal,
   iNewDrugCount,
   iMedicineID,
   iPurchaseCount,
   iProgressMaxCount : Integer;
   mprMedicinePurchaseRepository : TMedicinePurchaseRepository;
   iAnimalIDArray : TIntegerArray;
   TempQuery : TQuery;
   bHasDrugsWithoutVPA : Boolean;
   Item : TDrugItem;
   bStep : Boolean;

   procedure MarkDetailRecordAsNotImported;
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE '+FDetailTable.TableName+'');
            SQL.Add('SET Imported = False');
            SQL.Add('WHERE ID = '+IntToStr(FDetailTable.FieldByName('ID').AsInteger));
            try
               ExecSQL;
            except
            end;
         finally
            Free;
         end;
   end;

   procedure ProcessPurchase;
   begin
      // Get SupplierID from Suppliers table.
      iSupplierId := GetSupplierID(FDetailTable.FieldByName('SupplierName').AsString);
      iMediPurchID := 0;
      // Add purchase record to MediPur table.
      if ( mprMedicinePurchaseRepository = nil ) then
         mprMedicinePurchaseRepository := TMedicinePurchaseRepository.Create();
      try
         iMediPurchID  := mprMedicinePurchaseRepository.CreateMedicinePurchase(iMedicineID,iSupplierID,
                                                                               FDetailTable.FieldByName('PurchDate').AsDateTime,
                                                                               FDetailTable.FieldByName('ExpiryDate').AsDateTime,
                                                                               FDetailTable.FieldByName('BatchNo').AsString,
                                                                               FDetailTable.FieldByName('TagDesc').AsString,
                                                                               FDetailTable.FieldByName('PurchDoseRate').AsString,
                                                                               FDetailTable.FieldByName('DrugQuantity').AsFloat,1,'');
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError(Format('VetLink Import Error - Error in CreateMedicinePurchase, DrugID=%d.',[iMedicineID]));
            end;
      end;
      if ( mprMedicinePurchaseRepository <> nil ) then
         FreeAndNil(mprMedicinePurchaseRepository);

      if ( iMediPurchID > 0 ) then
         begin
            try
               UpdateMedicineCost(iMedicineID,FDetailTable.FieldByName('DrugQuantity').AsFloat,0);
            except
               on e : Exception do
                  begin
                     ApplicationLog.LogException(e);
                     ApplicationLog.LogError(Format('VetLink Import Error - Error in UpdateMedicineCost, DrugID=%d.',[iMedicineID]));
                  end;
            end;
            // Set whether drug has been saved to MediPur table.
            try
               TempQuery.Close;
               TempQuery.SQL.Clear;
               TempQuery.SQL.Add('UPDATE '+FDetailTable.TableName+'');
               TempQuery.SQL.Add('SET DrugPurchID = '+IntToStr(iMediPurchID)+',');
               TempQuery.SQL.Add('    DrugID = '+IntToStr(iMedicineID)+',');
               TempQuery.SQL.Add('    Imported = True');
               TempQuery.SQL.Add('WHERE ID = '+IntToStr(FDetailTable.FieldByName('ID').AsInteger)+'');
               TempQuery.ExecSQL;
               Inc(iPurchaseCount);
            except
               on e : Exception do
                  begin
                     ApplicationLog.LogException(e);
                     ApplicationLog.LogError(Format('VetLink Import Error - Error in updating DetailTable, DrugPurchID=%d, DrugID=%d.',[iMediPurchID,iMedicineID]));
                  end;
            end;
         end;
   end;

   function AllHeaderPurchasesCompleted : Boolean;
   var
      iValidVPA_NotImportCount : Integer;
   begin
      Result := False;
      iValidVPA_NotImportCount := 0;
      TempQuery.SQL.Clear;
      TempQuery.SQL.Add('SELECT Imported, VPANumber');
      TempQuery.SQL.Add('FROM '+FDetailTable.TableName+'');
      TempQuery.SQL.Add('WHERE (HeaderID = :FHeaderID)');
      TempQuery.SQL.Add('AND   (Imported = False)');
      TempQuery.SQL.Add('AND   (VPANumber IS NOT NULL)');
      try
         TempQuery.Params[0].AsInteger := FHeaderID;
         TempQuery.Open;
         Result := ( TempQuery.RecordCount = 0 );
         if ( not(Result) ) then
            begin
               TempQuery.First;
               while ( not(TempQuery.Eof) ) do
                  begin
                     if ( not(TempQuery.Fields[0].AsBoolean) ) and ( IsValidVPANumber(TempQuery.Fields[1].AsString) ) then
                        Inc(iValidVPA_NotImportCount);
                     TempQuery.Next;
                  end;
               Result := ( iValidVPA_NotImportCount = 0 );
            end;
      except
      end;
   end;

   procedure UpdateDetailTableMedicineID(AMedicineID : Integer; AVPANumber : String);
   begin
      TempQuery.Close;
      TempQuery.SQL.Clear;
      TempQuery.SQL.Add('UPDATE '+FDetailTable.TableName+'');
      TempQuery.SQL.Add('SET DrugID = '+IntToStr(AMedicineID)+'');
      TempQuery.SQL.Add('WHERE Upper(VPANumber) = "'+UpperCase(AVPANumber)+'"');
      try
         TempQuery.ExecSQL;
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('VetLink Import Error - Error updating DrugRegDetailTable for DrugID '+IntToStr(AMedicineID));
            end;
      end;
   end;

begin
   inherited;

   try
      WinData.cxHint.HideHint;

      if ( MessageDlg('Do you want to proceed with import of veterinary purchase details?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
         Exit;

      TempQuery := TQuery.Create(nil);
      TempQuery.DatabaseName := AliasName;

      DrugRegisterDBTableView.OptionsData.Editing := False;

      iNewDrugCount := 1;

      iPurchaseCount := 0;
      
      DrugRegisterDBTableView.Styles.OnGetContentStyle := nil;
      DrugRegisterDBTableViewEventDate.Caption := 'Purchase Date';

      actPrint.Enabled := False;

      FRunAborted := False;

      Screen.Cursor := crHourGlass;

      DrugRegisterDBTableView.DataController.BeginFullUpdate;

      //  03/11/17 [V5.7 R4.3] /MK Change - Get total number of records that have a VPA Number that exists in the Medicine table currently.
      //                                    Now create a progress bar based on this total number of records.
      iProgressMaxCount := GetRecordCountByFilterString('VPAIndicator = '+IntToSTr(cVPAFound));
      if ( iProgressMaxCount > 0 ) then
         begin
            ShowProgressIndicator('Purchasing Existing Medicines',0,iProgressMaxCount,1);
            ProgressIndicator.Max := iProgressMaxCount;
            Application.ProcessMessages;
            Update;

            // First go through the filtered detail table and purchase medicines that can be matched by the VPA.
            bStep := FDetailTable.FindFirst;
            while ( bStep ) do
               begin
                  if ( FDetailTable.FieldByName('VPAIndicator').AsInteger = cVPAFound ) then
                     begin
                        iMedicineID := 0;
                        HerdLookup.qExistingVPADrugs.Close;
                        HerdLookup.qExistingVPADrugs.Open;
                        //    27/07/18 [V5.8 R2.0] /MK Bug Fix - If the drug exists in the FDetailTable then use it don't go searching again for the VPA number.
                        iMedicineID := FDetailTable.FieldByName('DrugID').AsInteger;
                        // Go through Medicine table and see if drug name exists with VPANo
                        if ( iMedicineID = 0 ) then
                           if ( HerdLookup.qExistingVPADrugs.Locate('VPANo',FDetailTable.FieldByName('VPANumber').AsString,[]) ) then
                              iMedicineID := HerdLookup.qExistingVPADrugs.FieldByName('ID').AsInteger;
                        if ( iMedicineID > 0 ) then
                           ProcessPurchase;
                     end;

                  ProgressIndicator.Position := ProgressIndicator.Position + 1;
                  Application.ProcessMessages;
                  Update;

                  bStep := FDetailTable.FindNext;
               end;
            ProgressIndicator.Close;
            Application.ProcessMessages;
            Update;
            CreateLegendLabels;
         end;

      //   06/11/17 [V5.7 R4.3] /MK Change - Filter out detail table for purchases of this HeaderId that weren't imported.
      FDetailTable.Active := False;
      FDetailTable.Filter := 'HeaderID = '+IntToStr(FHeaderID)+' AND Imported = False';
      FDetailTable.Filtered := True;
      FDetailTable.Active := True;
      iProgressMaxCount := GetRecordCountByFilterString(FDetailTable.Filter);
      if ( iProgressMaxCount > 0 ) then
         begin
            ShowProgressIndicator('Purchasing New Medicines',0,iProgressMaxCount,1);
            ProgressIndicator.Max := iProgressMaxCount;
            Application.ProcessMessages;
            Update;
            bStep := FDetailTable.FindFirst;
            while ( bStep ) do
               try
                  FMedicines.Close;
                  FMedicines.Open;
                  iMedicineID := 0;

                  if ( FDetailTable.FieldByName('ID').AsInteger > 0 ) then
                     begin
                        //   23/08/17 [V5.7 R2.0] /MK Bug Fix - If there was no VPA number the drug was still being imported.
                        if ( FDetailTable.FieldByName('VPAIndicator').AsInteger = cInvalidOrNoVPA ) then
                           //   27/07/18 [V5.8 R2.0] /MK Change - If the drug is not valid then new procedure, MarkDetailRecordAsNotImported, sets it as imported/ignored via SQL.
                           MarkDetailRecordAsNotImported
                        else
                           begin
                              //   14/12/17 [V5.7 R6.3] /MK Bug Fix - If a drug is in the VetLink file more than once and it wasn't in the database prior to VetLink import,
                              //                                      it then gets added by the DrugFinder code below so when we loop through to the next purchase of the medicine
                              //                                      we need to search for the DrugID in the Medicine table. Bug was that the drug was being added for every purchase - Tom Crosse.
                              HerdLookup.qExistingVPADrugs.Close;
                              HerdLookup.qExistingVPADrugs.Open;
                              if ( HerdLookup.qExistingVPADrugs.Locate('VPANo',FDetailTable.FieldByName('VPANumber').AsString,[]) ) then
                                 iMedicineID := HerdLookup.qExistingVPADrugs.FieldByName('ID').AsInteger;
                              if ( iMedicineID = 0 ) then
                                 begin
                                    //   06/11/17 [V5.7 R4.3] /MK Change - Just add the medicine, don't prompt for matching against users medicine table.
                                    Item := TfmDrugFinder.FindDrugItemByVPA(FDetailTable.FieldByName('VPANumber').AsString);
                                    try
                                       FMedicines.Append;
                                       //   25/06/19 [V5.8 R9.6] /MK Bug Fix - Use global GetNewDrugCode that is used by WinData.MedicineNewRecord.
                                       FMedicines.FieldByName('DrugCode').AsString := GetNewDrugCode;
                                       FMedicines.FieldByName('Name').AsString := FDetailTable.FieldByName('DrugDesc').AsString;
                                       FMedicines.FieldByName('InUse').AsBoolean := True;
                                       FMedicines.FieldByName('OldMeatWithdrawal').AsInteger := FMedicines.FieldByName('Withdrawal').AsInteger;
                                       FMedicines.FieldByName('OldMilkWithdrawal').AsInteger := FMedicines.FieldByName('MilkWithdrawal').AsInteger;
                                       FMedicines.FieldByName('Withdrawal').AsInteger := FDetailTable.FieldByName('MeatWithdrawalDays').AsInteger;
                                       FMedicines.FieldByName('MilkWithdrawal').AsInteger := FDetailTable.FieldByName('MilkWithdrawalDays').AsInteger;
                                       FMedicines.FieldByName('MilkN_A_Drug').AsBoolean := FDetailTable.FieldByName('MilkN_A_Drug').AsBoolean;
                                       FMedicines.FieldByName('MeatN_A_Drug').AsBoolean := FDetailTable.FieldByName('MeatN_A_Drug').AsBoolean;
                                       FMedicines.FieldByName('VPANo').AsString := FDetailTable.FieldByName('VPANumber').AsString;

                                       if ( Item <> nil ) then
                                          begin
                                             FMedicines.FieldByName('MediGroup').AsInteger := Item.MedicineGroup;
                                             FMedicines.FieldByName('DoseUnit').AsInteger := Item.UnitUsed;
                                             FMedicines.FieldByName('PurchUnit').AsInteger := Item.UnitUsed;
                                             FMedicines.FieldByName('DrugFindWithdAccepted').AsBoolean := FDetailTable.FieldByName('DrugFindWithdAccepted').AsBoolean;
                                             if ( FDetailTable.FieldByName('DrugFindWithdAccepted').AsBoolean ) then
                                                begin
                                                   FMedicines.FieldByName('DrugFindWithdAcceptDate').AsDateTime := Now;
                                                   FMedicines.FieldByName('MeatWithdBroughtDown').AsInteger := FDetailTable.FieldByName('MeatWithdrawalDays').AsInteger;
                                                   FMedicines.FieldByName('MilkWithdBroughtDown').AsInteger := FDetailTable.FieldByName('MilkWithdrawalDays').AsInteger;
                                                end;
                                          end;

                                       FMedicines.Post;
                                    except
                                       on e : Exception do
                                          begin
                                             ApplicationLog.LogException(e);
                                             ApplicationLog.LogError('VetLink Import Error - Error creating drug for DrugRegImportDetail.ID '+IntToStr(FDetailTable.FieldByName('ID').AsInteger));
                                          end;
                                    end;

                                    iMedicineID := FMedicines.FieldByName('ID').AsInteger;
                                 end;
                              ProcessPurchase;

                              Inc(iNewDrugCount);

                              UpdateDetailTableMedicineID(iMedicineID,FDetailTable.FieldByName('VPANumber').AsString);
                              FManualHealthSaveCompleted := False;
                           end;
                     end;
                  CreateLegendLabels;
                  ProgressIndicator.Position := ProgressIndicator.Position + 1;
                  Application.ProcessMessages;
                  Update;
                  bStep := FDetailTable.FindNext;
               except
                  on e : Exception do
                     begin
                        ApplicationLog.LogException(e);
                        ApplicationLog.LogError('VetLink Import Error - Error posting DrugRegImportDetail ID : '+IntToStr(FDetailTable.FieldByName('ID').AsInteger));
                     end;
               end;
            ProgressIndicator.Close;
            Application.ProcessMessages;
            Update;
         end;

      DrugRegisterDBTableView.DataController.EndFullUpdate;

      EnableTreatments(iPurchaseCount);

   finally
      Screen.Cursor := crDefault;
      if ( TempQuery <> nil ) then
         begin
            TempQuery.Close;
            FreeAndNil(TempQuery);
         end;
   end;
end;

function TfmDrugsRegisterImport.GetSupplierID (ASupplierName : String) : Integer;
var
   TempSuppliers : TTable;
begin
   Result := 0;
   if ( ASupplierName = '' ) then Exit;

   // Locate SupplierID based on name and if MedicineSupplier.
   TempSuppliers := TTable.Create(nil);
   with TempSuppliers do
      try
         DatabaseName := AliasName;
         TableName := 'SuppliersBreeders';
         Close;
         Filtered := False;
         Filter := '';
         Filter := 'MedicineSupplier = True';
         Filtered := True;
         Open;
         try
            if Locate(Fields[1].FieldName,ASupplierName,[]) then
               Result := Fields[0].AsInteger
            else
               begin
                  Filtered := False;
                  Filter := '';
                  try
                     Append;
                     FieldByName('Name').AsString := ASupplierName;
                     FieldByName('Address 1').AsString := ASupplierName;
                     FieldByName('MedicineSupplier').AsBoolean := True;
                     //   06/11/17 [V5.7 R4.3] /MK Bug Fix - Set supplier to be in use.
                     FieldByName('InUse').AsBoolean := True;
                     Post;
                     Result := FieldByName('ID').AsInteger;
                  except
                     Cancel;
                  end;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.actSaveHealthsManuallyExecute(Sender: TObject);
var
   TreatmentSaved : Boolean;
   slTreatments : TStringList;
   i : Integer;
   sAnimalsNotTreated : String;
begin
   inherited;
   if ( FDetailTable.State in [dsInsert, dsEdit] ) then
      FDetailTable.Post;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM '+FDetailTable.TableName+'');
         SQL.Add('WHERE (Selected = True)');
         SQL.Add('AND   (Imported = True)');
         SQL.Add('AND   (HeaderID = '+IntToStr(FHeaderID)+')');
         SQL.Add('AND   ( (ApplicRate = 0) OR (ApplicRate IS NULL) )');
         try
            Open;
            if ( RecordCount > 0 ) then
               if ( MessageDlg('Some of the selected treatments do not have an application rate entered.'+cCRLF+
                               'Do you want to record these treatments with the default application rate of 1?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
                  Exit;
         except
         end;
      finally
         Free;
      end;

   // Secondly go through the remaining records and treat those that are manual treatments and show progress bar.
   CreateHealthEvents;

   if ( FDetailTable.State in dsEditModes ) then
      FDetailTable.Post;

   // Show records not saved if any exist.
   DrugRegisterDBTableView.DataController.DataSource := nil;
   FDetailTable.Filter := '';
   FDetailTable.Filtered := False;
   FDetailTable.Filter := 'TreatmentSaved = FALSE AND HeaderID = '+IntToStr(FHeaderID)+' AND DrugID > 0 AND DrugPurchID > 0';
   FDetailTable.Filtered := True;
   DrugRegisterDBTableView.DataController.DataSource := FDSImportTable;

   actSaveHealthsManually.Enabled := ( not(FDetailTable.IsEmpty) );

   StatusBar.Panels[0].Text := 'Records : '+ IntToStr(GetRecordCountByFilterString(FDetailTable.Filter));

   pInformation.Visible := ( not(FDetailTable.IsEmpty) );
   lUntickAnimals.Visible := False;
   if ( not(FDetailTable.IsEmpty) ) then
      begin
         actPrint.Enabled := True;
         DrugRegisterDBTableView.OptionsData.Editing := False;
         DrugRegisterDBTableViewSelected.Visible := False;
         pInformation.Height := 40;
         lInformation.Align := alTop;
         lInformation.Height := 40;
         lInformation.Caption := 'The events below cannot be matched with animals in the herd. '+
                                 'Please print this report for further checking.'+cCRLF+
                                 'These events can be treated manually by going into Block Events > On-Farm Events > Vet/Dosing > VetLink Drugs.';
      end;

   FManualHealthSaveCompleted := True;

   //   16/08/17 [V5.7 R1.2] /MK Change - Show the uVetLinkFileImportSummary screen after the treatments.
   if ( FTreatmentsSaved > 0 ) or ( FTreatmentsNotSaved > 0 ) then
      begin
         slTreatments := TStringList.Create();
         slTreatments.Add('VetLink treatment import is complete - please review the below information.');
         slTreatments.Add('');
         if ( FTreatmentsSaved > 0 ) then
            begin
               slTreatments.Add(Format('%d treatment record(s) were created.',[FTreatmentsSaved]));
               slTreatments.Add('');
            end;
         if ( FTreatmentsNotSaved > 0 ) then
            begin
               slTreatments.Add(Format('%d treatment record(s) were NOT created. This would occur when :-'+cCRLF+
                                        '(A) the treatment already exists for the animal i.e. the same drug was treated to the animal on the same treatment date from VetLink.'+cCRLF+
                                        //   07/12/17 [V5.7 R6.0] /MK Change - Added extra reasons for not saving events if animal treated after sale date
                                        //                                     and animal treatment withdrawal date is after sale date.
                                        '(B) the animal was sold and the treatment date was after the animals sale date.'+cCRLF+
                                        '(C) the animal was sold and the treatment withdrawal date was after the animals sale date.'+cCRLFx2+
                                        'Please print the grid after you close this screen so that you can review the treatment(s) that were NOT created.'+cCRLF+
                                        'You may be able record these treatments manually by going into Block Events > On-Farm Events > Vet/Dosing > VetLink Drugs.',[FTreatmentsNotSaved]));

               if ( Length(FTagStringArrayNotTreated) > 0 ) then
                  begin
                     slTreatments.Add('');
                     slTreatments.Add('The tag descriptions that the events could not be saved for because of the above reasons are :-');
                     for i := 0 to Length(FTagStringArrayNotTreated)-1 do
                        if ( Length(sAnimalsNotTreated) = 0 ) then
                           sAnimalsNotTreated := '"'+FTagStringArrayNotTreated[i]+'"'
                        else
                           sAnimalsNotTreated := sAnimalsNotTreated + ', '+ '"'+FTagStringArrayNotTreated[i]+'"';
                     slTreatments.Add(sAnimalsNotTreated);
                  end;
            end;
         TfmVetLinkFileImportSummary.ShowSummary(nil,nil,nil,slTreatments,FVetLinkFileCompletelyInvalid);
         FreeAndNil(slTreatments);
      end;

   actSaveHealthsManually.Enabled := False;

   if ( FDetailTable.IsEmpty ) then
      begin
          with TQuery.Create(nil) do
             try
                DatabaseName := AliasName;
                SQL.Clear;
                SQL.Add('UPDATE '+FHeaderTable.TableName+'');
                SQL.Add('SET FullyImported = TRUE');
                SQL.Add('WHERE ID = '+IntToStr(FHeaderID)+'');
                try
                   ExecSQL;
                except
                end;
             finally
                Free;
             end;

         Close;
         Exit;
      end;

   Screen.Cursor := crDefault;
end;

procedure TfmDrugsRegisterImport.CreateHealthEvents();
var
   bTreatmentSaved : Boolean;
   sTagDescNotTreated,
   sLine : String;
   Parser : TSPParser;
   slTreatments : TStringList;
   i,
   iNoTreatments : Integer;
   bStepDetail,
   bStepAnimals : Boolean;
begin
   bTreatmentSaved := False;

   DrugRegisterDBTableView.DataController.BeginFullUpdate;
   FDetailTable.DisableControls;
   FDetailTable.Close;
   FDetailTable.Open;
   FDetailTable.EnableControls;
   DrugRegisterDBTableView.DataController.EndFullUpdate;

   FDetailTable.Filter := '';
   FDetailTable.Filtered := False;
   FDetailTable.Filter := 'HeaderID = '+IntToStr(FHeaderID)+' AND TreatmentSaved = False AND DrugID > 0 AND DrugPurchID > 0 AND Selected = True';
   FDetailTable.Filtered := True;

   if ( FDetailTable.IsEmpty ) then Exit;

   try
      Screen.Cursor := crHourGlass;

      if ( FDetailAnimalsTable.State in dsEditModes ) then
         FDetailAnimalsTable.Post;

      iNoTreatments := 0;

      bStepDetail := FDetailTable.FindFirst;
      while ( bStepDetail ) do
         begin
            FDetailAnimalsTable.Filter := '';
            FDetailAnimalsTable.Filtered := False;
            FDetailAnimalsTable.Filter := 'DetailID = '+IntToStr(FDetailTable.FieldByName('ID').AsInteger)+ ' AND TreatmentSaved = False';
            FDetailAnimalsTable.Filtered := True;
            bStepAnimals := FDetailAnimalsTable.FindFirst;
            while ( bStepAnimals ) do
               begin
                  Inc(iNoTreatments);
                  bStepAnimals := FDetailAnimalsTable.FindNext;
               end;
            bStepDetail := FDetailTable.FindNext;
         end;

      if ( iNoTreatments = 0 ) then Exit;

      FHealthEvent := THealthEvent.Create('HRec');
      FHealthEvent.Database.StartTransaction;

      ShowProgressIndicator('Creating Treatments',0,iNoTreatments,1);
      ProgressIndicator.Max := iNoTreatments;
      Application.ProcessMessages;
      Update;

      slTreatments := TStringList.Create();

      try
         sTagDescNotTreated := '';

         bStepDetail := FDetailTable.FindFirst;
         while ( bStepDetail ) do
            begin
               FDetailAnimalsTable.Filter := '';
               FDetailAnimalsTable.Filtered := False;
               FDetailAnimalsTable.Filter := 'DetailID = '+IntToStr(FDetailTable.FieldByName('ID').AsInteger);
               FDetailAnimalsTable.Filtered := True;
               bStepAnimals := FDetailAnimalsTable.FindFirst;
               while bStepAnimals do
                  begin
                     FAnimalRec.AnimalID := 0;
                     FAnimalRec.LactNo := 0;
                     FAnimalRec.HerdID := 0;
                     CreateFAnimalRecByID(FDetailAnimalsTable.FieldByName('AnimalID').AsInteger);
                     bTreatmentSaved := HealthEventCreated;
                     if ( bTreatmentSaved ) then
                        begin
                           slTreatments.Add(IntToStr(FDetailAnimalsTable.FieldByName('DetailID').AsInteger));
                           Inc(FTreatmentsSaved);
                        end
                     else
                        begin
                           Inc(FTreatmentsNotSaved);
                           if ( not(InArray(FDetailAnimalsTable.FieldByName('AnimalTagDesc').AsString,FTagStringArrayNotTreated)) ) then
                              begin
                                 SetLength(FTagStringArrayNotTreated,Length(FTagStringArrayNotTreated)+1);
                                 FTagStringArrayNotTreated[Length(FTagStringArrayNotTreated)-1] := FDetailAnimalsTable.FieldByName('AnimalTagDesc').AsString;
                              end;
                        end;

                     FDetailAnimalsTable.Edit;
                     FDetailAnimalsTable.FieldByName('TreatmentSaved').AsBoolean := bTreatmentSaved;
                     FDetailAnimalsTable.Post;

                     ProgressIndicator.Position := ProgressIndicator.Position + 1;

                     bStepAnimals := FDetailAnimalsTable.FindNext;
                  end;
               bStepDetail := FDetailTable.FindNext;
            end;

      finally
         ProgressIndicator.Close;
         Application.ProcessMessages;
         Update;

         if ( FHealthEvent <> nil ) then
            begin
               if FHealthEvent.Database.InTransaction then
                  FHealthEvent.Database.Commit;
               FHealthEvent.Free;
            end;
      end;

      if ( slTreatments.Count > 0 ) then
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               Parser := TSPParser.Create(nil);
               try
                  Parser.Sepchar := ',';
                  for i := 0 to slTreatments.Count-1 do
                     begin
                        sLine := '';
                        sLine := slTreatments.Strings[i];
                        Parser.Parse(sLine);

                        SQL.Clear;
                        SQL.Add('UPDATE '+FDetailTable.TableName+'');
                        SQL.Add('SET TreatmentSaved = TRUE');
                        SQL.Add('WHERE ID = '+Parser.Fields[1]+'');
                        try
                           ExecSQL;
                        except
                        end;
                     end;
               finally
                  if ( Parser <> nil ) then
                     FreeAndNil(Parser);
               end;
            finally
               Free;
            end;

   finally
      if ( slTreatments <> nil ) then
         FreeAndNil(slTreatments);
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmDrugsRegisterImport.CreateFAnimalRecByID(AAnimalID: Integer);
begin
   FAnimalRec.AnimalID := 0;
   FAnimalRec.LactNo := 0;
   FAnimalRec.HerdID := 0;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT LactNo, HerdID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID = :AnimalID');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            FAnimalRec.AnimalID := AAnimalID;
            FAnimalRec.LactNo := Fields[0].AsInteger;
            FAnimalRec.HerdID := Fields[1].AsInteger;
         except
         end;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.LocateAnimalByTagDesc(ATagDesc: String);
var
   iSearchIndex : Integer;
   SearchText : String;
   iAnimalID : Integer;
   dTreatmentDate : TDateTime;
   qAnimals : TQuery;
const
   cGetExistingAnimal = 'SELECT A.AnimalID, A.LactNo, A.HerdID, A.InHerd'+cCRLF+
                        'FROM tmpAnimalsByDate A';
begin
   if ( Length(ATagDesc) = 0 ) then Exit;

   //   30/04/18 [V5.7 R9.1] /MK Change - Use Treatment Date as data to find animals as on treatment date.
   dTreatmentDate := FDetailTable.FieldByName('PurchDate').AsDateTime;
   if ( dTreatmentDate <= 0 ) then Exit;

   FAnimalRec.AnimalID := 0;
   FAnimalRec.LactNo := 0;
   FAnimalRec.HerdID := 0;
   iSearchIndex := 8;

   qAnimals := TQuery.Create(nil);
   try
      qAnimals.DatabaseName := AliasName;
      qAnimals.SQL.Clear;
      qAnimals.SQL.Text := cGetExistingAnimal;
      // First search to see if animal exists in herd with an animal like ATagDesc
      qAnimals.SQL.Add('WHERE (AnimalNo = "'+ATagDesc+'")');
      qAnimals.Open;

      qAnimals.First;
      iAnimalID := 0;
      // If more than one animal found with AnimalNo like ATagDesc then don't save.
      if ( qAnimals.RecordCount = 1 ) and ( qAnimals.Fields[0].AsInteger > 0 ) then
         iAnimalID := qAnimals.Fields[0].AsInteger
      else
         begin
           ATagDesc := StripAllAlphaButNum(ATagDesc);
           if ( Length(ATagDesc) = 0 ) then Exit;
           qAnimals.SQL.Clear;
           qAnimals.SQL.Text := cGetExistingAnimal;
           //   26/09/17 [V5.7 R3.1] /MK Change - If this is an Irish herd then length of LocateNatID (tag without country prefix) will always be 12.
           //                                     Get substring based on 12 minus the length of ATagDesc + 1.
           //                                     Use + 1 to start search at right character.
           //                                     Substring SQL should only find one instance of ATagDesc - Peter Farrell request.
           if ( FCountry = Ireland ) then
              begin
                 iSearchIndex := (12 - Length(ATagDesc))+1;
                 qAnimals.SQL.Add('WHERE SUBSTRING(SearchNatID FROM '+IntToStr(iSearchIndex)+') LIKE "%'+ATagDesc+'%"');
              end
           else
              qAnimals.SQL.Add('AND   (SearchNatId Like ("%'+ATagDesc+'%"))');
           qAnimals.Open;
           qAnimals.First;
           // If more than one animal found with ATagDesc then don't save.
           if ( qAnimals.RecordCount = 1 ) and ( qAnimals.Fields[0].AsInteger > 0 ) then
              iAnimalID := qAnimals.Fields[0].AsInteger;
         end;
      CreateFAnimalRecByID(iAnimalID);
   finally
      if ( qAnimals <> nil ) then
         begin
            qAnimals.Close;
            FreeAndNil(qAnimals);
         end;
   end;
end;

function TfmDrugsRegisterImport.HealthEventCreated : Boolean;
var
   sDoseRate : String;
   dSaleDate : TDateTime;
begin
   Result := False;

   if ( FAnimalRec.AnimalID = 0 ) then Exit;

   // Check to see if the animal was treated with this drug on the VetLink treatment date.
   if ( WinData.FEventDataHelper.TreatmentEventExists(FAnimalRec.AnimalID,
                                                      FDetailTable.FieldByName('DrugID').AsInteger,
                                                      FDetailTable.FieldByName('PurchDate').AsDateTime) ) then Exit;


   //   25/04/16 [V5.5 R5.7] /MK Change - Check to see if the animal has a sale event.
   dSaleDate := 0;
   dSaleDate := WinData.EventDataHelper.GetLastEventDate(FAnimalRec.AnimalID,CSaleDeathEvent);
   if ( dSaleDate > 0 ) then
      begin
         //   25/04/16 [V5.5 R5.7] /MK Change - Check to see if the animal treatment date is not after the sale event.
         if ( FDetailTable.FieldByName('PurchDate').AsDateTime > dSaleDate ) then Exit;
         //   25/04/16 [V5.5 R5.7] /MK Change - If the animal was sold then check to see if the sale was within the withdrawal period.
         if ( not(HerdLookup.AnimalIsDead(FAnimalRec.AnimalID)) ) then
            if ( HerdLookup.ThisTreatmentWithdrawalAfterSaleDate(FAnimalRec.AnimalID, FDetailTable.FieldByName('DrugID').AsInteger,
                                                                 FDetailTable.FieldByName('NoDays').AsInteger,
                                                                 FDetailTable.FieldByName('PurchDate').AsDateTime,
                                                                 dSaleDate) ) then Exit;
      end;

   try
      FHealthEvent.Append;
      FHealthEvent.EventType := THealth;
      FHealthEvent.AnimalID := FAnimalRec.AnimalID;
      FHealthEvent.AnimalLactNo := FAnimalRec.LactNo;
      FHealthEvent.AnimalHerdID := FAnimalRec.HerdID;
      FHealthEvent.EventDate := FDetailTable.FieldByName('PurchDate').AsDateTime;
      FHealthEvent.DrugUsed := FDetailTable.FieldByName('DrugID').AsInteger;
      FHealthEvent.DrugPurchID := FDetailTable.FieldByName('DrugPurchID').AsInteger;
      FHealthEvent.DrugBatchNo := FDetailTable.FieldByName('BatchNo').AsString;
      if ( FDetailTable.FieldByName('ApplicRate').AsFloat > 0 ) then
         FHealthEvent.RateApplic := FDetailTable.FieldByName('ApplicRate').AsFloat
      else
         FHealthEvent.RateApplic := 1;
      FHealthEvent.NoDays := FDetailTable.FieldByName('NoDays').AsInteger;
      FHealthEvent.NoTimes := FDetailTable.FieldByName('NoTimes').AsInteger;

      // Change event comment to Health - Drug Code.
      FHealthEvent.ManualComment := True;
      //   22/08/17 [V5.7 R2.0] /MK Bug Fix - Default the comment to name of the drug with application rate and unit code.
      FHealthEvent.EventComment := GetHealthCommentByName_Unit_ApplicRate(FDetailTable.FieldByName('DrugID').AsInteger,FHealthEvent.RateApplic,THealth);

      FHealthEvent.Post;
      Result := True;
   except
      FHealthEvent.Cancel;
      Result := False;
   end;
end;

function TfmDrugsRegisterImport.DrugPurchaseExists(const ADrugID : Integer; const ABatchNo : String;
   const APurchaseDate, AExpiryDate : TDateTime ) : Boolean;
var
   qMedPurch : TQuery;
begin
   Result := False;

   if ( ADrugID <= 0 ) then Exit;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT MP.ID, MP.DrugID, MP.PurchDate, MP.ExpiryDate, MP.BatchNo');
         SQL.Add('FROM MediPur MP');
         SQL.Add('WHERE (MP.DrugID = :ADrugID)');
         if ( APurchaseDate > 0  ) then
            SQL.Add('AND   (MP.PurchDate = "'+FormatDate(APurchaseDate,dsUS)+'")');
         if ( AExpiryDate > 0 ) then
            SQL.Add('AND   (MP.ExpiryDate = "'+FormatDate(AExpiryDate,dsUS)+'")');
         SQL.Add('AND   (UPPER(MP.BatchNo) = :ABatchNo)');
         Params[0].AsInteger := ADrugId;
         Params[1].AsString := Uppercase(ABatchNo);
         Open;
         Result := Fields[0].AsInteger>0;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.actPrintExecute(Sender: TObject);
var
   sFromDate,
   sToDate : String;
   pt : tPoint;
begin
   inherited;
   WinData.cxHint.HideHint;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Min(PurchDate), Max(PurchDate)');
         SQL.Add('FROM '+FDetailTable.TableName+'');
         Open;
         try
            First;
            if ( Fields[0].AsDateTime > 0 ) and ( Fields[1].AsDateTime > 0 ) then
               begin
                  sFromDate := DateToStr(Fields[0].AsDateTime);
                  sToDate :=DateToStr(Fields[1].AsDateTime);
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
   if ( dxlbRun.Action <> actRun ) then
      dxComponentPrinterLink.ReportTitle.Text := 'Purchased Records Not Matched to Treatments - '+sFromDate+' to '+sToDate;
   dxComponentPrinterLink.Preview;
   FReviewPrinted := True;
end;

procedure TfmDrugsRegisterImport.UpdateMedicineCost (MedicineID : LongInt; MedicineRate, NewCost : Double);
var
   rpMedicine : TMedicineRepository;
begin
   if ( MedicineID = 0 ) then Exit;
   //   20/03/15 [V5.4 R3.4] /MK Change - Bit of refactoring here. Replaced code with new MedicineRepository.UpdateMedicineStock.
   rpMedicine := TMedicineRepository.Create();
   rpMedicine.UpdateMedicineStock(NewCost,MedicineID,MedicineRate);
   FreeAndNil(rpMedicine);
end;

function TfmDrugsRegisterImport.IsHeaderIDFullyImported: Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT FullyImported');
         SQL.Add('FROM '+FHeaderTable.TableName+'');
         SQL.Add('WHERE ID = '+IntToStr(FHeaderID)+'');
         try
            Open;
            Result := Fields[0].AsBoolean;
         except
            on e : Exception do
               begin
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError('VetLink Import Error - Unable to get whether HeaderID is imported.');
                  Result := False;
               end;
         end;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.FixDuplicateHeaderLines;

   procedure UpdateDetailTableHeaderID(AFileName : String);
   var
      FirstHeaderID : Integer;
      iaHeadersToDelete : array of Integer;
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID');
            SQL.Add('FROM '+FHeaderTable.TableName+'');
            SQL.Add('WHERE (FileName = "'+AFileName+'")');
            try
               Open;
               First;
               FirstHeaderID := 0;
               SetLength(iaHeadersToDelete,0);
               while ( not(Eof) ) do
                  begin
                     if ( FirstHeaderID = 0 ) then
                        FirstHeaderID := Fields[0].AsInteger
                     else
                        begin
                           SetLength(iaHeadersToDelete,Length(iaHeadersToDelete)+1);
                           iaHeadersToDelete[Length(iaHeadersToDelete)-1] := Fields[0].AsInteger;
                        end;
                     Next;
                  end;
               if Length(iaHeadersToDelete) > 0 then
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+FDetailTable.TableName+'');
                     SQL.Add('SET HeaderID = '+IntToStr(FirstHeaderID)+'');
                     SQL.Add('WHERE HeaderID IN '+IntArrayToSQLInString(iaHeadersToDelete)+'');
                     try
                        ExecSQL;
                     except
                     end;

                     SQL.Clear;
                     SQL.Add('DELETE FROM '+FHeaderTable.TableName+'');
                     SQL.Add('WHERE ID IN '+IntArrayToSQLInString(iaHeadersToDelete)+'');
                     try
                        ExecSQL;
                     except
                     end;
                  end;
            except
            end;
         finally
            Free;
         end;
   end;

begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT FileName, Count(FileName)');
         SQL.Add('FROM DrugsRegImportHeader');
         SQL.Add('GROUP BY FileName');
         SQL.Add('HAVING COUNT(FileName) > 1');
         try
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  if ( Fields[1].AsInteger > 0 ) then
                     UpdateDetailTableHeaderID(Fields[0].AsString);
                  Next;
               end;
         except
         end;
      finally
         Free;
      end;
end;

function TfmDrugsRegisterImport.FHeaderTotalRec: Integer;
begin
   Result := 0;
   if ( FHeaderID > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Count(ID)');
            SQL.Add('FROM '+FDetailTable.TableName+'');
            SQL.Add('WHERE HeaderID = '+IntToStr(FHeaderID)+'');
            try
               Open;
               Result := Fields[0].AsInteger;
            except
            end;
         finally
            Free;
         end;
end;

procedure TfmDrugsRegisterImport.DrugRegisterDBTableViewTagDescPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   pt : tPoint;
begin
   inherited;
   GetCursorPos(pt);
   pmAnimalSelect.Popup(pt.x,pt.y);
end;

procedure TfmDrugsRegisterImport.Groups1Click(Sender: TObject);
var
   AnimalArray,
   GroupArray : PIntegerArray;
   i : Integer;
   sDetailTxt : String;
   CategorySelected : TCategoryType;
begin
   inherited;
   SetLength(GroupArray,0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(GroupID)');
         SQL.Add('FROM '+FDetailAnimalsTable.TableName);
         SQL.Add('WHERE DetailID = :DetailID');
         Params[0].AsInteger := FDetailTable.FieldByName('ID').AsInteger;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  First;
                  while ( not(Eof) ) do
                     begin
                        SetLength(GroupArray,Length(GroupArray)+1);
                        GroupArray[Length(GroupArray)-1] := Fields[0].AsInteger;
                        Next;
                     end;
               end;
         except
         end;
      finally
         Free;
      end;

   TfmDrugRegImportGroupSelect.ShowTheForm(GroupArray);
   if ( Length(GroupArray) = 0 ) then Exit;

   DeleteFromDetailAnimalsTable;

   if ( Length(GroupArray) = 0 ) then Exit;

   CreateTempAnimalSelectTableData(FDetailTable.FieldByName('PurchDate').AsDateTime);
   SetLength(AnimalArray,0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM '+FAnimalSelectTable.TableName);
         SQL.Add('WHERE AnimalID NOT IN (SELECT AnimalID');
         SQL.Add('                       FROM GrpLinks');
         SQL.Add('                       WHERE GroupID IN '+IntArrayToSQLInString(GroupArray)+')');
         try
            ExecSQL;
            CategorySelected := ctGroupSelected;
            TfmAnimalSelectByDate.ShowTheForm(FDetailTable.FieldByName('PurchDate').AsDateTime,CategorySelected,AnimalArray);
         except
         end;
      finally
         Free;
      end;
   if ( Length(AnimalArray) > 0 ) then
      AddAnimalSelectionToTable(AnimalArray,(not(CategorySelected in [ctCurrentHerdAnimals, ctNoSelection])),sDetailTxt,GroupArray[i]);

   if ( Length(AnimalArray) = 0 ) then
      sDetailTxt := ''
   else if ( CategorySelected = ctGroupSelected ) then
      sDetailTxt := 'GROUP SELECTED';

   if ( FDetailTable.Active ) then
      begin
         if ( not(FDetailTable.State = dsEdit) ) then
            FDetailTable.Edit;
         FDetailTable.FieldByName('AnimalGroupCategoryType').AsInteger := cGroupSelected;
         FDetailTable.FieldByName('TagDesc').AsString := sDetailTxt;
      end;
end;

procedure TfmDrugsRegisterImport.PopupMenuItemClick(Sender: TObject);
var
   sCategorySelected : String;
   miMenuItem : TMenuItem;
   iaSelectedAnimals : PIntegerArray;
   CategorySelected : TCategoryType;
begin
   if ( Sender is TMenuItem ) then
      begin
         SetLength(iaSelectedAnimals,0);
         sCategorySelected := '';
         miMenuItem := (Sender as TMenuItem);

         if ( miMenuItem.Name = 'pmiCurrentHerd' ) then
            sCategorySelected := cCurrentHerdAnimals
         else if ( miMenuItem.Name = 'pmiAllCows' ) then
            sCategorySelected := cAllCowsCategory
         else if ( miMenuItem.Name = 'pmiInMilk' ) then
            sCategorySelected := cInMilkCowCategory
         else if ( miMenuItem.Name = 'pmiDry' ) then
            sCategorySelected := cDryCowCategory
         else if ( miMenuItem.Name = 'pmiReplacements' ) then
            sCategorySelected := cReplacementsCategory
         else if ( miMenuItem.Name = 'pmiBeefCattle' ) then
            sCategorySelected := cBeefCattleCategory
         else if ( miMenuItem.Name = 'pmiAllCalvesThisYear' ) then
            sCategorySelected := cAllCalvesThisYear
         else if ( miMenuItem.Name = 'pmiAllCalvesLastYear' ) then
            sCategorySelected := cAllCalvesLastYear
         else if ( miMenuItem.Name = 'pmiAllCalvesBothYears' ) then
            sCategorySelected := cAllCalvesBothYears
         else if ( miMenuItem.Name = 'pmiHCalvesThisYear' ) then
            sCategorySelected := cHeiferCalvesThisYear
         else if ( miMenuItem.Name = 'pmiHCalvesLastYear' ) then
            sCategorySelected := cHeiferCalvesLastYear
         else if ( miMenuItem.Name = 'pmiHCalvesBothYears' ) then
            sCategorySelected := cHeiferCalvesBothYears
         else if ( miMenuItem.Name = 'pmiDHCalvesThisYear' ) then
            sCategorySelected := cDairyHeiferCalvesThisYear
         else if ( miMenuItem.Name = 'pmiDHCalvesLastYear' ) then
            sCategorySelected := cDairyHeiferCalvesLastYear
         else if ( miMenuItem.Name = 'pmiDHCalvesBothYears' ) then
            sCategorySelected := cDairyHeiferCalvesBothYears
         else if ( miMenuItem.Name = 'pmiBHCalvesThisYear' ) then
            sCategorySelected := cBeefHeiferCalvesThisYear
         else if ( miMenuItem.Name = 'pmiBHCalvesLastYear' ) then
            sCategorySelected := cBeefHeiferCalvesLastYear
         else if ( miMenuItem.Name = 'pmiBHCalvesBothYears' ) then
            sCategorySelected := cBeefHeiferCalvesBothYears
         else if ( miMenuItem.Name = 'pmiMaleCalvesThisYear' ) then
            sCategorySelected := cMaleCalvesThisYear
         else if ( miMenuItem.Name = 'pmiMaleCalvesLastYear' ) then
            sCategorySelected := cMaleCalvesLastYear
         else if ( miMenuItem.Name = 'pmiMaleCalvesBothYears' ) then
            sCategorySelected := cMaleCalvesBothYears;

         if ( Length(sCategorySelected) > 0 ) then
            begin
               CreateTempAnimalSelectTableData(FDetailTable.FieldByName('PurchDate').AsDateTime);
               CategorySelected := GetSelectedCategoryTypeBySelection(sCategorySelected);
               TfmAnimalSelectByDate.ShowTheForm(FDetailTable.FieldByName('PurchDate').AsDateTime,
                                                 CategorySelected,iaSelectedAnimals);
               DeleteFromDetailAnimalsTable;
               if ( Length(iaSelectedAnimals) = 0 ) then
                  sCategorySelected := ''
               else
                  AddAnimalSelectionToTable(iaSelectedAnimals,(not(CategorySelected in [ctCurrentHerdAnimals, ctNoSelection])),
                                            sCategorySelected,0);

               if ( FDetailTable.Active ) then
                  try
                     FDetailTable.Edit;
                     FDetailTable.FieldByName('AnimalGroupCategoryType').AsInteger := cCategorySelected;
                     FDetailTable.FieldByName('TagDesc').AsString := sCategorySelected;
                     FDetailTable.Post;
                  except
                  end;
            end;
      end;
end;

procedure TfmDrugsRegisterImport.pmiAnimalCategoryClick(Sender: TObject);
begin
   inherited;
   PopupMenuItemClick(Sender);
end;

procedure TfmDrugsRegisterImport.DrugRegisterDBTableViewInitEdit(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
begin
   inherited;
   if ( AItem.Index = DrugRegisterDBTableViewTagDesc.Index ) and
      ( FDetailTable.FieldByName('AnimalGroupCategoryType').AsInteger <> cManualAnimalEntry ) then
      begin
         Sender.OnEditKeyPress := DrugRegisterDBTableViewEditKeyPress;
         Sender.OnEditKeyDown := DrugRegisterDBTableViewEditKeyDown;
      end
   else
      begin
         Sender.OnEditKeyPress := nil;
         Sender.OnEditKeyDown := nil;
      end;

   //   26/09/17 [V5.7 R3.1] /MK Change - Don't allow typing or clearing of VPA Number on KeyPress or KeyDown.
   if ( AItem.Index = DrugRegisterDBTableViewVPANo.Index ) then
      begin
         Sender.OnEditKeyPress := DrugRegisterDBTableViewEditKeyPress;
         Sender.OnEditKeyDown := DrugRegisterDBTableViewEditKeyDown;
      end;
end;

procedure TfmDrugsRegisterImport.DrugRegisterDBTableViewEditKeyPress(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
   inherited;
   Key := #;
end;

procedure TfmDrugsRegisterImport.DrugRegisterDBTableViewEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
   inherited;
   if ( Key = VK_DELETE ) then
      Key := 0;
end;

procedure TfmDrugsRegisterImport.pmiSelectAnimalsClick(Sender: TObject);
var
   sDetailTxt : String;
   iaAnimals : PIntegerArray;
   sAnimalTagDesc : String;
   CategorySelected : TCategoryType;
begin
   inherited;
   SetLength(iaAnimals,0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT AnimalID');
         SQL.Add('FROM '+FDetailAnimalsTable.TableName);
         SQL.Add('WHERE DetailID = '+IntToStr(FDetailTable.FieldByName('ID').AsInteger));
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  First;
                  while ( not(Eof) ) do
                    begin
                       SetLength(iaAnimals,Length(iaAnimals)+1);
                       iaAnimals[Length(iaAnimals)-1] := FieldByName('AnimalID').AsInteger;
                       Next;
                    end;
               end
         except
         end;
      finally
         Free;
      end;

   FDetailAnimalsTable.Close;
   FDetailAnimalsTable.Open;

   sDetailTxt := FDetailTable.FieldByName('TagDesc').AsString;
   CreateTempAnimalSelectTableData(FDetailTable.FieldByName('PurchDate').AsDateTime);
   CategorySelected := ctNoSelection;
   TfmAnimalSelectByDate.ShowTheForm(FDetailTable.FieldByName('PurchDate').AsDateTime,CategorySelected,iaAnimals);
   DeleteFromDetailAnimalsTable;
   if ( DetailAnimalSelectedCount = 0 ) then
      sDetailTxt := ''
   else
      AddAnimalSelectionToTable(iaAnimals,False,sDetailTxt,0);

   if ( not(FDetailTable.State = dsEdit) ) then
      FDetailTable.Edit;
   FDetailTable.FieldByName('AnimalGroupCategoryType').AsInteger := cManualAnimalEntry;
   FDetailTable.FieldByName('TagDesc').AsString := sDetailTxt;
end;

procedure TfmDrugsRegisterImport.btnReviewMedicinesClick(Sender: TObject);
var
   iDrugID : Integer;
begin
   inherited;
   WinData.cxHint.HideHint;
   iDrugID := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, Name');
         SQL.Add('FROM Medicine');
         SQL.Add('ORDER BY Name');
         Open;
         try
            First;
            iDrugID := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
   if ( iDrugID > 0 ) then
      uMedicineSetUp.ShowTheForm(iDrugID)
   else
      uMedicineSetUp.ShowTheForm();
   MatchDrugIDToVPA;
   CreateLegendLabels;
end;

procedure TfmDrugsRegisterImport.pmiAddMedicineClick(Sender: TObject);
begin
   inherited;
   uMedicineSetUp.ShowTheForm(0);
   HerdLookup.qExistingVPADrugs.Close;
   HerdLookup.qExistingVPADrugs.Open;
end;

procedure TfmDrugsRegisterImport.pmiAddMedSupplierClick(Sender: TObject);
var
   ID : Integer;
begin
   inherited;
   uSuppliers.ShowTheForm(TRUE, ID);
end;

procedure TfmDrugsRegisterImport.pmiAddMedAdminByClick(Sender: TObject);
begin
   inherited;
   uMediAdminSetUp.ShowTheForm(TRUE,adAdministrator);
end;

procedure TfmDrugsRegisterImport.pmiMedPrescribedByClick(Sender: TObject);
begin
   inherited;
   uMediAdminSetUp.ShowTheForm(TRUE,adPrescribingVet);
end;

procedure TfmDrugsRegisterImport.GetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
   inherited;
   {
   if ( ARecord <> nil ) then
      begin
         AStyle := stDrugFoundInDatabase;
         if ( ARecord.Values[DrugRegisterDBTableViewDrugID.Index] = Null ) then
            AStyle := stDrugNotInDatabase;
         if ( ARecord.Values[DrugRegisterDBTableViewVPANo.Index] = Null ) then
            AStyle := stNoVPA;
      end;
   }
end;

procedure TfmDrugsRegisterImport.UpdateExistDetailTableVPADrug(AExistVPANo : String; ADrugID : Integer);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE '+FDetailTable.TableName+'');
         SQL.Add('SET DrugID = '+IntToStr(ADrugID)+',');
         SQL.Add('    VPAIndicator = '+IntToStr(cVPAFound));   
         SQL.Add('WHERE Upper(VPANumber) = "'+UpperCase(AExistVPANo)+'"');
         SQL.Add('AND HeaderID = :FHeaderID');
         Params[0].AsInteger := FHeaderID;
         try
            ExecSQL;
         except
         end;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.FormActivate(Sender: TObject);

   procedure ShowDrugDoesNotExistMessage;
   var
      ShowForm : Boolean;
   begin
      ShowForm := False;
      ShowForm := ( FDetailTable.Active ) and ( not(FDetailTable.IsEmpty) );
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Count(ID)');
            SQL.Add('FROM '+FDetailTable.TableName+'');
            SQL.Add('WHERE DrugID IS NULL');
            SQL.Add('AND HeaderID = '+IntToStr(FHeaderID)+'');
            try
               Open;
               ShowForm := ( Fields[0].AsInteger > 0 );
            except
            end;
         finally
            Free;
         end;
      if ( not(ShowForm) ) then Exit;
   end;

begin
   inherited;
   WindowState := wsMaximized;
   ShowDrugDoesNotExistMessage;
   OnActivate := nil;
end;

procedure TfmDrugsRegisterImport.FormShow(Sender: TObject);
begin
   inherited;
   if ( Length(FFileName) = 0 ) then
      begin
         pLegend.Visible := False;
         dxBarLargeButton1.Enabled := True;
      end
   else
      begin
         dxBarLargeButton1.Enabled := ( not(WinData.GlobalSettings.DownloadMailAttachments) );
         ImportFile(FFileName);
      end;
end;

procedure TfmDrugsRegisterImport.MatchDrugIDToVPA;
var
   iDrugID : Integer;
   bStep : Boolean;
begin
   HerdLookup.qExistingVPADrugs.Close;
   HerdLookup.qExistingVPADrugs.Open;

   if ( FDetailTable.IsEmpty ) then Exit;

   DrugRegisterDBTableView.DataController.BeginFullUpdate;
   bStep := FDetailTable.FindFirst;
   while ( bStep ) do
      begin
         if ( FDetailTable.FieldByName('HeaderID').AsInteger = FHeaderID ) then
            if ( HerdLookup.qExistingVPADrugs.Locate('VPANo',FDetailTable.FieldByName('VPANumber').AsString,[]) ) then
               begin
                  iDrugID := HerdLookup.qExistingVPADrugs.FieldByName('ID').AsInteger;
                  UpdateExistDetailTableVPADrug(FDetailTable.FieldByName('VPANumber').AsString,iDrugID);
               end;
         bStep := FDetailTable.FindNext;
      end;
   DrugRegisterDBTableView.DataController.RefreshExternalData;
   DrugRegisterDBTableView.DataController.EndFullUpdate;
end;

procedure TfmDrugsRegisterImport.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
   sMessage : String;
begin
   inherited;
   try
      if ( FRunAborted or not(FDetailTable.Active) ) or ( FVetLinkFileCompletelyInvalid ) then Exit;

      if ( not(FManualHealthSaveCompleted) ) and ( not(FExitWithoutTreating) ) then
         begin
            sMessage := 'You are about to exit VetLink.'+cCRLFx2;

            if ( not(FDetailTable.IsEmpty) ) and ( not(FManualHealthSaveCompleted) ) and ( actSaveHealthsManually.Enabled ) then
               sMessage := sMessage + 'Your medicine purchases have been saved but treatments were not saved.'+cCRLFx2
            else if ( DrugRegisterDBTableView.DataController.RecordCount > 0 ) and ( dxlbRun.Action = actRun ) then
               sMessage := sMessage + 'You have not yet saved any medicine purchases.'+cCRLFx2;

            sMessage := sMessage + 'Are you sure you want to exit now?';

            CanClose := ( MessageDlg(sMessage,mtConfirmation,[mbYes,mbNo],0) = mrYes );
         end;

      if ( CanClose ) then
         begin
             with TQuery.Create(nil) do
                try
                   DatabaseName := AliasName;
                   SQL.Clear;
                   SQL.Add('DELETE FROM '+FDetailAnimalsTable.TableName);
                   SQL.Add('WHERE DetailID IN (SELECT ID');
                   SQL.Add('                   FROM '+FDetailTable.TableName);
                   SQL.Add('                   WHERE HeaderID = '+IntToStr(FHeaderID));
                   SQL.Add('                   AND   TreatmentSaved = TRUE)');
                   try
                      ExecSQL;

                      SQL.Clear;
                      SQL.Add('DELETE FROM '+FDetailTable.TableName+'');
                      SQL.Add('WHERE HeaderID = '+IntToStr(FHeaderID)+'');
                      SQL.Add('AND   TreatmentSaved = TRUE');
                      ExecSQL;
                   except
                   end;
                finally
                   Free;
                end;

            if ( IsHeaderIDFullyImported ) then
               begin
                  TfmFileAttachmentImport.MarkAttachmentAsRead(FFileName);
                  if ( FileExists(FFileName) ) and ( FDetailTable.IsEmpty ) then
                     DeleteFile(FFileName,True);
               end;

            if ( FDetailTable.State in [dsInsert,dsEdit] ) then
               FDetailTable.Post;

            FDetailTable.Close;
            SafeFreeAndNil(FDetailTable);

            if ( HerdLookup.qExistingVPADrugs.Active ) then
               HerdLookup.qExistingVPADrugs.Close;

            FMedicines.Free;
         end;
   except
      on e : Exception do
         begin
            ApplicationLog.LogException(e);
            ApplicationLog.LogError('VetLink Import Error - Error on FormDestroy. Exception Error.');
         end;
      on E : EOutOfResources do
         begin
            ApplicationLog.LogException(e);
            ApplicationLog.LogError('VetLink Import Error - Error on FormDestroy. Out of Resources Error.');
         end;
      on E : EOutOfMemory do
         begin
            ApplicationLog.LogException(e);
            ApplicationLog.LogError('VetLink Import Error - Error on FormDestroy. Out of Memory Error.');
         end;
   end;
end;

procedure TfmDrugsRegisterImport.DrugRegisterDBTableViewDrugVPAIndicatorGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
   inherited;
   if ( ARecord <> nil ) then
      begin
         if ( ARecord.Values[DrugRegisterDBTableViewDrugVPAIndicator.Index] = cInvalidOrNoVPA ) then
            AProperties := NoVPAButton.Properties
         else if ( ARecord.Values[DrugRegisterDBTableViewDrugVPAIndicator.Index] = cVPANotFound ) then
            AProperties := VPANotFoundButton.Properties
         else if ( ARecord.Values[DrugRegisterDBTableViewDrugVPAIndicator.Index] = cVPAFound ) then
            AProperties := DrugFoundButton.Properties;
      end;
end;

procedure TfmDrugsRegisterImport.CreateLegendLabels;
var
   i,
   iNo_InvalidVPACount,
   iDrugFound,
   iLegendPanelHeight : Integer;
const
   cDrugSQL = 'SELECT COUNT(ID)'+cCRLF+
              'FROM DrugsRegImportDetail'+cCRLF+
              'WHERE (HeaderID = :FHeaderID)'+cCRLF+
              'AND   (Imported = FALSE)';
begin
   pLegend.Visible := ( not(FDetailTable.IsEmpty) );
   if ( not(pLegend.Visible) ) then Exit;

   if ( FDetailTable.State in dsEditModes ) then
      FDetailTable.Post;

   iDrugFound := 0;
   FVPANotFoundCount := 0;
   iNo_InvalidVPACount := 0;

  //   06/11/17 [V5.7 R4.3] /MK Change - Changed SQL's to count records based on VPAIndicator field.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         // Get Drugs that have a VPAIndicator of InvalidOrNoVPA.
         SQL.Clear;
         SQL.Add('SELECT COUNT(ID)');
         SQL.Add('FROM DrugsRegImportDetail');
         SQL.Add('WHERE (HeaderID = :FHeaderID)');
         SQL.Add('AND   (VPAIndicator = '+IntToStr(cInvalidOrNoVPA)+')');
         SQL.Add('AND   (Imported = FALSE)');
         SQL.Add('AND   (VPANumber IS NULL)');
         Params[0].AsInteger := FHeaderID;
         Open;
         if ( RecordCount > 0 ) then
            iNo_InvalidVPACount := Fields[0].AsInteger;

         // Get Drugs that have a VPAIndicator of VPANotFound in Kingswood online drugs database.
         Close;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(VPANumber)');
         SQL.Add('FROM '+FDetailTable.TableName+'');
         SQL.Add('WHERE (VPAIndicator = '+IntToStr(cVPANotFound)+')');
         SQL.Add('AND   (HeaderID = :HeaderID)');
         SQL.Add('AND   (Imported = FALSE)');
         SQL.Add('GROUP BY VPANumber');
         Params[0].AsInteger := FHeaderID;
         Open;
         if ( RecordCount > 0 ) then
            FVPANotFoundCount := RecordCount;
         Close;

         //   21/08/17 [V5.7 R2.0] /MK Bug Fix - Use VPA Number to count the amount of drugs matched not the amount of purchase records matched.

         // Get Drugs that have a VPAIndicator of VPAFound in Kingswood online drugs database as well as users medicine table.
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(VPANumber)');
         SQL.Add('FROM '+FDetailTable.TableName+'');
         SQL.Add('WHERE (VPAIndicator = '+IntToStr(cVPAFound)+')');
         SQL.Add('AND   (HeaderID = :HeaderID)');
         SQL.Add('AND   (Imported = FALSE)');
         SQL.Add('GROUP BY VPANumber');
         Params[0].AsInteger := FHeaderID;
         Open;
         if ( RecordCount > 0 ) then
            iDrugFound := RecordCount;
         Close;

         pFoundDrug.Visible := ( iDrugFound > 0 );
         if ( pFoundDrug.Visible ) then
            lFoundLegendLabel.Caption := Format('%d drug(s) successfully matched with the Kingswood medicine file.',[iDrugFound]);

         pNotFound.Visible := ( FVPANotFoundCount > 0 );
         if ( pNotFound.Visible ) then
            lNotFoundLegendLabel.Caption := Format('%d drug(s) imported that are NOT matched in the Kingswood medicine file.',[FVPANotFoundCount]);

         pNoVPA.Visible := ( iNo_InvalidVPACount > 0 );
         if ( pNoVPA.Visible ) then
            lNoVPALegendLabel.Caption := Format('%d drug(s) imported contain invalid or missing VPA Numbers.',[iNo_InvalidVPACount]);

         lLegendSymbolInfo.Visible := pFoundDrug.Visible or pNotFound.Visible or pNoVPA.Visible;
         if ( not(lLegendSymbolInfo.Visible) ) then
            lGeneralLegendInfo.Top := 8;

         iLegendPanelHeight := 0;

         for i := 0 to pLegend.ControlCount-1 do
            if pLegend.Controls[i] is TPanel then
               if pLegend.Controls[i].Visible then
                  iLegendPanelHeight := iLegendPanelHeight + pLegend.Controls[i].Height;

         pLegend.Height := iLegendPanelHeight+10;

         StatusBar.Panels[0].Text := Format('%d purchase records to import containing %d FOUND in Kingswood and %d NOT FOUND in Kingswood',
                                            [FDetailTable.RecordCount, iDrugFound, FVPANotFoundCount]);

      finally
         Free;
      end;

   DrugRegisterDBTableView.DataController.FocusedRowIndex := 0;
end;

procedure TfmDrugsRegisterImport.EditVPANo1Click(Sender: TObject);
var
   vDrugName : Variant;
   qUpdateDrug : TQuery;
   iExistingDrugID : Integer;
   Item : TDrugItem;
   bWithdrawalConfirmed : Boolean;
   iSelectedRecord : Integer;
   iFocusedRecordIndex : Integer;
begin
   inherited;
   try
      iSelectedRecord := FDetailTable.FieldByName('ID').AsInteger;
      if ( iSelectedRecord = 0 ) then Exit;
      iFocusedRecordIndex := DrugRegisterDBTableView.DataController.FocusedRecordIndex;
      if ( iFocusedRecordIndex < 0 ) then Exit;
      with DrugRegisterDBTableView.DataController do
         try
            vDrugName := Values[iFocusedRecordIndex, GetItemByFieldName('DrugDesc').Index];

            Item := TfmDrugFinder.Find(FDetailTable.FieldByName('DrugDesc').AsString);
            if ( Item = nil ) then Exit;

            bWithdrawalConfirmed := TfmDrugFinderWithdMsg.WithdrawalConfirmed(Item);

            //   23/08/17 [V5.7 R2.0] /MK Change - If VPA Number from DrugFinder exists in medicine table already then set FDetailTableDrugID to this ID.
            HerdLookup.qExistingVPADrugs.Close;
            HerdLookup.qExistingVPADrugs.Open;
            iExistingDrugID := 0;
            if ( HerdLookup.qExistingVPADrugs.Locate('VPANo',Item.VPANumber,[]) ) then
               iExistingDrugID := HerdLookup.qExistingVPADrugs.FieldByName('ID').AsInteger;

            if ( not(VarIsNull(vDrugName)) ) and ( Length(vDrugName) > 0 ) then
               try
                  qUpdateDrug := TQuery.Create(nil);
                  qUpdateDrug.DatabaseName := AliasName;
                  qUpdateDrug.SQL.Clear;
                  qUpdateDrug.SQL.Add('UPDATE '+FDetailTable.TableName+'');
                  qUpdateDrug.SQL.Add('SET DrugDesc = "'+Item.DrugName+'",');
                  qUpdateDrug.SQL.Add('    VPANumber = "'+Item.VPANumber+'",');
                  qUpdateDrug.SQL.Add('    MedicineGroup = '+IntToStr(Item.MedicineGroup)+',');
                  qUpdateDrug.SQL.Add('    DrugDoseUnit = '+IntToStr(Item.UnitUsed)+',');

                  //   25/02/19 [V5.8 R7.1] /MK Bug Fix - If Unit selected before clicking button in VPA field then assign selected unit to rest of records for this drug.
                  if ( FDetailTable.FieldByName('DrugPurchUnit').AsInteger > 0 ) then
                     qUpdateDrug.SQL.Add('    DrugPurchUnit = '+IntToStr(FDetailTable.FieldByName('DrugPurchUnit').AsInteger)+',')
                  else
                     qUpdateDrug.SQL.Add('    DrugPurchUnit = '+IntToStr(Item.UnitUsed)+',');

                  qUpdateDrug.SQL.Add('    DrugID = '+IntToStr(iExistingDrugID)+',');

                  if ( Item.MilkWDDays > 0 ) or ( Item.MeatWDDays > 0 ) then
                     begin
                        if ( Item.MilkWDDays > 0 ) then
                           qUpdateDrug.SQL.Add('    MilkWithdrawalDays = '+IntToStr(Item.MilkWDDays)+',');
                        if ( Item.MeatWDDays > 0 ) then
                           qUpdateDrug.SQL.Add('    MeatWithdrawalDays = '+IntToStr(Item.MeatWDDays)+',');
                     end
                  else
                     begin
                        if ( FHerdType = htDairy ) then
                           begin
                              qUpdateDrug.SQL.Add('    MilkN_A_Drug = True,');
                              qUpdateDrug.SQL.Add('    MeatN_A_Drug = False,');
                           end
                        else
                           begin
                              qUpdateDrug.SQL.Add('    MilkN_A_Drug = False,');
                              qUpdateDrug.SQL.Add('    MeatN_A_Drug = True,');
                           end;
                     end;

                  if bWithdrawalConfirmed then
                     qUpdateDrug.SQL.Add('    DrugFindWithdAccepted = True,')
                  else
                     qUpdateDrug.SQL.Add('    DrugFindWithdAccepted = False,');

                  qUpdateDrug.SQL.Add('    VPAIndicator = :VPAIndicator');
                  qUpdateDrug.SQL.Add('WHERE Upper(DrugDesc) = "'+UpperCase(vDrugName)+'"');

                  //   06/11/17 [V5.7 R4.3] /MK Change - Set VPAIndicator to VPAFound if VPA from drug finder is valid
                  if ( not(IsValidVPANumber(Item.VPANumber)) ) then
                     qUpdateDrug.Params[0].AsInteger := cInvalidOrNoVPA
                  else
                     qUpdateDrug.Params[0].AsInteger := cVPAFound;

                  qUpdateDrug.ExecSQL;
               finally
                  FreeAndNil(qUpdateDrug);
               end;
         finally
            try
               //   25/02/19 [V5.8 R7.1] /MK Bug Fix - Disable controls of grid while closing and opening to stop "List index out of bounds" error - Noel Keane.
               DrugRegisterDBTableView.DataController.BeginFullUpdate;
               FDetailTable.DisableControls;
               FDetailTable.Close;
               FDetailTable.Open;
               if ( iSelectedRecord > 0 ) then
                  try
                     FDetailTable.Locate('ID',iSelectedRecord,[]);
                  except
                  end;
               FDetailTable.EnableControls;
               DrugRegisterDBTableView.DataController.EndFullUpdate;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
            CreateLegendLabels;
         end;
   except
      on e : Exception do
         begin
            ApplicationLog.LogError('DrugsRegisterImport : EditVPANo1Click : '+e.Message);
            ApplicationLog.LogException(e);
         end;
   end;
end;

function TfmDrugsRegisterImport.GetFileHeaderId: Integer;
begin
   FHeaderTable.Active := True;
   try
      try
         if ( not(FHeaderTable.Locate('FileName',FFileName,[])) ) then
            begin
               FHeaderTable.Append;
               FHeaderTable.FieldByName('FileName').AsString := FFileName;
               FHeaderTable.FieldByName('DateAdded').AsDateTime := Date;
               //   21/08/17 [V5.7 R2.0] /MK Change - If header is being created then default DetailRecsCreated to False.
               FHeaderTable.FieldByName('DetailRecsCreated').AsBoolean := False;
               FHeaderTable.Post;
            end;
          Result := FHeaderTable.FieldByName('ID').AsInteger;
      except
         raise Exception.Create('Unable to determine file header information');
      end;
   finally
      FHeaderTable.Active := False;
   end;
end;

class procedure TfmDrugsRegisterImport.Browse;
var
   MyFileName : string;
begin
   with TOpenDialog.Create(nil) do
      try
         InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
         DefaultExt := '.csv';
         Filter := 'CSV | *.csv';
         Options := [ofEnableSizing,ofFileMustExist];

         if Execute then
            MyFileName := FileName;

      finally
         Free;
      end;

   if (FileExists(MyFileName)) then
      TfmDrugsRegisterImport.ShowForm(MyFileName);
end;

procedure TfmDrugsRegisterImport.DrugRegisterDBTableViewVPANoGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
   inherited;
   {
   if ( dxlbRun.Action <> actRun ) then Exit;
   if ( ARecord = nil ) then Exit;
   if ( ARecord.Values[DrugRegisterDBTableViewVPANo.Index] = Null ) then
      try
         AProperties := EnterVPANo.Properties;
         Application.ProcessMessages;
         Update;
      except
      end;
   }
end;

procedure TfmDrugsRegisterImport.DrugRegisterDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   iThisYear,
   iLastYear,
   iItemTag : Integer;
   sItemCaption : String;
begin
   inherited;
   if ( not(FPurchasesComplete) ) then Exit;

   iThisYear := ExtractYear(FDetailTable.FieldByName('PurchDate').AsDateTime);
   iLastYear := iThisYear - 1;
   if ( iThisYear > 0 ) then
      begin
         pmiInMilk.Visible := ( iThisYear = ExtractYear(Date) );
         pmiDry.Visible := pmiInMilk.Visible;
         pmiAllCalvesThisYear.Caption := '&This Year ' + IntToStr(iThisYear);
         pmiAllCalvesLastYear.Caption := '&Last Year ' + IntToStr(iLastYear);
         pmiHCalvesThisYear.Caption := '&This Year ' + IntToStr(iThisYear);
         pmiHCalvesLastYear.Caption := '&Last Year ' + IntToStr(iLastYear);
         pmiDHCalvesThisYear.Caption := '&This Year ' + IntToStr(iThisYear);
         pmiDHCalvesLastYear.Caption := '&Last Year ' + IntToStr(iLastYear);
         pmiBHCalvesThisYear.Caption := '&This Year ' + IntToStr(iThisYear);
         pmiBHCalvesLastYear.Caption := '&Last Year ' + IntToStr(iLastYear);
         pmiMaleCalvesThisYear.Caption := '&This Year ' + IntToStr(iThisYear);
         pmiMaleCalvesLastYear.Caption := '&Last Year ' + IntToStr(iLastYear);
      end;
end;

procedure TfmDrugsRegisterImport.EnterVPANoPropertiesEditValueChanged(
  Sender: TObject);
begin
   inherited;
   TcxTextEdit(Sender).PostEditValue;
   CreateLegendLabels;
end;

function TfmDrugsRegisterImport.GetHeaderDetailImportCount: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM '+FDetailTable.TableName+'');
         SQL.Add('WHERE (HeaderID = :FHeaderID)');
         SQL.Add('AND   (Imported = True)');
         SQL.Add('AND   (VPANumber IS NOT NULL)');
         try
            Params[0].AsInteger := FHeaderID;
            Open;
            Result := RecordCount;
         except
         end;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.ShowLegendHints(APoint: TPoint;
  const AHintTitle, AHintText: string; APos: TcxCallOutPosition);
begin
   Application.ProcessMessages;
   Update;
   WinData.cxHint.HideHint;
   WinData.cxHint.HintStyle.CallOutPosition := APos;
   WinData.cxHint.ShowHint(APoint.x , APoint.y , AHintTitle, AHintText);
   Application.ProcessMessages;
   Update;
end;

procedure TfmDrugsRegisterImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   WinData.cxHint.HideHint;
   Application.ProcessMessages;
   Update;
end;

procedure TfmDrugsRegisterImport.PanelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   inherited;
   WinData.cxHint.HideHint;
   Application.ProcessMessages;
   Update;
end;

procedure TfmDrugsRegisterImport.gDrugRegisterMouseEnter(Sender: TObject);
begin
   inherited;
   WinData.cxHint.HideHint;
   Application.ProcessMessages;
   Update;
end;

procedure TfmDrugsRegisterImport.LegendLabelMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   Application.ProcessMessages;
   Update;
end;

procedure TfmDrugsRegisterImport.lFoundLegendLabelMouseEnter(Sender: TObject);
var
   VPAFoundHintPoint : TPoint;
begin
   inherited;
   VPAFoundHintPoint := lFoundLegendLabel.ClientToScreen(lFoundLegendLabel.ClientRect.TopLeft);
   ShowLegendHints(VPAFoundHintPoint,'VPA IS in Kingswood',imgDrugFound.Hint,cxbpBottomLeft);
end;

procedure TfmDrugsRegisterImport.lNotFoundLegendLabelMouseEnter(Sender: TObject);
var
   VPANotFoundHintPoint : TPoint;
begin
   inherited;
   VPANotFoundHintPoint := lNotFoundLegendLabel.ClientToScreen(lNotFoundLegendLabel.ClientRect.TopLeft);
   ShowLegendHints(VPANotFoundHintPoint,'VPA NOT in Kingswood',imgVPANotFound.Hint,cxbpBottomLeft);
end;

procedure TfmDrugsRegisterImport.lNoVPALegendLabelMouseEnter(Sender: TObject);
var
   NoVPAHintPoint : TPoint;
begin
   inherited;
   NoVPAHintPoint := lNoVPALegendLabel.ClientToScreen(lNoVPALegendLabel.ClientRect.TopLeft);
   ShowLegendHints(NoVPAHintPoint,'No VPA or Invald VPA',imgNoVPANumber.Hint,cxbpBottomLeft);
end;

procedure TfmDrugsRegisterImport.ShowHideColumns(AShowForPurchases : Boolean);
begin
   // These columns only appear for purchases.
   DrugRegisterDBTableViewVPANo.Visible := AShowForPurchases;
   DrugRegisterDBTableViewBatchNo.Visible := AShowForPurchases;
   DrugRegisterDBTableViewExpiryDate.Visible := AShowForPurchases;
   DrugRegisterDBTableViewWithdrawal.Visible := AShowForPurchases;
   DrugRegisterDBTableViewSupplier.Visible := AShowForPurchases;

   // These columns only appear for treatments.
   DrugRegisterDBTableViewSelected.Visible := not(AShowForPurchases);
   DrugRegisterDBTableViewTagDesc.Visible := not(AShowForPurchases);
   DrugRegisterDBTableViewApplicRate.Visible := not(AShowForPurchases);
   DrugRegisterDBTableViewNoDays.Visible := not(AShowForPurchases);
   DrugRegisterDBTableViewNoTimes.Visible := not(AShowForPurchases);
   DrugRegisterDBTableViewPurchDoseRate.Visible := not(AShowForPurchases);
end;

function TfmDrugsRegisterImport.GetHeaderDetailRecorded: Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DetailRecsCreated');
         SQL.Add('FROM '+FHeaderTable.TableName+'');
         SQL.Add('WHERE ID = :FHeaderID');
         Params[0].AsInteger := FHeaderID;
         Open;
         if ( RecordCount = 0 ) then Exit;
         Result := Fields[0].AsBoolean;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.SetHeaderDetailRecorded(const Value: Boolean);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE '+FHeaderTable.TableName+'');
         SQL.Add('SET DetailRecsCreated = :AValue');
         SQL.Add('WHERE ID = :FHeaderID');
         Params[0].AsBoolean := Value;
         Params[1].AsInteger := FHeaderID;
         ExecSQL;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.FormDestroy(Sender: TObject);
begin
   inherited;
   WinData.cxHint.HideHint;
   WinData.cxHint.HintStyle.CaptionFont.Name := 'Segoe UI';
   WinData.cxHint.HintStyle.CaptionFont.Size := 8;
   WinData.cxHint.HintStyle.CaptionFont.Style := [fsBold];
   WinData.cxHint.HintStyle.Font.Name := 'Segoe UI';
   WinData.cxHint.HintStyle.Font.Size := 8;
   WinData.cxHint.HintStyle.Font.Style := [fsBold];
   WinData.cxHint.HintStyle.CallOutPosition := cxbpTopLeft;
   FreeAndNil(FVLFileImport);
   SafeFreeAndNil(FHeaderTable);
   SafeFreeAndNil(FDetailAnimalsTable);
   SafeFreeAndNil(FDSImportTable);
   if ( FAnimalSelectTable <> nil ) then
      begin
         FAnimalSelectTable.Close;
         FAnimalSelectTable.DeleteTable;
         FreeAndNil(FAnimalSelectTable);
      end;
end;

procedure TfmDrugsRegisterImport.ManualEnterVPANo1Click(Sender: TObject);
var
   sVPANo : String;
   vDrugName,
   vVPANo : Variant;
   iExistingDrugID : Integer;
   Item : TDrugItem;
   iSelectedRecord,
   iFocusedRecordIndex : Integer;
begin
   inherited;
   try
      iSelectedRecord := FDetailTable.FieldByName('ID').AsInteger;
      if ( iSelectedRecord = 0 ) then Exit;
      iFocusedRecordIndex := DrugRegisterDBTableView.DataController.FocusedRecordIndex;
      if ( iFocusedRecordIndex < 0 ) then Exit;
      with DrugRegisterDBTableView.DataController do
         try
            vDrugName := Values[iFocusedRecordIndex, GetItemByFieldName('DrugDesc').Index];
            vVPANo := Values[iFocusedRecordIndex, GetItemByFieldName('VPANumber').Index];
            sVPANo := VarToStr(vVPANo);

            //   25/09/17 [V5.7 R3.0] /MK Change - Bring up VPA Number that is already in the VPANumber field in InputBox - GL request.
            sVPANo := InputBox('Enter VPA No.','Please enter the VPA Number for this medicine.',sVPANo);
            if ( Length(sVPANo) = 0 ) then Exit;
            sVPANo := FormatVPANumber(sVPANo);
            if ( Length(sVPANo) = 0 ) then Exit;

            //   23/08/17 [V5.7 R2.0] /MK Change - If VPA Number from DrugFinder exists in medicine table already then set FDetailTableDrugID to this ID.
            HerdLookup.qExistingVPADrugs.Close;
            HerdLookup.qExistingVPADrugs.Open;
            iExistingDrugID := 0;
            if ( HerdLookup.qExistingVPADrugs.Locate('VPANo',sVPANo,[]) ) then
               iExistingDrugID := HerdLookup.qExistingVPADrugs.FieldByName('ID').AsInteger;

            if ( not(VarIsNull(vDrugName)) ) and ( Length(vDrugName) > 0 ) then
               begin
                  with TQuery.Create(nil) do
                     try
                        DatabaseName := AliasName;
                        SQL.Clear;
                        SQL.Add('UPDATE '+FDetailTable.TableName+'');
                        SQL.Add('SET VPANumber = "'+sVPANo+'",');
                        SQL.Add('    VPAIndicator = :VPAIndicator');
                        SQL.Add('WHERE Upper(DrugDesc) = "'+UpperCase(vDrugName)+'"');

                        //   06/11/17 [V5.7 R4.3] /MK Change - Search for the entered VPA Number in Kingswood online database and set VPAIndicator accordingly.
                        if ( iExistingDrugID > 0 ) then
                           Params[0].AsInteger := cVPAFound
                        else if ( not(IsValidVPANumber(sVPANo)) ) then
                           Params[0].AsInteger := cInvalidOrNoVPA
                        else
                           begin
                              Item := TfmDrugFinder.FindDrugItemByVPA(sVPANo);
                              if ( Item <> nil ) then
                                 Params[0].AsInteger := cVPAFound
                              else
                                 Params[0].AsInteger := cVPANotFound;
                           end;

                        try
                           ExecSQL;
                        except
                        end;
                     finally
                        Close;
                        Free;
                     end;
               end;
         finally
            DrugRegisterDBTableView.DataController.BeginFullUpdate;
            FDetailTable.DisableControls;
            FDetailTable.Close;
            FDetailTable.Open;
            if ( iSelectedRecord > 0 ) then
               try
                  FDetailTable.Locate('ID',iSelectedRecord,[]);
               except
               end;
            FDetailTable.EnableControls;
            DrugRegisterDBTableView.DataController.EndFullUpdate;
            CreateLegendLabels;
         end;
   except
      on e : Exception do
         begin
            ApplicationLog.LogError('DrugRegisterImport : ManualEnterVPANo1Click : '+e.Message);
            ApplicationLog.LogException(e);
         end;
   end;
end;

procedure TfmDrugsRegisterImport.DrugRegisterDBTableViewVPANoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   pt : tPoint;
begin
   inherited;
   GetCursorPos(pt);
   pmEnterVPA.Popup(pt.x, pt.y);
end;

procedure TfmDrugsRegisterImport.StoreAnimalsInAnimalDetailTable;
var
   Parser : TSPParser;
   sTagDesc,
   sAnimalNo : String;
   i, j, iAnimalsFound,
   iProgressMaxCount : Integer;
   bStep : Boolean;
begin
   iProgressMaxCount := GetRecordCountByFilterString(FDetailTable.Filter);
   if ( iProgressMaxCount > 0 ) then
      begin
         ShowProgressIndicator('Locating animals to be treated',0,iProgressMaxCount,1);
         ProgressIndicator.Max := iProgressMaxCount;
         Application.ProcessMessages;
         Update;

         Parser := TSPParser.Create(nil);
         try
            DrugRegisterDBTableView.DataController.BeginFullUpdate;
            Screen.Cursor := crHourGlass;
            bStep := FDetailTable.FindFirst;
            while ( bStep ) do
               begin
                  if ( not(FDetailTable.FieldByName('TreatmentSaved').AsBoolean) ) then
                     begin
                        sTagDesc := FDetailTable.FieldByName('TagDesc').AsString;
                        if ( Length(sTagDesc) > 0 ) then
                           begin
                              iAnimalsFound := 0;
                              if ( Pos(',',sTagDesc) > 0 ) then
                                 Parser.Sepchar := ','
                              else if ( Pos(' ',sTagDesc) > 0 ) then
                                 Parser.Sepchar := ' ';
                              CreateTempAnimalSelectTableData(FDetailTable.FieldByName('PurchDate').AsDateTime);
                              Parser.Parse(sTagDesc);
                              for j := 1 to Parser.Count do
                                 begin
                                    sAnimalNo := Parser.Fields[j];
                                    LocateAnimalByTagDesc(sAnimalNo);
                                    if ( FAnimalRec.AnimalID > 0 ) then
                                       try
                                          Inc(iAnimalsFound);
                                          FDetailAnimalsTable.Append;
                                          FDetailAnimalsTable.FieldByName('DetailID').AsInteger := FDetailTable.FieldByName('ID').AsInteger;
                                          FDetailAnimalsTable.FieldByName('AnimalID').AsInteger := FAnimalRec.AnimalID;
                                          FDetailAnimalsTable.FieldByName('AnimalTagDesc').AsString := sAnimalNo;
                                          FDetailAnimalsTable.FieldByName('HeaderID').AsInteger := FHeaderID;
                                          FDetailAnimalsTable.FieldByName('TreatmentSaved').AsBoolean := False;
                                          FDetailAnimalsTable.Post;
                                       except
                                          FDetailAnimalsTable.Cancel;
                                       end;
                                 end;
                              if ( iAnimalsFound > 0 ) then
                                 try
                                    FDetailTable.Edit;
                                    FDetailTable.FieldByName('TagDesc').AsString := Format('%d animal(s) selected.',[iAnimalsFound]);
                                    FDetailTable.Post;
                                 except
                                    FDetailTable.Cancel;
                                 end;
                           end;
                     end;
                  ProgressIndicator.Position := ProgressIndicator.Position + 1;
                  Application.ProcessMessages;
                  Update;

                  bStep := FDetailTable.FindNext;
               end;
         finally
            DrugRegisterDBTableView.DataController.EndFullUpdate;
            ProgressIndicator.Close;
            Screen.Cursor := crDefault;
            Application.ProcessMessages;
            Update;
            if ( Parser <> nil ) then
               FreeAndNil(Parser);
            DrugRegisterDBTableView.DataController.FocusedRowIndex := 0;
         end;
      end;
end;

procedure TfmDrugsRegisterImport.EnableTreatments(APurchaseCount : Integer);
var
   TempQuery : TQuery;
begin
   TempQuery := TQuery.Create(nil);
   try
      TempQuery.DatabaseName := AliasName;

      TempQuery.SQL.Clear;
      TempQuery.SQL.Add('UPDATE '+FHeaderTable.TableName+'');
      TempQuery.SQL.Add('SET FullyImported = FALSE');
      TempQuery.SQL.Add('WHERE ID = '+IntToStr(FHeaderID)+'');
      TempQuery.ExecSQL;

      TempQuery.SQL.Clear;
      TempQuery.SQL.Add('UPDATE '+FDetailTable.TableName+'');
      TempQuery.SQL.Add('SET Selected = True');
      TempQuery.SQL.Add('WHERE HeaderID = '+IntToStr(FHeaderID)+'');
      TempQuery.ExecSQL;

      actRun.Enabled := True;
      pLegend.Visible := False;

      DrugRegisterDBTableViewEventDate.Caption := 'Treatment Date';
      DrugRegisterDBTableViewEventDate.SortIndex := 0;
      DrugRegisterDBTableViewEventDate.SortOrder := soAscending;

      DrugRegisterDBTableView.OptionsData.Editing := True;

      actSaveHealthsManually.Enabled := True;
      dxlbRun.Action := actSaveHealthsManually;

      DrugRegisterDBTableView.DataController.DataSource := nil;

      // Show records not saved if any exist.
      FDetailTable.Active := False;
      FDetailTable.Filter := 'HeaderID = '+IntToStr(FHeaderID)+' AND DrugID > 0 AND DrugPurchID > 0';
      FDetailTable.Filtered := True;
      FDetailTable.Active := True;

      // Show only columns that are associated with treatments.
      ShowHideColumns(False);

      DrugRegisterDBTableViewTagDesc.Visible := True;
      DrugRegisterDBTableView.DataController.DataSource := FDSImportTable;

      DrugRegisterDBTableView.DataController.FocusedRowIndex := 0;

      lUntickAnimals.Visible := False;
      pInformation.Visible := ( not(FDetailTable.IsEmpty) );
      lInformation.Visible := pInformation.Visible;

      DrugRegisterDBTableViewDrugVPAIndicator.Visible := False;
      DrugRegisterDBTableViewPurchUnitUsed.Visible := False;
      DrugRegisterDBTableViewDrugQuantity.Options.Editing := False;

      lUntickAnimals.Visible := True;
      lUntickAnimals.Left := lInformation.Left;
      lUntickAnimals.Top := 4;
      lInformation.Top := lUntickAnimals.Top+lUntickAnimals.Height+4;
      lInformation.Caption := 'To enable Kingswood Herd to generate a correct veterinary register, do the following : '+cCRLF+
                              '1. Replace Purchase Date with correct Treatment Date (if different).'+cCRLF+
                              '2. Insert or correct Animal Nos where needed. The numbers must be seperated by a comma or space.'+cCRLF+
                              '   Alternatively you can select either a category or group of animals from drop-down-list provided.'+cCRLF+
                              '3. Enter Application Rate and correct No of Days and Times/Day values if required.';
      lInformation.Align := alClient;
      pInformation.Height := 116;

      Screen.Cursor := crDefault;

      StatusBar.Panels[0].Text := 'Records : '+ IntToStr(GetRecordCountByFilterString(FDetailTable.Filter));

      Caption := 'Vetlink - Record Treatments';

      if ( APurchaseCount > 0 ) then
         TfmVetLinkPurchaseCompleteMsg.ShowTheForm(APurchaseCount,FExitWithoutTreating);
         
      if ( FExitWithoutTreating ) then
         begin
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('UPDATE '+FHeaderTable.TableName+'');
                  SQL.Add('SET FullyImported = TRUE');
                  SQL.Add('WHERE ID = '+IntToStr(FHeaderID)+'');
                  try
                     ExecSQL;
                  except
                  end;
               finally
                  Free;
               end;
            Close;
            Exit;
         end;

      StoreAnimalsInAnimalDetailTable;

      blbSelectDeselectAll.Visible := ivAlways;

      FPurchasesComplete := True;
   finally
      if ( TempQuery <> nil ) then
         begin
            TempQuery.Close;
            FreeAndNil(TempQuery);
         end;
   end;
end;

function TfmDrugsRegisterImport.GetDetailTableCount: Integer;
var
   bStep : Boolean;
begin
   bStep := FDetailTable.FindFirst;
   while ( bStep ) do
      begin
         Inc(Result);
         bStep := FDetailTable.FindNext;
      end;
end;

function TfmDrugsRegisterImport.GetSelectedCategoryTypeBySelection(ASelection: String): TCategoryType;
begin
   Result := ctCurrentHerdAnimals;
   if ( Length(ASelection) = 0 ) then Exit;

   if ( ASelection = cAllCowsCategory ) then
      Result := ctAllCows
   else if ( ASelection = cInMilkCowCategory ) then
      Result := ctInMilkCows
   else if ( ASelection = cDryCowCategory ) then
      Result := ctDryCows
   else if ( ASelection = cAllCalvesThisYear ) then
      Result := ctAllCalvesThisYear
   else if ( ASelection = cAllCalvesLastYear ) then
      Result := ctAllCalvesLastYear
   else if ( ASelection = cAllCalvesBothYears ) then
      Result := ctAllCalvesBothYears
   else if ( ASelection = cHeiferCalvesThisYear ) then
      Result := ctHeiferCalvesThisYear
   else if ( ASelection = cHeiferCalvesLastYear ) then
      Result := ctHeiferCalvesLastYear
   else if ( ASelection = cHeiferCalvesBothYears ) then
      Result := ctHeiferCalvesBothYears
   else if ( ASelection = cDairyHeiferCalvesThisYear ) then
      Result := ctDairyHeiferCalvesThisYear
   else if ( ASelection = cDairyHeiferCalvesLastYear ) then
      Result := ctDairyHeiferCalvesLastYear
   else if ( ASelection = cDairyHeiferCalvesBothYears ) then
      Result := ctDairyHeiferCalvesBothYears
   else if ( ASelection = cBeefHeiferCalvesThisYear ) then
      Result := ctDairyHeiferCalvesBothYears
   else if ( ASelection = cBeefHeiferCalvesLastYear ) then
      Result := ctBeefHeiferCalvesLastYear
   else if ( ASelection = cBeefHeiferCalvesBothYears ) then
      Result := ctBeefHeiferCalvesBothYears
   else if ( ASelection = cMaleCalvesThisYear ) then
      Result := ctMaleCalvesThisYear
   else if ( ASelection = cMaleCalvesLastYear ) then
      Result := ctMaleCalvesLastYear
   else if ( ASelection = cMaleCalvesBothYears ) then
      Result := ctMaleCalvesBothYears;
end;

procedure TfmDrugsRegisterImport.CreateTempAnimalSelectTableData(ATreatmentDate : TDateTime);
var
   qAnimals : TQuery;
begin
   qAnimals := TQuery.Create(nil);
   try
      qAnimals.DatabaseName := AliasName;

      qAnimals.Close;
      qAnimals.SQL.Clear;
      qAnimals.SQL.Add('DELETE FROM '+FAnimalSelectTable.TableName);
      qAnimals.ExecSQL;

      //   28/06/18 [V5.8 R0.6] /MK Change - Replaced SQL's to add animals on treatment date to temp table with new Public HerdLookup.AddAnimalsToTempTableOnStockDate procedure.
      HerdLookup.AddAnimalsToTempTableOnStockDate(ATreatmentDate,FAnimalSelectTable);

      qAnimals.SQL.Clear;
      qAnimals.SQL.Add('UPDATE '+FAnimalSelectTable.TableName);
      qAnimals.SQL.Add('SET Selected = FALSE');
      qAnimals.ExecSQL;
   finally
      if ( qAnimals <> nil ) then
         begin
            qAnimals.Close;
            FreeAndNil(qAnimals);
         end;
   end;
end;

procedure TfmDrugsRegisterImport.AddAnimalSelectionToTable(AAnimalArray: PIntegerArray;
   ACategory_GroupSelected : Boolean; var ADetailTxt: String;
   ASelectedGroupID : Integer);
var
   i : Integer;
   Animal : TAnimal;
begin
   try
      Screen.Cursor := crHourGlass;
      if ( Length(AAnimalArray) > 0 ) then
         begin
            for i := 0 to Length(AAnimalArray)-1 do
               begin
                  if ( not(FDetailAnimalsTable.Locate('DetailID;AnimalID',VarArrayOf([FDetailTable.FieldByName('ID').AsInteger,AAnimalArray[i]]),[])) ) then
                     try
                        Animal := GetAnimal(AAnimalArray[i]);
                        FDetailAnimalsTable.Append;
                        FDetailAnimalsTable.FieldByName('AnimalID').AsInteger := AAnimalArray[i];
                        FDetailAnimalsTable.FieldByName('DetailID').AsInteger := FDetailTable.FieldByName('ID').AsInteger;
                        FDetailAnimalsTable.FieldByName('HeaderID').AsInteger := FHeaderID;
                        if ( Length(Animal.AnimalNo) > 0 ) then
                           FDetailAnimalsTable.FieldByName('AnimalTagDesc').AsString := Animal.AnimalNo
                        else
                           FDetailAnimalsTable.FieldByName('AnimalTagDesc').AsString := Animal.NatIdNum;
                        FDetailAnimalsTable.FieldByName('GroupID').AsInteger := ASelectedGroupID;
                        FDetailAnimalsTable.FieldByName('TreatmentSaved').AsBoolean := False;
                        FDetailAnimalsTable.Post;
                     except
                        FDetailAnimalsTable.Cancel;
                     end;
               end;
            if ( not(ACategory_GroupSelected) ) then
               ADetailTxt := Format('%d animal(s) selected',[Length(AAnimalArray)]);
         end;
      FDetailAnimalsTable.Close;
      FDetailAnimalsTable.Open;
   finally
      Screen.Cursor := crDefault;
   end;
end;

function TfmDrugsRegisterImport.GetDetailAnimalSelectedCount: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM '+FAnimalSelectTable.TableName);
         SQL.Add('WHERE Selected = True');
         try
            Open;
            Result := RecordCount;
         except
         end;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.DeleteFromDetailAnimalsTable;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM '+FDetailAnimalsTable.TableName);
         SQL.Add('WHERE DetailID = '+IntToStr(FDetailTable.FieldByName('ID').AsInteger));
         try
            ExecSQL;
         except
         end;
      finally
         Free;
      end;
end;

function TfmDrugsRegisterImport.GetRecordCountByFilterString ( AFilterString : String ) : Integer;
begin
   Result := 0;
   if ( Length(AFilterString) = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM '+FDetailTable.TableName);
         SQL.Add('WHERE HeaderID = '+IntToStr(FHeaderID));
         SQL.Add('AND   '+AFilterString);
         try
            Open;
            Result := RecordCount;
         except
            on e : Exception do
               begin
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError('VetLink Import Error - Error retrieving MaxProgressIndicator');
               end;
         end;
      finally
         Free;
      end;
end;

procedure TfmDrugsRegisterImport.actSelectAllExecute(Sender: TObject);
begin
   inherited;
   FSelectType := stSelected;
   SelectDeselectAll;
   blbSelectDeSelectAll.Glyph := nil;
   blbSelectDeSelectAll.Action := actDeselectAll;
end;

procedure TfmDrugsRegisterImport.actDeselectAllExecute(Sender: TObject);
begin
  inherited;
   FSelectType := stDeselected;
   SelectDeselectAll;
   blbSelectDeSelectAll.Glyph := nil;
   blbSelectDeSelectAll.Action := actSelectAll;
end;

procedure TfmDrugsRegisterImport.SelectDeselectAll;
var
   iFocusedRowIndex : Integer;
begin
   iFocusedRowIndex := 0;
   iFocusedRowIndex := DrugRegisterDBTableView.DataController.FocusedRowIndex;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE '+FDetailTable.TableName);
         SQL.Add('SET Selected = :SelectType');
         case FSelectType of
            stSelected : Params[0].AsString := 'True';
            stDeselected : Params[0].AsString := 'False';
         end;
         ExecSQL;

         DrugRegisterDBTableView.DataController.BeginFullUpdate;
         FDetailTable.DisableControls;
         FDetailTable.Close;
         FDetailTable.Open;
         FDetailTable.EnableControls;
         DrugRegisterDBTableView.DataController.EndFullUpdate;
         DrugRegisterDBTableView.DataController.FocusedRowIndex := iFocusedRowIndex;
      finally
         Free;
      end;
end;

end.
