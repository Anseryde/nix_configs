{ pkgs, lib, config, ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    msi-ec.enable =
  	  lib.mkEnableOption "enables msi-ec";
  };
  config = lib.mkIf config.msi-ec.enable {
    boot.extraModulePackages = [ config.boot.kernelPackages.msi-ec ];
    boot.kernelModules = [ "msi-ec" ];
  };
}
