{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    waydroid.enable =
      lib.mkEnableOption "enables waydroid";
  };
  config = lib.mkIf config.waydroid.enable {
    virtualisation.waydroid.enable = true;
    networking.nftables.enable = true;
    environment.systemPackages = [ pkgs.waydroid-helper ];
    systemd = {
      packages = [ pkgs.waydroid-helper ];
      services.waydroid-mount.wantedBy = [ "multi-user.target" ];
      user.targets.graphical-session.wants = [ "waydroid-monitor.service" ];
    };
  };
}
