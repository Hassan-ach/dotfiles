# Herdr Config Cheat Sheet

Config file: `~/.config/herdr/config.toml`
Reload: `herdr server reload-config` or `prefix+shift+r`
Full default: `herdr --default-config`

---

## General

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `onboarding` | bool | `unset` | Show first-run setup. Set `false` after initial setup. |

---

## Theme

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `theme.name` | string | `"catppuccin"` | Built-in theme name |
| `theme.auto_switch` | bool | `false` | Follow terminal light/dark appearance |
| `theme.dark_name` | string | — | Theme for dark appearance |
| `theme.light_name` | string | — | Theme for light appearance |

### Built-in themes

`catppuccin` `terminal` `tokyo-night` `dracula` `nord` `gruvbox` `one-dark` `solarized` `kanagawa` `rose-pine` `vesper`

### Custom color overrides (`[theme.custom]`)

| Key | Type | Description |
|-----|------|-------------|
| `panel_bg` | color | Panel background (`reset` for transparent) |
| `accent` | color | Highlights, borders, navigation |
| `text` | color | Primary text |
| `subtext0` | color | Dimmed text |
| `surface0` | color | Surface level 0 |
| `surface1` | color | Surface level 1 |
| `surface_dim` | color | Dimmed surface |
| `overlay0` | color | Overlay level 0 |
| `overlay1` | color | Overlay level 1 |
| `red` | color | Error/destructive |
| `green` | color | Success |
| `yellow` | color | Warning |
| `blue` | color | Info |
| `teal` | color | Teal accent |
| `peach` | color | Peach accent |
| `mauve` | color | Mauve accent |

Color formats: `#RGB` `#RRGGBB` `rgb(r,g,b)` `reset` `default` `none` `transparent` or named colors (`cyan`, `blue`, etc.)

```toml
[theme]
name = "catppuccin"
auto_switch = true
dark_name = "catppuccin"
light_name = "catppuccin-latte"

[theme.custom]
accent = "#a6e3a1"
panel_bg = "reset"
```

---

## Terminal

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `terminal.default_shell` | string | `""` | Shell for new panes. Empty = `$SHELL` → `/bin/sh` |
| `terminal.shell_mode` | enum | `"auto"` | `"auto"` / `"login"` / `"non_login"` |
| `terminal.new_cwd` | enum | `"follow"` | `"follow"` / `"home"` / `"current"` / `"path"` |

---

## Updates

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `update.channel` | enum | `"stable"` | `"stable"` / `"preview"` |
| `update.version_check` | bool | `true` | Background version checks |
| `update.manifest_check` | bool | `true` | Background agent-detection manifest updates |

---

## Keybindings

Prefix key: `keys.prefix` (default: `"ctrl+b"`)

Key syntax: `prefix+n` (prefix mode), `ctrl+alt+n` (direct), `prefix+1..9` (range)

Accepted modifiers: `ctrl` `shift` `alt` `cmd` `super`
Accepted specials: `enter` `tab` `esc` `left` `right` `up` `down`
Named punctuation: `minus` `comma` `ampersand` `plus` `backtick`

### Prefix actions

| Key | Default | Description |
|-----|---------|-------------|
| `prefix` | `"ctrl+b"` | Enter prefix mode |
| `help` | `"prefix+?"` | Open keybinding help |
| `settings` | `"prefix+s"` | Open settings |
| `detach` | `"prefix+q"` | Detach / exit no-session mode |
| `reload_config` | `"prefix+shift+r"` | Reload config.toml |
| `open_notification_target` | `"prefix+o"` | Focus notification target |
| `toggle_sidebar` | `"prefix+b"` | Toggle sidebar collapse |

### Workspace keys

| Key | Default | Description |
|-----|---------|-------------|
| `workspace_picker` | `"prefix+w"` | Workspace navigation |
| `goto` | `"prefix+g"` | Session navigator |
| `new_workspace` | `"prefix+shift+n"` | Create workspace |
| `rename_workspace` | `"prefix+shift+w"` | Rename workspace |
| `close_workspace` | `"prefix+shift+d"` | Close workspace |
| `previous_workspace` | unset | Previous workspace |
| `next_workspace` | unset | Next workspace |
| `switch_workspace` | unset | Switch to workspace 1-9 |

### Worktree keys

| Key | Default | Description |
|-----|---------|-------------|
| `new_worktree` | `"prefix+shift+g"` | Create Git worktree |
| `open_worktree` | unset | Open existing worktree |
| `remove_worktree` | unset | Delete worktree checkout |

### Tab keys

| Key | Default | Description |
|-----|---------|-------------|
| `new_tab` | `"prefix+c"` | New tab |
| `rename_tab` | `"prefix+shift+t"` | Rename tab |
| `previous_tab` | `"prefix+p"` | Previous tab |
| `next_tab` | `"prefix+n"` | Next tab |
| `switch_tab` | `"prefix+1..9"` | Switch to tab 1-9 |
| `close_tab` | `"prefix+shift+x"` | Close tab |

### Pane focus keys

| Key | Default | Description |
|-----|---------|-------------|
| `focus_pane_left` | `"prefix+h"` | Focus pane left |
| `focus_pane_down` | `"prefix+j"` | Focus pane down |
| `focus_pane_up` | `"prefix+k"` | Focus pane up |
| `focus_pane_right` | `"prefix+l"` | Focus pane right |
| `cycle_pane_next` | `"prefix+tab"` | Cycle to next pane |
| `cycle_pane_previous` | `"prefix+shift+tab"` | Cycle to previous pane |
| `last_pane` | unset | Focus last pane (global) |

### Pane swap keys

| Key | Default | Description |
|-----|---------|-------------|
| `swap_pane_left` | `"prefix+shift+h"` | Swap pane left |
| `swap_pane_down` | `"prefix+shift+j"` | Swap pane down |
| `swap_pane_up` | `"prefix+shift+k"` | Swap pane up |
| `swap_pane_right` | `"prefix+shift+l"` | Swap pane right |

### Pane management keys

| Key | Default | Description |
|-----|---------|-------------|
| `split_vertical` | `"prefix+v"` | Split pane side-by-side |
| `split_horizontal` | `"prefix+minus"` | Split pane stacked |
| `close_pane` | `"prefix+x"` | Close pane |
| `zoom` | `"prefix+z"` | Toggle zoom / fullscreen |
| `resize_mode` | `"prefix+r"` | Enter resize mode |
| `rename_pane` | `"prefix+shift+p"` | Rename pane |
| `edit_scrollback` | `"prefix+e"` | Open scrollback in `$EDITOR` |
| `copy_mode` | `"prefix+["` | Enter keyboard copy mode |

### Agent keys

| Key | Default | Description |
|-----|---------|-------------|
| `previous_agent` | unset | Focus previous agent |
| `next_agent` | unset | Focus next agent |
| `focus_agent` | unset | Focus agent by index (e.g. `"prefix+alt+1..9"`) |

### Navigate mode keys (local to navigate mode, no `prefix+`)

| Key | Default | Description |
|-----|---------|-------------|
| `navigate_workspace_up` | `"up"` | Move workspace selection up |
| `navigate_workspace_down` | `"down"` | Move workspace selection down |
| `navigate_pane_left` | `"h"` | Focus pane left |
| `navigate_pane_down` | `"j"` | Focus pane down |
| `navigate_pane_up` | `"k"` | Focus pane up |
| `navigate_pane_right` | `"l"` | Focus pane right |

### Other keys

| Key | Default | Description |
|-----|---------|-------------|
| `remote_image_paste` | `"ctrl+v"` | Send clipboard image to remote session |

### Legacy indexed shortcuts (`[keys.indexed]`)

| Key | Default | Description |
|-----|---------|-------------|
| `tabs` | unset | Modifier for tab 1-9 (e.g. `"ctrl"`) |
| `workspaces` | unset | Modifier for workspace 1-9 (e.g. `"ctrl+shift"`) |
| `agents` | unset | Modifier for agent 1-9 (e.g. `"alt"`) |

### Custom command keybindings (`[[keys.command]]`)

```toml
[[keys.command]]
key = "prefix+alt+g"
type = "popup"          # "popup" | "pane" | "shell" | "plugin_action"
command = "lazygit"
description = "run lazygit"
width = "80%"           # terminal cells or percentage
height = "80%"
```

- `popup` — session-modal popup, closes on exit
- `pane` — temporary zoomed pane, closes on exit
- `shell` — runs detached in background
- `plugin_action` — invoke installed plugin action

Env vars available: `HERDR_SOCKET_PATH` `HERDR_BIN_PATH` `HERDR_ACTIVE_WORKSPACE_ID` `HERDR_ACTIVE_TAB_ID` `HERDR_ACTIVE_PANE_ID` `HERDR_ACTIVE_PANE_CWD`

### Multiple bindings per action

```toml
[keys]
next_tab = ["prefix+n", "ctrl+alt+]"]
```

### Reset to defaults

```bash
herdr config reset-keys
```

---

## Worktrees

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `worktrees.directory` | string | `"~/.herdr/worktrees"` | Root dir for `<repo>/<branch-slug>` checkouts |

---

## UI and Sidebar

### Sizing

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `ui.sidebar_width` | int | `26` | Default sidebar width (columns) |
| `ui.sidebar_min_width` | int | `18` | Min sidebar width when expanded |
| `ui.sidebar_max_width` | int | `36` | Max sidebar width when expanded |
| `ui.sidebar_start_collapsed` | bool | `false` | Start with sidebar collapsed |
| `ui.sidebar_collapsed_mode` | enum | `"compact"` | `"compact"` (narrow rail) or `"hidden"` (zero width) |
| `ui.mobile_width_threshold` | int | `64` | Width at which mobile layout activates |

### Mouse

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `ui.mouse_capture` | bool | `true` | Capture mouse for Herdr UI |
| `ui.copy_on_select` | bool | `true` | Auto-copy mouse drag selection |
| `ui.mouse_scroll_lines` | int | `3` | Lines per mouse wheel notch |
| `ui.right_click_passthrough_modifier` | string | `""` | Modifier to forward right-click to panes (e.g. `"ctrl"`, `"alt"`) |

### Cursor

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `ui.host_cursor` | enum | `"auto"` | `"auto"` / `"native"` / `"drawn"` |
| `ui.redraw_on_focus_gained` | bool | `true` | Full redraw on terminal focus |

### Panes and tabs

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `ui.pane_borders` | bool | `true` | Draw borders around split panes |
| `ui.pane_gaps` | bool | `true` | Keep panes visually separated |
| `ui.show_agent_labels_on_pane_borders` | bool | `false` | Show agent names in pane borders |
| `ui.hide_tab_bar_when_single_tab` | bool | `false` | Hide tab row when only one tab |
| `ui.confirm_close` | bool | `true` | Confirm before closing workspace |
| `ui.prompt_new_tab_name` | bool | `true` | Ask for tab name before creation |
| `ui.prompt_new_workspace_name` | bool | `false` | Ask for workspace name before creation |

### Agent panel ordering

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `ui.agent_panel_sort` | enum | `"spaces"` | `"spaces"` (grouped) or `"priority"` (attention queue) |

### Accent color

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `ui.accent` | color | `"cyan"` | Accent for highlights, borders, nav UI |

### Sidebar row layouts

Agent tokens: `state_icon` `state_text` `workspace` `tab` `pane` `agent` `terminal_title` `terminal_title_stripped` `$name`

Space tokens: `state_icon` `state_text` `workspace` `branch` `git_status` `$name`

```toml
[ui.sidebar.agents]
row_gap = 0
rows = [
  ["state_icon", "workspace", "tab"],
  ["agent"],
]

[ui.sidebar.agents.rows_by_agent]
claude = [
  ["state_icon", "workspace", "tab"],
  ["terminal_title_stripped"],
  ["agent"],
]

[ui.sidebar.spaces]
row_gap = 0
rows = [
  ["state_icon", "workspace"],
  ["branch", "git_status"],
]
```

Inline token styling:

```toml
rows = [
  ["state_icon", { token = "workspace", fg = "#89b4fa", bold = true }, "tab"],
]
```

- Max 16 rows, max 16 tokens per row
- `fg` accepts `#RGB` or `#RRGGBB`
- `bold` and `dim` are booleans

---

## Notifications

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `ui.toast.delivery` | enum | `"off"` | `"off"` / `"herdr"` / `"terminal"` / `"system"` |
| `ui.toast.delay_seconds` | int | `1` | Seconds before sending notification (0–3600) |
| `ui.toast.herdr.position` | enum | `"bottom-right"` | `"top-left"` / `"top-right"` / `"bottom-left"` / `"bottom-right"` |
| `ui.toast.clipboard.enabled` | bool | `true` | Show clipboard copy popup |
| `ui.toast.clipboard.position` | enum | `"bottom-center"` | All 6 positions available |

---

## Sound

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `ui.sound.enabled` | bool | `true` | Play sounds on agent state change |
| `ui.sound.path` | path | — | MP3 for all notifications |
| `ui.sound.done_path` | path | — | MP3 for "done" notifications |
| `ui.sound.request_path` | path | — | MP3 for "needs input" notifications |

### Per-agent sound overrides (`[ui.sound.agents]`)

Values: `"default"` / `"on"` / `"off"`

| Agent | Default |
|-------|---------|
| `pi` | `"default"` |
| `claude` | `"default"` |
| `codex` | `"default"` |
| `gemini` | `"default"` |
| `cursor` | `"default"` |
| `devin` | `"default"` |
| `cline` | `"default"` |
| `opencode` | `"default"` |
| `github_copilot` | `"default"` |
| `kimi` | `"default"` |
| `kiro` | `"default"` |
| `droid` | `"off"` |
| `amp` | `"default"` |
| `grok` | `"default"` |
| `hermes` | `"default"` |
| `kilo` | `"default"` |
| `qodercli` | `"default"` |
| `agy` | `"default"` |
| `maki` | `"default"` |

---

## Session

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `session.resume_agents_on_restore` | bool | `true` | Resume native agent sessions after server restart |

---

## Remote

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `remote.manage_ssh_config` | bool | `true` | Add keepalive + connection reuse for `herdr --remote` |

---

## Advanced

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `advanced.scrollback_limit_bytes` | int | `10000000` | Max scrollback buffer per pane (bytes) |

---

## Experimental

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `experimental.allow_nested` | bool | `false` | Allow herdr inside herdr |
| `experimental.kitty_graphics` | bool | `false` | Kitty graphics rendering |
| `experimental.pane_history` | bool | `false` | Save pane screen history across restarts |
| `experimental.reveal_hidden_cursor_for_cjk_ime` | bool | `false` | Expose cursor for macOS IME tracking |
| `experimental.cjk_ime_agents` | list | `[]` | Restrict IME cursor reveal to these agents |
| `experimental.cjk_ime_cursor_shape` | enum | `"steady_block"` | `"block"` / `"steady_block"` / `"underline"` / `"steady_underline"` / `"bar"` / `"steady_bar"` |
| `experimental.switch_ascii_input_source_in_prefix` | bool | `false` | Switch to ASCII layout during prefix (macOS) |

Accepted agent names for `cjk_ime_agents`:
`pi` `claude` `codex` `gemini` `cursor` `devin` `cline` `opencode` `copilot` `kimi` `kiro` `droid` `amp` `grok` `hermes` `kilo` `qodercli` `qoder` `maki`

---

## Environment Variables

| Variable | Purpose |
|----------|---------|
| `HERDR_CONFIG_PATH` | Override config file path |
| `HERDR_SESSION` | Select named session for CLI commands |
| `HERDR_SOCKET_PATH` | Low-level socket path override |
| `HERDR_LOG` | Log filtering (e.g. `HERDR_LOG=herdr=debug`) |
| `HERDR_DISABLE_SOUND` | Disable sound playback |

---

## Integrations

```bash
herdr integration install pi
herdr integration install opencode
herdr integration install claude
herdr integration install codex
herdr integration install copilot
herdr integration install devin
herdr integration install droid
herdr integration install kimi
herdr integration install kilo
herdr integration install hermes
herdr integration install omp
herdr integration install qodercli
herdr integration install cursor
```

Check status: `herdr integration status`
Uninstall: `herdr integration uninstall <agent>`

---

## Useful Commands

```bash
herdr                          # Launch / attach
herdr --default-config         # Print full default config
herdr config check             # Validate config.toml
herdr config reset-keys        # Reset keybindings to defaults
herdr server reload-config     # Hot-reload config
herdr server stop              # Stop server
herdr status                   # Show client/server status
herdr agent list               # List known agents
herdr update                   # Update herdr
herdr update --handoff         # Update with live handoff
herdr channel set stable       # Switch to stable channel
herdr channel set preview      # Switch to preview channel
```

## Log Files

```
~/.config/herdr/herdr.log
~/.config/herdr/herdr-client.log
~/.config/herdr/herdr-server.log
```
