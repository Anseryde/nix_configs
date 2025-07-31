{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    desktop_entries_vyasapura.enable =
      lib.mkEnableOption "enables desktop_entries_vyasapura";
  };
  config = lib.mkIf config.desktop_entries_vyasapura.enable {
    xdg.desktopEntries = {
      armorpaint = {
        name = "ArmorPaint";
        genericName = "PBR Texture Painter";
        exec = "nvidia-offload steam-run /home/ryann/ArmorPaint/ArmorPaint %U";
        terminal = false;
        categories = [
          "Graphics"
          "Development"
          "3DGraphics"
        ];
        type = "Application";
        icon = "/home/ryann/ArmorPaint/icon.png";
        mimeType = [
          "application/x-arm"
          "application/x-blender"
        ];
        settings = {
          # StartupWMClass = "ArmorPaint";
          # Version = "0.9";
          X-KDE-SubstituteUID = "false";
        };
      };
      wonderdraft = {
        name = "Wonderdraft";
        genericName = "Map Maker";
        icon = "/home/ryann/Wonderdraft/Wonderdraft.png";
        categories = [
          "Graphics"
        ];
        exec = "nvidia-offload nix-alien-ld /home/ryann/Wonderdraft/Wonderdraft.x86_64 %U";
        mimeType = [
          "application/x-wonderdraft_map"
        ];
        startupNotify = true;
        terminal = false;
        type = "Application";
        settings = {  
          # Version = "1.1.8.2";
          Path = "/home/ryann/Wonderdraft";
          # TerminalOptions = "";
          X-KDE-SubstituteUID = "false";
        };
      };
    };
  };
}
