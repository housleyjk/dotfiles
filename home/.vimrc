
if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 let mapleader=","
 let g:neobundle#types#git#default_protocol = 'git'

 " Bundles
 " Note: You don't set neobundle setting in .gvimrc!
 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'tacroe/unite-mark'
 NeoBundle 'Shougo/vimfiler.vim'
 NeoBundle 'jimsei/winresizer'
 NeoBundle 'mhinz/vim-signify'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'mbbill/undotree'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'tpope/vim-unimpaired'
 NeoBundle 'housleyjk/vim-hybrid'
 NeoBundle 'bling/vim-airline'
 NeoBundleLazy 'housleyjk/vim-virtualenv', {'autoload': {'filetypes': ['python'] }}
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'saltstack/salt-vim'
 NeoBundle 'elzr/vim-json'
 NeoBundleLazy 'mustache/vim-mustache-handlebars', {'autoload': {'filetypes': ['hbs', 'mustache', 'handlebars', 'html']}}
 NeoBundle 'edkolev/tmuxline.vim'
 NeoBundle 'edkolev/promptline.vim'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundle 'nanotech/jellybeans.vim'
 NeoBundle 'majutsushi/tagbar'

 " Installation check.
 NeoBundleCheck

 " Editor settings
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
 set hlsearch
 colorscheme hybrid
 set guioptions-=T  "remove toolbar
 set nowrap
 set laststatus=2
 set backupdir=~/.vim/_backup//
 set directory=~/.vim/_temp//


 " Key bindings
 nmap <silent> <Leader>ds :let _s=@/<Bar>:%s/\s\+$//<Bar>:let @/=_s<Bar>:noh<CR>
 nnoremap ; :

 " Unite Keys
 "call unite#filters#matcher_default#use(['matcher_fuzzy'])
 noremap <Leader><Leader> :Unite<Space>
 nnoremap <Leader>rf :Unite find:.<CR>
 nnoremap <leader>ra :Unite -start-insert file_rec/async:!<CR>
 nnoremap <Leader>f :Unite grep:*<CR>

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
let g:vimfiler_ignore_pattern = '^\.\|\.pyc$'
"let g:vimfiler_edit_action='tabopen'
nnoremap <Leader>x :VimFiler -explorer -toggle<CR>
nnoremap <Leader>e :VimFiler<CR>

" UndoTree Settings
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
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

endif

" Incode Task mappings
nmap <Leader>tl :Unite -silent -auto-resize grep:*::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tf :Unite -silent -auto-resize grep:%::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tr :Unite -silent -auto-resize grep:$buffer::TODO\|Todo\|todo\|FIXME\|NOTE<CR>

" syntastic settings
let g:syntastic_python_flake8_args='--ignore=F403'
let g:syntastic_debug = 0

" promptline settings
let g:promptline_preset = {
    \'a' : [ promptline#slices#python_virtualenv() ],
    \'b' : [ promptline#slices#user() ],
    \'c' : [ promptline#slices#cwd() ],
    \'y' : [ promptline#slices#vcs_branch() ],
    \'warn' : [ promptline#slices#last_exit_code() ]}

command! -bar -nargs=? Workon :call s:activate_ycmvirtualenv(<q-args>)

" Tagbar settings
nmap <Leader>o :TagbarToggle<CR>

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif

