execute pathogen#infect()
call pathogen#helptags()

set nospell     " spell check
set autochdir       " set directory to current file directory
set relativenumber  " relative line numbers
set showcmd     " show command I'm typing
set nowrap      " do not wrap long lines
set textwidth=79  " wrap at 79 characters
autocmd FileType c set tabstop=4
set ruler       " show line numbers

let mapleader = "\<Space>"     " space as leader
let g:mapleader = "\<Space>"   " space as leader

syntax enable
set background=dark
colorscheme molokai

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
nmap <Leader>p :CtrlP<ENTER>

filetype plugin indent on
set tabstop=4
set shiftwidth=4        " The number of space inserted when indent operators are used
set expandtab
autocmd FileType yaml set tabstop=2
autocmd FileType yaml set shiftwidth=2

" 80 columns yo
let &colorcolumn=join(range(80,999),",")
autocmd FileType c let &colorcolumn=join(range(80,999),",")
autocmd FileType c set textwidth=80

autocmd FileType py let &colorcolumn=join(range(80,999),",")

autocmd FileType markdown let &colorcolumn=join(range(80,999),",")
autocmd FileType markdown set textwidth=80
autocmd FileType markdown set nofoldenable

" Navigate in a sane way
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Format entire file
nmap <Leader>= gg=G

" Filter js and map files for TS projects
nmap <Leader>f :let NERDTreeIgnore = ['\.js$', '\.map$', '\.o', '\.so']<ENTER>

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

let g:syntastic_asm_checkers = ['nasm']
autocmd BufNewFile,BufRead *.asm set filetype=nasm

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

let g:pymode_python = 'python3'

autocmd FileType c set foldmethod=syntax
autocmd FileType cpp set foldmethod=syntax
autocmd FileType cxx set foldmethod=syntax
" za toggle a fold at the cursor.
" zo opens a fold at the cursor.
" zO opens all folds at the cursor.
" zc closes a fold under cursor.
" zM closes all open folds.
" zR opens all folds in file

let s:configfile_def = "'clang-format-6.0 -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=file'"
let s:noconfigfile_def = "'clang-format-6.0 -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{BasedOnStyle: WebKit, AlignTrailingComments: true, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.shiftwidth() : 'UseTab: Always').'}\"'"
let g:formatdef_clangformat = "g:ClangFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"
