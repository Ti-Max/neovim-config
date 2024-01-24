-- add additional linters that are not Language severs using nvim-lint
local lint = require("lint")

local flake8 = lint.linters.flake8
-- E203: False positive "whitespace before ':' " on list slice
table.insert(flake8.args, "--ignore=E203")

lint.linters_by_ft = {
	-- javascript = { 'eslint_d', }
	python = { "flake8" },
	elixir = { "credo" },
	sh = { "credo" },
}

--
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
