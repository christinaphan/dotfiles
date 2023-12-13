-- Make h and l wrap around start and end of lines
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- Stop automatic comment when inserting new line
vim.cmd("au BufEnter * set fo-=c fo-=r fo-=o")

-- Let folds persist
vim.cmd([[
augroup AutoSaveFolds
autocmd!
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent! loadview
augroup END
]])

-- Red highlight leading trailing whitespace
vim.cmd([[
highlight TrailingWhitespace ctermbg=LightRed guibg=LightRed
augroup trailing_ws
    au!
    au BufWinEnter,InsertLeave * match TrailingWhitespace /\s\+$/
    au InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
augroup END
]])

-- Remove leading and trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Fixes weird right padding gap ?
-- see: https://github.com/aryzing/dotfiles/blob/main/nvim/.config/nvim/lua/user/04_theme.lua
vim.cmd("highlight clear StatusLine")
