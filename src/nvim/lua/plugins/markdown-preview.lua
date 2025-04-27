return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_theme = "light"
        end,
        ft = { "markdown" },
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview", ft = "markdown" },
        },
    },
}
