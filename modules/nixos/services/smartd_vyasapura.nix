{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    smartd_vyasapura.enable =
      lib.mkEnableOption "enables smartd_vyasapura";
  };
  config = lib.mkIf config.smartd_vyasapura.enable {
    services.smartd = {
      enable = true;
      devices = [
        {
          device = "/dev/disk/by-id/nvme-Lexar_SSD_NQ700_1TB_PMC836R000468P2701";
        }
        {
          device = "/dev/disk/by-id/nvme-WD_PC_SN560_SDDPNQE-1T00-1032_234964403432";
        }
      ];
    };
  };
}
