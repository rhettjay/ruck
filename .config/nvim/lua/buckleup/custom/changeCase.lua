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

return M
