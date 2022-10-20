local M = {}

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end
local lspconfig = require("lspconfig")

local utils = require("config.lsp.uitls")

local servers = { "sumneko_lua" }

M.setup = function()
	local lspconfig_ok, _ = pcall(require, "lspconfig")
	if not lspconfig_ok then
		return
	end
	local opts = {
		on_attach = require("config.lsp.handler").on_attach,
		capabilities = require("config.lsp.handler").common_capabilities,
		-- flags = {
		-- 	debounce_text_changes = 150,
		-- },
	}
	-- Setup LSP handlers
	require("config.lsp.handler").setup()

	mason_lspconfig.setup({
		-- ensure_installed = vim.tbl_keys(servers),
		ensure_installed = servers,
		automatic_installation = false,
	})

	mason_lspconfig.setup_handlers({
		function(server_name)
			opts = utils.resolve_config(servers, opts)
			lspconfig[server_name].setup(opts)
		end,
	})

	require("config.lsp.null-ls").setup()
end

return M
