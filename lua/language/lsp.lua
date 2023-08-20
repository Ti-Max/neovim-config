local lsp_config = require("lspconfig")

-- we use nvim-cmp for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- setup lsp clients
--
-- python
lsp_config.pyright.setup({
	capabilities = capabilities,
})
-- lua
lsp_config.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
-- javascript
lsp_config.tsserver.setup({
	capabilities = capabilities,
})
lsp_config.eslint.setup({
	capabilities = capabilities,
})
