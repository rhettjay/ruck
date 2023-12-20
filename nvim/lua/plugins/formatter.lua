return {
	"stevearc/conform.nvim",
	dependencies = {
		"mason.nvim",
	},
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" } })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = function()
		if plugin.config ~= M.setup then
			vim.util.error({
				"Don't set `plugin.config` for `conform.nvim`.\n",
				"This will break **LazyVim** formatting.\n",
				"Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
			}, { title = "LazyVim" })
		end
		local opts = {
			format = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "ts-standard" },
				javascript = { "standardjs" },
			},
			format_on_save = false,
		}
		return opts
	end,
}
