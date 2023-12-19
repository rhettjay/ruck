return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
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
			python = { "isort", "black" },
			typescript = { { "tsstandard", "prettier" } },
			javascript = { { "standard", "prettier" } },
			["*"] = { "codespell" },
			-- if a file doesn't have formatter at least trime whitespace
			["_"] = { "trim_whitespace" },
		},
		-- Don't set format_on_save lazy uses conform automatically
		-- format_on_save = { lsp_fallback = true, timeout_ms = 500 },
		notify_on_error = true,
	},
}
