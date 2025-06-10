{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    keepassxc.enable =
      lib.mkEnableOption "enables keepassxc";
  };
  config = lib.mkIf config.keepassxc.enable {
    programs.keepassxc = {
      enable = true;
      settings = {
        Browser.Enabled = true;
        General = {
          BackupBeforeSave = true;
          ConfigVersion = 2;
          MinimizeAfterUnlock = false;
          OpenURLOnDoubleClick = false;          
        };
        FdoSecrets = {
          Enabled = true;
          ShowNotification = true;
          ConfirmDeleteItem = true;
          ConfirmAccessItem = true;
          UnlockBeforeSearch = true;
        };
        GUI = {
          AdvancedSettings = true;
          ApplicationTheme = "dark";
          ColorPasswords = true;
          CompactMode = true;
          HidePasswords = true;
          MinimizeOnStartup = true;
          LaunchAtStartup = true;
          ShowTrayIcon = true;
          MinimizeToTray = true;
          TrayIconAppearance = "monochrome-light";
        };
        PasswordGenerator = {
          AdvancedMode = false;
          EASCII = false;
          Length = 32;
          Logograms = true;
          SpecialChars = true;
          Type = 1;
          WordCount = 6;
          WordSeparator = "-";
        };
        Security = {
          ClearSearch = true;
          ClearSearchTimeout = 2;
          EnableCopyOnDoubleClick = true;
          IconDownloadFallback = true;
          LockDatabaseIdle = true;
          LockDatabaseIdleSeconds = 120;
          NoConfirmMoveEntryToRecycleBin = false;
        };
      };
    };
    services.pass-secret-service.enable = true;
  };
}
