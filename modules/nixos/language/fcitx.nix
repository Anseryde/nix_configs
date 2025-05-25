
{ pkgs, lib, config, ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    fcitx.enable =
  	  lib.mkEnableOption "enables fcitx";
  };
  config = lib.mkIf config.fcitx.enable {
    # fcitx
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
        	rime-data
        	fcitx5-rime
        	libchewing
        	fcitx5-chewing
        	fcitx5-table-extra
        	fcitx5-table-other
        	kdePackages.fcitx5-qt
        	kdePackages.fcitx5-chinese-addons
        ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    kdePackages.fcitx5-configtool
  ];
}
