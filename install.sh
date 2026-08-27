#!/bin/bash

# ==============================================================================
#  Dotfiles & Hyprland + Matugen Automated Installer
#  Target OS: Arch Linux / Arch-based Distributions
# ==============================================================================

set -e

# Color definitions
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# ------------------------------------------------------------------------------
# 1. System Check
# ------------------------------------------------------------------------------
info "Checking system environment..."

if [ ! -f /etc/arch-release ]; then
    error "This installation script is designed for Arch Linux or Arch-based distributions."
fi

# ------------------------------------------------------------------------------
# 2. Update System & Core Dependencies
# ------------------------------------------------------------------------------
info "Updating package databases..."
sudo pacman -Sy --noconfirm

info "Installing base-devel and git..."
sudo pacman -S --needed --noconfirm base-devel git curl wget jq unzip 7zip p7zip

# ------------------------------------------------------------------------------
# 3. Ensure AUR Helper (yay) is installed
# ------------------------------------------------------------------------------
if ! command -v yay &>/dev/null; then
    info "Installing yay (AUR helper)..."
    TEMP_YAY=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$TEMP_YAY"
    (cd "$TEMP_YAY" && makepkg -si --noconfirm)
    rm -rf "$TEMP_YAY"
    success "yay installed successfully."
else
    info "yay is already installed."
fi

# ------------------------------------------------------------------------------
# 4. Install Official Pacman Packages
# ------------------------------------------------------------------------------
PACMAN_PKGS=(
    # Desktop Environment & Wayland
    hyprland
    hyprlock
    hypridle
    hyprpaper
    waybar
    swaync
    rofi-wayland
    nwg-look
    qt5ct
    qt6ct
    kvantum
    wl-clipboard
    libnotify

    # Terminal & Shell Setup
    stow
    zsh
    kitty
    tmux
    starship
    zoxide
    fzf
    eza
    bat
    ripgrep
    fd
    yazi
    lazygit
    lazydocker
    btop
    fastfetch

    # Languages & Compilers
    rustup
    go
    nodejs
    npm
    pnpm
    python
    python-pip
    gcc
    make
    cmake

    # Media & Network Utilities
    mpv
    aria2
    networkmanager
    nmcli

    # Fonts & Icons
    ttf-iosevka-nerd
    ttf-font-awesome
    noto-fonts-emoji
)

info "Installing official Pacman packages..."
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

# Ensure Rust default toolchain is configured
if command -v rustup &>/dev/null; then
    rustup default stable &>/dev/null || true
fi

# ------------------------------------------------------------------------------
# 5. Install AUR Packages
# ------------------------------------------------------------------------------
AUR_PKGS=(
    matugen-bin
    awww-bin
    hyprshot
    python-pywal
    vesktop-bin
    brave-bin
    cava
    qutebrowser
)

info "Installing AUR packages via yay..."
yay -S --needed --noconfirm "${AUR_PKGS[@]}" || warn "Some AUR packages failed to install, proceeding..."

# ------------------------------------------------------------------------------
# 6. Python Matugen / Pywal Backend Dependencies
# ------------------------------------------------------------------------------
info "Installing Python color backend dependencies (haishoku)..."
python3 -m pip install --user --break-system-packages haishoku || python3 -m pip install --user haishoku || warn "Could not install haishoku via pip."

# ------------------------------------------------------------------------------
# 7. Tmux Plugin Manager (TPM) Setup
# ------------------------------------------------------------------------------
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    info "Installing Tmux Plugin Manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    success "TPM installed."
else
    info "TPM is already installed."
fi

# ------------------------------------------------------------------------------
# 8. Setup Zsh Plugins
# ------------------------------------------------------------------------------
ZSH_PLUGINS_DIR="$HOME/dotfiles/zsh/plugins"
mkdir -p "$ZSH_PLUGINS_DIR"

clone_zsh_plugin() {
    local repo=$1
    local name=$(basename "$repo")
    local target="$ZSH_PLUGINS_DIR/$name"
    if [ ! -d "$target" ]; then
        info "Cloning Zsh plugin: $name..."
        git clone --depth=1 "https://github.com/$repo.git" "$target"
    fi
}

clone_zsh_plugin "zsh-users/zsh-autosuggestions"
clone_zsh_plugin "Aloxaf/fzf-tab"
clone_zsh_plugin "zsh-users/zsh-history-substring-search"
clone_zsh_plugin "jeffreytse/zsh-vi-mode"
clone_zsh_plugin "zsh-users/zsh-syntax-highlighting"

# ------------------------------------------------------------------------------
# 9. Stow Dotfiles to $HOME via GNU Stow
# ------------------------------------------------------------------------------
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
info "Stowing dotfiles from $DOTFILES_DIR into $HOME via GNU Stow..."

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

# Make executable scripts executable prior to stowing
chmod +x "$DOTFILES_DIR/.local/bin/"* 2>/dev/null || true
chmod +x "$DOTFILES_DIR/install.sh" 2>/dev/null || true

# Execute GNU Stow from dotfiles directory
cd "$DOTFILES_DIR"
stow -v -R -t "$HOME" .
success "Dotfiles stowed successfully."

# Create default wallpaper directory
mkdir -p "$HOME/wall"

# Create secrets template if .zsh_secrets does not exist
if [ ! -f "$DOTFILES_DIR/zsh/.zsh_secrets" ]; then
    info "Creating default .zsh_secrets file from template..."
    cp "$DOTFILES_DIR/zsh/.zsh_secrets.example" "$DOTFILES_DIR/zsh/.zsh_secrets"
fi

# ------------------------------------------------------------------------------
# 10. Change Default Shell to Zsh
# ------------------------------------------------------------------------------
if [ "$SHELL" != "$(which zsh)" ]; then
    info "Changing default shell to Zsh..."
    chsh -s "$(which zsh)" || warn "Could not automatically change shell. Run 'chsh -s \$(which zsh)' manually."
fi

# ------------------------------------------------------------------------------
# Final Instructions
# ------------------------------------------------------------------------------
echo ""
success "======================================================================"
success " Dotfiles and Hyprland + Matugen environment installation complete!"
success "======================================================================"
echo -e "${BLUE}Next steps:${NC}"
echo " 1. Place your wallpapers inside ~/wall/"
echo " 2. Run 'wals' or '~/.local/bin/walset-select' to pick a wallpaper and generate Matugen themes."
echo " 3. Start Hyprland or log out and log in to your new Hyprland session."
echo ""
