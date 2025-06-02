{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    bees_deduplication_vyasapura.enable =
      lib.mkEnableOption "enables bees_deduplication_vyasapura";
  };
  config = lib.mkIf config.bees_deduplication_vyasapura.enable {
    services.beesd.filesystems = {
      root = {
        spec = "LABEL=fedora_vyasapura";
        hashTableSizeMB = 2048;
        verbosity = "crit";
        extraOptions = [ "--loadavg-target" "5.0" ];
      };
    };
  };
}
