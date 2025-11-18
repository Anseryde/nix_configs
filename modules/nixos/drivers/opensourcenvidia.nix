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
    # hardware.graphics.enable = true;
    hardware.graphics = {
      enable = true;
      package = pkgs.mesa.overrideAttrs (previousAttrs: {
        patches = previousAttrs.patches ++ [./37898.patch];
      });
    };
    boot.kernelParams = [
      "nouveau.config=NvGspRm=1"
    ];
  };
}
