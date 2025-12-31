-----------------------------VIM-----------------------------------------------
vim.g.mapleader = " "

-- copy to system clip board
vim.keymap.set({"n", "v"}, "<leader>y", '"+y')

-- redo
vim.keymap.set("", "U", "<cmd>redo<CR>")

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

-- open config
vim.keymap.set("n", "<leader>i", ":e ~/.config/nvim/init.lua<CR>")

---------------------------------PLUGINS-------------------------------------------
--- file explorer
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- close current buffer
vim.keymap.set("n", "<leader>c", ":bd<CR>")

-- Search and replace
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").open()<CR>')
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>')
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>')
vim.keymap.set("n", "<leader>ss", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')

-- diffview
vim.keymap.set("n", "<leader>gw", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<CR>")

----------------------------------LSP-----------------------------------------------
-- copilot
vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- diagnostics menu
vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig<CR>", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})

-- create JSDOC automatically
vim.keymap.set("n", "<leader>ld", ":DogeGenerate<CR>")

----------------------------------FORMATTING------------------------------------------
vim.keymap.set("n", "<leader>lf", function()
	require("conform").format()
end)
