call plug#begin('~/.config/nvim/plugged')
Plug 'gmarik/vundle'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-signify'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'klen/python-mode'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

" Basics {
    set nocompatible        " Must be first line
" }


" 通用设置 {
    set background=dark
    filetype plugin indent on   " 自动检测文件类型
    syntax on                   " 开启语法高亮
    scriptencoding utf-8
    set shortmess+=filmnrxoOtT          " 过滤'hit enter to continue'
    set viewoptions=folds,options,cursor,unix,slash " Unix / Windows 兼容性设置
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0]) "git commit 默认在第一行进行
    " 恢复关闭时的位置
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
    " Rainbow!
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" }

" UI设置 {
    colorscheme Monokai
    set t_Co=256
    set t_ut=
    set showmode                    " 显示当前
    set cursorline                  " 高亮当前行
    highlight clear SignColumn      " 光标背景
    highlight clear LineNr          " 行标背景

    if has('cmdline_info')
        set ruler                   " 显示ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " ruler格式
        set showcmd                 " 显示正在输入的指令
    endif

    if has('statusline')
        set laststatus=2
        set statusline=%<%f\                     " 文件名
        set statusline+=%w%h%m%r                 " 选项
        set statusline+=\ [%{&ff}/%Y]            " 文件类型
        set statusline+=\ [%{getcwd()}]          " 当前目录
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " 导航信息
    endif

    set backspace=indent,eol,start  " Backspace键调整
    set whichwrap=b,s,h,l,<,>,[,]   " 光标在行首行末时自动换行
    set linespace=0                 " 行间距
    set nu                          " 开启行号
    "{搜索匹配
    set showmatch                   " 匹配高亮
    set incsearch                   " 实时搜索
    set hlsearch                    " 高亮匹配项
    set ignorecase                  " 忽略大小写
    set smartcase                   " 搜索输入含大写时切换为大小写敏感
    "}
    "{ 显示多余空白字符
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    "}
" }

" 格式 {
    set wrap                        " 自动折行
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    autocmd FileType html setlocal shiftwidth=2 tabstop=2   " smaller indent for html

    " Insert file header for html and python
    autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
    function! AutoSetFileHead()
        if &filetype == 'sh'
            call setline(1, "\#!/bin/bash")
        endif
        if &filetype == 'python'
            call setline(1, "\#!/usr/bin/env python")
            call append(1, "\# encoding: utf-8")
        endif
        normal G
        normal o
        normal o
    endfunc
" }

" Key Bindings {
    let mapleader = ','
    " 从光标位置复制到行末
    nnoremap Y y$
    " <leader>+/ 去除搜索高亮
    noremap <silent><leader>/ :nohls<CR>
    " ;快速进入命令行
    nnoremap ; :
" }

" Plugins {
    " Shougo/deoplete.nvim {
        " Use deoplete.
        let g:deoplete#enable_at_startup = 1
        " Use smartcase.
        let g:deoplete#enable_smart_case = 1

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
    " }
    " plasticboy/vim-markdown {
        " 禁止markdown折叠
        let g:vim_markdown_folding_disabled=1
        " LaTeX数学公式高亮
        let g:vim_markdown_math=1
    " }

    " NerdTree {
        if isdirectory(expand("~/.config/nvim/plugged/nerdtree"))
            let g:NERDShutUp=1
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>n :NERDTreeFind<CR>
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
        endif
    " }

    " Python-Mode {
        " 关闭PyMode的自动补全
        let g:pymode_rope_completion = 0
        let g:pymode_robe_autoimport = 0
    " }

    " indent_guides {
        if isdirectory(expand("~/.config/nvim/plugged/vim-indent-guides/"))
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
        endif
    " }

    " vim-airline {
        if isdirectory(expand("~/.config/nvim/plugged/vim-airline/"))
            let g:airline_theme = 'light'
        endif
    " }

" GUI Settings {
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
    endif
" }
