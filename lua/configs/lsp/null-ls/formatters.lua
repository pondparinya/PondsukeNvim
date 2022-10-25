local M = {}
local nls_sources = require("null-ls.sources")
local method = require("null-ls").methods.FORMATTING

local api = vim.api

M.autoformat = true

M.format = function()
  if M.autoformat then
    local view = vim.fn.winsaveview()
    vim.lsp.buf.formatting_sync()
    -- vim.lsp.buf.format({ async = true })
    vim.fn.winrestview(view)
  end
end

M.has_formatter = function(filetype)
  local available = nls_sources.get_available(filetype, method)
  return #available > 0
end

M.setup = function(client, bufnr)
  local filetype = api.nvim_buf_get_option(bufnr, "filetype")

  local enable = false
  if M.has_formatter(filetype) then
    enable = client.name == "null-ls"
  else
    enable = not (client.name == "null-ls")
  end

  if not enable then
    return
  end

  client.server_capabilities.documentFormattingProvder = enable
  client.server_capabilities.documentRangeFormattingProvider = enable
  if client.server_capabilities.documentFormattingProvider then
    local lsp_format_grp = api.nvim_create_augroup("LspFormat", { clear = true })
    api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        -- vim.schedule(M.format)
        M.format()
      end,
      group = lsp_format_grp,
      buffer = bufnr,
    })
  end
end

return M
