#!/bin/env fish

# locations 
set intercept_dir_loc /etc/interception
set mapping_loc $intercept_dir_loc/dual-function-keys/caps2escape.yaml
set daemon_config_loc $intercept_dir_loc/udevmon.d/my-keyboards.yaml
set file_name_symbols alt_gr_mapped_to_caps_lock
set xkb_symbols_loc $HOME/.xkb/symbols/$file_name_symbols
set sway_config_loc $HOME/.config/sway/config

# functions
set config_mappings "\
TIMING:
  TAP_MILLISEC: 200
  DOUBLE_TAP_MILLISEC: 150


MAPPINGS:
  - KEY: KEY_CAPSLOCK
    TAP: KEY_ESC
    HOLD: KEY_CAPSLOCK
"

function get_config_udevmon
  set selected_keyboard_name $argv[1]
  echo "\
- JOB: \"intercept -g \$DEVNODE | dual-function-keys -c $mapping_loc | uinput -d \$DEVNODE\"
  DEVICE:
    NAME: $selected_keyboard_name
    EVENTS:
      EV_KEY: [ KEY_CAPSLOCK ]
"
end

set config_xkb "\
xkb_symbols \"basic\" {
    include \"us\"
    # replace Caps with AltGr
    key <CAPS> { [ ISO_Level3_Shift            ] };
    # Add vim cursor keys to be accessed with AltGr
    key <AC06> { [ h, H , Left, Left           ] };
    key <AC07> { [ j, J, Down, Down            ] };
    key <AC08> { [ k, K, Up, Up                ] };
    key <AC09> { [ l, L, Right, Right          ] };
 };
"

set hook_string "xkb_layout \"$file_name_symbols\""

set config_sway "\
input \"type:keyboard\" {
    $hook_string
}
"

if not test (command -v dual-function-keys)
  sudo pacman -Sy --noconfirm interception-dual-function-keys
end

set selected_keyboard_name ""

function set_key_board_from_user
  for keyboard in (/bin/ls /dev/input/by-id/)
      if sudo uinput -p -d /dev/input/by-id/$keyboard &> /dev/null
          set device_names $device_names (sudo uinput -p -d /dev/input/by-id/$keyboard | grep NAME: | cut -d ':' -f 2 | cut -c 2-)
      end
  end

  set i 0
  for device in $device_names
    set i (math $i+1)
    echo $i: $device
  end

  echo "Select a keyboard from the above list and enter the number"

  set name $device_names[(read)]

  echo "Your selected device name is: $name"
  set selected_keyboard_name $name
end


function create_target_dirs
    sudo mkdir -p (dirname $daemon_config_loc)
    sudo mkdir -p (dirname $mapping_loc)
    mkdir -p (dirname $xkb_symbols_loc)
    mkdir -p (dirname $sway_config_loc)
end

function create_config_files
    echo Intercepting ON_TAP\(escape\) and ON_HOLD\(capslock\) key mapping file in the location $mapping_loc
    echo $config_mappings | sudo tee $mapping_loc

    echo Registering the created mapping file for the keyboard $selected_keyboard_name in $daemon_config_loc
    get_config_udevmon $selected_keyboard_name | sudo tee -a $daemon_config_loc

    echo Creating xkb config @ $xkb_symbols_loc 
    echo CAPSLOCK act as ALT_GR and upon holding ALTGR + hjkl act as arrow key
    echo $config_xkb | tee $xkb_symbols_loc

    echo Checking xkb entry in sway configuration
    if test (cat $sway_config_loc | string match -e $hook_string | wc -l) -eq 0
      echo Not present creating one
      echo $config_sway | tee -a $sway_config_loc
    else
      echo Already present skip adding xkb entry in sway config
    end
end

function restart_udevmon
    sudo systemctl enable udevmon
    sudo systemctl restart udevmon
end

# if config @ /etc/interception/dual-function-keys/caps2escape.yaml doesn't exist
# or config @ /etc/interception/udevmon.d/my-keyboards.yaml't exist
if not test -e $mapping_loc || not test -e $daemon_config_loc 
  set_key_board_from_user
  # check if the keyboard name is set properly
  if test (echo $selected_keyboard_name | wc -c) -gt 1
    create_target_dirs
    create_config_files
    restart_udevmon
    echo Reloading sway...
    sway reload
  else
    echo Couldn\'t retrieve the keyboard name
  end
else
  echo Looks like the configuration is already set @ $mapping_loc
end

