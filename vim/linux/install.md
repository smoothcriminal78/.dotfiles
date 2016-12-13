git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc

pip install pyflakes pep8 pylint ipython

--airline theme
sudo cp vim/airline/themes/gruvbox.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes

--youcompleteme
Install development tools and CMake: sudo apt-get install build-essential cmake
Make sure you have Python headers installed: sudo apt-get install python-dev python3-dev.

Compiling YCM with semantic support for C-family languages:
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

Compiling YCM without semantic support for C-family languages:
cd ~/.vim/bundle/YouCompleteMe
./install.py

--ctags 
sudo apt-get install ctags

--ipython
sudo apt-get install ipython


--Vim
:verbose imap <Tab> - which plugin utilizes the key
