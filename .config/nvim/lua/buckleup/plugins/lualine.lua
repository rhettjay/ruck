return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "powerline",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "|", right = " " },
          always_divide_middle = true,
          refresh = {
            statusline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              -- fmt = function(str)
              --   return str:sub(1, 1)
              -- end,
            },
          },
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
          },
          lualine_c = {
            "filename"
          },
          lualine_x = {
            "encoding",
            "filetype",
            "searchcount",
          },
          lualine_y = { "overseer" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
