local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugins Manager
	use({ "wbthomason/packer.nvim" })

	-- Dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.alpha")
		end,
	})

	-- Which-key
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.configs.whichkey")
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		module = { "toggleterm", "toggleterm.terminal" },
		config = function()
			require("plugins.configs.toggleterm")
		end,
	})

	-- Autoparis
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins.configs.autopairs")
		end,
	})

	-- Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("plugins.configs.colorizer")
		end,
	})
	-- Auto Close Tag
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-telescope/telescope-file-browser.nvim" },
		config = function()
			require("plugins.configs.telescope.init")
		end,
	})
	use({ "nvim-lua/plenary.nvim", module = "plenary" })

	-- Commentary

	use({ "tpope/vim-commentary" })

	-- Nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- icons
		},
		config = function()
			require("plugins.configs.nvimtree")
		end,
	})

	-- Theme colors
	use({ "navarasu/onedark.nvim" })
	use({ "Mofiqul/dracula.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = { "BufRead", "BufNewFile" },
		-- cmd = {
		-- 	"TSInstall",
		-- 	"TSInstallInfo",
		-- 	"TSInstallSync",
		-- 	"TSUninstall",
		-- 	"TSUpdate",
		-- 	"TSUpdateSync",
		-- 	"TSDisableAll",
		-- 	"TSEnableAll",
		-- },
		config = function()
			require("plugins.configs.treesitter").setup()
		end,
	})

	-- Lsp stuff
	use({
		"williamboman/nvim-lsp-installer",
		cmd = require("core.lazy_load").lsp_cmds,
		setup = function()
			require("core.lazy_load").on_file_open("nvim-lsp-installer")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		after = "nvim-lsp-installer",
		module = "lspconfig",
		config = function()
			require("plugins.configs.lsp.lsp_configs")
		end,
	})

	-- Cmp
	use({ "rafamadriz/friendly-snippets", module = "cmp_nvim_lsp", event = "InsertEnter" })

	use({
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
		config = function()
			require("plugins.configs.cmp").cmp_setup()
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.cmp").luasnip_setup()
		end,
	})

	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })

	use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })

	use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })

	use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })

	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })

	-- Status Line
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.status_lualine")
		end,
	})

	-- Tab Line
	use({
		"akinsho/bufferline.nvim",
		-- tag = "v2.*",
		config = function()
			require("plugins.configs.tab_bufferline").setup()
		end,
	})
	use({ "moll/vim-bbye" })

	-- Indent-blankline
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.blankline")
		end,
	})

	-- Gitsign
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsign").setup()
		end,
	})

	-- Formatting
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.configs.formatting")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
