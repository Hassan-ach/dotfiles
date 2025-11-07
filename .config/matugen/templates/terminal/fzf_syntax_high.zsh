# ZSH Syntax Highlighting - Set highlighting styles dynamically
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg:{{colors.foam.default.hex}},bold' # Foam
ZSH_HIGHLIGHT_STYLES[builtin]='fg:{{colors.foam.default.hex}}'      # Foam
ZSH_HIGHLIGHT_STYLES[function]='fg:{{colors.foam.default.hex}}'     # Foam
ZSH_HIGHLIGHT_STYLES[alias]='fg:{{colors.iris.default.hex}},bold'   # Iris
ZSH_HIGHLIGHT_STYLES[path]='fg:{{colors.gold.default.hex}}'         # Gold
ZSH_HIGHLIGHT_STYLES[globbing]='fg:{{colors.love.default.hex}}'     # Love
ZSH_HIGHLIGHT_STYLES[default]='fg:{{colors.text.default.hex}}'      # Text
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg:{{colors.love.default.hex}}' # Love (for errors)
ZSH_HIGHLIGHT_STYLES[command-separator]='fg:{{colors.muted.default.hex}}' # Muted
ZSH_HIGHLIGHT_STYLES[redirection]='fg:{{colors.pine.default.hex}}'  # Pine
ZSH_HIGHLIGHT_STYLES[comment]='fg:{{colors.muted.default.hex}}'      # Muted
