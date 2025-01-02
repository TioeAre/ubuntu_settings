local wezterm = require 'wezterm'

local module = {}

local function basename(s)
    if s ~= nil then
        return string.gsub(s, '(.*[/\\])(.*)', '%2')
    end
end

local function is_inside_vim(pane)
    local process_name = basename(pane:get_foreground_process_name())
    if process_name == nil then return false end

    return string.match(process_name:lower(), "nvim") or
        string.match(process_name:lower(), "ssh") or
        string.match(process_name:lower(), "tmux") or
        string.match(process_name:lower(), "zellij")
    -- return pane:get_title():find("n?vim") ~= nil or
    --     pane:get_title():find('tmux') ~= nil or pane:get_title():find('Zellij') ~= nil
end

local function is_inside(pane, apps)
    apps = apps or {"ssh", "tmux", "zellij"}
    local process_name = basename(pane:get_foreground_process_name())
    if process_name == nil then return false end

    process_name = process_name:lower()
    for _, app in ipairs(apps) do
        if string.match(process_name, app) then
            return true
        end
    end
    return false
end

local function bind(cond, key, mods, action, apps)
    local function callback(win, pane)
        if cond(pane, apps) then
            win:perform_action(wezterm.action.SendKey({ key = key, mods = mods }), pane)
        else
            win:perform_action(action, pane)
        end
    end
    return { key = key, mods = mods, action = wezterm.action_callback(callback) }
end

function module.bind_if(new_keys, config, apps)
    for _, binding in ipairs(new_keys) do
        table.insert(config.keys, bind(is_inside, binding.key, binding.mods, binding.action, apps))
    end
end

return module
