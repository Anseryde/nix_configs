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
        setupOpts = {
          bigfile = {
            enabled = true;
          };
          dashboard = {
            enabled = true;
          };
          explorer = {
            enabled = true;
          };
          indent = {
            enabled = true;
          };
          picker = {
            enabled = true;
          };
          notifier = {
            enabled = true;
            timeout = 3000;
          };
          quickfile = {
            enabled = true;
          };
          scope = {
            enabled = true;
          };
          scroll = {
            enabled = true;
          };
          statuscolumn = {
            enabled = true;
          };
          words = {
            enabled = true;
          };  
        };
      };  
    };
    lazy = {
      enable = true;
    };  
    terminal = {
      toggleterm = {
        lazygit = {
          enable = true;
        };
      };
    };  
    binds.whichKey = {
      enable = true;
      setupOpts = {
        notify = true;
        preset = "modern";
        win = {
          border = "rounded";
        };
      };
    };  
    statusline = {
      lualine = {
        enable = true;
      };
    };
    git = {
      enable = true;
      gitsigns = {
        enable = true;
      };
      neogit = {
        enable = true;
      };  
    };  
    telescope = {
      enable = true;
    };
    dashboard = {
      alpha = {
        enable = true;
      };
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
      trouble = {
        enable = true;
      };  
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
