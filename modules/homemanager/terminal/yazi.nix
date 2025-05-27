{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    yazi.enable =
      lib.mkEnableOption "enables yazi";
  };
  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableFishIntegration = true;
      plugins = {
        "git" = pkgs.yaziPlugins.git;
        "sudo" = pkgs.yaziPlugins.sudo;
        "chmod" = pkgs.yaziPlugins.chmod;
        "duckdb" = pkgs.yaziPlugins.duckdb;
        "full-border" = pkgs.yaziPlugins.full-border;
        "glow" = pkgs.yaziPlugins.glow;
        "restore" = pkgs.yaziPlugins.restore;
        "mediainfo" = pkgs.yaziPlugins.mediainfo;
        "starship" = pkgs.yaziPlugins.starship;
      };
      keymap = {
        input.prepend_keymap = [
          { run = "close"; on = [ "<C-q>" ]; }
          { run = "close --submit"; on = [ "<Enter>" ]; }
          { run = "escape"; on = [ "<Esc>" ]; }
          { run = "backspace"; on = [ "<Backspace>" ]; }
        ];
        manager.prepend_keymap = [
          { run = "escape"; on = [ "<Esc>" ]; }
          { run = "quit"; on = [ "q" ]; }
          { run = "close"; on = [ "<C-q>" ]; }
          { run = "plugin chmod"; on = [ "c" "m" ]; }
          { run = "plugin duckdb -1"; on = [ "<C-h>" ]; }
          { run = "plugin duckdb +1"; on = [ "<C-l>" ]; }
          { run = "plugin duckdb -open"; on = [ "g" "o" ]; }
          { run = "plugin duckdb -ui"; on = [ "g" "u" ]; }
          { run = "plugin restore"; on = [ "u" ]; }
          { run = "plugin sudo -- paste"; on = [ "R" "p" ]; }
          { run = "plugin sudo -- paste -- force"; on = [ "R" "P" ]; }
          { run = "plugin sudo -- rename"; on = [ "R" "r" ]; }
          { run = "plugin sudo -- link"; on = [ "R" "-" ]; }
          { run = "plugin sudo -- link -- relative"; on = [ "R" "_" ]; }
          { run = "plugin sudo -- link -- hardlink"; on = [ "R" "<C-->" ]; }
          { run = "plugin sudo -- create"; on = [ "R" "a" ]; }
          { run = "plugin sudo -- remove"; on = [ "R" "d" ]; }
          { run = "plugin sudo -- remove --permanently"; on = [ "R" "D" ]; }
        ];
      };
      settings = {
        log = {
          enabled = true;
        };
        manager = {
          show_hidden = true;
          sort_by = "natural";
          sort_dir_first = false;
          sort_reverse = false;
        };
        plugin = {
          prepend_fetchers = [{
            id = "git";
            name = "*/";
            run = "git";
          }];
          prepend_previewers = [{
            name = "*.md";
            run = "glow";
          }];
        };
      };
      initLua = ./yazi/init.lua;
    };
  };
}
