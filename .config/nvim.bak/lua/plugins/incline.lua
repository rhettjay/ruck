return {
		"b0o/incline.nvim",
		config = function()
			local devicons = require("nvim-web-devicons")
			require("incline").setup({
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified and "bold, italic" or "bold"

					local function get_git_diff()
						local icons = { removed = "-", changed = "~", added = "+" }
						icons["changed"] = icons.modified
						local signs = vim.b[props.buf].gitsigns_status_dict
						local labels = {}
						if signs == nil then
							return labels
						end
						for name, icon in pairs(icons) do
							if tonumber(signs[name]) and signs[name] > 0 then
								table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
							end
						end
					end
					local buffer = {
						{ get_git_diff() },
						{ (ft_icon or "") .. " ", guibg = "none", guifg = ft_color },
						{ filename .. " ", gui = modified },
						{ "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
					}
					return buffer
				end,
			})
		end,
	}
