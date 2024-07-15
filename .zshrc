# Aliases
alias ls="eza --color=always --long --icons=always"
alias ga="git add"
alias gs="git status"
alias gap="git add -p"

# ZSH configuration
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
#ZSH_TMUX_FIXTERM=true
#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOCONNECT=true
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt promptsubst

# Completion styling
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview 'case "$group" in "commit tag") git show --color=always $word ;; *) git show --color=always $word | delta ;; esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview 'case "$group" in "modified file") git diff $word | delta ;; "recent commit object name") git show --color=always $word | delta ;; *) git log --color=always $word ;; esac'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':completion:*' list-max-items 20

# Setup zinit
ZINIT_HOME=$HOME/.local/share/zinit/zinit.git
if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "$ZINIT_HOME/zinit.zsh"

# Load plugins
zinit for \
  light-mode zsh-users/zsh-syntax-highlighting \
  light-mode zsh-users/zsh-completions \
  light-mode zsh-users/zsh-autosuggestions \
  light-mode zsh-users/zsh-history-substring-search \
  light-mode Aloxaf/fzf-tab

zinit light trapd00r/LS_COLORS
zinit light zdharma/fast-syntax-highlighting

# Load oh-my-zsh plugins
# Look for plugins here https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
zinit wait lucid for \
  OMZP::sudo \
  OMZP::aws \
  OMZP::command-not-found \
  OMZP::1password \
  OMZP::ansible \
  OMZP::brew \
  OMZP::composer \
  OMZP::cp \
  OMZP::docker-compose \
  OMZP::encode64 \
  OMZP::kubectl \
  OMZP::kubectx \
  OMZP::node \
  OMZP::pip

# Key bindings
bindkey -e
bindkey "^[^[[D" forward-word
bindkey "^[^[[C" backward-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Load completions
autoload -Uz compinit
compinit
zinit cdreplay -q

# Setup zoxide
eval "$(zoxide init --cmd cd zsh)"

# Setup fzf
eval "$(fzf --zsh)"

# Fire up oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.yaml)"
fi

# Start tmux if not already running
if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi
