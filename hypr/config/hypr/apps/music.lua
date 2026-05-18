-- TODO: add spotify support
-- hl.window_rule({
-- 	name = "tag music apps",
-- 	tag = "+music",
-- 	match = {
-- 		class = "^(YandexMusic|Spotify)$",
-- 	},
-- })

hl.window_rule({
	name = "music-rule",
	monitor = "DP-2",
	match = {
		class = "^(YandexMusic)$",
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
			if win.class == "YandexMusic" then
				exists = true
				break
			end
		end

		if exists then
			if current_monitor ~= nil and current_monitor.name ~= "DP-2" then
				hl.dispatch(hl.dsp.focus({ monitor = "DP-2" }))
			end
			hl.dispatch(hl.dsp.workspace.toggle_special("music"))
		else
			hl.dispatch(hl.dsp.exec_cmd(music_cmd))
		end
	end
end

return music_func
