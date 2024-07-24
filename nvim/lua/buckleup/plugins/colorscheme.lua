return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	require('solarized-osaka').setup({
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
		},
	}),
}
