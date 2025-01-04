return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
      },
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          handlers = {
            black = function(source_name, methods)
              require("null-ls").register(
                require("null-ls").builtins.formatting.black.with({ extra_args = { "--fast" } })
              )
            end,
            clang_format = function(source_name, methods)
              require("null-ls").register(require("null-ls").builtins.formatting.clang_format.with({
                extra_args = { "--style=file" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
              }))
            end,
            stylua = function(source_name, methods)
              require("null-ls").register(require("null-ls").builtins.formatting.stylua.with({
                extra_args = { "--indent_type=Spaces" },
              }))
            end,
          },
        },
      },
    },
    opts = {
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    },
    ft = { "python", "c", "cpp", "lua", "html", "css", "javascript", "typescript", "java" }
  }
}
