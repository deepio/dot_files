#!/bin/sh

# Installs git, clang, ...
xcode-select --install

# Install Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Browsers.
brew cask install FireFox
brew cask install google-chrome

# Install Dev apps.
brew cask install atom
brew cask install visual-studio-code
brew cask install docker

# Install Misc.
brew cask install vlc
brew cask install keka

# Install Tools.
sudo chown -R "$(whoami)" /usr/local/lib/pkgconfig
brew install openvpn
brew install python@3
brew install python@2
pip install virtualenv
brew install netcat
brew install findutils
brew install binutils
brew install gnu-sed
brew install openssl
brew install autoconf
brew install pygobject3
brew install pstree
brew install pypy3
brew install curl --with-openssl
brew install wget
cd ~/Documents/GitHub/ || return
git clone git@github.com:slimm609/checksec.sh.git
git clone https://github.com/longld/peda.git ~/peda
git clone git@github.com:sdispater/poetry.git
python3 ~/poetry/get-poetry.py

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
