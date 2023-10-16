local lsp_config = require("lspconfig")

-- we use nvim-cmp for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

-- setup lsp clients

-- python
-- pyright is too strict
-- lsp_config.pyright.setup({
-- 	capabilities = capabilities,
-- })

lsp_config.jedi_language_server.setup({
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
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})
lsp_config.eslint.setup({
	capabilities = capabilities,
})

-- elixir
lsp_config.elixirls.setup({
	-- cmd = { "/home/timofei/.config/nvim/ls/elixir-ls/language_server.sh" },
	cmd = { "/home/timofei/elixir-ls/release/language_server.sh" },
	capabilities = capabilities,
})

--yaml
lsp_config.yamlls.setup({
	capabilities = capabilities,
})

-- snippets
lsp_config.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = {
		"css",
		"html",
		"heex",
	},
})

-- glsl
lsp_config.glslls.setup({
	cmd = { "glslls", "--stdin", "--target-env", "opengl" },
	capabilities = capabilities,
})

-- go
lsp_config.gopls.setup({
	capabilities = capabilities,
})

-- c
lsp_config.clangd.setup({
	capabilities = capabilities,
})

-- tialwind
lsp_config.tailwindcss.setup({
	cmd = { "tailwindcss-language-server", "--stdio" },
	init_options = {
		userLanguages = {
			eelixir = "html",
			elixir = "html",
			eruby = "erb",
		},
	},
	capabilities = capabilities,
	filetypes = {
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir",
		"elixir",
		"ejs",
		"erb",
		"eruby",
		"gohtml",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
	},
})
