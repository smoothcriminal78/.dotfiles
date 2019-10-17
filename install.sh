#!/bin/bash

install_tmux(){
	echo "Installing tmux"
	sudo apt-get install --yes tmux
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
	sudo apt-get install --yes vim-gtk
	sudo apt-get install --yes xclip
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
	sudo apt-get install --yes nodejs

	#fix sudo ln -s /usr/bin/nodejs /usr/bin/node

	echo "Installing Npm"
	sudo apt-get install --yes npm

	echo "Installing Nvm"
	bash install_nvm.sh

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	nvm install $NVM_VERSION 
}

install_python(){
	echo "Installing Python"
	sudo apt-get install --yes virtualenv
	sudo apt-get install --yes python-pip
	sudo apt-get install --yes python-dev
	sudo apt-get install --yes python3-dev
	sudo pip install --upgrade pip
	sudo pip install --upgrade virtualenv
	sudo pip install pyflakes pep8 pylint ipython
}

install_other(){
	echo "Installing other linux packages"
	sudo apt-get install --yes curl
	sudo apt-get install --reinstall p7zip-rar unrar
	sudo apt-get install --yes ctags
	
	sudo apt-get install --yes guake
	# Dump settings
	# gconftool-2 --dump /apps/guake > apps-guake.xml
	# gconftool-2 --dump /schemas/apps/guake > schemas-apps-guake.xml

	# Restore
	gconftool-2 --load ~/.dotfiles/guake/apps-guake.xml
	gconftool-2 --load ~/.dotfiles/guake/schemas-apps-guake.xml

	# List profiles:
	# dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -e "\[\:\|visible-name"
	# Dump console settings
	# dconf dump /org/gnome/terminal/legacy/profiles:/:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/ > profile.dconf
	# Load console profile
	dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ <  ~/.dotfiles/bash/dconf/profile.dconf

	# YCM ycm_extra_conf.py
	cp ~/.dotfiles/ycm/.ycm_extra_conf.py ~/.ycm_extra_conf.py

	# Gyazo
	curl -s https://packagecloud.io/install/repositories/gyazo/gyazo-for-linux/script.deb.sh | sudo bash
	sudo apt-get install gyazo

	# Bash .profile
	# mv ~/.profile ~/.profile.bak
	# ln -sf ~/.dotfiles/bash/.profile ~/.profile

	mv ~/.bashrc ~/.bashrc.bak
	ln -sf ~/.dotfiles/bash/.bashrc ~/.bashrc

	# cp -r ~/.dotfiles/todo.txt/config ~/.todo/config
	sudo cp ~/.dotfiles/todo.txt/todo.sh /usr/local/bin/
	touch ~/todo.txt ~/done.txt ~/report.txt
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
