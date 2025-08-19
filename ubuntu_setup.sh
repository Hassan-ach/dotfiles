#!/bin/bash

#  ██╗   ██╗██████╗ ███╗   ██╗████████╗██╗   ██╗
#  ██║   ██║██╔══██╗████╗  ██║╚══██╔══╝██║   ██║
#  ██║   ██║██████╔╝██╔██╗ ██║   ██║   ██║   ██║
#  ██║   ██║██╔══██╗██║╚██╗██║   ██║   ██║   ██║
#  ╚██████╔╝██║  ██║██║ ╚████║   ██║   ╚██████╔╝
#   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝
# -----------------------------------------------------
# Ubuntu/Debian Setup Script
# Mirrors the user's Arch Linux dotfiles environment.
# Primary Desktops: i3 and Sway
# -----------------------------------------------------

# --- Script Configuration ---
# Exit immediately if a command exits with a non-zero status.
set -e

LOG_FILE="ubuntu_setup_log_$(date +%Y%m%d_%H%M%S).log"
DEBIAN_FRONTEND=noninteractive

# --- Colors and Logging ---
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)
BOLD=$(tput bold)

log_message() { echo -e "$(date +'%Y-%m-%d %H:%M:%S') [$1] $2" | tee -a "$LOG_FILE"; }
info() { log_message "${BLUE}INFO${RESET}" "${BOLD}$1${RESET}"; }
success() { log_message "${GREEN}SUCCESS${RESET}" "${BOLD}$1${RESET}"; }
warn() { log_message "${YELLOW}WARNING${RESET}" "${BOLD}$1${RESET}"; }
error() {
    log_message "${RED}ERROR${RESET}" "${BOLD}$1${RESET}"
    exit 1
}

# --- Root Check ---
check_root() {
    if [[ $EUID -ne 0 ]]; then
        error "This script must be run with sudo or as root: sudo bash $0"
    fi
}

# --- Package Lists (APT) ---
APT_PACKAGES=(
    # --- Window Management (i3 & Sway) ---
    i3              # i3 Window Manager
    sway            # Sway (Wayland) Compositor
    polybar         # Status bar for i3
    waybar          # Status bar for Sway
    picom           # Compositor for X11 (transparency, shadows)
    stow            # Symlink farm manager for dotfiles
    rofi            # Application launcher
    lightdm         # Display manager
    lightdm-gtk-greeter
    nitrogen        # Background setter for X11
    feh             # Image viewer and background setter
    maim xclip      # Screenshot tools for X11
    brightnessctl   # Control screen brightness
    xorg xinit      # Core Xorg server and utilities

    # --- Terminal & Shell ---
    kitty           # GPU-accelerated terminal
    tmux            # Terminal multiplexer
    zsh             # Z-Shell
    fzf             # Command-line fuzzy finder

    # --- Development Tools ---
    git cmake clang gdb make ninja-build valgrind build-essential
    # Neovim and Lazygit are installed separately
    graphviz

    # --- Languages & Runtimes ---
    openjdk-17-jdk  # Java 17
    golang-go       # Go language
    nodejs npm      # Node.js and npm
    php php-fpm php-gd
    python3-pip     # Python package installer
    pipx            # Install and run Python applications in isolated environments

    # --- Browsers & Multimedia ---
    firefox
    mpv vlc yt-dlp

    # --- File Management & CLI Utilities ---
    btop            # System monitor
    jq              # JSON processor
    neofetch        # System information tool
    fastfetch       # Faster system info tool (installed via PPA)
    trash-cli       # Command-line trash utility
    unzip zip 7zip

    # --- Fonts & Theming ---
    # Nerd Fonts are installed by a separate function
    fontconfig

    # --- Other System Tools ---
    curl wget       # Network download tools
    gnupg           # For managing repository keys
    ca-certificates # For SSL verification
    evince          # PDF viewer
    libreoffice     # Office suite
    mtp-tools       # MTP device support
    ntfs-3g         # NTFS filesystem support
    bluez blueman   # Bluetooth stack and manager
)

# Dependencies to build i3lock-color from source
I3LOCK_DEPS=(
    libxcb1-dev libxcb-keysyms1-dev libpam0g-dev libxcb-util0-dev
    libxcb-xinerama0-dev libxcb-randr0-dev libxkbcommon-dev
    libxkbcommon-x11-dev libxcb-image0-dev autoconf
)

# --- Installation Functions ---

update_system() {
    info "Updating package lists and upgrading the system..."
    apt-get update 2>&1 | tee -a "$LOG_FILE"
    apt-get upgrade -y 2>&1 | tee -a "$LOG_FILE"
    success "System updated and upgraded."
}

install_apt_packages() {
    info "Installing core packages from APT..."
    apt-get install -y "${APT_PACKAGES[@]}" "${I3LOCK_DEPS[@]}" 2>&1 | tee -a "$LOG_FILE"
    if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
        warn "Some APT packages failed to install. Check the log."
    else
        success "Core APT packages installed."
    fi
}

install_nerd_fonts() {
    info "Installing Nerd Fonts (JetBrains Mono, Meslo, Iosevka)..."
    # Run as the original user, not root
    sudo -u "${SUDO_USER}" bash <<'EOF'
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    cd /tmp
    FONTS=(
        "JetBrainsMono"
        "Meslo"
        "Iosevka"
    )
    for font in "${FONTS[@]}"; do
        echo "Downloading $font Nerd Font..."
        wget -q "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${font}.zip"
        unzip -q -o "${font}.zip" -d "$FONT_DIR"
        rm "${font}.zip"
    done
    echo "Updating font cache..."
    fc-cache -fv
EOF
    success "Nerd Fonts installed."
}

install_latest_neovim() {
    info "Installing latest stable Neovim..."
    cd /tmp
    wget -q https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb
    apt-get install -y ./nvim-linux64.deb 2>&1 | tee -a "$LOG_FILE"
    rm nvim-linux64.deb
    success "Latest Neovim installed."
}

install_starship() {
    info "Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y 2>&1 | tee -a "$LOG_FILE"
    success "Starship installed."
}

install_rust() {
    info "Installing Rust via rustup..."
    # Run as the original user to install in their home directory
    sudo -u "${SUDO_USER}" bash -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
    # Add cargo to the current root shell's path for subsequent steps
    # Note: The user will need to source this themselves in their new shell
    source "$HOME/.cargo/env"
    success "Rust installed."
}

add_ppa_and_install() {
    local ppa=$1
    shift
    local packages_to_install=("$@")
    info "Adding PPA ${ppa} and installing: ${packages_to_install[*]}"
    add-apt-repository ppa:"${ppa}" -y 2>&1 | tee -a "$LOG_FILE"
    apt-get update 2>&1 | tee -a "$LOG_FILE"
    apt-get install -y "${packages_to_install[@]}" 2>&1 | tee -a "$LOG_FILE"
    success "Installed packages from ${ppa}."
}

install_external_repo_software() {
    info "Setting up external repositories for Brave, Chrome, and VS Code..."
    # Brave Browser
    info "Installing Brave Browser..."
    curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" > /etc/apt/sources.list.d/brave-browser-release.list

    # Google Chrome
    info "Installing Google Chrome..."
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

    # Visual Studio Code
    info "Installing Visual Studio Code..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list

    info "Updating APT lists and installing software from new repos..."
    apt-get update
    apt-get install -y brave-browser google-chrome-stable code 2>&1 | tee -a "$LOG_FILE"
    success "Brave, Chrome, and VS Code installed."
}

build_i3lock_color() {
    info "Building i3lock-color from source..."
    cd /tmp
    if [ -d "i3lock-color" ]; then
        rm -rf i3lock-color
    fi
    git clone https://github.com/Raymo111/i3lock-color.git
    cd i3lock-color
    ./build.sh
    ./install-i3lock-color.sh
    cd ..
    rm -rf i3lock-color
    success "i3lock-color built and installed."
}

enable_services() {
    info "Enabling system services..."
    systemctl enable lightdm.service
    systemctl enable bluetooth.service
    success "Enabled LightDM and Bluetooth services."
}

# --- Main Execution ---
main() {
    clear
    echo -e "${BOLD}${CYAN}>>> Ubuntu Environment Setup Script <<<${RESET}\n"
    check_root
    info "Starting installation. Log will be saved to: $LOG_FILE"

    update_system
    install_apt_packages

    info "--- Installing external and custom software ---"
    add_ppa_and_install "ppa:lazygit-team/release" "lazygit"
    add_ppa_and_install "ppa:zhangsongcui3371/fastfetch" "fastfetch"
    install_external_repo_software
    install_latest_neovim
    install_starship
    install_rust
    build_i3lock_color
    install_nerd_fonts

    enable_services

    echo ""
    success "Core installation finished!"
    echo -e "${BOLD}${MAGENTA}Please complete the following manual steps:${RESET}"
    echo -e "1. ${CYAN}Clone your dotfiles${RESET} into your home directory:"
    echo -e "   ${YELLOW}git clone <your-dotfiles-repo-url> ~/dotfiles${RESET}"
    echo ""
    echo -e "2. ${CYAN}Use stow to link your configurations${RESET} (run from inside the dotfiles directory):"
    echo -e "   ${YELLOW}cd ~/dotfiles && stow .${RESET}"
    echo ""
    echo -e "3. ${CYAN}Change your default shell to Zsh${RESET}:"
    echo -e "   ${YELLOW}chsh -s \$(which zsh) ${SUDO_USER}${RESET}"
    echo ""
    echo -e "4. ${CYAN}Reboot your system${RESET} for all changes to take effect:"
    echo -e "   ${YELLOW}sudo reboot${RESET}"
    echo ""
    info "Script finished. Review the log file ($LOG_FILE) for details."
}

main "$@"
