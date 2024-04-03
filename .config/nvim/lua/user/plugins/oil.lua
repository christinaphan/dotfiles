return {
  "stevearc/oil.nvim",
  opts = {
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true
    }
  },
  event = { "VimEnter", "BufNew" },
  keys = {
    {
      "-",
      function()
        require('oil').open()
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>e",
      function()
        require('oil').open()
      end,
      noremap = true,
      silent = true,
      mode = "n",
    }
  }
}
