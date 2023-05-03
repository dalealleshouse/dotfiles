" source $XDG_CONFIG_HOME/nvim/init.vim
augroup myConfig
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
augroup END

syntax on

" set clipboard=exclude:.*

set nospell     " spell check
set autochdir       " set directory to current file directory
set number
set relativenumber  " relative line numbers
set showcmd     " show command I'm typing
set nowrap      " do not wrap long lines
set ruler       " show line numbers

let mapleader = "\<Space>"     " space as leader
let g:mapleader = "\<Space>"   " space as leader
let maplocalleader = "\<Space>"
let g:maplocalleader = "\<Space>"

" Navigate in a sane way
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set textwidth=80  " wrap at 79 characters
" Color columns
let &colorcolumn=join(range(81,999),",")
autocmd FileType markdown set nofoldenable
autocmd FileType markdown
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+

" markdown formatting
autocmd FileType markdown set nofoldenable
autocmd FileType markdown
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+

" https://github.com/ctrlpvim/ctrlp.vim
nmap <Leader>p :CtrlP<ENTER>

set visualbell
set noerrorbells

set background=light
set termguicolors
colorscheme zenburn

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
augroup END

"" JavaScript , TypeScript
autocmd FileType javascript set shiftwidth=2
autocmd FileType typescript syn clear foldBraces
autocmd FileType typescript set shiftwidth=2
autocmd FileType typescriptreact set shiftwidth=2
autocmd FileType typescriptreact syn clear foldBraces
autocmd FileType tsx set shiftwidth=2

" Spell Checking
autocmd BufNewFile,BufRead *.md set spell
nmap <Leader>s :set spell<ENTER>
nmap <Leader>ns :set nospell<ENTER>

"""""""""""""""" NERDTree """"""""""""""""
let NERDTreeHijackNetrw = 1
nmap <Leader>w :NERDTreeToggle<CR>

"let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\    'c': ['clangtidy', 'clangd', 'clang'],
\    'cpp': ['clangtidy'],
\   'jsx':  ['stylelint', 'eslint'],
\   'markdown':  ['languagetool'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format', 'clangtidy'],
\   'javascript': ['eslint'],
\}


filetype plugin indent on
set tabstop=4
set shiftwidth=4        " The number of space inserted when indent operators are used
set expandtab
autocmd FileType yaml set tabstop=2
autocmd FileType html set shiftwidth=2
autocmd FileType json set shiftwidth=2
autocmd FileType typescript setlocal foldmethod=syntax

" Surround with
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
nmap <Leader>` ysiw`

let g:loaded_perl_provider = 0
let g:ycm_enable_inlay_hints = 1
let g:python3_host_prog = expand('~/.config/nvim/envs/neovim_py/bin/python')

let g:prettier#exec_cmd_async = 1
let g:prettier#config#use_tabs = 'false'
nnoremap <F3> :PrettierAsync<CR>

" LanguageTool
let g:languagetool_server_jar = expand('~/LanguageTool-6.1-stable/languagetool-server.jar')
autocmd User LanguageToolCheckDone LanguageToolSummary
autocmd Filetype markdown LanguageToolSetUp

set printdevice=Brother
