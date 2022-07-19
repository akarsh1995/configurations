set CRONTAB_DIR (dirname (status --current-filename ))

echo crontab dir set to $CRONTAB_DIR

# install crontab
set -x CLEANUP_SH $CRONTAB_DIR/cleanup.sh
set -x FISH_PATH (which fish)
set -x BREW_PATH (which brew)
set -x AUTOCOMMIT_FISH $CRONTAB_DIR/autocommit.fish

echo Installing crontabs

envsubst '$HOME,$FISH_PATH,$CLEANUP_SH,$BREW_PATH,$AUTOCOMMIT_FISH' <$CRONTAB_DIR/jobs | crontab
