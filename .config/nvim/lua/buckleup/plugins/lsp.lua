return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "j-hui/fidget.nvim", -- LSP loading notification
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Autocomplete engine
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "rafamadriz/friendly-snippets", -- vscode / other snippets
    },
    config = function()
      local cmp = require("cmp")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local luasnip = require("luasnip")

      require("cmp_luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )

      require("fidget").setup({})
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
         -- "biome",
         -- "cssls",
         -- "html",
          "gopls",
          "lua_ls",
          "rust_analyzer",
          -- "terraformls",
          -- "tsserver",
          -- "zls",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,
          zls = function()
            local lspconfig = require("lspconfig")
            lspconfig.zls.setup({
              root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
              settings = {
                zls = {
                  enable_inlay_hints = true,
                  enable_snippets = true,
                  warn_style = true,
                },
              },
            })
            vim.g.zig_fmt_parse_errors = 0
            vim.g.zig_fmt_autosave = 0

          end,
          ["tsserver"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.tsserver.setup({
              capabilities = capabilities,
              root_dir = function(...)
                return require("lspconfig.util").root_pattern(".git")(...)
              end,

            })
          end,
          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  },
                  workspace = {
                    -- make language server aware of runtime files
                    library = {
                      [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                      [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                  },
                }
              }
            })
          end,

        },
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup ({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.confirm({ select = false }),
          ["<C-j>"] = cmp.mapping.select_next_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, {
            { name = "buffer" },
            { name = "path" },
          },
        })

      })

      vim.diagnostic.config({
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = ""
        }
      })
    end,
  },
	--[[ {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	version = false,
	dependencies = {
		"hrsh7th/cmp-buffer", -- Source for text in buffer
		"hrsh7th/cmp-path", -- Source for relative files
		"hrsh7th/cmp-nvim-lsp", -- lsp auto complete
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Autocomplete engine
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		--
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.confirm({ select = false }),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
			}),
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
	}
	]]
}
