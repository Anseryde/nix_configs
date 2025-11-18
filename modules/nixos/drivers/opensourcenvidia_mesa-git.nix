{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    opensourcenvidia.enable =
      lib.mkEnableOption "enables opensourcenvidia";
  };
  config = lib.mkIf config.opensourcenvidia.enable {
    hardware.graphics.enable = true;
    boot.kernelParams = [
      "nouveau.config=NvGspRm=1"
    ];
    chaotic.mesa-git.enable = true;
  };
}
