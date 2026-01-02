local conform = require("conform")

require("conform").setup({

	conform.setup({
		default_format_opts = {
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "autoflake" },
			javascript = { "biome" },
			yaml = { "prettierd" },
			json = { "biome" },
			css = { "biome" },
			html = { "gotmplfmt" },
			gotmpl = { "gotmplfmt" },
			glsl = { "clang-format" },
			nix = { "alejandra" },
		},

		formatters = {
			gotmplfmt = {
				command = "gotmplfmt",
				stdin = true,
				args = { "-w", "70" },
			},
		},

		format_on_save = function(bufnr)
			-- Disable autoformat on certain filetypes
			local ignore_filetypes = { "elixir", "heex" }
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return
			end
		end,
	}),
})
