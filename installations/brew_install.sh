#!/bin/zsh

# best way to remove a brew package
brew tap beeftornado/rmtree

brew install\
    python@3.7\
    tmux\
    rclone\
    wget\
    ripgrep\
    dust\
    gcc@8\
    thefuck\
    neofetch\
    node\
    htop\
    nnn\
    zsh-completions\
    zsh-autosuggestions\
    zsh-syntax-highlighting\
    bandwhich\
    diskonaut\
    tree\
    cmake\
    coreutils\
    axel\
    shellcheck\
    rtorrent\
    bat\
    emacs\
    vim

# poetry causes issues installing via brew package manager
# using pip to install
/usr/local/opt/python@3.7/bin/python3.7 -m pip install poetry

brew cask install\
    alacritty\
    zoomus\
    discord\
    appcleaner\
    tiles\
    microsoft-teams\
    telegram\
    onyx\
    karabiner-elements\
    firefox\
    mos

# required in zsh completions
chmod go-w '/usr/local/share'
