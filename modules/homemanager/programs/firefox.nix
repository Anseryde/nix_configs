{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    exemplar_modular_module.enable =
      lib.mkEnableOption "enables exemplar_modular_module";
  };
  config = lib.mkIf config.exemplar_modular_module.enable {
    programs.firefox = {
      enable = true;
      languagePacks = ["en-US" "en-GB" "zh-CN" "zh-TW"];
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = false;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
      profiles = {
        user = {
          search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";
          };
          settings = {
            "sidebar.revamp" = true;
            "sidebar.verticalTabs" = true;
            "sidebar.visibility" = "expand-on-hover";
            "widget.use-xdg-desktop-portal.file-picker" = 1;
            "widget.use-xdg-desktop-portal.location" = 1;
            "widget.use-xdg-desktop-portal.mime-handler" = 1;
            "widget.use-xdg-desktop-portal.native-messaging" = 1;
            "widget.use-xdg-desktop-portal.open-uri" = 1;
            "widget.use-xdg-desktop-portal.settings" = 1;
          };
        };
      };
    };
  };
}
