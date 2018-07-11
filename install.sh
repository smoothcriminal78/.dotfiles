#!/bin/bash

install_tmux(){
	echo "Installing tmux"
	sudo apt-get install tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
	sudo chown -R $USER:$USER ~/.tmux

	echo "[Tmux] Install plugins(s) Ctrl + a I"
	echo "[Tmux] Update plugins(s) Ctrl + a U"
	echo "[Tmux] Remove/Uninstall plugins not on the plugin list Ctrl + a + alt u"
}

install_vim(){
	echo "Installing Vim"
	echo "Vim-gtk"
	sudo apt-get install vim-gtk
	sudo apt-get install --assume-yes xclip
	echo "Installing Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	# for windows git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
	ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
	echo "Git as a diff tool"
	#Git as a diff tool http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/
	git config merge.tool vimdiff
	git config merge.conflictstyle diff3
	git config mergetool.prompt false

	git config --global mergetool.keepBackup false
	git config merge.conflictstyle diff3
	git config mergetool.prompt false
}

install_node(){
	# nvm ls-remote - to list available versions
	NVM_VERSION="8.11.1"

	echo "Installing Node js"
	sudo apt-get update
	sudo apt-get install nodejs

	#fix sudo ln -s /usr/bin/nodejs /usr/bin/node

	echo "Installing Npm"
	sudo apt-get install npm

	echo "Installing Nvm"
	bash install_nvm.sh

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	nvm install $NVM_VERSION 
}

install_python(){
	echo "Installing Python"
	sudo apt-get install pip virtualenv
	sudo apt-get install python-dev python3-dev
	pip install pyflakes pep8 pylint ipython
}

install_other(){
	echo "Installing other linux packages"
	sudo apt-get install curl
	sudo apt-get install --reinstall p7zip-rar unrar
	sudo apt-get install ctags
	
	sudo apt-get install guake
	# Guake schemas bug
	sudo mkdir /etc/gconf/schemas
	cd /etc/gconf/schemas/
	sudo ln -s /usr/share/gconf/schemas/guake.schemas
}


while [ -n "$1" ]
# while loop starts
do
case "$1" in
-t | --tmux ) install_tmux ;;
-v | --vim ) install_vim ;;
-n | --node ) install_node ;;
-p | --python ) install_python ;;
-o | --other ) install_other ;;
-a | --all ) 
	install_tmux
	install_vim
	install_node
	install_python
	install_other
;;
*) echo "Option $1 not recognized";;
esac
shift
done
