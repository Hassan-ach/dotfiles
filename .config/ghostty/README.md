# 👻 Ghostty Terminal Configuration (`.config/ghostty`)

Alternative GPU-accelerated terminal emulator configuration (alongside Kitty).

---

## 📂 Files

- **`config`**: Main Ghostty configuration.

## ⚙️ Key Settings

- **Font**: Iosevka Nerd Font, size 18.
- **Appearance**: `background-opacity 0.7` + `background-blur-radius 10`, no window decoration, zero padding.
- **Shell**: `command = tmux` — every window starts inside Tmux (same as Kitty).
- **Behavior**: hide mouse while typing, copy-on-select to clipboard, no close confirmation.
- **Cursor**: block, blinking.

## ⌨️ Keybindings

| Key | Action |
| :--- | :--- |
| `Ctrl + =` / `Ctrl + -` | Increase / decrease font size |
| `Super + U` | Background opacity → 0.0 |
| `Super + Shift + U` | Background opacity → default |
| `Super + Shift + I` | Background opacity → 1.0 |

## 🎨 Theming

Matugen does not currently generate a Ghostty theme — the config notes that you can symlink/copy the generated colors to `~/.config/ghostty/themes/matugen` manually.
