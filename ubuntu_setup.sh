#!/bin/bash

# A script to set up a new Ubuntu machine based on a specific dotfiles structure.
# This script will install applications, fonts, and necessary tools.

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Helper Functions ---
print_info() {
    echo -e "\n\e[1;34m[INFO]\e[0m $1"
}

print_success() {
    echo -e "\e[1;32m[SUCCESS]\e[0m $1"
}

# --- Main Functions ---

update_system() {
    print_info "Updating and upgrading system packages..."
    sudo apt update
    sudo apt upgrade -y
    print_success "System updated."
}

install_essentials() {
    print_info "Installing essential build tools and utilities..."
    sudo apt install -y build-essential git curl wget unzip ripgrep fd-find fzf xclip
    print_success "Essential tools installed."
}

install_applications() {
    print_info "Installing applications from your dotfiles..."
    # Window Management (i3 and Sway)
    sudo apt install -y i3 i3status sway waybar polybar picom rofi

    # Terminals and Shell
    sudo apt install -y kitty zsh

    # System Utilities
    sudo apt install -y btop neofetch fastfetch bat

    # Development & Text Editing
    # Dependencies for Neovim plugins might be needed, e.g., for telescope
    sudo apt install -y playerctl

    # Media and Browser
    sudo apt install -y mpv qutebrowser

    print_success "Core applications installed."
}

install_special_packages() {
    print_info "Installing special packages (Neovim, Starship, Lazygit)..."

    # Install latest stable Neovim
    print_info "Downloading and installing latest Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb
    sudo apt install -y ./nvim-linux64.deb
    rm nvim-linux64.deb

    # Install Starship prompt
    print_info "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y

    # Install Lazygit
    print_info "Installing Lazygit..."
    sudo add-apt-repository ppa:lazygit-team/release -y
    sudo apt update
    sudo apt install -y lazygit

    print_success "Special packages installed."
}

install_fonts() {
    print_info "Installing Iosevka Nerd Font..."
    # Create a directory for fonts
    mkdir -p ~/.local/share/fonts

    # Download and install Iosevka
    # Note: This URL points to a recent version. You might want to update it in the future.
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Iosevka.zip
    unzip Iosevka.zip -d ~/.local/share/fonts/IosevkaNerdFont
    rm Iosevka.zip

    # Update the font cache
    print_info "Updating font cache..."
    fc-cache -fv
    print_success "Iosevka Nerd Font installed."
}

setup_shell() {
    print_info "Setting Zsh as the default shell..."
    # The command chsh will ask for your password
    chsh -s "$(which zsh)"
    print_success "Zsh is now the default shell. Please log out and back in for the change to take effect."
}


# --- Script Execution ---
main() {
    update_system
    install_essentials
    install_applications
    install_special_packages
    install_fonts
    setup_shell

    echo -e "\n\n\e[1;35m--- SETUP COMPLETE ---\e[0m"
    echo "Please read the post-installation steps below."
}

main
