#!/bin/sh

# Copy files over.
# there is a reason it's done this way.
cp ./.aliases ~/ && cp ./.bash_* ~/ && cp ./.functions ~/ && cp ./.vimrc ~/ && cp ./.gdbinit ~/ && cp ./.gitconfig ~/ && cp ./.zshrc ~/

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

echo """
Remember to run `git config --global user.signingkey` with the fingerprint you wish to use.\n

You can see the fingerprint with `gpg --list-secret-keys --keyid-format LONG | grep rsa | grep sec`
Everything after rsa####/ until the first space is your fingerprint. 

	sec   rsa4096/123456ABCDEFGHIK 2021-02-18 [SC] [expires: 2022-02-18]

Then your fingerprint is 123456ABCDEFGHIK and the command would be:
git config --global user.signingkey 123456ABCDEFGHIK
"""

# Refresh the settings.
. ~/.aliases
# . ~/.bash_prompt
# . ~/.bash_profile
. ~/.zshrc
. ~/.functions

# Update all brew packages, and cleanup old versions.
# brew upgrade
