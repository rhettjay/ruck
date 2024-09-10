local wezterm = require("wezterm")
local act = wezterm.action
local gui = wezterm.gui
local config = {}

gui.window_background_image = "~/buckleup/errors.jpg"
config.window_background_opacity = 0.95
config.color_scheme = 'Builtin Solarized Dark'
config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
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
