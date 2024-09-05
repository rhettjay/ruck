return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    },
    config = function()
      require("oil").setup({
        columns = { "icon", "permissions", "size" },
        view_options = {
          show_hidden = true,
        },
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end

  }
}
