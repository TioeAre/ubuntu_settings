local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    -- config.color_scheme = 'Catppuccin Frappe'
    -- config.color_scheme = 'Catppuccin Frappé (Gogh)'
    -- config.color_scheme = 'Catppuccin Latte'
    -- config.color_scheme = 'Catppuccin Latte (Gogh)'
    config.color_scheme = 'Catppuccin Macchiato'
    -- config.color_scheme = 'Catppuccin Macchiato (Gogh)'
    -- config.color_scheme = "Catppuccin Mocha"
    -- config.color_scheme = 'Catppuccin Mocha (Gogh)'

    config.use_fancy_tab_bar = true
    config.enable_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = true
    config.tab_max_width = 16

    config.window_background_opacity = 0.9

    -- config.font = wezterm.font("IntoneMono Nerd Font Mono")
    config.font = wezterm.font_with_fallback {
        "IntoneMono Nerd Font Mono",
        "IntoneMono NFM",
        "Noto Sans Mono CJK SC",
        "LXGW WenKai Mono",
    }

    config.enable_scroll_bar = true

    -- cursor
    -- config.cursor_style = "BlinkingBlock"
    -- config.cursor_thickness = 2
    -- config.cursor_blink_ease_in = "Linear"
    -- config.cursor_blink_ease_out = "Linear"
    -- config.cursor_blink_rate = 1000
end

return module
