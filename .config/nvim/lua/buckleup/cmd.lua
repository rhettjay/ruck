-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- -- Fix conceallment level for json files
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "json", "jsonc" },
-- 	callback = function()
-- 		vim.wo.spell = false
-- 		vim.wo.concealleavel = 0
-- 	end,
-- })
--
-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
-- NOTE: Stop using Shift+v. Instead use yank arrounds (yap, etc.)
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
		higroup = "IncSearch",
		timeout = 40,
	})
	end,
})

