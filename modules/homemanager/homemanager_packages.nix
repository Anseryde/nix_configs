{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    homemanager_packages.enable =
      lib.mkEnableOption "enables homemanager_packages";
  };
  config = lib.mkIf config.homemanager_packages.enable {
    # fontconfig support
    fonts = {
      fontconfig = {
        enable = true;
      };
    };
    home.packages = with pkgs; [
      fastfetch
      hyfetch
      fishPlugins.fzf-fish
      # courier-prime
      # vollkorn
      gimp-with-plugins
      # gimpPlugins.resynthesizer
      prismlauncher
      # unityhub
      tela-icon-theme
      thunderbird-latest
      # wqy_microhei
      # wqy_zenhei
      # texlivePackages.arphic-ttf
      helix
      zed-editor
      vscodium-fhs
      kew
      omnisharp-roslyn
      gdtoolkit_4
      lua-language-server
      lua
      ruff
      duckdb
      mediainfo
      glow
      trash-cli
      nushell
      foliate
      inkscape-with-extensions
      kdePackages.kasts
      newsflash
      # nerd-fonts.symbols-only
      wineWowPackages.stableFull
      raider
      # corefonts
      # vista-fonts
      # vista-fonts-chs
      # vista-fonts-cht
      wl-clipboard
      python313Packages.pyperclip
      kid3
      lrcget
      caligula
      pika-backup
      heroic
      lumafly
      kdePackages.kcharselect
      anki-bin
      converseen
      mission-center
      gearlever
      mangohud
      goverlay
      # blender
      material-maker
      obsidian
      obsidian-export
      kdePackages.kdenlive
      davinci-resolve
      tor-browser
      kdePackages.kcolorchooser
      texstudio
      pandoc
      kdePackages.kcalc
      peazip
      imagemagick # for snacks.nvim image module
      ghostscript # for snacks.nvim image module
      mermaid-cli # for snacks.nvim image module
      flyctl # for Actual Budget budgeting app hosting on fly.io 
      ungoogled-chromium
      kdePackages.kclock
      (krita.override {
        libpng = pkgs.libpng.overrideAttrs (oldAttrs: {
          patches = oldAttrs.patches ++ [
            ./patches/libpng.patch
          ];
        });
      })
      krita-plugin-gmic
    ];
  };
}
