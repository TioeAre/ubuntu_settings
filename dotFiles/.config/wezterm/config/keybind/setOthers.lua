local wezterm = require 'wezterm'

local module = {}

wezterm.on('increase-transparency', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity <= 0.9 then
        overrides.window_background_opacity = overrides.window_background_opacity + 0.1
    else
        overrides.window_background_opacity = 1
    end
    window:set_config_overrides(overrides)
end)
wezterm.on('decrease-transparency', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity >= 0.1 then
        overrides.window_background_opacity = overrides.window_background_opacity - 0.1
    else
        overrides.window_background_opacity = 0
    end
    window:set_config_overrides(overrides)
end)

function module.apply_to_config(config)
    if type(config.keys) ~= 'table' then
        return
    end

    local new_keys = {
        {
            key = '-',
            mods = 'CTRL',
            action = wezterm.action.DecreaseFontSize,
        },
        {
            key = '=',
            mods = 'CTRL',
            action = wezterm.action.IncreaseFontSize,
        },
        {
            key = 'i',
            mods = 'ALT',
            action = wezterm.action.ActivateCopyMode,
        },
        {
            key = 'f',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.Search { CaseInSensitiveString = "" },
        },
        {
            key = 'r',
            mods = 'LEADER|ALT',
            action = wezterm.action.ReloadConfiguration,
        },
        {
            key = 'm',
            mods = 'LEADER',
            action = wezterm.action.TogglePaneZoomState,
        },
        {
            key = '/',
            mods = 'CTRL',
            action = wezterm.action.SendString "\x1f",
        },
        {
            key = "F2",
            mods = "CTRL",
            action = wezterm.action.EmitEvent 'decrease-transparency',
        },
        {
            key = "F3",
            mods = "CTRL",
            action = wezterm.action.EmitEvent 'increase-transparency',
        },
        {
            key = "c",
            mods = "CTRL|SHIFT",
            action = wezterm.action.CopyTo "PrimarySelection"
        },
        {
            key = "v",
            mods = "CTRL|SHIFT",
            action = wezterm.action.PasteFrom "PrimarySelection"
        },
    }

    for _, key_binding in ipairs(new_keys) do
        table.insert(config.keys, key_binding)
    end
end

return module
