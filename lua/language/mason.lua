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
		"ts_ls",
		"eslint",
		-- elixir
		-- DOES NOT WORK, you need to install it manually
		--"elixirls",

		"svelte",
		-- "mypy",
		-- "ruff",
	},
})

-- require("mason-lspconfig").setup_handlers({
-- 	function(server_name) -- default handler (optional)
-- 		require("lspconfig")[server_name].setup({})
-- 	end,
-- })

-----------------------------------INSTALL-FORMATTERS-&-LINTERS-------------------------------------------
-- instlal non-lsp formatter and linters automatically
require("mason-tool-installer").setup({
	ensure_installed = {
		-- formatter for: lua
		"stylua",
		-- formatter for: Angular, CSS, Flow, GraphQL, HTML, JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML
		"prettierd",
		-- tailwind
		"tailwindcss",
		"emmet_ls",
		--python
		"mypy",
		"ruff",
	},
})
