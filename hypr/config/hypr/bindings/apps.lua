---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
TERMINAL = "uwsm-app -- alacritty"
BROWSER = "uwsm-app -- chromium"
FILEMANAGER = "uwsm-app -- nautilus"
MUSIC = "uwsm-app -- yandexmusic.desktop"
require("apps.yandexmusic")
---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(MAINMOD .. " + SHIFT + RETURN", hl.dsp.exec_cmd(BROWSER))
hl.bind(MAINMOD .. " + E", hl.dsp.exec_cmd(FILEMANAGER))
hl.bind(MAINMOD .. " + M", hl.dsp.exec_cmd(MUSIC))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- hl.bind(
-- 	MAINMOD .. " + M",
-- 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )
