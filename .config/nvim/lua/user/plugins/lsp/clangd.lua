vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--enable-config",
    "--background-index",
  },
})
