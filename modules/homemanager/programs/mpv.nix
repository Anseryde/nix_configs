{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    mpv.enable =
      lib.mkEnableOption "enables mpv";
  };
  config = lib.mkIf config.mpv.enable {
    programs.mpv = {
      enable = true;
      scripts = [
        pkgs.mpvScripts.uosc
      ];
      # config = {
        
      # };
    };
  };
}
