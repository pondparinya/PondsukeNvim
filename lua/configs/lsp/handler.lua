local M = {}
local configs = require("configs.lsp.config")
local utils = require("configs.lsp.utils")
-- local keymap = vim.keymap.set

M.on_attach = function(client, bufnr)
	local caps = client.server_capabilities

	-- Setup omnifunc
	if caps.completionProvider then
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	end

	-- Setup format expr
	if caps.documentFormattingProvider then
		vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
	end

	-- Setup Keymapping LSP & Whick-key
	require("configs.lsp.keymaps").setup(client, bufnr)

	require("configs.lsp.null-ls.formatters").setup(client, bufnr)

	-- Setup highlighting
	if pondnvim.lsp.document_highlight then
		utils.highlight(client, bufnr)
	end

	-- Setup CodeLens
	if pondnvim.lsp.code_lens_refresh then
		utils.codelens_refresh(client, bufnr)
	end

	-- Setup nvim-navic
	if pondnvim.lsp.nvim_navic then
		if caps.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end
	end

	-- Setup tagfunc
	if pondnvim.lsp.tag_func then
		if caps.definitionProvider then
			vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
		end
	end

	-- Setup aerial.nvim
	if pondnvim.lsp.aerial then
		require("aerial").on_attach(client, bufnr)
	end

	-- Setup semantic highlighting
	if pondnvim.lsp.semantic_highlighting then
		if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
			local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
			vim.api.nvim_create_autocmd("TextChanged", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.semantic_tokens_full()
				end,
			})
			-- fire it first time on load as well
			vim.lsp.buf.semantic_tokens_full()
		end
	end
end
M.common_capabilities = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
	end

	return capabilities
end

M.common_opts = {
	on_attach = M.on_attach,
	capabilities = M.common_capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

M.setup = function()
	-- Diagnostic configuration
	for _, sign in ipairs(configs.Diagnostics.signs.values) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	-- LSP handlers configuration
	vim.diagnostic.config({
		virtual_text = configs.Diagnostics.virtual_text,
		signs = configs.Diagnostics.signs,
		underline = configs.Diagnostics.underline,
		update_in_insert = configs.Diagnostics.update_in_insert,
		severity_sort = configs.Diagnostics.severity_sort,
		float = configs.Diagnostics.float,
	})

	-- Hover configuration
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, configs.float)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, configs.float)
end
return M
