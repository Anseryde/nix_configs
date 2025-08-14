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
    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
            "ripgrep",
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
