local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local mappings = require("plugins.configs.telescope.mappings")
local picker = require("plugins.configs.telescope.picker")
local extension = require("plugins.configs.telescope.extension")

local options = {
	extensions_list = {
		-- "file_browser",
	},
	defaults = {
		-- vimgrep_arguments = {
		-- 	"rg",
		-- 	"--color=never",
		-- 	"--no-heading",
		-- 	"--with-filename",
		-- 	"--line-number",
		-- 	"--column",
		-- 	"--smart-case",
		-- },
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},

		prompt_prefix = " ",
		selection_caret = " ",
		mappings = mappings,
	},
	picker = picker,
	-- pickers = {
	-- find_files = {
	-- hidden = true
	-- }
	-- },
	extensions = extension,
}

telescope.setup(options)
-- load extensions
pcall(function()
	for _, ext in ipairs(options.extensions_list) do
		telescope.load_extension(ext)
	end
end)
