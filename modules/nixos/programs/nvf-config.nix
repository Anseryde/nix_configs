{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    nvf-config.enable =
      lib.mkEnableOption "enables nvf-config";
  };
  config = lib.mkIf config.nvf-config.enable {
    programs.nvf = {
      enable = true;
      settings = {
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
            {
              key = "<leader>pi";
              desc = "Paste image via img-clip";
              mode = "n";
              action = "<cmd>PasteImage<cr>";
            } # for img-clip
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
            surround = {
              enable = true;
              # setupOpts = lib.mkLuaInline ''
              #
              # '';
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
          mini = {
            icons = {
              enable = true;
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
            # nvim-cmp = {
            #   enable = true;
            # };
            blink-cmp = {
              enable = true;
              friendly-snippets.enable = true;
              setupOpts = {
                fuzzy = {
                  implementation = "prefer_rust_with_warning";
                };
                sources = {
                  default = [
                    "lsp"
                    "path"
                    "snippets"
                    "buffer"
                    "ripgrep"
                  ];
                };
              };
              sourcePlugins = {
                ripgrep = {
                  enable = true;
                };
                obsidian = {
                  enable = true;
                  module = "obsidian.completion.sources.blink.refs";
                  # module = [
                  #   "obsidian.completion.sources.blink.refs"
                  #   "obsidian.completion.sources.blink.tags"
                  #   "obsidian.completion.sources.blink.new"
                  # ];
                };
                obsidian_tags = {
                  enable = true;
                  module = "obsidian.completion.sources.blink.tags";
                };
                obsidian_new = {
                  enable = true;
                  module = "obsidian.completion.sources.blink.new";
                };
              };
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
            indent = {
              disable = [
                "lua"
              ];
            };
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
            html = {
              enable = true;
              treesitter = {
                enable = true;
                autotagHtml = true;
              };
            };
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
              extensions = {
                render-markdown-nvim = {
                  enable = true;
                };
              };
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
                new_notes_location = "current_dir";
                ui = {
                  enable = false;
                };
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
                src = inputs.nvim-toggler;
                # src = pkgs.fetchFromGitHub {
                #   owner = "nguyenvukhang";
                #   repo = "nvim-toggler";
                #   rev = "467808600882fd6c9e33b9dbc4889b1b80cfd917";
                #   sha256 = "11bql1i3kdvvq9hkgwiqrxsgydl4pmsj9r6qwrkfvnj0zfq4bsp7";
                # };
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
            autoclose-nvim = {
              package = autoclose-nvim;
            };
            nvim-treesitter-endwise = {
              package = nvim-treesitter-endwise;
            };
          };
        };
      };
    };
  };
}
