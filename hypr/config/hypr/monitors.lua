-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
LEFT_MONITOR = "DP-2"
RIGHT_MONITOR = "DP-3"

hl.monitor({
	output = RIGHT_MONITOR,
	mode = "3840x2160@239.99",
	position = "1152x608",
	-- position = "auto",
	scale = "1.5",
	bitdepth = 10,
	-- cm = "srgb",
})

hl.monitor({
	output = LEFT_MONITOR,
	mode = "2560x1440@143.97",
	-- position = "auto",
	position = "0x0",
	scale = "1.25",
	transform = 3,
})

hl.monitor({
	output = "HDMI-A-1",
	disabled = true,
})
