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
| **Starship Prompt** | `.config/starship.toml` | [Matugen Config & Templates](.config/matugen/README.md) |
| **Kitty Terminal** | `.config/kitty/` | [Kitty Setup & Themes](.config/kitty/README.md) |
| **Waybar Status Bar**| `.config/waybar/` | [Waybar Modules & Styling](.config/waybar/README.md) |
| **Rofi Launcher** | `.config/rofi/` | [Rofi Layouts & Pickers](.config/rofi/README.md) |
| **Tmux Multiplexer** | `.config/tmux/` | [Tmux Shortcuts & Plugins](.config/tmux/README.md) |
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
| **Qt5 / Qt6 Style** | `.config/qt5ct/`, `.config/qt6ct/` | [Qt Styling Engine](.config/qt5ct/README.md) |

---

## 🏗️ System Overview Architecture

```
                  ┌──────────────────────┐
                  │ Wallpaper (~/wall/)  │
                  └──────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ ~/.local/bin/walset-  │
                 │    select / backend   │
                 └──────────┬────────────┘
                            │
            ┌───────────────┼───────────────┐
            ▼               ▼               ▼
      ┌───────────┐   ┌───────────┐   ┌───────────┐
      │   awww    │   │  Matugen  │   │   Pywal   │
      │ (Wall-    │   │   Engine  │   │  Backend  │
      │   paper)  │   └─────┬─────┘   └─────┬─────┘
      └───────────┘         │               │
                            ▼               ▼
                   ┌─────────────────┐┌───────────┐
                   │ Config Output:  ││ Chadwal   │
                   │ • Kitty         ││ Nvim      │
                   │ • Waybar        │└───────────┘
                   │ • Rofi          │
                   │ • Hyprland      │
                   │ • Tmux          │
                   │ • Qutebrowser   │
                   │ • Starship      │
                   │ • Btop / Bat    │
                   │ • Yazi / Herdr  │
                   │ • Vesktop / Cava│
                   └─────────────────┘
```

- **Compositor**: Hyprland (Wayland) with custom window rules, gestures, and submap resize modes.
- **Color Engine**: Matugen generates dynamic color schemes for Kitty, Waybar, Rofi, Hyprland, Tmux, Qutebrowser, Starship, Btop, Bat, Yazi, Herdr, Vesktop, and Cava.
- **Shell & Prompt**: Zsh paired with Starship prompt, featuring modular paths, custom functions, aliases, vi-mode, and `fzf-tab`.
- **Multiplexer**: Tmux with TPM plugins, resurrect, and custom project dev sessionizers.
- **IDE**: Neovim with Lazy.nvim, NvChad Base46 highlights, LSP, Treesitter, and Conform formatting.

---

## 🚀 Installation & Deployment (`install.sh` & GNU Stow)

Setting up a brand new Arch Linux machine with this dotfiles repository is fully automated:

```bash
git clone https://github.com/Hassan-ach/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### What `install.sh` executes:
1. **System Check & Tooling**: Verifies Arch Linux, updates Pacman databases, and installs `yay` if missing.
2. **Package Installation**: Installs required official Pacman packages, AUR packages (`matugen-bin`, `awww-bin`, `hyprshot`, `vesktop-bin`, `brave-bin`, `cava`, `qutebrowser`, etc.), fonts (`ttf-iosevka-nerd`), and development toolchains.
3. **Python & Environment Setup**: Installs color backend dependencies (`haishoku`), creates wallpaper directory `~/wall`, and creates `.zsh_secrets` template.
4. **Plugin Setup**: Installs Tmux Plugin Manager (`TPM`) and clones Zsh plugins (`zsh-autosuggestions`, `fzf-tab`, `zsh-history-substring-search`, `zsh-vi-mode`, `zsh-syntax-highlighting`).
5. **GNU Stow Symlinking**: Executes `stow -v -R -t "$HOME" .` from `~/dotfiles` to stow all configurations into `$HOME` cleanly.
6. **Default Shell**: Changes default user shell to Zsh.

