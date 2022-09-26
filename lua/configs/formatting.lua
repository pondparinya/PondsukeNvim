local util_ok, util = pcall(require, "formatter.util")
if not util_ok then
	return
end
-- local util = require("formatter.util")

local function prettier()
	return {
		exe = "prettier",
		args = {
			"--config-precedence",
			"prefer-file",
			"--use-tabs",
			"--single-quote",
			"--no-bracket-spacing",
			"--prose-wrap",
			"always",
			"--arrow-parens",
			"always",
			"--trailing-comma",
			"all",
			"--no-semi",
			"--end-of-line",
			"lf",
			"--print-width",
			vim.bo.textwidth <= 80 and 80 or vim.bo.textwidth,
			"--stdin-filepath",
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

local function shfmt()
	return {
		exe = "shfmt",
		args = {
			"-",
		},
		stdin = true,
	}
end

local filetype = {
	go = {
		function()
			-- this will run gofmt too
			return {
				exe = "goimports",
				stdin = true,
			}
		end,
	},
	lua = {
		function()
			return {
				exe = "stylua",
				args = {
					"--search-parent-directories",
					"--stdin-filepath",
					util.escape_path(util.get_current_buffer_file_path()),
					"--",
					"-",
				},
				stdin = true,
			}
		end,
	},
	sh = { shfmt },
	bash = { shfmt },
	markdown = { prettier },
	["markdown.mdx"] = { prettier },
	mdx = { prettier },
	css = { prettier },
	json = { prettier },
	jsonc = { prettier },
	javascript = { prettier },
	typescript = { prettier },
	python = {
		function()
			return {
				exe = "black",
				args = { "--quiet", "-" },
				stdin = true,
			}
		end,
	},
}

require("formatter").setup({
	logging = true,

	filetype = filetype,
})
