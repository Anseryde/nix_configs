{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    texlive.enable =
      lib.mkEnableOption "enables texlive";
  };
  config = lib.mkIf config.texlive.enable {
    home.packages = with pkgs; [
      texliveFull
      texlive.combined.scheme-full
    ];
  };
}
