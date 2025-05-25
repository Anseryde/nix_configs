{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./desktop_environment/plasmacfg.nix
    ./misc_dotfiles_src/misc_dotfiles_src.nix
    ./services/flatpak.nix
    ./terminal/helix.nix
    ./homemanager_packages.nix
    ./programs/wezterm.nix
  ];

  plasmacfg.enable =
    lib.mkDefault true;
  misc_dotfiles_src.enable =
    lib.mkDefault true;
  homemanager_packages.enable =
    lib.mkDefault true;
  wezterm.enable =
    lib.mkDefault true;
}
