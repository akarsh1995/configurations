set font_download_link https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
set out_file /tmp/jb.zip
set font_dir_name jet-brains-mono

if [ $os = Darwin ]
  set fontpath /Users/$USER/Library/Fonts/$font_dir_name
else if [ $os = Linux ]
  set fontpath /usr/local/share/fonts/$font_dir_name
else
  set fontpath "."
end

function download_and_install_fonts 
  echo downloading fonts
  wget $font_download_link -O $out_file

  if [ $os = Linux ]
    sudo mkdir -p $fontpath
    sudo unzip $out_file -d $fontpath
    sudo find $fontpath -type f ! -name '*Complete.ttf' -delete 
  else if [ $os = Darwin ]
    mkdir -p $fontpath
    unzip $out_file -d $fontpath
    find $fontpath -type f ! -name '*Complete.ttf' -delete 
  end

  # delete all except complete.ttf 
  rm $out_file
  echo fonts successfully installed
end


if test (find $fontpath | grep JetBrains | wc -l) -gt 0
  echo Jetbrains fonts already installed
else
  download_and_install_fonts
end

