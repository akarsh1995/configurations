#!/usr/local/bin/fish

set SCRIPT_DIR $PWD/(string replace \./ "" (dirname (status --current-filename )))
echo setting script dir to $SCRIPT_DIR

# set os var
set -x os (uname)

# .gitconfig setup
set GCFILE $SCRIPT_DIR/dotfiles/.gitconfig
set GCFILE_HOME  $HOME/.gitconfig 

function gitconfigupdate
      # gitconfig
      echo "Enter your name: "
      set -x NAME (read)

      echo "Enter your email: "
      set -x EMAIL (read)
      envsubst '$EMAIL,$NAME' <$GCFILE > $GCFILE_HOME
end

# if .gitconfig already exists
if test -e $HOME/.gitconfig 
  echo Git config already exists testing if it has any updates
  # if recent gitconfig lines not equal to current
  if test (wc -l < $GCFILE) -ne (wc -l < $GCFILE_HOME)
      echo Git config has updates updating...
      gitconfigupdate
  else
      echo Git config has no updates skipping...
  end
else
  echo No exisiting $GCFILE_HOME found creating one
  gitconfigupdate
end


# install fonts
source $SCRIPT_DIR/install_fonts.fish

# brew installs
source $SCRIPT_DIR/brew_installs.fish

# cron jobs
source $SCRIPT_DIR/crontab/crontab.fish


if [ $os = Darwin ]
    defaults write -g InitialKeyRepeat -int 15
    defaults write -g KeyRepeat -int 1
end

# .config files symlinking

for relative_path in (git ls-files --directory .config);
	set source_path $PWD/$relative_path
	set target_path $HOME/$relative_path
	set mkdir_path (dirname $target_path)
	mkdir -p $mkdir_path
	ln -s -f $source_path $target_path
end
