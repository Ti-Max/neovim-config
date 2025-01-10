local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.config.formatting = {
	format = require("tailwindcss-colorizer-cmp").formatter,
}

cmp.setup({
	-- snippet engines
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	-- mappinngs in the pop up menu
	mapping = cmp.mapping.preset.insert({
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<TAB>"] = cmp.mapping.select_next_item(),
		["S-<TAB>"] = cmp.mapping.select_prev_item(),
	}),

	-- sources are installed as plugins
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
	}),
})
