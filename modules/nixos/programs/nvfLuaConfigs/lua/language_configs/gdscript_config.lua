-- gdscript.lua
local capabilities = vim.lsp.protocol.make_client_capabilities()
require('lspconfig').gdscript.setup(capabilities)
