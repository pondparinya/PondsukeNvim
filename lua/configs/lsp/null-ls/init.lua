local M = {}
local null_ok, null = pcall(require, "null-ls")
if not null_ok then
  return
end
local nls_utils = require("null-ls.utils")
local handlers = require("configs.lsp.handler")

local b = null.builtins

local with_diagnostics_code = function(builtin)
  return builtin.with({
    diagnostics_format = "#{m} [#{c}]",
  })
end
local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.common_capabilities,
  -- flags = {
  -- 	debounce_text_changes = 150,
  -- },
}

local sources = {
  -- formatting
  b.formatting.prettierd,
  b.formatting.shfmt,
  b.formatting.shellharden,
  b.formatting.fixjson,
  b.formatting.black.with({ extra_args = { "--fast" } }),
  b.formatting.isort,
  b.formatting.stylua,
  b.formatting.google_java_format,
  -- with_root_file(b.formatting.stylua, "stylua.toml"),

  -- diagnostics
  b.diagnostics.write_good,
  -- b.diagnostics.markdownlint,
  b.diagnostics.eslint_d,
  -- b.diagnostics.flake8.with { extra_args = { "--max-line-length=120" } },
  b.diagnostics.tsc,
  -- b.diagnostics.selene,
  -- b.diagnostics.codespell,
  -- with_root_file(b.diagnostics.selene, "selene.toml"),
  with_diagnostics_code(b.diagnostics.shellcheck),
  b.diagnostics.zsh,
  -- b.diagnostics.cspell.with {
  --   filetypes = { "python", "rust", "typescript" },
  -- },
  -- b.diagnostics.stylelint,

  -- code actions
  b.code_actions.gitsigns.with({
    disabled_filetypes = { "NeogitCommitMessage" },
  }),
  b.code_actions.eslint_d,
  b.code_actions.gitrebase,
  b.code_actions.refactoring,
  b.code_actions.proselint,
  b.code_actions.shellcheck,

  -- hover
  b.hover.dictionary,
}

M.setup = function()
  null.setup({
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = nls_utils.root_pattern(".git"),
  })
end

return M
