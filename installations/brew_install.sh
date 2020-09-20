/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install python@3.6\
    python@3.7\
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
    opencv@4

brew cask install alacritty\
    zoomus\
    discord

# emacs installation:
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

