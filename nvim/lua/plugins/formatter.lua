return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>FF",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- python = { "isort", "black" },
			typescript = { "tsstandard" },
			javascript = { "standard" },
		},
		-- Don't set format_on_save lazy uses conform automatically
		-- format_on_save = { lsp_fallback = true, timeout_ms = 500 },
		notify_on_error = true,
	},
}
