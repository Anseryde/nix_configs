-- gdscript.lua
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- require('lspconfig').gdscript.setup(capabilities)
vim.lsp.config('gdscript', {
	name = "gdscript",
	-- Fill in your Godot Language Server Parameters
	cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
	-- Fill in where Neovim listens to Godot LSP
	on_init = function(client, init_result)
		vim.fn.serverstart("./godothost")
	end,
})
vim.lsp.enable('gdscript')
