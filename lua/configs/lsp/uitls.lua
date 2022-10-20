local tbl = require("utils.table")
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end
local M = {}

M.codelens_refresh = function(client, bufnr)
	local status_ok, codelens_supported = pcall(function()
		return client.supports_method("textDocument/codeLens")
	end)
	if not status_ok or not codelens_supported then
		return
	end
	local group = "lsp_code_lens_refresh"
	local cl_events = { "BufEnter", "InsertLeave" }
	local ok, cl_autocmds = pcall(vim.api.nvim_get_autocmds, {
		group = group,
		buffer = bufnr,
		event = cl_events,
	})

	if ok and #cl_autocmds > 0 then
		return
	end
	vim.api.nvim_create_augroup(group, { clear = false })
	vim.api.nvim_create_autocmd(cl_events, {
		group = group,
		buffer = bufnr,
		callback = vim.lsp.codelens.refresh,
	})
end

M.highlight = function(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		local highlight_ok, _ = pcall(require, "illuminate")
		if not highlight_ok then
			local lsp_highlight_grp = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.schedule(vim.lsp.buf.document_highlight)
				end,
				group = lsp_highlight_grp,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("CursorMoved", {
				callback = function()
					vim.schedule(vim.lsp.buf.clear_references)
				end,
				group = lsp_highlight_grp,
				buffer = bufnr,
			})
		end
	end
end

-- mason get list installed servers
M.get_servers_installed = function()
	local _, list_servers = pcall(function()
		return mason_lspconfig.get_installed_servers()
	end)
	return list_servers or {}
end

-- @Params list servers
-- @Return []string
M.get_available_servers = function(filter)
	local _, support_servers = pcall(function()
		return mason_lspconfig.get_available_servers(filter)
	end)
	return support_servers or {}
end

M.is_client_active = function(name)
	local clients = vim.lsp.get_active_clients()
	return tbl.find_first(clients, function(client)
		vim.notify_once(string.format("LSP: [%s]", name), vim.log.levels.INFO)
		return client.name == name
	end)
end

M.resolve_config = function(servers, opts)
	for _, server_name in pairs(servers) do
		local has_custom_opts, server_custom_opts = pcall(require, "configs.lsp.custom-configs." .. server_name)
		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end
	end
	return opts
end

M.launch_server = function(server_name, config)
	pcall(function()
		require("lspconfig")[server_name].setup(config)
	end)
end

return M
