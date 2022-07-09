#!/bin/sh

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install fish shell
brew install fish

# handover to fish shell
/usr/local/bin/fish ./set_it_up/install.fish
