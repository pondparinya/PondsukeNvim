local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- local conditions = {
-- 	buffer_not_empty = function()
-- 		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
-- 	end, hide_in_width = function()
-- 		return vim.fn.winwidth(0) > 80
-- 	end,
-- 	check_git_workspace = function()
-- 		local filepath = vim.fn.expand("%:p:h")
-- 		local gitdir = vim.fn.finddir(".git", filepath .. ";")
-- 		return gitdir and #gitdir > 0 and #gitdir < #filepath
-- 	end,
-- }
-- Component options
local comp = {

	-- Component Mode
	Mode = {
		"mode",
		fmt = function(str)
			return " " .. str
			-- ──
		end,
		separator = { left = "", right = "" },
		right_padding = 1,
	},

	-- Component Fileinfo
	Filetype = {
		"filetype",
		colored = true,
		icon_only = true,
		icon = { align = "right" },
	},

	Filename = {
		"filename",
		file_status = true,
		path = 1,
		-- shorting_target = 40,
		symbols = {
			-- modified = "[+]",
			-- readonly = "[-]",
			unnamed = "[No Name]",
		},
	},

	Diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic", "nvim_lsp" },
		sections = { "error", "warn" },
		symbols = { error = " ", warn = " " },
		colored = true,
		update_in_insert = false,
		always_visible = false,
	},

	-- Component Git
	Git = {
		"branch",
		icon = { " " },
	},

	Diff = {
		"diff",
		colored = true,
		symbols = { added = " ", modified = " ", removed = " " },
	},

	-- Component LSP
	Lsp = {
		"progress",
		fmt = function()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end,
		icon = " LSP:",
	},
}
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { comp.Mode },
		lualine_b = { comp.Git, comp.Diff },
		lualine_c = {},
		lualine_x = { comp.Filetype, comp.Filename, comp.Diagnostics },
		lualine_y = { comp.Lsp },
		lualine_z = { { "%l:%c", separator = { right = "" } } },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
