
---------------------
---- KEYBINDINGS ----
---------------------

hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty tmux"))
closeWindowBind = hl.bind("SUPER + C", hl.dsp.window.close())
closeWindowBind:set_enabled(true)
hl.bind(
	"SUPER + Z",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind("SUPER + E", hl.dsp.exec_cmd(guiFileManager))
hl.bind("SUPER + W", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + V", hl.dsp.exec_cmd("~/bin/nvim-wl-anywhere.sh --keystroke-mode --rm-tmp"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("nautilus ~/Books/'Cheat Sheets'/"))

hl.bind("ALT + Q", hl.dsp.focus({ workspace = 1 }))
hl.bind("ALT + W", hl.dsp.focus({ workspace = 2 }))
hl.bind("ALT + E", hl.dsp.focus({ workspace = 3 }))
hl.bind("ALT + R", hl.dsp.focus({ workspace = 4 }))
hl.bind("ALT + T", hl.dsp.focus({ workspace = 5 }))

hl.bind("ALT + H", hl.dsp.focus({ direction = "left" }))
hl.bind("ALT + L", hl.dsp.focus({ direction = "right" }))
hl.bind("ALT + J", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("ALT + K", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("ALT + A", hl.dsp.focus({ workspace = "empty" }))
hl.bind("ALT + S", hl.dsp.layout("swapcol l")) -- move window to the left
hl.bind("ALT + D", hl.dsp.layout("swapcol r")) -- move window to the right
hl.bind("ALT + F", hl.dsp.window.move({ workspace = "e-1" })) -- move window up to prev workspace
hl.bind("ALT + G", hl.dsp.window.move({ workspace = "e+1" })) -- move window down to next workspace
hl.bind("ALT + C", hl.dsp.window.move({ workspace = "empty" }))
hl.bind("SUPER + period", hl.dsp.layout("colresize -0.1")) -- code:60 binds the less than sign
hl.bind("SUPER + comma", hl.dsp.layout("colresize +0.1")) -- code:60 binds the less than sign
hl.bind("SUPER + slash", hl.dsp.layout("fit active")) -- code:60 binds the less than sign
-- hl.bind("SUPER + question", hl.dsp.layout("colresize 0.5")) -- code:60 binds the less than sign
-- hl.bind("SUPER + comma", hl.dsp.layout("move +col")) -- code:60 binds the greater than sign

hl.bind("SUPER + N", hl.dsp.submap("navigate"))

hl.define_submap("navigate", function()
	hl.bind("h", hl.dsp.focus({ direction = "left" }))
	hl.bind("l", hl.dsp.focus({ direction = "right" }))
	-- hl.bind("j", hl.dsp.focus({ direction = "down" }))
	-- hl.bind("k", hl.dsp.focus({ direction = "up" }))
	hl.bind("j", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind("k", hl.dsp.focus({ workspace = "e-1" }))
    hl.bind("s", hl.dsp.layout("swapcol l"))
    hl.bind("d", hl.dsp.layout("swapcol r"))
	hl.bind("a", hl.dsp.focus({ workspace = "empty" }))
	hl.bind("c", hl.dsp.window.move({ workspace = "empty" }))
	hl.bind("f", hl.dsp.window.move({ workspace = "e+1" }))
	hl.bind("g", hl.dsp.window.move({ workspace = "e-1" }))
	hl.bind("o", hl.dsp.layout("togglesplit"))
	hl.bind("catchall", hl.dsp.focus({ workspace = "e" }))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

