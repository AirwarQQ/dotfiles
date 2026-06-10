hl.window_rule({
	name = "bitwarden-rule",
	match = { class = "^Bitwarden$" },
	float = true,
	center = true,
	-- max_size = { "monitor_w*0.7", "monitor_h*0.8" },
	min_size = { "monitor_w*0.6", "monitor_h*0.7" },
	animation = "slide",
})
