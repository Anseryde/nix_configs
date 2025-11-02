{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    devenv.enable =
      lib.mkEnableOption "enables devenv";
  };
  config = lib.mkIf config.devenv.enable {
    environment.systemPackages = with pkgs;[
      devenv
    ];
    nix.settings.trusted-users = [
      "root"
      "ryann"
    ];
  };
}
