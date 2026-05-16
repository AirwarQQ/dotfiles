# Float Steam
-- windowrule = float on, match:class steam
-- windowrule = center on, match:class steam, match:title Steam
-- windowrule = tag -default-opacity, match:class steam.*
-- windowrule = opacity 1 1, match:class steam.*
-- # windowrule = size 1100 700, match:class steam, match:title Steam
-- windowrule = size 460 800, match:class steam, match:title Friends List
-- windowrule = idle_inhibit fullscreen, match:class steam

-- hl.window_rule({
--  float on, match:class steam
-- })


-- # steam game
-- workspace = name:game, monitor:DP-3, persistent:false
-- windowrule = tag +gaming, match:class ^(steam_app.*)$
-- windowrule = workspace name:game, match:tag gaming
-- # windowrule = fullscreen on, match:tag gaming
-- # windowrule = focus, match:tag gaming
-- binds {
--     disable_keybind_grabbing = true
-- }

