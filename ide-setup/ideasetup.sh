#!/bin/sh

echo -n "Specify a version id to be installed:"
read ideaVer
arch=ideaIC-"$ideaVer".tar.gz

mkdir -p ~/work/ide
wget -O /tmp/"$arch" http://download.jetbrains.com/idea/"$arch"
tar xfz /tmp/"$arch" -C ~/work/ide

echo "Done! Installed to ~/work/ide"
