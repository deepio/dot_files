#!/bin/sh

# Install Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install Browsers.
brew cask install FireFox google-chrome

# Install Dev apps.
brew cask install atom github-desktop docker git

# Install Misc.
brew cask install vlc keka

# Install Tools.
sudo chown -R $(whoami) /usr/local/lib/pkgconfig
brew install python@3 python@2 netcat

# Needed in Mac Sierra.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
sudo ln -s /usr/local/bin/gsha512sum /usr/local/bin/sha512sum

# Stop Safari notifications. (COME ON APPLE! REALLY?!)
defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z
defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 10.99

# Setup bash settings.
chmod +x ./reload.sh
./reload.sh
