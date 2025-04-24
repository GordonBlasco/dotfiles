-- ~/dotfiles/hammerspoon/init.lua

-- Convenience modifier
local hyper = {"ctrl", "alt", "shift", "cmd"}


-- Hotkey to program mapping:
local appHotkeys = {
    O = "Obsidian",
    K = "Google Chrome",
    J = "Visual Studio Code"
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

hs.hotkey.bind(hyper, "R", function()
    hs.reload()
end)

-- Confirm it loaded
hs.alert.show("Hammerspoon loaded from dotfiles 🚀")
