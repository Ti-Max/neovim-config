return {
	---------------------------------------------
	-- Language related
	--
	{ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } },
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
	"mfussenegger/nvim-lint",

	-- better diagnostic UI
	"folke/trouble.nvim",

	{
		"kkoomen/vim-doge",
		run = ":call doge#install()",
	},
	---------------------------------------------
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.Comment")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},

	-- TODO: configure
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	config = function()
	-- 		local bufferline = require("bufferline")
	-- 		bufferline.setup({
	-- 			options = {
	-- 				-- TODO:
	-- 				-- separator_style = "thick",
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{ "lukas-reineke/indent-blankline.nvim" },

	"RRethy/vim-illuminate",

	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},

	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},

	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		module = "tailwindcss-colors",
		event = { "BufEnter", "BufNewFile" },
		config = function()
			require("tailwindcss-colors").setup()
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",

		config = function()
			require("toggleterm").setup()
		end,
	},
	---------------------------------------------
	-- UI
	--
	-- colorscheme
	{ "rose-pine/neovim", name = "rose-pine" },
	"folke/tokyonight.nvim",
	-- file manager
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
					-- update_root = true,
				},
			})
		end,
	},
	-- cool icons
	"nvim-tree/nvim-web-devicons",

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins/telescope")
		end,
	},
	-- extension for telescope to make it faster
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-lua/popup.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	-- which key pop up menu (remove in the future)
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	{
		"edluffy/hologram.nvim",
		config = function()
			require("hologram").setup({
				auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	},
}
