# 🐚 Zsh Shell Environment (`zsh`)

Modular Zsh configuration architecture with autocompletion, FZF integration, custom functions, and plugin manager.

---

## 📂 Modular File Architecture

- **`~/.zshrc`**: Root entry point loaded on interactive shell launch.
- **`zsh/.zsh_aliases`**: System, editor, Git, Docker, network, wallpaper, and package manager aliases.
- **`zsh/.zsh_functions`**: Custom functions (`f`, `fdir`, `fkill`, `fgb`, `sysup`, `extract`, `mkcd`, `help`, `manbt`).
- **`zsh/.zsh_fzf`**: FZF environment options and `bat`/`eza` preview integration.
- **`zsh/.zsh_paths`**: `PATH` additions (`.local/bin`, `.cargo/bin`, Go, pnpm, Java, Android SDK, Pyenv).
- **`zsh/.zsh_plugins`**: Custom plugin loader (`_zplugin_load`) and plugin configs (autosuggestions, vi-mode, fzf-tab).
- **`zsh/.zsh_secrets.example`**: Public template for private API keys (`MODEL_API_KEY`, `OLLAMA_API_KEY`).
- **`zsh/.zsh_vi_mode_config`**: Vi-mode cursor shapes and keytimeout settings.
- **`zsh/plugins/`**: Sub-cloned Git plugins (`zsh-autosuggestions`, `fzf-tab`, `zsh-history-substring-search`, `zsh-vi-mode`, `zsh-syntax-highlighting`).

---

## ⌨️ Full Zsh Aliases Reference

### Basic System & Navigation
- `mkdir` $\rightarrow$ `mkdir -p`
- `cl` $\rightarrow$ `clear`
- `e` $\rightarrow$ `exit`
- `off` $\rightarrow$ `shutdown -h now`
- `--` $\rightarrow$ `cd -`
- `..` $\rightarrow$ `cd ..`
- `...` $\rightarrow$ `cd ../..`
- `.3` $\rightarrow$ `cd ../../..`
- `cd` $\rightarrow$ `z` (Zoxide smart directory jump)
- `cdi` $\rightarrow$ `zi` (Zoxide interactive mode)

### Editors & Files
- `vi` / `v` / `vim` $\rightarrow$ `nvim`
- `y` $\rightarrow$ `yazi` (Terminal File Manager)
- `ls` $\rightarrow$ `eza --color=always --long --git --no-filesize --icons=always`
- `ll` $\rightarrow$ `eza --color=always --git --icons=always`
- `lsa` $\rightarrow$ `eza --color=always --long --git --icons=always -a`
- `lt` $\rightarrow$ `eza --tree --level=3 --long --icons --git`
- `grep` $\rightarrow$ `rg --color=auto`
- `bathelp` $\rightarrow$ `bat --plain --language=help`

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
- `lg` $\rightarrow$ `lazygit`

### Package Management & System Upgrade
- `update` $\rightarrow$ `yay -Sy`
- `upgrade` $\rightarrow$ `yay -Syu`
- `i` $\rightarrow$ `yay -S`
- `remove` $\rightarrow$ `yay -Rns`
- `s` $\rightarrow$ `yay -Ss`
- `sysup` $\rightarrow$ Comprehensive system upgrade, pacman/aur cache cleaning, and orphan package removal.

### Wallpapers & Tmux
- `wals` $\rightarrow$ `~/.local/bin/walset-select` (Interactive visual wallpaper picker)
- `walr` $\rightarrow$ `~/.local/bin/walset` (Random wallpaper generator)
- `t` $\rightarrow$ `tmux`
- `tl` $\rightarrow$ `tmux ls`
- `ta` $\rightarrow$ `tmux attach -t`
- `tk` $\rightarrow$ `tmux kill-session -t`
- `tn` $\rightarrow$ `tmux new -s`

---

## 🛠️ Interactive Custom Functions (`.zsh_functions`)

| Function | Description |
| :--- | :--- |
| **`f`** | Interactive FZF file/directory browser with `bat`/`ls` previews; opens selected file in `nvim`. |
| **`fdir`** | FZF directory finder; jumps into selected directory via `zoxide`. |
| **`fkill`** | Interactive FZF process killer (`kill -9`). |
| **`fgb`** | Interactive FZF Git branch checkout. |
| **`sysup`** | Complete system update (Pacman + Yay), cleans package caches, and removes orphaned packages. |
| **`extract <file>`** | Extracts archives (`.tar.gz`, `.zip`, `.7z`, `.rar`, `.bz2`, `.xz`, etc.) automatically based on file extension. |
| **`mkcd <dir>`** | Creates directory and switches into it. |
| **`help <command>`** | Displays command `--help` formatted with syntax highlighting via `bat`. |

---

## 🛠️ How to Edit & Customize

1. **Add Aliases**: Edit `~/dotfiles/zsh/.zsh_aliases`.
2. **Add Custom Functions**: Edit `~/dotfiles/zsh/.zsh_functions`.
3. **Modify PATH / Environment Variables**: Edit `~/dotfiles/zsh/.zsh_paths`.
4. **Add Private API Keys**: Copy `~/dotfiles/zsh/.zsh_secrets.example` to `~/dotfiles/zsh/.zsh_secrets` and fill in keys.
5. Reload shell changes: `source ~/.zshrc`.
