{ pkgs, lib, config, ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    misc_dotfiles_src.enable =
  	  lib.mkEnableOption "enables misc_dotfiles_src";
  };
  config = lib.mkIf config.misc_dotfiles_src.enable {
    xdg.configFile."OpenTabletDriver" = {
      source = ./OpenTabletDriver;
      recursive = true;
    };
  };
}
