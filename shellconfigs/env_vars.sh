# rust path
export PATH="$HOME/.cargo/bin:$PATH"

# Homebrew sbin path
export PATH="/usr/local/sbin:$PATH"

# Virtualenvwrapper setup....
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Programming/Python
# export VIRTUALENVWRAPPER_PYTHON="/Library/Frameworks/Python.framework/Versions/3.8/bin/python3"

export TERM="xterm-256color"

# Python binaries
export PATH="$PATH:$HOME/.poetry/bin"
export COMPOSE_HTTP_TIMEOUT=200
# export JAVA_HOME=$(/usr/libexec/java_home)
export LANG=en_US.UTF-8


#vim
export EDITOR="$(which vim)"
export VISUAL="$(which vim)"

# Compilation flags
export ARCHFLAGS="-arch x86_64"


# doom shell utilty
export PATH="$PATH:$HOME/.emacs.d/bin"

#llvm compiler binaries
export PATH="/usr/local/opt/llvm/bin:$PATH"

# useful scripts
export PATH="$PATH:$PERSONAL_CONFIG_DIR/python_useful_scripts"

# Prefs
export TERMINAL="alacritty"

# shell completions

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export IOTHUB_DEVICE_CONNECTION_STRING="HostName=beo-warehouse-iot.azure-devices.net;DeviceId=myDeviceId;SharedAccessKey=yQcKsWQMetjsC+qM/FEvXISJw5oBfad2RSYHntBKdic="
export PATH="/usr/local/opt/python@3.7/bin:$PATH"

# coreutils in mac path
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
