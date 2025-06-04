return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
        vim.wo.fillchars='eob: '
		require("nvim-tree").setup({
            view = {
                width = 35,
            },
            filters = {
                dotfiles = true,
            }
        })
	end,
}
