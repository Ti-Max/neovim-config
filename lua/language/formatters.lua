local conform = require("conform")
local util = require("conform.util")

require("conform").setup({

	conform.setup({
		default_format_opts = {
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "autoflake" },
			javascript = { "asdfjs" },
			yaml = { "prettierd" },
			json = { "biome" },
			css = { "biome" },
			html = { "gotmplfmt" },
			gotmpl = { "gotmplfmt" },
			glsl = { "clang-format" },
			nix = { "alejandra" },
      elixir = { "mix_format" },
      heex = { "mix_format" },
		},

		formatters = {
			gotmplfmt = {
				command = "gotmplfmt",
				stdin = true,
				args = { "-w", "70" },
			},
      mix_format = {
        command = "mix",
        args = { "format"},
        stdin = false,
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
