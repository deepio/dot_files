#!/bin/sh

# Installs git, clang, ...
xcode-select --install

# Show "Allow running apps from anywhere"
# Stop hiding options apple, seriously!
sudo spctl --master-disable

# Install Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install casks
brew install homebrew/cask

# Install Browsers.
brew install FireFox
brew install google-chrome

# Install Dev apps.
brew install visual-studio-code
brew install docker
brew install minikube
brew install iterm2
brew install obsidian
brew install amethyst

# Install Misc.
brew install vlc
brew install keka

# Install Tools.
sudo chown -R "$(whoami)" /usr/local/lib/pkgconfig
brew install openvpn
brew install pyenv
pip install virtualenv
brew install netcat
brew install findutils
brew install binutils
brew install gnu-sed
brew install openssl
brew install autoconf
brew install pygobject3
brew install pstree
brew install httpie
brew install pypy3
brew install wget
brew install entr
brew install ag
mkdir -p ~/Documents/GitHub
git clone git@github.com:slimm609/checksec.sh.git
# git clone git@github.com:longld/peda.git ~/peda
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py \
  && echo "source ~/.gdbinit-gef.py" >> ~/.gdbinit \
  && echo "set disassembly-flavor intel" >> ~/.gdbinit
git clone git@github.com:sdispater/poetry.git ~/poetry
cd ~/poetry
pyenv install 3.9.0
pyenv local 3.9.0
python ~/poetry/get-poetry.py
brew install git-lfs
git lfs install --system
git config --global pull.ff only

# Needed in Mac Sierra.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
sudo ln -s /usr/local/bin/gsha512sum /usr/local/bin/sha512sum

# Stop Safari notifications.
defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z
defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 10.99

# Colorful bash
sudo gem install artii lolcat

# Setup bash settings.
chmod +x ./reload.sh
./reload.sh
