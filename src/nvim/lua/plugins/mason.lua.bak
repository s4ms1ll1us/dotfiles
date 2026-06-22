return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            -- list of servers for mason to install
            ensure_installed = {
                "html",
                "lua_ls",
                "pyright",
                "ts_ls",
                "bashls"
            },
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            {
                "neovim/nvim-lspconfig",
                config = function()
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
                end
            }
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "pylint",
                "eslint_d",
            },
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
}
