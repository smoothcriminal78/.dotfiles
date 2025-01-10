# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

function backup () {
    newname=$1.`date +%Y-%m-%d.%H%M.bak`;
    mv $1 $newname;
    echo "Backed up $1 to $newname.";
    cp -p $newname $1;
}

function hideme () {
  if [[ -n "$1" ]] 
    then
    case "$1" in
      -s | --stop ) 
        sudo killall openvpn 
        return 0
      ;;
      *)
        echo "Option $1 not recognized"
        return 1
      ;;
    esac
  else
    sudo killall openvpn
    sudo openvpn --config ~/client1.ovpn > /dev/null &
  fi

  return 0
}

function whatsmyip () {
    echo "Your ip is:"
    dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
}

source ~/.dotfiles/todo.txt/todo_completion

alias ls='ls -ahl'
alias yt-dlp="yt-dlp -f 'bestvideo[height<=720]+bestaudio'"
