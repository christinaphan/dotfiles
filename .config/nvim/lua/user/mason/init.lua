require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	-- Default handler
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
	-- Dedicated handler
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
})
require("user.mason.keybinds")
require("user.mason.diagnostics")
require("user.mason.null-ls")
