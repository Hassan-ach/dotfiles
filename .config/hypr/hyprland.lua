scripts = "~/.config/hypr/scripts"
mainMod = "SUPER"
terminal = "kitty"
menu = "rofi"
browser = "brave"
discord = "vesktop"
lockBg = "~/.local/bin/random-lock-bg.sh"
screenShot = "hyprshot -m"
waybarToggle = "~/.local/bin/waybarToggle.sh"
wallset = "~/.local/bin/wallset"

require("env")
require("colors")
require("monitors")
require("variables")
require("inputs")
require("animations")
require("gestures")
require("keybinds")
require("rules")
require("startup")
