return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "lawrence-laz/neotest-zig", -- Installation
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        -- Registration
        require("neotest-zig")({
          dap = {
            adapter = "lldb",
          }
        }),
        require("neotest-go"),
      }
    })
    vim.keymap.set("n", "<leader>tr", function()
      require("neotest").run.run({
        suite = false,
        testify = true,
      })
    end, { desc = "Run Test" })

    vim.keymap.set("n", "<leader>tv", function()
      require("neotest").summary.toggle()
    end, { desc = "Toggle Summary" })

    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").run.run({
        suite = true,
        testify = true,
      })
    end, { desc = "Run Test Suite" })
  end
}
