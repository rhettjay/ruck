return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "ayu_dark",
					component_separators = { left = "", right = "" },
					section_separators = { left = " ", right = " " },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					refresh = {
						statusline = 1000,
					},
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								return str:sub(1, 1)
							end,
						},
					},
					lualine_b = {
						"branch",
						"diff",
						"diagnostics",
					},
					lualine_x = {
						"%S", -- showcmd, requires showcmdloc=statusline
						"filetype",
						"progress",
					},
					lualine_y = { "overseer" },
					lualine_z = { "location" },
				},
			})
		end,
	},
}
