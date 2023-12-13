return {
  "rose-pine/neovim",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  name = "rose-pine",
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("rose-pine-moon")
  end,
}
