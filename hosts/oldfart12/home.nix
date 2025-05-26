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
  #import modules
  imports = [./../../modules/homemanager];
  flatpak.enable = true;
  helix.enable = true;
  syncthing.enable = true;
  firefox.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}
