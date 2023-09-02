local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end
local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				["J"] = actions.move_selection_next,
				["K"] = actions.move_selection_previous,
			},
		},
	},
})

local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files({hidden=true})<CR>", opts)
vim.keymap.set("n", "<leader>fs", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)

local theme = require("telescope.themes")
local function spell_check()
	builtin.spell_suggest(theme.get_cursor({
		prompt_title = "",
		layout_config = {
			height = 0.25,
			width = 0.25,
		},
	}))
end
vim.keymap.set("n", "<leader>ss", spell_check, opts)
