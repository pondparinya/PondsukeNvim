local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tab buffers
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-x>", ":q<CR>", opts)
keymap("n", "<C-\\>", ":BufferLineGroupClose ungrouped<CR>", opts)
keymap("n", "<C-q>", ":Bdelete<CR>", opts)
-- keymap("n", "<C-\\>", "<ESC><cmd>lua require('core.lazy_load').closeAllBufs()<CR>", opts)
-- keymap("n", "<C-q>", "<ESC><cmd>lua require('core.lazy_load').close_buffer()<CR>", opts)

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
-- keymap("n", "<leader>", ":FormatWrite<CR>", opts)

-- Nvim Tree
keymap("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", opts)
-- keymap("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", opts)

-- -- telescope
-- keymap("n", "<leader>f", ": telescope find_files <cr>", opts)
-- keymap("n", "<leader>p", ": telescope file_browser <cr>", opts)

-- Resize with arrows
keymap("n", "_", ": vertical resize -2<CR>", opts)
keymap("n", "+", ": vertical resize +2<CR>", opts)
keymap("n", "{", ": resize -2<CR>", opts)
keymap("n", "}", ": resize +2<CR>", opts)


-- keymap("n", "<leader>Left", ":vertical resize -2<CR>", opts)
-- keymap("n", "<leader>Right", ":vertical resize +2<CR>", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
