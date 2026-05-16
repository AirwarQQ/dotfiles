---- MY PROGRAMS ----
---------------------

-- noctalia-shell calls
IPC = "qs -c noctalia-shell ipc call "
LAUNCHER = IPC .. "launcher toggle"
LOCKSCREEN = IPC .. "lockScreen lock"
SESSION_MENU = IPC .. "sessionMenu toggle"

-- Set programs that you use
TERMINAL = "uwsm-app -- alacritty"
BROWSER = "uwsm-app -- chromium"
FILEMANAGER = "uwsm-app -- nautilus"
MUSIC = "uwsm-app -- yandexmusic.desktop"
require("apps.yandexmusic")
---------------------
---- KEYBINDINGS ----
---------------------

MAINMOD = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(MAINMOD .. " + RETURN", hl.dsp.exec_cmd(TERMINAL))
hl.bind(MAINMOD .. " + SPACE", hl.dsp.exec_cmd(LAUNCHER))
hl.bind(MAINMOD .. " + SHIFT + L", hl.dsp.exec_cmd(LOCKSCREEN))
hl.bind(MAINMOD .. " + SHIFT + ESCAPE", hl.dsp.exec_cmd(SESSION_MENU))

hl.bind(MAINMOD .. " + SHIFT + RETURN", hl.dsp.exec_cmd(BROWSER))
hl.bind(MAINMOD .. " + E", hl.dsp.exec_cmd(FILEMANAGER))
hl.bind(MAINMOD .. " + M", hl.dsp.exec_cmd(MUSIC))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- hl.bind(
-- 	MAINMOD .. " + M",
-- 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )
