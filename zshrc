# Aliases
alias ls="eza --color=always --long --icons=always"
alias cd="z"

# Setup zoxide
eval "$(zoxide init zsh)"

# Fire up oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.yaml)"
fi

# Start tmux if not already running
if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi
