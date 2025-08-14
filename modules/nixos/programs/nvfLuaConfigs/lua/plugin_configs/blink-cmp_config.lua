require("blink.cmp").setup({
	fuzzy = {
		implementation = "prefer_rust_with_warning",
		prebuilt_binaries = {
			download = false,
		},
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
			update_delay_ms = 50,
			treesitter_highlighting = true,
		},
	},
	cmdline = {
		keymap = {
			["<C-Space>"] = { "show", "fallback" },
			["<C-d>"] = { "scroll_documentation_up", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "show", "fallback" },
			["preset"] = "none",
		},
	},
	keymap = {
		["<C-Space>"] = { "show", "fallback" },
		["<C-d>"] = { "scroll_documentation_up", "fallback" },
		["<C-e>"] = { "hide", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		["<Tab>"] = {
			"select_next",
			"snippet_forward",
			function(cmp)
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				has_words_before = col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil

				if has_words_before then
					return cmp.show()
				end
			end,
			"fallback",
		},
		["preset"] = "none",
	},
	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer",
			"ripgrep",
			"obsidian",
			"obsidian_tags",
			"obsidian_new",
		},
		providers = {
			ripgrep = {
				module = "blink-ripgrep",
				name = "Ripgrep",
				---@module "blink-ripgrep"
				---@type blink-ripgrep.Options
				opts = {},
			},
		},
	},
})
