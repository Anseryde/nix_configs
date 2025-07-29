
{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    virt-manager.enable =
      lib.mkEnableOption "enables virt-manager";
  };
  config = lib.mkIf config.virt-manager.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [virtiofsd];
    };
    programs.virt-manager = {
      enable = true;
    };
    users.users.ryann.extraGroups = ["libvirtd"];
    networking.firewall.trustedInterfaces = ["wlp5s0" "virbr0" "enp2s0"];
  };
}
