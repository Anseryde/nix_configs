{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    firefox.enable =
      lib.mkEnableOption "enables firefox";
  };
  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-bin; 
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
      nativeMessagingHosts = [pkgs.keepassxc];
      # setting profile via home-manager breaks keepassxc for some reason
      # profiles = {
      #   user = {
      #     search = {
      #       force = true;
      #       default = "ddg";
      #       privateDefault = "ddg";
      #     };
      #     settings = {
      #       "sidebar.revamp" = true;
      #       "sidebar.verticalTabs" = true;
      #       "sidebar.visibility" = "expand-on-hover";
      #       "widget.use-xdg-desktop-portal.file-picker" = 1;
      #       "widget.use-xdg-desktop-portal.location" = 1;
      #       "widget.use-xdg-desktop-portal.mime-handler" = 1;
      #       "widget.use-xdg-desktop-portal.native-messaging" = 1;
      #       "widget.use-xdg-desktop-portal.open-uri" = 1;
      #       "widget.use-xdg-desktop-portal.settings" = 1;
      #     };
      #   };
      # };
    };
  };
}
