###### [3] USER INTERACTIVE SHELL ######

# NVM
source $(brew --prefix nvm)/nvm.sh

# ASDF
source "$(brew --prefix asdf)"/libexec/asdf.sh

# Set up LS_COLORS (like Ubuntu default)
LSCOLORS=ExFxBxDxCxegedabagacad
export LSCOLORS

# Color for grep output (like Ubuntu default)
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;31;1'

# Configure zsh prompt
autoload -Uz colors && colors
PROMPT='%F{cyan}%n@%m%f:%F{green}%~%f$ '

# Configure Git branch
# Function to get the current Git branch and color it based on branch name
git_branch_info() {
  branch=$(git symbolic-ref HEAD 2>/dev/null | sed "s|refs/heads/||")
  if [ -n "$branch" ]; then
    echo " %F{red}$branch%f "
  fi
}

# Function to show the number of changes in the Git repo
git_status_changes() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Get the count of modified, deleted, and untracked files
  modified_count=$(git status --porcelain | grep -E "^[\ M]" | wc -l)
  deleted_count=$(git status --porcelain | grep -E "^D" | wc -l)
  untracked_count=$(git status --porcelain | grep -E "^\?\?" | wc -l)
  total_changes=$((modified_count + deleted_count + untracked_count))

  # Return the number of changes if there are any
  if [ "$total_changes" -gt 0 ]; then
    echo "%F{yellow}[+$total_changes]%f "
  fi
}

# Enable prompt substitution to evaluate the function call
setopt prompt_subst

# Configure the prompt to include the Git branch with appropriate colors
PROMPT='%F{cyan}%n@%m%f:%F{green}%~%f$(git_branch_info)$(git_status_changes)$ '
