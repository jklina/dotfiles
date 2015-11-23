#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
path+=("$HOME/.rbenv/bin:$PATH")
path+=('/Applications/MAMP/Library/bin/')
path+=('/Applications/Postgres.app/Contents/Versions/9.3/bin')
eval "$(rbenv init -)"

#!/bin/sh
#
# Attach or create tmux session named the same as current directory.

session_name="$(basename "$PWD" | tr . -)"

session_exists() {
  tmux list-sessions | sed -E 's/:.*$//' | grep -q "^$session_name$"
}

not_in_tmux() {
  [ -z "$TMUX" ]
}

if not_in_tmux; then
  tmux new-session -As "$session_name"
else
  if ! session_exists; then
    (TMUX='' tmux new-session -Ad -s "$session_name")
  fi
  tmux switch-client -t "$session_name"
fi
