local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
	return
end

local utils = require("utils.cmp")
-- local neogen_status_ok, neogen = pcall(require, "neogen")
-- if not neogen_status_ok then
-- 	return
-- end

local source_mapping = {
	nvim_lsp = "[Lsp]",
	luasnip = "[Snip]",
	buffer = "[Buffer]",
	nvim_lua = "[Lua]",
	treesitter = "[Tree]",
	path = "[Path]",
	rg = "[Rg]",
	-- nvim_lsp_signature_help = "[Sig]",
}

local opts = {
	completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 40,

			before = function(entry, vim_item)
				vim_item.kind = lspkind.presets.default[vim_item.kind]

				local menu = source_mapping[entry.source.name]
				vim_item.menu = menu
				return vim_item
			end,
		}),
	},
	window = {
		completion = {
			border = utils.border("CmpBorder"),
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		},
		documentation = {
			border = utils.border("CmpDocBorder"),
		},
	},
	sources = {
		{ name = "nvim_lsp", max_item_count = 15 },
		{ name = "luasnip", max_item_count = 8 },
		{ name = "treesitter", max_item_count = 5 },
		{ name = "rg", max_item_count = 5 },
		{ name = "buffer", max_item_count = 5 },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "crates" },
		-- { name = "cmp_tabnine" },
		-- { name = "nvim_lsp_signature_help", max_item_count = 5 },
		-- { name = "spell" },
		-- { name = "emoji" },
		-- { name = "calc" },
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
		["<C-n>"] = { i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
		["<C-p>"] = { i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-y>"] = cmp.mapping({
			i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
			c = function(fallback)
				if cmp.visible() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
				else
					fallback()
				end
			end,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif utils.has_words_before() then
				cmp.complete()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif utils.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<CR>"] = cmp.mapping({
			i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
			c = function(fallback)
				if cmp.visible() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
				else
					fallback()
				end
			end,
		}),
	},
}

cmp.setup(opts)

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
