local function change_case(input, to_format)
    if to_format == "snake_case" then
        return input:gsub("%u", "_%1"):gsub("^_", ""):lower()
    elseif to_format == "kebab-case" then
        return input:gsub("%u", "-%1"):gsub("^-", ""):lower()
    elseif to_format == "camelCase" then
        return input:gsub("_(%w)", string.upper):gsub("^%l", string.lower)
    else
        return input -- return input unchanged if format is not recognized
    end
end

-- Example usage:
-- local converted = convert_case("camelCaseString", "snake_case")
-- print(converted) -- Output: "camel_case_string"

-- Exporting as a Neovim plugin
local M = {}

M.change_case = change_case

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

M.switch_case = switch_case

return M

