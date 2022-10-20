local M = {}
local luasnip_ok, luasnip = pcall(require, "luasnip")

if not luasnip_ok then
	return
end
local types = require("luasnip.util.types")

M.setup = function()
	luasnip.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = false,
		store_selection_keys = "<C-q>",
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "●", "GruvboxOrange" } },
				},
			},
			[types.insertNode] = {
				active = {
					virt_text = { { "●", "GruvboxBlue" } },
				},
			},
		},
	})
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load()

	luasnip.filetype_extend("all", { "_" })
end
return M
