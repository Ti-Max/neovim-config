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

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--------------------------------------------------------------
--LSP
vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
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

--------------------------------------------------------------
--FORMATTING
vim.keymap.set("n", "<leader>lf", function()
	vim.cmd("Format")
	print("File formated")

	-- Use builtin to lsp formatter
	--	vim.lsp.buf.format({
	--		async = true,
	--		filter = function(client)
	--      -- Never request typescript-language-server for formatting
	--			return client.name ~= "tsserver" or client.name ~= "lua_ls"
	--		end,
	--	})
end)
