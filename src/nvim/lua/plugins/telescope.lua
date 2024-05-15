return {
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    prompt_position = "top",
                    mirror = true,
                    width = 0.95,
                },
                sorting_strategy = "ascending",
            },
        },
    },
}
