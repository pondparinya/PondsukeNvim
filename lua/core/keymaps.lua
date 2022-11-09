local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<SPACE>", "<Nop>", opts)
-- vim.g.mapleader = "<space>"
-- vim.g.maplocalleader = "<space>"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tab buffers
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "q", ":q<CR>", opts)
keymap("n", "Q", ":q!<CR>", opts)
keymap("n", "<C-\\>", ":BufferLineGroupClose ungrouped<CR>", opts)
keymap("n", "<C-x>", ":Bdelete<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-Left>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<S-Right>", ":BufferLineMoveNext<CR>", opts)

-- Insert mode
keymap("i", "<C-h>", "<C-o>h", opts)
keymap("i", "<C-j>", "<C-o>j", opts)
keymap("i", "<C-l>", "<C-o>l", opts)
keymap("i", "<C-k>", "<C-o>k", opts)
keymap("i", "jk", "<ESC>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<a-j>", ":move '>+1<cr>gv-gv", opts)

-- Visual --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Formatting
keymap("n", "<C-f>", ":Format<CR>", opts)

-- Resize with arrows
keymap("n", "_", ": vertical resize -2<CR>", opts)
keymap("n", "+", ": vertical resize +2<CR>", opts)
keymap("n", "{", ": resize -2<CR>", opts)
keymap("n", "}", ": resize +2<CR>", opts)
