#!/bin/bash

# Set up git and its global params
apt-get --yes install git-core
git config --global color.ui true
git config --global user.name "user"
git config --global user.email "user@example.com"
git config --global core.editor "vim"

# Generate an ssh key
if [[ ! -f "$HOME/.ssh/id_rsa" ]];then
	ssh-keygen -t "rsa" -b 4096 -N "keygen" -f "id_rsa"
fi