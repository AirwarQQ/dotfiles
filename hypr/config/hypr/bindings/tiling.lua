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
hl.bind(MAINMOD .. " + U", hl.dsp.focus({ urgent_or_last = true }))
hl.bind(MAINMOD .. " + H", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MAINMOD .. " + SHIFT + H", hl.dsp.window.move({ workspace = "special:magic", follow = false }))
hl.bind(MAINMOD .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(MAINMOD .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

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
	hl.bind(MAINMOD .. " + CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move/resize windows with MAINMOD + LMB/RMB and dragging
hl.bind(MAINMOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAINMOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- TAB between workspaces
hl.bind(MAINMOD .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAINMOD .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MAINMOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAINMOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MAINMOD .. " + CTRL + TAB", hl.dsp.focus({ last = true }))

-- To switch between windows in a floating workspace:
hl.bind("ALT + Tab", function()
	hl.dispatch(hl.dsp.window.cycle_next()) -- Change focus to another window
	hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end)
hl.bind("ALT + SHIFT+ Tab", function()
	hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
	hl.dispatch(hl.dsp.window.cycle_next()) -- Change focus to another window
end)

-- Resize active window
hl.bind(MAINMOD .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(MAINMOD .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(MAINMOD .. " + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind(MAINMOD .. " + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
