{pkgs, lib, ...}:
{
  vim = {
    # theme = {
    #   enable = true;
    #   name = "nightfox";
    #   style = "carbonfox";
    # };
    utility = {
      snacks-nvim = {
        enable = true;
      };  
    };
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
    comments = {
      comment-nvim = {
        enable = true;
      };
    };  
    lsp = {
      enable = true;
    };
    treesitter = {
      enable = true;
    };
    languages = {
      nix = {
        enable = true;
        lsp = {
          server = "nixd";
          options = {
            nixos = {
              expr = "(builtins.getFlake \"/home/ryann/nix-configs\").nixosConfigurations.vysapura.options";
            };
            home_manager = {
              expr = "(builtins.getFlake \"/home/ryann/nix-configs\").nixosConfigurations.vyasapura.options.home-manager.users.type.getSubOptions []";
            };
          };
        };
      };
      rust = {
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
