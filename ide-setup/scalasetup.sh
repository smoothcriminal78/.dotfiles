#!/bin/sh

echo -n "Specify a version id to be installed:"
read scalaVer

sudo apt-get remove scala-library scala
sudo wget -O /tmp/scala-"$scalaVer" www.scala-lang.org/files/archive/scala-"$scalaVer".deb
sudo dpkg -i /tmp/scala-"$scalaVer".deb
sudo apt-get update
sudo apt-get install scala

echo "Done!"
