#!/bin/bash

# Get the directory that the setup.sh is located in
SETUP_FILE_LOCATION=$(cd "$(dirname "$0")" && pwd)

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
    "homebrew/cask/font-monaspace-nerd-font"
    "homebrew/cask/font-noto-sans-symbols-2"

    # Applications
    "1password"
    "visual-studio-code"
    "zed"
)

# Install packages
brew install -q "${packages[@]}"

# Tmux
mkdir -p ~/.tmux/plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    cd ~/.tmux/plugins/tpm || exit
    git pull
fi

# For each extension in the vscode.extensions.txt file, install them with code --install-extension
EXTENSION_FILE="$SETUP_FILE_LOCATION/vscode.extensions.txt"
while IFS= read -r line; do
    # Check if the extension is already installed, if it is then skip it silently
    if code --list-extensions | grep -q "$line"; then
        continue
    fi

    code --install-extension "$line"
done <"$EXTENSION_FILE"

# Symlink the dotfiles
stow . -t ~
