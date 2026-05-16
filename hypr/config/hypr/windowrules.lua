----------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful
--
-- hl.workspace_rule({})

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

-- TODO: left screen tag and rules
-- workspace = 1, monitor:DP-2, persistent:true
-- windowrule = tag +leftscreen, match:class ^(org\.telegram\.desktop)$
-- windowrule = tag +leftscreen, match:class ^(YandexMusic)$
-- windowrule = tag +leftscreen, match:class ^(vesktop)$
-- windowrule = workspace 1 silent, match:tag leftscreen
--
-- TODO: choosefile float
-- windowrule = tag +choosefile, match:title ^(Choose Files)$
-- windowrule = float true, match:tag choosefile
-- windowrule = center on, match:tag choosefile
