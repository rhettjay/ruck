return {
  { "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000 ,
    config = true,
  },
	{
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
		  },
		})
    vim.cmd.colorscheme "solarized-osaka"
	end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
    enabled = false,
		--priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "light", -- style for sidebars, see below
					floats = "light", -- style for floating windows
				},
			})
		end,
	},
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
    enabled = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        term_colors = true,
        default_integrations = true,
      })
    -- vim.cmd.colorscheme "catppuccin"
    end,
  }
}
