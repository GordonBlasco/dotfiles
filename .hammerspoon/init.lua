-- ~/dotfiles/hammerspoon/init.lua

local hyper = {"ctrl", "alt", "shift", "cmd"}

local window = require 'hs.window'
hs.loadSpoon("SpoonInstall")

Install=spoon.SpoonInstall
Install:andUse("WindowGrid", {
    config = { gridGeometries = { { "10x3" } } },
    hotkeys = { show_grid = {{"alt"}, "g"} },
    start = true
})

Install:andUse("WindowScreenLeftAndRight", {
    hotkeys = {
        screen_left  = { hyper, "s" },
        screen_right = { hyper, "d" },
    }
})

-- Convenience modifier


-- Hotkey to program mapping:
local appHotkeys = {
    O = "Obsidian",
    U = "Google Chrome",
    I = "Visual Studio Code",
    P = "Microsoft OneNote",
    Q = "Microsoft Teams",
    W = "Microsoft Outlook",
    E = "Slack",
    T = "Alacritty"
}

for key, app in pairs(appHotkeys) do
    hs.hotkey.bind(hyper, key, function()
        hs.application.launchOrFocus(app)
    end)
end


-- bulkier version
-- hs.hotkey.bind(hyper, "K", function()
--     hs.application.launchOrFocus("Google Chrome")
-- end)

-- hs.hotkey.bind(hyper, "1", function()
--     hs.spaces.gotoSpace(1)
-- end)

-- hs.hotkey.bind(hyper, "2", function()
--     hs.spaces.gotoSpace(2)
-- end)

-- hs.hotkey.bind(hyper, "3", function()
--     hs.spaces.gotoSpace(3)
-- end)

-- hs.hotkey.bind(hyper, "4", function()
--     hs.spaces.gotoSpace(4)
-- end)

hs.hotkey.bind(hyper, "R", function()
    hs.reload()
end)

-- Confirm it loaded
hs.alert.show("🐷 Hammed Up 🐷")
