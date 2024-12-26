local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    if type(config.keys) ~= 'table' then
        return
    end

    local new_keys = {
        {
            key = 'e',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'o',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'a',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'h',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'j',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'k',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'l',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'UpArrow',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'LeftArrow',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'RightArrow',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'DownArrow',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'H',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'L',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'J',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'K',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'h',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'j',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'k',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'l',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'H',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'J',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'K',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'L',
            mods = 'ALT|SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'UpArrow',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'LeftArrow',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'RightArrow',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'DownArrow',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'UpArrow',
            mods = 'SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'LeftArrow',
            mods = 'SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'RightArrow',
            mods = 'SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = 'DownArrow',
            mods = 'SHIFT',
            action = wezterm.action.DisableDefaultAssignment,
        },
    }

    for _, key_binding in ipairs(new_keys) do
        table.insert(config.keys, key_binding)
    end
end

return module
