return {
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    config = function()
      vim.defer_fn(function()
        require("noice").setup({
          cmdline = {
            enabled = false,
          },
          messages = {
            enabled = false,
          },
          popupmenu = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
          commands = {},
          notify = {
            enabled = false,
          },
          lsp = {
            progress = {
              enabled = false,
            },
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
          },
          presets = {
            lsp_doc_border = true,
          },
        })
      end, 1000)
    end,
  },
}
