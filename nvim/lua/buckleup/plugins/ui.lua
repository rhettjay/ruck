return {
	"folke/flash.nvim",
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enabled = false,
			}
		end,
	},
}
