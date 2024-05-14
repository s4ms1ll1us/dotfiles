return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.mapping["<CR>"] = cmp.mapping.confirm({ select = false })
            opts.preselect = cmp.PreselectMode.None
            opts.completion = {
                completeopt = "menu,menuone,noinsert,noselect",
            }
        end,
    },
}
