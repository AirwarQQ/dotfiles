hl.window_rule({
	match = {
		class = "^((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)$",
	},
	tag = "+chromium-based-browser",
})

hl.window_rule({
	match = {
		class = "([fF]irefox|zen|librewolf)",
	},
	tag = "+firefox-based-browser",
})

hl.window_rule({
	match = {
		tag = "chromium-based-browser",
	},
	tag = "-default-opacity",
})

hl.window_rule({
	match = {
		tag = "firefox-based-browser",
	},
	tag = "-default-opacity",
})

hl.window_rule({
	match = {
		tag = "chromium-based-browser",
	},
	opacity = "1.0 0.97",
})

hl.window_rule({
	match = {
		tag = "firefox-based-browser-based-browser",
	},
	opacity = "1.0 0.97",
})

hl.window_rule({
	match = {
		title = ".*is-sharing.*",
	},
	workspace = "special silent",
})

-- -- Hide screen sharing notification windows.
-- o.window({ title = ".*is sharing.*" }, { workspace = "special silent" })

local fs_prev = nil

hl.on("window.fullscreen", function(w)
	local cur = w.fullscreen
	local prev = fs_prev
	fs_prev = cur

	if prev == 2 and cur == 0 then
		-- left real fullscreen; the bogus maximize lands within a ms.
		hl.timer(function()
			fs_prev = nil
		end, { timeout = 1, type = "oneshot" })
	elseif cur == 1 and fs_prev then
		-- Bogus maximize; unset fullscreen
		fs_prev = nil
		hl.dispatch(hl.dsp.window.fullscreen_state({
			internal = 0,
			client = 0,
			action = "set",
			window = w,
		}))
	end
end)
