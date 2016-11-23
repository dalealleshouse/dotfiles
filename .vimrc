execute pathogen#infect()
call pathogen#helptags()

set nospell     " spell check
set autochdir       " set directory to current file directory
set relativenumber  " relative line numbers
set showcmd     " show command I'm typing
set nowrap      " do not wrap long lines
" set textwidth=79  " wrap at 79 characters
set ruler       " show line numbers

let mapleader = "\<Space>"     " space as leader
let g:mapleader = "\<Space>"   " space as leader

syntax enable
set background=dark
colorscheme molokai

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

filetype plugin indent on
set tabstop=4
set shiftwidth=4        " The number of space inserted when indent operators are used
set expandtab
autocmd FileType yaml set tabstop=2
autocmd FileType yaml set shiftwidth=2

" 80 columns yo
let &colorcolumn=join(range(121,999),",")

" Navigate in a sane way
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Format entire file
nmap <Leader>= gg=G

" Filter js and map files for TS projects
nmap <Leader>f :let NERDTreeIgnore = ['\.js$', '\.map$']<ENTER>

" Spell Checking
autocmd BufNewFile,BufRead *.md set spell
nmap <Leader>s :set spell<ENTER>
nmap <Leader>ns :set nospell<ENTER>

nmap <Leader>" ysiw"
nmap <Leader>' ysiw'

" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

"""""""""""""""" autoformat """"""""""""""""
noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat

"""""""""""""""" NERDTree """"""""""""""""
let NERDTreeHijackNetrw = 1
nmap <Leader>w :NERDTreeToggle<CR>

set t_Co=256

"""""""""""""""" Syntastic """"""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_aggregate_errors = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

"""""""""""""""" TypeScript """"""""""""""""
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindo

autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

"""""""""""""""" closetag """"""""""""""""
" # filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

set noswapfile
set nobackup
set nowritebackup
