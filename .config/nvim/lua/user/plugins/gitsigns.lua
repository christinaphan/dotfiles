return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "+" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  },
  -- stylua: ignore
  keys = {
    { "<leader>gl", ":Gitsign setqflist('all')<CR>" },
    { "<leader>gs", function() require("gitsigns").stage_hunk() end },
    { "<leader>gs", function() require("gitsigns").stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, mode="v" },
    { "<leader>gr", function() require("gitsigns").reset_hunk() end },
    { "<leader>gr", function() require("gitsigns").reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, mode="v" },
    { "<leader>gp", function() require("gitsigns").preview_hunk() end },
  }
,
}
