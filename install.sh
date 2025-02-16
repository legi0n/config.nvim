#!/bin/bash

GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
RESET="\033[0m"
BOLD="\033[1m"

PREFIX="[CONFIG] "

info_message() {
    echo -e "${PREFIX}${GREEN}$1${RESET}"
}

warning_message() {
    echo -e "${PREFIX}${YELLOW}$1${RESET}"
}

error_message() {
    echo -e "${PREFIX}${RED}$1${RESET}"
}

space() {
    echo -e "\n";
}

get_github_stable_version() {
    info_message "Fetching the latest stable Neovim version from GitHub..."

    LATEST_STABLE_VERSION=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -oP '"tag_name":\s*"\K[^"]+')

    if [[ -z "$LATEST_STABLE_VERSION" ]]; then
        error_message "Failed to fetch the latest stable version. Please check your internet connection or GitHub API status."
        exit 1
    fi

    info_message "Latest stable version from GitHub: $LATEST_STABLE_VERSION"
}

check_installed_version() {
    info_message "Checking your installed Neovim version..."

    if ! command -v nvim &>/dev/null; then
        error_message "Neovim is not installed! Please install Neovim before proceeding."
        exit 1
    fi

    INSTALLED_VERSION=$(nvim --version | grep -oP '^NVIM\s+\K[^\s]+')

    get_github_stable_version

    if [[ "$INSTALLED_VERSION" != "$LATEST_STABLE_VERSION" ]]; then
        warning_message "You are not using the latest stable version of Neovim ($INSTALLED_VERSION). This may cause compatibility issues."
        warning_message "Please install the latest stable version from GitHub: https://github.com/neovim/neovim/releases/tag/$LATEST_STABLE_VERSION"
    else
        info_message "You are using the latest stable version of Neovim ($INSTALLED_VERSION)."
    fi
}

list_dependencies() {
    OS="$(uname -s)"
    info_message "Detected OS: $OS"

    warning_message "The following external dependencies are required:"

    if [[ "$OS" == "Linux" ]]; then
        echo "  - build-essential"
        echo "  - curl"
        echo "  - git"
        echo "  - nodejs"
        echo "  - npm"
        echo "  - python3"
        echo "  - python3-pip"
        echo "  - python3-venv"
        echo "  - ripgrep"
        echo "  - unzip"
    elif [[ "$OS" == "Darwin" ]]; then
        echo "  - curl"
        echo "  - git"
        echo "  - nodejs"
        echo "  - python3"
        echo "  - ripgrep"
    elif [[ -f /etc/arch-release ]]; then
        echo "  - base-devel"
        echo "  - curl"
        echo "  - git"
        echo "  - nodejs"
        echo "  - npm"
        echo "  - python"
        echo "  - ripgrep"
        echo "  - unzip"
    else
        error_message "Your operating system is unsupported by this script."
        warning_message "Please manually install the following essential dependencies:"
        echo "  - git"
        echo "  - make"
        echo "  - unzip"
        echo "  - C compiler"
        echo "  - ripgrep (https://github.com/BurntSushi/ripgrep#installation)"
        echo "  - nodejs"
        echo "  - npm"
        echo "  - python"
        echo "  - python pip"
        echo "  - python venv"
        echo "  - curl"
        exit 1
    fi

    warning_message "Do you want to install these dependencies automatically? (y/n)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        install_dependencies "$OS"
    else
        info_message "Please install the dependencies manually."
    fi
}

install_dependencies() {
    OS="$1"
    if [[ "$OS" == "Linux" ]]; then
        install_linux_dependencies
    elif [[ "$OS" == "Darwin" ]]; then
        install_macos_dependencies
    elif [[ -f /etc/arch-release ]]; then
        install_arch_dependencies
    fi
}

install_linux_dependencies() {
    info_message "Installing dependencies for Linux..."
    sudo apt update && sudo apt install -y \
        build-essential \
        curl \
        git \
        nodejs \
        npm \
        python3 \
        python3-pip \
        python3-venv \
        ripgrep \
        unzip
}

install_arch_dependencies() {
    info_message "Installing dependencies for Arch-based Linux..."
    sudo pacman -Syu --noconfirm \
        base-devel \
        curl \
        git \
        nodejs \
        npm \
        python \
        ripgrep \
        unzip
}

install_macos_dependencies() {
    if ! command -v brew &>/dev/null; then
        error_message "Homebrew is not installed! Please install Homebrew first or install the dependencies yourself."
        exit 1
    fi
    info_message "Installing dependencies for macOS..."
    brew install \
        curl \
        git \
        nodejs \
        python3 \
        ripgrep
}

clone_config_repo() {
    info_message "Cloning Neovim configuration repository..."

    CONFIG_DIR="$HOME/.config/nvim"

    if [ -d "$CONFIG_DIR" ]; then
        warning_message "A Neovim configuration already exists at $CONFIG_DIR. Backing it up..."
        mv "$CONFIG_DIR" "$CONFIG_DIR.bak.$(date +%Y%m%d%H%M%S)"
    fi

    git clone https://github.com/legi0n/config.nvim.git "$CONFIG_DIR"
}

finish_setup() {
    info_message "Setup complete!"
    warning_message "Please run Neovim to finalize plugin installation and synchronization."
    info_message "To launch Neovim, simply run: nvim"
}

check_installed_version
space
list_dependencies
space
clone_config_repo
space
finish_setup
space
