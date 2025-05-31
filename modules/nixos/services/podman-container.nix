{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    podman-container.enable =
      lib.mkEnableOption "enables podman-container";
  };
  config = lib.mkIf config.podman-container.enable {
    virtualisation.oci-containers = {
      backend = "podman";
      containers = {
        maya2024 = {
          image = "quay.io/toolbx-images/rockylinux-toolbox:9";
          autoStart = true;
          extraOptions = ["--devices nvidia.com/gpus=all"];
        };
      };
    };
  };
}
