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
