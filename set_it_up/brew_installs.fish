if [ $os = Linux ]
  echo adding linuxbrew to path
  fish_add_path /home/linuxbrew/.linuxbrew/bin
end

# best way to remove a brew package
brew tap beeftornado/rmtree

set packages ripgrep \
    dust \
    neofetch \
    node \
    htop \
    nnn \
    diskonaut \
    tree \
    axel \
    shellcheck \
    bat \
    zoxide \
    starship \
    exa

set installed_package_list (brew list --formula)

for package in $packages
  if not contains $package $installed_package_list
    set to_install $to_install $package
  end
end

if test (string length $to_install | wc -l) -gt 0
  echo packages that are not installed 
  echo $to_install
  echo installing all missing formulae
  brew install $to_install
else
    echo all formulae are already installed
end



if [ $os = Darwin ]
  set cask_packages alacritty \
        zoomus \
        discord \
        appcleaner \
        tiles \
        microsoft-teams \
        telegram \
        onyx \
        karabiner-elements \
        firefox \
        mos \
        iina \
        eul

  set installed_cask_package_list (brew list --casks)

  for package in $cask_packages
    if not contains $package $installed_cask_package_list
      set casks_to_install $casks_to_install $package
    end
  end

  if test (string length $casks_to_install | wc -l) -gt 0
    echo casks packages that are not installed 
    echo $casks_to_install
    echo installing all missing casks
    brew install --cask $casks_to_install 
  else
    echo all casks are already installed
  end
end

