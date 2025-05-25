{ config, pkgs,lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ryann";
  home.homeDirectory = "/home/ryann";
  #import modules
  imports = [ ./../../modules/homemanager ];
  flatpak.enable = true;
  helix.enable = true;
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName  = "Anseryde";
    userEmail = "ryanlupis@gmail.com";
    extraConfig = {
      credential = {
      	helper = "manager";
      	"https://github.com".username = "Anseryde";
      	credentialStore = "cache";
      };
      push = { autoSetupRemote = true; };
    };
  };
  programs.fish = {
  	enable = true;
  };
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" "en-GB" "zh-CN" "zh-TW" ];
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
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}
