#!/bin/sh


#  ██████╗  █████╗  ██████╗ ██╗
#  ██╔══██╗██╔══██╗██╔════╝ ██║
#  ██████╔╝███████║██║  ███╗██║
#  ██╔══██╗██╔══██║██║   ██║██║
#  ██████╔╝██║  ██║╚██████╔╝██║
#  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝
# --------------------------------------------
# Arch Linux Installation Script
# Primary Desktop: i3
# --------------------------------------------

LOG_FILE="arch_install_log_$(date +%Y%m%d_%H%M%S).log"

# Colors for pretty output
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)
BOLD=$(tput bold)

# Functions for logging and messaging
log_message() { echo -e "$(date +'%Y-%m-%d %H:%M:%S') [$1] $2" | tee -a "$LOG_FILE"; }
info() { log_message "${BLUE}INFO${RESET}" "${BOLD}$1${RESET}"; }
success() { log_message "${GREEN}SUCCESS${RESET}" "${BOLD}$1${RESET}"; }
warn() { log_message "${YELLOW}WARNING${RESET}" "${BOLD}$1${RESET}"; }
error() {
    log_message "${RED}ERROR${RESET}" "${BOLD}$1${RESET}"
    exit 1
}

# Ensure the script is run as root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        error "This script must be run as root or with sudo."
    fi
}

# ------------------ Package Lists (Pacman) ------------------

# PACMAN_CORE_SYSTEM=(
#     efibootmgr      # EFI boot manager
#     intel-ucode     # Microcode updates for Intel CPUs
#     linux linux-lts # Kernel (stable + LTS)
#     linux-firmware  # Firmware for devices
#     linux-headers   # Headers for compiling modules
#     man-db          # Manual pages database
#     smartmontools   # Drive health monitoring
#     trash-cli       # CLI trash utility
#     xdg-utils       # Basic desktop integration
#     zram-generator  # Creates compressed RAM swap
#     7zip zip        # Compression tools
# )

PACMAN_I3_DESKTOP=(
    i3-wm    # i3 window manager
    i3blocks # Status bar for i3
    dmenu    # Program launcher
    nitrogen # Background setter
    picom    # Compositor for transparency/shadows
    polybar  # Modern status bar alternative
    stow     # dotefile orginizer
)

PACMAN_DISPLAY_MANAGER=(
    lightdm             # Lightweight display/login manager
    lightdm-gtk-greeter # GTK theme for LightDM
)

PACMAN_TERMINAL_UTILS=(
    # alacritty               # GPU-accelerated terminal
    kitty                   # Another GPU terminal
    tmux                    # Terminal multiplexer
    zsh                     # Shell
    zsh-autosuggestions     # Shell plugin
    zsh-syntax-highlighting # Shell plugin
)

PACMAN_DEV_TOOLS=(
    git cmake clang gdb make ninja valgrind # Development tools
    neovim vim nano                         # Text editors
    graphviz                                # Diagrams
    lazygit                                 # Git TUI
    lazydocker                              # Docker TUI
)

PACMAN_LANGUAGES=(
    jdk17-openjdk      # Java 17
    go                 # Go language
    rustup             # Rust installer
    node               # JavaScript runtime
    php php-fpm php-gd # PHP + FPM + image support
    npm yarn           # JS package managers
    pyenv python-pip   # Python version manager + pip
    python-pipx        # Python CLI tool installer
)

# PACMAN_PYTHON_LIBS=(
#     python-numpy python-pandas python-matplotlib python-seaborn
#     python-networkx python-paramiko python-cryptography
#     python-pynacl python-pynvim
# )

PACMAN_WEB_BROWSERS=(
    firefox # Web browser
)

PACMAN_MULTIMEDIA=(
    # pipewire pipewire-alsa pipewire-pulse wireplumber # Audio system
    mpv vlc yt-dlp # Media players + YouTube downloader
    # libpulse gst-plugin-pipewire                      # Audio dependencies
)

# PACMAN_NETWORKING=(
#     networkmanager network-manager-applet # Network tool
#     iwd inetutils net-tools               # Wireless/legacy tools
#     whois blueman bluez-utils             # Bluetooth tools
# )

PACMAN_FILE_MANAGEMENT=(
    # nautilus                # GNOME file manager (useful fallback)
    # bat eza fd fzf ripgrep  # CLI file tools
    fzf
    # zoxide                  # Smarter cd
    # ncdu                    # Disk usage viewer
    xclip xsel wl-clipboard # Clipboard tools
)

PACMAN_UTILITIES=(
    starship  # Prompt
    fastfetch # System info
    tealdeer  # tldr pages
    # ueberzugpp viu # Image preview in terminal
    btop   # System monitor
    jq     # JSON parser
    ttyper # Typing test
    zellij # Tiling terminal
)

PACMAN_THEMES_FONTS=(
    ttf-jetbrains-mono-nerd # Font
    ttf-meslo-nerd          # Font
    ttf-dejavu              # Font
)

PACMAN_IMAGE_TOOLS=(
    feh maim chafa inkscape # Screenshots and image tools
)

PACMAN_OTHER=(
    evince            # PDF viewer
    libreoffice-fresh # Office suite
    plantuml          # UML diagrams
    # ufw                    # Firewall
    # fprintd                # Fingerprint login
    mtpfs ntfs-3g          # File system support
    xorg-xinit xorg-xinput # X utilities
    brightnessctl          # Screen brightness control
    xorg-xbacklight        # Xorg backlight utility
    xorg-xev               # Xorg event utility
    packer                 # Package manager for Arch (if not using yay for AUR)
)

# PACMAN_GNOME_MINIMAL=(
#     gnome-shell gnome-session # GNOME shell and session
#     gnome-control-center      # Settings
#     gnome-settings-daemon     # Backend daemon
#     gnome-keyring             # Password/key storage
#     gnome-terminal            # Terminal fallback
#     gdm                       # GNOME Display Manager
# )

# Combine all Pacman package arrays into one for installation
ALL_PACMAN_PACKAGES=(
    "${PACMAN_CORE_SYSTEM[@]}"
    "${PACMAN_I3_DESKTOP[@]}"
    "${PACMAN_DISPLAY_MANAGER[@]}"
    "${PACMAN_TERMINAL_UTILS[@]}"
    "${PACMAN_DEV_TOOLS[@]}"
    "${PACMAN_LANGUAGES[@]}"
    "${PACMAN_PYTHON_LIBS[@]}"
    "${PACMAN_WEB_BROWSERS[@]}"
    "${PACMAN_MULTIMEDIA[@]}"
    "${PACMAN_NETWORKING[@]}"
    "${PACMAN_FILE_MANAGEMENT[@]}"
    "${PACMAN_UTILITIES[@]}"
    "${PACMAN_THEMES_FONTS[@]}"
    "${PACMAN_IMAGE_TOOLS[@]}"
    "${PACMAN_OTHER[@]}"
    "${PACMAN_GNOME_MINIMAL[@]}"
)

# ------------------ Package Lists (AUR) ------------------

AUR_WEB_BROWSERS=(
    brave-bin     # Brave Browser
    google-chrome # Google Chrome
    opera         # Opera Browser
)

AUR_TERMINAL_UTILITIES=(
    cbonsai   # C-based bonsai tree generator
    neofetch  # System info script
    pfetch    # Faster system info script
    tty-clock # Digital clock in terminal
)

AUR_DEV_TOOLS=(
    # chromedriver           # WebDriver for Chrome
    # ddd                    # Data Display Debugger
    postman-bin            # API development environment
    visual-studio-code-bin # VS Code (binary)
)

# AUR_DEV_LANG_LIBS=(
#     python-selenium          # Python bindings for Selenium
#     python-webdriver-manager # WebDriver manager for Python
#     python312                # Specific Python 3.12 version
# )

AUR_DOCUMENT_OFFICE=(
    girara-git   # GTK-based document viewer library
    markdown2pdf # Markdown to PDF converter
    quarto-cli   # Scientific and technical publishing system
    zathura-git  # Highly customizable document viewer
)

# AUR_LATEX_TEX=(
#     latexrun-git            # LaTeX compilation helper
#     meta-group-texlive-most # Comprehensive TeX Live installation
#     texpresso-git           # LaTeX editor
# )

AUR_MULTIMEDIA=(
    gpu-screen-recorder              # Screen recorder using GPU
    gpu-screen-recorder-notification # Notification for GPU screen recorder
    gpu-screen-recorder-ui           # UI for GPU screen recorder
    # spotify-tui                      # Spotify Text User Interface
)

AUR_WINDOW_MANAGERS=(
    i3lock-color # i3lock with custom colors
)

AUR_FILE_SYSTEMS=(
    simple-mtpfs # Simple MTP filesystem
)

AUR_FONTS=(
    ttf-all-the-icons # Font for all-the-icons.el
    ttf-iosevka-term  # Iosevka Term font
)

# AUR_SHELL_UTILITIES=(
#     ruby-xdg   # Ruby XDG Base Directory Specification
#     tmuxinator # Tmux session manager
# )

# Combine all AUR package arrays into one for installation
ALL_AUR_PACKAGES=(
    "${AUR_WEB_BROWSERS[@]}"
    "${AUR_TERMINAL_UTILITIES[@]}"
    "${AUR_DEV_TOOLS[@]}"
    "${AUR_DEV_LANG_LIBS[@]}"
    "${AUR_DOCUMENT_OFFICE[@]}"
    "${AUR_LATEX_TEX[@]}"
    "${AUR_MULTIMEDIA[@]}"
    "${AUR_WINDOW_MANAGERS[@]}"
    "${AUR_FILE_SYSTEMS[@]}"
    "${AUR_FONTS[@]}"
    "${AUR_SHELL_UTILITIES[@]}"
)

# ------------------ Install Functions ------------------

install_pacman_packages() {
    info "Installing Pacman packages..."
    # Update system first
    sudo pacman -Syu --noconfirm 2>&1 | tee -a "$LOG_FILE" || warn "System update failed. Continuing with package installation."

    # Install all categorized Pacman packages
    sudo pacman -S --needed --noconfirm "${ALL_PACMAN_PACKAGES[@]}" 2>&1 | tee -a "$LOG_FILE"
    if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
        warn "Some Pacman packages might not have installed correctly. Check the log file: $LOG_FILE"
    else
        success "All selected Pacman packages installed."
    fi
}

install_yay() {
    if ! command -v yay &>/dev/null; then
        info "yay not found. Installing yay AUR helper..."
        # Ensure git and base-devel are installed for yay compilation
        sudo pacman -S --needed --noconfirm git base-devel 2>&1 | tee -a "$LOG_FILE" || error "Failed to install git and base-devel, which are required for yay."

        mkdir -p /tmp/yay_build && cd /tmp/yay_build || error "Failed to create or enter /tmp/yay_build."
        git clone https://aur.archlinux.org/yay.git 2>&1 | tee -a "$LOG_FILE" || error "Failed to clone yay repository."
        cd yay || error "Failed to enter yay directory."
        makepkg -si --noconfirm 2>&1 | tee -a "$LOG_FILE" || error "Failed to build and install yay."
        cd - >/dev/null # Go back to previous directory
        rm -rf /tmp/yay_build
        success "yay installed successfully."
    else
        info "yay is already installed."
    fi
}

install_aur_packages() {
    info "Installing AUR packages with yay..."
    # yay will prompt for confirmations (e.g., to review PKGBUILDs).
    # It's generally recommended to review AUR packages.
    # If you want fully non-interactive, add --noconfirm, but use with caution.
    yay -S --needed "${ALL_AUR_PACKAGES[@]}" 2>&1 | tee -a "$LOG_FILE"
    if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
        warn "Some AUR packages might not have installed correctly. Check the log file: $LOG_FILE"
    else
        success "All selected AUR packages installed."
    fi
}

enable_services() {
    info "Enabling essential services..."
    SERVICES_TO_ENABLE=(
        lightdm.service
        NetworkManager.service
        bluetooth.service
        # fprintd.service
        # Add other services you want to enable by default, e.g., iwd.service if you prefer it over NetworkManager for wireless
    )

    for service in "${SERVICES_TO_ENABLE[@]}"; do
        if systemctl is-enabled "$service" &>/dev/null; then
            info "$service is already enabled."
        else
            info "Enabling $service..."
            sudo systemctl enable "$service" 2>&1 | tee -a "$LOG_FILE"
            if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
                warn "Failed to enable $service. Check the log file: $LOG_FILE"
            else
                success "$service enabled."
            fi
        fi
    done
}

clean_cache() {
    info "Cleaning package cache..."
    sudo pacman -Sc --noconfirm 2>&1 | tee -a "$LOG_FILE"
    yay -Sc --noconfirm 2>&1 | tee -a "$LOG_FILE"
    success "Package cache cleaned."
}

# ------------------ Script Execution ------------------

clear
echo -e "${BOLD}${CYAN}>>> Arch Linux Setup Script for i3 + GNOME (Minimal Fallback)${RESET}\n"
check_root
info "Starting installation process. Log file: $LOG_FILE"
echo ""

# Step 1: Install yay (and its dependencies if needed)
install_yay

# Step 2: Install Pacman packages
install_pacman_packages

# Step 3: Install AUR packages
install_aur_packages

# Step 4: Enable services
enable_services

# Step 5: Clean up
clean_cache

echo ""
success "Installation script finished!"
info "Please review the log file ($LOG_FILE) for any warnings or errors."
echo -e "${BOLD}${MAGENTA}Remember to reboot your system for all changes to take effect.${RESET}"
echo ""
