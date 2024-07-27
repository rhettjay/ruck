vim.g.mapleader = " "

local opt = vim.opt
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"

opt.wildignore:append({ "Cargo.lock", "Cargo.Bazel.lock" })

opt.cmdheight = 1

-- Disable mouse
opt.mouse = ""

opt.title = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = true
opt.lbr = true
opt.showbreak = "_>> "
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- numbers
opt.nu = true
opt.relativenumber = true

-- Search/incremental search
opt.hlsearch = false
opt.incsearch = true

-- Sync clipboard between OS and Neovim.
opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.backup = false

-- Save undo history
opt.undodir = os.getenv("HOME") .. "/.config/nvim-undodir"
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.updatetime = 50
