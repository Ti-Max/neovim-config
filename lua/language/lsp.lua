-- local ok, wf = pcall(require, "vim.lsp._watchfiles")
-- if ok then
-- 	-- disable lsp watcher. Too slow on linux
-- 	wf._watchfunc = function()
-- 		return function() end
-- 	end
-- end
--
local lsp_config = require("lspconfig")

vim.lsp.set_log_level("off")

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
lsp_config.pyright.setup({
	capabilities = capabilities,
})
-- lsp_config.mypy.setup({
-- 	capabilities = capabilities,
-- })
-- lsp_config.pylsp.setup({
-- 	capabilities = capabilities,
-- })
-- lsp_config.pylyzer.setup({
-- 	capabilities = capabilities,
-- 	single_file_support = true,
-- 	settings = {
-- 		python = {
--
-- 			checkOnType = false,
-- 			diagnostics = true,
-- 			inlayHints = true,
-- 			smartCompletion = true,
-- 		},
-- 	},
-- })

-- lsp_config.jedi_language_server.setup({
-- 	capabilities = capabilities,
-- })

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
lsp_config.ts_ls.setup({
	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

lsp_config.rescriptls.setup({
	cmd = { "rescript-language-server", "--stdio" },
	-- root_dir = function()
	-- 	return "/Users/timokha/Projects/Nablaflow/nabla_core/assets/"
	-- end,
	capabilities = capabilities,
	init_options = {
		{
			extensionConfiguration = {
				askToStartBuild = true,

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

lsp_config.fsautocomplete.setup({
	cmd = { "fsautocomplete", "--adaptive-lsp-server-enabled" },
	capabilities = capabilities,
})

lsp_config.eslint.setup({
	capabilities = capabilities,
})

lsp_config.svelte.setup({
	capabilities = capabilities,
})

-- elixir
lsp_config.lexical.setup({
	cmd = { "expert", "--stdio" },
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
	end,
	filetypes = { "elixir", "eelixir", "heex" },
	-- optional settings
	settings = {},
})
-- lsp_config.nextls.setup({})

-- lsp_config.elixirls.setup({
-- cmd = { "/home/timofei/.config/nvim/ls/elixir-ls/language_server.sh" },
-- cmd = { "/Home/timokha/elixir-ls/language_server.sh" },
-- cmd = { "~/elixir-ls/language_server.sh" },
-- 	cmd = { "elixir-ls" },
-- 	capabilities = capabilities,
-- })

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

-- Dockerfile
lsp_config.dockerls.setup({})

-- Rust
lsp_config.rust_analyzer.setup({
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
lsp_config.tailwindcss.setup({
	cmd = { "tailwindcss-language-server", "--stdio" },
	classAttributes = { "class", "className", "class:list", "classList", "ngClass" },

	single_file_support = true,

	init_options = {
		userLanguages = {
			-- eelixir = "html",
			-- elixir = "html",
			heex = "html",
			eex = "html",
			["phoenix-heex"] = "html",
			phoenix_heex = "html",
		},
		includeLanguages = {
			-- eelixir = "html",
			-- elixir = "html",
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
		-- "eelixir",
		-- "elixir",
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
lsp_config.nil_ls.setup({})
