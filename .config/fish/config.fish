starship init fish | source
zoxide init fish | source
set -Ux EDITOR (brew --prefix)/bin/hx
set -x config_dir $HOME/.config
# config files shortcuts
alias fish_conf "$EDITOR $config_dir/fish/config.fish"
alias alacritty_conf "$EDITOR $config_dir/alacritty/alacritty.yml"
alias http xh

# 
set -Ux CONF_LOG_ALL_DB_QUERY false 
set -Ux NODE_ENV local 
set -Ux AYR_DIR "/Users/akarshjain/Programming/ayr"


# unit tests
alias u "npm run test:unit -- --watch"

# integration tests
alias i "CONF_LOG_ALL_DB_QUERY=false NODE_ENV=local npm run test:integration -- --watch"

# e2e tests
alias e "CONF_LOG_ALL_DB_QUERY=false NODE_ENV=local npm run test:e2e -- --watch"

# all individual services 
alias asu "ed && docker compose -f $AYR_DIR/docker-compose.infra.yml up -d --build && docker compose -f $AYR_DIR/projects/wallet-core/docker-compose.yml up -d --build && docker compose -f $AYR_DIR/projects/arjun/docker-compose.yml up -d --build"
alias asd "docker compose -f $AYR_DIR/projects/arjun/docker-compose.yml down && docker compose -f $AYR_DIR/projects/wallet-core/docker-compose.yml down && docker compose -f $AYR_DIR/docker-compose.infra.yml down"

alias ed "asd && docker compose -f $AYR_DIR/integration/docker-compose.e2e.yml down"
alias eu "asd && docker compose -f $AYR_DIR/integration/docker-compose.e2e.yml up -d --build"

# fzf bindings
fzf_configure_bindings --directory=\cf

# git aliases
alias gc "git commit -m"

# ayr workspace zellij
alias ayr "zellij --layout ayr"

