# qutebrowser configuration file
# Location: ~/.config/qutebrowser/config.py
# Documentation: qute://help/configuring.html, qute://help/settings.html

# =============================================================================
# IMPORTS AND SETUP
# =============================================================================

# Disable pylint errors for specific variables and imports
# pylint: disable=C0111
import os
from themes import color_palette  # Import color palette for theme setup

c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# Source external theme selection script 
config.source('themes/select_theme.py')

# =============================================================================
# GENERAL SETTINGS
# =============================================================================

# Load autoconfig (GUI settings) - Set to False to ensure this file overrides GUI changes
config.load_autoconfig(False)

# Automatically save browser session on exit to restore tabs on next launch
c.auto_save.session = True

# Prompt to quit if downloads are active
c.confirm_quit = ['downloads']

# Spellcheck languages
# config.set('spellcheck.languages', ["en-US", "fr-FR"])

# =============================================================================
# DOWNLOADS
# =============================================================================

# Set default download directory to ~/Downloads
c.downloads.location.directory = '~/Downloads'

# Set duration to remove finished Downloads
c.downloads.remove_finished = 20*1000

# Disable download location prompt for automatic downloads
c.downloads.location.prompt = False

# =============================================================================
# SCROLLING
# =============================================================================

# Enable smooth scrolling for a better browsing experience
c.scrolling.smooth = True

# Show scrollbar only when searching
c.scrolling.bar = 'when-searching'

# =============================================================================
# TABS CONFIGURATION
# =============================================================================

# Show tab bar only when multiple tabs are open
c.tabs.show = 'multiple'

# Format tab titles to show audio indicator and page title
c.tabs.title.format = "{audio}{current_title}"

# Close browser when the last tab is closed
c.tabs.last_close = 'close'

# =============================================================================
# FONTS
# =============================================================================

# Default font settings
c.fonts.default_size = '12pt'
c.fonts.default_family = ['Iosevka Term Nerd Font', 'monospace']

# Web fonts
c.fonts.web.family.standard = 'Iosevka Term Nerd Font'
c.fonts.web.family.sans_serif = 'Iosevka Term Nerd Font'
c.fonts.web.family.serif = 'Iosevka Term Nerd Font'

# Interface fonts
c.fonts.completion.entry = '12pt Iosevka Term Nerd Font'
c.fonts.statusbar = '12pt Iosevka Term Nerd Font'
c.fonts.tabs.selected = '12pt Iosevka Term Nerd Font'
c.fonts.tabs.unselected = '12pt Iosevka Term Nerd Font'

# =============================================================================
# APPEARANCE & DARK MODE
# =============================================================================

# Enable dark mode for websites that support it
c.colors.webpage.darkmode.enabled = True

# Configure dark mode settings
c.colors.webpage.darkmode.policy.images = 'never'  # Smart image handling
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'  # Use CIELAB algorithm

# Disable dark mode for local files
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# =============================================================================
# COMPLETION MENU
# =============================================================================

# Categories to include in the completion menu
c.completion.open_categories = [
    'searchengines',
    'quickmarks',
    'bookmarks',
    'history',
    'filesystem'
]

# =============================================================================
# SEARCH ENGINES
# =============================================================================

# Define custom search engines with prefixes
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    '!g': 'https://www.google.com/search?q={}',
    '!gh': 'https://github.com/search?q={}',
    '!so': 'https://stackoverflow.com/search?q={}',
    '!aw': 'https://wiki.archlinux.org/?search={}',
    '!re': 'https://www.reddit.com/r/{}',
    '!yt': 'https://www.youtube.com/results?search_query={}',
    '!wiki': 'https://en.wikipedia.org/wiki/{}',
    '!mdn': 'https://developer.mozilla.org/en-US/search?q={}',
    '!py': 'https://docs.python.org/3/search.html?q={}',
    '!npm': 'https://www.npmjs.com/search?q={}',
    '!am': 'https://www.amazon.com/s?k={}',
    '!tr': 'https://translate.google.com/?sl=en&tl=ar&text={}&op=translate'
}

# Set default start page to DuckDuckGo
c.url.default_page = 'https://duckduckgo.com/'

# =============================================================================
# EXTERNAL EDITOR
# =============================================================================

# Use Neovim as the external editor for text fields
# c.editor.command = ["kitty", "-e", "nvim", "{}"]

# =============================================================================
# PERFORMANCE TWEAKS
# =============================================================================

# Configure Qt arguments for performance optimization
c.qt.args = [
    'enable-gpu-rasterization',
    'webengine-max-cache=52428800'
]

# Enable DNS prefetching to reduce network overhead
c.content.dns_prefetch = True

# =============================================================================
# PRIVACY AND SECURITY
# =============================================================================

# Ad-blocking configuration
c.content.blocking.enabled = True
c.content.blocking.method = 'both'

# Configure adblock filter lists
c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
]

# Privacy settings
c.content.cookies.accept = 'no-3rdparty'  # Block third-party cookies
c.content.headers.do_not_track = True     # Send Do Not Track header
c.content.webgl = False                   # Disable WebGL for security

# =============================================================================
# SITE-SPECIFIC CONFIGURATIONS
# =============================================================================

# Developer tools fixes
dev_tools_sites = ['chrome-devtools://*', 'devtools://*']
internal_sites = ['chrome://*/*', 'qute://*/*']

for site in dev_tools_sites:
    config.set('content.cookies.accept', 'all', site)
    config.set('content.images', True, site)
    config.set('content.javascript.enabled', True, site)

for site in internal_sites:
    config.set('content.javascript.enabled', True, site)

# User agents for problematic sites
firefox_ua = 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0'
chrome_ua = 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36'
webkit_ua = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'

# Google services require Firefox user agent
google_sites = [
    'https://accounts.google.com/*',
    'https://docs.google.com/*',
    'https://drive.google.com/*'
]

for site in google_sites:
    config.set('content.headers.user_agent', firefox_ua, site)

# WhatsApp Web
config.set('content.headers.user_agent', webkit_ua, 'https://web.whatsapp.com/')

# Slack
config.set('content.headers.user_agent', chrome_ua, 'https://*.slack.com/*')

# =============================================================================
# THEME CONFIGURATION
# =============================================================================

# Apply Rosé Pine theme using the imported color palette
color_palette.setup(c, 'rp', True)

# =============================================================================
# KEY BINDINGS
# =============================================================================

# Configuration and interface toggles
config.bind('cs', 'cmd-set-text -s :config-source')  # Reload config file
config.bind('xt', 'config-cycle tabs.show multiple never')  # Toggle tab bar
config.bind('xb', 'config-cycle statusbar.show always never')  # Toggle status bar
config.bind('xx', 'config-cycle statusbar.show always never ;; config-cycle tabs.show multiple never')  # Toggle both
config.bind('\\t', 'config-cycle tabs.position top left')  # Toggle tab bar position

# Navigation and tab management
config.bind('T', 'hint links tab')  # Open links in new tab with hints
config.bind('t', 'cmd-set-text -s :tab-focus')  # Focus specific tab

# Theme selection
config.bind(',t', 'cmd-set-text -s :select-theme')  # Select theme
config.bind(',,dr', 'config-cycle colors.webpage.darkmode.enabled True false')  # Toggle dark mode

# CSS stylesheet cycling (Solarized Everything CSS)
# c.content.user_stylesheets = ["~/.config/qutebrowser/themes/custom-font.css"] 
config.bind(',fc', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/themes/custom-font.css ""')
config.bind(',ap', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/apprentice/apprentice-all-sites.css ~/.config/qutebrowser/themes/custom-font.css')
config.bind(',dr', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/darculized/darculized-all-sites.css ~/.config/qutebrowser/themes/custom-font.css')
config.bind(',gr', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ~/.config/qutebrowser/themes/custom-font.css')
config.bind(',sd', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css ~/.config/qutebrowser/themes/custom-font.css')
config.bind(',sl', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css ~/.config/qutebrowser/themes/custom-font.css')
config.bind(',rp', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/rosepine/rosepine-all-sites.css ~/.config/qutebrowser/themes/custom-font.css')

# Media and external tools
config.bind('M', 'hint links spawn mpv {hint-url}')  
config.bind('A', 'hint links spawn mpv --no-video {hint-url}')  

# Security and cleanup
config.bind('<Ctrl-Shift-Delete>', 'clear-cookies;; clear-keychain')  # Clear cookies and keychain

# Password management (qute-pass)
PASS_GPG_ID = os.getenv('PASS_GPG_ID')
if PASS_GPG_ID:
    config.bind('<z><a>', f'spawn --userscript qute-pass --add --gpg-id {PASS_GPG_ID}')
config.bind('<z><l>', 'spawn --userscript qute-pass')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --password-only')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only')

# Youtube watch in mpv

# Youtube Video and PlayList Downloads
config.bind('<z><v>', 'spawn --userscript ytdlp-single {url}')
config.bind('<z><p><d>', 'spawn --userscript ytdlp-playlist {url}')
