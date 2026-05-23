-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

hl.monitor({
	output = RIGHT_MONITOR,
	mode = "3840x2160@239.99",
	position = "1152x608",
	-- position = "auto",
	scale = RIGHT_MONITOR_SCALE,
	bitdepth = 10,
	-- cm = "srgb",
})

hl.monitor({
	output = LEFT_MONITOR,
	mode = "2560x1440@143.97",
	-- position = "auto",
	position = "0x0",
	scale = LEFT_MONITOR_SCALE,
	transform = 3,
})

hl.monitor({
	output = "HDMI-A-1",
	disabled = true,
})
