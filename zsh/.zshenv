# XDG Base Directory Specification
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_CACHE_HOME=~/.cache
export XDG_STATE_HOME=~/.local/state

# Runtime relocations (depends on XDG_* above)
[[ -r "$ZDOTDIR/.zenv-runtime" ]] && source "$ZDOTDIR/.zenv-runtime"

# Customize the exact colors used by ls - Ubuntu theme
export LS_COLORS="di=01;34:ln=01;36:so=32:pi=33:ex=01;32:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"