-- add additional linters that are not Language severs using nvim-lint

-- (example)
--require('lint').linters_by_ft = {
--  javascript = { 'eslint_d', }
--}
--
--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--  callback = function()
--    require("lint").try_lint()
--  end,
--})
