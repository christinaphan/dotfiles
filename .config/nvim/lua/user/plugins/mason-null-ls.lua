return {
  "jay-babu/mason-null-ls.nvim",
  opts = {
    ensure_installed = {
      "clang_format",
      "black",
      "stylua",
      "prettierd",
    },
    automatic_installation = true,
    handlers = {},
  },
  dependencies = {
    { "mason-org/mason.nvim", cmd = "Mason", opts = {} },
    {
      "nvimtools/none-ls.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      opts = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        return {
          sources = {
            null_ls.builtins.formatting.black.with({
              extra_args = { "--fast" },
            }),
            null_ls.builtins.formatting.clang_format.with({
              extra_args = { "--style=file" },
            }),
            null_ls.builtins.formatting.stylua.with({
              extra_args = {
                "--config-path",
                "/dev/null",
                "--indent-type",
                "Spaces",
                "--indent-width",
                "2",
              },
            }),
            null_ls.builtins.formatting.prettierd.with({
              filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "jsonc",
                "yaml",
                "graphql",
                "handlebars",
              },
            }),
          },
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({
                    bufnr = bufnr,
                    filter = function(_client)
                      return _client.name == "null-ls"
                    end,
                  })
                end,
              })
            end
          end,
        }
      end,
    },
  },
  event = { "BufReadPre", "BufNewFile" },
}
