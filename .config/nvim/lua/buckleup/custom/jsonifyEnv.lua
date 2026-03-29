local M = {}

local jsonify_flags = {
  pretty = false,
  clip = false,
  replace = true,
  write = nil,
}

local function run_jsonify_env()
  local args = {}
  for k, v in pairs(jsonify_flags) do
    if k == "write" and v then
      table.insert(args, "write=" .. v)
    elseif v == true then
      table.insert(args, k)
    end
  end
  vim.cmd("JsonifyEnv " .. table.concat(args, " "))
end

function M.parse_env_lines_to_json(opts)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local env_table = {}

  for _, line in ipairs(lines) do
    local key, val = string.match(line, "^%s*([%w_]+)%s*=%s*(.-)%s*$")
    if key and val then
      -- Remove surrounding quotes if present
      val = val:gsub('^["\']', ''):gsub('["\']$', '')
      env_table[key] = val
    end
  end

  local json
  local success

  if opts.args:find("pretty") then
    success, json = pcall(vim.fn.json_encode, env_table)
    if success then
      -- Pretty-print using external formatter (e.g., jq)
      local handle = io.popen("jq .", "w")
      if handle then
        handle:write(json)
        handle:close()
        handle = io.popen("echo '" .. json .. "' | jq .", "r")
        json = handle:read("*a")
        handle:close()
      end
    end
  else
    success, json = pcall(vim.fn.json_encode, env_table)
  end

  if not success then
    print("Error encoding JSON:", json)
    return
  end

  -- If write=<filename>
  local write_file = opts.args:match("write=([%w%._/-]+)")
  if write_file then
    local f = io.open(write_file, "w")
    if f then
      f:write(json)
      f:close()
      print("JSON written to:", write_file)
    else
      print("Error writing to file:", write_file)
    end
  end

  -- If clip
  if opts.args:find("clip") then
    vim.fn.setreg("+", json)
    print("JSON copied to clipboard")
  end

  -- If replace (or no flag)
  if opts.args == "" or opts.args:find("replace") then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(json, "\n"))
    print("Buffer replaced with JSON output")
  end
end

local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local jsonify_flags = {
  pretty = false,
  clip = false,
  replace = true,
  write = nil,
}

local function run_jsonify_env()
  local args = {}
  for k, v in pairs(jsonify_flags) do
    if k == "write" and v then
      table.insert(args, "write=" .. v)
    elseif v == true then
      table.insert(args, k)
    end
  end
  vim.cmd("JsonifyEnv " .. table.concat(args, " "))
end

local function open_jsonify_popup()
  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
      text = { top = " JsonifyEnv " },
    },
    position = "50%",
    size = {
      width = 50,
      height = 10,
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  })

  local function refresh()
    local lines = {
      "Select Flags:",
      "",
      "[p] Pretty     : " .. tostring(jsonify_flags.pretty),
      "[c] Clipboard  : " .. tostring(jsonify_flags.clip),
      "[r] Replace    : " .. tostring(jsonify_flags.replace),
      "[w] Write File : " .. (jsonify_flags.write or "nil"),
      "",
      "[j] ▶ Run with current flags",
      "[q] ✖ Close",
    }
    popup:mount()
    popup:buf_set_lines(0, 0, -1, false, lines)
  e

-- local function open_jsonify_ui()
--   local buf = vim.api.nvim_create_buf(false, true)
--   local win_width = 40
--   local win_height = 10
--   local win_opts = {
--     style = "minimal",
--     relative = "editor",
--     width = win_width,
--     height = win_height,
--     row = (vim.o.lines - win_height) / 2,
--     col = (vim.o.columns - win_width) / 2,
--     border = "rounded",
--   }
--   local win = vim.api.nvim_open_win(buf, true, win_opts)
--
--   local function refresh()
--     local lines = {
--       "JsonifyEnv Flag Selector",
--       "-------------------------",
--       "[p] Pretty     : " .. tostring(jsonify_flags.pretty),
--       "[c] Clipboard  : " .. tostring(jsonify_flags.clip),
--       "[r] Replace    : " .. tostring(jsonify_flags.replace),
--       "[w] Write File : " .. (jsonify_flags.write or "nil"),
--       "",
--       "[j] ▶ Run with current flags",
--       "[q] ✖ Close",
--     }
--     vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
--   end
--
--   refresh()
--
--   vim.keymap.set("n", "p", function()
--     jsonify_flags.pretty = not jsonify_flags.pretty
--     refresh()
--   end, { buffer = buf })
--
--   vim.keymap.set("n", "c", function()
--     jsonify_flags.clip = not jsonify_flags.clip
--     refresh()
--   end, { buffer = buf })
--
--   vim.keymap.set("n", "r", function()
--     jsonify_flags.replace = not jsonify_flags.replace
--     refresh()
--   end, { buffer = buf })
--
--   vim.keymap.set("n", "w", function()
--     vim.ui.input({ prompt = "Filename to write to:" }, function(input)
--       if input and input ~= "" then
--         jsonify_flags.write = input
--       else
--         jsonify_flags.write = nil
--       end
--       refresh()
--     end)
--   end, { buffer = buf })
--
--   vim.keymap.set("n", "j", function()
--     vim.api.nvim_win_close(win, true)
--     run_jsonify_env()
--   end, { buffer = buf })
--
--   vim.keymap.set("n", "q", function()
--     vim.api.nvim_win_close(win, true)
--   end, { buffer = buf })
-- end

vim.api.nvim_create_user_command('JsonifyEnv', M.parse_env_lines_to_json, {
  nargs = "?",
  complete = function(_, _, _)
    return { "pretty", "clip", "replace", "write=" }
  end,
})

function M.setup(opts)
  opts = opts or {}

  vim.keymap.set("n", "<leader>j}", function()
  local function run_jsonify_env()
  local args = {}
  for k, v in pairs(jsonify_flags) do
    if k == "write" and v then
      table.insert(args, "write=" .. v)
    elseif v == true then
      table.insert(args, k)
    end
  end
  vim.notify("Pretty: " .. tostring(jsonify_flags.pretty), vim.log.levels.INFO)
  vim.cmd("JsonifyEnv " .. table.concat(args, " "))
end


  )


return M
