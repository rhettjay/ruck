return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	opts = function()
		return {
			transparent = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
			},
		}
	end,
}
