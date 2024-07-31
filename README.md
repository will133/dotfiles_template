# Dotfiles

This directory is following the scheme described in:

<https://www.jakewiesler.com/blog/managing-dotfiles>

Each directory is a module and use stow to manage them.

## Installation

Run these to symlink the dot files or run the stow command individual to manage
certain application:

    ./setup

## Other languages for lsp

    sudo apt-get update

For Java:

    sudo apt install default-jdk

For Mac:

    brew install neovim
    brew install ripgrep

Ubuntu (or running this in WSL):

If you get an error saying ruff can't be installed with the python lsp, you need
to do this:

    sudo apt install python3-venv
