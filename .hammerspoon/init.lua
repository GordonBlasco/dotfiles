-- ~/dotfiles/hammerspoon/init.lua

-- Convenience modifier
local hyper = {"ctrl", "alt", "shift", "cmd"}

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

hs.hotkey.bind(hyper, "R", function()
    hs.reload()
end)

hs.hotkey.bind(hyper, "M", function()
    hs.spaces.goToSpace(2)
end)




local spaces = require("hs.spaces")
local screen = hs.screen.mainScreen()
local uuid = screen:getUUID()
local spaceLayout = spaces.spacesForScreen(uuid)
local active = spaces.activeSpaceOnScreen(uuid)

local function indexOf(t, val)
  for i, v in ipairs(t) do
    if v == val then return i end
  end
  return nil
end

-- Go to space to the left
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "M", function()
  local current = spaces.activeSpaceOnScreen(uuid)
  local i = indexOf(spaceLayout, current)
  if i and i > 1 then
    spaces.gotoSpace(spaceLayout[i - 1])
  else
    hs.alert("No space to the left")
  end
end)

-- Go to space to the right
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, ",", function()
  local current = spaces.activeSpaceOnScreen(uuid)
  local i = indexOf(spaceLayout, current)
  if i and i < #spaceLayout then
    spaces.gotoSpace(spaceLayout[i + 1])
  else
    hs.alert("No space to the right")
  end
end)








-- Confirm it loaded
hs.alert.show("🐷 Hammed Up 🐷")
