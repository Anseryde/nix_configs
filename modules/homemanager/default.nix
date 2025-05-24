{ pkgs, lib, ... }:
{
  imports = [
    ./desktop_environment/plasmacfg.nix
  ];

  plasmacfg.enable =
    lib.mkDefault true;
}
