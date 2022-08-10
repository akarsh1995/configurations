set -x os (uname)

if [ $os = Linux ]
  if not test (command -v brew)
    echo adding linuxbrew to path
    fish_add_path /home/linuxbrew/.linuxbrew/bin
  else 
    echo brew already on path
  end
end

# best way to remove a brew package
if test (brew tap-info --installed | grep beeftornado\/rmtree | wc -l) -eq 0
  brew tap beeftornado/rmtree
end


function install_lunar_vim_if_not_installed
  if not test -d $HOME/.local/share/lunarvim
    if not test (command -v nvim)
      echo "Neovim is not installed kindly install neovim first"
    else 
      echo "Lunar vim is not installed"
      echo "Installing lunar vim"
      curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh | bash
    end
  else
    echo "Looks like lunar vim is already installed"
  end
end

function install_gettext_if_not_installed
  if not test (command -v envsubst)
    echo "bin envsubst is not present installing gettext to install envsubst"
    brew install gettext
    brew link --force gettext
  else
    echo "envsubst bin already exists"
  end
end

set packages ripgrep \
    dust \
    neofetch \
    neovim \
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
    exa \
    wget \
    fzf \
    gitui

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

install_lunar_vim_if_not_installed

install_gettext_if_not_installed

if [ $os = Darwin ]
  set cask_packages alacritty \
        discord \
        appcleaner \
        tiles \
        telegram \
        karabiner-elements \
        firefox \
        mos \
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

