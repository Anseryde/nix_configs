{pkgs, lib, ...}:
{
  vim = {
    # theme = {
    #   enable = true;
    #   name = "nightfox";
    #   style = "carbonfox";
    # };
    statusline = {
      lualine = {
        enable = true;
      };
    };
    telescope = {
      enable = true;
    };
    autocomplete = {
      nvim-cmp = {
        enable = true;
      };
    };
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      #languages
      nix = {
        enable = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; {
      nightfox-nvim = {
        package = nightfox-nvim;
        setup = ''
          vim.cmd.colorscheme('carbonfox')
        '';
      };
    };
  };
}
