hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float())
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + M", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu .. " -show drun"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd(menu .. " -show window"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(screenShot .. " window"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(screenShot .. " output"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(screenShot .. " region"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(lockBg .. " && hyprlock"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(changBg))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd(walset))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(waybarToggle))
hl.bind(
	mainMod .. " + SHIFT + R",
	hl.dsp.exec_cmd("hyprctl reload && notify-send 'Hyprland reloaded' -i ~/.config/hypr/foreground.png")
)
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd(scripts .. "/gamemode"))

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0 }), { repeating = true })
	hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0 }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10 }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10 }), { repeating = true })

	hl.bind("SHIFT + h", hl.dsp.window.resize({ x = -50, y = 0 }), { repeating = true })
	hl.bind("SHIFT + l", hl.dsp.window.resize({ x = 50, y = 0 }), { repeating = true })
	hl.bind("SHIFT + k", hl.dsp.window.resize({ x = 0, y = -50 }), { repeating = true })
	hl.bind("SHIFT + j", hl.dsp.window.resize({ x = 0, y = 50 }), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("Return", hl.dsp.submap("reset"))
end)

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

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl dispatch dpms on"), { locked = true })
