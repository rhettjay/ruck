return {
  {
    "tpope/vim-characterize",
    config = function()
      vim.keymap.set("n", "<leader>char", vim.cmd.Characterize)
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
