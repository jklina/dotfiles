function reload
  source ~/.config/fish/config.fish
end

function mux
  tmuxinator $argv
end

function gs
  git status
end

function gpull
  git pull
end

function gc
  git commit
end

function be
  bundle exec $argv
end

function edit!
  nvim ~/.config/fish
end

function gd
  git diff $argv
end

function gvs
  git diff --staged
end

function gp
  git push $argv
end

function ga
  git add .
end

function reset_to_origin!
  git fetch origin
  git reset --hard origin/(current_git_branch)
  git clean -f -d
end

function current_git_branch
  git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/'
end
