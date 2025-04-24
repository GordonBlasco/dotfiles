-- ~/dotfiles/hammerspoon/init.lua

-- Convenience modifier
local hyper = {"ctrl", "alt", "shift", "cmd"}

-- Launch apps
hs.hotkey.bind(hyper, "O", function()
    hs.application.launchOrFocus("Obsidian")
end)

hs.hotkey.bind(hyper, "K", function()
    hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "J", function()
    hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind(hyper, "R", function()
    hs.reload()
end)

-- Confirm it loaded
hs.alert.show("Hammerspoon loaded from dotfiles 🚀")
