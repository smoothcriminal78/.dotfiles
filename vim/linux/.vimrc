set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#rc()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Generic

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Bundle "itchyny/lightline.vim"
" Plugin 'terryma/vim-multiple-cursors'
" Bundle 'rking/ag.vim'

" Git

" Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'

" Syntax hightlighting & colors

Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'

" Completion & snippets

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

" JavaScript

" Bundle "pangloss/vim-javascript"
" Plugin 'marijnh/tern_for_vim'

" Scala

Plugin 'derekwyatt/vim-scala'

" Other

Plugin 'wesQ3/vim-windowswap'
" Plugin 'tpope/vim-markdown'
" Plugin 'mattn/emmet-vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.


" All of your Plugins must be added before the following line
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" General

set nocompatible	            " be iMproved, required
set number		                "Line numbers are good
set hidden		                "Hide buffer instead of closing it
set laststatus=2                "Always display the status line
set autoread                    "Reload files changed outside vim
set visualbell                  "No sounds
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom

" Key mappings

let mapleader=","
vnoremap <C-c> "*y                  " Copy to system buffer
nnoremap <leader><space> :noh<cr>   " Clear search highlighting with ,<space>
nnoremap <tab> :bnext<cr>           " Tab to next buffer
nnoremap <s-tab> :bprevious<cr>     " Shift-tab to previous buffer
nnoremap <leader><leader> <C-^>     " Switch between last two buffers

" Swap file and backups

set noswapfile

" Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set wildmenu
set wcm=<Tab>

" Enable loading the plugin/indent files for specific file types

filetype plugin indent on

" Wrapping

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Folding

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" Colors

syntax on
set background=dark " for the dark version
" set background=light " for the light version
" colorscheme one
" colorscheme deep-space
" colorscheme delek
let g:one_allow_italics = 1

" Scrolling

set scrolloff=4
set sidescrolloff=15
set sidescroll=1

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 6

" Encoding menu

menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

" NERDTree

nmap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
