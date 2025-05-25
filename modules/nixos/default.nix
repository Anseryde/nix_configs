{ pkgs, lib, ... }:
{
  imports = [
    ./nixos_pkgs.nix
    ./language/fcitx.nix
  ];

  nixos_pkgs.enable =
    lib.mkDefault true;
  fcitx.enable =
    lib.mkDefault true;
}
