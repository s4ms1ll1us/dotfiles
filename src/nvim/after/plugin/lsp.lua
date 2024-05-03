local lspzero = require('lsp-zero')
lspzero.preset('recommended')

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
         'pyright',
         'pylsp',
         'bashls',
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lspzero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm(),
})

local lsp = require('lspconfig')
lsp.lua_ls.setup {}
lsp.pyright.setup {}
lsp.pylsp.setup {}
lsp.bashls.setup {}
