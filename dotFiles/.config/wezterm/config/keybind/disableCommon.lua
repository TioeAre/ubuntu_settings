local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    if type(config.keys) ~= 'table' then
        return
    end

    local new_keys = {
        {
            key = 'e',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = '0',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = '-',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
        },
        {
            key = '=',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
        }
    }

    for _, key_binding in ipairs(new_keys) do
        table.insert(config.keys, key_binding)
    end
end

return module
