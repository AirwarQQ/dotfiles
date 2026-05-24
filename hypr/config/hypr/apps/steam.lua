-- # Float Steam

local steam_main_size_x = "1861"
local steam_main_size_y = "1386"
local steam_main_pos_x = "1164"
local steam_main_pos_y = "650"
local steam_friends_size_x = "661"
local steam_friends_size_y = "1386"
local steam_friends_pos_x = "3039"
local steam_friends_pos_y = "650"

--
--
hl.window_rule({
	-- workspace = "name:game",
	match = {
		class = "steam",
		title = "Steam",
	},
	tag = "-default-opacity",
	opacity = "1 1",
	persistent_size = true,
	-- min_size = { "1550", "900" },
	float = true,
	-- tile = true,
	-- center = true,
	-- monitor = RIGHT_MONITOR,
	-- workspace = "name:game",
	size = { steam_main_size_x, steam_main_size_y },
	move = { steam_main_pos_x .. "-" .. RIGHT_MONITOR_POS_X, steam_main_pos_y .. "-" .. RIGHT_MONITOR_POS_Y },
	-- suppress_event = "activate",
})

hl.window_rule({
	-- workspace = "name:game",
	match = {
		class = "steam",
		title = "Friends List",
	},
	tag = "-default-opacity",
	persistent_size = true,
	float = true,
	-- tile = true,
	-- center = true,
	-- monitor = RIGHT_MONITOR,
	size = { steam_friends_size_x, steam_friends_size_y },
	move = { steam_friends_pos_x .. "-" .. RIGHT_MONITOR_POS_X, steam_friends_pos_y .. "-" .. RIGHT_MONITOR_POS_Y },
	-- min_size = {"460", "200"}
	-- max_size = { "460", "200" },
	opacity = "1 1",
})

hl.window_rule({
	-- workspace = "name:game",
	match = {
		class = "steam",
	},
	tag = "-default-opacity",
	persistent_size = true,
	float = true,
	-- tile = true,
	-- center = true,
	-- monitor = RIGHT_MONITOR,
	-- size = { "400", "800" },
	-- min_size = {"460", "200"}
	-- max_size = { "460", "200" },
	opacity = "1 1",
})

hl.window_rule({
	-- workspace = "name:game",
	match = {
		class = "steam",
		title = "Steam Settings",
	},
	-- persistent_size = true,
	tag = "-default-opacity",
	float = true,
	center = true,
	-- monitor = RIGHT_MONITOR,
	size = { "1318", "1120" },
	opacity = "1 1",
})

-- Game workspace
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

-- hl.window_rule({
-- 	match = {
-- 		tag = "game",
-- 	},
-- 	tag = "-default-opacity",
-- })

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
				hl.notification.create({
					text = "caught fullscreen game function",
					timeout = 4000,
					icon = "ok",
				})
				-- hl.dispatch(hl.dsp.window.move({
				-- 	workspace = "special:steam_hidden",
				-- 	window = {
				-- 		match = {
				-- 			class = "steam",
				-- 			title = "Steam",
				-- 		},
				-- 	},
				-- 	follow = false,
				-- }))
				-- hl.dispatch(hl.dsp.focus({ window = w }))
				-- hl.dispatch(hl.dsp.focus({ window = w }))
				break
			end
		end
	end
end)

-- hl.bind(MAINMOD .. " + F1", function()
-- 	hl.exec_cmd(
-- 		"hyprctl dispatch focuswindow 'class:^(steam)$' && hyprctl dispatch focuswindow 'class:^(steam_app_).*$'"
-- 	)
-- 	hl.notification.create({
-- 		text = "focus refreshed",
-- 		timeout = 1500,
-- 		icon = "ok",
-- 	})
-- end)

-- Fix steam games resolution
hl.on("hyprland.start", function()
	hl.exec_cmd("xrandr --output " .. RIGHT_MONITOR .. " --primary")
end)
