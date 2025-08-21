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
  event = { "VeryLazy" },
}
