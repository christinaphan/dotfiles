local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
require("mason-null-ls").setup({
	handlers = {
		black = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }))
		end,
		clang_format = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.clang_format.with({ extra_args = { "--style=file" } }))
		end,
		stylua = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.stylua)
		end,
	},
})
null_ls.setup({
	debug = false,
	-- formatting on save
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
})
