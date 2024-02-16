return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} }, -- useful status updates for LSP

		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		mason.setup({})
		mason_lspconfig.setup({
			ensure_installed = {
				"biome",
				"gopls",
				"cssls",
				"svelte",
				"html",
				"lua_ls",
				"rust-analyzer",
				"terraformls",
				"tsserver",
			},
			formatting = {
				disabled = {
					"biome",
					"rust-analyzer",
					"tsserver",
					"typescript-langauge-server",
				},
			},
			automatic_installation = true,
		})
	end,
}
