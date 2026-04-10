local parsers = {
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
	"rust",
}

-- install missing parsers on startup
local installed = require("nvim-treesitter.config").get_installed()
local to_install = vim.tbl_filter(function(p)
	return not vim.tbl_contains(installed, p)
end, parsers)
if #to_install > 0 then
	require("nvim-treesitter").install(to_install)
end

-- highlighting + indentation (now done via autocmd, not configs.setup)
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local buf = ev.buf
		local max_filesize = 100 * 2048
		local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
			return
		end
		pcall(vim.treesitter.start, buf)
		vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

vim.treesitter.language.register("json", "gltf")
vim.treesitter.language.register("html", "mjml")
