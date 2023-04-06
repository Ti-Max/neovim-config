local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
    },
})
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

