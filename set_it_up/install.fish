#!/usr/local/bin/fish

set SCRIPT_DIR $PWD/(string replace \./ "" (dirname (status --current-filename )))

# gitconfig
echo "Enter your name: "
set -x NAME (read)

echo "Enter your email: "
set -x EMAIL (read)
set GCFILE $SCRIPT_DIR/dotfiles/.gitconfig
envsubst '$EMAIL,$NAME' <$GCFILE >~/.gitconfig

# brew installs
source $SCRIPT_DIR/brew_installs.fish

# cron jobs
source $SCRIPT_DIR/crontab/crontab.fish

# set os var
set os (uname)
if [ $os = Darwin ]
    defaults write -g InitialKeyRepeat -int 15
    defaults write -g KeyRepeat -int 1
end

# config files symbolic links
set DOT_CONFIG_DIR (dirname $SCRIPT_DIR)/.config

ln -s $DOT_CONFIG_DIR $HOME/.config
