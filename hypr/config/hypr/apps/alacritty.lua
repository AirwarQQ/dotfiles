-- # Define terminal tag to style them uniformly
hl.window_rule({
	match = {
		class = "(Alacritty|kitty|com.mitchellh.ghostty|foot)",
	},
	opacity = { "0.98", "0.95" },
})
-- windowrule = tag +terminal, match:class (Alacritty|kitty|com.mitchellh.ghostty|foot)
-- windowrule = tag -default-opacity, match:tag terminal
-- windowrule = opacity 0.98 0.95, match:tag terminal
