# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/nixos
  ];
  # custom module selection
  # for full list of modules, as well as default modules, view nix-configs/modules/nixos/default.nix
  nvidia-open-kernel-module.enable = true;
  nvidia-optimus.enable = true;
  steam.enable = true;
  gamescopeandgamemode.enable = true;
  msi-ec.enable = true;
  printing.enable = true;
  bees_deduplication_vyasapura.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot = {
    bootspec.enable = true;
    initrd.systemd.enable = true;
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 10;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  #switch to latest stable linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # zstd compression
  fileSystems = {
    "/".options = ["compress=zstd"];
    "/home".options = ["compress=zstd"];
    "/nix".options = ["compress=zstd" "noatime"];
  };

  nix.optimise.automatic = true;

  networking.hostName = "vyasapura"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_SG.UTF-8";
  #console = {
  #font = "Lat2-Terminus16";
  #keyMap = "us";
  #useXkbConfig = true; # use xkb.options in tty.
  #};

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # KDE
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect.enable = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.enableAllFirmware = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # programs.firefox.enable = true;

  #unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron"
    ];
  };

  #nix
  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = lib.mkDefault true;
    };
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 7d";
      dates = lib.mkDefault "weekly";
    };
  };

  # drawing tablets
  hardware.opentabletdriver.enable = true;

  #flatpaks
  services.flatpak.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [
      pkgs.icu
      pkgs.libxcrypt-legacy
      pkgs.python312
      pkgs.fuse3
      pkgs.fuse
    ];
  };

  # FISH shell
  programs.fish.enable = true;

  # Waydroid
  virtualisation.waydroid.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
