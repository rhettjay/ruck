vim.g.mapleader = ","

-- Basic keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
vim.keymap.set("n", "dw", '"b"_d')

-- Select all
-- vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
-- vim.keymap.set("n", "<C-m>", "<C-i>", pts)

-- Not sure
-- vim.keymap.set("n", "sh", "<C-w>h")
-- vim.keymap.set("n", "sk", "<C-w>k")
-- vim.keymap.set("n", "sj", "<C-w>j")
-- vim.keymap.set("n", "sl", "<C-w>l")

-- Diagnostics -- set in ../plugins/lspconfig.lua
--vim.keymap.set("n", "<C-j>", function()
--
--	vim.diagnostic.goto_next()
-- end, opts)

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", "vim.lsp.buf.format")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- go back from definition
vim.keymap.set("n", "gb", "<C-O>")
vim.keymap.set("n", "gn", "<C-o>")

-- Source
vim.keymap.set("n", "<leader><leader>", "<cmd>so<CR>")
