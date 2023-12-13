return {
  "lervag/vimtex",
  ft = "tex",
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_skim_sy = 1
    vim.g.vimtex_view_skim_activate = 1
  end,
}
