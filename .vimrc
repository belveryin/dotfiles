"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('kien/ctrlp.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('mileszs/ack.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('ap/vim-css-color')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-repeat')
call dein#add('maksimr/vim-jsbeautify')
call dein#add('tpope/vim-surround')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('scrooloose/syntastic')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-fugitive')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Quramy/tsuquyomi')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" Getting rid of swap/backup/undo files in the current directory.
" Create folders in your home dir:
" .vim-backup
" .vim-undo
" .vim-swap
set backupdir=$HOME/.vim-backup//
set undodir=$HOME/.vim-undo//
set directory=$HOME/.vim-swap//

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
set relativenumber
set number

"set incremental and highlight search
set incsearch
set hlsearch

"ctrl+s to save current buffer
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Bubble single lines
nmap <C-A-k> [e
nmap <C-A-j> ]e
" Bubble multiple lines
vmap <C-A-k> [egv
vmap <C-A-j> ]egv

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

" disable gui options
if has('gui_running')
    :set guioptions-=m  "remove menu bar
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=L  "remove left-hand scroll bar
    " maximize window on startup
    " Maximize gvim window (for an alternative on Windows, see simalt below).
    :set lines=999
    :set columns=999
endif

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

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|bower_components|dist|coverage|tmp|target|\.idea)$',
  \ 'file': '\v\.(class|log)$',
  \ }

"ack
let g:ack_default_options = " -s -H --nocolor --nogroup --column --ignore-dir={build,docs,scratch,dist,bower_components,node_modules,coverage,tmp,log,target}"
" let Ack_Exclude_Dirs = 'build docs'
noremap <Leader>a :Ack! <cword><cr>
nnoremap <Leader>f :Ack!<Space>
let g:ackhighlight = 1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"disable by default (slow in java)
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers=['jshint']
" use eslint if .eslintrc is found
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc.js', '.;') != '' ? ['eslint'] : ['jshint']

let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_disable_default_mappings = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" jsbeautifier
map <C-A-f> :call JsBeautify()<cr>

" editorconfig
" make sure that editorconfig works well with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" delete trailing spaces at the end of the line
autocmd BufWritePre *.* :%s/\s\+$//e

" force html syntax on hbs files
au BufReadPost *.hbs set syntax=html

"=====[ Highlight matches when jumping to next ]=============

    " This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>

    highlight WhiteOnRed ctermbg=red guibg=white

    " OR ELSE just highlight the match in red...
    function! HLNext (blinktime)
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#'.@/
        let ring = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'
        call matchdelete(ring)
        redraw
    endfunction

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list


" file type detect which detects node.js shebang thanks to:
" https://github.com/mmalecki/vim-node.js
    function! DetectNode()
        if !did_filetype()
            if getline(1) =~ '^#.*node'
                setfiletype javascript
            endif
        endif
    endfunction

    :au BufNewFile,BufRead * call DetectNode()

" enable airline
set laststatus=2
" the glyphs don't work with gvim
" if !has('gui_running')
    " let g:airline_powerline_fonts = 1
" endif
" Broken down into easily includeable segments
let g:syntastic_enable_signs=1
let g:airline_section_c='%<%f\%w%h%m%r% [%{getcwd()}]'
