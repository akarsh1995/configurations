#!/usr/bin/env python3.8

# first and foremost install brew

import os
from pathlib import Path
from shutil import copyfile

os.chdir(__file__)

HOME = Path().home()
CONFIG = HOME.joinpath('.config')

def create_dir(tgt_path):
    if not tgt_path.parent.exists():
        tgt_path.parent.mkdir(parents=True, exist_ok=True)
        print(
            'creating directories to the path', tgt_path.parent
        )

def symlink_to_home(src: Path, *relative_to_home):
    if not relative_to_home:
        relative_to_home = (src.name,)
    tgt_path = HOME.joinpath(*relative_to_home)

    if tgt_path.exists():
        print(tgt_path, 'already exists. Skipping...')
    else:
        create_dir(tgt_path)
        tgt_path.symlink_to(src.absolute())
        print(tgt_path, 'symlinked to', src.absolute())

def symlink_to_dot_config(src: Path, *relative_to_dot_conf):
    symlink_to_home(src, '.config', *relative_to_dot_conf)

def hard_link_to_dot_config(src: Path, *relative_to_dot_conf):
    tgt_path = CONFIG.joinpath(*relative_to_dot_conf)
    if tgt_path.exists():
        print(tgt_path, 'already exists. Skipping...')
    else:
        create_dir(tgt_path)
        src.absolute().link_to(tgt_path)
        print(tgt_path, 'hardlinked to', src.absolute())


def brew_install():
    # install brew and relevant packages
    brew_packages_script = Path('installations', 'brew_install.sh')
    os.system(f"sh {brew_packages_script}")

def sym_link_dot_files():
    for file in Path('dotfiles').glob("*"):
        if file.name == '.config':
            continue
        symlink_to_home(file)

def doom_setup():
    # create symlink
    symlink_to_home(Path('.doom.d'))

    # install
    os.system(f"git clone --depth 1 https://github.com/hlissner/doom-emacs {HOME}/.emacs.d")
    os.system(f"{HOME.joinpath('.emacs.d', 'bin', 'doom')} install")

def keybindings():
    karabiner_relative_path = ('karabiner', 'karabiner.json')
    hard_link_to_dot_config(
        Path(*karabiner_relative_path),
        *karabiner_relative_path
    )

def mac_settings():
    mac_settings_script = ('mac_settings', '.macos')
    os.system(f'sh {Path(*mac_settings_script)}')

def cloud_setup():
    symlink_to_dot_config(Path('dotfiles', '.config', 'rclone', 'rclone.conf'), 'rclone', 'rclone.conf')
    home_mega = HOME.joinpath("cloud_drives", "mega")
    create_dir(Path(f'{HOME.joinpath(home_mega, "data")}'))
    os.system(f'rclone sync mega:/ {home_mega}')

def font_setup():
    font_dir = HOME.joinpath('Library', 'Fonts')
    for font in HOME.joinpath('cloud_drives', 'mega', 'Fonts').glob("*.*tf"):
        tgt_path = font_dir.joinpath(font.name)
        if not tgt_path.exists():
            copyfile(font, tgt_path)
            print(f'{font.name} font copied.')
        else:
            print(f'{font.name} already exists. Skipping...')

def main():
    brew_install()

    sym_link_dot_files()

    doom_setup()

    keybindings()

    mac_settings()

    font_setup()

if __name__ == '__main__':
    font_setup()
