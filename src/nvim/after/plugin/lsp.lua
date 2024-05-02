local lsp = require('lsp-zero')
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

local lspconfig = require('lspconfig')
lspconfig.intelephense.setup({})
