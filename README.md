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

Adding a plugin
---------------

I add plugins by adding them as submodules in my repository. That way they're easy to update. This can be done with the following command:

`git submodule add [Module's git URL] vim/bundle/[Module folder name]`

Once the module is added you have to initialize it:

`git submodule init`

Updating a plugin
-----------------

To update a plugin/submodule, you must first navigate to the directory of the submodule:

`cd vim/bundle/[module name]`

Then checkout the latest version of the plugin:

`git checkout master`

and pull in the changes:

`git pull origin master`

Finally, you'll have to go back to the root directory and commit the changes to the submodule to the root project, so in the dotfiles directory:

`git add vim/bundle/[module name]`
`git commit -m "Updating submodule [module name] to latest version"`
`git push`

Removing a plugin
-----------------

To remove a plugin/submodule you have to remove reference from the `.gitmodules` and the `.git/config` files.

Then remove the submodule from your repository:

`git rm -cached vim/bundle/[module name]`

Customizing your environment
----------------------------

You will want to customize your environment. We suggest making changes in files that are not in this repository's core files.

For example, to customize your `zsh` config, make your changes in `~/.zshenv`:

    # RVM
    [[ -s '/Users/jklina/.rvm/scripts/rvm' ]] && source '/Users/jklina/.rvm/scripts/rvm'

    # recommended by brew doctor
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

Commit those kinds of things in your master branch.

Then, each time you want to update this repo's changes.

    git checkout upstream
    git pull
    git checkout master
    git rebase upstream
