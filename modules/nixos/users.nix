
{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    users.enable =
      lib.mkEnableOption "enables users";
  };
  config = lib.mkIf config.users.enable {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.ryann = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
      shell = pkgs.fish;
      packages = with pkgs; [
        tree
      ];
    };
  };
}
