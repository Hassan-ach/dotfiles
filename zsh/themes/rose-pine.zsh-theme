# ==============================
# ZSH Prompt Theme - Rosé Pine
# ==============================

autoload -Uz colors && colors

# LS colors and such (8-bit color) - You might want to adjust these or let your terminal handle them
# These are often set by your terminal emulator's theme, but can be overridden.
# For a true Rosé Pine experience, ensure your terminal emulator (e.g., Alacritty, Kitty, iTerm2)
# is also set to a Rosé Pine theme.
export CLICOLOR=1
# LSCOLORS is for 8-bit ANSI colors. For 24-bit true color, LS_COLORS is more relevant.
# If using eza, it handles its own colors based on its config or LS_COLORS.
# export LSCOLORS="Gxfxcxdxbxegedabagacad" # Example, adjust as needed for your preference

# Define Rosé Pine colors for Zsh's %F{color} syntax
# Using 24-bit true colors (RGB hex) for best fidelity
# Note: Your terminal must support 24-bit true colors for these to render correctly.
# If not, Zsh will try to approximate with 256-color or 8-color palette.

# Base colors
local RP_BASE="%F{#191724}"
local RP_SURFACE="%F{#1f1d2e}"
local RP_OVERLAY="%F{#26233a}"
local RP_MUTED="%F{#6e6a86}"
local RP_SUBTLE="%F{#908caa}"
local RP_TEXT="%F{#e0def4}"

# Accent colors
local RP_LOVE="%F{#eb6f92}"
local RP_GOLD="%F{#f6c177}"
local RP_ROSE="%F{#ebbcba}"
local RP_PINE="%F{#31748f}"
local RP_FOAM="%F{#9ccfd8}"
local RP_IRIS="%F{#c4a7e7}"

# Highlight colors
local RP_HIGHLIGHT_LOW="%F{#21202e}"
local RP_HIGHLIGHT_MED="%F{#403d52}"
local RP_HIGHLIGHT_HIGH="%F{#524f67}"


# Git prompt function (example, adjust as desired)
function git_prompt() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  local ref=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always)
  echo "${RP_PINE}(${ref})${RP_TEXT}" # Pine for branch, Text for surrounding
}

setopt PROMPT_SUBST # Enable substitution in prompt strings
# Example prompt using Rosé Pine colors
# Adjust this PROMPT line to your desired layout and information
PROMPT="${RP_MUTED}%1~${RP_TEXT}$(git_prompt) ${RP_ROSE}❯${RP_TEXT} "

# You can also define RPROMPT (right prompt)
# RPROMPT=" ${RP_FOAM}%*${RP_TEXT}" # Current time in Foam color
