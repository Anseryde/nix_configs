
{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    printing.enable =
      lib.mkEnableOption "enables printing";
  };
  config = lib.mkIf config.printing.enable {
    # Enable CUPS to print documents.
    services.printing = {
      enable = true;
      drivers = [
        pkgs.epson-escpr
      ];
    };
    hardware.sane = {
      enable = true;
      extraBackends = [
        pkgs.sane-airscan
        pkgs.epsonscan2
      ];
    };
    environment.systemPackages =  with pkgs; [
      epson-escpr
      epsonscan2
      kdePackages.skanpage
    ];
  };
}
