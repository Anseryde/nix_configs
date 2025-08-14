-- autoclose-nvim config
require("autoclose").setup({
	keys = {
		["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "markdown" } },
	},
	options = {
		disabled_filetypes = {
			"text" --[[ , "markdown" ]],
		},
	},
})
