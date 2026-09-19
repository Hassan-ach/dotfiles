# 🎨 Matugen Engine (`.config/matugen`)

Material You color generation engine that extracts vibrant color palettes from wallpapers and transforms application templates.

---

## 📂 Architecture

- **`config.toml`**: Master configuration file defining template source paths (`input_path`) and application output paths (`output_path`).
- **`templates/`**: Directory containing template source files:
  - `terminal/kitty.conf` $\rightarrow$ `~/.config/kitty/colors.conf`
  - `waybar-colors.css` $\rightarrow$ `~/.config/waybar/colors.css`
  - `rofi.rasi` $\rightarrow$ `~/.config/rofi/colors.rasi`
  - `hypr/hyprland.conf` $\rightarrow$ `~/.config/hypr/colors.lua`
  - `terminal/starship-colors.toml` $\rightarrow$ `~/.config/starship.toml`
  - `terminal/tmux_colors.conf` $\rightarrow$ `~/.tmux_colors.conf`
  - `qtbrowser.py` $\rightarrow$ `~/.config/qutebrowser/themes/palette.py`
  - `terminal/btop.theme` $\rightarrow$ `~/.config/btop/themes/matugen.theme`
  - `terminal/bat.tmTheme` $\rightarrow$ `~/.config/bat/themes/Matugen.tmTheme`
  - `terminal/yazi.toml` $\rightarrow$ `~/.config/yazi/theme.toml`
  - `terminal/herdr-theme.toml` $\rightarrow$ `~/.config/herdr/theme-colors.toml`
  - `kvantum/caelus.kvconfig` $\rightarrow$ `~/.config/Kvantum/caelus/caelus.kvconfig`
  - `kvantum/caelus.svg` $\rightarrow$ `~/.config/Kvantum/caelus/caelus.svg`
  
GTK + Qt folder/file icons follow the same accent: after `matugen` writes `colors.lua`, `walset-backend` calls `papirus-accent` to hue-shift the `Papirus-Dark` folder icons to the wallpaper primary (both GTK — Thunar/Nautilus — and Qt — Telegram/Brave dialogs — point at `Papirus-Dark`, so file managers stay wallpaper-synced in every toolkit).

---

## ⚡ Execution

Run Matugen manually on any wallpaper image:
```bash
matugen image /path/to/wallpaper.jpg
```
Or run `walset-select` (`wals`) to select visually.
