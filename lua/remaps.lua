-----------------------------VIM-----------------------------------------------
vim.g.mapleader = " "

-- default nvim file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected lines FIXME: needs work
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- FIXME, should be copying to system clipboard
vim.keymap.set("x", "<leader>p", '"_dP')

-- copy to system clip board
vim.keymap.set("n", "<c-c>", '"+y')
vim.keymap.set("v", "<c-c>", '"+y')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

-- redo
vim.keymap.set("", "U", "<cmd>redo<CR>")

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

-- navigate windows
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l")
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k")

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<A-3>", ":ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<A-2>", ":ToggleTerm direction=vertical<CR>")

-- open config
vim.keymap.set("n", "<leader>i", ":e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>Cp", ":e ~/.config/nvim/lua/plugins.lua<CR>")
vim.keymap.set("n", "<leader>Cr", ":e ~/.config/nvim/lua/remaps.lua<CR>")
vim.keymap.set("n", "<leader>Co", ":e ~/.config/nvim/lua/options.lua<CR>")

---------------------------------PLUGINS-------------------------------------------
-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Buffers
-- vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
-- vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
-- vim.keymap.set("n", "<leader>bh", ":BufferLineCloseLeft<CR>")
-- vim.keymap.set("n", "<leader>bl", ":BufferLineCloseRight<CR>")
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
-- diagnostics menu
vim.keymap.set("n", "<leader>t", ":TroubleToggle<CR>")
vim.keymap.set("t", "<leader>t", ":TroubleToggle<CR>")

vim.keymap.set("n", "<leader>k", ":Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig<CR>", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- this one has ANIMATION
		vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		-- FIXME show references in othe files of the project
		-- use trouble because its better
		vim.keymap.set("n", "gr", function()
			require("trouble").open("lsp_references")
		end, opts)

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		--vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		--vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		--vim.keymap.set('n', '<leader>wl', function()
		--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		--end, opts)
		--vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
	end,
})

-- create JSDOC automatically
vim.keymap.set("n", "<leader>ld", ":DogeGenerate<CR>")

----------------------------------FORMATTING------------------------------------------
vim.keymap.set("n", "<leader>lf", function()
	require("language.formatters").format_buffer()
end)

-- organize import using tsserver. Warnign: conflicts a bit with prettier formatter
vim.keymap.set("n", "<leader>li", ":OrganizeImports<CR>")
