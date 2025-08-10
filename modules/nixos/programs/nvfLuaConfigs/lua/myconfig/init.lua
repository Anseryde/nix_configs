-- init.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function(opts)
    local bo = vim.bo[opts.buf]
      bo.tabstop = 2
      bo.shiftwidth = 2
  end
})
require("snacks").setup({
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
    },
  },
  bigfile = {
    enabled = true,
  },
  explorer = {
    enabled = true,
  },
  indent = {
    enabled = true,
  },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  picker = {
    enabled = true,
  },
  quickfile = {
    enabled = true,
  },
  scope = {
    enabled = true,
  },
  scroll = {
    enabled = true,
  },
  statuscolumn = {
    enabled = true,
  },
  words = {
    enabled = true,
  },
})
