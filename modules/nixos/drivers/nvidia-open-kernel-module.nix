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
    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;
    hardware.nvidia = {
      open = true; # Set to false to use the proprietary kernel module
      modesetting.enable = true;
      nvidiaPersistenced = true; 
      nvidiaSettings = true;
      powerManagement = {
        enable = true;
      };
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
    # hardware.nvidia-container-toolkit.enable = true;
    hardware.nvidia-container-toolkit = {
      enable =  true;
      extraArgs = [
        "--disable-hook"
        "create-symlinks"
      ];
      package = pkgs.nvidia-container-toolkit.overrideAttrs (old: {
        version = "git";
        src = pkgs.fetchFromGitHub {
          owner = "nvidia";
          repo = "nvidia-container-toolkit";
          rev = "f8daa5e26de9fd7eb79259040b6dd5a52060048c"; # v 1.18.0
          sha256 = "1lpd04ajyp1y7q6pdm0d8jqdxbjz8yq9iar5lmijkvnlw8vjw1sm";
        };
        postPatch = ''
          substituteInPlace internal/config/config.go \
            --replace-fail '/usr/bin/nvidia-container-runtime-hook' "$tools/bin/nvidia-container-runtime-hook" \
            --replace-fail '/sbin/ldconfig' '${pkgs.glibc.bin}/sbin/ldconfig'

          # substituteInPlace tools/container/toolkit/toolkit.go \
          #   --replace-fail '/sbin/ldconfig' '${pkgs.glibc.bin}/sbin/ldconfig'

          substituteInPlace cmd/nvidia-cdi-hook/update-ldcache/update-ldcache.go \
            --replace-fail '/sbin/ldconfig' '${pkgs.glibc.bin}/sbin/ldconfig'
        '';
      });
    };
    environment.systemPackages = [
      # pkgs.nvidia-container-toolkit
      pkgs.cudaPackages.cudatoolkit
      # pkgs.nvidia-docker
    ];
    # environment.etc."cdi/nvidia-container-toolkit.json".source = "/run/cdi/nvidia-container-toolkit.json"; 
  };
}
