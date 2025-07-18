{
  config,
  pkgs,
  lib,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ryann";
  home.homeDirectory = "/home/ryann";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";
  # import modules
  # for full list of modules, as well as default modules, view nix-configs/modules/homemanager/default.nix
  imports = [./../../modules/homemanager];
  flatpak.enable = true;
  helix.enable = true;
  syncthing.enable = true;
  firefox.enable = true;
  vscode.enable = true;
  mpd.enable = true;
  rmpc.enable = true;
  wezterm.enable = false;
  wezterm_noBG.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  xdg.userDirs.enable = true;
  # for distrobox and I'm too lazy to modularise this
  home.file.".distroboxrc".text = ''
    xhost +si:localuser:$USER >/dev/null
  '';
}
