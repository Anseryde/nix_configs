-- init.lua
vim.api.nvim_create_autocmd("FileType", {
        pattern = "nix",
        callback = function(opts)
                local bo = vim.bo[opts.buf]
                bo.tabstop = 2
                bo.shiftwidth = 2
        end
})
require "languages"
require "plugins"
