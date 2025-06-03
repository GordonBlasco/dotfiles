-- ~/dotfiles/hammerspoon/init.lua

-- Convenience modifier
local hyper = { "ctrl", "alt", "shift", "cmd" }

-- Hotkey to program mapping:
local appHotkeys = {
	O = "Obsidian",
	U = "Google Chrome",
	I = "Visual Studio Code",
	P = "Microsoft OneNote",
	Q = "Microsoft Teams",
	W = "Microsoft Outlook",
	E = "Slack",
}

for key, app in pairs(appHotkeys) do
	hs.hotkey.bind(hyper, key, function()
		hs.application.launchOrFocus(app)
	end)
end

-- bulkier version
-- hs.hotkey.bind(hyper, "H", function()
--   hs.window.layout.move(1, [0,0,50,100], 0, 0)
-- end)

-- bulkier version
-- hs.hotkey.bind(hyper, "K", function()
--     hs.application.launchOrFocus("Google Chrome")
-- end)

hs.hotkey.bind(hyper, "R", function()
	hs.reload()
end)

-- Confirm it loaded
hs.alert.show("🐷 Hammed Up 🐷")
