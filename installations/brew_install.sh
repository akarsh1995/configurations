#!/bin/zsh

# best way to remove a brew package
brew tap beeftornado/rmtree

brew install\
    tmux\
    rclone\
    poetry\
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
