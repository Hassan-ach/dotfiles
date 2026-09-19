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
- **Usage**: `walset` or `walset /path/to/image.jpg` or alias `walr`
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

### 8. `resolve-fix`
- **Description**: Environment launcher wrapper for DaVinci Resolve on Wayland/Arch Linux.
- **Usage**: `resolve-fix`
- **Features**: Sets OpenCL ICD vendor paths, NVIDIA Prime render offload variables, and preload libraries for smooth DaVinci Resolve execution.

### 9. `resolve_backup.sh`
- **Description**: Automated DaVinci Resolve database backup utility.
- **Usage**: `resolve_backup.sh`
- **Features**: Backs up PostgreSQL / SQLite Resolve project databases to specified backup paths.

### 10. `resolve_convert.sh`
- **Description**: Media transcoder for DaVinci Resolve Linux compatibility.
- **Usage**: `resolve_convert.sh <input_media>`
- **Features**: Converts video formats (e.g., MP4/AAC) into PCM audio and ProRes/DNxHR video streams for native Linux Resolve importing.

### 11. `prayertime`
- **Description**: Islamic prayer time tracker with desktop notifications.
- **Usage**: `prayertime`
- **Features**: Fetches prayer calculation timings, displays upcoming prayer schedules, and sends notifications.

### 12. `ytdlp-single`
- **Description**: High-quality single video downloader powered by `yt-dlp`.
- **Usage**: `ytdlp-single <video_url>`
- **Features**: Downloads videos up to 4K resolution to `~/Downloads/Videos`, embedding subtitles, metadata, and thumbnails with progress notifications.

### 13. `ytdlp-playlist`
- **Description**: Batch playlist downloader powered by `yt-dlp`.
- **Usage**: `ytdlp-playlist <playlist_url>`
- **Features**: Batch downloads full playlists with structured directory organization and metadata preservation.

### 14. `random-lock-bg.sh`
- **Description**: Random Hyprlock lockscreen background updater.
- **Usage**: `random-lock-bg.sh`
- **Features**: Selects a random wallpaper from `~/wall` and symlinks it to `/tmp/random_lock_bg`.

### 15. `remove-bg.sh`
- **Description**: Deletes current wallpaper and picks a new background.
- **Usage**: `remove-bg.sh`
- **Features**: Removes the active wallpaper image from `~/wall` and immediately triggers background reloading.

### 16. `start_database`
- **Description**: Secure MariaDB database service starter.
- **Usage**: `start_database`
- **Features**: Starts MariaDB systemd service with error checking and status feedback.

### 17. `hyprconf2lua`
- **Description**: Helper tool converting legacy Hyprland configuration files to Lua format.
- **Usage**: `hyprconf2lua [file]`

### 18. `graphify` & `graphify-mcp`
- **Description**: Knowledge graph creation and MCP server launcher wrappers.
- **Usage**: `graphify` / `graphify-mcp`

### 19. `poetry` & `colorz` / `wal`
- **Description**: Environment and color generation wrapper shortcuts.

### 20. `papirus-accent`
- **Description**: Recolors the Papirus-Dark folder icons to match the current matugen wallpaper accent.
- **Usage**: `papirus-accent` (auto-invoked by `walset-backend` after `herdr-merge-theme`)
- **Features**: Reads the primary accent (`rgba(rrggbbff)`) from the matugen-generated `~/.config/hypr/colors.lua`, then hue-shifts only the colored folder bodies across all icon sizes (16→96px including `@2x` HiDPI copies) to the wallpaper accent — grays, whites, and near-black fills are preserved so shading/depth stays intact. Keeps GTK (Thunar, Nautilus) and Qt (Telegram, Brave dialogs, OBS) file managers synced to the wallpaper since both point at the same `Papirus-Dark` theme. Prints the recolored icon count and the hex accent used.

