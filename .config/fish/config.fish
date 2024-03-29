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
alias um "npm run test:unit -- --watch --changedSince main"

# integration tests
alias i "CONF_LOG_ALL_DB_QUERY=false NODE_ENV=local npm run test:integration -- --watch --changedSince main"

# e2e tests
alias e "CONF_LOG_ALL_DB_QUERY=false NODE_ENV=local npm run test:e2e -- --watch --changedSince main"

# all individual services 

alias ed "docker compose -f $AYR_DIR/integration/docker-compose.yml --profile=full down --remove-orphans"
alias asd "docker compose -f $AYR_DIR/projects/arjun/docker/docker-compose.yml down --remove-orphans && docker compose -f $AYR_DIR/projects/wallet-core/docker-compose.yml down --remove-orphans && docker compose -f $AYR_DIR/docker-compose.infra.yml down --remove-orphans"

alias asu "ed && asd && docker compose -f $AYR_DIR/docker-compose.infra.yml up -d --build && docker compose -f $AYR_DIR/projects/wallet-core/docker-compose.yml up -d --build && docker compose -f $AYR_DIR/projects/arjun/docker/docker-compose.yml up -d --build"
alias eu "ed && asd && docker compose -f $AYR_DIR/integration/docker-compose.yml --profile=full up -d --build"

# fzf bindings
fzf_configure_bindings --directory=\cf

# git aliases
alias gc "git commit -m"

# ayr workspace zellij
alias ayr "zellij --layout ayr"


fish_add_path $HOME/.local/share/nvm/v20.5.1/bin
