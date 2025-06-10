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
        General.BackupBeforeSave = true;
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
          CompactMode = true;
          HidePasswords = true;
          LaunchAtStartup = true;
          ShowTrayIcon = true;
          MinimizeToTray = true;
        };
        Security = {
          ClearSearch = true;
          ClearSearchTimeout = 2;
          LockDatabaseIdle = true;
          LockDatabaseIdleSeconds = 120;
        };
      };
    };
    services.pass-secret-service.enable = true;
  };
}
