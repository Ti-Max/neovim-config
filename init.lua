-- install plugin manager & plugins
vim.opt.termguicolors = true
require("setup_lazy")

require("remaps")

--setup language features
require("language.treesitter")
require("language.mason")
require("language.autocompletion")
require("language.lsp")
require("language.formatters")
require("language.linters")

require("options")
