-- ESSENTIALS

hl.bind(MAINMOD .. " + W", hl.dsp.window.close())
-- TODO: finish closing YandexMusic
-- hl.bind(MAINMOD .. " + W", function()
-- 	local active = hl.get_active_window()
-- 	if active and active.class == "YandexMusic" then
-- 		hl.dsp.exec_raw("movetoworkspacesilent special:music")
-- 	else
-- 		hl.dsp.window.close()
-- 	end
-- end)

hl.bind(MAINMOD .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MAINMOD .. " + P", hl.dsp.window.pseudo())
hl.bind(MAINMOD .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with MAINMOD + arrow keys
hl.bind(MAINMOD .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MAINMOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MAINMOD .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MAINMOD .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with MAINMOD + [0-9]
-- Move active window to a workspace with MAINMOD + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(MAINMOD .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(MAINMOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(MAINMOD .. " + H", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MAINMOD .. " + SHIFT + H", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with MAINMOD + scroll
hl.bind(MAINMOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAINMOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with MAINMOD + LMB/RMB and dragging
hl.bind(MAINMOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAINMOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
