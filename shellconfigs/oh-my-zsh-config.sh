# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
fpath+=~/.zfunc

ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"

plugins=(
    git
    osx
    dotenv
    node
    npm
    brew
    extract
    python
    zsh-syntax-highlighting
    zsh-autosuggestions
    ng
    docker
    docker-compose
    poetry
)

source $ZSH/oh-my-zsh.sh
