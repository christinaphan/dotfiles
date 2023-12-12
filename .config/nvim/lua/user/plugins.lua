-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- the colorscheme should be available when starting Neovim
	{
		"rose-pine/neovim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		name = "rose-pine",
		init = function()
			require("rose-pine").setup()
		end,
		config = function()
			require("user.colorscheme")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("user.lualine")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("user.gitsigns")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("user.nvim-tree")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		config = function()
			require("user.bufferline")
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "VeryLazy" },
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "VeryLazy" },
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "VeryLazy" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("user.cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("user.luasnip")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "VeryLazy" },
		build = ":TSUpdate",
		config = function()
			require("user.treesitter")
		end,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		lazy = false,
		priority = 1000,
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("user.telescope")
		end,
	},
	{
		"lervag/vimtex",
		ft = "tex",
		init = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_view_skim_sy = 1
			vim.g.vimtex_view_skim_activate = 1
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}

local opts = {
	defaults = {
		lazy = true,
	},
	lockfile = vim.fn.stdpath("config") .. "/plugin/lazy-lock.json",
}
require("lazy").setup(plugins, opts)
