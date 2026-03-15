object frmModernMain: TfrmModernMain
  Left = 0
  Top = 0
  Caption = 'Choice Builder - Modern Interface'
  ClientHeight = 757
  ClientWidth = 1200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1200
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object lblTitle: TLabel
      Left = 16
      Top = 8
      Width = 111
      Height = 21
      Caption = 'Choice Builder'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVersion: TLabel
      Left = 16
      Top = 32
      Width = 38
      Height = 13
      Caption = 'v3.1.2.7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnMinimize: TcxButton
      Left = 1100
      Top = 8
      Width = 40
      Height = 25
      Action = actMinimize
      TabOrder = 0
    end
    object btnClose: TcxButton
      Left = 1150
      Top = 8
      Width = 40
      Height = 25
      Action = actClose
      TabOrder = 1
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 60
    Width = 1200
    Height = 657
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 700
    object pnlNavigation: TPanel
      Left = 0
      Top = 0
      Width = 150
      Height = 657
      Align = alLeft
      BevelOuter = bvLowered
      Color = clBtnShadow
      ParentBackground = False
      TabOrder = 0
      ExplicitHeight = 700
      object btnBuild: TcxButton
        Left = 8
        Top = 16
        Width = 134
        Height = 40
        Action = actBuild
        LookAndFeel.SkinName = 'Blue'
        TabOrder = 0
      end
      object btnDrives: TcxButton
        Left = 8
        Top = 64
        Width = 134
        Height = 40
        Action = actDrives
        LookAndFeel.SkinName = 'Blue'
        TabOrder = 1
      end
      object btnDatabase: TcxButton
        Left = 8
        Top = 112
        Width = 134
        Height = 40
        Action = actDatabase
        LookAndFeel.SkinName = 'Blue'
        TabOrder = 2
      end
      object btnUtilities: TcxButton
        Left = 8
        Top = 160
        Width = 134
        Height = 40
        Action = actUtilities
        LookAndFeel.SkinName = 'Blue'
        TabOrder = 3
      end
      object btnSettings: TcxButton
        Left = 8
        Top = 208
        Width = 134
        Height = 40
        Action = actSettings
        LookAndFeel.SkinName = 'Blue'
        TabOrder = 4
      end
    end
    object pcMain: TPageControl
      Left = 150
      Top = 0
      Width = 1050
      Height = 657
      ActivePage = tsBuild
      Align = alClient
      Style = tsButtons
      TabOrder = 1
      TabStop = False
      ExplicitHeight = 700
      object tsBuild: TTabSheet
        Caption = 'Build'
        ExplicitHeight = 669
        object pnlBuildConfig: TPanel
          Left = 0
          Top = 0
          Width = 1042
          Height = 120
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object lblBuildConfig: TLabel
            Left = 16
            Top = 8
            Width = 76
            Height = 13
            Caption = 'Configuration:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbConfiguration: TComboBox
            Left = 16
            Top = 24
            Width = 120
            Height = 21
            Style = csDropDownList
            TabOrder = 0
          end
          object gbBuildOptions: TGroupBox
            Left = 160
            Top = 8
            Width = 400
            Height = 100
            Caption = 'Build Options'
            TabOrder = 1
            object chkVerbose: TCheckBox
              Left = 16
              Top = 20
              Width = 97
              Height = 17
              Caption = 'Verbose Output'
              TabOrder = 0
            end
            object chkCleanFirst: TCheckBox
              Left = 16
              Top = 40
              Width = 97
              Height = 17
              Caption = 'Clean First'
              TabOrder = 1
            end
            object chkShowCompilerOutput: TCheckBox
              Left = 16
              Top = 60
              Width = 130
              Height = 17
              Caption = 'Show Compiler Output'
              TabOrder = 2
            end
            object chkDelphiOff: TCheckBox
              Left = 200
              Top = 20
              Width = 120
              Height = 17
              Caption = 'Kill Delphi if Running'
              TabOrder = 3
            end
          end
        end
        object pnlBuildButtons: TPanel
          Left = 0
          Top = 120
          Width = 1042
          Height = 100
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 1
          object btnFastBuild: TcxButton
            Left = 16
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Fast Build'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 0
            OnClick = btnFastBuildClick
          end
          object btnNormalBuild: TcxButton
            Left = 150
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Normal Build'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 1
            OnClick = btnNormalBuildClick
          end
          object btnPackageBuild: TcxButton
            Left = 284
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Package Build'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 2
            OnClick = btnPackageBuildClick
          end
          object btnModuleBuild: TcxButton
            Left = 418
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Module Build'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 3
            OnClick = btnModuleBuildClick
          end
          object btnServiceBuild: TcxButton
            Left = 552
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Service Build'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 4
            OnClick = btnServiceBuildClick
          end
          object btnCustomBuild: TcxButton
            Left = 686
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Custom Build...'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 5
            OnClick = btnCustomBuildClick
          end
        end
        object pnlProgress: TPanel
          Left = 0
          Top = 220
          Width = 1042
          Height = 60
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 2
          object lblStatus: TLabel
            Left = 16
            Top = 8
            Width = 31
            Height = 13
            Caption = 'Ready'
          end
          object lblTime: TLabel
            Left = 16
            Top = 40
            Width = 26
            Height = 13
            Caption = 'Time:'
          end
          object lblProgress: TLabel
            Left = 200
            Top = 8
            Width = 47
            Height = 13
            Caption = 'Progress:'
          end
          object lblSubProgress: TLabel
            Left = 200
            Top = 40
            Width = 70
            Height = 13
            Caption = 'Sub Progress:'
          end
          object progressBar: TProgressBar
            Left = 260
            Top = 8
            Width = 300
            Height = 17
            TabOrder = 0
          end
          object progressBarSub: TProgressBar
            Left = 280
            Top = 40
            Width = 280
            Height = 17
            TabOrder = 1
          end
        end
        object pnlLog: TPanel
          Left = 0
          Top = 280
          Width = 1042
          Height = 346
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 3
          ExplicitHeight = 389
          DesignSize = (
            1042
            346)
          object lblLog: TLabel
            Left = 16
            Top = 8
            Width = 23
            Height = 13
            Caption = 'Log:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object memoLog: TRichEdit
            Left = 16
            Top = 40
            Width = 1010
            Height = 257
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clLime
            Font.Height = -11
            Font.Name = 'Consolas'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            Zoom = 100
            ExplicitHeight = 300
          end
          object pnlLogControls: TPanel
            Left = 16
            Top = 307
            Width = 1010
            Height = 30
            Anchors = [akLeft, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitTop = 350
            object btnClearLog: TcxButton
              Left = 0
              Top = 0
              Width = 80
              Height = 25
              Action = actClearLog
              TabOrder = 0
            end
            object btnSaveLog: TcxButton
              Left = 90
              Top = 0
              Width = 80
              Height = 25
              Action = actSaveLog
              TabOrder = 1
            end
            object btnAutoScroll: TcxButton
              Left = 180
              Top = 0
              Width = 100
              Height = 25
              Caption = 'Auto Scroll: ON'
              TabOrder = 2
              OnClick = btnAutoScrollClick
            end
          end
        end
      end
      object tsDrives: TTabSheet
        Caption = 'Drives'
        ImageIndex = 1
        ExplicitHeight = 669
        object pnlDriveConfig: TPanel
          Left = 0
          Top = 0
          Width = 1042
          Height = 80
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object lblDriveConfig: TLabel
            Left = 16
            Top = 8
            Width = 103
            Height = 13
            Caption = 'Drive Management:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDriveLetter: TLabel
            Left = 16
            Top = 32
            Width = 61
            Height = 13
            Caption = 'Drive Letter:'
          end
          object edtDriveLetter: TEdit
            Left = 90
            Top = 28
            Width = 30
            Height = 21
            MaxLength = 1
            TabOrder = 0
            Text = 'S'
          end
        end
        object pnlDriveList: TPanel
          Left = 0
          Top = 80
          Width = 1042
          Height = 357
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitHeight = 400
          DesignSize = (
            1042
            357)
          object lblMappedDrives: TLabel
            Left = 16
            Top = 8
            Width = 82
            Height = 13
            Caption = 'Mapped Drives:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbDrive: TListBox
            Left = 16
            Top = 32
            Width = 600
            Height = 257
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Consolas'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            ExplicitHeight = 300
          end
        end
        object pnlDriveButtons: TPanel
          Left = 0
          Top = 437
          Width = 1042
          Height = 189
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 2
          ExplicitTop = 480
          object btnAddDrive: TcxButton
            Left = 16
            Top = 16
            Width = 100
            Height = 30
            Caption = 'Add Drive'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 0
            OnClick = btnAddDriveClick
          end
          object btnRemoveDrive: TcxButton
            Left = 130
            Top = 16
            Width = 100
            Height = 30
            Caption = 'Remove Drive'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 1
            OnClick = btnRemoveDriveClick
          end
          object btnRefreshDrives: TcxButton
            Left = 244
            Top = 16
            Width = 100
            Height = 30
            Caption = 'Refresh'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 2
            OnClick = btnRefreshDrivesClick
          end
          object btnManageDrives: TcxButton
            Left = 358
            Top = 16
            Width = 120
            Height = 30
            Caption = 'Advanced Manage...'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 3
            OnClick = btnManageDrivesClick
          end
        end
      end
      object tsDatabase: TTabSheet
        Caption = 'Database'
        ImageIndex = 2
        ExplicitHeight = 669
        object pnlDatabaseInfo: TPanel
          Left = 0
          Top = 0
          Width = 1042
          Height = 300
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            1042
            300)
          object lblDatabaseInfo: TLabel
            Left = 16
            Top = 8
            Width = 86
            Height = 13
            Caption = 'Database Status:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSession: TLabel
            Left = 16
            Top = 250
            Width = 56
            Height = 13
            Caption = 'Session ID:'
          end
          object memoDatabaseInfo: TMemo
            Left = 16
            Top = 32
            Width = 600
            Height = 200
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Consolas'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
          object eSession: TEdit
            Left = 80
            Top = 246
            Width = 200
            Height = 21
            TabOrder = 1
          end
        end
        object pnlDatabaseButtons: TPanel
          Left = 0
          Top = 300
          Width = 1042
          Height = 326
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitHeight = 369
          object btnCheckVersion: TcxButton
            Left = 16
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Check Version'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 0
            OnClick = btnCheckVersionClick
          end
          object btnCheckSession: TcxButton
            Left = 150
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Check Session'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 1
            OnClick = btnCheckSessionClick
          end
          object btnChangePassword: TcxButton
            Left = 284
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Change Password'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 2
            OnClick = btnChangePasswordClick
          end
          object btnDatabaseConfig: TcxButton
            Left = 418
            Top = 16
            Width = 120
            Height = 35
            Caption = 'Database Config'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 3
            OnClick = btnDatabaseConfigClick
          end
        end
      end
      object tsUtilities: TTabSheet
        Caption = 'Utilities'
        ImageIndex = 3
        ExplicitHeight = 669
        object pnlUtilityButtons: TPanel
          Left = 0
          Top = 0
          Width = 1042
          Height = 200
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object btnXMLConverter: TcxButton
            Left = 16
            Top = 16
            Width = 120
            Height = 50
            Caption = 'XML Converter'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 0
            OnClick = btnXMLConverterClick
          end
          object btnSQLFormatter: TcxButton
            Left = 150
            Top = 16
            Width = 120
            Height = 50
            Caption = 'SQL Formatter'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 1
            OnClick = btnSQLFormatterClick
          end
          object btnVersionUpdater: TcxButton
            Left = 284
            Top = 16
            Width = 120
            Height = 50
            Caption = 'Version Updater'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 2
            OnClick = btnVersionUpdaterClick
          end
          object btnSVNTools: TcxButton
            Left = 418
            Top = 16
            Width = 120
            Height = 50
            Caption = 'SVN Tools'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 3
            OnClick = btnSVNToolsClick
          end
        end
        object pnlVersionUpdate: TPanel
          Left = 0
          Top = 200
          Width = 1042
          Height = 426
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          Visible = False
          ExplicitHeight = 469
          object gbVersionInfo: TGroupBox
            Left = 16
            Top = 16
            Width = 500
            Height = 200
            Caption = 'Version Information'
            TabOrder = 0
            object lblMajor: TLabel
              Left = 16
              Top = 32
              Width = 33
              Height = 13
              Caption = 'Major:'
            end
            object lblMinor: TLabel
              Left = 16
              Top = 64
              Width = 34
              Height = 13
              Caption = 'Minor:'
            end
            object lblRelease: TLabel
              Left = 16
              Top = 96
              Width = 42
              Height = 13
              Caption = 'Release:'
            end
            object lblBuild: TLabel
              Left = 16
              Top = 128
              Width = 30
              Height = 13
              Caption = 'Build:'
            end
            object lblAdditionalInfo: TLabel
              Left = 200
              Top = 32
              Width = 81
              Height = 13
              Caption = 'Additional Info:'
            end
            object eMajor: TSpinEdit
              Left = 70
              Top = 28
              Width = 60
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 0
              Value = 3
            end
            object eMinor: TSpinEdit
              Left = 70
              Top = 60
              Width = 60
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 1
              Value = 1
            end
            object eRelease: TSpinEdit
              Left = 70
              Top = 92
              Width = 60
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 2
              Value = 2
            end
            object eBuild: TSpinEdit
              Left = 70
              Top = 124
              Width = 60
              Height = 22
              MaxValue = 9999
              MinValue = 0
              TabOrder = 3
              Value = 7
            end
            object eAdditionalVersionInfo: TEdit
              Left = 200
              Top = 48
              Width = 280
              Height = 21
              TabOrder = 4
              Text = 'Choice Builder'
            end
            object btnUpdateVersion: TcxButton
              Left = 200
              Top = 120
              Width = 120
              Height = 35
              Caption = 'Update Version'
              LookAndFeel.SkinName = 'Blue'
              TabOrder = 5
              OnClick = btnUpdateVersionClick
            end
          end
        end
      end
      object tsSettings: TTabSheet
        Caption = 'Settings'
        ImageIndex = 4
        ExplicitHeight = 669
        object pnlSettingsContent: TPanel
          Left = 0
          Top = 0
          Width = 1042
          Height = 557
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          ExplicitHeight = 600
          object gbPaths: TGroupBox
            Left = 16
            Top = 16
            Width = 600
            Height = 200
            Caption = 'Application Paths'
            TabOrder = 0
            object lblBOSPath: TLabel
              Left = 16
              Top = 32
              Width = 51
              Height = 13
              Caption = 'BOS Path:'
            end
            object lblAPPBOSPath: TLabel
              Left = 16
              Top = 64
              Width = 70
              Height = 13
              Caption = 'APPBOS Path:'
            end
            object lblAlonePath: TLabel
              Left = 16
              Top = 96
              Width = 59
              Height = 13
              Caption = 'Alone Path:'
            end
            object lblSQLServer: TLabel
              Left = 16
              Top = 128
              Width = 56
              Height = 13
              Caption = 'SQL Server:'
            end
            object edtBOSPath: TEdit
              Left = 100
              Top = 28
              Width = 400
              Height = 21
              TabOrder = 0
            end
            object btnBrowseBOS: TcxButton
              Left = 510
              Top = 26
              Width = 30
              Height = 25
              Caption = '...'
              TabOrder = 1
            end
            object edtAPPBOSPath: TEdit
              Left = 100
              Top = 60
              Width = 400
              Height = 21
              TabOrder = 2
            end
            object btnBrowseAPPBOS: TcxButton
              Left = 510
              Top = 58
              Width = 30
              Height = 25
              Caption = '...'
              TabOrder = 3
            end
            object edtAlonePath: TEdit
              Left = 100
              Top = 92
              Width = 400
              Height = 21
              TabOrder = 4
            end
            object btnBrowseAlone: TcxButton
              Left = 510
              Top = 90
              Width = 30
              Height = 25
              Caption = '...'
              TabOrder = 5
            end
            object edtSQLServer: TEdit
              Left = 100
              Top = 124
              Width = 200
              Height = 21
              TabOrder = 6
            end
          end
          object gbOptions: TGroupBox
            Left = 16
            Top = 240
            Width = 400
            Height = 150
            Caption = 'Application Options'
            TabOrder = 1
            object chkAutoConvert: TCheckBox
              Left = 16
              Top = 32
              Width = 150
              Height = 17
              Caption = 'Auto Convert XML/SQL'
              TabOrder = 0
            end
            object chkStartMinimized: TCheckBox
              Left = 16
              Top = 56
              Width = 150
              Height = 17
              Caption = 'Start Minimized'
              TabOrder = 1
            end
            object chkShowNotifications: TCheckBox
              Left = 16
              Top = 80
              Width = 150
              Height = 17
              Caption = 'Show Notifications'
              TabOrder = 2
            end
          end
        end
        object pnlSettingsButtons: TPanel
          Left = 0
          Top = 557
          Width = 1042
          Height = 69
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitTop = 600
          object btnSaveSettings: TcxButton
            Left = 16
            Top = 16
            Width = 100
            Height = 35
            Caption = 'Save Settings'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 0
            OnClick = btnSaveSettingsClick
          end
          object btnResetSettings: TcxButton
            Left = 130
            Top = 16
            Width = 100
            Height = 35
            Caption = 'Reset Settings'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 1
            OnClick = btnResetSettingsClick
          end
          object btnImportSettings: TcxButton
            Left = 244
            Top = 16
            Width = 100
            Height = 35
            Caption = 'Import Settings'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 2
            OnClick = btnImportSettingsClick
          end
          object btnExportSettings: TcxButton
            Left = 358
            Top = 16
            Width = 100
            Height = 35
            Caption = 'Export Settings'
            LookAndFeel.SkinName = 'Blue'
            TabOrder = 3
            OnClick = btnExportSettingsClick
          end
        end
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 717
    Width = 1200
    Height = 40
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitTop = 760
  end
  object ActionList: TActionList
    Left = 200
    Top = 100
    object actBuild: TAction
      Caption = 'Build'
      OnExecute = actBuildExecute
    end
    object actDrives: TAction
      Caption = 'Drives'
      OnExecute = actDrivesExecute
    end
    object actDatabase: TAction
      Caption = 'Database'
      OnExecute = actDatabaseExecute
    end
    object actUtilities: TAction
      Caption = 'Utilities'
      OnExecute = actUtilitiesExecute
    end
    object actSettings: TAction
      Caption = 'Settings'
      OnExecute = actSettingsExecute
    end
    object actClearLog: TAction
      Caption = 'Clear Log'
      OnExecute = actClearLogExecute
    end
    object actSaveLog: TAction
      Caption = 'Save Log'
      OnExecute = actSaveLogExecute
    end
    object actMinimize: TAction
      Caption = '_'
      OnExecute = actMinimizeExecute
    end
    object actClose: TAction
      Caption = 'X'
      OnExecute = actCloseExecute
    end
  end
  object ImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 6553700
  end
  object saveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = 
      'Text Files (*.txt)|*.txt|Log Files (*.log)|*.log|All Files (*.*)' +
      '|*.*'
    Left = 300
    Top = 100
  end
  object openDialog: TOpenDialog
    Filter = 'INI Files (*.ini)|*.ini|All Files (*.*)|*.*'
    Left = 350
    Top = 100
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=master'
      'User_Name=sa'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 400
    Top = 100
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    db.name AS DatabaseName,'
      '    CASE '
      '        WHEN db.name = '#39'master'#39' THEN '#39'System Database'#39
      '        WHEN db.name = '#39'model'#39' THEN '#39'System Database'#39
      '        WHEN db.name = '#39'msdb'#39' THEN '#39'System Database'#39
      '        WHEN db.name = '#39'tempdb'#39' THEN '#39'System Database'#39
      '        ELSE '#39'User Database'#39
      '    END AS DatabaseType,'
      '    db.compatibility_level AS CompatibilityLevel,'
      '    db.collation_name AS Collation'
      'FROM sys.databases db'
      'WHERE db.database_id > 4  -- Exclude system databases'
      'ORDER BY db.name;')
    Left = 450
    Top = 100
  end
  object CDSPath: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 500
    Top = 100
  end
end
