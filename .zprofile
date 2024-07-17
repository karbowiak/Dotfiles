if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d "$HOME/Library/Application Support/JetBrains/Toolbox/scripts" ]; then
  export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fi

if [ -f "$HOME/.orbstack/shell/init.zsh" ]; then
  source "$HOME/.orbstack/shell/init.zsh"
fi
