return {
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- press ga to reveal a characters decimal, octal, hex, Emoji_code, html
	"tpope/vim-characterize",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	"stevearc/overseer.nvim",
	-- "gc" to comment visual regions/lines
	"numToStr/Comment.nvim",
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
