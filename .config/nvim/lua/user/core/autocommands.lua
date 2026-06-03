-- Make h and l wrap around start and end of lines
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- Stop automatic comment when inserting new line
vim.cmd("au BufEnter * set fo-=c fo-=r fo-=o")

-- Let folds persist
-- vim.cmd([[
-- augroup AutoSaveFolds
-- autocmd!
-- autocmd BufWinLeave ?* mkview
-- autocmd BufWinEnter ?* silent! loadview
-- augroup END
-- ]])

-- -- Remove leading and trailing whitespace on save
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   command = [[%s/\s\+$//e]],
-- })

-- Red highlight leading trailing whitespace
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local error_hl = vim.api.nvim_get_hl(0, { name = "Error", link = false })
    vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = error_hl.fg })
  end,
})

vim.cmd([[
augroup trailing_ws
au!
au BufWinEnter,InsertLeave * match TrailingWhitespace /\s\+$/
au InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
augroup END
]])
