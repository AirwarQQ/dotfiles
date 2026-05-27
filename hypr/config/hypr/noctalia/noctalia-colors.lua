local primary = "#e6b450"
local surface = "#0b0e14"
local secondary = "#aad94c"
local error = "#d95757"

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
