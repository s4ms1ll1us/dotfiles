require('telescope').setup{
    defaults = {
        layout_strategy = 'vertical',
        layout_config = { height = 0.95 },
    },
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
