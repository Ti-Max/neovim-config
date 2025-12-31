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
		"rescript",
    "rust"
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

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
	},
	filetype = "gotmpl",
	used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
}
