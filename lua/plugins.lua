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
	{ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } },
	-- autocompletion
	"hrsh7th/nvim-cmp",
	-- snippets
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	-- lsp servers manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	-- rescript
	{ "rescript-lang/vim-rescript", ft = "rescript" },
	{ "nkrkv/nvim-treesitter-rescript" },

	-- lsp client
	"neovim/nvim-lspconfig",

	-- to use non-lsp formatter like prettier or stylua
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- linter (for non-lsp linters)
	"mfussenegger/nvim-lint",

	-- better diagnostic UI
	-- never used I think
	"folke/trouble.nvim",

	-- for js
	{
		"kkoomen/vim-doge",
		run = ":call doge#install()",
	},

	{
		-- It is not possible to remove the free trial has ended message !!!!!!!!!!!!!!
		"github/copilot.vim",
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
	-- do I need it?
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
	},

	-- pairs for brackets etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	{ "lukas-reineke/indent-blankline.nvim" },

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
	-- Is it working?
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	-- Same as above?
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		module = "tailwindcss-colors",
		event = { "BufEnter", "BufNewFile" },
		config = function()
			require("tailwindcss-colors").setup()
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
	--
	-- {
	-- 	"f-person/auto-dark-mode.nvim",
	-- 	opts = {
	-- 		update_interval = 1000,
	-- 		set_dark_mode = function()
	-- 			vim.cmd("colorscheme tokyonight")
	-- 		end,
	-- 		set_light_mode = function()
	-- 			vim.cmd("colorscheme catppuccin-latte")
	-- 		end,
	-- 	},
	-- },
	-- colorscheme
	{ "rose-pine/neovim", name = "rose-pine" },
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	-- file manager
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = { adaptive_size = true },

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

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				-- sections = {
				-- 	lualine_a = {
				-- 		{
				-- 			"filename",
				-- 			file_status = true, -- Displays file status (readonly status, modified status)
				-- 			newfile_status = false, -- Display new file status (new file means no write after created)
				-- 			path = 0, -- 0: Just the filename
				-- 			-- 1: Relative path
				-- 			-- 2: Absolute path
				-- 			-- 3: Absolute path, with tilde as the home directory
				-- 			-- 4: Filename and parent dir, with tilde as the home directory
				--
				-- 			shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- 			-- for other components. (terrible name, any suggestions?)
				-- 			symbols = {
				-- 				modified = "[+]", -- Text to show when the file is modified.
				-- 				readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
				-- 				unnamed = "[No Name]", -- Text to show for unnamed buffers.
				-- 				newfile = "[New]", -- Text to show for newly created file before first write
				-- 			},
				-- 		},
				-- 	},
				-- },
			})
		end,
	},
	-- take cool screenshots
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		config = function()
			require("silicon").setup({
				-- Configuration here, or leave empty to use defaults
				font = "VictorMono",
				to_clipboard = true,
				-- window_title = function()
				-- 	return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
				-- end,
				theme = "Dracula",
				background = "#6190b0",
				shadow_color = nil,
				-- no_window_controls = true,
				no_line_number = true,
			})
		end,
	},
}
