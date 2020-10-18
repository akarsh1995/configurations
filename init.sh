#!/bin/zsh

# install brew and python first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install python@3.8

# manage further setup with python@3
./install.py
