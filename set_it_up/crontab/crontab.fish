set CRONTAB_DIR $PWD/(string replace \./ "" (dirname (status --current-filename )))

# install crontab
set -x CLEANUP_SH $CRONTAB_DIR/cleanup.sh
set -x FISH_PATH (which fish)
set -x BREW_PATH (which brew)
set -x AUTOCOMMIT_FISH $CRONTAB_DIR/autocommit.fish

envsubst '$HOME,$FISH_PATH,$CLEANUP_SH,$BREW_PATH,$AUTOCOMMIT_FISH' <$CRONTAB_DIR/jobs | crontab
