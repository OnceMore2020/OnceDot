#!/bin/sh

cwd=$(pwd)

echo "Install tmux configure files..."
echo "links to $HOME/.tmux.conf"
ln -sf $cwd/_tmux.conf $HOME/.tmux.conf

echo "Configuring zsh"
ln -sf $cwd/.zshrc ~/.zshrc
ln -sf $cwd/.zsh_aliases ~/.zsh_aliases
wget https://github.com/halfo/lambda-mod-zsh-theme/raw/master/lambda-mod.zsh-theme
mv $cwd/lambda-mod.zsh-theme ~/.oh-my-zsh/themes/lambda-mod.zsh-theme

exit 0
