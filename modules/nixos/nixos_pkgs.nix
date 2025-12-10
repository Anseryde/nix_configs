{
  pkgs,
  lib,
  config,
  self,
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
    environment.systemPackages = 
      # let
      #   freeimagere = with pkgs; stdenv.mkDerivation {
      #     pname = "freeimagere";
      #     version = "latest";
      #     src = fetchzip {
      #       url = "https://github.com/agruzdev/FreeImageRe/releases/download/latest/FreeImageRe-linux64.zip";
      #       sha256 = "0r29msmaxfg54nyziaxdzr2y4ljp92086kcsbxz870ra21kw1q1h";
      #       stripRoot = false;
      #     };
      #     installPhase = ''
      #       mkdir -p $out/include
      #       mkdir -p $out/lib
      #       mv include/FreeImage.h $out/include
      #       mv include/FreeImage.hpp $out/include
      #       mv lib/libFreeImage.so $out/lib
      #       mv lib/libheif.so $out/lib
      #       cp $out/lib/libFreeImage.so $out/lib/libfreeimage-3.18.0.so
      #     '';
      #   };
      # in 
      with pkgs; [
      #vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      # freeimagere
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
      libaacs # for playing back AACS-protected blu-ray discs.
      libreoffice-qt-fresh
      hunspell
      hunspellDicts.en_US
      vulkan-hdr-layer-kwin6
      libinput
      libwacom
      mcontrolcenter
      kdePackages.partitionmanager
      cryptsetup
      libsecret
      rar
      unrar
      xorg.xhost
      nix-alien
      direnv
      pkg-config
      vdhcoapp
      mpv
      mpvScripts.uosc
      luajit
      fd # for snacks.nvim
      ripgrep # for snacks.nvim
      lazygit # for snacks.nvim
      gdtoolkit_4
      ueberzugpp # for image-nvim
      wl-clipboard # for img-clip neovim plugin
      openjdk # for gprojector
      mono
      wineWowPackages.stagingFull
      winetricks
      unzip
      p7zip
      p7zip-rar
      cabextract
      freerdp # for winboat
      lsfg-vk
      lsfg-vk-ui
      firefoxpwa
      kdePackages.filelight
      zotero
      kdePackages.qtwayland
      # winboat
      # xppen_4 # just to try
      (pkgs.krita.overrideDerivation (old: {
          buildInputs = old.buildInputs ++ [
            portaudio
          ];
          postPatch = let
            pythonPath = python3Packages.makePythonPath (
              [
                python3Packages.sip
                python3Packages.setuptools
                portaudio
              ]
            );  
          in 
          ''
            substituteInPlace cmake/modules/FindSIP.cmake \
              --replace 'PYTHONPATH=''${_sip_python_path}' 'PYTHONPATH=${pythonPath}'
            substituteInPlace cmake/modules/SIPMacros.cmake \
              --replace 'PYTHONPATH=''${_krita_python_path}' 'PYTHONPATH=${pythonPath}'

            substituteInPlace plugins/impex/jp2/jp2_converter.cc \
              --replace '<openjpeg.h>' '<${openjpeg.incDir}/openjpeg.h>'
          '';
        })
      )
      krita-plugin-gmic
      (pkgs.libpng.overrideDerivation (old: {
          patches = old.patches ++ [
            ../homemanager/patches/libpng.patch
          ];
        })
      )
    ];
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      liberation_ttf
      courier-prime
      vollkorn
      corefonts
      texlivePackages.arphic-ttf
      wqy_microhei
      wqy_zenhei
      nerd-fonts.symbols-only
      vista-fonts
      vista-fonts-chs
      vista-fonts-cht
    ];
    # nixpkgs.overlays = [
    #   (self: super: {
    #     patched-krita = pkgs.replaceDependency {
    #       drv = pkgs.krita;
    #       oldDependency = pkgs.libpng;
    #       newDependency = pkgs.libpng.overrideAttrs (old: {
    #         patches = old.patches or [ ] ++ [
    #           ../homemanager/patches/libpng.patch
    #         ];
    #       });
    #     };
    #   })
    # ];
  };
}
