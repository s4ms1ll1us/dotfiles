require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
         'pyright',
         'pylsp'
    }
})

local lsp = require('lspconfig')

lsp.lua_ls.setup {}
lsp.pyright.setup {}
lsp.pylsp.setup {}
