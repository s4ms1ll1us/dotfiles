require('nvim-treesitter.configs').setup {
    ensure_installe = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "bash" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
