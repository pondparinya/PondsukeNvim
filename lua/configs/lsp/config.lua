local M = {}
local icons = require("utils.icons")

-- 	-- Config for Diagnostic lsp
M.Diagnostics = {
	signs = {
		-- active = true,
		values = {
			{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
			{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
			{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
			{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
		},
	},
	virtual_text = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		format = function(d)
			local code = d.code or (d.user_data and d.user_data.lsp.code)
			if code then
				return string.format("%s [%s]", d.message, code):gsub("1. ", "")
			end
			return d.message
		end,
	},
}

-- Config for vim.lsp.handle
M.float = {
	focusable = true,
	style = "minimal",
	border = "rounded",
}

-- Config for "tamago324/nlsp-settings.nvim"
M.nlsp_settings = {
	setup = {
		config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
		append_default_schemas = true,
		ignored_servers = {},
		loader = "json",
	},
}

return M
