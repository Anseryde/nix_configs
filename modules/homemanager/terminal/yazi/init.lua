
require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}
require("duckdb"):setup()
-- require("git"):setup()

--      require("restore"):setup({
--          -- Set the position for confirm and overwrite dialogs.
--          -- don't forget to set height: `h = xx`
--          -- https://yazi-rs.github.io/docs/plugins/utils/#ya.input
--          position = { "center", w = 70, h = 40 }, -- Optional

--          -- Show confirm dialog before restore.
--          -- NOTE: even if set this to false, overwrite dialog still pop up
--          show_confirm = true,  -- Optional

--          -- colors for confirm and overwrite dialogs
--          theme = { -- Optional
--            -- Default using style from your flavor or theme.lua -> [confirm] -> title.
--            -- If you edit flavor or theme.lua you can add more style than just color.
--            -- Example in theme.lua -> [confirm]: title = { fg = "blue", bg = "green"  }
--            title = "blue", -- Optional. This valid has higher priority than flavor/theme.lua

--            -- Default using style from your flavor or theme.lua -> [confirm] -> content
--            -- Sample logic as title above
--            header = "green", -- Optional. This valid has higher priority than flavor/theme.lua

--            -- header color for overwrite dialog
--            -- Default using color "yellow"
--            header_warning = "yellow", -- Optional
--            -- Default using style from your flavor or theme.lua -> [confirm] -> list
--            -- Sample logic as title and header above
--            list_item = { odd = "blue", even = "blue" }, -- Optional. This valid has higher priority than flavor/theme.lua
--          },
--      })
require("starship"):setup({
    -- Hide flags (such as filter, find and search). This is recommended for starship themes which
    -- are intended to go across the entire width of the terminal.
    hide_flags = false, -- Default: false
    -- Whether to place flags after the starship prompt. False means the flags will be placed before the prompt.
    flags_after_prompt = true, -- Default: true
    -- Custom starship configuration file to use
    config_file = nil, -- Default: nil
})
