#!/usr/bin/env /bin/bash

# install brew

export PATH=/home/linuxbrew/.linuxbrew/bin:/opt/homebrew/bin:/usr/local/bin:$PATH

if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo 'Brew is already installed Skipping...'
fi

# install fish shell
if ! [ -x "$(command -v fish)" ]; then
	echo 'Error: fish is not installed. Installing fish' >&2
	brew install fish
	exit 1
else
	echo 'Fish: fish is already installed.' >&2
fi


# handover to fish shell
fish ./set_it_up/install.fish
