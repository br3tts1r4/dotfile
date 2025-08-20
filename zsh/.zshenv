###### [1]ENVIRONMENT ######

# ZSH SHELL CONFIG
ZDOTDIR=$HOME/.zsh

# HOME BREW
HOMEBREW=/opt/homebrew/bin
HOMEBREW_PROGRAMS=/opt/homebrew/Cellar

# NODE VERSION MANAGEMENT NVM
export NVM_DIR="$HOME/.nvm"

# JAVA HOME
export JAVA_HOME=$(ls -d $HOMEBREW_PROGRAMS/openjdk@17/* | sort -V | tail -n 1)

# PYENV
export PYENV_HOME="$HOME/.pyenv"
export PYENV_BIN="$PYENV_HOME/bin"

# GOLANG 
export GOPATH="$HOME/go"

# GLOBAL PATH
export PATH=$PATH:$HOMEBREW:$PYENV_BIN:$GOPATH
