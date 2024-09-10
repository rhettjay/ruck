return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash", "c", "go", "javascript", "lua", "rust", "typescript", "vimdoc",
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
  { "windwp/nvim-ts-autotag" },
  { "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
}
