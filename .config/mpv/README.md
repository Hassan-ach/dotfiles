# 🎬 MPV Media Player (`.config/mpv`)

Media player configuration and custom input shortcuts.

---

## 📂 Files

- **`mpv.conf`**: Hardware video acceleration (Vulkan/`gpu-next`/`gpu-hq`), network cache buffers, audio behavior (`save-position-on-quit`, `keep-open`, volume defaults), and subtitle styling.
- **`input.conf`**: Custom keyboard shortcuts (full reference below).
- **`scripts/youtube-quality.lua`** + **`script-opts/youtube-quality.conf`**: Interactive YouTube quality-selection menu.

---

## ⌨️ Keybindings

### Playback Control
| Key | Action |
| :--- | :--- |
| `SPACE` / `p` | Play / Pause |
| `.` / `,` | Frame step forward / back (while paused) |
| `>` / `<` | Speed ×1.25 / ×0.8 |
| `=` | Reset speed to 1.0 |
| `+` / `-` | Speed +0.1 / -0.1 |

### Volume
| Key | Action |
| :--- | :--- |
| `h` / `l` | Volume -1 / +1 |
| `H` / `L` | Volume -5 / +5 |
| `m` | Toggle mute |

### Seeking
| Key | Action |
| :--- | :--- |
| `j` / `k` | Seek -10s / +10s |
| `J` / `K` | Seek -30s / +30s |
| `Ctrl+d` / `Ctrl+u` | Seek +60s / -60s |
| `g` / `G` | Jump to start / end |
| `1`–`9`, `0` | Jump to 10%–90% / 0% (start) |

### Video & Subtitles
| Key | Action |
| :--- | :--- |
| `f` | Toggle fullscreen |
| `Alt+0` / `Alt+1` / `Alt+2` | Window scale 0.5× / 1× / 2× |
| `s` / `S` | Cycle subtitles / toggle subtitle visibility |
| `a` | Cycle audio tracks |
| `c` | Toggle forced-only subtitles |
| `Ctrl+Shift+h` / `Ctrl+Shift+x` | Sub delay -0.1s / +0.1s |
| `Ctrl+j` / `Ctrl+k` | Subtitle scale smaller / bigger |

### Playlist, Chapters & Quality
| Key | Action |
| :--- | :--- |
| `n` / `N` | Next / previous playlist item |
| `Ctrl+n` / `Ctrl+p` | Next / previous chapter |
| `Ctrl+q` | Cycle YouTube quality (1080 → 720 → 480 → 360 → worst) |

### Info, Screenshots & Exit
| Key | Action |
| :--- | :--- |
| `i` / `I` | Toggle stats overlay / stats page 4 |
| `o` / `O` | Show progress bar / toggle OSD detail |
| `b` / `B` | Jump to start / save position & quit |
| `t` / `T` | Screenshot (window) / screenshot (video only) |
| `Ctrl+Shift+l` / `Ctrl+Shift+L` | Loop file / loop playlist |
| `ESC` | Exit fullscreen |
| `q` / `Q` | Quit / quit & save position |
| `Ctrl+c` | Force quit |

> Note: there are no mouse-wheel bindings; seeking and volume are keyboard-only.

---

## 🛠️ How to Edit & Customize

1. **Playback / cache / subtitle options**: Edit `~/.config/mpv/mpv.conf`.
2. **Keybindings**: Edit `~/.config/mpv/input.conf` (each line has an inline cheatsheet comment).
3. **YouTube quality menu**: Edit `~/.config/mpv/script-opts/youtube-quality.conf`.
