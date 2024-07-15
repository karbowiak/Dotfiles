#!/bin/bash

# Install brew if not installed
brew_install_path="/opt/homebrew/bin/brew"
if [ ! -f "$brew_install_path" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages
packages=(
    # CLI Tools
    "bat"
    "curl"
    "eza"
    "fd"
    "fzf"
    "git"
    "gum"
    "htop"
    "jq"
    "ripgrep"
    "siege"
    "tree"
    "watch"
    "wget"
    "zoxide"
    "zsh"
    "tmux"
    "oh-my-posh"
    "reattach-to-user-namespace"

    # Programming Languages and Package Managers
    "composer"
    "node"
    "php"
    "python"
    "python3"
    "yarn"

    # PHP-related
    "composer"
    "php"

    # Development and Deployment Tools
    "devspace"
    "helm"
    "kubectl"
    "kubectx"
    "neovim"
    "rclone"
    "terraform"
    "alacritty"

    # GNU Tools
    "gnu-getopt"
    "gnu-indent"
    "gnu-sed"
    "gnu-tar"
)

# Generate a single string of package names
packages_string=$(printf "%s " "${packages[@]}")

# Install packages
brew install -q $packages_string

# Get the directory this script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# General Symlinks
ln -sfv $DIR/zprofile ~/.zprofile
ln -sfv $DIR/zshrc ~/.zshrc
ln -sfv $DIR/tmux.conf ~/.tmux.conf

# Alacritty
mkdir -p ~/.config/alacritty/themes
ln -sfv $DIR/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sfv $DIR/config/alacritty/themes/github_dark.toml ~/.config/alacritty/themes/github_dark.toml

# OhMyPosh
mkdir -p ~/.config/ohmyposh
ln -sfv $DIR/config/ohmyposh/config.yaml ~/.config/ohmyposh/config.yaml

# Tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
