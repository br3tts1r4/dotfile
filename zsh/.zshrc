# ls Aliases
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"
alias lla="ls -la --color=auto"

# vim Aliases
alias vim="nvim"
alias vi="nvim"

# Stow Alias for dotfiles sync
alias dotsync="stow --target=$HOME/.config ."

# Starship Prompt
eval "$(starship init zsh)"