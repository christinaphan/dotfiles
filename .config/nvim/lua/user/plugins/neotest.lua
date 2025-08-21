return {
  "nvim-neotest/neotest",
  commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "mfussengger/nvim-dap",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({}),
        require("neotest-jest")({
          jest_test_discovery = true,
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
  -- stylua: ignore
  keys = {
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File (Neotest)" },
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest (Neotest)" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
    { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel (Neotest)" },
  },
}
