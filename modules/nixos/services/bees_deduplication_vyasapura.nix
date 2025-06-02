{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    bees_deduplication.enable =
      lib.mkEnableOption "enables bees_deduplication";
  };
  config = lib.mkIf config.bees_deduplication.enable {
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
