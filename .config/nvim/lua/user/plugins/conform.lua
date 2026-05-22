return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo", "Format" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "n",
      desc = "Format buffer",
      noremap = true,
      silent = true,
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "biome" },
      typescript = { "biome" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = { timeout_ms = 1000 },
    formatters = {
      biome = {
        append_args = {
          "--indent-style",
          "space",
        },
      },
      black = {
        prepend_args = {
          "--fast",
        },
      },
      stylua = {
        append_args = {
          "--config-path",
          "/dev/null",
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= 1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
  end,
}
