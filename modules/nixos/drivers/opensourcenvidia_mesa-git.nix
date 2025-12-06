{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    opensourcenvidia_mesa-git.enable =
      lib.mkEnableOption "enables opensourcenvidia_mesa-git";
  };
  config = lib.mkIf config.opensourcenvidia_mesa-git.enable {
    hardware.graphics.enable = true;
    boot.kernelParams = [
      "nouveau.config=NvGspRm=1"
    ];
    # chaotic.mesa-git.enable = true;
  };
}
