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
      courier-prime
      vollkorn
      gimp3-with-plugins
      prismlauncher
      # unityhub
      tela-icon-theme
      thunderbird-latest
      wqy_microhei
      wqy_zenhei
      texlivePackages.arphic-ttf
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
      nerd-fonts.symbols-only
      wineWowPackages.stableFull
      raider
      corefonts
      vista-fonts
      vista-fonts-chs
      vista-fonts-cht
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
      blender
      material-maker
    ];
  };
}
