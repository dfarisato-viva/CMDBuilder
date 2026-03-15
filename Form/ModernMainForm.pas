unit ModernMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, System.DateUtils,
  Vcl.Menus, Vcl.AppEvnts, System.IOUtils, Vcl.Buttons, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, cxGraphics, cxButtons,
  cxLookAndFeels, cxLookAndFeelPainters, System.Generics.Collections,
  Vcl.CategoryButtons, Vcl.ButtonGroup, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, System.Actions, Vcl.ActnList,
  Vcl.ImgList, cxImageList, Vcl.Samples.Spin,
  // Units del progetto
  SubstManager, GestSub, ConfigManager, BuilderUtils, BuildConfigManager,
  SQLServerDetection, ConfigWizardForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, cxControls, cxContainer, cxEdit, cxTextEdit,
  System.ImageList;

type
  TfrmModernMain = class(TForm)
    // Main Layout
    pnlHeader: TPanel;
    pnlContent: TPanel;
    pnlFooter: TPanel;
    
    // Header Components
    lblTitle: TLabel;
    lblVersion: TLabel;
    btnMinimize: TcxButton;
    btnClose: TcxButton;
    
    // Navigation
    pnlNavigation: TPanel;
    btnBuild: TcxButton;
    btnDrives: TcxButton;
    btnDatabase: TcxButton;
    btnUtilities: TcxButton;
    btnSettings: TcxButton;
    
    // Content Pages
    pcMain: TPageControl;
    tsBuild: TTabSheet;
    tsDrives: TTabSheet;
    tsDatabase: TTabSheet;
    tsUtilities: TTabSheet;
    tsSettings: TTabSheet;
    
    // Build Page
    pnlBuildConfig: TPanel;
    lblBuildConfig: TLabel;
    cbConfiguration: TComboBox;
    gbBuildOptions: TGroupBox;
    chkVerbose: TCheckBox;
    chkCleanFirst: TCheckBox;
    chkShowCompilerOutput: TCheckBox;
    chkDelphiOff: TCheckBox;
    
    pnlBuildButtons: TPanel;
    btnFastBuild: TcxButton;
    btnNormalBuild: TcxButton;
    btnPackageBuild: TcxButton;
    btnModuleBuild: TcxButton;
    btnServiceBuild: TcxButton;
    btnCustomBuild: TcxButton;
    
    // Log Panel
    pnlLog: TPanel;
    lblLog: TLabel;
    memoLog: TRichEdit;
    pnlLogControls: TPanel;
    btnClearLog: TcxButton;
    btnSaveLog: TcxButton;
    btnAutoScroll: TcxButton;
    
    // Progress Panel
    pnlProgress: TPanel;
    lblStatus: TLabel;
    progressBar: TProgressBar;
    lblTime: TLabel;
    progressBarSub: TProgressBar;
    lblProgress: TLabel;
    lblSubProgress: TLabel;
    
    // Drives Page
    pnlDriveConfig: TPanel;
    lblDriveConfig: TLabel;
    edtDriveLetter: TEdit;
    lblDriveLetter: TLabel;
    
    pnlDriveList: TPanel;
    lblMappedDrives: TLabel;
    lbDrive: TListBox;
    pnlDriveButtons: TPanel;
    btnAddDrive: TcxButton;
    btnRemoveDrive: TcxButton;
    btnRefreshDrives: TcxButton;
    btnManageDrives: TcxButton;
    
    // Database Page
    pnlDatabaseInfo: TPanel;
    lblDatabaseInfo: TLabel;
    memoDatabaseInfo: TMemo;
    pnlDatabaseButtons: TPanel;
    btnCheckVersion: TcxButton;
    btnCheckSession: TcxButton;
    btnChangePassword: TcxButton;
    btnDatabaseConfig: TcxButton;
    
    eSession: TEdit;
    lblSession: TLabel;
    
    // Utilities Page
    pnlUtilityButtons: TPanel;
    btnXMLConverter: TcxButton;
    btnSQLFormatter: TcxButton;
    btnVersionUpdater: TcxButton;
    btnSVNTools: TcxButton;
    
    // Version Update Panel
    pnlVersionUpdate: TPanel;
    gbVersionInfo: TGroupBox;
    lblMajor: TLabel;
    eMajor: TSpinEdit;
    lblMinor: TLabel;
    eMinor: TSpinEdit;
    lblRelease: TLabel;
    eRelease: TSpinEdit;
    lblBuild: TLabel;
    eBuild: TSpinEdit;
    lblAdditionalInfo: TLabel;
    eAdditionalVersionInfo: TEdit;
    btnUpdateVersion: TcxButton;
    
    // Settings Page
    pnlSettingsContent: TPanel;
    gbPaths: TGroupBox;
    lblBOSPath: TLabel;
    edtBOSPath: TEdit;
    btnBrowseBOS: TcxButton;
    lblAPPBOSPath: TLabel;
    edtAPPBOSPath: TEdit;
    btnBrowseAPPBOS: TcxButton;
    lblAlonePath: TLabel;
    edtAlonePath: TEdit;
    btnBrowseAlone: TcxButton;
    lblSQLServer: TLabel;
    edtSQLServer: TEdit;
    
    gbOptions: TGroupBox;
    chkAutoConvert: TCheckBox;
    chkStartMinimized: TCheckBox;
    chkShowNotifications: TCheckBox;
    
    pnlSettingsButtons: TPanel;
    btnSaveSettings: TcxButton;
    btnResetSettings: TcxButton;
    btnImportSettings: TcxButton;
    btnExportSettings: TcxButton;
    
    // Common Components
    ActionList: TActionList;
    ImageList: TcxImageList;
    saveDialog: TSaveDialog;
    openDialog: TOpenDialog;
    
    // Database Components
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    CDSPath: TClientDataSet;
    
    // Actions
    actBuild: TAction;
    actDrives: TAction;
    actDatabase: TAction;
    actUtilities: TAction;
    actSettings: TAction;
    actClearLog: TAction;
    actSaveLog: TAction;
    actMinimize: TAction;
    actClose: TAction;
    
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    
    // Navigation Actions
    procedure actBuildExecute(Sender: TObject);
    procedure actDrivesExecute(Sender: TObject);
    procedure actDatabaseExecute(Sender: TObject);
    procedure actUtilitiesExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    
    // Build Actions
    procedure btnFastBuildClick(Sender: TObject);
    procedure btnNormalBuildClick(Sender: TObject);
    procedure btnPackageBuildClick(Sender: TObject);
    procedure btnModuleBuildClick(Sender: TObject);
    procedure btnServiceBuildClick(Sender: TObject);
    procedure btnCustomBuildClick(Sender: TObject);
    
    // Log Actions
    procedure actClearLogExecute(Sender: TObject);
    procedure actSaveLogExecute(Sender: TObject);
    procedure btnAutoScrollClick(Sender: TObject);
    
    // Drive Actions
    procedure btnAddDriveClick(Sender: TObject);
    procedure btnRemoveDriveClick(Sender: TObject);
    procedure btnRefreshDrivesClick(Sender: TObject);
    procedure btnManageDrivesClick(Sender: TObject);
    
    // Database Actions
    procedure btnCheckVersionClick(Sender: TObject);
    procedure btnCheckSessionClick(Sender: TObject);
    procedure btnChangePasswordClick(Sender: TObject);
    procedure btnDatabaseConfigClick(Sender: TObject);
    
    // Utility Actions
    procedure btnXMLConverterClick(Sender: TObject);
    procedure btnSQLFormatterClick(Sender: TObject);
    procedure btnVersionUpdaterClick(Sender: TObject);
    procedure btnSVNToolsClick(Sender: TObject);
    procedure btnUpdateVersionClick(Sender: TObject);
    
    // Settings Actions
    procedure btnSaveSettingsClick(Sender: TObject);
    procedure btnResetSettingsClick(Sender: TObject);
    procedure btnImportSettingsClick(Sender: TObject);
    procedure btnExportSettingsClick(Sender: TObject);
    
    // Window Actions
    procedure actMinimizeExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    
  private
    FStartTime: TDateTime;
    FLogFileName: string;
    FIsBuilding: Boolean;
    FAutoScroll: Boolean;
    FSubstManager: TSubstManager;
    FConfig: TConfigManager;
    FConfigManager: TBuildConfigManager;
    FRecConfig: TRecConfig;
    FParentForm: TForm; // Riferimento alla form principale
    
    // Core Methods
    procedure InitializeComponents;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure SetupNavigation;
    procedure SetupImageList;
    
    // Build Methods
    procedure ExecuteBuild(AConfig: TBuildConfiguration);
    function ExecuteMSBuild(const ProjectPath: string; const Targets: string = 'Build'): Boolean;
    procedure SetBuildingState(Building: Boolean);
    
    // Log Methods
    procedure LogMessage(const Msg: string; MessageType: TLogMessageType = lmtInfo);
    procedure LogCompilerOutput(const Msg: string);
    procedure LogSVNOutput(const Msg: string);
    procedure InitializeLogging;
    function IsImportantCompilerMessage(const Msg: string): Boolean;
    
    // Drive Methods
    procedure RefreshDriveList;
    procedure InitializeDrives;
    
    // Database Methods
    procedure RefreshDatabaseInfo;
    
    // Utility Methods
    procedure UpdateStatus(const Status: string);
    function FormatElapsedTime(StartTime: TDateTime): string;
    procedure ShowNotification(const Title, Msg: string);
    
  public
    constructor CreateWithParent(AOwner: TComponent; AParentForm: TForm);
    procedure ShowPage(PageIndex: Integer);
    property ParentForm: TForm read FParentForm write FParentForm;
  end;

implementation

{$R *.dfm}

uses
  Winapi.ShellAPI, System.Win.Registry, TlHelp32, System.UITypes, System.Types,
  System.IniFiles, IniConfig, XmlFormConverter, ChangePwd, Untitled1, UnParseDproj,
  TrayMainForm, Vcl.Clipbrd;

{ TfrmModernMain }

constructor TfrmModernMain.CreateWithParent(AOwner: TComponent; AParentForm: TForm);
begin
  inherited Create(AOwner);
  FParentForm := AParentForm;
end;

procedure TfrmModernMain.FormCreate(Sender: TObject);
begin
  InitializeComponents;
  SetupImageList;
  SetupNavigation;
  LoadSettings;
  InitializeLogging;
  InitializeDrives;
  
  FSubstManager := TSubstManager.Create;
  FConfig := TConfigManager.Create;
  FConfigManager := TBuildConfigManager.Create;
  FConfigManager.LoadConfigurations;
  
  FAutoScroll := True;
  FIsBuilding := False;
  
  // Imposta la pagina iniziale
  ShowPage(0); // Build page
  
  LogMessage('╔══════════════════════════════════════════════════════════════╗');
  LogMessage('║              Modern Choice Builder Interface Started          ║');
  LogMessage('╠══════════════════════════════════════════════════════════════╣');
  LogMessage(Format('║ Data: %-53s  ║', [DateTimeToStr(Now)]));
  LogMessage(Format('║ User: %-53s  ║', [GetEnvironmentVariable('USERNAME')]));
  LogMessage('╚══════════════════════════════════════════════════════════════╝');
end;

procedure TfrmModernMain.InitializeComponents;
begin
  // Imposta il titolo e la versione
  Caption := 'Choice Builder - Modern Interface';
  lblTitle.Caption := 'Choice Builder';
  lblVersion.Caption := 'v3.1.2.7';
  
  // Configura i componenti di base
  cbConfiguration.Items.AddStrings(['Debug', 'Release']);
  cbConfiguration.ItemIndex := 0;
  
  // Imposta le opzioni di default
  chkVerbose.Checked := False;
  chkCleanFirst.Checked := True;
  chkShowCompilerOutput.Checked := False;
  chkDelphiOff.Checked := False;
  chkAutoConvert.Checked := False;
  chkStartMinimized.Checked := False;
  chkShowNotifications.Checked := True;
  
  // Configura il drive letter di default
  edtDriveLetter.Text := 'S';
  
  // Configura i progress bar
  progressBar.Style := pbstNormal;
  progressBarSub.Style := pbstMarquee;
  
  SetBuildingState(False);
end;

procedure TfrmModernMain.SetupImageList;
begin
  // Qui potresti caricare le icone per i pulsanti
  // Per ora usiamo gli indici di default
end;

procedure TfrmModernMain.SetupNavigation;
begin
  // Collega le azioni ai pulsanti di navigazione
  btnBuild.Action := actBuild;
  btnDrives.Action := actDrives;
  btnDatabase.Action := actDatabase;
  btnUtilities.Action := actUtilities;
  btnSettings.Action := actSettings;
  
  // Imposta i caption dei pulsanti
  btnBuild.Caption := 'Build';
  btnDrives.Caption := 'Drives';
  btnDatabase.Caption := 'Database';
  btnUtilities.Caption := 'Utilities';
  btnSettings.Caption := 'Settings';
end;

procedure TfrmModernMain.ShowPage(PageIndex: Integer);
begin
  if (PageIndex >= 0) and (PageIndex < pcMain.PageCount) then
  begin
    pcMain.ActivePageIndex := PageIndex;
    
    // Aggiorna lo stato dei pulsanti di navigazione
    btnBuild.Down := PageIndex = 0;
    btnDrives.Down := PageIndex = 1;
    btnDatabase.Down := PageIndex = 2;
    btnUtilities.Down := PageIndex = 3;
    btnSettings.Down := PageIndex = 4;
  end;
end;

// Navigation Actions
procedure TfrmModernMain.actBuildExecute(Sender: TObject);
begin
  ShowPage(0);
end;

procedure TfrmModernMain.actDrivesExecute(Sender: TObject);
begin
  ShowPage(1);
  RefreshDriveList;
end;

procedure TfrmModernMain.actDatabaseExecute(Sender: TObject);
begin
  ShowPage(2);
  RefreshDatabaseInfo;
end;

procedure TfrmModernMain.actUtilitiesExecute(Sender: TObject);
begin
  ShowPage(3);
end;

procedure TfrmModernMain.actSettingsExecute(Sender: TObject);
begin
  ShowPage(4);
end;

// Build Actions
procedure TfrmModernMain.btnFastBuildClick(Sender: TObject);
var
  Config: TBuildConfiguration;
begin
  Config := FConfigManager.GetConfigurationByName('Super Fast Build');
  if Assigned(Config) then
    ExecuteBuild(Config)
  else
    ShowMessage('Fast Build configuration not found!');
end;

procedure TfrmModernMain.btnNormalBuildClick(Sender: TObject);
var
  Config: TBuildConfiguration;
begin
  Config := FConfigManager.GetConfigurationByName('Normal Build');
  if Assigned(Config) then
    ExecuteBuild(Config)
  else
    ShowMessage('Normal Build configuration not found!');
end;

procedure TfrmModernMain.btnPackageBuildClick(Sender: TObject);
var
  Config: TBuildConfiguration;
begin
  Config := FConfigManager.GetConfigurationByName('Build Package');
  if Assigned(Config) then
    ExecuteBuild(Config)
  else
    ShowMessage('Package Build configuration not found!');
end;

procedure TfrmModernMain.btnModuleBuildClick(Sender: TObject);
var
  Config: TBuildConfiguration;
begin
  Config := FConfigManager.GetConfigurationByName('Build Modules');
  if Assigned(Config) then
    ExecuteBuild(Config)
  else
    ShowMessage('Module Build configuration not found!');
end;

procedure TfrmModernMain.btnServiceBuildClick(Sender: TObject);
var
  Config: TBuildConfiguration;
begin
  Config := FConfigManager.GetConfigurationByName('Build APPBOSServices');
  if Assigned(Config) then
    ExecuteBuild(Config)
  else
    ShowMessage('Service Build configuration not found!');
end;

procedure TfrmModernMain.btnCustomBuildClick(Sender: TObject);
var
  WizardForm: TfrmConfigWizard;
begin
  WizardForm := TfrmConfigWizard.Create(Self);
  try
    if WizardForm.ShowModal = mrOk then
    begin
      // Ricarica le configurazioni
      FConfigManager.LoadConfigurations;
      LogMessage('Custom build configuration created successfully');
    end;
  finally
    WizardForm.Free;
  end;
end;

// Log Actions
procedure TfrmModernMain.actClearLogExecute(Sender: TObject);
begin
  memoLog.Clear;
  LogMessage('Log cleared by user');
end;

procedure TfrmModernMain.actSaveLogExecute(Sender: TObject);
begin
  saveDialog.FileName := 'build_log_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.txt';
  if saveDialog.Execute then
  begin
    memoLog.Lines.SaveToFile(saveDialog.FileName);
    ShowNotification('Choice Builder', 'Log saved to: ' + ExtractFileName(saveDialog.FileName));
  end;
end;

procedure TfrmModernMain.btnAutoScrollClick(Sender: TObject);
begin
  FAutoScroll := not FAutoScroll;
  btnAutoScroll.Down := FAutoScroll;
  if FAutoScroll then
    btnAutoScroll.Caption := 'Auto Scroll: ON'
  else
    btnAutoScroll.Caption := 'Auto Scroll: OFF';
end;

// Drive Actions
procedure TfrmModernMain.btnAddDriveClick(Sender: TObject);
var
  DriveLetter: Char;
  Path: string;
begin
  DriveLetter := edtDriveLetter.Text[1];
  
  if InputQuery('Add Virtual Drive', 'Enter path for drive ' + DriveLetter + ':', Path) then
  begin
    if FSubstManager.CreateVirtualDrive(DriveLetter, Path) then
    begin
      LogMessage(Format('Virtual drive %s: created -> %s', [DriveLetter, Path]));
      RefreshDriveList;
      ShowNotification('Choice Builder', Format('Drive %s: mapped successfully', [DriveLetter]));
    end
    else
    begin
      LogMessage(Format('Failed to create virtual drive %s:', [DriveLetter]), lmtError);
      ShowMessage('Failed to create virtual drive!');
    end;
  end;
end;

procedure TfrmModernMain.btnRemoveDriveClick(Sender: TObject);
var
  DriveLetter: Char;
  SelectedDrive: string;
begin
  if lbDrive.ItemIndex >= 0 then
  begin
    SelectedDrive := lbDrive.Items[lbDrive.ItemIndex];
    if Length(SelectedDrive) > 0 then
    begin
      DriveLetter := SelectedDrive[1];
      if MessageDlg(Format('Remove virtual drive %s:?', [DriveLetter]), 
                    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if FSubstManager.RemoveVirtualDrive(DriveLetter) then
        begin
          LogMessage(Format('Virtual drive %s: removed', [DriveLetter]));
          RefreshDriveList;
          ShowNotification('Choice Builder', Format('Drive %s: removed successfully', [DriveLetter]));
        end
        else
        begin
          LogMessage(Format('Failed to remove virtual drive %s:', [DriveLetter]), lmtError);
          ShowMessage('Failed to remove virtual drive!');
        end;
      end;
    end;
  end
  else
    ShowMessage('Please select a drive to remove');
end;

procedure TfrmModernMain.btnRefreshDrivesClick(Sender: TObject);
begin
  RefreshDriveList;
end;

procedure TfrmModernMain.btnManageDrivesClick(Sender: TObject);
begin
  // Apri la form di gestione drive esistente
  if Assigned(FParentForm) and (FParentForm is TfrmTrayMain) then
    TfrmTrayMain(FParentForm).GestSubClick(Sender);
end;

// Database Actions
procedure TfrmModernMain.btnCheckVersionClick(Sender: TObject);
begin
  if Assigned(FParentForm) and (FParentForm is TfrmTrayMain) then
    TfrmTrayMain(FParentForm).btDBVersionClick(Sender);
end;

procedure TfrmModernMain.btnCheckSessionClick(Sender: TObject);
begin
  if Assigned(FParentForm) and (FParentForm is TfrmTrayMain) then
    TfrmTrayMain(FParentForm).btSessionClick(Sender);
end;

procedure TfrmModernMain.btnChangePasswordClick(Sender: TObject);
begin
  if Assigned(FParentForm) and (FParentForm is TfrmTrayMain) then
    TfrmTrayMain(FParentForm).brChangePwdClick(Sender);
end;

procedure TfrmModernMain.btnDatabaseConfigClick(Sender: TObject);
begin
  if Assigned(FParentForm) and (FParentForm is TfrmTrayMain) then
    TfrmTrayMain(FParentForm).Iniconfig1Click(Sender);
end;

// Utility Actions
procedure TfrmModernMain.btnXMLConverterClick(Sender: TObject);
begin
  if Assigned(FParentForm) and (FParentForm is TfrmTrayMain) then
  begin
    TcxButton(Sender).Tag := 1; // XML mode
    TfrmTrayMain(FParentForm).btXMLClick(Sender);
  end;
end;

procedure TfrmModernMain.btnSQLFormatterClick(Sender: TObject);
begin
  if Assigned(FParentForm) and (FParentForm is TfrmTrayMain) then
  begin
    TcxButton(Sender).Tag := 2; // SQL mode
    TfrmTrayMain(FParentForm).btXMLClick(Sender);
  end;
end;

procedure TfrmModernMain.btnVersionUpdaterClick(Sender: TObject);
begin
  pnlVersionUpdate.Visible := not pnlVersionUpdate.Visible;
end;

procedure TfrmModernMain.btnUpdateVersionClick(Sender: TObject);
begin
  if Assigned(FParentForm) and (FParentForm is TfrmTrayMain) then
    TfrmTrayMain(FParentForm).btnUpdVersionClick(Sender);
end;

procedure TfrmModernMain.btnSVNToolsClick(Sender: TObject);
begin
  ShowMessage('SVN Tools - Feature coming soon!');
end;

// Settings Actions
procedure TfrmModernMain.btnSaveSettingsClick(Sender: TObject);
begin
  SaveSettings;
  ShowNotification('Choice Builder', 'Settings saved successfully');
end;

procedure TfrmModernMain.btnResetSettingsClick(Sender: TObject);
begin
  if MessageDlg('Reset all settings to default values?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Reset to defaults
    chkVerbose.Checked := False;
    chkCleanFirst.Checked := True;
    chkShowCompilerOutput.Checked := False;
    chkDelphiOff.Checked := False;
    chkAutoConvert.Checked := False;
    chkStartMinimized.Checked := False;
    chkShowNotifications.Checked := True;
    
    edtDriveLetter.Text := 'S';
    edtBOSPath.Text := 's:\work\Bin\Overview.exe';
    edtAPPBOSPath.Text := 's:\work\isapi\AppBosServices.exe';
    edtAlonePath.Text := 's:\work\Bin\OverviewStandaloneSrv.exe';
    edtSQLServer.Text := 'LocalHost';
    
    SaveSettings;
    ShowNotification('Choice Builder', 'Settings reset to defaults');
  end;
end;

procedure TfrmModernMain.btnImportSettingsClick(Sender: TObject);
begin
  openDialog.Filter := 'INI Files (*.ini)|*.ini|All Files (*.*)|*.*';
  if openDialog.Execute then
  begin
    // Import settings logic here
    ShowNotification('Choice Builder', 'Settings imported from: ' + ExtractFileName(openDialog.FileName));
  end;
end;

procedure TfrmModernMain.btnExportSettingsClick(Sender: TObject);
begin
  saveDialog.Filter := 'INI Files (*.ini)|*.ini|All Files (*.*)|*.*';
  saveDialog.FileName := 'ChoiceBuilder_Settings_' + FormatDateTime('yyyymmdd', Now) + '.ini';
  if saveDialog.Execute then
  begin
    // Export settings logic here
    ShowNotification('Choice Builder', 'Settings exported to: ' + ExtractFileName(saveDialog.FileName));
  end;
end;

// Window Actions
procedure TfrmModernMain.actMinimizeExecute(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TfrmModernMain.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmModernMain.LoadSettings;
begin
  if not Assigned(FConfig) then
    FConfig := TConfigManager.Create;
    
  chkVerbose.Checked := FConfig.ReadBool('Settings', 'chkVerbose', False);
  chkCleanFirst.Checked := FConfig.ReadBool('Settings', 'chkCleanFirst', True);
  chkShowCompilerOutput.Checked := FConfig.ReadBool('Settings', 'chkShowCompilerOutput', False);
  chkDelphiOff.Checked := FConfig.ReadBool('Settings', 'chkDelphiOff', False);
  edtDriveLetter.Text := FConfig.ReadString('Settings', 'edtDriveLetter', 'S');
  
  edtBOSPath.Text := FConfig.ReadString('Settings', 'edtBOS', 's:\work\Bin\Overview.exe');
  edtAPPBOSPath.Text := FConfig.ReadString('Settings', 'edtAPPBOS', 's:\work\isapi\AppBosServices.exe');
  edtAlonePath.Text := FConfig.ReadString('Settings', 'edtAlone', 's:\work\Bin\OverviewStandaloneSrv.exe');
  edtSQLServer.Text := FConfig.ReadString('Settings', 'edtSQLServer', 'LocalHost');
  
  chkAutoConvert.Checked := FConfig.ReadBool('Settings', 'chkAutoConvert', False);
  chkStartMinimized.Checked := FConfig.ReadBool('Settings', 'chkStartMinimized', False);
  chkShowNotifications.Checked := FConfig.ReadBool('Settings', 'chkShowNotifications', True);
end;

procedure TfrmModernMain.SaveSettings;
begin
  if not Assigned(FConfig) then
    FConfig := TConfigManager.Create;
    
  FConfig.WriteBool('Settings', 'chkVerbose', chkVerbose.Checked);
  FConfig.WriteBool('Settings', 'chkCleanFirst', chkCleanFirst.Checked);
  FConfig.WriteBool('Settings', 'chkShowCompilerOutput', chkShowCompilerOutput.Checked);
  FConfig.WriteBool('Settings', 'chkDelphiOff', chkDelphiOff.Checked);
  FConfig.WriteString('Settings', 'edtDriveLetter', edtDriveLetter.Text);
  
  FConfig.WriteString('Settings', 'edtBOS', edtBOSPath.Text);
  FConfig.WriteString('Settings', 'edtAPPBOS', edtAPPBOSPath.Text);
  FConfig.WriteString('Settings', 'edtAlone', edtAlonePath.Text);
  FConfig.WriteString('Settings', 'edtSQLServer', edtSQLServer.Text);
  
  FConfig.WriteBool('Settings', 'chkAutoConvert', chkAutoConvert.Checked);
  FConfig.WriteBool('Settings', 'chkStartMinimized', chkStartMinimized.Checked);
  FConfig.WriteBool('Settings', 'chkShowNotifications', chkShowNotifications.Checked);
  
  FConfig.SaveToFile;
end;

procedure TfrmModernMain.RefreshDriveList;
var
  DriveList: TStringList;
begin
  DriveList := TStringList.Create;
  try
    lbDrive.Items.Clear;
    FSubstManager.GetSubstDrivesAsStrings(DriveList);
    lbDrive.Items.AddStrings(DriveList);
  finally
    DriveList.Free;
  end;
end;

procedure TfrmModernMain.InitializeDrives;
begin
  RefreshDriveList;
end;

procedure TfrmModernMain.RefreshDatabaseInfo;
begin
  memoDatabaseInfo.Lines.Clear;
  memoDatabaseInfo.Lines.Add('Database Server: ' + edtSQLServer.Text);
  memoDatabaseInfo.Lines.Add('Connection Status: Checking...');
  memoDatabaseInfo.Lines.Add('');
  memoDatabaseInfo.Lines.Add('Use the buttons below to:');
  memoDatabaseInfo.Lines.Add('- Check database versions');
  memoDatabaseInfo.Lines.Add('- Manage sessions');
  memoDatabaseInfo.Lines.Add('- Change passwords');
  memoDatabaseInfo.Lines.Add('- Configure connections');
end;

// Core Methods Implementation
procedure TfrmModernMain.ExecuteBuild(AConfig: TBuildConfiguration);
var
  ProjectPath, Targets: string;
  Success: Boolean;
  i: Integer;
  BuildDesc: string;
begin
  if FIsBuilding then Exit;

  BuildDesc := AConfig.Description;
  SetBuildingState(True);
  Success := True;

  try
    LogMessage('=== START BUILD: ' + BuildDesc + ' ===');
    UpdateStatus('Initializing build...');
    ShowNotification('Choice Builder', 'Starting ' + BuildDesc + '...');

    progressBar.Max := Length(AConfig.Projects);
    progressBar.Position := 0;

    for i := 0 to High(AConfig.Projects) do
    begin
      ProjectPath := AConfig.Projects[i].ProjectPath;
      Targets := AConfig.Projects[i].Targets;

      progressBar.Position := i;
      UpdateStatus(Format('Building %d/%d: %s', [i+1, Length(AConfig.Projects), ExtractFileName(ProjectPath)]));
      LogMessage('Building project: ' + ProjectPath + ' (Targets: ' + Targets + ')');

      if not ExecuteMSBuild(ProjectPath, Targets) then
      begin
        Success := False;
        LogMessage('ERROR: Build failed for ' + ProjectPath, lmtError);
        Break;
      end
      else
        LogMessage('SUCCESS: Build completed for ' + ProjectPath, lmtSuccess);
    end;

    progressBar.Position := progressBar.Max;

    if Success then
    begin
      LogMessage('SUCCESS: ' + BuildDesc + ' completed successfully', lmtSuccess);
      UpdateStatus('Build completed successfully!');
      ShowNotification('Choice Builder', BuildDesc + ' completed successfully!');
    end
    else
    begin
      UpdateStatus('Build failed!');
      ShowNotification('Choice Builder', BuildDesc + ' failed! Check log for details.');
    end;

  finally
    LogMessage('Build terminated: ' + FormatElapsedTime(FStartTime));
    LogMessage('========================================');
    SetBuildingState(False);
    UpdateStatus('Ready');
  end;
end;

function TfrmModernMain.ExecuteMSBuild(const ProjectPath: string; const Targets: string = 'Build'): Boolean;
var
  CommandLine: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  ExitCode: DWORD;
  Config: string;
  VerboseFlag: string;
begin
  Result := False;

  Config := cbConfiguration.Text;

  if chkShowCompilerOutput.Checked or chkVerbose.Checked then
    VerboseFlag := '/v:n'
  else
    VerboseFlag := '/v:q';

  CommandLine := Format('cmd.exe /c "call "C:\Program Files (x86)\Embarcadero\Studio\21.0\bin\rsvars.bat" && ' +
                       'msbuild.exe "/t:%s" "/p:config=%s" "%s" %s"',
                       [Targets, Config, ProjectPath, VerboseFlag]);

  LogMessage('Executing command: ' + CommandLine);

  ZeroMemory(@StartupInfo, SizeOf(StartupInfo));
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.wShowWindow := SW_HIDE;
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;

  if CreateProcess(nil, PChar(CommandLine), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInfo) then
  begin
    try
      while WaitForSingleObject(ProcessInfo.hProcess, 100) = WAIT_TIMEOUT do
      begin
        UpdateStatus('Building... ' + FormatElapsedTime(FStartTime));
        Application.ProcessMessages;
      end;

      GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
      Result := ExitCode = 0;

      LogMessage('Build completed with exit code: ' + IntToStr(ExitCode));

    finally
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);
    end;
  end
  else
    LogMessage('ERROR: Unable to start MSBuild', lmtError);
end;

procedure TfrmModernMain.SetBuildingState(Building: Boolean);
begin
  FIsBuilding := Building;

  // Update progress visibility
  pnlProgress.Visible := Building;
  progressBar.Visible := Building;
  progressBarSub.Visible := Building and chkShowCompilerOutput.Checked;
  lblProgress.Visible := Building;
  lblSubProgress.Visible := Building and chkShowCompilerOutput.Checked;

  if Building then
  begin
    progressBar.Style := pbstNormal;
    progressBar.Position := 0;
    if chkShowCompilerOutput.Checked then
      progressBarSub.Style := pbstMarquee;
    FStartTime := Now;
  end
  else
  begin
    progressBar.Position := 0;
    progressBarSub.Position := 0;
  end;

  // Enable/disable controls
  pnlBuildButtons.Enabled := not Building;
  cbConfiguration.Enabled := not Building;
  gbBuildOptions.Enabled := not Building;
end;

procedure TfrmModernMain.LogMessage(const Msg: string; MessageType: TLogMessageType = lmtInfo);
var
  LogEntry: string;
  LogFile: TextFile;
  TextColor: TColor;
  StartPos: Integer;
  LineIndex: Integer;
  Len: Integer;
begin
  LogEntry := Format('%s - %s', [TimeToStr(Now), Msg]);
  Len := Pos('-', LogEntry);

  case MessageType of
    lmtInfo:         TextColor := clLime;
    lmtWarning:      TextColor := clMaroon;
    lmtError:        TextColor := clRed;
    lmtSuccess:      TextColor := clGreen;
    lmtDrive:        TextColor := clWhite;
    lmtSvnAdded:     TextColor := clFuchsia;
    lmtSvnDeleted:   TextColor := clWebCoral;
    lmtSvnUpdated:   TextColor := clLime;
    lmtSvnConflict:  TextColor := clRed;
    lmtSvnMerged:    TextColor := clYellow;
    lmtSvnExisted:   TextColor := clWhite;
    lmtSvnReplaced:  TextColor := clMaroon;
  else
    TextColor := clWhite;
  end;

  LineIndex := memoLog.Lines.Add(LogEntry);
  StartPos := memoLog.Perform(EM_LINEINDEX, LineIndex, 0);

  // Color the timestamp
  memoLog.SelStart := StartPos;
  memoLog.SelLength := 12;
  memoLog.SelAttributes.Color := clLime;

  // Color the message
  memoLog.SelStart := StartPos + Len;
  memoLog.SelLength := Length(LogEntry) - Len;
  memoLog.SelAttributes.Color := TextColor;

  // Auto-scroll if enabled
  if FAutoScroll then
  begin
    memoLog.SelStart := Length(memoLog.Text);
    memoLog.SelLength := 0;
    memoLog.Perform(WM_VSCROLL, SB_BOTTOM, 0);
  end;

  // Save to log file
  try
    AssignFile(LogFile, FLogFileName);
    if FileExists(FLogFileName) then
      Append(LogFile)
    else
      Rewrite(LogFile);
    Writeln(LogFile, LogEntry);
    CloseFile(LogFile);
  except
    // Ignore file errors
  end;

  Application.ProcessMessages;
end;

procedure TfrmModernMain.LogCompilerOutput(const Msg: string);
var
  CleanMsg: string;
begin
  CleanMsg := Trim(Msg);

  if (CleanMsg = '') or
     (Pos('Microsoft (R)', CleanMsg) > 0) or
     (Pos('Copyright (C)', CleanMsg) > 0) or
     (Pos('Build started', CleanMsg) > 0) or
     (Pos('Build succeeded', CleanMsg) > 0) or
     (Pos('Build FAILED', CleanMsg) > 0) then
    Exit;

  if IsImportantCompilerMessage(CleanMsg) then
  begin
    if (Pos('error', LowerCase(CleanMsg)) > 0) or (Pos('fatal', LowerCase(CleanMsg)) > 0) then
      LogMessage('>>> COMPILER: ' + CleanMsg, lmtError)
    else if (Pos('warning', LowerCase(CleanMsg)) > 0) then
      LogMessage('>>> COMPILER: ' + CleanMsg, lmtWarning)
    else
      LogMessage('>>> COMPILER: ' + CleanMsg, lmtInfo);
  end
  else
  begin
    LogMessage('    COMPILER: ' + CleanMsg);
  end;
end;

procedure TfrmModernMain.LogSVNOutput(const Msg: string);
var
  CleanMsg: string;
begin
  CleanMsg := Trim(Msg);
  if (Pos('A   ', UpperCase(CleanMsg)) > 0) then
    LogMessage('   SVN: ' + CleanMsg, lmtSvnAdded)
  else if (Pos('D   ', UpperCase(CleanMsg)) > 0) then
    LogMessage('   SVN: ' + CleanMsg, lmtSvnDeleted)
  else if (Pos('U   ', UpperCase(CleanMsg)) > 0) then
    LogMessage('   SVN: ' + CleanMsg, lmtSvnUpdated)
  else if (Pos('C   ', UpperCase(CleanMsg)) > 0) then
    LogMessage('   SVN: ' + CleanMsg, lmtSvnConflict)
  else if (Pos('G   ', UpperCase(CleanMsg)) > 0) then
    LogMessage('   SVN: ' + CleanMsg, lmtSvnMerged)
  else if (Pos('E   ', UpperCase(CleanMsg)) > 0) then
    LogMessage('   SVN: ' + CleanMsg, lmtSvnExisted)
  else if (Pos('R   ', UpperCase(CleanMsg)) > 0) then
    LogMessage('   SVN: ' + CleanMsg, lmtSvnReplaced)
  else
    LogMessage('>>> SVN: ' + CleanMsg, lmtInfo);
end;

procedure TfrmModernMain.InitializeLogging;
var
  LogDir: string;
begin
  LogDir := TPath.Combine(ExtractFilePath(Application.ExeName), 'logs');
  if not TDirectory.Exists(LogDir) then
    TDirectory.CreateDirectory(LogDir);

  FLogFileName := TPath.Combine(LogDir,
    Format('modern_build_%s.log', [FormatDateTime('yyyymmdd_hhnnss', Now)]));
end;

function TfrmModernMain.IsImportantCompilerMessage(const Msg: string): Boolean;
begin
  Result := (Pos('error', LowerCase(Msg)) > 0) or
            (Pos('warning', LowerCase(Msg)) > 0) or
            (Pos('hint', LowerCase(Msg)) > 0) or
            (Pos('fatal', LowerCase(Msg)) > 0) or
            (Pos('failed', LowerCase(Msg)) > 0) or
            (Pos('succeeded', LowerCase(Msg)) > 0) or
            (Pos('building', LowerCase(Msg)) > 0) or
            (Pos('compiling', LowerCase(Msg)) > 0) or
            (Pos('linking', LowerCase(Msg)) > 0);
end;

procedure TfrmModernMain.UpdateStatus(const Status: string);
begin
  lblStatus.Caption := Status;
  if FIsBuilding then
    lblTime.Caption := 'Time: ' + FormatElapsedTime(FStartTime)
  else
    lblTime.Caption := '';
  Application.ProcessMessages;
end;

function TfrmModernMain.FormatElapsedTime(StartTime: TDateTime): string;
var
  Elapsed: TDateTime;
  Hours, Minutes, Seconds: Word;
begin
  Elapsed := Now - StartTime;
  Hours := Trunc(Elapsed * 24);
  Minutes := Trunc((Elapsed * 24 * 60)) mod 60;
  Seconds := Trunc((Elapsed * 24 * 60 * 60)) mod 60;
  Result := Format('%.2d:%.2d:%.2d', [Hours, Minutes, Seconds]);
end;

procedure TfrmModernMain.ShowNotification(const Title, Msg: string);
begin
  if chkShowNotifications.Checked then
  begin
    // Qui potresti implementare notifiche toast o balloon
    // Per ora usiamo un semplice messaggio nella status bar
    UpdateStatus(Msg);
  end;
end;

procedure TfrmModernMain.FormDestroy(Sender: TObject);
begin
  SaveSettings;
  
  FreeAndNil(FSubstManager);
  FreeAndNil(FConfig);
  
  if Assigned(FConfigManager) then
  begin
    while FConfigManager.Configurations.Count > 0 do
      FConfigManager.Configurations.Delete(0);
    FreeAndNil(FConfigManager);
  end;
  
  if Assigned(FRecConfig) then
    FRecConfig.ReleaseInstance;
end;

procedure TfrmModernMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.