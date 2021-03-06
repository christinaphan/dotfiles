local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Formatter
keymap("n", "<leader>f", ":Format<CR>", opts)

-- Zen Mode (with Twilight)
keymap("n", "<leader>z", ":ZenMode<CR>", opts)

-- Bufferline (navigate buffer "tabs")
keymap("n", "<leader>1", ":lua require('bufferline').go_to_buffer(1, true)<CR>", opts)
keymap("n", "<leader>2", ":lua require('bufferline').go_to_buffer(2, true)<CR>", opts)
keymap("n", "<leader>3", ":lua require('bufferline').go_to_buffer(3, true)<CR>", opts)
keymap("n", "<leader>4", ":lua require('bufferline').go_to_buffer(4, true)<CR>", opts)
keymap("n", "<leader>5", ":lua require('bufferline').go_to_buffer(5, true)<CR>", opts)
keymap("n", "<leader>6", ":lua require('bufferline').go_to_buffer(6, true)<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
