{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    rmpc.enable =
      lib.mkEnableOption "enables rmpc";
  };
  config = lib.mkIf config.rmpc.enable {
    home.packages = with pkgs; [
      rmpc
    ];
  };
}
