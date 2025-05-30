return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "NvimTree",
                            separator = true,
                        },
                    },
                },
                highlights = {
                    fill = {
                        bg = "#0a0a0a",
                    },
                    tab = {
                        bg = "#0a0a0a",
                    },
                },
            })
        end,
    },
}
