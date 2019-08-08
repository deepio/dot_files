# Dotfiles
My OS X dotfiles.

- Bash starts in folder `~/Documents/GitHub`, it is specified in the `.bash_profile` if you want to remove it.
- Brew updates on installs is disabled, instead add a cron job. eg: `crontab -e` and `20 20 * * * bash -c "/usr/local/bin/brew update" >/dev/null 2>&1`.

# Dot files
I based mine on these, I picked the parts I wanted.
- https://github.com/necolas/dotfiles :beer:
- https://github.com/mathiasbynens/dotfiles :beer:
