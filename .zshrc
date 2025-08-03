# ==============================
# Instant Prompt Configuration
# ==============================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================
# Oh My Zsh & Theme Configuration
# ==============================
export ZSH="$HOME/.oh-my-zsh"
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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-tab)
source $ZSH/oh-my-zsh.sh

# Autosuggestion style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#c99e84'

# ==============================
# Completion Styling
# ==============================

# Enable case-insensitive and partial-word matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Use LS_COLORS for file/directory colors in completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Enable menu selection for completions
zstyle ':completion:*' menu select

# Disable sorting for specific commands (e.g., git checkout)
zstyle ':completion:*:git-checkout:*' sort false

# Format descriptions with group support
zstyle ':completion:*:descriptions' format '[%d]'

# Disable default completion menu (required for fzf-tab to work properly)
zstyle ':completion:*' menu no

# ==============================
# FZF-Tab Configuration (Oh My Zsh Compatible)
# ==============================

# Load fzf-tab plugin (if not already loaded)
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab ]]; then
  git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
fi

# Enable fzf-tab
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab/fzf-tab.plugin.zsh

# Use eza for directory previews in fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons=auto $realpath'

# Custom fzf flags for fzf-tab
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept

# Make fzf-tab follow FZF_DEFAULT_OPTS (use with caution)
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Switch between fzf-tab groups using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# ==============================
# Additional Completion Tweaks
# ==============================

# Cache completions for faster performance
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/.zcompcache"

# Group completions by type (e.g., files, directories, commands)
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B%F{blue}%d%f%b'

# Ignore case in completions
zstyle ':completion:*' ignore-case true

# Show hidden files in completions
zstyle ':completion:*' file-patterns '*(D)'

# ==============================
# FZF-Tab Preview Enhancements
# ==============================

# Preview files with bat (if installed)
if command -v bat &>/dev/null; then
  zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath 2>/dev/null || ls --color $realpath'
else
  zstyle ':fzf-tab:complete:*:*' fzf-preview 'ls --color $realpath'
fi

# Preview environment variables
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# Preview processes for kill/pkill
zstyle ':fzf-tab:complete:(kill|pkill):*' fzf-preview 'ps --pid=$word -o cmd --no-headers'

# Preview man pages
zstyle ':fzf-tab:complete:man:*' fzf-preview 'man $word | bat --color=always --style=plain --language=man'

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
# vim style Functionallity
# ==============================
bindkey -v
export KEYTIMEOUT=1

# ==============================
# Fzf Functions
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

fzd() {
  local dir
  dir=$(find . -type d | fzf --preview 'ls -l --color=always {}') && z "$dir"
}

# ==============================
# System upgrade and clean
# ==============================
sysup() {
    echo "==> Updating system (pacman)..."
    sudo pacman -Syu

    echo "==> Cleaning pacman cache..."
    sudo pacman -Sc --noconfirm

    echo "==> Removing orphan packages (pacman)..."
    orphans=$(pacman -Qdtq)
    [ -n "$orphans" ] && sudo pacman -Rns $orphans

    echo "==> Updating AUR packages (yay)..."
    yay -Syu

    echo "==> Cleaning yay cache..."
    yay -Sc --noconfirm

    echo "==> Removing orphan packages (yay)..."
    aorphans=$(yay -Qdtq)
    [ -n "$aorphans" ] && yay -Rns $aorphans

    echo "✅ Done!"
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

# Initialize Zoxide
eval "$(zoxide init zsh)"

# Run FZF for shell completion
eval "$(fzf --zsh)"

# ==============================
# Load Paths and Aliases
# ==============================
if [ -f "$HOME/.zsh_paths" ]; then
    source "$HOME/.zsh_paths"
fi

if [ -f "$HOME/.zsh_aliases" ]; then
    source "$HOME/.zsh_aliases"
fi


export GOOGLE_API_KEY="AIzaSyCgFr8BzgC-CHz-PdCIpVvgaZGUncAvUJg"
export GEMINI_API_KEY="AIzaSyCgFr8BzgC-CHz-PdCIpVvgaZGUncAvUJg"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

