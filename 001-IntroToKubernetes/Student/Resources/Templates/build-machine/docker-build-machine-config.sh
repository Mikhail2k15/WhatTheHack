#!/bin/bash

#Set up Linux Build Agent VM to install Docker & Node.js

# The first parameter passed in is the user we're going to add
# to the docker group, if one isn't passed in, use the current user
CURUSER = ${1:-$USER}
CURUSERHOME = $(eval echo ~$(echo $USER))

#1. Update the Ubuntu packages and install curl and support for repositories over HTTPS
#in a single step by typing the following in a single line command. 
#When asked if you would like to proceed, respond by typing “y” and pressing enter. 
sudo apt-get -y update && sudo apt -y install apt-transport-https ca-certificates curl software-properties-common

#2. Add Docker’s official GPG key by typing the following in a single line command
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#3. Add Docker’s stable repository to Ubuntu packages list by typing the following in a single line command
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#4. Update the Ubuntu packages and install Docker engine, node.js and the node package manager
#in a single step by typing the following in a single line command. 
#When asked if you would like to proceed, respond by typing “y” and pressing enter.
sudo apt-get -y update && sudo apt -y install docker-ce nodejs npm

#5.	Now, upgrade the Ubuntu packages to the latest version by typing the following in a single line command. 
#When asked if you would like to proceed, respond by typing “y” and pressing enter.
sudo apt-get -y upgrade

#6.	Add your user to the Docker group so that you do not have to elevate privileges with sudo for every command. 
sudo usermod -aG docker $CURUSER

#Download and stage source code for the V1 & V2 of the FabMedical application.

#Download FabMedical V1 source code:
#TODO - change URL to our repo location!!!
curl -L -o FabMedical.v1.tgz http://aka.ms/FabMedical.v1

#Create new V1 directory
mkdir $CURUSERHOME/FabMedical.v1

#Unpack the archive into the new folder
tar -C $CURUSERHOME/FabMedical.v1 -xzf FabMedical.v1.tgz

#Download FabMedical V1 source code:
#TODO - change URL to our repo location AND download V2!!!
curl -L -o FabMedical.v2.tgz http://aka.ms/FabMedical.v2

#Create new V1 directory
mkdir $CURUSERHOME/FabMedical.v2

#Unpack the archive into the new folder
tar -C $CURUSERHOME/FabMedical.v2 -xzf FabMedical.v2.tgz

