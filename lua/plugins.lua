return {
	---------------------------------------------
	-- Language related
	--
	-- autocompletion
	"hrsh7th/nvim-cmp",
	-- snippets
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",

	-- lsp servers manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	-- lsp client
	"neovim/nvim-lspconfig",

	-- to use non-lsp formatter like prettier or stylua
	"mhartington/formatter.nvim",

	-- linter (for non-lsp linters)
	--'mfussenegger/nvim-lint',
	--
	---------------------------------------------
	-- UI
	--
	-- colorscheme
	{ "rose-pine/neovim", name = "rose-pine" },

	-- file manager
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
		end,
	},
	-- cool icons
	"nvim-tree/nvim-web-devicons",

	-- which key pop up menu (remove in the future)
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
}
