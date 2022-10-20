local M = {}
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local icons = require("utils.icons")

M.setup = function()
	mason.setup({
		ui = {
			icons = {
				package_installed = icons.lsp.server_installed,
				package_pending = icons.lsp.server_pending,
				package_uninstalled = icons.lsp.server_uninstalled,
			},
		},
	})
end

return M
