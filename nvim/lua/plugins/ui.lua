return {
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = {
					skip = true,
				},
			})

			opts.presets.lsp_doc_border = true
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 10000,
		},
	},
	{
		"nvim-lualina/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "solarized_dark",
			},
		},
	},
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("solarized_dark.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guifg = colors.base04 },
					},
				},
				window = {
					margin = { vertical = 0, horizontal = 1 },
				},
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buff_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+]" .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},
}
