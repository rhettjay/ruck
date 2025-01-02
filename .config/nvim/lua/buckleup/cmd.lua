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

local function switch_case()
  local line, col = vim.api.nvim_win_get_cursor(0)
  local word = vim.fn.expand('<cword>')
  local word_start = vim.fn.matchstrpos(vim.fn.getline('.'), '\\k*\\%' .. (col+1) .. 'c\\k*')[2]

  -- Detect camelCase
  if word:find('[a-z][A-Z]') then
    -- Convert camelCase to snake_case
    local snake_case_word = word:gsub('([a-z])([A-Z])', '%1_%2'):lower()
    vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, {snake_case_word})
  -- Detect snake_case
  elseif word:find('_[a-z]') then
    -- Convert snake_case to camelCase
    local camel_case_word = word:gsub('(_)([a-z])', function(_, l) return l:upper() end)
    vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, {camel_case_word})
  else
    print("Not a snake_case or camelCase word")
  end
end

return { switch_case = switch_case }
