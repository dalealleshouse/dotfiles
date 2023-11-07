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

let g:ale_open_list = 0
let g:ale_fix_on_save = 1
let g:ale_linters = {
\    'c': ['clangtidy', 'clangd', 'clang'],
\    'cpp': ['clangtidy'],
\   'jsx':  ['stylelint', 'eslint'],
\   'markdown':  ['languagetool'],
\   'cs':  ['OmniSharp'],
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
autocmd filetype typescript noremap <F3> :PrettierAsync<CR>
autocmd filetype javascript noremap <F3> :PrettierAsync<CR>
autocmd filetype cs noremap <F3>: :OmniSharpCodeFormat <CR>

let g:OmniSharp_server_use_net6 = 1

set completeopt=menuone,noinsert,noselect,preview
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:ycm_filetype_blacklist = { 'cs': 1 }

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END


" LanguageTool
" let g:languagetool_server_jar = expand('~/LanguageTool-6.1-stable/languagetool-server.jar')
" autocmd User LanguageToolCheckDone LanguageToolSummary
" autocmd Filetype markdown LanguageToolSetUp

" set printdevice=Brother
