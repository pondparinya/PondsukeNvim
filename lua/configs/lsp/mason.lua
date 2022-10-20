local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local icons = require("utils.icons")


local options = {
	ui = {
		-- border = "none",
		icons = {
			package_installed = icons.lsp.server_installed,
			package_pending = icons.lsp.server_pending,
			package_uninstalled = icons.lsp.server_uninstalled,
		},
	},
	-- log_level = vim.log.levels.INFO,
}
mason.setup(options)
