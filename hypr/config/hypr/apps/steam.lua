-- # Float Steam
hl.window_rule({
	-- workspace = "name:game",
	match = {
		class = "steam",
		title = "Steam",
	},
	tag = "-default-opacity",
	float = true,
	-- center = true,
	-- monitor = RIGHT_MONITOR,
	min_size = { "1550", "900" },
	suppress_event = "activate",
	opacity = "1 1",
})

hl.window_rule({
	-- workspace = "name:game",
	match = {
		class = "steam",
		title = "Friends List",
	},
	tag = "-default-opacity",
	float = true,
	-- center = true,
	-- monitor = RIGHT_MONITOR,
	size = { "400", "800" },
	-- min_size = {"460", "200"}
	opacity = "1 1",
})

-- Game workspace
-- socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock
hl.window_rule({
	match = {
		class = "^steam_app_.*$",
	},
	tag = "+game",
	workspace = "name:game",
	opacity = "1 1",
	-- stay_focused = true,
	-- monitor = RIGHT_MONITOR,
	-- fullscreen = true,
	-- fullscreen_state = "2 2",
})

hl.workspace_rule({
	workspace = "name:game",
	monitor = RIGHT_MONITOR,
	persistent = false,
})

-- hl.on("window.fullscreen", function(w)
-- 	if w.tags then
-- 		for _, t in ipairs(w.tags) do
-- 			if t == "game*" or t == "game" then
-- 				hl.dispatch(hl.dsp.focus({ window = w }))
-- 				-- hl.dispatch(hl.dsp.focus({ window = w }))
-- 				break
-- 			end
-- 		end
-- 	end
-- end)
hl.on("window.fullscreen", function(w)
	if w.tags then
		for _, t in ipairs(w.tags) do
			if t == "game*" or t == "game" then
				hl.dispatch(hl.dsp.focus({ window = w }))
				-- hl.dispatch(hl.dsp.focus({ window = w }))
				break
			end
		end
	end
end)

-- Fix steam games resolution
hl.on("hyprland.start", function()
	hl.exec_cmd("xrandr --output " .. RIGHT_MONITOR .. " --primary")
end)

-- # steam game
-- workspace = name:game, monitor:DP-3, persistent:false
-- windowrule = tag +gaming, match:class ^(steam_app.*)$
-- windowrule = workspace name:game, match:tag gaming
-- # windowrule = fullscreen on, match:tag gaming
-- # windowrule = focus, match:tag gaming
-- binds {
--     disable_keybind_grabbing = true
-- }
