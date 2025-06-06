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
    ./programs/wezterm_noBG.nix
    ./terminal/fish.nix
    ./services/syncthing.nix
    ./services/git.nix
    ./programs/firefox.nix
    ./programs/vscode.nix
    ./terminal/yazi.nix
    ./services/mpd.nix
    ./terminal/rmpc.nix
  ];

  plasmacfg.enable =
    lib.mkDefault true;
  misc_dotfiles_src.enable =
    lib.mkDefault true;
  homemanager_packages.enable =
    lib.mkDefault true;
  wezterm.enable =
    lib.mkDefault true;
  fish.enable =
    lib.mkDefault true;
  git.enable =
    lib.mkDefault true;
  yazi.enable =
    lib.mkDefault true;
}
