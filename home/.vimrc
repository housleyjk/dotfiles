if has('vim_starting')
  set nocompatible               " be improved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if has('gui_running')
  set guifont=Liberation\ Mono\ for\ Powerline\ 10
  " Maximize gvim window on startup
endif

let mapleader=","

call neobundle#begin(expand('~/.vim/bundle/'))

" Bundles
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
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'jimsei/winresizer'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mbbill/undotree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'housleyjk/vim-virtualenv'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundleLazy 'mustache/vim-mustache-handlebars', {'autoload': {'filetypes': ['hbs', 'mustache', 'handlebars']}}
" NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'edkolev/promptline.vim'
NeoBundle 'epeli/slimux'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'SirVer/ultisnips', {'depends': 'honza/vim-snippets'}
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'elzr/vim-json'
NeoBundle 'godlygeek/tabular'
NeoBundle 'housleyjk/vim-hybrid'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'mitsuhiko/vim-jinja'
NeoBundle 'saltstack/salt-vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'chiel92/vim-autoformat'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'wting/rust.vim'
NeoBundle 'cespare/vim-toml'
NeoBundle 'ebfe/vim-racer'
NeoBundle 'vim-ember-script', {'depends': 'kchmck/vim-coffee-script'}
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'sophacles/vim-bundle-mako'
" NeoBundleLazy 'marijnh/tern_for_vim', {'build': {'unix': 'npm install'}}
NeoBundle 'Quramy/vison'
NeoBundle 'jwalton512/vim-blade'

call neobundle#end()

" Installation check.
NeoBundleCheck

" Editor settings
filetype plugin indent on     " Required!
syntax on
set nofoldenable
set foldmethod=indent
set foldlevelstart=1
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
colorscheme hybrid
set guioptions-=T  "remove toolbar
set guioptions-=m  "remove menu bar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set nowrap
set laststatus=2
set completeopt="menu"
set clipboard=unnamedplus
set backupdir=~/.vim/_backup//
set directory=~/.vim/_temp//

" Key bindings
nmap <silent> <Leader>ds :let _s=@/<Bar>:%s/\s\+$//<Bar>:let @/=_s<Bar>:noh<CR>
nnoremap ; :
nmap <silent> <Leader>s viwy<Leader>f<c-r>0<CR>

" Auto commands
au FileType html,htmldjango,php,phtml,javascript,vim,yaml,mustache,ruby,erb,htmljinja,jinja,sls,coffee,handlebars,hbs,html.handlebars setlocal shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.yaml set filetype=sls
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jinja2 set filetype=htmljinja
au BufNewFile,BufRead *.html set filetype=htmljinja
au BufNewFile,BufRead *.raml set filetype=yaml

" Unite Keys
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
noremap <Leader><Leader> :Unite<Space>
nnoremap <Leader>rf :Unite find:.<CR>
nnoremap <Leader>f :Unite grep:.<CR>

" UniteSession Settings
let g:unite_source_session_enable_auto_save = 1

" Airline Settings
let g:airline#extensions#tabline#enabled = 0
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
let g:airline_theme="lucius"

"VimFiler Settings
let g:vimfiler_as_default_explorer=1
let g:vimfiler_ignore_pattern = '^\.\|\.pyc$\|.*\.egg-info\|__pycache__\|node_modules\|tmp\|bower_components'
"let g:vimfiler_edit_action='tabopen'
nnoremap <Leader>x :VimFiler -explorer -toggle<CR>
nnoremap <Leader>e :VimFiler<CR>

" UndoTree Settings
if has("persistent_undo")
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000 "maximum number of changes that can be undone
  set undoreload=100 "maximum number lines to save for undo on a buffer reload
endif

"NERDcommenter Settings
nmap <Leader>/ <leader>c<Space>
vmap <Leader>/ <leader>c<Space>
let NERDSpaceDelims=1


"Use ag for searching
if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore node_modules --ignore bower_components --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr '''
    let g:unite_source_grep_recursive_opt = ''
  " let g:unite_source_grep_command = 'ag'
  " let g:unite_source_grep_default_opts =
        " \  '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
        " \  '.hg --ignore .svn --ignore .git --ignore .bzr ' .
        " \  '--ignore node_modules --ignore bower_components'
  " let g:unite_source_grep_recursive_opt = ''

  " let g:unite_source_rec_async_command =
        " \  'ag --nocolor --nogroup --ignore .hg --ignore .svn ' .
        " \  '--ignore .git --ignore .bzr --ignore node_modules ' .
        " \  '--ignore bower_components --hidden -g '
endif

" Inline Task mappings
nmap <Leader>tl :Unite -silent -auto-resize grep:*::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tf :Unite -silent -auto-resize grep:%::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tr :Unite -silent -auto-resize grep:$buffer::TODO\|Todo\|todo\|FIXME\|NOTE<CR>

" mustache settings
autocmd BufNewFile,BufRead *.hbs setfiletype mustache

" syntastic settings
let g:syntastic_python_flake8_args='--ignore=F403,E501'
let g:syntastic_debug = 0

" promptline settings
let g:promptline_preset = {
      \'a' : [ promptline#slices#python_virtualenv() ],
      \'b' : [ promptline#slices#user() ],
      \'c' : [ promptline#slices#cwd() ],
      \'y' : [ promptline#slices#vcs_branch() ],
      \'warn' : [ promptline#slices#last_exit_code() ]}

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-k>"

" YCM settings
function! s:activate_ycmvirtualenv(name)
  exe ':VirtualEnvActivate '.a:name
  exe ':YcmRestartServer'
endfunction

command! -bar -nargs=? Workon :call s:activate_ycmvirtualenv(<q-args>)

nmap <Leader>g :YcmCompleter GoToDefinition<CR>
" au FileType javascript nmap <Leader>g :TernDef<CR>

" Emmet settings
let g:user_emmet_leader_key='<c-h>'

" Tagbar settings
nmap <Leader>o :TagbarToggle<CR>

" Instant markdown settings
let g:instant_markdown_autostart = 0

" Easytag settings
let g:easytags_async = 1

" Racer settings
let $RUST_SRC_PATH = $HOME . '/Development/rust/src'
let g:ycm_rust_src_path = $HOME . '/Development/rust/src'

" Jinja2 settings
let g:htmljinja_disable_detection = 1
let g:htmljinja_disable_html_upgrade= 1

" Neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
