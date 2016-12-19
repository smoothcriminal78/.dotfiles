#!/bin/sh

echo -n "Specify a version id to be installed:"
read javaVer

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java"$javaVer"-installer
echo oracle-java"$javaVer"-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections update-java-alternatives -s java-"$javaVer"-oracle
