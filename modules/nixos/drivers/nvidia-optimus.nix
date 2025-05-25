{ pkgs, lib, config, ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    nvidia-optimus.enable =
  	  lib.mkEnableOption "enables nvidia-optimus";
  };
  config = lib.mkIf config.nvidia-optimus.enable {
    hardware.nvidia = {
      prime = {
        offload = {
        enable = true;
        enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        #amdgpuBusId = "PCI:54:0:0"; # If you have an AMD iGPU
      };
    };
  };
}
