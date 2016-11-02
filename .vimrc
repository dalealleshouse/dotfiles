execute pathogen#infect()
call pathogen#helptags()

set spell		" spell check
set autochdir		" set directory to current file directory
set relativenumber	" relative line numbers
set showcmd		" show command I'm typing
set nowrap		" do not wrap long lines
set textwidth=79	" wrap at 79 characters
set ruler		" show line numbers

let mapleader = "\<Space>"     " space as leader
let g:mapleader = "\<Space>"   " space as leader

syntax enable
set background=dark
colorscheme molokai

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

" 80 columns yo
let &colorcolumn=join(range(121,999),",")

" Navigate in a sane way
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" NERDTree
let NERDTreeHijackNetrw = 1
nmap <Leader>w :NERDTreeToggle<CR>

set t_Co=256
