#!/bin/bash

sudo apt install tmux --assume-yes
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp -r ./.tmux.conf "$HOME"/.tmux.conf
wd=$(pwd)
cd "$HOME"/.tmux.plugins/tpm/scripts
chmod +x install_plugins.sh
./install_plugins.sh
cd $wd

