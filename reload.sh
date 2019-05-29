#!/bin/sh

# Copy files over.
cp ./.aliases ~/ && cp ./.bash_* ~/ && cp ./.functions ~/ && cp ./.vimrc ~/ && cp ./.gdbinit ~/ && cp ./.zshrc ~/

# Refresh the settings.
. ~/.aliases
. ~/.bash_prompt
. ~/.bash_profile
. ~/.functions

# Update all brew packages, and cleanup old versions.
brew upgrade
