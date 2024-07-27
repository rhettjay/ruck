return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	enabled = false,
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local null_ls = require("null_ls")
		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"eslint_d",
				"tslint_d",
				"biome",
			},
		})
		local formatting = null_ls.builtins.formatting
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				formatting.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ "eslintrc.js", ".eslintrc.cjs" })
					end,
				}),
			},
		})
		on_attach = function(current_client, bufnr)
			if current_client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								return client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end,
				})
			end
		end
	end,
}
