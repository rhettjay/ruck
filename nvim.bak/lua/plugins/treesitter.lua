return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"cmake",
				"cpp",
				"css",
				"gitignore",
				"go",
				"graphql",
				"http",
				"html",
				"javascript",
				"java",
				"json",
				"jsonc",
				"kotlin",
				"lua",
				"luap",
				"markdown",
				"php",
				"rust",
				"scss",
				"sql",
				"svelte",
				"toml",
				"typescript",
				"yaml",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
