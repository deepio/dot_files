#!/bin/sh

# Copy files over.
cp \
  # SRC
  ./.aliases \
  # ./.bash_* \
  ./.functions \
  ./.vimrc \
  ./.gdbinit \
  ./.gitconfig \
  ./zshrc \
  # DST
  ~/

cp ./gpg-agent.conf $HOME/.gnupg/


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
# . ~/.bash_prompt
# . ~/.bash_profile
. ~/.zshrc
. ~/.functions

# Update all brew packages, and cleanup old versions.
# brew upgrade
