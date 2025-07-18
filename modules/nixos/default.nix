{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./nixos_pkgs.nix
    ./language/fcitx.nix
    ./gaming/steam.nix
    ./gaming/gamescopeandgamemode.nix
    ./drivers/nvidia.nix
    ./drivers/nvidia-open-kernel-module.nix
    ./drivers/nvidia-optimus.nix
    ./drivers/msi-ec.nix
    ./services/docker.nix
    ./programs/distrobox.nix
    ./users.nix
    ./services/docker.nix
    ./services/podman-container.nix
    ./services/printing.nix
    ./services/bees_deduplication_vyasapura.nix
    ./services/bees_deduplication.nix
    ./swap.nix
    ./services/smartd_vyasapura.nix
  ];

  nixos_pkgs.enable =
    lib.mkDefault true;
  users.enable =
    lib.mkDefault true;
  fcitx.enable =
    lib.mkDefault true;
  distrobox.enable =
    lib.mkDefault true;
  swap.enable =
    lib.mkDefault true;
}
