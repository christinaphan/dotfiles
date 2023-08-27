vim.opt.background = "light"
local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- fixes weird right padding gap ?
-- see: https://github.com/aryzing/dotfiles/blob/main/nvim/.config/nvim/lua/user/04_theme.lua
vim.cmd("highlight clear StatusLine")

-- Red highlight leading trailing whitespace
vim.cmd([[
highlight TrailingWhitespace ctermbg=LightRed guibg=LightRed
augroup trailing_ws
    au!
    au BufWinEnter,InsertLeave * match TrailingWhitespace /\s\+$/
    au InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
augroup END
]])
