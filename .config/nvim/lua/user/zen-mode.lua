local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
	return
end

zen_mode.setup({
	window = {
		backdrop = 1,
		height = 1, -- height of the Zen window
		width = 1,
		options = {
			signcolumn = "no", -- disable signcolumn
			number = true, -- disable number column
			relativenumber = false, -- disable relative numbers
			cursorline = true, -- disable cursorline
			cursorcolumn = false, -- disable cursor column
			foldcolumn = "0", -- disable fold column
			list = false, -- disable whitespace characters
		},
	},
	plugins = {
		options = { enabled = true, showmode = true },
		gitsigns = { enabled = false }, -- disables git signs
		twilight = { enabled = true },
	},
	on_open = function()
		vim.diagnostic.disable()
		require("cmp").setup({ enabled = false })
	end,
	on_close = function()
		vim.diagnostic.enable()
		require("cmp").setup({ enabled = true })
	end,
})
