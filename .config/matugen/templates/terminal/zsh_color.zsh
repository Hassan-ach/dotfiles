# ==============================
# ZSH Prompt Theme - Matugen
# ==============================

autoload -Uz colors && colors

# Define Rosé Pine colors for Zsh's %F{color} syntax
# Using placeholders for dynamic color injection
local RP_BASE="%F{{colors.base.default.hex}}"
local RP_SURFACE="%F{{colors.surface.default.hex}}"
local RP_OVERLAY="%F{{colors.overlay.default.hex}}"
local RP_MUTED="%F{{colors.muted.default.hex}}"
local RP_SUBTLE="%F{{colors.subtle.default.hex}}"
local RP_TEXT="%F{{colors.text.default.hex}}"

# Accent colors
local RP_LOVE="%F{{colors.love.default.hex}}"
local RP_GOLD="%F{{colors.gold.default.hex}}"
local RP_ROSE="%F{{colors.rose.default.hex}}"
local RP_PINE="%F{{colors.pine.default.hex}}"
local RP_FOAM="%F{{colors.foam.default.hex}}"
local RP_IRIS="%F{{colors.iris.default.hex}}"

# Highlight colors
local RP_HIGHLIGHT_LOW="%F{{colors.highlight_low.default.hex}}"
local RP_HIGHLIGHT_MED="%F{{colors.highlight_medium.default.hex}}"
local RP_HIGHLIGHT_HIGH="%F{{colors.highlight_high.default.hex}}"

# Git prompt function (example, adjust as desired)
function git_prompt() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  local ref=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always)
  echo "${RP_PINE}(${ref})${RP_TEXT}" # Pine for branch, Text for surrounding
}

setopt PROMPT_SUBST # Enable substitution in prompt strings
# Example prompt using Rosé Pine colors
PROMPT="${RP_MUTED}%1~${RP_TEXT}$(git_prompt) ${RP_ROSE}❯${RP_TEXT} "
