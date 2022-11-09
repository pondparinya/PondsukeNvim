local options = {
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  backspace = vim.opt.backspace + { "nostop" }, -- Don't stop backspace at insert
  cmdheight = 0, -- hide command line unless needed
  copyindent = true, -- Copy the previous indentation on autoindenting
  fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
  history = 100, -- Number of commands to remember in a history table
  laststatus = 3, -- globalstatus
  lazyredraw = true, -- lazily redraw screen
  preserveindent = true, -- Preserve indent structure as much as possible
}

local globals = {
  highlighturl_enabled = true, -- highlight URLs by default
  mapleader = " ", -- set leader key
  zipPlugin = false, -- disable zip
  load_black = false, -- disable black
  loaded_2html_plugin = true, -- disable 2html
  loaded_getscript = true, -- disable getscript
  loaded_getscriptPlugin = true, -- disable getscript
  loaded_gzip = true, -- disable gzip
  loaded_logipat = true, -- disable logipat
  loaded_matchit = true, -- disable matchit
  loaded_netrwFileHandlers = true, -- disable netrw
  loaded_netrwPlugin = true, -- disable netrw
  loaded_netrwSettngs = true, -- disable netrw
  loaded_remote_plugins = true, -- disable remote plugins
  loaded_tar = true, -- disable tar
  loaded_tarPlugin = true, -- disable tar
  loaded_zip = true, -- disable zip
  loaded_zipPlugin = true, -- disable zip
  loaded_vimball = true, -- disable vimball
  loaded_vimballPlugin = true, -- disable vimball
  autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
  cmp_enabled = true, -- enable completion at start
  autopairs_enabled = true, -- enable autopairs at start
  diagnostics_enabled = true, -- enable diagnostics at start
  status_diagnostics_enabled = true, -- enable diagnostics in statusline
  icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
