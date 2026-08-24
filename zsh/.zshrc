# ls Aliases
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"
alias lla="ls -la --color=auto"

# vim Aliases
alias vim="nvim"
alias vi="nvim"

# acpi Alias for battery status
alias lsbat="acpi -b"

# Stow Alias for dotfiles sync
alias dotsync="stow --target=$HOME/.config ."

# alt+h/l move by char, alt+shift+h/l by word (^[ = the alt prefix).
# Both keymaps: EDITOR=nvim makes zsh start in viins, not emacs.
for _km in emacs viins; do
  bindkey -M $_km '^[h' backward-char
  bindkey -M $_km '^[l' forward-char
  bindkey -M $_km '^[H' backward-word
  bindkey -M $_km '^[L' forward-word
done
unset _km

# ACTIVE MISE
eval "$(mise activate zsh)"

# Starship Prompt
eval "$(starship init zsh)"