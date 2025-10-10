# ==============================
# Main ZSH Configuration
# ==============================

# PROFILING MODE (Keep this if you want to re-profile after changes)
# use this for profiling in case the shell becomes slow
export PROFILING_MODE=0
if [ $PROFILING_MODE -ne 0 ]; then
    zmodload zsh/zprof
    zsh_start_time=$(python3 -c 'import time; print(int(time.time() * 1000))')
fi

# Helper function to compile and source Zsh scripts for faster loading
zsource() {
  local file=$1
  local zwc="${file}.zwc"
  if [[ -f "$file" && (! -f "$zwc" || "$file" -nt "$file") ]]; then
    zcompile "$file"
  fi
  source "$file"
}

# Instant Prompt Configuration (Powerlevel10k) - Keep this sourced directly
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ==============================
# Load Modular Configuration Files
# ==============================
export ZSH="$HOME/dotfiles/zsh"
# Load in specific order for dependencies, now using zsource for compilation
[ -f "$ZSH/.zsh_paths" ] && zsource "$ZSH/.zsh_paths"
[ -f "$ZSH/.zsh_secrets" ] && zsource "$ZSH/.zsh_secrets"
[ -f "$ZSH/.zsh_plugins" ] && zsource "$ZSH/.zsh_plugins"
[ -f "$ZSH/.zsh_functions" ] && zsource "$ZSH/.zsh_functions"
[ -f "$ZSH/.zsh_aliases" ] && zsource "$ZSH/.zsh_aliases"
[ -f "$ZSH/.zsh_vi_mode_config" ] && zsource "$ZSH/.zsh_vi_mode_config"


# ==============================
# Basic ZSH Settings
# ==============================
setopt prompt_subst
# Optimize compinit: -C bypasses compaudit (security check, use if you trust your fpath)
autoload -U compinit && compinit -C -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-${(%):-%n}"

# Vi mode
# bindkey -v
# export KEYTIMEOUT=1

# Key Bindings
bindkey '^w' autosuggest-execute
# bindkey '^e' autosuggest-accept
bindkey '^e' accept-line
bindkey '^u' autosuggest-toggle
bindkey '^l' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
# bindkey "^[[A" history-search-backward
# bindkey "^[[B" history-search-forward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Load default LS_COLORS from dircolors
# if command -v dircolors &>/dev/null; then
#     eval "$(dircolors -b)"
# fi
#
export LS_COLORS="\
rs=0:\
di=38;5;66:\
ln=38;5;217:\
mh=38;5;103:\
pi=38;5;223:\
so=38;5;183:\
do=38;5;183:\
bd=38;5;223:\
cd=38;5;223:\
or=38;5;211:\
mi=38;5;211:\
su=38;5;189:\
sg=38;5;189:\
ca=38;5;146:\
tw=38;5;66:\
ow=38;5;66:\
st=38;5;66:\
ex=38;5;223:\
*.jpg=38;5;152:\
*.png=38;5;152:\
*.mp4=38;5;152:\
*.mp3=38;5;152:\
*.gz=38;5;183:\
*.tar=38;5;183:\
*.zip=38;5;183\
"

# ==============================
# Completion System
# ==============================
# Enable case-insensitive and partial-word matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Use LS_COLORS for file/directory colors in completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Enable menu selection for completions
zstyle ':completion:*' menu select

# Cache completions for faster performance (already set, but good to confirm)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/.zcompcache"

# Group completions by type
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B%F{blue}%d%f%b'

# Ignore case in completions
zstyle ':completion:*' ignore-case true

# Show hidden files in completions
zstyle ':completion:*' file-patterns '*(D)'

# ==============================
# FZF-Tab Configuration
# ==============================
# Disable sorting for specific commands
zstyle ':completion:*:git-checkout:*' sort false

# Format descriptions with group support
zstyle ':completion:*:descriptions' format '[%d]'

# Disable default completion menu (required for fzf-tab)
zstyle ':completion:*' menu no

# Use eza for directory previews in fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons=auto $realpath'

# Custom fzf flags for fzf-tab
zstyle ':fzf-tab:*' fzf-flags --color=fg:189,fg+:2 --height=80% --reverse --bind=tab:accept

# Make fzf-tab follow FZF_DEFAULT_OPTS
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Switch between fzf-tab groups using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'


# Preview files with bat
if command -v bat &>/dev/null; then
  zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath 2>/dev/null || ls --color $realpath'
else
  zstyle ':fzf-tab:complete:*:*' fzf-preview 'ls --color $realpath'
fi

# Preview environment variables
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# Preview processes for kill/pkill
zstyle ':fzf-tab:complete:(kill|pkill):*' \
  fzf-preview '
    if [[ "$word" =~ ^[0-9]+$ ]]; then
        ps --pid="$word" -o pid,cmd --no-headers
    else
        pgrep -af "$word" | head -n 20
    fi
  '

# Preview man pages
zstyle ':fzf-tab:complete:man:*' fzf-preview 'man $word | bat --color=always --style=plain --language=man'


# ==============================
# External Tool Initializations
# ==============================
# Initialize Zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# Initialize FZF
command -v fzf &>/dev/null && eval "$(fzf --zsh)"

# Theme
zsource "$ZSH/themes/rose-pine.zsh-theme" # Add this line

# Load Starship theme if available
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG=~/.config/starship/starship.toml
fi

# Load Powerlevel10k config
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ==============================
# External Environment Setups
# ==============================
# GHCup - Consider lazy loading if it's a bottleneck (check zprof)
[ -f "/home/bagi/.ghcup/env" ] && source "/home/bagi/.ghcup/env"

# SDKMAN is now lazy-loaded via the `sdk` function in .zsh_paths


# qutebrowser
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export QT_QPA_PLATFORM=wayland
else
    export QT_QPA_PLATFORM=xcb
fi

 (){
    echo "9wditiha"
}
