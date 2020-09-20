dqt='"'
alias ejectall="osascript -e 'tell application ${dqt}Finder${dqt} to eject (every disk whose ejectable is true)'"
alias shellconfig="emacs ~/.zshrc"
alias pycharm_reset="$HOME/jetbrains_key/jetbrains-reset-trial-evaluation-mac/runme.sh"
alias sizeof="du -d 0 -h"
alias pythonpath-add-dir="export PYTHONPATH=${dqt}`pwd`${dqt}"
alias pi="pipenv install --skip-lock"
alias pu="pipenv uninstall --skip-lock"
alias gc='git commit -m "`date`"'

# saleor config docker
alias saleor-original-state="cd $HOME/temp/saleor-platform/saleor && git checkout f354d5b && cd $HOME/temp/saleor-platform/saleor-dashboard  && git checkout 5a6612f && cd $HOME/temp/saleor-platform/saleor-storefront && git checkout 861675d && cd .."
alias ssh-sneha="ssh -i '$HOME/Google Drive/aws-keys/sneha-ph.pem' ubuntu@ec2-13-232-85-79.ap-south-1.compute.amazonaws.com"
alias rclone-gdrive-snippets="rclone sync \"$HOME/Google Drive/Pysnippets\" gdrive:/Pysnippets"
