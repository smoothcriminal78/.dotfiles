set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#rc()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Generic
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'              " Class/module browser (Ctags required)

" Status line
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'

" Completion & snippets
" Plugin 'Valloric/YouCompleteMe'
Plugin 'garbas/vim-snipmate'        " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " dependencies #1
Plugin 'tomtom/tlib_vim'        " dependencies #2
Plugin 'honza/vim-snippets'     " snippets repo
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-commentary'           " Comment stuff out

" Syntax hightlighting & colors
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'

" CSV
Plugin 'csv.vim'

" Scala
Plugin 'derekwyatt/vim-scala'

" Other
Plugin 'wesQ3/vim-windowswap'
call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on

" General
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt-=preview
set gcr=a:blinkon0

set ttyfast

colorscheme nightly

syntax on

tab sball
set switchbuf=useopen

" Use system clipboard
set clipboard=unnamedplus

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
set enc=utf-8           " utf-8 default encoding
set ls=2                " always show status bar
set incsearch           " incremental search
set hlsearch            " highlighted search results
set nu                  " line numbers
set scrolloff=5         " keep some more lines for scope
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching
set showmode            "Show current mode down the bottom

set wcm=<Tab>
set smarttab

" hide panels
"set guioptions-=m   " меню
set guioptions-=T    " тулбар
"set guioptions-=r   "  скроллбары

let mapleader=","
nnoremap <leader><space> :noh<cr>   " Clear search highlighting with ,<space>

" turn off backups and swaps
set nobackup       " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile         " no swap files

" Wrapping
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" Colors
set background=dark " for the dark version
let g:one_allow_italics = 1

" Scrolling
set scrolloff=4
set sidescrolloff=15
set sidescroll=1

" NERDtree
nmap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" TagBar 
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

" ConqueTerm
nnoremap <F5> :ConqueTermSplit ipython<CR> " python interpreter
" nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR> " debug-mode на <F6>
nnoremap <F6> :ConqueTermSplit scala<CR> " scala interpreter
let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
let g:ConqueTerm_Color = 1
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR> " проверка кода в соответствии с PEP8 через <leader>8

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
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

" Settings for buffers
map <C-q> :bd<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

" Easier split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 6
let g:ctrlp_working_path_mode = 1

" Vim-Airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1

" buffers
map <C-q> :bd<CR>        " CTRL+Q - close current buffer

" autocomplete
inoremap <C-space> <C-x><C-o>

" changing between syntaxes
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=java<CR>

" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 formatoptions+=croq softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Vim
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
