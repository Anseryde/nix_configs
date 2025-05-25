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
      unityhub
      tela-icon-theme
      thunderbird-latest
      wqy_microhei
      wqy_zenhei
      texlivePackages.arphic-ttf
      github-desktop
      heroic
      git-credential-manager
      helix
      zed-editor
      vscodium-fhs
      kew
    ];
  };
}
