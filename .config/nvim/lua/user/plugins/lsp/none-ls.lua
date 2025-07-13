return {
  {
    "nvimtools/none-ls.nvim",
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
          ensure_installed = { "black", "clang_format", "stylua" },
          automatic_installation = true,
          handlers = {},
        },
      },
    },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.black.with({
            extra_args = { "--fast" },
          }),
          null_ls.builtins.formatting.clang_format.with({
            extra_args = { "--style=file" },
          }),
          null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent_type=Spaces" },
          }),
        },
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
      }
    end,
    ft = { "python", "c", "cpp", "lua", "html", "css", "javascript", "typescript", "java", "typescriptreact" }
  }
}
