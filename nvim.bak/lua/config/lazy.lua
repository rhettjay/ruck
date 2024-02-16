local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Installs lazy nvim if it's not already installed
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins", opts = {
			colorscheme = "solarized-osaka",
		} },
		--	{ import = "lazyvim.plugins.extras.linting.eslint" },
		--	{ import = "lazyvim.plugins.extras.lang.typescript" },
		--	{ import = "lazyvim.plugins.extras.lang.json" },
		--	{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "plugins" },
		--> { import = "jaybulk" },
	},
	default = {
		lazy = false,
	},
})
