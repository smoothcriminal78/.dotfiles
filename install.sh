INSTALLDIR=${INSTALLDIR:-"$PWD/.dotfiles"}
create_symlinks () {
    if [ ! -f ~/.vimrc ]; then
     echo "Creating /.vimrc..."
        ln -sf $INSTALLDIR/vim/.vimrc ~/.vimrc
    fi

    if [ ! -f ~/.vim ]; then
     echo "Creating colors/.vim..."
        ln -sf $INSTALLDIR/vim/colors/one.vim ~/.vim/colors/one.vim
        ln -sf $INSTALLDIR/vim/colors/deep-space.vim ~/.vim/colors/deep-space.vim
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
