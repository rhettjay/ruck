vim.g.mapleader = ","

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

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

opt.hlsearch = false
opt.incsearch = true
vim.wo.nu = true

-- Sync clipboard between OS and Neovim.
opt.clipboard = "unnamedplus"

-- Save undo history
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"

if vim.g.neovide then
	vim.g.neovide_cursor_tail_length = 0
	vim.g.neovide_cursor_animation_length = 0
end
