vim.lsp.set_log_level("off")

-- we use nvim-cmp for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- python
vim.lsp.config("pyright", { capabilities = capabilities })

-- lua
vim.lsp.config("lua_ls", {
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
vim.lsp.config("ts_ls", { capabilities = capabilities })

vim.lsp.config("rescriptls", {
	cmd = { "rescript-language-server", "--stdio" },
	capabilities = capabilities,
	init_options = {
		{
			extensionConfiguration = {
				askToStartBuild = false,

				allowBuiltInFormatter = false,
				inlayHints = {
					enable = true,
					maxLength = nil,
				},
				codeLens = true,
			},
		},
	},
})

vim.lsp.config("fsautocomplete", {
	cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" },
	capabilities = capabilities,
})

vim.lsp.config("eslint", { capabilities = capabilities })

-- elixir
vim.lsp.config("expert", {
	cmd = { "expert", "--stdio" },
	root_markers = { "mix.exs", ".git" },
	filetypes = { "elixir", "eelixir", "heex" },
})

vim.lsp.enable("expert")

-- yaml
vim.lsp.config("yamlls", { capabilities = capabilities })

-- glsl
vim.lsp.config("glslls", {
	cmd = { "glslls", "--stdin", "--target-env", "opengl" },
	capabilities = capabilities,
})

-- go
vim.lsp.config("gopls", { capabilities = capabilities })

-- c
vim.lsp.config("clangd", { capabilities = capabilities })

-- Dockerfile
vim.lsp.config("dockerls", {})

-- Rust
vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
		},
	},
})

-- tialwind
vim.lsp.config("tailwindcss", {
	cmd = { "tailwindcss-language-server", "--stdio" },
	classAttributes = { "class", "className", "class:list", "classList", "ngClass" },

	single_file_support = true,

	init_options = {
		userLanguages = {
			heex = "html",
			eex = "html",
			["phoenix-heex"] = "html",
			phoenix_heex = "html",
		},
		includeLanguages = {
			["phoenix-heex"] = "html",
			heex = "html",
			eex = "html",
			phoenix_heex = "html",
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

-- nix
vim.lsp.config("nil_ls", { capabilities = capabilities })
