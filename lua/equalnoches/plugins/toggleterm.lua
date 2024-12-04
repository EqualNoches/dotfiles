return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 15,
            open_mapping = [[<C-\>]],
            direction = 'float',
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights={
                    border = "Normal",
                    background="Normal",
                },
            },
        })
    end,
}
