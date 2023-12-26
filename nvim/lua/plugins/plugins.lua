return {

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- press ga to reveal a characters decimal, octal, hex, Emoji_code, html
	"tpope/vim-characterize",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	-- "gc" to comment visual regions/lines
	"numToStr/Comment.nvim",
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = true,
				--			theme = "tokyonight",
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
}
