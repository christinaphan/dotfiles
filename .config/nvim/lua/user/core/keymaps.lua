local opts = { noremap = true, silent = true }

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
-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Toggle location list
vim.keymap.set("n", "<leader>l", function()
  local wins = vim.fn.getloclist(0, { winid = 0 }).winid
  if wins == 0 then
    vim.diagnostic.setloclist()
    vim.cmd("lopen")
  else
    vim.cmd("lclose")
  end
end, { desc = "Toggle loclist (diagnostics)" })

-- Toggle quickfix list
vim.keymap.set("n", "<leader>q", function()
  local wins = vim.fn.getqflist({ winid = 0 }).winid
  if wins == 0 then
    vim.cmd("copen")
  else
    vim.cmd("cclose")
  end
end, { desc = "Toggle quickfix" })

-- Diff getput
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.wo.diff then
      vim.keymap.set("n", "<leader>dh", ":diffget LOCAL<CR>", { buffer = true, desc = "Get from LOCAL (ours)" })
      vim.keymap.set("n", "<leader>dl", ":diffget REMOTE<CR>", { buffer = true, desc = "Get from REMOTE (theirs)" })
    end
  end,
})

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
