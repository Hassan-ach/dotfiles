# 🐚 Zsh Shell Environment (`zsh`)

Modular Zsh configuration architecture with autocompletion, FZF integration, custom functions, and plugin manager.

---

## 📂 Modular File Architecture

- **`~/.zshrc`**: Root entry point loaded on interactive shell launch. Compiles each module to `.zwc` for faster loading, runs `compinit`, sets completion styles (`zstyle`), then loads the modules below and inits external tools (zoxide, fzf, starship).
- **`zsh/.zsh_aliases`**: Aliases organized by category — system/navigation, editor, Git, Docker, network, wallpaper, package manager, torrent/aria2, npm/pnpm, Python, DaVinci Resolve, retroarch/gamepad, and terminal toys. Also defines the `aws-term` / `aws-login` functions.
- **`zsh/.zsh_functions`**: Custom functions (`f`, `fdir`, `fkill`, `fgb`, `sysup`, `init_project`, `extract`, `mkcd`, `help`, `manbt`, `netstat_quick`, `yt`, `yy`).
- **`zsh/.zsh_fzf`**: FZF environment options (fd-based default command, UI layout) and smart preview integration — images via `kitty icat`, text via `bat` — plus the `Ctrl+F` file-picker zle widget.
- **`zsh/.zsh_paths`**: `PATH` additions (`.local/bin`, `.cargo/bin`, Go, `.npm-global/bin`, `.opencode/bin`, pnpm, Java, Android SDK, Pyenv) **and** environment config: `EDITOR`/`VISUAL` (nvim), history settings (`HISTFILE`, sizes, `setopt`s), `BAT_PAGER`/`BAT_THEME`, `MANPAGER` (`nvim +Man!`), PHP herd-lite, `QT_QPA_PLATFORMTHEME`, and Wayland/X11 session detection.
- **`zsh/.zsh_plugins`**: Custom plugin loader (`_zplugin_load`, auto-clones missing plugins) and plugin configs — autosuggestions, vi-mode cursor shapes via `zvm_config()` (`ZVM_KEYTIMEOUT=0.4`), history-substring-search, and `fzf-tab` previews. Also defines `zplugin-update`.
- **`zsh/.zsh_secrets.example`**: Public template for private API keys (`MODEL_API_KEY`, `OLLAMA_API_KEY`).
- **`zsh/.zsh_vi_mode_config`**: Vi-mode keybindings via `zvm_after_init()` (Ctrl+arrows word movement, `Ctrl+F` fzf picker, `Ctrl+\` autosuggest toggle, `Ctrl+R` fzf history, Up/Down history-substring-search). Cursor shapes and keytimeout live in `.zsh_plugins` (`zvm_config`), not here.
- **`zsh/plugins/`**: Sub-cloned Git plugins (`zsh-autosuggestions`, `fzf-tab`, `zsh-history-substring-search`, `zsh-vi-mode`, `zsh-syntax-highlighting`).

---

## ⌨️ Full Zsh Aliases Reference

> Aliases marked *(conditional)* are only defined when the tool is installed (zoxide, eza, rg, bat, yay) — fallbacks exist for `ls`/package management.

### Basic System & Navigation
- `mkdir` $\rightarrow$ `mkdir -p`
- `cl` $\rightarrow$ `clear`
- `e` $\rightarrow$ `exit`
- `off` $\rightarrow$ `shutdown -h now`
- `-` $\rightarrow$ `cd -`
- `..` $\rightarrow$ `cd ..`
- `...` $\rightarrow$ `cd ../..`
- `.3` / `.4` / `.5` $\rightarrow$ `cd ../../..` / `cd ../../../..` / `cd ../../../../..`
- `df` $\rightarrow$ `df -h`
- `diff` $\rightarrow$ `diff --color=auto`
- `cd` $\rightarrow$ `z` (Zoxide smart directory jump) *(conditional)*
- `cdi` $\rightarrow$ `zi` (Zoxide interactive mode) *(conditional)*

### Editors & Files
- `vi` / `v` / `vim` $\rightarrow$ `nvim`
- `y` $\rightarrow$ `yazi` (Terminal File Manager)
- `fm` $\rightarrow$ `nnn -e`
- `ls` $\rightarrow$ `eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions` *(conditional; fallback: `ls --color=auto`)*
- `ll` $\rightarrow$ `eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions` *(conditional; fallback: `ls -alF`)*
- `lsp` $\rightarrow$ `eza --color=always --long --git --no-filesize --icons=always --no-time --no-user`
- `lsa` $\rightarrow$ `eza --color=always --long --git --icons=always -b -a --total-size`
- `l` $\rightarrow$ `eza -l --icons --git -a` *(conditional; fallback: `ls -CF`)*
- `la` $\rightarrow$ `ls -A` *(fallback branch only, when eza is missing)*
- `lt` $\rightarrow$ `eza --tree --level=3 --long --icons --git`
- `grep` $\rightarrow$ `rg --color=auto` *(conditional on ripgrep)*
- `bathelp` $\rightarrow$ `bat --plain --language=help` *(conditional on bat)*

### Git & Lazygit
- `gs` $\rightarrow$ `git status`
- `gb` $\rightarrow$ `git branch`
- `gsw` $\rightarrow$ `git switch`
- `ga` $\rightarrow$ `git add .`
- `gaa` $\rightarrow$ `git add --all`
- `gr` $\rightarrow$ `git reset`
- `gc` $\rightarrow$ `git commit`
- `gco` $\rightarrow$ `git commit -m`
- `gp` $\rightarrow$ `git push`
- `gpl` $\rightarrow$ `git pull`
- `gl` $\rightarrow$ `git log --oneline --graph --decorate`
- `gla` $\rightarrow$ `git log --graph --all --oneline --decorate --parents`
- `glog` $\rightarrow$ `PAGER="less -F -X" git log`
- `gadog` $\rightarrow$ `PAGER="less -F -X" git log --all --decorate --oneline --graph`
- `gm` $\rightarrow$ `git merge`
- `grb` $\rightarrow$ `git rebase`
- `gst` $\rightarrow$ `git stash`
- `gsp` $\rightarrow$ `git stash pop`
- `gcl` $\rightarrow$ `git clone`
- `lg` $\rightarrow$ `lazygit`
- `lzd` $\rightarrow$ `lazydocker`

### Package Management & System Upgrade
- `update` $\rightarrow$ `yay -Sy` *(fallback: `sudo pacman -Sy`)*
- `upgrade` $\rightarrow$ `yay -Syu` *(fallback: `sudo pacman -Syu`)*
- `i` $\rightarrow$ `yay -S` *(fallback: `sudo pacman -S`)*
- `remove` $\rightarrow$ `yay -Rns` *(fallback: `sudo pacman -Rns`)*
- `s` $\rightarrow$ `yay -Ss` *(fallback: `pacman -Ss`)*
- `info` $\rightarrow$ `yay -Si` *(fallback: `pacman -Si`)*
- `sysup` $\rightarrow$ *function* — comprehensive system upgrade, pacman/aur cache cleaning, and orphan package removal (see Functions below).

### Node / Python
- `n` $\rightarrow$ `pnpm`
- `nrd` / `nrs` / `nrb` / `nrt` $\rightarrow$ `npm run dev` / `start` / `build` / `test`
- `py` $\rightarrow$ `python3`
- `pip` $\rightarrow$ `pip3`

### Network (NetworkManager)
- `status` $\rightarrow$ `nmcli device status`
- `list` $\rightarrow$ `nmcli device wifi list`
- `connect` $\rightarrow$ `nmcli device wifi connect`
- `disconnect` $\rightarrow$ `nmcli device disconnect`
- `myip` $\rightarrow$ `curl -s ifconfig.me`
- `localip` $\rightarrow$ local IP via `ip route get 1.1.1.1`

### Docker
- `dco` $\rightarrow$ `docker compose`
- `dps` $\rightarrow$ `docker ps`
- `dpa` $\rightarrow$ `docker ps -a`
- `di` $\rightarrow$ `docker images`
- `dl` $\rightarrow$ `docker ps -l -q`
- `dx` $\rightarrow$ `docker exec -it`

### Torrent / Downloads (aria2)
- `torrent` / `magnet` $\rightarrow$ `aria2c` with tuned BitTorrent options (DHT, PEX, LPD, 200 max peers, `falloc` allocation)

### Wallpapers & Tmux
- `wals` $\rightarrow$ `~/.local/bin/wallset` (Interactive visual wallpaper picker)
- `walr` $\rightarrow$ `~/.local/bin/wallset -r` (Random wallpaper generator)
- `t` $\rightarrow$ `tmux`
- `tl` $\rightarrow$ `tmux ls`
- `ta` $\rightarrow$ `tmux attach -t`
- `tk` $\rightarrow$ `tmux kill-session -t`
- `tn` $\rightarrow$ `tmux new -s`
- `td` $\rightarrow$ `tmux detach`

### DaVinci Resolve
- `dv` $\rightarrow$ `~/.local/bin/resolve-fix`
- `dvc` $\rightarrow$ `~/.local/bin/resolve_convert.sh`
- `dvb` $\rightarrow$ `~/.local/bin/resolve_backup.sh`

### System Info & Terminal Toys
- `nf` / `ff` / `pf` $\rightarrow$ `neofetch` / `fastfetch` / `pfetch`
- `tt` $\rightarrow$ `ttyper`
- `tc` $\rightarrow$ `tty-clock -t`
- `sl` $\rightarrow$ `sl -F -a`
- `cb` $\rightarrow$ `cbonsai -liv`
- `aq` $\rightarrow$ `asciiquarium`
- `cm` $\rightarrow$ `cmatrix`
- `retroarch-nv` $\rightarrow$ RetroArch AppImage with NVIDIA PRIME render offload env
- `gamepad` $\rightarrow$ `~/Downloads/gamepad/remotegamepad`

### C++ Development
- `cmp` $\rightarrow$ `g++ -std=c++20 -o`

---

## 🛠️ Interactive Custom Functions

### In `.zsh_functions`
| Function | Description |
| :--- | :--- |
| **`f`** | Interactive FZF file/directory browser with `bat`/`ls` previews; opens selected file in `nvim`, `cd`s into a selected directory. |
| **`fdir`** | FZF directory finder; jumps into selected directory via `zoxide`. |
| **`fkill`** | Interactive FZF process killer (`kill -9` by default; pass a signal number to override). |
| **`fgb`** | Interactive FZF Git branch checkout. |
| **`sysup`** | Complete system update (Pacman + Yay), cleans package caches, and removes orphaned packages. |
| **`init_project <type> <name>`** | Scaffolds a project (`node`, `python`, `rust`, `go`) with `.gitignore`/README and `git init`. |
| **`extract <file>`** | Extracts archives (`.tar.gz`, `.zip`, `.7z`, `.rar`, `.bz2`, `.xz`, etc.) automatically based on file extension. |
| **`mkcd <dir>`** | Creates directory and switches into it. |
| **`help <command>`** | Displays command `--help` formatted with syntax highlighting via `bat`. |
| **`manbt <cmd>`** | Renders a man page through `bat` for syntax-highlighted reading. |
| **`netstat_quick`** | Quick network status: WiFi device state, active connections, and IP addresses (nmcli/ip). |
| **`yt [4k\|2k\|1080\|720] …`** | Launches `ytfzf` capped at the given max height (default 1080p). |
| **`yy`** | Opens `yazi` and follows the directory you navigated to on exit (`cd` into it). |

### In `.zsh_aliases` (functions defined alongside aliases)
| Function | Description |
| :--- | :--- |
| **`aws-term [account]`** | Opens an `aws-vault exec` shell session (default account `bagi`). |
| **`aws-login [account]`** | Opens the AWS console via `aws-vault login` (default account `bagi`). |

### In `.zsh_plugins`
| Function | Description |
| :--- | :--- |
| **`zplugin-update`** | `git pull --ff-only` across every plugin in `zsh/plugins/`. |

---

## ⌨️ Keybindings (vi-mode aware, registered in `.zsh_vi_mode_config`)

| Key | Action |
| :--- | :--- |
| `Ctrl + Right` / `Ctrl + Left` | Move forward / backward one word |
| `Ctrl + F` | FZF file picker (inserts path, excludes hidden files) |
| `Ctrl + R` | FZF history search |
| `Ctrl + \` | Toggle autosuggestions |
| `Up` / `Down` | History search by substring (history-substring-search) |

---

## 🛠️ How to Edit & Customize

1. **Add Aliases**: Edit `~/dotfiles/zsh/.zsh_aliases`.
2. **Add Custom Functions**: Edit `~/dotfiles/zsh/.zsh_functions`.
3. **Modify PATH / Environment Variables**: Edit `~/dotfiles/zsh/.zsh_paths`.
4. **FZF Behavior / Preview**: Edit `~/dotfiles/zsh/.zsh_fzf`.
5. **Plugins & Vi-mode Cursor Shapes**: Edit `~/dotfiles/zsh/.zsh_plugins`.
6. **Vi-mode Keybindings**: Edit `~/dotfiles/zsh/.zsh_vi_mode_config`.
7. **Add Private API Keys**: Copy `~/dotfiles/zsh/.zsh_secrets.example` to `~/dotfiles/zsh/.zsh_secrets` and fill in keys.
8. Reload shell changes: `source ~/.zshrc`.
