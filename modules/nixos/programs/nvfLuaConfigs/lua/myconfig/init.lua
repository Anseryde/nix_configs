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
    -- sections = {
    --   { section = "header" },
    --   { section = "keys", gap = 1, padding = 1 },
    -- },
    sections = {
      { section = "header" },
      { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
--[[       { section = "startup" }, ]]
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
require("twilight").setup({
  dimming = {
    alpha = 0.25, -- amount of dimming
    -- we try to get the foreground from the highlight groups or fallback color
    color = { "Normal", "#ffffff" },
    term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
    inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  },
  context = 10, -- amount of lines we will try to show around the current line
  treesitter = true, -- use treesitter when available for the filetype
  -- treesitter is used to automatically expand the visible text,
  -- but you can further control the types of nodes that should always be fully expanded
  expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {}, -- exclude these filetypes 
})
