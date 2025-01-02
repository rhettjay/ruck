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
	end
}
