{ pkgs, lib, ... }:
{
  imports = [
    ./desktop_environment/plasmacfg.nix
    ./misc_dotfiles_src/misc_dotfiles_src.nix
  ];

  plasmacfg.enable =
    lib.mkDefault true;
}
