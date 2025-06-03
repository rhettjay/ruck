vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"

vim.opt.wildignore:append({ "Cargo.lock", "Cargo.Bazel.lock" })

vim.opt.cmdheight = 1

-- Disable mouse
vim.opt.mouse = ""

-- vim.opt.title = true
-- vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.lbr = true
vim.opt.showbreak = "_>> "
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Search/incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false
vim.opt.backup = false

-- Save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim-undodir"
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
