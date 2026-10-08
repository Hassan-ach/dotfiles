# 🎨 Matugen Engine (`.config/matugen`)

Material You color generation engine that extracts vibrant color palettes from wallpapers and transforms application templates.

---

## 📂 Architecture

- **`config.toml`**: Master configuration file defining template source paths (`input_path`) and application output paths (`output_path`), plus `[config.custom_colors.*]` blendable accent colors (warning/info/success and red/green/yellow/blue/magenta/cyan/white).
- **`templates/`**: Directory containing template source files.

### Enabled Templates (from `config.toml`)

| Template | Output |
| :--- | :--- |
| `terminal/kitty.conf` | `~/.config/kitty/colors.conf` |
| `hypr/hyprland.conf` | `~/.config/hypr/colors.lua` |
| `waybar-colors.css` | `~/.config/waybar/colors.css` |
| `terminal/tmux_colors.conf` | `~/.tmux_colors.conf` |
| `qtbrowser.py` | `~/.config/qutebrowser/themes/palette.py` |
| `terminal/starship-colors.toml` | `~/.config/starship.toml` |
| `terminal/btop.theme` | `~/.config/btop/themes/matugen.theme` |
| `terminal/bat.tmTheme` | `~/.config/bat/themes/Matugen.tmTheme` |
| `terminal/yazi.toml` | `~/.config/yazi/theme.toml` |
| `rofi.rasi` | `~/.config/rofi/colors.rasi` |
| `qtct.conf` | `~/.local/share/color-schemes/Matugen.colors` (Qt5ct/Qt6ct dialogs) |
| `gtk/colors.css` | `~/.config/gtk-3.0/gtk.css` **and** `~/.config/gtk-4.0/gtk.css` |
| `terminal/nvchad.lua` | base46 theme `~/.local/share/nvim/lazy/base46/lua/base46/themes/matugen.lua` |
| `discord.css` / `discord2.css` | `~/.config/vesktop/themes/Matugen.css` / `Matugen2.css` |
| `terminal/cava.config` | `~/.config/cava/config` |
| `terminal/herdr-theme.toml` | `~/.config/herdr/theme-colors.toml` |
| `dgop.json` | `~/.config/dgop/colors.json` |
| `kvantum/caelus.kvconfig` | `~/.config/Kvantum/caelus/caelus.kvconfig` |
| `kvantum/caelus.svg` | `~/.config/Kvantum/caelus/caelus.svg` |
| `~/.config/nvim/pywal/templates/matugen.lua` | `~/.cache/wal/base46-dark.lua` **and** `~/.cache/wal/base46-light.lua` |
| `~/.config/nvim/pywal/templates/waltemplate` | `~/.cache/wal/colors` |

> Additional templates exist on disk but are **commented out / disabled** in `config.toml`: `dank.json`, `folder-color.txt`, `spotify.ini`, `colors.fish`, `fzf*`, `ls_color.zsh`, `zsh_color.zsh`, `colors.json`, `terminal_colors`, `hyprlock-icon`.

GTK + Qt folder/file icons follow the same accent: after `matugen` writes `colors.lua`, `wallset` calls `papirus-accent` to hue-shift the `Papirus-Dark` folder icons to the wallpaper primary (both GTK — Thunar/Nautilus — and Qt — Telegram/Brave dialogs — point at `Papirus-Dark`, so file managers stay wallpaper-synced in every toolkit).

---

## ⚡ Execution

Run Matugen manually on any wallpaper image:
```bash
matugen image /path/to/wallpaper.jpg
```
Or run `wallset` (`wals`) to pick visually — it applies the wallpaper and regenerates every template above in one step.
