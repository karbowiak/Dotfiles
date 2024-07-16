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
    "nowplaying-cli"
    "bash"
    "bc"
    "coreutils"
    "gawk"
    "gh"
    "glab"
    "gsed"
    "bat"
    "git-delta"

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
    "stow"

    # Fonts
    "font-monaspace-nerd-font"
    "font-noto-sans-symbols-2"
)

# Generate a single string of package names
packages_string=$(printf "%s " "${packages[@]}")

# Install packages
brew install -q $packages_string

# Get the directory this script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Tmux
mkdir -p ~/.tmux/plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    cd ~/.tmux/plugins/tpm
    git pull
fi

# For each extension in the vscode.extensions.txt file, install them with code --install-extension