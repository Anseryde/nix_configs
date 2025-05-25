{ pkgs, lib, ... }:
{
  imports = [
    ./desktop_environment/plasmacfg.nix
    ./misc_dotfiles_src/misc_dotfiles_src.nix
    ./services/flatpak.nix
  ];

  plasmacfg.enable =
    lib.mkDefault true;
  misc_dotfiles_src.enable =
    lib.mkDefault true;
}
