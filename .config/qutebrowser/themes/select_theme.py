# Script to prompt for theme selection (rose-pine, rose-pine-moon, rose-pine-dawn, default) in qutebrowser
# Save in ~/.config/qutebrowser/themes/select_theme.py

from color_palette import setup  # Import the setup function from color_palette.py
from qutebrowser.api import cmdutils

# List of available themes
THEMES = ['rose-pine', 'rose-pine-moon', 'rose-pine-dawn', 'default']

# Check if the command is already registered before registering it
try:
    # Try to unregister the command first (in case it exists)
    cmdutils._cmd_dict.pop('select-theme', None)
except AttributeError:
    # If _cmd_dict doesn't exist, we're probably on a newer version
    pass

# Register the :select-theme command
@cmdutils.register(name='select-theme')
def select_theme(theme: str) -> None:
    """Select and apply a theme (rose-pine, rose-pine-moon, rose-pine-dawn, default)."""
    if theme in THEMES:
        setup(c, theme)  # Apply the selected theme using color_palette.py
    else:
        # Use message.error instead of status_command for better compatibility
        from qutebrowser.api import message
        message.error(f"Invalid theme: {theme}. Available: {', '.join(THEMES)}")
