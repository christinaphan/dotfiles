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
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next hunk")
      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Prev hunk")

      -- Staging
      map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
      map("v", "<leader>gs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk (visual)")
      map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")

      -- Reset
      map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>gr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk (visual)")
      map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

      -- Preview
      map("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk inline")
      map("n", "<leader>gP", gs.preview_hunk, "Preview hunk (float)")

      -- Toggle in-line diff
      map("n", "<leader>gd", function()
        gs.toggle_deleted()
        gs.toggle_linehl()
        gs.toggle_word_diff()
      end, "Toggle inline diff")

      -- Blame
      map("n", "<leader>gb", function()
        gs.blame_line()
      end, "Blame line")
      map("n", "<leader>gB", gs.blame, "Blame file")

      -- Quickfix list of hunks
      map("n", "<leader>gq", ":Gitsigns setqflist<CR>")
    end,
  },
}
