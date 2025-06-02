{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    swap.enable =
      lib.mkEnableOption "enables swap";
  };
  config = lib.mkIf config.swap.enable {
    # boot.kernal.sysctl = {
    #   "vm.swappiness" = 60;
    # };
    zramSwap = {
      enable = true;
    };
  };
}
