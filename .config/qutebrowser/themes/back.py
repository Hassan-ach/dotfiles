# palette.py

def get_palette(variant):
    if variant == "rp":
        return {
            "Base": "#191724",
            "Surface": "#1f1d2e",
            "Overlay": "#26233a",
            "Muted": "#6e6a86",
            "Subtle": "#908caa",
            "Text": "#e0def4",
            "Love": "#eb6f92",
            "Gold": "#f6c177",
            "Rose": "#ebbcba",
            "Pine": "#31748f",
            "Foam": "#9ccfd8",
            "Iris": "#c4a7e7",
            "HighlightLow": "#21202e",
            "HighlightMed": "#403d52",
            "HighlightHigh": "#524f67"
        }
    elif variant == "rpm":
        return {
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
        return {
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
        return {
            "Base": "#ffffff",
            "Surface": "#f5f5f5",
            "Overlay": "#e0e0e0",
            "Muted": "#666666",
            "Subtle": "#333333",
            "Text": "#000000",
            "Love": "#d70000",
            "Gold": "#ff9900",
            "Rose": "#0055ff",
            "Pine": "#008000",
            "Foam": "#00aaff",
            "Iris": "#9900cc",
            "HighlightLow": "#f0f0f0",
            "HighlightMed": "#d0d0d0",
            "HighlightHigh": "#b0b0b0"
        }

