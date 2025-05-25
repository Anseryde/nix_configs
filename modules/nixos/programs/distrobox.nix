{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    distrobox.enable =
      lib.mkEnableOption "enables distrobox";
  };
  config = lib.mkIf config.distrobox.enable {
    environment.systemPackages = with pkgs; [
      distrobox
    ];
  };
}
