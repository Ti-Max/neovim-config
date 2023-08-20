require("mason").setup()

-----------------------------------INSTALL-LSP-SERVERS-------------------------------------------
-- instlal language servers automatically
require("mason-lspconfig").setup({
	ensure_installed = {
		-- python
		"pyright",
		-- lua
		"lua_ls",
		-- javascript
		"tsserver",
		"eslint",
	},
})

-----------------------------------INSTALL-FORMATTERS-&-LINTERS-------------------------------------------
-- instlal non-lsp formatter and linters automatically
require("mason-tool-installer").setup({
	ensure_installed = {
		-- formatter for: lua
		"stylua",
		-- formatter for: Angular, CSS, Flow, GraphQL, HTML, JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML
		"prettierd",
	},
})
