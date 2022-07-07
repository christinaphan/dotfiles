vim.cmd [[
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
  
  augroup gas_ft
    autocmd!
    autocmd Filetype asm set syntax=gas | set ft=gas
  augroup END
]]
