return {
  {
    -- Use type `ga` when highlighting a character to reveal its representation in decimal, octal, and hex
    "tpope/vim-characterize",
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
  -- This plugin creates a markdown in editor browser. I've transitioned to using charm's Glow (https://github.com/charmbracelet/glow) to render it in the CLI
  -- {
  --   "toppair/peek.nvim",
  --   event = { "VeryLazy" },
  --   config = function()
  --     require("peek").setup({
  --       filetype = { 'markdown', 'conf' }
  --     })
  --     vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  --     vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  --   end,
  -- },
  {
    -- fml <leader>ca
    "eandrju/cellular-automaton.nvim"
  },
}
