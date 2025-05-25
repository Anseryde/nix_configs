{ pkgs, lib, ... }:
{
  imports = [
    ./pkgs.nix
  ];

  pkgs.enable =
    lib.mkDefault true;
}
