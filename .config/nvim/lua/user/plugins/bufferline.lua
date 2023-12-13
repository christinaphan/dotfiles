return {
  "akinsho/bufferline.nvim",
  event = "VimEnter",
  opts = {
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      numbers = "none",
      close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      indicator = {
        icon = "▎", -- this should be omitted if indicator style is not 'icon'
        style = "icon",
      },
      modified_icon = "●",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,
      diagnostics = false,
      diagnostics_update_in_insert = false,
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      separator_style = "thin",
      enforce_regular_tabs = true,
      always_show_bufferline = false,
    },
  },
  keys = {
    {
      "<leader>1",
      function()
        return require("bufferline").go_to_buffer(1, true)
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>2",
      function()
        return require("bufferline").go_to_buffer(2, true)
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>3",
      function()
        return require("bufferline").go_to_buffer(3, true)
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>4",
      function()
        return require("bufferline").go_to_buffer(4, true)
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>5",
      function()
        return require("bufferline").go_to_buffer(5, true)
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
    {
      "<leader>6",
      function()
        return require("bufferline").go_to_buffer(6, true)
      end,
      noremap = true,
      silent = true,
      mode = "n",
    },
  },
}
