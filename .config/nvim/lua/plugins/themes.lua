return {
	--	{
	--		"navarasu/onedark.nvim",
	--		config = function()
	--			require("onedark").setup({
	--				style = "dark",
	--				transparent = true,
	--			})
	--			require("onedark").load()
	--		end,
	--	},
	--	{
	--		"scottmckendry/cyberdream.nvim",
	--		lazy = false,
	--		priority = 1000,
	--		config = function()
	--			require("cyberdream").setup({
	--				transparent = true,
	--			})
	--			vim.cmd.colorscheme("cyberdream")
	--		end,
	--	},
	--	{
	--	    "nyoom-engineering/oxocarbon.nvim",
	--	    config = function ()
	--	        vim.opt.background = "dark"
	--	        vim.cmd.colorscheme "oxocarbon"
	--	        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--	        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	--	        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	--	    end
	--	},
		{
			"jesseleite/nvim-noirbuddy",
			dependencies = {
				{ "tjdevries/colorbuddy.nvim" },
			},
			lazy = false,
			priority = 1000,
			opts = {
				preset = "minimal", -- All of your `setup(opts)` will go here
				colors = {
					background = "#161616",
	                primary = "#ec144c", -- #ff0088
				},
			},
		},
}
