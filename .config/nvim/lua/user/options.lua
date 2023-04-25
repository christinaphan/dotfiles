-- :help options
vim.opt.backup = false -- creates a backup file
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.incsearch = true -- incrementally search
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.smartindent = true                      -- make indenting smarter again (i use treesitter now)
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.undolevels = 10000 -- enable lots of undo history
vim.opt.undoreload = 10000 -- enable lots of undo history
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.softtabstop = 2 -- insert 2 spaces for a soft tab
vim.opt.expandtab = true -- turn tabs into spaces
vim.opt.linebreak = true -- wrap text at end of word
vim.opt.autoindent = true -- copy indentation of current line to new line
vim.opt.cursorline = true -- highlight the current line
vim.opt.shiftround = true -- alway round indent to multiple of shiftwidth
vim.opt.number = true -- set numbered lines
vim.opt.ruler = true -- set ruler
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes:1" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = true -- wrap lines as needed
vim.opt.guifont = "Source Code Pro:h12" -- the font used in graphical neovim applications
vim.opt.guicursor = "a:block" -- always have block mode cursor
vim.opt.wildmenu = true -- enable cmd line completion
vim.opt.foldmethod = "manual" -- enable manual folds

vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
vim.cmd([[set path+=**]]) -- search files in subdirectories
vim.cmd([[set undodir=/Users/christina/.config/nvim/undo]]) -- save undodir in ~/.config/nvim

-- Remove leading and trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})
