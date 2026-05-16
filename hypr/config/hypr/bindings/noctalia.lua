-- noctalia-shell calls
local ipc = "qs -c noctalia-shell ipc call "
local launcher = ipc .. "launcher toggle"
local lockscreen = ipc .. "lockScreen lock"
local session_menu = ipc .. "sessionMenu toggle"
local bar_toogle = ipc .. "bar toggle"
local notification_hist = ipc .. "notifications toggleHistory"

hl.bind(MAINMOD .. " + SPACE", hl.dsp.exec_cmd(launcher))
hl.bind(MAINMOD .. " + SHIFT + L", hl.dsp.exec_cmd(lockscreen))
hl.bind(MAINMOD .. " + ESCAPE", hl.dsp.exec_cmd(session_menu))
hl.bind(MAINMOD .. " + N", hl.dsp.exec_cmd(notification_hist))
hl.bind(MAINMOD .. " + SHIFT + SPACE", hl.dsp.exec_cmd(bar_toogle))
