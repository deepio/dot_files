#!/bin/sh

# Copy files over.
cp ./.aliases ~/ && cp ./.bash_* ~/ && cp ./.functions ~/ && cp ./.vimrc ~/ && cp ./.gdbinit ~/ && cp ./.gitconfig ~/


if [[ "$OSTYPE" == "darwin"* ]]; then
	alias sed="gsed"
fi

echo "Enter GitHub Username and press [enter]: "
read gh_user
sed -i "s/name =/name = `echo $gh_user`/g" ~/.gitconfig

echo "Enter GitHub Email and press [enter]: "
read gh_email
sed -i "s/email =/email = `echo $gh_email`/g" ~/.gitconfig

# Refresh the settings.
. ~/.aliases
. ~/.bash_prompt
. ~/.bash_profile
. ~/.functions

# Update all brew packages, and cleanup old versions.
# brew upgrade
