# 📜 Executable Scripts Ecosystem (`.local/bin`)

Collection of custom executable Bash and Python utility scripts.

---

## 🛠️ Script Manual

### 1. `walset-select`
- **Description**: Interactive visual wallpaper picker using Rofi.
- **Usage**: `walset-select` or alias `wals`
- **Features**: Displays a 4-column Rofi grid with large image thumbnails of all wallpapers in `~/wall`. Selecting an image updates `/tmp/random_bg` and calls `walset-backend`.

### 2. `walset`
- **Description**: Random wallpaper selector.
- **Usage**: `walset` or `walset /path/to/image.jpg`
- **Features**: Picks a random wallpaper from `~/wall` and triggers `walset-backend`.

### 3. `walset-backend`
- **Description**: Core Matugen & Pywal theme reloader engine.
- **Usage**: `walset-backend <image_path>`
- **Workflow**:
  1. Calls `awww img` to update wallpaper background.
  2. Runs `wal` and `matugen image` to generate dynamic colors.
  3. Triggers `chadwal.py` to compile Neovim base46 highlights.
  4. Reloads Waybar, SwayNC, and Tmux status lines.

### 4. `tmux-dev-session`
- **Description**: Intelligent project dev session launcher.
- **Usage**: `tmux-dev-session [dir_path]`
- **Features**: Detects project types (Laravel, Node.js, Generic) and creates tailored multi-window Tmux development environments.

### 5. `tmux-sessionizer`
- **Description**: FZF-based quick Tmux session switcher.
- **Usage**: `tmux-sessionizer [dir_path]` or `CTRL+b f` in Tmux.

### 6. `waybarToggle.sh`
- **Description**: Toggles Waybar process execution.
- **Usage**: `waybarToggle.sh` or `SUPER + SHIFT + T` in Hyprland.

### 7. `herdr-merge-theme`
- **Description**: Merges Matugen colors into Herdr configuration.
- **Usage**: Automatically triggered by `walset-backend`.
