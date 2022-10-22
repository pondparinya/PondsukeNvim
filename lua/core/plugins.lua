---> Automatically install packer
local ensure_packer = pondnvim.initial_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.api.nvim_err_writeln("Failed to load packer at:" .. pondnvim.packer_path)
	return
end

-- Have packer use a popup window
-- packer.init(pondnvim.packer_config)
packer.init({
	-- compile_path = pondnvim.compile_path,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	profile = {
		enable = true,
		threshold = 1,
	},
	git = {
		clone_timeout = 300,
		subcommands = {
			update = "pull --rebase",
		},
	},
	auto_clean = true,
	compile_on_sync = true,
})

-- Install your plugins here
return packer.startup(function(use)
	-- [Plugins Manager]
	use({ "wbthomason/packer.nvim" })

	-- [Optimizer]
	use("lewis6991/impatient.nvim")
	use({ "nvim-lua/plenary.nvim", module = "plenary" })

	-- [Dashboard]
	use({
		"goolord/alpha-nvim",
		config = function()
			require("configs.alpha")
		end,
	})
	--[Which-key]--
	use({
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("configs.whichkey")
		end,
	})

	-- [Icons]
	use({
		"onsails/lspkind-nvim",
		module = "lspkind",
		config = function()
			require("configs.lspkind")
		end,
	})

	-- [Package Manager]
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp.handler").setup()
		end,
	})
	use({
		"williamboman/mason.nvim",
		config = function()
			require("configs.lsp.mason")
		end,
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.lsp.installer")
		end,
	})
	use("b0o/schemastore.nvim")

	-- [Snippets]
	use({ "rafamadriz/friendly-snippets", opt = true })
	use({
		"L3MON4D3/LuaSnip",
		module = "luasnip",
		wants = "friendly-snippets",
		config = function()
			require("configs.snip").setup()
		end,
	})

	-- [CMP]
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		-- event = "BufEnter",
		config = function()
			require("configs.cmp")
		end,
	})
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })

	use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
	use({ "lukas-reineke/cmp-rg", after = "nvim-cmp" })
	use({ "ray-x/cmp-treesitter", after = "nvim-cmp" })

	----------------------------------------------

	-------------------[Legendary]----------------
	use({
		"mrjones2014/legendary.nvim",
		opt = true,
		keys = { [[<C-p>]] },
		-- wants = { "dressing.nvim" },
		module = { "legendary" },
		cmd = { "Legendary" },
		config = function()
			require("configs.legendary").setup()
		end,
		-- requires = { "stevearc/dressing.nvim" },
	})
	----------------------------------------------

	-- Code documentation
	-- use({
	-- 	"danymat/neogen",
	-- 	config = function()
	-- 		require("config.neogen").setup()
	-- 	end,
	-- 	cmd = { "Neogen" },
	-- 	module = "neogen",
	-- 	disable = false,
	-- })

	--[Aerial]--
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
		module = { "aerial" },
		cmd = { "AerialToggle" },
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		module = { "toggleterm", "toggleterm.terminal" },
		config = function()
			require("configs.toggleterm")
		end,
	})

	-- Autoparis
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("configs.autopairs").setup()
		end,
	})

	-- Notification
	use({
		"rcarriga/nvim-notify",
		event = "VimEnter",
		config = function()
			-- require("configs.notify")
		end,
	})

	-- Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("configs.colorizer")
		end,
	})
	-- Auto Close Tag
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-telescope/telescope-file-browser.nvim" },
		config = function()
			require("configs.telescope.init")
		end,
	})

	-- Commentary

	use({ "tpope/vim-commentary" })

	-- Nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- icons
		},
		config = function()
			require("configs.nvimtree")
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
			require("configs.treesitter").setup()
		end,
	})

	-- Status Line
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.status_lualine")
		end,
	})

	-- Tab Line
	use({
		"akinsho/bufferline.nvim",
		-- tag = "v2.*",
		config = function()
			require("configs.tab_bufferline").setup()
		end,
	})
	use({ "moll/vim-bbye" })

	-- Indent-blankline
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("configs.blankline")
		end,
	})

	-- Gitsign
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsign").setup()
		end,
	})

	-- Formatting
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("configs.formatting")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if not ensure_packer then
		require("packer").sync()
	end
end)
