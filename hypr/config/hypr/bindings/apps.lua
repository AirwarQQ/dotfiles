require("apps.steam")
require("apps.webapp_install")
require("apps.steam")
local music = require("apps.music")
local launch_or_focus = require("apps.launch_or_focus")
MAINMOD = "SUPER" -- Sets "Windows" key as main modifier
---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "uwsm-app -- alacritty"
local tterminal = terminal .. " -e tmux new-session -A -s Work"
local webapp_install = terminal .. " --class=webapp-install -e webapp_install "
local browser = "uwsm-app -- chromium"
local browser_privat = "uwsm-app -- chromium --incognito"
local filemanager = "uwsm-app -- nautilus"
local music_app = "uwsm-app -- yandexmusic.desktop"
local discord = "uwsm-app -- vesktop"
local obsidian = "uwsm-app -- obsidian"
local music_tui = terminal .. " -e cliamp"
-- local btop = terminal .. " -e btop"
local messanger = "uwsm-app -- Telegram"
local youtube = { cmd = "uwsm-app -- YouTube.desktop", class = "chrome-youtube.com__-Default" }
local claude = { cmd = "uwsm-app -- Claude.desktop", class = "chrome-claude.ai__-Default" }

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(MAINMOD .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(MAINMOD .. " + ALT + RETURN", hl.dsp.exec_cmd(tterminal))
hl.bind(MAINMOD .. " + SHIFT + I", hl.dsp.exec_cmd(webapp_install))

hl.bind(MAINMOD .. " + SHIFT + RETURN", hl.dsp.exec_cmd(browser))
hl.bind(MAINMOD .. " + SHIFT + B", hl.dsp.exec_cmd(browser_privat))
hl.bind(MAINMOD .. " + E", hl.dsp.exec_cmd(filemanager))
hl.bind(MAINMOD .. " + M", music.toggle(music_app))
hl.bind(MAINMOD .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(MAINMOD .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(MAINMOD .. " + T", hl.dsp.exec_cmd(messanger))
hl.bind(MAINMOD .. " + ALT + M", hl.dsp.exec_cmd(music_tui))
hl.bind(
	MAINMOD .. " + SHIFT + O",
	launch_or_focus.app({
		class = "obsidian",
		cmd = obsidian,
	})
)

-- web apps
hl.bind(
	MAINMOD .. " + SHIFT + Y",
	launch_or_focus.app({
		class = youtube.class,
		cmd = youtube.cmd,
	})
)
hl.bind(
	MAINMOD .. " + SHIFT + A",
	launch_or_focus.app({
		class = claude.class,
		cmd = claude.cmd,
	})
)
-- hl.bind(
-- 	MAINMOD .. " + M",
-- 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )

-- debug
--
local debughandler = {}

function debughandler.toggle()
	local current = hl.get_config("debug.overlay")
	hl.config({
		debug = {
			overlay = not current,
		},
	})
end
hl.bind(MAINMOD .. " + F12", debughandler.toggle)

--
-- # Overwrite existing bindings, like putting Omarchy Menu on Super + Space
-- # unbind = SUPER, SPACE
-- # bindd = SUPER, SPACE, Omarchy menu, exec, omarchy-menu
--
-- # Logitech MX Keys
-- # bind = SUPER SHIFT, S, exec, omarchy-capture-screenshot      # Print Screen Button
-- # bind = SUPER, H, exec, voxtype record toggle                 # Dictation Button
-- # bind = SUPER, PERIOD, exec, omarchy-launch-walker -m symbols # Emoji Button

-- bindd = SUPER CTRL, COMMA, Toggle silencing notifications, exec, omarchy-toggle-notification-silencing
-- bindd = SUPER ALT, COMMA, Invoke last notification, exec, makoctl invoke
-- bindd = SUPER SHIFT ALT, COMMA, Restore last notification, exec, makoctl restore
--
-- # Toggles
-- bindd = SUPER CTRL, I, Toggle locking on idle, exec, omarchy-toggle-idle
-- bindd = SUPER CTRL, N, Toggle nightlight, exec, omarchy-toggle-nightlight
-- bindd = SUPER CTRL, Delete, Toggle laptop display, exec, omarchy-hyprland-monitor-internal toggle
-- bindd = SUPER CTRL ALT, Delete, Toggle laptop display mirroring, exec, omarchy-hyprland-monitor-internal-mirror toggle
-- bindl = , switch:on:Lid Switch, exec, omarchy-hw-external-monitors && omarchy-hyprland-monitor-internal off
-- bindl = , switch:off:Lid Switch, exec, omarchy-hyprland-monitor-internal on
--
-- # Captures
-- bindd = , PRINT, Screenshot, exec, omarchy-capture-screenshot
-- bindd = ALT, PRINT, Screenrecording, exec, omarchy-menu screenrecord
-- bindd = SUPER, PRINT, Color picker, exec, pkill hyprpicker || hyprpicker -a
-- bindd = SUPER CTRL, PRINT, Extract text (OCR) from screenshot, exec, omarchy-capture-text-extraction
--
-- # File sharing
-- bindd = SUPER CTRL, S, Share, exec, omarchy-menu share
--
-- # Transcoding
-- bindd = SUPER CTRL, PERIOD, Transcode, exec, omarchy-transcode
--
-- # Reminders
-- bindd = SUPER CTRL, R, Set reminder, exec, omarchy-menu reminder-set
-- bindd = SUPER CTRL ALT, R, Show reminders, exec, omarchy-reminder show
-- bindd = SUPER SHIFT CTRL, R, Clear reminders, exec, omarchy-reminder clear
--
-- # Waybar-less information
-- bindd = SUPER CTRL ALT, T, Show time, exec, notify-send -u low "    $(date +"%A %H:%M  ·  %d %B %Y  ·  Week %V")"
-- bindd = SUPER CTRL ALT, B, Show battery remaining, exec, notify-send -u low "$(omarchy-battery-status)"
-- bindd = SUPER CTRL ALT, W, Show weather, exec, notify-send -u low "$(omarchy-weather-status)"
--
-- # Control panels
-- bindd = SUPER CTRL, A, Audio controls, exec, omarchy-launch-audio
-- bindd = SUPER CTRL, B, Bluetooth controls, exec, omarchy-launch-bluetooth
-- bindd = SUPER CTRL, W, Wifi controls, exec, omarchy-launch-wifi
-- bindd = SUPER CTRL, T, Activity, exec, omarchy-launch-tui btop
--
-- # Dictation
-- bindd = SUPER CTRL, X, Toggle dictation, exec, voxtype record toggle
--
-- bindd  = , F9, Start dictation (push-to-talk), exec, voxtype record start
-- binddr = , F9, Stop dictation (push-to-talk),  exec, voxtype record stop
--
-- # Zoom
-- bindd = SUPER CTRL, Z, Zoom in, exec, hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float + 1')
-- bindd = SUPER CTRL ALT, Z, Reset zoom, exec, hyprctl keyword cursor:zoom_factor 1
--
-- # Lock system
-- bindd = SUPER CTRL, L, Lock system, exec, omarchy-system-lock
