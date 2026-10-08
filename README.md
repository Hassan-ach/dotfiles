# 🛠️ Personal Arch Linux Dotfiles

High-performance, modern Arch Linux dotfiles ecosystem powered by **Hyprland**, **Matugen** (Material You dynamic styling), **Neovim**, **Zsh**, **Starship**, **Kitty**, **Waybar**, and **GNU Stow**.

---

## 📂 Sub-Directory Documentation Index

Each tool and configuration folder contains its own dedicated `README.md` manual with full keybindings, file breakdowns, and editing instructions:

| Component / Tool | Sub-Directory Path | Detailed Documentation Link |
| :--- | :--- | :--- |
| **Hyprland WM** | `.config/hypr/` | [Hyprland Keybindings & Configuration](.config/hypr/README.md) |
| **Zsh Environment** | `zsh/` | [Zsh Aliases, Functions & Plugins](zsh/README.md) |
| **Executable Scripts** | `.local/bin/` | [Scripts Ecosystem Manual](.local/bin/README.md) |
| **Neovim IDE** | `.config/nvim/` | [Neovim Setup & Keymaps](.config/nvim/README.md) |
| **Matugen Engine** | `.config/matugen/` | [Matugen Theme Pipeline](.config/matugen/README.md) |
| **Starship Prompt** | `.config/starship.toml` | *(Generated file — see [Matugen Theme Pipeline](.config/matugen/README.md))* |
| **Kitty Terminal** | `.config/kitty/` | [Kitty Setup & Themes](.config/kitty/README.md) |
| **Ghostty Terminal** | `.config/ghostty/` | [Ghostty Setup](.config/ghostty/README.md) |
| **Waybar Status Bar**| `.config/waybar/` | [Waybar Modules & Styling](.config/waybar/README.md) |
| **Rofi Launcher** | `.config/rofi/` | [Rofi Layouts & Pickers](.config/rofi/README.md) |
| **Tmux Multiplexer** | `.tmux.conf` (repo root) | [Tmux Shortcuts & Plugins](.config/tmux/README.md) |
| **SwayNC** | `.config/swaync/` | [Notification Center Styling](.config/swaync/README.md) |
| **Yazi File Manager**| `.config/yazi/` | [Yazi Setup](.config/yazi/README.md) |
| **Qutebrowser** | `.config/qutebrowser/` | [Browser Config & Themes](.config/qutebrowser/README.md) |
| **MPV Media Player** | `.config/mpv/` | [MPV Shortcuts & Config](.config/mpv/README.md) |
| **Btop Monitor** | `.config/btop/` | [Btop Configuration](.config/btop/README.md) |
| **Bat Syntax Tool** | `.config/bat/` | [Bat Setup](.config/bat/README.md) |
| **Fastfetch** | `.config/fastfetch/` | [System Fetch Modules](.config/fastfetch/README.md) |
| **Herdr TUI** | `.config/herdr/` | [Herdr Config & Theme Merger](.config/herdr/README.md) |
| **Lazygit** | `.config/lazygit/` | [Lazygit Setup](.config/lazygit/README.md) |
| **nwg-look** | `.config/nwg-look/` | [GTK Appearance Config](.config/nwg-look/README.md) |
| **Qt5 / Qt6 Style** | `.config/qt5ct/`, `.config/qt6ct/` | [Qt5 Styling](.config/qt5ct/README.md) / [Qt6 Styling](.config/qt6ct/README.md) |
| **Kvantum (Qt Theme)** | `.config/Kvantum/` | [Kvantum Theme Setup](.config/Kvantum/README.md) |
| **GTK 3 / GTK 4** | `.config/gtk-3.0/`, `.config/gtk-4.0/` | [GTK Styling](.config/gtk-3.0/README.md) / [GTK 4](.config/gtk-4.0/README.md) |
| **YTFZF (YouTube TUI)** | `.config/ytfzf/` | [YTFZF Config](.config/ytfzf/README.md) |
| **Browser Themes** | `.config/browser_stuff/` | [Browser Theme Assets](.config/browser_stuff/README.md) |

---

## 🏗️ System Overview Architecture

```
                  ┌──────────────────────┐
                  │ Wallpaper (~/wall/)  │
                  └──────────┬───────────┘
                             │
                             ▼
                  ┌───────────────────────┐
                  │ ~/.local/bin/wallset  │
                  │ (picker / -r / path)  │
                  └──────────┬────────────┘
                             │
             ┌───────────────┼────────────────┐
             ▼               ▼                ▼
       ┌───────────┐   ┌───────────┐   ┌──────────────┐
       │   awww    │   │  Matugen  │   │ Reload Hooks │
       │ (Wall-    │   │   Engine  │   │ • waybar     │
       │   paper)  │   └─────┬─────┘   │ • swaync     │
       └───────────┘         │         │ • tmux       │
                             ▼         └──────────────┘
                    ┌─────────────────┐
                    │ Config Output:  │   ┌─────────────────────────┐
                    │ • Kitty         │   │ Post-Theme Steps:       │
                    │ • Ghostty (ref) │   │ • herdr-merge-theme     │
                    │ • Waybar        │   │ • papirus-accent        │
                    │ • Rofi          │   │   (Papirus folder tint) │
                    │ • Hyprland      │   └─────────────────────────┘
                    │ • Tmux          │
                    │ • Qutebrowser   │   ┌─────────────────────────┐
                    │ • Starship      │   │ Legacy (currently       │
                    │ • Btop / Bat    │   │ disabled in wallset):   │
                    │ • Yazi / Herdr  │   │ • pywal (`wal`) backend │
                    │ • Vesktop / Cava│   │ • nvim pywal watcher    │
                    │ • GTK 3/4 CSS   │   └─────────────────────────┘
                    │ • Kvantum / QtCt│
                    │ • Nvim base46   │
                    │ • dgop / cava   │
                    └─────────────────┘
```

- **Compositor**: Hyprland (Wayland) with custom window rules, window groups, scratchpads, gestures, and submap resize modes.
- **Color Engine**: Matugen generates dynamic color schemes for Kitty, Waybar, Rofi, Hyprland, Tmux, Qutebrowser, Starship, Btop, Bat, Yazi, Herdr, Vesktop, Cava, GTK 3/4, Kvantum/QtCt color schemes, dgop, and Neovim base46 themes (see [Matugen Theme Pipeline](.config/matugen/README.md) for the full template list).
- **Wallpaper Pipeline**: `wallset` sets the wallpaper via `awww`, runs Matugen, then restarts Waybar/SwayNC, reloads Tmux, merges the Herdr theme, and recolors Papirus folder icons. The older pywal (`wal`) backend remains in the repo but is disabled in `wallset`.
- **Shell & Prompt**: Zsh paired with Starship prompt, featuring modular paths, custom functions, aliases, vi-mode, and `fzf-tab`.
- **Multiplexer**: Tmux with TPM plugins, resurrect, and custom project dev sessionizers.
- **IDE**: Neovim with Lazy.nvim, NvChad Base46 highlights, LSP, Treesitter, and Conform formatting.

---

## 🚀 Installation & Deployment (`install.sh` & GNU Stow)

Setting up a brand new Arch Linux machine with this dotfiles repository is fully automated:

```bash
git clone --recurse-submodules https://github.com/Hassan-ach/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

> `--recurse-submodules` fetches the two git submodules (`.config/nvim/pywal` and `.config/qutebrowser/solarized-everything-css`); if you cloned without it, `install.sh` initializes them automatically.

### What `install.sh` executes:
1. **System Check**: Verifies Arch Linux (or an Arch-based distribution) via `/etc/arch-release`.
2. **System Update & Core Deps**: Refreshes Pacman databases (`pacman -Sy`) and installs bootstrap tools (`base-devel`, `git`, `curl`, `wget`, `jq`, `unzip`, `7zip`, `p7zip`).
3. **AUR Helper**: Installs `yay` from the AUR if it is missing.
4. **Pacman Packages**: Installs the desktop/terminal stack (Hyprland, Waybar, SwayNC, Rofi, Kitty, Tmux, Starship, Zoxide, FZF, eza, Bat, Yazi, Lazygit, Btop, Fastfetch, MPV…), languages/toolchains (`rustup`, `go`, `nodejs`, `pnpm`, `python`, `gcc`, `make`, `cmake`), and fonts (`ttf-iosevka-nerd`, `ttf-font-awesome`, `noto-fonts-emoji`); then sets the default Rust toolchain to stable.
5. **AUR Packages**: Installs `matugen-bin`, `awww-bin`, `hyprshot`, `python-pywal`, `vesktop-bin`, `brave-bin`, `cava`, `qutebrowser` (continues on partial failure).
6. **Python Color Backend**: Installs `haishoku` via pip (pywal's fallback backend — the pywal pipeline is currently disabled in `wallset`, but the dependency is still provisioned).
7. **Tmux Plugin Manager**: Clones TPM into `~/.tmux/plugins/tpm` if absent.
8. **Zsh Plugins**: Clones `zsh-autosuggestions`, `fzf-tab`, `zsh-history-substring-search`, `zsh-vi-mode`, and `zsh-syntax-highlighting` into `~/dotfiles/zsh/plugins`.
9. **GNU Stow Symlinking**: Creates `~/.config` and `~/.local/bin`, marks scripts executable, then runs `stow -v -R -t "$HOME" .` from `~/dotfiles` to link all configurations into `$HOME`. Also creates the wallpaper directory `~/wall` and seeds `zsh/.zsh_secrets` from `.zsh_secrets.example` if missing.
10. **Default Shell**: Changes the login shell to Zsh (`chsh -s "$(which zsh)"`).

