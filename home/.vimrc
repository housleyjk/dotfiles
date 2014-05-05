
if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

if has('gui_running')
  set guifont=Liberation\ Mono\ for\ Powerline\ 10
  " Maximize gvim window on startup
endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 let mapleader=","

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
 NeoBundleLazy 'tsukkee/unite-tag'
 NeoBundle 'Shougo/unite-sudo'
 NeoBundle 'Shougo/unite-ssh'
 NeoBundleLazy 'tacroe/unite-mark'
 NeoBundle 'Shougo/vimfiler.vim'
 NeoBundle 'jimsei/winresizer'
 NeoBundleLazy 'mhinz/vim-signify'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'mbbill/undotree'
 NeoBundle 'h1mesuke/unite-outline'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'nanotech/jellybeans.vim'
 NeoBundle 'vim-scripts/sudo.vim'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'housleyjk/vim-virtualenv'
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundleLazy 'mustache/vim-mustache-handlebars', {'autoload': {'filetypes': ['hbs', 'mustache', 'handlebars', 'html']}}
 NeoBundle 'edkolev/tmuxline.vim'
 NeoBundle 'edkolev/promptline.vim'
 NeoBundle 'epeli/slimux'
 NeoBundle 'housleyjk/vim-hybrid'

 NeoBundle 'christoomey/vim-tmux-navigator'
 NeoBundle 'Valloric/YouCompleteMe', {
   \ 'vim_version':'7.3.584',
   \ 'build' : { 'unix' : './install.sh --clang-completer' },
   \ }


 " Installation check.
 NeoBundleCheck

 " Key bindings
 filetype plugin indent on     " Required!
 syntax on
 set foldmethod=indent
 set background=dark
 set backspace=2
 set t_Co=256
 set number
 set tabstop=8
 set expandtab
 set shiftwidth=4
 set softtabstop=4
 set scrolloff=5
 set hlsearch
 set t_ut=
 colorscheme hybrid "jellybeans
 set guioptions-=T  "remove toolbar
 set guioptions-=m  "remove menu bar
 set guioptions-=r  "remove right-hand scroll bar
 set guioptions-=L  "remove left-hand scroll bar
 set nowrap
 set laststatus=2
 set completeopt="menu"

 imap <silent> <C-j> <Esc>:w<CR>
 nmap <silent> <C-j> :w<CR>
 vmap <silent> <C-y> "+y
 nmap <silent> <C-y> "+Y
 imap <silent> <C-p> <Esc> "+pi
 nmap <silent> <C-p> "+p
 nmap <silent> <Leader>ds :let _s=@/<Bar>:%s/\s\+$//<Bar>:let @/=_s<Bar>:noh<CR>

 " Auto commands
 au FileType html,htmldjango,php,phtml,javascript,vim,yaml setlocal shiftwidth=2 softtabstop=2

 " Unite Keys
 "call unite#filters#matcher_default#use(['matcher_fuzzy'])
 noremap <Leader><Leader> :Unite<Space>
 nnoremap <Leader>rf :Unite find:.<CR>
 nnoremap <leader>ra :Unite -start-insert file_rec/async:!<CR>
 nnoremap <Leader>f :Unite grep:*<CR>

" UniteSession Settings
let g:unite_source_session_enable_auto_save = 1


" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_buffers = 1
"let g:airline_theme="luna"
let g:airline_theme="lucius"

"VimFiler Settings
let g:vimfiler_as_default_explorer=1
let g:vimfiler_ignore_pattern = '^\.\|\.pyc$'
"let g:vimfiler_edit_action='tabopen'
nnoremap <Leader>x :VimFiler -explorer -toggle<CR>
nnoremap <Leader>e :VimFiler<CR>

" UndoTree Settings
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=1000 "maximum number lines to save for undo on a buffer reload
endif

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
          \  '--ignore bower_components --hidden -g '
endif

" Inline Task mappings
nmap <Leader>tl :Unite -silent -auto-resize grep:*::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tf :Unite -silent -auto-resize grep:%::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tr :Unite -silent -auto-resize grep:$buffer::TODO\|Todo\|todo\|FIXME\|NOTE<CR>

" mustache settings
autocmd BufNewFile,BufRead *.hbs setfiletype mustache

" syntastic settings
let g:syntastic_python_flake8_args='--ignore=F403'

" promptline settings
" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
  \'a' : [ promptline#slices#python_virtualenv() ],
  \'b' : [ promptline#slices#user() ],
  \'c' : [ promptline#slices#cwd() ],
  \'y' : [ promptline#slices#vcs_branch() ],
  \'warn' : [ promptline#slices#last_exit_code() ]}

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
