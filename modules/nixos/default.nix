{ pkgs, lib, ... }:
{
  imports = [
    ./nixos_pkgs.nix
    ./language/fcitx.nix
    ./gaming/steam.nix
    ./gaming/gamescopeandgamemode.nix
    ./drivers/nvidia.nix
    ./drivers/nvidia-optimus.nix
    ./drivers/msi-ec.nix
    ./services/docker.nix
    ./programs/distrobox.nix
  ];

  nixos_pkgs.enable =
    lib.mkDefault true;
  fcitx.enable =
    lib.mkDefault true;
  docker.enable =
    lib.mkDefault true;
  distrobox.enable =
    lib.mkDefault true;
}
