local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    config.scrollback_lines = 50000

    local is_windows = wezterm.target_triple:find("windows") ~= nil
    if is_windows then
        config.default_prog = { 'pwsh.exe' }
    else
        -- config.default_prog = { '/usr/local/bin/fish', '-l' }
    end

    config.initial_cols = 90
    config.initial_rows = 30
    config.exit_behavior = "CloseOnCleanExit"

    config.disable_default_key_bindings = true
end

return module
