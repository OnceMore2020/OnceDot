#!/usr/bin/env python
# encoding: utf-8

import os

def main():
    install_list = input('Choose the dotfiles you want to install:(e.g. 1,2,4)\n1):tmux 2):zsh 3):vim 4):neovim\n')
    items = install_list.split(',')
    if(len(items)==0):
        print('No item selected!')
        return
    work_dir = os.getcwd()
    home_dir = os.getenv('HOME')
    for item in items:
        if item == '1':
            print('Configuring tmux...')
            os.system('rm -rf ' + home_dir + '/.tmux.conf')
            os.system('ln -sf ' + work_dir + '/tmux/_tmux.conf ' + home_dir +'/.tmux.conf')
            print('tmux configuration file created at ~/.tmux.conf')
            print('-----------------------------------------------')
        if item == '2':
            print('Configuring zsh...')
            print('Installing oh-my-zsh...')
            os.system('rm -rf ' + home_dir + '/.oh-my-zsh')
            os.system('rm -f ' + home_dir + '/.zshrc')
            os.system('rm -f ' + home_dir + '/.zsh_aliases')
            os.system('git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh')
            os.system('ln -sf ' + work_dir + '/zsh/.zshrc ' + home_dir +'/.zshrc')
            os.system('ln -sf ' + work_dir + '/zsh/.zsh_aliases ' + home_dir +'/.zsh_aliases')
            os.system('curl -fLo ' + home_dir + '/.oh-my-zsh/themes/lambda-mod.zsh-theme https://github.com/halfo/lambda-mod-zsh-theme/raw/master/lambda-mod.zsh-theme')
            print('Changing default shell(input your password to continue):')
            os.system('chsh -s /usr/bin/zsh')
            print('zsh configuration file created at ~/.zshrc, ~/.zsh_aliases and ~/.oh-my-zsh')
            print('---------------------------------------------------------------------------')
        if item == '3':
            print('Configuring vim...')
            os.system('rm -rf ' + home_dir + '/.vim*')
            print('Installing vim-plug...')
            os.system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
            #os.system('ln -sf ' + work_dir + '/vim/.plugins ' + home_dir + '/.vimplugins')
            os.system('vim -u ' + work_dir + '/vim/.plugins +PlugInstall +qall')
            os.system('ln -sf ' + work_dir + '/vim/.vimrc ' + home_dir + '/.vimrc')
            os.system('vim -u ' + home_dir + '/.vimrc +PlugUpdate +PlugStatus +qall')
            print('vim configuration file created at ~/.vim and ~/.vimrc')
            print('-----------------------------------------------------')
        if item == '4':
            print('Configuring neovim...')
            os.system('rm -rf ' + home_dir + '/.config/nvim')
            print('Installing deoplete.vim...')
            os.system('git clone https://github.com/Shougo/deoplete.nvim.git ' + home_dir + '/.config/nvim')
            print('Installing vim-plug...')
            os.system('curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
            os.system('nvim -u ' + work_dir + '/neovim/.plugins ' + work_dir + '/neovim/.helptext')
            os.system('ln -sf ' + work_dir + '/neovim/.init.vim ' + home_dir + '/.config/nvim/init.vim')
            os.system('nvim +UpdateRemotePlugins +qall')
            print('neovim configuration file created at ~/.config/nvim')
            print('-----------------------------------------------------')


if __name__ == '__main__':
    main()
