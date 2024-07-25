local format_on_save = {
	"javascript",
	"lua",
	"yaml",
	"json",
	"elixir",
	"css",
	-- "rescript",
}

local P = {}

-- Function to get the filename from a full path
local function get_filename(path)
	return path:match("^.+/(.+)$")
end

-- Function to check if a buffer with the given filename exists
local function buffer_exists(filename)
	-- Get a list of all buffers
	local buffers = vim.api.nvim_list_bufs()

	-- Iterate over all buffers
	for _, buf in ipairs(buffers) do
		-- Get the name of the buffer
		local name = vim.api.nvim_buf_get_name(buf)

		-- Extract the filename from the buffer's full path
		local buf_filename = get_filename(name)

		-- Check if the buffer's filename matches the given filename
		if buf_filename == filename then
			return true
		end
	end

	-- If no buffer with the filename is found, return false
	return false
end

local function contains(array, value_to_check)
	for _, value in pairs(array) do
		if value == value_to_check then
			return true
		end
	end

	return false
end

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
		or vim.bo.filetype == "html"
	then
		vim.cmd("silent FormatWrite")
	else
		-- Use builtin to lsp formatter
		vim.lsp.buf.format()
		vim.cmd("write")

		-- update compiles rescript on buffer save
		-- if vim.bo.filetype == "rescript" then
		-- 	--get filename without directory and extention
		-- 	local filename = vim.fn.expand("%:t:r")
		--
		-- 	if buffer_exists(filename .. ".res.mjs") then
		-- 		vim.cmd("checktime " .. filename .. ".res.mjs")
		-- 	end
		-- end
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
		html = { prettierd },
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
