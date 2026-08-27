# 🌀 Hyprland Configuration (`.config/hypr`)

High-performance, dynamic tiling Wayland compositor configuration written in modular Lua.

---

## 📂 File Architecture

- **`hyprland.lua`**: Main entry point that sets core variables (`terminal`, `browser`, `menu`, `mainMod`) and imports all modular `.lua` files.
- **`keybinds.lua`**: Complete keybindings reference for applications, window management, workspaces, and submap modes.
- **`colors.lua`**: Dynamic color palette generated automatically by Matugen template (`templates/hypr/hyprland.conf`).
- **`rules.lua`**: Window rules, floating rules, opacity, and workspace assignment rules.
- **`variables.lua`**: General decorations, active/inactive borders, gaps, drop shadows, and blur effects.
- **`inputs.lua`**: Keyboard layouts (`us`), mouse sensitivity, caps-lock to Ctrl remapping, and touchpad gestures.
- **`monitors.lua`**: Display monitor resolutions, refresh rates, scaling, and positioning.
- **`startup.lua`**: Autostart daemons (`waybar`, `swaync`, `hypridle`).
- **`animations.lua`**: Window animations, bezier curves, and workspace transitions.
- **`gestures.lua`**: Touchpad gesture configuration.
- **`env.lua`**: Wayland environment variables (`MOZ_ENABLE_WAYLAND`, `QT_QPA_PLATFORM`, `GDK_BACKEND`).
- **`hyprlock.conf`**: Screen locker interface config.
- **`hypridle.conf`**: Idle listener daemon (dim screen, lock after timeout, suspend).

---

## ⌨️ Full Keybindings Reference (Main Modifier Key: `SUPER`)

### Applications & System Launchers
| Keybinding | Action / Command |
| :--- | :--- |
| `SUPER + RETURN` | Launch Terminal (`kitty`) |
| `SUPER + B` | Launch Web Browser (`brave`) |
| `SUPER + V` | Launch Discord / Vesktop (`vesktop`) |
| `SUPER + D` | Open Application Launcher (`rofi -show drun`) |
| `SUPER + TAB` | Open Window Switcher (`rofi -show window`) |
| `SUPER + Q` | Close Active Window |
| `SUPER + SHIFT + E` | Exit Hyprland Session |
| `SUPER + SHIFT + R` | Reload Hyprland Configuration & Notify |
| `SUPER + SHIFT + G` | Toggle Gamemode (Disables animations & blur) |

### Wallpaper & Interface Controls
| Keybinding | Action / Command |
| :--- | :--- |
| `SUPER + X` | Apply Random Wallpaper (`random-bg.sh`) |
| `SUPER + SHIFT + X` | Pick Random Wallpaper & Apply Matugen Theme (`walset`) |
| `SUPER + C` | Lock Screen (`hyprlock`) |
| `SUPER + SHIFT + T` | Toggle Waybar Visibility (`waybarToggle.sh`) |

### Screenshots (Hyprshot)
| Keybinding | Action / Command |
| :--- | :--- |
| `SUPER + W` | Capture Active Window (`hyprshot -m window`) |
| `SUPER + A` | Capture Full Screen Output (`hyprshot -m output`) |
| `SUPER + SHIFT + A` | Capture Selected Region (`hyprshot -m region`) |

### Window Layout & Navigation
| Keybinding | Action / Command |
| :--- | :--- |
| `SUPER + h` | Move Focus Left |
| `SUPER + j` | Move Focus Down |
| `SUPER + k` | Move Focus Up |
| `SUPER + l` | Move Focus Right |
| `SUPER + SHIFT + h` | Move Window Left |
| `SUPER + SHIFT + j` | Move Window Down |
| `SUPER + SHIFT + k` | Move Window Up |
| `SUPER + SHIFT + l` | Move Window Right |
| `SUPER + F` | Toggle Fullscreen Mode |
| `SUPER + SHIFT + F` | Toggle Floating Window State |
| `SUPER + P` | Toggle Pseudo Tiling Mode |
| `SUPER + M` | Toggle Split Layout Direction |

### Workspaces
| Keybinding | Action / Command |
| :--- | :--- |
| `SUPER + [1-9, 0]` | Switch to Workspace 1–10 |
| `SUPER + SHIFT + [1-9, 0]` | Move Active Window to Workspace 1–10 |
| `SUPER + S` | Toggle Special Scratchpad Workspace ("magic") |
| `SUPER + SHIFT + S` | Move Active Window to Special Scratchpad |
| `SUPER + Mouse Scroll Up` | Switch to Next Workspace (`e+1`) |
| `SUPER + Mouse Scroll Down` | Switch to Previous Workspace (`e-1`) |
| `SUPER + Left Mouse Click` | Drag & Move Window |
| `SUPER + Right Mouse Click` | Resize Window |

### Window Resize Submap (`SUPER + R`)
Press `SUPER + R` to enter Resize Submap Mode:
- `h` / `l` / `k` / `j`: Small Resize (-10px / +10px)
- `SHIFT + h` / `SHIFT + l` / `SHIFT + k` / `SHIFT + j`: Large Resize (-50px / +50px)
- `ESC` or `ENTER`: Exit Resize Mode

### Hardware & Media Keys
| Keybinding | Action / Command |
| :--- | :--- |
| `XF86AudioRaiseVolume` | Increase Volume 5% (`wpctl set-volume`) |
| `XF86AudioLowerVolume` | Decrease Volume 5% (`wpctl set-volume`) |
| `XF86AudioMute` | Toggle Audio Mute |
| `XF86AudioMicMute` | Toggle Microphone Mute |
| `XF86MonBrightnessUp` | Increase Screen Brightness 5% (`brightnessctl`) |
| `XF86MonBrightnessDown` | Decrease Screen Brightness 5% (`brightnessctl`) |
| `XF86AudioPlay` / `Pause` | Toggle Play/Pause (`playerctl`) |
| `XF86AudioNext` | Next Track (`playerctl`) |
| `XF86AudioPrev` | Previous Track (`playerctl`) |

---

## 🛠️ How to Edit & Customize

1. **Keybindings**: Edit `~/.config/hypr/keybinds.lua`.
2. **Window Rules & Floating Apps**: Edit `~/.config/hypr/rules.lua`.
3. **Animations & Bezier Curves**: Edit `~/.config/hypr/animations.lua`.
4. **Borders & Shadows**: Edit `~/.config/hypr/variables.lua`.
5. **Autostart Apps**: Edit `~/.config/hypr/startup.lua`.
6. Reload after editing with `SUPER + SHIFT + R`.
