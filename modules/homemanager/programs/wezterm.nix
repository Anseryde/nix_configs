{ pkgs, lib, config, ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
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

        return config
      '';
    };
  };
}
