
if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

if has('gui_running')
  set guifont=Liberation\ Mono\ for\ Powerline\ 10
endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 let mapleader=","
 let g:neobundle#types#git#default_protocol = 'git' 

 " Bundles
 " Note: You don't set neobundle setting in .gvimrc!
 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'
 NeoBundle 'Shougo/neobundle-vim-recipes'

 NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }


 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/unite-session'
 NeoBundle 'tsukkee/unite-tag' 
 NeoBundle 'Shougo/unite-sudo'
 NeoBundle 'Shougo/neocomplete.vim'
 NeoBundle 'Shougo/vimshell.vim'
 NeoBundle 'Shougo/neosnippet.vim'
 NeoBundle 'Shougo/vimfiler.vim'
 NeoBundle 'jimsei/winresizer'  
 NeoBundleLazy 'klen/python-mode'
 NeoBundle 'davidhalter/jedi-vim'
 NeoBundle 'mhinz/vim-signify'
 NeoBundle 'bling/vim-bufferline'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'mbbill/undotree' 
 NeoBundle 'h1mesuke/unite-outline' 
 NeoBundle 'scrooloose/syntastic' 
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundleLazy 'spf13/PIV' 
 NeoBundle 'tpope/vim-unimpaired'
 NeoBundle 'nanotech/jellybeans.vim'
 NeoBundle 'vim-scripts/sudo.vim'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'jmcantrell/vim-virtualenv'
 NeoBundle 'kannokanno/unite-todo' 


 " Installation check.
 NeoBundleCheck

 " Key bindings
 filetype plugin indent on     " Required!
 syntax on
 set background=dark
 set t_Co=256
 set number
 set tabstop=8
 set expandtab
 set shiftwidth=4
 set softtabstop=4
 set scrolloff=5
 colorscheme jellybeans
 set nowrap
 imap <C-s> <Esc>:w<CR>i
 imap <C-y> <Esc>"+y
 nmap <C-y> "+y
 imap <C-p> <Esc>"+p
 nmap <C-p> "+p

 " Unite Keys
 call unite#filters#matcher_default#use(['matcher_fuzzy'])
 noremap <Leader><Leader> :Unite<Space>
 nnoremap <Leader>f :Unite find:.<CR>
 nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>

" UniteSession Settings
let g:unite_source_session_enable_auto_save = 1


" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.branch = "\uf020"
let g:airline#extensions#tabline#fnamemod = ':t'


" Neocomplete Settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ }

" Define keyword.
 if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
 endif
 let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
 inoremap <expr><C-g> neocomplete#undo_completion()
 inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
   " For no inserting <CR> key.
   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
 endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
 let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'


let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

"let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" NeoSnippet Settings

map <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
 imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

" For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

"VimFiler Settings
let g:vimfiler_as_default_explorer=1
"let g:vimfiler_edit_action='tabopen'
nnoremap <Leader>x :VimFiler -explorer -toggle<CR>

" Python-mode
" Deactivate rope
" Keys:
" K             Show python docs
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

autocmd FileType python NeoBundleSource python-mode
"autocmd FileType python NeoBundleSource jedi-vim
"autocmd FileType python NeoBundleDisable Neocomplete

let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key='K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
" let g:pymode_folding = 0

" UndoTree Settings
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

" PIV Settings

"Load PIV for php files
autocmd FileType php NeoBundleSource PIV
autocmd FileType php NeoBundleDisable neocomplete

"NERDcommenter Settings
 nmap <Leader>/ <leader>c<Space>
 vmap <Leader>/ <leader>c<Space>

"Use ag for searching
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
      \  '--line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '.hg --ignore .svn --ignore .git --ignore .bzr ' .
      \  '--ignore node_modules --ignore bower_components'
  let g:unite_source_grep_recursive_opt = ''

  let g:unite_source_rec_async_command =
	  \  'ag --nocolor --nogroup --ignore .hg --ignore .svn ' .
	  \  '--ignore .git --ignore .bzr --ignore node_modules ' .
	  \  '--ignore bower_components --hidden -g ""'
endif

"VimShell Settings
autocmd filetype vimshell inoremap <buffer> <expr><silent> <Up> unite#sources#vimshell_history#start_complete(!0)


" Todo Settings
nmap <Leader>ts :UniteTodoAddSimple<Space>
nmap <Leader>tb :UniteTodoAddBuffer<Space>

" Incode Task mappings
nmap <Leader>tl :Unite -silent -auto-resize grep:*::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tf :Unite -silent -auto-resize grep:%::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tr :Unite -silent -auto-resize grep:$buffer::TODO\|Todo\|todo\|FIXME\|NOTE<CR>


if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif

