return {
  "folke/zen-mode.nvim",
  dependencies = {
    "folke/twilight.nvim",
  },
  opts = {
    plugins = {
      twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = false }, -- disables git signs
      tmux = { enabled = true },
    },
  },
  keys = {
    {
      "<leader>z",
      ":ZenMode<CR>",
      noremap = true,
      silent = true,
      mode = "n",
    },
  },
}
