hl.window_rule({
	name = "idle-inhibit-focus",
	match = { class = "^(celluloid|mpv|vlc|[Ss]potify)$" },
	idle_inhibit = "focus",
})

hl.window_rule({
	name = "idle-inhibit-fullscreen",
	match = { class = "^(LibreWolf|floorp|Brave|firefox|chromium|zen|vivaldi)$" },
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	name = "tearing-games",
	match = { title = ".*\\.exe" },
	immediate = true,
})

hl.window_rule({
	name = "tearing-minecraft",
	match = { title = ".*minecraft.*" },
	immediate = true,
})

hl.window_rule({
	name = "tearing-steam",
	match = { class = "^(steam_app)$" },
	immediate = true,
})

hl.window_rule({
	name = "no-shadow-tiled",
	match = { float = false },
	no_shadow = true,
})

hl.window_rule({
	name = "center-floating-xwayland",
	match = { float = true, xwayland = false },
	center = true,
})

hl.window_rule({
	name = "opaque-apps",
	match = { class = "^(foot|equibop|imv|swappy|brave-browser|mpv|vlc|celluloid)$" },
	opaque = true,
})

hl.window_rule({
	name = "no-focus-empty-xwayland",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "Picture-in-Picture",
	match = { title = "^([Pp]icture[ -]?[Ii]n[ -]?[Pp]icture)(.*)$" },
	float = true,
	keep_aspect_ratio = true,
	move = "73 72",
	size = "monitor_w*0.25 monitor_h*0.25",
	pin = true,
})

local dialog_large_title =
	"^(Open File|Select a File|Choose wallpaper|Open Folder|Save As|Library|File Upload|.*Save File.*|.*Save Folder.*|.*Save Image.*|.*Open As.*|.*Open Network Stream.*|.*Choose Files.*|.*Downloads -.*|File Operation Progress|Downloads.*|Choose Directory|Where do you want to save the.*)$"

hl.window_rule({
	name = "file-dialog-large",
	match = { title = dialog_large_title },
	float = true,
	center = true,
	size = "monitor_w*0.55 monitor_h*0.55",
})

local dialog_small_title =
	"^(.*File Already Exists.*|.*Confirm to replace files.*|.*Confirm to delete files.*|Rename.*|Delete.*|Move to Trash.*|.*Confirmation.*|.*Warning.*|.*Error.*)$"

hl.window_rule({
	name = "file-dialog-small",
	match = { title = dialog_small_title },
	float = true,
	center = true,
	size = "monitor_w*0.20 monitor_h*0.15",
})

hl.window_rule({
	name = "Gnome Apps",
	match = { class = "^(org.gnome.*)$" },
	float = true,
	size = "monitor_w*0.70 monitor_h*0.70",
	center = true,
})

hl.window_rule({
	name = "Volume Control",
	match = { class = "^(center-float-large|qimgv|nvidia-settings|localsend|org.gnome.Evince)$" },
	float = true,
	size = "monitor_w*0.70 monitor_h*0.70",
	center = true,
})

hl.window_rule({
	name = "Medium Floating Windows",
	match = { class = "^(center-float|xdg-desktop-portal-gtk|selectdefaultapplication)$" },
	float = true,
	size = "monitor_w*0.50 monitor_h*0.50",
	center = true,
})

hl.window_rule({
	name = "Small Floating Windows",
	match = { class = "^(center-float-mini|galculator|ytdlp-gui|udiskie|org.gnome.Calculator)$" },
	float = true,
	size = "monitor_w*0.30 monitor_h*0.40",
	center = true,
})

hl.window_rule({
	name = "VLC-float",
	match = { class = "^(vlc)$" },
	float = true,
})

hl.window_rule({
	name = "VLC-dialogs",
	match = {
		class = "^(vlc)$",
		title = "^(Select one or more files to open|Simple Preferences|Adjustments and Effects|Current Media Information|Open URL|Open Media|Save playlist as\\.\\.\\.|Open Directory) — VLC media player$",
	},
	size = "monitor_w*0.50 monitor_h*0.50",
})

hl.window_rule({
	name = "VLC-player",
	match = { class = "^(vlc)$", title = "^(.*VLC media player)$" },
	size = "monitor_w*0.70 monitor_h*0.70",
})

hl.window_rule({
	name = "Media Players",
	match = { class = "^(mpv|celluloid|com.github.rafostar.Clapper)$" },
	float = true,
	size = "monitor_w*0.70 monitor_h*0.70",
	center = true,
})

hl.window_rule({
	name = "YouTube-opacity",
	match = { title = ".*(YouTube).*" },
	opacity = "1.0 override",
})

hl.window_rule({
	name = "Polkit Agents",
	match = { class = "^(polkit-gnome-authentication-agent-1|polkit-kde-authentication-agent-1|hyprpolkitagent)$" },
	float = true,
	pin = true,
	stay_focused = true,
})

hl.window_rule({
	name = "no-screenshare-sensitive",
	match = { class = "^(discord|vesktop|org.telegram.desktop|Signal|WhatsApp|Bitwarden)$" },
	no_screen_share = true,
})

hl.window_rule({
	name = "Bitwarden",
	match = { class = "^(Bitwarden)$" },
	float = true,
	size = "monitor_w*0.60 monitor_h*0.60",
	center = true,
	no_screen_share = true,
})

hl.window_rule({
	name = "Audio Managers",
	match = { class = "^(pavucontrol|blueman-manager|pwvucontrol)$" },
	float = true,
	center = true,
	size = "monitor_w*0.40 monitor_h*0.40",
})

hl.window_rule({
	name = "Nautilus Initial Load",
	match = { class = "^(org.gnome.Nautilus)$", initial_title = "^(Loading…|Home)$" },
	float = true,
	size = "monitor_w*0.80 monitor_h*0.80",
	center = true,
})

hl.window_rule({
	name = "XWayland Video Bridge",
	match = { class = "^(xwaylandvideobridge)$" },
	opacity = "0.0 0.0",
	no_anim = true,
	no_blur = true,
	no_initial_focus = true,
	max_size = "1 1",
})

hl.window_rule({
	name = "Clipse GUI",
	match = { class = "^(clipse-gui)$" },
	float = true,
	size = "monitor_w*0.35 monitor_h*0.45",
	center = true,
	stay_focused = true,
})

hl.layer_rule({ match = { namespace = "rofi" }, animation = "popin" })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, ignore_alpha = 0.57 })
hl.layer_rule({ match = { namespace = "quickshell.*" }, blur = true })
hl.layer_rule({ match = { namespace = "quickshell.*" }, ignore_alpha = 0.65 })
hl.layer_rule({ match = { namespace = "quickshell.*" }, blur_popups = true })

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({
	name = "no-gaps-terminal-border",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 2,
})

hl.window_rule({
	name = "DaVinci Resolve",
	match = { class = "^(resolve)$" },
	float = true,
	size = "monitor_w*0.85 monitor_h*0.85",
	center = true,
})

hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "6", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "7", monitor = "eDP-1" })

hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = "0", monitor = "HDMI-A-2" })
