local primary = "#ffb1c1"
local surface = "#171213"
local secondary = "#e4bdc3"
local error = "#ffb4ab"

hl.config({
	general = {
		col = {
			active_border = primary,
			inactive_border = surface,
		},
	},
	group = {
		col = {
			border_active = secondary,
			border_inactive = surface,
			border_locked_active = error,
			border_locked_inactive = surface,
		},
		groupbar = {
			col = {
				active = secondary,
				inactive = surface,
				locked_active = error,
				locked_inactive = surface,
			},
		},
	},
})
