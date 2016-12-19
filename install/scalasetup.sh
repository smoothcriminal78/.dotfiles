#!/bin/sh

echo -n "Specify a version id to be installed:"
read scalaVer
fname=scala-"$scalaVer"

sudo apt-get remove scala-library scala
sudo wget -O /tmp/fname www.scala-lang.org/files/archive/fname.deb
sudo dpkg -i /tmp/fname.deb
sudo apt-get update
sudo apt-get install scala

echo "Done!"
