vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.splitright = true
vim.opt.splitbelow = true

-- always show the sign column, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"

vim.opt.numberwidth = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hls = true

-- set colorscheme
vim.cmd.colorscheme("tokyonight-moon")
