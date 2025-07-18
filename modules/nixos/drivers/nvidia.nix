{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    nvidia.enable =
      lib.mkEnableOption "enables nvidia";
  };
  config = lib.mkIf config.nvidia.enable {
    # NVIDIA drivers
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [nvidia-vaapi-driver];
    };

    services.xserver.videoDrivers = ["nvidia"];
    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;
    hardware.nvidia = {
      open = false; # Set to false to use the proprietary kernel module
      modesetting.enable = true;
      nvidiaPersistenced = true;
      nvidiaSettings = true;
      powerManagement = {
        enable = true;
      };
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
    hardware.nvidia-container-toolkit.enable = true;
    environment.systemPackages = [pkgs.nvidia-container-toolkit];
    environment.etc."cdi/nvidia-container-toolkit.json".source = "/run/cdi/nvidia-container-toolkit.json"; 
  };
}
