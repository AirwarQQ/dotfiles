-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function()
	-- hl.exec_cmd(terminal)
	--
	-- TODO: fix layout break during hyprland load
	-- hl.exec_cmd("sleep2 && hyprctl reload")

	-- hl.exec_cmd("sleep 4 && qs -c noctalia-shell")
	hl.exec_cmd("qs -c noctalia-shell")
	hl.exec_cmd("uwsm-app -- Telegram -startintray")
	hl.exec_cmd("uwsm-app -- steam -silent")
	hl.exec_cmd("uwsp-app -- vesktop -m")
	-- hl.exec_cmd("waybar & hyprpaper & firefox")
	-- hl.exec_cmd("chromium")
end)
