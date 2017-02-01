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

https://andrew.stwrt.ca/posts/vim-ctags/
Add tags: ctags -R -f ./.git/tags .

Copy .ctags to ~

--ipython
sudo apt-get install ipython

--Git
http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false

git mergetool

--Vim
:verbose imap <Tab> - which plugin utilizes the key



INSTALLDIR=${INSTALLDIR:-"$PWD/.dotfiles"}
create_symlinks () {
    if [ ! -f ~/.vimrc ]; then
     echo "Creating /.vimrc..."
        ln -sf $INSTALLDIR/vim/.vimrc ~/.vimrc
    fi

    if [ ! -f ~/.bash_profile ]; then
     echo "Creating /.bash_profile..."
        ln -sf $INSTALLDIR/bash/.bash_profile ~/.bash_profile
    fi
}

which git > /dev/null
if [ "$?" != "0" ]; then
  echo "You need git installed."
  exit 1
fi

which vim > /dev/null
if [ "$?" != "0" ]; then
  echo "You need vim installed."
  exit 1
fi

if [ ! -d "$INSTALLDIR" ]; then
    echo "Cloning dotfiles from github and creating symlinks."
    git clone https://github.com/smoothcriminal78/.dotfiles.git $INSTALLDIR
    create_symlinks
    cd $INSTALLDIR
else
    echo "Creating symlinks."
    cd $INSTALLDIR
    git pull origin master
    create_symlinks
fi

if [ ! -d "bundle/vundle" ]; then
    echo "Installing Vundle (https://github.com/gmarik/vundle)."
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi
