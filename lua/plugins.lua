return {
	-- integration with tmux
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	---------------------------------------------
	-- Language related
	--
	"neovim/nvim-lspconfig",
  -- Syntax highlightning
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nkrkv/nvim-treesitter-rescript" },
	-- autocompletion
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.8.0",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
			completion = { documentation = { auto_show = true } },
		},
	},
	-- lsp servers manager
	{ "mason-org/mason.nvim", opts = {} },

	-- to use non-lsp formatter like prettier or stylua
	{ "stevearc/conform.nvim", opts = {} },

	-- for js
	{
		"kkoomen/vim-doge",
		run = ":call doge#install()",
	},

	-- { "github/copilot.vim" },
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

	-- highlight current word
	"RRethy/vim-illuminate",

	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},

	-- find and replace
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup({
				find_engine = {
					-- rg is map with finder_cmd
					["rg"] = {
						cmd = "rg",
						-- default args
						args = {
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--pcre2",
						},
					},
				},
			})
		end,
	},

	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufEnter", "BufNewFile" },
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	---------------------------------------------
	-- UI
	-- colorscheme
	{ "rose-pine/neovim", name = "rose-pine" },
	"folke/tokyonight.nvim",
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

	---@type LazySpec
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>e",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- mark netrw as loaded so it's not loaded at all.
			--
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
--
-- -- file manager
-- {
-- 	"nvim-tree/nvim-tree.lua",
-- 	config = function()
-- 		require("nvim-tree").setup({
-- 			view = { adaptive_size = true },
--
-- 			update_focused_file = {
-- 				enable = true,
-- 				-- update_root = true,
-- 			},
-- 		})
-- 	end,
-- },

-- -- pairs for brackets etc.
-- {
-- 	"windwp/nvim-autopairs",
-- 	event = "InsertEnter",
-- 	opts = {}, -- this is equalent to setup({}) function
-- },
