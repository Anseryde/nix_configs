{ pkgs, lib, ... }:
{
  imports = [
    ./nixos_pkgs.nix
  ];

  nixos_pkgs.enable =
    lib.mkDefault true;
}
