hl.window_rule({
	name = "qBittorrent-rule",
	match = { class = "^org\\.qbittorrent\\.qBittorrent$" },
	float = true,
	center = true,
	max_size = { "monitor_w*0.9", "monitor_h*0.9" },
	-- min_size = { "monitor_w*0.6", "monitor_h*0.7" },
	animation = "slide",
})
