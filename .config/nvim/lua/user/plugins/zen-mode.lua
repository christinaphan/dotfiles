return {
  "folke/zen-mode.nvim",
  dependencies = {
    "folke/twilight.nvim",
  },
  opts = {
    window = {
      options = {
        signcolumn = "no",  -- disable signcolumn
        number = true,      -- disable number column
        relativenumber = false, -- disable relative numbers
      },
    },
    plugins = {
      twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = false }, -- disables git signs
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
