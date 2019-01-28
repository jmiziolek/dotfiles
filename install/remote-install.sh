#!/bin/sh

git clone https://github.com/jmiziolek/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x instal/install.sh
./install/install.sh
