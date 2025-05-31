{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    mpd.enable =
      lib.mkEnableOption "enables mpd";
  };
  config = lib.mkIf config.mpd.enable {
    services.mpd = {
      enable = true;
      network = {
        startWhenNeeded = true;
        listenAddress = "any";
      };
    };
  };
}
