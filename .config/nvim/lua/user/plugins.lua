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
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("user.colorscheme")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		config = function()
			require("user.lualine")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("user.gitsigns")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = function()
			require("user.nvim-tree")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		config = function()
			require("user.bufferline")
		end,
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("user.hardtime")
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
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
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			require("user.cmp")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
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
}

local opts = {
	defaults = {
		lazy = true,
	},
	lockfile = vim.fn.stdpath("config") .. "/plugin/lazy-lock.json",
}
require("lazy").setup(plugins, opts)
