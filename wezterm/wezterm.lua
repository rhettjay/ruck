local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

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
