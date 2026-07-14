return {
  {
    "rhettjay/ghostty-default-theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("ghostty-default")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd.colorscheme("gruvbox")
      require("gruvbox").setup({
        terminal_colors = true,
        dim_inactive = true,
      })
    end,
  },
  -- I also like habamax (set in)
  {
    "ntk148v/habamax.nvim",
    enabled = false,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.cmd.colorscheme("habamax.nvim")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
    -- enabled = false,
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
