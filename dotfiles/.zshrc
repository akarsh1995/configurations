export ZSH="$HOME/.oh-my-zsh"

export PERSONAL_CONFIG_DIR="$HOME/personal_configs"

SHELLCONFIG="$PERSONAL_CONFIG_DIR/shellconfigs"

source "$SHELLCONFIG/oh-my-zsh-config.sh"
source "$SHELLCONFIG/env_vars.sh"
source "$SHELLCONFIG/functions.sh"
source "$SHELLCONFIG/alias.sh"
source "$SHELLCONFIG/secrets.sh"

# show system info at zsh shell startup
/usr/local/bin/neofetch

# openvino environment initialization for mac intel based processors.
source ~/intel/openvino_2020.4.287/bin/setupvars.sh

# initialize virtualenv wrapper
source "/Library/Frameworks/Python.framework/Versions/3.8/bin/virtualenvwrapper.sh"
