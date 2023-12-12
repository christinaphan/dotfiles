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
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			layout_config = {
				height = 0.70,
			},
		},
	},
})
