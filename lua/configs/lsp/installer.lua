local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local handlers = require("configs.lsp.handler")

local servers = require("configs.lsp.servers")

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local opts = {}

for _, server_name in pairs(servers) do
	opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.common_capabilities(),
		flags = {
			debounce_text_changes = 150,
		},
	}
	server_name = vim.split(server_name, "@")[1]

	local has_custom_opts, server_custom_opts = pcall(require, "configs.lsp.custom-configs." .. server_name)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	lspconfig[server_name].setup(opts)
end
