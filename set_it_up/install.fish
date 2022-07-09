#!/usr/local/bin/fish

set SCRIPT_DIR $PWD/(string replace \./ "" (dirname (status --current-filename )))

# get info

echo "Enter your name: "
set -x NAME (read)

echo "Enter your email: "
set -x EMAIL (read)


# gitconfig
set GCFILE $SCRIPT_DIR/dotfiles/.gitconfig
envsubst '$EMAIL,$NAME' <$GCFILE >~/.gitconfig

# install crontab
set -x CLEANUP_SH $SCRIPT_DIR/cleanup.sh
set -x FISH_PATH (which fish)
set -x BREW_PATH (which brew)
envsubst '$HOME,$FISH_PATH,$CLEANUP_SH,$BREW_PATH' <$SCRIPT_DIR/crontab | crontab

source $SCRIPT_DIR/brew_installs.fish

# set os var
set os (uname)

if [ $os = Darwin ]
    defaults write -g InitialKeyRepeat -int 15
    defaults write -g KeyRepeat -int 1
end

# config files symbolic links
set DOT_CONFIG_DIR (dirname $SCRIPT_DIR)/.config

ln -s $DOT_CONFIG_DIR $HOME/.config
