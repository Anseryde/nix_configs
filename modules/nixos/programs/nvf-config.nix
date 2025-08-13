{
  pkgs,
  lib,
  ...
}: {
  vim = {
    # theme = {
    #   enable = true;
    #   name = "nightfox";
    #   style = "carbonfox";
    # };
    additionalRuntimePaths = [
      ./nvfLuaConfigs
    ];
    luaConfigRC.nvfLuaConfigs =
      /*
      lua
      */
      ''
        -- Call the Lua module from ./nvfLuaConfigs/lua/myconfig
        require("neovimconfig")

        -- Any additional Lua configuration that you might want *after* your own
        -- configuration. I.E., a plugin setup call.

      '';
    viAlias = true;
    vimAlias = true;
    globals = {
      mapleader = " ";
    };
    keymaps = [
      {
        key = "<leader>tw";
        desc = "lspsaga floating terminal window";
        mode = [
          "n"
          "x"
        ];
        action = "<cmd>Lspsaga term_toggle<CR>";
      } # for Lspsaga
      {
        desc = "Neotree";
        key = "<leader>e";
        mode = [
          "n"
        ];
        action = "<cmd>Neotree toggle<cr>";
      }
    ];
    utility = {
      nix-develop = {
        enable = true;
      };
      nvim-biscuits = {
        enable = true;
      };
      images = {
        image-nvim = {
          enable = true;
          setupOpts = {
            hijackFilePatterns = [
              "*.png"
              "*.jpg"
              "*.jpeg"
              "*.gif"
              "*.webp"
              "*.svg"
            ];
            integrations = {
              markdown = {
                enable = true;
                clearInInsertMode = true;
                downloadRemoteImages = true;
                filetypes = [
                  "markdown"
                  "vimwiki"
                ];
              };
            };
          };
        };
        img-clip = {
          enable = true;
        };
      };
    };
    ui = {
      borders = {
        plugins = {
          lspsaga = {
            enable = true;
          };
        };
      };
    };
    diagnostics = {
      enable = true;
      config = {
        virtual_text = false; #for tiny-inline-diagnostic-nvim
      };
    };
    # lazy = {
    #   enable = true;
    # };
    terminal = {
      toggleterm = {
        enable = true;
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
    # dashboard = {
    #   alpha = {
    #     enable = true;
    #   };
    # };
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
      formatOnSave = false;
      trouble = {
        enable = true;
      };
      lspsaga = {
        enable = true;
      };
    };
    treesitter = {
      enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        gdscript
      ];
    };
    languages = {
      enableFormat = true;
      nix = {
        enable = true;
        extraDiagnostics = {
          enable = true;
        };
        format = {
          enable = true;
          package = pkgs.alejandra;
          type = "alejandra";
        };
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
        treesitter = {
          enable = true;
        };
      };
      rust = {
        enable = true;
        crates = {
          enable = true;
        };
      };
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      html.enable = true;
      lua = {
        enable = true;
        extraDiagnostics = {
          enable = true;
        };
        format = {
          enable = true;
        };
        lsp = {
          enable = true;
        };
        treesitter = {
          enable = true;
        };
      };
      python.enable = true;
      csharp = {
        enable = true;
        treesitter = {
          enable = true;
        };
        lsp = {
          enable = true;
        };
      };
      markdown = {
        enable = true;
        format.enable = false;
        # extensions = {
        #   render-markdown-nvim = {
        #     enable = true;
        #   };
        # };
      };
    };
    formatter = {
      conform-nvim = {
        enable = true;
        setupOpts = {
          formatters_by_ft = {
            nix = [
              "alejandra"
            ];
            gdscript = [
              "gdformat"
            ];
          };
        };
      };
    };
    filetree = {
      neo-tree = {
        enable = true;
        setupOpts = {
          auto_clean_after_session = true;
        };
      };
    };
    notes = {
      obsidian = {
        enable = true;
        setupOpts = {
          workspaces = lib.mkLuaInline ''
            {
              {
                name = "Earth B",
                path = "~/Documents/Obsidian/Earth B",
              },
              {
                name = "SP Class Notes",
                path = "~/Documents/Obsidian/SP Class Notes",
              },
              {
                name = "no-vault",
                path = function()
                  -- alternatively use the CWD:
                  -- return assert(vim.fn.getcwd())
                  return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                end,
                overrides = {
                  notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
                  new_notes_location = "current_dir",
                  templates = {
                    folder=vim.NIL
                  },
                  disable_frontmatter = true,
                },
              },
            },
          '';
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; {
      nightfox-nvim = {
        package = nightfox-nvim;
        setup = ''
          vim.cmd.colorscheme('carbonfox')
        '';
      };
      snacks-nvim = {
        package = snacks-nvim;
      };
      nvim-rg = {
        package = nvim-rg;
      };
      nvim-numbertoggle = {
        package = nvim-numbertoggle;
      };
      twilight-nvim = {
        package = twilight-nvim;
      };
      nvim-toggler = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "nvim-toggler";
          src = pkgs.fetchFromGitHub {
            owner = "nguyenvukhang";
            repo = "nvim-toggler";
            rev = "467808600882fd6c9e33b9dbc4889b1b80cfd917";
            sha256 = "11bql1i3kdvvq9hkgwiqrxsgydl4pmsj9r6qwrkfvnj0zfq4bsp7";
          };
        };
        setup = ''
          require('nvim-toggler').setup()
        '';
      };
      urlview-nvim = {
        package = urlview-nvim;
      };
      tiny-inline-diagnostic-nvim = {
        package = tiny-inline-diagnostic-nvim;
      };
    };
  };
}
