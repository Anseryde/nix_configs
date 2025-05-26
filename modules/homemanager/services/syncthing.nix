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
      options = {
        listenAddresses = [
          "default"
        ];
      };
    };
  };
}
