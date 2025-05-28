
{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    nvidia-open-kernel-module.enable =
      lib.mkEnableOption "enables nvidia-open-kernel-module";
  };
  config = lib.mkIf config.nvidia-open-kernel-module.enable {
    # NVIDIA drivers
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [nvidia-vaapi-driver];
    };

    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      open = true; # Set to false to use the proprietary kernel module
      modesetting.enable = true;
      nvidiaSettings = true;
    };
  };
}
