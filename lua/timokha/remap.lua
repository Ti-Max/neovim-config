vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")


vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<c-c>", "\"+y")
vim.keymap.set("v", "<c-c>", "\"+y")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<C-I>", ":lua vim.lsp.buf.format() <CR>")
vim.keymap.set("i", "<C-I>", "<esc> :lua vim.lsp.buf.format() <CR> i")
vim.keymap.set("v", "<C-I>", "<esc> :lua vim.lsp.buf.format() <CR> v")

vim.keymap.set("n", ":w", ":lua vim.lsp.buf.format() <CR> w")
