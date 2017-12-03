""""""""""""""""""""""""""""""""""""""""
" .vimrc from scratch
""""""""""""""""""""""""""""""""""""""""

" Initialize plugin system
" vim-plug does `filetype plugin indent on`
call plug#begin('~/.vim/plugged')
" make sure to use single quotes

Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" plug settings
""""""""""""""""""""""""""""""""""""""""

" only run on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
  \ 'python': ['flake8'],
  \}
" let g:ale_sign_error = 'ϟ'
" let g:ale_sign_warning = '∗'
" highlight link ALEErrorSign diffRemoved
" highlight link ALEWarningSign diffChanged

" YCM disable preview window
set completeopt-=preview
" global .ycm_extra_conf.py file
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

""""""""""""""""""""""""""""""""""""""""
" General configuration
""""""""""""""""""""""""""""""""""""""""

set nocompatible " use vim like it's 2017

" UTF-8 encoding
set encoding=utf-8

" coloring
syntax enable
set background=dark
colorscheme gruvbox

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

" remember position when reopening files
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""""""""""""""""""""""""""""""""""""""""
" backup stuff
""""""""""""""""""""""""""""""""""""""""

set undofile " turn on undo
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

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

" scrolling from vim-sensible
if !&scrolloff
  set scrolloff=7
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

""""""""""""""""""""""""""""""""""""""""
" OS X compatibility
""""""""""""""""""""""""""""""""""""""""

" Share OS X clipboard
set clipboard+=unnamed

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

""""""""""""""""""""""""""""""""""""""""
" Writing settings for txt files
""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.txt set spell

""""""""""""""""""""""""""""""""""""""""
" Goyo settings for Markdown files
""""""""""""""""""""""""""""""""""""""""
augroup markdown
    autocmd!
    autocmd Filetype markdown,mkd call SetUpMk()
                              \ | call pencil#init()
    autocmd Filetype text call SetUpMk()
                      \ | call pencil#init()
augroup END

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#concealcursor = 'n'  " n=normal, v=visual, i=insert, c=command (def) 

function! SetUpMk()
    " colorscheme pencil
    " execute `Goyo` if it's not already active
    if !exists('#goyo')
        Goyo
    endif
endfunction

function! GoyoBefore()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! GoyoAfter()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

""""""""""""""""""""""""""""""""""""""""
" Start Python PEP 8 stuff
""""""""""""""""""""""""""""""""""""""""

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start
" Stop python PEP 8 stuff

""""""""""""""""""""""""""""""""""""""""
" cia
""""""""""""""""""""""""""""""""""""""""

" :w!! write the file when you accidentally opened
" without the right (root) privileges
cmap w!! w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""
" looks for great fun
""""""""""""""""""""""""""""""""""""""""

" set from saved reddit post
hi vertsplit ctermfg=238 ctermbg=0
hi LineNr ctermfg=237
hi StatusLine ctermfg=0 ctermbg=245
hi StatusLineNC ctermfg=0 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=0
hi GitGutterAdd ctermbg=0 ctermfg=245
hi GitGutterChange ctermbg=0 ctermfg=245
hi GitGutterDelete ctermbg=0 ctermfg=245
hi GitGutterChangeDelete ctermbg=0 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=0

" set statusline=%=%P\ %f\ %m
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=%<\ %f\ %m%r%y%w%=%l\/%-6L\ %3c\ 
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode

filetype plugin indent on
set shiftwidth=4
set expandtab
set tabstop=4
