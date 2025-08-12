{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    git.enable =
      lib.mkEnableOption "enables git";
  };
  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Anseryde";
      userEmail = "ryanlupis@gmail.com";
      extraConfig = {
        credential = {
          # helper = "manager";
          # "https://github.com".username = "Anseryde";
          # credentialStore = "cache";
          helper = "libsecret";
        };
        push = {autoSetupRemote = true;};
      };
    };
    home.packages = with pkgs; [
      git-credential-manager
      github-desktop
    ];
  };
}
