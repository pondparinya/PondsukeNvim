local opt = vim.opt
local g = vim.g

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	cursorline = true, -- highlight the current line
	expandtab = true, -- convert tabs to spaces
	fileencoding = "utf-8", -- the encoding written to a file
	fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
	history = 100, -- Number of commands to remember in a history table
	ignorecase = true, -- ignore case in search patterns
	laststatus = 3, -- globalstatus
	conceallevel = 0, -- so that `` is visible in markdown files
	lazyredraw = true, -- lazily redraw screen
	mouse = "a", -- allow the mouse to be used in neovim
	number = true, -- set numbered lines
	preserveindent = true, -- Preserve indent structure as much as possible
	pumheight = 10, -- pop up menu height
	relativenumber = false, -- set relative numbered lines
	scrolloff = 8, -- is one of my fav
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	sidescrolloff = 8,
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	smartcase = true, -- smart case
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	hlsearch = true, -- highlight all matches on previous search pattern
	showtabline = 2, -- always show tabs
	smartindent = true, -- make indenting smarter again
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	tabstop = 2, -- insert 2 spaces for a tab
	numberwidth = 4, -- set number column width to 2 {default 4}
	wrap = false, -- display lines as one long line
	guifont = "monospace:h17", -- the font used in graphical neovim applications
}
local global = {
	mapleader = ",",
	maplocalleader = ",",
	highlighturl_enabled = true, -- highlight URLs by default
	zipPlugin = false, -- disable zip
	load_black = false, -- disable black
	loaded_2html_plugin = true,
	loaded_getscript = true,
	loaded_getscriptPlugin = true,
	loaded_gzip = true,
	loaded_logipat = true,
	loaded_netrw = true,
	loaded_netrwPlugin = true,
	loaded_netrwSettings = true,
	loaded_netrwFileHandlers = true,
	loaded_matchit = true,
	loaded_tar = true,
	loaded_tarPlugin = true,
	loaded_rrhelper = true,
	loaded_spellfile_plugin = true,
	loaded_vimball = true,
	loaded_vimballPlugin = true,
	loaded_zip = true,
	loaded_zipPlugin = true,
	loaded_tutor = true,
	loaded_rplugin = true,
	loaded_syntax = true,
	loaded_synmenu = true,
	loaded_optwin = true,
	loaded_compiler = true,
	loaded_bugreport = true,
	loaded_ftplugin = true,
}

for k, v in pairs(options) do
	opt[k] = v
end

for k, v in pairs(global) do
	g[k] = v
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd([[set nofoldenable]])

