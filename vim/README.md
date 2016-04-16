VIM配置文件
=======

# What's this?
Vim dotfiles, aims at providing a **HAPPY** experience of coding and writing.

# Prerequisites
Version 7.4x should be OK, while 7.3x or before don't support Neocomplete.vim. What's more, proper python interface and lua support should be configured.

Reference:

* [Compile Vim](http://vim.wikia.com/wiki/Building_Vim)-`--with-features=huge` should be toggled on.
* [Vim - ArchLinux Packages](https://www.archlinux.org/packages/extra/x86_64/vim/)

**TODO**: Shifting to NeoVim, See [Why Neovim is Better than Vim](http://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/).

# Basic Usage

**Important**: When we talk about `<leader>`, we are actually talking about `,`, which can be tweaked in `.vimrc`.

## Plugins list and reference

If you get puzzling using these plugins, see the reference pages that follows. **Read The Manual, Luke!**, easy if you try.;-)

for general coding:

|Plugin|For What?|
|:-----|:--------|
|[Shougo/neocomplete.vim](https://github.com/Shougo/neocomplete.vim)|Auto completion|
|[Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)|Auto-completion for quotes, parens, brackets, etc.|
|[scrooloose/syntastic](https://github.com/scrooloose/syntastic)|Syntax checking|
|[scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)|Intensely orgasmic commenting|
|[godlygeek/tabular](https://github.com/godlygeek/tabular)|Text filtering and alignment|
|[easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)|Motion on speed|

for visual add-ons:

|Plugin|For What?|
|:-----|:--|
|[scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)|Tree explorer|
|[flazz/vim-colorschemes](https://github.com/flazz/vim-colorschemes)|Colorscheme pack|
|[bling/vim-airline](https://github.com/bling/vim-airline)|Status/tabline|
|[nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)|Visually displaying indent levels|
|[bronson/vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)|Highlights trailing whitespace in red and provides :FixWhitespace to fix it.|
|[kien/rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim)|Better Rainbow Parentheses|

for version control:

|Plugin|For What?|
|:-----|:--|
|[mhinz/vim-signify](https://github.com/mhinz/vim-signify)|Show a diff via Vim sign column|

for python users:

|Plugin|For What?|
|:-----|:--|
|[klen/python-mode](https://github.com/klen/python-mode)|"The plugin contains all you need to develop python applications in Vim."|

for web developers:

|Plugin|For What?|
|:-----|:--|
|[HTML-AutoCloseTag](https://github.com/vim-scripts/HTML-AutoCloseTag)|Automatically closes HTML tags once you finish typing.|
|[gorodinskiy/vim-coloresque](https://github.com/gorodinskiy/vim-coloresque)|Visualizing web colors|
|[hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)|CSS3 syntax support|

for writers:

|Plugin|For What?|
|:-----|:--------|
|[plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)|Markdown syntax highlighting, matching rules and mappings|
|[junegunn/goyo.vim](https://github.com/junegunn/goyo.vim)|Distraction-free writing|
|[junegunn/limelight.vim](https://github.com/junegunn/limelight.vim)|Hyperfocus-writing|
