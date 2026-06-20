local music_monitor = LEFT_MONITOR
local music_classes = { "YandexMusic", "spotify" }

local music_match = "^(" .. table.concat(music_classes, "|") .. ")$"

local function is_music_window(class)
	if not class then
		return false
	end
	for _, c in ipairs(music_classes) do
		if class == c then
			return true
		end
	end
	return false
end

hl.window_rule({
	name = "music-rule",
	monitor = music_monitor,
	match = {
		class = music_match,
	},
	workspace = "special:music",
	-- float = true,
	pseudo = true,
	pin = true,
	center = true,
	size = { "monitor_w", "monitor_h*0.5" },
})

local music_func = {}
function music_func.toggle(music_cmd)
	return function()
		local windows = hl.get_windows()
		local current_monitor = hl.get_active_monitor()

		local exists = false
		for _, win in ipairs(windows) do
			if is_music_window(win.class) then
				exists = true
				break
			end
		end

		if exists then
			if current_monitor ~= nil and current_monitor.name ~= music_monitor then
				hl.dispatch(hl.dsp.focus({ monitor = music_monitor }))
			end
			hl.dispatch(hl.dsp.workspace.toggle_special("music"))
		else
			hl.dispatch(hl.dsp.exec_cmd(music_cmd))
		end
	end
end

return music_func
