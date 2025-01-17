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
        disable = function(lang, buf)
          -- if lang == "html" then
          --   print("disabled")
          --   return true
          -- end

          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            vim.notify(
              "File larger than 100KB treesitter disabled for performance",
              vim.log.levels.WARN,
              {title = "Treesitter"}
            )
            return true
          end
        end,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
      local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
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
