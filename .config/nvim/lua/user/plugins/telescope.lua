return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            ["J"] = actions.move_selection_next,
            ["K"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
          layout_config = {
            height = 0.70,
          },
        },
      },
    }
  end,
  keys = {
    {
      "<leader>ff",
      function()
        return require("telescope.builtin").find_files()
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>fg",
      function()
        return require("telescope.builtin").live_grep()
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>fb",
      function()
        return require("telescope.builtin").buffers()
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>ss",
      function()
        local builtin = require("telescope.builtin")
        local theme = require("telescope.themes")
        return builtin.spell_suggest(theme.get_cursor({
          prompt_title = "",
          layout_config = {
            height = 0.25,
            width = 0.25,
          },
        }))
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
  },
}
