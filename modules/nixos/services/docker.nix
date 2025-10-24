{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    docker.enable =
      lib.mkEnableOption "enables docker";
  };
  config = lib.mkIf config.docker.enable {
    # Docker for distrobox
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      daemon.settings = {
        data-root = "/mnt/Lexar_SSD/docker";
      };
      # enableNvidia = true;
      # rootless = {
      #   enable = true;
      #   setSocketVariable = true;
      # };
    };
  };
}
