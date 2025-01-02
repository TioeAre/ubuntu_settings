local wezterm = require 'wezterm'
local condition = require"config/keybind/disableCondition"

local module = {}

function module.apply_to_config(config)
    if type(config.keys) ~= 'table' then
        return
    end

    local new_keys = {
        {
            key = 'a',
            mods = 'ALT',
            action = wezterm.action.SpawnTab "CurrentPaneDomain",
        },
        {
            key = 'H',
            mods = 'ALT|SHIFT',
            action = wezterm.action.ActivateTabRelative(-1),
        },
        {
            key = 'L',
            mods = 'ALT|SHIFT',
            action = wezterm.action.ActivateTabRelative(1),
        },
        {
            key = 'J',
            mods = 'ALT|SHIFT',
            action = wezterm.action.MoveTabRelative(1),
        },
        {
            key = 'K',
            mods = 'ALT|SHIFT',
            action = wezterm.action.MoveTabRelative(-1),
        },
        {
            key = 'h',
            mods = 'ALT|SHIFT',
            action = wezterm.action.ActivateTabRelative(-1),
        },
        {
            key = 'l',
            mods = 'ALT|SHIFT',
            action = wezterm.action.ActivateTabRelative(1),
        },
        {
            key = 'j',
            mods = 'ALT|SHIFT',
            action = wezterm.action.MoveTabRelative(1),
        },
        {
            key = 'k',
            mods = 'ALT|SHIFT',
            action = wezterm.action.MoveTabRelative(-1),
        },
        {
            key = 'UpArrow',
            mods = 'SHIFT',
            action = wezterm.action.MoveTabRelative(-1),
        },
        {
            key = 'DownArrow',
            mods = 'SHIFT',
            action = wezterm.action.MoveTabRelative(1),
        },
        {
            key = 'LeftArrow',
            mods = 'SHIFT',
            action = wezterm.action.ActivateTabRelative(-1),
        },
        {
            key = 'RightArrow',
            mods = 'SHIFT',
            action = wezterm.action.ActivateTabRelative(1),
        },
        {
            key = 'd',
            mods = 'CTRL',
            action = wezterm.action.CloseCurrentPane { confirm = true },
        },
    }
    local apps = nil -- {"ssh", "tmux", "zellij"}
    condition.bind_if(new_keys, config, apps)

    -- for _, key_binding in ipairs(new_keys) do
    --     table.insert(config.keys, key_binding)
    -- end
end

return module
