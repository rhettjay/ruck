local wezterm = require("wezterm")
local act = wezterm.action
local gui = wezterm.gui

local function get_appearance()
  if gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Builtin Solarized Dark'
  else
    return 'Builtin Solarized Light'
  end
end


local config = {
  color_scheme = scheme_for_appearance(get_appearance()),
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true
}

config.window_frame = {
  font = wezterm.font { family = 'Nerd Font', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

config.keys = {
	{
		key = "k",
		mods = "CMD",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	{
		key = "d",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "DefaultDomain" }),
	},
	{
		key = "g",
		mods = "CMD",
		action = act.SplitVertical({ domain = "DefaultDomain" }),
	},
	{
		key = "]",
		mods = "CMD",
		action = act.ActivatePaneDirection("Next"),
	},
	{
		key = "[",
		mods = "CMD",
		action = act.ActivatePaneDirection("Prev"),
	},
}

return config
