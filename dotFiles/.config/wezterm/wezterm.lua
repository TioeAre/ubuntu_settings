local config = {}

local wezterm = require 'wezterm'
local config_dir = wezterm.config_dir
local config_files = wezterm.glob(config_dir .. '/config/*.lua')

for _, config_file in ipairs(config_files) do
    local file_name = config_file:match("([^/]+)%.lua$")
    if file_name ~= "wezterm" then
        local success, sub_config = pcall(require, "config/" .. file_name)
        if success and type(sub_config) == "table" and type(sub_config.apply_to_config) == "function" then
            sub_config.apply_to_config(config)
        else
            wezterm.log_error("Failed to load or apply theme from " .. file_name)
        end
    end
end

return config
