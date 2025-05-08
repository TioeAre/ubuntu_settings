local wezterm = require 'wezterm'
local condition = require"config/keybind/disableCondition"

local module = {}

function module.apply_to_config(config)
    if type(config.keys) ~= 'table' then
        return
    end

    local new_keys = {
        {
            key = 'e',
            mods = 'ALT',
            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
        },
        {
            key = 'o',
            mods = 'ALT',
            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
        },
        {
            key = 'h',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection "Left",
        },
        {
            key = 'j',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection "Down",
        },
        {
            key = 'k',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection "Up",
        },
        {
            key = 'l',
            mods = 'ALT',
            action = wezterm.action.ActivatePaneDirection "Right",
        },
        {
            key = 'UpArrow',
            mods = 'ALT',
            action = wezterm.action.RotatePanes 'CounterClockwise',
        },
        {
            key = 'LeftArrow',
            mods = 'ALT',
            action = wezterm.action.PaneSelect {
                mode = 'SwapWithActive',
            },
        },
        {
            key = 'RightArrow',
            mods = 'ALT',
            action = wezterm.action.PaneSelect {
                mode = 'SwapWithActive',
            },
        },
        {
            key = 'DownArrow',
            mods = 'ALT',
            action = wezterm.action.RotatePanes 'Clockwise',
        },
        {
            key = 'UpArrow',
            mods = 'CTRL',
            action = wezterm.action.AdjustPaneSize { "Up", 1 },
        },
        {
            key = 'DownArrow',
            mods = 'CTRL',
            action = wezterm.action.AdjustPaneSize { "Down", 1 },
        },
        {
            key = 'LeftArrow',
            mods = 'CTRL',
            action = wezterm.action.AdjustPaneSize { "Left", 1 },
        },
        {
            key = 'RightArrow',
            mods = 'CTRL',
            action = wezterm.action.AdjustPaneSize { "Right", 1 },
        },
    }

    local apps = { "ssh", "tmux", "zellij", "connect", "nvim", "docker" }
    condition.bind_if(new_keys, config, apps)

    -- for _, key_binding in ipairs(new_keys) do
    --     table.insert(config.keys, key_binding)
    -- end
end

return module
