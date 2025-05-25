
{ pkgs, lib, config, ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    helix.enable =
  	  lib.mkEnableOption "enables helix";
  };
  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      settings = {
        theme = "dracula_at_night";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      languages.language = [{
        name = "nix";
        auto-format = false;
        formatter.command = lib.getExe pkgs.alejandra;
      }];
      };
    };
  };
}
