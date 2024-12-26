local wezterm = require 'wezterm'
local disableCommon = require 'config/keybind/disableCommon'
local disablePaneAndTab = require 'config/keybind/disablePaneAndTab'
local setOthers = require 'config/keybind/setOthers'
local setPane = require 'config/keybind/setPane'
local setTab = require 'config/keybind/setTab'

local module = {}

function module.apply_to_config(config)
    -- SUPER, CMD, WIN; CTRL; SHIFT; ALT, OPT, META; LEADER |
    -- Hyper, Super, Meta, Cancel, Backspace, Tab, Clear, Enter, Shift, Escape, LeftShift, RightShift, Control, LeftControl, RightControl, Alt, LeftAlt, RightAlt, Menu, LeftMenu, RightMenu, Pause, CapsLock, VoidSymbol, PageUp, PageDown, End, Home, LeftArrow, RightArrow, UpArrow, DownArrow, Select, Print, Execute, PrintScreen, Insert, Delete, Help, LeftWindows, RightWindows, Applications, Sleep, Numpad0, Numpad1, Numpad2, Numpad3, Numpad4, Numpad5, Numpad6, Numpad7, Numpad8, Numpad9, Multiply, Add, Separator, Subtract, Decimal, Divide, NumLock, ScrollLock, BrowserBack, BrowserForward, BrowserRefresh, BrowserStop, BrowserSearch, BrowserFavorites, BrowserHome, VolumeMute, VolumeDown, VolumeUp, MediaNextTrack, MediaPrevTrack, MediaStop, MediaPlayPause, ApplicationLeftArrow, ApplicationRightArrow, ApplicationUpArrow, ApplicationDownArrow, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15, F16, F17, F18, F19, F20, F21, F22, F23, F24
    config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
    config.keys = {}

    disableCommon.apply_to_config(config)
    disablePaneAndTab.apply_to_config(config)
    setOthers.apply_to_config(config)
    setPane.apply_to_config(config)
    setTab.apply_to_config(config)
end

return module
