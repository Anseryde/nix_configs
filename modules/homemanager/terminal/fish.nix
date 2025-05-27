{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    fish.enable =
      lib.mkEnableOption "enables fish";
  };
  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;
      shellInit = "
        starship init fish | source
        setenv VISUAL hx
      ";
    };
    home.packages = with pkgs; [
      starship
    ];
  };
}
