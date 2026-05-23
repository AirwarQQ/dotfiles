-- Media/image/video apps should be opaque.
hl.window_rule({
	match = {
		class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$",
	},
	tag = "-default-opacity",
	opacity = "1 1",
})
