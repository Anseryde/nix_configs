{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    nixos_pkgs.enable =
      lib.mkEnableOption "enables nixos_pkgs";
  };
  config = lib.mkIf config.nixos_pkgs.enable {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      #vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      micro
      helix
      wget
      epson-escpr2
      nixd
      alejandra
      vlc
      libdvdcss
      libdvdread
      libdvdnav
      libbluray
      libreoffice-qt-fresh
      hunspell
      hunspellDicts.en_US
      vulkan-hdr-layer-kwin6
      libinput
      libwacom
    ];
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      liberation_ttf
    ];
  };
}
