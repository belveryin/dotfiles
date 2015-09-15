set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'mileszs/ack.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
"solarized
if has('gui_running')
    set background=dark
    colorscheme solarized
endif

"set 4 spaces to tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"indentation
set smartindent
set autoindent

"set line number
set number

"set incremental and highlight search
set incsearch
set hlsearch

"ctrl+s to save current buffer
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"change leader to ,
let mapleader = "," 

"" vimrc
"map vimrc editing
nmap <leader>v :tabedit $MYVIMRC<CR>
" Source the vimrc file after saving it. This way, you don't have to
" reload Vim to see the changes.
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
endif
"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>
"show bookmarks on startup
let NERDTreeShowBookmarks=1

"ack
let g:ack_default_options = " -s -H --nocolor --nogroup --column --ignore-dir={build,docs,scratch,dist,bower_components,node_modules,coverage}"
noremap <Leader>a :Ack! <cword><cr>

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

if has('gui_running')
    "remove menu bar
    set guioptions-=m  
    "remove toolbar
    set guioptions-=T
    "remove right-hand scroll bar
    set guioptions-=r
    "remove left-hand scroll bar
    set guioptions-=L
endif

"jshint2
" let jshint2_save = 1
