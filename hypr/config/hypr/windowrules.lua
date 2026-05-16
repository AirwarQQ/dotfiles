----------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful
-- local suppressMaximizeRule = hl.window_rule({
-- 	-- Ignore maximize requests from all apps. You'll probably like this.
-- 	name = "suppress-maximize-events",
-- 	match = { class = ".*" },
--
-- 	suppress_event = "maximize",
-- })
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- left screen tag and rules
hl.workspace_rule({
	workspace = "1",
	monitor = "DP-2",
	persistent = true,
})
hl.window_rule({
	match = {
		class = "^(org.telegram.desktop)$|vesktop$",
	},
	workspace = 1,
	monitor = "DP-2",
})

--choosefile float
hl.window_rule({
	match = {
		class = "^xdg-desktop-portal-gtk$",
	},
	float = true,
	center = true,
})
hl.window_rule({
	match = { title = "^(Choose Files)$" },
	float = true,
	center = true,
})
