export ZSH="$HOME/.oh-my-zsh"

export PERSONAL_CONFIG_DIR="$HOME/configurations"

SHELLCONFIG="$PERSONAL_CONFIG_DIR/shellconfigs"
CLOUD_DRIVE="$HOME/cloud_drives/mega"

source "$SHELLCONFIG/oh-my-zsh-config.sh"
source "$SHELLCONFIG/env_vars.sh"
source "$SHELLCONFIG/functions.sh"
source "$SHELLCONFIG/alias.sh"
source "$CLOUD_DRIVE/Secrets/env_vars/secrets.sh"

# show system info at zsh shell startup
/usr/local/bin/neofetch

# zsh syntax completions related
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# openvino environment initialization for mac intel based processors.
source ~/intel/openvino_2020.4.287/bin/setupvars.sh

# initialize virtualenv wrapper
# source "/Library/Frameworks/Python.framework/Versions/3.8/bin/virtualenvwrapper.sh"
