#!/bin/sh
sudo apt-get install \
  git \
  vim \
  python3

# Install Docker
set -e
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Install Tools.
pip install virtualenv

cd ~/Documents/GitHub/ || return
git clone git@github.com:slimm609/checksec.sh.git
git clone git@github.com:longld/peda.git ~/peda
git clone git@github.com:sdispater/poetry.git ~/poetry
gsed -i "s/env python/env python3/g" ~/poetry/get-poetry.py
python3 ~/poetry/get-poetry.py
git lfs install --system

# Setup bash settings.
chmod +x ./reload.sh
./reload.sh
