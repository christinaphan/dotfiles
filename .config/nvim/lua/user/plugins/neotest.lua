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
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({}),
        require("neotest-jest")({
          jest_test_discovery = true,
          env = { CI = "true" },
          cwd = function(path)
            local hit = vim.fs.find(
              { "pnpm-workspace.yaml", "package-lock.json", "pnpm-lock.yaml", "yarn.lock", "nx.json", ".git" },
              { upward = true, path = path }
            )[1]
            return (hit and vim.fs.dirname(hit)) or vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
  -- stylua: ignore
  keys = {
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest (Neotest)" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File (Neotest)" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
    { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel (Neotest)" },
  },
}
