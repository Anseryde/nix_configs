{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    helix.enable =
      lib.mkEnableOption "enables helix";
  };
  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      languages.language = [
        {
          name = "nix";
          auto-format = false;
          language-servers = ["nixd"];
          formatter.command = lib.getExe pkgs.alejandra;
        }
      ];
      languages.language-server.nixd = {
        command = lib.getExe pkgs.nixd;
        config.nixd = {
          nixpkgs.expr = "import (builtins.getFlake \"/home/ryann/nix-configs\").inputs.nixpkgs { }";
          options.nixos.expr = "(builtins.getFlake \"/home/ryann/nix-configs\").nixosConfigurations.oldfart12.options";
          options.home-manager.expr = "(builtins.getFlake \"/home/ryann/nix-configs\").nixosConfigurations.oldfart12.options.home-manager.users.type.getSubOptions []";
        };
      };
      settings = {
        theme = "dracula_at_night";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
