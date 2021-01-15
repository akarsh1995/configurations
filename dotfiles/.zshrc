# set history zshrc
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

#exports#
export ZSH="$HOME/.oh-my-zsh"
export PERSONAL_CONFIG_DIR="$HOME/configurations"
export IP_DEEP_MACHINE="azureadmin@13.71.4.67"
export IP_JETSON_NANO="jetson@jetson.local"
export CUDA_HOME="/usr/local/cuda-11.0"
export DIR_DATASETS="$HOME/dl_data/datasets"
export DIR_DL_MODELS="$HOME/dl_data/models"

# path variables ??
export PATH="$PATH:$CUDA_HOME/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CUDA_HOME/lib64"

# fpaths
fpath=($fpath "/home/akarsh/.zfunctions")
fpath+=${ZDOTDIR:-~}/.zsh_functions

# variables
SHELLCONFIG="$PERSONAL_CONFIG_DIR/shellconfigs"
CLOUD_DRIVE="$HOME/cloud_drives/mega"

# sources
source "$SHELLCONFIG/env_vars.sh"
source "$SHELLCONFIG/functions.sh"
source "$SHELLCONFIG/alias.sh"
# source "$CLOUD_DRIVE/Secrets/env_vars/secrets.sh"
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/.cargo/env"

# show system info at zsh shell startup
/usr/bin/neofetch

# if system is osx then enable these
# zsh syntax completions related
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# openvino environment initialization for mac intel based processors.
# source ~/intel/openvino_2020.4.287/bin/setupvars.sh

# initialize virtualenv wrapper
# source "/Library/Frameworks/Python.framework/Versions/3.8/bin/virtualenvwrapper.sh"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# aliases
alias jetson="ssh $IP_JETSON_NANO"
alias camera_view='gst-launch-1.0 -v udpsrc port=1234 caps="application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! autovideosink sync=false'
alias camera_view_1235='gst-launch-1.0 -v udpsrc port=1235 caps="application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! autovideosink sync=false'
alias ssh_deep_machine="ssh $IP_DEEP_MACHINE"
alias rsync="rsync -azv"
alias venv="source ./venv/bin/activate"
alias poetry_all_envs="ls /home/akarsh/.cache/pypoetry/virtualenvs/ | grep py"
alias gpu="watch -n .5 nvidia-smi"
alias cpu='watch -n 0.5 "cat /proc/cpuinfo | grep MHz"'
alias temps="watch -n 0.5 sensors"
alias login_cyberoam="/usr/bin/curl --location --request POST 'http://192.168.10.1:8090/login.xml' --header 'Content-Type: text/plain' --data-raw 'mode=191&username=akarsh.jain&password=akarsh'"
