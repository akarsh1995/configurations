brew install python@3.7\
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
    vim\
    nnn\
    zsh-completions\
    zsh-autosuggestions\
    zsh-syntax-highlighting\
    bandwhich\
    # disk space view in commandline
    diskonaut\
    tree\
    cmake\
    pre-commit\
    # gnu tools as the bsd are outdated
    coreutils\
    # download manager for multithreaded download.
    axel\
    # shell syntax checker
    shellcheck\
    # torrent downloader
    rtorrent\
    # cat alternative to prettify the text in console
    bat

brew cask install alacritty\
    zoomus\
    discord\
    appcleaner\
    tiles\
    microsoft-teams\
    telegram\
    onyx\
    # for keyboard keys remapping
    karabiner-elements\
    firefox

# emacs installation:
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

# required in zsh completions
chmod go-w '/usr/local/share'
