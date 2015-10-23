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
