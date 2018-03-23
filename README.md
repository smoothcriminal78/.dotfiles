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
sudo apt-get install curl
-- to fix zip unzip
sudo apt-get install --reinstall p7zip-rar unrar
-- ctags 
sudo apt-get install ctags
-- vim-gtk
sudo apt-get install vim-gtk
-- tmux
sudo apt-get install tmux
-- python
sudo apt-get install pip virtualenv
sudo apt-get install python-dev python3-dev
pip install pyflakes pep8 pylint ipython
-- Git as a diff tool http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false

--node js
sudo apt-get update
sudo apt-get install nodejs

--difftool
git config --global mergetool.keepBackup false
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false
*fix sudo ln -s /usr/bin/nodejs /usr/bin/node
--npm
sudo apt-get install npm
--nvm
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
bash install_nvm.sh
nvm ls-remote
nvm install (last stable version number)
