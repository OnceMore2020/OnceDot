#!/usr/bin/env python3
# encoding: utf-8

import os

OMZ_REPO = 'https://github.com/robbyrussell/oh-my-zsh.git'
VP_REPO = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


def main():
    install_list = input('Choose the dotfiles you want to install: \
                         (e.g. 1,2,4)\n1):tmux 2):zsh 3):neovim\n')
    items = install_list.split(',')
    if len(items) == 0:
        print('No item selected!')
        return
    work_dir = os.getcwd()
    home_dir = os.getenv('HOME')
    for item in items:
        if item == '1':
            print('Configuring tmux...')
            os.system('rm -rf ' + os.path.join(home_dir, '.tmux.conf'))
            source_conf = os.path.join(work_dir, 'tmux/_tmux.conf')
            target_conf = os.path.join(home_dir, '.tmux.conf')
            os.system('ln -sf ' + source_conf + ' ' + target_conf)
        if item == '2':
            print('Configuring zsh...')
            print('Installing oh-my-zsh...')
            os.system('rm -rf ' + os.path.join(home_dir, '.oh-my-zsh'))
            os.system('rm -f ' + os.path.join(home_dir, '.zshrc'))
            os.system('rm -f ' + os.path.join(home_dir, '.zsh_aliases'))
            os.system('git clone --depth=1 ' + OMZ_REPO +
                      ' ' + os.path.join(home_dir, '.oh-my-zsh'))
            os.system('ln -sf ' + os.path.join(work_dir, 'zsh/_zshrc') +
                      ' ' + os.path.join(home_dir, '.zshrc'))
            os.system('ln -sf ' + os.path.join(work_dir, 'zsh/_zsh_aliases') +
                      ' ' + os.path.join(home_dir, '.zsh_aliases'))
            print('Changing default shell(input your password to continue):')
            os.system('chsh -s /usr/bin/zsh')
        if item == '3':
            print('Configuring neovim...')
            os.system('rm -rf ' + home_dir + '/.config/nvim')
            print('Installing vim-plug...')
            os.system('curl -fLo ~/.config/nvim/autoload/plug.vim ' +
                      '--create-dirs ' + VP_REPO)
            os.system('nvim -u ' + work_dir + '/neovim/.plugins ' +
                      work_dir + '/neovim/.helptext')
            os.system('ln -sf ' + work_dir + '/neovim/.init.vim ' +
                      home_dir + '/.config/nvim/init.vim')
            os.system('nvim +UpdateRemotePlugins +qall')
            print('neovim configuration file created at ~/.config/nvim')
            print('-----------------------------------------------------')


if __name__ == '__main__':
    main()
