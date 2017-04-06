Dotfiles
========

## Why dotfiles?

> Managing dotfiles with version control software such as Git helps to keep track of changes, share with others, and synchronize dotfiles across various hosts.

## A List

This repo contains dotfiles of:

* tmux
* zsh
* neovim

## Prerequisites

`git` and `curl` should be installed for fetching remote files, and at least one of the target softwares {tmux, zsh, neovim} should be installed, what's more, `python` should be installed to run the `install.py` script. Most of the package manager can do this, for instance, under ArchLinux

```bash
$ sudo pacman -S git curl python tmux zsh neovim
```

## How to install?

just run `install.py`, it's interactive, select the dotfiles you want to install ;-)

```bash
$ python3 install.py
```

## Cautions

**IMPORTANT**: re-login or manually execution of zsh is required to show the effects.

**IMPORTANT**: [NeoVim](https://github.com/neovim/neovim) is still under intensive development, please go to [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) and install neovim on your OS.

**IMPORTANT:** Since a known issue: [Neovim installer should be synchronous during `vim_starting` #104](https://github.com/junegunn/vim-plug/issues/104), you may be asked to manually close nvim once to finish the plugin install. "Either the jobwait function would have to be patched in neovim to support the starting use case or the python neovim client needs to receive aforementioned patch that @cHoco described..." So this won't be a problem forever.

