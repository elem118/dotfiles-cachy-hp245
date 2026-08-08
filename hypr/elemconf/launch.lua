
-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hyprctl eval 'hl.device({name = 'elan0708:00-04f3:31bf-touchpad', enabled = false})'")
end)

