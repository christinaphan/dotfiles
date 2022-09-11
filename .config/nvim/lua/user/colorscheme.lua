vim.opt.background = "dark"
require("gruvbox").setup({
	contrast = "soft",
})

local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- fixes weird right padding gap ?
-- see: https://github.com/aryzing/dotfiles/blob/main/nvim/.config/nvim/lua/user/04_theme.lua
vim.cmd("highlight clear StatusLine")
