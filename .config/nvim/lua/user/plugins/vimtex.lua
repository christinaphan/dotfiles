return {
  "lervag/vimtex",
  ft = "tex",
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
  end,
  commit = "fcbaf66"
}
