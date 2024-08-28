starship init fish | source
zoxide init fish | source
set -Ux EDITOR (brew --prefix)/bin/hx
set -x config_dir $HOME/.config
# config files shortcuts
alias fish_conf "$EDITOR $config_dir/fish/config.fish"
alias alacritty_conf "$EDITOR $config_dir/alacritty/alacritty.yml"
alias http xh

# 
# set -Ux CONF_LOG_ALL_DB_QUERY false
set -Ux NODE_ENV local
set -Ux AYR_DIR /Users/akarshjain/Programming/ayr

alias set_seed_balance_million "sed -i '' -E 's/CONF_NUM_SEED_USDT_WALLET_BALANCE=[[:digit:]]+/CONF_NUM_SEED_USDT_WALLET_BALANCE=1000000/' $AYR_DIR/projects/bhishma/conf/test.conf"
alias set_seed_balance_zero "sed -i '' -E 's/CONF_NUM_SEED_USDT_WALLET_BALANCE=[[:digit:]]+/CONF_NUM_SEED_USDT_WALLET_BALANCE=0/' $AYR_DIR/projects/bhishma/conf/test.conf"


alias docker-up-infra-test-postgres-db "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-infra-test-postgres-db -d --build"
alias docker-up-infra-test-redis-c2 "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-infra-test-redis-c2 -d --build"
alias docker-up-arjun-me-test "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-arjun-me-test -d --build"
alias docker-up-arjun-se-test "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-arjun-se-test -d --build"
alias docker-up-arjun-le-test "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-arjun-le-test -d --build"
alias docker-up-arjun-test-runner "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-arjun-test-runner -d --build"
alias docker-up-bhishma-test-api-server "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-bhishma-test-api-server -d --build"
alias docker-up-bhishma-test-worker "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-bhishma-test-worker -d --build"
alias docker-up-bhishma-test-worker-opms "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-bhishma-test-worker-opms -d --build"
alias docker-up-bhishma-test-migration "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-bhishma-test-migration -d --build"
alias docker-up-test-fe "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-test-fe -d --build"
alias docker-up-wc-test-postgres "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-wc-test-postgres -d --build"
alias docker-up-wc-test-faktory "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-wc-test-faktory -d --build"
alias docker-up-wc-test-api "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-wc-test-api -d --build"
alias docker-up-wc-test-worker-all "docker compose -f $AYR_DIR/integration/docker-compose.yml up defx-wc-test-worker-all -d --build"

alias docker-down-infra-test-postgres-db "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-infra-test-postgres-db"
alias docker-down-infra-test-redis-c2 "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-infra-test-redis-c2"
alias docker-down-arjun-me-test "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-arjun-me-test"
alias docker-down-arjun-se-test "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-arjun-se-test"
alias docker-down-arjun-le-test "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-arjun-le-test"
alias docker-down-arjun-test-runner "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-arjun-test-runner"
alias docker-down-bhishma-test-api-server "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-bhishma-test-api-server"
alias docker-down-bhishma-test-worker "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-bhishma-test-worker"
alias docker-down-bhishma-test-worker-opms "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-bhishma-test-worker-opms"
alias docker-down-bhishma-test-migration "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-bhishma-test-migration"
alias docker-down-test-fe "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-test-fe"
alias docker-down-wc-test-postgres "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-wc-test-postgres"
alias docker-down-wc-test-faktory "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-wc-test-faktory"
alias docker-down-wc-test-api "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-wc-test-api"
alias docker-down-wc-test-worker-all "docker compose -f $AYR_DIR/integration/docker-compose.yml down defx-wc-test-worker-all"



# unit tests
alias u "npm run test:unit -- --watch"
alias um "npm run test:unit -- --watch --changedSince main"

# integration tests
alias i "CONF_LOG_ALL_DB_QUERY=false NODE_ENV=local npm run test:integration:local -- --watch --changedSince main"
alias ii "npm run test:integration:local"

# e2e tests
alias e "NODE_ENV=local npm run test:e2e -- --watch --changedSince main"
alias ee "npm run test:e2e:local"

# all individual services 

alias ed "docker compose -f $AYR_DIR/integration/docker-compose.yml --profile=be down --remove-orphans"
alias asd "docker compose -f $AYR_DIR/projects/arjun/docker/docker-compose.yml down --remove-orphans && docker compose -f $AYR_DIR/projects/wallet-core/docker-compose.yml down --remove-orphans && docker compose -f $AYR_DIR/docker-compose.infra.yml down --remove-orphans"
alias asdv "docker compose -f $AYR_DIR/projects/arjun/docker/docker-compose.yml down -v --remove-orphans && docker compose -f $AYR_DIR/projects/wallet-core/docker-compose.yml down -v --remove-orphans && docker compose -f $AYR_DIR/docker-compose.infra.yml down -v --remove-orphans"
alias teld "docker compose -f $AYR_DIR/telemetry/docker-compose.telemetry.yml down -v"

alias asu "ed && asd && docker compose -f $AYR_DIR/docker-compose.infra.yml up -d --build && docker compose -f $AYR_DIR/projects/wallet-core/docker-compose.yml up -d --build && docker compose -f $AYR_DIR/projects/arjun/docker/docker-compose.yml up -d --build"
alias asuv "ed && asdv && docker compose -f $AYR_DIR/docker-compose.infra.yml up -d --build && npm run orm:mg:local && docker compose -f $AYR_DIR/projects/wallet-core/docker-compose.yml up -d --build && docker compose -f $AYR_DIR/projects/arjun/docker/docker-compose.yml up -d --build"
alias eu "docker compose -f $AYR_DIR/integration/docker-compose.yml --profile=be up -d --build"
alias euf "ed && asd && docker compose -f $AYR_DIR/integration/docker-compose.yml --profile=full up -d --build"
alias telu "teld && docker compose -f $AYR_DIR/telemetry/docker-compose.telemetry.yml up -d --build"

alias demo "ed && asd && set_seed_balance_million && docker compose -f $AYR_DIR/integration/docker-compose.yml --profile=full down -v --remove-orphans && docker compose -f $AYR_DIR/integration/docker-compose.yml --profile=full up --build -d"


# fzf bindings
fzf_configure_bindings --directory=\cf

# git aliases
alias gc "git commit -m"

# ayr workspace zellij
alias ayr "zellij --layout ayr"


fish_add_path $HOME/.local/share/nvm/v20.5.1/bin

fish_add_path $HOME/temp/fish-lsp/bin

fish_add_path /opt/homebrew/opt/llvm/bin

function center_string
    set -l str $argv[1] # Get the input string
    set -l totalLength (math "$argv[2]") # Get the total length

    # Get the length of the input string
    set -l strLength (string length -r $str)

    # Calculate the number of spaces needed on each side
    set -l spacesNeeded (math "($totalLength - $strLength) / 2")

    # Create the left padding
    set -l leftPadding (string repeat " " -n $spacesNeeded)

    # Create the right padding
    set -l rightPadding (string repeat " " -n (math "$totalLength - $strLength - $spacesNeeded"))

    # Concatenate the padded string
    set centeredString $leftPadding$str$rightPadding

    # Return the centered string
    echo $centeredString
end


function snake_to_camel
    sed -E 's/_(.)/\U\1/g'
end

# To use the bundled libc++ please add the following LDFLAGS:
#   LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib -lunwind"

# llvm is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have llvm first in your PATH, run:
#   fish_add_path /opt/homebrew/opt/llvm/bin

# For compilers to find llvm you may need to set:
#   set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
#   set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

export PATH="$HOME/.fuelup/bin:$PATH"
fuelup completions --shell=fish | source
