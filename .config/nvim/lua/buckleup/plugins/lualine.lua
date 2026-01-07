return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = false,
          theme = "powerline",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          always_divide_middle = true,
          refresh = {
            statusline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = {
          },
          lualine_b = {
            "location",
            "branch",
            "diff",
            "diagnostics",
          },
          lualine_c = {
            "filename",
          },
          lualine_y = {
            "overseer",
          },
          lualine_z = {
            "mode",
           },
        },
      }
    end,
  },
}
