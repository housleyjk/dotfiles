
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
 NeoBundle 'h1mesuke/unite-outline'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'tpope/vim-unimpaired'
 NeoBundle 'nanotech/jellybeans.vim'
 NeoBundle 'bling/vim-airline'
 NeoBundleLazy 'jmcantrell/vim-virtualenv', {'autoload': {'filetypes': ['python'] }}
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'tpope/vim-repeat'

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
 set hlsearch
 colorscheme jellybeans
 set guioptions-=T  "remove toolbar
 set nowrap
 set laststatus=2

 imap <silent> <C-j> <Esc>:w<CR>
 nmap <silent> <C-j> :w<CR>
 vmap <silent> <C-y> "+y
 nmap <silent> <C-y> "+Y
 imap <silent> <C-p> <Esc> "+pi
 nmap <silent> <C-p> "+p

 " VimProc Settings
 nmap ~ :VimProcBang<Space>

 " Unite Keys
 call unite#filters#matcher_default#use(['matcher_fuzzy'])
 noremap <Leader><Leader> :Unite<Space>
 nnoremap <Leader>f :Unite find:.<CR>
 nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>

" Airline Settings
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme="luna"

"VimFiler Settings
let g:vimfiler_as_default_explorer=1
"let g:vimfiler_edit_action='tabopen'
nnoremap <Leader>x :VimFiler -explorer -toggle<CR>

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

  let g:unite_source_rec_async_command =
          \  'ag --nocolor --nogroup --ignore .hg --ignore .svn ' .
          \  '--ignore .git --ignore .bzr --ignore node_modules ' .
          \  '--ignore bower_components --hidden -g '
endif

" Incode Task mappings
nmap <Leader>tl :Unite -silent -auto-resize grep:*::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tf :Unite -silent -auto-resize grep:%::TODO\|Todo\|todo\|FIXME\|NOTE<CR>
nmap <Leader>tr :Unite -silent -auto-resize grep:$buffer::TODO\|Todo\|todo\|FIXME\|NOTE<CR>


if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif

