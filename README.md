Josh's dotfiles
===================
_This originally started out as a fork of [thoughbot's](http://https://github.com/thoughtbot/dotfiles "thoughtbot's dotfiles") dotfiles, but I've made it my own and converted plugin management to pathogen._

Install
-------

First, [fork this repo](https://github.com/jklina/dotfiles) on Github.

Then, clone your Github fork (replace "your-github-name" with your Github name) onto your laptop and install it:

    git clone git@github.com:your-github-name/dotfiles.git
    cd dotfiles
    ./install.sh

This will create symlinks for all config files in your home directory. You can
safely run this file multiple times to update.

There is configuration for `zsh` so switch your shell from the default `bash` to `zsh` on OS X:

    chsh -s /bin/zsh

Since this configuration uses Pathogen to manage Vim's plugins use git submodules, you'll also have to initialize the submodules

    git submodule init

This will download all the submodules from git. You can update the Vim plugins using git's submodule management by running:

    git submodule update

Why fork?
---------

dotfiles are fairly personal. You should be able to modify your dotfiles, and save them in version control in your fork.

However, these dotfiles may be modified in the future and you want to be able to get those updates.

So, your master branch is meant for your customizations and use the `upstream` branch to get updates to this configuration.

Set up the upstream branch
--------------------------

You only have to do this once:

    git remote add upstream git@github.com:jklina/dotfiles.git
    git fetch upstream
    git checkout -b upstream upstream/master

Update thoughtbot's changes into your customizations
----------------------------------------------------

You will want to customize your environment. We suggest making changes in files that are not in this repository's core files.

For example, to customize your `zsh` config, make your changes in `~/.zshenv`:

    # RVM
    [[ -s '/Users/jklina/.rvm/scripts/rvm' ]] && source '/Users/jklina/.rvm/scripts/rvm'

    # recommended by brew doctor
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

Commit those kinds of things in your master branch.

Then, each time you want to update thoughtbot's changes.

    git checkout upstream
    git pull
    git checkout master
    git rebase upstream
