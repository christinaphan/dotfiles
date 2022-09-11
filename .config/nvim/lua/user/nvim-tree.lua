local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	filters = {
		custom = { ".git", "__pycache__" },
		exclude = { ".gitignore" },
	},
	update_cwd = false,
	renderer = {
		add_trailing = true,
		highlight_opened_files = "all",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				none = "  ",
			},
		},
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = false,
			},
			glyphs = {
				default = " ",
				symlink = " ",
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
				},
			},
		},
	},
	diagnostics = {
		enable = false,
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	git = {
		enable = false,
	},
	view = {
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
	},
})
