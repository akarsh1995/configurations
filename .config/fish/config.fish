starship init fish | source
zoxide init fish | source
set -Ux EDITOR (brew --prefix)/bin/hx
set -x config_dir $HOME/.config
# config files shortcuts
alias fish_conf "$EDITOR $config_dir/fish/config.fish"
alias alacritty_conf "$EDITOR $config_dir/alacritty/alacritty.yml"
alias http xh
