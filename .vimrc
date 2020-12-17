execute pathogen#infect()
call pathogen#helptags()

set clipboard=exclude:.*

set nojoinspaces " one space between paragraphs
set nospell     " spell check
set autochdir       " set directory to current file directory
set number
set relativenumber  " relative line numbers
set showcmd     " show command I'm typing
set nowrap      " do not wrap long lines
set textwidth=80  " wrap at 79 characters
autocmd FileType c set shiftwidth=2
autocmd FileType javascript set shiftwidth=2
autocmd FileType html set shiftwidth=2
autocmd FileType yaml set shiftwidth=2
autocmd FileType json set shiftwidth=2
set ruler       " show line numbers

let mapleader = "\<Space>"     " space as leader
let g:mapleader = "\<Space>"   " space as leader
let maplocalleader = "\<Space>"
let g:maplocalleader = "\<Space>"

syntax enable
colorscheme molokai
" colorscheme dracula
" colorscheme inkpot
" colorscheme jellybeans
" colorscheme badwolf
" set background=light

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
autocmd FileType markdown set nofoldenable
autocmd FileType markdown 
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+

" Navigate in a sane way
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Format entire file
nmap <Leader>= gg=G

" Filter js and map files for TS projects
nmap <Leader>f :let NERDTreeIgnore = ['\.d', '\.a', '\.js$', '\.map$', '\.o', '\.so', '\.gcda', '\.gcno', '\.info']<ENTER>

" Spell Checking
autocmd BufNewFile,BufRead *.md set spell
nmap <Leader>s :set spell<ENTER>
nmap <Leader>ns :set nospell<ENTER>

nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
nmap <Leader>` ysiw`

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
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
" let g:syntastic_aggregate_errors = 1

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1

" let g:syntastic_asm_checkers = ['nasm']
" let g:syntastic_python_checkers = ['flake8', 'mypy']

let g:ycm_show_diagnostics_ui = 0
" let g:syntastic_c_checkers = ['check', 'clang_tidy']
" let g:syntastic_cpp_checkers = ['clang_tidy']
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

" Folds
autocmd FileType c set foldmethod=syntax
autocmd FileType cpp set foldmethod=syntax
autocmd FileType cxx set foldmethod=syntax
autocmd FileType typescript set foldmethod=syntax
autocmd FileType python set foldmethod=indent
" za toggle a fold at the cursor.
" zo opens a fold at the cursor.
" zO opens all folds at the cursor.
" zc closes a fold under cursor.
" zM closes all open folds.
" zR opens all folds in file

let s:configfile_def = "'clang-format-10 -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=file'"
let s:noconfigfile_def = "'clang-format-10 -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{BasedOnStyle: WebKit, AlignTrailingComments: true, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.shiftwidth() : 'UseTab: Always').'}\"'"
let g:formatdef_clangformat = "g:ClangFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"

" prevent annoying bell everytime you reach the end of the file or line
set visualbell

" LaTeX Settings
" <Leader>ll Compile with latexmk.
" <Leader>lL Force compilation with latexmk.
" <Leader>lc Clean temporary output from LaTeX.
" <Leader>lC Clean all output from LaTeX.
" <Leader>lk Stop latexmk if it is running.
" <Leader>lg Show the running status of latexmk for the current buffer.
" <Leader>lG Show the running status of latexmk for all buffers with process group ID's.
" <Leader>le Load the log file for the current document and jump to the first error.
" <Leader>lf Recalculate the folds.
autocmd FileType tex set textwidth=100
autocmd FileType tex let &colorcolumn=join(range(101,999),",")
autocmd FileType tex set shiftwidth=2
let g:LatexBox_latexmk_preview_continuously=1 " Auto compile on change
let g:LatexBox_latexmk_options="-shell-escape"
let g:LatexBox_quickfix=2
let g:LatexBox_Folding=1
autocmd FileType tex setlocal spell
" View the pdf of the current file
:command LV ! xdg-open %:r.pdf
" let g:syntastic_tex_lacheck_quiet_messages = { 'regex': '\Vpossible unwanted space at' }
" let g:syntastic_quiet_messages = { 'regex': 'file not found' }

let g:grammarous#use_vim_spelllang=1

:command WIP !bash -ic wip

let g:ale_open_list = 1
let g:ale_linters = {
\    'c': ['ccls', 'clangd', 'clangtidy', 'cppcheck', 'cquery', 'flawfinder'],
\    'cpp': ['ccls', 'clangcheck', 'clangd', 'clangtidy', 'clazy', 'cppcheck', 'cpplint', 'cquery', 'flawfinder']
\}

" guentags
set tags=tags;/
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" <leader>cs  Find symbol (reference) under cursor
" <leader>cg  Find symbol definition under cursor
" <leader>cd  Functions called by this function
" <leader>cc  Functions calling this function
" <leader>ct  Find text string under cursor
" <leader>ce  Find egrep pattern under cursor
" <leader>cf  Find file name under cursor
" <leader>ci  Find files #including the file name under cursor
" <leader>ca  Find places where current symbol is assigned
" <leader>cz  Find current word in ctags database

"clang tools
" let g:clang_rename_path='/usr/bin/clang-rename-10'
" noremap <leader>cr :py3f /usr/lib/llvm-10/share/clang/clang-rename.py<cr>
noremap <leader>cr :py3f /home/dalealleshouse/clang-rename.py<cr>
noremap <leader>ci :pyf /usr/lib/llvm-10/share/clang/clang-include-fixer.py<cr>

map :cr :0r ~/.vim/cr_header.txt

