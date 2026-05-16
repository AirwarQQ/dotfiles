hl.window_rule({
	name = "satty_rule",
	match = {
		class = "^com\\.gabm\\.satty$",
	},
	float = true,
	center = true,
	max_size = { "monitor_w*0.7", "monitor_h*0.7" },
	min_size = { "monitor_w*0.5", "monitor_h*0.5" },
	animation = "slide",
})
