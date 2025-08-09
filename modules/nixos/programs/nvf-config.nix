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
      lsp = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
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
