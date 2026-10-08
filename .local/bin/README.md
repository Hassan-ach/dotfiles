# 📜 Executable Scripts Ecosystem (`.local/bin`)

Collection of custom executable Bash and Python utility scripts.

---

## 🛠️ Script Manual

### 1. `wallset`
- **Description**: Unified wallpaper & theme manager (interactive picker or random) — the single entry point for the whole wallpaper pipeline.
- **Usage**: `wallset` (Rofi picker) | `wallset -r` / `wallset --random` (random) | `wallset /path/to/image.jpg` | aliases `wals` (picker) / `walr` (random)
- **Features**: No-arg mode shows a 4-column Rofi grid with large image thumbnails of all wallpapers in `~/wall`. Whichever mode resolves an image, it then:
  1. Symlinks the selection to `/tmp/random_bg`.
  2. Sets the wallpaper via `awww img`.
  3. Runs `matugen image` to regenerate the dynamic color scheme (pywal/`wal` is disabled here — matugen is the primary theme engine).
  4. Restarts Waybar and SwayNC, reloads `~/.tmux.conf` status lines.
  5. Runs `herdr-merge-theme` and `papirus-accent`, then sends a notification.

### 2. `tmux-dev-session`
- **Description**: Intelligent project dev session launcher.
- **Usage**: `tmux-dev-session [dir_path]`
- **Features**: Detects project types (Laravel, Node.js, Generic) and creates tailored multi-window Tmux development environments.

### 3. `tmux-sessionizer`
- **Description**: FZF-based quick Tmux session switcher.
- **Usage**: `tmux-sessionizer [dir_path]` or `CTRL+b f` in Tmux.

### 4. `power-menu`
- **Description**: Rofi-based power menu (Lock / Logout / Suspend / Reboot / Shutdown) with Nerd Font icons.
- **Usage**: `power-menu` or `SUPER + SHIFT + Q` in Hyprland.

### 5. `clipboard-menu`
- **Description**: Clipboard history manager (cliphist + Rofi).
- **Usage**: `clipboard-menu` or `SUPER + SHIFT + V` in Hyprland; supports `--clear` to wipe history. Auto-starts the `wl-paste`/cliphist watchers if missing.

### 6. `wifi-menu`
- **Description**: WiFi manager (nmcli + Rofi) with Nerd Font signal/lock icons.
- **Usage**: `wifi-menu` or `SUPER + SHIFT + W` in Hyprland. Connect/disconnect/rescan networks with a password prompt.

### 7. `waybarToggle.sh`
- **Description**: Toggles Waybar process execution.
- **Usage**: `waybarToggle.sh` or `SUPER + SHIFT + T` in Hyprland.

### 8. `herdr-merge-theme`
- **Description**: Merges Matugen colors into Herdr configuration.
- **Usage**: Automatically triggered by `wallset`.

### 9. `papirus-accent`
- **Description**: Recolors the Papirus-Dark folder icons to match the current matugen wallpaper accent.
- **Usage**: `papirus-accent` (auto-invoked by `wallset` after `herdr-merge-theme`)
- **Features**: Reads the primary accent (`rgba(rrggbbff)`) from the matugen-generated `~/.config/hypr/colors.lua`, then hue-shifts only the colored folder bodies across all icon sizes (16→96px including `@2x` HiDPI copies) to the wallpaper accent — grays, whites, and near-black fills are preserved so shading/depth stays intact. Keeps GTK (Thunar, Nautilus) and Qt (Telegram, Brave dialogs, OBS) file managers synced to the wallpaper since both point at the same `Papirus-Dark` theme. Prints the recolored icon count and the hex accent used.

### 10. `resolve-fix`
- **Description**: Environment launcher wrapper for DaVinci Resolve on Wayland/Arch Linux.
- **Usage**: `resolve-fix` (alias `dv`)
- **Features**: Sets OpenCL ICD vendor paths, NVIDIA Prime render offload variables, and preload libraries for smooth DaVinci Resolve execution.

### 11. `resolve_backup.sh`
- **Description**: DaVinci Resolve install & user-customization backup/archive utility.
- **Usage**: `resolve_backup.sh [OPTIONS]` (alias `dvb`)
- **Features**: Archives `/opt/resolve` (minus plugins/LUTs), Resolve user/config directories, and custom fonts into a restorable `.tar.gz` payload tree. Options: `-o/--output-dir`, `-n/--dry-run`, `-t/--test-archive`, `-r/--restore FILE`, `--source-home DIR`.

### 12. `resolve_convert.sh`
- **Description**: Media transcoder for DaVinci Resolve Linux compatibility (free codec set).
- **Usage**: `resolve_convert.sh [OPTIONS] [PATH]` (alias `dvc`)
- **Features**: Recurses a path (skipping `resolve_ready/`), mirrors the tree, and transcodes video → DNxHR (`lb|sq|hq|hqx|444`, default `hq`) and audio → PCM 24-bit/48 kHz WAV via ffmpeg. Options: `-o DIR`, `-q QUALITY`, `-j N`, `-n` (dry-run).

### 13. `prayertime`
- **Description**: Islamic prayer time tracker (Node.js).
- **Usage**: `prayertime`
- **Features**: Fetches calculation timings from the Aladhan API and displays upcoming prayer schedules interactively.

### 14. `ytdlp-single`
- **Description**: High-quality single video downloader powered by `yt-dlp`.
- **Usage**: `ytdlp-single <video_url>`
- **Features**: Downloads videos up to 4K/8K resolution to `~/Downloads/Videos`, embedding subtitles, metadata, and thumbnails with start/finish notifications.

### 15. `ytdlp-playlist`
- **Description**: Batch playlist downloader powered by `yt-dlp`.
- **Usage**: `ytdlp-playlist <playlist_url>`
- **Features**: Batch downloads full playlists with structured directory organization (playlist/uploader/date) and metadata preservation.

### 16. `random-lock-bg.sh`
- **Description**: Random Hyprlock lockscreen background updater.
- **Usage**: `random-lock-bg.sh`
- **Features**: Selects a random wallpaper from `~/wall` and symlinks it to `/tmp/random_lock_bg`.

### 17. `start_database`
- **Description**: Secure MariaDB database service starter.
- **Usage**: `start_database`
- **Features**: Starts MariaDB systemd service with error checking and status feedback.

### 18. `hyprconf2lua`
- **Description**: Helper tool converting legacy Hyprland configuration files to Lua format.
- **Usage**: `hyprconf2lua [file]`

### 19. `graphify` & `graphify-mcp`
- **Description**: Knowledge graph creation and MCP server launcher wrappers.
- **Usage**: `graphify` / `graphify-mcp`

### 20. `poetry`, `colorz` & `wal`
- **Description**: pipx-provided tool wrappers. `poetry` is the Python package/dependency manager; `colorz` and `wal` (pywal) are color-generation CLIs.
- **Note**: `wal` is legacy in this setup — the pywal backend call is commented out inside `wallset`, so matugen is the active theme engine.

---

## 🎛️ Local, Untracked Tools (`mako-*`)

> These five files are **git-ignored** (`.gitignore` → `.local/bin/mako-*`) — they exist only on this machine and are not part of the repo.

| Tool | Description |
| :--- | :--- |
| `mako-cli` | ELF CLI to validate, benchmark, debug, and inspect the MAKO Renderer (Vulkan layer). |
| `mako-ui` | Qt6/QML GUI settings app and standalone launcher configuration for the MAKO Renderer. |
| `mako-diagnostics` | Filters one MAKO Renderer test run into a focused, shareable diagnostic trace (Steam/Mako log presets). |
| `mako-installer` | Install or remove the packaged MAKO Renderer without a terminal (sha256 manifest under `~/.local/share/mako-render`). |
| `mako-launch` | Launches one command with the standalone MAKO Renderer Vulkan layer enabled (isolates LSFG-VK frame-gen layers). |
