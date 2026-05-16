# Float Steam
hl.workspace_rule({
  workspace = "name:game",
  monitor = RIGHT_MONITOR,
  persistent = false,

})

hl.window_rule({
  -- workspace = "name:game",
  match = {
  class = "steam",
  title = "Steam",
  },
  tag = "-default-opacity",
 float = true,
  -- center = true,
  monitor = RIGHT_MONITOR,
  min_size = {"1550", "900"}
})

hl.window_rule({
  -- workspace = "name:game",
  match = {
  class = "steam",
  title = "Friends List",
  },
  tag = "-default-opacity",
  float = true,
  -- center = true,
  monitor = RIGHT_MONITOR,
  size = {"400", "800"},
  -- min_size = {"460", "200"}
})

hl.window_rule({
  match = {
class = "_steam_app_.*$",
  },
  tag = "gaming"
})


-- # steam game
-- workspace = name:game, monitor:DP-3, persistent:false
-- windowrule = tag +gaming, match:class ^(steam_app.*)$
-- windowrule = workspace name:game, match:tag gaming
-- # windowrule = fullscreen on, match:tag gaming
-- # windowrule = focus, match:tag gaming
-- binds {
--     disable_keybind_grabbing = true
-- }

