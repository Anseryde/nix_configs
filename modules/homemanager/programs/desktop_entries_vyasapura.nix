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
      meshroom = {
        name = "Meshroom";
        genericName = "photogrammetry scanning software";
        icon = "/mnt/Lexar_SSD/Meshroom-2025.1.0/Meshroom-logo-1024x896-3831460149.png";
        categories = [
          "Graphics"
        ];
        exec = "steam-run /mnt/Lexar_SSD/Meshroom-2025.1.0/Meshroom";
        startupNotify = false;
        terminal = false;
        type = "Application";
        settings = {
          Path = "/mnt/Lexar_SSD/Meshroom-2025.1.0";
          X-KDE-SubstituteUID = "false";
        };
      };
      unreal_engine_5_5_4 = {
        name = "Unreal Engine 5.5.4";
        genericName = "Game Engine";
        icon = "/mnt/Lexar_SSD/UE_5_5_4/Engine/Source/Runtime/Launch/Resources/Linux/UnrealEngine.png";
        exec = "steam-run /mnt/Lexar_SSD/UE_5_5_4/Engine/Binaries/Linux/UnrealEditor";
        startupNotify = false;
        type = "Application";
        terminal = false;
        categories = [
          "Development"
        ];
        settings = {
          MimeType = "application/uproject";
          X-KDE-SubstituteUID = "false";
          Keywords = "Unreal Engine;5.5.4";
          Path = "/mnt/Lexar_SSD/UE_5_5_4/Engine/Binaries/Linux";
        };
      };
    };
  };
}
