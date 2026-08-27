# ==============================
# Main ZSH Configuration
# ==============================

export ZSH="$HOME/dotfiles/zsh"

# Compile and source Zsh scripts for faster loading
zsource() {
  local file=$1
  local zwc="${file}.zwc"
  if [[ -f "$file" && ( ! -f "$zwc" || "$file" -nt "$zwc" ) ]]; then
    zcompile "$file"
  fi
  source "$file"
}

# ==============================
# Shell behaviour
# ==============================
setopt AUTOCD NOBEEP NUMERIC_GLOB_SORT
export FUNCNEST=100
export VIRTUAL_ENV_DISABLE_PROMPT=1
export GPG_TTY=$(tty)

# ==============================
# Environment & Helpers
# ==============================
zsource "$ZSH/.zsh_paths"
zsource "$ZSH/.zsh_secrets"
zsource "$ZSH/.zsh_fzf"

# ==============================
# Completion (before plugins: fzf-tab requires compinit)
# ==============================
autoload -Uz compinit && compinit -C -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-${(%):-%n}"
command -v eza &>/dev/null && compdef eza=ls

zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/.zcompcache"

# ==============================
# Modular Config Files
# ==============================
zsource "$ZSH/.zsh_plugins"
zsource "$ZSH/.zsh_functions"
zsource "$ZSH/.zsh_aliases"
zsource "$ZSH/.zsh_vi_mode_config"

# ==============================
# External Tools
# ==============================
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v fzf &>/dev/null && eval "$(fzf --zsh)"
command -v starship &>/dev/null && eval "$(starship init zsh)"

# ==============================
# Machine-Specific Env
# ==============================
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
