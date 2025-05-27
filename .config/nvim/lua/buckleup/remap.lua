local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Basic Keymaps
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", '"b"_d')

-- Reverse selection
keymap.set({"n", "v"}, "<leader>lr", function(opts) return string.reverse(opts.args) end)

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
-- keymap.set("n", "<C-m>", "<C-i>", opts)

-- Not sure
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")

-- Diagnostics -- set in ../plugins/lspconfig.lua
--keymap.set("n", "<C-j>", function()
--
--	vim.diagnostic.goto_next()
-- end, opts)

keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<leader>f", "vim.lsp.buf.format")

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- go back from definition
keymap.set("n", "gb", "<C-O>")
keymap.set("n", "gn", "<C-o>")

-- Source
keymap.set("n", "<leader><leader>", "<cmd>so<CR>")

-- Goofing around
keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- switch case
keymap.set("n", "<leader>&", "<cmd> require('cmd').switch_case()<CR>")
