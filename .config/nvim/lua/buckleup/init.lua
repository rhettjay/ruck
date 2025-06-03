require("buckleup.opt")
require("buckleup.remap")
require("buckleup.lazy")

local augroup = vim.api.nvim_create_augroup
local BuckleUpGroup = augroup("BuckleUp", {})

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {})

autocmd("TextYankPost", {
	group = highlight_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
		higroup = "IncSearch",
		timeout = 40,
	})
	end,
})


autocmd({"BufWritePre"}, {
    group = BuckleUpGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- -- Fix conceallment level for json files
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "json", "jsonc" },
-- 	callback = function()
-- 		vim.wo.spell = false
-- 		vim.wo.concealleavel = 0
-- 	end,
-- })
--

autocmd('LspAttach', {
    group = BuckleUpGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})


