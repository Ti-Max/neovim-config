-- default prettier config
local prettierd = require("formatter.defaults.prettierd")

require("formatter").setup({
	-- you can stack formatters
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		javascript = { prettierd },
		json = { prettierd },
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

-- try to format on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("silent FormatWrite")
	end,
})
