local M = {}

function M.setup()
	local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end
	treesitter.setup({
		-- ensure_installed = "all", -- one of "all" or a list of languages
		ensure_installed = { "lua", "go" },
		ignore_install = { "" }, -- List of parsers to ignore installing
		-- highlight = {
		-- 	enable = true, -- false will disable the whole extension
		-- 	use_languagetree = true,
		-- },
		autopairs = { enable = true },
		autotag = { enable = true },
		incremental_selection = { enable = true },
		-- indent = { enable = false },
		highlight = { enable = true },

		-- Automatically install missing parsers when entering buffer
		-- auto_install = true,
	})
end

return M
