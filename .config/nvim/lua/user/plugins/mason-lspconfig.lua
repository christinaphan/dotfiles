return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "html",
      "cssls",
      "tailwindcss",
      "ts_ls",
      "pyright",
      "bashls",
      "eslint",
      "clangd",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", cmd = "Mason", opts = {} },
    "neovim/nvim-lspconfig",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts)
    require("mason-lspconfig").setup({ opts })

    require("user.plugins.lsp.lua_ls")
    require("user.plugins.lsp.html")
    require("user.plugins.lsp.cssls")
    require("user.plugins.lsp.eslint")
    require("user.plugins.lsp.clangd")
  end,
}
