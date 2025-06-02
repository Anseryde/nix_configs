{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    syncthing.enable =
      lib.mkEnableOption "enables syncthing";
  };
  config = lib.mkIf config.syncthing.enable {
    services.syncthing = {
      enable = true;
      settings = {
        devices = {
          "SM-G781B" = { id = "5HJT7HM-EM5YKX2-WODZXEQ-23XQWVY-2X2LDOF-4VDZYDC-QFUWKJH-3JISXAR"; };
        };
        folders = {
          "Synced Music" = {
            id = "edide-wfgxv";
            path = "/home/ryann/Music";
            devices = [ "SM-G781B" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "7";
            };
          };
          "Obsidian" = {
            id = "ory6u-xp2zs";
            path = "/home/ryann/Documents/Obsidian";
            devices = [ "SM-G781B" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "7";
            };
          };
          "Calibre Library" = {
            id = "qgpzw-gplks";
            path = "/home/ryann/Documents/Calibre Library";
            devices = [ "SM-G781B" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "7";
            };
          };
          "Portable Tablet Art" = {
            id = "2lznr-iaa66";
            path = "/home/ryann/Documents/Art/Krita/Portable Tablet Art";
            devices = [ "SM-G781B" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "7";
            };
          };
          "KeePass" = {
            id = "kp25-va";
            path = "/home/ryann/KeePass";
            devices = [ "SM-G781B" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "7";
            };
          };
        };
        gui = {
          user = "ryanlupis";
        };
        options = {
          listenAddresses = [
            "default"
          ];
        };
      };
    };
  };
}
