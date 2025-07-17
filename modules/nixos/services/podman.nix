
{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    podman.enable =
      lib.mkEnableOption "enables podman";
  };
  config = lib.mkIf config.podman.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork = {
        settings = {
          dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
        };
      };
    };
  };
}
