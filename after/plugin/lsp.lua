local lsp = require('lsp-zero').preset({})

lsp.preset('recommended')
lsp.ensure_installed({
    'tsserver',
    'eslint'
})
lsp.setup_servers({'tsserver', 'eslint'})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-i>'] = cmp.mapping.confirm({select = true}),
  ['<C-Space>'] = cmp.mapping.complete(),
})
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})
lsp.setup()
