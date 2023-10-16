local format_on_save = {
	"javascript",
	"lua",
	"yaml",
	"json",
	"elixir",
	"css",
}

local function contains(array, value_to_check)
	for _, value in pairs(array) do
		if value == value_to_check then
			return true
		end
	end

	return false
end

local P = {}
function P.format_buffer()
	if
		vim.bo.filetype == "javascript"
		or vim.bo.filetype == "lua"
		or vim.bo.filetype == "python"
		or vim.bo.filetype == "yaml"
		or vim.bo.filetype == "json"
		or vim.bo.filetype == "glsl"
		or vim.bo.filetype == "nix"
		or vim.bo.filetype == "css"
	then
		vim.cmd("silent FormatWrite")
	else
		-- Use builtin to lsp formatter
		vim.lsp.buf.format({
			async = true,
		})
	end
end

-- default prettier config
local prettierd = require("formatter.defaults.prettierd")

require("formatter").setup({
	-- you can stack formatters
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		python = {
			require("formatter.filetypes.python").black,
			require("formatter.filetypes.python").autoflake,
		},
		yaml = { prettierd },
		javascript = { prettierd },
		json = { prettierd },
		css = { prettierd },
		glsl = { require("formatter.defaults.clangformat") },
		nix = { require("formatter.filetypes.nix").nixpkgs_fmt },
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

-- try to format on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*" },
	callback = function()
		if contains(format_on_save, vim.bo.filetype) then
			P.format_buffer()
		end
	end,
})

return P
