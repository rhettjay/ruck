return {
  'echasnovski/mini.surround',
  version = '*',
  config = function()
    require('mini.surround').setup({
      mappings = {
        add = 'ysa',
        delete = 'ysd',
        find = 'ysf',
        find_left = 'ysF',
        highlight = 'ysh',
        replace = 'ysr',
      }
    })
  end
	-- {
	-- 	"kylechui/nvim-surround",
	-- 	config = function()
	-- 		require("nvim-surround").setup()
	-- 	end,
	-- },
}
