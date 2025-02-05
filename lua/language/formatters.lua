local conform = require("conform")

conform.setup({
	default_format_opts = {
		lsp_format = "fallback",
	},

	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "autoflake" },
		javascript = { "prettierd" },
		yaml = { "prettierd" },
		json = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		gotmpl = { "prettierd" },
		glsl = { "clang-format" },
		nix = { "alejandra" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
	},
})
