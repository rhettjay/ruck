return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({})

      local parsers = {
        "bash",
        "c",
        "go",
        "html",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "rust",
        "templ",
        "typescript",
        "vimdoc",
        "yaml",
      }

      ts.install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local buf = args.buf

          -- Don't enable Treesitter for large files
          local max_filesize = 100 * 1024
          local filename = vim.api.nvim_buf_get_name(buf)

          if filename ~= "" then
            local ok, stats = pcall(vim.uv.fs_stat, filename)

            if ok and stats and stats.size > max_filesize then
              vim.notify(
                "File larger than 100KB; Treesitter disabled for performance",
                vim.log.levels.WARN,
                { title = "Treesitter" }
              )
              return
            end
          end

          -- Native Neovim Treesitter highlighting
          local ok = pcall(vim.treesitter.start, buf)

          if not ok then
            return
          end

          -- Treesitter indentation
          vim.bo[buf].indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"

          -- Equivalent of:
          -- additional_vim_regex_highlighting = { "markdown" }
          if vim.bo[buf].filetype == "markdown" then
            vim.bo[buf].syntax = "on"
          end
        end,
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", },
  { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main", },
  { "windwp/nvim-ts-autotag", opts = {}, },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
