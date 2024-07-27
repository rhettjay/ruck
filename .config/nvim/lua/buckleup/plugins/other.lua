return {
	-- "tpope/vim-rhubarb", -- GH like git tool in vim
	-- press ga to reveal a characters decimal, octal, hex, Emoji_code, html
  {
    "tpope/vim-characterize",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Characterize)
    end,
  },
	-- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim", opts = {} },
	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
}
