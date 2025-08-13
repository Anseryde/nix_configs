-- init.lua
vim.api.nvim_create_autocmd("FileType", {
	pattern = "nix",
	callback = function(opts)
		local bo = vim.bo[opts.buf]
		bo.tabstop = 2
		bo.shiftwidth = 2
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function(opts)
		local bo = vim.bo[opts.buf]
		bo.tabstop = 4
		bo.shiftwidth = 4
	end,
})
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format current file using conform.nvim" })
require("languages")
require("plugins")
