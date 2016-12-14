set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#rc()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Generic
Plugin 'scrooloose/nerdtree'            " File browser
Plugin 'kien/ctrlp.vim'                 " Working with buffers
Plugin 'majutsushi/tagbar'              " Class/module browser (Ctags required)

" Status line
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes' " ---dependencies

" Completion & snippets
Plugin 'garbas/vim-snipmate'            " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " ---dependencies #1
Plugin 'tomtom/tlib_vim'                " ---dependencies #2
Plugin 'honza/vim-snippets'             " ---snippets repo
Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-commentary'           " Comment stuff out

" Syntax hightlighting & colors
Plugin 'scrooloose/syntastic'           " Syntax highlighting
Plugin 'morhetz/gruvbox'                " Colorscheme

" Git
Plugin 'fugitive.vim'
Plugin 'airblade/vim-gitgutter'

" CSV
Plugin 'csv.vim'                        " CSV plugin

" Scala
Plugin 'derekwyatt/vim-scala'           " Scala plugin

" Other
Plugin 'wesQ3/vim-windowswap'           " Swapping windows
call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on
syntax on

" General
set visualbell t_vb=            " turn off error beep/flash
set novisualbell                " turn off visual bell
set ls=2                        " always show status bar
set incsearch                   " incremental search
set hlsearch                    " highlighted search results
set nu                          " line numbers
set scrolloff=5                 " keep some more lines for scope
set showmatch                   " show matching brackets/parenthesis
set matchtime=0                 " don't blink when matching
set showmode                    " show current mode down the bottom
set smarttab                    " set smarttab
set encoding=utf-8              " utf-8 default encoding
set clipboard=unnamedplus       " use system clipboard
set backspace=indent,eol,start
set mousemodel=popup
set ruler
set completeopt-=preview
set gcr=a:blinkon0
set ttyfast
set switchbuf=useopen
set t_Co=256
set laststatus=2

" Menus
aunmenu Help. 
aunmenu Window.
let no_buffers_menu=1
set wildmenu                    " customize the wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" Scrolling
set scrolloff=4
set sidescrolloff=15
set sidescroll=1

" Backup and swap
set nobackup                    " no backup file
set nowritebackup               " no backup file while editing
set noswapfile                  " no swap file

" Hide panels
"set guioptions-=m              " menu
set guioptions-=T               " toolbar
"set guioptions-=r              " scrollbar

" Wrapping
set nowrap                      " no line wraps
set linebreak                   " wrap lines at convenient points

" Folding
set foldmethod=indent           " fold based on indent
set foldnestmax=3               " deepest fold is 3 levels
set nofoldenable                " dont fold by default

let mapleader=","
nnoremap <leader><space> :noh<cr>   " Clear search highlighting

" Settings for buffers
map <C-q> :bd<CR>               " close current buffer
noremap <C-Right> :bn<CR>       " move to next buffer
noremap <C-Left> :bp<CR>        " move to previous buffer

" Split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" changing between syntaxes
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=java<CR>

" autocomplete
inoremap <C-space> <C-x><C-o>

"----Filetype----
" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 formatoptions+=croq softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Vim
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

"----Plugins----
" NERDtree
nmap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
"-- for win
"-- let g:NERDTreeDirArrowExpandable = '>'
"-- let g:NERDTreeDirArrowCollapsible = '*'
" let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" TagBar 
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0
" set tags=$HOME/tags

" ConqueTerm
nnoremap <F5> :ConqueTermSplit ipython<CR> " python interpreter
" nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR> " debug-mode
nnoremap <F6> :ConqueTermSplit scala<CR> " scala interpreter
let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
let g:ConqueTerm_Color = 1
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR> " PEP8 code check

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
"---Better :sign interface symbols
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'
noremap <F7> :w<CR>:SyntasticCheck<CR>

" Encoding menu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

" Ctrl-P
nnoremap <leader>. :CtrlPTag<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 6
let g:ctrlp_working_path_mode = 1

" Vim-Airline
colorscheme gruvbox 
set background=dark
let g:airline_theme='gruvbox'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
