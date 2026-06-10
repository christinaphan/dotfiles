-- Make h and l wrap around start and end of lines
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- Stop automatic comment when inserting new line
vim.cmd("au BufEnter * set fo-=c fo-=r fo-=o")

-- -- Remove leading and trailing whitespace on save
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   command = [[%s/\s\+$//e]],
-- })

-- Red highlight trailing whitespace
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local error_hl = vim.api.nvim_get_hl(0, { name = "Error", link = false })
    vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = error_hl.fg })
  end,
})

local trailing_ws_group = vim.api.nvim_create_augroup("trailing_ws", { clear = true })

local function is_floating()
  return vim.api.nvim_win_get_config(0).relative ~= ""
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertLeave" }, {
  group = trailing_ws_group,
  callback = function()
    if not is_floating() then
      vim.cmd("match TrailingWhitespace /\\s\\+$/")
    end
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = trailing_ws_group,
  callback = function()
    if not is_floating() then
      vim.cmd("match TrailingWhitespace /\\s\\+\\%#\\@<!$/")
    end
  end,
})
