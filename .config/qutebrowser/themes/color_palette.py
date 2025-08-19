# vim: fileencoding = utf-8: foldmethod = marker

# Rosé Pine theme for qutebrowser
# Adapted from rose-pine/rose-pine-theme (GitHub)
# Supports rose-pine, rose-pine-moon, rose-pine-dawn, and default themes

def setup(c, variant, samecolorrows=False):
    # Palette {{{
    palette = {}
    if variant == "rp":
        palette = {
            "Base": "#191724",         # Dark background
            "Surface": "#1f1d2e",      # Secondary dark background
            "Overlay": "#26233a",      # Tertiary dark background
            "Muted": "#6e6a86",        # Low contrast foreground
            "Subtle": "#908caa",       # Medium contrast foreground
            "Text": "#e0def4",         # High contrast text
            "Love": "#eb6f92",         # Red accent (errors)
            "Gold": "#f6c177",         # Yellow accent (warnings)
            "Rose": "#ebbcba",         # Cyan accent (links)
            "Pine": "#31748f",         # Green accent
            "Foam": "#9ccfd8",         # Blue accent
            "Iris": "#c4a7e7",         # Magenta accent
            "HighlightLow": "#21202e",  # Low highlight
            "HighlightMed": "#403d52",  # Medium highlight
            "HighlightHigh": "#524f67"  # High highlight
        }
    elif variant == "rpm":
        palette = {
            "Base": "#232136",
            "Surface": "#2a273f",
            "Overlay": "#393552",
            "Muted": "#6e6a86",
            "Subtle": "#908caa",
            "Text": "#e0def4",
            "Love": "#eb6f92",
            "Gold": "#f6c177",
            "Rose": "#ea9a97",
            "Pine": "#3e8fb0",
            "Foam": "#9ccfd8",
            "Iris": "#c4a7e7",
            "HighlightLow": "#2a283e",
            "HighlightMed": "#44415a",
            "HighlightHigh": "#56526e"
        }
    elif variant == "rpd":
        palette = {
            "Base": "#faf4ed",
            "Surface": "#fffaf3",
            "Overlay": "#f2e9e1",
            "Muted": "#9893a5",
            "Subtle": "#797593",
            "Text": "#575279",
            "Love": "#b4637a",
            "Gold": "#ea9d34",
            "Rose": "#d7827e",
            "Pine": "#286983",
            "Foam": "#56949f",
            "Iris": "#907aa9",
            "HighlightLow": "#f4ede8",
            "HighlightMed": "#dfdad9",
            "HighlightHigh": "#cecacd"
        }
    else:  # default theme
        palette = {
            "Base": "#ffffff",         # White background
            "Surface": "#f5f5f5",      # Light gray secondary background
            "Overlay": "#e0e0e0",      # Medium gray for UI elements
            "Muted": "#666666",        # Muted gray for low contrast
            "Subtle": "#333333",       # Darker gray for medium contrast
            "Text": "#000000",         # Black text for high contrast
            "Love": "#d70000",         # Red for errors
            "Gold": "#ff9900",         # Orange for warnings
            "Rose": "#0055ff",         # Blue for links
            "Pine": "#008000",         # Green for indicators
            "Foam": "#00aaff",         # Light blue for highlights
            "Iris": "#9900cc",         # Purple for accents
            "HighlightLow": "#f0f0f0",  # Light gray highlight
            "HighlightMed": "#d0d0d0",  # Medium gray highlight
            "HighlightHigh": "#b0b0b0"  # Darker gray highlight
        }
    # }}}

    # Completion {{{
    c.colors.completion.category.bg = palette["Base"]
    c.colors.completion.category.border.bottom = palette["Surface"]
    c.colors.completion.category.border.top = palette["Overlay"]
    c.colors.completion.category.fg = palette["Love"]
    if samecolorrows:
        c.colors.completion.even.bg = palette["HighlightLow"]
        c.colors.completion.odd.bg = c.colors.completion.even.bg
    else:
        c.colors.completion.even.bg = palette["HighlightLow"]
        c.colors.completion.odd.bg = palette["HighlightMed"]
    c.colors.completion.fg = palette["Text"]
    c.colors.completion.item.selected.bg = palette["HighlightMed"]
    c.colors.completion.item.selected.border.bottom = palette["Surface"]
    c.colors.completion.item.selected.border.top = palette["Surface"]
    c.colors.completion.item.selected.fg = palette["Text"]
    c.colors.completion.item.selected.match.fg = palette["Rose"]
    c.colors.completion.match.fg = palette["Text"]
    c.colors.completion.scrollbar.bg = palette["Overlay"]
    c.colors.completion.scrollbar.fg = palette["Surface"]
    # }}}

    # Statusbar {{{
    c.colors.statusbar.normal.bg = palette["Base"]
    c.colors.statusbar.insert.bg = palette["Base"]
    c.colors.statusbar.command.bg = palette["Base"]
    c.colors.statusbar.caret.bg = palette["Base"]
    c.colors.statusbar.caret.selection.bg = palette["Base"]
    c.colors.statusbar.passthrough.bg = palette["Surface"]
    c.colors.statusbar.private.bg = palette["Love"]
    c.colors.statusbar.progress.bg = palette["Foam"]
    c.colors.statusbar.normal.fg = palette["Rose"]
    c.colors.statusbar.insert.fg = palette["Pine"]
    c.colors.statusbar.command.fg = palette["Love"]
    c.colors.statusbar.passthrough.fg = palette["Subtle"]
    c.colors.statusbar.caret.fg = palette["Overlay"]
    c.colors.statusbar.caret.selection.fg = palette["Iris"]
    c.colors.statusbar.private.fg = palette["HighlightMed"]
    c.colors.statusbar.url.error.fg = palette["Gold"]
    c.colors.statusbar.url.fg = palette["Text"]
    c.colors.statusbar.url.hover.fg = palette["Gold"]
    c.colors.statusbar.url.success.http.fg = palette["Subtle"]
    c.colors.statusbar.url.success.https.fg = palette["Subtle"]
    c.colors.statusbar.url.warn.fg = palette["Gold"]
    # }}}

    # Tabs {{{
    c.colors.tabs.bar.bg = palette["Base"]
    c.colors.tabs.even.bg = palette["Base"]
    c.colors.tabs.odd.bg = palette["Base"]
    c.colors.tabs.even.fg = palette["Subtle"]
    c.colors.tabs.odd.fg = palette["Subtle"]
    c.colors.tabs.selected.even.bg = palette["HighlightMed"]
    c.colors.tabs.selected.odd.bg = palette["HighlightMed"]
    c.colors.tabs.selected.even.fg = palette["Text"]
    c.colors.tabs.selected.odd.fg = palette["Text"]
    c.colors.tabs.indicator.error = palette["Gold"]
    c.colors.tabs.indicator.start = palette["Pine"]
    c.colors.tabs.indicator.stop = palette["Rose"]
    c.colors.tabs.pinned.even.fg = palette["Subtle"]
    c.colors.tabs.pinned.even.bg = palette["Overlay"]
    c.colors.tabs.pinned.odd.fg = palette["Subtle"]
    c.colors.tabs.pinned.odd.bg = palette["Overlay"]
    c.colors.tabs.pinned.selected.even.fg = palette["Text"]
    c.colors.tabs.pinned.selected.even.bg = palette["HighlightMed"]
    c.colors.tabs.pinned.selected.odd.fg = palette["Text"]
    c.colors.tabs.pinned.selected.odd.bg = palette["HighlightMed"]
    # }}}

    # Background color of webpages {{{
    c.colors.webpage.bg = palette["Base"]
    # }}}

    # Context menu {{{
    c.colors.contextmenu.menu.bg = palette["Surface"]
    c.colors.contextmenu.menu.fg = palette["Text"]
    c.colors.contextmenu.disabled.bg = palette["Muted"]
    c.colors.contextmenu.disabled.fg = palette["Text"]
    c.colors.contextmenu.selected.bg = palette["Rose"]
    c.colors.contextmenu.selected.fg = palette["Base"]
    # }}}

    # Keyhints {{{
    c.colors.keyhint.bg = palette["Surface"]
    c.colors.keyhint.fg = palette["Text"]
    c.colors.keyhint.suffix.fg = palette["Rose"]
    c.colors.hints.bg = palette["Love"]
    c.colors.hints.fg = palette["Text"]
    c.colors.hints.match.fg = palette["Rose"]
    c.hints.border = f"1px solid {palette['Overlay']}"
    # }}}

    # Downloads {{{
    c.colors.downloads.bar.bg = palette["Base"]
    c.colors.downloads.error.bg = palette["Base"]
    c.colors.downloads.start.bg = palette["Base"]
    c.colors.downloads.stop.bg = palette["Base"]
    c.colors.downloads.error.fg = palette["Gold"]
    c.colors.downloads.start.fg = palette["Pine"]
    c.colors.downloads.stop.fg = palette["Rose"]
    c.colors.downloads.system.fg = "none"
    c.colors.downloads.system.bg = "none"
    # }}}

    # Prompts {{{
    c.colors.prompts.bg = palette["Surface"]
    c.colors.prompts.border = palette["Subtle"]
    c.colors.prompts.fg = palette["Text"]
    c.colors.prompts.selected.bg = palette["Overlay"]
    c.colors.prompts.selected.fg = palette["Text"]
    # }}}

    # Error, info and warning messages {{{
    c.colors.messages.error.bg = palette["Surface"]
    c.colors.messages.error.border = palette["Surface"]
    c.colors.messages.error.fg = palette["Text"]
    c.colors.messages.info.bg = palette["Surface"]
    c.colors.messages.info.border = palette["Surface"]
    c.colors.messages.info.fg = palette["Gold"]
    c.colors.messages.warning.bg = palette["Surface"]
    c.colors.messages.warning.border = palette["Surface"]
    c.colors.messages.warning.fg = palette["Gold"]
    # }}}

