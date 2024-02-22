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
	# echo "Installing Vundle"
	# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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

	# youcompleteme
	sudo apt-get install --yes cmake

	# YCM ycm_extra_conf.py
	cp ~/.dotfiles/ycm/.ycm_extra_conf.py ~/.ycm_extra_conf.py

	~/.vim/plugged/YouCompleteMe/install.sh
}

install_python(){
	echo "Installing Python"
	sudo apt-get install --yes virtualenv
	sudo apt-get install --yes python-pip
	sudo apt-get install --yes python3-pip
	sudo apt-get install --yes python-dev
	sudo apt-get install --yes python3-dev
	sudo pip install --upgrade pip
	sudo pip install --upgrade virtualenv
	sudo pip install pyflakes pep8 pylint ipython

	sudo add-apt-repository ppa:deadsnakes/ppa
	sudo apt --yes install python3.8 python3.8-distutils -y
	sudo apt-get --yes install gettext
}

install_galaxy() {
	sudo apt install -y cmake qtcreator qtbase5-dev qt5-qmake openscenegraph libopenscenegraph-dev libglib3.0-cil-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxcomposite-dev libqt5webkit5-dev openssl libssl-dev
}

install_java() {
	sudo apt install -y default-jre default-jdk
}

install_other(){
	echo "Installing other linux packages"

	# other
	sudo apt install --yes git gitk meld mc wireshark openssh-server gconf2 gparted
	sudo apt-get install --yes libxml2-dev libxslt-dev 

	sudo apt-get install --yes curl
	sudo apt-get install --reinstall p7zip-rar unrar
	sudo apt-get install --yes ctags
	
	sudo apt-get install --yes guake

	# Dump Guake settings
	# guake --save-preferences ~/.dotfiles/guake/guake
	guake --restore-preferences ~/.dotfiles/guake/guake

	# List profiles:
	# dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -e "\[\:\|visible-name"
	# Dump console settings
	# dconf dump /org/gnome/terminal/legacy/profiles:/:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/ > profile.dconf
	# Load console profile
	dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ <  ~/.dotfiles/bash/dconf/profile.dconf

	# Bash .profile
	ln -sf ~/.dotfiles/bash/.profile ~/.profile
	ln -sf ~/.dotfiles/bash/.bashrc ~/.bashrc

	# grid workspaces
	google-chrome https://extensions.gnome.org/extension/1485/workspace-matrix/
	sudo aptitude install gnome-shell-extensions
	sudo apt-get install --yes chrome-gnome-shell

	# ubuntu
	gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'
	gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
	gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
	gsettings set org.gnome.desktop.media-handling automount false

	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Right']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Alt>Up']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control><Alt>Down']"

	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Shift><Alt>Left']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Shift><Alt>Right']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control><Shift><Alt>Up']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control><Shift><Alt>Down']"

	# cp -r ~/.dotfiles/todo.txt/config ~/.todo/config
	sudo cp ~/.dotfiles/todo.txt/todo.sh /usr/local/bin/
	touch ~/todo.txt ~/done.txt ~/report.txt

	# npm
	./npm/install.sh	
	. ~/.nvm/nvm.sh
	. ~/.profile
	. ~/.bashrc
	nvm install 17.8.0
}


while [ -n "$1" ]
# while loop starts
do
case "$1" in
-t | --tmux ) install_tmux ;;
-v | --vim ) install_vim ;;
-p | --python ) install_python ;;
-g | --galaxy ) install_galaxy ;;
-j | --java ) install_java ;;
-o | --other ) install_other ;;
-a | --all ) 
	install_tmux
	install_vim
	install_python
	install_galaxy
	install_java
	install_other
;;
*) echo "Option $1 not recognized";;
esac
shift
done
