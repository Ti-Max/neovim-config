require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"lua",
		"javascript",
		"elixir",
		"heex",
		"python",
		"json",
		"bash",
		"glsl",
		"markdown",
		"markdown_inline",
		"svelte",
	},
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		-- Disable slow treesitter highlight for large files
		disable = function(_, buf)
			local max_filesize = 100 * 2048 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	indent = { enable = true },
})

vim.treesitter.language.register("json", "gltf")
vim.treesitter.language.register("html", "mjml")
