local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
    bar.apply_to_config(config,
        {
            separator = {
                space = 1,
                -- left_icon = ">",
                -- right_icon = "<",
            },
            modules = {
                spotify = {
                    enabled = false,
                },
                clock = {
                    enabled = true,
                    format = "%H:%M:%S",
                },
                hostname = {
                    enabled = false,
                },
                username = {
                    enabled = false,
                },
                workspace = {
                    enabled = false,
                },
                leader = {
                    enabled = false,
                },
                cwd = {
                    enabled = false,
                },
            },
        })

    -- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
    -- tabline.setup({
    --     options = {
    --         theme = config.color_scheme,
    --     },
    --     sections = {
    --         tabline_a = { 'mode' },
    --         tabline_b = { '' },
    --         tabline_c = { '' },
    --         -- tabline_b = { 'workspace' },
    --         -- tabline_c = { ' ' },
    --         tab_active = {
    --             -- 'index',
    --             -- { 'parent', padding = 0 },
    --             -- '/',
    --             -- { 'cwd', padding = { left = 0, right = 1 } },
    --             'index', { 'process', padding = { left = 0, right = 1 } },
    --             { 'zoomed',  padding = 0 },
    --         },
    --         tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    --         tabline_x = { '' },
    --         tabline_y = { 'ram', 'cpu' },
    --         tabline_z = { 'datetime', 'battery' },
    --         -- tabline_z = { 'domain' },
    --     },
    --     extensions = {},
    -- })
    -- tabline.apply_to_config(config)
end

return module
