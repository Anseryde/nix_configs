{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    yazi.enable =
      lib.mkEnableOption "enables yazi";
  };
  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableFishIntegration = true;
      plugins = {
        "git" = pkgs.yaziPlugins.git;
        "sudo" = pkgs.yaziPlugins.sudo;
        "chmod" = pkgs.yaziPlugins.chmod;
        "duckdb" = pkgs.yaziPlugins.duckdb;
        "full-border" = pkgs.yaziPlugins.full-border;
        "glow" = pkgs.yaziPlugins.glow;
        "restore" = pkgs.yaziPlugins.restore;
        "mediainfo" = pkgs.yaziPlugins.mediainfo;
        "starship" = pkgs.yaziPlugins.starship;
      };
    };
  };
}
