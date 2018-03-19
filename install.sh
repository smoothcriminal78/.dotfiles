git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
--git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

sudo apt-get install --assume-yes xclip
bind -t vi-copy y copy-pipe "xclip -sel clip -i"


--prefix + I install plugin(s)
--prefix + U updates plugin(s)
--prefix + alt + u remove/uninstall plugins not on the plugin list

--Bash-It
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it


-- linux packages
# to fix zip unzip
sudo apt-get install --reinstall p7zip-rar unrar
# ctags 
sudo apt-get install ctags
# vim-gtk
sudo apt-get install vim-gtk
# python
sudo apt-get install pip
pip install pyflakes pep8 pylint ipython
# Git as a diff tool http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false

--youcompleteme
Install development tools and CMake: sudo apt-get install build-essential cmake
Make sure you have Python headers installed: sudo apt-get install python-dev python3-dev.

Compiling YCM with semantic support for C-family languages:
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

Compiling YCM without semantic support for C-family languages:
cd ~/.vim/bundle/YouCompleteMe
./install.py

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
