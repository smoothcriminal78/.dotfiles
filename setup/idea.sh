#!/bin/sh

echo -n "Specify a version id to be installed:"
read ideaVer
fname=ideaIC-"$ideaVer".tar.gz

mkdir -p ~/work/ide
wget -O /tmp/"$fname" http://download.jetbrains.com/idea/"$fname"
tar xfz /tmp/"$fname" -C ~/work/ide

echo "Done! Installed to ~/work/ide"
