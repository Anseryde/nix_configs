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
    hardware.nvidia = {
      open = false; # Set to false to use the proprietary kernel module
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
    hardware.nvidia-container-toolkit.enable = true;
    environment.systemPackages = [pkgs.nvidia-container-toolkit];
  };
}
