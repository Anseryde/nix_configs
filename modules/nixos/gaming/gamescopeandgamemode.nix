{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    gamescopeandgamemode.enable =
      lib.mkEnableOption "enables gamescopeandgamemode";
  };
  config = lib.mkIf config.gamescopeandgamemode.enable {
    programs.gamescope = {
      enable = true;
      # capSysNice = true;
    };
    programs.gamemode.enable = true;
  };
}
