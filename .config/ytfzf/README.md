# ▶️ YTFZF Configuration (`.config/ytfzf`)

TUI YouTube browser (fzf-powered) configuration.

---

## 📂 Files

- **`conf.sh`**: YTFZF settings.

## ⚙️ Settings

- **Thumbnails**: enabled (`show_thumbnails=1`, `async_thumbnails=1`) with preview on the right (`fzf_preview_side="right"`).
- **History**: enabled (`enable_hist=1`).
- **Playback**: URLs hand off to mpv with tuned Vulkan/high-quality flags (`--hwdec=vulkan --gpu-api=vulkan --vo=gpu-next --gpu-hq`) — matching `mpv.conf`.

## ⚡ Integration

- Launch via the `yt` zsh function: `yt [4k|2k|1080|720] [search]` — caps resolution via `--ytdl-pref` (default 1080p).
