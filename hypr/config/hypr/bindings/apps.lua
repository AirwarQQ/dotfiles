---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "uwsm-app -- alacritty"
local browser = "uwsm-app -- chromium"
local filemanager = "uwsm-app -- nautilus"
local music_app = "uwsm-app -- yandexmusic.desktop"
-- local btop = terminal .. " -e btop"
local messanger = "uwsm-app -- Telegram"
local music = require("apps.music")

-- TODO: set up steam
-- require("apps.steam")

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(MAINMOD .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(MAINMOD .. " + SHIFT + RETURN", hl.dsp.exec_cmd(browser))
hl.bind(MAINMOD .. " + E", hl.dsp.exec_cmd(filemanager))
hl.bind(MAINMOD .. " + M", music.toggle(music_app))
hl.bind(MAINMOD .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(MAINMOD .. " + T", hl.dsp.exec_cmd(messanger))
-- hl.bind(
-- 	MAINMOD .. " + M",
-- 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )
