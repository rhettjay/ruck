return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	keys = {
		{ "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer" },
		{
			"<leader>/",
			function()
				local builtin = require("telescope.builtin")
				builtin.live_grep()
			end,
		},
		{
			";s",
			function()
				local builtin = require("telescope.builtin")
				builtin.treesitter()
			end,
		},
		{
			"sf",
			function()
				local telescope = require("telescope")
				local function telescope_buffer_dir()
					return vim.fn.expand("%:p:h")
				end

				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end,
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extension.file_browser.actions

		opts.default = vim.tbl_deep_extend("force", opts.default, {
			wrap_results = true,
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
			sorting_strategy = "ascending",
			winblend = 0,
			mappings = {
				n = {},
			},
		})
		opts.pickers = {
			diagnostics = {
				theme = "ivy",
				initial_mode = "normal",
				layout_config = {
					preview_cutoff = 9999,
				},
			},
		}
		opts.extensions = {
			file_browser = {
				theme = "drowndown",
				hijack_netrw = true,
				mappings = {
					["n"] = {
						["%"] = fb_actions.create,
						["-"] = fb_actions.goto_parent_dir,
						["/"] = function()
							vim.cmd("startinsert")
						end,
						["<C-u>"] = function(prompt_bufnr)
							for i = 1, 10 do
								actions.move_selection_previous(prompt_bufnr)
							end
						end,
						["<C-d>"] = function(prompt_bufnr)
							for i = 1, 10 do
								actions.move_selection_next(prompt_bufnr)
							end
						end,
					},
				},
			},
		}
		telescope.setup(opts)
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")
	end,
}
