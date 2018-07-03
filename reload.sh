#!/bin/sh

# Copy files over.
cp ./.aliases ~/ && cp ./.bash_* ~/

# Refresh the settings.
. ~/.aliases
. ~/.bash_prompt
. ~/.bash_profile

# Update all brew packages, and cleanup old versions.
brew upgrade
brew cleanup -n
