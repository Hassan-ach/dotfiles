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

---

## ⚡ Execution

Run Matugen manually on any wallpaper image:
```bash
matugen image /path/to/wallpaper.jpg
```
Or run `walset-select` (`wals`) to select visually.
