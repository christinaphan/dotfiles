return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              "clangd",
              "lua_ls",
              "html",
              "cssls",
              "ts_ls",
              "pyright",
              "bashls",
            },
          })
          require("mason-lspconfig").setup_handlers({
            function(server_name) -- default handler (optional)
              require("lspconfig")[server_name].setup {}
            end,
            -- Dedicated handler
            ["jdtls"] = function()
              require("lspconfig").jdtls.setup {}
            end,
            ["clangd"] = function()
              require("lspconfig").clangd.setup({
                cmd = {
                  "clangd",
                  "--enable-config",
                  "--background-index",
                },
              })
            end,
            ["lua_ls"] = function()
              require("lspconfig").lua_ls.setup({
                settings = {
                  Lua = {
                    diagnostics = {
                      globals = { "vim" },
                    },
                    workspace = {
                      library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                      },
                    },
                  },
                },
              })
            end,
            ["html"] = function()
              local capabilities = vim.lsp.protocol.make_client_capabilities()
              capabilities.textDocument.completion.completionItem.snippetSupport = true
              require("lspconfig").html.setup({
                capabilities = capabilities,
              })
            end,
            ["cssls"] = function()
              local capabilities = vim.lsp.protocol.make_client_capabilities()
              capabilities.textDocument.completion.completionItem.snippetSupport = true
              require("lspconfig").cssls.setup({
                capabilities = capabilities,
              })
            end,
          })
        end,
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, noremap = true, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
          vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
          vim.keymap.set("n", "<leader>f", ":Format<CR>", opts)
        end,
      })
      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = "",
        })
      end
      sign({ name = "DiagnosticSignError", text = "" })
      sign({ name = "DiagnosticSignWarn", text = "" })
      sign({ name = "DiagnosticSignHint", text = "" })
      sign({ name = "DiagnosticSignInfo", text = "" })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
      vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        update_in_insert = true,
        underline = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
