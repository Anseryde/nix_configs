{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    wezterm.enable =
      lib.mkEnableOption "enables wezterm";
  };
  config = lib.mkIf config.wezterm.enable {
    programs.wezterm = {
      enable = true;
      enableBashIntegration = true;
      extraConfig = ''
        local wezterm = require 'wezterm'
        local config = {}
        config.color_scheme = 'Ibm3270 (Gogh)'
        config.font = wezterm.font 'Courier Prime'
        config.font_size = 12.0
        config.enable_wayland = false
        config.enable_scroll_bar = true
        config.window_background_image = '/home/ryann/Pictures/NitW Backer Files/Wallpapers/NITW_Backer_Wallpapers.zip/Desktop/Emoticons/NITW_Emoticons_wide_2560x1440.png'
        config.window_background_image_hsb = {
          brightness = 0.1,

          -- You can adjust the hue by scaling its value.
          -- a multiplier of 1.0 leaves the value unchanged.
          hue = 1.0,

          -- You can adjust the saturation also.
          saturation = 1.0,
        }

        return config
      '';
    };
  };
}
