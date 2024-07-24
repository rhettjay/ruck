return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"c",
				"cmake",
				"cpp",
				"css",
				"gitignore",
				"go",
				"graphql",
				"http",
				"javascript",
				"java",
				"jsdoc",
				"kotlin",
				"lua",
				"php",
				"rust",
				"scss",
				"sql",
				"svelte",
				"typescript",
				"vimdoc",
			},
			sync_install = false,
			auto_install = true,

			indent = {
				enable = true,
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
