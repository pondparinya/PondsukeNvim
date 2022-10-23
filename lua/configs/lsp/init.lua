local M = {}
M.setup = function()
	require("configs.lsp.installer")
	require("configs.lsp.null-ls")
end

return M
