-- ESSENTIALS
hl.bind(MAINMOD .. " + W", hl.dsp.window.close())
-- win w doesnt close app
-- hl.bind(MAINMOD .. " + W", function()
-- 	local active = hl.get_active_window()
-- 	if active ~= nil and active.class == "YandexMusic" then
-- 		hl.dispatch(hl.dsp.window.move({ workspace = "special:music", silent = true }))
-- 	else
-- 		hl.dispatch(hl.dsp.window.close())
-- 	end
-- end)

hl.bind(MAINMOD .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MAINMOD .. " + P", hl.dsp.window.pseudo())
hl.bind(MAINMOD .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(MAINMOD .. " + U", hl.dsp.focus({ urgent_or_last = true }))

-- gaming
hl.bind(MAINMOD .. " + G", hl.dsp.focus({ workspace = "name:game" }))
hl.bind(MAINMOD .. " + SHIFT + G", hl.dsp.window.move({ workspace = "name:game", follow = false }))
-- hidden place
hl.bind(MAINMOD .. " + H", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MAINMOD .. " + SHIFT + H", hl.dsp.window.move({ workspace = "special:magic", follow = false }))

-- win + s scratchpad
-- hl.bind(MAINMOD .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
-- hl.bind(MAINMOD .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Move focus with MAINMOD + arrow keys
hl.bind(MAINMOD .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MAINMOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MAINMOD .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MAINMOD .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move window with MAINMOD + SHIFT arrow keys
hl.bind(MAINMOD .. " + SHIFT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind(MAINMOD .. " + SHIFT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind(MAINMOD .. " + SHIFT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind(MAINMOD .. " + SHIFT + down", hl.dsp.window.swap({ direction = "d" }))

-- Move window to monitor with MAINMOD + SHIFT + CTRL arrow keys
hl.bind(MAINMOD .. " + SHIFT + CTRL + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind(MAINMOD .. " + SHIFT + CTRL + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(MAINMOD .. " + SHIFT + CTRL + up", hl.dsp.window.move({ monitor = "u" }))
hl.bind(MAINMOD .. " + SHIFT + CTRL + down", hl.dsp.window.move({ monitor = "d" }))

-- Fullscreen
hl.bind(MAINMOD .. " + F11", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("ALT + F11", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("CTRL + F11", hl.dsp.window.fullscreen_state({ internal = 2, client = 2 }))
-- hl.bind(MAINMOD .. " + ALT + SHIFT + F11", hl.dsp.focus({ urgent_or_last = true }))

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
-- hl.bind(MAINMOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(MAINMOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
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

-- To switch between monitors:
hl.bind("CTRL + ALT + Tab", hl.dsp.focus({ monitor = "e+1" }))
hl.bind("CTRL + ALT + SHIFT + Tab", hl.dsp.focus({ monitor = "e-1" }))

-- Resize active window
hl.bind(
	MAINMOD .. "          + code:20",
	hl.dsp.window.resize({ x = -100, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	MAINMOD .. "          + code:21",
	hl.dsp.window.resize({ x = 100, y = 0, relative = true }),
	{ repeating = true }
)
hl.bind(
	MAINMOD .. " + SHIFT + code:20",
	hl.dsp.window.resize({ x = 0, y = -100, relative = true }),
	{ repeating = true }
)
hl.bind(
	MAINMOD .. " + SHIFT + code:21",
	hl.dsp.window.resize({ x = 0, y = 100, relative = true }),
	{ repeating = true }
)
