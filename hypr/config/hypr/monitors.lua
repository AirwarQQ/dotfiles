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
	position = RIGHT_MONITOR_POS_X .. "x" .. RIGHT_MONITOR_POS_Y,
	-- position = "auto",
	scale = RIGHT_MONITOR_SCALE,
	-- bitdepth = 10,
	icc = "/home/airwar/dotfiles/hypr/config/hypr/MAG321UX_OLED.icm",
	-- cm = "wide",
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
