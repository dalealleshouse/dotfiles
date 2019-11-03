execute pathogen#infect()
call pathogen#helptags()

set nospell     " spell check
set autochdir       " set directory to current file directory
set relativenumber  " relative line numbers
set showcmd     " show command I'm typing
set nowrap      " do not wrap long lines
set textwidth=80  " wrap at 79 characters
autocmd FileType c set tabstop=4
autocmd FileType javascript set shiftwidth=2
autocmd FileType html set shiftwidth=2
autocmd FileType yaml set shiftwidth=2
autocmd FileType json set shiftwidth=2
set ruler       " show line numbers

let mapleader = "\<Space>"     " space as leader
let g:mapleader = "\<Space>"   " space as leader

syntax enable
colorscheme molokai
set background=light

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
let &colorcolumn=join(range(81,999),",")
" autocmd FileType c let &colorcolumn=join(range(81,999),",")
" autocmd FileType c set textwidth=80

" autocmd FileType py let &colorcolumn=join(range(81,999),",")

" autocmd FileType markdown let &colorcolumn=join(range(81,999),",")
" autocmd FileType markdown set textwidth=80
autocmd FileType markdown set nofoldenable

" Navigate in a sane way
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Format entire file
nmap <Leader>= gg=G

" Filter js and map files for TS projects
nmap <Leader>f :let NERDTreeIgnore = ['\.a', '\.js$', '\.map$', '\.o', '\.so', '\.gcda', '\.gcno', '\.info']<ENTER>

" Spell Checking
autocmd BufNewFile,BufRead *.md set spell
nmap <Leader>s :set spell<ENTER>
nmap <Leader>ns :set nospell<ENTER>

nmap <Leader>" ysiw"
nmap <Leader>' ysiw'

nmap <Leader>x :YcmCompleter FixIt <CR>

" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

"""""""""""""""" autoformat """"""""""""""""
noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat

"""""""""""""""" NERDTree """"""""""""""""
let NERDTreeHijackNetrw = 1
nmap <Leader>w :NERDTreeToggle<CR>

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
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

autocmd FileType typescript syn clear foldBraces
autocmd FileType typescript set shiftwidth=2
autocmd filetype typescript noremap <F3> :set foldmethod=manual <CR> :Prettier<CR> :set foldmethod=syntax <CR>
autocmd filetype javascript noremap <F3> :set foldmethod=manual <CR> :Prettier<CR> :set foldmethod=syntax <CR>

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
autocmd FileType typescript set foldmethod=syntax
" za toggle a fold at the cursor.
" zo opens a fold at the cursor.
" zO opens all folds at the cursor.
" zc closes a fold under cursor.
" zM closes all open folds.
" zR opens all folds in file

let s:configfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=file'"
let s:noconfigfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{BasedOnStyle: WebKit, AlignTrailingComments: true, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.shiftwidth() : 'UseTab: Always').'}\"'"
let g:formatdef_clangformat = "g:ClangFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"

" prevent annoying bell everytime you reach the end of the file or line
set visualbell

:command WIP !bash -ic wip

" LaTeX
autocmd FileType tex set shiftwidth=2
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
let g:LatexBox_Folding=1
