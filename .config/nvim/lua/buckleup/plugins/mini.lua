return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.surround").setup()
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end
}
