local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = function(lang, buf)
			if lang == "tex" or lang == "latex" then
				return true
			end
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },
})
