require("obsidian").setup({
	workspaces = {
		{
			name = "Earth B",
			path = "~/Documents/Obsidian/Earth B",
		},
		{
			name = "SP Class Notes",
			path = "~/Documents/Obsidian/SP Class Notes",
			-- Optional, override certain settings.
			-- overrides = {
			-- 	notes_subdir = "notes",
			-- },
		},
        {
            name = "Reflections",
            path = "~/Documents/Obsidian/Reflections",
        },
        {
            path = "~/Documents/Obsidian/Blender Learning",
            name = "Blender Learning",
        },
        {
            path = "~/Documents/Obsidian/PID Notes",
            name = "PID Notes",
        },
        {
            name = "no-vault",
            path = function()
                -- alternatively use the CWD:
                -- return assert(vim.fn.getcwd())
                return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
            end,
            overrides = {
                notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
                new_notes_location = "current_dir",
                templates = {
                    folder = vim.NIL,
                },
                disable_frontmatter = true,
            },
        },
    },

	-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
	completion = {
		-- Enables completion using nvim_cmp
		nvim_cmp = false,
		-- Enables completion using blink.cmp
		blink = true,
		-- Trigger completion at 2 chars.
		min_chars = 2,
		-- Set to false to disable new note creation in the picker
		create_new = true,
	},

	-- Where to put new notes. Valid options are
	-- _ "current_dir" - put new notes in same directory as the current buffer.
	-- _ "notes_subdir" - put new notes in the default notes subdirectory.
	new_notes_location = "current_dir",

	picker = {
		-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
		name = "telescope.nvim",
		-- Optional, configure key mappings for the picker. These are the defaults.
		-- Not all pickers support all mappings.
		note_mappings = {
			-- Create a new note from your query.
			new = "<C-x>",
			-- Insert a link to the selected note.
			insert_link = "<C-l>",
		},
		tag_mappings = {
			-- Add tag(s) to current note.
			tag_note = "<C-x>",
			-- Insert a tag at the current location.
			insert_tag = "<C-l>",
		},
	},

	-- Optional, sort search results by "path", "modified", "accessed", or "created".
	-- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
	-- that `:Obsidian quick_switch` will show the notes sorted by latest modified time
	sort_by = "modified",
	sort_reversed = true,

	-- Set the maximum number of lines to read from notes on disk when performing certain searches.
	search_max_lines = 1000,

	-- Optional, determines how certain commands open notes. The valid options are:
	-- 1. "current" (the default) - to always open in the current window
	-- 2. "vsplit" - only open in a vertical split if a vsplit does not exist.
	-- 3. "hsplit" - only open in a horizontal split if a hsplit does not exist.
	-- 4. "vsplit_force" - always open a new vertical split if the file is not in the adjacent vsplit.
	-- 5. "hsplit_force" - always open a new horizontal split if the file is not in the adjacent hsplit.
	open_notes_in = "current",
})
