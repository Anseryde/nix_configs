-- snacks.lua
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
