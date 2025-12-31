-- install plugin manager & plugins
require("setup_lazy")

require("remaps")

--setup language features
require("language.treesitter")
require("language.autocompletion")
require("language.lsp")
require("language.formatters")
require("language.linters")

require("options")
