{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    mpd.enable =
      lib.mkEnableOption "enables mpd";
  };
  config = lib.mkIf config.mpd.enable {
    services.mpd = {
      enable = true;
      # musicDirectory = /home/ryann/Music;
      network = {
        startWhenNeeded = true;
        listenAddress = "any";
      };
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
    services.mpd-discord-rpc = {
      enable = true;
    };
    services.mpd-mpris = {
      enable = true;
    };
  };
}
