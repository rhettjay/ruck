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
				"javascript",
				"java",
				"kotlin",
				"lua",
				"php",
				"rust",
				"scss",
				"sql",
				"svelte",
				"typescript",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
