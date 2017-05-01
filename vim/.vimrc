""""""""""""""""""""""""""""""""""""""""
" .vimrc from scratch
""""""""""""""""""""""""""""""""""""""""

" Initialize plugin system
" vim-plug does `filetype plugin indent on`
call plug#begin('~/.vim/plugged')
" make sure to use single quotes

Plug 'alexpearce/gruvbox'
Plug 'w0rp/ale'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" plug settings
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" General configuration
""""""""""""""""""""""""""""""""""""""""

" UTF-8 encoding
set encoding=utf-8

" coloring
syntax enable
set background=dark
colorscheme gruvbox
" color the line numbers dark
hi LineNr ctermfg=237

" enable the mouse in terminal
set mouse=a

" smart case searching
set hlsearch
" search as chars entered
set incsearch
set ignorecase
set smartcase

" show line numbers
set number
" show command in bottom bar
set showcmd

" visual autocomplete for command menu
set wildmenu
" redraw only when we need to.
set lazyredraw
" highlight matching [{()}]
set showmatch

""""""""""""""""""""""""""""""""""""""""
" spaces & tabs
""""""""""""""""""""""""""""""""""""""""

" num of visual tab spaces per TAB 
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" tabs are spaces
set expandtab

""""""""""""""""""""""""""""""""""""""""
" Movement
""""""""""""""""""""""""""""""""""""""""

" Make delete key work as expected
set backspace=indent,eol,start

" move vertically by visual line
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""""""""""""""""
" OS X compatibility
""""""""""""""""""""""""""""""""""""""""

" Share OS X clipboard
" set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""

" change the leader key to space
let mapleader="\<space>"

" exit insert mode with jj
inoremap jj <esc>

" stop command window from popping up
map q: :q

" clear search highlighting with <space>,
nnoremap <leader>, :nohlsearch<cr>
