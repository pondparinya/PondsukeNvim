-- local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
-- if not mason_lspconfig_ok then
-- 	return
-- end
-- local lspconfig = require("lspconfig")

-- local servers = { "sumneko_lua" }

-- local opts = {
-- 	on_attach = handlers.on_attach,
-- 	capabilities = handlers.common_capabilities,
-- 	-- flags = {
-- 	-- 	debounce_text_changes = 150,
-- 	-- },
-- }

-- mason_lspconfig.setup({
-- 	-- ensure_installed = vim.tbl_keys(servers),
-- 	ensure_installed = servers,
-- 	automatic_installation = false,
-- })

-- mason_lspconfig.setup_handlers({
-- 	function(server_name)
-- 		opts = utils.resolve_config(servers, opts)
-- 		lspconfig[server_name].setup(opts)
-- 	end,
-- })
