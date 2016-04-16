#!/usr/bin/env bash

app_name="OnceNeoVim"
config_dir="$HOME/.config/nvim"
app_dir=$(pwd)
[ -z "$VUNDLE_URI" ] && VIM_PULG_URI="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
    msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

clone_plug() {
    curl -fLo $config_dir/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ret="$?"
    success "$1"
}

setup_plug() {
    cp .plugins "$config_dir/init.vim"
    nvim -u "$config_dir/init.vim" .helptext
    cp .vimrc "$config_dir/init.vim"
    nvim +UpdateRemotePlugins +DeopleteEnable +qall
    ret="$?"
    success "$1"
}

setup_deoplete() {
    cd "$HOME/.config"
    git clone https://github.com/Shougo/deoplete.nvim.git nvim
    cd "$app_dir"
    ret="$?"
    success "$1"
}

setup_deoplete  "Install deoplete.nvim"
clone_plug      "Install vim_plug"
setup_plug      "Install Plugins"
msg             "\nThanks for using $app_name."
