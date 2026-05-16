-------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us,ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 0,
		accel_profile = 0,
		sensitivity = -0.5, -- -1.0 - 1.0, 0 means no modification.

		repeat_rate = 40,
		repeat_delay = 300,

		numlock_by_default = true,

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.config({
	cursor = {
		no_hardware_cursors = true,
		default_monitor = "DP-3",
	},
})

hl.window_rule({
	name = "terminal scroll_touchpad",
	match = {
		class = "Alacritty|kitty|foot",
	},
	scroll_touchpad = 1.5,
})

hl.window_rule({
	name = "terminal scroll_touchpad.ghostyy",
	match = {
		class = "Acom.mitchellh.ghostty",
	},
	scroll_touchpad = 0.2,
})
