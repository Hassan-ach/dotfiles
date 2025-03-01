# ==============================
# Instant Prompt Configuration
# ==============================
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ==============================
# Oh My Zsh & Theme Configuration
# ==============================
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

#
# export TERM="xterm-kitty"
# export COLORTERM=truecolor


setopt prompt_subst
autoload -U compinit && compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-${(%):-%n}"

# Load Starship theme if available
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG=~/.config/starship/starship.toml
fi

# ==============================
# Plugins
# ==============================
plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Autosuggestion style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#c99e84'

# ==============================
# Key Bindings
# ==============================
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^l' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# ==============================
# Aliases (All Kept!)
# ==============================

# Basic Aliases
alias mkdir='mkdir -p'
alias cl='clear'
alias e='exit'

# Editor Aliases
export EDITOR='nvim'
export VISUAL='nvim'
alias nv='nvim'

# Lazy aliases
alias lg="lazygit"
# alias ld="lazydocker"

# Node.js Aliases
alias nrd='npm run dev'

# Docker Aliases
# alias dco="docker compose"
# alias dps="docker ps"
# alias dpa="docker ps -a"
# alias di="docker images"
# alias dl="docker ps -l -q"
# alias dx="docker exec -it"

# Git Aliases
alias gs="git status"
alias gb="git branch"
alias gsw="git switch"
alias ga="git add ."
alias gr="git reset"
alias gc="git commit"
alias gco="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph"
alias gm="git merge"
alias grb="git rebase"

# System Management Aliases
alias off='shutdown -h now'

# Clipboard Aliases
if [ "$WAYLAND_DISPLAY" ]; then
    alias c='wl-copy'
    alias v='wl-paste'
else
    alias c='xsel --input --clipboard'
    alias v='xsel --output --clipboard'
fi

# C++ Compilation
# alias cmp='g++ -std=c++20 -o'
# alias grc='g++ -std=c++20 -lraylib -lGL -lm -lpthread -ldl -lrt -lX11'

# Yazi Alias
alias y='yazi'

# Fastfetch and Pfetch Aliases
alias nf='neofetch'
alias ff='fastfetch'
alias pf='pfetch'

# TTY-based Tools
alias tt='ttyper'
alias tc='tty-clock -t'
alias sl='sl --help -F -a'
alias cb='cbonsai -liv'
alias aq='asciiquarium'
alias cm='cmatrix'

# TMUX Aliases
alias t='tmux'
alias tl='tmux ls'
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'
alias td='tmux detach'

# Yay Package Manager Aliases
# alias update='yay -Sy'
# alias upgrade='yay -Syu'
# alias install='yay -S'
# alias remove='yay -Rns'
# alias search='yay -Ss'

# Directory Navigation Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Eza (Enhanced ls) Aliases
alias ll="eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias lsp="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user"
alias lsa="eza --color=always --long --git --icons=always -b -a --total-size"
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=3 --long --icons --git"
# alias tree="eza --tree --level=3 --icons --git"


# Network Manager Aliases
alias status='nmcli device status'
alias list='nmcli device wifi list'
alias connect='nmcli device wifi connect'
alias disconnect='nmcli device disconnect'

# ==============================
# Environment Variables
# ==============================

# History Settings
HISTFILE="$HOME/.zsh_history"  # Location of history file
HISTSIZE=5000                   # Number of lines kept in memory
SAVEHIST=5000                   # Number of lines saved to file
setopt EXTENDED_HISTORY         # Record timestamp and duration
setopt INC_APPEND_HISTORY_TIME  # Add commands immediately with timestamps
setopt HIST_FCNTL_LOCK          # Safe file locking (prevents corruption)

# History management options
setopt APPEND_HISTORY         # Append to history file instead of overwriting
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate commands
setopt HIST_SAVE_NO_DUPS      # Don't save duplicates to history file
setopt HIST_IGNORE_SPACE      # Don't save commands starting with space
setopt HIST_REDUCE_BLANKS     # Remove superfluous whitespace
setopt HIST_VERIFY            # Show expanded command before execution
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when trimming


# FZF Theme Setup (base16-black-metal-gorgoroth)
if command -v fzf &>/dev/null; then
export FZF_DEFAULT_OPTS="
  --color=fg:#c1c1c1,bg:#000000,hl:#5f8787 \
  --color=fg+:#c1c1c1,bg+:#121212,hl+:#9b8d7f \
  --color=info:#888888,prompt:#8c7f70,pointer:#aaaaaa \
  --color=marker:#aaaaaa,spinner:#999999,header:#5f8787 \
  --color=border:#333333 \
  --color=gutter:#000000 \
  --color=query:#c1c1c1 \
  --color=disabled:#444444 \
  --color=preview-fg:#c1c1c1 \
  --color=preview-bg:#121212
  "
fi

# Bat Theme Setup
export BAT_THEME="tokyonight_night"

# Go Path
export PATH=$PATH:/home/ssk/go/bin/
# alias gn='go run'

# Zoxide Initialization
eval "$(zoxide init zsh)"
# alias cd='z'

# ==============================
# Fzf alias and key bindings
# ==============================
f() {
  local selection
  selection=$(fzf --preview 'bat --style=numbers --color=always {} || ls -al {}')

  if [[ -d "$selection" ]]; then
    cd "$selection" || return
  elif [[ -f "$selection" ]]; then
    nvim "$selection"
  fi
}

# ==============================
# Powerlevel10k Prompt (optional)
# ==============================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ==============================
# External Environment Setups
# ==============================
[ -f "/home/bagi/.ghcup/env" ] && . "/home/bagi/.ghcup/env"
export PHP_INI_SCAN_DIR="/home/bagi/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
eval "$(fzf --zsh)"
